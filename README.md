# Banking Analytics Dashboard

**Author:** Floyd Steev Santhmayer
**Project type:** End-to-end analytics, visualization & reporting
**Tools:** Power BI Desktop, Python (Jupyter), pandas, matplotlib, SQL

---

## Project summary

This repository delivers an end-to-end banking analytics solution: a multi-page **Power BI** dashboard presenting executive KPIs (clients, loans, deposits, fees), product breakdowns (bank loans, business lending, credit cards, savings/checking) and customer segmentation (income band, nationality, engagement timeframe). A companion **Jupyter** notebook documents data ingestion from MySQL, cleaning, feature engineering, validation checks and EDA visualizations — enabling analysts and BI teams to reproduce, extend and operationalize reporting.

---

## Quick start

1. Clone the repo:
```bash
git clone https://github.com/<your-username>/<your-repo>.git
cd <your-repo>
```

2. Review the Power BI report:
- Open `Banking Dashboard.pbix` in Power BI Desktop (Windows).

3. Run the notebook (recommended in a virtual environment):
```bash
python -m venv .venv
# macOS / Linux
source .venv/bin/activate
# Windows (PowerShell)
.\.venv\Scripts\Activate.ps1
pip install -r requirements.txt
jupyter notebook BankEDA.ipynb
```

4. Use `Makefile` targets for quick reproducibility (or run the provided scripts).

---

## Repository layout

```
/assets
  /images
    page1_home.png
    page2_loan_analysis.png
    page3_deposit_analysis.png
    page4_summary.png
/data_sample
  sample_customer_balances.csv
/docs
  data_dictionary.md
  metrics.md
/src
  (optional helper scripts)
Banking Dashboard.pbix
BankEDA.ipynb
README.md
CONTRIBUTING.md
CHANGELOG.md
LICENSE
requirements.txt
.gitignore
SECURITY.md
CODE_OF_CONDUCT.md
.github/
  ISSUE_TEMPLATE/
  PULL_REQUEST_TEMPLATE.md
  workflows/ci.yml
.gitattributes
Makefile
Dockerfile
```

---

## Recommended next steps for maintainers

- Configure Git LFS for `.pbix` files or upload the PBIX as a release asset.
- Protect `main` branch and require PR reviews and passing CI.
- Store production data in a secure data store and never commit PII.
- Enable Dependabot and CodeQL scanning in repository settings.

---

## Contact

**Author:** Floyd Steev Santhmayer — open issues for questions or feature requests.
