<template>
  <div>
    <!-- Stats Card Horizontal -->
    <b-row>
      <b-col
        lg="3"
        sm="6"
      >
        <statistic-card-horizontal
          icon="UserIcon"
          statistic="13"
          statistic-title="Total Staffs"
        />
      </b-col>
      <b-col
        lg="3"
        sm="6"
      >
        <statistic-card-horizontal
          icon="UserCheckIcon"
          color="success"
          statistic="1"
          statistic-title="Accepted"
        />
      </b-col>
      <b-col
        lg="3"
        sm="6"
      >
        <statistic-card-horizontal
          icon="UserPlusIcon"
          color="warning"
          statistic="4"
          statistic-title="Pending"
        />
      </b-col>
      <b-col
        lg="3"
        sm="6"
      >
        <statistic-card-horizontal
          icon="UserXIcon"
          color="danger"

          statistic="3"
          statistic-title="Refused"
        />
      </b-col>
    </b-row>
    <!-- Stats Card Horizontal -->

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
import StatisticCardHorizontal from '@core/components/statistics-cards/StatisticCardHorizontal.vue'
import TableExpenses from './TableExpenses.vue'
import { kFormatter } from '@core/utils/filter'

export default {
  components: {
    BRow,
    BCol,
    StatisticCardHorizontal,
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
