<script setup>
import { useI18n } from "vue-i18n";
const { locale } = useI18n();
</script>
<template>
    <div class="ideal" v-if="locale === 'de'">
        <h2>My dream Job</h2>
        <p>
            Meine ideale Rolle beruht auf Zusammenarbeit und Wissensaustausch. Ich stelle mir vor, dass ich in verschiedenen
            Teams aktiv mitarbeite, mein Fachwissen in die Gestaltung neuer Architekturen einbringe, mich an Code-Reviews
            beteilige und eine Kultur des kontinuierlichen Lernens fördere.
        </p>
        <p>
            Um den Wissensaustausch zu fördern, stelle ich mir vor, dass ich eine lebendige Gilde leite, in der jeder seine
            Präsentationsfähigkeiten verbessern kann. Indem ich Wissenslücken innerhalb von Teams identifiziere, würde ich
            gezielte Schulungsprogramme entwickeln, um diese Lücken zu schließen und sicherzustellen, dass jeder die
            Ressourcen hat, die er braucht, um Spitzenleistungen zu erbringen.
        </p>
        <p>
            Außerdem liegt mir die Förderung einer lebhaften internen Gemeinschaft sehr am Herzen. Durch die Mitwirkung an
            der Organisation interner Konferenzen könnte ich Kollegen zusammenbringen, Erfolge feiern und eine Kultur des
            gemeinsamen Wissens und Wachstums pflegen.
        </p>
    </div>
    <div class="ideal" v-else>
        <p>
            My ideal role thrives on collaboration and knowledge exchange. I envision myself actively contributing across
            diverse teams, lending my expertise to shape new architectures while also diving into code reviews and fostering
            a culture of continuous learning.
        </p>
        <p>
            To ignite knowledge sharing, I picture myself leading a vibrant guild where anyone can hone their presentation
            skills. By identifying knowledge gaps within teams, I'd curate targeted training programs to bridge those gaps
            and ensure everyone has the resources they need to excel.
        </p>
        <p>
            Furthermore, I'm passionate about fostering a vibrant internal community. Contributing to the organization of
            internal conferences would allow me to connect colleagues, celebrate achievements, and cultivate a culture of
            shared knowledge and growth.
        </p>
        <h2>My ideal employer</h2>
        <p>
            is fiercely committed to combating climate change, harnessing the power of free and
            open-source software, and actively contributing to the community they serve. They foster a thriving Linux
            development environment, where a healthy developer culture is cultivated. Trust, transparency, and a willingness
            to challenge the status quo are fundamental to their success.
        </p>
        <p>

            Data-driven decision-making is paramount, ensuring every action aligns with their long-term vision and holistic
            approach. Eschewing the short-term pressures of public markets, they prioritize employee well-being and
            stability, shunning the practice of dismantling departments for fleeting profits. Instead, they operate with a
            clear, long-term goal in mind, driven by internal resources and not dependent on external funding.
        </p>

        <h2>My ideal job</h2>
        <p>
            My ideal role offers a competitive compensation package, exceeding €100,000 annually, excluding potential
            bonuses. Remote work is embraced, allowing me to thrive in a flexible environment while maintaining a healthy
            work-life balance.

            To foster a strong team culture, we gather in person 2-4 times a year for focused social interactions, nurturing
            connections and building camaraderie.

            Generous vacation time of 30 days ensures ample opportunity for personal rejuvenation and exploration.
        </p>
        <p>
            If you know of a hidden gem that ticks almost all these boxes, hit me up! I'm flexible on some points for the
            right fit.
        </p>
    </div>
</template>
