import '../models/section_model.dart';

const _kitId = 'business';

const List<SectionModel> businessSections = [
  // ── Strategy ────────────────────────────────────────────────────────────────
  SectionModel(
    id: 'business.business_benefit',
    kitId: _kitId,
    title: 'Business Cases',
    subtitle: 'What benefit does each product deliver?',
    subGroup: 'Strategy',
    pattern: SectionPattern.recordList,
    helpText:
        'For every product, articulate the customer\'s before/after — what improves, by how much.',
    fields: [
      FieldDef(
          key: 'product',
          label: 'Product / Service',
          type: FieldType.text,
          required: true),
      FieldDef(
          key: 'business_case',
          label: 'Business Case Name',
          type: FieldType.text,
          required: true),
      FieldDef(
          key: 'problem',
          label: 'Customer Problem',
          type: FieldType.longText),
      FieldDef(
          key: 'solution',
          label: 'How Our Product Solves It',
          type: FieldType.longText),
      FieldDef(
          key: 'before_metric',
          label: 'Before (current state)',
          type: FieldType.text,
          placeholder: 'e.g. 5 hours / week'),
      FieldDef(
          key: 'after_metric',
          label: 'After (with our product)',
          type: FieldType.text,
          placeholder: 'e.g. 30 minutes / week'),
      FieldDef(
          key: 'value_quantified',
          label: 'Quantified Value',
          type: FieldType.text,
          placeholder: 'e.g. 90% time saved'),
    ],
  ),
  SectionModel(
    id: 'business.industry_analysis',
    kitId: _kitId,
    title: 'Industry / End-Market Analysis',
    subtitle: 'Score & prioritize target industries',
    subGroup: 'Strategy',
    pattern: SectionPattern.recordList,
    helpText:
        'Rate each industry on Strength (size, budget) + Sustainability (tech, profitability).',
    fields: [
      FieldDef(
          key: 'industry',
          label: 'Industry',
          type: FieldType.text,
          required: true),
      FieldDef(
          key: 'priority',
          label: 'Priority',
          type: FieldType.dropdown,
          options: ['A — Ideal', 'B — Secondary', 'C — Avoid']),
      FieldDef(
          key: 'large_scale_business',
          label: 'Large-Scale Business?',
          type: FieldType.checkbox),
      FieldDef(
          key: 'budget_capacity',
          label: 'Budget Capacity (1-5)',
          type: FieldType.rating),
      FieldDef(
          key: 'automation_focus',
          label: 'Automation Focus (1-5)',
          type: FieldType.rating),
      FieldDef(
          key: 'tech_adoption',
          label: 'Tech Adoption (1-5)',
          type: FieldType.rating),
      FieldDef(
          key: 'profit_potential',
          label: 'Profit Potential',
          type: FieldType.dropdown,
          options: ['Low', 'Medium', 'High', 'Very High']),
      FieldDef(
          key: 'competition_level',
          label: 'Competition Level',
          type: FieldType.dropdown,
          options: ['Low', 'Medium', 'High', 'Saturated']),
      FieldDef(
          key: 'recommended_packages',
          label: 'Recommended Packages',
          type: FieldType.text),
    ],
  ),

  // ── Customers ───────────────────────────────────────────────────────────────
  SectionModel(
    id: 'business.customer_matrix',
    kitId: _kitId,
    title: 'Customer Matrix',
    subtitle: 'Lead scoring & company database',
    subGroup: 'Customers',
    pattern: SectionPattern.recordList,
    helpText:
        'Score every lead before investing sales time. Focus high-effort on 70+ scored customers.',
    fields: [
      FieldDef(
          key: 'company',
          label: 'Company',
          type: FieldType.text,
          required: true),
      FieldDef(key: 'industry', label: 'Industry', type: FieldType.text),
      FieldDef(
          key: 'poc_name',
          label: 'POC Name',
          type: FieldType.text),
      FieldDef(
          key: 'poc_designation',
          label: 'POC Designation',
          type: FieldType.text),
      FieldDef(key: 'poc_phone', label: 'POC Phone', type: FieldType.text),
      FieldDef(key: 'poc_email', label: 'POC Email', type: FieldType.text),
      FieldDef(
          key: 'market_position',
          label: 'Market Position',
          type: FieldType.dropdown,
          options: ['Top', 'Middle', 'Bottom']),
      FieldDef(
          key: 'annual_revenue',
          label: 'Annual Revenue (BDT Cr)',
          type: FieldType.dropdown,
          options: ['0–50', '50–250', '250–1000', '1000+']),
      FieldDef(
          key: 'tech_adoption',
          label: 'Tech Adoption (1-5)',
          type: FieldType.rating),
      FieldDef(
          key: 'network_strength',
          label: 'Network Strength (1-5)',
          type: FieldType.rating),
      FieldDef(
          key: 'decision_timeline',
          label: 'Decision Timeline',
          type: FieldType.dropdown,
          options: ['< 1 month', '1-3 months', '3-6 months', '6+ months']),
      FieldDef(
          key: 'final_score',
          label: 'Final Score (0-100)',
          type: FieldType.number),
      FieldDef(
          key: 'stage',
          label: 'Stage',
          type: FieldType.dropdown,
          defaultValue: 'Lead',
          options: ['Lead', 'Qualified', 'Proposal', 'Negotiation', 'Won', 'Lost']),
    ],
  ),

  // ── Partners ────────────────────────────────────────────────────────────────
  SectionModel(
    id: 'business.partner_matrix',
    kitId: _kitId,
    title: 'Partner Evaluation',
    subtitle: 'Strategic partnership scoring',
    subGroup: 'Partners',
    pattern: SectionPattern.recordList,
    helpText:
        'Partners should fill gaps you can\'t fill alone. Score before formalizing.',
    fields: [
      FieldDef(
          key: 'partner_name',
          label: 'Partner Name',
          type: FieldType.text,
          required: true),
      FieldDef(key: 'country', label: 'Country', type: FieldType.text),
      FieldDef(key: 'industry', label: 'Industry', type: FieldType.text),
      FieldDef(
          key: 'establishment',
          label: 'Year Established',
          type: FieldType.text),
      FieldDef(
          key: 'product_service',
          label: 'Product / Service',
          type: FieldType.longText),
      FieldDef(key: 'poc_name', label: 'POC Name', type: FieldType.text),
      FieldDef(key: 'poc_email', label: 'POC Email', type: FieldType.text),
      FieldDef(
          key: 'years_in_business',
          label: 'Years in Business (1-5)',
          type: FieldType.rating),
      FieldDef(
          key: 'market_reputation',
          label: 'Market Reputation (1-5)',
          type: FieldType.rating),
      FieldDef(
          key: 'capability_fit',
          label: 'Capability Fit (1-5)',
          type: FieldType.rating),
      FieldDef(
          key: 'cultural_alignment',
          label: 'Cultural Alignment (1-5)',
          type: FieldType.rating),
    ],
  ),

  // ── Sales Enablement ────────────────────────────────────────────────────────
  SectionModel(
    id: 'business.sales_pitch',
    kitId: _kitId,
    title: 'Sales Pitch Builder',
    subtitle: 'Structured pitch (English + Bengali)',
    subGroup: 'Sales Enablement',
    pattern: SectionPattern.singleForm,
    helpText:
        'Open with the customer\'s pain. Always end with a clear, specific ask.',
    fields: [
      FieldDef(
          key: 'industry',
          label: 'Target Industry',
          type: FieldType.text,
          required: true),
      FieldDef(
          key: 'product',
          label: 'Product / Service',
          type: FieldType.text,
          required: true),
      FieldDef(
          key: 'overview', label: 'Overview', type: FieldType.longText),
      FieldDef(
          key: 'problem_en',
          label: 'Problem (English)',
          type: FieldType.longText),
      FieldDef(
          key: 'problem_bn',
          label: 'Problem (Bengali)',
          type: FieldType.longText),
      FieldDef(
          key: 'solution_en',
          label: 'Solution (English)',
          type: FieldType.longText),
      FieldDef(
          key: 'solution_bn',
          label: 'Solution (Bengali)',
          type: FieldType.longText),
      FieldDef(
          key: 'why_us_en',
          label: 'Why Us (English)',
          type: FieldType.longText),
      FieldDef(
          key: 'proof',
          label: 'Proof / Case Studies',
          type: FieldType.longText),
      FieldDef(
          key: 'ask',
          label: 'The Ask',
          type: FieldType.longText,
          placeholder: 'What do you want them to do next?'),
    ],
  ),
  SectionModel(
    id: 'business.pitch_feedback',
    kitId: _kitId,
    title: 'Pitch Feedback Tracker',
    subtitle: 'Capture customer responses',
    subGroup: 'Sales Enablement',
    pattern: SectionPattern.recordList,
    fields: [
      FieldDef(key: 'date', label: 'Date', type: FieldType.date),
      FieldDef(
          key: 'sales_person',
          label: 'Sales Person',
          type: FieldType.text,
          required: true),
      FieldDef(
          key: 'customer',
          label: 'Customer',
          type: FieldType.text,
          required: true),
      FieldDef(key: 'product', label: 'Product', type: FieldType.text),
      FieldDef(
          key: 'understanding_score',
          label: 'Understanding (1-5)',
          type: FieldType.rating),
      FieldDef(
          key: 'communication_score',
          label: 'Communication Clarity (1-5)',
          type: FieldType.rating),
      FieldDef(
          key: 'value_score',
          label: 'Value Statement (1-5)',
          type: FieldType.rating),
      FieldDef(
          key: 'objections',
          label: 'Objections Raised',
          type: FieldType.longText),
      FieldDef(
          key: 'next_step',
          label: 'Next Step',
          type: FieldType.text),
    ],
  ),
];
