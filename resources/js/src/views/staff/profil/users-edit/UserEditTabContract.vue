<template>
  <div>

    <!-- Header: Personal Info -->
    <div class="d-flex">
      <feather-icon
        icon="ClipboardIcon"
        size="19"
      />
      <h4 class="mb-0 ml-50">
        Contract
      </h4>
    </div>

    <!-- Form: Personal Info Form -->
    <b-form class="mt-1">
      <b-row>

        <b-container fluid>
          <b-row>

            <!-- Field: Contract -->
            <b-col>
              <b-form-group
                label="Contract"
                label-for="contract">
                <b-form-input
                  id="contract"
                  readonly
                  value="CDD"
                />
              </b-form-group>
            </b-col>

            <!-- Field: Time type -->
            <b-col>
              <b-form-group
                label="Time type"
                label-for="timetype">
                <b-form-input
                  id="timetype"
                  readonly
                  value="35h/semaine"
              />
              </b-form-group>
            </b-col>

            <!-- Field: Hiring Date -->
            <b-col>
              <b-form-group
                label="Hiring Date"
                label-for="hiringdate">
                <b-form-input
                  id="hiringdate"
                  readonly
                  value="21/10/2022"
                />
              </b-form-group>
            </b-col>

            <!-- Field: End Date -->
            <b-col>
              <b-form-group
                label="End Date"
                label-for="enddate">
                <b-form-input
                  id="enddate"
                  readonly
                  value="21/10/2023"
                />
              </b-form-group>
            </b-col>
              
          </b-row>
        </b-container>
      </b-row>


          <!-- Header: Qualification -->
          <div class="d-flex mt-2">
            <feather-icon
              icon="BookOpenIcon"
              size="19"/>
            <h4 class="mb-0 ml-50">
              Qualification
            </h4>
          </div>
  
        <!-- Form: Qualification Form -->
        <b-row class="mt-1">
  
          <!-- Field: Statut -->
          <b-col
            cols="12"
            md="6"
            lg="4">
            <b-form-group
              label="Statut"
              label-for="statut">
              <b-form-input
                  id="statut"
                  readonly
                  value="Cadre"
                />
            </b-form-group>
          </b-col>

          <!-- Field: Catégorie professionnelle -->
          <b-col
            cols="12"
            md="6"
            lg="4">
            <b-form-group
              label="Catégorie professionnelle"
              label-for="categorie">
              <b-form-input
                  id="categorie"
                  readonly
                  value="data"
                />
            </b-form-group>
          </b-col>

          <!-- Field: Echelon -->
          <b-col
            cols="12"
            md="6"
            lg="4">
            <b-form-group
              label="Echelon"
              label-for="echelon">
              <b-form-input
                  id="echelon"
                  readonly
                  value="2"
                />
            </b-form-group>
          </b-col>

          <!-- Field: Location -->
          <b-col
            cols="12"
            md="6"
            lg="4">
            <b-form-group
              label="Location"
              label-for="location">
              <b-form-input
                  id="location"
                  readonly
                  value="Paris"
                />
            </b-form-group>
          </b-col>

          <!-- Field: Position -->
          <b-col
            cols="12"
            md="6"
            lg="4">
              <b-form-group
                label="Position"
                label-for="position">       
                <b-form-input
                  id="position"
                  readonly
                  value="Manager"
                />
              </b-form-group>
            </b-col>

          <!-- Field: Shift -->
          <b-col
            cols="12"
            md="6"
            lg="4">
            <b-form-group
              label="Shift"
              label-for="shift">
              <b-form-input
                  id="shift"
                  readonly
                  value="Night Shift"
                />
            </b-form-group>
          </b-col>
        </b-row>
  
        </b-row>
    </b-form>
  </div>
</template>

<script>
import { BContainer, BRow, BCol, BForm, BFormGroup, BFormInput, BFormRadioGroup, BFormCheckboxGroup, BButton } from 'bootstrap-vue'
import flatPickr from 'vue-flatpickr-component'
import { ref } from '@vue/composition-api'
import vSelect from 'vue-select'


export default {
  components: {
    BContainer,
    BRow,
    BCol,
    BForm,
    BFormGroup,
    flatPickr,
    BFormInput,
    BButton,
  },
}
</script>

<style lang="scss">
@import '~@resources/scss/vue/libs/vue-flatpicker.scss';
@import '~@resources/scss/vue/libs/vue-select.scss';
</style>