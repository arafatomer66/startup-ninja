import 'package:flutter/material.dart';
import '../../../app/theme.dart';
import '../../models/course_model.dart';

const tier2 = CourseTier(
  id: 'tier2',
  title: 'Tier 2 — Building the Business',
  subtitle: 'Model, MVP, market, and the numbers',
  color: AppColors.info,
  icon: Icons.construction_rounded,
  weeks: [
    CourseWeek(
      id: 'w4',
      number: 4,
      title: 'Business Model & Value Proposition',
      goal: 'Design how your business creates, delivers, and captures value.',
      lessons: [
        CourseLesson(
          title: 'The Business Model Canvas, block by block',
          description:
              'The nine blocks that describe any business on a single page — and expose your hidden assumptions.',
          blocks: [
            LessonBlock(
              heading: 'What is the Business Model Canvas?',
              body:
                  "A one-page map of how a business works, split into nine blocks: customer segments, value propositions, channels, customer relationships, revenue streams, key resources, key activities, key partnerships, and cost structure. The right side describes value and customers; the left side describes how you deliver it; the bottom row is the money.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "A forty-page business plan hides weak thinking; a canvas exposes it. When the whole model sits on one page, contradictions jump out — premium pricing with a mass-market channel, a segment you've never spoken to, costs with no matching revenue stream. Every block is really a stack of assumptions, and seeing them written down is the first step to testing them.",
            ),
            LessonBlock(
              heading: 'How to fill it',
              body:
                  "• Start with customer segments and value proposition — everything else serves those two.\n• Write facts where you have evidence (from your Week 2 interviews) and mark guesses with a '?'.\n• One canvas per segment if you serve very different customers — don't blur them into one.\n• Revisit it monthly: the canvas is a living document, not a framed certificate.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Filling all nine blocks with confident prose when most are guesses — unmarked assumptions get defended in pitches; tag anything without customer evidence with a '?'.\n• Writing the value proposition as a feature list ('AI-powered dashboard') — state the outcome instead: 'close the books in 2 hours, not 2 days.'\n• Stretching one canvas across two different segments — a marketplace's sellers and buyers don't share channels, relationships, or willingness to pay; give each their own canvas.\n• Treating it as a one-time deliverable — a canvas untouched for three months is a record of old guesses, not a model of your business.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "The canvas isn't paperwork — it's an X-ray. Every '?' you mark on it is an experiment waiting to be run.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Sketch a blank canvas on paper and set a 20-minute timer to fill all nine blocks fast. Then circle every entry you have zero customer evidence for. Count the circles — that number is your experiment backlog for the month.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Value Proposition Design: jobs, pains, gains',
          description:
              'Map what customers need, then design your offer around it — not your feature wishlist.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "A zoom-in on the two most important canvas blocks. You profile the customer three ways: jobs (what they're trying to get done — functional, social, emotional), pains (what blocks or annoys them), and gains (outcomes they crave). Then you design the offer as a mirror: products that do the jobs, pain relievers, and gain creators.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Most products are lists of features founders thought were cool; customers buy relief and progress, not features. Value-proposition fit — when your offer visibly addresses their top jobs, worst pains, and most-wanted gains — is what makes marketing copy write itself and sales calls feel like pushing on an open door. Without it, every sale is uphill.",
            ),
            LessonBlock(
              heading: 'How to build the map',
              body:
                  "• From your interview notes, list the customer's jobs, pains, and gains — in their words, not yours.\n• Rank them: which pain came up most often? Which job costs the most?\n• For your top three, write the matching pain reliever or gain creator your product offers.\n• Cut every feature that doesn't map to a ranked pain or gain — that's scope you don't need.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Inventing jobs and pains from your own head instead of interview notes — you end up designing a mirror of yourself, not the customer.\n• Listing ten pains and treating them all equally — customers pay to kill their top one or two; rank ruthlessly and design for the top of the list.\n• Capturing only functional jobs and missing social and emotional ones — a shop owner buying software also wants to look modern to customers and feel in control of the numbers.\n• Keeping pet features that map to nothing — every feature that misses a ranked pain or gain costs build time and buries the ones that matter.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Design the offer as a mirror of the customer's profile. If a feature doesn't relieve a real pain or create a wanted gain, it's decoration.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Take your five best interview notes and extract every pain into one list, in the customer's exact words. Rank them by how often and how emotionally each came up. Write your product's answer to the top two — if you don't have one, you just found your roadmap.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Revenue models and picking the right one',
          description:
              'Subscription, transaction, marketplace, freemium — and how to pick what matches buying behavior.',
          blocks: [
            LessonBlock(
              heading: 'What the options are',
              body:
                  "The main ways businesses capture value: one-time sales, subscriptions (recurring access), transaction or usage fees (pay per use), marketplace take-rates (a cut of each trade you enable), freemium (free tier converting to paid), licensing, and advertising. Each has a different revenue quality — recurring beats one-time, predictable beats spiky.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "The revenue model shapes the whole company: subscriptions demand retention obsession, marketplaces demand liquidity on both sides, freemium demands enormous top-of-funnel. Investors value a dollar of recurring revenue several times higher than a dollar of one-time revenue. And a model mismatched to how your customer prefers to buy adds friction to every single sale.",
            ),
            LessonBlock(
              heading: 'How to choose',
              body:
                  "• Follow the customer's buying rhythm: do they get value continuously (subscription) or per event (transaction)?\n• Check what they already pay this way — matching an existing habit halves the education cost.\n• Consider cash timing: subscriptions smooth cash flow; big one-time deals starve you between wins.\n• Start with ONE model. Hybrid pricing at launch confuses customers and your own metrics.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Copying a model because a famous startup uses it — freemium works at consumer-internet scale; with a 500-company niche it just gives your product away.\n• Fighting the customer's cash rhythm — many Bangladeshi SMBs run on daily cash flow, so a large annual license dies where a small weekly or per-order fee gets paid without a thought.\n• Launching with three pricing models at once — you can't tell which one is failing, and customers can't tell what you cost.\n• Ignoring collection cost — a model that needs invoices and 60-day follow-ups can net less than a smaller fee collected instantly at the point of value.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Pick the model that matches how value is consumed and how your customer already buys. Recurring revenue is worth fighting for.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Write down how your target customer pays for the two things they already buy that are most similar to yours — frequency, amount, and payment method. Draft your revenue model to match that rhythm, then say it out loud in one sentence: 'We charge X per Y.'",
            ),
          ],
        ),
        CourseLesson(
          title: 'Cost structure and what makes a model viable',
          description:
              'Fixed vs variable costs and the simple math that shows whether your model can ever work.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "The left-bottom of your canvas, made concrete. Fixed costs stay constant regardless of sales (salaries, rent, software); variable costs grow with each unit sold (materials, delivery, payment fees, support time). Viability is the simple question: at realistic prices and volumes, does revenue exceed all of it — and how long until it does?",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Many businesses die not from lack of customers but from a structure that can never work: variable costs eating 90% of price, or fixed costs requiring a volume the market can't supply. Founders who know their cost structure can answer the question that kills the unprepared: 'what happens to profit when you double volume?' — and can spot which costs scale dangerously.",
            ),
            LessonBlock(
              heading: 'How to check viability',
              body:
                  "• List every cost, tagged fixed or variable. Include YOUR time at a real market wage — free founder labor hides broken models.\n• Compute per-unit variable cost against your intended price: the gap is your contribution margin.\n• Divide fixed costs by that margin: that's how many sales just to break even. Is that number achievable in your market?\n• Stress it: what if costs run 30% higher and price 20% lower? Still standing?",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Pricing your own labor at zero — the model 'works' until the day you must hire someone to do what you did for free, and then it doesn't.\n• Forgetting sneaky variable costs — payment fees, refunds, failed deliveries, and support minutes each shave the margin on every single unit.\n• Mis-tagging variable costs as fixed — calling delivery riders 'fixed' hides that the cost explodes with volume.\n• Testing only the happy case — if the model dies when costs run 30% higher and price 20% lower, it was never viable, just lucky on paper.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "A business model is viable only if each sale leaves margin and the required break-even volume actually exists in your market. Check with real numbers now, not after launch.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Open a spreadsheet and list every monthly cost in one column, tagging each F (fixed) or V (variable). Add a row for your own hours at a real market wage. Compute price minus per-unit variable cost and write that contribution margin at the top of the sheet.",
            ),
          ],
        ),
      ],
      workshop: 'Fill your Canvas live; peer critique in small groups.',
      assignment:
          'Complete your Business Model Canvas and Value Proposition Canvas.',
      milestone: 'Deliverable 4 submitted: BMC + Value Proposition Canvas.',
      resources: [
        CourseResource(
          title: 'The Business Model Canvas — Strategyzer',
          source: 'Tool/Guide',
          url: 'https://www.strategyzer.com/library/the-business-model-canvas',
        ),
        CourseResource(
          title: 'Business Model Generation — Osterwalder & Pigneur',
          source: 'Book',
          url: 'https://www.goodreads.com/book/show/7723797-business-model-generation',
        ),
        CourseResource(
          title: 'Value Proposition Design — Strategyzer',
          source: 'Book',
          url: 'https://www.strategyzer.com/library/value-proposition-design-2',
        ),
      ],
    ),
    CourseWeek(
      id: 'w5',
      number: 5,
      title: 'Lean Startup, MVP & Building Version One',
      goal: 'Build the smallest thing that tests your idea.',
      lessons: [
        CourseLesson(
          title: 'Build–Measure–Learn and what an MVP really is',
          description:
              'The lean loop that replaces guessing with evidence — an MVP is a learning instrument, not a small product.',
          blocks: [
            LessonBlock(
              heading: 'What is an MVP?',
              body:
                  "A Minimum Viable Product is the smallest thing that tests your riskiest assumption with real customer behavior. It is not version 0.5 of your dream product — it's an experiment wearing a product costume. Build–Measure–Learn is the loop around it: build the smallest test, measure what real people do, learn, adjust, repeat.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "The default founder failure is spending a year building in secret, launching, and discovering assumption #1 was wrong — with all the money gone. The lean loop reorders the risk: you test the most dangerous assumption first, for days and dollars instead of years and savings. Speed through the loop, not perfection of any single build, is the startup's real advantage.",
            ),
            LessonBlock(
              heading: 'How to run the loop',
              body:
                  "• Write your riskiest assumption: usually 'people will pay for this,' rarely 'can it be built.'\n• Design the smallest test that produces real behavior — a sale, a signup, a signed letter of intent.\n• Define the success metric before building (e.g., '10 of 50 prospects pre-order').\n• Run it, read it honestly, then persevere, pivot, or kill — and start the next loop.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Building version 0.5 of the dream product instead of a test — six months of polish before evidence is exactly the failure the loop exists to prevent.\n• Testing the easy assumption ('can we build it?') instead of the killer one ('will they pay?') — engineering risk is rarely what kills startups.\n• Setting the success metric after seeing results — post-hoc goalposts make every experiment a 'success' and teach you nothing.\n• Measuring opinions instead of behavior — 'they loved the demo' is not data; a pre-order, a signup, or a signed letter of intent is.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "The MVP's product is learning, not features. Test the assumption that kills you fastest, as cheaply as possible, and let evidence steer.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Write your single riskiest assumption as one falsifiable sentence, then define the pass/fail metric next to it — e.g., '5 of 20 prospects pay a deposit this month.' Pin both at the top of your planning doc; nothing gets built that doesn't serve that test.",
            ),
          ],
        ),
        CourseLesson(
          title:
              'MVP types: concierge, Wizard of Oz, landing page, single-feature',
          description:
              'Four proven ways to test demand in days instead of months.',
          blocks: [
            LessonBlock(
              heading: 'What the four types are',
              body:
                  "Concierge: deliver the service completely by hand for a few customers, openly manual — you learn what they value before automating. Wizard of Oz: the customer sees a polished product, but humans secretly do the work behind the curtain. Landing page: sell the promise and measure signups or pre-orders before anything exists. Single-feature: build only the one feature that delivers the core value, nothing else.",
            ),
            LessonBlock(
              heading: 'Why they matter',
              body:
                  "Each type trades a different resource for learning. Concierge and Wizard of Oz cost your hours but zero engineering — perfect for service-shaped ideas. Landing pages cost days and test pure demand. Single-feature costs real build time but produces a usable product. Choosing the right type routinely saves three to six months of building the wrong thing.",
            ),
            LessonBlock(
              heading: 'How to choose yours',
              body:
                  "• Testing 'will they pay?' → landing page with a price and pre-order button.\n• Testing 'does my solution actually solve it?' → concierge with 3–5 real customers.\n• Testing 'will they use it repeatedly?' → Wizard of Oz or single-feature.\n• Whichever you pick: charge money if at all possible. Payment is the only unfakeable metric.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Automating before you know what to automate — many Dhaka delivery startups began as a founder taking orders over WhatsApp; that concierge phase teaches the real workflow before code freezes it.\n• Making the landing page vague — no price, no button, no concrete promise means the signups you count measure curiosity, not demand.\n• Running Wizard of Oz with no exit criterion — the manual work quietly swallows your week; decide upfront, e.g., 'automate once we pass 20 orders a week.'\n• Testing without a price — free pilots produce enthusiastic users and zero information about whether this is a business.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Match the MVP type to the assumption you're testing, and prefer the version where a human fakes the machine — hours are cheaper than months of code.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Name the one assumption your MVP must test, then pick the matching type from this lesson. Sketch it in ten lines: who sees it, what they're asked to do, what it costs them, and what number counts as a pass.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Design thinking to solve the right problem',
          description:
              "The discipline that keeps you solving the customer's problem instead of the one in your head.",
          blocks: [
            LessonBlock(
              heading: 'What is design thinking?',
              body:
                  "A five-step method for human-centered problem solving: empathize (immerse in the user's reality), define (frame the precise problem), ideate (generate many solutions before choosing), prototype (make ideas tangible fast and cheap), and test (put prototypes in front of real users and watch). It runs as loops, not a straight line.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Founders default to their first solution idea and defend it. Design thinking inserts two safeguards: the define step forces you to name the problem before solutions ('reduce invoice reconciliation from 3 hours to 10 minutes' beats 'build an app'), and cheap prototypes let users kill bad directions in days. Watching one user struggle with a paper mockup teaches more than a month of internal debate.",
            ),
            LessonBlock(
              heading: 'How to apply it this week',
              body:
                  "• Write a problem statement with zero solution words in it. If 'app' or 'platform' appears, rewrite.\n• Sketch three genuinely different solutions before committing to one — the first idea is rarely best.\n• Prototype on paper or clickable mockups in hours, not code in weeks.\n• Test with five users: give a task, stay silent, watch where they stumble. Fix, repeat.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Smuggling the solution into the problem statement — 'customers need our app to…' is a pitch, not a problem; if it names your product, rewrite it.\n• Generating one idea and defending it — the point of sketching three genuinely different options is to escape your attachment to the first.\n• Prototyping in code — spending a week in Flutter to learn what a paper sketch would have told you in an afternoon.\n• Coaching during tests — every hint ('you can tap there') deletes a finding; stay silent and let the stumble teach you.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Frame the problem before touching solutions, generate options before choosing, and let real users react to something tangible as early as possible.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Rewrite your current problem statement with zero solution words — no app, platform, tool, or AI allowed. Then sketch three different ways to solve it on one sheet of paper, including at least one that involves no software at all.",
            ),
          ],
        ),
        CourseLesson(
          title: 'No-code and low-cost ways to build fast',
          description:
              "Ship version one without engineers — and know where no-code's limits are.",
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "The modern no-code/low-cost stack: website and app builders, form tools, spreadsheet-as-database services, automation connectors that glue them together, and payment links. Combined, they can assemble marketplaces, booking systems, member products, and service businesses — for the cost of a few subscriptions instead of an engineering team.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "The bottleneck for testing ideas is no longer engineering — it's founder willingness to duct-tape. A no-code MVP shipping in two weeks beats a coded MVP shipping in six months, because it starts the Build–Measure–Learn loop 5 months earlier. Many businesses run on no-code far longer than founders expect; you migrate to custom code when scale demands it, not before.",
            ),
            LessonBlock(
              heading: 'How to do it right',
              body:
                  "• Map your MVP as a flow: user does X → data lands in Y → notification goes to Z. Then pick one tool per arrow.\n• Use boring, popular tools — tutorials and integrations matter more than novelty.\n• Accept ugly seams: manual steps behind the scenes are fine at 10 customers.\n• Know the limits: heavy real-time features, unusual algorithms, or hard compliance needs may genuinely need code — but validate demand first anyway.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Choosing tools by novelty — obscure builders die, change pricing, or lack the integration you need in week three; boring and popular wins.\n• Rebuilding the whole dream in no-code — the goal is one flow that tests demand, not a feature-complete clone that still took three months.\n• Hiding the manual seams from yourself — faking automation for customers is fine; forgetting which steps are humans when you plan costs and hiring is fatal.\n• Waiting for 'the real version' before charging — a payment link works on day one; collect money through the duct tape.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Version one's job is to exist quickly. Duct-tape proudly, launch in weeks, and earn the right to build it properly with real demand.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Draw your MVP as boxes and arrows: user does X → data lands in Y → someone is notified at Z. For each arrow, write one boring, popular tool that could handle it. That diagram is your build plan — start the first box today.",
            ),
          ],
        ),
      ],
      workshop:
          "MVP scoping clinic — cut each student's MVP down to its true minimum.",
      assignment: 'Write your MVP plan and produce a first prototype or mockup.',
      milestone: 'Deliverable 5 submitted: MVP plan + prototype/mockup.',
      resources: [
        CourseResource(
          title: 'The Lean Startup — Eric Ries',
          source: 'Book',
          url: 'https://theleanstartup.com',
        ),
        CourseResource(
          title: 'How to Plan an MVP — YC',
          source: 'Video/Guide',
          url: 'https://www.ycombinator.com/library/6f-how-to-plan-an-mvp',
        ),
        CourseResource(
          title: 'Running Lean — Ash Maurya',
          source: 'Book',
          url: 'https://www.goodreads.com/book/show/13078769-running-lean',
        ),
        CourseResource(
          title: 'IDEO Design Thinking',
          source: 'Guide',
          url: 'https://designthinking.ideo.com',
        ),
      ],
    ),
    CourseWeek(
      id: 'w6',
      number: 6,
      title: 'Market Research & Competitive Analysis',
      goal: 'Size the market honestly and know your competition cold.',
      lessons: [
        CourseLesson(
          title: 'Segmentation and building customer personas',
          description:
              'Slice the market into groups that buy for the same reason, built from real interview data.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "Segmentation divides a market into groups whose members buy for the same reason — by need and behavior, not just demographics. A persona is a vivid composite of one segment: their situation, their trigger to seek a solution, what they currently do, and what would make them switch. Good personas come from your interview logs, not imagination.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "'Everyone' is not a market. Products for everyone speak to no one: the copy goes generic, the channel choice becomes a coin flip, the roadmap tries to please incompatible groups. A sharp beachhead segment — small enough to dominate, painful enough to pay — is how startups win: depth first, breadth later.",
            ),
            LessonBlock(
              heading: 'How to build them',
              body:
                  "• Cluster your interviews: who described the same pain, in the same words, with the same urgency?\n• Score segments on: pain intensity, ability to pay, reachability, and size. Pick ONE beachhead.\n• Write the persona with a name, a context, a trigger event, current workaround, and a verbatim quote.\n• Pin it where you work — every feature, price, and channel decision gets checked against it.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Segmenting by demographics alone — 'women 25–40' is not a segment; 'salon owners losing bookings to no-shows' is, because it names a shared pain.\n• Choosing the biggest segment instead of the most winnable — the beachhead is where pain, budget, and reachability overlap, not where the headcount is largest.\n• Writing aspirational personas — if no interviewee actually said it, it doesn't go in the persona.\n• Serving two segments at once 'to be safe' — split focus makes both offers mediocre and doubles your channel work.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Choose one beachhead segment you can dominate and describe them so precisely the marketing writes itself. Depth beats breadth at this stage.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Re-read your interview notes and cluster them into two or three groups by shared pain and urgency. Score each group 1–5 on pain intensity, ability to pay, and reachability, then circle the winner. Write that segment's one-line description somewhere you'll see it every day.",
            ),
          ],
        ),
        CourseLesson(
          title: 'TAM / SAM / SOM with real math',
          description:
              'Bottom-up market sizing you can defend in a pitch.',
          blocks: [
            LessonBlock(
              heading: 'What the three numbers are',
              body:
                  "TAM (total addressable market): everyone who could theoretically use products like yours, in revenue terms. SAM (serviceable addressable market): the slice your model and geography can actually serve. SOM (serviceable obtainable market): what you can realistically capture in 2–3 years given competition and your resources. Each nests inside the previous.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Investors use these numbers to test two things: is the prize big enough, and does the founder think rigorously? A top-down claim ('the market is \$50B, we need just 1%') fails the second test instantly. A bottom-up build — counted from real units and real prices — earns credibility even when the number is smaller, and forces YOU to confront whether the opportunity justifies the years you're about to invest.",
            ),
            LessonBlock(
              heading: 'How to calculate bottom-up',
              body:
                  "• Count the units: how many businesses/people of your target type exist? Use census data, industry associations, licensing records.\n• Multiply by realistic annual spend: your price × purchase frequency.\n• SAM: cut TAM by your real constraints — geography, language, segment, channel.\n• SOM: cut SAM by honest capture — what can your team, budget and competition allow in 3 years? Show the assumptions.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Top-down laziness — 'the market is \$50B and we need 1%' tells an investor you didn't count; build up from real units × real prices instead.\n• Sizing the aspiration instead of the model — if you serve one city, in one language, through field sales, your SAM is that, not the whole region.\n• Using list prices nobody pays — size with realistic average revenue per customer, discounts and free tiers included.\n• Presenting SOM without assumptions — a naked number invites attack; 'X customers via channel Y at Z% conversion' invites a discussion you can win.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Size the market by counting and multiplying, never by taking 1% of a headline. The method is the message: rigor here signals rigor everywhere.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Find the official source that counts your customer type — a licensing body, census table, or industry association; a Bangladeshi startup selling to pharmacies, for instance, would start from the drug-authority license register. Pull the count and multiply by your price × purchase frequency. That's a defensible draft TAM, built in under 30 minutes.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Finding and reading market trends',
          description:
              'Separate durable trends from fads, and let a rising market do half your work.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "The practice of reading the currents your startup swims in: technology adoption curves, regulatory shifts, demographic changes, and behavior changes. Sources are mostly free — industry reports, government statistics, search-volume tools, earnings calls of public companies in your space, and the trade press your customers actually read.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "A mediocre product in a rising market often beats a great product in a flat one — the tide does half the work. Trends also set timing: too early and you educate the market at your expense; too late and incumbents own it. 'Why now?' is a standard investor question, and a good answer is almost always a trend: something changed recently that makes this newly possible or newly urgent.",
            ),
            LessonBlock(
              heading: 'How to read trends',
              body:
                  "• Distinguish trend from fad: a trend changes underlying behavior or cost structures; a fad changes conversation.\n• Look for compounding evidence: adoption numbers rising across multiple years and multiple sources.\n• Write your 'why now' sentence: what specifically changed (tech cost, regulation, behavior) that unlocks your startup?\n• Check the trend locally — global trends arrive in each market on their own schedule.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Confusing press volume with behavior change — a fad dominates headlines; a trend shows up in adoption and spending data across multiple years.\n• Citing a single report — one consultancy's forecast is marketing; three independent sources moving the same direction is evidence.\n• Answering 'why now' with 'nobody has done it' — usually somebody tried; find out why they failed before assuming the door is open.\n• Importing global timing into your local market — a wave cresting in the US may be three years away (or already owned by an incumbent) where you operate; check local numbers.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Ride a current, don't fight one. Your 'why now' answer should name a real, recent change — if nothing changed, ask why this hasn't been done already.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Write your 'why now' answer in one sentence that names a specific recent change — a cost that dropped, a regulation that shifted, a behavior that spread. Then find two independent data points supporting it and paste the links directly under the sentence.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Competitive analysis and positioning maps',
          description:
              'Know direct, indirect, and status-quo competitors — and find your defensible wedge.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "A structured view of everyone competing for your customer's money and attention: direct competitors (same solution), indirect (different solution, same problem), and the status quo (spreadsheets, pen-and-paper, doing nothing — usually your biggest rival). A positioning map plots them on the two dimensions customers care about most, revealing where space is empty.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "'We have no competitors' means either the problem isn't real or you haven't looked — both fatal in a pitch. Understanding competitors sharpens your wedge: the specific segment or dimension where you can be clearly, defensibly better, rather than slightly better at everything. And studying how incumbents price and sell is free market research they paid years to learn.",
            ),
            LessonBlock(
              heading: 'How to do it',
              body:
                  "• List 5–10 competitors across all three types. For each: target customer, pricing, strongest feature, weakest point (read their negative reviews).\n• Pick the two axes your persona actually decides on (e.g., price vs. ease, speed vs. depth) — not the ones flattering you.\n• Plot everyone. Find the empty corner that real customers want occupied.\n• Write your positioning sentence: 'For [segment], we are the only [category] that [key difference].'",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Claiming 'no competitors' — the status quo (a spreadsheet, a notebook, a cousin who helps out) competes for the same money; put it on the map.\n• Picking map axes that flatter you — plot the two dimensions your persona actually decides on, even if that lands you in a crowd.\n• Studying only feature grids — pricing pages, sales motion, and one-star reviews reveal a competitor's real weaknesses far better than their feature list.\n• Positioning as 'better at everything' — one wedge you can defend ('the only X for Y') beats ten small advantages nobody remembers.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Your biggest competitor is usually the customer doing nothing. Map the field honestly, then claim one wedge you can defend — not ten you can't.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Pick your three closest competitors and spend 20 minutes reading their most recent negative reviews. List the three complaints that keep repeating — each one is either your wedge or a warning about the whole market.",
            ),
          ],
        ),
      ],
      workshop: 'Build a positioning map together; find your defensible wedge.',
      assignment:
          'Produce TAM/SAM/SOM, personas, and a competitor positioning map.',
      milestone: 'Deliverable 6 submitted: market analysis pack.',
      resources: [
        CourseResource(
          title: 'Obviously Awesome — April Dunford (positioning)',
          source: 'Book',
          url: 'https://www.aprildunford.com/obviously-awesome',
        ),
        CourseResource(
          title: 'Crossing the Chasm — Geoffrey Moore',
          source: 'Book',
          url: 'https://www.goodreads.com/book/show/61329.Crossing_the_Chasm',
        ),
        CourseResource(
          title: 'How to Get Startup Ideas & Evaluate Markets — YC Library',
          source: 'Videos',
          url: 'https://www.ycombinator.com/library',
        ),
      ],
    ),
    CourseWeek(
      id: 'w7',
      number: 7,
      title: 'Pricing & Unit Economics',
      goal: 'Master the numbers that decide if the business survives.',
      lessons: [
        CourseLesson(
          title: 'Pricing strategies and how to choose',
          description:
              'Cost-plus, value-based, penetration, premium — and why underpricing is the classic founder mistake.',
          blocks: [
            LessonBlock(
              heading: 'What the strategies are',
              body:
                  "Cost-plus: your cost plus a margin — simple, but ignores what value is worth. Value-based: price anchored to the value delivered (if you save a client 10 hours a month, price against those hours). Penetration: deliberately low to win share fast, raised later. Premium: high price as a quality signal for a segment that wants the best.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Price is your highest-leverage number: a 10% price increase often lifts profit more than a 10% cost cut or volume gain. Yet founders systematically underprice — out of fear of rejection — which not only starves the company but signals low quality and attracts the worst customers. Raising prices later is far harder than starting right.",
            ),
            LessonBlock(
              heading: 'How to choose',
              body:
                  "• Quantify the value: what does your product save or earn the customer per month? Price at a fraction of that number.\n• Anchor against alternatives: what do they pay today, including the cost of the manual workaround?\n• Test by selling, not surveying: propose a real price and watch behavior. Too-easy yeses mean too cheap.\n• Default higher than comfortable: if nobody flinches, you've underpriced.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Pricing from your costs up instead of customer value down — cost-plus caps you at commodity margins even when the value delivered is 10× higher.\n• Asking 'would you pay X?' in surveys — people are polite; only a real ask with a real price produces truth.\n• Underpricing to 'win customers first' — cheap attracts the most demanding, least loyal buyers, and the eventual price raise becomes a churn event.\n• Discounting at the first flinch — one hesitation isn't rejection; hold the price and re-sell the value before you cut anything.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Price on value delivered, not cost incurred. When in doubt, go higher — the market corrects overpricing loudly and underpricing silently.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Compute the monthly value your product delivers to one real customer — hours saved × their hourly cost, or revenue gained. Set a price at 10–20% of that number and quote it to your next prospect without flinching.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Unit economics from scratch: defining your "unit"',
          description:
              "Pick the atom of your business and build the per-unit profit picture.",
          blocks: [
            LessonBlock(
              heading: 'What unit economics is',
              body:
                  "The profit-and-loss of one atom of your business: one customer, one order, one delivery, one seat, one transaction. You choose the unit that best represents how value flows, then compute what one unit earns (revenue) versus what it directly costs (variable costs: goods, delivery, payment fees, support time). The result: does the machine make money each time it turns?",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "If one unit loses money, a thousand units lose a thousand times more — 'we'll make it up in volume' is how startups with growing revenue and growing losses die. Unit economics is the earliest possible warning: you can compute it with five customers, long before the P&L shows the truth. It also tells you which lever to pull — price, cost, or volume — when the picture is bad.",
            ),
            LessonBlock(
              heading: 'How to build yours',
              body:
                  "• Pick the unit that matches your revenue model: subscription → one customer-month; marketplace → one transaction; service → one job.\n• List everything one unit truly costs, including allocated labor time at real wages.\n• Compute unit margin = unit revenue − unit variable cost. Then margin % of price.\n• Track it monthly from your real data — the trend matters more than the first snapshot.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Picking a vanity unit — measuring per signup when revenue arrives per order hides the loss inside every delivery.\n• Leaving labor out of variable cost — a Dhaka grocery-delivery order that takes 20 minutes of staff time plus a 60-taka rider fee can be underwater even when the goods margin looks healthy.\n• Averaging across segments — big and small customers can have opposite margins; a blended number hides which half is bleeding.\n• Computing it once and framing it — discounts, refunds, and support load drift the margin every month; a stale number is false comfort.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Know what one unit earns and costs before you scale anything. Volume amplifies whatever sign the margin has — make sure it's positive.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Take your last ten real orders — or simulate ten realistic ones. For each, write the revenue, then subtract goods, delivery, payment fees, and minutes of labor at a real wage. Average the result: that one number tells you whether to fix price, cost, or the model itself.",
            ),
          ],
        ),
        CourseLesson(
          title: 'CAC and LTV — calculating them honestly',
          description:
              'What it truly costs to win a customer and what they are worth over their lifetime.',
          blocks: [
            LessonBlock(
              heading: 'What CAC and LTV are',
              body:
                  "CAC (customer acquisition cost): total sales and marketing spend in a period — ads, tools, salaries, YOUR selling time — divided by customers won in that period. LTV (lifetime value): the margin a customer generates over their whole relationship with you — average margin per period × how long they stay. The ratio between them tells you if growth creates or destroys value.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "A business where each customer costs \$50 to win and returns \$300 of margin can pour fuel on the fire; one where CAC exceeds LTV burns money faster the harder it grows. Founders routinely flatter both numbers — ignoring their own time in CAC, assuming customers stay forever in LTV. Investors check these first; honest founders check them earlier.",
            ),
            LessonBlock(
              heading: 'How to calculate honestly',
              body:
                  "• CAC: include everything — ad spend, tools, agency fees, and founder hours at a market wage, divided by NEW customers only.\n• LTV: use margin, not revenue; use observed retention, not hoped-for retention. Early on, cap lifetime at 12–24 months to stay conservative.\n• Target LTV ≥ 3× CAC as a health line, and check payback: how many months until a customer repays their CAC? Under 12 keeps you fundable and alive.\n• Recompute quarterly — both numbers move as you scale.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Excluding founder time from CAC — if you spend 20 hours a week selling, those customers are not 'free'; price your hours in or the number lies.\n• Using revenue instead of margin in LTV — a customer paying \$100/month at 20% margin is worth \$20/month, not \$100.\n• Assuming forever retention — hope is not a cohort; cap lifetime at 12–24 months until observed churn says otherwise.\n• Averaging CAC across channels — one channel at \$30 and another at \$300 blend into a meaningless number; compute per channel and kill the loser.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Growth is only good if a customer returns meaningfully more than they cost to win. Compute both numbers with brutal honesty — flattering yourself here is self-sabotage.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Add up everything you spent on sales and marketing last month — ads, tools, and your own hours at a market wage — and divide by new customers won. Write that CAC next to a conservative LTV (monthly margin × 12 months of observed retention) and check the ratio against the 3× line.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Contribution margin and break-even',
          description:
              'The margin every sale contributes to fixed costs, and the volume where losses stop.',
          blocks: [
            LessonBlock(
              heading: 'What these numbers are',
              body:
                  "Contribution margin: price minus variable cost per unit — what each sale 'contributes' toward covering fixed costs, before profit exists. Break-even volume: fixed costs divided by contribution margin — the number of sales per month where you stop losing money. Together they turn your whole cost structure into two actionable numbers.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Break-even converts abstract finance into a concrete goal: '215 orders a month' is something a team can chase, and something you can sanity-check against market size — if break-even needs more customers than your SOM contains, the model is broken today, on paper, for free. Contribution margin tells you what happens as you grow: high-margin businesses scale gracefully; thin-margin ones need enormous volume.",
            ),
            LessonBlock(
              heading: 'How to compute and use them',
              body:
                  "• Contribution margin = price − variable cost per unit (from your unit economics lesson).\n• Break-even units = monthly fixed costs ÷ contribution margin. Convert to revenue: units × price.\n• Sanity-check: is that volume plausible for your channel and market within 12–18 months?\n• Use it for decisions: every new fixed cost (a hire, an office) raises break-even — compute by how much before saying yes.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Computing break-even at list price — discounts, promos, and refunds mean the average realized price is lower; use that or the target is fiction.\n• Adding fixed costs without recomputing — a hire adding \$2,000/month of fixed cost raises break-even by \$2,000 ÷ your unit margin; do that division before saying yes.\n• Chasing a break-even volume your market can't supply — if the required sales exceed your SOM, no amount of hustle fixes the model.\n• Treating break-even as the finish line — it's the survival line; plan the margin needed to fund growth beyond it.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Know your break-even by heart. It's the line between a company burning savings and one paying for itself — and every spending decision moves it.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Divide your monthly fixed costs by your contribution margin per unit and write the result — your break-even units — on a sticky note. Check it against your Week 6 market sizing: if that volume isn't plausible within 18 months, change your price or your costs today.",
            ),
          ],
        ),
      ],
      workshop:
          'Live unit-economics build in a shared sheet; fix a broken example together.',
      assignment:
          'Build your unit-economics sheet: price, margin, CAC target, LTV, break-even.',
      milestone:
          'Deliverable 7 submitted: unit-economics sheet. End of Tier 2.',
      resources: [
        CourseResource(
          title: '16 Startup Metrics — a16z',
          source: 'Article',
          url: 'https://a16z.com/16-startup-metrics/',
        ),
        CourseResource(
          title: 'SaaS Metrics 2.0 — David Skok',
          source: 'Guide',
          url: 'https://www.forentrepreneurs.com/saas-metrics-2/',
        ),
        CourseResource(
          title: 'Monetizing Innovation — Madhavan Ramanujam',
          source: 'Book',
          url: 'https://www.goodreads.com/book/show/26721165-monetizing-innovation',
        ),
      ],
    ),
  ],
);
