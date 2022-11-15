<template>
  <b-tabs
    vertical
    content-class="col-12 col-md-9 mt-1 mt-md-0"
    pills
    nav-wrapper-class="col-md-3 col-12"
    nav-class="nav-left"
  >

    <!-- general tab -->
    <b-tab active>

      <!-- title -->
      <template #title>
        <feather-icon
          icon="UserIcon"
          size="18"
          class="mr-50"
        />
        <span class="font-weight-bold">General</span>
      </template>

      <account-setting-general
        v-if="options.general"
        :general-data="options.general"
      />
    </b-tab>
    <!--/ general tab -->

        <!-- address tab -->
        <b-tab>
      <!-- title -->
      <template #title>
        <feather-icon
          icon="HomeIcon"
          size="18"
          class="mr-50"
        />
        <span class="font-weight-bold">Address</span>
      </template>

      <account-setting-address
        v-if="options.address"
        :address-data="options.address"
      />
      </b-tab>
      <!--/ address tab -->

    <!-- info -->
    <b-tab>

      <!-- title -->
      <template #title>
        <feather-icon
          icon="InfoIcon"
          size="18"
          class="mr-50"
        />
        <span class="font-weight-bold">Information</span>
      </template>

      <account-setting-information
        v-if="options.info"
        :information-data="options.info"
      />
    </b-tab>

        <!-- location -->
        <b-tab>

      <!-- title -->
      <template #title>
        <feather-icon
          icon="MapPinIcon"
          size="18"
          class="mr-50"
        />
        <span class="font-weight-bold">Locations</span>
      </template>

      <account-setting-locations/>
      </b-tab>

    <!-- social links -->
    <b-tab>

      <!-- title -->
      <template #title>
        <feather-icon
          icon="LinkIcon"
          size="18"
          class="mr-50"
        />
        <span class="font-weight-bold">Social</span>
      </template>

      <account-setting-social
        v-if="options.social"
        :social-data="options.social"
      />
    </b-tab>

    <!-- notification -->
    <b-tab>

      <!-- title -->
      <template #title>
        <feather-icon
          icon="BellIcon"
          size="18"
          class="mr-50"
        />
        <span class="font-weight-bold">Notifications</span>
      </template>

      <account-setting-notification
        v-if="options.notification"
        :notification-data="options.notification"
      />
    </b-tab>

        <!-- change password tab -->
        <b-tab>

      <!-- title -->
      <template #title>
        <feather-icon
          icon="LockIcon"
          size="18"
          class="mr-50"
        />
        <span class="font-weight-bold">Change Password</span>
      </template>

      <account-setting-password />
      </b-tab>
      <!--/ change password tab -->
  </b-tabs>
</template>

<script>
import { BTabs, BTab } from 'bootstrap-vue'
import AccountSettingGeneral from './AccountSettingGeneral.vue'
import AccountSettingAddress from './AccountSettingAddress.vue'
import AccountSettingInformation from './AccountSettingInformation.vue'
import AccountSettingLocations from './AccountSettingLocations.vue'
import AccountSettingSocial from './AccountSettingSocial.vue'
import AccountSettingNotification from './AccountSettingNotification.vue'
import AccountSettingPassword from './AccountSettingPassword.vue'

export default {
  components: {
    BTabs,
    BTab,
    AccountSettingGeneral,
    AccountSettingAddress,
    AccountSettingInformation,
    AccountSettingLocations,
    AccountSettingSocial,
    AccountSettingNotification,
    AccountSettingPassword,
  },
  data() {
    return {
      options: {},
    }
  },
  beforeCreate() {
    this.$http.get('/account-setting/data').then(res => { this.options = res.data })
  },
}
</script>
