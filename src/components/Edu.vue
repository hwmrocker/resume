<script setup>
import { useI18n } from "vue-i18n";
const { t, d, locale } = useI18n(

);
const props = defineProps(
    {
        id: {
            type: String,
            required: true
        },
        name: {
            type: String,
            required: true
        },
        url: {
            type: String,
            required: false
        },
        degree: {
            type: String,
            required: false,
            default: () => null
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
        },
        type: {
            type: String,
            required: true
        }

    }
);

function format_date(date) {
    if (date === undefined || date === null) {
        return t("common.now");
    }
    const options = { year: 'numeric', month: 'long' };
    return d(new Date(date), 'custom');
}
</script>

<template>
    <li :id="`frame_${id}`" class="">
        <span class="date">{{ format_date(start_date) }} - {{ format_date(end_date) }}</span>
        <span v-if="degree" class="degree">{{ degree }}</span>

        <div>
            <span class="school"><a :href="url">{{ name }}</a></span><span v-if="locations.length > 0"
                class="comma">,</span>

            <span v-for="(location, index) in locations" :key="location" class="location">
                <a :href="location.osm_link">{{ location.name }}</a>
                <template v-if="index !== locations.length - 1"> | </template>
            </span>
        </div>
        <div v-if="tags.length > 0" class="tech-tags">
            <span v-for="tag in tags" :key="tag" class="tag">{{ tag }}</span>
        </div>
    </li>
</template>

