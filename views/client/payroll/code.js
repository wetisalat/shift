export const codeSimple = `
<template>
  <div>
    <b-table-simple
      hover
      small
      caption-top
      responsive
    >
      <caption>Items sold in August, grouped by Country and City:</caption>
      <colgroup><col><col></colgroup>
      <colgroup><col><col><col></colgroup>
      <colgroup><col><col></colgroup>
      <b-thead head-variant="light">
        <b-tr>
          <b-th colspan="2">
            Region
          </b-th>
          <b-th colspan="3">
            Clothes
          </b-th>
          <b-th colspan="2">
            Accessories
          </b-th>
        </b-tr>
        <b-tr>
          <b-th>Country</b-th>
          <b-th>City</b-th>
          <b-th>Trousers</b-th>
          <b-th>Skirts</b-th>
          <b-th>Dresses</b-th>
          <b-th>Bracelets</b-th>
          <b-th>Rings</b-th>
        </b-tr>
      </b-thead>
      <b-tbody>
        <b-tr>
          <b-th rowspan="3">
            Belgium
          </b-th>
          <b-th class="text-right">
            Antwerp
          </b-th>
          <b-td>56</b-td>
          <b-td>22</b-td>
          <b-td>43</b-td>
          <b-td variant="success">
            72
          </b-td>
          <b-td>23</b-td>
        </b-tr>
        <b-tr>
          <b-th class="text-right">
            Gent
          </b-th>
          <b-td>46</b-td>
          <b-td variant="warning">
            18
          </b-td>
          <b-td>50</b-td>
          <b-td>61</b-td>
          <b-td variant="danger">
            15
          </b-td>
        </b-tr>
        <b-tr>
          <b-th class="text-right">
            Brussels
          </b-th>
          <b-td>51</b-td>
          <b-td>27</b-td>
          <b-td>38</b-td>
          <b-td>69</b-td>
          <b-td>28</b-td>
        </b-tr>
        <b-tr>
          <b-th rowspan="2">
            The Netherlands
          </b-th>
          <b-th class="text-right">
            Amsterdam
          </b-th>
          <b-td variant="success">
            89
          </b-td>
          <b-td>34</b-td>
          <b-td>69</b-td>
          <b-td>85</b-td>
          <b-td>38</b-td>
        </b-tr>
        <b-tr>
          <b-th class="text-right">
            Utrecht
          </b-th>
          <b-td>80</b-td>
          <b-td variant="danger">
            12
          </b-td>
          <b-td>43</b-td>
          <b-td>36</b-td>
          <b-td variant="warning">
            19
          </b-td>
        </b-tr>
      </b-tbody>
      <b-tfoot>
        <b-tr>
          <b-td
            colspan="7"
            variant="secondary"
            class="text-right"
          >
            Total Rows: <b>5</b>
          </b-td>
        </b-tr>
      </b-tfoot>
    </b-table-simple>
  </div>
</template>
`

export const codeStyleOption = `
<template>
  <div>
    <!-- checkbox -->
    <b-form-group>
      <label class="mb-0">Table Options</label>
      <div class="demo-inline-spacing">
        <b-form-checkbox
          v-model="striped"
        >
          Striped
        </b-form-checkbox>
        <b-form-checkbox
          v-model="bordered"
        >
          Bordered
        </b-form-checkbox>
        <b-form-checkbox
          v-model="borderless"
        >
          Borderless
        </b-form-checkbox>
        <b-form-checkbox
          v-model="outlined"
        >
          Outlined
        </b-form-checkbox>
        <b-form-checkbox
          v-model="small"
        >
          Small
        </b-form-checkbox>
        <b-form-checkbox
          v-model="hover"
        >
          Hover
        </b-form-checkbox>
        <b-form-checkbox
          v-model="dark"
        >
          Dark
        </b-form-checkbox>
        <b-form-checkbox
          v-model="fixed"
        >
          Fixed
        </b-form-checkbox>
        <b-form-checkbox
          v-model="footClone"
        >
          Foot Clone
        </b-form-checkbox>
        <b-form-checkbox
          v-model="noCollapse"
        >
          No border collapse
        </b-form-checkbox>
      </div>
    </b-form-group>

    <!-- radio -->
    <b-form-group
      label="Head Variant"
      label-cols-lg="2"
    >
      <b-form-radio-group
        v-model="headVariant"
      >
        <b-form-radio
          :value="null"
        >
          None
        </b-form-radio>
        <b-form-radio
          value="light"
        >
          Light
        </b-form-radio>
        <b-form-radio
          value="dark"
        >
          Dark
        </b-form-radio>
      </b-form-radio-group>
    </b-form-group>

    <!-- variant select -->
    <b-form-group
      label="Table Variant"
      label-for="table-style-variant"
      label-cols-lg="2"
      class="mb-0"
    >
      <v-select
        v-model="tableVariant"
        :dir="$store.state.appConfig.isRTL ? 'rtl' : 'ltr'"
        label="tableVariants"
        :options="tableVariants"
      />
    </b-form-group>

    <!-- table -->
    <b-table
      :striped="striped"
      :bordered="bordered"
      :borderless="borderless"
      :outlined="outlined"
      :small="small"
      :hover="hover"
      :dark="dark"
      :fixed="fixed"
      :foot-clone="footClone"
      :no-border-collapse="noCollapse"
      :items="items"
      :fields="fields"
      :head-variant="headVariant"
      :table-variant="tableVariant"
    />
  </div>
</template>

<script>
import {
  BTable, BFormGroup, BFormRadio, BFormCheckbox, BFormRadioGroup, BCardBody,
} from 'bootstrap-vue'
import vSelect from 'vue-select'

export default {
  components: {
    BTable,
    BFormGroup,
    BCardBody,
    vSelect,
    BFormRadio,
    BFormCheckbox,
    BFormRadioGroup,
  },
  data() {
    return {
      fields: ['first_name', 'last_name', 'age'],
      items: [
        { age: 40, first_name: 'Dickerson', last_name: 'Macdonald' },
        { age: 21, first_name: 'Larsen', last_name: 'Shaw' },
        { age: 89, first_name: 'Geneva', last_name: 'Wilson' },
        { age: 89, first_name: 'Olenka', last_name: 'Brawley' },
        { age: 89, first_name: 'Vernon', last_name: 'Perford' },
      ],
      tableVariants: [
        'none',
        'primary',
        'secondary',
        'info',
        'danger',
        'warning',
        'success',
        'light',
        'dark',
      ],
      striped: false,
      bordered: false,
      borderless: false,
      outlined: false,
      small: false,
      hover: false,
      dark: false,
      fixed: false,
      footClone: false,
      headVariant: null,
      tableVariant: 'none',
      noCollapse: false,
    }
  },
}
</script>

<style lang="scss">
@import '~@resources/scss/vue/libs/vue-select.scss';
</style>
`