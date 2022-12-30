<template>
    <form-wizard
      color="#7367F0"
      :title="null"
      :subtitle="null"
      shape="square"
      finish-button-text="Submit"
      back-button-text="Previous"
      class="mb-3"
      @on-complete="formSubmitted"
    >

      <!-- location details tab -->
      <tab-content
        title="Location Details"
        :before-change="validationForm"
      >
        <validation-observer
          ref="accountRules"
          tag="form"
        >
          <b-row>
            <b-col
              cols="12"
              class="mb-2"
            >
            </b-col>
            <b-col md="6">
              <b-form-group
                label="Company Name"
                label-for="companyname"
              >
                <validation-provider
                  #default="{ errors }"
                  name="companyname"
                  rules="required"
                >
                  <b-form-input
                    id="companyname"
                    v-model="companyname"
                    :state="errors.length > 0 ? false:null"
                  />
                  <small class="text-danger">{{ errors[0] }}</small>
                </validation-provider>
              </b-form-group>
            </b-col>

            <b-col md="6">
              <b-form-group
                label="Immatriculation"
                label-for="immatriculation"
              >
                <validation-provider
                  #default="{ errors }"
                  name="immatriculation"
                  rules="required"
                >
                  <b-form-input
                    id="immatriculation"
                    v-model="immatriculation"
                    :state="errors.length > 0 ? false:null"
                  />
                  <small class="text-danger">{{ errors[0] }}</small>
                </validation-provider>
              </b-form-group>
            </b-col>

            <b-col md="12">
              <b-form-group
                label="Occupational Medicine"
                label-for="occupationalmedicine"
              >
                <auto-suggest-medicine />
              </b-form-group>
            </b-col>

          </b-row>
        </validation-observer>
      </tab-content>

      <!-- Location details tab -->
      <tab-content
        title="Location Info"
        :before-change="validationFormInfo"
      >
        <validation-observer
          ref="infoRules"
          tag="form"
        >
          <b-row>
            <b-col
              cols="12"
              class="mb-2"
            >
            </b-col>

            <b-col md="6">
              <b-form-group
                label="Address 1"
                label-for="address1"
              >
                <validation-provider
                  #default="{ errors }"
                  name="address1"
                  rules="required"
                >
                  <b-form-input
                    id="address1"
                    v-model="address1"
                    :state="errors.length > 0 ? false:null"
                  />
                  <small class="text-danger">{{ errors[0] }}</small>
                </validation-provider>
              </b-form-group>
            </b-col>

            <b-col md="6">
              <b-form-group
                label="Address 2"
                label-for="address2"
              >
                  <b-form-input
                    id="address2"
                    v-model="address2"
                  />
                </validation-provider>
              </b-form-group>
            </b-col>

            <b-col md="4">
              <b-form-group
                label="Postcode"
                label-for="postcode"
              >
                <validation-provider
                  #default="{ errors }"
                  name="postcode"
                  rules="required"
                >
                  <b-form-input
                    id="postcode"
                    v-model="postcode"
                    :state="errors.length > 0 ? false:null"
                    type="number"
                  />
                  <small class="text-danger">{{ errors[0] }}</small>
                </validation-provider>
              </b-form-group>
            </b-col>

            <b-col md="4">
              <b-form-group
                label="City"
                label-for="city"
              >
                <validation-provider
                  #default="{ errors }"
                  name="city"
                  rules="required"
                >
                  <b-form-input
                    id="city"
                    v-model="city"
                    :state="errors.length > 0 ? false:null"
                  />
                  <small class="text-danger">{{ errors[0] }}</small>
                </validation-provider>
              </b-form-group>
            </b-col>

            <b-col md="4">
              <b-form-group
                label="Country"
                label-for="country"
              >
                <auto-suggest-countries />
              </b-form-group>
            </b-col>

          </b-row>
        </validation-observer>
      </tab-content>

      <!-- convention collective  -->
      <tab-content
        title="Convention collective"
        :before-change="validationFormAddress"
      >
        <validation-observer
          ref="addressRules"
          tag="form"
        >
          <b-row>
            <b-col
              cols="12"
              class="mb-2"
            >
            </b-col>
            <b-col md="12">
              <validation-provider
                #default="{ errors }"
                name="Votre convention collective :"
                rules="required"
              >
                <b-form-group
                  label="Votre convention collective :"
                  label-for="convention"
                  :state="errors.length > 0 ? false:null"
                >
                  <v-select
                    id="convention"
                    v-model="selectedconvention"
                    :options="conventionName"
                    :selectable="option => ! option.value.includes('select_value')"
                    label="text"
                  />
                  <b-form-invalid-feedback :state="errors.length > 0 ? false:null">
                    {{ errors[0] }}
                  </b-form-invalid-feedback>
                </b-form-group>
              </validation-provider>
            </b-col>

            <b-col md="12">
              <validation-provider
                #default="{ errors }"
                name="Code APE"
                rules="required"
              >
                <b-form-group
                  label="Code APE"
                  label-for="codeAPE"
                  :state="errors.length > 0 ? false:null"
                >
                  <v-select
                    id="codeAPE"
                    v-model="selectedcodeAPE"
                    :options="codeAPE"
                    :selectable="option => ! option.value.includes('nothing_selected')"
                    label="text"
                  />
                  <b-form-invalid-feedback :state="errors.length > 0 ? false:null">
                    {{ errors[0] }}
                  </b-form-invalid-feedback>
                </b-form-group>
              </validation-provider>
            </b-col>

          </b-row>
        </validation-observer>
      </tab-content>
    </form-wizard>

