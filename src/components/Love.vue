<script setup>
import { useI18n } from "vue-i18n";
const { locale } = useI18n();
</script>
<template>
    <h2>{{ $t("page.love") }}</h2>
    <div v-if="locale === 'de'">
        <p>
            Mein Leben findet seinen Rhythmus in zwei Leidenschaften: ein engagierter Vater zu sein und die fesselnde Welt
            des Codes. Während Familie immer an erster Stelle steht, habe ich ein erfüllendes Gleichgewicht gefunden, das es
            mir ermöglicht, in beiden Bereichen zu brillieren. Fernarbeit gibt mir die Flexibilität, für meine Kinder da zu
            sein und aktiv an ihrem Leben teilzunehmen, während ich gleichzeitig meine beruflichen Ziele verfolge. während
            ich gleichzeitig meine beruflichen Ambitionen verfolge. Diese harmonische Herangehensweise zeigt sich in
            unermüdlichem Engagement und eine nachgewiesene Erfolgsbilanz beim Übertreffen von Erwartungen.
        </p>
        <p>
            Jenseits der Vaterschaft schlägt mein Herz für Open-Source-Software und die Eleganz von Python. Seit ich mich
            2002 in die Welt von Linux gewagt habe, bin ich ein überzeugter Verfechter von FOSS geworden, der aktiv zu
            Benutzergruppen beiträgt, Treffen organisiert und eine lebendige Gemeinschaft der Zusammenarbeit fördert. Dieser
            Eifer erstreckt sich auch auf Python, dessen Ausdrucksstärke es mir ermöglicht, Code mit minimalem Aufwand und
            maximaler Wirkung zu erstellen. Als ich 2016 der lokalen Python User Group beitrat, begann eine Reise des
            kontinuierlichen Lernens, des Wissensaustauschs und des Mentorings anderer. Bei trivago leitete ich die interne
            Python-Gilde, führte Schulungen durch und arbeitete bei Veranstaltungen mit lokalen Gemeinschaften zusammen -
            das Miterleben ihres Wachstums sorgte für große Zufriedenheit.
        </p>
        <p>
            Meine Leidenschaft geht über technische Fähigkeiten hinaus. Ich glaube an die Förderung lebendiger
            Gemeinschaften, die Unterstützung anderer durch Mentoren und den aktiven Austausch von Wissen. Wenn Sie diese
            Werte teilen und jemanden suchen, der in einem kollaborativen Umfeld gedeiht, sollten wir uns kennenlernen!
        </p>
    </div>
    <div v-else>
        <p>
            My life finds its rhythm in two passions: being a dedicated father and the captivating world of code. While
            family always comes first, I've discovered a fulfilling balance that allows me to excel in both areas. Remote
            work grants me the flexibility to be present for my children, actively involved in their lives, while
            simultaneously pursuing my professional ambitions. This harmonious approach translates into unwavering
            dedication and a proven track record of exceeding expectations.
        </p>
        <p>
            Beyond the realm of fatherhood, my heart beats for open-source software and the elegance of Python. Since
            venturing into the world of Linux in 2002, I've become a staunch advocate for FOSS, actively contributing to
            user groups, organizing meetups, and fostering a vibrant community of collaboration. This fervor extends to
            Python, where its expressiveness allows me to craft code with minimal fuss and maximum impact. Joining the local
            Python User Group in 2016 ignited a journey of continuous learning, knowledge sharing, and mentoring others. At
            trivago, I spearheaded the internal Python guild, conducted trainings, and collaborated with local communities
            on events – witnessing their growth fueled immense satisfaction.
        </p>
        <p>
            My passion extends beyond technical skills. I believe in fostering vibrant communities, empowering others
            through mentorship, and actively sharing knowledge. If you share these values and seek someone who thrives in a
            collaborative environment, let's connect!
    </p>
</div></template>
