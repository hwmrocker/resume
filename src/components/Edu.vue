<script setup>
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
        return "now";
    }
    const options = { year: 'numeric', month: 'long' };
    return new Date(date).toLocaleDateString(undefined, options);
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

<style scoped>
li {
    list-style-type: none;
    padding: 1em;
    transition: all 1s linear;
    display: flex;
    flex-direction: column;
}

span {

    &.date {
        font-weight: bold;
        /* display: block; */
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

    &.tag {
        background-color: #222121;
        color: #fff;
        font-size: 0.8em;
        padding: 0.1em;
        padding-right: 0.5em;
        padding-left: 0.5em;
        margin: 0.1em;
        border-radius: 5px;
        display: inline-block;
    }
}
</style>
