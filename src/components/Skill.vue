<script setup>
import { computed } from 'vue';
import {
    IconAnsible, IconVisualbasic, IconC, IconCplusplus, IconSass, IconStylus,
    IconLinux, IconPython, IconAmazonwebservicesWordmark, IconCoffeescriptWordmark,
    IconVault, IconNomad, IconConsul, IconTerraform,
    IconFastapi, IconMysql, IconPostgresql, IconApachekafka, IconHtml5Wordmark,
    IconGooglecloud, IconApacheairflow, IconKubernetes, IconPhp, IconJava,
    IconJenkins, IconPerl, IconJavascript, IconGithubactions, IconDjangorest,
    IconDocker,

} from '@iconify-prerendered/vue-devicon'

const props = defineProps({
    name: {
        type: String,
        required: true
    },
    level: {
        type: String,
        required: true
    },
    periods: {
        type: Array,
        required: true
    },
    logo: {
        type: String,
        required: false,
        default: () => null
    }
});


const experience_years = computed(() => {
    let totalDiffTime = 0;
    for (const period of props.periods) {
        const startDate = new Date(period.start_date);
        const endDate = period.end_date ? new Date(period.end_date) : new Date();
        const diffTime = Math.abs(endDate - startDate);
        totalDiffTime += diffTime;
    }
    const diffYears = Math.floor(totalDiffTime / (1000 * 60 * 60 * 24 * 365));
    return diffYears;
});
</script>

