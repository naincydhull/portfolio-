#!/usr/bin/env bash
# Render deploy ke time canonical/OG/sitemap ko Render domain par switch karein.
# Source repo me Vercel URL primary hai; ye script sirf Render ke build me chalega.
set -e
OLD='https://naincydhull-portfolio.vercel.app'
NEW='https://portfolio-22oc.onrender.com'
for f in index.html robots.txt sitemap.xml; do
  sed -i "s#$OLD#$NEW#g" "$f"
done
echo "Render domain applied: $NEW"
