<template>
  <div class="buy-now">
    <b-button
      v-ripple.400="'rgba(255, 255, 255, 0.15)'"
      variant="danger"
      href="https://google.com"
      target="_blank"
      rel="noopener noreferrer"
    >
      Buy Now
    </b-button>
  </div>
</template>

<script>
import { BButton } from 'bootstrap-vue'
import Ripple from 'vue-ripple-directive'

export default {
  directives: {
    Ripple,
  },
  components: {
    BButton,
  },
}
</script>

<style>

</style>
