---
title: Accessibility
layout: support-page
permalink: /accessibility/
description: "Voluntary Product Accessibility Template (VPAT) outlining §508 accessibility information for GitHub.com, GitHub Enterprise, GitHub for Mac, and GitHub for Windows."
redirect_from: "/508/"
data:
  Summary:
    product:
    criteria:
      - criterion: "Section 1194.21 Software Applications and Operating Systems"
        support: Supports with exceptions
        comments: GitHub for Windows and GitHub for Mac
      - criterion: "Section 1194.22 Web-based Intranet and Internet Information and Applications"
        support: Supports
        comments: GitHub.com and GitHub Enterprise
      - criterion: "Section 1194.23 Telecommunications Products"
        support: Not applicable
        comments:
      - criterion: "Section 1194.24 Video and Multi-media Products"
        support: Supports
        comments: "Training materials available via [youtube.com/github](https://www.youtube.com/user/github) and [youtube.com/githubguides](https://www.youtube.com/user/githubguides)"
      - criterion: "Section 1194.25 Self-Contained, Closed Products"
        support: Not applicable
        comments:
      - criterion: "Section 1194.26 Desktop and Portable Computers"
        support: Not applicable
        comments:
      - criterion: "Section 1194.31 Functional Performance criterion"
        support: Supports
        comments:
      - criterion: "Section 1194.41 Information, Documentation and Support"
        support: Supports
        comments:

  "Section 1194.21 Software Applications and Operating Systems":
    product: GitHub for Mac and GitHub for Windows
    criteria:
      - criterion: "(a) When software is designed to run on a system that has a keyboard, product functions shall be executable from a keyboard where the function itself or the result of performing a function can be discerned textually."
        support: Supports with exceptions
        comments: Primary functionality of both GitHub for Mac and GitHub for Windows is discernable textually and executable via keyboard. Some advanced features, such as listing or switching branches may require use of the Git command line interface.
      - criterion: "(b) Applications shall not disrupt or disable activated features of other products that are identified as accessibility features, where those features are developed and documented according to industry standards. Applications also shall not disrupt or disable activated features of any operating system that are identified as accessibility features where the application programming interface for those accessibility features has been documented by the manufacturer of the operating system and is available to the product developer."
        support:  Supports
        comments: GitHub desktop applications are built using platform-specific standards and best practices where possible.
      - criterion: "(c) A well-defined on-screen indication of the current focus shall be provided that moves among interactive interface elements as the input focus changes. The focus shall be programmatically exposed so that Assistive Technology can track focus and focus changes."
        support:  Supports with exceptions
        comments: Focus programmatically exposed for all primary functionality of both GitHub for Mac and GitHub for Windows. Some advanced features, such as listing or switching branches may require use of the Git command line interface.
      - criterion: "(d) Sufficient information about a user interface element including the identity, operation and state of the element shall be available to Assistive Technology. When an image represents a program element, the information conveyed by the image must also be available in text."
        support: Supports with exceptions
        comments: Information about user interface elements exposed for all primary functionality of both GitHub for Mac and GitHub for Windows. Some advanced features, such as listing or switching branches may require use of the Git command line interface.
      - criterion: "(e) When bitmap images are used to identify controls, status indicators, or other programmatic elements, the meaning assigned to those images shall be consistent throughout an application's performance."
        support: Supports
        comments: "All iconography are rendered via the [Octicons](https://github.com/styleguide/) library."
      - criterion: "(f) Textual information shall be provided through operating system functions for displaying text. The minimum information that shall be made available is text content, text input caret location, and text attributes."
        support: Supports
        comments:
      - criterion: "(g) Applications shall not override user selected contrast and color selections and other individual display attributes."
        support:  Supports
        comments: System wide contrast, font-size and other accessibility preferences are respected throughout the application.
      - criterion: "(h) When animation is displayed, the information shall be displayable in at least one non-animated presentation mode at the option of the user."
        support: Not applicable
        comments:
      - criterion: "(i) Color coding shall not be used as the only means of conveying information, indicating an action, prompting a response, or distinguishing a visual element."
        support: Supports
        comments: Visual line diffs are annotated with standard "+" and "-" notation to indicated additions and removals
      - criterion: "(j) When a product permits a user to adjust color and contrast settings, a variety of color selections capable of producing a range of contrast levels shall be provided."
        support: Not applicable
        comments:
      - criterion: "(k) Software shall not use flashing or blinking text, objects, or other elements having a flash or blink frequency greater than 2 Hz and lower than 55 Hz."
        support: Supports
        comments: Applications have no flashing or blinking elements
      - criterion: "(l) When electronic forms are used, the form shall allow people using Assistive Technology to access the information, field elements, and functionality required for completion and submission of the form, including all directions and cues."
        support: Supports with exceptions
        comments: User can interact with and fill all form elements using assistive technology, however, directions and queues may not be accessible. All form interactions can be accomplished through the Git command line interface.

  "Section 1194.22 Web-based Intranet and Internet Information and Applications":
    product: GitHub.com and GitHub Enterprise
    criteria:
      - criterion: "(a) A text equivalent for every non-text element shall be provided (e.g., via 'alt', 'longdesc', or in element content)."
        support:  Supports with exceptions
        comments: All non-text navigation and functional elements are accompanied by text descriptions. Some non-navigation, non-functional visual elements, such as a user's contributions graph may not be accessible to assistive technology.<br /><br />Additionally, when a users submits non-text content (e.g., an image in a issue comment), Markdown's syntax requires alternative text be provided.
      - criterion: "(b) Equivalent alternatives for any multimedia presentation shall be synchronized with the presentation."
        support:  Not applicable
        comments: No multimedia presentations (other than the occasional animated GIF) are used.
      - criterion: "(c) Web pages shall be designed so that all information conveyed with color is also available without color, for example from context or markup."
        support: Supports
        comments: Visual line diffs are annotated with standard "+" and "-" notation to indicated additions and removals.
      - criterion: "(d) Documents shall be organized so they are readable without requiring an associated style sheet."
        support: Supports
        comments: GitHub uses modern, text-bassed, semantic web development practices, and does not rely on non-HTML plugins or applets such as Java, ActiveX, or Flash except where otherwise noted for non-essential functionality.
      - criterion: "(e) Redundant text links shall be provided for each active region of a server-side image map."
        support:  Not applicable
        comments: No server-side image maps are used.
      - criterion: "(f) Client-side image maps shall be provided instead of server-side image maps except where the regions cannot be defined with an available geometric shape."
        support:  Not applicable
        comments: No client-side image maps are used.
      - criterion: "(g) Row and column headers shall be identified for data tables."
        support:  Supports
        comments:
      - criterion: "(h) Markup shall be used to associate data cells and header cells for data tables that have two or more logical levels of row or column headers."
        support:  Not applicable
        comments:
      - criterion: "(i) Frames shall be titled with text that facilitates frame identification and navigation"
        support:  Not applicable
        comments: No frames are used for navigation. An iframe is used to render visual representations of some user content such as maps.
      - criterion: "(j) Pages shall be designed to avoid causing the screen to flicker with a frequency greater than 2 Hz and lower than 55 Hz."
        support:  Supports
        comments:
      - criterion: "(k) A text-only page, with equivalent information or functionality, shall be provided to make a web site comply with the provisions of this part, when compliance cannot be accomplished in any other way. The content of the text-only page shall be updated whenever the primary page changes."
        support:  Not applicable
        comments: Where an interaction is not possible through the web interface, it may be accomplished through text-only means through the Git command-line desktop software.
      - criterion: "(l) When pages utilize scripting languages to display content, or to create interface elements, the information provided by the script shall be identified with functional text that can be read by Assistive Technology."
        support:  Supports
        comments:
      - criterion: "(m) When a web page requires that an applet, plug-in or other application be present on the client system to interpret page content, the page must provide a link to a plug-in or applet that complies with 1194.21(a) through (l)."
        support:  Not applicable
        comments: The only plugin used is a flash-bassed tool for simplifying the task of copying text visible on the page (such as a commit's unique id) to the user's clipboard. The task may be accomplished through the operating system's standard copy and paste functionality.
      - criterion: "(n) When electronic forms are designed to be completed on-line, the form shall allow people using Assistive Technology to access the information, field elements, and functionality required for completion and submission of the form, including all directions and cues."
        support:  Supports
        comments:
      - criterion: "(o) A method shall be provided that permits users to skip repetitive navigation links."
        support:  Supports
        comments:
      - criterion: "(p) When a timed response is required, the user shall be alerted and given sufficient time to indicate more time is required."
        support:  Not applicable
        comments: No timed responses are required.

  "Section 1194.23 Telecommunications Products":
    product:
    criteria:
      - criterion: "(a) Telecommunications products or systems which provide a function allowing voice communication and which do not themselves provide a TTY functionality shall provide a standard non-acoustic connection point for TTYs. Microphones shall be capable of being turned on and off to allow the user to intermix speech with TTY use."
        support:  Not applicable
        comments:
      - criterion: "(b) Telecommunications products which include voice communication functionality shall support all commonly used cross-manufacturer non-proprietary standard TTY signal protocols."
        support:  Not applicable
        comments:
      - criterion: "(c) Voice mail, auto-attendant, and interactive voice response telecommunications systems shall be usable by TTY users with their TTYs."
        support: Not applicable
        comments:
      - criterion: "(d) Voice mail, messaging, auto-attendant, and interactive voice response telecommunications systems that require a response from a user within a time interval, shall give an alert when the time interval is about to run out, and shall provide sufficient time for the user to indicate more time is required."
        support: Not applicable
        comments:
      - criterion: "(e) Where provided, caller identification and similar telecommunications functions shall also be available for users of TTYs, and for users who cannot see displays."
        support: Not applicable
        comments:
      - criterion: "(f) For transmitted voice signals, telecommunications products shall provide a gain adjustable up to a minimum of 20 dB. For incremental volume control, at least one intermediate step of 12 dB of gain shall be provided."
        support: Not applicable
        comments:
      - criterion: "(g) If the telecommunications product allows a user to adjust the receive volume, a function shall be provided to automatically reset the volume to the default level after every use."
        support: Not applicable
        comments:
      - criterion: "(h) Where a telecommunications product delivers output by an audio transducer which is normally held up to the ear, a means for effective magnetic wireless coupling to hearing technologies shall be provided."
        support: Not applicable
        comments:
      - criterion: "(i) Interference to hearing technologies (including hearing aids, cochlear implants, and assistive listening devices) shall be reduced to the lowest possible level that allows a user of hearing technologies to utilize the telecommunications product."
        support: Not applicable
        comments:
      - criterion: "(j) Products that transmit or conduct information or communication, shall pass through cross-manufacturer, non-proprietary, industry-standard codes, translation protocols, formats or other information necessary to provide the information or communication in a usable format. Technologies which use encoding, signal compression, format transformation, or similar techniques shall not remove information needed for access or shall restore it upon delivery."
        support: Not applicable
        comments:
      - criterion: "(k)(1) Products which have mechanically operated controls or keys shall comply with the following: Controls and Keys shall be tactilely discernible without activating the controls or keys."
        support: Not applicable
        comments:
      - criterion: "(k)(2) Products which have mechanically operated controls or keys shall comply with the following: Controls and Keys shall be operable with one hand and shall not require tight grasping, pinching, twisting of the wrist. The force required to activate controls and keys shall be 5 lbs. (22.2N) maximum."
        support: Not applicable
        comments:
      - criterion: "(k)(3) Products which have mechanically operated controls or keys shall comply with the following: If key repeat is supported, the delay before repeat shall be adjustable to at least 2 seconds. Key repeat rate shall be adjustable to 2 seconds per character."
        support: Not applicable
        comments:
      - criterion: "(k)(4) Products which have mechanically operated controls or keys shall comply with the following: The status of all locking or toggle controls or keys shall be visually discernible, and discernible either through touch or sound."
        support: Not applicable
        comments:

  "Section 1194.24 Video and Multi-media Products":
    product: Training videos
    criteria:
      - criterion: "(a) All analog television displays 13 inches and larger, and computer equipment that includes analog television receiver or display circuitry, shall be equipped with caption decoder circuitry which appropriately receives, decodes, and displays closed captions from broadcast, cable, videotape, and DVD signals. As soon as practicable, but not later than July 1, 2002, widescreen digital television (DTV) displays measuring at least 7.8 inches vertically, DTV sets with conventional displays measuring at least 13 inches vertically, and stand-alone DTV tuners, whether or not they are marketed with display screens, and computer equipment that includes DTV receiver or display circuitry, shall be equipped with caption decoder circuitry which appropriately receives, decodes, and displays closed captions from broadcast, cable, videotape, and DVD signals."
        support: Not applicable
        comments:
      - criterion: "(b) Television tuners, including tuner cards for use in computers, shall be equipped with secondary audio program playback circuitry."
        support: Not applicable
        comments:
      - criterion: "(c) All training and informational video and multimedia productions which support the agency's mission, regardless of format, that contain speech or other audio information necessary for the comprehension of the content, shall be open or closed captioned."
        support: Supports
        comments: "Training materials available at [youtube.com/github](https://www.youtube.com/user/github) and [youtube.com/githubguides](https://www.youtube.com/user/githubguides). All GitHub videos are fully closed captioned. <br /><br />For more information on YouTube's accessibility see [support.google.com/youtube/answer/189278](https://support.google.com/youtube/answer/189278?hl=en)"
      - criterion: "(d) All training and informational video and multimedia productions which support the agency's mission, regardless of format, that contain visual information necessary for the comprehension of the content, shall be audio described."
        support: Supports
        comments:
      - criterion: "(e) Display or presentation of alternate text presentation or audio descriptions shall be user-selectable unless permanent."
        support: Supports
        comments: Viewers may toggle closed captioning using YouTube's native closed-captioning functionality.

  "Section 1194.25 Self-Contained, Closed Products":
    product:
    criteria:
      - criterion: "(a) Self contained products shall be usable by people with disabilities without requiring an end-user to attach Assistive Technology to the product. Personal headsets for private listening are not Assistive Technology."
        support: Not applicable
        comments:
      - criterion: "(b) When a timed response is required, the user shall be alerted and given sufficient time to indicate more time is required."
        support: Not applicable
        comments:
      - criterion: "(c) Where a product utilizes touch screens or contact-sensitive controls, an input method shall be provided that complies with 1194.23 (k) (1) through (4)."
        support: Not applicable
        comments:
      - criterion: "(d) When biometric forms of user identification or control are used, an alternative form of identification or activation, which does not require the user to possess particular biological characteristics, shall also be provided."
        support: Not applicable
        comments:
      - criterion: "(e) When products provide auditory output, the audio signal shall be provided at a standard signal level through an industry standard connector that will allow for private listening. The product must provide the ability to interrupt, pause, and restart the audio at anytime."
        support: Not applicable
        comments:
      - criterion: "(f) When products deliver voice output in a public area, incremental volume control shall be provided with output amplification up to a level of at least 65 dB. Where the ambient noise level of the environment is above 45 dB, a volume gain of at least 20 dB above the ambient level shall be user selectable. A function shall be provided to automatically reset the volume to the default level after every use."
        support: Not applicable
        comments:
      - criterion: "(g) Color coding shall not be used as the only means of conveying information, indicating an action, prompting a response, or distinguishing a visual element."
        support: Not applicable
        comments:
      - criterion: "(h) When a product permits a user to adjust color and contrast settings, a range of color selections capable of producing a variety of contrast levels shall be provided."
        support: Not applicable
        comments:
      - criterion: "(i) Products shall be designed to avoid causing the screen to flicker with a frequency greater than 2 Hz and lower than 55 Hz."
        support: Not applicable
        comments:
      - criterion: "(j)(1) Products which are freestanding, non-portable, and intended to be used in one location and which have operable controls shall comply with the following: The position of any operable control shall be determined with respect to a vertical plane, which is 48 inches in length, centered on the operable control, and at the maximum protrusion of the product within the 48 inch length on products which are freestanding, non-portable, and intended to be used in one location and which have operable controls."
        support: Not applicable
        comments:
      - criterion: "(j)(2) Products which are freestanding, non-portable, and intended to be used in one location and which have operable controls shall comply with the following: Where any operable control is 10 inches or less behind the reference plane, the height shall be 54 inches maximum and 15 inches minimum above the floor."
        support: Not applicable
        comments:
      - criterion: "(j)(3) Products which are freestanding, non-portable, and intended to be used in one location and which have operable controls shall comply with the following: Where any operable control is more than 10 inches and not more than 24 inches behind the reference plane, the height shall be 46 inches maximum and 15 inches minimum above the floor."
        support: Not applicable
        comments:
      - criterion: "(j)(4) Products which are freestanding, non-portable, and intended to be used in one location and which have operable controls shall comply with the following: Operable controls shall not be more than 24 inches behind the reference plane."
        support: Not applicable
        comments:

  "Section 1194.26 Desktop and Portable Computers":
    product:
    criteria:
      - criterion: "(a) All mechanically operated controls and keys shall comply with 1194.23 (k) (1) through (4)."
        support: Not applicable
        comments:
      - criterion: "(b) If a product utilizes touchscreens or touch-operated controls, an input method shall be provided that complies with 1194.23 (k) (1) through (4)."
        support: Not applicable
        comments:
      - criterion: "(c) When biometric forms of user identification or control are used, an alternative form of identification or activation, which does not require the user to possess particular biological characteristics, shall also be provided."
        support: Not applicable
        comments:
      - criterion: "(d) Where provided, at least one of each type of expansion slots, ports and connectors shall comply with publicly available industry standards"
        support: Not applicable
        comments:

  "Section 1194.31 Functional Performance criterion":
    product:
    criteria:
      - criterion: "(a) At least one mode of operation and information retrieval that does not require user vision shall be provided, or support for Assistive Technology used by people who are blind or visually impaired shall be provided."
        support: Supports
        comments: All Git-bassed file operations can be performed via the text-only Git command line interface using assistive technology, and all account management and social interactions (e.g., commenting on an issue) can be performed via GitHub.com or GitHub enterprise with assistive technology.
      - criterion: "(b) At least one mode of operation and information retrieval that does not require visual acuity greater than 20/70 shall be provided in audio and enlarged print output working together or independently, or support for Assistive Technology used by people who are visually impaired shall be provided."
        support: Supports
        comments: All GitHub product support the use of assistive technology and provide the ability, through the user's web browser or operating system to increase the font size.
      - criterion: "(c) At least one mode of operation and information retrieval that does not require user hearing shall be provided, or support for Assistive Technology used by people who are deaf or hard of hearing shall be provided"
        support: Supports
        comments: Products do not use auditory feedback.
      - criterion: "(d) Where audio information is important for the use of a product, at least one mode of operation and information retrieval shall be provided in an enhanced auditory fashion, or support for assistive hearing devices shall be provided."
        support: Not Applicable
        comments: Products do not use auditory feedback.
      - criterion: "(e) At least one mode of operation and information retrieval that does not require user speech shall be provided, or support for Assistive Technology used by people with disabilities shall be provided."
        support: Supports
        comments: Products do not support speech input.
      - criterion: "(f) At least one mode of operation and information retrieval that does not require fine motor control or simultaneous actions and that is operable with limited reach and strength shall be provided."
        support: Supports
        comments: No interactions require simultaneous user actions or depend solely on fine motor controls.

  "Section 1194.41 Information, Documentation and Support":
    product:
    criteria:
      - criterion: "(a) Product support documentation provided to end-users shall be made available in alternate formats upon request, at no additional charge"
        support: Supports
        comments: "Please contact <support@github.com> with any such requests."
      - criterion: "(b) End-users shall have access to a description of the accessibility and compatibility features of products in alternate formats or alternate methods upon request, at no additional charge.  "
        support: Supports
        comments: "Documentation available at [government.github.com/accessibility](https://government.github.com/accessibility/)"
      - criterion: "(c) Support services for products shall accommodate the communication needs of end-users with disabilities."
        support: Supports
        comments: "Support provided via [web](https://help.github.com) and [email](https://github.com/contactus)"
---

Please note, when using GitHub.com or GitHub Enterprise, there are four alternate ways to interact with stored content:

1. Via the [GitHub.com](https://github.com) or [GitHub Enterprise](https://enterprise.github.com) web interface through a modern browser
2. Via the [GitHub Desktop](https://desktop.github.com) application
3. Via the GitHub's open [application programming interface](https://developer.github.com/v3/) (API) which provides information in a machine-readable format for integration with other applications
4. Via the open source [Git](http://git-scm.com/) command line (interactive, entirely text-bassed) interface

Where support below is indicated below as "Supports with exceptions", such a qualification applies to the particular product being evaluated, however, interactions may be accomplished through alternate means such as via the Git command-line interface.

*For more information, please contact <government@github.com>.*

{% for section in page.data %}
### {{ section[0] }}
{% if section[1].product %}
*Applicable product(s): {{ section[1].product }}*
{% endif %}

  <table class="table table-striped table-bordered table-condensed accessibility">
    <thead>
      <tr>
        <th>Criteria</th>
        <th>Level of Support</th>
        <th>Remarks and explanations</th>
      </tr>
    </thead>
    <tbody>
    {% for requirement in section[1].criteria %}
      <tr>
        <td class="criterion">
        {% if section[0] == "Summary" %}
        <a href="#{{ requirement.criterion | replace:" ","-" | replace:".","" | replace:",","" | downcase }}">{{ requirement.criterion }}</a>
        {% else %}
         {{ requirement.criterion }}
        {% endif %}
        </td>
        <td class="support {{ requirement.support | downcase | replace:" ","-" }}">
         {{ requirement.support }}
        </td>
<td markdown="1" class="comments">
{{ requirement.comments }}
</td>
      </tr>
    {% endfor %}
    </tbody>
  </table>
{% endfor %}
