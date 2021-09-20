import Vue from 'vue'
import App from './App.vue'
import BaseCard from './components/UI/BaseCard.vue'
import BaseButton from './components/UI/BaseButton.vue'

Vue.config.productionTip = false

new Vue({
  components: {
    BaseCard,
    BaseButton
  },
  render: h => h(App),
}).$mount('#app')
