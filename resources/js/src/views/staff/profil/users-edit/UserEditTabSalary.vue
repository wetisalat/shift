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
          <b-form-input
            id="weeklyworking"
            readonly
            value="35"
          />
          </b-form-group>
        </b-col>
  
        <!-- Hourly Salary -->
        <b-col>
          <b-form-group
            label="Hourly Salary (price in €uro)"
            label-for="hourly"
          >
          <b-form-input
            id="hourly"
            readonly
            value="10€"
          />
          </b-form-group>
        </b-col>
  
        <!-- Monthly Salary -->
        <b-col>
          <b-form-group
            label="Monthly Salary (price in €uro)"
            label-for="monthly"
          >
          <b-form-input
            id="monthly"
            readonly
            value="3,000€"
          />
          </b-form-group>
        </b-col>
  
        <!-- Overtime Salary -->
        <b-col>
          <b-form-group
            label="Overtime Salary (price in €uro)"
            label-for="overtime"
          >
          <b-form-input
            id="overtime"
            readonly
            value="20€"
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
              <b-form-input
                  id="bonus"
                  readonly
                  value="Prime - 50€"
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
                <b-form-input
                  id="nightamount"
                  readonly
                  value="Hotel - 100€"
                />
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
              <b-form-input
                id="transportamount"
                readonly
                value="Train - 100€"
              />
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
import { BContainer, BRow, BCol, BForm, BFormGroup, BFormInput, BButton } from 'bootstrap-vue'
import { ref } from '@vue/composition-api'




export default {
  components: {
    BContainer,
    BRow,
    BCol,
    BForm,
    BFormGroup,
    BFormInput,
    BButton,

  },
  setup() {
    const userDataInfo = ref({
      bankname: null,
      bic: null,
      iban: null,
    })

    return {
      userDataInfo,
    }
  },
}
</script>

<style lang="scss">
@import '~@resources/scss/vue/libs/vue-select.scss';
</style>