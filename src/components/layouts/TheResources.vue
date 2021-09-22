<template>
  <div>
    <base-card>
      <base-button @click="setSelectedTab('stored-resources')" :mode="storedResButtonMode">Stored Resources
      </base-button>
      <base-button @click="setSelectedTab('add-resource')" :mode="addResButtonMode">Add Resource</base-button>
    </base-card>
    <keep-alive>
      <component :is="selectedTab"></component>
    </keep-alive>
  </div>
</template>
<script>
import AddResource from "../learning-resources/AddResource";
import StoredResources from "../learning-resources/StoredResources";

export default {
  components: {
    StoredResources,
    AddResource
  },
  computed: {
    storedResButtonMode() {
      return this.selectedTab === 'stored-resources' ? null : 'flat'
    },
    addResButtonMode() {
      return this.selectedTab === 'add-resource' ? null : 'flat'
    },

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
          id: 'pepes',
          title: 'Pepes toy store',
          description: 'Chew on that',
          link: 'http://pepestoystore.com'
        },
        {
          id: 'mako',
          title: 'Macovei magic',
          description: 'Dice, empire and black magic',
          link: 'http://makotaco.com'
        }
      ]
    }
  },
  provide() {
    return {
      resources: this.storedResources,
      addResource: this.addResource,
      deleteResource: this.removeResource
    }
  },
  methods: {
    setSelectedTab(tab) {
      this.selectedTab = tab
    },
    addResource(title, description, url) {
      const newResource = {
        id: new Date().toISOString(),
        title: title,
        description: description,
        link: url
      }
      this.storedResources.unshift(newResource)
      this.selectedTab = 'stored-resources'
    },
    removeResource(resId) {
      const resIndex = this.storedResources.findIndex(res => res.id === resId)
      this.storedResources.splice(resIndex,1)
      console.log("deleting resource" + resId)
    }
  }
}
</script>