
<script setup>
import { ref } from 'vue'
import resume_data from '../data/resume-data.yaml'
const count = ref(0);

</script>

<template>
  <div class="about">
    <h1>{{ $t("About") }}</h1>

    <h2>Angaben gemäß § 5 TMG:</h2>

    <pre>
{{ resume_data.basics.name }}
{{ resume_data.basics.post_address.join('\n') }}
    </pre>

    <h2>Kontakt:</h2>

    <fa icon="fa-solid fa-envelope" />
    webmaster [at] gladis [punkt] org
  </div>
</template>

<style>
</style>
