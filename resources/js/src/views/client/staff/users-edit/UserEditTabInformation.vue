<template>
  <div>

    <!-- Header: Personal Info -->
    <div class="d-flex">
      <feather-icon
        icon="UserIcon"
        size="19"
      />
      <h4 class="mb-0 ml-50">
        Personal Information
      </h4>
    </div>

    <!-- Form: Personal Info Form -->
    <b-form class="mt-1">
      <b-row>

        <b-container fluid>
          <b-row>

            <!-- Field: Birth Date -->
            <b-col>
              <b-form-group
                label="Birth Date"
                label-for="birth-date">
                <flat-pickr
                  v-model="userDataInfo.dob"
                  class="form-control"
                  :config="{ dateFormat: 'd-m-Y'}"
                  placeholder="DD-MM-YYYY"/>
              </b-form-group>
            </b-col>

            <!-- Field: Place of Birth -->
            <b-col>
              <b-form-group
                label="Place of birth"
                label-for="placebirth">              
                <b-form-input
                  id="placebirth"
                  v-model="userDataInfo.placebirth"/>
              </b-form-group>
            </b-col>

            <!-- Field: Nationality -->
            <b-col>
              <b-form-group
                label="Nationality"
                label-for="nationality">
                <auto-suggest-countries />
              </b-form-group>
            </b-col>

            <!-- Field: National Insurance Number -->        
            <b-col >
              <b-form-group
                label="National Insurance Number"
                label-for="nin">
                <b-form-input
                  id="nin"
                  v-model="userDataInfo.nin"/>
                </b-form-group>
            </b-col>
              
          </b-row>
        </b-container>

        <!-- Field: Identification Number -->
        <b-col
          cols="12"
          md="6"
          lg="4">
          <b-form-group
            label="Identification Number"
            label-for="idnumber">
            <b-form-input
              id="idnumber"
              v-model="userDataInfo.idnumber"/>
          </b-form-group>
        </b-col>  

        <!-- Field: Document Type -->
        <b-col
          cols="12"
          md="6"
          lg="4">
          <b-form-group
            label="Document type"
            label-for="documenttype"
            label-class="mb-1">
            <b-form-radio-group
              id="documenttype"
              v-model="userDataInfo.documenttype"
              :options="documenttypeOptions"
              value="National Card"/>
          </b-form-group>
        </b-col>

        <!-- Field: Expiry Date -->
        <b-col>
          <b-form-group
            label="Expiry Date"
            label-for="expirydate">
            <flat-pickr
              v-model="userDataInfo.expirydate"
              class="form-control"
              :config="{ dateFormat: 'd-m-Y'}"
              placeholder="DD-MM-YYYY"/>
          </b-form-group>
        </b-col>
      </b-row>

        <!-- Header: Personal Info -->
        <div class="d-flex mt-2">
          <feather-icon
            icon="MapPinIcon"
            size="19"/>
          <h4 class="mb-0 ml-50">
            Address
          </h4>
        </div>

        <!-- Form: Personal Info Form -->
        <b-row class="mt-1">

          <!-- Field: Address Line 1 -->
          <b-col
            cols="12"
            md="6"
            lg="4">
            <b-form-group
              label="Address Line 1"
              label-for="address-line-1">
              <b-form-input
                id="address-line-1"
                v-model="userDataInfo.addressLine1"/>
            </b-form-group>
          </b-col>

          <!-- Field: Address Line 2 -->
          <b-col
            cols="12"
            md="6"
            lg="4">
            <b-form-group
              label="Address Line 2"
              label-for="address-line-2">
              <b-form-input
                id="address-line-2"
                v-model="userDataInfo.addressLine2"
                placeholder="Los Santos"/>
            </b-form-group>
          </b-col>

          <!-- Field: Postcode -->
          <b-col
            cols="12"
            md="6"
            lg="4">
            <b-form-group
              label="Postcode"
              label-for="postcode">
              <b-form-input
                id="postcode"
                v-model="userDataInfo.postcode"
                type="number"
                placeholder="597626"/>
            </b-form-group>
          </b-col>

          <!-- Field: City -->
          <b-col
            cols="12"
            md="6"
            lg="4">
            <b-form-group
              label="City"
              label-for="city">
              <b-form-input
                id="city"
                v-model="userDataInfo.city"/>
            </b-form-group>
          </b-col>

          <!-- Field: State -->
          <b-col
            cols="12"
            md="6"
            lg="4">
            <b-form-group
              label="State"
              label-for="state">
              <b-form-input
                id="state"
                v-model="userDataInfo.state"
                placeholder="Manhattan"/>
            </b-form-group>
          </b-col>

          <!-- Field: Country -->
          <b-col
            cols="12"
            md="6"
            lg="4">
            <b-form-group
              label="Country"
              label-for="country">
              <auto-suggest-countries />
            </b-form-group>
          </b-col>
        </b-row>


        <!-- Header: Emergency Contact -->
        <div class="d-flex mt-2">
          <feather-icon
            icon="AlertTriangleIcon"
            size="19"/>
          <h4 class="mb-0 ml-50">
            Emergency Contact
          </h4>
        </div>

        <!-- Form: Emergency Contact Form -->
        <b-row class="mt-1">

          <!-- Field: Full Name Emergency 1 -->
          <b-col
            cols="12"
            md="6"
            lg="4">
            <b-form-group
              label="Full Name 1"
              label-for="full-name-1">
              <b-form-input
                id="full-name-1"
                v-model="userDataInfo.fullName1"/>
            </b-form-group>
          </b-col>

          <!-- Field: Phone Number 1 -->
          <b-col
            cols="12"
            md="6"
            lg="4">
            <b-form-group
              label="Phone Number 1"
              label-for="emergency-phone1">
              <cleave
                id="emergency-phone1"
                v-model="form.block"
                class="form-control"
                :raw="false"
                :options="options.emergencyphone"
                placeholder="+33 6 12 34 56 78"
              />
            </b-form-group>
          </b-col>

        <!-- Field: Relationship 1 -->
        <b-col
          cols="12"
          md="6"
          lg="4">
          <b-form-group
            label="Relationship 1"
            label-for="emergency-relationship1"
            label-class="mb-1">
            <b-form-radio-group
              id="emergency-relationship1"
              v-model="userDataInfo.relationship"
              :options="relationshipOptions"
              value="Parent"/>
          </b-form-group>
        </b-col>

          <!-- Field: Full Name Emergency 2 -->
          <b-col
            cols="12"
            md="6"
            lg="4">
            <b-form-group
              label="Full Name 2"
              label-for="full-name-2">
              <b-form-input
                id="full-name-2"
                v-model="userDataInfo.fullName2"/>
            </b-form-group>
          </b-col>  

          <!-- Field: Phone Number 2 -->
          <b-col
            cols="12"
            md="6"
            lg="4">
            <b-form-group
              label="Phone Number 2"
              label-for="emergency-phone2">
              <cleave
                id="emergency-phone2"
                v-model="form.block"
                class="form-control"
                :raw="false"
                :options="options.emergencyphone"
                placeholder="+33 6 12 34 56 78"
              />
            </b-form-group>
          </b-col>

        <!-- Field: Relationship 2 -->
        <b-col
          cols="12"
          md="6"
          lg="4">
          <b-form-group
            label="Relationship 2"
            label-for="emergency-relationship2"
            label-class="mb-1">
            <b-form-radio-group
              id="emergency-relationship2"
              v-model="userDataInfo.relationship2"
              :options="relationship2Options"
              value="Children"/>
          </b-form-group>
        </b-col>
        </b-row>

        <b-row class="mt-2">
          <b-col>
            <b-button
              variant="primary"
              class="mb-1 mb-sm-0 mr-0 mr-sm-1"
              :block="$store.getters['app/currentBreakPoint'] === 'xs'">
              Save Changes
            </b-button>
            <b-button
              variant="outline-secondary"
              :block="$store.getters['app/currentBreakPoint'] === 'xs'">
              Reset
            </b-button>
          </b-col>
      </b-row>
    </b-form>
  </div>
