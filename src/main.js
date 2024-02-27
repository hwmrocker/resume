import './assets/main.css'
import en from './locales/en.json'
import de from './locales/de.json'
import "@fontsource/space-mono"

import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import { createI18n } from 'vue-i18n'

import { library } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
// import { all } from '@awesome.me/kit-KIT_CODE'
import { faEnvelope } from '@fortawesome/free-solid-svg-icons'
/* add icons to the library */
library.add(faEnvelope)

const i18n = createI18n({
    // something vue-i18n options here ...
    legacy: false,
    locale: 'en',
    messages: {
        en: en,
        de: de
    },
    datetimeFormats: {
        en: {
            custom: {
                year: 'numeric',
                month: 'long'
            }
        },
        de: {
            custom: {
                year: 'numeric',
                month: 'long'
            }
        }
    }
})

window.i18n = i18n;

const app = createApp(App)

app.component('fa', FontAwesomeIcon)

app.use(router)

app.use(i18n)
app.mount('#app')
