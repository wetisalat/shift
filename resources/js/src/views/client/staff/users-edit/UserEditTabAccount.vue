<template>
  <div>

    <!-- Media -->
    <b-media class="mb-2">
      <template #aside>
        <b-avatar
          ref="previewEl"
          :src="userData.avatar"
          :text="avatarText(userData.fullName)"
          :variant="`light-${resolveUserRoleVariant(userData.role)}`"
          size="90px"
          rounded
        />
      </template>
      <h4 class="mb-1">
        {{ userData.fullName }}
      </h4>
      <div class="d-flex flex-wrap">
        <b-button
          variant="primary"
          @click="$refs.refInputEl.click()"
        >
          <input
            ref="refInputEl"
            type="file"
            class="d-none"
            @input="inputImageRenderer"
          >
          <span class="d-none d-sm-inline">Update</span>
          <feather-icon
            icon="EditIcon"
            class="d-inline d-sm-none"
          />
        </b-button>
        <b-button
          variant="outline-secondary"
          class="ml-1"
        >
          <span class="d-none d-sm-inline">Remove</span>
          <feather-icon
            icon="TrashIcon"
            class="d-inline d-sm-none"
          />
        </b-button>
      </div>
    </b-media>

    <!-- User Info: Input Fields -->
    <b-form>
      <b-row>

        <!-- Field: Gender -->
        <b-col
          cols="12"
          md="4"
        >
        <b-form-group
            label="Gender"
            label-for="gender"
          >
            <v-select
              v-model="userData.gender"
              :options="genderOptions"
              :reduce="val => val.value"
              :clearable="false"
              input-id="gender"
            />
          </b-form-group>
        </b-col>

        <!-- Field: First Name -->
        <b-col
          cols="12"
          md="4"
        >
          <b-form-group
            label="First Name"
            label-for="firstname"
          >
            <b-form-input
              id="firstname"
              v-model="userData.firstname"
            />
          </b-form-group>
        </b-col>

        <!-- Field: Last Name -->
        <b-col
          cols="12"
          md="4"
        >
          <b-form-group
            label="Last Name"
            label-for="lastname"
          >
            <b-form-input
              id="lastname"
              v-model="userData.lastname"
            />
          </b-form-group>
        </b-col>

        <!-- Field: Email -->
        <b-col
          cols="12"
          md="4"
        >
          <b-form-group
            label="Email"
            label-for="email"
          >
            <b-form-input
              id="email"
              v-model="userData.email"
              type="email"
            />
          </b-form-group>
        </b-col>

        <!-- Field: Phone Number -->
        <b-col
          cols="12"
          md="4"
        >
          <b-form-group
            label="Phone Number"
            label-for="phonenumber"
          >
            <cleave
              id="phonenumber"
              v-model="userData.phone"
              class="form-control"
              :raw="false"
              :options="options.phonenumber"
              placeholder="+33 6 12 34 56 78"
            />
          </b-form-group>
        </b-col>

        <!-- Field: Role -->
        <b-col
          cols="12"
          md="4"
        >
          <b-form-group
            label="Group"
            label-for="group"
          >
            <v-select
              v-model="userData.role"
              label="name"
              :options="userGroups"
              :reduce="val => val.id"
              :clearable="false"
              input-id="user-role"
            />

            <!-- button -->
            <b-button
              id="toggle-btn"
              v-ripple.400="'rgba(113, 102, 240, 0.15)'"
              v-b-tooltip.hover.right="'Add a group'"
              v-b-modal.modal-prevent-closing
              variant="flat-primary"
              class="btn-icon"
            >
              <feather-icon icon="PlusCircleIcon" />
            </b-button>
          </b-form-group>
        </b-col>

      </b-row>
    </b-form>

    <!-- modal -->
    <b-modal
      id="modal-prevent-closing"
      ref="my-modal"
      title="Submit a Group"
      ok-title="Submit"
      cancel-variant="outline-secondary"
      @show="resetModal"
      @hidden="resetModal"
      @ok="handleOk"
    >
      <form
        ref="grpForm"
        @submit.stop.prevent="handleSubmitGroup"
      >
        <b-form-group
          :state="grpNameState"
          label="Group Name"
          label-for="name-input"
          invalid-feedback="Group is required"
        >
          <b-form-input
            id="name-input"
            v-model="grpName"
            :state="grpNameState"
            required
          />
        </b-form-group>
      </form>
    </b-modal>

    <!-- PERMISSION TABLE -->
    <b-card
      no-body
      class="border mt-1"
    >
      <b-card-header class="p-1">
        <b-card-title class="font-medium-2">
          <feather-icon
            icon="LockIcon"
            size="18"
          />
          <span class="align-middle ml-50">Permission</span>
        </b-card-title>
      </b-card-header>
      <b-table
        striped
        responsive
        class="mb-0"
        :items="permissionsData"
      >
        <template #cell(module)="data">
          {{ data.value }}
        </template>
        <template #cell()="data">
          <b-form-checkbox :checked="data.value" />
        </template>
      </b-table>
    </b-card>

    <!-- Action Buttons -->
    <b-button
      variant="primary"
      class="mb-1 mb-sm-0 mr-0 mr-sm-1"
      :block="$store.getters['app/currentBreakPoint'] === 'xs'"
      @click="onSubmit()"
    >
      Save Changes
    </b-button>
    <b-button
      variant="outline-secondary"
      type="reset"
      :block="$store.getters['app/currentBreakPoint'] === 'xs'"
    >
      Reset
    </b-button>
  </div>
