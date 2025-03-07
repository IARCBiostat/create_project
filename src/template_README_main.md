# Project Documentation  

This document outlines the **minimum** information that should be included in the project-level `README.md`. It also provides **guidelines** for structuring the project directory to ensure **reproducibility, clarity, and efficient organisation**.  

You are encouraged to **improve and modify** this structure if it enhances **reproducibility** and **organisation** in your specific context.  

The ultimate goal is to ensure that the next person working on this project can **easily understand** how data, figures, tables, and other outputs are generated and organised. Instead of wasting time figuring out the workflow, they should be able to follow **clear** and **helpful** instructions to reproduce project outputs **with confidence** and extend the work seamlessly.  

---

# Project Name  

Provide a **brief** description of the project, including:  
- The **main objective** of the project.  
- A **summary** of the data under study.  
- The **general analysis methods** used.  

## Notes  

Include any **special instructions** or important notes for future users.  

## [Optional Section]  

Provide **any additional relevant details** if needed. For example, suggest improvements and potential future steps.  

---

# Project Directory Structure  

This project is organised into three main directories:  

- `data/` – Stores raw and processed data used in the project.  
- `manuscripts/`, `presentations/`, and `reports/` – These directories store figures, tables, and other outputs for different sub-projects.  
  - You may rename these directories based on your sub-project definitions (e.g., a report, presentation, or manuscript).  
  - Multiple directories of this type may exist, depending on the number of reports, presentations, or manuscripts in this project.  
- `src/` – Contains all code-based files required to generate the products (e.g., figures, tables).  

Each subdirectory has its own `README.md` with **detailed** guidelines on its contents and usage. **Refer to those files for more information.**  
