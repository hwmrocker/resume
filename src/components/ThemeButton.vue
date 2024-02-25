<!--
    Adapted from: https://dev.to/tqbit/create-your-own-dark-mode-toggle-component-with-vue-js-1284
 -->

<template>
    <div>
        <input @change="toggleTheme" id="checkbox" type="checkbox" class="switch-checkbox" />
        <label for="checkbox" class="switch-label">
            <span>🌙</span>
            <span>☀️</span>
            <div class="switch-toggle" :class="{ 'switch-toggle-checked': userTheme === 'dark-theme' }"></div>
        </label>
    </div>
</template>

<script>
export default {
    mounted() {
        const initUserTheme = this.getTheme() || this.getMediaPreference();
        this.setTheme(initUserTheme);
    },

    data() {
        return {
            userTheme: "light-theme",
        };
    },

    methods: {
        toggleTheme() {
            const activeTheme = localStorage.getItem("user-theme");
            if (activeTheme === "light-theme") {
                this.setTheme("dark-theme");
            } else {
                this.setTheme("light-theme");
            }
        },

        getTheme() {
            return localStorage.getItem("user-theme");
        },

        setTheme(theme) {
            localStorage.setItem("user-theme", theme);
            this.userTheme = theme;
            document.documentElement.className = theme;
        },

        getMediaPreference() {
            const hasDarkPreference = window.matchMedia(
                "(prefers-color-scheme: dark)"
            ).matches;
            if (hasDarkPreference) {
                return "dark-theme";
            } else {
                return "light-theme";
            }
        },
    },
};
</script>

  <!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
.switch-checkbox {
    display: none;
}

.switch-label {
    align-items: center;
    background: var(--switch-background);
    border: 2px solid var(--color-background-mute);
    border-radius: var(--element-size);
    cursor: pointer;
    display: flex;
    font-size: calc(var(--element-size) * 0.3);
    height: calc(var(--element-size) * 0.35);
    position: relative;
    padding: calc(var(--element-size) * 0.1);
    transition: background 0.5s ease;
    justify-content: space-between;
    width: var(--element-size);
    z-index: 1;
}

.switch-toggle {
    position: absolute;
    background-color: var(--color-background-mute);
    border-radius: 50%;
    top: calc(var(--element-size) * 0.07);
    left: calc(var(--element-size) * 0.07);
    height: calc(var(--element-size) * 0.5);
    width: calc(var(--element-size) * 0.5);
    transform: translate(calc(var(--element-size) * -0.05), calc(var(--element-size) * -0.15));
    transition: transform 0.3s ease, background-color 0.5s ease;
}

.switch-toggle-checked {
    transform: translate(calc(var(--element-size) * 0.3), calc(var(--element-size) * -0.15)) !important;
}
</style>
