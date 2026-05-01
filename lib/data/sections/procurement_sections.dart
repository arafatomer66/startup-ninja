import '../models/section_model.dart';

const _kitId = 'procurement';

const List<SectionModel> procurementSections = [
  // ── Approvals ───────────────────────────────────────────────────────────────
  SectionModel(
    id: 'procurement.approval_matrix',
    kitId: _kitId,
    title: 'Approval Matrix',
    subtitle: 'Who can approve what',
    subGroup: 'Approvals',
    pattern: SectionPattern.catalog,
    helpText:
        '5 escalation levels by spend category. Higher amount = higher authority needed.',
    fields: [
      FieldDef(
          key: 'level',
          label: 'Authority Level',
          type: FieldType.dropdown,
          required: true,
          options: ['Level 1', 'Level 2', 'Level 3', 'Level 4', 'Level 5']),
      FieldDef(
          key: 'category',
          label: 'Category',
          type: FieldType.dropdown,
          required: true,
          options: [
            'Operations / General',
            'IT & Technology',
            'Marketing & Advertising',
            'CapEx',
            'Subscriptions',
          ]),
      FieldDef(
          key: 'role',
          label: 'Approving Role',
          type: FieldType.text,
          required: true,
          placeholder: 'e.g. Procurement Officer'),
      FieldDef(
          key: 'amount_limit',
          label: 'Amount Limit',
          type: FieldType.currency,
          unit: 'BDT'),
      FieldDef(
          key: 'requires_recommendation',
          label: 'Requires Prior Recommendation?',
          type: FieldType.checkbox),
      FieldDef(
          key: 'inform_list',
          label: 'Must Be Informed',
          type: FieldType.text,
          placeholder: 'Comma-separated roles'),
    ],
  ),

  // ── Vendors ─────────────────────────────────────────────────────────────────
  SectionModel(
    id: 'procurement.vendor_matrix',
    kitId: _kitId,
    title: 'Supplier / Vendor Matrix',
    subtitle: 'Score and compare vendors',
    subGroup: 'Vendors',
    pattern: SectionPattern.recordList,
    helpText:
        'Maintain at least 2 vendors per category. Score quarterly and rotate underperformers.',
    fields: [
      FieldDef(
          key: 'name',
          label: 'Supplier Name',
          type: FieldType.text,
          required: true),
      FieldDef(
          key: 'categories',
          label: 'Categories Supplied',
          type: FieldType.multiSelect,
          options: [
            'Packaging & Office Supplies',
            'Furniture & Interior',
            'IT Product / Service',
            'Garments & Apparel',
            'Industrial Equipment',
            'Kitchen / Home Appliance',
            'Electronics',
            'Stationery & Confectionery',
            'Agency',
            'Gift Items',
            'Other',
          ]),
      FieldDef(key: 'poc_name', label: 'Point of Contact', type: FieldType.text),
      FieldDef(key: 'poc_phone', label: 'Phone', type: FieldType.text),
      FieldDef(key: 'poc_email', label: 'Email', type: FieldType.text),
      FieldDef(
          key: 'quality_score', label: 'Quality (1-5)', type: FieldType.rating),
      FieldDef(
          key: 'delivery_score',
          label: 'Delivery (1-5)',
          type: FieldType.rating),
      FieldDef(key: 'cost_score', label: 'Cost (1-5)', type: FieldType.rating),
      FieldDef(
          key: 'relationship_score',
          label: 'Relationship (1-5)',
          type: FieldType.rating),
      FieldDef(
          key: 'preferred',
          label: 'Preferred Vendor?',
          type: FieldType.checkbox),
    ],
  ),
  SectionModel(
    id: 'procurement.price_comparison',
    kitId: _kitId,
    title: 'Price Comparison',
    subtitle: 'Side-by-side quotes',
    subGroup: 'Vendors',
    pattern: SectionPattern.recordList,
    fields: [
      FieldDef(
          key: 'item_name',
          label: 'Item Name',
          type: FieldType.text,
          required: true),
      FieldDef(
          key: 'description',
          label: 'Description',
          type: FieldType.longText),
      FieldDef(key: 'qty', label: 'Quantity', type: FieldType.number),
      FieldDef(
          key: 'vendor_1', label: 'Vendor 1 Name', type: FieldType.text),
      FieldDef(
          key: 'price_1',
          label: 'Vendor 1 Price',
          type: FieldType.currency,
          unit: 'BDT'),
      FieldDef(
          key: 'vendor_2', label: 'Vendor 2 Name', type: FieldType.text),
      FieldDef(
          key: 'price_2',
          label: 'Vendor 2 Price',
          type: FieldType.currency,
          unit: 'BDT'),
      FieldDef(
          key: 'vendor_3', label: 'Vendor 3 Name', type: FieldType.text),
      FieldDef(
          key: 'price_3',
          label: 'Vendor 3 Price',
          type: FieldType.currency,
          unit: 'BDT'),
      FieldDef(
          key: 'selected',
          label: 'Selected Vendor',
          type: FieldType.dropdown,
          options: ['Vendor 1', 'Vendor 2', 'Vendor 3']),
    ],
  ),

  // ── Purchasing ──────────────────────────────────────────────────────────────
  SectionModel(
    id: 'procurement.requisition_tracker',
    kitId: _kitId,
    title: 'Requisition & PO Tracker',
    subtitle: 'Internal requests & purchase orders',
    subGroup: 'Purchasing',
    pattern: SectionPattern.recordList,
    helpText: 'No purchase without an approved requisition.',
    fields: [
      FieldDef(key: 'req_date', label: 'Req. Date', type: FieldType.date),
      FieldDef(key: 'department', label: 'Department', type: FieldType.text),
      FieldDef(
          key: 'item', label: 'Item', type: FieldType.text, required: true),
      FieldDef(key: 'qty', label: 'Qty', type: FieldType.number),
      FieldDef(key: 'uom', label: 'UoM', type: FieldType.text),
      FieldDef(key: 'cs_no', label: 'CS Number', type: FieldType.text),
      FieldDef(key: 'po_no', label: 'PO Number', type: FieldType.text),
      FieldDef(key: 'po_date', label: 'PO Date', type: FieldType.date),
      FieldDef(key: 'vendor', label: 'Vendor', type: FieldType.text),
      FieldDef(
          key: 'amount',
          label: 'Amount',
          type: FieldType.currency,
          unit: 'BDT'),
      FieldDef(
          key: 'due_date', label: 'Due Date', type: FieldType.date),
      FieldDef(
          key: 'status',
          label: 'Status',
          type: FieldType.dropdown,
          defaultValue: 'Pending',
          options: ['Pending', 'Approved', 'Ordered', 'Delivered', 'Paid', 'Cancelled']),
    ],
  ),
  SectionModel(
    id: 'procurement.office_supplies',
    kitId: _kitId,
    title: 'Office Supplies Inventory',
    subtitle: 'Stock & reorder levels',
    subGroup: 'Purchasing',
    pattern: SectionPattern.recordList,
    fields: [
      FieldDef(
          key: 'item_name',
          label: 'Item Name',
          type: FieldType.text,
          required: true),
      FieldDef(key: 'description', label: 'Description', type: FieldType.text),
      FieldDef(key: 'qty_on_hand', label: 'Quantity on Hand', type: FieldType.number),
      FieldDef(key: 'reorder_level', label: 'Reorder Level', type: FieldType.number),
      FieldDef(
          key: 'cost_per_unit',
          label: 'Cost per Unit',
          type: FieldType.currency,
          unit: 'BDT'),
      FieldDef(key: 'supplier', label: 'Supplier', type: FieldType.text),
      FieldDef(key: 'department', label: 'Department', type: FieldType.text),
      FieldDef(
          key: 'status',
          label: 'Status',
          type: FieldType.dropdown,
          options: ['In Stock', 'Low Stock', 'Out of Stock', 'On Order']),
    ],
  ),

  // ── Assets ──────────────────────────────────────────────────────────────────
  SectionModel(
    id: 'procurement.asset_management',
    kitId: _kitId,
    title: 'Asset Management',
    subtitle: 'Asset register with warranty',
    subGroup: 'Assets',
    pattern: SectionPattern.recordList,
    fields: [
      FieldDef(
          key: 'asset_id',
          label: 'Asset ID',
          type: FieldType.text,
          required: true),
      FieldDef(
          key: 'name',
          label: 'Asset Name',
          type: FieldType.text,
          required: true),
      FieldDef(key: 'brand', label: 'Brand', type: FieldType.text),
      FieldDef(key: 'model', label: 'Model', type: FieldType.text),
      FieldDef(key: 'serial_no', label: 'Serial Number', type: FieldType.text),
      FieldDef(key: 'vendor', label: 'Vendor', type: FieldType.text),
      FieldDef(
          key: 'purchase_date', label: 'Purchase Date', type: FieldType.date),
      FieldDef(
          key: 'cost',
          label: 'Acquisition Cost',
          type: FieldType.currency,
          unit: 'BDT'),
      FieldDef(
          key: 'warranty_expiry',
          label: 'Warranty Expiry',
          type: FieldType.date),
      FieldDef(
          key: 'condition',
          label: 'Condition',
          type: FieldType.dropdown,
          options: ['New', 'Good', 'Fair', 'Needs Repair', 'Decommissioned']),
    ],
  ),
  SectionModel(
    id: 'procurement.asset_tracking',
    kitId: _kitId,
    title: 'Asset Tracking',
    subtitle: 'Who has what, where',
    subGroup: 'Assets',
    pattern: SectionPattern.recordList,
    fields: [
      FieldDef(
          key: 'asset_id',
          label: 'Asset ID',
          type: FieldType.text,
          required: true),
      FieldDef(key: 'name', label: 'Asset Name', type: FieldType.text),
      FieldDef(key: 'type', label: 'Type', type: FieldType.text),
      FieldDef(
          key: 'assigned_to',
          label: 'Assigned To',
          type: FieldType.text,
          required: true),
      FieldDef(key: 'department', label: 'Department', type: FieldType.text),
      FieldDef(key: 'location', label: 'Location / Space', type: FieldType.text),
      FieldDef(
          key: 'assigned_date',
          label: 'Assignment Date',
          type: FieldType.date),
      FieldDef(
          key: 'condition',
          label: 'Condition',
          type: FieldType.dropdown,
          options: ['Excellent', 'Good', 'Fair', 'Needs Repair']),
    ],
  ),
];
