import 'package:flutter/material.dart';
import '../../../app/theme.dart';
import '../../models/course_model.dart';

const tier1 = CourseTier(
  id: 'tier1',
  title: 'Tier 1 — Foundations',
  subtitle: 'Mindset, real problems, and how the game works',
  color: AppColors.primary,
  icon: Icons.psychology_rounded,
  weeks: [
    CourseWeek(
      id: 'w1',
      number: 1,
      title: "The Founder's Mindset & Why Startups Fail",
      goal:
          'Get honest about what this takes and learn to avoid the classic killers.',
      lessons: [
        CourseLesson(
          title:
              'Startup vs. small business: why the distinction shapes everything',
          description:
              'A startup searches for a scalable model; a small business executes a known one. Which game you play changes everything.',
          blocks: [
            LessonBlock(
              heading: 'What is a startup?',
              body:
                  "A startup is a temporary organization searching for a business model that is repeatable and scalable — it doesn't yet know exactly who will pay, how much, or through what channel, and its job is to find out fast. A small business, by contrast, executes a proven model from day one: a restaurant, an agency, a shop. Both are honorable; they are different games with different rules.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "The distinction drives every decision. Startups optimize for learning speed and growth, tolerate losses while searching, and often need outside capital. Small businesses optimize for profitability from early on and rarely suit venture funding. Founders who confuse the two either starve a scalable idea by running it like a shop, or burn savings scaling a shop that was never meant to be a rocket.",
            ),
            LessonBlock(
              heading: 'How to tell which you are building',
              body:
                  "• Can the product serve customer #10,000 with little extra cost per customer? Scalable → startup territory.\n• Does revenue require your hands on every delivery? That's a business you run, not one that scales.\n• Do you want a livelihood or an outsized outcome? Be honest — the funding path, hiring, and pace all follow from this.\n• Neither answer is wrong. Choosing consciously is what matters.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Raising venture money for a lifestyle business — VCs need outlier outcomes, so their money commits you to a growth pace a steady-profit model can't sustain.\n• Running a scalable idea like a shop — pricing for early profit and refusing to experiment can starve a product that needed a year of searching before it clicked.\n• Copying startup theater without the model — pitch decks and demo days don't make an hourly-billed agency scalable; only marginal cost per customer does.\n• Choosing by identity instead of economics — 'I'm a founder' is not a strategy; run the customer-#10,000 test and let the answer pick your game.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "A startup is a search, not a smaller version of a big company. Know which game you're playing before you pick your strategy, funding, and pace.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Open a note and complete this sentence: 'I am building a [startup / small business] because serving customer #10,000 would cost me [almost nothing / the same effort as customer #10].' Pin it at the top of your planning doc. Revisit it after Week 2's interviews and see if the evidence agrees.",
            ),
          ],
        ),
        CourseLesson(
          title:
              "The founder's psychology: risk, resilience, and self-honesty",
          description:
              'An honest inventory of your risk tolerance, runway, and the habits that keep founders functional through the dip.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "A clear-eyed look at the inner game of founding: how much risk you can genuinely absorb (financially and emotionally), how you respond when things break, and whether you can tell yourself the truth when the evidence turns against your idea.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Startups fail slowly and then suddenly, and the founder's psychology is usually the first thing to crack. Overestimating your runway leads to desperate decisions; underestimating the emotional dip leads to quiet quitting around month six. Self-honesty is the rarest asset: founders who can say 'this isn't working' early get to try again with resources intact.",
            ),
            LessonBlock(
              heading: 'How to do the inventory',
              body:
                  "• Write your real number: how many months can you go without income, and what happens on the day after?\n• Name your dip behavior: when a project went badly before, what did you actually do — push through, hide, or pivot?\n• Build the resilience basics now: sleep, exercise, one person you can be fully honest with.\n• Schedule a monthly 'kill review': one hour where you argue against your own idea using evidence.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Counting best-case runway — you always spend faster than planned; compute burn from your last three months of actual expenses, then add 20% for surprises.\n• Treating the dip as a personal failure — nearly every founder hits it around months four to nine; a plan written in advance beats willpower summoned in the moment.\n• Confiding in no one — isolation quietly warps judgment; one brutally honest peer catches the drift you can no longer see in yourself.\n• Skipping the kill review because things 'feel fine' — feelings lag evidence by months; put it on the calendar and run it regardless of mood.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Your startup can only be as honest as you are with yourself. Know your runway, know your dip behavior, and build the support system before you need it.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Open your banking app and calculate your real monthly spend from the last three months — not the frugal number you hope for. Divide your savings by it and write the resulting runway (in months) at the top of your planning doc. Then message one person you trust and ask them to be your monthly honesty check.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Startup post-mortems: the top reasons companies actually die',
          description:
              'An autopsy of failed startups reveals the same killers again and again — learn the warning signs early.',
          blocks: [
            LessonBlock(
              heading: 'What kills startups',
              body:
                  "Post-mortem studies of hundreds of failed startups repeat the same causes: building something nobody needs (the #1 killer by far), running out of cash, the wrong team, being out-competed, mispriced products, and founder conflict. Almost none die from the thing founders fear most — someone stealing the idea.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Every killer on the list has early warning signs that founders systematically ignore: no one paying attention to the launch, sales conversations that end in 'interesting…', a burn rate that only works if everything goes right. Knowing the failure patterns turns them into a checklist you can run against your own company every month — while there's still time to correct.",
            ),
            LessonBlock(
              heading: 'How to use failure data',
              body:
                  "• 'No market need' is prevented in Weeks 2–3 of this course: evidence before building.\n• 'Ran out of cash' is prevented in Weeks 7 and 13: unit economics and cash-flow forecasting.\n• 'Wrong team' is prevented in Week 11: deliberate hiring and co-founder agreements.\n• Read two real post-mortems in your industry this week — pattern-match against your own plan.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Reading post-mortems as entertainment — extract the single decision that killed each company and ask when you'll face the same fork; a story you can't act on taught you nothing.\n• Assuming 'no market need' can't happen to you because friends liked the idea — friends are the worst dataset in startups; Week 2 replaces them with evidence.\n• Guarding the idea instead of the execution — demanding NDAs before coffee chats costs you the feedback that prevents the real killers, protecting against a theft that almost never happens.\n• Checking cash quarterly instead of monthly — the 'suddenly' in 'slowly, then suddenly' is usually just a skipped cash check; runway erodes in months, not years.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Startups rarely die of murder; they die of self-inflicted wounds with visible early symptoms. Learn the symptoms now so you can catch them in your own company later.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Search '[your industry] startup shutdown post-mortem' and read two of them. For each, write one sentence naming the killer — no market need, cash, team, competition. Then note which of the two failure modes your current plan is most exposed to.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Are you solving a problem or in love with an idea?',
          description:
              'The most expensive mistake in startups is building something nobody asked for. Learn the test that catches it.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "The critical distinction between problem-love and idea-love. Problem-love: 'restaurant owners lose hours every week reconciling supplier invoices — I'll fix that any way that works.' Idea-love: 'I want to build an app that does X' — where X survives every piece of contrary evidence because it's yours.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Idea-love is the root of the #1 startup killer. When you're attached to a solution, every signal gets bent to support it: lukewarm feedback becomes 'they don't get it yet,' no sales becomes 'we need more features.' When you're attached to a problem, evidence can redirect you cheaply — the solution is disposable, so you iterate instead of sinking.",
            ),
            LessonBlock(
              heading: 'How to test yourself',
              body:
                  "• State your startup without mentioning your solution. Can you? If every sentence starts with the product, that's a warning.\n• Ask: if a better solution to this problem appeared tomorrow, would I switch to building that? A real problem-founder says yes.\n• List three pieces of evidence that would convince you to stop. If nothing could, you're in love with the idea.\n• Rewrite your one-liner as: [who] struggles with [problem] costing them [what].",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Writing the one-liner product-first — 'an app that…' trains you to defend features; lead with who hurts and what it costs them, and the product becomes negotiable.\n• Treating a pivot as failure — a Dhaka founder who set out to build a grocery-delivery app and discovered shopkeepers' real pain was tracking supplier credit didn't fail; the problem steered them to the money.\n• Having no kill criteria — if no possible evidence could stop you, you're not running experiments, you're collecting decoration for a decision already made.\n• Confusing persistence with attachment — persist stubbornly on the problem, iterate ruthlessly on the solution; reversing those two is how years get wasted.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Fall in love with the problem and stay promiscuous about solutions. The founders who win are the ones evidence can still steer.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Rewrite your startup one-liner as '[who] struggles with [problem], costing them [time/money/reputation]' — without naming your product once. Then list the three pieces of evidence that would convince you to stop. Save both where your monthly kill review will find them.",
            ),
          ],
        ),
      ],
      workshop:
          'Live teardown of 2–3 famous startup failures — students diagnose what went wrong.',
      assignment:
          'Write your founder self-assessment and a one-page "why me, why now" statement.',
      milestone:
          'Deliverable 1 submitted: founder self-assessment + why-me-why-now.',
      resources: [
        CourseResource(
          title: "What's A Startup? First Principles — Steve Blank",
          source: 'Article',
          url: 'https://steveblank.com/2010/01/25/whats-a-startup-first-principles/',
        ),
        CourseResource(
          title: 'Top Reasons Startups Fail — CB Insights',
          source: 'Research',
          url: 'https://www.cbinsights.com/research/report/startup-failure-reasons-top/',
        ),
        CourseResource(
          title: 'How Not to Die — Paul Graham',
          source: 'Essay',
          url: 'https://paulgraham.com/die.html',
        ),
        CourseResource(
          title: 'The Hard Thing About Hard Things — Ben Horowitz',
          source: 'Book',
          url: 'https://www.goodreads.com/book/show/18176747-the-hard-thing-about-hard-things',
        ),
      ],
    ),
    CourseWeek(
      id: 'w2',
      number: 2,
      title: 'Finding & Validating a Real Problem',
      goal: 'Prove your problem is real — with evidence from actual humans.',
      lessons: [
        CourseLesson(
          title: 'Problem-first thinking and how to spot real pain',
          description:
              'Great startups start from pain, not products. The three signals of a problem worth solving.',
          blocks: [
            LessonBlock(
              heading: 'What is a real problem?',
              body:
                  "A problem worth building on scores high on three dimensions: it's frequent (happens weekly, not yearly), urgent (people are trying to solve it now, not someday), and expensive (it costs money, time, or reputation). A mild annoyance people mention but never act on is not a startup problem — it's small talk.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Products built on weak problems face the hardest sales motion in business: convincing people to care. Products built on burning problems get pulled out of your hands — customers chase you, forgive rough edges, and pay early. The quality of your problem sets the ceiling on everything downstream: marketing, pricing, retention.",
            ),
            LessonBlock(
              heading: 'How to hunt for problems',
              body:
                  "• Look where money already leaks: manual workarounds, spreadsheets held together with tape, jobs people hate paying for.\n• Watch behavior, not words: what do people in your target group already pay for, botch, or complain about repeatedly?\n• Mine your own edge: problems you've lived (your industry, your community) come with insight competitors can't Google.\n• Score every candidate: frequent? urgent? expensive? Two of three minimum.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Chasing problems you find interesting instead of ones people pay to solve — your curiosity is a bonus; their existing spend is the signal.\n• Mistaking a complaint for a problem — people vent about plenty they'd never pay to fix; look for what they've already acted on, not what they grumble about.\n• Picking infrequent pain — a problem that surfaces once a year can't sustain habit, retention, or word of mouth, no matter how acute it feels in the moment.\n• Skipping the written score — every idea feels frequent, urgent, and expensive from inside your own head; force each candidate through the three-question filter on paper.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Hunt for pain that is frequent, urgent, and expensive — then verify people are already trying (and failing) to solve it. Existing struggle is the best predictor of future payment.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "List five problems you've personally witnessed in your industry or community. Score each 0–2 on frequent, urgent, and expensive — six points maximum. Carry the top scorer into this week's interviews and park the rest.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Running customer interviews without leading the witness',
          description:
              "The craft of asking questions that don't contaminate the answer.",
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "The customer interview is a structured conversation designed to extract truth about a person's problems — not to pitch your solution. The core rules: ask about their life, not your idea; ask about the past ('when did this last happen?'), not the hypothetical future ('would you use…?'); and let silence do the heavy lifting.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "People are polite. Ask 'would you buy this?' and they'll say yes to make you feel good, then never buy. A leading question produces false validation — the most dangerous data in startups, because it sends you confidently building the wrong thing. Ten well-run interviews produce more truth than a thousand survey responses.",
            ),
            LessonBlock(
              heading: 'How to run one',
              body:
                  "• Open with their world: 'Walk me through the last time you dealt with [problem area].'\n• Dig into specifics: What did it cost? Who else was involved? What did you try?\n• Never mention your solution until the final minutes — if at all.\n• Ask 'what have you tried?' — past attempts are the strongest evidence of real pain.\n• Log every interview the same day: exact quotes, not summaries.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Pitching in the first minute — the moment they know your idea, every answer bends toward politeness; keep the solution for the final minutes or skip it entirely.\n• Asking hypotheticals — 'would you use…?' measures kindness, not demand; ask what they actually did last Tuesday and what it cost them.\n• Interviewing only friends and family — they'll protect your feelings; recruit strangers who genuinely own the problem, even if it takes ten awkward messages.\n• Reconstructing interviews from memory days later — you'll remember the flattering parts and lose the exact objections; log verbatim quotes the same day.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Interview about their past behavior, not your future product. The truth lives in what people have already done, spent, and tried.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Write a five-question interview script that opens with 'Walk me through the last time you dealt with [problem area].' Then message three people who live with the problem and ask for 15 minutes this week. Booking the calls is today's win; running them is this week's.",
            ),
          ],
        ),
        CourseLesson(
          title: 'The "mom test" and reading honest signal',
          description:
              'Why compliments are worthless and what honest signal actually sounds like.',
          blocks: [
            LessonBlock(
              heading: 'What is the mom test?',
              body:
                  "A rule for designing questions so honest that even your mother — who loves you and wants to encourage you — couldn't lie to you with the answer. Instead of 'do you like my idea?' (she'll say yes), ask 'when did you last struggle with this, and what did you do?' Facts about her life can't flatter you.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Almost everyone you interview behaves like your mom: encouraging, polite, and useless as data. Compliments ('sounds great!'), generic claims ('I always…', 'everyone needs this'), and future promises ('I'd definitely buy it') all feel like validation and predict nothing. Founders who can't tell signal from politeness build on applause and die at the checkout.",
            ),
            LessonBlock(
              heading: 'How to read signal',
              body:
                  "• Strong signal: they currently pay for an alternative, they've built a workaround, they ask 'when can I have it?', they introduce you to others unprompted.\n• Weak signal: compliments, feature suggestions, 'you should talk to…' with no intro, any sentence about the hypothetical future.\n• Commitment is the currency: time (a follow-up meeting), reputation (an intro), or money (a deposit). Ask for one at the end of every good conversation.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Counting compliments as validation — 'sounds great!' predicts nothing; only facts about their life and commitments of time, reputation, or money count as data.\n• Accepting 'I'd definitely buy it' — future promises cost nothing to make; convert them on the spot by asking for a deposit, an intro, or a scheduled follow-up.\n• Letting 'everyone needs this' slide past — generic claims mean the conversation has drifted from their life; steer back with 'when did YOU last deal with this?'\n• Ending good conversations without an ask — if you never request a commitment, you never find out whether the enthusiasm was real; always close with a concrete next step.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Ignore opinions about your idea; collect facts about their life and evidence of commitment. If they won't give time, reputation, or money — the compliment was the whole purchase.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Take your interview notes — or any pitch conversations you've had so far — and strike through every compliment, generic claim, and future promise. What survives is past behavior, money spent, and workarounds built: your actual evidence. Count the surviving items and write the number down.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Validation tools: surveys, landing pages, fake-door tests',
          description:
              'Cheap experiments you can run before writing a line of code.',
          blocks: [
            LessonBlock(
              heading: 'What these are',
              body:
                  "Three low-cost instruments for measuring demand before building: surveys (broad but shallow — good for finding interview candidates and sizing frequency), landing pages (describe the product, measure email signups or pre-orders), and fake-door tests (a 'buy' or 'try' button that measures clicks before the feature exists, then explains it's coming).",
            ),
            LessonBlock(
              heading: 'Why they matter',
              body:
                  "Interviews prove the problem; these tools prove demand at scale and put a number on it. A landing page that converts 30 of 500 visitors to a waitlist is evidence you can build on — and show investors. The discipline they enforce is the point: intent measured by action (a click, an email, a deposit), never by opinion.",
            ),
            LessonBlock(
              heading: 'How to run them',
              body:
                  "• Surveys: short, behavior-focused ('how do you currently…?'), never 'would you use…?'. End by asking for a 15-minute call.\n• Landing page: one clear promise, one call-to-action, drive 100+ targeted visitors, measure conversion. Under 2% is a warning; over 10% is a green light.\n• Fake door: 'Get started' button → 'We're launching soon, leave your email.' Clicks are intent; emails are commitment.\n• Set the success threshold before you launch the test — or you'll rationalize any result.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Driving random traffic — 500 untargeted visitors tell you nothing; a garments supplier testing a digital order-tracking tool should post in merchandisers' Facebook groups, not boost to all of Bangladesh.\n• Setting the success bar after the results arrive — you'll rationalize any number into a win; write the pass/fail threshold down before the test goes live.\n• Measuring vanity actions — page views, likes, and shares aren't intent; only clicks on 'buy', submitted emails, and deposits count as demand.\n• Building the full product 'to test it properly' — the entire point is spending days instead of months; a one-page promise with a button is enough to measure intent.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Validate with actions, not opinions — and decide what number counts as success before you run the experiment.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Draft the one-sentence promise for your landing page: 'We help [who] do [what] without [pain].' Then write your success threshold — for example, 5% of 200 targeted visitors leave an email. The page can wait until tomorrow; the promise and the bar are today's 30 minutes.",
            ),
          ],
        ),
      ],
      workshop:
          "Interview role-play — students practice and critique each other's interview scripts.",
      assignment: 'Run at least 10 customer conversations; log the findings.',
      milestone: 'Deliverable 2 submitted: evidence-backed problem statement.',
      resources: [
        CourseResource(
          title: 'The Mom Test — Rob Fitzpatrick',
          source: 'Book',
          url: 'https://www.momtestbook.com',
        ),
        CourseResource(
          title: 'How to Talk to Users — YC',
          source: 'Video/Guide',
          url: 'https://www.ycombinator.com/library/6g-how-to-talk-to-users',
        ),
        CourseResource(
          title: 'Talking to Humans — Giff Constable',
          source: 'Book (free PDF)',
          url: 'https://www.talkingtohumans.com',
        ),
      ],
    ),
    CourseWeek(
      id: 'w3',
      number: 3,
      title: 'The Startup Ecosystem & How the Game Works',
      goal: 'Understand the players and start plugging into them.',
      lessons: [
        CourseLesson(
          title:
              'The ecosystem map: incubators, accelerators, investors, government',
          description:
              "Who's who in your startup world and what each player actually offers — and wants.",
          blocks: [
            LessonBlock(
              heading: 'What the ecosystem is',
              body:
                  "The network of institutions around startups: incubators (early-stage support, workspace, mentoring, usually no equity), accelerators (fixed-term intensive programs, small investment for small equity, demo day), angel investors (individuals writing early checks), venture capital funds (institutional money for scale), and government programs (grants, policy support, subsidized services).",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Each player serves a specific stage and takes something specific in return. Founders who don't know the map waste months pitching VCs with an idea-stage company, or give up equity to an accelerator for services an incubator offers free. Knowing who does what — and at what stage — lets you take the right help at the right time.",
            ),
            LessonBlock(
              heading: 'How to map yours',
              body:
                  "• List every incubator, accelerator, angel network, VC, and government program active in your city or industry.\n• For each: what stage do they serve, what do they give, what do they take?\n• Mark the two or three that fit your current stage — idea-stage founders want incubators and grants, not Series A funds.\n• Find one person you could reach at each — the map is people, not logos.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Pitching stage-mismatched players — months spent courting a growth fund with an idea-stage deck is time an incubator would have spent actually helping you.\n• Giving equity for services an incubator offers free — compare what the accelerator actually adds (network, capital, credibility) before signing away 5–7%.\n• Collecting logos instead of people — a list of institutions with no named contact is decoration; the map only works once each row has a human you could message.\n• Treating the map as one-and-done — programs open, close, and change focus every year; a stale map sends you pitching a fund that pivoted to a different sector.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "The ecosystem is a stage-matched supply chain of help. Know every player's give-and-take, and approach the ones built for where you are now.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Open a spreadsheet with six columns: name, type, stage served, what they give, what they take, one reachable contact. Fill in five rows for your city or industry today. Star the one row that best matches your current stage — that's your first approach.",
            ),
          ],
        ),
        CourseLesson(
          title: 'How investors think and where money comes from',
          description:
              'The portfolio math behind venture capital and what "fundable" really means.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "A look inside the investor's business model. VCs invest other people's money (pension funds, corporations, wealthy families) and must return the fund multiple times over. Because most startups in a portfolio fail, the model depends on rare outliers: one company returning 50x pays for twenty failures. Angels invest their own money and can afford different logic.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "This math explains everything founders find confusing about investors: why a 'good business' earning steady profits gets rejected (it can't return the fund), why market size questions dominate every pitch, and why investors push for aggressive growth. 'Fundable' doesn't mean 'good' — it means 'could plausibly be enormous.' Your company can be excellent and still be wrong for VC.",
            ),
            LessonBlock(
              heading: 'How to use this knowledge',
              body:
                  "• Before pitching anyone, ask: can this business credibly return their fund? If not, seek angels, revenue, or grants instead.\n• Understand the fund's stage and thesis — a Series B fund cannot write your pre-seed check no matter how much they like you.\n• Remember the investor across the table also has investors — their questions are the questions they'll be asked.\n• Decide what YOU want: VC pace is a commitment, not a prize.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Pitching a solid, profitable business as venture-scale — the rejection isn't about quality; if it can't plausibly return the fund, aim at angels, grants, or revenue instead.\n• Ignoring fund stage and thesis — a Series B fintech fund cannot write your pre-seed check for an edtech idea; ten targeted pitches beat a hundred sprayed ones.\n• Treating a VC term sheet as a trophy — the money commits you to their pace and exit timeline; celebrate only if you actually want that race.\n• Hearing 'no' as 'bad business' — it usually means 'wrong portfolio fit'; ask which one it was, then adjust the target list rather than the self-esteem.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Investors aren't judging whether your business is good — they're judging whether it fits their portfolio math. Learn their model so you can choose and pitch deliberately.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Write one honest paragraph answering: could this business plausibly return a whole fund — a 50x outcome? If yes, note the market size and margin logic behind that claim. If no, write your alternative capital path in one line: angels, grants, or customer revenue. Either answer is fine; not knowing is not.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Grants, schemes, and startup policy (local & global)',
          description:
              'The non-dilutive money most founders never claim.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "Non-dilutive funding: money you don't repay and don't give equity for. Government startup funds and innovation grants, ministry and development-agency programs, startup competitions with cash prizes, subsidized incubation, and international programs open to founders in emerging markets. It exists because governments want startups to create jobs.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "This is the cheapest capital you will ever access — and the least competitive, because most founders never apply. A grant that covers your first year changes your negotiating position with every future investor: you arrive with traction instead of desperation. For businesses that aren't venture-scale, grants plus revenue may be the entire funding strategy.",
            ),
            LessonBlock(
              heading: 'How to find and win them',
              body:
                  "• Search your country's ICT/startup ministry programs, development bank schemes, and innovation funds — list everything with deadlines.\n• Match eligibility honestly: stage, sector, founder profile. Applying wrong wastes the relationship.\n• Budget real time: applications take 10–20 hours. Reuse your Week 4 canvas and Week 13 numbers.\n• Enter credible competitions — even losing builds network, pitch practice, and visibility.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Assuming you're not eligible without checking — programs like Bangladesh's iDEA pre-seed grants or Startup Bangladesh's funding exist precisely for early founders who assume this money isn't for them.\n• Treating the application as a formality — reviewers read hundreds; your Week 2 interview evidence and Week 13 numbers beat adjectives every time.\n• Applying to everything — a mismatched application burns 15 hours and your credibility with an agency you may need next year; qualify hard before you write.\n• Ignoring the deadline calendar — most grant cycles open once or twice a year; missing one costs six months of runway you could have had free.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Free money exists and almost nobody applies. One funded grant application can be worth a whole seed round in avoided dilution.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Spend 30 minutes searching '[your country] startup grant' plus your ICT or innovation ministry's program pages. List every live program with its deadline and eligibility in one document. Mark the single program whose next deadline you can realistically meet — that's your target.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Networking before you need it',
          description:
              'Relationships compound like interest — plant them months before you ask for anything.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "Deliberate relationship-building with founders, mentors, operators, and investors — started now, while you need nothing from anyone. The principle: the intro you'll need in month twelve must be planted today, because trust doesn't compress. Asking a stranger for money is cold outreach; asking someone who has watched you build for six months is a warm continuation.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Nearly everything scarce in startups moves through relationships: the first customers, the co-founder, the investor intro, the candid warning that saves you a year. Founders who network only when desperate broadcast desperation. Founders who consistently show up, share progress, and help others accumulate a compounding asset that no competitor can copy.",
            ),
            LessonBlock(
              heading: 'How to do it (without being that person)',
              body:
                  "• Give first: share what you're learning, make intros, answer questions in communities. Value out before value in.\n• Build in public: a short regular update on what you're building makes people feel invested in your journey.\n• Attend the rooms where your ecosystem gathers — consistently, not once.\n• Keep a simple contact log: who, where met, what they care about, when you last spoke.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Networking only when fundraising — desperation is legible from the first message; the intro you need in month twelve has to be planted months earlier.\n• Extracting before depositing — asks from strangers get ignored; make two intros or share one genuinely useful insight before requesting anything.\n• Collecting contacts instead of relationships — a hundred business cards lose to ten people who have watched you build for six months.\n• Going dark between events — silence resets the relationship to zero; a short monthly progress update keeps you in mind without asking for anything.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "Network like an investor: small consistent deposits, made early, compounding quietly until the day you need to draw on them.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Send one build-in-public update today: three sentences on what you're building and one thing you learned this week, posted to LinkedIn, a founder group, or sent as five direct messages. Then start your contact log with ten names — who, where you met, what they care about.",
            ),
          ],
        ),
      ],
      workshop:
          'Guest session or recorded interview with a local founder/investor + live Q&A.',
      assignment:
          'Build an ecosystem map for your city/industry: named people, programs, events.',
      milestone: 'Deliverable 3 submitted: personal ecosystem map.',
      resources: [
        CourseResource(
          title: 'Startup Genome — global ecosystem reports',
          source: 'Research',
          url: 'https://startupgenome.com',
        ),
        CourseResource(
          title: 'a16z — how VCs think',
          source: 'Articles',
          url: 'https://a16z.com',
        ),
        CourseResource(
          title: 'Never Eat Alone — Keith Ferrazzi (networking)',
          source: 'Book',
          url: 'https://www.goodreads.com/book/show/84699.Never_Eat_Alone',
        ),
      ],
    ),
  ],
);
