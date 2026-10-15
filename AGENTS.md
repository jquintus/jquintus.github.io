# Travel notebook posts

This is Josh Quintus's Jekyll blog. Write travel posts as Josh describing his
own trip, using first-person, casual American English. Fix obvious typos.

## Notebook layout and transcription

- The right page contains the day's chronological narrative.
- The left page contains free-form additions, meals, and running tallies.
- Read both pages together. Follow continuations across spreads and use the
  written dates, rather than the video's recording date.
- Extract stills from local notebook videos. Start with a contact sheet, then
  inspect full-resolution frames and adjacent frames during page turns.
- On macOS, Swift's AVFoundation can extract frames without ffmpeg. Honor the
  video transform. Video decoding may need access to macOS services outside the
  sandbox. Keep extraction scripts, frames, and raw transcripts outside the repo.
- Do not invent words, property names, experiences, or opinions from unclear
  handwriting. Resolve uncertainty from adjacent frames or ask Josh when needed.

## Daily posts

- Use `_posts/YYYY/YYYY-MM-DD-<trip>-day-N.md` with matching `date` front matter.
- Include `layout: post`, a descriptive title, `comments: true`, and categories
  `Travel` and `Food` where appropriate.
- Tags include `Travel`, the trip name, `<Trip>_<year>`, relevant cities, and
  states or regions. Yellowstone's tags are `Travel`, `Yellowstone_2024`,
  `Yellowstone`, city names, state names, `bears`, and `wolves`.
- Start with the relevant daily tally table. Preserve daily versus trip totals.
- For Yellowstone, a dash in the notebook means no animals of that kind were
  seen that day. Display zero daily sightings and carry cumulative totals forward.
- Do not repeat instructions for reading the table every day. If needed, put a
  short explanation near the end of the first post and the trip summary.
- Treat the vacation's opening title and subtitle as actual headings. For
  Yellowstone: "Trip to Yellowstone & the Grand Tetons" / "In which we shall
  Frolic w/ Wolves + Bears" / "(Oh, My!)".
- Preserve Josh's specific observations, jokes, and food opinions. Turn shorthand
  into readable prose without padding or adding generic travel commentary.
- Link named restaurants, attractions, lodging, museums, parks, and tour operators.
  Prefer verified official sites; use a reliable directory when necessary. Never
  invent URLs or imply an unnamed business has been identified with certainty.
- Use reference-style external links where useful. Jekyll `post_url` links must
  include the year directory, e.g. `{% post_url 2024/2024-06-22-yellowstone-trip-summary %}`.
- Link each daily post to the summary and provide a daily-post index in the summary.

## Trip summary

- Date it after the final daily post so it ends the series.
- Begin with final totals, then cover restaurants, lodging, landmarks, wildlife
  sanctuaries, museums, and tours. Group restaurants by city or region.
- Use five-star ratings supported by Josh's opinions. Leave meals unrated when
  there is no basis for a score; do not manufacture a negative or neutral verdict.
- Write the experience directly: "Surprisingly good breakfast. Would recommend."
  Avoid "the notes say," "the notebook names," "no food verdict recorded,"
  "what made it into the notebook," or commentary about reconstructing the trip.
- Use column labels such as "What I thought" or "Highlights."
- Keep any necessary explanation of tally conventions or ratings near the end.
- User corrections override the original transcription and inferred ratings.

## Yellowstone corrections to preserve

- The trip was June 9–21, 2024. Final tallies: 28 wolves, 31 bears, 6 coyotes,
  and 3 moose. These include sanctuary animals and some repeat sightings.
- Howlers Inn is a solid **5/5**, a highlight of the trip. They had wolves.
- The Tetons lodging was an **Airbnb near Jackson Hole, Wyoming**.
- Three Bear Restaurant had two recorded dinners, not three.

## Scotland and Scotch

- Scotland uses the same left/right notebook layout, with more free-form notes
  and running totals on the left.
- Include Scotch experiences in both daily posts and a dedicated summary section.
- A four-day Scotch tour has page-by-page running tallies written as
  **Scotches drunk / unique Scotches drunk**.
- Report totals for each day, rather than every intermediate page tally.
- Determine whether a running count resets daily or continues across the tour
  before calculating daily totals. Never sum cumulative page snapshots.
- Keep total pours and unique Scotches distinct. Do not assume the sum of daily
  unique counts is the number of distinct Scotches across the whole trip.
- Link named distilleries, whisky bars, tour operators, and specific whiskies when
  a reliable match is available. Preserve the actual tasting impressions.

## Verification and publishing

- Build Jekyll and check dates, tags, tally arithmetic, resolved links, and the
  daily/summary navigation. Visually inspect changed pages in a cmux browser split.
- Keep temporary preview servers visible in cmux and clean up created panes.
- Use the existing dependency versions. If the host Ruby is newer than this old
  Jekyll stack supports, isolate compatibility tooling outside the repository;
  do not change dependencies just to publish prose.
- Check the actual remote default branch before publishing. This repository uses
  `master`, even when Josh colloquially calls it "main". A direct-push request
  authorizes pushing the default branch; do not create a new `main` branch.
- This is Josh's personal repo. Do not use `pr-push` or open a PR for an
  authorized direct push; commit and push to the default branch after verification.
- Any new feature branch must start with `jq/`.
