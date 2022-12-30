<template>
    <vue-autosuggest
      :suggestions="filteredOptions"
      :input-props="inputProps"
      :on-selected="onSelected"
      :limit="3"
      @input="onInputChange"
    >
      <template slot-scope="{suggestion}">
        <div class="d-flex align-items-center">
          <div class="detail ml-50">
            <b-card-text class="mb-0">
              {{ suggestion.item.name }}
            </b-card-text>
          </div>
        </div>
      </template>
    </vue-autosuggest>

</template>

<script>
import { VueAutosuggest } from 'vue-autosuggest'
import { BCard, BAvatar, BCardText } from 'bootstrap-vue'


export default {
  components: {
    VueAutosuggest,
    BCard,
    BCardText,
    BAvatar,
  },
  data() {
    return {
      datasuggest: [],
      filteredOptions: [],
      inputProps: {
        id: 'autosuggest__input',
        class: 'form-control',
      },
      limit: 5,
    }
  },
  created() {
    this.$http.get('/autosuggest/data')
      .then(res => { this.datasuggest = res })
  },
  methods: {
    onSelected(option) {
      this.selected = option.item
    },
    onInputChange(text) {
      if (text === '' || text === undefined) {
        return
      }

      /* Full control over filtering. Maybe fetch from API?! Up to you!!! */
      const filteredMedicine = this.datasuggest.data[0].medicine.filter(item => item.name.toLowerCase().indexOf(text.toLowerCase()) > -1).slice(0, this.limit)
      const filteredData = filteredMedicine
      this.filteredOptions = [{
        data: filteredData,
      }]
    },
  },
}
</script>
