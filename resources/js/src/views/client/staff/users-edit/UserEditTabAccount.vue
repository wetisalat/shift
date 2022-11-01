<template>
  <div>

    <!-- Header: Personal Info -->
    <div class="d-flex">
      <feather-icon
        icon="UserIcon"
        size="19"
      />
      <h4 class="mb-0 ml-50">
        Employee Details
      </h4>
    </div>

    <!-- form -->
    <validation-observer ref="simpleRules">
      <b-form  class="mt-1">
        <b-row>

          <!-- Field: Gender -->
          <b-col
            cols="12"
            md="6"
            lg="4"
          >
            <b-form-group
              label="Gender"
              label-for="gender"
              label-class="mb-1"
            >
              <b-form-radio-group
                id="gender"
                options="genderOptions"
                value="male"
              />
            </b-form-group>
          </b-col>

          
          <b-col
            cols="12"
            md="6"
            lg="4"
          >
            <b-form-group
              label="Box 2"
              label-for="basicInput"
            >
              <validation-provider
                #default="{ errors }"
                name="Last Name"
                rules="required"
              >
                <b-form-input
                  v-model="name"
                  :state="errors.length > 0 ? false:null"
                  placeholder="Your Name"
                />
                <small class="text-danger">{{ errors[0] }}</small>
              </validation-provider>
            </b-form-group>
          </b-col>


          <b-col
            cols="12"
            md="6"
            lg="4"
          >
            <b-form-group
              label="Box 3"
              label-for="basicInput"
            >
              <validation-provider
                #default="{ errors }"
                name="Full Name"
                rules="required"
              >
                <b-form-input
                  v-model="name"
                  :state="errors.length > 0 ? false:null"
                  placeholder="Your Name"
                />
                <small class="text-danger">{{ errors[0] }}</small>
              </validation-provider>
            </b-form-group>
          </b-col>


          <b-col
            cols="12"
            md="6"
            lg="4"
          >
            <b-form-group
              label="Box 4"
              label-for="basicInput"
            >
              <validation-provider
                #default="{ errors }"
                name="Email"
                rules="required|email"
              >
                <b-form-input
                  v-model="emailValue"
                  :state="errors.length > 0 ? false:null"
                  type="email"
                  placeholder="Your Email"
                />
                <small class="text-danger">{{ errors[0] }}</small>
              </validation-provider>
            </b-form-group>
          </b-col>


          <b-col
            cols="12"
            md="6"
            lg="4"
          >
            <b-form-group
              label="Box 5"
              label-for="basicInput"
            >
              <validation-provider
                #default="{ errors }"
                name="Password"
                vid="Password"
                rules="required|password"
              >
                <b-form-input
                  v-model="PasswordValue"
                  type="password"
                  :state="errors.length > 0 ? false:null"
                  placeholder="Your Password"
                />
                <small class="text-danger">{{ errors[0] }}</small>
              </validation-provider>
            </b-form-group>
          </b-col>


          <b-col
            cols="12"
            md="6"
            lg="4"
          >
            <b-form-group
              label="Box 6"
              label-for="basicInput"
            >
              <validation-provider
                #default="{ errors }"
                name="Password Confirm"
                rules="required|confirmed:Password"
              >
                <b-form-input
                  v-model="passwordCon"
                  :state="errors.length > 0 ? false:null"
                  type="password"
                  placeholder="Confirm Password"
                />
                <small class="text-danger">{{ errors[0] }}</small>
              </validation-provider>
            </b-form-group>
          </b-col>

          <!-- submit button -->
          <b-col>
            <b-button
              variant="primary"
              type="submit"
              @click.prevent="validationForm"
            >
              Submit
            </b-button>
          </b-col>
        </b-row>
      </b-form>
    </validation-observer>

  </div>
</template>

<script>
import { ValidationProvider, ValidationObserver } from 'vee-validate'
import {
  BFormInput, 
  BFormGroup,
  BFormRadioGroup,
  BForm, 
  BRow, 
  BCol, 
  BButton,

} from 'bootstrap-vue'
import {
  required, email, confirmed, password,
} from '@validations'

export default {
  components: {
    ValidationProvider,
    ValidationObserver,
    BFormInput,
    BFormGroup,
    BForm,
    BRow,
    BCol,
    BButton,
    BFormRadioGroup,
  },
  data() {
    const genderOptions = [
      { text: 'Male', value: 'male' },
      { text: 'Female', value: 'female' },
    ]
    return {
      emailValue: '',
      name: '',
      PasswordValue: '',
      passwordCon: '',
      required,
      password,
      email,
      confirmed,
      genderOptions,
    }
  },
  methods: {
    validationForm() {
      this.$refs.simpleRules.validate().then(success => {
        if (success) {
          // eslint-disable-next-line
          alert('form submitted!')
        }
      })
    },
  },
}
</script>
