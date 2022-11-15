<template>
    <b-card
      no-body
    >
      <b-card-body>
        <div class="d-flex justify-content-between  flex-wrap">
  
          <!-- sorting  -->
          <b-col
            cols="12"
            md="6"
            align-sm="right"
            class="d-flex align-items-right justify-content-start mb-1 mb-md-0"
          >
        <b-button
          v-ripple.400="'rgba(113, 102, 240, 0.15)'"
          v-b-modal.modal-select2
          variant="primary"
        >
          Add Expense
        </b-button>
          </b-col>
              <!-- select 2 demo -->
      <b-modal
        id="modal-select2"
        title="Add a expense"
        ok-title="submit"
        cancel-variant="outline-secondary"
      >
        <b-form>

        <b-form-group
            label="Date"
            label-for="date"
          >
          <flat-pickr
            v-model="dateDefault"
            class="form-control"
          />
        </b-form-group>

          <b-form-group
            label="Expenses type"
            label-for="vue-select"
          >
            <v-select
              id="vue-select"
              v-model="selected"
              :options="option"
            />
          </b-form-group>
          <b-form-group
            label="Amount"
            label-for="amount"
          >
            <b-form-input
              id="amount"
              placeholder="120€"
            />
          </b-form-group>
          
          <b-form-group
            label="Attachement"
            label-for="attachement"
          >
            <b-form-file
            id="extension"
            accept=".jpg, .png, .gif"
            />
          </b-form-group>
  
          <b-form-group
            label="Description"
            label-for="textarea"
          >
          <b-form-textarea
            id="textarea"
            rows="3"
            max-rows="8"
            class="mb-1 mb-xl-0"
          />
          </b-form-group>
  
        </b-form>
      </b-modal>
  
          <!-- filter -->
          <b-form-group
            label-cols-sm="2"
            label-align-sm="left"
            label-size="md"
            label-for="filterInput"
            class="mb-0"
          >
            <b-input-group>
              <b-form-input
                id="filterInput"
                v-model="filter"
                type="search"
                placeholder="Type to Search"
              />
              <b-input-group-append>
                <b-button
                  :disabled="!filter"
                  @click="filter = ''"
                >
                  Clear
                </b-button>
              </b-input-group-append>
            </b-input-group>
          </b-form-group>
  
        </div>
      </b-card-body>
  
      <b-table
        hover
        responsive
        borderless
        class="position-relative"
        :per-page="perPage"
        :current-page="currentPage"
        :items="items"
        :fields="fields"
        :filter="filter"
      >
        <!-- We are using utility class `text-nowrap` to help illustrate horizontal scrolling -->
        <template #head(id)>
          <div class="text-nowrap">
            Row ID
          </div>
        </template>
  
        <template #head()="scope">
          <div class="text-nowrap">
            {{ scope.label }}
          </div>
        </template>
  
        <template #cell(avatar)="data">
          <b-avatar
            class="mr-1"
            :src="data.value"
          />
        </template>
  
        <template #cell(status)="data">
          <b-badge :variant="status[1][data.value]">
            {{ status[0][data.value] }}
          </b-badge>
        </template>
  
        <template #cell()="data">
          <span class="text-nowrap">{{ data.value }}</span>
        </template>
      </b-table>
  
      <b-card-body class="d-flex justify-content-between flex-wrap pt-0">
  
        <!-- page length -->
        <b-form-group
          label-cols="6"
          label-align="left"
          label-size="sm"
          label-for="sortBySelect"
          class="text-nowrap mb-md-0 mr-1"
        >
          <b-form-select
            id="perPageSelect"
            v-model="perPage"
            size="sm"
            inline
            :options="pageOptions"
          />
        </b-form-group>
  
        <!-- pagination -->
        <div>
          <b-pagination
            v-model="currentPage"
            :total-rows="totalRows"
            :per-page="perPage"
            first-number
            last-number
            prev-class="prev-item"
            next-class="next-item"
            class="mb-0"
          >
            <template #prev-text>
              <feather-icon
                icon="ChevronLeftIcon"
                size="18"
              />
            </template>
            <template #next-text>
              <feather-icon
                icon="ChevronRightIcon"
                size="18"
              />
            </template>
          </b-pagination>
        </div>
      </b-card-body>
  
    </b-card>
  </template>
  
  <script>
  import {
    BCard,
    BCol,
    BTable,
    BAvatar,
    BBadge,
    BLink,
    BFormGroup,
    BFormSelect,
    BInputGroup,
    BFormInput,
    BInputGroupAppend,
    BButton,
    BCardText,
    BPagination,
    BCardBody,
    BFormFile,
    BFormTextarea,
    
    BModal,
    VBModal,
    BForm,
  } from 'bootstrap-vue'
  import vSelect from 'vue-select'
  import Ripple from 'vue-ripple-directive'
  import store from '@/store/index'
  import flatPickr from 'vue-flatpickr-component'
  
  
  
  export default {
    components: {
      BCard,
      BCol,
      BTable,
      BAvatar,
      BBadge,
      BFormGroup,
      BFormSelect,

      BCardText,
      BInputGroup,
      BFormInput,
      BInputGroupAppend,
      BButton,
      BPagination,
      BCardBody,
      flatPickr,
      BFormFile,
      BFormTextarea,
  
      BModal,
      VBModal,
      BForm,
      vSelect,
  
    },
    directives: {
      'b-modal': VBModal,
      Ripple,
    },
    data() {
      return {
        selected: 'Expense type',
        option: ['Transport', 'Carburant', 'Péage', 'Parking', 'Autres'],
        noCollapse: false,
        perPage: 10,
        pageOptions: [10, 50, 100],
        totalRows: 1,
        currentPage: 1,
        dateDefault: null,
        filter: null,
        fields: [
          {
            key: 'id', stickyColumn: true, isRowHeader: true, variant: 'primary',
          },
          {
            key: 'avatar', label: 'Avatar',
          },
          'full_name',
          'email',
          'start_date',
          'salary',
          { key: 'status', label: 'Status' },
        ],
        /* eslint-disable global-require */
        items: [
          {
            id: 1,
            avatar: require('@/assets/images/avatars/10-small.png'),
            full_name: "Korrie O'Crevy",
            email: 'kocrevy0@thetimes.co.uk',
            start_date: '09/23/2016',
            salary: '$23896.35',
            status: 2,
          },
          {
            id: 2,
            avatar: require('@/assets/images/avatars/1-small.png'),
            full_name: 'Bailie Coulman',
            email: 'bcoulman1@yolasite.com',
            start_date: '05/20/2018',
            salary: '$13633.69',
            status: 2,
          },
          {
            id: 3,
            avatar: require('@/assets/images/avatars/9-small.png'),
            full_name: 'Stella Ganderton',
            email: 'sganderton2@tuttocitta.it',
            start_date: '03/24/2018',
            salary: '$13076.28',
            status: 5,
          },
          {
            id: 4,
            avatar: require('@/assets/images/avatars/3-small.png'),
            full_name: 'Dorolice Crossman',
            email: 'dcrossman3@google.co.jp',
            start_date: '12/03/2017',
            salary: '$12336.17',
            status: 2,
          },
          {
            id: 5,
            avatar: require('@/assets/images/avatars/4-small.png'),
            full_name: 'Harmonia Nisius',
            email: 'hnisius4@gnu.org',
            start_date: '08/25/2017',
            salary: '$10909.52',
            status: 2,
          },
          {
            id: 6,
            avatar: require('@/assets/images/avatars/5-small.png'),
            full_name: 'Genevra Honeywood',
            email: 'ghoneywood5@narod.ru',
            start_date: '06/01/2017',
            salary: '$17803.80',
            status: 1,
          },
          {
            id: 7,
            avatar: require('@/assets/images/avatars/7-small.png'),
            full_name: 'Eileen Diehn',
            email: 'ediehn6@163.com',
            start_date: '10/15/2017',
            salary: '$18991.67',
            status: 3,
          },
          {
            id: 8,
            avatar: require('@/assets/images/avatars/9-small.png'),
            full_name: 'Richardo Aldren',
            email: 'raldren7@mtv.com',
            start_date: '11/05/2016',
            salary: '$19230.13',
            status: 3,
          },
          {
            id: 9,
            avatar: require('@/assets/images/avatars/2-small.png'),
            full_name: 'Allyson Moakler',
            email: 'amoakler8@shareasale.com',
            start_date: '12/29/2018',
            salary: '$11677.32',
            status: 5,
          },
          {
            id: 10,
            avatar: require('@/assets/images/avatars/6-small.png'),
            full_name: 'Merline Penhalewick',
            email: 'mpenhalewick9@php.net',
            start_date: '04/19/2019',
            salary: '$15939.52',
            status: 2,
          },
        ],
        /* eslint-disable global-require */
        status: [{
          1: 'Current', 2: 'Professional', 3: 'Rejected', 4: 'Resigned', 5: 'Applied',
        },
        {
          1: 'light-primary', 2: 'light-success', 3: 'light-danger', 4: 'light-warning', 5: 'light-info',
        }],
      }
    },
    computed: {
      sortOptions() {
        // Create an options list from our fields
        return this.fields
          .filter(f => f.sortable)
          .map(f => ({ text: f.label, value: f.key }))
      },
    },
    mounted() {
      // Set the initial number of items
      this.totalRows = this.items.length
    },
  }
  </script>

  
  <style lang="scss">
  @import '~@resources/scss/vue/libs/vue-select.scss';
  @import '~@resources/scss/vue/libs/vue-flatpicker.scss';
  </style>