<script setup>
import resume_data from '../data/resume-data.yaml'
import Job from '../components/Job.vue'
import Edu from '../components/Edu.vue'
import Tag from '../components/Tag.vue'
import Skill from '../components/Skill.vue'
import Hero from '../components/Hero.vue'
import Ideal from '../components/Ideal.vue'
import { ref, computed, onMounted } from 'vue'
import { useI18n } from "vue-i18n";
const { t, locale } = useI18n();

// import Timeline from 'd3-timeline'

const params = new URLSearchParams(window.location.search);
const preset = resume_data.presets?.[params.get('preset')];
const option_skills_to_hide = (params.get('hide_skills') || '').split(',');
if (preset?.skills_to_hide) {
    option_skills_to_hide.push(...preset.skills_to_hide);
}
const option_skills_to_show = (params.get('show_skills') || '').split(',');
if (preset?.skills_to_show) {
    option_skills_to_show.push(...preset.skills_to_show);
}

const show_all_experiences = ref(preset?.show_all_exp || false);
const show_all_education = ref(preset?.show_all_edu || false);

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

function get_t(job, what) {
    // what can be "description" or "what"
    return job[what + "_" + locale.value] || job[what + "_en"];
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

            <h2 v-if="show_all_experiences">{{ $t("exp.all") }}</h2>
            <h2 v-else>{{ $t("exp.selection") }}</h2>
            <ul>
                <li>
                    <button @click="show_all_experiences = !show_all_experiences">
                        {{ show_all_experiences ? $t("exp.show_selection") : $t("exp.show_all") }}
                    </button>
                </li>
                <Job v-for="job in experiences" :id="job.uid" :company="job.company" :company_url="job.url"
                    :title="get_t(job, 'what')" :description="get_t(job, 'description')" :start_date="job.start_date"
                    :end_date="job.end_date" :locations="job.locations" :tags="job.technology" />
            </ul>
        </section>
        <section>
            <h2 v-if="show_all_education">{{ $t("edu.all") }}</h2>
            <h2 v-else>{{ $t("edu.selection") }}</h2>
            <ul>
                <li>
                    <button @click="show_all_education = !show_all_education">
                        {{ show_all_education ? $t("edu.show_selection") : $t("edu.show_all") }}
                    </button>
                </li>
                <Edu v-for="school in educations" :id="school.uid" :name="school.company" :degree="school.degree"
                    :start_date="school.start_date" :end_date="school.end_date" :tags="school.technology" :url="school.url"
                    :type="get_t(school, 'what')" :locations="school.locations" />
            </ul>
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
    justify-content: center;
    text-align: center;
}

/* div.hero-skills::after {
    content: "";
    flex: auto;
} */

div.skills {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    text-align: center;
    padding: 1em;
}

/* div.skills::after {
    content: "";
    flex: auto;
} */

li {
    list-style-type: none;
    padding-bottom: 1em;
    display: flex;
    flex-direction: column;
}

span {

    &.date {
        font-weight: bold;
        font-size: 15px;
        color: #818181;
    }

    &.location {
        font-size: 0.8em;
        color: #818181;

        a {
            color: #515151;
        }
    }

    &.comma {
        padding-right: 0.5em;
    }

}
</style>
