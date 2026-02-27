- 
Red Hat peer review guide for technical documentation
[ | Red Hat peer review guide for technical documentation](#)
# Red Hat peer review guide for technical documentation
Table of Contents
[Introduction](#introduction)
[About this guide](#about-this-guide)
- [Purpose of peer reviews](#purpose)
- [Contributing to the guide](#contributing)
[Submitting a question or suggestion](#submitting-question-suggestion)
- [Making an update to this guide](#making-update-to-guide)
- [Peer review checklists](#checklist)
[Language](#_language)
- [Style](#_style)
- [Minimalism](#_minimalism)
- [Structure](#_structure)
- [Usability](#_usability)
- [Providing peer review feedback](#providing-feedback)
- [Creating a peer review process](#guidelines-creating-peer-review-process)
[Considerations when creating a peer review process](#considerations-creating-peer-review-process)
- [Finalizing your team’s peer review process](#finalizing-team-peer-review-process)
- [Example peer review process 1](#ref_example-peer-review-process1)
- [Example peer review process 2](#ref_example-peer-review-process2)
- [Editorial review](#editorial-review)
- [Appendix A: Pros and cons of the different peer review platforms](#pros-cons-peer-review-platforms)
- [Appendix B: Peer review resources](#ref_an-index-of-peer-review-resources)
## [Introduction](#introduction)
### [About this guide](#about-this-guide)
This guide provides information about best practices for peer reviewing Red Hat technical documentation.
**
This guide is internal to Red Hat.
A [public version of this peer review guide](https://redhat-documentation.github.io/peer-review/) is also available. The public version shares the same content, except for any internal links or references.
The Red Hat Customer Content Services (CCS) team created this guide for customer-facing documentation, but upstream communities that want to align more closely with the standards used by Red Hat documentation can also use this guide.
### [Purpose of peer reviews](#purpose)
It is recommended to perform a peer review on all updates to Red Hat documentation. Peer review provides the following benefits:
- 
Ensuring higher quality content, which helps our users
- 
Giving writers and reviewers a chance to see more content, find new ways to approach changes, and share expertise
For peer reviews to achieve these goals, reviewers should present their comments positively and avoid negative wording. At the same time, writers must be open to reviewers' feedback. Peer reviews can catch issues that writers might miss.
### [Contributing to the guide](#contributing)
#### [Submitting a question or suggestion](#submitting-question-suggestion)
If you have a suggestion or question, open an [issue](https://gitlab.cee.redhat.com/ccs-internal-documentation/peer-review/-/issues) in the project’s GitLab repository.
#### [Making an update to this guide](#making-update-to-guide)
See [Contributing to this guide](https://gitlab.cee.redhat.com/ccs-internal-documentation/peer-review/-/blob/main/peer-review-guide/CONTRIBUTING.md) in the project’s GitLab repository.
## [Peer review checklists](#checklist)
Writers and peer reviewers can use the peer review checklists as a quick reference to the Red Hat technical documentation style guidelines. Use the checklists to help structure your peer reviews, and adapt the checklists to meet the needs of your team.
For guidance on each topic outlined in the checklists, see the following resources:
- 
[IBM Style](https://www.ibm.com/docs/en/ibm-style)
- 
[IBM Style: quick reference](https://docs.engineering.redhat.com/pages/viewpage.action?spaceKey=CCSENABLE&title=IBM+Style+Guide%3A+quick+reference)
- 
[Minimalism in Red Hat documentation](https://source.redhat.com/my_stuff/groups/minimalism-quality-initiative)
- 
[Accessibility guidelines](https://docs.google.com/document/d/1ZYd5lxl4wHqqulCU_QsMZTPu02OVdraYL1enPq48_GA/edit)
- 
[Red Hat supplementary style guide for product documentation](https://redhat-documentation.github.io/supplementary-style-guide/)
- 
[Usability checklist for writers](https://docs.engineering.redhat.com/pages/viewpage.action?spaceKey=contentservices&title=Usability+checklist+for+writers+-+Version%3A+1.0)
- 
[Merriam-Webster Dictionary](https://www.merriam-webster.com/)
### [Language](#_language)
Table 1. Language checklist
Check for
Checked
**Spelling errors and typos**
- 
American English spelling is used consistently in the text.
- 
Correct punctuation is used in the text.
☐
**Grammar**
- 
American English grammar is used consistently in the text.
- 
Slang or non-English words are not used in the text.
☐
**Correct word usage and entity naming**
- 
Precise wording is used. Words are used in accordance with their dictionary definitions.
The writer has also considered the context of the words, so that the meaning, tone, and implications are appropriate.
- 
Named entities are classified on first use.
- 
Contractions are avoided, unless they are used intentionally for conversational style, such as in quick starts.
- 
Proper nouns are capitalized.
- 
Conscious language guidelines are followed. The terms *blacklist*, *whitelist*, *master*, and *slave* are used only when absolutely necessary.
☐
**Correct use of acronyms and abbreviations**
- 
Acronyms are expanded on first use.
- 
Abbreviations are used and applied correctly.
☐
**Terms and constructions**
- 
Phrasal verbs are avoided.
- 
Use of problematic terms such as *should* or *may* are avoided.
- 
Use of anthropomorphism is avoided.
☐
### [Style](#_style)
Table 2. Style checklist
Check for
Checked
**Passive voice**
- 
Unnecessary use of passive voice is avoided.
☐
**Tense**
- 
Future tense is used only when necessary.
☐
**Titles**
- 
Titles use sentence case.
- 
Titles and headings have consistent styling.
- 
Titles are effective and descriptive.
- 
Titles focus on customer tasks instead of the product.
- 
Titles are 3-11 words long and have 50-80 characters.
- 
Titles of procedure modules begin with a gerund, for example, "Configuring", "Using", or "Installing".
☐
**Number**
- 
Number conventions are followed.
☐
**Formatting**
- 
Content follows style and consistency guidelines for formatting, for example, user-replaceable values.
- 
Content uses correct AsciiDoc markup.
☐
### [Minimalism](#_minimalism)
Table 3. Minimalism checklist
Check for
Checked
**Customer focus and action orientation**
- 
Content focuses on actions and customer tasks.
☐
**Scannability/Findability**
- 
Content is easy to scan.
- 
Information is easy to find.
- 
Content uses bulleted lists and tables to make information easier to digest.
☐
**Sentences**
- 
Sentences are not unnecessarily long and only use the required number of words. Ensure that any long sentences cannot be shortened.
- 
Sentences are concise and informative.
☐
**Conciseness (no fluff)**
- 
The text does not include unnecessary information.
- 
Admonitions are used only when necessary.
- 
Screenshots and diagrams are used only when necessary.
- 
Content is clear, concise, precise, and unambiguous.
☐
### [Structure](#_structure)
Table 4. Structure checklist
Check for
Checked
**Structure meets modular guidelines**
- 
Module types are not mixed, for example, concept and procedure information is separate.
- 
Module types are used correctly.
- 
Tags and entities are used correctly.
- 
Modules are as self-contained as possible to facilitate reuse in other locations.
☐
**A logical flow of information**
- 
Information is provided at the right pace.
- 
Information is presented in the most logical order and location.
- 
Cross-references are used appropriately and only when useful.
☐
**User stories**
- 
The user goal is clear.
- 
Tasks reflect the intended goal of the user.
- 
Troubleshooting and error recognition steps are included where appropriate.
☐
### [Usability](#_usability)
Table 5. Usability checklist
Check for
Checked
**Content**
- 
The content is appropriate for the intended audience.
☐
**Accessibility**
- 
Tables and diagrams have alternative (alt) text and are clearly labeled and explained in surrounding text.
☐
**Links**
- 
Use of inline links is minimized.
- 
All the links in the document work.
- 
All links are current.
☐
**Visual continuity**
- 
The content renders correctly in preview, including correct spacing, bulleted lists, and numbering.
- 
Product versioning and release dates are accurate.
☐
## [Providing peer review feedback](#providing-feedback)
Peer reviews must be kind, helpful, and consistent among peer reviewers.
- 
**Support your comments.**
Use documented resources, such as style guides or Red Hat writing conventions.
- 
Explain the impact of the issue on the audience.
- 
If you cannot find documented support, rethink the need for the comment.
- 
**Use a respectful tone.**
Pose comments as questions when you are unsure.
- 
Choose your wording carefully and do not be harsh. Be concise for easy content updates. If you have a suggestion, ask the writer to "consider" your comment or state that you "suggest" something.
- 
**Stay within scope**. Review only the new content, changed content, and content that provides necessary context.
Review content that was changed in the pull request (PR) or merge request (MR).
- 
Review the preexisting section to ensure that the new or updated content fits.
- 
Do not request enhancements to the content unless the content is unclear without it.
- 
If you notice an issue in related content that you are not explicitly reviewing, use friendly wording to suggest changes. Some examples of appropriate language include:
"I know this was existing content, but would you mind fixing this typo while you’re in there?"
- 
"I know this is out of scope for this PR, but consider looking into this in a future update."
The writer might either address the issue now, track it as a future request, or let the peer reviewer know that they cannot apply the change.
- 
For more information about scope, see [Scope examples](#scope-examples).
- 
**Understand that peer reviewers do not review for technical accuracy.**
Subject matter experts (SMEs) and quality engineering (QE) associates are responsible for testing and technical accuracy.
- 
Peer reviewers check for issues like usability problems, style guide compliance, and unclear or missing steps in a procedure.
- 
Peer reviewers do not need to understand all the technical details. The audience might be users who are already familiar with the technology. Request additional technical information as a followup and not as a requirement for the current PR or MR.
- 
Some peer reviewers might be more familiar with a particular subject or know that an update can affect another area of the documentation. In these cases, provide this feedback to the writer.
- 
If you are certain that information is wrong or that a command will fail, ask the contributor to check with their SME or QE. Avoid tagging their SMEs or QEs directly to ask.
- 
**Recognize that writers do not have to accept all your suggestions.**
Writers must implement mandatory peer review feedback that relates to style guides or typographical errors, but they can implement optional feedback at their discretion. If the issue does not break any rules or is not an actual typographical error or issue, let writers keep it as it is.
- 
If you are merging a PR or MR and feel strongly that the writer must make a change but they disagree, speak to the writer in private. Cite style guides or vetted documentation so that they know your reasoning. Listen to their perspective. If the topic of the disagreement is not in any of the guides, consider bringing it to the team for discussion. In some cases, the guidelines might need to be updated.
- 
**Differentiate between required and optional changes.**
Required changes must be fixed before the writer can merge the PR or MR. Support your change with a reference to the relevant style guide or principle. Examples include modular docs template adherence, typographical error fixes, or product-specific guidelines.
- 
Optional changes do not have to be addressed before the writer can merge the PR or MR. Use softer language, for example, "Here, it might be clearer to…​" or use a [SUGGESTION] tag to clearly indicate it to the writer. Examples: wording improvements, content relocation, and stylistic preference.
- 
For more information about required versus suggested changes, see [Scope examples](#scope-examples).
- 
**Add your own suggestions for improvements** for a problematic area. Do not provide vague or generic comments, such as "this doesn’t make sense."
Offer rewrites as suggestions, not something that the writer has to take word-for-word. For example, "I don’t understand this description. Did you mean…​?"
- 
Avoid rewriting entire paragraphs of the writer’s content. If you find yourself doing this because multiple items in a paragraph need attention, break out your suggestions. If providing an alternative paragraph wording is necessary, ensure that you make it clear that the writer does not need to use your suggestion exactly as written.
- 
If you notice a recurring issue, leave a global comment for the writer so that they know to address every instance of the issue. For example, "[GLOBAL] This typo occurs in other locations within the doc. I won’t comment on the other examples after this point, but please address all instances."
- 
**Provide positive feedback as well as negative**
If during your review you find a portion of content that you think is exceptionally well done, point that out in your feedback. For example, "This part is pretty much perfect, nicely done!"
- 
This reinforces good writing habits and also makes getting reviews less daunting.
- 
**If the review requires a significant amount of editing or rework, pause the review and contact the writer directly to discuss.**
This avoids overwhelming the writer with too many comments and saves the peer reviewer’s time.
- 
If the content is not ready for peer review, tell the writer and continue after it is ready.
- 
Examples of when to pause a review include if the build is broken, if the content is not rendering properly, or if the content is not modularized correctly.
- 
Contact the writer privately, for example, by chat, to express your concerns and provide advice on how to move forward.
- 
Decide whether you have the time to work with the writer or if you need to request that they contact someone else, for example, an onboarding buddy or a senior writer.
- 
When content requires a more thorough review, suggest that the writer submit the content for an editorial review. For more information, see [Editorial review](#editorial-review)
- 
**Notify the writer when the review is complete.**
After you finish the review, notify the writer that the review is complete, so that they can start reviewing and implementing your feedback.
Scope examples
Some suggested changes might improve the content but are not relevant or in the scope of the updates. The following table includes examples of changes that are in scope and required, in scope but suggested, and out of scope.
Table 6. Examples of in scope and out of scope feedback
In scope - required
In scope - suggested
Out of scope
Typographical errors, grammatical issues, formatting issues
Rearranging:
- 
Moving something to the prerequisites section
- 
Moving verification steps out of the ".Procedure" and into a specific ".Verification" section in the procedure module, if applicable
Comments on content that was not changed in the PR or MR
[Modular docs guidelines](https://redhat-documentation.github.io/modular-docs/), for example:
- 
Adhering to the templates
- 
Correct anchor ID format
Reviewing wording that does not sound right to the reviewer to see if it can be improved
Requesting additional details, like default values or units
[IBM Style Guide](https://source.redhat.com/groups/public/ccs/ccs_folder/ibm_style_guide/ibm_stylepdf)
and [CCS supplementary style guide](https://redhat-documentation.github.io/supplementary-style-guide/) guidelines, for example:
- 
"may" to "might"
- 
"Click the **Save** button." to "Click **Save**."
Avoiding sequences of admonitions, for example, a [NOTE] followed by an [IMPORTANT] block, especially if they are the same type of admonition
Technical accuracy, unless you know for certain something is wrong or that a command will fail
Product-specific guidelines, for example:
- 
Prompts on terminal commands
- 
Separating commands into individual code blocks
- 
Sentence case in titles
## [Creating a peer review process](#guidelines-creating-peer-review-process)
Red Hat Customer Content Services (CCS) does not follow one definitive peer review process. Each team within CCS is different, with unique workflows, preferred tools, release cycles, and engineering team preferences that are customized to meet their product and customer requirements. Each team determines a peer review process that works for them.
Define a process so that peer reviews are used consistently throughout your team.
### [Considerations when creating a peer review process](#considerations-creating-peer-review-process)
Before you establish a peer review process that works for your team, review the following factors:
- 
[Is a peer review required or optional?](#peer-review-optional-required)
- 
[Who are the peer reviewers?](#who-are-peer-reviewers)
- 
[How does a writer request a peer review?](#writer-request-review)
- 
[How is the peer reviewer assigned?](#peer-reviewer-assigned)
- 
[What is the level or scope of the peer review?](#level-scope-review)
- 
[Is there a checklist for the peer reviewer to follow?](#checklist-for-reviewer)
- 
[What platform and tools are used to perform the review and give feedback?](#platform-tools-used)
- 
[What is the expected turnaround time?](#expected-turnaround-time)
- 
[How are urgent peer reviews escalated?](#urgent-peer-reviews-escalated)
- 
[How is peer review feedback incorporated?](#peer-review-feedback-incorporated)
#### Is a peer review required or optional?
A technical writing manager, documentation program manager (DPM), or content strategist (CS) determines whether requesting a peer review is required or optional and communicates this expectation to the team.
Example options
- 
Require a peer review on each GitHub PR (or GitLab MR) prior to accepting the request.
- 
Require a peer review in certain, defined situations.
- 
Request a peer review at the writer’s discretion.
#### Who are the peer reviewers?
Determine who conducts a peer review. A manager, DPM, or CS communicates this expectation to the team.
Example options
- 
Individuals can volunteer as peer reviewers.
- 
Everyone on the team is expected to be available to review at any time.
- 
Everyone participates in peer reviews and rotates being available or follows a roster.
#### How does a writer request a peer review?
Determine how writers request a peer review.
Example options
- 
Add the request details to a tracking spreadsheet.
- 
Communicate with a reviewer in a Google Chat or a Slack channel.
- 
Request a review through email.
- 
Use GitHub or GitLab labels to mark when content is ready for review.
- 
Open a Jira ticket or Bugzilla ticket with the request.
- 
Contact a reviewer in the original documentation ticket.
#### How is the peer reviewer assigned?
Some assignment methods might work better if the reviewers are on the same product team; others might work better for cross-product reviews. Establish a method that suits the structure and dynamic of the group of writers and reviewers that the process targets.
Writers must ensure that reviewers can access the tools needed to complete the review.
Example options
- 
Reviewers check a tracking spreadsheet and assign themselves.
- 
Reviewers are notified for all peer review requests and assign themselves.
- 
Reviewers regularly check a GitHub PR or a GitLab MR queue and assign themselves.
- 
A writer contacts the reviewer.
#### What is the level or scope of the peer review?
Determine the level or scope of the peer review, so that the writer and reviewer have the same expectations.
**
The writer is responsible for informing the peer reviewer of any essential information related to the content.
Example options
- 
Perform a general review that checks for typographical errors, style guide compliance, and link checking.
- 
Perform a deeper review of the content that includes checks on typographical errors and grammar, content placement or flow, structure, style guide compliance, and  consistency.
#### Is there a checklist for the peer reviewer to follow?
Determine which checklists and other resources the reviewer should follow.
**
The writer must inform the peer reviewer of any essential information related to the content.
Example options
- 
Follow the CCS peer review checklist.
- 
Follow the CCS peer review checklist and a team-specific checklist.
#### What platform and tools are used to perform the review and give feedback?
Determine how to share content and provide feedback.
Example options
- 
Draft content in a Google Doc and use the document for comments and suggestions.
- 
Share a GitHub PR or GitLab MR. Reviewers can comment directly inline for each change.
- 
Provide small snippets of content by email, instant messaging, or a ticket.
For more information, see [Pros and cons of the different peer review platforms](#pros-cons-peer-review-platforms).
#### What is the expected turnaround time?
Determine the expected turnaround time for completing a peer review. Writers should communicate if there is any urgency or deadlines for the review.
Example options
- 
Reviewers check the GitHub or GitLab queue daily or twice daily.
- 
Reviewers respond to a Slack or a Google Chat ping within a few hours.
- 
Reviewers check a tracking spreadsheet daily.
- 
Writers communicate the requested turnaround time after requesting the peer review.
#### How are urgent peer reviews escalated?
Determine how an unassigned peer review request is escalated if it can affect product release schedules.
Example options
- 
Inform a manager, DPM, or CS of the unassigned time-critical peer review so that they can escalate the peer review request or negotiate a new timeline for reviewing the content.
- 
Use your peer review request channel to request an urgent peer review. Ensure you detail the tight timelines in the channel.
#### How is peer review feedback incorporated?
Determine the expectations for addressing or incorporating feedback. Expectations become important if the writer and peer reviewer disagree on a review item.
Incorporate an escalation process into your peer review process, such as communicating in a guidelines group or requesting manager, DPM, or CS input. This way, the writer and peer reviewer can resolve any disagreement.
Example options
- 
Incorporate feedback at the writer’s discretion.
- 
Establish a communication channel for informing the peer reviewer of the next steps.
- 
Address peer review feedback and request the peer reviewer to perform a review of the revised content.
### [Finalizing your team’s peer review process](#finalizing-team-peer-review-process)
Writers and peer reviewers must agree on the expectations for the peer review process.
Complete the following steps to finalize the peer review process:
- 
Draft a proposal for the peer review process.
- 
Share the proposal with the team and set a time for the team to provide feedback.
- 
Test the process to ensure that it works well for your team.
- 
Document the final process wherever your team stores its resources.
- 
Communicate the final process to the team and any other contributors or stakeholders.
### [Example peer review process 1](#ref_example-peer-review-process1)
The first example peer review process demonstrates how a cross-product team uses Jira tickets for communication and GitLab to perform peer reviews.
This team has a peer review squad of at least two members at any specific time. Membership of the squad rotates every week. The team maintains a peer review assignment roster in a Confluence page that lists the assigned reviewers for each week. The assignment roster is published in the Jira product dashboards, so that writers can see the assigned reviewers for the current week.
Figure 1. Example 1 of a peer review process conducted through Jira and GitLab
Prerequisites
- 
A subject matter expert (SME) has completed a technical review.
To request and mark a technical review as complete, the writer performs the following tasks:
Put a link to the MR in the **Git Pull Request** field in the Jira doc ticket.
- 
Submit the MR for SME review.
- 
Apply the SME reviewer’s feedback.
- 
Update the MR in GitLab.
Procedure
- 
To request a peer review, the writer performs the following tasks:
Check the peer review assignment roster in the Jira product dashboard.
- 
Add a comment in the Jira doc ticket to contact the assigned reviewers.
**
The writer needs to contact the reviewers who are currently on duty according to the roster.
- 
Add the assigned reviewers to the **Includes** field in the Jira doc ticket.
- 
Optional: Contact the assigned reviewers in the MR or chat.
- 
If a peer review does not start within the expected timeframe and the review deadline is jeopardized, the writer performs the following task:
Contact the assigned reviewers again to communicate the urgency of the request.
**
If the review deadline is not jeopardized, the writer does not need to take any action at this point.
- 
To complete a review, the peer reviewer performs the following tasks:
Notify the other assigned reviewer that you will do the review.
- 
Remove the other assigned reviewer from the **Includes** field in the Jira doc ticket.
- 
Add review comments in the MR.
- 
Notify the writer when you complete the review.
- 
To apply feedback and complete the process, the writer performs the following tasks:
Apply the peer reviewer’s feedback.
- 
Update the MR in GitLab.
### [Example peer review process 2](#ref_example-peer-review-process2)
The second example peer review process demonstrates how a team uses a Slack channel for communication and GitHub to perform peer reviews. The peer review team consists of five team members at a given time. Membership of the peer review team rotates every sprint.
Figure 2. Example 2 of a peer review process conducted through Slack and GitHub
Procedure
- 
To request a peer review, the writer performs the following tasks:
Notify the peer review squad using the Slack channel.
- 
Include a link to the PR in the Slack notification.
- 
Specify any deadline or other special considerations in the Slack notification.
- 
If a peer review does not start within the expected timeframe and the review deadline is jeopardized, the writer performs the following task:
Contact the assigned reviewer or the peer review squad again to communicate the urgency of the request.
**
If the review deadline is not jeopardized, the writer does not need to take any action at this point.
- 
To complete a review, the peer reviewer performs the following tasks:
Mark the request in Slack to indicate that you will perform the review.
- 
Add review comments in the PR.
- 
Notify the writer when you complete the review.
- 
To apply feedback and complete the process, the writer performs the following tasks:
Apply the peer reviewer’s feedback.
- 
Update the PR in GitHub.
## [Editorial review](#editorial-review)
When your documentation requires a more thorough review than the standard peer review generally provides, you can also submit the content for an editorial review.
**How does editorial review differ from peer review?**
In some respects, editorial reviews work the same way as standard peer reviews. However, there are multiple important differences:
- 
Editorial reviews are conducted by dedicated technical editors who have a better awareness of CCS-wide cross-product writing standards and conventions. As a result, the output of editorial reviews is generally more consistent and reliable.
- 
Rather than low-level issues like typos, editorial reviews focus on higher-level topics such as customer focus, SEO, accessibility, and ease of localization.
- 
Editorial reviews are not limited by deadlines for content release. Therefore, they can cover larger portions of content and suggest larger systemic improvements.
**Who conducts editorial reviews?**
There is a small team of dedicated technical editors (currently [Ingrid Towey](https://rover.redhat.com/people/profile/itowey) and [Lorena Burcher](https://rover.redhat.com/people/profile/lbolanos)), who cover the entirety of CCS.
In addition, certain product documentation teams may have groups of experienced writers who perform *advanced peer reviews*, which in many regards work similarly to editorial reviews.
The aim for the future is for most product documentation teams to have an advanced review group to supplement the CCS-wide Editorial Team, and to have these groups collaborate across related products when viable.
**How to request an editorial review?**
To request an editorial review from a CCS-wide editor, fill in the [Editing request form](https://docs.google.com/forms/d/10PZ7xGYgjTjtvYdIV_MSSXBlAYeJHfIco0cfJ-ldj1A/viewform).
To get a review from your product-specific group, use the group’s preferred request method (if any), or get in touch with any of its members.
Additional resources
- 
[RHEL docs review checklists](https://docs.google.com/presentation/d/1BtHIdh4a1jDiYVtU9q0a5uJ_nrZ3tuuKmHlU3tS_lfY/edit#slide=id.p)
- 
[An example editorial review](https://issues.redhat.com/browse/CCSENABLE-503)
## [Appendix A: Pros and cons of the different peer review platforms](#pros-cons-peer-review-platforms)
Review the following pros and cons for each platform to choose the right peer review method for your team.
### GitHub or GitLab
Pros
- 
Provides a convenient method for commenting on specific lines of content on a GitHub PR or GitLab MR
- 
Includes functionality for easily adding additional reviewers
- 
Includes a mechanism for multiple people to collaborate on the same PR or MR
- 
Provides an easy linking functionality
- 
Offers the capability for writers to incorporate feedback before the PR or MR is approved
Cons
- 
Requires that you are familiar with the GitHub or GitLab UI
- 
Requires that you have login credentials to comment on a PR or MR
### Google Docs
Pros
- 
Includes a convenient method for commenting on specific text
- 
Includes functionality for easily adding additional reviewers
- 
Includes a mechanism for multiple people to collaborate on the same Google Doc
- 
Provides an easy linking functionality
- 
Supports copying and pasting of AsciiDoc syntax
Cons
- 
Can produce unreliable formatting when copying and pasting HTML, PDF, or markup syntax content
- 
Can be time consuming to copy and paste AsciiDoc content
### Email
Pros
- 
An easy tool for anyone to use
- 
A historical record of the discussion
Cons
- 
Can be difficult to link specific email comments to other communication channels
- 
Can be slow and time consuming
- 
Can be difficult to understand feedback if the content is not well structured
### IRC, Google Chat, or Slack
Pros
- 
Provides fast communication
- 
Can send instant notifications to online participants
- 
Provides an opportunity for immediate discussion
Cons
- 
Requires online access
- 
Limits message length
### Jira or Bugzilla ticket
Pros
- 
Supports collaboration and approval among multiple reviewers before any change is made
- 
Sends comments to all followers of the ticket
Cons
- 
Difficulty editing submitted comments
- 
Not easy to provide inline comments on the ticket
- 
Unwanted notification emails when there are multiple followers
- 
Tedious to discuss lengthy content on a ticket
- 
Limited space to add comments
## [Appendix B: Peer review resources](#ref_an-index-of-peer-review-resources)
This section lists additional tools and resources available for peer reviewing documentation.
Table 7. Validation tools
Resource
Description
[newdoc](https://github.com/redhat-documentation/newdoc)
A script for creating new files for a modular documentation repository. You can also use the script to [validate](https://github.com/redhat-documentation/newdoc#validating-a-file-for-red-hat-requirements) whether a piece of content adheres to Red Hat documentation markup and structure standards.
[Vale for Red Hat documentation writers](https://redhat-documentation.github.io/vale-at-red-hat/docs/main/user-guide/introduction/)
A linting system that validates whether your text is compatible with Red Hat writing style.
[IBM Equal Access Accessibility Checker](https://www.ibm.com/able/toolkit/verify/)
A toolkit of instructions and [browser extensions](https://www.ibm.com/able/toolkit/verify/automated) to generate automated accessibility reports.
Table 8. Style resources
Resource
Description
[IBM Style Guide](https://source.redhat.com/groups/public/ccs/ccs_folder/ibm_style_guide/ibm_style_q4_2021pdf)
The governing guide for IBM writing style, which most Red Hat documentation follows.
[IBM Style Guide: quick reference](https://docs.engineering.redhat.com/pages/viewpage.action?spaceKey=CCSENABLE&title=IBM+Style+Guide%3A+quick+reference)
A compact overview of key concepts from the *IBM Style Guide*, with examples and a search function.
[Red Hat supplementary style guide for product documentation](https://redhat-documentation.github.io/supplementary-style-guide/)
A guide for writing documentation the Red Hat way, including style guidelines, formatting, and a glossary of terms and conventions.
Complementary to the IBM Style Guide.
[Minimalism in Red Hat documentation](https://source.redhat.com/groups/public/minimalism-quality-initiative)
The landing page for learning how to apply minimalism principles to your writing. Minimalism is a way to write more concisely by focusing on what readers need to do.
[The Wisdom of Crowds slides](https://docs.google.com/presentation/d/1Yeql9FrRBgKU-QlRU-nblPJ9pfZKgoKcU8SW6SQ_UqI/edit#slide=id.g1f4790d380_2_176)
A slide deck on Red Hat community outreach, including the principles of minimalism in writing documentation.
[CCS Accessibility Checklist](https://docs.google.com/document/d/1SXhLknoE4gjyqumlCEI6H_IOekcjjPyjiNjccysyzcM/edit#heading=h.cnle8410kh73)
A checklist of recommended accessibility practices developed by the CCS accessibility workgroup.
Table 9. Markup resources
Resource
Description
[AsciiDoc Mark-up Quick Reference for Red Hat Documentation](https://redhat-documentation.github.io/asciidoc-markup-conventions/)
Guidelines on using the AsciiDoc markup language in Red Hat documentation projects.
[Basic tech writing workflow exercise](https://source.redhat.com/groups/public/ccs-onboarding-program/ccs_onboarding_wiki/asciidocccutilgit_exercise)
A guided exercise on writing documentation in CCS, including basic Git setup, AsciiDoc markup recommendations, and a sandbox document repository for experimentation.
[Advanced AsciiDoc training for CCS](https://ccs-internal-documentation.pages.redhat.com/AsciiDocTutorialEp2/book/index.html)
A guided exercise that contains more advanced AsciiDoc markup and CCS tooling. Includes markup recommendations and a sandbox document repository for experimentation.
Table 10. Structure resources
Resource
Description
[Modular Documentation Reference Guide](https://redhat-documentation.github.io/modular-docs/)
Instructions for creating Red Hat documentation in a modular way, with templates and examples.
[How Chunking Helps Content Processing](https://www.nngroup.com/articles/chunking/)
Tips for structuring your docs content in a visually comprehensible way.
[Starting a modular documentation Project in Antora](https://antora-for-modular-docs.github.io/antora-for-modular-docs/docs/user-guide/introduction/)
How to use the Antora toolchain to create a community documentation project.
Table 11. Methodology resources
Resource
Description
[Red Hat Community Collaboration Guide](https://redhat-documentation.github.io/community-collaboration-guide/)
Tips and best practices for Red Hat and the upstream community joining forces on documentation projects.
[How to edit other people’s content without pissing them off](https://www.youtube.com/watch?v=7iWUSetbaos)
Ingrid Towey’s talk on conducting peer reviews that inform and inspire but do not infuriate.
[Interpreting and incorporating user feedback into product documentation](https://spaces.redhat.com/pages/viewpage.action?spaceKey=DOCS&title=Interpreting+and+incorporating+user+feedback+into+product+documentation)
Guidelines for content providers about how to review and incorporate feedback from subject matter experts and customers.
Last updated 2025-08-14 16:06:03 UTC
