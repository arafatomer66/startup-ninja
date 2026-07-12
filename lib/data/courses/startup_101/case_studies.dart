import '../../models/course_model.dart';

/// One real-company case study per week, keyed by week id. Kept out of the
/// tier files so week content and stories can evolve independently.
const courseCaseStudies = <String, CourseCaseStudy>{
  'w0': CourseCaseStudy(
    company: 'Airbnb',
    tagline: 'Kept shipping when everyone said no',
    story:
        "In 2008 Brian Chesky and Joe Gebbia were broke, maxed out on credit cards, and every investor they pitched passed — some didn't even reply. Their idea, strangers sleeping in your home, sounded ridiculous. Instead of waiting for permission, they kept shipping something every week: a relaunch for the Denver DNC when hotels sold out, then novelty election cereal — Obama O's and Cap'n McCain's — that raised about \$30,000 and kept the company alive.\n\nThat weekly-shipping stubbornness got them into Y Combinator in 2009, where Paul Graham's advice was more of the same: do things that don't scale, ship every week, talk to users. Twelve years after the cereal boxes, Airbnb went public at roughly a \$100 billion valuation.",
    takeaway:
        'Momentum beats perfection. The habit this course forces — one shipped deliverable every week, however rough — is the exact habit that kept Airbnb alive long enough to win.',
  ),
  'w1': CourseCaseStudy(
    company: 'Webvan vs Instacart',
    tagline: 'Same idea, opposite mindsets, opposite endings',
    story:
        "Webvan raised around \$800 million in the late-90s to deliver groceries. Convinced the idea was obviously right, it skipped validation and went straight to scale: giant automated warehouses, a fleet of trucks, launches in 26 cities. Demand never matched the spreadsheet, and in 2001 Webvan became one of the largest bankruptcies of the dot-com era.\n\nA decade later Instacart attacked the same problem with the opposite mindset: no warehouses, no trucks — personal shoppers picking from existing supermarkets, launched in one city, expanded only when the numbers worked. Same market, same idea; the difference was a founder who treated every belief as a hypothesis to test cheaply.",
    takeaway:
        "Startups rarely die because the idea was wrong — they die because founders scale before they validate. Spend conviction on solving the problem, not on your first guess at the solution.",
  ),
  'w2': CourseCaseStudy(
    company: 'Dropbox',
    tagline: 'Validated with a video before writing the hard code',
    story:
        "Drew Houston faced a brutal validation problem: Dropbox's magic was invisible until the deep technical work was done, and 'file syncing' sounded boring in interviews. So instead of building first, he recorded a three-minute screencast showing the product as if it existed — folders syncing across machines — and salted it with in-jokes for the Digg and Hacker News crowd he wanted as early adopters.\n\nOvernight, the beta waiting list jumped from about 5,000 to 75,000 people. Nothing had been built beyond a prototype. Houston had proof that the exact users he needed wanted the product badly, before committing years of engineering.",
    takeaway:
        "You can validate demand for a product that doesn't exist yet. A demo video, a landing page, a concierge test — proof of pull first, code second.",
  ),
  'w3': CourseCaseStudy(
    company: 'Pathao',
    tagline: 'From Dhaka couriers to international venture capital',
    story:
        "Pathao started in 2015 as a small Dhaka delivery company — motorbikes weaving through traffic that cars couldn't beat. The founders worked the local ecosystem step by step: early money and mentorship from local angels, then regional investors, and by 2018 a strategic investment from Indonesia's Go-Jek that pushed its valuation past \$100 million.\n\nEach stage of the funding ladder bought the next: angels funded the courier experiment, the courier data proved bikes could move anything, and that proof unlocked ride-sharing, food delivery, and international capital. None of it required being in Silicon Valley — it required knowing how the game's levels connect.",
    takeaway:
        'The ecosystem ladder — angels, accelerators, VCs, strategics — works from Dhaka too. Each rung exists to fund one specific proof; know which proof your next rung is buying.',
  ),
  'w4': CourseCaseStudy(
    company: 'bKash',
    tagline: 'A business model built for the unbanked',
    story:
        "In 2011 most Bangladeshis had no bank account — but nearly everyone had a mobile phone and a corner shop nearby. bKash's insight was a business model, not a technology: turn hundreds of thousands of small shopkeepers into human ATMs (agents earning commission on cash-in/cash-out), charge tiny fees on enormous transaction volume, and let the existing SIM card be the account.\n\nThe value proposition was one sentence a garment worker could repeat: send money home instantly, from the shop next door. It was so clear that 'bKash koro' became a verb. The model attracted the Gates Foundation, IFC, Ant Group and SoftBank, and bKash became the backbone of money movement for tens of millions.",
    takeaway:
        "A great value proposition fits in one sentence your customer would actually say. Design the revenue model around your market's reality — bKash monetized volume because its users couldn't pay margin.",
  ),
  'w5': CourseCaseStudy(
    company: 'Zappos',
    tagline: 'Sold shoes he didn\'t own to test the business',
    story:
        "In 1999, 'nobody will buy shoes without trying them on' was common sense. Nick Swinmurn didn't argue — he tested. He walked into local shoe stores, photographed inventory, and posted the photos on a bare-bones website. When an order came in, he bought the pair at full retail price and shipped it himself, losing money on every sale.\n\nAs an MVP it was 'wrong' in every way — unprofitable, unscalable, manual. But it answered the only question that mattered: will strangers pay for shoes online? They would. Zappos built the warehouses and logistics only after the risky assumption was proven, and Amazon eventually acquired it for about \$1.2 billion.",
    takeaway:
        "Your MVP's job is to answer one risky question at the lowest possible cost — losing money per order is fine if each order buys you proof.",
  ),
  'w6': CourseCaseStudy(
    company: 'Netflix vs Blockbuster',
    tagline: 'Won by studying the competitor\'s income statement',
    story:
        "Netflix's early team understood something Blockbuster's customers all felt but Blockbuster couldn't act on: a huge share of Blockbuster's profit — hundreds of millions a year — came from late fees. The thing customers hated most was the thing the incumbent could least afford to give up.\n\nSo Netflix positioned its subscription as the anti-Blockbuster: keep the DVD as long as you like, no late fees, ever. Blockbuster couldn't match it without blowing up its own P&L. In 2000 Blockbuster passed on buying Netflix for \$50 million; in 2010 Blockbuster was bankrupt while Netflix was worth billions.",
    takeaway:
        "Real competitive analysis studies how rivals make money, not just their features. An incumbent's profit center is often the weakness they cannot defend — position yourself there.",
  ),
  'w7': CourseCaseStudy(
    company: 'Chaldal',
    tagline: 'Made grocery delivery profitable one neighborhood at a time',
    story:
        "Grocery delivery has killed startups worldwide because the unit economics are brutal: small baskets, thin margins, expensive last-mile delivery. Chaldal, founded in Dhaka in 2013 and later backed by Y Combinator, attacked the math directly. Instead of one giant warehouse across town, it built small warehouses inside the neighborhoods it served — cutting delivery distance, time, and rider cost per order.\n\nEvery expansion decision followed the same rule: a new area got a warehouse only when order density made the per-order math work. That discipline — margin per order first, growth second — let Chaldal survive and scale where far better-funded clones burned out.",
    takeaway:
        'Grow only where the per-order math already works. If contribution margin is negative, scaling multiplies losses — fix the unit before adding volume.',
  ),
  'w8': CourseCaseStudy(
    company: 'Stripe',
    tagline: 'Closed early users by installing it for them on the spot',
    story:
        "When Patrick and John Collison were selling early Stripe, they didn't send follow-up emails. When a founder said 'yeah, I'll try it,' the brothers said 'give me your laptop' — and integrated Stripe right there. YC later named it the 'Collison installation.' The gap between interest and activation, where most sales die, was closed to zero.\n\nTheir first hundred customers came almost entirely from hand-to-hand work in their own network: YC founders with payment pain, one conversation at a time. Only after those users loved the product did Stripe build scalable channels on top of what it had learned face-to-face.",
    takeaway:
        "Your first 100 customers are recruited by hand, not acquired by funnel. Do the unscalable thing — walk the user to activation yourself — and mine every objection for product truth.",
  ),
  'w9': CourseCaseStudy(
    company: '10 Minute School',
    tagline: 'Content was the marketing — free lessons to millions',
    story:
        "Ayman Sadiq started 10 Minute School in 2015 with no ad budget — just short, sharp lessons posted free on YouTube and Facebook, where Bangladeshi students already spent their time. The content itself was the growth engine: every lesson answered a real exam question, every share reached another classroom, and the brand became synonymous with free help before it ever asked anyone to pay.\n\nBy the time paid courses launched, 10 Minute School had millions of learners and national name recognition — distribution most edtechs spend fortunes failing to buy. International venture investors followed the audience it had already built.",
    takeaway:
        'In a market where your users live on two platforms, publish genuinely useful content there for free. Audience first, monetization second — trust converts better than ads.',
  ),
  'w10': CourseCaseStudy(
    company: "McDonald's",
    tagline: 'Drew the kitchen in chalk until the system ran itself',
    story:
        "In 1948 the McDonald brothers shut their profitable drive-in to rebuild it as a system. They drew the kitchen at full scale in chalk on a tennis court and had staff mime every burger step for hours, rearranging stations until movement was choreography. The 'Speedee Service System' cut a 30-minute order to 30 seconds.\n\nThe deeper achievement wasn't speed — it was documentation. Every task was so precisely specified that teenagers with no experience could run the kitchen to identical quality. That's what made franchising possible: the system, not the founders, carried the quality. It's the story at the heart of The E-Myth on your bookshelf.",
    takeaway:
        "Scale requires the business to run on documented systems, not on your personal heroics. If a process lives only in your head, write the SOP this week — that's what your trackers are for.",
  ),
  'w11': CourseCaseStudy(
    company: 'PayPal',
    tagline: 'Hired for talent density — and spawned a mafia',
    story:
        "Early PayPal hired almost exclusively through personal networks — Max Levchin and Peter Thiel recruited the smartest people they knew, then asked those people to do the same. The bar was extreme and the filter was simple: would you start a company with this person? They optimized for raw ability and shared intensity over résumé polish or big-company titles.\n\nThe result became Silicon Valley legend: the 'PayPal Mafia.' Alumni went on to found or build YouTube, LinkedIn, Tesla, SpaceX, Palantir and Yelp. The lesson wasn't the exits — it was that a small team of exceptional, aligned people out-executes a large team of adequate ones by an absurd margin.",
    takeaway:
        "Your first ten hires set the ceiling of the company. Recruit through people you trust, hold an uncomfortable bar, and hire people you'd co-found with — culture is who you let in.",
  ),
  'w12': CourseCaseStudy(
    company: 'Mailchimp',
    tagline: 'Never raised a dollar, sold for \$12 billion',
    story:
        "Mailchimp began in 2001 as a side project inside a small Atlanta web agency. Ben Chestnut and Dan Kurzius never took venture money — customers were the only investors, so the product had to be profitable from day one. Growth compounded slowly for years, then exploded after a bold 2009 bet: a generous free tier, funded entirely by existing profits.\n\nBecause they owned 100% of the company, every decision optimized for the business rather than for the next funding round. In 2021 Intuit bought Mailchimp for about \$12 billion — the largest acquisition of a bootstrapped company ever, with the founders keeping proceeds that VC-backed founders of far bigger 'unicorns' never see.",
    takeaway:
        "VC is one financing tool, not a milestone. Bootstrapping trades speed for control and forces profitable habits — decide which game you're playing before you take anyone's money.",
  ),
  'w13': CourseCaseStudy(
    company: 'Buffer',
    tagline: 'Published its dashboard — and its forecasting mistake',
    story:
        "Buffer runs the most transparent finances in tech: public salaries, public revenue dashboards, public bank balance. That transparency made its 2016 crisis a masterclass for everyone else. The team had hired aggressively against an optimistic growth forecast; growth came in slower, and suddenly the cash-out date was months away.\n\nCEO Joel Gascoigne published the full post-mortem with real numbers: the overhiring, the runway math, and the fix — laying off 10 people, cutting salaries at the top, and rebuilding the forecast on actuals instead of hope. Buffer survived because the dashboard made the problem undeniable early enough to act.",
    takeaway:
        'Forecast on actuals, not ambition, and know your cash-out date to the month. A dashboard you review weekly turns a fatal surprise into an early, fixable warning.',
  ),
  'w14': CourseCaseStudy(
    company: 'Facebook',
    tagline: 'Handshake deals that cost years of lawsuits',
    story:
        "Facebook's founding is a legal cautionary tale told in depositions. Eduardo Saverin's early stake was set by informal agreement with no vesting; when his role faded, his shares were diluted through a corporate restructuring — and he sued. The Winklevoss twins claimed the idea came from their project and had only verbal understandings — they sued too, settling for around \$65 million.\n\nEvery one of those fights traces to the same root: foundational terms that lived in conversations instead of signed documents. Vesting schedules, IP assignment, and clear founder agreements from day one would have prevented most of it. Facebook was successful enough to absorb the damage; most startups aren't.",
    takeaway:
        "Paper everything while everyone is still friends: founder equity with vesting, IP assignment, written agreements. Legal hygiene is cheap insurance against the most expensive fights of your life.",
  ),
  'w15': CourseCaseStudy(
    company: 'Slack',
    tagline: 'The failed game that became a \$27.7B pivot',
    story:
        "Stewart Butterfield spent years and about \$10 million building Glitch, a whimsical online game. It flopped. In 2012, instead of forcing it, the team shut the game down — but noticed the internal chat tool they'd built to coordinate work was the thing they couldn't live without. They pivoted the whole company to it.\n\nSlack launched in 2014 and became one of the fastest-growing business products ever, reaching a \$27.7 billion acquisition by Salesforce in 2021. Butterfield had done it before too — Flickr was born the same way, from a failed game. The resilience wasn't stubbornness about the plan; it was honesty about what was actually working.",
    takeaway:
        "Resilience isn't refusing to change — it's separating the mission from the plan. When users consistently love a side effect more than the product, that side effect is the product.",
  ),
  'w16': CourseCaseStudy(
    company: 'Canva',
    tagline: 'Over 100 rejections — then a \$40B company',
    story:
        "Melanie Perkins pitched Canva from Perth, Australia — about as far from Silicon Valley as a founder can be — and collected more than 100 investor rejections over three years. Her response was systematic: after every no, she revised the deck, sharpened the story, and kept a list of every objection until the pitch answered them before they were asked.\n\nShe even learned kitesurfing to earn time with investor Bill Tai's network. When the round finally closed, the pitch had been iterated as rigorously as the product. Canva grew into one of the world's most valuable private software companies, worth tens of billions — built on a pitch that was rewritten a hundred times.",
    takeaway:
        "A pitch is a product: every rejection is user feedback on the story. Log the objections, revise the deck, pitch again — your Week 16 pitch is version one of many.",
  ),
};
