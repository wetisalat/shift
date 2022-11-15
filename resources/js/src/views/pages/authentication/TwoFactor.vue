<template>
  <div class="auth-wrapper auth-v2">
    <b-row class="auth-inner m-0">

      <!-- Brand logo-->
      <b-link class="brand-logo">
        <vuexy-logo />

        <h2 class="brand-text text-primary ml-1">
          Vuexy
        </h2>
      </b-link>
      <!-- /Brand logo-->

      <!-- Left Text-->
      <b-col
        lg="8"
        class="d-none d-lg-flex align-items-center p-5"
      >
        <div class="w-100 d-lg-flex align-items-center justify-content-center px-5">
          <b-img
            fluid
            :src="imgUrl"
            alt="Forgot password V2"
          />
        </div>
      </b-col>
      <!-- /Left Text-->

      <!-- Forgot password-->
      <b-col
        lg="4"
        class="d-flex align-items-center auth-bg px-2 p-lg-5"
      >
        <b-col
          sm="8"
          md="6"
          lg="12"
          class="px-xl-2 mx-auto"
        >
          <b-card-text class="mb-2">
            Please confirm access to your account by entering the authentication code provided by your authenticator application.
          </b-card-text>

          <!-- form -->
          <validation-observer
            ref="twoFactorForm"
            #default="{invalid}"
          >
            <b-form
              class="auth-forgot-password-form mt-2"
              @submit.prevent="validationForm"
            >
              <b-form-group
                label="Code"
                label-for="2fa-code"
              >
                <validation-provider
                  #default="{ errors }"
                  name="Code"
                  rules="required"
                >
                  <b-form-input
                    id="2fa-code"
                    v-model="userCode"
                    :state="errors.length > 0 ? false:null"
                    name="2fa-code"
                  />
                  <small class="text-danger">{{ errors[0] }}</small>
                </validation-provider>
              </b-form-group>

              <b-button
                type="submit"
                variant="primary"
                block
                :disabled="invalid"
              >
                Proceed
              </b-button>
            </b-form>
          </validation-observer>
        </b-col>
      </b-col>
      <!-- /Forgot password-->
    </b-row>
  </div>
</template>

<script>
/* eslint-disable global-require */
import { ValidationProvider, ValidationObserver } from 'vee-validate'
import VuexyLogo from '@core/layouts/components/Logo.vue'
import { BRow, BCol, BLink, BCardText, BImg, BForm, BFormGroup, BFormInput, BButton } from 'bootstrap-vue'
import { required, email } from '@validations'
import store from '@/store/index'
import { getHomeRouteForLoggedInUser } from '@/auth/utils'

import ToastificationContent from '@core/components/toastification/ToastificationContent.vue'

export default {
  components: {
    VuexyLogo,
    BRow,
    BCol,
    BLink,
    BImg,
    BForm,
    BButton,
    BFormGroup,
    BFormInput,
    BCardText,
    ValidationProvider,
    ValidationObserver,
  },
  data() {
    return {
      userCode: '',
      sideImg: require('@/assets/images/pages/forgot-password-v2.svg'),
      // validation
      required,
    }
  },
  computed: {
    imgUrl() {
      if (store.state.appConfig.layout.skin === 'dark') {
        // eslint-disable-next-line vue/no-side-effects-in-computed-properties
        this.sideImg = require('@/assets/images/pages/forgot-password-v2-dark.svg')
        return this.sideImg
      }
      return this.sideImg
    },
  },
  methods: {
    validationForm() {
      this.$refs.twoFactorForm.validate().then(success => {
        if (success) {
          this.$http.post('/api/auth/2fa', {
            code: this.userCode,
          }).then(response => {
            const userData = JSON.parse(localStorage.getItem('userData'))

            // ? This is just for demo purpose. Don't think CASL is role based in this case, we used role in if condition just for ease
            this.$router.replace(getHomeRouteForLoggedInUser(userData.role)).then(() => {
              this.$toast({
                component: ToastificationContent,
                position: 'top-right',
                props: {
                  title: `Welcome ${userData.name}`,
                  icon: 'CoffeeIcon',
                  variant: 'success',
                  text: `You have successfully logged in as ${userData.role}. Now you can start to explore!`,
                },
              })
            })
          }).catch(error => {
            this.$refs.twoFactorForm.setErrors(error.response.data.message)
          })
        }
      })
    },
  },
}
</script>

<style lang="scss">
@import '~@resources/scss/vue/pages/page-auth.scss';
</style>
