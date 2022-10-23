<template>
  <div class="auth-wrapper auth-v1 px-2">
    <div class="auth-inner py-2">

      <!-- Forgot Password v1 -->
      <b-card class="mb-0 text-center">
        <b-link class="brand-logo">
          <!-- logo -->
          <vuexy-logo />

          <h2 class="brand-text text-primary ml-1">
            Vuexy
          </h2>
        </b-link>

        <b-card-title class="mb-1">
          {{ title }}
        </b-card-title>
        <b-card-text class="mb-2">
          {{ description }}
        </b-card-text>

        <b-card-text class="text-center mt-2">
          <b-link :to="{name:'auth-login-v1'}">
            <feather-icon icon="ChevronLeftIcon" /> Go to login
          </b-link>
        </b-card-text>

      </b-card>
    <!-- /Forgot Password v1 -->
    </div>
  </div>
</template>

<script>
import VuexyLogo from '@core/layouts/components/Logo.vue'
import {
  BCard, BLink, BCardText, BCardTitle,
} from 'bootstrap-vue'
import { required, email } from '@validations'

export default {
  components: {
    VuexyLogo,
    BCard,
    BLink,
    BCardText,
    BCardTitle,
  },
  data() {
    return {
      title: '',
      description: '',

      // validation
      required,
      email,
    }
  },
  mounted() {
    const {
      id, hash, signature, expires,
    } = this.$route.query

    this.$http.get(`/api/auth/email/verify/${id}/${hash}?signature=${signature}&expires=${expires}`)
      .then(response => {
        this.title = 'Thanks for confirming!'
        this.description = response.data.message
      }).catch(error => {
        this.title = 'Uh ooh'
        this.description = error.response.data.message
      })
  },
}
</script>

<style lang="scss">
@import '~@resources/scss/vue/pages/page-auth.scss';
</style>
