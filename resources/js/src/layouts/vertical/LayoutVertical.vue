<template>
  <layout-vertical :nav-menu-items="navMenuItems">

    <router-view />

  </layout-vertical>
</template>

<script>
import LayoutVertical from '@core/layouts/layout-vertical/LayoutVertical.vue'
// import navMenuItems from '@/navigation/vertical'

export default {
  components: {
    LayoutVertical,
  },
  data() {
    return {}
  },
  computed: {
    navMenuItems() {
      return this.$store.state.navigationMenu.items ?? []
    },
  },
}
</script>
