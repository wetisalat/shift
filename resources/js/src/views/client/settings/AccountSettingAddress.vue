<template>
  <b-card>
    <!-- form -->
    <b-form>
      <b-row>

        <!-- address1 -->
        <b-col md="6">
          <b-form-group
            label-for="address1"
            label="Address 1"
          >
            <b-form-input
              id="address1"
            />
          </b-form-group>
        </b-col>
        <!--/ address1 -->


        <!-- address2 -->
        <b-col md="6">
          <b-form-group
            label-for="address2"
            label="Address 2"
          >
            <b-form-input
              id="address2"
            />
          </b-form-group>
        </b-col>
        <!--/ address2 -->


        <!-- postcode -->
        <b-col md="4">
          <b-form-group
            label-for="postcode"
            label="Postcode"
          >
            <b-form-input
              id="postcode"
            />
          </b-form-group>
        </b-col>
        <!--/ postcode -->

        <!-- city -->
        <b-col md="4">
          <b-form-group
            label-for="city"
            label="city"
          >
            <b-form-input
              id="city"
            />
          </b-form-group>
        </b-col>
        <!--/ city -->

        <!-- Country -->
        <b-col md="4">
          <b-form-group
            label-for="countryList"
            label="Country"
          >
          <auto-suggest-countries />
          </b-form-group>
        </b-col>
        <!--/ Country -->

        <b-col cols="12">
          <b-button
            v-ripple.400="'rgba(255, 255, 255, 0.15)'"
            variant="primary"
            class="mt-1 mr-1"
          >
            Save changes
          </b-button>
          <b-button
            v-ripple.400="'rgba(186, 191, 199, 0.15)'"
            type="reset"
            class="mt-1"
            variant="outline-secondary"
            @click.prevent="resetForm"
          >
            Reset
          </b-button>
        </b-col>
      </b-row>
    </b-form>
  </b-card>
</template>

<script>
import { BButton, BForm, BFormGroup, BFormInput, BRow, BCol, BCard, BFormTextarea } from 'bootstrap-vue'
import vSelect from 'vue-select'
import flatPickr from 'vue-flatpickr-component'
import Ripple from 'vue-ripple-directive'
import AutoSuggestCountries from './AutoSuggestCountries.vue'


export default {
  components: {
    BButton,
    BForm,
    BFormGroup,
    BFormInput,
    BRow,
    BCol,
    BCard,
    BFormTextarea,
    vSelect,
    flatPickr,
    AutoSuggestCountries,
  },

  directives: {
    Ripple,
  },
  props: {
    informationData: {
      type: Object,
      default: () => {},
    },
  },
  methods: {
    resetForm() {

    },
  },
}
</script>

<style lang="scss">
@import '~@resources/scss/vue/libs/vue-select.scss';
@import '~@resources/scss/vue/libs/vue-flatpicker.scss';
@import '~@resources/scss/vue/libs/vue-autosuggest.scss';
</style>
