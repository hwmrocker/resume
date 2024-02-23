<script setup>
import Tag from "./Tag.vue"

const props = defineProps(
    {
        id: {
            type: String,
            required: true
        },
        company: {
            type: String,
            required: true
        },
        company_url: {
            type: String,
            required: false
        },
        title: {
            type: String,
            required: true
        },
        description: {
            type: String,
            required: true
        },
        start_date: {
            type: Date,
            required: true
        },
        end_date: {
            type: Date,
            required: false,
            default: () => null
        },
        locations: {
            type: Array,
            required: false,
            default: () => []
        },
        tags: {
            type: Array,
            required: false,
            default: () => []
        }
    }
);

function format_date(date) {
    if (date === undefined || date === null) {
        return "now";
    }
    const options = { year: 'numeric', month: 'long' };
    return new Date(date).toLocaleDateString(undefined, options);
}
</script>

<template>
    <li :id="`frame_${id}`" class="">
        <span class="date">{{ format_date(start_date) }} - {{ format_date(end_date) }} <span class="degree"></span></span>
        <div>
            <span class="jobtitle">{{ title }}</span> at
            <span class="company"><a :href="company_url">{{ company }}</a></span><span v-if="locations.length > 0"
                class="comma">,</span>

            <span v-for="(location, index) in locations" :key="location" class="location">
                <a :href="location.osm_link">{{ location.name }}</a>
                <template v-if="index !== locations.length - 1"> | </template>
            </span>
        </div>
        <p class="description">{{ description }}</p>
        <div v-if="tags.length > 0" class="tech-tags">
            <Tag v-for="tag in tags" :key="tag" :name="tag" />
        </div>
    </li>
</template>