</template>

<script>
import { FormWizard, TabContent } from 'vue-form-wizard'
import vSelect from 'vue-select'
import { ValidationProvider, ValidationObserver } from 'vee-validate'
import ToastificationContent from '@core/components/toastification/ToastificationContent.vue'
import 'vue-form-wizard/dist/vue-form-wizard.min.css'
import AutoSuggestMedicine from './AutoSuggestMedicine.vue'
import AutoSuggestCountries from './AutoSuggestCountries.vue'

import {
  BRow,
  BCol,
  BFormGroup,
  BFormInput,
  BFormInvalidFeedback,
} from 'bootstrap-vue'
import { required, email } from '@validations'

export default {
  components: {
    ValidationProvider,
    ValidationObserver,
    FormWizard,
    TabContent,
    BRow,
    BCol,
    BFormGroup,
    BFormInput,
    vSelect,
    BFormInvalidFeedback,
    // eslint-disable-next-line vue/no-unused-components
    ToastificationContent,
    AutoSuggestMedicine,
    AutoSuggestCountries,

  },
  data() {
    return {
      companyname: '',
      immatriculation: '',
      occupationalmedicine: '',
      address1: '',
      address2: '',
      postcode: '',
      city: '',
      conventionName: null,
      ape: null,

      required,
      conventionName: [
        { value: 'select_value', text: 'Select Value' },
        { value: 'convention', text: 'Convention 1' },
        { value: 'convention', text: 'Convention 2' },
        { value: 'convention', text: 'Convention 3' },
      ],
      codeAPE: [
        { value: 'nothing_selected', text: 'Nothing Selected' },
        { value: 'APE 1', text: 'APE 1' },
        { value: 'APE 2', text: 'APE 2' },
        { value: 'APE 3', text: 'APE 3' },
      ],
    }
  },
  methods: {
    formSubmitted() {
      this.$toast({
        component: ToastificationContent,
        props: {
          title: 'Form Submitted',
          icon: 'EditIcon',
          variant: 'success',
        },
      })
    },
    validationForm() {
      return new Promise((resolve, reject) => {
        this.$refs.accountRules.validate().then(success => {
          if (success) {
            resolve(true)
          } else {
            reject()
          }
        })
      })
    },
    validationFormInfo() {
      return new Promise((resolve, reject) => {
        this.$refs.infoRules.validate().then(success => {
          if (success) {
            resolve(true)
          } else {
            reject()
          }
        })
      })
    },
    validationFormAddress() {
      return new Promise((resolve, reject) => {
        this.$refs.addressRules.validate().then(success => {
          if (success) {
            resolve(true)
          } else {
            reject()
          }
        })
      })
    },
  },
}
</script>

<style lang="scss">
@import '~@resources/scss/vue/libs/vue-autosuggest.scss';
</style>