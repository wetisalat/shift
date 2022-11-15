<template>
  <section id="dashboard-analytics">
    <b-row class="match-height">
      <b-col
        lg="6"
        md="12"
      >
        <analytics-congratulation :data="data.congratulations" />
      </b-col>
      <b-col
        lg="3"
        sm="6"
      >
        <statistic-card-with-area-chart
          v-if="data.subscribersGained"
          icon="UsersIcon"
          :statistic="kFormatter(data.subscribersGained.analyticsData.subscribers)"
          statistic-title="Subscribers Gained"
          :chart-data="data.subscribersGained.series"
        />
      </b-col>
      <b-col
        lg="3"
        sm="6"
      >
        <statistic-card-with-area-chart
          v-if="data.ordersRecevied"
          icon="PackageIcon"
          color="warning"
          :statistic="kFormatter(data.ordersRecevied.analyticsData.orders)"
          statistic-title="Orders Received"
          :chart-data="data.ordersRecevied.series"
        />
      </b-col>
    </b-row>

    <b-row class="match-height">
      <b-col lg="4">
        <card-advance-meetup />
      </b-col>
      <b-col lg="8">
        <card-analytic-revenue />
      </b-col>
    </b-row>

    <b-row class="match-height">
      <b-col lg="6">
        <analytics-avg-sessions :data="data.avgSessions" />
      </b-col>
      <b-col lg="6">
        <ecommerce-company-table :table-data="data.companyTable" />
      </b-col>
    </b-row>

  </section>
</template>

<script>
import { BRow, BCol } from 'bootstrap-vue'
import { kFormatter } from '@core/utils/filter'

import AnalyticsCongratulation from './AnalyticsCongratulation.vue'
import StatisticCardWithAreaChart from '@core/components/statistics-cards/StatisticCardWithAreaChart.vue'

import CardAdvanceMeetup from './CardAdvanceMeetup.vue'
import CardAnalyticRevenue from './CardAnalyticRevenue.vue'

import AnalyticsAvgSessions from './AnalyticsAvgSessions.vue'
import EcommerceCompanyTable from './EcommerceCompanyTable.vue'


export default {
  components: {
    BRow,
    BCol,

    AnalyticsCongratulation,
    StatisticCardWithAreaChart,

    CardAnalyticRevenue,
    CardAdvanceMeetup,

    AnalyticsAvgSessions,
    EcommerceCompanyTable,

  },
  data() {
    return {
      data: {},
    }
  },
  created() {
    // data
    this.$http.get('/analytics/data').then(response => {
      this.data = response.data

      // ? Your API will return name of logged in user or you might just directly get name of logged in user
      // ? This is just for demo purpose
      const userData = getUserData()
      this.data.congratulations.name = userData.fullName.split(' ')[0] || userData.username
    })
  },
  methods: {
    kFormatter,
  },
}
</script>

<style lang="scss">
@import '~@resources/scss/vue/libs/chart-apex.scss';
</style>
