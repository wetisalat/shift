<template>
  <b-card title="Custom Radio Buttons">
    <div class="demo-inline-spacing">
      <b-form-radio
        v-model="Selected"
        name="some-radios"
        value="A"
      >
        Checked
      </b-form-radio>
      <b-form-radio
        v-model="Selected"
        name="some-radios"
        value="B"
      >
        Unchecked
      </b-form-radio>
      <b-form-radio
        v-model="Selected1"
        name="some-radios2"
        value="c"
        disabled
      >
        Checked Disabled
      </b-form-radio>
      <b-form-radio
        v-model="Selected1"
        name="some-radios2"
        value="d"
        disabled
      >
        Unchecked Disabled
      </b-form-radio>
    </div>

  </b-card>
</template>

<script>
import { BCard, BFormRadio, BCardText } from 'bootstrap-vue'


export default {
  components: {
    BCard,
    BCardText,
    BFormRadio,
  },
  data() {
    return {
      Selected: 'A',
      Selected1: 'c',
    }
  },
}
</script>
