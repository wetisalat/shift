<template>
  <div>
      <!-- Table responsive -->
      <b-row>
    <b-col cols="12">
      <table-Expenses />
    </b-col>
  </b-row>
  <!-- Table responsive -->

  </div>
</template>

<script>
import { BRow, BCol } from 'bootstrap-vue'

import TableExpenses from './TableExpenses.vue'
import { kFormatter } from '@core/utils/filter'

export default {
  components: {
    BRow,
    BCol,

    TableExpenses,
  },

  methods: {
    kFormatter,
  },
}
</script>

<style lang="scss">
@import '~@resources/scss/vue/libs/vue-select.scss';
</style>
