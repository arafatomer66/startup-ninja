import '../models/section_model.dart';

const _kitId = 'product';

const _quarters = ['Q1', 'Q2', 'Q3', 'Q4'];
const _months = [
  'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'
];

const List<SectionModel> productSections = [
  // ── Catalog ─────────────────────────────────────────────────────────────────
  SectionModel(
    id: 'product.products',
    kitId: _kitId,
    title: 'Products & Services',
    subtitle: 'Your product catalog',
    subGroup: 'Catalog',
    pattern: SectionPattern.recordList,
    helpText:
        'Each product is tagged with type, market type, and industry — drives positioning later.',
    fields: [
      FieldDef(
          key: 'name',
          label: 'Product / Service Name',
          type: FieldType.text,
          required: true),
      FieldDef(
          key: 'type',
          label: 'Type',
          type: FieldType.dropdown,
          options: ['B2B', 'B2C', 'B2B2C']),
      FieldDef(
          key: 'category',
          label: 'Category',
          type: FieldType.dropdown,
          options: ['Local', 'Global', 'Regional']),
      FieldDef(
          key: 'market_type',
          label: 'Market Type',
          type: FieldType.dropdown,
          options: ['Niche', 'Mass', 'Emerging']),
      FieldDef(
          key: 'industry',
          label: 'Primary Industry',
          type: FieldType.text),
      FieldDef(
          key: 'nature',
          label: 'Nature',
          type: FieldType.dropdown,
          options: ['New Development', 'R&D', 'Pipeline', 'Mature']),
      FieldDef(
          key: 'tam',
          label: 'TAM (BDT Cr)',
          type: FieldType.number),
      FieldDef(
          key: 'sam',
          label: 'SAM (BDT Cr)',
          type: FieldType.number),
      FieldDef(
          key: 'som',
          label: 'SOM (BDT Cr)',
          type: FieldType.number),
      FieldDef(
          key: 'description',
          label: 'Description',
          type: FieldType.longText),
    ],
  ),
  SectionModel(
    id: 'product.product_packaging',
    kitId: _kitId,
    title: 'Product Packaging',
    subtitle: 'Bundles & pricing tiers',
    subGroup: 'Catalog',
    pattern: SectionPattern.recordList,
    fields: [
      FieldDef(
          key: 'package_name',
          label: 'Package Name',
          type: FieldType.text,
          required: true),
      FieldDef(
          key: 'type',
          label: 'Type',
          type: FieldType.dropdown,
          options: ['Single Product', 'Bundle']),
      FieldDef(
          key: 'products',
          label: 'Products Included',
          type: FieldType.longText),
      FieldDef(
          key: 'price',
          label: 'Price',
          type: FieldType.currency,
          unit: 'BDT'),
      FieldDef(
          key: 'target_segment',
          label: 'Target Segment',
          type: FieldType.text),
    ],
  ),

  // ── Roadmap ─────────────────────────────────────────────────────────────────
  SectionModel(
    id: 'product.product_roadmap',
    kitId: _kitId,
    title: 'Product Roadmap',
    subtitle: 'Quarterly product plan',
    subGroup: 'Roadmap',
    pattern: SectionPattern.roadmap,
    helpText:
        'High-level roadmap. Pick start/end quarters per product. Update monthly.',
    colAxis: _quarters,
  ),
  SectionModel(
    id: 'product.feature_roadmap',
    kitId: _kitId,
    title: 'Feature Roadmap',
    subtitle: 'Monthly feature plan',
    subGroup: 'Roadmap',
    pattern: SectionPattern.roadmap,
    helpText: 'Granular feature plan. Each feature has start/end month.',
    colAxis: _months,
  ),

  // ── Discovery ───────────────────────────────────────────────────────────────
  SectionModel(
    id: 'product.brd',
    kitId: _kitId,
    title: 'Business Requirements (BRD)',
    subtitle: 'What the business needs',
    subGroup: 'Discovery',
    pattern: SectionPattern.recordList,
    helpText:
        'A BRD captures WHAT the business needs — not HOW to build it (that\'s the TRD).',
    fields: [
      FieldDef(
          key: 'project_name',
          label: 'Project Name',
          type: FieldType.text,
          required: true),
      FieldDef(
          key: 'category',
          label: 'Category',
          type: FieldType.text,
          placeholder: 'e.g. CLIENT LOG, BACKOFFICE'),
      FieldDef(key: 'segment', label: 'Segment', type: FieldType.text),
      FieldDef(
          key: 'problem',
          label: 'Problem Statement',
          type: FieldType.longText,
          required: true),
      FieldDef(
          key: 'user_story',
          label: 'User Story',
          type: FieldType.longText,
          placeholder: 'As a [user], I want [feature], so that [benefit]'),
      FieldDef(
          key: 'acceptance_criteria',
          label: 'Acceptance Criteria',
          type: FieldType.longText),
      FieldDef(
          key: 'priority',
          label: 'Priority',
          type: FieldType.dropdown,
          options: ['High', 'Medium', 'Low']),
    ],
  ),
  SectionModel(
    id: 'product.survey',
    kitId: _kitId,
    title: 'Customer Survey',
    subtitle: 'Discovery interview tracker',
    subGroup: 'Discovery',
    pattern: SectionPattern.recordList,
    fields: [
      FieldDef(
          key: 'client',
          label: 'Client / Respondent',
          type: FieldType.text,
          required: true),
      FieldDef(key: 'date', label: 'Date', type: FieldType.date),
      FieldDef(
          key: 'pain_points',
          label: 'Top Pain Points',
          type: FieldType.longText),
      FieldDef(
          key: 'current_solution',
          label: 'Current Solution',
          type: FieldType.longText),
      FieldDef(
          key: 'willingness_to_pay',
          label: 'Willingness to Pay (BDT)',
          type: FieldType.currency,
          unit: 'BDT'),
      FieldDef(
          key: 'follow_up',
          label: 'Follow-up Action',
          type: FieldType.text),
    ],
  ),
  SectionModel(
    id: 'product.competitor',
    kitId: _kitId,
    title: 'Competitor Analysis',
    subtitle: 'SWOT per competitor',
    subGroup: 'Discovery',
    pattern: SectionPattern.recordList,
    helpText:
        'Analyze 3-5 direct competitors. Update every quarter.',
    fields: [
      FieldDef(
          key: 'company',
          label: 'Competitor',
          type: FieldType.text,
          required: true),
      FieldDef(key: 'origin', label: 'Origin / Country', type: FieldType.text),
      FieldDef(key: 'pricing', label: 'Pricing', type: FieldType.text),
      FieldDef(key: 'target_market', label: 'Target Market', type: FieldType.text),
      FieldDef(key: 'strengths', label: 'Strengths', type: FieldType.longText),
      FieldDef(key: 'weaknesses', label: 'Weaknesses', type: FieldType.longText),
      FieldDef(
          key: 'opportunities',
          label: 'Opportunities (for us)',
          type: FieldType.longText),
      FieldDef(key: 'threats', label: 'Threats', type: FieldType.longText),
    ],
  ),

  // ── Delivery ────────────────────────────────────────────────────────────────
  SectionModel(
    id: 'product.project_tracker',
    kitId: _kitId,
    title: 'Project Tracker',
    subtitle: 'Active project pipeline',
    subGroup: 'Delivery',
    pattern: SectionPattern.recordList,
    fields: [
      FieldDef(
          key: 'project_name',
          label: 'Project Name',
          type: FieldType.text,
          required: true),
      FieldDef(key: 'client', label: 'Client', type: FieldType.text),
      FieldDef(key: 'start_date', label: 'Start Date', type: FieldType.date),
      FieldDef(
          key: 'end_date', label: 'Target End Date', type: FieldType.date),
      FieldDef(
          key: 'duration_days',
          label: 'Duration (days)',
          type: FieldType.number),
      FieldDef(
          key: 'total_tasks',
          label: 'Total Tasks',
          type: FieldType.number),
      FieldDef(
          key: 'completed_tasks',
          label: 'Completed',
          type: FieldType.number),
      FieldDef(
          key: 'in_progress_tasks',
          label: 'In Progress',
          type: FieldType.number),
      FieldDef(
          key: 'progress_percent',
          label: 'Progress %',
          type: FieldType.percent),
      FieldDef(
          key: 'status',
          label: 'Status',
          type: FieldType.dropdown,
          options: ['Planning', 'WIP', 'On Hold', 'Done', 'Cancelled']),
    ],
  ),
  SectionModel(
    id: 'product.project_team',
    kitId: _kitId,
    title: 'Project Team',
    subtitle: 'PMO contact register',
    subGroup: 'Delivery',
    pattern: SectionPattern.recordList,
    fields: [
      FieldDef(
          key: 'emp_id',
          label: 'Employee ID',
          type: FieldType.text,
          required: true),
      FieldDef(
          key: 'name',
          label: 'Full Name',
          type: FieldType.text,
          required: true),
      FieldDef(
          key: 'department',
          label: 'Department',
          type: FieldType.text,
          defaultValue: 'PMO'),
      FieldDef(key: 'role', label: 'Role on Project', type: FieldType.text),
      FieldDef(key: 'contact', label: 'Contact', type: FieldType.text),
      FieldDef(key: 'email', label: 'Email', type: FieldType.text),
    ],
  ),
  SectionModel(
    id: 'product.issue_tracker',
    kitId: _kitId,
    title: 'Issue Tracker',
    subtitle: 'Bugs & blockers',
    subGroup: 'Delivery',
    pattern: SectionPattern.recordList,
    fields: [
      FieldDef(
          key: 'title',
          label: 'Issue Title',
          type: FieldType.text,
          required: true),
      FieldDef(key: 'project', label: 'Project', type: FieldType.text),
      FieldDef(
          key: 'severity',
          label: 'Severity',
          type: FieldType.dropdown,
          options: ['Minor (1)', 'Major (2)', 'Critical (3)', 'Blocker (4)']),
      FieldDef(key: 'reported_by', label: 'Reported By', type: FieldType.text),
      FieldDef(key: 'assigned_to', label: 'Assigned To', type: FieldType.text),
      FieldDef(key: 'reported_date', label: 'Reported', type: FieldType.date),
      FieldDef(
          key: 'description',
          label: 'Description',
          type: FieldType.longText),
      FieldDef(
          key: 'status',
          label: 'Status',
          type: FieldType.dropdown,
          options: ['Open', 'In Progress', 'Blocked', 'Resolved', 'Closed']),
    ],
  ),
];