</template>

<script>
import { BContainer, BRow, BCol, BForm, BFormGroup, BFormInput, BFormRadioGroup, BFormCheckboxGroup, BButton } from 'bootstrap-vue'
import flatPickr from 'vue-flatpickr-component'
import { ref } from '@vue/composition-api'
import vSelect from 'vue-select'
import Cleave from 'vue-cleave-component'
// eslint-disable-next-line import/no-extraneous-dependencies
import 'cleave.js/dist/addons/cleave-phone.fr'
import AutoSuggestCountries from './AutoSuggestCountries.vue'

export default {
  components: {
    BContainer,
    BRow,
    BCol,
    BForm,
    BFormGroup,
    flatPickr,
    BFormInput,
    vSelect,
    BFormRadioGroup,
    BFormCheckboxGroup,
    BButton,
    Cleave,
    AutoSuggestCountries,
  },
  setup() {
    const userDataInfo = ref({
      dob: null,
      placebirth: 'Paris',
      nin: '1842506698012',
      nationality: 'France',
      idnumber: '125RG5645RE0',
      documenttype: 'National Card',
      expirydate: null,
      contactOptions: ['Email', 'Message'],
      addressLine1: 'A-65, Belvedere Streets',
      addressLine2: '',
      postcode: '',
      city: 'New York',
      state: '',
      country: '',
      fullName1: null,
      fullName2: null,
      relationship: null,
      relationship2: null,
    })

    const nationalityOptions = ['USA', 'UK', 'France', 'Russian', 'German', 'Indian', 'Kenyan']

    const documenttypeOptions = [
      { text: 'National Card', value: 'nationalcard' },
      { text: 'Passport', value: 'passport' },
      { text: 'Sejour Card', value: 'sejourcard' },
      { text: 'Other', value: 'other' },
    ]

    const relationshipOptions = [
      { text: 'Parent', value: 'parent' },
      { text: 'Children', value: 'children' },
      { text: 'Friend', value: 'friend' },
      { text: 'Other', value: 'other' },
    ]

    const relationship2Options = [
      { text: 'Parent', value: 'parent' },
      { text: 'Children', value: 'children' },
      { text: 'Friend', value: 'friend' },
      { text: 'Other', value: 'other' },
    ]

    return {
      userDataInfo,
      nationalityOptions,
      documenttypeOptions,
      relationshipOptions,
      relationship2Options,
      form: {
      },
      options: {
        emergencyphone: {
          prefix: '+33',
          phone: true,
          blocks: [2, 2, 2, 2, 2],
        },
      },
    }
  },
}
</script>

<style lang="scss">
@import '~@resources/scss/vue/libs/vue-flatpicker.scss';
@import '~@resources/scss/vue/libs/vue-select.scss';
@import '~@resources/scss/vue/libs/vue-autosuggest.scss';
</style>
