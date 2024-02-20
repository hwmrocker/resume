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

const params = new URLSearchParams(window.location.search);
const option_skills_to_hide = (params.get('hide_skills') || '').split(',');
const option_skills_to_show = (params.get('show_skills') || '').split(',');

const highlighted_tags = ref(Array.from([]));

for (const skill of resume_data.skills) {
    if (skill.hide_me) {
        continue;
    }
    if (skill.groups.includes("hero")) {
        highlighted_tags.value.push(skill.name);
    }
};
for (const skill_to_hide of option_skills_to_hide) {
    highlighted_tags.value.splice(highlighted_tags.value.indexOf(skill_to_hide), 1);
}
for (const skill_to_show of option_skills_to_show) {
    highlighted_tags.value.push(skill_to_show);
}
const tags = new Set();
for (const skill of resume_data.skills) {
    if (skill.hide_me) {
        continue;
    }
    tags.add(skill.name);
};

const tag_names = ref(Array.from(tags).sort());

const hero_skills = computed(() => {
    const hskills = [];
    for (const skill of resume_data.skills) {
        if (skill.hide_me) {
            continue;
        }
        if (highlighted_tags.value.includes(skill.name)) {
            hskills.push(skill);
        }
    }
    return hskills;
});

const show_all_experiences = ref(false);

const experiences = computed(() => {
    const return_value = [];
    for (const experience of resume_data.experience) {
        if (show_all_experiences.value === false && experience.hide_me) {
            continue;
        }
        return_value.push(experience);
    }
    return return_value;
});

const show_all_education = ref(false);

const educations = computed(() => {
    const return_value = [];
    for (const school of resume_data.education) {
        if (show_all_education.value === false && school.hide_me) {
            continue;
        }
        return_value.push(school);
    }
    return return_value;
});

const emit = defineEmits(["click-tag"]);
function toggle_tag(name) {
    console.log(highlighted_tags.value, name)
    if (highlighted_tags.value.includes(name)) {
        highlighted_tags.value.splice(highlighted_tags.value.indexOf(name), 1);
    } else {
        highlighted_tags.value.push(name);
    }
}
function tag_is_filtered(name) {
    return highlighted_tags.value.includes(name);
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
        <h1 class="main">Resume</h1>
        <section>
            <Hero />
        </section>
        <section>
            <h2>Skills</h2>
            <div class="hero-skills">
                <skill v-for="skill in hero_skills" :key="skill.name" :name="skill.name" :level="skill.level"
                    :periods="skill.periods" :logo="skill.logo" />

            </div>
            <div class="skills">
                <Tag v-for="tag in tag_names" :key="tag" :name="tag" :filtered="tag_is_filtered(tag)"
                    @click-tag="toggle_tag" />
            </div>
        </section>
        <section>

            <h2>Hands on Experience</h2>
            <ul>
                <li>
                    <button @click="show_all_experiences = !show_all_experiences">
                        {{ show_all_experiences ? "Hide" : "Show" }} all experiences
                    </button>
                </li>
                <Job v-for="job in experiences" :id="job.uid" :company="job.company" :company_url="job.url"
                    :title="job.what_de" :description="job.description_de" :start_date="job.start_date"
                    :end_date="job.end_date" :locations="job.locations" :tags="job.technology" />
            </ul>
        </section>
        <section>
            <h2>Education</h2>
            <ul>
                <li>
                    <button @click="show_all_education = !show_all_education">
                        {{ show_all_education ? "Hide" : "Show" }} all education
                    </button>
                </li>
                <Edu v-for="school in educations" :id="school.uid" :name="school.company" :degree="school.degree"
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
h1.main {
    text-align: center;
    font-size: 4em;
}

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
    padding: 1em;
}

div.skills::after {
    content: "";
    flex: auto;
}
</style>
