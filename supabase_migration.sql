-- Vimmai Creative Oy – yhteydenottolomakkeen tietokantataulu
-- Aja tämä Supabase Dashboardissa: SQL Editor → New query → Aja

-- 1. Luo taulu
CREATE TABLE IF NOT EXISTS yhteydenotot (
  id        uuid        DEFAULT gen_random_uuid() PRIMARY KEY,
  luotu_at  timestamptz DEFAULT now() NOT NULL,
  nimi      text        NOT NULL,
  email     text        NOT NULL,
  viesti    text        NOT NULL
);

-- 2. Ota Row Level Security käyttöön
ALTER TABLE yhteydenotot ENABLE ROW LEVEL SECURITY;

-- 3. Salli anonyymit INSERT-operaatiot (lomakkeen lähetys)
CREATE POLICY "Salli lomakkeen lahetys" ON yhteydenotot
  FOR INSERT TO anon WITH CHECK (true);

-- 4. Estä julkinen lukuoikeus (vain admin näkee vastaukset dashboardissa)
-- (Ei tarvita erillistä SELECT-policyä – RLS estää sen automaattisesti)
