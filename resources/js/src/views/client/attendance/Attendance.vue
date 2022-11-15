<template>
  <b-row>
    <b-col cols="12">

      <table-Attendance />

    </b-col>
  </b-row>
</template>

<script>
import { BRow, BCol } from 'bootstrap-vue'

import TableAttendance from './TableAttendance.vue'


export default {
  components: {
    BRow,
    BCol,


    TableAttendance,

  },
}
</script>

<style lang="scss">
@import '~@resources/scss/vue/libs/vue-select.scss';
</style>
