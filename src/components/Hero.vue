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
            <h1>{{ name }}</h1>
            <p v-if="email">Email: <a :href="'mailto:' + email + '@gladis.org'">{{ email }}@gladis.org</a></p>

            <div class="social-media">
                <a href="https://www.linkedin.com/in/olaf-gladis-8996241b6/" target="_blank"
                    rel="noopener noreferrer">LinkedIn</a>
                <a href="https://github.com/hwmrocker/" target="_blank" rel="noopener noreferrer">GitHub</a>
            </div>
        </div>
        <div class="col">
            <h2>What I love</h2>
            <p>
                My life finds its rhythm in two passions: being a dedicated father and the captivating world of code. While
                family always comes first, I've discovered a fulfilling balance that allows me to excel in both areas.
                Remote work grants me the flexibility to be present for my children, actively involved in their lives, while
                simultaneously pursuing my professional ambitions. This harmonious approach translates into unwavering
                dedication and a proven track record of exceeding expectations.
            </p>
            <p>
                Beyond the realm of fatherhood, my heart beats for open-source software and the elegance of Python. Since
                venturing into the world of Linux in 2002, I've become a staunch advocate for FOSS, actively contributing to
                user groups, organizing meetups, and fostering a vibrant community of collaboration. This fervor extends to
                Python, where its expressiveness allows me to craft code with minimal fuss and maximum impact. Joining the
                local Python User Group in 2016 ignited a journey of continuous learning, knowledge sharing, and mentoring
                others. At trivago, I spearheaded the internal Python guild, conducted trainings, and collaborated with
                local communities on events – witnessing their growth fueled immense satisfaction.
            </p>
            <p>
                My passion extends beyond technical skills. I believe in fostering vibrant communities, empowering others
                through mentorship, and actively sharing knowledge. If you share these values and seek someone who thrives
                in a collaborative environment, let's connect!
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
