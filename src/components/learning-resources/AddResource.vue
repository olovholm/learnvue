<template>
  <base-dialog v-if="inputIsInvalid" title="Invalid input">
    <template #default>
      <p>Unfortunately input is invalid</p>
      <p>Please check all input. They need to have at least one character</p>
    </template>
    <template #actions>
      <base-button @click="confirmError">
        Okay
      </base-button>
    </template>

  </base-dialog>
  <base-card>
    <form @submit.prevent="submitData">
      <div class="form-control">
        <label for="title">Title</label>
        <input type="text" id="title" name="title" ref="titleInput">
      </div>
      <div class="form-control">
        <label for="description">Description</label>
        <input type="text" id="description" name="description" rows="3" ref="descriptionInput">
      </div>
      <div class="form-control">
        <label for="link">Link</label>
        <input type="url" id="link" name="link" ref="linkInput">
      </div>
      <div>
        <base-button type="submit">Add Resource</base-button>
      </div>
    </form>
  </base-card>
</template>

<script>
import BaseCard from "../UI/BaseCard";
import BaseButton from "../UI/BaseButton";
import BaseDialog from "../UI/BaseDialog";

export default {
  name: "AddResource",
  inject: ['addResource'],
  components: {BaseDialog, BaseButton, BaseCard},
  methods: {
    submitData() {
      const enteredTitle = this.$refs.titleInput.value
      const enteredDescription = this.$refs.descriptionInput.value
      const enteredUrl = this.$refs.linkInput.value

      if(enteredTitle.trim() === '' || enteredDescription.trim() === '' || enteredUrl.trim() === ''){
        console.log("Field is empty")
        this.inputIsInvalid = true
        return
      }

      this.addResource(enteredTitle, enteredDescription, enteredUrl)
    },
    confirmError(){
      this.inputIsInvalid = false
    }
  },
  data() {
    return {
      inputIsInvalid: false
    };
  }
}
</script>

<style scoped>
label {
  font-weight: bold;
  display: block;
  margin-bottom: 0.5rem;
}

input,
textarea {
  display: block;
  width: 100%;
  font: inherit;
  padding: 0.15rem;
  border: 1px solid #ccc;
}

input:focus,
textarea:focus {
  outline: none;
  border-color: #3a0061;
  background-color: #f7ebff;
}

.form-control {
  margin: 1rem 0;
}

</style>