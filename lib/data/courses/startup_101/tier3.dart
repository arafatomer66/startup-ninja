import 'package:flutter/material.dart';
import '../../../app/theme.dart';
import '../../models/course_model.dart';

const tier3 = CourseTier(
  id: 'tier3',
  title: 'Tier 3 — Growth',
  subtitle: 'Customers, marketing, operations, and team',
  color: AppColors.success,
  icon: Icons.trending_up_rounded,
  weeks: [
    CourseWeek(
      id: 'w8',
      number: 8,
      title: 'Sales & Your First 100 Customers',
      goal: 'Land the earliest, hardest customers yourself.',
      lessons: [
        CourseLesson(
          title: 'Why founders sell first',
          description:
              'Nobody can sell like the founder — and delegating sales too early costs the learning your product needs.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "The principle of founder-led sales: in the first stretch of a company's life, the founder personally finds, pitches, and closes every customer. Not because you're the best salesperson — you probably aren't — but because early sales is actually product discovery wearing a sales costume.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Three things only the founder can do: change the product mid-conversation ('we could build that — would you sign if we did?'), absorb the raw objections that reveal what's really blocking adoption, and carry credibility no hired rep has. Founders who outsource sales early buy a filtered, second-hand version of the market's feedback — and learn the wrong lessons slower.",
            ),
            LessonBlock(
              heading: 'How to embrace it',
              body:
                  "• Set a personal quota: a fixed number of outreach conversations per week, tracked like a metric.\n• Treat every 'no' as data: log the objection verbatim — patterns in objections are your real roadmap.\n• Don't hire a salesperson until YOU have closed enough customers to write the playbook you'd hand them.\n• Reframe discomfort: you're not begging, you're offering to fix a problem they told you they have.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Founder-led sales isn't a phase to skip — it's where product, pricing, and pitch get forged. Sell first, hire sellers after you've written the playbook.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Finding and reaching your first customers',
          description:
              'Where early adopters live and how to reach them credibly without a budget.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "The hunt for early adopters: people who feel the pain so sharply they'll tolerate a rough product from an unknown company. They cluster in findable places — niche communities and forums, industry groups, meetups, trade associations — and they're reachable through channels that cost effort instead of money: warm intros, communities, direct outreach.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Your first 10 customers determine your next 100: they become your case studies, testimonials, and referral sources — or your first churn statistics. Early adopters forgive missing features in exchange for attention and influence; mainstream customers don't. Chasing the wrong first customers (big logos, bargain hunters) burns months and warps the product.",
            ),
            LessonBlock(
              heading: 'How to reach them',
              body:
                  "• Go where the pain is discussed: find the 3 communities where your persona already complains about this problem.\n• Warm intros first: your Week 3 network and Week 2 interviewees are your fastest path — ask each for one intro.\n• Cold outreach that works is specific: name their problem, show you understand it, ask for 15 minutes. No feature lists.\n• Do things that don't scale: onboard by hand, deliver personally, over-serve absurdly. At 10 customers, scale is not the goal — love is.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Hunt early adopters where they already gather, arrive through trust, and over-serve them shamelessly. The first 100 are recruited one at a time.",
            ),
          ],
        ),
        CourseLesson(
          title: 'The early sales conversation and handling objections',
          description:
              'Diagnose before you pitch, quantify the pain, and actually ask for the close.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "A structure for early sales calls that mirrors a doctor's visit: diagnose first (their situation, the pain, its cost), prescribe second (your solution, framed against that exact pain), then close (a specific ask with a deadline). Objections aren't attacks — they're the customer telling you exactly what stands between them and a yes.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Founders default to pitching — opening the call with a feature tour that gives the customer nothing to connect to. Diagnosis-first flips it: when the customer has just described losing 5 hours a week, your solution lands on prepared ground. And most deals die not from objections but from founders never clearly asking for the sale.",
            ),
            LessonBlock(
              heading: 'How to run the conversation',
              body:
                  "• First third: questions only. 'Walk me through how you handle X today. What does that cost you?'\n• Middle: mirror their words back — pitch your product as the answer to the exact pain they named.\n• Objections: pause, clarify ('what's behind that concern?'), answer honestly, check ('does that resolve it?'). Price objections usually mean value wasn't established — return to the cost of the problem.\n• Close explicitly: 'Shall we start with a one-month pilot at [price]?' Silence after the ask; the next person to speak sets the terms.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Diagnose, then prescribe, then ask. A specific close attempted is worth ten perfect pitches that end with 'let me think about it.'",
            ),
          ],
        ),
        CourseLesson(
          title: 'Turning customers into referrals and testimonials',
          description:
              'Your happiest customers are a sales force waiting to be activated.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "The systematic conversion of customer happiness into growth assets: referrals (they introduce you to peers), testimonials (their words sell for you), and case studies (their results, documented). The operative word is systematic — happy customers rarely volunteer these; you build the moment of asking into your process.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "A warm referral converts several times better than any cold channel and costs nothing — for early-stage companies, referrals are routinely the #1 source of the next customers. Testimonials neutralize the biggest early objection ('who else uses this?'). Every satisfied customer who was never asked is compounding growth left on the table.",
            ),
            LessonBlock(
              heading: 'How to build the engine',
              body:
                  "• Time the ask to a success moment: right after they hit a result or say something positive — not at contract renewal.\n• Make it effortless: 'Is there one other [role] you know who deals with this? Happy to draft the intro note so you can just forward it.'\n• Testimonials: ask one question — 'what changed since you started using us?' — and get permission to quote the answer.\n• Close the loop: thank referrers, tell them the outcome, and over-serve them. Referrers who feel valued refer again.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Referrals are earned by results but harvested by asking. Build the ask into your process at the moment of customer success — every time.",
            ),
          ],
        ),
      ],
      workshop: 'Cold-outreach writing lab + live pitch practice with feedback.',
      assignment:
          'Write a first-100-customers plan with channels and outreach scripts.',
      milestone: 'Deliverable 8 submitted: acquisition plan + scripts.',
      resources: [
        CourseResource(
          title: "Do Things That Don't Scale — Paul Graham",
          source: 'Essay',
          url: 'https://paulgraham.com/ds.html',
        ),
        CourseResource(
          title: 'Founding Sales — Pete Kazanjy',
          source: 'Book (free online)',
          url: 'https://www.foundingsales.com',
        ),
        CourseResource(
          title: 'How to Sell — YC Startup School',
          source: 'Video course',
          url: 'https://www.ycombinator.com/library',
        ),
        CourseResource(
          title: 'SPIN Selling — Neil Rackham',
          source: 'Book',
          url: 'https://www.goodreads.com/book/show/833015.SPIN_Selling',
        ),
      ],
    ),
    CourseWeek(
      id: 'w9',
      number: 9,
      title: 'Digital Marketing & Growth Hacking',
      goal: 'Build a repeatable customer-acquisition engine.',
      lessons: [
        CourseLesson(
          title: 'The AARRR growth funnel',
          description:
              'Pirate metrics that turn your funnel into numbers you can act on.',
          blocks: [
            LessonBlock(
              heading: 'What is AARRR?',
              body:
                  "The five stages every customer passes through: Acquisition (they find you), Activation (they experience the core value the first time), Retention (they come back), Referral (they bring others), Revenue (they pay). Each stage has a conversion rate, and together they form a funnel you can measure, compare, and fix stage by stage.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Without a funnel view, founders fix the wrong thing — pouring money into acquisition while a leaky activation step wastes 90% of the traffic they already have. The funnel exposes the binding constraint: the one stage whose improvement moves the whole system. Early on, that's almost never acquisition; it's usually activation or retention.",
            ),
            LessonBlock(
              heading: 'How to use it',
              body:
                  "• Define each stage concretely for YOUR product: what exact action counts as activated? As retained?\n• Measure the conversion between every adjacent stage, even roughly, even in a spreadsheet.\n• Find the worst leak and work only on that until it's no longer the constraint.\n• Fix retention before scaling acquisition — filling a leaky bucket faster just spills more.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Growth is a funnel, not a firehose. Measure every stage, find the binding leak, and fix stages in order — retention before acquisition, always.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Content, SEO, and social as channels',
          description:
              'Organic channels that compound — pick one you can win and publish consistently.',
          blocks: [
            LessonBlock(
              heading: 'What these channels are',
              body:
                  "The organic trio: content marketing (articles, guides, videos that answer your customer's questions), SEO (making that content findable when they search), and social (building an audience where your persona already scrolls). Unlike ads, these compound: a good article works for years; an audience grows on itself.",
            ),
            LessonBlock(
              heading: 'Why they matter',
              body:
                  "Organic channels are the bootstrapper's leverage: they cost consistency instead of cash, and they build an asset (rankings, audience, trust) rather than renting attention. They also compound credibility — the company that wrote the definitive guide to a problem is assumed to have the best solution. The catch: they take months, so they must start before you need them.",
            ),
            LessonBlock(
              heading: 'How to choose and execute',
              body:
                  "• Pick ONE channel: the intersection of where your persona actually looks and what you can sustainably produce.\n• Answer real questions: your Week 2 interviews are a content goldmine — every pain point is an article title.\n• Consistency beats brilliance: one solid piece weekly for six months beats ten pieces in week one and silence after.\n• Measure conversions, not applause: traffic and likes are inputs; signups and sales are the score.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Choose one organic channel you can win, publish consistently for months, and judge it by customers — not claps. Compounding only works if you don't stop.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Paid ads fundamentals without wasting money',
          description:
              'Small-budget paid acquisition: targeting, testing, and killing what doesn\'t pay back.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "Paid acquisition on a founder's budget: search ads (capturing people already looking for a solution) and social ads (interrupting the right audience with a compelling promise). The mechanics that matter: narrow targeting, multiple ad variants tested in small batches, and relentless measurement of cost per acquisition against what a customer is worth.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Paid ads are the fastest way to test messaging and the fastest way to lose money — both at once. Used surgically, small campaigns answer big questions in days: which pain point converts, which audience responds, what acquisition really costs. Used hopefully ('boost this post'), they quietly drain the budget. The difference is discipline, not spend.",
            ),
            LessonBlock(
              heading: 'How to run a disciplined test',
              body:
                  "• Set the math first: your Week 7 LTV caps what you can pay per customer. Know the ceiling before spending.\n• Start tiny: a small daily budget, 2–3 ad variants, ONE audience. Change one variable at a time.\n• Send traffic to a page built for the ad's promise — mismatched landing pages waste every click.\n• Kill fast, scale slow: cut ads that don't pay back within your window; add budget only to proven winners.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Ads are an experiment engine with a gas pedal. Know your CAC ceiling, test small, kill losers without sentiment, and only then press the pedal.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Running growth experiments and reading the metrics',
          description:
              'Hypothesis → smallest test → metric → verdict: the cadence that makes growth a science.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "The growth experiment framework: a written hypothesis ('we believe changing X will improve metric Y because Z'), the smallest test that can validate it, a pre-committed success threshold, a fixed time window, and an honest verdict. Run on a weekly or biweekly cadence, prioritized by expected impact, confidence, and ease.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Most 'growth work' is random acts of marketing — trying things until something feels like it worked. Experiments create compounding knowledge: every test, win or lose, teaches you something durable about your customers. The pre-committed threshold is the crucial discipline; without it, every ambiguous result gets rationalized into a win.",
            ),
            LessonBlock(
              heading: 'How to run the cadence',
              body:
                  "• Keep a backlog of experiment ideas, scored on impact / confidence / ease. Run the top one.\n• Write the hypothesis and success number BEFORE launching. No exceptions.\n• One experiment at a time per funnel stage — parallel changes make results unreadable.\n• Hold a weekly review: verdict, learning, next experiment. The learning log becomes your growth playbook.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Growth is a search process: hypothesis, smallest test, honest verdict, repeat. The founders who compound learnings outgrow the ones who compound tactics.",
            ),
          ],
        ),
      ],
      workshop: 'Design one growth experiment each; peer review the hypotheses.',
      assignment:
          'Write a 90-day growth plan: channels, experiments, budget, targets.',
      milestone: 'Deliverable 9 submitted: 90-day growth plan.',
      resources: [
        CourseResource(
          title: 'Traction — Gabriel Weinberg & Justin Mares',
          source: 'Book',
          url: 'https://www.goodreads.com/book/show/22091581-traction',
        ),
        CourseResource(
          title: "Julian Shapiro's Growth Handbook",
          source: 'Guide (free)',
          url: 'https://www.julian.com/guide/growth/intro',
        ),
        CourseResource(
          title: 'Startup Metrics for Pirates (AARRR) — Dave McClure',
          source: 'Slides',
          url: 'https://www.slideshare.net/dmc500hats/startup-metrics-for-pirates-long-version',
        ),
        CourseResource(
          title: 'Reforge Blog — growth deep dives',
          source: 'Articles',
          url: 'https://www.reforge.com/blog',
        ),
      ],
    ),
    CourseWeek(
      id: 'w10',
      number: 10,
      title: 'Operations & Scaling Systems',
      goal: 'Build systems that let the business grow without breaking.',
      lessons: [
        CourseLesson(
          title: 'Turning chaos into repeatable processes',
          description:
              'Spot repeated work and turn it into steps anyone can follow.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "The shift from heroics to systems: identifying the work your business does repeatedly — onboarding a customer, fulfilling an order, handling a complaint — and converting each into a documented, repeatable process with an owner, a trigger, and a definition of done.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "A business that lives in the founder's head cannot grow, cannot delegate, and cannot survive the founder being sick for a week. Processes are what make quality consistent at customer #500, make new hires productive in days instead of months, and — eventually — make the company sellable. Chaos feels fast at 5 customers and becomes fatal at 50.",
            ),
            LessonBlock(
              heading: 'How to start',
              body:
                  "• For one week, log every task you do more than once. That list is your process backlog.\n• Prioritize by frequency × pain: document the thing you do most often and hate most, first.\n• Document by doing: next time you perform the task, write each step as you go — 30 minutes, done.\n• Test the document: have someone else follow it without your help. Where they stumble, the doc is wrong.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Every repeated task is a process waiting to be written down. Documenting them is how the business stops being you and starts being a company.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Writing SOPs people actually follow',
          description:
              'Why most SOPs die in a drawer — and the format that gets used.',
          blocks: [
            LessonBlock(
              heading: 'What makes an SOP usable',
              body:
                  "A Standard Operating Procedure that gets followed has five parts: a trigger (when does this start?), an owner (who does it?), numbered steps with screenshots where useful, a definition of done, and an escalation path (what to do when it breaks). Short enough to use mid-task — a checklist, not a manual.",
            ),
            LessonBlock(
              heading: 'Why most SOPs fail',
              body:
                  "They're written like legal documents: long, abstract, stored where nobody looks, and outdated within a month. An SOP that takes longer to read than the task takes to do will be ignored, and one wrong step teaches the team to distrust all of them. The failure isn't laziness — it's format and upkeep.",
            ),
            LessonBlock(
              heading: 'How to write ones that live',
              body:
                  "• One page maximum. Numbered steps, plain language, visuals over prose.\n• Store them where the work happens — linked from the tool, pinned in the channel — not in a buried folder.\n• Assign each SOP an owner responsible for keeping it current.\n• Update ritual: whoever finds a step wrong fixes it on the spot. An SOP is living code, not a framed rule.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Write SOPs like checklists, keep them where the work happens, and let the team edit them freely. A slightly scruffy SOP that's used beats a beautiful one that isn't.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Tools and automation for lean teams',
          description:
              'Automations that buy back founder hours — and the rule for what to automate.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "The lean operations stack: a shared task system, automation connectors that pass data between tools without human copy-paste, templates for everything you send repeatedly, and scheduled reports that replace status meetings. The goal is simple: eliminate work that a machine can do so humans do only what humans must.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Founder hours are the scarcest resource in the company. Every hour spent copy-pasting between a form and a spreadsheet is an hour not spent selling or building. Automation also removes the errors of repetition — the forgotten follow-up, the mistyped invoice — which at scale become customer-facing quality problems.",
            ),
            LessonBlock(
              heading: 'How to decide what to automate',
              body:
                  "• Automate what is frequent, rule-based, and boring. Keep human what is rare, judgment-based, or relationship-building.\n• Follow the rule of three: do it manually three times first — you can't automate a process you don't understand.\n• Estimate payback: hours saved per month vs. hours to set up. Automate when it pays back within a quarter.\n• Prefer fewer tools, deeply used, over many tools shallowly adopted. Every tool adds a seam that can leak.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Do it manually three times, then automate if it's frequent and rule-based. Buy back founder hours ruthlessly — they're the company's real currency.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Finding and fixing bottlenecks',
          description:
              'Every system has one slowest step that sets the pace for everything.',
          blocks: [
            LessonBlock(
              heading: 'What a bottleneck is',
              body:
                  "In any process, one step limits the throughput of the whole system — the bottleneck. Orders wait for approval; leads wait for a demo slot; deliveries wait for packing. Theory of constraints says: the system can only move as fast as its slowest step, so improving anything OTHER than the bottleneck improves nothing.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Founders scatter improvement effort everywhere — a faster website, a better template, a new tool — while the actual constraint (say, only the founder can approve quotes) throttles everything. Finding the bottleneck concentrates effort where it multiplies: one fix at the constraint lifts the whole company's output. Then a new bottleneck appears, and you repeat.",
            ),
            LessonBlock(
              heading: 'How to find and fix it',
              body:
                  "• Map one core process end-to-end and mark where work piles up — queues are bottleneck fingerprints.\n• Ask: 'what is everyone waiting on?' The answer is usually a person (often you) or an approval.\n• Fix in order of cheapness: remove the step entirely → delegate it → parallelize it → speed it up.\n• Re-measure after each fix. The bottleneck moves; the hunt is permanent.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Improve the constraint and you improve the company; improve anything else and you've improved a report. Find where work waits — that's your real to-do list.",
            ),
          ],
        ),
      ],
      workshop: 'Map one core process end-to-end and spot the bottleneck live.',
      assignment: 'Produce a core-process map and one written SOP.',
      milestone: 'Deliverable 10 submitted: process map + SOP.',
      resources: [
        CourseResource(
          title: 'The E-Myth Revisited — Michael Gerber',
          source: 'Book',
          url: 'https://www.goodreads.com/book/show/81948.The_E_Myth_Revisited',
        ),
        CourseResource(
          title: 'The Goal — Eliyahu Goldratt (theory of constraints)',
          source: 'Book',
          url: 'https://www.goodreads.com/book/show/113934.The_Goal',
        ),
        CourseResource(
          title: 'Atlassian Team Playbook — free process rituals',
          source: 'Toolkit',
          url: 'https://www.atlassian.com/team-playbook',
        ),
        CourseResource(
          title: 'Checklist Manifesto — Atul Gawande',
          source: 'Book',
          url: 'https://www.goodreads.com/book/show/6667514-the-checklist-manifesto',
        ),
      ],
    ),
    CourseWeek(
      id: 'w11',
      number: 11,
      title: 'Hiring, Team & Startup Culture',
      goal: 'Build the first team and a culture that survives growth.',
      lessons: [
        CourseLesson(
          title: 'When and who to hire first',
          description:
              'The roles that matter first, and why a wrong early hire costs more than a year of salary.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "The first-hire decision framework: hire when a constraint is provably throttling growth (not when you're merely busy), and hire for the activity that most directly makes or saves money. Early hires should be athletes — high-slope generalists who can own outcomes with little structure — because there is no structure yet.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "In a five-person company, one hire is 20% of the culture and burn rate. A wrong early hire costs the salary, the months of reduced output, the management attention, the morale dent, and the re-hiring time — comfortably more than a year of salary in total. And hiring to escape work you haven't systematized just transfers chaos to someone with less context.",
            ),
            LessonBlock(
              heading: 'How to decide',
              body:
                  "• Hire against a bottleneck (Week 10): what constraint, if removed, most accelerates revenue or product?\n• Systematize before you delegate: an SOP-backed role gets a new hire productive in days.\n• Prefer slope over pedigree early: learning speed and ownership beat impressive logos.\n• Write the role as outcomes ('own customer onboarding; 90% activation in 30 days'), not activity lists.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Hire late, hire slope, hire against a named bottleneck — and hand every new hire a documented process, not a pile of chaos.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Screening, interviewing, and closing talent',
          description:
              'Structured interviews and work samples that surface truth — and closing without big-company money.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "A hiring process built on evidence instead of vibes: a structured interview (same questions for every candidate, scored against defined criteria), a paid work sample (a small real task, done as they'd do the job), and reference checks that ask calibrated questions. Then closing: selling your mission, trajectory, and ownership to people who could earn more elsewhere.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Unstructured interviews measure charm, and charm doesn't ship. Work samples are the strongest predictor of job performance available to a small company — and they protect against the polished interviewer who can't do the work. Startups can't outbid corporations on salary, so they must out-recruit them on meaning, growth, and equity — which requires actually making that pitch.",
            ),
            LessonBlock(
              heading: 'How to run it',
              body:
                  "• Define 4–5 scorable criteria from the role's outcomes before meeting anyone.\n• Interview for evidence: 'tell me about a time you…' — past behavior over hypothetical answers.\n• Always run a paid work sample sized at 2–4 hours. Watch for questions asked as much as output.\n• References: 'compared to others in this role, where did they rank? What would they need to improve?' Listen for hesitation.\n• Close like a founder: share the mission, the growth they'll get, and equity where it fits. Speed itself is a differentiator.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Structure the interview, pay for a work sample, and check references like an investigator. Then close with what startups uniquely offer: growth, ownership, and meaning.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Roles and accountability without bureaucracy',
          description:
              'Every outcome needs exactly one owner — with tools that scale from 2 to 20.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "Lightweight accountability: every important outcome has exactly one named owner (never 'the team'), each person has a short scorecard of the 3–5 numbers or outcomes they own, and a weekly rhythm — commitments made, commitments reviewed — keeps it all visible without managers chasing anyone.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Small teams fail in two directions: no structure (everything shared, nothing owned, balls dropped between people) or premature bureaucracy (process theater copied from big companies). Shared ownership is the silent killer — when onboarding belongs to everyone, its failure belongs to no one. One owner per outcome fixes it with near-zero process cost.",
            ),
            LessonBlock(
              heading: 'How to implement',
              body:
                  "• List the company's 5–7 critical outcomes. Write ONE name next to each. Gaps and double-bookings will be obvious.\n• Give everyone a scorecard: the few numbers that define success in their role. Review monthly.\n• Weekly rhythm: each person states last week's commitments (done/not) and this week's. Fifteen minutes, in public.\n• Owner ≠ doer of everything: the owner ensures it happens and raises the flag early when it won't.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Accountability is one name per outcome plus a weekly public rhythm. That's the whole system — anything more is bureaucracy you don't need yet.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Co-founders, equity splits, and culture by design',
          description:
              'The conversations that prevent lawsuits, and writing culture down while it\'s cheap.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "The founding team's legal and cultural architecture: the co-founder conversation (roles, expectations, commitment levels, exit scenarios) held explicitly and early; an equity split with vesting (shares earned over ~4 years with a 1-year cliff, so a departing founder doesn't leave with half the company); and culture written as a few real principles while the team is small enough to live them.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Co-founder conflict is a top startup killer, and it almost always traces to conversations skipped at the start — who decides what, what happens if someone leaves, what commitment means. Vesting is the single cheapest insurance in startups: without it, a co-founder who quits in month six owns their full stake forever. And culture forms whether you design it or not; by 20 people it's set concrete.",
            ),
            LessonBlock(
              heading: 'How to do it',
              body:
                  "• Have the hard conversation now: roles, decision rights, salary expectations, hours, and what happens on departure. Write down the answers.\n• Split equity based on forward contribution, not just the idea — and put EVERY founder on vesting with a cliff, including yourself.\n• Paper it properly: a founders' agreement with IP assignment, signed before the company is worth arguing over.\n• Culture: write 3 principles that are real trade-offs ('speed over polish'), not posters ('excellence'). Use them in actual decisions weekly.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Vesting for everyone, hard conversations early, agreements in writing, and culture as three real trade-offs you actually use. Cheap now, priceless later.",
            ),
          ],
        ),
      ],
      workshop:
          'Write a real role description + define 3 culture principles; peer critique.',
      assignment:
          'Produce an org plan: first hires, a sample role, culture principles.',
      milestone: 'Deliverable 11 submitted: org & culture plan. End of Tier 3.',
      resources: [
        CourseResource(
          title: 'Who: The A Method for Hiring — Smart & Street',
          source: 'Book',
          url: 'https://www.goodreads.com/book/show/4989687-who',
        ),
        CourseResource(
          title: "The Founder's Dilemmas — Noam Wasserman",
          source: 'Book',
          url: 'https://www.goodreads.com/book/show/13239336-the-founder-s-dilemmas',
        ),
        CourseResource(
          title: 'First Round Review — team & management essays',
          source: 'Articles',
          url: 'https://review.firstround.com',
        ),
        CourseResource(
          title: 'Netflix Culture Deck',
          source: 'Slides',
          url: 'https://www.slideshare.net/reed2001/culture-1798664',
        ),
      ],
    ),
  ],
);
