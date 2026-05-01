import '../models/section_model.dart';

const _kitId = 'finance';

const _months = [
  'M1','M2','M3','M4','M5','M6','M7','M8','M9','M10','M11','M12','Y1','Y2','Y3'
];

const List<SectionModel> financeSections = [
  // ── P&L ─────────────────────────────────────────────────────────────────────
  SectionModel(
    id: 'finance.pnl',
    kitId: _kitId,
    title: 'Profit & Loss',
    subtitle: 'Monthly P&L for Year 1 + 3-year totals',
    subGroup: 'Profit & Loss',
    pattern: SectionPattern.financialGrid,
    helpText:
        'Revenue – VAT = Net Revenue. Net Revenue – COGS = Gross Profit. Gross Profit – OPEX = Net Profit.',
    colAxis: _months,
    seedRows: [
      {'key': 'revenue', 'label': 'Gross Revenue'},
      {'key': 'vat', 'label': 'Less: VAT'},
      {
        'key': 'net_revenue',
        'label': 'Net Revenue',
        'formula': 'sum',
        'inputs': ['revenue']
      },
      {'key': 'cogs', 'label': 'Less: COGS'},
      {
        'key': 'gross_profit',
        'label': 'Gross Profit',
        'formula': 'sum',
        'inputs': ['net_revenue']
      },
      {'key': 'opex_salaries', 'label': 'OPEX: Salaries'},
      {'key': 'opex_rent', 'label': 'OPEX: Rent'},
      {'key': 'opex_marketing', 'label': 'OPEX: Marketing'},
      {'key': 'opex_tech', 'label': 'OPEX: Technology'},
      {'key': 'opex_other', 'label': 'OPEX: Other'},
      {
        'key': 'total_opex',
        'label': 'Total OPEX',
        'formula': 'sum',
        'inputs': ['opex_salaries', 'opex_rent', 'opex_marketing', 'opex_tech', 'opex_other']
      },
      {'key': 'depreciation', 'label': 'Depreciation'},
      {'key': 'tax', 'label': 'Tax'},
      {
        'key': 'net_profit',
        'label': 'Net Profit',
        'formula': 'sum',
        'inputs': ['gross_profit']
      },
    ],
  ),

  // ── Revenue ─────────────────────────────────────────────────────────────────
  SectionModel(
    id: 'finance.product_revenue',
    kitId: _kitId,
    title: 'Product Revenue',
    subtitle: 'Revenue split by product',
    subGroup: 'Revenue',
    pattern: SectionPattern.financialGrid,
    colAxis: _months,
    seedRows: [
      {'key': 'product_1', 'label': 'Product 1'},
      {'key': 'product_2', 'label': 'Product 2'},
      {'key': 'product_3', 'label': 'Product 3'},
      {'key': 'product_4', 'label': 'Product 4'},
      {'key': 'product_5', 'label': 'Product 5'},
      {
        'key': 'total_revenue',
        'label': 'Total Revenue',
        'formula': 'sum',
        'inputs': ['product_1', 'product_2', 'product_3', 'product_4', 'product_5']
      },
    ],
  ),
  SectionModel(
    id: 'finance.revenue_plan',
    kitId: _kitId,
    title: 'Revenue Plan',
    subtitle: 'Bottom-up forecast',
    subGroup: 'Revenue',
    pattern: SectionPattern.financialGrid,
    helpText:
        'Bottom-up = customers × deal size × close rate. Build conservative, base, optimistic.',
    colAxis: _months,
    seedRows: [
      {'key': 'leads_generated', 'label': 'Leads Generated'},
      {'key': 'qualified_leads', 'label': 'Qualified Leads'},
      {'key': 'deals_closed', 'label': 'Deals Closed'},
      {'key': 'avg_deal_size', 'label': 'Avg Deal Size (BDT)'},
      {'key': 'plan_revenue', 'label': 'Planned Revenue'},
      {'key': 'actual_revenue', 'label': 'Actual Revenue'},
    ],
  ),

  // ── Costs ───────────────────────────────────────────────────────────────────
  SectionModel(
    id: 'finance.opex',
    kitId: _kitId,
    title: 'OPEX Breakdown',
    subtitle: 'Operating expenses by category',
    subGroup: 'Costs',
    pattern: SectionPattern.financialGrid,
    helpText: 'Salaries are typically 60-70% of startup OPEX.',
    colAxis: _months,
    seedRows: [
      {'key': 'salaries', 'label': 'Salaries'},
      {'key': 'benefits', 'label': 'Benefits & PF'},
      {'key': 'rent', 'label': 'Rent'},
      {'key': 'utilities', 'label': 'Utilities'},
      {'key': 'marketing', 'label': 'Marketing'},
      {'key': 'subscriptions', 'label': 'SaaS / Subscriptions'},
      {'key': 'travel', 'label': 'Travel'},
      {'key': 'legal', 'label': 'Legal & Professional'},
      {'key': 'office_supplies', 'label': 'Office Supplies'},
      {'key': 'training', 'label': 'Training'},
      {'key': 'other', 'label': 'Other'},
      {
        'key': 'total',
        'label': 'Total OPEX',
        'formula': 'sum',
        'inputs': ['salaries', 'benefits', 'rent', 'utilities', 'marketing', 'subscriptions', 'travel', 'legal', 'office_supplies', 'training', 'other']
      },
    ],
  ),
  SectionModel(
    id: 'finance.capex',
    kitId: _kitId,
    title: 'CAPEX Plan',
    subtitle: 'Capital expenditure with depreciation',
    subGroup: 'Costs',
    pattern: SectionPattern.recordList,
    helpText:
        'CAPEX is depreciated over its useful life. Justify every CAPEX item with ROI.',
    fields: [
      FieldDef(
          key: 'asset',
          label: 'Asset / Investment',
          type: FieldType.text,
          required: true),
      FieldDef(
          key: 'category',
          label: 'Category',
          type: FieldType.dropdown,
          options: ['Hardware', 'Software', 'Vehicle', 'Office Fit-out', 'Equipment', 'Other']),
      FieldDef(
          key: 'cost',
          label: 'Acquisition Cost',
          type: FieldType.currency,
          unit: 'BDT'),
      FieldDef(
          key: 'useful_life',
          label: 'Useful Life (years)',
          type: FieldType.number),
      FieldDef(
          key: 'depreciation_rate',
          label: 'Depreciation Rate (%)',
          type: FieldType.percent),
      FieldDef(
          key: 'acquisition_date',
          label: 'Acquisition Date',
          type: FieldType.date),
      FieldDef(
          key: 'roi_justification',
          label: 'ROI Justification',
          type: FieldType.longText),
    ],
  ),
  SectionModel(
    id: 'finance.ad_expense',
    kitId: _kitId,
    title: 'Advertising & Promotion',
    subtitle: 'Marketing spend tracker',
    subGroup: 'Costs',
    pattern: SectionPattern.financialGrid,
    colAxis: _months,
    seedRows: [
      {'key': 'agency_fees', 'label': 'Agency Fees'},
      {'key': 'digital_ads', 'label': 'Digital Ads (Google/FB)'},
      {'key': 'print_ads', 'label': 'Print Ads'},
      {'key': 'events', 'label': 'Events & Sponsorship'},
      {'key': 'content_production', 'label': 'Content Production'},
      {'key': 'pr', 'label': 'Public Relations'},
      {
        'key': 'total',
        'label': 'Total Ad Spend',
        'formula': 'sum',
        'inputs': ['agency_fees', 'digital_ads', 'print_ads', 'events', 'content_production', 'pr']
      },
    ],
  ),

  // ── Team ────────────────────────────────────────────────────────────────────
  SectionModel(
    id: 'finance.team_cost',
    kitId: _kitId,
    title: 'Team Cost Plan',
    subtitle: 'Headcount × salary by year',
    subGroup: 'Team',
    pattern: SectionPattern.recordList,
    helpText:
        'Plan headcount 6 months ahead. Hire ahead of need, not behind.',
    fields: [
      FieldDef(
          key: 'designation',
          label: 'Designation',
          type: FieldType.text,
          required: true),
      FieldDef(
          key: 'category',
          label: 'Category',
          type: FieldType.dropdown,
          options: [
            'Management',
            'Technology',
            'Business',
            'Finance',
            'HR/Admin',
            'Product/PMO',
            'Ops/Support',
          ]),
      FieldDef(key: 'joining_date', label: 'Joining Date', type: FieldType.date),
      FieldDef(
          key: 'monthly_salary',
          label: 'Monthly Salary',
          type: FieldType.currency,
          unit: 'BDT'),
      FieldDef(
          key: 'y1_months',
          label: 'Year 1 Months Active',
          type: FieldType.number),
      FieldDef(
          key: 'y1_total',
          label: 'Year 1 Total',
          type: FieldType.currency,
          unit: 'BDT'),
      FieldDef(
          key: 'y2_total',
          label: 'Year 2 Total',
          type: FieldType.currency,
          unit: 'BDT'),
      FieldDef(
          key: 'y3_total',
          label: 'Year 3 Total',
          type: FieldType.currency,
          unit: 'BDT'),
    ],
  ),

  // ── Operations ──────────────────────────────────────────────────────────────
  SectionModel(
    id: 'finance.operation_plan',
    kitId: _kitId,
    title: 'Operation Plan',
    subtitle: 'Client deliverables & milestones',
    subGroup: 'Operations',
    pattern: SectionPattern.recordList,
    fields: [
      FieldDef(
          key: 'client',
          label: 'Client Name',
          type: FieldType.text,
          required: true),
      FieldDef(
          key: 'sales_person', label: 'Sales Person', type: FieldType.text),
      FieldDef(
          key: 'product', label: 'Product / Service', type: FieldType.text),
      FieldDef(
          key: 'contract_value',
          label: 'Contract Value',
          type: FieldType.currency,
          unit: 'BDT'),
      FieldDef(
          key: 'start_date', label: 'Start Date', type: FieldType.date),
      FieldDef(key: 'end_date', label: 'End Date', type: FieldType.date),
      FieldDef(
          key: 'milestone_1',
          label: 'Milestone 1',
          type: FieldType.text),
      FieldDef(
          key: 'milestone_2',
          label: 'Milestone 2',
          type: FieldType.text),
      FieldDef(
          key: 'status',
          label: 'Status',
          type: FieldType.dropdown,
          options: ['Planning', 'In Progress', 'Delivered', 'Paid', 'Closed']),
    ],
  ),
];
