# GitHub and Government

[![Test site build](https://github.com/github/government.github.com/actions/workflows/build.yml/badge.svg)](https://github.com/github/government.github.com/actions/workflows/build.yml)

![screenshot](assets/img/screenshot.png)

## 🌍 Open Government Innovation with GitHub

Gather, curate, and feature stories of people using GitHub as part of their open government initiatives.

This site is **open source** ([view all the code!](https://github.com/github/government.github.com)) and serves as a collaborative tool _for_ and _by_ the community.

💡 Submit [issues](https://github.com/github/government.github.com/issues/new) and [pull requests](https://github.com/github/government.github.com/compare/) to share stories, suggest site improvements, or fix errors.

---

## 🎯 Goals

✅ Share real-world experiences using GitHub in open government projects  
✅ Demystify open-source terminology  
✅ Showcase community efforts, promoting collaboration between individuals and organizations  
✅ Make getting started with GitHub easier  

---

## ⚙️ Under the Hood

This site is built using **[Jekyll](https://jekyllrb.com)**, an open-source static site generator. Jekyll converts our content into HTML files, which are then hosted on **[GitHub Pages](https://pages.github.com/)**. All the content is maintained on the **[gh-pages](https://github.com/github/government.github.com/tree/gh-pages)** branch.

---

## 🤝 Contributing

### 🛠 Fix or Edit Content
🔹 Found an error? Want to improve the content? Simply **fork** this repository, make the changes, and submit a **pull request**.  
🔹 If you're unable to make changes yourself, file an **[issue](https://github.com/github/government.github.com/issues/new)**.

### 🏛️ Add an Organization
Know of a **[GitHub organization](https://help.github.com/articles/about-organizations/)** that should be included in our [Community](https://government.github.com/community/) page?  

1. Fork this repository
2. Edit one of the following files:
   - `_data/civic_hackers.yml`
   - `_data/governments.yml`
   - `_data/research.yml`
3. Add the organization in the same format as existing entries
4. Commit the changes and submit a **pull request**

---

## 🏗️ Setting Up Locally

Run this site on your computer as if it were live online!

### 📌 Requirements
- [Jekyll](https://jekyllrb.com/)
- [Ruby](https://www.ruby-lang.org/en/)
- [Git](https://git-scm.com/)
- A JavaScript runtime ([Node.js](https://nodejs.org/en))

> _If you have installed [GitHub Desktop](https://desktop.github.com), Git was also installed automatically._

### 🔧 Steps to Set Up Locally
```bash
# Clone the repository
git clone https://github.com/github/government.github.com.git
cd government.github.com

# Install dependencies
script/bootstrap

# Start the local server
script/server
```
🌐 Open `http://localhost:4000` in your browser

---

## 🚀 Deploying

government.github.com follows a **two-repo approach**:

- **Production:** [github/government.github.com](https://github.com/github/government.github.com/) (this repository)
- **Staging:** [government/staging](https://ghe.io/government/staging)

### 🏗 Deploying to Staging
For larger changes, deploy to staging first:
```bash
script/stage staging
```
This will generate the site and push it to the staging repo ([https://ghe.io/government/staging](https://ghe.io/government/staging)).

### 🔐 Authentication
You'll need to authenticate via GitHub in the terminal. Use your **GHE.io username** and a **[personal access token](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)** instead of a password (since we enforce 2FA).

> _Having trouble deploying to staging? Delete the `_site` directory and try again._

### ✅ Deploying to Production
Once your pull request is **approved and merged**, changes will automatically be deployed to the production site within a few minutes.

---

## 📌 Triage Issues  
[![Open Source Helpers](https://www.codetriage.com/github/government.github.com/badges/users.svg)](https://www.codetriage.com/github/government.github.com)

Want to help triage issues? This involves:
🔹 Asking for additional information on reported issues  
🔹 Requesting formatting changes  
🔹 Subscribing to [CodeTriage](https://www.codetriage.com/github/government.github.com) to get started

---

## ❓ Need Help?
If you don't find what you're looking for, create an **[issue](https://github.com/github/government.github.com/issues/new)**, and we'll do our best to assist you!

---

## 📜 License

The data in `_data` is **free to use** without restriction. Contributions to these files are released under **[CC0-1.0](https://creativecommons.org/publicdomain/zero/1.0/)**.

📌 When using GitHub logos, follow the **[GitHub logo guidelines](https://github.com/logos)**.

🎨 Feel free to enhance and improve this site while maintaining its integrity and clarity!

