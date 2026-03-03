# Vimmai Creative Oy – index.html Analyysi
**Päiväys:** 2. maaliskuuta 2026
**Tiedosto:** `index.html`
**Analysoija:** Claude (Anthropic)

---

## 1. Mitä sivulla on

Sivu on yhden sivun (one-page) yritysesittely Vimmai Creative Oy:lle. Rakenne on selkeä ja koostuu seuraavista osioista:

| Osio | Kuvaus |
|---|---|
| **Navigaatio** | Kiinteä yläpalkki, jossa logo, ankkurilinkit ja CTA-painike |
| **Hero** | Koko ruudun aloitusnäkymä, jossa animoitu partikkeliefekti, otsikko, kuvaus ja kaksi CTA-painiketta |
| **Palvelut** | 6 korttiruudukkoa: Brändisuunnittelu, Verkkosivut & UI/UX, Digimarkkinointi, Valokuvaus & Video, Painotuotteet, Strateginen konsultointi |
| **Vimmai palvelut** | 3 syvempää palvelukorttia (Verkkosivut, Brändi-identiteetti, Digimarkkinointi) ominaisuuslistoineen |
| **Tilastot** | 4 numerostatistiikkaa: 120+ projektia, 8 vuotta, 98 % tyytyväisiä, 15 palkintoa |
| **Referenssit** | 3 asiakastestimoniaalikorttia tähtiarvioilla ja nimikirjainten avataareilla |
| **CTA / Yhteystiedot** | Yksinkertainen kehystetty laatikko, jossa mailto-linkki |
| **Footer** | Tekijänoikeusteksti ja somelinkit (Instagram, LinkedIn, Behance) |

**Tekninen toteutus:**
- Puhdas, yksi HTML-tiedosto ilman ulkoisia riippuvuuksia
- Kaikki tyyli inline `<style>`-tagissa
- Partikkelianimaatio Canvas API:lla toteutettuna JavaScriptissä
- Responsiivinen asettelu CSS Gridin ja clamp()-funktioiden avulla
- `lang="fi"` asetettu oikein
- `scroll-behavior: smooth` ankkurilinkeille

---

## 2. Mitä puuttuu

### 2.1 SEO ja metatiedot

- **Puuttuu `<meta name="description">`** – Hakukoneet eivät saa kuvailutekstiä, mikä heikentää hakutuloksen houkuttelevuutta.
- **Puuttuu Open Graph -tagit** (`og:title`, `og:description`, `og:image`, `og:url`) – Jako sosiaalisessa mediassa näyttää tyhjältä tai rumalta.
- **Puuttuu Twitter/X Card -metatagit** – Sama ongelma Twitter-jakamisessa.
- **Puuttuu kanoninen URL** (`<link rel="canonical">`) – Voi aiheuttaa duplikointiproblematiikkaa.
- **Puuttuu favicon** – Selaimen välilehti näyttää oletusikonia.
- **Puuttuu Schema.org rakenteiset tiedot** – `LocalBusiness` JSON-LD parantaisi huomattavasti hakukoneiden ymmärrystä yrityksestä (nimi, osoite, puhelin, aukioloajat).

### 2.2 Yhteystiedot ja konversio

- **Ei yhteydenottolomaketta** – "Yhteystiedot"-osio sisältää vain mailto-linkin. Tämä on konversioeste: käyttäjä joutuu poistumaan selaimesta sähköpostiohjelmaan.
- **Ei puhelinnumeroa** – Monet asiakkaat haluavat soittaa.
- **Ei fyysistä osoitetta** – "Helsinki" mainitaan, mutta tarkkaa osoitetta ei ole, vaikka se lisäisi uskottavuutta.

### 2.3 Mobiilinavigointi

- **Puuttuu hampurilaisvalikko (hamburger menu)** – Mobiilissa (`max-width: 700px`) navigaatiolista piilotetaan CSS:ssä (`display: none`), eikä tilalle tule mitään. Mobiiliasiakas ei pääse navigoimaan sivulla lainkaan.

