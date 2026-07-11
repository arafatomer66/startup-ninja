import 'package:flutter/material.dart';
import '../../../app/theme.dart';
import '../../models/course_model.dart';

const tier4 = CourseTier(
  id: 'tier4',
  title: 'Tier 4 — Mastery',
  subtitle: 'Funding, finance, legal, and the final pitch',
  color: AppColors.kitBusiness,
  icon: Icons.workspace_premium_rounded,
  weeks: [
    CourseWeek(
      id: 'w12',
      number: 12,
      title: 'Startup Financing — Bootstrapping to VC',
      goal:
          'Know every funding path and how to raise without losing your company.',
      lessons: [
        CourseLesson(
          title: 'Bootstrapping and revenue-based growth',
          description:
              'Growing on your own revenue — a legitimate strategy, not a fallback.',
          blocks: [
            LessonBlock(
              heading: 'What bootstrapping is',
              body:
                  "Funding the company from its own revenue (plus modest founder savings) instead of outside investment. Customers become your investors: every sale finances the next stage. It demands profitability discipline from day one and usually means slower headcount growth — but you keep 100% ownership and 100% of the decisions.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Bootstrapping preserves the two things funding consumes: equity and autonomy. No board pressure toward blitz-growth, no dilution, no fundraising treadmill eating a quarter of your year. Many excellent businesses — profitable, growing, life-changing for their founders — are simply not venture-shaped, and forcing them onto the VC path breaks them. Bootstrapping first also strengthens any later raise: revenue is leverage.",
            ),
            LessonBlock(
              heading: 'How to bootstrap well',
              body:
                  "• Charge from day one — free pilots don't fund payroll and don't prove demand.\n• Chase early cash flow: services, pre-orders, and annual-payment discounts fund product development.\n• Keep fixed costs brutal: every recurring cost raises the revenue you must earn monthly just to stand still.\n• Reinvest with the unit-economics lens (Week 7): put profit where LTV:CAC is best.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Bootstrapping is choosing customers as your investors. Slower headcount, total ownership — and the option to raise later from strength instead of need.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Angels, VCs, and how rounds work',
          description:
              'The funding ladder from pre-seed to Series A — check sizes, expectations, dilution.',
          blocks: [
            LessonBlock(
              heading: 'What the ladder looks like',
              body:
                  "Pre-seed: small checks (often angels, friends-and-family, micro-funds) against an idea and a team. Seed: institutional seed funds and angels funding early traction toward product-market fit. Series A: a lead VC funding a proven model to scale — with a board seat. Each round trades roughly 10–25% of the company for the capital to reach the next milestone.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Each round is a promise: seed money promises you'll find product-market fit; A money promises you'll scale it. Raising the wrong round for your stage wastes months of rejection, and raising more than you can grow into sets a valuation bar the next round must clear — the 'down round' trap. Dilution compounds: three rounds at 20% each leave founders with roughly half the company before employee options.",
            ),
            LessonBlock(
              heading: 'How to approach a raise',
              body:
                  "• Raise for a milestone, not a runway: 'this gets us to X metric, which unlocks the next round' beats '18 months of costs.'\n• Match investors to stage and thesis — pitch seed funds at seed, not growth funds.\n• Run it as a process: many conversations in a compressed window creates the competition that moves terms.\n• Model dilution across ALL future rounds before agreeing to any single one.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Rounds are milestone-financing with equity as the price. Know what each round must prove, raise from stage-matched investors, and count dilution to the end of the game.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Crowdfunding, grants, alternative capital',
          description:
              'Capital beyond equity — what each costs and when each fits.',
          blocks: [
            LessonBlock(
              heading: 'What the alternatives are',
              body:
                  "Reward crowdfunding: customers pre-pay for a product that doesn't exist yet — funding plus demand proof in one. Equity crowdfunding: many small investors buy shares through a platform. Grants: free money from governments and foundations (Week 3). Revenue-based financing: repay a fixed multiple as a percentage of monthly revenue. Venture debt: loans alongside equity rounds, for companies with predictable revenue.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Equity is the most expensive money you'll ever spend — sell 20% at seed and that slice could be worth a fortune later. The alternatives preserve ownership and often fit better: physical products suit crowdfunding, steady-revenue businesses suit revenue-based financing, deep-tech and social impact suit grants. Most funded companies stack several sources across their life.",
            ),
            LessonBlock(
              heading: 'How to choose',
              body:
                  "• Physical/consumer product with an audience? Reward crowdfunding — the campaign is also a marketing engine.\n• Steady monthly revenue? Revenue-based financing scales with your ability to pay.\n• R&D-heavy or impact-driven? Grant pipelines (Week 3 list) before equity.\n• Compare on three axes: cost of capital, control retained, and repayment pressure if things go wrong.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Equity is one aisle in the capital supermarket, and the priciest. Match the money's shape to your revenue's shape, and stack sources deliberately.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Cap tables, dilution, valuation, and term sheets',
          description:
              'The vocabulary of a raise — and the clauses that quietly cost founders their companies.',
          blocks: [
            LessonBlock(
              heading: 'What these terms mean',
              body:
                  "Cap table: the ledger of who owns what percentage. Valuation: pre-money (before the check) vs post-money (after — your dilution is check ÷ post-money). Term sheet: the non-binding summary of an investment's terms. The clauses that matter beyond price: liquidation preference (who gets paid first on exit, and how much), board composition (who controls decisions), pro-rata rights, anti-dilution, and founder vesting.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Founders negotiate valuation obsessively and sign the other clauses blind — but the fine print decides real outcomes. A 2x liquidation preference on a modest exit can leave founders with nothing while investors profit. A board you don't control can replace you. Participating preferred, full-ratchet anti-dilution, and aggressive vesting resets have each cost founders their companies at the moment of apparent success.",
            ),
            LessonBlock(
              heading: 'How to protect yourself',
              body:
                  "• Model the exit: at 3 plausible sale prices, compute exactly who gets what under the proposed terms. Surprises here are red flags.\n• Standard is your friend: 1x non-participating preference, broad-based weighted-average anti-dilution. Push back on anything richer.\n• Watch board math: founder control at seed is normal; losing it early is not.\n• Never sign a term sheet without a startup-experienced lawyer. This fee is never the place to save money.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Valuation is the headline; the clauses are the contract. Model who-gets-what at exit before signing, and pay for a real startup lawyer.",
            ),
          ],
        ),
      ],
      workshop:
          'Read a real (anonymized) term sheet together; flag the clauses that matter.',
      assignment:
          'Write your funding strategy: path, amount, valuation, target investors.',
      milestone: 'Deliverable 12 submitted: funding strategy.',
      resources: [
        CourseResource(
          title: 'Venture Deals — Brad Feld & Jason Mendelson',
          source: 'Book',
          url: 'https://www.venturedeals.com',
        ),
        CourseResource(
          title: 'YC SAFE documents (standard fundraising docs)',
          source: 'Templates',
          url: 'https://www.ycombinator.com/documents',
        ),
        CourseResource(
          title: 'AVC — Fred Wilson on venture mechanics',
          source: 'Blog',
          url: 'https://avc.com',
        ),
        CourseResource(
          title: 'The Art of Startup Fundraising — Alejandro Cremades',
          source: 'Book',
          url: 'https://www.goodreads.com/book/show/28815091-the-art-of-startup-fundraising',
        ),
      ],
    ),
    CourseWeek(
      id: 'w13',
      number: 13,
      title: 'Financial Planning, Forecasting & Dashboards',
      goal: 'Build a financial model you can defend and run the business with.',
      lessons: [
        CourseLesson(
          title: 'The three statements in plain language',
          description:
              'P&L, balance sheet, and cash flow — what each says and how they connect.',
          blocks: [
            LessonBlock(
              heading: 'What the three statements are',
              body:
                  "The P&L (income statement): did we make or lose money this period? Revenue minus costs, over a month or year. The balance sheet: what do we own and owe right now? Assets, liabilities, equity — a snapshot. The cash flow statement: where did cash actually come from and go? The bridge between paper profit and money in the bank.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Each statement answers a question the others can't. A P&L can show profit while the bank account empties (customers haven't paid yet); a fat bank balance can hide looming liabilities. Founders who read all three catch problems while they're cheap. Investors, banks, and eventually acquirers all speak this language — fluency is table stakes for every serious money conversation.",
            ),
            LessonBlock(
              heading: 'How to get fluent',
              body:
                  "• Build a simple monthly P&L now, even with tiny numbers: revenue, variable costs, fixed costs, result.\n• Track the connections: profit from the P&L flows into equity on the balance sheet; the cash statement explains the bank account's movement.\n• Learn the vocabulary that traps beginners: revenue ≠ cash received; profit ≠ cash flow; an invoice sent is not money in the bank.\n• Review monthly, ask one question each time: 'what surprised me?'",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "P&L = performance, balance sheet = position, cash flow = survival. Read all three monthly — each one catches what the others hide.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Building a realistic revenue & cost forecast',
          description:
              'Driver-based forecasting with assumptions you can defend — not hockey sticks.',
          blocks: [
            LessonBlock(
              heading: 'What driver-based forecasting is',
              body:
                  "A forecast built from the levers that actually generate revenue: leads × conversion rate × price × retention, not 'revenue grows 20% monthly because we said so.' Every line traces back to an assumption you can name, defend, and later check against reality. Costs follow the same logic: headcount plans, unit costs, and fixed commitments.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "A forecast's purpose isn't prediction — it's decision-making and honesty. Driver-based models tell you WHICH assumption broke when reality diverges ('conversion is 2%, not 5%'), so you fix the right thing. Investors read forecasts as IQ tests: a hockey stick with no drivers signals a founder who hasn't thought; a driver model with defensible assumptions signals one who has.",
            ),
            LessonBlock(
              heading: 'How to build yours',
              body:
                  "• Start from your funnel (Week 9) and unit economics (Week 7): traffic → conversion → customers → price → retention.\n• Write every assumption on a separate, visible line — assumptions are the model; the math is just plumbing.\n• Forecast 12–24 months monthly. Beyond that is fiction; don't pretend otherwise.\n• Each month, paste actuals next to forecast. The gaps are your learning agenda.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Forecast from named drivers, not wished-for growth rates. The model's value is in the assumptions it forces you to state — and then test.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Cash flow: why profitable startups still die',
          description:
              'Profit is an opinion; cash is a fact. See the crunch months before it hits.',
          blocks: [
            LessonBlock(
              heading: 'What the cash trap is',
              body:
                  "The timing gap between earning money and holding it. You deliver in January, invoice in February, get paid in April — but salaries and suppliers were due all along. Growth widens the gap: more orders mean more cash out (inventory, people) before cash in. That's how companies with growing revenue and real profits go bankrupt.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Running out of cash is a top-two startup killer, and it's uniquely unforgiving: profitability problems give you months of warning, cash problems give you a payroll date. The tools — a 13-week cash forecast, runway math, and payment-term discipline — are simple, but only work if used BEFORE the crunch. Cash crises are cheap to prevent and brutal to fix.",
            ),
            LessonBlock(
              heading: 'How to stay ahead',
              body:
                  "• Keep a rolling 13-week cash forecast: every expected in and out, by week. Update it weekly — it's the one sheet that can save the company.\n• Know your runway number: months of survival at current burn if revenue froze today.\n• Work the terms: invoice instantly, offer discounts for upfront/annual payment, negotiate longer supplier terms. Every day of gap closed is free financing.\n• Set a tripwire: when runway drops below 6 months, cutting and raising start NOW, not at 2 months.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Companies die on payroll dates, not P&L dates. Run the 13-week cash forecast weekly and treat runway under six months as an alarm, not a fact.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Metrics dashboard and scenario planning',
          description:
              'The few metrics worth watching weekly, and best/base/worst planning.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "A one-page dashboard of the handful of numbers that describe your company's health — typically cash and runway, revenue (and MRR if recurring), the funnel's key conversion, retention/churn, and CAC vs LTV — plus scenario planning: your forecast run three ways (best, base, worst) with pre-decided actions attached to each.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "What gets watched weekly gets managed; what gets buried in a spreadsheet gets discovered too late. A small dashboard beats a big one because attention is the scarce resource. Scenarios matter because single-line forecasts are always wrong: deciding NOW what you'll do if revenue comes in 40% low ('freeze hiring, cut X') means executing calmly instead of panicking in the moment.",
            ),
            LessonBlock(
              heading: 'How to build it',
              body:
                  "• Pick 5–7 metrics max — one per vital system: cash, growth, funnel, retention, efficiency.\n• Review the same numbers at the same time weekly; note the trend, not just the level.\n• Build worst-case honestly: revenue 40% under plan, key cost 30% over. Pre-write the response plan for each scenario.\n• Define tripwires: 'if churn passes X% or runway under Y months → trigger plan B automatically.'",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Five numbers watched weekly beat fifty reviewed quarterly. Plan three futures, attach decisions to each, and let tripwires — not moods — trigger action.",
            ),
          ],
        ),
      ],
      workshop:
          'Build a forecast in a shared template; stress-test worst-case together.',
      assignment:
          'Build your financial model: 12–24 month forecast, budget, dashboard.',
      milestone: 'Deliverable 13 submitted: financial model.',
      resources: [
        CourseResource(
          title: 'Financial Intelligence for Entrepreneurs — Berman & Knight',
          source: 'Book',
          url: 'https://www.goodreads.com/book/show/2549062.Financial_Intelligence_for_Entrepreneurs',
        ),
        CourseResource(
          title: 'SaaS Metrics 2.0 — David Skok',
          source: 'Guide',
          url: 'https://www.forentrepreneurs.com/saas-metrics-2/',
        ),
        CourseResource(
          title: 'Corporate Finance Institute — free courses',
          source: 'Courses',
          url: 'https://corporatefinanceinstitute.com/resources/',
        ),
        CourseResource(
          title: 'Profit First — Mike Michalowicz',
          source: 'Book',
          url: 'https://www.goodreads.com/book/show/18933309-profit-first',
        ),
      ],
    ),
    CourseWeek(
      id: 'w14',
      number: 14,
      title: 'Legal, IP & Compliance',
      goal: 'Protect the business — structure, contracts, IP, compliance.',
      lessons: [
        CourseLesson(
          title: 'Choosing a legal structure',
          description:
              'What each structure means for liability, tax, and investment — and when to upgrade.',
          blocks: [
            LessonBlock(
              heading: 'What the options are',
              body:
                  "Sole proprietorship: you and the business are legally the same — simplest, but your personal assets back every business debt. Partnership: same, shared among partners. Limited company (LLC/Ltd/private limited): a separate legal person — it owns the assets, carries the debts, signs the contracts, and can issue shares. Structures and names vary by country; the logic is universal.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Structure decides three things: whether a business failure can take your house (liability), how profits are taxed, and whether you can take investment at all — equity investors need shares to buy, which means a company. Operating as a sole proprietor while signing serious contracts is an unpriced personal risk most founders don't realize they're carrying.",
            ),
            LessonBlock(
              heading: 'How to decide',
              body:
                  "• Testing an idea with tiny stakes? Simplest local form is fine — don't let registration block validation.\n• Upgrade triggers: signing meaningful contracts, hiring, taking any investment, or liability that could exceed your savings.\n• If you'll EVER raise equity, incorporate a limited company sooner — retrofitting founders' shares, vesting, and IP later is expensive surgery.\n• Get one hour of local professional advice: structure + tax registration + licenses for your sector, done right once.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Structure is liability + tax + fundability. Start simple if stakes are tiny, but incorporate before contracts, hires, or investors make you wish you had.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Founder agreements and the contracts that prevent lawsuits',
          description:
              'The paperwork that prevents the classic disasters.',
          blocks: [
            LessonBlock(
              heading: 'What the core documents are',
              body:
                  "The founders' agreement: equity, vesting, roles, decision rights, and what happens when someone leaves. IP assignment: everything anyone builds belongs to the company — signed by founders, employees, and freelancers. Employment/contractor agreements with confidentiality. Customer terms of service. NDAs — useful with suppliers and partners, mostly theater with investors (who won't sign them).",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Almost every famous startup legal disaster traces to a missing early document: the departed co-founder who still owns 30%, the freelancer who legally owns the app's code, the handshake customer deal that turns into a dispute with no paper. These documents cost little when everyone is friends — which is exactly when they must be signed. After a conflict starts, the price is measured in the company itself.",
            ),
            LessonBlock(
              heading: 'How to paper up',
              body:
                  "• Founders' agreement with vesting: this week, not 'once things get serious.' Things are serious.\n• IP assignment from every human who touches the product — no exceptions, especially freelancers.\n• Use quality templates for routine docs, and a lawyer for the founders' agreement and anything involving equity.\n• Every real customer or supplier deal in writing: scope, price, payment terms, what happens on cancellation.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Sign the hard documents while everyone still likes each other. A founders' agreement and universal IP assignment are the cheapest disaster insurance in business.",
            ),
          ],
        ),
        CourseLesson(
          title: 'IP: trademarks, copyright, patents — what to actually file',
          description:
              'What each protects, what to file now vs later, and where money gets wasted.',
          blocks: [
            LessonBlock(
              heading: 'What each protects',
              body:
                  "Trademark: your brand — name, logo — in your industry and country; it's what stops copycats trading on your reputation. Copyright: creative works (code, content, designs), automatic on creation in most countries, registration strengthens enforcement. Patent: an invention — expensive, slow, public, and only worth it for genuinely novel technology. Trade secret: valuable knowledge protected by simply keeping it confidential (recipes, algorithms, processes).",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Early-stage IP mistakes run in both directions. Under-protecting: launching under a name you can't own, discovering a trademark conflict after printing everything. Over-protecting: burning \$15k on a patent for an idea the market rejects six months later. For most startups the real moat is speed and customer love — IP filings should follow proof, not precede it. The one near-universal early move: the trademark on your name.",
            ),
            LessonBlock(
              heading: 'How to sequence it',
              body:
                  "• Before naming anything: search the trademark registry and domain availability. Change the name NOW if it conflicts.\n• File the trademark in your home market once the name is validated — it's cheap relative to rebranding.\n• Copyright: ensure the company owns it via IP assignments (previous lesson); register key works if enforcement matters.\n• Patents: only for defensible, novel tech with money behind it — and talk to a patent attorney about the one-year clock public disclosure starts.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Trademark the name early, own the copyright through assignments, keep secrets secret, and patent only what's truly novel and already validated.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Tax, regulatory compliance, ethics, and data privacy',
          description:
              'The obligations you can\'t skip — without hiring a legal department.',
          blocks: [
            LessonBlock(
              heading: 'What the obligations are',
              body:
                  "The compliance baseline: business and tax registration (income tax, VAT/sales tax where thresholds apply, payroll withholding once you hire), sector licenses (food, finance, health, transport all have their own), data privacy rules for any customer data you hold (with laws like GDPR reaching across borders), and consumer-protection basics: honest claims, fair terms, working refunds.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Compliance debt compounds like the financial kind: unfiled taxes accrue penalties, a missing license can shut you on your best day, and a data breach with no privacy practices becomes both a legal and a trust catastrophe. Diligence is also where this bites quietly — investors and acquirers walk away from companies whose paperwork is chaos. Ethics is the same asset on a longer clock: startups run on trust they haven't earned yet.",
            ),
            LessonBlock(
              heading: 'How to stay clean cheaply',
              body:
                  "• Get one session with a local accountant: exactly which registrations and filings apply to your size and sector. Calendar every deadline.\n• Separate business and personal money from day one — the cheapest bookkeeping decision you'll make.\n• Data privacy minimum: collect only what you need, secure it, write a plain-language privacy policy, delete on request.\n• Ethics test for gray areas: 'if this decision were public, would I defend it?' If no — don't.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Register properly, file on time, guard customer data, and act as if everything becomes public. Compliance debt is the most expensive kind to refinance.",
            ),
          ],
        ),
      ],
      workshop:
          "Work through a legal-setup checklist for each student's specific business.",
      assignment:
          'Produce a legal checklist and list of documents/registrations to complete.',
      milestone: 'Deliverable 14 submitted: legal checklist.',
      resources: [
        CourseResource(
          title: 'Cooley GO — free startup legal docs & guides',
          source: 'Templates',
          url: 'https://www.cooleygo.com',
        ),
        CourseResource(
          title: 'YC standard documents',
          source: 'Templates',
          url: 'https://www.ycombinator.com/documents',
        ),
        CourseResource(
          title: 'WIPO — IP for startups and SMEs',
          source: 'Guide',
          url: 'https://www.wipo.int/sme/en/',
        ),
        CourseResource(
          title: 'GDPR.eu — plain-language data privacy guide',
          source: 'Guide',
          url: 'https://gdpr.eu',
        ),
      ],
    ),
    CourseWeek(
      id: 'w15',
      number: 15,
      title: 'Scaling, Exits & Founder Resilience',
      goal: 'Plan the long game and protect yourself while doing it.',
      lessons: [
        CourseLesson(
          title: 'National vs. global scaling',
          description:
              'When to go deeper at home versus expand abroad — readiness, costs, sequencing.',
          blocks: [
            LessonBlock(
              heading: 'What the choice is',
              body:
                  "Two growth directions: depth (more segments, products, and share in your home market) versus breadth (new countries). Expansion is never copy-paste — each market means new languages, payment habits, regulations, competitors, and trust-building from zero. The readiness signals: your home market is genuinely won or genuinely small, your model is documented and repeatable, and inbound pull already exists from the target market.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Premature international expansion is a classic scale-up killer: it splits focus, doubles cost structures, and dilutes the leadership team across time zones — usually while the home market was still winnable. Depth is systematically underrated: dominating one market builds the cash, brand, and playbook that make later expansion cheap. The best expansions look boring: one adjacent market, won properly, then the next.",
            ),
            LessonBlock(
              heading: 'How to sequence it',
              body:
                  "• Exhaust depth first: adjacent segments and products in your home market usually cost a fraction of a new country.\n• Pick market two by adjacency — language, culture, regulation, payment habits — not by size headlines.\n• Enter light: partnerships, distributors, or digital-only presence before offices and entities.\n• Set a kill criterion before entering: what result within 12 months means you withdraw?",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Win deep before you go wide. Expand to adjacent markets from documented playbooks — and know your exit criteria before you enter.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Leadership and high-performing teams at scale',
          description:
              "The founder's hardest transition: from doing the work to leading those who do.",
          blocks: [
            LessonBlock(
              heading: 'What changes at scale',
              body:
                  "Somewhere between 10 and 30 people, the founder's job inverts: from doing the work to designing the system that does the work. That means real delegation (outcomes handed over, not tasks micromanaged), deliberate communication rhythms (the informal osmosis of five people doesn't survive twenty), and a leadership layer — the first managers — chosen and trained instead of accidentally promoted.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "The founder who stays the hero-doer becomes the company's bottleneck (Week 10, but now it's you). Teams stall not from lack of talent but from unclear priorities, information hoarding, and decisions queuing behind one exhausted person. And the first managers you appoint multiply whatever they are — good ones scale your culture, bad ones scale their own.",
            ),
            LessonBlock(
              heading: 'How to make the transition',
              body:
                  "• Delegate outcomes with context: 'own activation, here's why it matters, here's the target' — then let them choose the how.\n• Install a communication rhythm: weekly team priorities, monthly all-hands on goals, quarterly direction reset.\n• Promote managers for people-skill and judgment, not tenure — and train them; managing is a learned craft.\n• Audit your calendar monthly: if it's full of tasks someone else could own, the transition has stalled.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Scale turns the founder from player to coach. Delegate outcomes, build the rhythm, choose managers deliberately — the team can only grow past you if you let it.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Exit strategies: IPO, mergers, acquisitions',
          description:
              'How each path works, what acquirers pay for, and being bought — not sold.',
          blocks: [
            LessonBlock(
              heading: 'What the paths are',
              body:
                  "Acquisition: a larger company buys yours — for the product, the team ('acquihire'), the customers, or to remove a threat; by far the most common exit. Merger: combining with a peer for scale. IPO: selling shares to the public — rare, late, and demanding. Secondary sale: founders or early investors sell some shares in a funding round without any company exit. No exit: profitable independence and dividends is also a legitimate end-state.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Your intended exit shapes today's choices: VC money essentially commits you to pursuing a large exit; bootstrapping keeps every option open, including 'never sell.' Understanding what acquirers value — recurring revenue, retention, clean books, a team that stays, strategic fit — tells you what to build toward years in advance. And the old adage holds: great companies are bought, not sold. Desperation shopping gets desperate prices.",
            ),
            LessonBlock(
              heading: 'How to keep options open',
              body:
                  "• Run clean from day one: contracts signed, cap table tidy, finances auditable (Week 14's diligence point).\n• Build relationships with likely acquirers as partners years early — most acquisitions start as partnerships.\n• Know your industry's multiples: what did comparable companies sell for, as a multiple of revenue or profit?\n• Align with investors on exit expectations BEFORE taking their money — mismatched exit ambitions end in boardroom wars.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Exits are built years before they happen: clean books, real relationships with potential buyers, and investors who share your ambition. Build to be bought — or to never need to be.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Burnout, mental health, and the long-term view',
          description:
              'Founder mental health treated as the business asset it is.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "The founder's operating manual for a decade-long game: recognizing burnout (chronic exhaustion, cynicism about work you loved, declining output despite longer hours), the identity trap (when you ARE the company, every setback is a personal wound), and the maintenance systems — sleep, exercise, relationships, and someone you can be fully honest with.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "The founder's judgment is the company's most-used asset, and burnout corrodes exactly that: decision quality, emotional regulation, and the ability to inspire. Founder breakdown is a genuine startup killer — it just gets recorded as 'co-founder conflict' or 'lost motivation.' Sustainable pace isn't self-indulgence; it's capacity management for the machine the whole company runs on. Grinding is sometimes necessary; grinding as identity is a slow-motion crash.",
            ),
            LessonBlock(
              heading: 'How to protect the asset',
              body:
                  "• Guard the basics like production infrastructure: sleep, movement, and real days off. Schedule them; they don't happen by default.\n• Separate identity from company: keep one hobby, one friendship circle, one identity thread that has nothing to do with the startup.\n• Get a truth-teller: a founder peer group, mentor, or therapist — someone you never have to perform for.\n• Watch your own dashboard: energy, cynicism, sleep. Treat two bad weeks as a tripwire, not a character test.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "You are the machine the company runs on — maintain yourself like it. Sustainable pace, separate identity, honest support: that's how founders last a decade.",
            ),
          ],
        ),
      ],
      workshop: 'Draft a scaling roadmap with milestones; share long-term goals.',
      assignment:
          'Produce a scaling roadmap with milestones and a stated long-term goal.',
      milestone: 'Deliverable 15 submitted: scaling roadmap.',
      resources: [
        CourseResource(
          title: 'High Growth Handbook — Elad Gil',
          source: 'Book (free online)',
          url: 'https://growth.eladgil.com',
        ),
        CourseResource(
          title: 'Blitzscaling — Reid Hoffman',
          source: 'Book',
          url: 'https://www.goodreads.com/book/show/44245196-blitzscaling',
        ),
        CourseResource(
          title: 'The Hard Thing About Hard Things — Ben Horowitz',
          source: 'Book',
          url: 'https://www.goodreads.com/book/show/18176747-the-hard-thing-about-hard-things',
        ),
        CourseResource(
          title: 'Reboot — founder coaching & resilience essays',
          source: 'Articles',
          url: 'https://www.reboot.io/blog/',
        ),
      ],
    ),
    CourseWeek(
      id: 'w16',
      number: 16,
      title: 'Capstone — The Pitch',
      goal: 'Bring everything together and pitch live to a panel.',
      lessons: [
        CourseLesson(
          title: 'Anatomy of a great pitch deck, slide by slide',
          description:
              'The 10–12 slides investors expect and what great looks like on each.',
          blocks: [
            LessonBlock(
              heading: 'What the deck contains',
              body:
                  "The canonical sequence: title (one-line what-you-do), problem, solution, why now, market size (your Week 6 bottom-up numbers), product (show it), traction, business model (Week 7 economics), competition (Week 6 map), team (why YOU win this), financials (Week 13 forecast), and the ask — how much, for what milestones. Ten to twelve slides, one idea each.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Investors see hundreds of decks and read them in minutes — the deck's job is to earn a meeting, not close a deal. Every slide answers one investor question in order: is this problem real? Can this team win? Is the prize big enough? Decks die from three wounds: clutter (40 slides), vagueness ('huge market, no competitors'), and burying the traction that would have earned the meeting on slide two.",
            ),
            LessonBlock(
              heading: 'How to build yours',
              body:
                  "• Notice: you already built every slide in this course. Assemble, don't create.\n• One idea per slide, readable in 3 seconds from across a room. Big numbers, short words.\n• Lead with strength: if traction is good, it goes early. If team is the story, open there.\n• Make the ask specific: amount, the milestones it buys, and what that proves for the NEXT round.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "A deck is 12 answers to 12 predictable questions, one per slide, led by your strongest card. Its job is the meeting — clarity beats completeness.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Storytelling: earning attention in 60 seconds',
          description:
              'Stories are what survive a hundred-pitch day — make the customer the hero.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "The narrative layer on top of your facts: opening with a concrete customer story (one real person, one real struggle, one bad Tuesday) instead of an abstract market claim; structuring the pitch as world-as-it-is → world-as-it-could-be → the bridge (you); and making numbers memorable by attaching them to human moments.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "After a day of pitches, investors remember stories and forget bullet points — narrative is how humans encode information. A specific story ('Rahima closes her shop every Thursday afternoon to do supplier paperwork') proves you know your customer in a way no TAM slide can. Specificity is credibility: vague pitches signal vague understanding.",
            ),
            LessonBlock(
              heading: 'How to build the story',
              body:
                  "• Open with one real customer from your Week 2 interviews: name, context, struggle, cost. Thirty seconds.\n• Structure: their world today → what becomes possible → why you're the bridge → proof it's working.\n• Humanize the numbers: '3 hours every week' lands harder as 'her Thursday afternoons, gone.'\n• Practice the first 60 seconds until flawless — attention is won or lost there.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Facts convince; stories get remembered. Open with one real customer's bad Tuesday, and hang every number on a human moment.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Handling investor questions and pushback',
          description:
              'Anticipate the hard questions and turn skepticism into engagement.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "The Q&A discipline: preparing answers for the predictable hard questions (why won't a big player copy you? why is CAC believable? what if this assumption is wrong?), answering the question actually asked — briefly, directly, evidence-first — and treating pushback as engagement rather than attack. Investors often press hardest on companies they like.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "The deck earns the meeting; Q&A decides it. Investors probe to test two things at once: the business's weak points and the founder's character under pressure — do you get defensive, waffle, or bluff? A calm 'we don't know yet; here's how we'll find out' outperforms a confident fabrication every time, because they're really underwriting your judgment.",
            ),
            LessonBlock(
              heading: 'How to prepare and respond',
              body:
                  "• Write the 10 questions you're most afraid of. Draft honest answers. Rehearse them out loud.\n• Answer the asked question first — one direct sentence — then add context. Don't detour to a rehearsed speech.\n• When you don't know: say so, then show your plan to find out. Never bluff a number.\n• Reframe attacks as interest: 'good question — here's what we've learned about that' keeps the room collaborative.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Q&A is a character test disguised as due diligence. Prepare your scariest questions, answer straight, and let 'here's how we'll find out' replace every bluff.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Delivery, presence, and rehearsal',
          description:
              'Practice out loud, under time, in front of people — until it sounds like conversation.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "The performance layer: pacing (slower than feels natural; pauses are power), presence (eye contact, standing still, hands quiet), energy calibrated to the room, and the rehearsal method that actually works — out loud, timed, in front of humans, repeatedly. Reading slides silently is not rehearsal; it's reading.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Delivery is the pitch's compression algorithm: the same content lands completely differently depending on confidence and pace. Under-rehearsed founders read their slides, rush when nervous, and blow the time limit — all instantly visible. Over-rehearsed-but-only-silently founders freeze at the first interruption. The goal is internalized, not memorized: you know the material so well you can converse with it.",
            ),
            LessonBlock(
              heading: 'How to rehearse',
              body:
                  "• Minimum 10 full run-throughs out loud, timed, standing — the physical act is different from mental review.\n• At least 3 in front of people who'll interrupt with questions mid-flow, like a real panel.\n• Record one run and watch it — painful and worth more than five blind reps.\n• Prepare the 60-second and 5-minute versions too; you'll be asked for both. Then sleep before the real one.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Rehearse out loud, timed, interrupted, and recorded — until the pitch is a conversation you could have woken up in the middle of. Then go graduate.",
            ),
          ],
        ),
      ],
      workshop:
          'Full dress-rehearsal pitches with peer + instructor feedback, then the live panel.',
      assignment:
          'Finalize your pitch deck and business plan; deliver the live pitch.',
      milestone:
          'Deliverable 16 — Graduation: live pitch to the panel. Course complete.',
      resources: [
        CourseResource(
          title: 'How to Build Your Seed Pitch Deck — YC',
          source: 'Guide',
          url: 'https://www.ycombinator.com/library/2u-how-to-build-your-seed-round-pitch-deck',
        ),
        CourseResource(
          title: 'The 10/20/30 Rule of PowerPoint — Guy Kawasaki',
          source: 'Article',
          url: 'https://guykawasaki.com/the_102030_rule/',
        ),
        CourseResource(
          title: 'Pitch Anything — Oren Klaff',
          source: 'Book',
          url: 'https://www.goodreads.com/book/show/9418877-pitch-anything',
        ),
        CourseResource(
          title: 'Talk Like TED — Carmine Gallo (delivery craft)',
          source: 'Book',
          url: 'https://www.goodreads.com/book/show/18077903-talk-like-ted',
        ),
      ],
    ),
  ],
);
