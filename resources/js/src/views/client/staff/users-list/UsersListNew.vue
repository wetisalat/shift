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
            v-b-modal.staff-modal
            variant="primary"
          >
            Add Staff
          </b-button>
        </b-col>
        <!-- select 2 demo -->
        <b-modal
          id="staff-modal"
          ref="staff.modal"
          title="Add New Staff"
          ok-title="submit"
          cancel-variant="outline-secondary"
          hide-footer
        >
          <validation-observer
            ref="staffForm"
            #default="{invalid}"
          >
            <b-form @submit.prevent="addStaff">
              <b-form-group
                label="Gender"
                label-for="gender"
              >
                <validation-provider
                  #default="{ errors }"
                  name="Gender"
                  vid="gender"
                  rules="required"
                >
                  <v-select
                    id="gender"
                    v-model="form.gender"
                    :options="option"
                  />
                  <small class="text-danger">{{ errors[0] }}</small>
                </validation-provider>
              </b-form-group>

              <b-form-group
                label="First Name"
                label-for="firstname"
              >
                <validation-provider
                  #default="{ errors }"
                  name="FirstName"
                  vid="firstname"
                  rules="required"
                >
                  <b-form-input
                    id="firstname"
                    v-model="form.firstName"
                    :state="errors.length > 0 ? false:null"
                    name="firstname"
                    placeholder="First Name"
                  />
                  <small class="text-danger">{{ errors[0] }}</small>
                </validation-provider>
              </b-form-group>

              <b-form-group
                label="Last Name"
                label-for="lastname"
              >
                <validation-provider
                  #default="{ errors }"
                  name="Last Name"
                  vid="lastname"
                  rules="required"
                >
                  <b-form-input
                    id="lastname"
                    v-model="form.lastName"
                    :state="errors.length > 0 ? false:null"
                    name="lastname"
                    placeholder="Last Name"
                  />
                  <small class="text-danger">{{ errors[0] }}</small>
                </validation-provider>
              </b-form-group>

              <b-form-group
                label="Email"
                label-for="email"
              >
                <validation-provider
                  #default="{ errors }"
                  name="Last Name"
                  vid="lastname"
                  rules="required"
                >
                  <b-form-input
                    id="email"
                    v-model="form.email"
                    type="email"
                    :state="errors.length > 0 ? false:null"
                    name="email"
                    placeholder="email@email.com"
                  />
                  <small class="text-danger">{{ errors[0] }}</small>
                </validation-provider>
              </b-form-group>

              <b-form-group
                label="Phone Number"
                label-for="phonenumber"
              >
                <validation-provider
                  #default="{ errors }"
                  name="Phone Number"
                  vid="phonenumber"
                  rules="required"
                >
                  <cleave
                    id="phonenumber"
                    v-model="form.phoneNumber"
                    class="form-control"
                    :raw="false"
                    :options="options.phonenumber"
                    :state="errors.length > 0 ? false:null"
                    placeholder="+33 6 12 34 56 78"
                  />
                  <small class="text-danger">{{ errors[0] }}</small>
                </validation-provider>
              </b-form-group>
              <div class="text-right">
                <b-button
                  class="mt-2"
                  variant="outline-secondary"
                  @click="hideModal"
                >Cancel</b-button>
                <b-button
                  type="submit"
                  class="mt-2"
                  variant="outline-primary"
                >Submit</b-button>
              </div>
            </b-form>
          </validation-observer>
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
        <b-form-checkbox v-model="selectAll" @click="handleSelectAll" />
      </template>

      <template #head()="scope">
        <div class="text-nowrap">
          {{ scope.label }}
        </div>
      </template>

      <template #cell(id)="data">
        <b-form-checkbox
          :id="'checkbox' + data.index"
          v-model="data.item.checked"
        />
      </template>

      <template #cell(user)="data">
        <div class="d-flex">
          <b-avatar :text="data.item.initials" variant="light-secondary"/>

          <div class="pl-2">
            <div class="text-primary">
              {{ data.item.name }}
            </div>
            <div>
              -
            </div>
          </div>
        </div>
      </template>

      <template #cell(actions)="data">
        <router-link
          v-b-tooltip.hover
          :to="`/staff/view/${data.item.id}`"
          title="View Staff"
        >
          <feather-icon
            class="mr-1"
            icon="FileTextIcon"
          />
        </router-link>
        <feather-icon
          class="mr-1"
          icon="ActivityIcon"
        />
        <b-button
          v-b-tooltip.hover
          variant="link"
          title="Delete Staff"
          @click="deleteStaff(data.item.id)"
        >
          <b-icon-trash />
        </b-button>
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
import { ValidationProvider, ValidationObserver } from 'vee-validate'
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
  BPagination,
  BCardBody,
  BFormCheckbox,

  BModal,
  VBModal,
  BForm,
  BIconTrash,
} from 'bootstrap-vue'
import vSelect from 'vue-select'
import Ripple from 'vue-ripple-directive'
import Cleave from 'vue-cleave-component'
// eslint-disable-next-line import/no-extraneous-dependencies
import 'cleave.js/dist/addons/cleave-phone.fr'
import { required, email } from '@validations'

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
    BFormCheckbox,

    BInputGroup,
    BFormInput,
    BInputGroupAppend,
    BButton,
    BPagination,
    BCardBody,

    BModal,
    BForm,
    BIconTrash,
    vSelect,
    Cleave,
    ValidationProvider,
    ValidationObserver,
  },
  directives: {
    'b-modal': VBModal,
    Ripple,
  },
  data() {
    return {
      selected: 'Gender',
      option: ['Male', 'Female', 'Other'],
      noCollapse: false,
      perPage: 10,
      pageOptions: [10, 50, 100],
      totalRows: 1,
      currentPage: 1,
      dateDefault: null,
      filter: null,
      fields: [
        {
          key: 'id', stickyColumn: true, isRowHeader: true,
        },
        {
          key: 'user', label: 'User',
        },
        'email',
        'role',
        'plan',
        { key: 'status', label: 'Status' },
        'actions',
      ],
      form: {
        firstName: '',
        lastName: '',
        gender: '',
        email: '',
        phoneNumber: '',
      },
      options: {
        phonenumber: {
          prefix: '+33',
          phone: true,
          blocks: [2, 2, 2, 2, 2],
        },
      },
      /* eslint-disable global-require */
      items: [],
      /* eslint-disable global-require */
      status: [{
        1: 'Active', 2: 'InActive',
      },
      {
        1: 'light-success', 2: 'light-warning',
      }],

      // Check all checkbox
      selectAll: false,

      // validation rules
      required,
      email,
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
    this.getStaffList()

    // Set the initial number of items
    this.totalRows = this.items.length
  },
  methods: {
    getStaffList() {
      this.$http.get('/api/client/staff')
        .then(response => {
          this.items = response.data.staffs.map(staff => {
            const [firstName, lastName] = staff.name.split(' ')

            const initials = `${firstName[0]} ${lastName[0]}`

            return {
              ...staff,
              role: staff.roles.length > 0 ? staff.roles[0].name : '',
              status: staff.email_verified_at !== null ? 1 : 2,
              initials,
              checked: false,
            }
          })
        })
        .then(console.log)
    },
    addStaff() {
      this.$refs.staffForm.validate().then(success => {
        if (success) {
          this.$http.post('/api/client/staff', this.form)
            .then(response => {
              this.hideModal()

              // Reload the list
              this.getStaffList()

              this.$toast({
                component: ToastificationContent,
                props: {
                  title: response.data.message,
                  icon: 'EditIcon',
                  variant: 'success',
                },
              })
            })
            .catch(error => {
              this.$toast({
                component: ToastificationContent,
                props: {
                  title: error.response.data.message,
                  icon: 'EditIcon',
                  variant: 'error',
                },
              })
            })
        }
      })
    },
    deleteStaff(id) {
      this.$http.post(`/api/client/staff/${id}`, { _method: 'DELETE' })
        .then(response => {
          // Reload the list
          this.getStaffList()

          this.$toast({
            component: ToastificationContent,
            props: {
              title: response.data.message,
              icon: 'EditIcon',
              variant: 'success',
            },
          })
        })
        .catch(console.log)
    },

    hideModal() {
      this.$refs['staff.modal'].hide()
    },
    handleSelectAll() {
      if (this.selectAll) {
        this.items.map(item => ({ ...item, checked: true }))
      } else {
        this.items.map(item => ({ ...item, checked: false }))
      }
      console.log('select all -->', this.selectAll)
    },
  },
  form: {
  },
  options: {
    phonenumber: {
      prefix: '+33',
      phone: true,
      blocks: [2, 2, 2, 2, 2],
    },
  },
}
</script>

<style lang="scss">
  @import '~@resources/scss/vue/libs/vue-select.scss';
  @import '~@resources/scss/vue/libs/vue-flatpicker.scss';
  @import '~@resources/scss/vue/pages/page-auth.scss';
</style>
