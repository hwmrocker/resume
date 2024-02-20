<script setup>
import { ref } from 'vue';

const name = ref('Olaf Gladis');
const interests = ref(['Dad', 'FOSS', 'Python']);
const params = new URLSearchParams(window.location.search);
const email = ref(params.get('email') || 'jobs');
</script>

<template>
    <div class="hero">
        <div class="col">
            <img src="https://gravatar.com/avatar/e03f1979511d1bb67b796379ff285735?s=200" alt="Profile Picture"
                class="profile-picture" />
            <h1>{{ name }}</h1>
            <p>Email: <a :href="'mailto:' + email + '@gladis.org'">{{ email }}@gladis.org</a></p>

            <div class="social-media">
                <a href="https://www.linkedin.com/in/olaf-gladis-8996241b6/" target="_blank"
                    rel="noopener noreferrer">LinkedIn</a>
                <a href="https://github.com/hwmrocker/" target="_blank" rel="noopener noreferrer">GitHub</a>
            </div>
        </div>
        <div class="col">
            <h2>What I love</h2>

            <p>I love being a father. Work/life balance is very important to me, so I prefer to work remotely. This way I am
                very flexible and can pick up my kids from school and take them to their hobbies.
            </p>
            <p>
                I am a big fan of Free and Open Source Software (FOSS). It started in 2002 when I installed Linux for the
                first time. Shortly after that, in 2005, I switched completely to Linux as my main operating system.
            </p>
            <p>
                I also love to code. My favorite is Python. It is amazing how little you have to write to express what needs
                to be done. Since 2016 I attend the Python User Group in my city. I enjoy learning new things and sharing my
                knowledge with others, mentoring them and seeing them grow. I also enjoyed my time as a Python knowledge
                lead / expert at trivago, where I founded and hosted the internal Python guild. I also organized trainings
                and workshops for my colleagues and worked with local groups to organize meetups, hackathons and sprints.
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
    border: 7px solid #000;
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
