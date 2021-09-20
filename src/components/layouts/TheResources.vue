<template>
  <div>
  <base-card>
    <base-button @click="setSelectedTab('stored-resources')" :mode="storedResButtonMode">Stored Resources</base-button>
    <base-button @click="setSelectedTab('add-resource')" :mode="addResButtonMode">Add Resource</base-button>
  </base-card>
    <component :is="selectedTab"></component>
  </div>
</template>
<script>
import StoredResources from "@/components/learning-resources/StoredResources";
import AddResources from "@/components/learning-resources/AddResources";
import BaseButton from "@/components/UI/BaseButton";
import BaseCard from '@/components/UI/BaseCard'

export default {
  components: {
    StoredResources,
    AddResources,
    BaseButton,
    BaseCard
  },
  computed: {
    storedResButtonMode() {
      return this.selectedTab === 'stored-resources' ? null : 'flat'
    },
    addResButtonMode() {
      return this.selectedTab === 'add-resource' ? null : 'flat'
    }
  },
  data() {
    return {
      selectedTab: 'stored-resources',
      storedResources: [
        {
          id: 'offical-guide',
          title: 'Official Guide',
          description: 'A very good official documentation',
          link: 'http://vuejs.org'
        },
        {
          id: 'google',
          title: 'Google',
          description: 'Google.com',
          link: 'http://google.com'
        },
        {
          id: 'Froogle',
          title: 'Froogle',
          description: 'Froogle.com',
          link: 'http://Froogle.com'
        }
      ]
    }
  },
  provide() {
    return {
      resources: this.storedResources
    }
  },
  methods: {
    setSelectedTab(tab) {
      this.selectedTab = tab
    }
  }
}
</script>