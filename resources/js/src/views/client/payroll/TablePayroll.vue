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
        <b-dropdown
        v-ripple.400="'rgba(113, 102, 240, 0.15)'"
        text="Select Action"
        variant="flat-primary"
        class="dropdown-select d-inline-block ml-50 mr-1"
      >
      
      <b-dropdown-item>
        <feather-icon
          icon="DatabaseIcon"
          class="mr-50"
        />
        <span class="align-middle">CSV</span>
      </b-dropdown-item>

      <b-dropdown-item>
        <feather-icon
          icon="FileTextIcon"
          class="mr-50"
        />
        <span class="align-middle">Excel</span>
      </b-dropdown-item>      
      
      <b-dropdown-item>
        <feather-icon
          icon="FileIcon"
          class="mr-50"
        />
        <span class="align-middle">PDF</span>
      </b-dropdown-item>

      <b-dropdown-item variant="danger">
        <feather-icon
          icon="Trash2Icon"
          class="mr-50"
        />
        <span class="align-middle">Delete</span>
      </b-dropdown-item>
    </b-dropdown>
    </b-col>
           

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
      ref="selectableTable"
      selectable
      hover
      responsive
      borderless
      class="position-relative"
      foot-clone="footClone"
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
  BDropdown,
  BDropdownItem,
  BDropdownDivider,
  BCardText,
  BCardBody,
  BFormCheckbox,
  
  BForm,
} from 'bootstrap-vue'
import vSelect from 'vue-select'
import Ripple from 'vue-ripple-directive'



export default {
  components: {
    BCard,
    BCol,
    BTable,
    BAvatar,
    BBadge,
    BFormGroup,
    BFormSelect,
    BDropdown,
    BDropdownItem,
    BDropdownDivider,
    BCardText,
    BInputGroup,
    BFormInput,
    BInputGroupAppend,
    BButton,
    BCardBody,
    BFormCheckbox,

    BForm,
    vSelect,
  },
  directives: {
    Ripple,
  },
  data() {
    return {
      selected: 'Contract type',
      option: ['OPTION 1', 'OPTION 2', 'OPTION 3'],
      noCollapse: false,
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
  methods: {
    onRowSelected(items) {
      this.selected = items
    },
    selectAllRows() {
      this.$refs.selectableTable.selectAllRows()
    },
    clearSelected() {
      this.$refs.selectableTable.clearSelected()
    },
  },
}
</script>

<style lang="scss" scoped>
.dropdown-select {
  min-width: 150px;
  width: 100px; //unit between dropdown and button
  left: -15px;
}
.b-table-selectable{
  .feather{
    font-size: 1.3rem;
  }
}
</style>

<style lang="scss">
@import '~@resources/scss/vue/libs/vue-select.scss';
</style>