# portfolio-

Aspiring Digital Marketer | Building with AI tools |

## Files

| File | What it is |
|---|---|
| `index.html` | The portfolio website |
| `admin.html` | The admin panel (open it as `your-site/admin.html`) |
| `setup.sql` | One-time Supabase setup — **run this first** |
| `naincy-portfolio/` + `.zip` | Old packaged snapshot (not updated) |

## Admin panel

Open `admin.html`, log in with your Supabase admin email, and you get:

- **Dashboard** – total projects, messages, how many website sections are saved
- **Profile** – hero line, name, tagline, intro, both buttons, "Say Hello" button, photo badge, hero photo
- **About** – heading, both paragraphs, about photo, bullet cards
- **Education** – timeline items (year, title, percent, description)
- **Skills** – skill cards + the "Tools I Use" toolkit list
- **Projects** – section heading + full project CRUD (title, type, description, key points, tags, order, live link, screenshots with captions)
- **Contact** – heading + contact list (Email, LinkedIn, GitHub, Location, …) which also drives the footer "Get in touch" links
- **Settings** – browser title, meta description, logo/brand name, footer line, copyright, and a **one-click import** of everything already written in `index.html`
- **Messages** – contact form messages, reply/delete

Every **Save** writes to the Supabase table `site_content` and the website picks it up on the next refresh. If the table is missing, the website keeps showing the content already written in `index.html` (nothing breaks).

## First-time setup (important)

1. Open **Supabase Dashboard → SQL Editor → New query**
2. Paste the whole contents of `setup.sql`
3. Press **Run** (safe to run again, it deletes nothing)
4. Reload `admin.html`

This creates the `site_content` table and also fixes two things that were broken before:

- the website could not **read** `projects` (`permission denied for table projects`)
- visitors could not **send** messages (`insert` was not allowed)

## Everyday use

1. Go to `your-site/admin.html` → log in
2. Open a section, change what you want, press **Save changes**
3. Refresh the website — the new content is there

First time only: **Settings → Load website content into the database** copies everything currently written in `index.html` into the database, so you can start editing instead of typing it all again.

Never put your Supabase secret key or any password inside these files.
