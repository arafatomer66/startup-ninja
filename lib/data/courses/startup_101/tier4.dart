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
              heading: 'Common mistakes',
              body:
                  "• Paying yourself nothing indefinitely — a zero founder salary is hidden burn on your savings and your judgment; put a survival wage in the model from month one.\n• Confusing bootstrapping with not spending — starving a proven acquisition channel to 'stay lean' just slows compounding; frugal on overhead, aggressive on what works.\n• Letting services revenue quietly become the business — consulting funds the product only if you cap it (say, 40% of team hours) and defend the cap.\n• Mixing personal and company money — you lose the one signal bootstrappers live on: whether the business actually funds itself.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Bootstrapping is choosing customers as your investors. Slower headcount, total ownership — and the option to raise later from strength instead of need.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Open your bank statement and compute this month's true profit after a survival wage for yourself. Then write down two ways to pull cash forward — for a Dhaka SMB that might be offering your three best customers 10% off for annual prepay via bKash or bank transfer. Send the first offer before the day ends.",
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
              heading: 'Common mistakes',
              body:
                  "• Trickle-raising one investor at a time — with no parallel conversations there's no urgency, and 'maybe' can stretch for months; compress the process into a 4–6 week window.\n• Pitching the wrong stage — sending a pre-revenue deck to a Series A fund burns the intro and your calendar; check a fund's last five investments before emailing.\n• Optimizing valuation over investor quality — the highest bidder with heavy terms and no help costs more than a fair price from a lead who opens doors.\n• Treating the close as the win — the money starts a milestone clock; if you haven't planned what it must prove, you've bought runway, not progress.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Rounds are milestone-financing with equity as the price. Know what each round must prove, raise from stage-matched investors, and count dilution to the end of the game.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "List ten investors whose stage and thesis actually match you — verify by reading their five most recent deals, not their website copy. Next to each, write one warm-intro path (founder they backed, mutual contact, event). That list is the raw material of your future raise.",
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
              heading: 'Common mistakes',
              body:
                  "• Launching a crowdfunding campaign without an audience — successful campaigns bring their first 30% of backers from an existing list; build the email list for months first or the campaign opens to silence.\n• Taking revenue-based financing on thin margins — the repayment percentage comes off the top, so at 20% gross margin it can consume most of your profit; it fits high-margin recurring revenue, not low-margin trading.\n• Treating grants as free money — reporting burden, payment delays, and mission drift toward what funders want are real costs; price them in before applying.\n• Stacking fixed repayments on unpredictable revenue — debt-shaped money plus lumpy income is how one bad quarter becomes a default.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Equity is one aisle in the capital supermarket, and the priciest. Match the money's shape to your revenue's shape, and stack sources deliberately.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Write down how much capital you actually need in the next 12 months and what it buys. Then map each need to the cheapest source that fits its shape — grant, pre-orders, revenue-based, or equity — and mark the one application or campaign you could start this week.",
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
              heading: 'Common mistakes',
              body:
                  "• Negotiating only the valuation — a 2x participating preference at a high valuation can pay you less at exit than 1x non-participating at a lower one; the clauses are where the money moves.\n• Signing before modeling the waterfall — if you can't say exactly what you'd take home at three sale prices, you don't know what you're signing.\n• Using the investor's lawyer or a generalist family lawyer — one has a conflict, the other doesn't know what 'broad-based weighted average' means; both cost you.\n• Giving up board control at seed 'to show good faith' — normal at Series B, a red flag at seed, and nearly impossible to claw back.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Valuation is the headline; the clauses are the contract. Model who-gets-what at exit before signing, and pay for a real startup lawyer.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Open a spreadsheet and build a toy waterfall: your current cap table, a hypothetical raise at 20% dilution, then who gets what at three exit prices under 1x non-participating versus 2x participating preference. Twenty minutes of arithmetic buys you permanent immunity to the most expensive fine print in startups.",
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
              heading: 'Common mistakes',
              body:
                  "• Reading only the P&L — profit can grow while receivables balloon and the bank account drains; the P&L alone never shows a cash crisis coming.\n• Mentally spending invoiced revenue — an invoice sent is a promise, not money; count it as cash only when it clears.\n• Skipping the balance sheet as 'accountant stuff' — accrued VAT, payroll withholding, and supplier debts hide there, and they all come due.\n• Reviewing quarterly instead of monthly — a quarter is long enough for a fixable problem to become a fatal one.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "P&L = performance, balance sheet = position, cash flow = survival. Read all three monthly — each one catches what the others hide.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Draft this month's one-page P&L straight from your bank statement: revenue in, variable costs, fixed costs, result. It will be imperfect — that's fine. The habit of producing it monthly matters more than decimal precision.",
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
              heading: 'Common mistakes',
              body:
                  "• Top-down sizing dressed as a forecast — 'if we capture 1% of the market' is a wish, not a driver; build up from leads, conversion, and price.\n• Hardcoding numbers into formulas — buried constants can't be stress-tested; every assumption gets its own labeled cell.\n• Modeling revenue drivers but flat costs — support headcount, payment fees, and server bills scale with the same growth you're forecasting.\n• Never reconciling against actuals — a forecast you don't check monthly isn't a model, it's decoration for the pitch deck.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Forecast from named drivers, not wished-for growth rates. The model's value is in the assumptions it forces you to state — and then test.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Open a blank sheet and write your revenue drivers as five labeled cells: monthly leads, conversion rate, average price, purchases per customer, retention. Fill in your honest current numbers and compute next month's revenue from them. You've just built row one of your real model.",
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
              heading: 'Common mistakes',
              body:
                  "• Confusing the bank balance with runway — much of that balance is already spoken for by supplier orders, salaries, and VAT due; runway is what's left after commitments.\n• Invoicing late and chasing never — in markets like Bangladesh, where corporate buyers routinely stretch payment to 60–90 days, every day you delay the invoice adds a day to the gap; invoice on delivery and follow up the first day overdue.\n• Funding growth entirely from your own cash — each bigger order means more inventory and wages out before anything comes in; negotiate supplier terms and customer deposits so growth doesn't eat you.\n• Updating the cash forecast monthly — cash moves weekly, and the week you weren't looking is the one with the payroll surprise.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Companies die on payroll dates, not P&L dates. Run the 13-week cash forecast weekly and treat runway under six months as an alarm, not a fact.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Build version one of your 13-week cash forecast: thirteen columns, one per week, with every expected inflow and outflow from your bank account and outstanding invoices. Circle the week with the lowest balance — that number, not this month's revenue, is your real constraint.",
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
              heading: 'Common mistakes',
              body:
                  "• Tracking thirty metrics — a dashboard nobody can hold in their head is a report, not an instrument; if everything is watched, nothing is.\n• Reading levels instead of trends — 'churn is 4%' means little; 'churn has risen three weeks straight' is the actual signal.\n• Writing scenarios without pre-committed actions — a worst case with no attached plan just becomes a document you panic-read later.\n• Moving the tripwire when you hit it — 'runway under 6 months' quietly becomes 'under 4' because acting felt premature; a tripwire renegotiated under stress isn't one.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Five numbers watched weekly beat fifty reviewed quarterly. Plan three futures, attach decisions to each, and let tripwires — not moods — trigger action.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Write your dashboard on one page: five to seven metrics, this week's value beside last month's. Then set one tripwire with a pre-decided action — for example, 'runway under 6 months → freeze hiring and start investor conversations.' Put a recurring 20-minute weekly review in your calendar.",
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
              heading: 'Common mistakes',
              body:
                  "• Incorporating in a prestige foreign jurisdiction before any investor asks — you get double compliance costs and cross-border tax headaches for a signal nobody requested; incorporate where you operate until a term sheet says otherwise.\n• Staying a sole proprietor while signing leases and hiring — every contract is now backed by your personal savings and family assets.\n• Splitting equity '50/50, we'll formalize later' with no company to hold the shares — there is nothing to own yet, so the promise is unenforceable exactly when it matters.\n• Registering the company but skipping sector licenses and tax registrations — the entity exists, but one inspection can still shut the business.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Structure is liability + tax + fundability. Start simple if stakes are tiny, but incorporate before contracts, hires, or investors make you wish you had.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Look up the incorporation process, cost, and timeline for your country — in Bangladesh that's RJSC name clearance followed by private limited company registration. Then write one sentence stating your personal upgrade trigger: the specific event (first hire, first big contract, first investor conversation) that means you incorporate that week.",
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
              heading: 'Common mistakes',
              body:
                  "• Skipping vesting 'because we trust each other' — trust is exactly what vesting protects; without it, a co-founder who quits in month four keeps their full stake forever.\n• Letting a freelancer build the MVP with no IP assignment — in most jurisdictions paying for code does not transfer copyright, so the contractor legally owns your product.\n• Making verbal equity promises to early helpers — 'we'll sort you out later' is remembered differently by everyone, usually during diligence.\n• Asking investors to sign NDAs — they see hundreds of pitches and won't sign; insisting signals inexperience, not caution.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Sign the hard documents while everyone still likes each other. A founders' agreement and universal IP assignment are the cheapest disaster insurance in business.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Draft a one-page term summary and send it to your co-founder(s) today: equity split, four-year vesting with a one-year cliff, roles, decision rights, and what happens if someone leaves. Agreeing on this page is the hard part — turning it into a signed legal document afterward is mechanical.",
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
              heading: 'Common mistakes',
              body:
                  "• Building the brand before searching the registry — discovering a conflict after the logo, packaging, and social handles exist turns a free name change into an expensive rebrand.\n• Filing a patent before the market says yes — spending five figures protecting an idea customers haven't validated inverts the risk you should be reducing.\n• Assuming paying for work means owning it — without a signed assignment, the agency or freelancer keeps the copyright to 'your' designs and code.\n• Demoing patentable tech publicly without checking disclosure rules — in many countries public disclosure starts a clock (or kills patentability outright) before you've filed anything.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Trademark the name early, own the copyright through assignments, keep secrets secret, and patent only what's truly novel and already validated.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Spend fifteen minutes searching your national trademark registry, the domain registrar, and the app stores for your exact name and close variants. If anything conflicts in your industry, start a rename shortlist today — the name is never cheaper to change than right now.",
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
              heading: 'Common mistakes',
              body:
                  "• Running the business through a personal bank account — it wrecks bookkeeping, weakens your liability shield, and makes every tax filing a forensic project.\n• Ignoring VAT/sales-tax thresholds until you've crossed them — back-taxes plus penalties arrive as one bill, timed for when you can least afford it.\n• Copy-pasting a privacy policy that promises practices you don't follow — in a dispute, a false policy is worse than none; write only what you actually do.\n• Treating compliance as a one-time setup — registrations expire and filing dates recur; without a calendar, 'done' silently becomes 'overdue.'",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Register properly, file on time, guard customer data, and act as if everything becomes public. Compliance debt is the most expensive kind to refinance.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Open your calendar and enter every filing deadline you already know — tax returns, VAT, license renewals — as recurring events with one-week warnings. Then book the one-hour session with a local accountant to fill in the ones you don't know exist.",
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
              heading: 'Common mistakes',
              body:
                  "• Expanding to escape home-market competition — your problems travel with you, and the new market adds its own; fix the model before exporting it.\n• Choosing market two by GDP headlines instead of adjacency — a Dhaka-proven model usually travels to Chattogram or Sylhet for a fraction of what a Dubai launch costs, and teaches you the expansion playbook safely.\n• Copy-pasting pricing and payment methods — a price and payment flow tuned for one market's wallets and habits routinely fails in the next; localize both before launch.\n• Entering with no kill criterion — without a pre-agreed 12-month bar, underperforming country offices become zombies that bleed cash and leadership attention for years.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Win deep before you go wide. Expand to adjacent markets from documented playbooks — and know your exit criteria before you enter.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "List three depth moves still open in your home market — an adjacent segment, a second product for existing customers, an untouched channel — with a rough revenue estimate for each. Compare the best one against your most tempting foreign market on cost and time to first revenue. Write down which wins and why.",
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
              heading: 'Common mistakes',
              body:
                  "• Delegating tasks instead of outcomes — you stay the priority queue for every decision, which is the bottleneck with extra steps.\n• Promoting your best individual contributor into management as a reward — you often lose a great builder and gain a struggling manager; select for people-judgment, and make a senior IC track so promotion isn't the only raise.\n• Assuming information still flows by osmosis — what five people absorbed in the hallway, twenty people never hear; if you haven't said it three times in the rhythm, assume it wasn't heard.\n• Snatching back delegated work at the first mistake — it teaches the team that decisions aren't really theirs, and the queue re-forms at your desk.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Scale turns the founder from player to coach. Delegate outcomes, build the rhythm, choose managers deliberately — the team can only grow past you if you let it.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Audit this week's calendar and mark every block someone else could own. Pick one recurring task from the marked set and hand it over today — with the outcome, the context on why it matters, and a check-in date. Do not take it back at the first wobble.",
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
              heading: 'Common mistakes',
              body:
                  "• Building to sell instead of building to last — acquirers can smell a company optimized for exit, and it reads as weakness; strong independent businesses get the best offers.\n• Waiting for acquirers to find you — most acquisitions grow out of partnerships and relationships built years earlier; if the first contact is the offer, you have no leverage.\n• Letting the diligence room rot — unsigned contracts, a messy cap table, and handshake equity kill deals in the final weeks, after the price was agreed.\n• Taking VC money while privately wanting a modest exit — a fund that needs a 10x outcome will block the acquisition that would change your life.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Exits are built years before they happen: clean books, real relationships with potential buyers, and investors who share your ambition. Build to be bought — or to never need to be.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Write down five companies that could plausibly acquire your business within five years, and for each, one sentence on why (customers, product, team, or threat). Then note one partnership or integration you could start with each in the next year — that's how acquisition relationships actually begin.",
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
              heading: 'Common mistakes',
              body:
                  "• Wearing 80-hour weeks as a badge — past a point, extra hours produce worse decisions, not more output; you're shipping fatigue into your own product.\n• Waiting for a crisis to build support — a peer group or mentor found during a breakdown helps far less than one built while things are fine.\n• Performing fine-ness for your co-founder — hidden struggle surfaces later as 'sudden' conflict or a resignation nobody saw coming; honesty between founders is infrastructure.\n• Deferring every vacation until 'after the next milestone' — there is always a next milestone; unrested years accrue like unpaid debt, and the interest is judgment.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "You are the machine the company runs on — maintain yourself like it. Sustainable pace, separate identity, honest support: that's how founders last a decade.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Open your calendar and block one fully offline day within the next two weeks — no email, no metrics. Then message one founder peer or mentor and propose a recurring monthly check-in where neither of you has to perform. Both actions take ten minutes; both compound for years.",
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
              heading: 'Common mistakes',
              body:
                  "• A 'no competitors' slide — investors read it as 'didn't look'; alternatives always exist, even pen-and-paper, and mapping them honestly builds credibility.\n• Top-down market sizing — '1% of a huge number' signals no customer contact; use your bottom-up Week 6 numbers.\n• Burying traction on slide ten — if you have revenue, retention, or growth, it belongs in the first three slides; it's the strongest evidence you own.\n• Slides that read like documents — a paragraph-dense deck gets skimmed in three minutes and skipped; if a slide can't be absorbed in three seconds, split it or cut it.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "A deck is 12 answers to 12 predictable questions, one per slide, led by your strongest card. Its job is the meeting — clarity beats completeness.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Create twelve blank slides with only headlines — each headline a full sentence stating that slide's claim, like 'Retention is 85% after six months.' If a headline is vague or you can't write one, you've found the slide that needs work. Fill in visuals later.",
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
              heading: 'Common mistakes',
              body:
                  "• Opening with the market size instead of a person — abstractions blur together after a day of pitches; a face and a Tuesday do not.\n• Inventing a composite customer — one probing question ('can we talk to her?') exposes it; use a real interviewee you can actually produce.\n• Quoting numbers without anchors — '3 hours saved weekly' evaporates; 'her Thursday afternoons back' sticks.\n• Overloading the story — two customers, three struggles, and a subplot dilute it to noise; one person, one struggle, one moment.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Facts convince; stories get remembered. Open with one real customer's bad Tuesday, and hang every number on a human moment.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Pick one real person from your Week 2 interview notes and write your 30-second opening: name, context, the struggle, what it costs them — like the pharmacy owner in Mirpur who loses two hours every evening reconciling supplier ledgers by hand. Read it aloud twice and cut every sentence that isn't doing work.",
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
              heading: 'Common mistakes',
              body:
                  "• Bluffing a number you don't know — one caught fabrication poisons every other claim in the room; 'I don't have that figure, I'll send it today' costs nothing.\n• Getting defensive at pushback — investors press hardest on companies they're interested in; treating the probe as an attack turns interest into doubt.\n• Answering the question you wished they'd asked — detouring into a rehearsed speech reads as evasion; one direct sentence first, context after.\n• Rehearsing only softball questions — practicing the pitch without practicing 'why won't Google copy you?' means meeting your hardest moment live.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Q&A is a character test disguised as due diligence. Prepare your scariest questions, answer straight, and let 'here's how we'll find out' replace every bluff.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Write the five questions you most dread being asked about your business. Draft an honest two-sentence answer to each — evidence first, no padding — and say them out loud once. The dread mostly evaporates on the first spoken rep.",
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
              heading: 'Common mistakes',
              body:
                  "• Rehearsing silently by reading slides — the mouth, timing, and nerves are untrained, and it shows within thirty seconds on stage.\n• Memorizing a word-for-word script — the first interruption derails it and you can't find your place; internalize the flow of ideas instead.\n• Solving a time overrun by talking faster — rushed delivery loses the room; cut slides, never pace.\n• Making the panel your first live audience — the tenth run-through in front of interrupting humans is where the pitch becomes conversational; don't spend reps one through nine on judges.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Rehearse out loud, timed, interrupted, and recorded — until the pitch is a conversation you could have woken up in the middle of. Then go graduate.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Do one full run-through right now: stand up, start a timer, deliver the pitch out loud, and record it on your phone. Watch it back once and write down the three things to fix. That single painful rep is worth five silent read-throughs.",
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
