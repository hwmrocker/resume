<script setup>
import { useI18n } from "vue-i18n";
const { locale } = useI18n();
</script>
<template>
    <div class="ideal" v-if="locale === 'de'">
        <h2>Mein Traum Job</h2>
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
        <h2>Mein idealer Arbeitgeber</h2>
        <p>
            Mein idealer Arbeitgeber setzt sich für den Kampf gegen den Klimawandel ein, nutzt die Möglichkeiten freier und
            quelloffener Software und leistet einen aktiven Beitrag für die Gemeinschaft, der er dient. Sie fördern eine
            florierende Linux-Entwicklungsumgebung, in der eine gesunde Entwicklerkultur gepflegt wird. Vertrauen,
            Transparenz und die Bereitschaft, den Status quo in Frage zu stellen, sind die Grundlage für ihren Erfolg. Sie
            kultivieren einen Arbeitsplatz, an dem sich Menschen mit unterschiedlichem Hintergrund willkommen und
            respektiert fühlen.
        </p>
        <p>Die datengestützte Entscheidungsfindung steht an erster Stelle und gewährleistet, dass jede Maßnahme mit ihrer
            langfristigen Vision und ihrem ganzheitlichen Ansatz in Einklang steht. Sie verzichten auf den kurzfristigen
            Druck der öffentlichen Märkte und stellen das Wohlergehen und die Stabilität der Mitarbeiter in den Vordergrund,
            ohne Abteilungen für flüchtige Gewinne abzubauen. Stattdessen haben sie ein klares, langfristiges Ziel vor
            Augen, das von internen Ressourcen angetrieben wird und nicht von externen Mitteln abhängig ist.</p>
        <h2>Meine ideale Stelle</h2>
        <p>bietet ein wettbewerbsfähiges Gehaltspaket von über 100.000 € pro Jahr, ohne mögliche Bonuszahlungen. Fernarbeit
            ist erwünscht, so dass ich mich in einem flexiblen Umfeld entfalten und gleichzeitig eine gesunde
            Work-Life-Balance aufrechterhalten kann. Um eine starke Teamkultur zu fördern, treffen wir uns 2 bis 4 Mal im
            Jahr persönlich, um uns auszutauschen, Kontakte zu pflegen und die Kameradschaft zu fördern. Ein großzügiger
            Urlaub von 30 Tagen bietet ausreichend Gelegenheit zur persönlichen Erholung und Erkundung.</p>
        <p>Wenn du ein verstecktes Juwel kennst, das fast alle diese Kriterien erfüllt, melde dich bei mir! Ich bin in
            einigen Punkten flexibel, wenn es passt.</p>
    </div>
    <div class="ideal" v-else>
        <h2>My dream Job</h2>

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
            My ideal employer is fiercely committed to combating climate change, harnessing the power of free and
            open-source software, and actively contributing to the community they serve. They foster a thriving Linux
            development environment, where a healthy developer culture is cultivated. Trust, transparency, and a willingness
            to challenge the status quo are fundamental to their success. They cultivate a workplace where individuals from
            all backgrounds feel welcomed and respected.
        </p>
        <p>
            Data-driven decision-making is paramount, ensuring every action aligns with their long-term vision and holistic
            approach. Eschewing the short-term pressures of public markets, they prioritize employee well-being and
            stability, shunning the practice of dismantling departments for fleeting profits. Instead, they operate with a
            clear, long-term goal in mind, driven by internal resources and not dependent on external funding.
    </p>

    <h2>My ideal job</h2>
    <p>
        offers a competitive compensation package, exceeding €100,000 annually, excluding potential bonuses. Remote work
        is embraced, allowing me to thrive in a flexible environment while maintaining a healthy work-life balance. To
        foster a strong team culture, we gather in person 2-4 times a year for focused social interactions, nurturing
        connections and building camaraderie. Generous vacation time of 30 days ensures ample opportunity for personal
        rejuvenation and exploration.
    </p>
    <p>
        If you know of a hidden gem that ticks almost all these boxes, hit me up! I'm flexible on some points for the
        right fit.
    </p>
</div></template>
