<template>
  <b-card no-body>
    <b-card-body>
      <div class="d-flex justify-content-between  flex-wrap">

        <!-- sorting  -->
        <b-col cols="12" md="6" align-sm="right" class="d-flex align-items-right justify-content-start mb-1 mb-md-0">
          <b-dropdown v-ripple.400="'rgba(113, 102, 240, 0.15)'" text="Select Action" variant="flat-primary"
            class="dropdown-select d-inline-block ml-50 mr-1">
            <b-dropdown-item @click="getItem('accept')" variant="success">
              <feather-icon icon="ThumbsUpIcon" class="mr-50" />
              <span class="align-middle">Accept</span>
            </b-dropdown-item>

            <b-dropdown-item @click="getItem('pending')" variant="warning">
              <feather-icon icon="InfoIcon" class="mr-50" />
              <span class="align-middle">Pending</span>
            </b-dropdown-item>

            <b-dropdown-item @click="getItem('refuse')" variant="danger">
              <feather-icon icon="ThumbsDownIcon" class="mr-50" />
              <span class="align-middle">Refuse</span>
            </b-dropdown-item>

            <b-dropdown-item>
              <b-dropdown-divider />
              <feather-icon icon="PrinterIcon" class="mr-50" />
              <span class="align-middle">Print</span>
            </b-dropdown-item>

            <b-dropdown-item>
              <feather-icon icon="DatabaseIcon" class="mr-50" />
              <span class="align-middle">CSV</span>
            </b-dropdown-item>

            <b-dropdown-item>
              <feather-icon icon="FileTextIcon" class="mr-50" />
              <span class="align-middle">Excel</span>
            </b-dropdown-item>

            <b-dropdown-item>
              <feather-icon icon="FileIcon" class="mr-50" />
              <span class="align-middle">PDF</span>
            </b-dropdown-item>

          </b-dropdown>
        </b-col>


        <!-- filter -->
        <b-form-group label-cols-sm="2" label-align-sm="left" label-size="md" label-for="filterInput" class="mb-0">
          <b-input-group>
            <b-form-input id="filterInput" v-model="filter" type="search" placeholder="Type to Search" />
            <b-input-group-append>
              <b-button :disabled="!filter" @click="filter = ''">
                Clear
              </b-button>
            </b-input-group-append>
          </b-input-group>
        </b-form-group>

      </div>
    </b-card-body>

    <b-table ref="selectableTable" selectable hover responsive borderless class="position-relative" :per-page="perPage"
      :current-page="currentPage" :items="items" :fields="fields" :filter="filter">
      <!-- We are using utility class `text-nowrap` to help illustrate horizontal scrolling -->
      <template #head(id)>
        <div class="text-nowrap">
          No
        </div>
      </template>

      <template #head()="scope">
        <div class="text-nowrap">
          {{ scope.label }}
        </div>
      </template>

      <template #cell(avatar)="data">
        <b-avatar class="mr-1" :src="data.value" />
      </template>
      <template #cell(action)="data">
        <div class="flex">
          <div class="item green" id="accept" @click="action('accept', data)"></div>
          <div class="item orange" id="pending" @click="action('pending', data)"></div>
          <div class="item red" id="refuse" @click="action('refuse', data)"></div>
          <b-tooltip target="accept">Accept</b-tooltip>
          <b-tooltip target="pending">Pending</b-tooltip>
          <b-tooltip target="refuse">Refuse</b-tooltip>
        </div>
      </template>
      <template #cell(status)="data">
        <b-badge :variant="status[1][data.value]">
          {{ status[0][data.value] }}
        </b-badge>
      </template>
      <template #cell(attachment)="data">
        <div style="display:flex; justify-content: left;">
          <span><a :href="'images/expenses/' + data.item.attachment" ><i class="bi bi-subtract"></i></a></span><span
            class="right"><a :href="'images/expenses/' + data.item.attachment" download><i
                class="bi bi-box-arrow-in-down"></i></a></span>
        </div>
      </template>
      <template #cell()="data">
        <span class="text-nowrap">{{ data.value }}</span>
      </template>
    </b-table>

    <b-card-body class="d-flex justify-content-between flex-wrap pt-0">

      <!-- page length -->
      <b-form-group label-cols="6" label-align="left" label-size="sm" label-for="sortBySelect"
        class="text-nowrap mb-md-0 mr-1">
        <b-form-select id="perPageSelect" v-model="perPage" size="sm" inline :options="pageOptions" />
      </b-form-group>

      <!-- buttons -->
      <b-card-body class="demo-inline-spacing pt-0">
        <b-button v-ripple.400="'rgba(113, 102, 240, 0.15)'" variant="outline-primary" size="sm" @click="selectAllRows">
          Select all
        </b-button>
        <b-button v-ripple.400="'rgba(113, 102, 240, 0.15)'" variant="outline-primary" size="sm" @click="clearSelected">
          Clear selected
        </b-button>
      </b-card-body>

      <!-- pagination -->
      <div>
        <b-pagination v-model="currentPage" :total-rows="totalRows" :per-page="perPage" first-number last-number
          prev-class="prev-item" next-class="next-item" class="mb-0">
          <template #prev-text>
            <feather-icon icon="ChevronLeftIcon" size="18" />
          </template>
          <template #next-text>
            <feather-icon icon="ChevronRightIcon" size="18" />
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
  BPagination,
  BCardBody,
  BFormCheckbox,
  BTooltip
} from 'bootstrap-vue'
import vSelect from 'vue-select'
import Ripple from 'vue-ripple-directive'
import axios from '@axios'
import ToastificationContent from '@core/components/toastification/ToastificationContent.vue'

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
    BPagination,
    BCardBody,
    BFormCheckbox,
    BTooltip,
    vSelect,
  },
  directives: {
    Ripple,
  },
  props: {
    run: { type: Function }
  },
  data() {
    return {
      total: null,
      noCollapse: false,
      perPage: 10,
      pageOptions: [10, 50, 100],
      totalRows: 1,
      currentPage: 1,
      filter: null,
      fields: [
        {
          key: 'id', stickyColumn: true, isRowHeader: true, variant: 'primary',
        },
        {
          key: 'date', label: 'Date',
        },
        'staff',
        'type',
        'amount',
        'attachment',
        'comment',
        'status',
        { key: 'action', label: 'action' },
      ],
      /* eslint-disable global-require */
      items: [],
      /* eslint-disable global-require */
      status: [{
        1: 'Accept', 2: 'Pending', 3: 'Refuse'
      },
      {
        1: 'light-primary', 2: 'light-success', 3: 'light-danger'
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
    this.run("this is calling")
    // Set the initial number of items
    this.loadTable();
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
    action(type, data) {

      axios
        .post('expenses/status/' + data.item.no, { _method: "PATCH", status: type })
        .then(response => {
          if (response.data.message == "Expense updated") {
            this.loadTable()
            this.run("Expense updated")
          }
          this.$toast({
            component: ToastificationContent,
            props: {
              title: response.data.message,
              icon: 'EditIcon',
              variant: 'success',
            },
          }).catch(error => {
            this.$toast({
              component: ToastificationContent,
              props: {
                title: error.response.data.message,
                icon: 'EditIcon',
                variant: 'error',
              },
            })
          })
        })
    },
    loadTable() {
      let user_id = JSON.parse(localStorage.getItem('userData')).id
      axios
        .post('/expenses', { id: user_id })
        .then(response => {
          var data = [];
          response.data.data.map((value, index) => {
            data.push({
              id: index + 1,
              date: value.date,
              staff: value.name,
              type: value.type,
              amount: value.salary,
              attachment: value.attachment,
              comment: value.comment,
              status: value.status,
              action: null,
              no: value.id
            })
          })
          this.items = data;
          this.totalRows = data.length
          this.total = data
        })
        .catch(error => {
          console.log(error);
        })
    },
    getItem(e) {
      var filter_value = null;
      if (e == 'pending') {
        filter_value = 2
      } else if (e == 'accept') {
        filter_value = 1
      } else if (e == 'refuse') {
        filter_value = 3
      }
      // this.loadTable();
      this.items = this.total.filter(value => {
        return value.status == filter_value
      })
    }
  },
}
</script>

<style lang="scss" scoped>
.dropdown-select {
  min-width: 150px;
  width: 100px; //unit between dropdown and button
  left: -15px;
}

.b-table-selectable {
  .feather {
    font-size: 1.3rem;
  }
}

.flex {
  display: flex;
  justify-content: center;
}

.item {
  width: 22px;
  height: 22px;
  border-radius: 50%;
  margin-left: 5px;
  margin-right: 5px;
}

.green {
  background-color: #28c76f;
}

.red {
  background-color: red;
}

.orange {
  background-color: rgb(218, 204, 8)
}

.right {
  margin-left: 10px
}
</style>

<style lang="scss">
@import '~@resources/scss/vue/libs/vue-select.scss';
@import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css");
</style>