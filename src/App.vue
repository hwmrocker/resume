<script setup>
import { ref } from 'vue'
import { RouterLink, RouterView } from 'vue-router'
import { useI18n } from "vue-i18n";
import resume_data from './data/resume-data.yaml'
import ThemeButton from "./components/ThemeButton.vue";
const { t, locale } = useI18n();
const params = new URLSearchParams(window.location.search);
const preset = resume_data.presets?.[params.get('preset')];
const lang = params.get('lang') || preset?.lang || (window.navigator.language || 'en').split('-')[0];
if (new Set(['de', 'en']).has(lang)) {
  locale.value = lang;
}
</script>

<template>
  <div class="locale-changer">
    <ThemeButton />
    <select v-model="$i18n.locale">
      <option v-for=" locale in $i18n.availableLocales" :key="`locale-${locale}`" :value="locale">{{ locale }}</option>
    </select>
  </div>
  <RouterView />

  <footer>
    <div class="wrapper">
      <nav>
        <RouterLink to="/">{{ $t("page.home") }}</RouterLink>
        <RouterLink to="/love">{{ $t("page.love") }}</RouterLink>
        <RouterLink to="/ideal-job">{{ $t("page.ideal-job") }}</RouterLink>
        <RouterLink to="/about">{{ $t("page.about") }}</RouterLink>
      </nav>
    </div>
  </footer>
</template>

<style scoped>
.locale-changer {
  float: right;
  display: flex;
  gap: 1rem;
  position: sticky;
  top: 0;
  z-index: 100;
}

header {
  line-height: 1.5;
  max-height: 100vh;
}

nav {
  width: 100%;
  font-size: 12px;
  text-align: center;
  margin-top: 2rem;
}

nav a.router-link-exact-active {
  color: var(--color-text);
}

nav a.router-link-exact-active:hover {
  background-color: transparent;
}

nav a {
  display: inline-block;
  padding: 0 1rem;
  border-left: 1px solid var(--color-border);
}

nav a:first-of-type {
  border: 0;
}

@media (min-width: 64rem) {
  header {
    display: flex;
    place-items: center;
    padding-right: calc(var(--section-gap) / 2);
  }

  .logo {
    margin: 0 2rem 0 0;
  }

  header .wrapper {
    display: flex;
    place-items: flex-start;
    flex-wrap: wrap;
  }

  nav {
    text-align: left;
    margin-left: -1rem;
    font-size: 1rem;
    padding: 1rem 0;
    margin-top: 1rem;
    display: flex;
    justify-content: center;
    text-align: center;
  }
}
</style>
