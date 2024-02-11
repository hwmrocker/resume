import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import { createI18n } from 'vue-i18n'

import { library } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
// import { all } from '@awesome.me/kit-KIT_CODE'
import { faEnvelope, faRobot, faGhost } from '@fortawesome/free-solid-svg-icons'
import { faPython } from '@fortawesome/free-brands-svg-icons'
/* add icons to the library */
library.add(faEnvelope, faRobot, faGhost)

const i18n = createI18n({
    // something vue-i18n options here ...
})

const app = createApp(App)

app.component('fa', FontAwesomeIcon)

app.use(router)

app.use(i18n)
app.mount('#app')
