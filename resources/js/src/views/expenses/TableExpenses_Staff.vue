<template>
  <b-card no-body>
    <b-card-body>
      <div class="d-flex justify-content-between  flex-wrap">

        <!-- sorting  -->
        <b-col cols="12" md="6" align-sm="right" class="d-flex align-items-right justify-content-start mb-1 mb-md-0">
          <b-button v-ripple.400="'rgba(113, 102, 240, 0.15)'" @click="newCreate" variant="primary">
            Add New Record
          </b-button>
        </b-col>
        <!-- select 2 demo -->
        <b-modal id="modal-select2" title="Add a expense" ref="my-modal" hide-footer>
          <b-form enctype="multipart/form-data">
            <b-form-group label="Date" label-for="date">
              <flat-pickr v-model="dateDefault" class="form-control" />
            </b-form-group>

            <b-form-group label="Expenses type" label-for="vue-select">
              <v-select id="vue-select" v-model="selected" :options="option" />
            </b-form-group>
            <b-form-group label="Amount" label-for="amount">
              <b-form-input id="amount" v-model="amount" placeholder="120€" />
            </b-form-group>

            <b-form-group label="Attachement" label-for="attachement">
              <b-form-file id="extension" v-model="attachment" @change="uploadFileChange" ref="uploadFile"
                accept=".jpg, .png, .gif" />
            </b-form-group>
            <b-form-group label="Description" label-for="textarea">
              <b-form-textarea id="textarea" v-model="description" rows="3" max-rows="8" class="mb-1 mb-xl-0" />
            </b-form-group>
            <b-button class="mt-3 mb-2" variant="outline-primary" block @click="submit">submit</b-button>
          </b-form>
        </b-modal>

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

    <b-table hover responsive borderless class="position-relative" :per-page="perPage" :current-page="currentPage"
      :items="items" :fields="fields" :filter="filter">
      <!-- We are using utility class `text-nowrap` to help illustrate horizontal scrolling -->
      <template #head()="scope">
        <div class="text-nowrap">
          {{ scope.label }}
        </div>
      </template>

      <template #cell(avatar)="data">
        <b-avatar class="mr-1" :src="data.value" />
      </template>

      <template #cell(status)="data">
        <b-badge :variant="status[1][data.value]">
          {{ status[0][data.value] }}
        </b-badge>
      </template>

      <template #cell()="data">
        <span class="text-nowrap">{{ data.value }}</span>
      </template>
      <template #cell(action)="data">
        <div style="display: flex;"><span><i class="bi bi-box-arrow-in-down-left edit"
              @click="action('edit', data)"></i></span><span><i class="bi bi-trash delete"
              @click="action('delete', data)"></i></span></div>
      </template>
      <template #cell(comment)="data" style="">
        <div style="overflow: visible;width:100px">{{ data.item.comment }}</div>
      </template>
      <template #cell(attachment)="data">
        <div style="display:flex; justify-content: left;">
          <span><a :href="'images/expenses/' + data.item.attachment" ><i class="bi bi-subtract"></i></a></span><span
            class="right"><a :href="'images/expenses/' + data.item.attachment" download><i
                class="bi bi-box-arrow-in-down"></i></a></span>
        </div>
      </template>

    </b-table>

    <b-card-body class="d-flex justify-content-between flex-wrap pt-0">

      <!-- page length -->
      <b-form-group label-cols="6" label-align="left" label-size="sm" label-for="sortBySelect"
        class="text-nowrap mb-md-0 mr-1">
        <b-form-select id="perPageSelect" v-model="perPage" size="sm" inline :options="pageOptions" />
      </b-form-group>

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
    <b-modal ref="delete" hide-footer title="Delete">
      <div class="d-block text-center">
        <h3>Are you sure?</h3>
      </div>
      <div style="display:flex; justify-content:center">
        <b-button class="mt-3" variant="outline-danger" style="width:90px" block @click="hideModal">Cancel</b-button>
        <b-button class="mt-3 ml-3" variant="outline-warning" style="width:75px" block
          @click="toggleModal">OK</b-button>
      </div>
    </b-modal>
    <b-modal id="edit" title="Edit a expense" ref="edit" hide-footer>
      <b-form>
        <b-form-group label="Date" label-for="date">
          <flat-pickr v-model="edit_dateDefault" class="form-control" />
        </b-form-group>

        <b-form-group label="Expenses type" label-for="vue-select">
          <v-select id="vue-select" v-model="edit_selected" :options="option" />
        </b-form-group>
        <b-form-group label="Amount" label-for="amount">
          <b-form-input id="amount" v-model="edit_amount" placeholder="120€" />
        </b-form-group>

        <b-form-group label="Attachement" label-for="attachement">
          <b-form-file id="extension" v-model="edit_attachment" @change="edit_uploadFileChange" accept=".jpg, .png, .gif" />
        </b-form-group>

        <b-form-group label="Description" label-for="textarea">
          <b-form-textarea id="textarea" v-model="edit_description" rows="3" max-rows="8" class="mb-1 mb-xl-0" />
        </b-form-group>
        <b-button class="mt-3 mb-2" variant="outline-primary" block @click="edit_submit">update</b-button>
      </b-form>
    </b-modal>
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
      description: "",
      attachment: "",
      file: '',
      amount: '',
      delete_id: null,
      filter: null,
      edit_dateDefault: null,
      edit_amount: null,
      edit_attachment: null,
      edit_description: null,
      edit_selected: null,
      oldId: null,
      image: null,
      photo:"",
      edit_photo:"",
      fields: [
        {
          key: 'date', label: 'Date',
        },
        'type',
        'amount',
        'attachment',
        'comment',
        { key: 'status', label: 'Status' },
        { key: 'action', label: 'Action' },
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
    // Set the initial number of items
    this.totalRows = this.items.length
    this.loadTable();
  },
  methods: {
    action(type, value) {
      if (type == "delete") {
        console.log(value, type, "this is calling")

        this.delete_id = value.item.no;
        this.$refs['delete'].show()
      }
      if (type == 'edit') {
        this.oldId = value.item.no
        this.edit_description = value.item.comment
        this.edit_selected = value.item.type
        this.edit_amount = value.item.amount
        this.edit_dateDefault = value.item.date
        this.edit_attachment = null
        this.$refs['edit'].show()
      }
    },
    loadTable() {
      let user_id = JSON.parse(localStorage.getItem('userData')).id
      axios
        .post('/query/expenses', { id: user_id })
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
        })
        .catch(error => {
          console.log(error);
        })
    },
    submit() {
      let user_id = JSON.parse(localStorage.getItem('userData')).id
      axios
        .post('/add-expenses', { id: user_id, date: this.dateDefault, type: this.selected, salary: this.amount, attachment: this.photo, comment: this.description })
        .then(response => {
          this.$toast({
            component: ToastificationContent,
            props: {
              title: response.data.message,
              icon: 'EditIcon',
              variant: 'success',
            },
          })
          this.loadTable()
          this.$refs['my-modal'].hide()
        })
        .catch(error => {
          console.log(error);
          this.$toast({
            component: ToastificationContent,
            props: {
              title: error.response.data.message,
              icon: 'EditIcon',
              variant: 'error',
            },
          })
        })
    },
    edit_submit() {
      let user_id = JSON.parse(localStorage.getItem('userData')).id
      axios
        .post('/add-expenses', { id: user_id, oldId: this.oldId, date: this.edit_dateDefault, type: this.edit_selected, salary: this.edit_amount, attachment: this.edit_photo, comment: this.edit_description })
        .then(response => {
          this.loadTable()
          this.$toast({
            component: ToastificationContent,
            props: {
              title: "Successfully Updated!",
              icon: 'EditIcon',
              variant: 'success',
            },
          })
          this.$refs['edit'].hide()
        })
        .catch(error => {
          console.log(error);
          this.$toast({
            component: ToastificationContent,
            props: {
              title: error.response.data.message,
              icon: 'EditIcon',
              variant: 'error',
            },
          })
        })
    },
    hideModal() {
      this.$refs['delete'].hide()
    },
    toggleModal() {
      axios
        .post('/expenses/delete', { id: this.delete_id })
        .then(response => {
          this.loadTable()
          this.$toast({
            component: ToastificationContent,
            props: {
              title: "Deleted Successfully!",
              icon: 'EditIcon',
              variant: 'success',
            },
          })
        })
      this.$refs['delete'].hide()
    },
    newCreate() {
      this.amount = ''
      this.selected = ''
      this.dateDefault = ''
      this.description = ''
      this.attachment = ''
      this.photo=""
      this.$refs['my-modal'].show()
    },
    async uploadFileChange(e) {
      // this.image = this.$refs.uploadFile.files[0];
      console.log(e,"this is e")
      this.photo = await new Promise(resolve => {
        const reader = new FileReader()
        reader.onload = (e) => {
          resolve(e.target.result)
        }
        reader.readAsDataURL(e.target.files[0])
      });
    },
    async edit_uploadFileChange(e) {
      // this.image = this.$refs.uploadFile.files[0];

      this.edit_photo = await new Promise(resolve => {
        const reader = new FileReader()
        reader.onload = (e) => {
          resolve(e.target.result)
        }
        reader.readAsDataURL(e.target.files[0])
        console.log("this si photo",this.edit_photo)
      });
    }
  }
}
</script>
<style lang="scss">
.edit {
  color: aqua;
  font-size: 20px;
}

.delete {
  margin-left: 13px;
  color: rgb(236, 85, 39);
  font-size: 20px
}

.right {
  margin-left: 10px
}

@import '~@resources/scss/vue/libs/vue-select.scss';
@import '~@resources/scss/vue/libs/vue-flatpicker.scss';
@import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css");
</style>