</template>

<script>
import {
  BButton,
  BMedia,
  BAvatar,
  BRow,
  BCol,
  BFormGroup,
  BFormInput,
  BForm,
  BTable,
  BCard,
  BCardHeader,
  BCardTitle,
  BFormCheckbox,
  VBModal,
  VBTooltip,
} from 'bootstrap-vue'
import { avatarText } from '@core/utils/filter'
import vSelect from 'vue-select'
import { useInputImageRenderer } from '@core/comp-functions/forms/form-utils'
import { ref } from '@vue/composition-api'
import store from '@/store'
import router from '@/router'
import Cleave from 'vue-cleave-component'
import { useToast } from 'vue-toastification/composition'
import Ripple from 'vue-ripple-directive'

// eslint-disable-next-line import/no-extraneous-dependencies
import 'cleave.js/dist/addons/cleave-phone.fr'
import ToastificationContent from '@core/components/toastification/ToastificationContent.vue'

import useUsersList from '../users-list/useUsersList'

export default {
  components: {
    BButton,
    BMedia,
    BAvatar,
    BRow,
    BCol,
    BFormGroup,
    BFormInput,
    BForm,
    BTable,
    BCard,
    BCardHeader,
    BCardTitle,
    BFormCheckbox,
    vSelect,
    Cleave,
  },
  directives: {
    'b-modal': VBModal,
    'b-tooltip': VBTooltip,
    Ripple,
  },
  props: {
    userData: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {
      grpName: '',
      grpNameState: null,

      userGroups: [],
    }
  },
  created() {
    store.dispatch('app-user/fetchGroups')
      .then(res => {
        this.userGroups = res.data
      })
  },
  methods: {
    checkFormValidity() {
      const valid = this.$refs.grpForm.checkValidity()
      this.grpNameState = valid
      return valid
    },
    resetModal() {
      this.grpName = ''
      this.grpNameState = null
    },
    handleOk(bvModalEvt) {
      // Prevent modal from closing
      bvModalEvt.preventDefault()
      // Trigger submit handler
      this.handleSubmitGroup()
    },
    handleSubmitGroup() {
      // Exit when the form isn't valid
      if (!this.checkFormValidity()) {
        return
      }

      // Submit to the API
      store.dispatch('app-user/addGroup', { name: this.grpName })
        .then(response => {
          store.dispatch('app-user/fetchGroups')
            .then(res => {
              this.userGroups = res.data
            })

          this.$toast({
            component: ToastificationContent,
            props: {
              title: response.data.message,
              icon: 'EditIcon',
              variant: 'error',
            },
          })
        })
        .catch(error => {
          console.log(error)
        })
      // Hide the modal manually
      this.$nextTick(() => {
        this.$refs['my-modal'].toggle('#toggle-btn')
      })
    },
  },
  setup(props) {
    const { resolveUserRoleVariant } = useUsersList()

    const genderOptions = [
      { label: 'Male', value: 'male' },
      { label: 'Female', value: 'female' },
      { label: 'Other', value: 'other' },
    ]

    const permissionsData = [
      {
        module: 'Admin',
        read: true,
        write: false,
        create: false,
        delete: false,
      },
      {
        module: 'Staff',
        read: false,
        write: true,
        create: false,
        delete: false,
      },
      {
        module: 'Author',
        read: true,
        write: false,
        create: true,
        delete: false,
      },
      {
        module: 'Contributor',
        read: false,
        write: false,
        create: false,
        delete: false,
      },
      {
        module: 'User',
        read: false,
        write: false,
        create: false,
        delete: true,
      },
    ]

    // ? Demo Purpose => Update image on click of update
    const refInputEl = ref(null)
    const previewEl = ref(null)

    const { inputImageRenderer } = useInputImageRenderer(refInputEl, base64 => {
      // eslint-disable-next-line no-param-reassign
      props.userData.avatar = base64
    })

    const toast = useToast()

    const onSubmit = () => {
      store.dispatch('app-user/updateUser', { id: router.currentRoute.params.id })
        .then(response => {
          toast({
            component: ToastificationContent,
            props: {
              title: response.data.message,
              icon: 'EditIcon',
              variant: 'error',
            },
          })
        })
        .catch(error => {
          console.log(error)
        })
    }

    return {
      resolveUserRoleVariant,
      avatarText,
      genderOptions,
      permissionsData,

      //  ? Demo - Update Image on click of update button
      refInputEl,
      previewEl,
      inputImageRenderer,
      form: {
      },
      options: {
        phonenumber: {
          prefix: '+33',
          phone: true,
          blocks: [2, 2, 2, 2, 2],
        },
      },

      onSubmit,
    }
  },
}
</script>

<style lang="scss">
@import '~@resources/scss/vue/libs/vue-select.scss';
</style>
