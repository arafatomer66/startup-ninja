import '../models/section_model.dart';

const _kitId = 'hr';

const List<SectionModel> hrSections = [
  // ── Recruitment ─────────────────────────────────────────────────────────────
  SectionModel(
    id: 'hr.candidate_tracker',
    kitId: _kitId,
    title: 'Candidate Database',
    subtitle: 'Track every applicant',
    subGroup: 'Recruitment',
    pattern: SectionPattern.recordList,
    helpText:
        'Capture every candidate at the top of the funnel. Score later — first, just record.',
    fields: [
      FieldDef(
          key: 'name',
          label: 'Candidate Name',
          type: FieldType.text,
          required: true),
      FieldDef(
          key: 'role_applied',
          label: 'Role Applied',
          type: FieldType.text,
          required: true),
      FieldDef(
          key: 'source',
          label: 'Source',
          type: FieldType.dropdown,
          options: ['LinkedIn', 'Referral', 'Job Board', 'Direct', 'Agency', 'Other']),
      FieldDef(key: 'phone', label: 'Phone', type: FieldType.text),
      FieldDef(key: 'email', label: 'Email', type: FieldType.text),
      FieldDef(
          key: 'experience_years',
          label: 'Experience (years)',
          type: FieldType.number),
      FieldDef(
          key: 'current_company', label: 'Current Company', type: FieldType.text),
      FieldDef(
          key: 'expected_salary',
          label: 'Expected Salary',
          type: FieldType.currency,
          unit: 'BDT'),
      FieldDef(
          key: 'status',
          label: 'Status',
          type: FieldType.dropdown,
          defaultValue: 'New',
          options: [
            'New',
            'Screening',
            'Interview 1',
            'Interview 2',
            'Final Round',
            'Offered',
            'Hired',
            'Rejected',
            'Dropped',
          ]),
      FieldDef(key: 'notes', label: 'Notes', type: FieldType.longText),
    ],
  ),
  SectionModel(
    id: 'hr.interview_scorecard',
    kitId: _kitId,
    title: 'Interview Scorecard',
    subtitle: 'Score candidates objectively',
    subGroup: 'Recruitment',
    pattern: SectionPattern.recordList,
    helpText:
        'Score every candidate on the same criteria to remove individual bias.',
    fields: [
      FieldDef(
          key: 'candidate_name',
          label: 'Candidate Name',
          type: FieldType.text,
          required: true),
      FieldDef(key: 'role', label: 'Role', type: FieldType.text),
      FieldDef(
          key: 'phase',
          label: 'Phase',
          type: FieldType.dropdown,
          options: ['Interview 1', 'Interview 2', 'Interview 3', 'Final']),
      FieldDef(key: 'date', label: 'Date', type: FieldType.date),
      FieldDef(key: 'interviewer', label: 'Interviewer', type: FieldType.text),
      FieldDef(
          key: 'technical_score',
          label: 'Technical (1-5)',
          type: FieldType.rating),
      FieldDef(
          key: 'communication_score',
          label: 'Communication (1-5)',
          type: FieldType.rating),
      FieldDef(
          key: 'culture_fit_score',
          label: 'Culture Fit (1-5)',
          type: FieldType.rating),
      FieldDef(
          key: 'leadership_score',
          label: 'Leadership (1-5)',
          type: FieldType.rating),
      FieldDef(
          key: 'recommendation',
          label: 'Recommendation',
          type: FieldType.dropdown,
          options: ['Strong Hire', 'Hire', 'No Hire', 'Strong No Hire']),
      FieldDef(key: 'comments', label: 'Comments', type: FieldType.longText),
    ],
  ),

  // ── Onboarding ──────────────────────────────────────────────────────────────
  SectionModel(
    id: 'hr.onboarding_checklist',
    kitId: _kitId,
    title: 'Onboarding Checklist',
    subtitle: 'First 90 days, structured',
    subGroup: 'Onboarding',
    pattern: SectionPattern.checklist,
    helpText:
        'A consistent first-90-days experience dramatically improves retention.',
    seedRows: [
      {'key': 'hr_orientation', 'label': 'HR Orientation', 'description': 'Day 1: company overview, policies walk-through.'},
      {'key': 'gift_bag', 'label': 'Welcome Gift Bag', 'description': 'Swag, business cards, welcome note.'},
      {'key': 'id_card', 'label': 'ID & Business Card', 'description': null},
      {'key': 'it_awareness', 'label': 'IT Awareness Program', 'description': 'Security, data handling, password policy.'},
      {'key': 'office_visit', 'label': 'Office Visit / Tour', 'description': null},
      {'key': 'bank_account', 'label': 'Bank Account Setup', 'description': 'For payroll deposit.'},
      {'key': 'system_access', 'label': 'System & Email Access', 'description': 'Email, Slack, Jira, GitHub etc.'},
      {'key': 'laptop_setup', 'label': 'Laptop Provisioning', 'description': null},
      {'key': 'team_intro', 'label': 'Team Introduction', 'description': 'Meet the wider team and key stakeholders.'},
      {'key': 'role_training', 'label': 'Role-Specific Training', 'description': 'Week 1: shadow + initial tasks.'},
      {'key': 'first_deliverable', 'label': 'First Deliverable Assigned', 'description': 'Month 1: clear win.'},
      {'key': 'thirty_day_checkin', 'label': '30-day Check-in', 'description': null},
      {'key': 'sixty_day_checkin', 'label': '60-day Check-in', 'description': null},
      {'key': 'ninety_day_review', 'label': '90-day Confirmation Review', 'description': 'Confirm or extend probation.'},
    ],
  ),
  SectionModel(
    id: 'hr.document_tracker',
    kitId: _kitId,
    title: 'Document Tracker',
    subtitle: 'Mandatory employee documents',
    subGroup: 'Onboarding',
    pattern: SectionPattern.checklist,
    helpText:
        'Every employee should have these on file before completing probation.',
    seedRows: [
      {'key': 'documentation', 'label': 'Signed Offer Letter', 'description': null},
      {'key': 'id_proof', 'label': 'NID / Passport Copy', 'description': null},
      {'key': 'id_card_info', 'label': 'ID Card Photo Submitted', 'description': null},
      {'key': 'bank_info', 'label': 'Bank Account Information', 'description': null},
      {'key': 'last_employer', 'label': 'Last Employer Release Letter', 'description': null},
      {'key': 'emp_verification', 'label': 'Employee Verification Done', 'description': 'Background check.'},
      {'key': 'tin_copy', 'label': 'TIN Certificate (if applicable)', 'description': null},
      {'key': 'academic_certs', 'label': 'Academic Certificates', 'description': null},
      {'key': 'experience_certs', 'label': 'Experience Certificates', 'description': null},
      {'key': 'photo', 'label': 'Passport-size Photographs', 'description': null},
      {'key': 'nda_signed', 'label': 'NDA Signed', 'description': null},
      {'key': 'policy_ack', 'label': 'Policy Acknowledgement', 'description': 'Code of conduct, IT policy.'},
    ],
  ),

  // ── Lifecycle ───────────────────────────────────────────────────────────────
  SectionModel(
    id: 'hr.new_recruit_profile',
    kitId: _kitId,
    title: 'New Recruit Profile',
    subtitle: 'Joining details and setup',
    subGroup: 'Lifecycle',
    pattern: SectionPattern.recordList,
    helpText:
        'Captured at offer letter stage. Drives onboarding workflows.',
    fields: [
      FieldDef(
          key: 'emp_id', label: 'Employee ID', type: FieldType.text, required: true),
      FieldDef(
          key: 'name',
          label: 'Employee Name',
          type: FieldType.text,
          required: true),
      FieldDef(key: 'designation', label: 'Designation', type: FieldType.text),
      FieldDef(key: 'department', label: 'Department', type: FieldType.text),
      FieldDef(key: 'doj', label: 'Date of Joining', type: FieldType.date),
      FieldDef(
          key: 'reporting_supervisor',
          label: 'Reporting Supervisor',
          type: FieldType.text),
      FieldDef(
          key: 'gross_salary',
          label: 'Gross Salary',
          type: FieldType.currency,
          unit: 'BDT'),
      FieldDef(
          key: 'laptop_required',
          label: 'Laptop Required?',
          type: FieldType.checkbox,
          placeholder: 'Issue company laptop'),
      FieldDef(
          key: 'employment_type',
          label: 'Employment Type',
          type: FieldType.dropdown,
          options: ['Full-time', 'Part-time', 'Contract', 'Intern']),
    ],
  ),
  SectionModel(
    id: 'hr.confirmation_tracker',
    kitId: _kitId,
    title: 'Confirmation Tracker',
    subtitle: 'Probation outcomes',
    subGroup: 'Lifecycle',
    pattern: SectionPattern.recordList,
    helpText:
        'Track every probation review and confirmation decision.',
    fields: [
      FieldDef(
          key: 'emp_id', label: 'Employee ID', type: FieldType.text, required: true),
      FieldDef(key: 'name', label: 'Name', type: FieldType.text, required: true),
      FieldDef(key: 'department', label: 'Department', type: FieldType.text),
      FieldDef(key: 'designation', label: 'Designation', type: FieldType.text),
      FieldDef(key: 'doj', label: 'Date of Joining', type: FieldType.date),
      FieldDef(
          key: 'doc',
          label: 'Date of Confirmation Review',
          type: FieldType.date),
      FieldDef(
          key: 'pa_received',
          label: 'PA Form Received?',
          type: FieldType.checkbox),
      FieldDef(
          key: 'outcome',
          label: 'Outcome',
          type: FieldType.dropdown,
          options: ['Confirmed', 'Extended Probation', 'Released']),
      FieldDef(key: 'notes', label: 'Notes', type: FieldType.longText),
    ],
  ),
  SectionModel(
    id: 'hr.travel_noc_tracker',
    kitId: _kitId,
    title: 'Travel NOC Tracker',
    subtitle: 'No-Objection Certificates for travel',
    subGroup: 'Lifecycle',
    pattern: SectionPattern.recordList,
    fields: [
      FieldDef(key: 'issue_date', label: 'Issue Date', type: FieldType.date),
      FieldDef(
          key: 'emp_id', label: 'Employee ID', type: FieldType.text, required: true),
      FieldDef(key: 'name', label: 'Employee Name', type: FieldType.text, required: true),
      FieldDef(key: 'department', label: 'Department', type: FieldType.text),
      FieldDef(
          key: 'passport_no', label: 'Passport Number', type: FieldType.text),
      FieldDef(key: 'country', label: 'Country', type: FieldType.text),
      FieldDef(
          key: 'purpose',
          label: 'Travel Purpose',
          type: FieldType.dropdown,
          options: ['Tourism', 'Business', 'Medical', 'Family', 'Other']),
      FieldDef(key: 'leave_start', label: 'Leave Start', type: FieldType.date),
      FieldDef(key: 'leave_end', label: 'Leave End', type: FieldType.date),
    ],
  ),
  SectionModel(
    id: 'hr.resignation_tracker',
    kitId: _kitId,
    title: 'Resignation Tracker',
    subtitle: 'Reasons & exit details',
    subGroup: 'Lifecycle',
    pattern: SectionPattern.recordList,
    helpText:
        'Patterns in exit reasons surface where retention strategy needs work.',
    fields: [
      FieldDef(
          key: 'emp_id', label: 'Employee ID', type: FieldType.text, required: true),
      FieldDef(key: 'name', label: 'Name', type: FieldType.text, required: true),
      FieldDef(key: 'department', label: 'Department', type: FieldType.text),
      FieldDef(key: 'designation', label: 'Designation', type: FieldType.text),
      FieldDef(
          key: 'resignation_date',
          label: 'Resignation Date',
          type: FieldType.date),
      FieldDef(
          key: 'effective_date', label: 'Effective Date', type: FieldType.date),
      FieldDef(
          key: 'reason',
          label: 'Primary Reason',
          type: FieldType.dropdown,
          options: [
            'Better Job Opportunity',
            'Higher Pay',
            'Family Reason',
            'Career Change',
            'Higher Studies',
            'Health',
            'Relocation',
            'Manager / Team Issues',
            'Performance / Termination',
            'Other',
          ]),
      FieldDef(
          key: 'employment_type',
          label: 'Employment Type',
          type: FieldType.dropdown,
          options: ['Full-time', 'Part-time', 'Contract', 'Intern']),
      FieldDef(key: 'notes', label: 'Notes', type: FieldType.longText),
    ],
  ),
  SectionModel(
    id: 'hr.release_letter',
    kitId: _kitId,
    title: 'Release & Experience Letters',
    subtitle: 'Exit document tracker',
    subGroup: 'Lifecycle',
    pattern: SectionPattern.recordList,
    fields: [
      FieldDef(key: 'emp_id', label: 'Employee ID', type: FieldType.text, required: true),
      FieldDef(key: 'name', label: 'Name', type: FieldType.text, required: true),
      FieldDef(key: 'department', label: 'Department', type: FieldType.text),
      FieldDef(key: 'designation', label: 'Designation', type: FieldType.text),
      FieldDef(key: 'doj', label: 'Date of Joining', type: FieldType.date),
      FieldDef(
          key: 'last_working_day',
          label: 'Last Working Day',
          type: FieldType.date),
      FieldDef(
          key: 'release_letter_issued',
          label: 'Release Letter Issued?',
          type: FieldType.checkbox),
      FieldDef(
          key: 'experience_letter_issued',
          label: 'Experience Letter Issued?',
          type: FieldType.checkbox),
      FieldDef(
          key: 'nda_signed', label: 'NDA Signed?', type: FieldType.checkbox),
    ],
  ),

  // ── Compliance ──────────────────────────────────────────────────────────────
  SectionModel(
    id: 'hr.verification_tracker',
    kitId: _kitId,
    title: 'Employer Verification',
    subtitle: 'Background checks',
    subGroup: 'Compliance',
    pattern: SectionPattern.recordList,
    helpText:
        'Verify experience, education, and references for every new hire.',
    fields: [
      FieldDef(key: 'date_of_issue', label: 'Date of Issue', type: FieldType.date),
      FieldDef(key: 'ref_no', label: 'Reference No', type: FieldType.text),
      FieldDef(key: 'emp_id', label: 'Employee ID', type: FieldType.text, required: true),
      FieldDef(key: 'name', label: 'Employee Name', type: FieldType.text, required: true),
      FieldDef(key: 'designation', label: 'Designation', type: FieldType.text),
      FieldDef(key: 'department', label: 'Department', type: FieldType.text),
      FieldDef(key: 'last_employer', label: 'Last Employer', type: FieldType.text),
      FieldDef(key: 'last_employer_poc', label: 'POC at Last Employer', type: FieldType.text),
      FieldDef(key: 'poc_phone', label: 'POC Phone', type: FieldType.text),
      FieldDef(key: 'poc_email', label: 'POC Email', type: FieldType.text),
      FieldDef(
          key: 'experience_verified',
          label: 'Experience Verified?',
          type: FieldType.checkbox),
      FieldDef(
          key: 'education_verified',
          label: 'Education Verified?',
          type: FieldType.checkbox),
      FieldDef(
          key: 'references_checked',
          label: 'References Checked?',
          type: FieldType.checkbox),
      FieldDef(
          key: 'outcome',
          label: 'Outcome',
          type: FieldType.dropdown,
          options: ['Pass', 'Concerns', 'Fail', 'Pending']),
      FieldDef(key: 'notes', label: 'Notes', type: FieldType.longText),
    ],
  ),

  // ── Payroll ─────────────────────────────────────────────────────────────────
  SectionModel(
    id: 'hr.payroll',
    kitId: _kitId,
    title: 'Monthly Payroll',
    subtitle: 'Per-employee salary record',
    subGroup: 'Payroll',
    pattern: SectionPattern.recordList,
    helpText:
        'Record gross + deductions = net for each employee, each month.',
    fields: [
      FieldDef(key: 'month', label: 'Month', type: FieldType.text, placeholder: 'YYYY-MM', required: true),
      FieldDef(key: 'emp_id', label: 'Employee ID', type: FieldType.text, required: true),
      FieldDef(key: 'name', label: 'Name', type: FieldType.text, required: true),
      FieldDef(key: 'designation', label: 'Designation', type: FieldType.text),
      FieldDef(key: 'department', label: 'Department', type: FieldType.text),
      FieldDef(key: 'working_days', label: 'Working Days', type: FieldType.number),
      FieldDef(key: 'leaves_taken', label: 'Leaves Taken', type: FieldType.number),
      FieldDef(
          key: 'gross_salary',
          label: 'Gross Salary',
          type: FieldType.currency,
          unit: 'BDT'),
      FieldDef(
          key: 'house_rent',
          label: 'House Rent Allowance',
          type: FieldType.currency,
          unit: 'BDT'),
      FieldDef(
          key: 'transport',
          label: 'Transport Allowance',
          type: FieldType.currency,
          unit: 'BDT'),
      FieldDef(
          key: 'medical',
          label: 'Medical Allowance',
          type: FieldType.currency,
          unit: 'BDT'),
      FieldDef(
          key: 'pf_deduction',
          label: 'Provident Fund',
          type: FieldType.currency,
          unit: 'BDT'),
      FieldDef(
          key: 'tax_deduction',
          label: 'Tax (TDS)',
          type: FieldType.currency,
          unit: 'BDT'),
      FieldDef(
          key: 'other_deduction',
          label: 'Other Deductions',
          type: FieldType.currency,
          unit: 'BDT'),
      FieldDef(
          key: 'net_pay',
          label: 'Net Pay',
          type: FieldType.currency,
          unit: 'BDT'),
      FieldDef(
          key: 'paid',
          label: 'Paid?',
          type: FieldType.checkbox),
    ],
  ),
];
