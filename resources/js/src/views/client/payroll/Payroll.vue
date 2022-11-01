<template>
  <b-row>
    <b-col cols="12">

      <table-payroll />

    </b-col>
  </b-row>
</template>

<script>
import { BRow, BCol } from 'bootstrap-vue'

import TablePayroll from './TablePayroll.vue'


export default {
  components: {
    BRow,
    BCol,


    TablePayroll,

  },
}
</script>

<style lang="scss">
@import '~@resources/scss/vue/libs/vue-select.scss';
</style>