### 2.4 Saavutettavuus (Accessibility / WCAG)

- **Puuttuu `<main>`-elementti** – Sisältöalueen rakenne ei noudata HTML5-landmarkeja, mikä hankaloittaa ruudunlukijoita.
- **Puuttuu "Hyppää sisältöön" -linkki** – (`skip-to-main`) näppäimistökäyttäjille pakollinen.
- **Canvas-elementillä ei ole `aria-hidden="true"`** – Ruudunlukija voi yrittää kuvata animaatiota.
- **Navigaatiolista ilman `aria-label`** – `<nav aria-label="Päänavigaatio">` puuttuu.
- **Decoratiivisilla emoji-ikoneilla ei `aria-hidden`** – Korttienkuvakkeet (✦, ◈, ◉, ⬡ jne.) luetaan ääneen ruudunlukijoissa.

### 2.5 Suorituskyky ja animaatio

- **Puuttuu `prefers-reduced-motion` -mediaquery** – Partikkelianimaatio ei pysähdy käyttäjillä, jotka ovat pyytäneet vähemmän liikettä (esim. epilepsia, vestibulaarihäiriöt). Tämä on myös WCAG 2.3.3 -vaatimus.
- **Partikkelisilmukan O(n²)-kompleksisuus** – Jokainen pisteen välinen etäisyys lasketaan joka ruudunpäivityksellä (80 pistettä → ~3 160 laskutoimitusta/frame). Mobiililaitteilla tämä voi heikentää akkua.

### 2.6 GDPR ja tietosuoja

- **Ei evästeilmoitusta / cookie banner** – Jos sivusto käyttää analytiikkaa (Google Analytics tms.), GDPR edellyttää suostumusta.
- **Ei tietosuojakäytäntöä** – Linkkiä ei löydy footerista eikä muualta.

### 2.7 Muut puutteet

- **Somelinkit ovat placeholdereja** – Footer-linkit osoittavat `href="#"` – eivät oikeisiin profiileihin.
- **Stats-osiosta puuttuu h2 ja section-label** – Kaikilla muilla osioilla on otsikko, stats-osiolla ei. Rakenne on epäjohdonmukainen.
- **Ei portfolio/referenssikuvia** – Sivusto kertoo olevansa visuaalinen toimisto, mutta ei näytä yhtäkään visuaalista referenssiä (kuvakaappauksia, kuvia töistä).
- **Kirjoitusvirhe:** Rivi 598 – `Mobiilioptimointu` pitäisi olla `Mobiilioptimoitu`.

---

## 3. Parannusehdotukset

### 🔴 Kriittiset (tehtävä ensin)

**1. Lisää mobiilivalikko**
```html
<!-- Lisää nav-elementtiin -->
<button class="nav-toggle" aria-label="Avaa valikko" aria-expanded="false">☰</button>
```
Lisää JavaScriptillä toggle-toiminto ja CSS-animaatio. Ilman tätä mobiilisivusto on käyttökelvoton.

**2. Korvaa mailto-linkki oikealla lomakkeella**
```html
<form action="https://formspree.io/f/XXXXX" method="POST">
  <input type="text" name="nimi" placeholder="Nimesi" required>
  <input type="email" name="email" placeholder="Sähköpostisi" required>
  <textarea name="viesti" placeholder="Kerro projektistasi..."></textarea>
  <button type="submit" class="btn btn-primary">Lähetä viesti</button>
</form>
```
Palvelut kuten Formspree, Netlify Forms tai EmailJS toimivat ilman backendiaä.

**3. Korjaa kirjoitusvirhe**
```
Mobiilioptimointu → Mobiilioptimoitu
```

### 🟡 Tärkeät (SEO ja laatu)

