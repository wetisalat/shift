<template>
  <div>
    <!-- Stats Card Horizontal -->
    <b-row>
      <b-col
        lg="3"
        sm="6"
      >
        <statistic-card-horizontal
          icon="CpuIcon"
          statistic="86%"
          statistic-title="CPU Usage"
        />
      </b-col>
      <b-col
        lg="3"
        sm="6"
      >
        <statistic-card-horizontal
          icon="ServerIcon"
          color="success"
          statistic="1.2gb"
          statistic-title="Memory Usage"
        />
      </b-col>
      <b-col
        lg="3"
        sm="6"
      >
        <statistic-card-horizontal
          icon="ActivityIcon"
          color="danger"
          statistic="0.1%"
          statistic-title="Downtime Ratio"
        />
      </b-col>
      <b-col
        lg="3"
        sm="6"
      >
        <statistic-card-horizontal
          icon="AlertOctagonIcon"
          color="warning"

          statistic="13"
          statistic-title="Issues Found"
        />
      </b-col>
    </b-row>
    <!-- Stats Card Horizontal -->

      <!-- Table responsive -->
      <b-row>
    <b-col cols="12">
      <table-kitchen-sink />
    </b-col>
  </b-row>
  <!-- Table responsive -->

  </div>
</template>

<script>
import { BRow, BCol } from 'bootstrap-vue'
import StatisticCardHorizontal from '@core/components/statistics-cards/StatisticCardHorizontal.vue'
import TableKitchenSink from './TableKitchenSink.vue'
import { kFormatter } from '@core/utils/filter'

export default {
  components: {
    BRow,
    BCol,
    StatisticCardHorizontal,
    TableKitchenSink,
  },

  methods: {
    kFormatter,
  },
}
</script>

<style lang="scss">
@import '~@resources/scss/vue/libs/vue-select.scss';
</style>
