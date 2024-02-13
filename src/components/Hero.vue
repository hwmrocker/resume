<script setup>
import { ref } from 'vue';

const name = ref('Olaf Gladis');
const interests = ref(['Dad', 'FOSS', 'Python']);
const email = ref('jobs');
</script>

<template>
    <div class="hero">
        <div class="col">
            <img src="https://gravatar.com/avatar/e03f1979511d1bb67b796379ff285735?s=200" alt="Profile Picture"
                class="profile-picture" />
            <h1>{{ name }}</h1>
            <p>Email: <a :href="'mailto:' + email + '@gladis.org'">{{ email }}@gladis.org</a></p>

            <div class="social-media">
                <a href="https://linkedin.com" target="_blank" rel="noopener noreferrer">LinkedIn</a>
                <a href="https://github.com" target="_blank" rel="noopener noreferrer">GitHub</a>
            </div>
        </div>
        <div class="col">
            <h2>What I love</h2>
            <p>
                I love beeing a dad. Work life balance is very important to me, that is why I prefer to work remote.
                This way I am very flexible and can pick up my kids from school and bring them to their hobbies.
            </p>
            <p>
                I am a big fan of Free and Open Source Software (FOSS). It startet in 2002 when I first installed Linux.
                Shortly after that, in 2005, I completely switched to Linux as my main operating system.
            </p>
            <p>
                I also love to code. My favorite programming language is Python. It is awesome how little you have to
                write to express what needs to be done. Since 2016 I am attending the Python User Group in my city.
                I enjoy to learn new things and to share my knowledge with others, mentor them and see them grow.
            </p>

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
    object-fit: cover;
    margin-bottom: 20px;
}

ul {
    list-style-type: none;
    padding: 0;
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