**4. Lisää metatiedot `<head>`-osioon**
```html
<meta name="description" content="Vimmai Creative Oy – brändisuunnittelu, verkkosivut ja digimarkkinointi Helsingissä. Luovaa tekemistä tuloksilla.">
<meta property="og:title" content="Vimmai Creative Oy">
<meta property="og:description" content="Brändit, verkkosivut ja markkinointimateriaalit, jotka erottuvat joukosta.">
<meta property="og:image" content="https://vimmai.fi/og-image.jpg">
<meta property="og:url" content="https://vimmai.fi">
<meta property="og:type" content="website">
<link rel="canonical" href="https://vimmai.fi">
<link rel="icon" href="/favicon.ico">
```

**5. Lisää Schema.org-rakenne**
```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "name": "Vimmai Creative Oy",
  "url": "https://vimmai.fi",
  "email": "hei@vimmai.fi",
  "address": { "@type": "PostalAddress", "addressLocality": "Helsinki", "addressCountry": "FI" },
  "description": "Brändisuunnittelu, verkkosivut ja digitaalinen markkinointi."
}
</script>
```

**6. Lisää oikeat somelinkit footeriin**
```html
<a href="https://instagram.com/vimmailcreative" target="_blank" rel="noopener">Instagram</a>
```

**7. Korjaa saavutettavuus**
```html
<!-- Lisää <body>:n ensimmäiseksi elementiksi -->
<a href="#main-content" class="skip-link">Hyppää sisältöön</a>

<!-- Lisää pääsisällön ympärille -->
<main id="main-content"> ... </main>

<!-- Navigaatiolle -->
<nav aria-label="Päänavigaatio">

<!-- Canvasille -->
<canvas id="particles" aria-hidden="true"></canvas>

<!-- Korteille emoji-ikoneille -->
<div class="card-icon" aria-hidden="true">✦</div>
```

### 🟢 Suositeltavat (lisäarvoa)

**8. Lisää `prefers-reduced-motion` -tuki animaatiolle**
```javascript
const mediaQuery = window.matchMedia('(prefers-reduced-motion: reduce)');
if (!mediaQuery.matches) {
  init();
  loop();
}
```

**9. Lisää portfolio-osio**
Visuaaliselle toimistolle olisi erittäin tärkeää näyttää oikeita töitä: kuvakaappauksia verkkosivuprojekteista, logoja, brändejä. Referenssikortit ilman visuaaleja eivät vakuuta alalla, jolla "show, don't tell" on periaate.

**10. Lisää puhelinnumero ja tarkennettu osoite**
```html
<p>📞 +358 XX XXX XXXX</p>
<p>📍 Bulevardi 12, 00120 Helsinki</p>
```

**11. Lisää tietosuoja-/evästelinkki footeriin**
```html
<a href="/tietosuoja">Tietosuoja</a>
```

**12. Paranna stats-osion rakennetta**
```html
<section class="stats" id="luvut">
  <p class="section-label">Numerot kertovat</p>
  <h2>Tuloksemme</h2>
  <div class="stats-grid"> ... </div>
</section>
```

---

## 4. Yhteenveto

| Kategoria | Arvosana | Kommentti |
|---|---|---|
| Visuaalinen ilme | ⭐⭐⭐⭐⭐ | Moderni, yhtenäinen ja ammattimainen |
| Tekninen toteutus | ⭐⭐⭐⭐ | Siistiä koodia, mutta mobiilinavigointi rikki |
| SEO-valmius | ⭐⭐ | Kriittisiä metatietoja puuttuu |
| Saavutettavuus | ⭐⭐ | Useita WCAG-puutteita |
| Konversio | ⭐⭐⭐ | Hyvä CTA-rakenne, mutta lomake puuttuu |
| GDPR-vaatimustenmukaisuus | ⭐ | Ei evästeilmoitusta eikä tietosuojasivua |

**Tärkein yksittäinen toimenpide:** Mobiilivalikon lisääminen – ilman sitä yli puolet nykyisistä sivustovieraista ei pysty navigoimaan sivulla.

---

*Raportti luotu 2.3.2026 – Vimmai Creative Oy:n index.html-tiedoston automaattisesta analyysista.*
