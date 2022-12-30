<template>
  <div>
    <!-- Stats Card Horizontal -->
    <b-row v-if="$can('read', 'Role Client')">
      <b-col lg="3" sm="6">
        <statistic-card-horizontal icon="UserIcon" :statistic="total_staff" statistic-title="Total Staffs" />
      </b-col>
      <b-col lg="3" sm="6">
        <statistic-card-horizontal icon="UserCheckIcon" color="success" :statistic="accepted"
          statistic-title="Accepted" />
      </b-col>
      <b-col lg="3" sm="6">
        <statistic-card-horizontal icon="UserPlusIcon" color="warning" :statistic="pending" statistic-title="Pending" />
      </b-col>
      <b-col lg="3" sm="6">
        <statistic-card-horizontal icon="UserXIcon" color="danger" :statistic="refuse" statistic-title="Refused" />
      </b-col>
    </b-row>
    <!-- Stats Card Horizontal -->

    <!-- Table responsive -->
    <b-row>
      <b-col v-if="$can('read', 'Role Client')" cols="12">
        <table-Expenses_Client :run="(e) => run(e)" />
      </b-col>
      <b-col v-if="$can('read', 'Role Staff')" cols="12">
        <table-Expenses_Staff />
      </b-col>
    </b-row>
    <!-- Table responsive -->

  </div>
</template>

<script>
import { BRow, BCol } from 'bootstrap-vue'
import StatisticCardHorizontal from '@core/components/statistics-cards/StatisticCardHorizontal.vue'
import TableExpenses_Client from './TableExpenses_Client.vue'
import TableExpenses_Staff from './TableExpenses_Staff.vue'
import { kFormatter } from '@core/utils/filter'
import axios from '@axios'

export default {
  data() {
    return {
      total_staff: 0,
      accepted: 0,
      pending: 0,
      refuse: 0
    }
  },
  components: {
    BRow,
    BCol,
    StatisticCardHorizontal,
    TableExpenses_Client,
    TableExpenses_Staff,
  },

  methods: {
    kFormatter,
    run(data) {
      if(data="Expense updated"){
        this.analyse()
      }
    },
    analyse() {
      this.total_staff = 0
      this.accepted = 0
      this.pending = 0
      this.refuse = 0

      let user_id = JSON.parse(localStorage.getItem('userData')).id
      let role=JSON.parse(localStorage.getItem('userData')).role
      if(role!=="staff"){
        axios
        .post('/analyse', { id: user_id })
        .then(response => {
          console.log(response.data)
          response.data.data.map((value, index) => {
            if (value.status == 'accept') {
              this.accepted = value.total
            } else if (value.status === "pending") {
              this.pending = value.total
            } else if (value.status == 'refuse') {
              this.refuse = value.total
            }
            this.total_staff=response.data.total.length
          })
        })
      }
    }
  },
  mounted() {
    this.analyse()
  }
}
</script>

<style lang="scss">
@import '~@resources/scss/vue/libs/vue-select.scss';
</style>
