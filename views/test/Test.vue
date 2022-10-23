<template>
  <section id="dashboard-ecommerce">
    <b-row class="match-height">
      <b-col
        xl="4"
        md="6"
      >
        <ecommerce-medal :data="data.congratulations" />
      </b-col>
      <b-col
        xl="8"
        md="6"
      >
        <ecommerce-statistics :data="data.statisticsItems" />
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
import EcommerceMedal from './EcommerceMedal.vue'
import EcommerceStatistics from './EcommerceStatistics.vue'
import CardAnalyticRevenue from './CardAnalyticRevenue.vue'
import ApexDonutChart from './ApexDonutChart.vue'
import TableKitchenSink from './LeavesTable.vue'
import { kFormatter } from '@core/utils/filter'



export default {
  components: {
    BRow,
    BCol,

    EcommerceMedal,
    EcommerceStatistics,
    CardAnalyticRevenue,
    ApexDonutChart,
    TableKitchenSink,
  },
  data() {
    return {
      data: {},
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
  },
}
</script>

<style lang="scss">
@import '~@resources/scss/vue/pages/dashboard-ecommerce.scss';
@import '~@resources/scss/vue/libs/chart-apex.scss';
@import '~@resources/scss/vue/libs/vue-flatpicker.scss';
@import '~@resources/scss/vue/libs/vue-select.scss';
</style>