<template>
    <div class="skill">
        <svg viewBox="0 0 128 128" width="100px" height="100px" v-if="name === 'Django'">
            <path fill="#092e20"
                d="M59.448 0h20.93v96.88c-10.737 2.04-18.62 2.855-27.181 2.855-25.551-.001-38.87-11.551-38.87-33.705 0-21.338 14.135-35.2 36.015-35.2 3.398 0 5.98.272 9.106 1.087zm0 48.765c-2.446-.815-4.485-1.086-7.067-1.086-10.6 0-16.717 6.523-16.717 17.939 0 11.145 5.845 17.26 16.582 17.26 2.309 0 4.212-.136 7.202-.542z">
            </path>
            <path fill="#092e20"
                d="M113.672 32.321V80.84c0 16.717-1.224 24.735-4.893 31.666-3.398 6.661-7.883 10.873-17.124 15.494l-19.435-9.241c9.242-4.35 13.726-8.153 16.58-14 2.99-5.979 3.943-12.91 3.943-31.122V32.321zM92.742.111h20.93v21.474h-20.93z">
            </path>
        </svg>

        <svg viewBox="0 0 128 128" v-else-if="name === 'Gulp'">
            <path fill-rule="evenodd" clip-rule="evenodd" fill="#EB4A4B"
                d="M36.965 35.459c.877 9.232 1.747 18.412 2.637 27.798 1.451-2.495 2.501-4.888 4.085-6.848 1.475-1.826 3.334-3.511 5.357-4.678 2.641-1.524 6.104-.089 6.96 2.614.23.725-.319 1.697-.511 2.556-.646-.341-1.479-.529-1.901-1.051-1.793-2.217-2.873-2.479-4.856-.563-3.699 3.576-5.779 8.056-6.573 13.091-.153.974.456 2.067.713 3.105 1.011-.348 2.185-.476 3.002-1.084 2.656-1.977 4.302-4.666 5.21-7.88.197-.696 1.265-1.145 1.933-1.708.32.658 1.05 1.433.897 1.954a373.814 373.814 0 01-4.536 14.429c-.162.484-1.051.725-1.604 1.079-.223-.636-.692-1.302-.617-1.901.168-1.358.605-2.683.91-3.927l-7.24 3.333c.405 4.622.825 9.807 1.323 14.985.382 3.954 1.029 4.978 4.923 5.728 4.544.875 9.173 1.434 13.792 1.774a60.391 60.391 0 0020.23-1.904c2.472-.664 3.458-2.29 3.635-4.717.162-2.235.524-4.456.775-6.685.493-4.391.972-8.783 1.476-13.358-1.667 1.056-2.978 2.238-4.511 2.739-1.116.365-2.524-.169-3.803-.303.245-1.174.23-2.497.796-3.487.922-1.618 2.224-3.021 3.364-4.515l-.491-.591c-.817.483-1.832.8-2.413 1.485-1.182 1.394-2.339 2.886-3.13 4.52-1.324 2.735-2.333 5.622-3.518 8.426-.515 1.216-.959 3.076-2.684 2.366-1.845-.761-.547-2.386-.114-3.542.689-1.844 1.599-3.606 2.215-4.962-1.746.208-3.516.459-5.294.614-.752.064-1.646-.348-2.261-.07-2.045.924-3.341.553-3.766-1.711-.947.615-1.749 1.448-2.694 1.672-1.147.273-2.703.452-3.543-.121-.673-.459-.918-2.184-.688-3.196.457-2.012 1.311-3.946 2.122-5.859.502-1.185 1.007-3.077 2.701-2.253 1.674.813.154 2.185-.232 3.286-.599 1.702-1.209 3.401-1.813 5.101l.96.58c.914-.794 2.053-1.441 2.693-2.415 1.048-1.592 1.681-3.452 2.673-5.086.411-.677 1.296-1.065 1.967-1.584.136.862.462 1.748.354 2.58-.107.841-.698 1.61-.981 2.442-.425 1.246-.768 2.52-1.2 3.969 2.043.078 2.918-.782 3.495-2.299 1.826-4.793 3.672-9.581 5.679-14.3.343-.808 1.509-1.264 2.296-1.884.091.974.525 2.078.216 2.899-1.645 4.349-3.492 8.62-5.228 12.935-.293.727-.387 1.534-.572 2.304 3.059-1.375 5.612-2.895 6.544-6.146.228-.79 1.162-1.377 1.771-2.058l1.416 1.5c.43-.362.824-.774 1.291-1.075 1.47-.947 3.053-1.782 4.603-.315 1.604 1.517.39 2.995-.448 4.307-.912 1.431-2.029 2.73-3.057 4.086 2.312-1.49 5.469-2.158 5.889-5.378 1.024-7.865 1.924-15.746 2.837-23.625.271-2.332.416-4.679.627-7.109-18.21 4.409-36.029 4.436-54.088-.069zm7.816 61.369c.877 2.317 2.209 4.593 2.558 7.011.737 5.147.924 10.372 1.446 15.554.076.755.565 1.792 1.175 2.124 8.98 4.88 18.047 5.726 27.209.389 1.367-.796 1.62-1.847 1.797-3.325.857-7.181-1.051-14.798 3.54-21.56-12.856 3.189-25.403 3.288-37.725-.193zm30.991-60.08c4.362-.421 8.671-1.445 12.985-2.291.813-.159 1.535-.778 2.299-1.185-1.007-.885-1.878-1.311-2.788-1.418-4.53-.535-9.076-.947-13.603-1.508-.684-.085-1.905-.929-1.854-1.083 1.321-3.98 1.256-8.485 4.254-11.839 3.789-4.24 7.617-8.443 11.416-12.648-2.826-3.04-2.864-3.044-5.425-.383-1.448 1.504-2.771 3.15-4.342 4.512-5.813 5.038-9.896 11.005-10.692 18.872-.183 1.805-1.174 2.457-3.069 2.485-6.256.091-12.519.263-18.761.674-3.093.203-6.148.997-9.221 1.523l-.028 1.149c1.923.593 3.809 1.372 5.773 1.749 10.944 2.098 21.991 2.458 33.056 1.391zM72.276 34c-2.477 2-4.524 2-6.501 0h6.501z">
            </path>
        </svg>
        <svg viewBox="0 0 100 100" v-else-if="name === 'Websocket'">
            <circle cx="50" cy="50" r="45" fill-opacity="0" stroke="#3c790a" stroke-width="10" />
            <path fill="#3c790a"
                d="M 66.23 62.237 L 74.235 62.237 L 74.235 43.019 L 65.218 34.002 L 59.557 39.661 L 66.23 46.334 L 66.23 62.237 Z M 74.254 66.249 L 62.597 66.249 L 46.336 66.249 L 39.662 59.577 L 42.492 56.746 L 48.005 62.259 L 59.345 62.259 L 48.173 51.066 L 51.024 48.215 L 62.196 59.387 L 62.196 48.046 L 56.706 42.556 L 59.514 39.747 L 45.639 25.808 L 31.954 25.808 L 31.954 25.808 L 17.763 25.808 L 25.746 33.791 L 25.746 33.812 L 25.788 33.812 L 42.304 33.812 L 48.153 39.661 L 39.599 48.215 L 33.751 42.365 L 33.751 37.825 L 25.746 37.825 L 25.746 45.68 L 39.599 59.535 L 33.961 65.174 L 42.978 74.192 L 56.662 74.192 L 82.238 74.192 L 82.238 74.192 L 74.254 66.249 Z" />
        </svg>
        <svg xml:space="preserve" width="100" height="100" viewBox="0 0 26.458 26.458" v-else-if="name === 'Faust'">
            <path fill="#21ce99"
                d="M.017 8.075c-.042-.11.07-1.13.18-1.635A8.097 8.097 0 0 1 2.29 2.518C3.508 1.25 4.855.505 6.64.11c.456-.1.464-.1 10.112-.116 6.657-.01 9.672.001 9.706.035.063.064-7.803 7.952-8.028 8.05-.129.056-1.555.067-9.269.067-8.041 0-9.12-.009-9.144-.071z" />
            <path
                d="M.032 26.436C.014 26.419 0 24.176 0 21.45c0-4.138.01-4.979.066-5.106.039-.088 1.32-1.403 3.026-3.104 2.515-2.507 2.989-2.959 3.15-3.004.138-.039 2.237-.05 7.641-.04 7.272.014 7.452.017 7.47.104.012.067-1.013 1.121-3.916 4.026-2.163 2.165-3.99 3.967-4.061 4.004-.106.057-.533.068-2.516.069-1.412 0-2.455.019-2.553.046-.132.037-1.002.883-4.154 4.035-2.192 2.193-4.01 3.988-4.038 3.988a.135.135 0 0 1-.083-.032z" />
        </svg>
        <svg width="100px" height="100px" viewBox="0 0 256 204" preserveAspectRatio="xMidYMid"
            v-else-if="name === 'Serverless'">
            <g>
                <path
                    d="M0,161.20187 L45.311538,161.20187 L31.2732757,203.597885 L0,203.597885 L0,161.20187 Z M0,80.6009425 L72.0009468,80.6009425 L57.9640432,122.996956 L0,122.996956 L0,80.6009425 Z M0,1.47413815e-05 L98.6917145,1.47413815e-05 L84.6520934,42.39467 L0,42.39467 L0,1.47413815e-05 Z M143.348822,1.47413815e-05 L256,1.47413815e-05 L256,42.39467 L129.311918,42.39467 L143.348822,1.47413815e-05 Z M116.660364,80.6009425 L255.999593,80.6009425 L255.999593,122.996956 L102.622101,122.996956 L116.660364,80.6009425 Z M89.9706833,161.20187 L255.999321,161.20187 L255.999321,203.597885 L75.9337796,203.597885 L89.9706833,161.20187 Z"
                    fill="#F26D61" fill-rule="nonzero"></path>
            </g>
        </svg>
        <svg viewBox="0 0 103.454 144.01" v-else-if="name === 'Apache Beam'">
            <defs>
                <linearGradient id="linear-gradient" x1=".58" y1="71.963" x2="36.388" y2="71.963"
                    gradientUnits="userSpaceOnUse">
                    <stop offset="0" stop-color="#ffc400" />
                    <stop offset=".137" stop-color="#fecd00" />
                    <stop offset=".365" stop-color="#fed400" />
                    <stop offset="1" stop-color="#fed600" />
                </linearGradient>
                <linearGradient id="linear-gradient-2" x1=".58" y1="59.873" x2="75.05" y2="59.873"
                    gradientUnits="userSpaceOnUse">
                    <stop offset="0" stop-color="#ff0" stop-opacity=".7" />
                    <stop offset=".132" stop-color="#fff600" stop-opacity=".66" />
                    <stop offset=".314" stop-color="#feef00" stop-opacity=".626" />
                    <stop offset=".547" stop-color="#feea00" stop-opacity=".606" />
                    <stop offset="1" stop-color="#fee900" stop-opacity=".6" />
                </linearGradient>

            </defs>
            <path fill="#fee900" d="m.58 49.532 35.808 22.473L75.05 47.741V28.795L.58 5.452v44.08z" />
            <path fill="#ffc400" d="M.58 5.452v89.025l74.47-46.736V28.795L.58 5.452z" />
            <path style="opacity:.75;fill:url(#linear-gradient)" d="M.58 50.083v44.353l35.808-22.473L.58 49.491v.592z" />
            <path fill="#ffc400" d="M.58 49.532V138.111l74.47-22.896V96.268L.58 49.532z" />
            <path fill="#ffe082"
                d="M.25 101.665v8.11l74.8 6.66v-21.43l-74.8 6.66zM0 34.463v8.11l74.703 6.66v-21.43L0 34.463z" />
            <path fill="#fee900" d="m.58 5.452 74.47 23.343L.58 5.452z" />
            <path style="fill:url(#linear-gradient-2)" d="M36.388 72.005 75.05 47.741 36.388 72.005z" />
            <path fill="#fff"
                d="M114.625 606.246a8.508 8.508 0 0 0 8.508 8.508v-17.016a8.508 8.508 0 0 0-8.508 8.508ZM114.625 539.044a8.508 8.508 0 0 0 8.508 8.508v-17.016a8.508 8.508 0 0 0-8.508 8.508Z"
                transform="translate(-48.083 -500.526)" />
            <path
                d="M149.858 591.567A31.952 31.952 0 0 0 145.37 582a30.165 30.165 0 0 0-7.595-7.546 34.292 34.292 0 0 0-10.8-4.882q10.257-4.34 15.584-12.23a31.009 31.009 0 0 0 5.326-17.755 41.114 41.114 0 0 0-3.403-17.408 30.926 30.926 0 0 0-9.814-12.083 44.13 44.13 0 0 0-15.683-7.052 86.45 86.45 0 0 0-20.91-2.318H48.858v5.542l72.894 22.71a2 2 0 0 1 1.381 1.903v16.275a2 2 0 0 1-1.022 1.744l-37.347 23.63 37.347 23.631a2 2 0 0 1 1.022 1.745v16.275a2 2 0 0 1-1.381 1.902l-72.894 22.71v5.543h52.67a75.219 75.219 0 0 0 20.86-2.663 43.554 43.554 0 0 0 15.683-7.94 34.293 34.293 0 0 0 9.863-13.119 45.376 45.376 0 0 0 3.403-18.197 39.65 39.65 0 0 0-1.48-10.85Z"
                transform="translate(-48.083 -500.526)"
                style="fill:#ff6d00;stroke:#ff6d00;stroke-miterlimit:10;stroke-width:.4px" />
        </svg>
        <svg width="100px" height="100px" viewBox="0 0 256 256" v-else-if="name === 'Kinesis'">
            <defs>
                <linearGradient id="IconifyId18dabf0bcb83220280" x1="0%" x2="100%" y1="100%" y2="0%">
                    <stop offset="0%" stop-color="#4D27A8" />
                    <stop offset="100%" stop-color="#A166FF" />
                </linearGradient>
            </defs>
            <path fill="url(#IconifyId18dabf0bcb83220280)" d="M0 0h256v256H0z" />
            <path fill="#FFF"
                d="M60.8 198.4h6.4c0-26.9 17.488-54.4 147.2-54.4v-6.4c-135.35 0-153.6 30.733-153.6 60.8M80 217.6h6.4c0-24.211 0-60.8 128-60.8v-6.4c-58.678 0-96.87 7.549-116.768 23.078C80 187.238 80 204.788 80 217.6M48 83.2h-6.4c0 23.667 32.125 38.656 95.658 44.8c-63.533 6.144-95.658 21.133-95.658 44.8H48c0-15.536 21.62-41.6 166.4-41.6v-6.4C69.62 124.8 48 98.736 48 83.2m19.2-25.6h-6.4c0 30.067 18.25 60.8 153.6 60.8V112C84.688 112 67.2 84.5 67.2 57.6m147.2 41.6v6.4c-58.678 0-96.87-7.549-116.768-23.078C80 68.762 80 51.212 80 38.4h6.4c0 24.211 0 60.8 128 60.8" />
        </svg>
        <svg width="100px" height="100px" viewBox="0 0 256 256" v-else-if="name === 'Lambda'">
            <defs>
                <linearGradient id="IconifyId18dabf22b11a6b2c40" x1="0%" x2="100%" y1="100%" y2="0%">
                    <stop offset="0%" stop-color="#C8511B" />
                    <stop offset="100%" stop-color="#F90" />
                </linearGradient>
            </defs>
            <path fill="url(#IconifyId18dabf22b11a6b2c40)" d="M0 0h256v256H0z" />
            <path fill="#FFF"
                d="M89.624 211.2H49.89l43.945-91.853l19.912 40.992zm7.079-100.63a3.216 3.216 0 0 0-2.887-1.805h-.01a3.204 3.204 0 0 0-2.886 1.82L41.913 213.022a3.203 3.203 0 0 0 2.893 4.58l46.848-.001a3.21 3.21 0 0 0 2.9-1.83l25.65-54.08a3.183 3.183 0 0 0-.016-2.762zM207.985 211.2h-39.477L105.174 78.624a3.206 3.206 0 0 0-2.897-1.824h-25.83l.03-32h50.626l63.042 132.573a3.209 3.209 0 0 0 2.897 1.827h14.943zm3.208-38.4h-16.121L132.03 40.227a3.21 3.21 0 0 0-2.9-1.827H73.273a3.206 3.206 0 0 0-3.208 3.197l-.035 38.4c0 .851.333 1.664.94 2.265c.6.602 1.414.938 2.267.938h27.017l63.337 132.576a3.205 3.205 0 0 0 2.893 1.824h44.709a3.203 3.203 0 0 0 3.207-3.2V176c0-1.766-1.434-3.2-3.207-3.2" />
        </svg>

        <IconAnsible v-else-if="name === 'Ansible'" />
        <IconLinux v-else-if="name === 'Linux'" />
        <IconPython v-else-if="name === 'Python' || name === 'Asyncio'" />
        <IconAmazonwebservicesWordmark v-else-if="name === 'AWS'" />
        <IconVault v-else-if="name === 'Vault'" />
        <IconNomad v-else-if="name === 'Nomad'" />
        <IconConsul v-else-if="name === 'Consul'" />
        <IconTerraform v-else-if="name === 'Terraform'" />
        <IconFastapi v-else-if="name === 'Fastapi'" />
        <IconMysql v-else-if="name === 'MySQL'" />
        <IconPostgresql v-else-if="name === 'Postgresql'" /> <!-- todo? -->
        <IconApachekafka v-else-if="name === 'Kafka'" />
        <IconHtml5Wordmark v-else-if="name === 'HTML'" />
        <IconGooglecloud v-else-if="name === 'GCP'" />
        <IconApacheairflow v-else-if="name === 'Airflow'" />
        <IconKubernetes v-else-if="name === 'Kubernetes'" />
        <IconJenkins v-else-if="name === 'Jenkins'" />
        <IconJavascript v-else-if="name === 'Java Script'" />
        <IconGithubactions v-else-if="name === 'Github Actions'" />
        <IconDjangorest v-else-if="name === 'Django REST Framework'" />
        <IconDocker v-else-if="name === 'Docker'" />
        <IconKubernetes v-else-if="name === 'K8s'" />

        <img src="https://via.placeholder.com/100" alt="placeholder" v-else />
        <h3> {{ name }} </h3>
        {{ $t("skill.level." + level) }}<br />
        {{ experience_years }} {{ $t('common.years', { count: experience_years }) }}

    </div>
</template>

<style>
.skill {
    width: 115px;
    margin-bottom: 1em;
}

.skill svg {
    width: 100px;
    height: 100px !important;
}
</style>
