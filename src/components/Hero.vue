<script setup>
import { ref } from 'vue';
import resume_data from '../data/resume-data.yaml';
const name = 'Olaf Gladis';
const params = new URLSearchParams(window.location.search);
const preset = resume_data.presets?.[params.get('preset')];
const email = preset?.email || params.get('email');
</script>

<template>
    <div class="hero">
        <div class="col">
            <img src="https://gravatar.com/avatar/e03f1979511d1bb67b796379ff285735?s=200" alt="Profile Picture"
                class="profile-picture" />
        </div>
        <div class="col">

            <h1>{{ name }}</h1>
            <p v-if="email">Email: <a :href="'mailto:' + email + '@gladis.org'">{{ email }}@gladis.org</a></p>

            <div class="social-media">
                <a href="https://www.linkedin.com/in/olaf-gladis-8996241b6/" target="_blank"
                    rel="noopener noreferrer">LinkedIn</a>
                <a href="https://github.com/hwmrocker/" target="_blank" rel="noopener noreferrer">GitHub</a>
            </div>
        </div>

    </div>
</template>


<style scoped>
.hero {
    text-align: center;
    display: flex;
}

.profile-picture {
    width: 200px;
    height: 200px;
    border-radius: 50%;
    border: 7px solid var(--color-border);
    object-fit: cover;
    margin-bottom: 20px;
}

ul {
    list-style-type: none;
    padding: 0;
}

.col {
    flex: 1;
    padding: 0 20px;
    align-self: center;
}

.social-media {
    margin-top: 20px;

    a {
        margin-right: 10px;
    }
}

p {
    margin-bottom: 1.5em;
}
</style>
