<template>
  <div>

    <!-- Header: Personal Info -->
    <div class="d-flex">
      <feather-icon
        icon="DollarSignIcon"
        size="19"
      />
      <h4 class="mb-0 ml-50">
        Salary & Rate
      </h4>
    </div>

    <!-- Form: Personal Info Form -->
    <b-form class="mt-1">
      <b-row>

        <b-container fluid>
          <b-row>

                   <!-- Weekly working time -->
        <b-col>
          <b-form-group
            label="Weekly working time (Hours per week)"
            label-for="weeklyworking"
          >
            <cleave
              id="weeklyworking"
              v-model="form.time"
              class="form-control"
              :raw="false"
              :options="options.time"
              placeholder="hh:mm"
            />
          </b-form-group>
        </b-col>
  
        <!-- Hourly Salary -->
        <b-col>
          <b-form-group
            label="Hourly Salary (price in €uro)"
            label-for="hourly"
          >
            <cleave
              id="hourly"
              v-model="form.hourly"
              class="form-control"
              :raw="false"
              :options="options.hourly"
              placeholder="10€"
            />
          </b-form-group>
        </b-col>
  
        <!-- Monthly Salary -->
        <b-col>
          <b-form-group
            label="Monthly Salary (price in €uro)"
            label-for="monthly"
          >
            <cleave
              id="monthly"
              v-model="form.monthly"
              class="form-control"
              :raw="false"
              :options="options.monthly"
              placeholder="3,000€"
            />
          </b-form-group>
        </b-col>
  
        <!-- Overtime Salary -->
        <b-col>
          <b-form-group
            label="Overtime Salary (price in €uro)"
            label-for="overtime"
          >
            <cleave
              id="overtime"
              v-model="form.overtime"
              class="form-control"
              :raw="false"
              :options="options.overtime"
              placeholder="10€"
            />
          </b-form-group>
        </b-col>
              
          </b-row>
        </b-container>
      </b-row>


          <!-- Header: Extra -->
          <div class="d-flex mt-2">
            <feather-icon
              icon="PlusSquareIcon"
              size="19"/>
            <h4 class="mb-0 ml-50">
              Extra
            </h4>
          </div>
  
        <!-- Form: Extra Form -->
        <b-row class="mt-1">
  

          <!-- Field: Bonus (Prime) -->
          <b-col
            cols="12"
            md="6"
            lg="4">
            <b-form-group
              label="Bonus (Prime)"
              label-for="bonus">
              <v-select
                v-model="selected"
                multiple
                label="title"
                :options="bonus"
              />
            </b-form-group>
          </b-col>

          <!-- Field: Night Amount -->
          <b-col
            cols="12"
            md="6"
            lg="4">
              <b-form-group
                label="Night Amount"
                label-for="nightamount">       
                <v-select
                  v-model="userDataInfo.night"
                  :options="nightOptions"
                  :clearable="false"
                  input-id="night"/>
              </b-form-group>
            </b-col>

          <!-- Field: Transport Amount -->
          <b-col
            cols="12"
            md="6"
            lg="4">
            <b-form-group
              label="Transport Amount"
              label-for="transportamount">
              <v-select
                  v-model="userDataInfo.transport"
                  :options="transportOptions"
                  :clearable="false"
                  input-id="transport"/>
            </b-form-group>
          </b-col>
        </b-row>

          <!-- Header: Bank info -->
          <div class="d-flex mt-2">
            <feather-icon
              icon="HomeIcon"
              size="19"/>
            <h4 class="mb-0 ml-50">
              Bank info
            </h4>
          </div>
  
        <!-- Form: Bank Form -->
        <b-row class="mt-1">
  

          <!-- Field: Bank Name -->
          <b-col
            cols="12"
            md="6"
            lg="4">
            <b-form-group
              label="Bank Name"
              label-for="bankname">     
            <b-form-input
              id="bankname"
              v-model="userDataInfo.bankname"/>
            </b-form-group>
          </b-col>

          <!-- Field: BIC -->
          <b-col
            cols="12"
            md="6"
            lg="4">
              <b-form-group
                label="BIC"
                label-for="bic">    
                <b-form-input
                  id="bic"
                  v-model="userDataInfo.bic"/>
              </b-form-group>
            </b-col>

          <!-- Field: IBAN -->
          <b-col
            cols="12"
            md="6"
            lg="4">
            <b-form-group
              label="IBAN"
              label-for="iban">     
            <b-form-input
              id="iban"
              v-model="userDataInfo.iban"/>
            </b-form-group>
          </b-col>
        </b-row>
  
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
  },
  setup() {
    const userDataInfo = ref({

      bonus: null,
      transport: 'Pass - 50€',
      night: 'Hotel - 150€',
      bankname: null,
      bic: null,
      iban: null,

      
    })

    const transportOptions = ['Pass - 50€', 'Train - 60€']

    const nightOptions = ['Hotel - 150€', 'AirBnB - 90€']




    return {
      userDataInfo,
      transportOptions,
      nightOptions,
      selected: null,
      bonus: [
        { title: 'Bonus 1' },
        { title: 'Bonus 2' },
        { title: 'Bonus 3' },
      ],
    }
  },
  data() {
    return {
      form: {
      },
      options: {
        time: {
          time: true,
          timePattern: ['h', 'm'],
        },
        monthly: {
          numeral: true,
          numeralThousandsGroupStyle: 'thousand',
        },
        hourly: {
          numeral: true,
          numeralThousandsGroupStyle: 'thousand',
        },
        overtime: {
          numeral: true,
          numeralThousandsGroupStyle: 'thousand',
        },
      },
    }
  },
}
</script>

<style lang="scss">
@import '~@resources/scss/vue/libs/vue-flatpicker.scss';
@import '~@resources/scss/vue/libs/vue-select.scss';
</style>