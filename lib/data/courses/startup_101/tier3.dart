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
              heading: 'Common mistakes',
              body:
                  "• Hiring a salesperson before you've closed 10 deals yourself — they inherit no playbook, miss quota, and you conclude 'sales doesn't work' instead of 'we hired too early'.\n• Sending the 'people person' co-founder while the product founder stays out — raw objections never reach the person who can change the product mid-conversation.\n• Counting demos instead of asks — twenty friendly conversations that never end in 'will you pay?' teach you nothing about willingness to pay.\n• Taking rejection personally and slowing outreach — a 'no' with a logged objection is a productive call; silence is the only real failure.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Founder-led sales isn't a phase to skip — it's where product, pricing, and pitch get forged. Sell first, hire sellers after you've written the playbook.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Block three 45-minute slots in your calendar this week labeled 'founder sales'. Then message five people from your interview or network list asking for a 15-minute call about the problem — send all five messages before you close this lesson.",
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
              heading: 'Common mistakes',
              body:
                  "• Chasing big-logo customers first — their procurement cycles run months and their feature demands warp your roadmap before you have any revenue.\n• Spraying generic cold messages — 'check out my startup' gets ignored; a message that names their specific problem gets replies.\n• Pitching in the wrong room — in Bangladesh most SMB owners run their business inside Facebook groups and WhatsApp; if that's where your buyer lives, polished LinkedIn outreach is shouting into an empty hall.\n• Declaring a channel dead after five attempts — outreach data means nothing before 30–50 tries with a consistent message.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Hunt early adopters where they already gather, arrive through trust, and over-serve them shamelessly. The first 100 are recruited one at a time.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "List the three online communities where your target customer already discusses this problem, and join all three today. Post nothing yet — spend 20 minutes reading the last week of activity and write down five verbatim complaints that match your problem.",
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
              heading: 'Common mistakes',
              body:
                  "• Opening with a demo — you spend your credibility before knowing which pain to aim at; spend the first third of the call on questions instead.\n• Answering a price objection with a discount — the objection usually means value wasn't established; return to what the problem costs them per month.\n• Ending with 'I'll send over more information' — that's a no in disguise; always propose a specific next step with a date attached.\n• Talking through the silence after your close — the first person to speak after the ask sets the terms, so let it hang.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Diagnose, then prescribe, then ask. A specific close attempted is worth ten perfect pitches that end with 'let me think about it.'",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Write your close sentence word-for-word — 'Shall we start with a one-month pilot at [your price]?' — plus your three most likely objections with one honest answer each. Keep it visible next to your screen for your next call.",
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
              heading: 'Common mistakes',
              body:
                  "• Waiting for referrals to happen naturally — happy customers rarely volunteer intros; the ask has to be built into your process or it never happens.\n• Asking at invoice or renewal time — pair the ask with a success moment, not a payment moment, or it reads as a trade.\n• Requesting vague 'feedback' instead of a quotable line — ask 'what changed since you started using us?' and get permission to quote the answer.\n• Never closing the loop with referrers — people stop referring when they never hear what happened; a thank-you with the outcome keeps the engine running.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Referrals are earned by results but harvested by asking. Build the ask into your process at the moment of customer success — every time.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Pick your single happiest customer and send them a two-line message right now: thank them for one specific result, then ask 'Is there one other [role] you know who deals with this? I'll draft the intro so you can just forward it.'",
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
              heading: 'Common mistakes',
              body:
                  "• Pouring budget into acquisition while activation leaks — doubling traffic into a step that loses 90% of it just doubles the waste; fix the leak first.\n• Defining stages vaguely — 'engaged user' means nothing; activation must be one concrete action, like 'created their first invoice within 24 hours'.\n• Tracking everything and acting on nothing — five stage-to-stage conversion numbers reviewed weekly beat forty dashboard charts nobody reads.\n• Benchmarking against industry averages instead of your own last month — the only funnel you can act on is yours, over time.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Growth is a funnel, not a firehose. Measure every stage, find the binding leak, and fix stages in order — retention before acquisition, always.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Draw your funnel on paper: one concrete user action next to each AARRR stage for your product. Fill in real or estimated conversion rates between stages and circle the worst one — that circle is your only growth priority this month.",
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
              heading: 'Common mistakes',
              body:
                  "• Launching on three channels at once — effort spread that thin never crosses the threshold where any single channel works; win one first.\n• Writing about your product instead of the customer's problem — nobody searches for your feature names; they search for their pain in their own words.\n• Quitting at week six — organic compounding starts around months three to six; stopping early forfeits everything already invested.\n• Measuring applause instead of customers — put one clear next step (subscribe, trial, book a call) at the end of every piece and track who takes it.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Choose one organic channel you can win, publish consistently for months, and judge it by customers — not claps. Compounding only works if you don't stop.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Turn your five most painful customer-interview quotes into five article or video titles your customer would actually search for. Pick one and write its outline — three headers plus the opening paragraph — in the next 25 minutes.",
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
              heading: 'Common mistakes',
              body:
                  "• Hitting 'boost post' and hoping — boosting optimizes for engagement, not customers; a Dhaka shop owner boosting to 'people who like similar pages' buys likes from people who will never order. Build a proper campaign with a conversion objective instead.\n• Spending before knowing your CAC ceiling — if a customer is worth 5,000 in lifetime value and each one costs 6,000 to acquire, scaling the ads just accelerates the loss.\n• Sending ad clicks to your homepage — the landing page must repeat the ad's exact promise, or every click leaks.\n• Changing three variables between tests — you learn nothing about which change worked; alter one at a time.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Ads are an experiment engine with a gas pedal. Know your CAC ceiling, test small, kill losers without sentiment, and only then press the pedal.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Calculate your maximum allowable CAC: take your LTV estimate from Week 7 and divide by three. Write that number somewhere you'll see it, and refuse to launch any ad test without a plan to measure cost per signup against it.",
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
              heading: 'Common mistakes',
              body:
                  "• Setting the success threshold after seeing the results — every ambiguous outcome becomes a 'win'; commit to the number before launch, in writing.\n• Running tests too small to read — ten visitors can't validate anything; size the experiment so a real effect would actually be visible.\n• Ending experiments early on excitement — day-two spikes routinely regress; run the full pre-committed window before calling a verdict.\n• Discarding losers without logging the learning — a failed test that proves 'discount framing doesn't move our buyers' is an asset; an unlogged one is pure cost.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Growth is a search process: hypothesis, smallest test, honest verdict, repeat. The founders who compound learnings outgrow the ones who compound tactics.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Write one experiment card, right now: 'We believe [change] will improve [metric] by [amount] because [reason]. We'll run it for [days] and call it a win at [threshold].' Put the launch on this week's calendar.",
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
              heading: 'Common mistakes',
              body:
                  "• Trying to document everything at once — a 40-process backlog stalls in week one; document the single most frequent, most hated task first and ship it.\n• Writing processes from memory at a desk — steps get skipped; document while actually performing the task.\n• Never testing the doc on another human — if your helper stumbles at step four, the doc is wrong, not the helper.\n• Treating a documented process as finished — the first time reality diverges from the doc, update it on the spot or it quietly dies.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Every repeated task is a process waiting to be written down. Documenting them is how the business stops being you and starts being a company.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Start a 'repeated tasks' note on your phone and seed it right now with the first three recurring tasks you can think of. Add to it every time you touch a repeated task this week — that list is your SOP backlog.",
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
              heading: 'Common mistakes',
              body:
                  "• Writing a manual when the job needs a checklist — if reading it takes longer than doing the task, nobody opens it twice.\n• Burying SOPs in a folder nobody visits — link each one from the tool or channel where the work actually happens.\n• Leaving SOPs ownerless — with no named owner, the first outdated step kills the team's trust in all of them.\n• Requiring permission to edit — if fixing a wrong step needs approval, the SOP freezes while reality walks away from it.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Write SOPs like checklists, keep them where the work happens, and let the team edit them freely. A slightly scruffy SOP that's used beats a beautiful one that isn't.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Take the most frequent task from your repeated-tasks list and write its SOP on one page: trigger, owner, numbered steps, definition of done. Write it while performing the task once — 30 minutes, done.",
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
              heading: 'Common mistakes',
              body:
                  "• Automating a process you haven't run manually three times — you encode a broken workflow, and now it breaks faster and invisibly.\n• Adopting a new tool for every problem — each extra tool adds a seam where data leaks and logins rot; stretch the tools you already have first.\n• Automating judgment calls — refund decisions and relationship messages need a human; automating them produces polished mistakes at scale.\n• Ignoring the payback math — a two-day setup that saves ten minutes a month is a hobby, not an automation.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Do it manually three times, then automate if it's frequent and rule-based. Buy back founder hours ruthlessly — they're the company's real currency.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "List the three tasks you did this week that were pure copy-paste between two tools. Pick the most frequent one and spend 20 minutes checking whether your existing tools can connect directly — if they can, set it up on the spot.",
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
              heading: 'Common mistakes',
              body:
                  "• Polishing non-constraints — a faster website means nothing while every order still waits a day for one person's approval; improving anything except the bottleneck improves nothing.\n• Not noticing the bottleneck is you — like a Dhaka delivery business where every order waits for the owner to personally confirm the bKash payment: growth stays capped at the owner's waking hours until that check is delegated or automated.\n• Jumping straight to 'speed it up' — removing or delegating the step is usually cheaper and more effective than accelerating it.\n• Fixing once and moving on — the constraint moves after every fix; re-measure or you'll spend next month optimizing last month's problem.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Improve the constraint and you improve the company; improve anything else and you've improved a report. Find where work waits — that's your real to-do list.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Sketch your single most important process — lead to cash, or order to delivery — as boxes on paper, and mark where work sits waiting. Circle the longest queue and write one sentence: who or what is everyone waiting on?",
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
              heading: 'Common mistakes',
              body:
                  "• Hiring because you're busy rather than against a named bottleneck — busyness is usually un-systematized chaos, and the hire inherits it with less context than you have.\n• Hiring a manager before there's anything to manage — early hires should do the work, not coordinate it.\n• Writing the role as an activity list — 'handle social media' attracts task-doers; 'own activation, hit 90% in 30 days' attracts owners.\n• Hiring a cheaper 'junior version' to save salary — in a five-person team, one weak hire is 20% of total output and 20% of the culture.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Hire late, hire slope, hire against a named bottleneck — and hand every new hire a documented process, not a pile of chaos.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Write down the single constraint that most limits your revenue this month, then draft a one-paragraph, outcome-based role description for the hire that would remove it. Even if you won't hire for six months, this paragraph becomes your hiring trigger.",
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
              heading: 'Common mistakes',
              body:
                  "• Interviewing on vibes with different questions per candidate — you end up ranking charm; fix the questions and score every candidate against the same criteria.\n• Skipping the paid work sample — it's the strongest performance predictor a small company has; two hours of real task beats ten interviews.\n• Competing on salary you can't pay — a Dhaka startup won't outbid a multinational bank on taka, but it can offer real ownership, faster growth, and a direct line to the founder; sell those explicitly instead of apologizing for the salary.\n• Moving slowly with a strong candidate — great people have options this week, not next quarter; a slow process is a silent rejection.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Structure the interview, pay for a work sample, and check references like an investigator. Then close with what startups uniquely offer: growth, ownership, and meaning.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Design the paid work sample for your most likely first hire: one real task from the actual job, sized at 2–4 hours, with the payment amount and what you'll watch for. Twenty minutes now means it's ready the day you need it.",
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
              heading: 'Common mistakes',
              body:
                  "• Letting outcomes belong to 'the team' — shared ownership means dropped balls belong to no one; every outcome needs exactly one name.\n• Making the owner do everything — the owner's job is to ensure it happens and flag risk early, not to be the only pair of hands.\n• Importing big-company process at four people — OKR software and approval chains are theater; outcomes with names plus a weekly 15-minute check is the whole system.\n• Reviewing commitments privately — public weekly commitments create gentle peer accountability that no amount of manager chasing can match.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Accountability is one name per outcome plus a weekly public rhythm. That's the whole system — anything more is bureaucracy you don't need yet.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "List your company's five to seven critical outcomes and write exactly one name next to each — including the ones that land on you. Mark where one person owns too much or a critical outcome has no owner; that's your next team conversation.",
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
              heading: 'Common mistakes',
              body:
                  "• Splitting equity 50/50 by default to dodge the awkward talk — the talk delayed becomes a lawyer's letter later; split on forward contribution and write down the reasoning.\n• Skipping vesting because 'we trust each other' — trust doesn't cover a co-founder leaving in month six with a permanent quarter of the company.\n• Leaving IP assignment unsigned — code and designs written before incorporation legally belong to the person, not the company, until papered.\n• Writing aspirational posters instead of trade-offs — 'excellence' decides nothing; 'speed over polish' actually resolves an argument.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Vesting for everyone, hard conversations early, agreements in writing, and culture as three real trade-offs you actually use. Cheap now, priceless later.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Book a two-hour co-founder conversation this week and send the agenda now: roles, decision rights, salary expectations, commitment level, and what happens if someone leaves. Solo founder? Spend the 30 minutes drafting your three trade-off culture principles instead.",
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
