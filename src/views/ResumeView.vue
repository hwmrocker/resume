<script setup>
import resume_data from '../data/resume-data.yaml'
import Job from '../components/Job.vue'
import Edu from '../components/Edu.vue'
import Tag from '../components/Tag.vue'
import Skill from '../components/Skill.vue'
import Hero from '../components/Hero.vue'
import Ideal from '../components/Ideal.vue'
import { ref, computed, onMounted } from 'vue'
// import Timeline from 'd3-timeline'

const filtered_tags = ref(Array.from([]));
const tag_names = computed(() => {
    const tags = new Set();
    for (const skill of resume_data.skills) {
        if (skill.hide_me) {
            continue;
        }
        tags.add(skill.name);
        if (skill.groups.includes("hero")) {
            filtered_tags.value.push(skill.name);
        }
    };
    return Array.from(tags).sort();
});

const hero_skills = computed(() => {
    const hskills = [];
    for (const skill of resume_data.skills) {
        if (skill.hide_me) {
            continue;
        }
        if (filtered_tags.value.includes(skill.name)) {
            hskills.push(skill);
        }
    }
    return hskills;
});
const emit = defineEmits(["click-tag"]);
function toggle_tag(name) {
    console.log(filtered_tags.value, name)
    if (filtered_tags.value.includes(name)) {
        filtered_tags.value.splice(filtered_tags.value.indexOf(name), 1);
    } else {
        filtered_tags.value.push(name);
    }
}
function is_filtered(name) {
    return filtered_tags.value.includes(name);
}

onMounted(() => {
    drawTimeline();
});

function drawTimeline() {
    // const t = Timeline();
}
</script>

<template>
    <main>
        <h1>Resume</h1>
        <section>
            <h2>About Me</h2>
            <Hero />
        </section>
        <section>
            <h2>Skills</h2>
            <div class="hero-skills">
                <skill v-for="skill in hero_skills" :key="skill.name" :name="skill.name" :level="skill.level"
                    :periods="skill.periods" :logo="skill.logo" />

            </div>
            <div class="skills">
                <Tag v-for="tag in tag_names" :key="tag" :name="tag" :filtered="is_filtered(tag)" @click-tag="toggle_tag" />
            </div>
        </section>
        <section>

            <h2>Hands on Experience</h2>
            <ul>
                <Job v-for="job in resume_data.experience" :id="job.uid" :company="job.company" :company_url="job.url"
                    :title="job.what_de" :description="job.description_de" :start_date="job.start_date"
                    :end_date="job.end_date" :locations="job.locations" :tags="job.technology" />
            </ul>
        </section>
        <section>
            <h2>Education</h2>
            <ul>
                <Edu v-for="school in resume_data.education" :id="school.uid" :name="school.company" :degree="school.degree"
                    :start_date="school.start_date" :end_date="school.end_date" :tags="school.technology" :url="school.url"
                    :type="school.what_en" :locations="school.locations" />
            </ul>
        </section>
        <section>
            <Ideal />
        </section>
    </main>
</template>

<style>
ul {
    margin-left: 0;
    padding: 0;
}

div.hero-skills {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-evenly;
    text-align: center;
}

div.hero-skills::after {
    content: "";
    flex: auto;
}

div.skills {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-evenly;
    text-align: center;
}

div.skills::after {
    content: "";
    flex: auto;
}
</style>
