import 'models/course_model.dart';

/// Curated external learning resources per kit, shown at the bottom of each
/// kit's detail screen. Kept out of KitModel so the static kit list stays
/// const-friendly.
const kitResources = <String, List<CourseResource>>{
  'formation': [
    CourseResource(
      title: 'Cooley GO — incorporation & founder docs',
      source: 'Templates',
      url: 'https://www.cooleygo.com',
    ),
    CourseResource(
      title: "The Founder's Dilemmas — Noam Wasserman",
      source: 'Book',
      url: 'https://www.goodreads.com/book/show/13239336-the-founder-s-dilemmas',
    ),
    CourseResource(
      title: 'YC standard documents',
      source: 'Templates',
      url: 'https://www.ycombinator.com/documents',
    ),
  ],
  'hr': [
    CourseResource(
      title: 'Who: The A Method for Hiring — Smart & Street',
      source: 'Book',
      url: 'https://www.goodreads.com/book/show/4989687-who',
    ),
    CourseResource(
      title: 'First Round Review — people & management',
      source: 'Articles',
      url: 'https://review.firstround.com',
    ),
    CourseResource(
      title: 'Netflix Culture Deck',
      source: 'Slides',
      url: 'https://www.slideshare.net/reed2001/culture-1798664',
    ),
  ],
  'sop': [
    CourseResource(
      title: 'The E-Myth Revisited — Michael Gerber',
      source: 'Book',
      url: 'https://www.goodreads.com/book/show/81948.The_E_Myth_Revisited',
    ),
    CourseResource(
      title: 'The Checklist Manifesto — Atul Gawande',
      source: 'Book',
      url: 'https://www.goodreads.com/book/show/6667514-the-checklist-manifesto',
    ),
    CourseResource(
      title: 'Atlassian Team Playbook',
      source: 'Toolkit',
      url: 'https://www.atlassian.com/team-playbook',
    ),
  ],
  'product': [
    CourseResource(
      title: 'Inspired — Marty Cagan',
      source: 'Book',
      url: 'https://www.goodreads.com/book/show/35249663-inspired',
    ),
    CourseResource(
      title: 'How to Plan an MVP — YC',
      source: 'Video/Guide',
      url: 'https://www.ycombinator.com/library/6f-how-to-plan-an-mvp',
    ),
    CourseResource(
      title: 'IDEO Design Thinking',
      source: 'Guide',
      url: 'https://designthinking.ideo.com',
    ),
  ],
  'procurement': [
    CourseResource(
      title: 'The Goal — Eliyahu Goldratt',
      source: 'Book',
      url: 'https://www.goodreads.com/book/show/113934.The_Goal',
    ),
    CourseResource(
      title: 'Never Split the Difference — Chris Voss (negotiation)',
      source: 'Book',
      url: 'https://www.goodreads.com/book/show/26156469-never-split-the-difference',
    ),
  ],
  'business': [
    CourseResource(
      title: 'Business Model Generation — Osterwalder & Pigneur',
      source: 'Book',
      url: 'https://www.goodreads.com/book/show/7723797-business-model-generation',
    ),
    CourseResource(
      title: 'Zero to One — Peter Thiel',
      source: 'Book',
      url: 'https://www.goodreads.com/book/show/18050143-zero-to-one',
    ),
    CourseResource(
      title: 'Traction — Weinberg & Mares',
      source: 'Book',
      url: 'https://www.goodreads.com/book/show/22091581-traction',
    ),
  ],
  'finance': [
    CourseResource(
      title: 'Financial Intelligence for Entrepreneurs — Berman & Knight',
      source: 'Book',
      url: 'https://www.goodreads.com/book/show/2549062.Financial_Intelligence_for_Entrepreneurs',
    ),
    CourseResource(
      title: 'Profit First — Mike Michalowicz',
      source: 'Book',
      url: 'https://www.goodreads.com/book/show/18933309-profit-first',
    ),
    CourseResource(
      title: 'SaaS Metrics 2.0 — David Skok',
      source: 'Guide',
      url: 'https://www.forentrepreneurs.com/saas-metrics-2/',
    ),
  ],
};
