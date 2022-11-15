<template>
  <section id="dashboard-ecommerce">
    <b-row class="match-height">
      <b-col
        lg="3"
        sm="6"
      >
        <statistic-card-with-area-chart
          v-if="subscribersGained.analyticsData"
          icon="UsersIcon"
          :statistic="kFormatter(subscribersGained.analyticsData.subscribers)"
          statistic-title="Subscribers Gained"
          :chart-data="subscribersGained.series"
        />
      </b-col>
      <b-col
        lg="3"
        sm="6"
      >
        <statistic-card-with-area-chart
          v-if="revenueGenerated.analyticsData"
          icon="CreditCardIcon"
          color="success"
          :statistic="kFormatter(revenueGenerated.analyticsData.revenue)"
          statistic-title="Revenue Generated"
          :chart-data="revenueGenerated.series"
        />
      </b-col>
      <b-col
        lg="3"
        sm="6"
      >
        <statistic-card-with-area-chart
          v-if="quarterlySales.analyticsData"
          icon="ShoppingCartIcon"
          color="danger"
          :statistic="kFormatter(quarterlySales.analyticsData.sales)"
          statistic-title="Quarterly Sales"
          :chart-data="quarterlySales.series"
        />
      </b-col>
      <b-col
        lg="3"
        sm="6"
      >
        <statistic-card-with-area-chart
          v-if="ordersRecevied.analyticsData"
          icon="PackageIcon"
          color="warning"
          :statistic="kFormatter(ordersRecevied.analyticsData.orders)"
          statistic-title="Orders Received"
          :chart-data="ordersRecevied.series"
        />
      </b-col>

      <b-col lg="8">
        <card-analytic-revenue />
      </b-col>
      <b-col lg="4">
        <apex-donut-chart />
      </b-col>
      
    </b-row>

<!-- Table responsive -->
    <b-row>
      <b-col cols="12">
        <table-kitchen-sink />
      </b-col>
    </b-row>
<!-- Table responsive -->

  </section>
</template>

<script>
import { BRow, BCol } from 'bootstrap-vue'
import { getUserData } from '@/auth/utils'
import { kFormatter } from '@core/utils/filter'

import StatisticCardWithAreaChart from '@core/components/statistics-cards/StatisticCardWithAreaChart.vue'

import CardAnalyticRevenue from './CardAnalyticRevenue.vue'
import ApexDonutChart from './ApexDonutChart.vue'

import TableKitchenSink from './TableKitchenSink.vue'




export default {
  components: {
    BRow,
    BCol,

    StatisticCardWithAreaChart,

    CardAnalyticRevenue,
    ApexDonutChart,

    TableKitchenSink,
  },
  data() {
    return {
      // Area charts
      subscribersGained: {},
      revenueGenerated: {},
      quarterlySales: {},
      ordersRecevied: {},

    }
  },
  created() {
    // data
    this.$http.get('/ecommerce/data').then(response => {
      this.data = response.data

      // ? Your API will return name of logged in user or you might just directly get name of logged in user
      // ? This is just for demo purpose
      const userData = getUserData()
      this.data.congratulations.name = userData.fullName.split(' ')[0] || userData.username
    })
    // Subscribers gained
    this.$http.get('/card/card-statistics/subscribers')
      .then(response => { this.subscribersGained = response.data })

    // Revenue Generated
    this.$http.get('/card/card-statistics/revenue')
      .then(response => { this.revenueGenerated = response.data })

    // Sales
    this.$http.get('/card/card-statistics/sales')
      .then(response => { this.quarterlySales = response.data })

    // Orders
    this.$http.get('/card/card-statistics/orders')
      .then(response => { this.ordersRecevied = response.data })
  },
  methods: {
    kFormatter,
  },
}
</script>

<style lang="scss">
@import '~@resources/scss/vue/pages/dashboard-ecommerce.scss';
@import '~@resources/scss/vue/libs/chart-apex.scss';
@import '~@resources/scss/vue/libs/vue-flatpicker.scss';
@import '~@resources/scss/vue/libs/vue-select.scss';
</style>
