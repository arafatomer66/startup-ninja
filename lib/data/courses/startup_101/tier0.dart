import 'package:flutter/material.dart';
import '../../../app/theme.dart';
import '../../models/course_model.dart';

const tier0 = CourseTier(
  id: 'tier0',
  title: 'Pre-Course',
  subtitle: 'Get set up and find your starting point',
  color: AppColors.textSecondary,
  icon: Icons.flag_rounded,
  weeks: [
    CourseWeek(
      id: 'w0',
      number: 0,
      title: 'Onboarding & Kickoff',
      goal:
          "Set expectations, form the community, and lock in each student's starting idea (or lack of one).",
      lessons: [
        CourseLesson(
          title:
              'Welcome, how the cohort works, and what "done" looks like by Week 16',
          description:
              'A tour of the 16-week journey: the weekly rhythm, how the four tiers build on each other, and exactly what you will have built by graduation day.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "Startup 101 is a build-as-you-learn program. Over 16 weeks you move through four tiers — Foundations, Building the Business, Growth, and Mastery — and each week produces one concrete deliverable. By Week 16 you will have a validated problem, a business model, an MVP, real customer conversations, a financial model, and a pitch you have delivered live.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Most startup education fails because it stays theoretical: you watch, you nod, you build nothing. This program inverts that. The knowledge is sequenced so every concept lands exactly when you need it for that week's build — which is how founders actually learn in the wild, just compressed and de-risked.",
            ),
            LessonBlock(
              heading: 'How it works',
              body:
                  "• Each week: 2 live sessions (~90 min), one workshop, and 3–4 hours of async work.\n• Every week ends with a deliverable — no exceptions, rough is fine.\n• Tiers build on each other: don't skip ahead; Week 7's numbers need Week 4's model.\n• Your peer group reviews your work — and you review theirs.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Binge-watching lessons ahead of the build schedule — the material only sticks when you apply it the same week; watching Week 8 content in Week 2 is entertainment, not learning.\n• Treating the early weeks as skippable warm-up — Week 7's unit economics are built on Week 4's business model; skip the foundation and the numbers collapse later.\n• Planning your hours around your best week — schedule for your worst week (sick kid, work crunch), because two missed deliverables is where most dropouts start.\n• Waiting for a 'better' idea before engaging — the process of validating a mediocre idea teaches you more than sitting out with a perfect one.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "By Week 16 'done' means: a real problem validated with real people, a working MVP, honest numbers, and a live pitch. Everything in between exists to get you there.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Write one sentence describing what your Week 16 demo day looks like: the problem you solved, who you talked to, what you built. Pin it somewhere you'll see weekly. Then open your calendar and count the 16 weeks forward — put a hard marker on the graduation date.",
            ),
          ],
        ),
        CourseLesson(
          title: 'Tools setup: workspace, templates, community channel',
          description:
              "Get your working environment ready before the real work starts, so tooling never slows you down.",
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "A one-time setup session: your document workspace (where every weekly deliverable lives), the templates you'll fill in each week (canvases, interview logs, finance sheets), and the community channel where feedback, questions, and accountability happen.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Friction kills momentum. If finding the template takes twenty minutes, the assignment slips to tomorrow, then to never. Founders who set up their environment once — and keep everything in one place — ship consistently because starting costs them nothing.",
            ),
            LessonBlock(
              heading: 'How to do it',
              body:
                  "• Create one folder (or workspace) named after your startup — every deliverable goes in it, numbered by week.\n• Copy each template the day it's assigned; never work from a blank page.\n• Join the community channel and turn notifications ON for your peer group.\n• Bookmark everything: workspace, templates, channel. Zero clicks to lose you.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Spreading work across Notion, Google Docs, and random local files — by Week 6 you won't find your Week 2 interview notes when the business model needs them; pick one home and stay.\n• Building an elaborate setup with tags, databases, and automations — that's procrastination wearing a productivity costume; a numbered folder per week is enough.\n• Muting the community channel on day one — you'll miss the feedback thread on your own deliverable and only discover it two weeks late.\n• Starting each assignment from a blank page instead of the template — you'll spend your energy on formatting instead of thinking.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "One workspace, one folder per week, one channel. If it takes more than ten seconds to find your work, fix that today — not in Week 6.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Create your startup's workspace folder right now and add sixteen numbered subfolders, Week 01 through Week 16. Join the community channel, post a one-line hello, and turn notifications on. Bookmark both — total time, under fifteen minutes.",
            ),
          ],
        ),
        CourseLesson(
          title:
              'Icebreakers and founder introductions — building the peer network early',
          description:
              'Meet the founders building alongside you — your accountability system, feedback panel, and first network.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "Structured introductions with the people taking this journey with you: who they are, what they're building (or looking for), and what they bring. You'll be grouped with 3–5 peers who follow your work for the whole 16 weeks.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Founders who go through hard things alone quit quietly. A peer group does three jobs: it holds you accountable when motivation dips, it gives you honest feedback before customers or investors judge you, and it becomes your first professional network — future co-founders, intros, and customers regularly come from a founder's first cohort.",
            ),
            LessonBlock(
              heading: 'How to do it',
              body:
                  "• Introduce yourself with substance: background, the problem you care about, the skill you can offer others.\n• Ask at least three other founders a real question about their idea.\n• Note who is building near your space — they see your blind spots best.\n• Exchange contacts with your assigned group and agree on a weekly check-in time.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Introducing yourself with a job title instead of a problem — 'I'm a marketer' invites nothing; 'I'm trying to fix how Dhaka corner shops restock inventory' gets you three useful conversations before lunch.\n• Only befriending founders in your exact niche — the founder building garments logistics sees the same last-mile and payment-collection pains as your grocery-delivery idea, from an angle you can't.\n• Collecting contacts without booking the check-in — a phone number with no standing weekly slot is a contact you'll never message; lock the recurring time before Week 0 ends.\n• Staying in listen-only mode — peers invest in people who gave them feedback first; ask real questions and you become worth answering.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "The curriculum teaches you; the cohort keeps you going. Invest in these relationships in Week 0 and they pay you back every week after.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Write your three-sentence intro — background, the problem you care about, one skill you can offer — and post it in the community channel. Then reply to two other founders' intros with a genuine question about their idea. Twenty minutes, and your network exists.",
            ),
          ],
        ),
        CourseLesson(
          title: 'The one rule: every week you build, not just watch',
          description:
              'This is not a lecture series — every week ends with a piece of your startup actually shipped.',
          blocks: [
            LessonBlock(
              heading: 'What this is',
              body:
                  "The single non-negotiable of the program: every week you submit the deliverable, even if it's rough, incomplete, or wrong. Watching every lesson and submitting nothing counts as falling behind. Submitting something imperfect counts as progress.",
            ),
            LessonBlock(
              heading: 'Why it matters',
              body:
                  "Startups are learned by doing, and the doing is exactly the part that feels uncomfortable — calling strangers, writing numbers you're unsure of, showing unfinished work. The weekly-shipping habit trains the core founder muscle: finishing and exposing work before you feel ready. Every successful founder has it; no amount of watching builds it.",
            ),
            LessonBlock(
              heading: 'How to do it',
              body:
                  "• Block the same 3–4 hours in your calendar every week, now, for all 16 weeks.\n• When stuck, ship the 70% version and note what's missing — done beats perfect.\n• If a week collapses, submit a one-paragraph version rather than nothing.\n• Track your streak. A visible chain of 16 deliverables is your real certificate.",
            ),
            LessonBlock(
              heading: 'Common mistakes',
              body:
                  "• Polishing one deliverable past the deadline — a rough canvas submitted Friday teaches you more than a beautiful one submitted never; perfectionism here is fear in disguise.\n• Treating one missed week as proof you've fallen off — submit the one-paragraph version late and keep moving; the habit survives a stumble, not a surrender.\n• Only showing work once it's finished — feedback on a half-done draft costs you nothing and catches wrong turns while they're still cheap to fix.\n• Letting 'I'll do it after work settles down' pick your hours — work never settles; the calendar block you defend beats the free evening you hope for.",
            ),
            LessonBlock(
              heading: 'Key takeaway',
              body:
                  "You are not a student taking a course; you are a founder with a weekly shipping schedule. Protect the streak — it is the whole method.",
            ),
            LessonBlock(
              heading: 'Do this now',
              body:
                  "Open your calendar and create a recurring 3-hour block titled 'Ship week's deliverable', repeating weekly for 16 weeks. Treat it like a client meeting — it moves only for emergencies, and it never gets deleted. This five-minute action is the single best predictor of finishing.",
            ),
          ],
        ),
      ],
      workshop:
          'Idea intake — each student posts their idea (or their intent to find one) and gets grouped with peers.',
      assignment:
          "Complete the intake form; introduce yourself in the community; pick a lane (I have an idea / I'm looking for one).",
      milestone: 'Every student has a starting point and a peer group.',
      resources: [
        CourseResource(
          title: 'YC Startup School — free online course',
          source: 'Course',
          url: 'https://www.startupschool.org',
        ),
        CourseResource(
          title: 'How to Start a Startup — Paul Graham',
          source: 'Essay',
          url: 'https://paulgraham.com/start.html',
        ),
        CourseResource(
          title: 'The Lean Startup — Eric Ries',
          source: 'Book',
          url: 'https://theleanstartup.com',
        ),
      ],
    ),
  ],
);
