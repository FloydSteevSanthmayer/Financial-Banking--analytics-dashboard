# Banking Analytics Dashboard

**Author:** Floyd Steev Santhmayer  
**Type:** End-to-end analytics, visualization & reporting  
**Tech stack:** Power BI Desktop, Python (Jupyter), pandas, NumPy, matplotlib, SQL

---

## Executive summary

This repository contains a production-grade Banking Analytics Dashboard (Power BI) and a companion exploratory analysis notebook. It codifies the full analytics lifecycle for customer, loan and deposit data: ingestion, validation, cleaning, feature engineering, exploratory analysis, KPI calculation, and interactive reporting. The assets are intended for analysts, BI engineers and stakeholders who require repeatable, auditable insights and an extensible baseline for operational reporting.

Intended outcomes:
- Provide executive KPIs and product-level views to monitor portfolio health.
- Surface customer segmentation by income band, nationality and engagement timeframe.
- Provide a reproducible analysis pipeline and documentation for handoff to BI/engineering teams.

---

## Table of contents

1. [Quick start](#quick-start)  
2. [Project structure](#project-structure)  
3. [How to open and reproduce](#how-to-open-and-reproduce)  
4. [Architecture & data flow](#architecture--data-flow)  
5. [KPI & metric definitions](#kpi--metric-definitions)  
6. [Quality, security & governance](#quality-security--governance)  
7. [CI / automation / release process](#ci--automation--release-process)  
8. [Contributing & code ownership](#contributing--code-ownership)  
9. [Contacts & support](#contacts--support)  
10. [License](#license)

---

## Quick start

### Preview (recommended)
1. Download the repository and open the `assets/images` screenshots for a rapid visual summary.
2. For full functionality, use Power BI Desktop to open `Banking Dashboard.pbix`.

### Local reproduction (EDA)
```bash
# clone repository
git clone https://github.com/<your-org>/banking-analytics-dashboard.git
cd banking-analytics-dashboard

# create a Python virtual environment
python -m venv .venv
# macOS / Linux
source .venv/bin/activate
# Windows (PowerShell)
.\.venv\Scripts\Activate.ps1

# install dependencies
pip install -r requirements.txt

# run the notebook interactively
jupyter notebook BankEDA.ipynb
```

> Notes: The notebook includes data validation checks and synthetic sample data (`data_sample/sample_customer_balances.csv`) so you can execute the analysis without production data.

---

## Project structure

```
/assets
  /images              # dashboard screenshots
Banking Dashboard.pbix  # Power BI desktop file (large, binary)
BankEDA.ipynb           # EDA & data-prep notebook
/data_sample            # small synthetic sample for reproducibility
/docs
  data_dictionary.md
  metrics.md
src/                    # optional scripts and utilities
.github/                # CI, issue & PR templates
Makefile
Dockerfile
README.md
CONTRIBUTING.md
CHANGELOG.md
LICENSE
requirements.txt
.gitattributes          # Git LFS recommendations for .pbix files
```

---

## How to open & inspect the Power BI report

1. Install Power BI Desktop (Windows).
2. Open `Banking Dashboard.pbix`.
3. If the report points to an external datasource:
   - Home → Transform data → Data source settings → Edit credentials
   - Home → Refresh

**Recommendation:** Use Git LFS for `.pbix` files or attach them to a GitHub Release to avoid bloating repository history.

---

## Architecture & data flow

**High level**
1. Source systems: MySQL (production extracts) → ETL/Extract to CSV or staging tables.  
2. Data transformation: Python notebook performs cleaning, normalization, and feature engineering.  
3. Artifacts: Cleaned dataset + computed KPIs are imported into Power BI for modeling and visualization.  
4. Distribution: Power BI Desktop (authoring) → Power BI Service (publish, schedule refresh, RLS).

**Key considerations**
- Keep raw production extracts outside the repo.
- Store credentials in secure secret stores (GitHub Secrets, Azure Key Vault).
- Document measure logic (DAX/SQL) in `/docs/metrics.md`.

---

## KPI & metric definitions

See `/docs/metrics.md` for detailed definitions and example SQL/DAX. Summary:

- **Total Clients**: `COUNT(DISTINCT client_id)` within the filter context.
- **Total Loan**: `SUM(total_loan)` across selected entities.
- **Bank Loan**: `SUM(bank_loan)` — term and facility exposures held at banking units.
- **Business Lending**: `SUM(business_lending)`.
- **Total Deposit**: `SUM(total_deposit)` (aggregate of bank_deposit + savings + checking + foreign currency holdings).
- **Savings / Checking / Foreign Currency Amounts**: column sums of corresponding balance fields.
- **Total Fees**: `SUM(fees)` — aggregated fee income for the selected population.

> Always verify measure behavior after re-pointing to a new data source. Put definitive DAX expressions into `docs/metrics.md` for auditability.

---

## Data dictionary & sample data

- `docs/data_dictionary.md` contains field names, types, units and acceptable value ranges.
- `data_sample/sample_customer_balances.csv` provides a minimal dataset to run the notebook and validate notebook logic.

---

## Quality, security & governance

- **No secrets in repo**: Never commit credentials, API keys, or PII. Use environment variables or secrets management.
- **PII handling**: If production data contains PII, anonymize or pseudonymize prior to analysis and follow your organization’s data governance policy.
- **Security reporting**: See `SECURITY.md` for vulnerability reporting procedures.
- **Code style & checks**: Use `flake8` / `pre-commit` hooks for Python style enforcement.

---

## CI / automation / release process

- CI workflow (`.github/workflows/ci.yml`) runs linting and attempts a lightweight notebook execution (configurable).
- Use GitHub Releases to publish large artifacts (`.pbix`) as release assets.
- Use Dependabot (`.github/dependabot.yml`) for dependency updates and enable CodeQL scanning for security.

Suggested release steps:
1. Create a release branch: `release/vX.Y.Z`.
2. Update `CHANGELOG.md` with notable changes.
3. Tag and create a GitHub Release; attach `Banking Dashboard.pbix` as an artifact if needed.
4. Publish to Power BI Service and schedule dataset refreshes; document refresh schedule in repo or release notes.

---

## Contributing & code ownership

- Follow `CONTRIBUTING.md` for PR conventions and testing requirements.
- Use the provided GitHub issue templates for bugs and feature requests.
- Define `CODEOWNERS` to assign reviewers for critical folders (`/docs`, `/src`).

Pull request checklist:
- [ ] No sensitive data committed.
- [ ] Notebook executed or demonstrably validated.
- [ ] Metrics and DAX expressions documented in `docs/metrics.md`.
- [ ] Screenshots or sample outputs attached when appropriate.

---

## Maintenance & roadmap suggestions

Short term:
- Add DAX formulas for key measures into `docs/metrics.md`.
- Configure Git LFS and move `.pbix` into LFS tracking, or plan to attach the file as a Release asset.

Medium term:
- Add row-level security (RLS) patterns for multi-team access control.
- Implement automated dataset refresh with monitored failure alerts.
- Add unit tests for ETL functions (if transforming via Python scripts).

---

## Contacts & support

- **Owner / Maintainer:** Floyd Steev Santhmayer  
- For production incidents, open a GitHub issue and tag `security` for sensitive matters. For urgent support, contact the repo owner directly.

---

## License

This project is distributed under the **MIT License**. See `LICENSE` for full terms.

---

## Final notes

This repository is structured for clarity, reproducibility and operational handoff. If you would like, I can:
- Insert the exact DAX expressions from the PBIX into `docs/metrics.md`.  
- Add pre-commit configuration and Git LFS commands.  
- Produce a short “how-to-publish-to-Power-BI-Service” doc for non-technical stakeholders.
