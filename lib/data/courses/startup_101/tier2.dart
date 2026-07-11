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
              heading: 'Key takeaway',
              body:
                  "The canvas isn't paperwork — it's an X-ray. Every '?' you mark on it is an experiment waiting to be run.",
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
              heading: 'Key takeaway',
              body:
                  "Design the offer as a mirror of the customer's profile. If a feature doesn't relieve a real pain or create a wanted gain, it's decoration.",
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
              heading: 'Key takeaway',
              body:
                  "Pick the model that matches how value is consumed and how your customer already buys. Recurring revenue is worth fighting for.",
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
              heading: 'Key takeaway',
              body:
                  "A business model is viable only if each sale leaves margin and the required break-even volume actually exists in your market. Check with real numbers now, not after launch.",
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
              heading: 'Key takeaway',
              body:
                  "The MVP's product is learning, not features. Test the assumption that kills you fastest, as cheaply as possible, and let evidence steer.",
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
              heading: 'Key takeaway',
              body:
                  "Match the MVP type to the assumption you're testing, and prefer the version where a human fakes the machine — hours are cheaper than months of code.",
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
              heading: 'Key takeaway',
              body:
                  "Frame the problem before touching solutions, generate options before choosing, and let real users react to something tangible as early as possible.",
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
              heading: 'Key takeaway',
              body:
                  "Version one's job is to exist quickly. Duct-tape proudly, launch in weeks, and earn the right to build it properly with real demand.",
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
              heading: 'Key takeaway',
              body:
                  "Choose one beachhead segment you can dominate and describe them so precisely the marketing writes itself. Depth beats breadth at this stage.",
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
              heading: 'Key takeaway',
              body:
                  "Size the market by counting and multiplying, never by taking 1% of a headline. The method is the message: rigor here signals rigor everywhere.",
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
              heading: 'Key takeaway',
              body:
                  "Ride a current, don't fight one. Your 'why now' answer should name a real, recent change — if nothing changed, ask why this hasn't been done already.",
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
              heading: 'Key takeaway',
              body:
                  "Your biggest competitor is usually the customer doing nothing. Map the field honestly, then claim one wedge you can defend — not ten you can't.",
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
              heading: 'Key takeaway',
              body:
                  "Price on value delivered, not cost incurred. When in doubt, go higher — the market corrects overpricing loudly and underpricing silently.",
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
              heading: 'Key takeaway',
              body:
                  "Know what one unit earns and costs before you scale anything. Volume amplifies whatever sign the margin has — make sure it's positive.",
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
              heading: 'Key takeaway',
              body:
                  "Growth is only good if a customer returns meaningfully more than they cost to win. Compute both numbers with brutal honesty — flattering yourself here is self-sabotage.",
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
              heading: 'Key takeaway',
              body:
                  "Know your break-even by heart. It's the line between a company burning savings and one paying for itself — and every spending decision moves it.",
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
