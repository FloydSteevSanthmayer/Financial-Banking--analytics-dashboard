# Metrics & KPI definitions

This document defines key metrics and their calculation logic.

- **Total Clients**: Count of distinct `client_id` in the filtered dataset.
- **Total Loan**: Sum of `total_loan` for the given filter context.
- **Bank Loan**: Sum of `bank_loan` (includes term loans with bank structures).
- **Business Lending**: Sum of `business_lending`.
- **Total Deposit**: Sum of `total_deposit`.
- **Saving Account Amount**: Sum of `savings_amount`.
- **Checking Account Amount**: Sum of `checking_amount`.
- **Foreign Currency Amount**: Sum of `foreign_currency_amount`.
- **Total Fees**: Sum of `fees`.

> **DAX / SQL examples** can be added here to mirror the PBIX measures (example omitted — add DAX as used in your report).
