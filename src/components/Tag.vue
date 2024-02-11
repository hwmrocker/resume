<script setup>
import { ref } from "vue";
const props = defineProps(
    {
        name: { type: String, required: true },
        filtered: { type: Boolean, required: false, default: false }
    }
);
const emit = defineEmits(["click-tag"])

const handleClickTag = (tag) => {
    console.log("Clicked tag:", tag);
    emit('click-tag', tag);
}
</script>


<template>
    <span class="tag" :class="{ filtered: filtered }" @click="handleClickTag(name)">{{ name }}</span>
</template>

<style>
span.tag {
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

span.filtered {
    background-color: rgb(114, 112, 112);
    color: #fff;
}
</style>
