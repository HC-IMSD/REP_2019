<?xml version="1.0" encoding="utf-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:param name="labelFile" select="'./hp-ip400-labels.xml'"/>
	<xsl:param name="language" select="'eng'"/>
	<xsl:variable name="labelLookup" select="document($labelFile)"/>
	<xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'"/>
	<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
<!--	<xsl:variable name="input-text" as="xs:string" select="unparsed-text('./ip400.css')"/>-->
	<xsl:template match="/">
		<html>
			<head>
<!--				<xsl:value-of select="$input-text" disable-output-escaping="yes"/>-->
<style type="text/css">

@charset "utf-8";
/*!
 * Web Experience Toolkit (WET) / Boîte à outils de l'expérience Web (BOEW)
 * wet-boew.github.io/wet-boew/License-en.html / wet-boew.github.io/wet-boew/Licence-fr.html
 * v4.0.22 - 2016-08-11
 *
 *//*!
 * Bootstrap v3.3.1 (http://getbootstrap.com)
 * Copyright 2011-2015 Twitter, Inc.
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 *//*!
 * GLYPHICONS Halflings for Twitter Bootstrap by GLYPHICONS.com | Licensed under http://www.apache.org/licenses/LICENSE-2.0
 *//*! normalize.css v3.0.2 | MIT License | git.io/normalize */
html {
    font-family: sans-serif;
    -ms-text-size-adjust: 100%;
    -webkit-text-size-adjust: 100%
}

body {
    margin: 0
}

article, aside, details, figcaption, figure, footer, header, hgroup, main, menu, nav, section, summary {
    display: block
}

audio, canvas, progress, video {
    display: inline-block;
    vertical-align: baseline
}

audio:not([controls]) {
    display: none;
    height: 0
}

[hidden], template {
    display: none
}

a {
    background-color: transparent
}

a:active, a:hover {
    outline: 0
}

b, strong {
    font-weight: 700
}

dfn {
    font-style: italic
}

h1 {
    margin: .67em 0
}

mark {
    background: #ff0;
    color: #000
}

sub, sup {
    font-size: 75%;
    line-height: 0;
    position: relative;
    vertical-align: baseline
}

sup {
    top: -.5em
}

sub {
    bottom: -.25em
}

img {
    border: 0
}

svg:not(:root) {
    overflow: hidden
}

hr {
    -moz-box-sizing: content-box;
    -webkit-box-sizing: content-box;
    box-sizing: content-box;
    height: 0
}

pre {
    overflow: auto
}

code, kbd, pre, samp {
    font-size: 1em
}

button, input, optgroup, select, textarea {
    color: inherit;
    font: inherit;
    margin: 0
}

button {
    overflow: visible
}

button, select {
    text-transform: none
}

button, html input[type=button], input[type=reset], input[type=submit] {
    -webkit-appearance: button;
    cursor: pointer
}

button[disabled], html input[disabled] {
    cursor: default
}

button::-moz-focus-inner, input::-moz-focus-inner {
    border: 0;
    padding: 0
}

input[type=checkbox], input[type=radio] {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    padding: 0
}

input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button {
    height: auto
}

input[type=search]::-webkit-search-cancel-button, input[type=search]::-webkit-search-decoration {
    -webkit-appearance: none
}

textarea {
    overflow: auto
}

optgroup {
    font-weight: 700
}

table {
    border-collapse: collapse;
    border-spacing: 0
}

td, th {
    padding: 0
}

/*! Source: https://github.com/h5bp/html5-boilerplate/blob/master/src/css/main.css */
@media print {
    *, :after, :before {
        background: transparent !important;
        color: #000 !important;
        -webkit-box-shadow: none !important;
        box-shadow: none !important;
        text-shadow: none !important
    }

    a, a:visited {
        text-decoration: underline
    }

    a[href]:after {
        content: " (" attr(href) ")"
    }

    abbr[title]:after {
        content: " (" attr(title) ")"
    }

    a[href^="#"]:after, a[href^="javascript:"]:after {
        content: ""
    }

    blockquote, pre {
        border: 1px solid #999;
        page-break-inside: avoid
    }

    thead {
        display: table-header-group
    }

    img, tr {
        page-break-inside: avoid
    }

    img {
        max-width: 100% !important
    }

    h2, h3, p {
        orphans: 3;
        widows: 3
    }

    h2, h3 {
        page-break-after: avoid
    }

    select {
        background: #fff !important
    }

    .navbar {
        display: none
    }

    .btn > .caret, .dropup > .btn > .caret {
        border-top-color: #000 !important
    }

    .label {
        border: 1px solid #000
    }

    .table {
        border-collapse: collapse !important
    }

    .table td, .table th {
        background-color: #fff !important
    }

    .table-bordered td, .table-bordered th {
        border: 1px solid #ddd !important
    }
}

@font-face {
    font-family: 'Glyphicons Halflings';
    src: url(./glyphicons-halflings-regular.eot);
    src: url(./glyphicons-halflings-regular.eot?#iefix) format("embedded-opentype"), url(./glyphicons-halflings-regular.woff) format("woff"), url(../../wet-boew/fonts/glyphicons-halflings-regular.ttf) format("truetype"), url(../../wet-boew/fonts/glyphicons-halflings-regular.svg#glyphicons_halflingsregular) format("svg")
}

.glyphicon {
    position: relative;
    top: 1px;
    display: inline-block;
    font-family: 'Glyphicons Halflings';
    font-style: normal;
    font-weight: 400;
    line-height: 1;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale
}

.glyphicon-asterisk:before {
    content: "\2a"
}

.glyphicon-plus:before {
    content: "\2b"
}

.glyphicon-eur:before, .glyphicon-euro:before {
    content: "\20ac"
}

.glyphicon-minus:before {
    content: "\2212"
}

.glyphicon-cloud:before {
    content: "\2601"
}

.glyphicon-envelope:before {
    content: "\2709"
}

.glyphicon-pencil:before {
    content: "\270f"
}

.glyphicon-glass:before {
    content: "\e001"
}

.glyphicon-music:before {
    content: "\e002"
}

.glyphicon-search:before {
    content: "\e003"
}

.glyphicon-heart:before {
    content: "\e005"
}

.glyphicon-star:before {
    content: "\e006"
}

.glyphicon-star-empty:before {
    content: "\e007"
}

.glyphicon-user:before {
    content: "\e008"
}

.glyphicon-film:before {
    content: "\e009"
}

.glyphicon-th-large:before {
    content: "\e010"
}

.glyphicon-th:before {
    content: "\e011"
}

.glyphicon-th-list:before {
    content: "\e012"
}

.glyphicon-ok:before {
    content: "\e013"
}

.glyphicon-remove:before {
    content: "\e014"
}

.glyphicon-zoom-in:before {
    content: "\e015"
}

.glyphicon-zoom-out:before {
    content: "\e016"
}

.glyphicon-off:before {
    content: "\e017"
}

.glyphicon-signal:before {
    content: "\e018"
}

.glyphicon-cog:before {
    content: "\e019"
}

.glyphicon-trash:before {
    content: "\e020"
}

.glyphicon-home:before {
    content: "\e021"
}

.glyphicon-file:before {
    content: "\e022"
}

.glyphicon-time:before {
    content: "\e023"
}

.glyphicon-road:before {
    content: "\e024"
}

.glyphicon-download-alt:before {
    content: "\e025"
}

.glyphicon-download:before {
    content: "\e026"
}

.glyphicon-upload:before {
    content: "\e027"
}

.glyphicon-inbox:before {
    content: "\e028"
}

.glyphicon-play-circle:before {
    content: "\e029"
}

.glyphicon-repeat:before {
    content: "\e030"
}

.glyphicon-refresh:before {
    content: "\e031"
}

.glyphicon-list-alt:before {
    content: "\e032"
}

.glyphicon-lock:before {
    content: "\e033"
}

.glyphicon-flag:before {
    content: "\e034"
}

.glyphicon-headphones:before {
    content: "\e035"
}

.glyphicon-volume-off:before {
    content: "\e036"
}

.glyphicon-volume-down:before {
    content: "\e037"
}

.glyphicon-volume-up:before {
    content: "\e038"
}

.glyphicon-qrcode:before {
    content: "\e039"
}

.glyphicon-barcode:before {
    content: "\e040"
}

.glyphicon-tag:before {
    content: "\e041"
}

.glyphicon-tags:before {
    content: "\e042"
}

.glyphicon-book:before {
    content: "\e043"
}

.glyphicon-bookmark:before {
    content: "\e044"
}

.glyphicon-print:before {
    content: "\e045"
}

.glyphicon-camera:before {
    content: "\e046"
}

.glyphicon-font:before {
    content: "\e047"
}

.glyphicon-bold:before {
    content: "\e048"
}

.glyphicon-italic:before {
    content: "\e049"
}

.glyphicon-text-height:before {
    content: "\e050"
}

.glyphicon-text-width:before {
    content: "\e051"
}

.glyphicon-align-left:before {
    content: "\e052"
}

.glyphicon-align-center:before {
    content: "\e053"
}

.glyphicon-align-right:before {
    content: "\e054"
}

.glyphicon-align-justify:before {
    content: "\e055"
}

.glyphicon-list:before {
    content: "\e056"
}

.glyphicon-indent-left:before {
    content: "\e057"
}

.glyphicon-indent-right:before {
    content: "\e058"
}

.glyphicon-facetime-video:before {
    content: "\e059"
}

.glyphicon-picture:before {
    content: "\e060"
}

.glyphicon-map-marker:before {
    content: "\e062"
}

.glyphicon-adjust:before {
    content: "\e063"
}

.glyphicon-tint:before {
    content: "\e064"
}

.glyphicon-edit:before {
    content: "\e065"
}

.glyphicon-share:before {
    content: "\e066"
}

.glyphicon-check:before {
    content: "\e067"
}

.glyphicon-move:before {
    content: "\e068"
}

.glyphicon-step-backward:before {
    content: "\e069"
}

.glyphicon-fast-backward:before {
    content: "\e070"
}

.glyphicon-backward:before {
    content: "\e071"
}

.glyphicon-play:before {
    content: "\e072"
}

.glyphicon-pause:before {
    content: "\e073"
}

.glyphicon-stop:before {
    content: "\e074"
}

.glyphicon-forward:before {
    content: "\e075"
}

.glyphicon-fast-forward:before {
    content: "\e076"
}

.glyphicon-step-forward:before {
    content: "\e077"
}

.glyphicon-eject:before {
    content: "\e078"
}

.glyphicon-chevron-left:before {
    content: "\e079"
}

.glyphicon-chevron-right:before {
    content: "\e080"
}

.glyphicon-plus-sign:before {
    content: "\e081"
}

.glyphicon-minus-sign:before {
    content: "\e082"
}

.glyphicon-remove-sign:before {
    content: "\e083"
}

.glyphicon-ok-sign:before {
    content: "\e084"
}

.glyphicon-question-sign:before {
    content: "\e085"
}

.glyphicon-info-sign:before {
    content: "\e086"
}

.glyphicon-screenshot:before {
    content: "\e087"
}

.glyphicon-remove-circle:before {
    content: "\e088"
}

.glyphicon-ok-circle:before {
    content: "\e089"
}

.glyphicon-ban-circle:before {
    content: "\e090"
}

.glyphicon-arrow-left:before {
    content: "\e091"
}

.glyphicon-arrow-right:before {
    content: "\e092"
}

.glyphicon-arrow-up:before {
    content: "\e093"
}

.glyphicon-arrow-down:before {
    content: "\e094"
}

.glyphicon-share-alt:before {
    content: "\e095"
}

.glyphicon-resize-full:before {
    content: "\e096"
}

.glyphicon-resize-small:before {
    content: "\e097"
}

.glyphicon-exclamation-sign:before {
    content: "\e101"
}

.glyphicon-gift:before {
    content: "\e102"
}

.glyphicon-leaf:before {
    content: "\e103"
}

.glyphicon-fire:before {
    content: "\e104"
}

.glyphicon-eye-open:before {
    content: "\e105"
}

.glyphicon-eye-close:before {
    content: "\e106"
}

.glyphicon-warning-sign:before {
    content: "\e107"
}

.glyphicon-plane:before {
    content: "\e108"
}

.glyphicon-calendar:before {
    content: "\e109"
}

.glyphicon-random:before {
    content: "\e110"
}

.glyphicon-comment:before {
    content: "\e111"
}

.glyphicon-magnet:before {
    content: "\e112"
}

.glyphicon-chevron-up:before {
    content: "\e113"
}

.glyphicon-chevron-down:before {
    content: "\e114"
}

.glyphicon-retweet:before {
    content: "\e115"
}

.glyphicon-shopping-cart:before {
    content: "\e116"
}

.glyphicon-folder-close:before {
    content: "\e117"
}

.glyphicon-folder-open:before {
    content: "\e118"
}

.glyphicon-resize-vertical:before {
    content: "\e119"
}

.glyphicon-resize-horizontal:before {
    content: "\e120"
}

.glyphicon-hdd:before {
    content: "\e121"
}

.glyphicon-bullhorn:before {
    content: "\e122"
}

.glyphicon-bell:before {
    content: "\e123"
}

.glyphicon-certificate:before {
    content: "\e124"
}

.glyphicon-thumbs-up:before {
    content: "\e125"
}

.glyphicon-thumbs-down:before {
    content: "\e126"
}

.glyphicon-hand-right:before {
    content: "\e127"
}

.glyphicon-hand-left:before {
    content: "\e128"
}

.glyphicon-hand-up:before {
    content: "\e129"
}

.glyphicon-hand-down:before {
    content: "\e130"
}

.glyphicon-circle-arrow-right:before {
    content: "\e131"
}

.glyphicon-circle-arrow-left:before {
    content: "\e132"
}

.glyphicon-circle-arrow-up:before {
    content: "\e133"
}

.glyphicon-circle-arrow-down:before {
    content: "\e134"
}

.glyphicon-globe:before {
    content: "\e135"
}

.glyphicon-wrench:before {
    content: "\e136"
}

.glyphicon-tasks:before {
    content: "\e137"
}

.glyphicon-filter:before {
    content: "\e138"
}

.glyphicon-briefcase:before {
    content: "\e139"
}

.glyphicon-fullscreen:before {
    content: "\e140"
}

.glyphicon-dashboard:before {
    content: "\e141"
}

.glyphicon-paperclip:before {
    content: "\e142"
}

.glyphicon-heart-empty:before {
    content: "\e143"
}

.glyphicon-link:before {
    content: "\e144"
}

.glyphicon-phone:before {
    content: "\e145"
}

.glyphicon-pushpin:before {
    content: "\e146"
}

.glyphicon-usd:before {
    content: "\e148"
}

.glyphicon-gbp:before {
    content: "\e149"
}

.glyphicon-sort:before {
    content: "\e150"
}

.glyphicon-sort-by-alphabet:before {
    content: "\e151"
}

.glyphicon-sort-by-alphabet-alt:before {
    content: "\e152"
}

.glyphicon-sort-by-order:before {
    content: "\e153"
}

.glyphicon-sort-by-order-alt:before {
    content: "\e154"
}

.glyphicon-sort-by-attributes:before {
    content: "\e155"
}

.glyphicon-sort-by-attributes-alt:before {
    content: "\e156"
}

.glyphicon-unchecked:before {
    content: "\e157"
}

.glyphicon-expand:before {
    content: "\e158"
}

.glyphicon-collapse-down:before {
    content: "\e159"
}

.glyphicon-collapse-up:before {
    content: "\e160"
}

.glyphicon-log-in:before {
    content: "\e161"
}

.glyphicon-flash:before {
    content: "\e162"
}

.glyphicon-log-out:before {
    content: "\e163"
}

.glyphicon-new-window:before {
    content: "\e164"
}

.glyphicon-record:before {
    content: "\e165"
}

.glyphicon-save:before {
    content: "\e166"
}

.glyphicon-open:before {
    content: "\e167"
}

.glyphicon-saved:before {
    content: "\e168"
}

.glyphicon-import:before {
    content: "\e169"
}

.glyphicon-export:before {
    content: "\e170"
}

.glyphicon-send:before {
    content: "\e171"
}

.glyphicon-floppy-disk:before {
    content: "\e172"
}

.glyphicon-floppy-saved:before {
    content: "\e173"
}

.glyphicon-floppy-remove:before {
    content: "\e174"
}

.glyphicon-floppy-save:before {
    content: "\e175"
}

.glyphicon-floppy-open:before {
    content: "\e176"
}

.glyphicon-credit-card:before {
    content: "\e177"
}

.glyphicon-transfer:before {
    content: "\e178"
}

.glyphicon-cutlery:before {
    content: "\e179"
}

.glyphicon-header:before {
    content: "\e180"
}

.glyphicon-compressed:before {
    content: "\e181"
}

.glyphicon-earphone:before {
    content: "\e182"
}

.glyphicon-phone-alt:before {
    content: "\e183"
}

.glyphicon-tower:before {
    content: "\e184"
}

.glyphicon-stats:before {
    content: "\e185"
}

.glyphicon-sd-video:before {
    content: "\e186"
}

.glyphicon-hd-video:before {
    content: "\e187"
}

.glyphicon-subtitles:before {
    content: "\e188"
}

.glyphicon-sound-stereo:before {
    content: "\e189"
}

.glyphicon-sound-dolby:before {
    content: "\e190"
}

.glyphicon-sound-5-1:before {
    content: "\e191"
}

.glyphicon-sound-6-1:before {
    content: "\e192"
}

.glyphicon-sound-7-1:before {
    content: "\e193"
}

.glyphicon-copyright-mark:before {
    content: "\e194"
}

.glyphicon-registration-mark:before {
    content: "\e195"
}

.glyphicon-cloud-download:before {
    content: "\e197"
}

.glyphicon-cloud-upload:before {
    content: "\e198"
}

.glyphicon-tree-conifer:before {
    content: "\e199"
}

.glyphicon-tree-deciduous:before {
    content: "\e200"
}

*, :after, :before {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box
}

html {
    font-size: 10px;
    -webkit-tap-highlight-color: transparent
}

body {
    line-height: 1.4375;
    color: #333
}

button, input, select, textarea {
    font-family: inherit;
    font-size: inherit;
    line-height: inherit
}

a:focus, a:hover {
    color: #0535d2;
    text-decoration: underline
}

a:focus {
    outline: thin dotted;
    outline: 5px auto -webkit-focus-ring-color;
    outline-offset: -2px
}

figure {
    margin: 0
}

img {
    vertical-align: middle
}

.img-responsive {
    display: block;
    max-width: 100%;
    height: auto
}

.img-rounded {
    border-radius: 6px
}

.img-thumbnail {
    padding: 4px;
    line-height: 1.4375;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 4px;
    -webkit-transition: all .2s ease-in-out;
    transition: all .2s ease-in-out;
    display: inline-block;
    max-width: 100%;
    height: auto
}

.img-circle {
    border-radius: 50%
}

hr {
    margin-top: 23px;
    margin-bottom: 23px;
    border: 0;
    border-top: 1px solid #eee
}

.sr-only {
    position: absolute;
    width: 1px;
    height: 1px;
    margin: -1px;
    padding: 0;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    border: 0
}

.sr-only-focusable:active, .sr-only-focusable:focus {
    position: static;
    width: auto;
    height: auto;
    margin: 0;
    overflow: visible;
    clip: auto
}

.h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
    line-height: 1.1;
    color: inherit
}

.h1 .small, .h1 small, .h2 .small, .h2 small, .h3 .small, .h3 small, .h4 .small, .h4 small, .h5 .small, .h5 small, .h6 .small, .h6 small, h1 .small, h1 small, h2 .small, h2 small, h3 .small, h3 small, h4 .small, h4 small, h5 .small, h5 small, h6 .small, h6 small {
    font-weight: 400;
    line-height: 1;
    color: #767676
}

.h1, .h2, .h3, h1, h2, h3 {
    margin-top: 23px;
    margin-bottom: 11.5px
}

.h1 .small, .h1 small, .h2 .small, .h2 small, .h3 .small, .h3 small, h1 .small, h1 small, h2 .small, h2 small, h3 .small, h3 small {
    font-size: 65%
}

.h4, .h5, .h6, h4, h5, h6 {
    margin-bottom: 11.5px
}

.h4 .small, .h4 small, .h5 .small, .h5 small, .h6 .small, .h6 small, h4 .small, h4 small, h5 .small, h5 small, h6 .small, h6 small {
    font-size: 75%
}

.h1, h1 {
    font-size: 34px
}

p {
    margin: 0 0 11.5px
}

.lead {
    margin-bottom: 23px;
    font-size: 18px;
    font-weight: 300;
    line-height: 1.4
}

@media (min-width: 768px) {
    .lead {
        font-size: 24px
    }
}

.small, small {
    font-size: 87%
}

.mark, mark {
    background-color: #fcf8e3;
    padding: .2em
}

.text-left {
    text-align: left
}

.text-right {
    text-align: right
}

.text-center {
    text-align: center
}

.text-justify {
    text-align: justify
}

.text-nowrap {
    white-space: nowrap
}

.text-lowercase {
    text-transform: lowercase
}

.text-uppercase {
    text-transform: uppercase
}

.text-capitalize {
    text-transform: capitalize
}

.text-muted {
    color: #767676
}

.text-primary {
    color: #2572b4
}

a.text-primary:hover {
    color: #1c578a
}

.text-success {
    color: #3c763d
}

a.text-success:hover {
    color: #2b542c
}

.text-info {
    color: #31708f
}

a.text-info:hover {
    color: #245269
}

.text-warning {
    color: #8a6d3b
}

a.text-warning:hover {
    color: #66512c
}

.text-danger {
    color: #a94442
}

a.text-danger:hover {
    color: #843534
}

.bg-primary {
    color: #fff;
    background-color: #2572b4
}

a.bg-primary:hover {
    background-color: #1c578a
}

.bg-success {
    background-color: #dff0d8
}

a.bg-success:hover {
    background-color: #c1e2b3
}

.bg-info {
    background-color: #d9edf7
}

a.bg-info:hover {
    background-color: #afd9ee
}

.bg-warning {
    background-color: #fcf8e3
}

a.bg-warning:hover {
    background-color: #f7ecb5
}

.bg-danger {
    background-color: #f2dede
}

a.bg-danger:hover {
    background-color: #e4b9b9
}

.page-header {
    padding-bottom: 10.5px;
    margin: 46px 0 23px;
    border-bottom: 1px solid #eee
}

ol, ul {
    margin-top: 0;
    margin-bottom: 11.5px
}

ol ol, ol ul, ul ol, ul ul {
    margin-bottom: 0
}

.list-unstyled {
    padding-left: 0;
    list-style: none
}

.list-inline {
    padding-left: 0;
    list-style: none;
    margin-left: -5px
}

.list-inline > li {
    display: inline-block;
    padding-left: 5px;
    padding-right: 5px
}

dl {
    margin-top: 0;
    margin-bottom: 23px
}

dd, dt {
    line-height: 1.4375
}

dt {
    font-weight: 700
}

dd {
    margin-left: 0
}

.dl-horizontal dd:after, .dl-horizontal dd:before {
    content: " ";
    display: table
}

.dl-horizontal dd:after {
    clear: both
}

@media (min-width: 768px) {
    .dl-horizontal dt {
        float: left;
        width: 160px;
        clear: left;
        text-align: right;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap
    }

    .dl-horizontal dd {
        margin-left: 180px
    }
}

abbr[data-original-title], abbr[title] {
    cursor: help;
    border-bottom: 1px dotted #767676
}

.initialism {
    font-size: 90%;
    text-transform: uppercase
}

blockquote {
    padding: 11.5px 23px;
    margin: 0 0 23px;
    border-left: 5px solid #eee
}

blockquote ol:last-child, blockquote p:last-child, blockquote ul:last-child {
    margin-bottom: 0
}

blockquote .small, blockquote footer, blockquote small {
    display: block;
    font-size: 80%;
    line-height: 1.4375;
    color: #767676
}

blockquote .small:before, blockquote footer:before, blockquote small:before {
    content: '\2014 \00A0'
}

.blockquote-reverse, blockquote.pull-right {
    padding-right: 15px;
    padding-left: 0;
    border-right: 5px solid #eee;
    border-left: 0;
    text-align: right
}

.blockquote-reverse .small:before, .blockquote-reverse footer:before, .blockquote-reverse small:before, blockquote.pull-right .small:before, blockquote.pull-right footer:before, blockquote.pull-right small:before {
    content: ''
}

.blockquote-reverse .small:after, .blockquote-reverse footer:after, .blockquote-reverse small:after, blockquote.pull-right .small:after, blockquote.pull-right footer:after, blockquote.pull-right small:after {
    content: '\00A0 \2014'
}

address {
    margin-bottom: 23px;
    font-style: normal;
    line-height: 1.4375
}

code, kbd, pre, samp {
    font-family: Menlo, Monaco, Consolas, "Courier New", monospace
}

code {
    padding: 2px 4px;
    font-size: 90%;
    color: #c7254e;
    background-color: #f9f2f4;
    border-radius: 4px
}

kbd {
    padding: 2px 4px;
    font-size: 90%;
    color: #fff;
    background-color: #333;
    border-radius: 3px;
    -webkit-box-shadow: inset 0 -1px 0 rgba(0, 0, 0, .25);
    box-shadow: inset 0 -1px 0 rgba(0, 0, 0, .25)
}

kbd kbd {
    padding: 0;
    font-size: 100%;
    font-weight: 700;
    -webkit-box-shadow: none;
    box-shadow: none
}

pre {
    display: block;
    padding: 11px;
    margin: 0 0 11.5px;
    font-size: 15px;
    line-height: 1.4375;
    word-break: break-all;
    word-wrap: break-word;
    color: #333;
    background-color: #f5f5f5;
    border: 1px solid #ccc;
    border-radius: 4px
}

pre code {
    padding: 0;
    font-size: inherit;
    color: inherit;
    white-space: pre-wrap;
    background-color: transparent;
    border-radius: 0
}

.pre-scrollable {
    max-height: 340px;
    overflow-y: scroll
}

.container {
    margin-right: auto;
    margin-left: auto;
    padding-left: 15px;
    padding-right: 15px
}

.container:after, .container:before {
    content: " ";
    display: table
}

.container:after {
    clear: both
}

@media (min-width: 768px) {
    .container {
        width: 750px
    }
}

@media (min-width: 992px) {
    .container {
        width: 970px
    }
}

@media (min-width: 1200px) {
    .container {
        width: 1170px
    }
}

.container-fluid {
    margin-right: auto;
    margin-left: auto;
    padding-left: 15px;
    padding-right: 15px
}

.container-fluid:after, .container-fluid:before {
    content: " ";
    display: table
}

.container-fluid:after {
    clear: both
}

.row {
    margin-left: -15px;
    margin-right: -15px
}

.row:after, .row:before {
    content: " ";
    display: table
}

.row:after {
    clear: both
}

.col-lg-1, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9 {
    position: relative;
    min-height: 1px;
    padding-left: 15px;
    padding-right: 15px
}

.col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9 {
    float: left
}

.col-xs-1 {
    width: 8.3333333333%
}

.col-xs-2 {
    width: 16.6666666667%
}

.col-xs-3 {
    width: 25%
}

.col-xs-4 {
    width: 33.3333333333%
}

.col-xs-5 {
    width: 41.6666666667%
}

.col-xs-6 {
    width: 50%
}

.col-xs-7 {
    width: 58.3333333333%
}

.col-xs-8 {
    width: 66.6666666667%
}

.col-xs-9 {
    width: 75%
}

.col-xs-10 {
    width: 83.3333333333%
}

.col-xs-11 {
    width: 91.6666666667%
}

.col-xs-12 {
    width: 100%
}

.col-xs-pull-0 {
    right: auto
}

.col-xs-pull-1 {
    right: 8.3333333333%
}

.col-xs-pull-2 {
    right: 16.6666666667%
}

.col-xs-pull-3 {
    right: 25%
}

.col-xs-pull-4 {
    right: 33.3333333333%
}

.col-xs-pull-5 {
    right: 41.6666666667%
}

.col-xs-pull-6 {
    right: 50%
}

.col-xs-pull-7 {
    right: 58.3333333333%
}

.col-xs-pull-8 {
    right: 66.6666666667%
}

.col-xs-pull-9 {
    right: 75%
}

.col-xs-pull-10 {
    right: 83.3333333333%
}

.col-xs-pull-11 {
    right: 91.6666666667%
}

.col-xs-pull-12 {
    right: 100%
}

.col-xs-push-0 {
    left: auto
}

.col-xs-push-1 {
    left: 8.3333333333%
}

.col-xs-push-2 {
    left: 16.6666666667%
}

.col-xs-push-3 {
    left: 25%
}

.col-xs-push-4 {
    left: 33.3333333333%
}

.col-xs-push-5 {
    left: 41.6666666667%
}

.col-xs-push-6 {
    left: 50%
}

.col-xs-push-7 {
    left: 58.3333333333%
}

.col-xs-push-8 {
    left: 66.6666666667%
}

.col-xs-push-9 {
    left: 75%
}

.col-xs-push-10 {
    left: 83.3333333333%
}

.col-xs-push-11 {
    left: 91.6666666667%
}

.col-xs-push-12 {
    left: 100%
}

.col-xs-offset-0 {
    margin-left: 0
}

.col-xs-offset-1 {
    margin-left: 8.3333333333%
}

.col-xs-offset-2 {
    margin-left: 16.6666666667%
}

.col-xs-offset-3 {
    margin-left: 25%
}

.col-xs-offset-4 {
    margin-left: 33.3333333333%
}

.col-xs-offset-5 {
    margin-left: 41.6666666667%
}

.col-xs-offset-6 {
    margin-left: 50%
}

.col-xs-offset-7 {
    margin-left: 58.3333333333%
}

.col-xs-offset-8 {
    margin-left: 66.6666666667%
}

.col-xs-offset-9 {
    margin-left: 75%
}

.col-xs-offset-10 {
    margin-left: 83.3333333333%
}

.col-xs-offset-11 {
    margin-left: 91.6666666667%
}

.col-xs-offset-12 {
    margin-left: 100%
}

@media (min-width: 768px) {
    .col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9 {
        float: left
    }

    .col-sm-1 {
        width: 8.3333333333%
    }

    .col-sm-2 {
        width: 16.6666666667%
    }

    .col-sm-3 {
        width: 25%
    }

    .col-sm-4 {
        width: 33.3333333333%
    }

    .col-sm-5 {
        width: 41.6666666667%
    }

    .col-sm-6 {
        width: 50%
    }

    .col-sm-7 {
        width: 58.3333333333%
    }

    .col-sm-8 {
        width: 66.6666666667%
    }

    .col-sm-9 {
        width: 75%
    }

    .col-sm-10 {
        width: 83.3333333333%
    }

    .col-sm-11 {
        width: 91.6666666667%
    }

    .col-sm-12 {
        width: 100%
    }

    .col-sm-pull-0 {
        right: auto
    }

    .col-sm-pull-1 {
        right: 8.3333333333%
    }

    .col-sm-pull-2 {
        right: 16.6666666667%
    }

    .col-sm-pull-3 {
        right: 25%
    }

    .col-sm-pull-4 {
        right: 33.3333333333%
    }

    .col-sm-pull-5 {
        right: 41.6666666667%
    }

    .col-sm-pull-6 {
        right: 50%
    }

    .col-sm-pull-7 {
        right: 58.3333333333%
    }

    .col-sm-pull-8 {
        right: 66.6666666667%
    }

    .col-sm-pull-9 {
        right: 75%
    }

    .col-sm-pull-10 {
        right: 83.3333333333%
    }

    .col-sm-pull-11 {
        right: 91.6666666667%
    }

    .col-sm-pull-12 {
        right: 100%
    }

    .col-sm-push-0 {
        left: auto
    }

    .col-sm-push-1 {
        left: 8.3333333333%
    }

    .col-sm-push-2 {
        left: 16.6666666667%
    }

    .col-sm-push-3 {
        left: 25%
    }

    .col-sm-push-4 {
        left: 33.3333333333%
    }

    .col-sm-push-5 {
        left: 41.6666666667%
    }

    .col-sm-push-6 {
        left: 50%
    }

    .col-sm-push-7 {
        left: 58.3333333333%
    }

    .col-sm-push-8 {
        left: 66.6666666667%
    }

    .col-sm-push-9 {
        left: 75%
    }

    .col-sm-push-10 {
        left: 83.3333333333%
    }

    .col-sm-push-11 {
        left: 91.6666666667%
    }

    .col-sm-push-12 {
        left: 100%
    }

    .col-sm-offset-0 {
        margin-left: 0
    }

    .col-sm-offset-1 {
        margin-left: 8.3333333333%
    }

    .col-sm-offset-2 {
        margin-left: 16.6666666667%
    }

    .col-sm-offset-3 {
        margin-left: 25%
    }

    .col-sm-offset-4 {
        margin-left: 33.3333333333%
    }

    .col-sm-offset-5 {
        margin-left: 41.6666666667%
    }

    .col-sm-offset-6 {
        margin-left: 50%
    }

    .col-sm-offset-7 {
        margin-left: 58.3333333333%
    }

    .col-sm-offset-8 {
        margin-left: 66.6666666667%
    }

    .col-sm-offset-9 {
        margin-left: 75%
    }

    .col-sm-offset-10 {
        margin-left: 83.3333333333%
    }

    .col-sm-offset-11 {
        margin-left: 91.6666666667%
    }

    .col-sm-offset-12 {
        margin-left: 100%
    }
}

@media (min-width: 992px) {
    .col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9 {
        float: left
    }

    .col-md-1 {
        width: 8.3333333333%
    }

    .col-md-2 {
        width: 16.6666666667%
    }

    .col-md-3 {
        width: 25%
    }

    .col-md-4 {
        width: 33.3333333333%
    }

    .col-md-5 {
        width: 41.6666666667%
    }

    .col-md-6 {
        width: 50%
    }

    .col-md-7 {
        width: 58.3333333333%
    }

    .col-md-8 {
        width: 66.6666666667%
    }

    .col-md-9 {
        width: 75%
    }

    .col-md-10 {
        width: 83.3333333333%
    }

    .col-md-11 {
        width: 91.6666666667%
    }

    .col-md-12 {
        width: 100%
    }

    .col-md-pull-0 {
        right: auto
    }

    .col-md-pull-1 {
        right: 8.3333333333%
    }

    .col-md-pull-2 {
        right: 16.6666666667%
    }

    .col-md-pull-3 {
        right: 25%
    }

    .col-md-pull-4 {
        right: 33.3333333333%
    }

    .col-md-pull-5 {
        right: 41.6666666667%
    }

    .col-md-pull-6 {
        right: 50%
    }

    .col-md-pull-7 {
        right: 58.3333333333%
    }

    .col-md-pull-8 {
        right: 66.6666666667%
    }

    .col-md-pull-9 {
        right: 75%
    }

    .col-md-pull-10 {
        right: 83.3333333333%
    }

    .col-md-pull-11 {
        right: 91.6666666667%
    }

    .col-md-pull-12 {
        right: 100%
    }

    .col-md-push-0 {
        left: auto
    }

    .col-md-push-1 {
        left: 8.3333333333%
    }

    .col-md-push-2 {
        left: 16.6666666667%
    }

    .col-md-push-3 {
        left: 25%
    }

    .col-md-push-4 {
        left: 33.3333333333%
    }

    .col-md-push-5 {
        left: 41.6666666667%
    }

    .col-md-push-6 {
        left: 50%
    }

    .col-md-push-7 {
        left: 58.3333333333%
    }

    .col-md-push-8 {
        left: 66.6666666667%
    }

    .col-md-push-9 {
        left: 75%
    }

    .col-md-push-10 {
        left: 83.3333333333%
    }

    .col-md-push-11 {
        left: 91.6666666667%
    }

    .col-md-push-12 {
        left: 100%
    }

    .col-md-offset-0 {
        margin-left: 0
    }

    .col-md-offset-1 {
        margin-left: 8.3333333333%
    }

    .col-md-offset-2 {
        margin-left: 16.6666666667%
    }

    .col-md-offset-3 {
        margin-left: 25%
    }

    .col-md-offset-4 {
        margin-left: 33.3333333333%
    }

    .col-md-offset-5 {
        margin-left: 41.6666666667%
    }

    .col-md-offset-6 {
        margin-left: 50%
    }

    .col-md-offset-7 {
        margin-left: 58.3333333333%
    }

    .col-md-offset-8 {
        margin-left: 66.6666666667%
    }

    .col-md-offset-9 {
        margin-left: 75%
    }

    .col-md-offset-10 {
        margin-left: 83.3333333333%
    }

    .col-md-offset-11 {
        margin-left: 91.6666666667%
    }

    .col-md-offset-12 {
        margin-left: 100%
    }
}

@media (min-width: 1200px) {
    .col-lg-1, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9 {
        float: left
    }

    .col-lg-1 {
        width: 8.3333333333%
    }

    .col-lg-2 {
        width: 16.6666666667%
    }

    .col-lg-3 {
        width: 25%
    }

    .col-lg-4 {
        width: 33.3333333333%
    }

    .col-lg-5 {
        width: 41.6666666667%
    }

    .col-lg-6 {
        width: 50%
    }

    .col-lg-7 {
        width: 58.3333333333%
    }

    .col-lg-8 {
        width: 66.6666666667%
    }

    .col-lg-9 {
        width: 75%
    }

    .col-lg-10 {
        width: 83.3333333333%
    }

    .col-lg-11 {
        width: 91.6666666667%
    }

    .col-lg-12 {
        width: 100%
    }

    .col-lg-pull-0 {
        right: auto
    }

    .col-lg-pull-1 {
        right: 8.3333333333%
    }

    .col-lg-pull-2 {
        right: 16.6666666667%
    }

    .col-lg-pull-3 {
        right: 25%
    }

    .col-lg-pull-4 {
        right: 33.3333333333%
    }

    .col-lg-pull-5 {
        right: 41.6666666667%
    }

    .col-lg-pull-6 {
        right: 50%
    }

    .col-lg-pull-7 {
        right: 58.3333333333%
    }

    .col-lg-pull-8 {
        right: 66.6666666667%
    }

    .col-lg-pull-9 {
        right: 75%
    }

    .col-lg-pull-10 {
        right: 83.3333333333%
    }

    .col-lg-pull-11 {
        right: 91.6666666667%
    }

    .col-lg-pull-12 {
        right: 100%
    }

    .col-lg-push-0 {
        left: auto
    }

    .col-lg-push-1 {
        left: 8.3333333333%
    }

    .col-lg-push-2 {
        left: 16.6666666667%
    }

    .col-lg-push-3 {
        left: 25%
    }

    .col-lg-push-4 {
        left: 33.3333333333%
    }

    .col-lg-push-5 {
        left: 41.6666666667%
    }

    .col-lg-push-6 {
        left: 50%
    }

    .col-lg-push-7 {
        left: 58.3333333333%
    }

    .col-lg-push-8 {
        left: 66.6666666667%
    }

    .col-lg-push-9 {
        left: 75%
    }

    .col-lg-push-10 {
        left: 83.3333333333%
    }

    .col-lg-push-11 {
        left: 91.6666666667%
    }

    .col-lg-push-12 {
        left: 100%
    }

    .col-lg-offset-0 {
        margin-left: 0
    }

    .col-lg-offset-1 {
        margin-left: 8.3333333333%
    }

    .col-lg-offset-2 {
        margin-left: 16.6666666667%
    }

    .col-lg-offset-3 {
        margin-left: 25%
    }

    .col-lg-offset-4 {
        margin-left: 33.3333333333%
    }

    .col-lg-offset-5 {
        margin-left: 41.6666666667%
    }

    .col-lg-offset-6 {
        margin-left: 50%
    }

    .col-lg-offset-7 {
        margin-left: 58.3333333333%
    }

    .col-lg-offset-8 {
        margin-left: 66.6666666667%
    }

    .col-lg-offset-9 {
        margin-left: 75%
    }

    .col-lg-offset-10 {
        margin-left: 83.3333333333%
    }

    .col-lg-offset-11 {
        margin-left: 91.6666666667%
    }

    .col-lg-offset-12 {
        margin-left: 100%
    }
}

table {
    background-color: transparent
}

caption {
    padding-top: 8px;
    padding-bottom: 8px
}

th {
    text-align: left
}

.table {
    width: 100%;
    max-width: 100%;
    margin-bottom: 23px
}

.table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
    padding: 8px;
    line-height: 1.4375;
    vertical-align: top;
    border-top: 1px solid #ddd
}

.table > thead > tr > th {
    vertical-align: bottom;
    border-bottom: 2px solid #ddd
}

.table > caption + thead > tr:first-child > td, .table > caption + thead > tr:first-child > th, .table > colgroup + thead > tr:first-child > td, .table > colgroup + thead > tr:first-child > th, .table > thead:first-child > tr:first-child > td, .table > thead:first-child > tr:first-child > th {
    border-top: 0
}

.table > tbody + tbody {
    border-top: 2px solid #ddd
}

.table .table {
    background-color: #fff
}

.table-condensed > tbody > tr > td, .table-condensed > tbody > tr > th, .table-condensed > tfoot > tr > td, .table-condensed > tfoot > tr > th, .table-condensed > thead > tr > td, .table-condensed > thead > tr > th {
    padding: 5px
}

.table-bordered, .table-bordered > tbody > tr > td, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > td, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > thead > tr > th {
    border: 1px solid #ddd
}

.table-bordered > thead > tr > td, .table-bordered > thead > tr > th {
    border-bottom-width: 2px
}

.table-striped > tbody > tr:nth-child(odd) {
    background-color: #f5f5f5
}

.table-hover > tbody > tr:hover {
    background-color: #f0f0f0
}

table col[class*=col-] {
    position: static;
    float: none;
    display: table-column
}

table td[class*=col-], table th[class*=col-] {
    position: static;
    float: none;
    display: table-cell
}

.table > tbody > tr.active > td, .table > tbody > tr.active > th, .table > tbody > tr > td.active, .table > tbody > tr > th.active, .table > tfoot > tr.active > td, .table > tfoot > tr.active > th, .table > tfoot > tr > td.active, .table > tfoot > tr > th.active, .table > thead > tr.active > td, .table > thead > tr.active > th, .table > thead > tr > td.active, .table > thead > tr > th.active {
    background-color: #f0f0f0
}

.table-hover > tbody > tr.active:hover > td, .table-hover > tbody > tr.active:hover > th, .table-hover > tbody > tr:hover > .active, .table-hover > tbody > tr > td.active:hover, .table-hover > tbody > tr > th.active:hover {
    background-color: #e3e3e3
}

.table > tbody > tr.success > td, .table > tbody > tr.success > th, .table > tbody > tr > td.success, .table > tbody > tr > th.success, .table > tfoot > tr.success > td, .table > tfoot > tr.success > th, .table > tfoot > tr > td.success, .table > tfoot > tr > th.success, .table > thead > tr.success > td, .table > thead > tr.success > th, .table > thead > tr > td.success, .table > thead > tr > th.success {
    background-color: #dff0d8
}

.table-hover > tbody > tr.success:hover > td, .table-hover > tbody > tr.success:hover > th, .table-hover > tbody > tr:hover > .success, .table-hover > tbody > tr > td.success:hover, .table-hover > tbody > tr > th.success:hover {
    background-color: #d0e9c6
}

.table > tbody > tr.info > td, .table > tbody > tr.info > th, .table > tbody > tr > td.info, .table > tbody > tr > th.info, .table > tfoot > tr.info > td, .table > tfoot > tr.info > th, .table > tfoot > tr > td.info, .table > tfoot > tr > th.info, .table > thead > tr.info > td, .table > thead > tr.info > th, .table > thead > tr > td.info, .table > thead > tr > th.info {
    background-color: #d9edf7
}

.table-hover > tbody > tr.info:hover > td, .table-hover > tbody > tr.info:hover > th, .table-hover > tbody > tr:hover > .info, .table-hover > tbody > tr > td.info:hover, .table-hover > tbody > tr > th.info:hover {
    background-color: #c4e3f3
}

.table > tbody > tr.warning > td, .table > tbody > tr.warning > th, .table > tbody > tr > td.warning, .table > tbody > tr > th.warning, .table > tfoot > tr.warning > td, .table > tfoot > tr.warning > th, .table > tfoot > tr > td.warning, .table > tfoot > tr > th.warning, .table > thead > tr.warning > td, .table > thead > tr.warning > th, .table > thead > tr > td.warning, .table > thead > tr > th.warning {
    background-color: #fcf8e3
}

.table-hover > tbody > tr.warning:hover > td, .table-hover > tbody > tr.warning:hover > th, .table-hover > tbody > tr:hover > .warning, .table-hover > tbody > tr > td.warning:hover, .table-hover > tbody > tr > th.warning:hover {
    background-color: #faf2cc
}

.table > tbody > tr.danger > td, .table > tbody > tr.danger > th, .table > tbody > tr > td.danger, .table > tbody > tr > th.danger, .table > tfoot > tr.danger > td, .table > tfoot > tr.danger > th, .table > tfoot > tr > td.danger, .table > tfoot > tr > th.danger, .table > thead > tr.danger > td, .table > thead > tr.danger > th, .table > thead > tr > td.danger, .table > thead > tr > th.danger {
    background-color: #f2dede
}

.table-hover > tbody > tr.danger:hover > td, .table-hover > tbody > tr.danger:hover > th, .table-hover > tbody > tr:hover > .danger, .table-hover > tbody > tr > td.danger:hover, .table-hover > tbody > tr > th.danger:hover {
    background-color: #ebcccc
}

.table-responsive {
    overflow-x: auto;
    min-height: .01%
}

@media screen and (max-width: 767px) {
    .table-responsive {
        width: 100%;
        margin-bottom: 17.25px;
        overflow-y: hidden;
        -ms-overflow-style: -ms-autohiding-scrollbar;
        border: 1px solid #ddd
    }

    .table-responsive > .table {
        margin-bottom: 0
    }

    .table-responsive > .table > tbody > tr > td, .table-responsive > .table > tbody > tr > th, .table-responsive > .table > tfoot > tr > td, .table-responsive > .table > tfoot > tr > th, .table-responsive > .table > thead > tr > td, .table-responsive > .table > thead > tr > th {
        white-space: nowrap
    }

    .table-responsive > .table-bordered {
        border: 0
    }

    .table-responsive > .table-bordered > tbody > tr > td:first-child, .table-responsive > .table-bordered > tbody > tr > th:first-child, .table-responsive > .table-bordered > tfoot > tr > td:first-child, .table-responsive > .table-bordered > tfoot > tr > th:first-child, .table-responsive > .table-bordered > thead > tr > td:first-child, .table-responsive > .table-bordered > thead > tr > th:first-child {
        border-left: 0
    }

    .table-responsive > .table-bordered > tbody > tr > td:last-child, .table-responsive > .table-bordered > tbody > tr > th:last-child, .table-responsive > .table-bordered > tfoot > tr > td:last-child, .table-responsive > .table-bordered > tfoot > tr > th:last-child, .table-responsive > .table-bordered > thead > tr > td:last-child, .table-responsive > .table-bordered > thead > tr > th:last-child {
        border-right: 0
    }

    .table-responsive > .table-bordered > tbody > tr:last-child > td, .table-responsive > .table-bordered > tbody > tr:last-child > th, .table-responsive > .table-bordered > tfoot > tr:last-child > td, .table-responsive > .table-bordered > tfoot > tr:last-child > th {
        border-bottom: 0
    }
}

fieldset {
    padding: 0;
    margin: 0;
    border: 0;
    min-width: 0
}

legend {
    display: block;
    width: 100%;
    padding: 0;
    margin-bottom: 23px;
    font-size: 24px;
    line-height: inherit;
    color: #333;
    border: 0
}

label {
    display: inline-block;
    max-width: 100%;
    margin-bottom: 5px;
    font-weight: 700
}

input[type=search] {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box
}

input[type=checkbox], input[type=radio] {
    margin: 4px 0 0;
    line-height: normal
}

input[type=file] {
    display: block
}

input[type=range] {
    display: block;
    width: 100%
}

select[multiple], select[size] {
    height: auto
}

input[type=checkbox]:focus, input[type=file]:focus, input[type=radio]:focus {
    outline: thin dotted;
    outline: 5px auto -webkit-focus-ring-color;
    outline-offset: -2px
}

output {
    display: block;
    padding-top: 7px;
    font-size: 16px;
    line-height: 1.4375;
    color: #555
}

.form-control {
    display: block;
    height: 37px;
    padding: 6px 12px;
    font-size: 16px;
    line-height: 1.4375;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s
}

.form-control:focus {
    border-color: #66afe9;
    outline: 0;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, .6);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, .6)
}

.form-control::-moz-placeholder {
    color: #5c5c5c !important;
    opacity: 1
}

.form-control:-ms-input-placeholder {
    color: #5c5c5c !important
}

.form-control::-webkit-input-placeholder {
    color: #5c5c5c !important
}

.form-control[disabled], .form-control[readonly], fieldset[disabled] .form-control {
    cursor: not-allowed;
    background-color: #eee;
    opacity: 1
}

textarea.form-control {
    height: auto
}

input[type=search] {
    -webkit-appearance: none
}

@media screen and (-webkit-min-device-pixel-ratio: 0) {
    input[type=date], input[type=datetime-local], input[type=month], input[type=time] {
        line-height: 37px
    }

    .input-group-sm > .input-group-btn > input[type=date].btn, .input-group-sm > .input-group-btn > input[type=datetime-local].btn, .input-group-sm > .input-group-btn > input[type=month].btn, .input-group-sm > .input-group-btn > input[type=time].btn, .input-group-sm > input[type=date].form-control, .input-group-sm > input[type=date].input-group-addon, .input-group-sm > input[type=datetime-local].form-control, .input-group-sm > input[type=datetime-local].input-group-addon, .input-group-sm > input[type=month].form-control, .input-group-sm > input[type=month].input-group-addon, .input-group-sm > input[type=time].form-control, .input-group-sm > input[type=time].input-group-addon, input[type=date].input-sm, input[type=datetime-local].input-sm, input[type=month].input-sm, input[type=time].input-sm {
        line-height: 33px
    }

    .input-group-lg > .input-group-btn > input[type=date].btn, .input-group-lg > .input-group-btn > input[type=datetime-local].btn, .input-group-lg > .input-group-btn > input[type=month].btn, .input-group-lg > .input-group-btn > input[type=time].btn, .input-group-lg > input[type=date].form-control, .input-group-lg > input[type=date].input-group-addon, .input-group-lg > input[type=datetime-local].form-control, .input-group-lg > input[type=datetime-local].input-group-addon, .input-group-lg > input[type=month].form-control, .input-group-lg > input[type=month].input-group-addon, .input-group-lg > input[type=time].form-control, .input-group-lg > input[type=time].input-group-addon, input[type=date].input-lg, input[type=datetime-local].input-lg, input[type=month].input-lg, input[type=time].input-lg {
        line-height: 46px
    }
}

.form-group {
    margin-bottom: 15px
}

.checkbox, .radio {
    position: relative;
    display: block;
    margin-top: 10px;
    margin-bottom: 10px
}

.checkbox label, .radio label {
    min-height: 23px;
    padding-left: 20px;
    margin-bottom: 0;
    font-weight: 400;
    cursor: pointer
}

.checkbox input[type=checkbox], .checkbox-inline input[type=checkbox], .radio input[type=radio], .radio-inline input[type=radio] {
    position: absolute;
    margin-left: -20px
}

.checkbox + .checkbox, .radio + .radio {
    margin-top: -5px
}

.checkbox-inline, .radio-inline {
    display: inline-block;
    padding-left: 20px;
    margin-bottom: 0;
    vertical-align: middle;
    font-weight: 400;
    cursor: pointer
}

.checkbox-inline + .checkbox-inline, .radio-inline + .radio-inline {
    margin-top: 0;
    margin-left: 10px
}

.checkbox-inline.disabled, .checkbox.disabled label, .radio-inline.disabled, .radio.disabled label, fieldset[disabled] .checkbox label, fieldset[disabled] .checkbox-inline, fieldset[disabled] .radio label, fieldset[disabled] .radio-inline, fieldset[disabled] input[type=checkbox], fieldset[disabled] input[type=radio], input[type=checkbox].disabled, input[type=checkbox][disabled], input[type=radio].disabled, input[type=radio][disabled] {
    cursor: not-allowed
}

.form-control-static {
    padding-top: 7px;
    padding-bottom: 7px;
    margin-bottom: 0
}

.form-control-static.input-lg, .form-control-static.input-sm, .input-group-lg > .form-control-static.form-control, .input-group-lg > .form-control-static.input-group-addon, .input-group-lg > .input-group-btn > .form-control-static.btn, .input-group-sm > .form-control-static.form-control, .input-group-sm > .form-control-static.input-group-addon, .input-group-sm > .input-group-btn > .form-control-static.btn {
    padding-left: 0;
    padding-right: 0
}

.form-group-sm .form-control, .input-group-sm > .form-control, .input-group-sm > .input-group-addon, .input-group-sm > .input-group-btn > .btn, .input-sm {
    height: 33px;
    padding: 5px 10px;
    font-size: 14px;
    line-height: 1.5;
    border-radius: 3px
}

.form-group-sm .form-control, .input-group-sm > .input-group-btn > select.btn, .input-group-sm > select.form-control, .input-group-sm > select.input-group-addon, select.input-sm {
    height: 33px;
    line-height: 33px
}

.form-group-sm .form-control, .input-group-sm > .input-group-btn > select[multiple].btn, .input-group-sm > .input-group-btn > textarea.btn, .input-group-sm > select[multiple].form-control, .input-group-sm > select[multiple].input-group-addon, .input-group-sm > textarea.form-control, .input-group-sm > textarea.input-group-addon, select[multiple].input-sm, textarea.input-sm {
    height: auto
}

.form-group-lg .form-control, .input-group-lg > .form-control, .input-group-lg > .input-group-addon, .input-group-lg > .input-group-btn > .btn, .input-lg {
    height: 46px;
    padding: 10px 16px;
    font-size: 18px;
    line-height: 1.33;
    border-radius: 6px
}

.form-group-lg .form-control, .input-group-lg > .input-group-btn > select.btn, .input-group-lg > select.form-control, .input-group-lg > select.input-group-addon, select.input-lg {
    height: 46px;
    line-height: 46px
}

.form-group-lg .form-control, .input-group-lg > .input-group-btn > select[multiple].btn, .input-group-lg > .input-group-btn > textarea.btn, .input-group-lg > select[multiple].form-control, .input-group-lg > select[multiple].input-group-addon, .input-group-lg > textarea.form-control, .input-group-lg > textarea.input-group-addon, select[multiple].input-lg, textarea.input-lg {
    height: auto
}

.has-feedback {
    position: relative
}

.has-feedback .form-control {
    padding-right: 46.25px
}

.form-control-feedback {
    position: absolute;
    top: 0;
    right: 0;
    z-index: 2;
    display: block;
    width: 37px;
    height: 37px;
    line-height: 37px;
    text-align: center;
    pointer-events: none
}

.input-group-lg > .form-control + .form-control-feedback, .input-group-lg > .input-group-addon + .form-control-feedback, .input-group-lg > .input-group-btn > .btn + .form-control-feedback, .input-lg + .form-control-feedback {
    width: 46px;
    height: 46px;
    line-height: 46px
}

.input-group-sm > .form-control + .form-control-feedback, .input-group-sm > .input-group-addon + .form-control-feedback, .input-group-sm > .input-group-btn > .btn + .form-control-feedback, .input-sm + .form-control-feedback {
    width: 33px;
    height: 33px;
    line-height: 33px
}

.has-success .checkbox, .has-success .checkbox-inline, .has-success .control-label, .has-success .help-block, .has-success .radio, .has-success .radio-inline, .has-success.checkbox label, .has-success.checkbox-inline label, .has-success.radio label, .has-success.radio-inline label {
    color: #3c763d
}

.has-success .form-control {
    border-color: #3c763d;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075)
}

.has-success .form-control:focus {
    border-color: #2b542c;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 6px #67b168;
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 6px #67b168
}

.has-success .input-group-addon {
    color: #3c763d;
    border-color: #3c763d;
    background-color: #dff0d8
}

.has-success .form-control-feedback {
    color: #3c763d
}

.has-warning .checkbox, .has-warning .checkbox-inline, .has-warning .control-label, .has-warning .help-block, .has-warning .radio, .has-warning .radio-inline, .has-warning.checkbox label, .has-warning.checkbox-inline label, .has-warning.radio label, .has-warning.radio-inline label {
    color: #8a6d3b
}

.has-warning .form-control {
    border-color: #8a6d3b;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075)
}

.has-warning .form-control:focus {
    border-color: #66512c;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 6px #c0a16b;
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 6px #c0a16b
}

.has-warning .input-group-addon {
    color: #8a6d3b;
    border-color: #8a6d3b;
    background-color: #fcf8e3
}

.has-warning .form-control-feedback {
    color: #8a6d3b
}

.has-error .checkbox, .has-error .checkbox-inline, .has-error .control-label, .has-error .help-block, .has-error .radio, .has-error .radio-inline, .has-error.checkbox label, .has-error.checkbox-inline label, .has-error.radio label, .has-error.radio-inline label {
    color: #a94442
}

.has-error .form-control {
    border-color: #a94442;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075)
}

.has-error .form-control:focus {
    border-color: #843534;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 6px #ce8483;
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 6px #ce8483
}

.has-error .input-group-addon {
    color: #a94442;
    border-color: #a94442;
    background-color: #f2dede
}

.has-error .form-control-feedback {
    color: #a94442
}

.has-feedback label ~ .form-control-feedback {
    top: 28px
}

.has-feedback label.sr-only ~ .form-control-feedback {
    top: 0
}

.help-block {
    display: block;
    margin-top: 5px;
    margin-bottom: 10px;
    color: #737373
}

@media (min-width: 768px) {
    .form-inline .form-group {
        display: inline-block;
        margin-bottom: 0;
        vertical-align: middle
    }

    .form-inline .form-control {
        display: inline-block;
        width: auto;
        vertical-align: middle
    }

    .form-inline .form-control-static {
        display: inline-block
    }

    .form-inline .input-group {
        display: inline-table;
        vertical-align: middle
    }

    .form-inline .input-group .form-control, .form-inline .input-group .input-group-addon, .form-inline .input-group .input-group-btn {
        width: auto
    }

    .form-inline .input-group > .form-control {
        width: 100%
    }

    .form-inline .control-label {
        margin-bottom: 0;
        vertical-align: middle
    }

    .form-inline .checkbox, .form-inline .radio {
        display: inline-block;
        margin-top: 0;
        margin-bottom: 0;
        vertical-align: middle
    }

    .form-inline .checkbox label, .form-inline .radio label {
        padding-left: 0
    }

    .form-inline .checkbox input[type=checkbox], .form-inline .radio input[type=radio] {
        position: relative;
        margin-left: 0
    }

    .form-inline .has-feedback .form-control-feedback {
        top: 0
    }
}

.form-horizontal .checkbox, .form-horizontal .checkbox-inline, .form-horizontal .radio, .form-horizontal .radio-inline {
    margin-top: 0;
    margin-bottom: 0;
    padding-top: 7px
}

.form-horizontal .checkbox, .form-horizontal .radio {
    min-height: 30px
}

.form-horizontal .form-group {
    margin-left: -15px;
    margin-right: -15px
}

.form-horizontal .form-group:after, .form-horizontal .form-group:before {
    content: " ";
    display: table
}

.form-horizontal .form-group:after {
    clear: both
}

@media (min-width: 768px) {
    .form-horizontal .control-label {
        text-align: right;
        margin-bottom: 0;
        padding-top: 7px
    }
}

.form-horizontal .has-feedback .form-control-feedback {
    right: 15px
}

@media (min-width: 768px) {
    .form-horizontal .form-group-lg .control-label {
        padding-top: 14.3px
    }
}

@media (min-width: 768px) {
    .form-horizontal .form-group-sm .control-label {
        padding-top: 6px
    }
}

.btn {
    display: inline-block;
    margin-bottom: 0;
    font-weight: 400;
    text-align: center;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    background-image: none;
    border: 1px solid transparent;
    padding: 6px 12px;
    font-size: 16px;
    line-height: 1.4375;
    border-radius: 4px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none
}

.btn.active.focus, .btn.active:focus, .btn.focus, .btn:active.focus, .btn:active:focus, .btn:focus {
    outline: thin dotted;
    outline: 5px auto -webkit-focus-ring-color;
    outline-offset: -2px
}

.btn.focus, .btn:focus, .btn:hover {
    color: #335075;
    text-decoration: none
}

.btn.active, .btn:active {
    outline: 0;
    background-image: none;
    -webkit-box-shadow: inset 0 3px 5px rgba(0, 0, 0, .125);
    box-shadow: inset 0 3px 5px rgba(0, 0, 0, .125)
}

.btn.disabled, .btn[disabled], fieldset[disabled] .btn {
    cursor: not-allowed;
    pointer-events: none;
    opacity: .65;
    filter: alpha(opacity=65);
    -webkit-box-shadow: none;
    box-shadow: none
}

.btn-default {
    color: #335075;
    background-color: #eaebed;
    border-color: #dcdee1
}

.btn-default.active, .btn-default.focus, .btn-default:active, .btn-default:focus, .btn-default:hover, .open > .btn-default.dropdown-toggle {
    color: #335075;
    background-color: #cfd1d5;
    border-color: #bbbfc5
}

.btn-default.active, .btn-default:active, .open > .btn-default.dropdown-toggle {
    background-image: none
}

.btn-default.disabled, .btn-default.disabled.active, .btn-default.disabled.focus, .btn-default.disabled:active, .btn-default.disabled:focus, .btn-default.disabled:hover, .btn-default[disabled], .btn-default[disabled].active, .btn-default[disabled].focus, .btn-default[disabled]:active, .btn-default[disabled]:focus, .btn-default[disabled]:hover, fieldset[disabled] .btn-default, fieldset[disabled] .btn-default.active, fieldset[disabled] .btn-default.focus, fieldset[disabled] .btn-default:active, fieldset[disabled] .btn-default:focus, fieldset[disabled] .btn-default:hover {
    background-color: #eaebed;
    border-color: #dcdee1
}

.btn-default .badge {
    color: #eaebed;
    background-color: #335075
}

.btn-primary {
    color: #fff;
    background-color: #2572b4;
    border-color: #143c5f
}

.btn-primary.active, .btn-primary.focus, .btn-primary:active, .btn-primary:focus, .btn-primary:hover, .open > .btn-primary.dropdown-toggle {
    color: #fff;
    background-color: #1c578a;
    border-color: #091c2d
}

.btn-primary.active, .btn-primary:active, .open > .btn-primary.dropdown-toggle {
    background-image: none
}

.btn-primary.disabled, .btn-primary.disabled.active, .btn-primary.disabled.focus, .btn-primary.disabled:active, .btn-primary.disabled:focus, .btn-primary.disabled:hover, .btn-primary[disabled], .btn-primary[disabled].active, .btn-primary[disabled].focus, .btn-primary[disabled]:active, .btn-primary[disabled]:focus, .btn-primary[disabled]:hover, fieldset[disabled] .btn-primary, fieldset[disabled] .btn-primary.active, fieldset[disabled] .btn-primary.focus, fieldset[disabled] .btn-primary:active, fieldset[disabled] .btn-primary:focus, fieldset[disabled] .btn-primary:hover {
    background-color: #2572b4;
    border-color: #143c5f
}

.btn-primary .badge {
    color: #2572b4;
    background-color: #fff
}

.btn-success {
    color: #fff;
    background-color: #1b6c1c;
    border-color: #071a07
}

.btn-success.active, .btn-success.focus, .btn-success:active, .btn-success:focus, .btn-success:hover, .open > .btn-success.dropdown-toggle {
    color: #fff;
    background-color: #114311;
    border-color: #000
}

.btn-success.active, .btn-success:active, .open > .btn-success.dropdown-toggle {
    background-image: none
}

.btn-success.disabled, .btn-success.disabled.active, .btn-success.disabled.focus, .btn-success.disabled:active, .btn-success.disabled:focus, .btn-success.disabled:hover, .btn-success[disabled], .btn-success[disabled].active, .btn-success[disabled].focus, .btn-success[disabled]:active, .btn-success[disabled]:focus, .btn-success[disabled]:hover, fieldset[disabled] .btn-success, fieldset[disabled] .btn-success.active, fieldset[disabled] .btn-success.focus, fieldset[disabled] .btn-success:active, fieldset[disabled] .btn-success:focus, fieldset[disabled] .btn-success:hover {
    background-color: #1b6c1c;
    border-color: #071a07
}

.btn-success .badge {
    color: #1b6c1c;
    background-color: #fff
}

.btn-info {
    color: #fff;
    background-color: #4d4d4d;
    border-color: #1a1a1a
}

.btn-info.active, .btn-info.focus, .btn-info:active, .btn-info:focus, .btn-info:hover, .open > .btn-info.dropdown-toggle {
    color: #fff;
    background-color: #343434;
    border-color: #000
}

.btn-info.active, .btn-info:active, .open > .btn-info.dropdown-toggle {
    background-image: none
}

.btn-info.disabled, .btn-info.disabled.active, .btn-info.disabled.focus, .btn-info.disabled:active, .btn-info.disabled:focus, .btn-info.disabled:hover, .btn-info[disabled], .btn-info[disabled].active, .btn-info[disabled].focus, .btn-info[disabled]:active, .btn-info[disabled]:focus, .btn-info[disabled]:hover, fieldset[disabled] .btn-info, fieldset[disabled] .btn-info.active, fieldset[disabled] .btn-info.focus, fieldset[disabled] .btn-info:active, fieldset[disabled] .btn-info:focus, fieldset[disabled] .btn-info:hover {
    background-color: #4d4d4d;
    border-color: #1a1a1a
}

.btn-info .badge {
    color: #4d4d4d;
    background-color: #fff
}

.btn-warning {
    color: #000;
    background-color: #f2d40d;
    border-color: #917f08
}

.btn-warning.active, .btn-warning.focus, .btn-warning:active, .btn-warning:focus, .btn-warning:hover, .open > .btn-warning.dropdown-toggle {
    color: #000;
    background-color: #c2aa0a;
    border-color: #574c05
}

.btn-warning.active, .btn-warning:active, .open > .btn-warning.dropdown-toggle {
    background-image: none
}

.btn-warning.disabled, .btn-warning.disabled.active, .btn-warning.disabled.focus, .btn-warning.disabled:active, .btn-warning.disabled:focus, .btn-warning.disabled:hover, .btn-warning[disabled], .btn-warning[disabled].active, .btn-warning[disabled].focus, .btn-warning[disabled]:active, .btn-warning[disabled]:focus, .btn-warning[disabled]:hover, fieldset[disabled] .btn-warning, fieldset[disabled] .btn-warning.active, fieldset[disabled] .btn-warning.focus, fieldset[disabled] .btn-warning:active, fieldset[disabled] .btn-warning:focus, fieldset[disabled] .btn-warning:hover {
    background-color: #f2d40d;
    border-color: #917f08
}

.btn-warning .badge {
    color: #f2d40d;
    background-color: #000
}

.btn-danger {
    color: #fff;
    background-color: #bc3331;
    border-color: #6b1d1c
}

.btn-danger.active, .btn-danger.focus, .btn-danger:active, .btn-danger:focus, .btn-danger:hover, .open > .btn-danger.dropdown-toggle {
    color: #fff;
    background-color: #942826;
    border-color: #3b100f
}

.btn-danger.active, .btn-danger:active, .open > .btn-danger.dropdown-toggle {
    background-image: none
}

.btn-danger.disabled, .btn-danger.disabled.active, .btn-danger.disabled.focus, .btn-danger.disabled:active, .btn-danger.disabled:focus, .btn-danger.disabled:hover, .btn-danger[disabled], .btn-danger[disabled].active, .btn-danger[disabled].focus, .btn-danger[disabled]:active, .btn-danger[disabled]:focus, .btn-danger[disabled]:hover, fieldset[disabled] .btn-danger, fieldset[disabled] .btn-danger.active, fieldset[disabled] .btn-danger.focus, fieldset[disabled] .btn-danger:active, fieldset[disabled] .btn-danger:focus, fieldset[disabled] .btn-danger:hover {
    background-color: #bc3331;
    border-color: #6b1d1c
}

.btn-danger .badge {
    color: #bc3331;
    background-color: #fff
}

.btn-link {
    color: #295376;
    font-weight: 400;
    border-radius: 0
}

.btn-link, .btn-link.active, .btn-link:active, .btn-link[disabled], fieldset[disabled] .btn-link {
    background-color: transparent;
    -webkit-box-shadow: none;
    box-shadow: none
}

.btn-link, .btn-link:active, .btn-link:focus, .btn-link:hover {
    border-color: transparent
}

.btn-link:focus, .btn-link:hover {
    color: #0535d2;
    text-decoration: underline;
    background-color: transparent
}

.btn-link[disabled]:focus, .btn-link[disabled]:hover, fieldset[disabled] .btn-link:focus, fieldset[disabled] .btn-link:hover {
    color: #767676;
    text-decoration: none
}

.btn-group-lg > .btn, .btn-lg {
    padding: 10px 16px;
    font-size: 18px;
    line-height: 1.33;
    border-radius: 6px
}

.btn-group-sm > .btn, .btn-sm {
    padding: 5px 10px;
    font-size: 14px;
    line-height: 1.5;
    border-radius: 3px
}

.btn-group-xs > .btn, .btn-xs {
    padding: 1px 5px;
    font-size: 14px;
    line-height: 1.5;
    border-radius: 3px
}

.btn-block {
    display: block;
    width: 100%
}

.btn-block + .btn-block {
    margin-top: 5px
}

input[type=button].btn-block, input[type=reset].btn-block, input[type=submit].btn-block {
    width: 100%
}

.fade {
    opacity: 0
}

.collapse {
    display: none;
    visibility: hidden
}

.collapse.in {
    display: block;
    visibility: visible
}

tr.collapse.in {
    display: table-row
}

tbody.collapse.in {
    display: table-row-group
}

.collapsing {
    position: relative;
    height: 0;
    overflow: hidden;
    -webkit-transition-property: height, visibility;
    transition-property: height, visibility;
    -webkit-transition-duration: .35s;
    transition-duration: .35s;
    -webkit-transition-timing-function: ease;
    transition-timing-function: ease
}

.caret {
    display: inline-block;
    width: 0;
    height: 0;
    margin-left: 2px;
    vertical-align: middle;
    border-top: 4px solid;
    border-right: 4px solid transparent;
    border-left: 4px solid transparent
}

.dropdown {
    position: relative
}

.dropdown-toggle:focus {
    outline: 0
}

.dropdown-menu {
    position: absolute;
    top: 100%;
    left: 0;
    z-index: 1000;
    display: none;
    float: left;
    min-width: 160px;
    padding: 5px 0;
    margin: 2px 0 0;
    list-style: none;
    font-size: 16px;
    text-align: left;
    background-color: #fff;
    border: 1px solid #ccc;
    border: 1px solid rgba(0, 0, 0, .15);
    border-radius: 4px;
    -webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
    box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
    -webkit-background-clip: padding-box;
    background-clip: padding-box
}

.dropdown-menu.pull-right {
    right: 0;
    left: auto
}

.dropdown-menu .divider {
    height: 1px;
    margin: 10.5px 0;
    overflow: hidden;
    background-color: #e5e5e5
}

.dropdown-menu > li > a {
    display: block;
    padding: 3px 20px;
    clear: both;
    font-weight: 400;
    line-height: 1.4375;
    color: #333;
    white-space: nowrap
}

.dropdown-menu > li > a:focus, .dropdown-menu > li > a:hover {
    text-decoration: none;
    color: #262626;
    background-color: #f5f5f5
}

.dropdown-menu > .active > a, .dropdown-menu > .active > a:focus, .dropdown-menu > .active > a:hover {
    color: #fff;
    text-decoration: none;
    outline: 0;
    background-color: #2572b4
}

.dropdown-menu > .disabled > a, .dropdown-menu > .disabled > a:focus, .dropdown-menu > .disabled > a:hover {
    color: #767676
}

.dropdown-menu > .disabled > a:focus, .dropdown-menu > .disabled > a:hover {
    text-decoration: none;
    background-color: transparent;
    background-image: none;
    filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
    cursor: not-allowed
}

.open > .dropdown-menu {
    display: block
}

.open > a {
    outline: 0
}

.dropdown-menu-right {
    left: auto;
    right: 0
}

.dropdown-menu-left {
    left: 0;
    right: auto
}

.dropdown-header {
    display: block;
    padding: 3px 20px;
    font-size: 14px;
    line-height: 1.4375;
    color: #767676;
    white-space: nowrap
}

.dropdown-backdrop {
    position: fixed;
    left: 0;
    right: 0;
    bottom: 0;
    top: 0;
    z-index: 990
}

.pull-right > .dropdown-menu {
    right: 0;
    left: auto
}

.dropup .caret, .navbar-fixed-bottom .dropdown .caret {
    border-top: 0;
    border-bottom: 4px solid;
    content: ""
}

.dropup .dropdown-menu, .navbar-fixed-bottom .dropdown .dropdown-menu {
    top: auto;
    bottom: 100%;
    margin-bottom: 1px
}

@media (min-width: 768px) {
    .navbar-right .dropdown-menu {
        right: 0;
        left: auto
    }

    .navbar-right .dropdown-menu-left {
        left: 0;
        right: auto
    }
}

.btn-group, .btn-group-vertical {
    position: relative;
    display: inline-block;
    vertical-align: middle
}

.btn-group-vertical > .btn, .btn-group > .btn {
    position: relative;
    float: left
}

.btn-group-vertical > .btn.active, .btn-group-vertical > .btn:active, .btn-group-vertical > .btn:focus, .btn-group-vertical > .btn:hover, .btn-group > .btn.active, .btn-group > .btn:active, .btn-group > .btn:focus, .btn-group > .btn:hover {
    z-index: 2
}

.btn-group .btn + .btn, .btn-group .btn + .btn-group, .btn-group .btn-group + .btn, .btn-group .btn-group + .btn-group {
    margin-left: -1px
}

.btn-toolbar {
    margin-left: -5px
}

.btn-toolbar:after, .btn-toolbar:before {
    content: " ";
    display: table
}

.btn-toolbar:after {
    clear: both
}

.btn-toolbar .btn-group, .btn-toolbar .input-group {
    float: left
}

.btn-toolbar > .btn, .btn-toolbar > .btn-group, .btn-toolbar > .input-group {
    margin-left: 5px
}

.btn-group > .btn:not(:first-child):not(:last-child):not(.dropdown-toggle) {
    border-radius: 0
}

.btn-group > .btn:first-child {
    margin-left: 0
}

.btn-group > .btn:first-child:not(:last-child):not(.dropdown-toggle) {
    border-bottom-right-radius: 0;
    border-top-right-radius: 0
}

.btn-group > .btn:last-child:not(:first-child), .btn-group > .dropdown-toggle:not(:first-child) {
    border-bottom-left-radius: 0;
    border-top-left-radius: 0
}

.btn-group > .btn-group {
    float: left
}

.btn-group > .btn-group:not(:first-child):not(:last-child) > .btn {
    border-radius: 0
}

.btn-group > .btn-group:first-child > .btn:last-child, .btn-group > .btn-group:first-child > .dropdown-toggle {
    border-bottom-right-radius: 0;
    border-top-right-radius: 0
}

.btn-group > .btn-group:last-child > .btn:first-child {
    border-bottom-left-radius: 0;
    border-top-left-radius: 0
}

.btn-group .dropdown-toggle:active, .btn-group.open .dropdown-toggle {
    outline: 0
}

.btn-group > .btn + .dropdown-toggle {
    padding-left: 8px;
    padding-right: 8px
}

.btn-group-lg.btn-group > .btn + .dropdown-toggle, .btn-group > .btn-lg + .dropdown-toggle {
    padding-left: 12px;
    padding-right: 12px
}

.btn-group.open .dropdown-toggle {
    -webkit-box-shadow: inset 0 3px 5px rgba(0, 0, 0, .125);
    box-shadow: inset 0 3px 5px rgba(0, 0, 0, .125)
}

.btn-group.open .dropdown-toggle.btn-link {
    -webkit-box-shadow: none;
    box-shadow: none
}

.btn .caret {
    margin-left: 0
}

.btn-group-lg > .btn .caret, .btn-lg .caret {
    border-width: 5px 5px 0;
    border-bottom-width: 0
}

.dropup .btn-group-lg > .btn .caret, .dropup .btn-lg .caret {
    border-width: 0 5px 5px
}

.btn-group-vertical > .btn, .btn-group-vertical > .btn-group, .btn-group-vertical > .btn-group > .btn {
    display: block;
    float: none;
    width: 100%;
    max-width: 100%
}

.btn-group-vertical > .btn-group:after, .btn-group-vertical > .btn-group:before {
    content: " ";
    display: table
}

.btn-group-vertical > .btn-group:after {
    clear: both
}

.btn-group-vertical > .btn-group > .btn {
    float: none
}

.btn-group-vertical > .btn + .btn, .btn-group-vertical > .btn + .btn-group, .btn-group-vertical > .btn-group + .btn, .btn-group-vertical > .btn-group + .btn-group {
    margin-top: -1px;
    margin-left: 0
}

.btn-group-vertical > .btn:not(:first-child):not(:last-child) {
    border-radius: 0
}

.btn-group-vertical > .btn:first-child:not(:last-child) {
    border-top-right-radius: 4px;
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0
}

.btn-group-vertical > .btn:last-child:not(:first-child) {
    border-bottom-left-radius: 4px;
    border-top-right-radius: 0;
    border-top-left-radius: 0
}

.btn-group-vertical > .btn-group:not(:first-child):not(:last-child) > .btn {
    border-radius: 0
}

.btn-group-vertical > .btn-group:first-child:not(:last-child) > .btn:last-child, .btn-group-vertical > .btn-group:first-child:not(:last-child) > .dropdown-toggle {
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0
}

.btn-group-vertical > .btn-group:last-child:not(:first-child) > .btn:first-child {
    border-top-right-radius: 0;
    border-top-left-radius: 0
}

.btn-group-justified {
    display: table;
    width: 100%;
    table-layout: fixed;
    border-collapse: separate
}

.btn-group-justified > .btn, .btn-group-justified > .btn-group {
    float: none;
    display: table-cell;
    width: 1%
}

.btn-group-justified > .btn-group .btn {
    width: 100%
}

.btn-group-justified > .btn-group .dropdown-menu {
    left: auto
}

[data-toggle=buttons] > .btn input[type=checkbox], [data-toggle=buttons] > .btn input[type=radio], [data-toggle=buttons] > .btn-group > .btn input[type=checkbox], [data-toggle=buttons] > .btn-group > .btn input[type=radio] {
    position: absolute;
    clip: rect(0, 0, 0, 0);
    pointer-events: none
}

.input-group {
    position: relative;
    display: table;
    border-collapse: separate
}

.input-group[class*=col-] {
    float: none;
    padding-left: 0;
    padding-right: 0
}

.input-group .form-control {
    position: relative;
    z-index: 2;
    float: left;
    width: 100%;
    margin-bottom: 0
}

.input-group .form-control, .input-group-addon, .input-group-btn {
    display: table-cell
}

.input-group .form-control:not(:first-child):not(:last-child), .input-group-addon:not(:first-child):not(:last-child), .input-group-btn:not(:first-child):not(:last-child) {
    border-radius: 0
}

.input-group-addon, .input-group-btn {
    width: 1%;
    white-space: nowrap;
    vertical-align: middle
}

.input-group-addon {
    padding: 6px 12px;
    font-size: 16px;
    font-weight: 400;
    line-height: 1;
    color: #555;
    text-align: center;
    background-color: #eee;
    border: 1px solid #ccc;
    border-radius: 4px
}

.input-group-addon.input-sm, .input-group-sm > .input-group-addon, .input-group-sm > .input-group-btn > .input-group-addon.btn {
    padding: 5px 10px;
    font-size: 14px;
    border-radius: 3px
}

.input-group-addon.input-lg, .input-group-lg > .input-group-addon, .input-group-lg > .input-group-btn > .input-group-addon.btn {
    padding: 10px 16px;
    font-size: 18px;
    border-radius: 6px
}

.input-group-addon input[type=checkbox], .input-group-addon input[type=radio] {
    margin-top: 0
}

.input-group .form-control:first-child, .input-group-addon:first-child, .input-group-btn:first-child > .btn, .input-group-btn:first-child > .btn-group > .btn, .input-group-btn:first-child > .dropdown-toggle, .input-group-btn:last-child > .btn-group:not(:last-child) > .btn, .input-group-btn:last-child > .btn:not(:last-child):not(.dropdown-toggle) {
    border-bottom-right-radius: 0;
    border-top-right-radius: 0
}

.input-group-addon:first-child {
    border-right: 0
}

.input-group .form-control:last-child, .input-group-addon:last-child, .input-group-btn:first-child > .btn-group:not(:first-child) > .btn, .input-group-btn:first-child > .btn:not(:first-child), .input-group-btn:last-child > .btn, .input-group-btn:last-child > .btn-group > .btn, .input-group-btn:last-child > .dropdown-toggle {
    border-bottom-left-radius: 0;
    border-top-left-radius: 0
}

.input-group-addon:last-child {
    border-left: 0
}

.input-group-btn {
    position: relative;
    font-size: 0;
    white-space: nowrap
}

.input-group-btn > .btn {
    position: relative
}

.input-group-btn > .btn + .btn {
    margin-left: -1px
}

.input-group-btn > .btn:active, .input-group-btn > .btn:focus, .input-group-btn > .btn:hover {
    z-index: 2
}

.input-group-btn:first-child > .btn, .input-group-btn:first-child > .btn-group {
    margin-right: -1px
}

.input-group-btn:last-child > .btn, .input-group-btn:last-child > .btn-group {
    margin-left: -1px
}

.nav {
    margin-bottom: 0;
    padding-left: 0;
    list-style: none
}

.nav:after, .nav:before {
    content: " ";
    display: table
}

.nav:after {
    clear: both
}

.nav > li {
    position: relative;
    display: block
}

.nav > li > a {
    position: relative;
    display: block;
    padding: 10px 15px
}

.nav > li > a:focus, .nav > li > a:hover {
    text-decoration: none;
    background-color: #eee
}

.nav > li.disabled > a {
    color: #767676
}

.nav > li.disabled > a:focus, .nav > li.disabled > a:hover {
    color: #767676;
    text-decoration: none;
    background-color: transparent;
    cursor: not-allowed
}

.nav .open > a, .nav .open > a:focus, .nav .open > a:hover {
    background-color: #eee;
    border-color: #295376
}

.nav .nav-divider {
    height: 1px;
    margin: 10.5px 0;
    overflow: hidden;
    background-color: #e5e5e5
}

.nav > li > a > img {
    max-width: none
}

.nav-tabs {
    border-bottom: 1px solid #ddd
}

.nav-tabs > li {
    float: left;
    margin-bottom: -1px
}

.nav-tabs > li > a {
    margin-right: 2px;
    line-height: 1.4375;
    border: 1px solid transparent;
    border-radius: 4px 4px 0 0
}

.nav-tabs > li > a:hover {
    border-color: #eee #eee #ddd
}

.nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, .nav-tabs > li.active > a:hover {
    color: #555;
    background-color: #fff;
    border: 1px solid #ddd;
    border-bottom-color: transparent;
    cursor: default
}

.nav-pills > li {
    float: left
}

.nav-pills > li > a {
    border-radius: 4px
}

.nav-pills > li + li {
    margin-left: 2px
}

.nav-pills > li.active > a, .nav-pills > li.active > a:focus, .nav-pills > li.active > a:hover {
    color: #fff;
    background-color: #2572b4
}

.nav-stacked > li {
    float: none
}

.nav-stacked > li + li {
    margin-top: 2px;
    margin-left: 0
}

.nav-justified, .nav-tabs.nav-justified {
    width: 100%
}

.nav-justified > li, .nav-tabs.nav-justified > li {
    float: none
}

.nav-justified > li > a, .nav-tabs.nav-justified > li > a {
    text-align: center;
    margin-bottom: 5px
}

.nav-justified > .dropdown .dropdown-menu {
    top: auto;
    left: auto
}

@media (min-width: 768px) {
    .nav-justified > li, .nav-tabs.nav-justified > li {
        display: table-cell;
        width: 1%
    }

    .nav-justified > li > a, .nav-tabs.nav-justified > li > a {
        margin-bottom: 0
    }
}

.nav-tabs-justified, .nav-tabs.nav-justified {
    border-bottom: 0
}

.nav-tabs-justified > li > a, .nav-tabs.nav-justified > li > a {
    margin-right: 0;
    border-radius: 4px
}

.nav-tabs-justified > .active > a, .nav-tabs-justified > .active > a:focus, .nav-tabs-justified > .active > a:hover, .nav-tabs.nav-justified > .active > a, .nav-tabs.nav-justified > .active > a:focus, .nav-tabs.nav-justified > .active > a:hover {
    border: 1px solid #ddd
}

@media (min-width: 768px) {
    .nav-tabs-justified > li > a, .nav-tabs.nav-justified > li > a {
        border-bottom: 1px solid #ddd;
        border-radius: 4px 4px 0 0
    }

    .nav-tabs-justified > .active > a, .nav-tabs-justified > .active > a:focus, .nav-tabs-justified > .active > a:hover, .nav-tabs.nav-justified > .active > a, .nav-tabs.nav-justified > .active > a:focus, .nav-tabs.nav-justified > .active > a:hover {
        border-bottom-color: #fff
    }
}

.tab-content > .tab-pane {
    display: none;
    visibility: hidden
}

.tab-content > .active {
    display: block;
    visibility: visible
}

.nav-tabs .dropdown-menu {
    margin-top: -1px;
    border-top-right-radius: 0;
    border-top-left-radius: 0
}

.navbar {
    position: relative;
    min-height: 50px;
    margin-bottom: 23px;
    border: 1px solid transparent
}

.navbar:after, .navbar:before {
    content: " ";
    display: table
}

.navbar:after {
    clear: both
}

@media (min-width: 768px) {
    .navbar {
        border-radius: 4px
    }
}

.navbar-header:after, .navbar-header:before {
    content: " ";
    display: table
}

.navbar-header:after {
    clear: both
}

@media (min-width: 768px) {
    .navbar-header {
        float: left
    }
}

.navbar-collapse {
    overflow-x: visible;
    padding-right: 15px;
    padding-left: 15px;
    border-top: 1px solid transparent;
    -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, .1);
    box-shadow: inset 0 1px 0 rgba(255, 255, 255, .1);
    -webkit-overflow-scrolling: touch
}

.navbar-collapse:after, .navbar-collapse:before {
    content: " ";
    display: table
}

.navbar-collapse:after {
    clear: both
}

.navbar-collapse.in {
    overflow-y: auto
}

@media (min-width: 768px) {
    .navbar-collapse {
        width: auto;
        border-top: 0;
        -webkit-box-shadow: none;
        box-shadow: none
    }

    .navbar-collapse.collapse {
        display: block !important;
        visibility: visible !important;
        height: auto !important;
        padding-bottom: 0;
        overflow: visible !important
    }

    .navbar-collapse.in {
        overflow-y: visible
    }

    .navbar-fixed-bottom .navbar-collapse, .navbar-fixed-top .navbar-collapse, .navbar-static-top .navbar-collapse {
        padding-left: 0;
        padding-right: 0
    }
}

.navbar-fixed-bottom .navbar-collapse, .navbar-fixed-top .navbar-collapse {
    max-height: 340px
}

@media (max-device-width: 480px) and (orientation: landscape) {
    .navbar-fixed-bottom .navbar-collapse, .navbar-fixed-top .navbar-collapse {
        max-height: 200px
    }
}

.container-fluid > .navbar-collapse, .container-fluid > .navbar-header, .container > .navbar-collapse, .container > .navbar-header {
    margin-right: -15px;
    margin-left: -15px
}

@media (min-width: 768px) {
    .container-fluid > .navbar-collapse, .container-fluid > .navbar-header, .container > .navbar-collapse, .container > .navbar-header {
        margin-right: 0;
        margin-left: 0
    }
}

.navbar-static-top {
    z-index: 1000;
    border-width: 0 0 1px
}

@media (min-width: 768px) {
    .navbar-static-top {
        border-radius: 0
    }
}

.navbar-fixed-bottom, .navbar-fixed-top {
    position: fixed;
    right: 0;
    left: 0;
    z-index: 1030
}

@media (min-width: 768px) {
    .navbar-fixed-bottom, .navbar-fixed-top {
        border-radius: 0
    }
}

.navbar-fixed-top {
    top: 0;
    border-width: 0 0 1px
}

.navbar-fixed-bottom {
    bottom: 0;
    margin-bottom: 0;
    border-width: 1px 0 0
}

.navbar-brand {
    float: left;
    padding: 13.5px 15px;
    font-size: 18px;
    line-height: 23px;
    height: 50px
}

.navbar-brand:focus, .navbar-brand:hover {
    text-decoration: none
}

.navbar-brand > img {
    display: block
}

@media (min-width: 768px) {
    .navbar > .container .navbar-brand, .navbar > .container-fluid .navbar-brand {
        margin-left: -15px
    }
}

.navbar-toggle {
    position: relative;
    float: right;
    margin-right: 15px;
    padding: 9px 10px;
    margin-top: 8px;
    margin-bottom: 8px;
    background-color: transparent;
    background-image: none;
    border: 1px solid transparent;
    border-radius: 4px
}

.navbar-toggle:focus {
    outline: 0
}

.navbar-toggle .icon-bar {
    display: block;
    width: 22px;
    height: 2px;
    border-radius: 1px
}

.navbar-toggle .icon-bar + .icon-bar {
    margin-top: 4px
}

@media (min-width: 768px) {
    .navbar-toggle {
        display: none
    }
}

.navbar-nav {
    margin: 6.75px -15px
}

.navbar-nav > li > a {
    padding-top: 10px;
    padding-bottom: 10px;
    line-height: 23px
}

@media (max-width: 767px) {
    .navbar-nav .open .dropdown-menu {
        position: static;
        float: none;
        width: auto;
        margin-top: 0;
        background-color: transparent;
        border: 0;
        -webkit-box-shadow: none;
        box-shadow: none
    }

    .navbar-nav .open .dropdown-menu .dropdown-header, .navbar-nav .open .dropdown-menu > li > a {
        padding: 5px 15px 5px 25px
    }

    .navbar-nav .open .dropdown-menu > li > a {
        line-height: 23px
    }

    .navbar-nav .open .dropdown-menu > li > a:focus, .navbar-nav .open .dropdown-menu > li > a:hover {
        background-image: none
    }
}

@media (min-width: 768px) {
    .navbar-nav {
        float: left;
        margin: 0
    }

    .navbar-nav > li {
        float: left
    }

    .navbar-nav > li > a {
        padding-top: 13.5px;
        padding-bottom: 13.5px
    }
}

.navbar-form {
    margin-left: -15px;
    margin-right: -15px;
    padding: 10px 15px;
    border-top: 1px solid transparent;
    border-bottom: 1px solid transparent;
    -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, .1), 0 1px 0 rgba(255, 255, 255, .1);
    box-shadow: inset 0 1px 0 rgba(255, 255, 255, .1), 0 1px 0 rgba(255, 255, 255, .1);
    margin-top: 6.5px;
    margin-bottom: 6.5px
}

@media (min-width: 768px) {
    .navbar-form .form-group {
        display: inline-block;
        margin-bottom: 0;
        vertical-align: middle
    }

    .navbar-form .form-control {
        display: inline-block;
        width: auto;
        vertical-align: middle
    }

    .navbar-form .form-control-static {
        display: inline-block
    }

    .navbar-form .input-group {
        display: inline-table;
        vertical-align: middle
    }

    .navbar-form .input-group .form-control, .navbar-form .input-group .input-group-addon, .navbar-form .input-group .input-group-btn {
        width: auto
    }

    .navbar-form .input-group > .form-control {
        width: 100%
    }

    .navbar-form .control-label {
        margin-bottom: 0;
        vertical-align: middle
    }

    .navbar-form .checkbox, .navbar-form .radio {
        display: inline-block;
        margin-top: 0;
        margin-bottom: 0;
        vertical-align: middle
    }

    .navbar-form .checkbox label, .navbar-form .radio label {
        padding-left: 0
    }

    .navbar-form .checkbox input[type=checkbox], .navbar-form .radio input[type=radio] {
        position: relative;
        margin-left: 0
    }

    .navbar-form .has-feedback .form-control-feedback {
        top: 0
    }
}

@media (max-width: 767px) {
    .navbar-form .form-group {
        margin-bottom: 5px
    }

    .navbar-form .form-group:last-child {
        margin-bottom: 0
    }
}

@media (min-width: 768px) {
    .navbar-form {
        width: auto;
        border: 0;
        margin-left: 0;
        margin-right: 0;
        padding-top: 0;
        padding-bottom: 0;
        -webkit-box-shadow: none;
        box-shadow: none
    }
}

.navbar-nav > li > .dropdown-menu {
    margin-top: 0;
    border-top-right-radius: 0;
    border-top-left-radius: 0
}

.navbar-fixed-bottom .navbar-nav > li > .dropdown-menu {
    border-top-right-radius: 4px;
    border-top-left-radius: 4px;
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0
}

.navbar-btn {
    margin-top: 6.5px;
    margin-bottom: 6.5px
}

.btn-group-sm > .navbar-btn.btn, .navbar-btn.btn-sm {
    margin-top: 8.5px;
    margin-bottom: 8.5px
}

.btn-group-xs > .navbar-btn.btn, .navbar-btn.btn-xs {
    margin-top: 14px;
    margin-bottom: 14px
}

.navbar-text {
    margin-top: 13.5px;
    margin-bottom: 13.5px
}

@media (min-width: 768px) {
    .navbar-text {
        float: left;
        margin-left: 15px;
        margin-right: 15px
    }
}

@media (min-width: 768px) {
    .navbar-left {
        float: left !important
    }

    .navbar-right {
        float: right !important;
        margin-right: -15px
    }

    .navbar-right ~ .navbar-right {
        margin-right: 0
    }
}

.navbar-default {
    background-color: #f8f8f8;
    border-color: #e7e7e7
}

.navbar-default .navbar-brand {
    color: #777
}

.navbar-default .navbar-brand:focus, .navbar-default .navbar-brand:hover {
    color: #5e5e5e;
    background-color: transparent
}

.navbar-default .navbar-nav > li > a, .navbar-default .navbar-text {
    color: #777
}

.navbar-default .navbar-nav > li > a:focus, .navbar-default .navbar-nav > li > a:hover {
    color: #333;
    background-color: transparent
}

.navbar-default .navbar-nav > .active > a, .navbar-default .navbar-nav > .active > a:focus, .navbar-default .navbar-nav > .active > a:hover {
    color: #555;
    background-color: #e7e7e7
}

.navbar-default .navbar-nav > .disabled > a, .navbar-default .navbar-nav > .disabled > a:focus, .navbar-default .navbar-nav > .disabled > a:hover {
    color: #ccc;
    background-color: transparent
}

.navbar-default .navbar-toggle {
    border-color: #ddd
}

.navbar-default .navbar-toggle:focus, .navbar-default .navbar-toggle:hover {
    background-color: #ddd
}

.navbar-default .navbar-toggle .icon-bar {
    background-color: #888
}

.navbar-default .navbar-collapse, .navbar-default .navbar-form {
    border-color: #e7e7e7
}

.navbar-default .navbar-nav > .open > a, .navbar-default .navbar-nav > .open > a:focus, .navbar-default .navbar-nav > .open > a:hover {
    background-color: #e7e7e7;
    color: #555
}

@media (max-width: 767px) {
    .navbar-default .navbar-nav .open .dropdown-menu > li > a {
        color: #777
    }

    .navbar-default .navbar-nav .open .dropdown-menu > li > a:focus, .navbar-default .navbar-nav .open .dropdown-menu > li > a:hover {
        color: #333;
        background-color: transparent
    }

    .navbar-default .navbar-nav .open .dropdown-menu > .active > a, .navbar-default .navbar-nav .open .dropdown-menu > .active > a:focus, .navbar-default .navbar-nav .open .dropdown-menu > .active > a:hover {
        color: #555;
        background-color: #e7e7e7
    }

    .navbar-default .navbar-nav .open .dropdown-menu > .disabled > a, .navbar-default .navbar-nav .open .dropdown-menu > .disabled > a:focus, .navbar-default .navbar-nav .open .dropdown-menu > .disabled > a:hover {
        color: #ccc;
        background-color: transparent
    }
}

.navbar-default .navbar-link {
    color: #777
}

.navbar-default .navbar-link:hover {
    color: #333
}

.navbar-default .btn-link {
    color: #777
}

.navbar-default .btn-link:focus, .navbar-default .btn-link:hover {
    color: #333
}

.navbar-default .btn-link[disabled]:focus, .navbar-default .btn-link[disabled]:hover, fieldset[disabled] .navbar-default .btn-link:focus, fieldset[disabled] .navbar-default .btn-link:hover {
    color: #ccc
}

.navbar-inverse {
    background-color: #222;
    border-color: #090909
}

.navbar-inverse .navbar-brand {
    color: #9c9c9c
}

.navbar-inverse .navbar-brand:focus, .navbar-inverse .navbar-brand:hover {
    color: #fff;
    background-color: transparent
}

.navbar-inverse .navbar-nav > li > a, .navbar-inverse .navbar-text {
    color: #9c9c9c
}

.navbar-inverse .navbar-nav > li > a:focus, .navbar-inverse .navbar-nav > li > a:hover {
    color: #fff;
    background-color: transparent
}

.navbar-inverse .navbar-nav > .active > a, .navbar-inverse .navbar-nav > .active > a:focus, .navbar-inverse .navbar-nav > .active > a:hover {
    color: #fff;
    background-color: #090909
}

.navbar-inverse .navbar-nav > .disabled > a, .navbar-inverse .navbar-nav > .disabled > a:focus, .navbar-inverse .navbar-nav > .disabled > a:hover {
    color: #444;
    background-color: transparent
}

.navbar-inverse .navbar-toggle {
    border-color: #333
}

.navbar-inverse .navbar-toggle:focus, .navbar-inverse .navbar-toggle:hover {
    background-color: #333
}

.navbar-inverse .navbar-toggle .icon-bar {
    background-color: #fff
}

.navbar-inverse .navbar-collapse, .navbar-inverse .navbar-form {
    border-color: #101010
}

.navbar-inverse .navbar-nav > .open > a, .navbar-inverse .navbar-nav > .open > a:focus, .navbar-inverse .navbar-nav > .open > a:hover {
    background-color: #090909;
    color: #fff
}

@media (max-width: 767px) {
    .navbar-inverse .navbar-nav .open .dropdown-menu > .dropdown-header {
        border-color: #090909
    }

    .navbar-inverse .navbar-nav .open .dropdown-menu .divider {
        background-color: #090909
    }

    .navbar-inverse .navbar-nav .open .dropdown-menu > li > a {
        color: #9c9c9c
    }

    .navbar-inverse .navbar-nav .open .dropdown-menu > li > a:focus, .navbar-inverse .navbar-nav .open .dropdown-menu > li > a:hover {
        color: #fff;
        background-color: transparent
    }

    .navbar-inverse .navbar-nav .open .dropdown-menu > .active > a, .navbar-inverse .navbar-nav .open .dropdown-menu > .active > a:focus, .navbar-inverse .navbar-nav .open .dropdown-menu > .active > a:hover {
        color: #fff;
        background-color: #090909
    }

    .navbar-inverse .navbar-nav .open .dropdown-menu > .disabled > a, .navbar-inverse .navbar-nav .open .dropdown-menu > .disabled > a:focus, .navbar-inverse .navbar-nav .open .dropdown-menu > .disabled > a:hover {
        color: #444;
        background-color: transparent
    }
}

.navbar-inverse .navbar-link {
    color: #9c9c9c
}

.navbar-inverse .navbar-link:hover {
    color: #fff
}

.navbar-inverse .btn-link {
    color: #9c9c9c
}

.navbar-inverse .btn-link:focus, .navbar-inverse .btn-link:hover {
    color: #fff
}

.navbar-inverse .btn-link[disabled]:focus, .navbar-inverse .btn-link[disabled]:hover, fieldset[disabled] .navbar-inverse .btn-link:focus, fieldset[disabled] .navbar-inverse .btn-link:hover {
    color: #444
}

.breadcrumb {
    padding: 8px 15px;
    margin-bottom: 23px;
    list-style: none;
    background-color: transparent;
    border-radius: 4px
}

.breadcrumb > li {
    display: inline-block
}

.breadcrumb > li + li:before {
    content: "/ ";
    padding: 0 5px;
    color: #ccc
}

.breadcrumb > .active {
    color: #767676
}

.pagination {
    display: inline-block;
    padding-left: 0;
    margin: 23px 0;
    border-radius: 4px
}

.pagination > li {
    display: inline
}

.pagination > li > a, .pagination > li > span {
    position: relative;
    float: left;
    padding: 6px 12px;
    line-height: 1.4375;
    text-decoration: none;
    color: #335075;
    background-color: #eaebed;
    border: 1px solid #dcdee1;
    margin-left: -1px
}

.pagination > li:first-child > a, .pagination > li:first-child > span {
    margin-left: 0;
    border-bottom-left-radius: 4px;
    border-top-left-radius: 4px
}

.pagination > li:last-child > a, .pagination > li:last-child > span {
    border-bottom-right-radius: 4px;
    border-top-right-radius: 4px
}

.pagination > li > a:focus, .pagination > li > a:hover, .pagination > li > span:focus, .pagination > li > span:hover {
    color: #335075;
    background-color: #d4d6da;
    border-color: #bbbfc5
}

.pagination > .active > a, .pagination > .active > a:focus, .pagination > .active > a:hover, .pagination > .active > span, .pagination > .active > span:focus, .pagination > .active > span:hover {
    z-index: 2;
    color: #fff;
    background-color: #2572b4;
    border-color: #2572b4;
    cursor: default
}

.pagination > .disabled > a, .pagination > .disabled > a:focus, .pagination > .disabled > a:hover, .pagination > .disabled > span, .pagination > .disabled > span:focus, .pagination > .disabled > span:hover {
    color: #767676;
    background-color: #fff;
    border-color: #ddd;
    cursor: not-allowed
}

.pagination-lg > li > a, .pagination-lg > li > span {
    padding: 10px 16px;
    font-size: 18px
}

.pagination-lg > li:first-child > a, .pagination-lg > li:first-child > span {
    border-bottom-left-radius: 6px;
    border-top-left-radius: 6px
}

.pagination-lg > li:last-child > a, .pagination-lg > li:last-child > span {
    border-bottom-right-radius: 6px;
    border-top-right-radius: 6px
}

.pagination-sm > li > a, .pagination-sm > li > span {
    padding: 5px 10px;
    font-size: 14px
}

.pagination-sm > li:first-child > a, .pagination-sm > li:first-child > span {
    border-bottom-left-radius: 3px;
    border-top-left-radius: 3px
}

.pagination-sm > li:last-child > a, .pagination-sm > li:last-child > span {
    border-bottom-right-radius: 3px;
    border-top-right-radius: 3px
}

.pager {
    padding-left: 0;
    margin: 23px 0;
    list-style: none;
    text-align: center
}

.pager:after, .pager:before {
    content: " ";
    display: table
}

.pager:after {
    clear: both
}

.pager li {
    display: inline
}

.pager li > a, .pager li > span {
    display: inline-block;
    padding: 5px 14px;
    background-color: #eaebed;
    border: 1px solid #dcdee1;
    border-radius: 4px
}

.pager li > a:focus, .pager li > a:hover {
    text-decoration: none;
    background-color: #d4d6da
}

.pager .next > a, .pager .next > span {
    float: right
}

.pager .previous > a, .pager .previous > span {
    float: left
}

.pager .disabled > a, .pager .disabled > a:focus, .pager .disabled > a:hover, .pager .disabled > span {
    color: #767676;
    background-color: #eaebed;
    cursor: not-allowed
}

.label {
    display: inline;
    padding: .2em .6em .3em;
    font-size: 75%;
    font-weight: 700;
    line-height: 1;
    color: #fff;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline
}

.label:empty {
    display: none
}

.btn .label {
    position: relative;
    top: -1px
}

a.label:focus, a.label:hover {
    color: #fff;
    text-decoration: none;
    cursor: pointer
}

.badge {
    display: inline-block;
    min-width: 10px;
    padding: 3px 7px;
    font-size: 14px;
    font-weight: 700;
    color: #fff;
    line-height: 1;
    vertical-align: baseline;
    white-space: nowrap;
    text-align: center;
    background-color: #767676;
    border-radius: 10px
}

.badge:empty {
    display: none
}

.btn .badge {
    position: relative;
    top: -1px
}

.btn-group-xs > .btn .badge, .btn-xs .badge {
    top: 0;
    padding: 1px 5px
}

.list-group-item.active > .badge, .nav-pills > .active > a > .badge {
    color: #295376;
    background-color: #fff
}

.list-group-item > .badge {
    float: right
}

.list-group-item > .badge + .badge {
    margin-right: 5px
}

.nav-pills > li > a > .badge {
    margin-left: 3px
}

a.badge:focus, a.badge:hover {
    color: #fff;
    text-decoration: none;
    cursor: pointer
}

.jumbotron {
    padding: 30px 15px;
    margin-bottom: 30px;
    color: inherit;
    background-color: #eee
}

.jumbotron .h1, .jumbotron h1 {
    color: inherit
}

.jumbotron p {
    margin-bottom: 15px;
    font-size: 24px;
    font-weight: 200
}

.jumbotron > hr {
    border-top-color: #d5d5d5
}

.container .jumbotron, .container-fluid .jumbotron {
    border-radius: 6px
}

.jumbotron .container {
    max-width: 100%
}

@media screen and (min-width: 768px) {
    .jumbotron {
        padding: 48px 0
    }

    .container .jumbotron, .container-fluid .jumbotron {
        padding-left: 60px;
        padding-right: 60px
    }

    .jumbotron .h1, .jumbotron h1 {
        font-size: 72px
    }
}

.thumbnail {
    display: block;
    margin-bottom: 23px;
    line-height: 1.4375;
    border: 1px solid #ddd;
    -webkit-transition: border .2s ease-in-out;
    transition: border .2s ease-in-out
}

.thumbnail a > img, .thumbnail > img {
    display: block;
    max-width: 100%;
    height: auto;
    margin-left: auto;
    margin-right: auto
}

.thumbnail .caption {
    padding: 9px;
    color: #333
}

a.thumbnail.active, a.thumbnail:focus, a.thumbnail:hover {
    border-color: #295376
}

.alert {
    padding: 15px;
    margin-bottom: 23px;
    border: 1px solid transparent
}

.alert h4 {
    margin-top: 0;
    color: inherit
}

.alert .alert-link {
    font-weight: 700
}

.alert > p, .alert > ul {
    margin-bottom: 0
}

.alert > p + p {
    margin-top: 5px
}

.alert-dismissable, .alert-dismissible {
    padding-right: 35px
}

.alert-dismissable .close, .alert-dismissible .close {
    position: relative;
    top: -2px;
    right: -21px;
    color: inherit
}

.alert-success hr {
    border-top-color: #c9e2b3
}

.alert-success .alert-link {
    color: #2b542c
}

.alert-info hr {
    border-top-color: #a6e1ec
}

.alert-info .alert-link {
    color: #245269
}

.alert-warning hr {
    border-top-color: #f7e1b5
}

.alert-warning .alert-link {
    color: #66512c
}

.alert-danger hr {
    border-top-color: #e4b9c0
}

.alert-danger .alert-link {
    color: #843534
}

@-webkit-keyframes progress-bar-stripes {
    from {
        background-position: 40px 0
    }
    to {
        background-position: 0 0
    }
}

@keyframes progress-bar-stripes {
    from {
        background-position: 40px 0
    }
    to {
        background-position: 0 0
    }
}

.progress {
    overflow: hidden;
    height: 23px;
    margin-bottom: 23px;
    background-color: #f5f5f5;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, .1);
    box-shadow: inset 0 1px 2px rgba(0, 0, 0, .1)
}

.progress-bar {
    float: left;
    width: 0;
    height: 100%;
    font-size: 14px;
    line-height: 23px;
    color: #fff;
    text-align: center;
    background-color: #2572b4;
    -webkit-box-shadow: inset 0 -1px 0 rgba(0, 0, 0, .15);
    box-shadow: inset 0 -1px 0 rgba(0, 0, 0, .15);
    -webkit-transition: width .6s ease;
    transition: width .6s ease
}

.progress-bar-striped, .progress-striped .progress-bar {
    background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
    background-image: linear-gradient(45deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
    -webkit-background-size: 40px 40px;
    background-size: 40px 40px
}

.progress-bar.active, .progress.active .progress-bar {
    -webkit-animation: progress-bar-stripes 2s linear infinite;
    animation: progress-bar-stripes 2s linear infinite
}

.progress-bar-success {
    background-color: #1b6c1c
}

.progress-striped .progress-bar-success {
    background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
    background-image: linear-gradient(45deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent)
}

.progress-bar-info {
    background-color: #4d4d4d
}

.progress-striped .progress-bar-info {
    background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
    background-image: linear-gradient(45deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent)
}

.progress-bar-warning {
    background-color: #f2d40d
}

.progress-striped .progress-bar-warning {
    background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
    background-image: linear-gradient(45deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent)
}

.progress-bar-danger {
    background-color: #bc3331
}

.progress-striped .progress-bar-danger {
    background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);
    background-image: linear-gradient(45deg, rgba(255, 255, 255, .15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%, transparent 75%, transparent)
}

.media {
    margin-top: 15px
}

.media:first-child {
    margin-top: 0
}

.media-right, .media > .pull-right {
    padding-left: 10px
}

.media-left, .media > .pull-left {
    padding-right: 10px
}

.media-body, .media-left, .media-right {
    display: table-cell;
    vertical-align: top
}

.media-middle {
    vertical-align: middle
}

.media-bottom {
    vertical-align: bottom
}

.media-heading {
    margin-top: 0;
    margin-bottom: 5px
}

.media-list {
    padding-left: 0;
    list-style: none
}

.list-group {
    margin-bottom: 20px;
    padding-left: 0
}

.list-group-item {
    position: relative;
    display: block;
    padding: 10px 15px;
    margin-bottom: -1px;
    background-color: #fff;
    border: 1px solid #ddd
}

.list-group-item:first-child {
    border-top-right-radius: 4px;
    border-top-left-radius: 4px
}

.list-group-item:last-child {
    margin-bottom: 0;
    border-bottom-right-radius: 4px;
    border-bottom-left-radius: 4px
}

a.list-group-item {
    color: #555
}

a.list-group-item .list-group-item-heading {
    color: #333
}

a.list-group-item:focus, a.list-group-item:hover {
    text-decoration: none;
    color: #555;
    background-color: #f5f5f5
}

.list-group-item.disabled, .list-group-item.disabled:focus, .list-group-item.disabled:hover {
    background-color: #eee;
    color: #767676;
    cursor: not-allowed
}

.list-group-item.disabled .list-group-item-heading, .list-group-item.disabled:focus .list-group-item-heading, .list-group-item.disabled:hover .list-group-item-heading {
    color: inherit
}

.list-group-item.disabled .list-group-item-text, .list-group-item.disabled:focus .list-group-item-text, .list-group-item.disabled:hover .list-group-item-text {
    color: #767676
}

.list-group-item.active, .list-group-item.active:focus, .list-group-item.active:hover {
    z-index: 2;
    color: #fff;
    background-color: #2572b4;
    border-color: #2572b4
}

.list-group-item.active .list-group-item-heading, .list-group-item.active .list-group-item-heading > .small, .list-group-item.active .list-group-item-heading > small, .list-group-item.active:focus .list-group-item-heading, .list-group-item.active:focus .list-group-item-heading > .small, .list-group-item.active:focus .list-group-item-heading > small, .list-group-item.active:hover .list-group-item-heading, .list-group-item.active:hover .list-group-item-heading > .small, .list-group-item.active:hover .list-group-item-heading > small {
    color: inherit
}

.list-group-item.active .list-group-item-text, .list-group-item.active:focus .list-group-item-text, .list-group-item.active:hover .list-group-item-text {
    color: #b5d5f0
}

.list-group-item-success {
    color: #3c763d;
    background-color: #dff0d8
}

a.list-group-item-success {
    color: #3c763d
}

a.list-group-item-success .list-group-item-heading {
    color: inherit
}

a.list-group-item-success:focus, a.list-group-item-success:hover {
    color: #3c763d;
    background-color: #d0e9c6
}

a.list-group-item-success.active, a.list-group-item-success.active:focus, a.list-group-item-success.active:hover {
    color: #fff;
    background-color: #3c763d;
    border-color: #3c763d
}

.list-group-item-info {
    color: #31708f;
    background-color: #d9edf7
}

a.list-group-item-info {
    color: #31708f
}

a.list-group-item-info .list-group-item-heading {
    color: inherit
}

a.list-group-item-info:focus, a.list-group-item-info:hover {
    color: #31708f;
    background-color: #c4e3f3
}

a.list-group-item-info.active, a.list-group-item-info.active:focus, a.list-group-item-info.active:hover {
    color: #fff;
    background-color: #31708f;
    border-color: #31708f
}

.list-group-item-warning {
    color: #8a6d3b;
    background-color: #fcf8e3
}

a.list-group-item-warning {
    color: #8a6d3b
}

a.list-group-item-warning .list-group-item-heading {
    color: inherit
}

a.list-group-item-warning:focus, a.list-group-item-warning:hover {
    color: #8a6d3b;
    background-color: #faf2cc
}

a.list-group-item-warning.active, a.list-group-item-warning.active:focus, a.list-group-item-warning.active:hover {
    color: #fff;
    background-color: #8a6d3b;
    border-color: #8a6d3b
}

.list-group-item-danger {
    color: #a94442;
    background-color: #f2dede
}

a.list-group-item-danger {
    color: #a94442
}

a.list-group-item-danger .list-group-item-heading {
    color: inherit
}

a.list-group-item-danger:focus, a.list-group-item-danger:hover {
    color: #a94442;
    background-color: #ebcccc
}

a.list-group-item-danger.active, a.list-group-item-danger.active:focus, a.list-group-item-danger.active:hover {
    color: #fff;
    background-color: #a94442;
    border-color: #a94442
}

.list-group-item-heading {
    margin-top: 0;
    margin-bottom: 5px
}

.list-group-item-text {
    margin-bottom: 0;
    line-height: 1.3
}

.panel {
    margin-bottom: 23px;
    background-color: #fff;
    border: 1px solid transparent;
    border-radius: 4px;
    -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
    box-shadow: 0 1px 1px rgba(0, 0, 0, .05)
}

.panel-body {
    padding: 15px
}

.panel-body:after, .panel-body:before {
    content: " ";
    display: table
}

.panel-body:after {
    clear: both
}

.panel-heading {
    padding: 10px 15px;
    border-bottom: 1px solid transparent;
    border-top-right-radius: 3px;
    border-top-left-radius: 3px
}

.panel-heading > .dropdown .dropdown-toggle {
    color: inherit
}

.panel-title {
    margin-top: 0;
    margin-bottom: 0;
    font-size: 18px;
    color: inherit
}

.panel-title > a {
    color: inherit
}

.panel-footer {
    padding: 10px 15px;
    background-color: #f5f5f5;
    border-top: 1px solid #ddd;
    border-bottom-right-radius: 3px;
    border-bottom-left-radius: 3px
}

.panel > .list-group, .panel > .panel-collapse > .list-group {
    margin-bottom: 0
}

.panel > .list-group .list-group-item, .panel > .panel-collapse > .list-group .list-group-item {
    border-width: 1px 0;
    border-radius: 0
}

.panel > .list-group:first-child .list-group-item:first-child, .panel > .panel-collapse > .list-group:first-child .list-group-item:first-child {
    border-top: 0;
    border-top-right-radius: 3px;
    border-top-left-radius: 3px
}

.panel > .list-group:last-child .list-group-item:last-child, .panel > .panel-collapse > .list-group:last-child .list-group-item:last-child {
    border-bottom: 0;
    border-bottom-right-radius: 3px;
    border-bottom-left-radius: 3px
}

.list-group + .panel-footer, .panel-heading + .list-group .list-group-item:first-child {
    border-top-width: 0
}

.panel > .panel-collapse > .table, .panel > .table, .panel > .table-responsive > .table {
    margin-bottom: 0
}

.panel > .panel-collapse > .table caption, .panel > .table caption, .panel > .table-responsive > .table caption {
    padding-left: 15px;
    padding-right: 15px
}

.panel > .table-responsive:first-child > .table:first-child, .panel > .table:first-child {
    border-top-right-radius: 3px;
    border-top-left-radius: 3px
}

.panel > .table-responsive:first-child > .table:first-child > tbody:first-child > tr:first-child, .panel > .table-responsive:first-child > .table:first-child > thead:first-child > tr:first-child, .panel > .table:first-child > tbody:first-child > tr:first-child, .panel > .table:first-child > thead:first-child > tr:first-child {
    border-top-left-radius: 3px;
    border-top-right-radius: 3px
}

.panel > .table-responsive:first-child > .table:first-child > tbody:first-child > tr:first-child td:first-child, .panel > .table-responsive:first-child > .table:first-child > tbody:first-child > tr:first-child th:first-child, .panel > .table-responsive:first-child > .table:first-child > thead:first-child > tr:first-child td:first-child, .panel > .table-responsive:first-child > .table:first-child > thead:first-child > tr:first-child th:first-child, .panel > .table:first-child > tbody:first-child > tr:first-child td:first-child, .panel > .table:first-child > tbody:first-child > tr:first-child th:first-child, .panel > .table:first-child > thead:first-child > tr:first-child td:first-child, .panel > .table:first-child > thead:first-child > tr:first-child th:first-child {
    border-top-left-radius: 3px
}

.panel > .table-responsive:first-child > .table:first-child > tbody:first-child > tr:first-child td:last-child, .panel > .table-responsive:first-child > .table:first-child > tbody:first-child > tr:first-child th:last-child, .panel > .table-responsive:first-child > .table:first-child > thead:first-child > tr:first-child td:last-child, .panel > .table-responsive:first-child > .table:first-child > thead:first-child > tr:first-child th:last-child, .panel > .table:first-child > tbody:first-child > tr:first-child td:last-child, .panel > .table:first-child > tbody:first-child > tr:first-child th:last-child, .panel > .table:first-child > thead:first-child > tr:first-child td:last-child, .panel > .table:first-child > thead:first-child > tr:first-child th:last-child {
    border-top-right-radius: 3px
}

.panel > .table-responsive:last-child > .table:last-child, .panel > .table:last-child {
    border-bottom-right-radius: 3px;
    border-bottom-left-radius: 3px
}

.panel > .table-responsive:last-child > .table:last-child > tbody:last-child > tr:last-child, .panel > .table-responsive:last-child > .table:last-child > tfoot:last-child > tr:last-child, .panel > .table:last-child > tbody:last-child > tr:last-child, .panel > .table:last-child > tfoot:last-child > tr:last-child {
    border-bottom-left-radius: 3px;
    border-bottom-right-radius: 3px
}

.panel > .table-responsive:last-child > .table:last-child > tbody:last-child > tr:last-child td:first-child, .panel > .table-responsive:last-child > .table:last-child > tbody:last-child > tr:last-child th:first-child, .panel > .table-responsive:last-child > .table:last-child > tfoot:last-child > tr:last-child td:first-child, .panel > .table-responsive:last-child > .table:last-child > tfoot:last-child > tr:last-child th:first-child, .panel > .table:last-child > tbody:last-child > tr:last-child td:first-child, .panel > .table:last-child > tbody:last-child > tr:last-child th:first-child, .panel > .table:last-child > tfoot:last-child > tr:last-child td:first-child, .panel > .table:last-child > tfoot:last-child > tr:last-child th:first-child {
    border-bottom-left-radius: 3px
}

.panel > .table-responsive:last-child > .table:last-child > tbody:last-child > tr:last-child td:last-child, .panel > .table-responsive:last-child > .table:last-child > tbody:last-child > tr:last-child th:last-child, .panel > .table-responsive:last-child > .table:last-child > tfoot:last-child > tr:last-child td:last-child, .panel > .table-responsive:last-child > .table:last-child > tfoot:last-child > tr:last-child th:last-child, .panel > .table:last-child > tbody:last-child > tr:last-child td:last-child, .panel > .table:last-child > tbody:last-child > tr:last-child th:last-child, .panel > .table:last-child > tfoot:last-child > tr:last-child td:last-child, .panel > .table:last-child > tfoot:last-child > tr:last-child th:last-child {
    border-bottom-right-radius: 3px
}

.panel > .panel-body + .table, .panel > .panel-body + .table-responsive, .panel > .table + .panel-body, .panel > .table-responsive + .panel-body {
    border-top: 1px solid #ddd
}

.panel > .table > tbody:first-child > tr:first-child td, .panel > .table > tbody:first-child > tr:first-child th {
    border-top: 0
}

.panel > .table-bordered, .panel > .table-responsive > .table-bordered {
    border: 0
}

.panel > .table-bordered > tbody > tr > td:first-child, .panel > .table-bordered > tbody > tr > th:first-child, .panel > .table-bordered > tfoot > tr > td:first-child, .panel > .table-bordered > tfoot > tr > th:first-child, .panel > .table-bordered > thead > tr > td:first-child, .panel > .table-bordered > thead > tr > th:first-child, .panel > .table-responsive > .table-bordered > tbody > tr > td:first-child, .panel > .table-responsive > .table-bordered > tbody > tr > th:first-child, .panel > .table-responsive > .table-bordered > tfoot > tr > td:first-child, .panel > .table-responsive > .table-bordered > tfoot > tr > th:first-child, .panel > .table-responsive > .table-bordered > thead > tr > td:first-child, .panel > .table-responsive > .table-bordered > thead > tr > th:first-child {
    border-left: 0
}

.panel > .table-bordered > tbody > tr > td:last-child, .panel > .table-bordered > tbody > tr > th:last-child, .panel > .table-bordered > tfoot > tr > td:last-child, .panel > .table-bordered > tfoot > tr > th:last-child, .panel > .table-bordered > thead > tr > td:last-child, .panel > .table-bordered > thead > tr > th:last-child, .panel > .table-responsive > .table-bordered > tbody > tr > td:last-child, .panel > .table-responsive > .table-bordered > tbody > tr > th:last-child, .panel > .table-responsive > .table-bordered > tfoot > tr > td:last-child, .panel > .table-responsive > .table-bordered > tfoot > tr > th:last-child, .panel > .table-responsive > .table-bordered > thead > tr > td:last-child, .panel > .table-responsive > .table-bordered > thead > tr > th:last-child {
    border-right: 0
}

.panel > .table-bordered > tbody > tr:first-child > td, .panel > .table-bordered > tbody > tr:first-child > th, .panel > .table-bordered > tbody > tr:last-child > td, .panel > .table-bordered > tbody > tr:last-child > th, .panel > .table-bordered > tfoot > tr:last-child > td, .panel > .table-bordered > tfoot > tr:last-child > th, .panel > .table-bordered > thead > tr:first-child > td, .panel > .table-bordered > thead > tr:first-child > th, .panel > .table-responsive > .table-bordered > tbody > tr:first-child > td, .panel > .table-responsive > .table-bordered > tbody > tr:first-child > th, .panel > .table-responsive > .table-bordered > tbody > tr:last-child > td, .panel > .table-responsive > .table-bordered > tbody > tr:last-child > th, .panel > .table-responsive > .table-bordered > tfoot > tr:last-child > td, .panel > .table-responsive > .table-bordered > tfoot > tr:last-child > th, .panel > .table-responsive > .table-bordered > thead > tr:first-child > td, .panel > .table-responsive > .table-bordered > thead > tr:first-child > th {
    border-bottom: 0
}

.panel > .table-responsive {
    border: 0;
    margin-bottom: 0
}

.panel-group {
    margin-bottom: 23px
}

.panel-group .panel {
    margin-bottom: 0;
    border-radius: 4px
}

.panel-group .panel + .panel {
    margin-top: 5px
}

.panel-group .panel-heading {
    border-bottom: 0
}

.panel-group .panel-heading + .panel-collapse > .list-group, .panel-group .panel-heading + .panel-collapse > .panel-body {
    border-top: 1px solid #ddd
}

.panel-group .panel-footer {
    border-top: 0
}

.panel-group .panel-footer + .panel-collapse .panel-body {
    border-bottom: 1px solid #ddd
}

.panel-default {
    border-color: #ddd
}

.panel-default > .panel-heading {
    color: #333;
    background-color: #f5f5f5;
    border-color: #ddd
}

.panel-default > .panel-heading + .panel-collapse > .panel-body {
    border-top-color: #ddd
}

.panel-default > .panel-heading .badge {
    color: #f5f5f5;
    background-color: #333
}

.panel-default > .panel-footer + .panel-collapse > .panel-body {
    border-bottom-color: #ddd
}

.panel-primary {
    border-color: #2572b4
}

.panel-primary > .panel-heading {
    color: #fff;
    background-color: #2572b4;
    border-color: #2572b4
}

.panel-primary > .panel-heading + .panel-collapse > .panel-body {
    border-top-color: #2572b4
}

.panel-primary > .panel-heading .badge {
    color: #2572b4;
    background-color: #fff
}

.panel-primary > .panel-footer + .panel-collapse > .panel-body {
    border-bottom-color: #2572b4
}

.panel-success {
    border-color: #d6e9c6
}

.panel-success > .panel-heading {
    color: #3c763d;
    background-color: #dff0d8;
    border-color: #d6e9c6
}

.panel-success > .panel-heading + .panel-collapse > .panel-body {
    border-top-color: #d6e9c6
}

.panel-success > .panel-heading .badge {
    color: #dff0d8;
    background-color: #3c763d
}

.panel-success > .panel-footer + .panel-collapse > .panel-body {
    border-bottom-color: #d6e9c6
}

.panel-info {
    border-color: #bce8f1
}

.panel-info > .panel-heading {
    color: #31708f;
    background-color: #d9edf7;
    border-color: #bce8f1
}

.panel-info > .panel-heading + .panel-collapse > .panel-body {
    border-top-color: #bce8f1
}

.panel-info > .panel-heading .badge {
    color: #d9edf7;
    background-color: #31708f
}

.panel-info > .panel-footer + .panel-collapse > .panel-body {
    border-bottom-color: #bce8f1
}

.panel-warning {
    border-color: #faebcc
}

.panel-warning > .panel-heading {
    color: #8a6d3b;
    background-color: #fcf8e3;
    border-color: #faebcc
}

.panel-warning > .panel-heading + .panel-collapse > .panel-body {
    border-top-color: #faebcc
}

.panel-warning > .panel-heading .badge {
    color: #fcf8e3;
    background-color: #8a6d3b
}

.panel-warning > .panel-footer + .panel-collapse > .panel-body {
    border-bottom-color: #faebcc
}

.panel-danger {
    border-color: #ebccd1
}

.panel-danger > .panel-heading {
    color: #a94442;
    background-color: #f2dede;
    border-color: #ebccd1
}

.panel-danger > .panel-heading + .panel-collapse > .panel-body {
    border-top-color: #ebccd1
}

.panel-danger > .panel-heading .badge {
    color: #f2dede;
    background-color: #a94442
}

.panel-danger > .panel-footer + .panel-collapse > .panel-body {
    border-bottom-color: #ebccd1
}

.embed-responsive {
    position: relative;
    display: block;
    height: 0;
    padding: 0;
    overflow: hidden
}

.embed-responsive .embed-responsive-item, .embed-responsive embed, .embed-responsive iframe, .embed-responsive object, .embed-responsive video {
    position: absolute;
    top: 0;
    left: 0;
    bottom: 0;
    height: 100%;
    width: 100%;
    border: 0
}

.embed-responsive.embed-responsive-16by9 {
    padding-bottom: 56.25%
}

.embed-responsive.embed-responsive-4by3 {
    padding-bottom: 75%
}

.well {
    min-height: 20px;
    padding: 19px;
    margin-bottom: 20px;
    background-color: #f5f5f5;
    border: 1px solid #e3e3e3;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .05);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .05)
}

.well blockquote {
    border-color: #ddd;
    border-color: rgba(0, 0, 0, .15)
}

.well-lg {
    padding: 24px;
    border-radius: 6px
}

.well-sm {
    padding: 9px;
    border-radius: 3px
}

.close {
    float: right;
    font-size: 24px;
    font-weight: 700;
    line-height: 1;
    color: #000;
    text-shadow: 0 1px 0 #fff;
    opacity: .2;
    filter: alpha(opacity=20)
}

.close:focus, .close:hover {
    color: #000;
    text-decoration: none;
    cursor: pointer;
    opacity: .5;
    filter: alpha(opacity=50)
}

button.close {
    padding: 0;
    cursor: pointer;
    background: 0 0;
    border: 0;
    -webkit-appearance: none
}

.modal-open {
    overflow: hidden
}

.modal {
    display: none;
    overflow: hidden;
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 1040;
    -webkit-overflow-scrolling: touch;
    outline: 0
}

.modal.fade .modal-dialog {
    -webkit-transform: translate(0, -25%);
    -ms-transform: translate(0, -25%);
    transform: translate(0, -25%);
    -webkit-transition: -webkit-transform .3s ease-out;
    transition: transform .3s ease-out
}

.modal.in .modal-dialog {
    -webkit-transform: translate(0, 0);
    -ms-transform: translate(0, 0);
    transform: translate(0, 0)
}

.modal-open .modal {
    overflow-x: hidden;
    overflow-y: auto
}

.modal-dialog {
    width: auto;
    margin: 10px
}

.modal-content {
    position: relative;
    border: 1px solid #999;
    border: 1px solid rgba(0, 0, 0, .2);
    border-radius: 6px;
    -webkit-box-shadow: 0 3px 9px rgba(0, 0, 0, .5);
    box-shadow: 0 3px 9px rgba(0, 0, 0, .5);
    -webkit-background-clip: padding-box;
    outline: 0
}

.modal-backdrop {
    position: absolute;
    top: 0;
    right: 0;
    left: 0;
    background-color: #000
}

.modal-backdrop.fade {
    opacity: 0;
    filter: alpha(opacity=0)
}

.modal-backdrop.in {
    opacity: .5;
    filter: alpha(opacity=50)
}

.modal-header {
    padding: 15px;
    border-bottom: 1px solid #e5e5e5;
    min-height: 16.44px
}

.modal-header .close {
    margin-top: -2px
}

.modal-title {
    margin: 0;
    line-height: 1.4375
}

.modal-body {
    position: relative;
    padding: 15px
}

.modal-footer {
    padding: 15px;
    text-align: right;
    border-top: 1px solid #e5e5e5
}

.modal-footer:after, .modal-footer:before {
    content: " ";
    display: table
}

.modal-footer:after {
    clear: both
}

.modal-footer .btn + .btn {
    margin-left: 5px;
    margin-bottom: 0
}

.modal-footer .btn-group .btn + .btn {
    margin-left: -1px
}

.modal-footer .btn-block + .btn-block {
    margin-left: 0
}

.modal-scrollbar-measure {
    position: absolute;
    top: -9999px;
    width: 50px;
    height: 50px;
    overflow: scroll
}

@media (min-width: 768px) {
    .modal-dialog {
        width: 600px;
        margin: 30px auto
    }

    .modal-content {
        -webkit-box-shadow: 0 5px 15px rgba(0, 0, 0, .5);
        box-shadow: 0 5px 15px rgba(0, 0, 0, .5)
    }

    .modal-sm {
        width: 300px
    }
}

@media (min-width: 992px) {
    .modal-lg {
        width: 900px
    }
}

.tooltip {
    position: absolute;
    z-index: 1070;
    display: block;
    visibility: visible;
    font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.4;
    opacity: 0;
    filter: alpha(opacity=0)
}

.tooltip.in {
    opacity: .9;
    filter: alpha(opacity=90)
}

.tooltip.top {
    margin-top: -3px;
    padding: 5px 0
}

.tooltip.right {
    margin-left: 3px;
    padding: 0 5px
}

.tooltip.bottom {
    margin-top: 3px;
    padding: 5px 0
}

.tooltip.left {
    margin-left: -3px;
    padding: 0 5px
}

.tooltip-inner {
    max-width: 200px;
    padding: 3px 8px;
    color: #fff;
    text-align: center;
    text-decoration: none;
    background-color: #000;
    border-radius: 4px
}

.tooltip-arrow {
    position: absolute;
    width: 0;
    height: 0;
    border-color: transparent;
    border-style: solid
}

.tooltip.top .tooltip-arrow {
    bottom: 0;
    left: 50%;
    margin-left: -5px;
    border-width: 5px 5px 0;
    border-top-color: #000
}

.tooltip.top-left .tooltip-arrow {
    bottom: 0;
    right: 5px;
    margin-bottom: -5px;
    border-width: 5px 5px 0;
    border-top-color: #000
}

.tooltip.top-right .tooltip-arrow {
    bottom: 0;
    left: 5px;
    margin-bottom: -5px;
    border-width: 5px 5px 0;
    border-top-color: #000
}

.tooltip.right .tooltip-arrow {
    top: 50%;
    left: 0;
    margin-top: -5px;
    border-width: 5px 5px 5px 0;
    border-right-color: #000
}

.tooltip.left .tooltip-arrow {
    top: 50%;
    right: 0;
    margin-top: -5px;
    border-width: 5px 0 5px 5px;
    border-left-color: #000
}

.tooltip.bottom .tooltip-arrow {
    top: 0;
    left: 50%;
    margin-left: -5px;
    border-width: 0 5px 5px;
    border-bottom-color: #000
}

.tooltip.bottom-left .tooltip-arrow {
    top: 0;
    right: 5px;
    margin-top: -5px;
    border-width: 0 5px 5px;
    border-bottom-color: #000
}

.tooltip.bottom-right .tooltip-arrow {
    top: 0;
    left: 5px;
    margin-top: -5px;
    border-width: 0 5px 5px;
    border-bottom-color: #000
}

.popover {
    position: absolute;
    top: 0;
    left: 0;
    z-index: 1060;
    display: none;
    max-width: 276px;
    padding: 1px;
    font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
    font-size: 16px;
    font-weight: 400;
    line-height: 1.4375;
    text-align: left;
    background-color: #fff;
    -webkit-background-clip: padding-box;
    background-clip: padding-box;
    border: 1px solid #ccc;
    border: 1px solid rgba(0, 0, 0, .2);
    border-radius: 6px;
    -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, .2);
    box-shadow: 0 5px 10px rgba(0, 0, 0, .2);
    white-space: normal
}

.popover.top {
    margin-top: -10px
}

.popover.right {
    margin-left: 10px
}

.popover.bottom {
    margin-top: 10px
}

.popover.left {
    margin-left: -10px
}

.popover-title {
    margin: 0;
    padding: 8px 14px;
    font-size: 16px;
    background-color: #f7f7f7;
    border-bottom: 1px solid #ebebeb;
    border-radius: 5px 5px 0 0
}

.popover-content {
    padding: 9px 14px
}

.popover > .arrow, .popover > .arrow:after {
    position: absolute;
    display: block;
    width: 0;
    height: 0;
    border-color: transparent;
    border-style: solid
}

.popover > .arrow {
    border-width: 11px
}

.popover > .arrow:after {
    border-width: 10px;
    content: ""
}

.popover.top > .arrow {
    left: 50%;
    margin-left: -11px;
    border-bottom-width: 0;
    border-top-color: #999;
    border-top-color: rgba(0, 0, 0, .25);
    bottom: -11px
}

.popover.top > .arrow:after {
    content: " ";
    bottom: 1px;
    margin-left: -10px;
    border-bottom-width: 0;
    border-top-color: #fff
}

.popover.right > .arrow {
    top: 50%;
    left: -11px;
    margin-top: -11px;
    border-left-width: 0;
    border-right-color: #999;
    border-right-color: rgba(0, 0, 0, .25)
}

.popover.right > .arrow:after {
    content: " ";
    left: 1px;
    bottom: -10px;
    border-left-width: 0;
    border-right-color: #fff
}

.popover.bottom > .arrow {
    left: 50%;
    margin-left: -11px;
    border-top-width: 0;
    border-bottom-color: #999;
    border-bottom-color: rgba(0, 0, 0, .25);
    top: -11px
}

.popover.bottom > .arrow:after {
    content: " ";
    top: 1px;
    margin-left: -10px;
    border-top-width: 0;
    border-bottom-color: #fff
}

.popover.left > .arrow {
    top: 50%;
    right: -11px;
    margin-top: -11px;
    border-right-width: 0;
    border-left-color: #999;
    border-left-color: rgba(0, 0, 0, .25)
}

.popover.left > .arrow:after {
    content: " ";
    right: 1px;
    border-right-width: 0;
    border-left-color: #fff;
    bottom: -10px
}

.carousel {
    position: relative
}

.carousel-inner {
    position: relative;
    overflow: hidden;
    width: 100%
}

.carousel-inner > .item {
    display: none;
    position: relative;
    -webkit-transition: .6s ease-in-out left;
    transition: .6s ease-in-out left
}

.carousel-inner > .item > a > img, .carousel-inner > .item > img {
    display: block;
    max-width: 100%;
    height: auto;
    line-height: 1
}

@media all and (transform-3d),(-webkit-transform-3d) {
    .carousel-inner > .item {
        -webkit-transition: -webkit-transform .6s ease-in-out;
        transition: transform .6s ease-in-out;
        -webkit-backface-visibility: hidden;
        backface-visibility: hidden;
        -webkit-perspective: 1000;
        perspective: 1000
    }

    .carousel-inner > .item.active.right, .carousel-inner > .item.next {
        -webkit-transform: translate3d(100%, 0, 0);
        transform: translate3d(100%, 0, 0);
        left: 0
    }

    .carousel-inner > .item.active.left, .carousel-inner > .item.prev {
        -webkit-transform: translate3d(-100%, 0, 0);
        transform: translate3d(-100%, 0, 0);
        left: 0
    }

    .carousel-inner > .item.active, .carousel-inner > .item.next.left, .carousel-inner > .item.prev.right {
        -webkit-transform: translate3d(0, 0, 0);
        transform: translate3d(0, 0, 0);
        left: 0
    }
}

.carousel-inner > .active, .carousel-inner > .next, .carousel-inner > .prev {
    display: block
}

.carousel-inner > .active {
    left: 0
}

.carousel-inner > .next, .carousel-inner > .prev {
    position: absolute;
    top: 0;
    width: 100%
}

.carousel-inner > .next {
    left: 100%
}

.carousel-inner > .prev {
    left: -100%
}

.carousel-inner > .next.left, .carousel-inner > .prev.right {
    left: 0
}

.carousel-inner > .active.left {
    left: -100%
}

.carousel-inner > .active.right {
    left: 100%
}

.carousel-control {
    position: absolute;
    top: 0;
    left: 0;
    bottom: 0;
    width: 15%;
    opacity: .5;
    filter: alpha(opacity=50);
    font-size: 20px;
    color: #fff;
    text-align: center;
    text-shadow: 0 1px 2px rgba(0, 0, 0, .6)
}

.carousel-control.left {
    background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, .5) 0, rgba(0, 0, 0, .0001) 100%);
    background-image: -webkit-gradient(linear, left top, right top, from(rgba(0, 0, 0, .5)), to(rgba(0, 0, 0, .0001)));
    background-image: linear-gradient(to right, rgba(0, 0, 0, .5) 0, rgba(0, 0, 0, .0001) 100%);
    background-repeat: repeat-x;
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#80000000', endColorstr='#00000000', GradientType=1)
}

.carousel-control.right {
    left: auto;
    right: 0;
    background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, .0001) 0, rgba(0, 0, 0, .5) 100%);
    background-image: -webkit-gradient(linear, left top, right top, from(rgba(0, 0, 0, .0001)), to(rgba(0, 0, 0, .5)));
    background-image: linear-gradient(to right, rgba(0, 0, 0, .0001) 0, rgba(0, 0, 0, .5) 100%);
    background-repeat: repeat-x;
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00000000', endColorstr='#80000000', GradientType=1)
}

.carousel-control:focus, .carousel-control:hover {
    outline: 0;
    color: #fff;
    text-decoration: none;
    opacity: .9;
    filter: alpha(opacity=90)
}

.carousel-control .glyphicon-chevron-left, .carousel-control .glyphicon-chevron-right, .carousel-control .icon-next, .carousel-control .icon-prev {
    position: absolute;
    top: 50%;
    z-index: 5;
    display: inline-block
}

.carousel-control .glyphicon-chevron-left, .carousel-control .icon-prev {
    left: 50%;
    margin-left: -10px
}

.carousel-control .glyphicon-chevron-right, .carousel-control .icon-next {
    right: 50%;
    margin-right: -10px
}

.carousel-control .icon-next, .carousel-control .icon-prev {
    width: 20px;
    height: 20px;
    margin-top: -10px;
    font-family: serif
}

.carousel-control .icon-prev:before {
    content: '\2039'
}

.carousel-control .icon-next:before {
    content: '\203a'
}

.carousel-indicators {
    position: absolute;
    bottom: 10px;
    left: 50%;
    z-index: 15;
    width: 60%;
    margin-left: -30%;
    padding-left: 0;
    list-style: none;
    text-align: center
}

.carousel-indicators li {
    display: inline-block;
    width: 10px;
    height: 10px;
    margin: 1px;
    text-indent: -999px;
    border: 1px solid #fff;
    border-radius: 10px;
    cursor: pointer;
    background-color: transparent
}

.carousel-indicators .active {
    margin: 0;
    width: 12px;
    height: 12px;
    background-color: #fff
}

.carousel-caption {
    position: absolute;
    left: 15%;
    right: 15%;
    bottom: 20px;
    z-index: 10;
    padding-top: 20px;
    padding-bottom: 20px;
    color: #fff;
    text-align: center;
    text-shadow: 0 1px 2px rgba(0, 0, 0, .6)
}

.carousel-caption .btn {
    text-shadow: none
}

@media screen and (min-width: 768px) {
    .carousel-control .glyphicon-chevron-left, .carousel-control .glyphicon-chevron-right, .carousel-control .icon-next, .carousel-control .icon-prev {
        width: 30px;
        height: 30px;
        margin-top: -15px;
        font-size: 30px
    }

    .carousel-control .glyphicon-chevron-left, .carousel-control .icon-prev {
        margin-left: -15px
    }

    .carousel-control .glyphicon-chevron-right, .carousel-control .icon-next {
        margin-right: -15px
    }

    .carousel-caption {
        left: 20%;
        right: 20%;
        padding-bottom: 30px
    }

    .carousel-indicators {
        bottom: 20px
    }
}

.clearfix:after, .clearfix:before {
    content: " ";
    display: table
}

.clearfix:after {
    clear: both
}

.center-block {
    display: block;
    margin-left: auto;
    margin-right: auto
}

.pull-right {
    float: right !important
}

.pull-left {
    float: left !important
}

.hide {
    display: none !important
}

.show {
    display: block !important
}

.invisible {
    visibility: hidden
}

.text-hide {
    font: 0/0 a;
    color: transparent;
    text-shadow: none;
    background-color: transparent;
    border: 0
}

.hidden {
    display: none !important;
    visibility: hidden !important
}

.affix {
    position: fixed
}

@-ms-viewport {
    width: device-width
}

.visible-lg, .visible-lg-block, .visible-lg-inline, .visible-lg-inline-block, .visible-md, .visible-md-block, .visible-md-inline, .visible-md-inline-block, .visible-print, .visible-print-block, .visible-print-inline, .visible-print-inline-block, .visible-sm, .visible-sm-block, .visible-sm-inline, .visible-sm-inline-block, .visible-xs, .visible-xs-block, .visible-xs-inline, .visible-xs-inline-block {
    display: none !important
}

@media (max-width: 767px) {
    .visible-xs {
        display: block !important
    }

    table.visible-xs {
        display: table
    }

    tr.visible-xs {
        display: table-row !important
    }

    td.visible-xs, th.visible-xs {
        display: table-cell !important
    }
}

@media (max-width: 767px) {
    .visible-xs-block {
        display: block !important
    }
}

@media (max-width: 767px) {
    .visible-xs-inline {
        display: inline !important
    }
}

@media (max-width: 767px) {
    .visible-xs-inline-block {
        display: inline-block !important
    }
}

@media (min-width: 768px) and (max-width: 991px) {
    .visible-sm {
        display: block !important
    }

    table.visible-sm {
        display: table
    }

    tr.visible-sm {
        display: table-row !important
    }

    td.visible-sm, th.visible-sm {
        display: table-cell !important
    }
}

@media (min-width: 768px) and (max-width: 991px) {
    .visible-sm-block {
        display: block !important
    }
}

@media (min-width: 768px) and (max-width: 991px) {
    .visible-sm-inline {
        display: inline !important
    }
}

@media (min-width: 768px) and (max-width: 991px) {
    .visible-sm-inline-block {
        display: inline-block !important
    }
}

@media (min-width: 992px) and (max-width: 1199px) {
    .visible-md {
        display: block !important
    }

    table.visible-md {
        display: table
    }

    tr.visible-md {
        display: table-row !important
    }

    td.visible-md, th.visible-md {
        display: table-cell !important
    }
}

@media (min-width: 992px) and (max-width: 1199px) {
    .visible-md-block {
        display: block !important
    }
}

@media (min-width: 992px) and (max-width: 1199px) {
    .visible-md-inline {
        display: inline !important
    }
}

@media (min-width: 992px) and (max-width: 1199px) {
    .visible-md-inline-block {
        display: inline-block !important
    }
}

@media (min-width: 1200px) {
    .visible-lg {
        display: block !important
    }

    table.visible-lg {
        display: table
    }

    tr.visible-lg {
        display: table-row !important
    }

    td.visible-lg, th.visible-lg {
        display: table-cell !important
    }
}

@media (min-width: 1200px) {
    .visible-lg-block {
        display: block !important
    }
}

@media (min-width: 1200px) {
    .visible-lg-inline {
        display: inline !important
    }
}

@media (min-width: 1200px) {
    .visible-lg-inline-block {
        display: inline-block !important
    }
}

@media (max-width: 767px) {
    .hidden-xs {
        display: none !important
    }
}

@media (min-width: 768px) and (max-width: 991px) {
    .hidden-sm {
        display: none !important
    }
}

@media (min-width: 992px) and (max-width: 1199px) {
    .hidden-md {
        display: none !important
    }
}

@media (min-width: 1200px) {
    .hidden-lg {
        display: none !important
    }
}

@media print {
    .visible-print {
        display: block !important
    }

    table.visible-print {
        display: table
    }

    tr.visible-print {
        display: table-row !important
    }

    td.visible-print, th.visible-print {
        display: table-cell !important
    }
}

@media print {
    .visible-print-block {
        display: block !important
    }
}

@media print {
    .visible-print-inline {
        display: inline !important
    }
}

@media print {
    .visible-print-inline-block {
        display: inline-block !important
    }
}

@media print {
    .hidden-print {
        display: none !important
    }
}

.nav a, a.btn {
    text-decoration: none
}

a {
    text-decoration: underline
}

a:visited {
    color: #7834bc
}

.btn-default:visited {
    color: #335075
}

.btn-info:visited, .btn-primary:visited, .btn-success:visited {
    color: #fff
}

.btn-warning:visited {
    color: #000
}

.btn-danger:visited {
    color: #fff
}

@media (min-width: 768px) {
    .dl-horizontal dt {
        border-top: 1px solid #ccc;
        padding: 10px 10px 10px 0;
        text-align: left;
        white-space: normal
    }

    .dl-horizontal dd {
        border-top: 1px solid #ccc;
        margin-bottom: 3px;
        margin-left: 160px;
        padding: 10px 10px 10px 0
    }

    .dl-horizontal dt + dd {
        padding-bottom: 0
    }
}

.dropdown-menu > li > a:visited {
    color: #333
}

.nav > li > a:visited {
    color: #295376
}

.nav-pills > li.active > a:visited {
    color: #fff
}

.navbar-default .navbar-link:visited, .navbar-default .navbar-nav > li > a:visited {
    color: #777
}

@media (max-width: 767px) {
    .navbar-default .open .dropdown-menu > li > a {
        color: #777
    }
}

.navbar-inverse .navbar-link:visited, .navbar-inverse .navbar-nav > li > a:visited {
    color: #9c9c9c
}

@media (max-width: 767px) {
    .navbar-inverse .open .dropdown-menu > li > a:visited {
        color: #9c9c9c
    }
}

.alert, .label {
    border-radius: 0;
    border-style: solid;
    border-width: 0 0 0 4px
}

.alert > :first-child {
    margin-left: 1.2em;
    margin-top: auto
}

.alert > :first-child:before {
    display: inline-block;
    font-family: "Glyphicons Halflings";
    margin-left: -1.3em;
    position: absolute
}

.alert > em:first-child, .alert > span:first-child, .alert > strong:first-child {
    display: inline-block
}

.alert-danger, .alert-info, .alert-success, .alert-warning, .label-danger, .label-danger[href]:active, .label-danger[href]:focus, .label-danger[href]:hover, .label-default, .label-default[href]:active, .label-default[href]:focus, .label-default[href]:hover, .label-info, .label-info[href]:active, .label-info[href]:focus, .label-info[href]:hover, .label-primary, .label-primary[href]:active, .label-primary[href]:focus, .label-primary[href]:hover, .label-success, .label-success[href]:active, .label-success[href]:focus, .label-success[href]:hover, .label-warning, .label-warning[href]:active, .label-warning[href]:focus, .label-warning[href]:hover {
    color: #000
}

.label-danger[href]:active, .label-danger[href]:focus, .label-danger[href]:hover, .label-default[href]:active, .label-default[href]:focus, .label-default[href]:hover, .label-info[href]:active, .label-info[href]:focus, .label-info[href]:hover, .label-primary[href]:active, .label-primary[href]:focus, .label-primary[href]:hover, .label-success[href]:active, .label-success[href]:focus, .label-success[href]:hover, .label-warning[href]:active, .label-warning[href]:focus, .label-warning[href]:hover {
    text-decoration: underline
}

.label-default, .label-default[href]:active, .label-default[href]:focus, .label-default[href]:hover {
    background: #eee;
    border-color: #acacac
}

.label-primary, .label-primary[href]:active, .label-primary[href]:focus, .label-primary[href]:hover {
    background: #e8f2f4;
    border-color: #083c6c
}

.alert-success, .label-success, .label-success[href]:active, .label-success[href]:focus, .label-success[href]:hover, details.alert.alert-success, details.alert[open].alert-success {
    background: #d8eeca;
    border-color: #278400
}

.alert-success > :first-child:before {
    color: #278400;
    content: "\e084"
}

.alert-info, .label-info, .label-info[href]:active, .label-info[href]:focus, .label-info[href]:hover, details.alert.alert-info, details.alert[open].alert-info {
    background: #d7faff;
    border-color: #269abc
}

.alert-info > :first-child:before {
    color: #269abc;
    content: "\e086"
}

.alert-warning, .label-warning, .label-warning[href]:active, .label-warning[href]:focus, .label-warning[href]:hover, details.alert.alert-warning, details.alert[open].alert-warning {
    background: #f9f4d4;
    border-color: #f90
}

.alert-warning > :first-child:before {
    color: #f90;
    content: "\e107"
}

.alert-danger, .label-danger, .label-danger[href]:active, .label-danger[href]:focus, .label-danger[href]:hover, details.alert.alert-danger, details.alert[open].alert-danger {
    background: #f3e9e8;
    border-color: #d3080c
}

.alert-danger > :first-child:before {
    color: #d3080c;
    content: "\e101"
}

.h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
    font-weight: 700
}

.h1, .h2, h1, h2 {
    margin-top: 38px
}

.h3, h3 {
    margin-top: 32px
}

.h4, h4 {
    margin-top: 26px
}

.h5, h5 {
    margin-top: 23px
}

.h6, h6 {
    margin-top: 21px
}

code {
    white-space: normal
}

dt {
    margin-bottom: 3px
}

dd {
    margin-bottom: 15px
}

input[type=button], input[type=reset], input[type=submit] {
    height: 37px
}

.btn-group-lg > input[type=button].btn, .btn-group-lg > input[type=reset].btn, .btn-group-lg > input[type=submit].btn, .input-group-lg > .input-group-btn > input[type=button].btn, .input-group-lg > .input-group-btn > input[type=reset].btn, .input-group-lg > .input-group-btn > input[type=submit].btn, .input-group-lg > input[type=button].form-control, .input-group-lg > input[type=button].input-group-addon, .input-group-lg > input[type=reset].form-control, .input-group-lg > input[type=reset].input-group-addon, .input-group-lg > input[type=submit].form-control, .input-group-lg > input[type=submit].input-group-addon, input[type=button].btn-lg, input[type=button].input-lg, input[type=reset].btn-lg, input[type=reset].input-lg, input[type=submit].btn-lg, input[type=submit].input-lg {
    height: 46px
}

.btn-group-sm > input[type=button].btn, .btn-group-sm > input[type=reset].btn, .btn-group-sm > input[type=submit].btn, .input-group-sm > .input-group-btn > input[type=button].btn, .input-group-sm > .input-group-btn > input[type=reset].btn, .input-group-sm > .input-group-btn > input[type=submit].btn, .input-group-sm > input[type=button].form-control, .input-group-sm > input[type=button].input-group-addon, .input-group-sm > input[type=reset].form-control, .input-group-sm > input[type=reset].input-group-addon, .input-group-sm > input[type=submit].form-control, .input-group-sm > input[type=submit].input-group-addon, input[type=button].btn-sm, input[type=button].input-sm, input[type=reset].btn-sm, input[type=reset].input-sm, input[type=submit].btn-sm, input[type=submit].input-sm {
    height: 33px
}

.btn-group-xs > input[type=button].btn, .btn-group-xs > input[type=reset].btn, .btn-group-xs > input[type=submit].btn, input[type=button].btn-xs, input[type=reset].btn-xs, input[type=submit].btn-xs {
    height: 25px
}

@media (max-width: 767px) {
    .pull-left[class*=col-lg], .pull-left[class*=col-md], .pull-left[class*=col-sm], .pull-right[class*=col-lg], .pull-right[class*=col-md], .pull-right[class*=col-sm] {
        float: none !important
    }
}

@media (min-width: 768px) and (max-width: 991px) {
    .pull-left[class*=col-lg], .pull-left[class*=col-md], .pull-right[class*=col-lg], .pull-right[class*=col-md] {
        float: none !important
    }
}

@media (min-width: 992px) and (max-width: 1199px) {
    .pull-left[class*=col-lg], .pull-right[class*=col-lg] {
        float: none !important
    }
}

blockquote {
    font-size: 16px
}

.form-control {
    max-width: 100%;
    width: auto
}

legend {
    border-bottom: 0;
    float: left
}

.btn.disabled, .btn[disabled], fieldset[disabled] .btn {
    border-style: solid
}

fieldset {
    border-top: 1px solid #e5e5e5;
    padding-top: 10px
}

fieldset:first-child {
    border-top: 0
}

fieldset.chkbxrdio-grp {
    border-top: 0;
    padding-top: 0
}

fieldset.chkbxrdio-grp legend {
    font-size: 16px;
    font-weight: 700;
    margin-bottom: 5px
}

.dataTables_wrapper .dataTables_paginate .paginate_button.next:after, .dataTables_wrapper .dataTables_paginate .paginate_button.previous:before, .pager > li:first-child [rel=prev]:before, .pager > li:last-child [rel=next]:after, .pagination > li:first-child [rel=prev]:before, .pagination > li:last-child [rel=next]:after, [dir=rtl] .dataTables_wrapper .dataTables_paginate .paginate_button.next:before, [dir=rtl] .dataTables_wrapper .dataTables_paginate .paginate_button.previous:after, [dir=rtl] .pager [rel=next]:before, [dir=rtl] .pager [rel=prev]:after, [dir=rtl] .pagination [rel=next]:before, [dir=rtl] .pagination [rel=prev]:after, table.dataTable thead .sorting-icons:after, table.dataTable thead .sorting-icons:before {
    font-family: "Glyphicons Halflings";
    font-weight: 400;
    line-height: 1em;
    position: relative;
    top: .1em
}

.dataTables_wrapper .dataTables_paginate .paginate_button.previous:before, .pager > li:first-child [rel=prev]:before, .pagination > li:first-child [rel=prev]:before, [dir=rtl] .dataTables_wrapper .dataTables_paginate .paginate_button.next:before, [dir=rtl] .pager [rel=next]:before, [dir=rtl] .pagination [rel=next]:before {
    content: "\e091";
    margin-right: .5em
}

.dataTables_wrapper .dataTables_paginate .paginate_button.next:after, .pager > li:last-child [rel=next]:after, .pagination > li:last-child [rel=next]:after, [dir=rtl] .dataTables_wrapper .dataTables_paginate .paginate_button.previous:after, [dir=rtl] .pager [rel=prev]:after, [dir=rtl] .pagination [rel=prev]:after {
    content: "\e092";
    margin-left: .5em
}

.pager > li > a, .pagination > li > a {
    cursor: pointer;
    display: inline-block;
    margin-bottom: .5em;
    padding: 10px 16px
}

.pager > li.active > a, .pagination > li.active > a {
    cursor: default
}

.pager > li.disabled + li > a, .pagination > li.disabled + li > a {
    border-bottom-left-radius: 4px;
    border-top-left-radius: 4px
}

.pager > li > a {
    text-decoration: none
}

.pager > li > a:focus, .pager > li > a:hover, .pager > li > span:focus, .pager > li > span:hover {
    border-color: #bbbfc5;
    color: #335075
}

.btn {
    border-style: outset;
    height: auto;
    min-height: 36px;
    min-width: 36px;
    white-space: normal
}

.btn-group-xs .btn, .btn-group-xs > .btn, .btn.btn-xs {
    min-height: 0
}

[dir=rtl] .alert > :first-child {
    margin-left: auto;
    margin-right: 1.2em
}

[dir=rtl] .alert > :first-child:before {
    margin-left: auto;
    margin-right: -1.3em
}

[dir=rtl] details.alert {
    padding-right: 45px
}

[dir=rtl] details.alert:before {
    margin-right: -1.3em
}

[dir=rtl] details.alert > * {
    margin-right: .7em
}

[dir=rtl] details.alert > :first-child {
    margin-right: .4em
}

[dir=rtl] .list-unstyled {
    padding-right: 0
}

[dir=rtl] .pager [rel=prev], [dir=rtl] .pagination [rel=prev] {
    border-bottom-left-radius: 0;
    border-top-left-radius: 0;
    border-bottom-right-radius: 4px;
    border-top-right-radius: 4px
}

[dir=rtl] .pager [rel=next], [dir=rtl] .pagination [rel=next] {
    border-bottom-left-radius: 4px;
    border-top-left-radius: 4px;
    border-bottom-right-radius: 0;
    border-top-right-radius: 0
}

[dir=rtl] .pager > li, [dir=rtl] .pagination > li {
    float: right
}

[dir=rtl] .pager > li.disabled + li > a, [dir=rtl] .pagination > li.disabled + li > a {
    border-bottom-left-radius: 0;
    border-top-left-radius: 0;
    border-bottom-right-radius: 4px;
    border-top-right-radius: 4px
}

caption {
    color: #333;
    font-size: 1.1em;
    font-weight: 700;
    text-align: center
}

#mb-pnl .srch-pnl label, #mb-pnl h3, #wb-bc h2, #wb-glb-mn h2, #wb-info h2, #wb-lng h2, #wb-sec h2, #wb-sm h2, #wb-srch h2, #wb-srch label, .wb-calevt-cal .cal-days td ul, .wb-fnote dt, .wb-inv, .wb-invisible, .wb-show-onfocus, .wb-sl {
    clip: rect(1px, 1px, 1px, 1px);
    height: 1px;
    margin: 0;
    overflow: hidden;
    position: absolute;
    width: 1px
}

.wb-disable .wb-slc .wb-sl, .wb-show-onfocus:focus, .wb-sl:focus {
    clip: rect(auto, auto, auto, auto);
    height: inherit;
    margin: inherit;
    overflow: inherit;
    position: static;
    width: inherit
}

#mb-pnl .modal-body h2, #wb-bc li:first-child:before, .dataTables_wrapper .dataTables_paginate .paginate_button.disabled, .pager.disabled, .pager > li.disabled, .pagination.disabled, .pagination > li.disabled, .wb-tabs.carousel-s1 [role=tablist] > li, .wb-tabs.carousel-s2 [role=tablist] > li, [dir=rtl] #wb-bc li:first-child:before, [dir=rtl] .dataTables_wrapper .dataTables_paginate .paginate_button.disabled, [dir=rtl] .dataTables_wrapper .dataTables_paginate .paginate_button.next:after, [dir=rtl] .dataTables_wrapper .dataTables_paginate .paginate_button.previous:before, [dir=rtl] .pager [rel=next]:after, [dir=rtl] .pager [rel=prev]:before, [dir=rtl] .pagination [rel=next]:after, [dir=rtl] .pagination [rel=prev]:before, table.dataTable thead .sorting-icons, table.dataTable thead .sorting_asc_disabled .sorting-icons:before, table.dataTable thead .sorting_desc_disabled .sorting-icons:after {
    display: none
}

.wb-disable .wb-tabs > .tabpanels > details, .wb-disable .wb-tabs > details, .wb-menu .sm.open li {
    display: block
}

.wb-disable #wb-info, .wb-disable #wb-sec, .wb-disable #wb-sm, .wb-disable #wb-srch, .wb-disable .mfp-hide, .wb-disable .wb-overlay, .wb-disable .wb-tabs > .tabpanels > details[open] > summary, .wb-disable .wb-tabs > details[open] > summary {
    display: block !important
}

.wb-menu .active > a, .wb-menu .menu > li a, .wb-menu .menu > li a:focus, .wb-menu .menu > li a:hover {
    text-decoration: none
}

.wb-enable .wb-twitter .twitter-timeline:after, .wb-enable .wb-twitter .twitter-timeline:before, .wb-mltmd.video.waiting .display:after, .wb-mltmd.video.waiting .display:before, .wb-mltmd.video:not(.playing):not(.waiting) .display:after, .wb-mltmd.video:not(.playing):not(.waiting) .display:before {
    bottom: 0;
    content: " ";
    height: 100px;
    left: 0;
    margin: auto;
    position: absolute;
    right: 0;
    top: 0;
    width: 100px
}

.wb-enable .wb-twitter .twitter-timeline:after, .wb-mltmd.video.waiting .display:after, .wb-mltmd.video:not(.playing):not(.waiting) .display:after {
    z-index: 1
}

.wb-enable .wb-twitter .twitter-timeline:before, .wb-mltmd.video.waiting .display:before, .wb-mltmd.video:not(.playing):not(.waiting) .display:before {
    background: rgba(0, 0, 0, .7);
    border-radius: 10px
}

@-webkit-keyframes spin {
    from {
        -webkit-transform: rotate(0);
        transform: rotate(0)
    }
    to {
        -webkit-transform: rotate(360deg);
        transform: rotate(360deg)
    }
}

@keyframes spin {
    from {
        -webkit-transform: rotate(0);
        transform: rotate(0)
    }
    to {
        -webkit-transform: rotate(360deg);
        transform: rotate(360deg)
    }
}

.wb-enable .wb-twitter .twitter-timeline:after, .wb-mltmd.video.waiting .display:after {
    -webkit-animation-duration: 500ms;
    animation-duration: 500ms;
    -webkit-animation-iteration-count: infinite;
    animation-iteration-count: infinite;
    -webkit-animation-name: spin;
    animation-name: spin;
    -webkit-animation-timing-function: linear;
    animation-timing-function: linear;
    color: #fff;
    content: "\e031";
    font-family: "Glyphicons Halflings";
    font-size: 3.5em;
    height: 1em;
    line-height: 1.03;
    width: 1em;
    z-index: 2
}

/*! WET-BOEW Core and Plugins */
#wb-tphp {
    list-style-type: none;
    margin-bottom: 0
}

.wb-slc {
    left: 0;
    position: absolute;
    text-align: center;
    top: 10px;
    width: 100%;
    z-index: 3
}

.wb-sl {
    padding: 5px;
    z-index: 501
}

.wb-disable #wb-tphp {
    background: #fff
}

.wb-disable .wb-slc {
    position: static
}

.wb-disable .wb-slc .wb-sl {
    background: 0 0;
    color: #295376;
    display: block !important;
    font-weight: 400
}

.wb-disable .wb-slc .wb-sl:focus, .wb-disable .wb-slc .wb-sl:hover {
    color: #0535d2
}

.wb-disable #wb-dtmd {
    float: none !important
}

q:after, q:before {
    content: ""
}

#wb-bc {
    background-color: #f5f5f5
}

#wb-bc ol {
    border-radius: 0;
    margin-bottom: 0
}

#wb-bc li {
    max-width: 100%;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap
}

#wb-bc li:before {
    color: #333;
    content: "";
    font-family: "Glyphicons Halflings";
    font-size: .7em
}

[dir=rtl] #wb-bc li:before {
    content: "";
    display: inline-block
}

.wb-lng-lnks-rtl:after {
    clear: both;
    content: "";
    display: table
}

.wb-lng-lnks-horiz .wb-lng-lnk {
    display: inline-block
}

.wb-lng-lnks-vert .wb-lng-lnk {
    display: block
}

.wb-lng-lnks-rtl .wb-lng-lnk {
    float: right
}

#wb-so {
    text-align: right
}

#wb-so .row {
    padding: 1em 0 0
}

.gc-elps {
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap
}

.fade.in, .pop.in {
    opacity: 1;
    visibility: visible
}

.fade.out, .pop.out {
    opacity: 0;
    visibility: hidden
}

.out {
/*     display: none !important */
}

.csstransitions .out {
    display: block !important
}

.pop {
    -webkit-transform-origin: 50% 50%;
    -ms-transform-origin: 50% 50%;
    transform-origin: 50% 50%
}

.pop.in {
    -webkit-animation-duration: 350ms;
    animation-duration: 350ms;
    -webkit-animation-name: popin;
    animation-name: popin;
    -webkit-transform: scale(1);
    -ms-transform: scale(1);
    transform: scale(1);
    visibility: visible
}

.pop.out {
    -webkit-animation-duration: 100ms;
    animation-duration: 100ms;
    -webkit-animation-name: fadeout;
    animation-name: fadeout;
    visibility: hidden
}

.pop.reverse.in {
    -webkit-animation-name: fadein;
    animation-name: fadein
}

.pop.reverse.out {
    -webkit-animation-name: popout;
    animation-name: popout;
    -webkit-transform: scale(0.8);
    -ms-transform: scale(0.8);
    transform: scale(0.8)
}

@-webkit-keyframes popin {
    0% {
        opacity: 1;
        visibility: visible;
        -webkit-transform: scale(0.8);
        transform: scale(0.8)
    }
    100% {
        opacity: 0;
        visibility: hidden;
        -webkit-transform: scale(1);
        transform: scale(1)
    }
}

@keyframes popin {
    0% {
        opacity: 1;
        visibility: visible;
        -webkit-transform: scale(0.8);
        transform: scale(0.8)
    }
    100% {
        opacity: 0;
        visibility: hidden;
        -webkit-transform: scale(1);
        transform: scale(1)
    }
}

@-webkit-keyframes popout {
    0% {
        opacity: 1;
        visibility: visible;
        -webkit-transform: scale(1);
        transform: scale(1)
    }
    100% {
        opacity: 0;
        visibility: hidden;
        -webkit-transform: scale(0.8);
        transform: scale(0.8)
    }
}

@keyframes popout {
    0% {
        opacity: 1;
        visibility: visible;
        -webkit-transform: scale(1);
        transform: scale(1)
    }
    100% {
        opacity: 0;
        visibility: hidden;
        -webkit-transform: scale(0.8);
        transform: scale(0.8)
    }
}

.fade {
    -webkit-transition: all 0 ease 0;
    transition: all 0 ease 0
}

.fade.in {
    -webkit-animation-duration: 225ms;
    animation-duration: 225ms;
    -webkit-animation-name: fadein;
    animation-name: fadein
}

.fade.out {
    -webkit-animation-duration: 125ms;
    animation-duration: 125ms;
    -webkit-animation-name: fadeout;
    animation-name: fadeout;
    z-index: -1
}

.fade.out.noheight {
    -webkit-animation-name: fadeoutnoheight;
    animation-name: fadeoutnoheight;
    max-height: 0
}

@-webkit-keyframes fadein {
    0% {
        opacity: 0;
        visibility: hidden
    }
    100% {
        opacity: 1;
        visibility: visible
    }
}

@keyframes fadein {
    0% {
        opacity: 0;
        visibility: hidden
    }
    100% {
        opacity: 1;
        visibility: visible
    }
}

@-webkit-keyframes fadeout {
    0% {
        opacity: 1;
        visibility: visible
    }
    100% {
        opacity: 0;
        visibility: hidden
    }
}

@keyframes fadeout {
    0% {
        opacity: 1;
        visibility: visible
    }
    100% {
        opacity: 0;
        visibility: hidden
    }
}

@-webkit-keyframes fadeoutnoheight {
    0% {
        opacity: 1;
        visibility: visible;
        max-height: 100%
    }
    99.9999% {
        max-height: 100%
    }
    100% {
        opacity: 0;
        visibility: hidden;
        max-height: 0
    }
}

@keyframes fadeoutnoheight {
    0% {
        opacity: 1;
        visibility: visible;
        max-height: 100%
    }
    99.9999% {
        max-height: 100%
    }
    100% {
        opacity: 0;
        visibility: hidden;
        max-height: 0
    }
}

.slide.in, .slide.out {
    -webkit-animation-duration: 350ms;
    animation-duration: 350ms;
    -webkit-animation-timing-function: ease-out;
    animation-timing-function: ease-out
}

.slide.out {
    -webkit-animation-name: slideouttoleft;
    animation-name: slideouttoleft;
    -webkit-transform: translateX(-100%);
    -ms-transform: translateX(-100%);
    transform: translateX(-100%);
    visibility: hidden
}

.slide.in {
    -webkit-animation-name: slideinfromright;
    animation-name: slideinfromright;
    -webkit-transform: translateX(0);
    -ms-transform: translateX(0);
    transform: translateX(0);
    visibility: visible
}

.slide.reverse.out {
    -webkit-animation-name: slideouttoright;
    animation-name: slideouttoright;
    -webkit-transform: translateX(100%);
    -ms-transform: translateX(100%);
    transform: translateX(100%)
}

.slide.reverse.in {
    -webkit-animation-name: slideinfromleft;
    animation-name: slideinfromleft
}

@-webkit-keyframes slideinfromright {
    0% {
        -webkit-transform: translateX(100%);
        transform: translateX(100%)
    }
    100% {
        -webkit-transform: translateX(0);
        transform: translateX(0)
    }
}

@keyframes slideinfromright {
    0% {
        -webkit-transform: translateX(100%);
        transform: translateX(100%)
    }
    100% {
        -webkit-transform: translateX(0);
        transform: translateX(0)
    }
}

@-webkit-keyframes slideinfromleft {
    0% {
        -webkit-transform: translateX(-100%);
        transform: translateX(-100%)
    }
    100% {
        -webkit-transform: translateX(0);
        transform: translateX(0)
    }
}

@keyframes slideinfromleft {
    0% {
        -webkit-transform: translateX(-100%);
        transform: translateX(-100%)
    }
    100% {
        -webkit-transform: translateX(0);
        transform: translateX(0)
    }
}

@-webkit-keyframes slideouttoleft {
    0% {
        -webkit-transform: translateX(0);
        transform: translateX(0);
        visibility: visible
    }
    99% {
        visibility: visible
    }
    100% {
        -webkit-transform: translateX(-100%);
        transform: translateX(-100%);
        visibility: hidden
    }
}

@keyframes slideouttoleft {
    0% {
        -webkit-transform: translateX(0);
        transform: translateX(0);
        visibility: visible
    }
    99% {
        visibility: visible
    }
    100% {
        -webkit-transform: translateX(-100%);
        transform: translateX(-100%);
        visibility: hidden
    }
}

@-webkit-keyframes slideouttoright {
    0% {
        -webkit-transform: translateX(0);
        transform: translateX(0);
        visibility: visible
    }
    99% {
        visibility: visible
    }
    100% {
        -webkit-transform: translateX(100%);
        transform: translateX(100%);
        visibility: hidden
    }
}

@keyframes slideouttoright {
    0% {
        -webkit-transform: translateX(0);
        transform: translateX(0);
        visibility: visible
    }
    99% {
        visibility: visible
    }
    100% {
        -webkit-transform: translateX(100%);
        transform: translateX(100%);
        visibility: hidden
    }
}

.slidefade.out {
    -webkit-animation-duration: 225ms;
    animation-duration: 225ms;
    -webkit-animation-name: slideouttoleft;
    animation-name: slideouttoleft;
    -webkit-transform: translateX(-100%);
    -ms-transform: translateX(-100%);
    transform: translateX(-100%)
}

.slidefade.in {
    -webkit-animation-duration: 200ms;
    animation-duration: 200ms;
    -webkit-animation-name: fadein;
    animation-name: fadein;
    -webkit-transform: translateX(0);
    -ms-transform: translateX(0);
    transform: translateX(0)
}

.slidefade.reverse.out {
    -webkit-animation-name: slideouttoright;
    animation-name: slideouttoright;
    -webkit-transform: translateX(100%);
    -ms-transform: translateX(100%);
    transform: translateX(100%)
}

.slidevert.in, .slidevert.out {
    -webkit-animation-duration: 350ms;
    animation-duration: 350ms;
    -webkit-animation-timing-function: ease-out;
    animation-timing-function: ease-out
}

.slidevert.out {
    -webkit-animation-name: slideouttobottom;
    animation-name: slideouttobottom;
    -webkit-transform: translateY(100%);
    -ms-transform: translateY(100%);
    transform: translateY(100%);
    visibility: hidden
}

.slidevert.in {
    -webkit-animation-name: slideinfromtop;
    animation-name: slideinfromtop;
    -webkit-transform: translateY(0);
    -ms-transform: translateY(0);
    transform: translateY(0);
    visibility: visible
}

.slidevert.reverse.out {
    -webkit-animation-name: slideouttotop;
    animation-name: slideouttotop;
    -webkit-transform: translateY(-100%);
    -ms-transform: translateY(-100%);
    transform: translateY(-100%)
}

.slidevert.reverse.in {
    -webkit-animation-name: slideinfrombottom;
    animation-name: slideinfrombottom
}

@-webkit-keyframes slideinfromtop {
    0% {
        -webkit-transform: translateY(-100%);
        transform: translateY(-100%)
    }
    100% {
        -webkit-transform: translateY(0);
        transform: translateY(0)
    }
}

@keyframes slideinfromtop {
    0% {
        -webkit-transform: translateY(-100%);
        transform: translateY(-100%)
    }
    100% {
        -webkit-transform: translateY(0);
        transform: translateY(0)
    }
}

@-webkit-keyframes slideouttotop {
    0% {
        -webkit-transform: translateY(0);
        transform: translateY(0);
        visibility: visible
    }
    99% {
        visibility: visible
    }
    100% {
        -webkit-transform: translateY(-100%);
        transform: translateY(-100%);
        visibility: hidden
    }
}

@keyframes slideouttotop {
    0% {
        -webkit-transform: translateY(0);
        transform: translateY(0);
        visibility: visible
    }
    99% {
        visibility: visible
    }
    100% {
        -webkit-transform: translateY(-100%);
        transform: translateY(-100%);
        visibility: hidden
    }
}

@-webkit-keyframes slideinfrombottom {
    0% {
        -webkit-transform: translateY(100%);
        transform: translateY(100%)
    }
    100% {
        -webkit-transform: translateY(0);
        transform: translateY(0)
    }
}

@keyframes slideinfrombottom {
    0% {
        -webkit-transform: translateY(100%);
        transform: translateY(100%)
    }
    100% {
        -webkit-transform: translateY(0);
        transform: translateY(0)
    }
}

@-webkit-keyframes slideouttobottom {
    0% {
        -webkit-transform: translateY(0);
        transform: translateY(0);
        visibility: visible
    }
    99% {
        visibility: visible
    }
    100% {
        -webkit-transform: translateY(100%);
        transform: translateY(100%);
        visibility: hidden
    }
}

@keyframes slideouttobottom {
    0% {
        -webkit-transform: translateY(0);
        transform: translateY(0);
        visibility: visible
    }
    99% {
        visibility: visible
    }
    100% {
        -webkit-transform: translateY(100%);
        transform: translateY(100%);
        visibility: hidden
    }
}

.opct-100 {
    opacity: 1
}

.opct-90 {
    opacity: .9
}

.opct-80 {
    opacity: .8
}

.opct-70 {
    opacity: .7
}

.opct-60 {
    opacity: .6
}

.opct-50 {
    opacity: .5
}

.opct-40 {
    opacity: .4
}

.opct-30 {
    opacity: .3
}

.opct-20 {
    opacity: .2
}

.opct-10 {
    opacity: .1
}

[class*=clmn-] {
    list-style: outside;
    padding-left: 1.3em
}

[class*=clmn-] > li {
    margin-left: 1.3em
}

.pstn-bttm-lg, .pstn-bttm-md, .pstn-bttm-sm, .pstn-bttm-xs, .pstn-lft-lg, .pstn-lft-md, .pstn-lft-sm, .pstn-lft-xs, .pstn-rght-lg, .pstn-rght-md, .pstn-rght-sm, .pstn-rght-xs, .pstn-tp-lg, .pstn-tp-md, .pstn-tp-sm, .pstn-tp-xs {
    margin: 0
}

.pstn-lft-xs {
    position: absolute;
    left: 0;
    right: auto
}

.pstn-rght-xs {
    position: absolute;
    right: 0;
    left: auto
}

.pstn-tp-xs {
    position: absolute;
    top: 0;
    bottom: auto
}

.pstn-bttm-xs {
    position: absolute;
    bottom: 0;
    top: auto
}

.mrgn-lft-0 {
    margin-left: 0
}

.mrgn-lft-sm {
    margin-left: 5px
}

.mrgn-lft-md {
    margin-left: 15px
}

.mrgn-lft-lg {
    margin-left: 30px
}

.mrgn-lft-xl {
    margin-left: 50px
}

.mrgn-bttm-0 {
    margin-bottom: 0
}

.mrgn-bttm-sm {
    margin-bottom: 5px
}

.mrgn-bttm-md {
    margin-bottom: 15px
}

.mrgn-bttm-lg {
    margin-bottom: 30px
}

.mrgn-bttm-xl {
    margin-bottom: 50px
}

.mrgn-tp-0 {
    margin-top: 0
}

.mrgn-tp-sm {
    margin-top: 5px
}

.mrgn-tp-md {
    margin-top: 15px
}

.mrgn-tp-lg {
    margin-top: 30px
}

.mrgn-tp-xl {
    margin-top: 50px
}

.mrgn-rght-0 {
    margin-right: 0
}

.mrgn-rght-sm {
    margin-right: 5px
}

.mrgn-rght-md {
    margin-right: 15px
}

.mrgn-rght-lg {
    margin-right: 30px
}

.mrgn-rght-xl {
    margin-right: 50px
}

.brdr-bttm, .brdr-lft, .brdr-rght, .brdr-tp {
    border: solid 0 #ccc
}

.brdr-lft {
    border-left-width: 1px
}

.brdr-rght {
    border-right-width: 1px
}

.brdr-tp {
    border-top-width: 1px
}

.brdr-bttm {
    border-bottom-width: 1px
}

.brdr-0 {
    border: 0 !important
}

.brdr-rds-0 {
    border-radius: 0 !important
}

.tbl-gridify tfoot, .tbl-gridify thead {
    display: none
}

.tbl-gridify tbody, .tbl-gridify td {
    display: block
}

[class*=colcount-] {
    list-style-position: outside;
    padding-left: 1.3em
}

[class*=colcount-] > li {
    margin-left: 1.3em
}

[class*=colcount-].list-unstyled {
    list-style: none outside none;
    padding-left: 0
}

[class*=colcount-].list-unstyled li {
    margin-left: 0
}

.colcount-xxs-2 {
    -webkit-column-count: 2;
    -moz-column-count: 2;
    column-count: 2
}

.colcount-xxs-3 {
    -webkit-column-count: 3;
    -moz-column-count: 3;
    column-count: 3
}

.colcount-xxs-4 {
    -webkit-column-count: 4;
    -moz-column-count: 4;
    column-count: 4
}

.full-width {
    width: 100%
}

.lst-lwr-alph {
    list-style-type: lower-alpha
}

.lst-upr-alph {
    list-style-type: upper-alpha
}

.lst-lwr-rmn {
    list-style-type: lower-roman
}

.lst-upr-rmn {
    list-style-type: upper-roman
}

.lst-num {
    list-style-type: decimal
}

.lst-spcd > li {
    margin-bottom: 10px
}

.lst-spcd ol, .lst-spcd ul {
    margin-top: 10px
}

.checkbox.required strong.required, .checkbox.required:before, input[type=checkbox].required strong.required, input[type=checkbox].required:before, label.required strong.required, label.required:before, legend.required strong.required, legend.required:before {
    color: #d3080c;
    font-weight: 700
}

.checkbox.required:before, input[type=checkbox].required:before, label.required:before, legend.required:before {
    content: "* ";
    margin-left: -.665em
}

[dir=rtl] label.required:before, [dir=rtl] legend.required:before {
    margin-left: auto;
    margin-right: -.665em
}

summary {
    cursor: pointer
}

summary:focus, summary:hover {
    background: #ddd;
    color: #000
}

summary > :first-child {
    display: inline
}

details {
    padding-left: 1.1em;
    padding-right: 1.1em
}

details > summary {
    margin-left: -1.1em;
    margin-right: -1.1em
}

details[open] {
    padding-bottom: 1em
}

.wb-calevt-cal .cal-days td ul.ev-details, .wb-calevt-cal .cal-days td:hover ul {
    background-color: #fff;
    border: 1px solid #333;
    clip: rect(auto, auto, auto, auto);
    color: #000;
    height: inherit;
    list-style-type: none;
    margin: 0;
    margin-top: -.5em;
    overflow: inherit;
    padding: 0;
    position: absolute;
    width: 10em;
    z-index: 5
}

.wb-calevt-cal .cal-days td ul.ev-details a:focus, .wb-calevt-cal .cal-days td ul.ev-details a:hover, .wb-calevt-cal .cal-days td:hover ul a:focus, .wb-calevt-cal .cal-days td:hover ul a:hover {
    color: #fff
}

.wb-calevt-cal {
    width: 19em
}

.wb-calevt-cal .cal-days .cal-evt {
    background: #176ca7;
    color: #fff
}

.wb-calevt-cal .cal-evt-lnk {
    display: block;
    padding: .5em
}

.wb-calevt-cal.cal-cnt-fluid {
    width: 100%
}

.wb-clndr td > a {
    display: block;
    height: 100%;
    width: 100%
}

.wb-clndr td div, .wb-clndr td > a, .wb-clndr td > time, .wb-clndr th abbr {
    color: #000;
    padding: 20% 0;
    text-align: center
}

.wb-clndr .cal-curr-day, .wb-clndr .cal-curr-day a, .wb-clndr .cal-curr-day div {
    color: #000
}

.wb-clndr {
    background: #fff;
    position: relative;
    width: 100%
}

.wb-clndr .cal-nav {
    background: #333;
    padding: .5em;
    text-align: center
}

.wb-clndr .form-group {
    margin: 0;
    padding: 6px 12px
}

.wb-clndr .btn {
    background: 0 0;
    color: #fff
}

.wb-clndr .btn[disabled] {
    color: #ccc
}

.wb-clndr option[disabled] {
    color: #aaa
}

.wb-clndr table {
    width: 100%
}

.wb-clndr th {
    background: #555;
    border: 1px solid #333
}

.wb-clndr th abbr {
    color: #fff;
    display: block
}

.wb-clndr td {
    background: #fff;
    border: 1px solid #aaa;
    padding: 0;
    text-align: center
}

.wb-clndr td > time {
    display: block
}

.wb-clndr td a:focus, .wb-clndr td a:hover {
    background: #333;
    color: #fff
}

.wb-clndr .cal-curr-day {
    background: #ccc;
    font-weight: bolder
}

figure .pieLabel {
    background-color: #fff;
    border: solid #000 1px;
    color: #000;
    padding: 1px
}

details.alert, details.alert[open] {
    border-radius: 0;
    border-width: 0 0 0 4px;
    padding-left: 45px;
    padding-right: 0;
    position: relative
}

details.alert:before, details.alert[open]:before {
    display: inline-block;
    font-family: "Glyphicons Halflings";
    font-size: 24px;
    margin-left: -1.3em;
    margin-top: -3px;
    position: absolute;
    top: 15px
}

details.alert summary, details.alert[open] summary {
    border-width: 0;
    margin-right: 15px;
    padding-left: 5px
}

details.alert summary:focus, details.alert summary:hover, details.alert[open] summary:focus, details.alert[open] summary:hover {
    text-decoration: none
}

details.alert summary:focus h2, details.alert summary:focus h3, details.alert summary:focus h4, details.alert summary:focus h5, details.alert summary:focus h6, details.alert summary:hover h2, details.alert summary:hover h3, details.alert summary:hover h4, details.alert summary:hover h5, details.alert summary:hover h6, details.alert[open] summary:focus h2, details.alert[open] summary:focus h3, details.alert[open] summary:focus h4, details.alert[open] summary:focus h5, details.alert[open] summary:focus h6, details.alert[open] summary:hover h2, details.alert[open] summary:hover h3, details.alert[open] summary:hover h4, details.alert[open] summary:hover h5, details.alert[open] summary:hover h6 {
    text-decoration: underline
}

details.alert > *, details.alert[open] > * {
    margin-left: .7em
}

details.alert > :first-child, details.alert[open] > :first-child {
    margin-left: .4em
}

details.alert > :first-child:before, details.alert[open] > :first-child:before {
    color: #000;
    content: ""
}

details.alert.alert-success:before, details.alert[open].alert-success:before {
    color: #278400;
    content: "\e084"
}

details.alert.alert-info:before, details.alert[open].alert-info:before {
    color: #269abc;
    content: "\e086"
}

details.alert.alert-warning:before, details.alert[open].alert-warning:before {
    color: #f90;
    content: "\e107"
}

details.alert.alert-danger:before, details.alert[open].alert-danger:before {
    color: #d3080c;
    content: "\e101"
}

.no-details details.alert > summary, .no-details details.alert[open] > summary {
    margin-left: 1.4em
}

.no-details details.alert > summary:before, .no-details details.alert[open] > summary:before {
    content: "\25BA\a0"
}

.no-details details.alert[open] > summary:before, .no-details details.alert[open][open] > summary:before {
    content: "\25BC\a0"
}

.no-details[dir=rtl] details.alert > summary {
    margin-right: 1.4em
}

.wb-dismissable-container {
    background-color: #eee;
    display: table;
    margin: 10px 0;
    padding: 10px;
    width: 100%
}

.wb-dismissable-container .mfp-close {
    color: #555;
    display: table-cell;
    position: static
}

.wb-dismissable-wrapper {
    display: table-cell;
    width: 100%
}

.hght-inhrt {
    min-height: inherit
}

.fn-lnk:focus, .fn-lnk:hover, .wb-fnote .fn-rtn a:focus, .wb-fnote .fn-rtn a:hover, .wb-fnote dd:focus .fn-rtn a {
    background-color: #555;
    border-color: #555;
    color: #fff !important
}

.fn-lnk, .wb-fnote .fn-rtn a {
    background-color: #eee;
    border: 1px solid #ccc;
    display: inline-block;
    padding: 1px 10px 2px;
    white-space: nowrap
}

.wb-fnote dd > ol:first-child, .wb-fnote dd > ul:first-child, .wb-fnote h2, .wb-fnote table:first-child {
    margin-top: .375em
}

.fn-lnk {
    line-height: 1.15;
    margin-left: 5px
}

.wb-fnote {
    border-color: #ccc;
    border-style: solid;
    border-width: 1px 0;
    margin: 2em 0 0
}

.wb-fnote h2 {
    margin-left: 0;
    margin-right: 0
}

.wb-fnote dl {
    margin: 0
}

.wb-fnote dd {
    border: 1px solid transparent;
    margin: .375em 0;
    position: relative
}

.wb-fnote dd:focus {
    background-color: #eee;
    border-color: #555
}

.wb-fnote dd > ol, .wb-fnote dd > ul {
    margin: 0 .375em .375em 4.25em
}

.wb-fnote p {
    margin: 0 0 0 3.875em;
    padding: 0 .375em .375em
}

.wb-fnote p:first-child {
    margin-top: .11em;
    padding-top: .375em
}

.wb-fnote ol, .wb-fnote ul {
    margin-bottom: .375em
}

.wb-fnote table {
    margin: 0 .375em .375em 4.25em
}

.wb-fnote .fn-rtn {
    margin: 0;
    overflow: hidden;
    padding-right: 0;
    padding-top: .375em;
    position: absolute;
    top: 0;
    width: 3.5em
}

.wb-fnote .fn-rtn a {
    display: inline-block;
    margin-top: 0;
    padding-bottom: 0
}

[dir=rtl] sup .fn-lnk {
    margin-left: 0;
    margin-right: 5px
}

[dir=rtl] .wb-fnote p {
    margin: 0 3.875em 0 0
}

[dir=rtl] .wb-fnote .fn-rtn {
    margin-right: 0;
    padding-right: 0
}

.wb-frm label strong.error, .wb-frm legend .error, .wb-frmvld label strong.error, .wb-frmvld legend .error {
    display: inline-block;
    width: 100%
}

.wb-frm label strong.error .label, .wb-frm legend .error .label, .wb-frmvld label strong.error .label, .wb-frmvld legend .error .label {
    font-size: 100%;
    white-space: normal
}

.mfp-bg {
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 1042;
    overflow: hidden;
    position: fixed;
    background: #0b0b0b;
    filter: alpha(opacity=80)
}

.mfp-wrap {
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 1043;
    position: fixed;
    outline: 0 !important;
    -webkit-backface-visibility: hidden
}

.mfp-container {
    text-align: center;
    position: absolute;
    width: 100%;
    height: 100%;
    left: 0;
    top: 0;
    padding: 0 8px;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box
}

.mfp-container:before {
    content: '';
    display: inline-block;
    height: 100%;
    vertical-align: middle
}

.mfp-align-top .mfp-container:before {
    display: none
}

.mfp-content {
    position: relative;
    display: inline-block;
    vertical-align: middle;
    margin: 0 auto;
    text-align: left;
    z-index: 1045
}

.mfp-ajax-holder .mfp-content, .mfp-inline-holder .mfp-content {
    width: 100%;
    cursor: auto
}

.mfp-ajax-cur {
    cursor: progress
}

.mfp-zoom-out-cur, .mfp-zoom-out-cur .mfp-image-holder .mfp-close {
    cursor: -moz-zoom-out;
    cursor: -webkit-zoom-out;
    cursor: zoom-out
}

.mfp-zoom {
    cursor: pointer;
    cursor: -webkit-zoom-in;
    cursor: -moz-zoom-in;
    cursor: zoom-in
}

.mfp-auto-cursor .mfp-content {
    cursor: auto
}

.mfp-arrow, .mfp-close, .mfp-counter, .mfp-preloader {
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none
}

.mfp-loading.mfp-figure {
    display: none
}

.mfp-hide {
    display: none !important
}

.mfp-preloader {
    color: #CCC;
    position: absolute;
    top: 50%;
    width: auto;
    text-align: center;
    margin-top: -.8em;
    left: 8px;
    right: 8px;
    z-index: 1044
}

.mfp-preloader a {
    color: #CCC
}

.mfp-preloader a:hover {
    color: #FFF
}

.mfp-s-error .mfp-content, .mfp-s-ready .mfp-preloader {
    display: none
}

button.mfp-arrow, button.mfp-close {
    overflow: visible;
    cursor: pointer;
    background: 0 0;
    border: 0;
    -webkit-appearance: none;
    display: block;
    outline: 0;
    padding: 0;
    z-index: 1046;
    -webkit-box-shadow: none;
    box-shadow: none
}

button::-moz-focus-inner {
    padding: 0;
    border: 0
}

.mfp-close {
    width: 44px;
    height: 44px;
    line-height: 44px;
    position: absolute;
    right: 0;
    top: 0;
    text-decoration: none;
    text-align: center;
    opacity: .65;
    filter: alpha(opacity=65);
    padding: 0 0 18px 10px;
    color: #FFF;
    font-style: normal;
    font-size: 28px;
    font-family: Arial, Baskerville, monospace
}

.mfp-close:focus, .mfp-close:hover {
    opacity: 1;
    filter: alpha(opacity=100)
}

.mfp-close:active {
    top: 1px
}

.mfp-close-btn-in .mfp-close {
    color: #333
}

.mfp-iframe-holder .mfp-close, .mfp-image-holder .mfp-close {
    color: #FFF;
    right: -6px;
    text-align: right;
    padding-right: 6px;
    width: 100%
}

.mfp-counter {
    position: absolute;
    top: 0;
    right: 0;
    color: #CCC;
    font-size: 12px;
    line-height: 18px;
    white-space: nowrap
}

.mfp-arrow {
    position: absolute;
    opacity: .65;
    filter: alpha(opacity=65);
    margin: 0;
    top: 50%;
    margin-top: -55px;
    padding: 0;
    width: 90px;
    height: 110px;
    -webkit-tap-highlight-color: transparent
}

.mfp-arrow:active {
    margin-top: -54px
}

.mfp-arrow:focus, .mfp-arrow:hover {
    opacity: 1;
    filter: alpha(opacity=100)
}

.mfp-arrow .mfp-a, .mfp-arrow .mfp-b, .mfp-arrow:after, .mfp-arrow:before {
    content: '';
    display: block;
    width: 0;
    height: 0;
    position: absolute;
    left: 0;
    top: 0;
    margin-top: 35px;
    margin-left: 35px;
    border: medium inset transparent
}

.mfp-arrow .mfp-a, .mfp-arrow:after {
    border-top-width: 13px;
    border-bottom-width: 13px;
    top: 8px
}

.mfp-arrow .mfp-b, .mfp-arrow:before {
    border-top-width: 21px;
    border-bottom-width: 21px;
    opacity: .7
}

.mfp-arrow-left {
    left: 0
}

.mfp-arrow-left .mfp-a, .mfp-arrow-left:after {
    border-right: 17px solid #FFF;
    margin-left: 31px
}

.mfp-arrow-left .mfp-b, .mfp-arrow-left:before {
    margin-left: 25px;
    border-right: 27px solid #3F3F3F
}

.mfp-arrow-right {
    right: 0
}

.mfp-arrow-right .mfp-a, .mfp-arrow-right:after {
    border-left: 17px solid #FFF;
    margin-left: 39px
}

.mfp-arrow-right .mfp-b, .mfp-arrow-right:before {
    border-left: 27px solid #3F3F3F
}

.mfp-iframe-holder {
    padding-top: 40px;
    padding-bottom: 40px
}

.mfp-iframe-holder .mfp-content {
    line-height: 0;
    width: 100%;
    max-width: 900px
}

.mfp-iframe-holder .mfp-close {
    top: -40px
}

.mfp-iframe-scaler {
    width: 100%;
    height: 0;
    overflow: hidden;
    padding-top: 56.25%
}

.mfp-iframe-scaler iframe {
    position: absolute;
    display: block;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    -webkit-box-shadow: 0 0 8px rgba(0, 0, 0, .6);
    box-shadow: 0 0 8px rgba(0, 0, 0, .6);
    background: #000
}

img.mfp-img {
    width: auto;
    max-width: 100%;
    height: auto;
    display: block;
    line-height: 0;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    padding: 40px 0;
    margin: 0 auto
}

.mfp-figure {
    line-height: 0
}

.mfp-figure:after {
    content: '';
    position: absolute;
    left: 0;
    top: 40px;
    bottom: 40px;
    display: block;
    right: 0;
    width: auto;
    height: auto;
    z-index: -1;
    -webkit-box-shadow: 0 0 8px rgba(0, 0, 0, .6);
    box-shadow: 0 0 8px rgba(0, 0, 0, .6);
    background: #444
}

.mfp-figure small {
    color: #BDBDBD;
    display: block;
    font-size: 12px;
    line-height: 14px
}

.mfp-figure figure {
    margin: 0
}

.mfp-bottom-bar {
    margin-top: -36px;
    position: absolute;
    top: 100%;
    left: 0;
    width: 100%;
    cursor: auto
}

.mfp-title {
    text-align: left;
    line-height: 18px;
    color: #F3F3F3;
    word-wrap: break-word;
    padding-right: 36px
}

.mfp-image-holder .mfp-content {
    max-width: 100%
}

.mfp-gallery .mfp-image-holder .mfp-figure {
    cursor: pointer
}

@media screen and (max-width: 800px) and (orientation: landscape), screen and (max-height: 300px) {
    .mfp-img-mobile .mfp-image-holder {
        padding-left: 0;
        padding-right: 0
    }

    .mfp-img-mobile img.mfp-img {
        padding: 0
    }

    .mfp-img-mobile .mfp-figure:after {
        top: 0;
        bottom: 0
    }

    .mfp-img-mobile .mfp-figure small {
        display: inline;
        margin-left: 5px
    }

    .mfp-img-mobile .mfp-bottom-bar {
        background: rgba(0, 0, 0, .6);
        bottom: 0;
        margin: 0;
        top: auto;
        padding: 3px 5px;
        position: fixed;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box
    }

    .mfp-img-mobile .mfp-bottom-bar:empty {
        padding: 0
    }

    .mfp-img-mobile .mfp-counter {
        right: 5px;
        top: 3px
    }

    .mfp-img-mobile .mfp-close {
        top: 0;
        right: 0;
        width: 35px;
        height: 35px;
        line-height: 35px;
        background: rgba(0, 0, 0, .6);
        position: fixed;
        text-align: center;
        padding: 0
    }
}

@media all and (max-width: 900px) {
    .mfp-arrow {
        -webkit-transform: scale(0.75);
        -ms-transform: scale(0.75);
        transform: scale(0.75)
    }

    .mfp-arrow-left {
        -webkit-transform-origin: 0;
        -ms-transform-origin: 0;
        transform-origin: 0
    }

    .mfp-arrow-right {
        -webkit-transform-origin: 100%;
        -ms-transform-origin: 100%;
        transform-origin: 100%
    }

    .mfp-container {
        padding-left: 6px;
        padding-right: 6px
    }
}

.mfp-ie7 .mfp-img {
    padding: 0
}

.mfp-ie7 .mfp-bottom-bar {
    width: 600px;
    left: 50%;
    margin-left: -300px;
    margin-top: 5px;
    padding-bottom: 5px
}

.mfp-ie7 .mfp-container {
    padding: 0
}

.mfp-ie7 .mfp-content {
    padding-top: 44px
}

.mfp-ie7 .mfp-close {
    top: 0;
    right: 0;
    padding-top: 0
}

.mfp-arrow:focus, .mfp-close:focus {
    outline: 1px dotted #fff;
    outline-offset: -2px
}

.lbx-hide-gal li {
    display: none;
    list-style-type: none
}

.lbx-hide-gal li:first-child {
    display: block
}

.modal-dialog {
    left: auto;
    padding: 0;
    position: relative
}

.modal-content {
    background: 0 0
}

.modal-body {
    background: #fff
}

.mfp-gallery .modal-body {
    padding: 20px 30px
}

.mfp-close {
    cursor: pointer !important;
    font-weight: 700
}

.mfp-bottom-bar .mfp-title {
    padding-right: 5px;
    width: 75%
}

.mfp-bottom-bar .mfp-counter {
    font-size: 1em;
    text-align: right;
    width: 25%
}

.expicon {
    font-size: .7em;
    margin: 0 -.35em 0 .7em
}

.wb-menu .sm {
    display: none;
    max-height: 0;
    overflow: hidden;
    position: relative
}

.wb-menu .sm.open {
    display: inline;
    max-height: 1000px;
    min-width: 12.5em;
    position: absolute;
    text-transform: none;
    top: auto;
    z-index: 500
}

.wb-menu .sm.open li a {
    text-align: left
}

.wb-menu .sm details > * {
    margin-left: auto;
    margin-right: auto
}

.wb-menu .menu {
    margin-left: 0;
    position: relative
}

.wb-menu .menu > li {
    float: left;
    margin: 0;
    padding: 0
}

.wb-menu .menu > li a {
    display: block;
    padding: 1em;
    text-align: center
}

.wb-menu .menu > li a[aria-haspopup]:focus, .wb-menu .menu > li a[aria-haspopup]:hover {
    cursor: default
}

.wb-menu .sm-open .expicon {
    z-index: -1
}

.wb-menu details, .wb-menu details[open] {
    border: 0;
    margin-bottom: 0
}

.wb-menu details summary, .wb-menu details[open] summary {
    border: 0;
    color: inherit
}

.wb-menu details summary:focus, .wb-menu details summary:hover, .wb-menu details[open] summary:focus, .wb-menu details[open] summary:hover {
    text-decoration: none
}

#mb-pnl nav a.wb-navcurr, #mb-pnl nav summary.wb-navcurr {
    outline: 1px solid
}

#mb-pnl nav a.wb-navcurr:focus, #mb-pnl nav summary.wb-navcurr:focus {
    outline-style: dotted
}

#mb-pnl .srch-pnl, #mb-pnl nav {
    padding: 10px 20px 8px
}

#mb-pnl .srch-pnl form {
    white-space: nowrap
}

#mb-pnl .lng-ofr {
    padding: 7px 15px 0
}

#mb-pnl .lng-ofr ul {
    margin-bottom: 0
}

#mb-pnl .lng-ofr li {
    line-height: normal;
    padding-left: 10px;
    padding-right: 0
}

#mb-pnl .lng-ofr li a {
    padding: 5px
}

#mb-pnl nav ul li.no-sect {
    padding-left: 1.27em
}

#mb-pnl nav ul li.no-sect .list-group {
    margin-bottom: 0
}

#mb-pnl nav ul li.no-sect a {
    margin: 0 0 0 -6px
}

#mb-pnl nav .mb-menu > li {
    padding: 10px 0 2px
}

#mb-pnl nav a {
    display: inline-block;
    margin: 6px 0 6px -6px;
    padding: 0 6px;
    width: 100%
}

#mb-pnl nav summary {
    padding-left: 3px
}

#mb-pnl nav summary.wb-navcurr:focus {
    outline-offset: -2px
}

#mb-pnl details[open] {
    padding-bottom: 0
}

#mb-pnl details ul {
    padding-left: 1.2em
}

#mb-pnl details details {
    margin: 6px 0 6px -1.28em
}

.wb-disable #wb-glb-mn {
    display: none !important
}

[dir=rtl] .wb-menu .menu {
    padding-right: 0
}

[dir=rtl] .wb-menu .menu > li {
    float: right
}

[dir=rtl] .wb-menu .sm.open li a {
    text-align: right
}

[dir=rtl] .expicon {
    margin: 0 .7em 0 -.35em
}

[dir=rtl] #mb-pnl .lng-ofr {
    text-align: left
}

[dir=rtl] #mb-pnl .lng-ofr li {
    padding-left: 0;
    padding-right: 10px
}

[dir=rtl] #mb-pnl nav ul li.no-sect {
    padding-left: 0;
    padding-right: 1.27em
}

[dir=rtl] #mb-pnl nav a {
    margin-left: 0;
    margin-right: -6px
}

[dir=rtl] #mb-pnl nav summary {
    margin-left: 0;
    margin-right: -3px;
    padding-left: 0;
    padding-right: 3px
}

[dir=rtl] #mb-pnl details ul {
    padding-left: 0;
    padding-right: .7em
}

.wb-mltmd.audio .lastpnl, .wb-mltmd.youtube.cc_on .wb-mm-cc {
    display: none
}

.wb-mm-ctrls .btn:focus, .wb-mm-ctrls input[type=range]:focus, .wb-mm-ctrls progress:focus {
    outline: 1px solid #4aafff
}

.wb-mm-ctrls .fd-slider-bar, .wb-mm-ctrls .fd-slider-range {
    background: #aaa;
    border: 0
}

.xxsmallview .wb-mm-ctrls .frstpnl, .xxsmallview .wb-mm-ctrls .lastpnl {
    padding-top: 2em
}

.wb-mltmd iframe, .wb-mltmd object, .wb-mltmd video {
    margin-bottom: -7px;
    width: 100%
}

.wb-mm-cc {
    max-height: 0;
    padding: 0
}

.wb-mm-cc div, .wb-mm-cc:before {
    display: table-cell;
    height: 3em;
    vertical-align: middle
}

.wb-mltmd {
    display: block;
    position: relative
}

.wb-mltmd.video:not(.playing):not(.waiting) .display {
    cursor: pointer;
    position: relative
}

.wb-mltmd.video:not(.playing):not(.waiting) .display:before {
    text-align: center
}

.wb-mltmd.video:not(.playing):not(.waiting) .display:after {
    color: #fff;
    content: "";
    font-family: "Glyphicons Halflings";
    font-size: 65px;
    text-align: center
}

.wb-mltmd.video.playing .errmsg {
    display: none
}

.wb-mltmd.video.waiting .display:after, .wb-mltmd.video.waiting .display:before {
    display: block
}

.wb-mltmd.audio object {
    position: absolute
}

.wb-mltmd video {
    height: auto;
    width: 100%
}

.wb-mltmd.cc_on .wb-mm-cc {
    display: table;
    height: 4em;
    padding: .5em
}

.wb-mltmd.cc_on .cc:after {
    border-bottom: 3px solid #4aafff;
    content: " ";
    display: block;
    margin-left: -2px;
    width: 1.2em
}

.wb-mltmd.skn-lt {
    border-bottom: 1px solid #ddd;
    color: #000
}

.wb-mltmd.skn-lt .wb-mm-ctrls {
    background: #fff;
    color: #000
}

.wb-mltmd.skn-lt .wb-mm-ctrls .btn {
    background: #fff;
    border: 0;
    color: #000
}

.wb-mltmd .wb-share {
    text-align: right
}

.wb-mm-cc {
    background-color: #000;
    color: #fff;
    text-align: center;
    -webkit-transition: all .26s ease;
    transition: all .26s ease;
    width: 100%
}

.wb-mm-cc:before {
    content: " "
}

.wb-mm-ctrls .frstpnl, .wb-mm-ctrls .lastpnl, .wb-mm-ctrls .tline {
    display: table-cell;
    vertical-align: middle
}

.wb-mm-ctrls {
    background: #3e3e3e;
    color: #fff;
    display: table;
    padding-top: 2em;
    position: relative;
    width: 100%
}

.wb-mm-ctrls .btn {
    background: 0 0;
    border: 0;
    border-top-left-radius: 0 !important;
    border-top-right-radius: 0 !important;
    color: #fff;
    font-size: 130%
}

.wb-mm-ctrls .frstpnl {
    text-align: center;
    width: 13em
}

.wb-mm-ctrls .lastpnl {
    text-align: center;
    width: 3em
}

.wb-mm-ctrls .tline .wb-mm-tmln-crrnt:after {
    content: " / ";
    padding: 0 .5em
}

.wb-mm-ctrls .wb-mm-txtonly {
    padding: 0 1em
}

.wb-mm-ctrls .wb-mm-txtonly p {
    display: inline
}

.wb-mm-ctrls .wb-mm-prgrss, .wb-mm-ctrls .wb-mm-txtonly {
    display: table-cell;
    vertical-align: middle
}

.wb-mm-ctrls progress {
    -webkit-appearance: none;
    background: #fff;
    border: 7px solid #3e3e3e;
    border-radius: 14px;
    color: #176ca7;
    display: block;
    height: 30px;
    left: 0;
    padding: 2px;
    position: absolute;
    top: 0;
    width: 100%
}

.wb-mm-ctrls progress.wb-progress-inited {
    overflow: hidden;
    padding: 0
}

.wb-mm-ctrls progress::-webkit-progress-bar {
    background: #fff
}

.wb-mm-ctrls progress::-webkit-progress-value {
    background: #176ca7;
    border-radius: 7px
}

.wb-mm-ctrls progress::-moz-progress-bar {
    background: #176ca7;
    border-radius: 7px
}

.wb-mm-ctrls .progress {
    height: 22px
}

.wb-mm-ctrls input[type=range] {
    -webkit-appearance: none;
    background: 0 0;
    display: inline-block;
    height: 2.5em;
    padding: 0;
    width: 7em
}

.wb-mm-ctrls input[type=range]::-webkit-slider-runnable-track {
    background: #aaa;
    height: 4px
}

.wb-mm-ctrls input[type=range]::-webkit-slider-thumb {
    margin-top: -8px
}

.wb-mm-ctrls input[type=range]::-moz-range-track {
    background: #aaa;
    border: 0
}

.wb-mm-ctrls input[type=range]::-moz-range-thumb {
    border-radius: 0;
    height: 1.3em;
    width: 10px
}

.wb-mm-ctrls input[type=range]::-ms-track {
    height: 4px
}

.wb-mm-ctrls input[type=range]::-ms-fill-upper {
    background: #aaa
}

.wb-mm-ctrls input[type=range]::-ms-fill-lower {
    background: #aaa
}

.wb-mm-ctrls input[type=range]::-ms-thumb {
    background: #fff;
    border: 1px outset #fff;
    height: 1.3em
}

.wb-mm-ctrls .fd-slider {
    display: inline-block;
    height: 100%;
    margin-top: 10px;
    width: 7em
}

.wb-mm-ctrls .fd-slider-handle {
    background: #fff;
    border: 1px outset #fff;
    width: 10px
}

.xxsmallview .wb-mm-ctrls .wb-mm-txtonly {
    left: 0;
    margin-top: -2em;
    position: absolute
}

.wb-overlay {
    -webkit-background-clip: border-box;
    background-clip: border-box;
    background-color: #fff;
    border: 0;
    border-radius: 0;
    display: none;
    -webkit-transform: translateZ(0);
    transform: translateZ(0);
    z-index: 1050
}

.wb-overlay.wb-inview {
    display: block
}

.wb-overlay.open {
    display: inline-block;
    position: fixed
}

.wb-panel-l, .wb-panel-r {
    height: 100%;
    max-width: 90%;
    top: 0
}

.wb-bar-b, .wb-bar-t {
    border-bottom: 0;
    left: 0;
    max-height: 90%;
    min-width: 100%
}

.wb-popup-mid {
    max-height: 90%;
    max-width: 90%
}

.wb-panel-l {
    left: 0
}

.wb-panel-r {
    right: 0
}

.wb-bar-t {
    top: 0
}

.wb-bar-b {
    bottom: 0
}

.wb-popup-mid {
    border-radius: 6px;
    bottom: 0;
    left: 0;
    margin: auto;
    right: 0;
    top: 0
}

.wb-popup-full {
    height: 100%;
    left: 0;
    top: 0;
    width: 100%
}

.mfp-bg {
    opacity: .97
}

.overlay-def {
    overflow-y: auto
}

.overlay-def header {
    color: #fff;
    display: block;
    padding: 0 44px 0 1em
}

.overlay-def .modal-title {
    font-size: 1.15em;
    padding: 10px 0
}

.overlay-def.wb-bar-b, .overlay-def.wb-bar-t {
    background-color: #000
}

.overlay-def .mfp-close {
    color: #fff
}

.hidden-hd .modal-body {
    padding-top: 50px
}

.hidden-hd .overlay-close {
    background-color: #000;
    border-radius: 999px;
    height: 1em;
    line-height: 1em;
    margin-right: 20px;
    margin-top: 10px;
    width: 1em
}

[dir=rtl] .mfp-close {
    left: 0;
    right: auto
}

[dir=rtl] .wb-panel-l {
    left: auto;
    right: 0
}

[dir=rtl] .wb-panel-r {
    left: 0;
    right: auto
}

[dir=rtl] .overlay-def header {
    padding: 0 1em 0 44px
}

.pln {
    color: #000
}

pre.prettyprint {
    background-color: #f5f5f5;
    border: 1px solid #ddd;
    color: #707070;
    font-size: 95%;
    padding: 8px
}

pre.prettyprint.linenums {
    -webkit-box-shadow: 40px 0 0 #fbfbfc inset, 41px 0 0 #eee inset;
    box-shadow: 40px 0 0 #fbfbfc inset, 41px 0 0 #eee inset
}

ol.linenums {
    margin: 0 !important
}

ol.linenums li {
    padding-left: 10px;
    text-shadow: 0 1px 0 #fff
}

[dir=rtl] pre.prettyprint {
    direction: ltr
}

#wb-rsz {
    clip: rect(1px, 1px, 1px, 1px);
    margin: 0;
    overflow: hidden;
    position: absolute;
    top: -1000px
}

#wb-sessto-modal .modal-footer {
    background: #fff;
    margin-top: 0
}

.shr-pg .bitly:before, .shr-pg .blogger:before, .shr-pg .delicious:before, .shr-pg .digg:before, .shr-pg .diigo:before, .shr-pg .facebook:before, .shr-pg .feed:before, .shr-pg .gmail:before, .shr-pg .googleplus:before, .shr-pg .linkedin:before, .shr-pg .myspace:before, .shr-pg .pinterest:before, .shr-pg .reddit:before, .shr-pg .stumbleupon:before, .shr-pg .tumblr:before, .shr-pg .twitter:before, .shr-pg .yahoomail:before {
    background: url(../../wet-boew/assets/sprites_share.png) no-repeat
}

.shr-pg .bitly:before {
    background-position: 0 0
}

.shr-pg .blogger:before {
    background-position: 0 -32px
}

.shr-pg .delicious:before {
    background-position: 0 -64px
}

.shr-pg .digg:before {
    background-position: 0 -96px
}

.shr-pg .diigo:before {
    background-position: 0 -128px
}

.shr-pg .facebook:before {
    background-position: 0 -160px
}

.shr-pg .feed:before {
    background-position: 0 -192px
}

.shr-pg .gmail:before {
    background-position: 0 -224px
}

.shr-pg .googleplus:before {
    background-position: 0 -256px
}

.shr-pg .linkedin:before {
    background-position: 0 -288px
}

.shr-pg .myspace:before {
    background-position: 0 -320px
}

.shr-pg .pinterest:before {
    background-position: 0 -352px
}

.shr-pg .reddit:before {
    background-position: 0 -384px
}

.shr-pg .stumbleupon:before {
    background-position: 0 -416px
}

.shr-pg .tumblr:before {
    background-position: 0 -448px
}

.shr-pg .twitter:before {
    background-position: 0 -480px
}

.shr-pg .yahoomail:before {
    background-position: 0 -512px
}

.shr-opn span {
    padding-right: .2em
}

.shr-pg .shr-lnk {
    font-size: 115%;
    line-height: 32px;
    margin-bottom: 8px;
    min-height: 32px;
    text-align: left;
    text-decoration: none;
    width: 100%
}

.shr-pg .shr-lnk:before {
    content: " ";
    display: inline-block;
    height: 32px;
    margin-right: .6em;
    vertical-align: middle;
    width: 32px
}

.shr-pg .shr-dscl {
    padding-bottom: 0
}

.shr-pg .email:before {
    content: "\2709";
    display: inline-block;
    font-family: "Glyphicons Halflings";
    font-size: 32px;
    margin-right: .3em
}

.shr-pg .shr-pg {
    text-align: left
}

.shr-pg ul {
    list-style-type: none;
    margin: 10px;
    padding: 0
}

[dir=rtl] .shr-opn span {
    padding-left: .2em;
    padding-right: 0
}

[dir=rtl] .shr-pg, [dir=rtl] .shr-pg .shr-lnk {
    text-align: right
}

[dir=rtl] .shr-pg .shr-lnk:before {
    margin-left: .4em;
    margin-right: auto
}

[dir=rtl] .email:before {
    margin-left: .6em;
    margin-right: auto
}

.dataTables_wrapper .dataTables_scroll, table.dataTable {
    clear: both
}

table.dataTable thead td:active, table.dataTable thead th:active {
    outline: 0
}

.dataTables_wrapper .dataTables_filter, .dataTables_wrapper .dataTables_length {
    font-weight: 400
}

table.dataTable tfoot th, table.dataTable thead th {
    font-weight: 700
}

.dataTables_wrapper.no-footer .dataTables_scrollBody, table.dataTable tfoot td, table.dataTable tfoot th, table.dataTable thead td, table.dataTable thead th, table.dataTable.no-footer {
    border-bottom: 1px solid #111
}

table.dataTable td.right, table.dataTable th.right {
    text-align: right
}

table.dataTable td.center, table.dataTable td.dataTables_empty, table.dataTable th.center {
    text-align: center
}

table.dataTable.display tbody td, table.dataTable.display tbody th, table.dataTable.rowborder tbody td, table.dataTable.rowborder tbody th {
    border-top: 1px solid #ddd
}

table.dataTable.cell-border tbody tr:first-child td, table.dataTable.cell-border tbody tr:first-child th, table.dataTable.display tbody tr:first-child td, table.dataTable.display tbody tr:first-child th, table.dataTable.rowborder tbody tr:first-child td, table.dataTable.rowborder tbody tr:first-child th {
    border-top: 0
}

table.dataTable.cell-border tbody td, table.dataTable.cell-border tbody th {
    border-right: 1px solid #ddd;
    border-top: 1px solid #ddd
}

table.dataTable.cell-border tbody tr td:first-child, table.dataTable.cell-border tbody tr th:first-child {
    border-left: 1px solid #ddd
}

.dataTables_wrapper .dataTables_filter, .dataTables_wrapper .dataTables_info, .dataTables_wrapper .dataTables_length, .dataTables_wrapper .dataTables_processing {
    color: #333
}

table.dataTable.display tbody tr.even:hover.selected > .sorting_1, table.dataTable.display tbody tr.odd:hover.selected > .sorting_1, table.dataTable.display tbody tr:hover.selected > .sorting_1, table.dataTable.order-column.hover tbody tr.even:hover.selected > .sorting_1, table.dataTable.order-column.hover tbody tr.odd:hover.selected > .sorting_1, table.dataTable.order-column.hover tbody tr:hover.selected > .sorting_1 {
    background-color: #a1aec7
}

table.dataTable.display tbody tr.even:hover.selected > .sorting_2, table.dataTable.display tbody tr.odd:hover.selected > .sorting_2, table.dataTable.display tbody tr:hover.selected > .sorting_2, table.dataTable.order-column.hover tbody tr.even:hover.selected > .sorting_2, table.dataTable.order-column.hover tbody tr.odd:hover.selected > .sorting_2, table.dataTable.order-column.hover tbody tr:hover.selected > .sorting_2 {
    background-color: #a2afc8
}

table.dataTable.display tbody tr.even:hover.selected > .sorting_3, table.dataTable.display tbody tr.odd:hover.selected > .sorting_3, table.dataTable.display tbody tr:hover.selected > .sorting_3, table.dataTable.order-column.hover tbody tr.even:hover.selected > .sorting_3, table.dataTable.order-column.hover tbody tr.odd:hover.selected > .sorting_3, table.dataTable.order-column.hover tbody tr:hover.selected > .sorting_3 {
    background-color: #a4b2cb
}

table.dataTable.display tbody tr.odd.selected > .sorting_1, table.dataTable.order-column.stripe tbody tr.odd.selected > .sorting_1 {
    background-color: #a6b3cd
}

table.dataTable.display tbody tr.odd.selected > .sorting_2, table.dataTable.order-column.stripe tbody tr.odd.selected > .sorting_2 {
    background-color: #a7b5ce
}

table.dataTable.display tbody tr.odd.selected > .sorting_3, table.dataTable.order-column.stripe tbody tr.odd.selected > .sorting_3 {
    background-color: #a9b6d0
}

table.dataTable.display tbody tr.even.selected:hover, table.dataTable.display tbody tr.odd.selected:hover, table.dataTable.display tbody tr.selected:hover, table.dataTable.hover tbody tr.even.selected:hover, table.dataTable.hover tbody tr.odd.selected:hover, table.dataTable.hover tbody tr.selected:hover {
    background-color: #a9b7d1
}

table.dataTable.display tbody tr.odd.selected, table.dataTable.stripe tbody tr.odd.selected {
    background-color: #abb9d3
}

table.dataTable.display tbody tr.even.selected > .sorting_1, table.dataTable.display tbody tr.selected > .sorting_1, table.dataTable.display tbody tr.selected > .sorting_2, table.dataTable.display tbody tr.selected > .sorting_3, table.dataTable.order-column tbody tr.selected > .sorting_1, table.dataTable.order-column tbody tr.selected > .sorting_2, table.dataTable.order-column tbody tr.selected > .sorting_3, table.dataTable.order-column.stripe tbody tr.even.selected > .sorting_1 {
    background-color: #acbad4
}

table.dataTable.display tbody tr.even.selected > .sorting_2, table.dataTable.order-column.stripe tbody tr.even.selected > .sorting_2 {
    background-color: #adbbd6
}

table.dataTable.display tbody tr.even.selected > .sorting_3, table.dataTable.order-column.stripe tbody tr.even.selected > .sorting_3 {
    background-color: #afbdd8
}

table.dataTable thead .sorting_asc, table.dataTable thead .sorting_desc {
    background-color: #e7e7e7
}

table.dataTable.display tbody tr.even:hover > .sorting_1, table.dataTable.display tbody tr.odd:hover > .sorting_1, table.dataTable.display tbody tr:hover > .sorting_1, table.dataTable.order-column.hover tbody tr.even:hover > .sorting_1, table.dataTable.order-column.hover tbody tr.odd:hover > .sorting_1, table.dataTable.order-column.hover tbody tr:hover > .sorting_1 {
    background-color: #eaeaea
}

table.dataTable.display tbody tr.even:hover > .sorting_2, table.dataTable.display tbody tr.odd:hover > .sorting_2, table.dataTable.display tbody tr:hover > .sorting_2, table.dataTable.order-column.hover tbody tr.even:hover > .sorting_2, table.dataTable.order-column.hover tbody tr.odd:hover > .sorting_2, table.dataTable.order-column.hover tbody tr:hover > .sorting_2 {
    background-color: #ebebeb
}

table.dataTable.display tbody tr.even:hover > .sorting_3, table.dataTable.display tbody tr.odd:hover > .sorting_3, table.dataTable.display tbody tr:hover > .sorting_3, table.dataTable.order-column.hover tbody tr.even:hover > .sorting_3, table.dataTable.order-column.hover tbody tr.odd:hover > .sorting_3, table.dataTable.order-column.hover tbody tr:hover > .sorting_3 {
    background-color: #eee
}

table.dataTable.display tbody tr.odd > .sorting_1, table.dataTable.order-column.stripe tbody tr.odd > .sorting_1 {
    background-color: #f1f1f1
}

table.dataTable.display tbody tr.odd > .sorting_2, table.dataTable.order-column.stripe tbody tr.odd > .sorting_2 {
    background-color: #f3f3f3
}

table.dataTable.display tbody tr.even:hover, table.dataTable.display tbody tr.odd:hover, table.dataTable.display tbody tr.odd > .sorting_3, table.dataTable.display tbody tr:hover, table.dataTable.hover tbody tr.even:hover, table.dataTable.hover tbody tr.odd:hover, table.dataTable.hover tbody tr:hover, table.dataTable.order-column.stripe tbody tr.odd > .sorting_3 {
    background-color: #f5f5f5
}

table.dataTable.display tbody tr.even > .sorting_1, table.dataTable.display tbody tr.odd, table.dataTable.display tbody tr > .sorting_1, table.dataTable.display tbody tr > .sorting_2, table.dataTable.display tbody tr > .sorting_3, table.dataTable.order-column tbody tr > .sorting_1, table.dataTable.order-column tbody tr > .sorting_2, table.dataTable.order-column tbody tr > .sorting_3, table.dataTable.order-column.stripe tbody tr.even > .sorting_1, table.dataTable.stripe tbody tr.odd {
    background-color: #f9f9f9
}

table.dataTable.display tbody tr.even > .sorting_2, table.dataTable.order-column.stripe tbody tr.even > .sorting_2 {
    background-color: #fbfbfb
}

table.dataTable.display tbody tr.even > .sorting_3, table.dataTable.order-column.stripe tbody tr.even > .sorting_3 {
    background-color: #fdfdfd
}

table.dataTable, table.dataTable td, table.dataTable th {
    -webkit-box-sizing: content-box;
    -moz-box-sizing: content-box;
    box-sizing: content-box
}

table.dataTable thead .sorting_asc .sorting-icons:before, table.dataTable thead .sorting_desc .sorting-icons:after {
    background: #ccc;
    border: 1px solid #111
}

table.dataTable thead .sorting .sorting-icons:after, table.dataTable thead .sorting .sorting-icons:before, table.dataTable thead .sorting_asc .sorting-icons:after, table.dataTable thead .sorting_desc .sorting-icons:before {
    background: #fff;
    border: 1px solid #aaa;
    color: #757575
}

table.dataTable thead .sorting, table.dataTable thead .sorting_asc, table.dataTable thead .sorting_desc {
    cursor: pointer
}

table.dataTable thead .sorting .sorting-icons, table.dataTable thead .sorting_asc .sorting-icons, table.dataTable thead .sorting_asc_disabled .sorting-icons, table.dataTable thead .sorting_desc .sorting-icons, table.dataTable thead .sorting_desc_disabled .sorting-icons {
    display: inline-block
}

table.dataTable {
    border-collapse: separate;
    border-spacing: 0;
    margin: 0 auto;
    width: 100% !important
}

table.dataTable thead .sorting-cnt {
    white-space: nowrap
}

table.dataTable thead .sorting-cnt:before {
    content: " "
}

table.dataTable thead .sorting-icons {
    margin-top: 2px
}

table.dataTable thead .sorting-icons:before {
    content: "\e093";
    padding: 0 .1em 0 0
}

table.dataTable thead .sorting-icons:after {
    content: "\e094";
    padding: 0 .04em 0 .06em
}

table.dataTable tbody tr {
    background-color: #fff
}

table.dataTable tbody tr.selected {
    background-color: #b0bed9
}

.dataTables_wrapper .dataTables_scroll div.dataTables_scrollBody td > div.dataTables_sizing, .dataTables_wrapper .dataTables_scroll div.dataTables_scrollBody th > div.dataTables_sizing {
    height: 0;
    margin: 0 !important;
    overflow: hidden;
    padding: 0 !important
}

.dataTables_wrapper .dataTables_paginate .paginate_button.current:first-child, .dataTables_wrapper .dataTables_paginate .paginate_button.previous {
    border-bottom-left-radius: 4px;
    border-top-left-radius: 4px;
    margin-left: 0
}

.dataTables_wrapper .dataTables_paginate .paginate_button.current:last-child, .dataTables_wrapper .dataTables_paginate .paginate_button.next {
    border-bottom-right-radius: 4px;
    border-top-right-radius: 4px
}

.dataTables_wrapper {
    clear: both;
    position: relative;
    zoom: 1
}

.dataTables_wrapper .dataTables_filter {
    float: left;
    margin-right: 15px
}

.dataTables_wrapper .dataTables_filter input {
    margin-left: .5em
}

.dataTables_wrapper .dataTables_length {
    display: inline-block;
    margin-top: 5px
}

.dataTables_wrapper .dataTables_info {
    display: inline-block
}

.dataTables_wrapper .dataTables_paginate {
    padding-top: 1.25em;
    text-align: center
}

.dataTables_wrapper .dataTables_paginate .paginate_button {
    background-color: #eaebed;
    border: 1px solid #dcdee1;
    color: #335075;
    cursor: pointer;
    display: inline-block;
    line-height: 1.4375;
    margin-bottom: .5em;
    margin-left: -1px;
    padding: 10px 16px;
    position: relative;
    text-decoration: none
}

.dataTables_wrapper .dataTables_paginate .paginate_button.current {
    background-color: #2572b4;
    border-color: #2572b4;
    color: #fff;
    cursor: default;
    z-index: 2
}

.dataTables_wrapper .dataTables_paginate .paginate_button:active, .dataTables_wrapper .dataTables_paginate .paginate_button:focus, .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
    background-color: #d4d6da;
    border-color: #bbbfc5;
    color: #335075
}

.dataTables_wrapper .dataTables_processing {
    background: -webkit-gradient(linear, left top, right top, from(rgba(255, 255, 255, 0)), color-stop(25%, rgba(255, 255, 255, .9)), color-stop(75%, rgba(255, 255, 255, .9)), to(rgba(255, 255, 255, 0)));
    background: -webkit-linear-gradient(left, rgba(255, 255, 255, 0) 0, rgba(255, 255, 255, .9) 25%, rgba(255, 255, 255, .9) 75%, rgba(255, 255, 255, 0) 100%);
    background: linear-gradient(to right, rgba(255, 255, 255, 0) 0, rgba(255, 255, 255, .9) 25%, rgba(255, 255, 255, .9) 75%, rgba(255, 255, 255, 0) 100%);
    background-color: #fff;
    font-size: 1.2em;
    height: 40px;
    left: 50%;
    margin-left: -50%;
    margin-top: -25px;
    padding-top: 20px;
    position: absolute;
    text-align: center;
    top: 50%;
    width: 100%
}

.dataTables_wrapper .dataTables_scroll div.dataTables_scrollBody {
    -webkit-overflow-scrolling: touch
}

.dataTables_wrapper.no-footer div.dataTables_scrollBody table, .dataTables_wrapper.no-footer div.dataTables_scrollHead table {
    border-bottom: 0
}

.dataTables_wrapper:after {
    clear: both;
    content: "";
    display: block;
    height: 0;
    visibility: hidden
}

[dir=rtl] table.dataTable thead .sorting, [dir=rtl] table.dataTable thead .sorting_asc, [dir=rtl] table.dataTable thead .sorting_asc_disabled, [dir=rtl] table.dataTable thead .sorting_desc, [dir=rtl] table.dataTable thead .sorting_desc_disabled {
    text-align: right
}

[dir=rtl] table.dataTable thead .sorting:after, [dir=rtl] table.dataTable thead .sorting_asc:after, [dir=rtl] table.dataTable thead .sorting_asc_disabled:after, [dir=rtl] table.dataTable thead .sorting_desc:after, [dir=rtl] table.dataTable thead .sorting_desc_disabled:after {
    margin-left: 0;
    margin-right: 5px
}

[dir=rtl] .dataTables_wrapper .dataTables_paginate .paginate_button.current:first-child, [dir=rtl] .dataTables_wrapper .dataTables_paginate .paginate_button.previous {
    border-bottom-left-radius: 0;
    border-top-left-radius: 0;
    border-bottom-right-radius: 4px;
    border-top-right-radius: 4px
}

[dir=rtl] .dataTables_wrapper .dataTables_paginate .paginate_button.current:last-child, [dir=rtl] .dataTables_wrapper .dataTables_paginate .paginate_button.next {
    border-bottom-left-radius: 4px;
    border-top-left-radius: 4px;
    border-bottom-right-radius: 0;
    border-top-right-radius: 0
}

[dir=rtl] .dataTables_wrapper .dataTables_info, [dir=rtl] .dataTables_wrapper .dataTables_length {
    float: right
}

[dir=rtl] .dataTables_wrapper .dataTables_filter {
    float: left;
    text-align: left
}

[dir=rtl] .dataTables_wrapper .dataTables_filter input {
    margin-left: auto;
    margin-right: .5em
}

.wb-tabs [role=tablist].allow-wrap li, .wb-tabs.carousel-s1 [role=tablist] > li, .wb-tabs.carousel-s2 [role=tablist] > li {
    margin: 0 10px 0 0
}

.wb-tabs, .wb-tabs.carousel-s1 figure, .wb-tabs.carousel-s2 figure {
    position: relative
}

.wb-tabs.carousel-s1 [role=tablist] > li, .wb-tabs.carousel-s2 [role=tablist] > li {
    z-index: 100
}

.wb-tabs.carousel-s1 figure, .wb-tabs.carousel-s2 figure {
    background: #243850;
    background: rgba(36, 56, 80, .9)
}

.wb-tabs.carousel-s1 figure img, .wb-tabs.carousel-s2 figure img {
    height: auto;
    width: 100%
}

.wb-tabs.carousel-s1 figcaption, .wb-tabs.carousel-s2 figcaption {
    bottom: 0;
    color: #fff;
    left: 0;
    padding: .5em 1em;
    position: relative;
    right: 0;
    z-index: 101
}

.wb-tabs.carousel-s1 [role=tabpanel] a, .wb-tabs.carousel-s1 figcaption a, .wb-tabs.carousel-s2 [role=tabpanel] a, .wb-tabs.carousel-s2 figcaption a {
    color: #fff
}

.wb-tabs.carousel-s2 [role=tablist] > li.nxt, .wb-tabs.carousel-s2 [role=tablist] > li.prv {
    background: 0 0;
    margin: 0;
    padding: 0
}

.wb-tabs.carousel-s2 [role=tablist] > li.nxt a, .wb-tabs.carousel-s2 [role=tablist] > li.prv a {
    border: 0;
    padding: 10px 5px;
    width: 100%
}

.wb-tabs.carousel-s2 [role=tablist] > li.nxt a .glyphicon, .wb-tabs.carousel-s2 [role=tablist] > li.plypause a, .wb-tabs.carousel-s2 [role=tablist] > li.prv a .glyphicon {
    background: #fff;
    border-radius: 999px;
    -webkit-box-shadow: 0 0 4px #243850;
    box-shadow: 0 0 4px #243850
}

.wb-tabs.carousel-s2 [role=tablist] > li.nxt a, .wb-tabs.carousel-s2 [role=tablist] > li.plypause a, .wb-tabs.carousel-s2 [role=tablist] > li.prv a {
    color: #243850
}

.wb-tabs.carousel-s2 [role=tablist] > li.nxt a .glyphicon, .wb-tabs.carousel-s2 [role=tablist] > li.prv a .glyphicon {
    font-size: 1.75em;
    height: 1.75em;
    line-height: 1.75em;
    margin: auto 0;
    text-align: center;
    width: 1.75em
}

.wb-tabs.carousel-s2 [role=tablist] > li.nxt a:focus, .wb-tabs.carousel-s2 [role=tablist] > li.nxt a:hover, .wb-tabs.carousel-s2 [role=tablist] > li.prv a:focus, .wb-tabs.carousel-s2 [role=tablist] > li.prv a:hover {
    background: 0 0
}

.wb-tabs.carousel-s2 [role=tablist] > li.nxt a:focus .glyphicon, .wb-tabs.carousel-s2 [role=tablist] > li.nxt a:hover .glyphicon, .wb-tabs.carousel-s2 [role=tablist] > li.plypause a:focus, .wb-tabs.carousel-s2 [role=tablist] > li.plypause a:hover, .wb-tabs.carousel-s2 [role=tablist] > li.prv a:focus .glyphicon, .wb-tabs.carousel-s2 [role=tablist] > li.prv a:hover .glyphicon {
    -webkit-box-shadow: none;
    box-shadow: none
}

.wb-tabs.carousel-s1 [role=tablist] > li.active a, .wb-tabs.carousel-s1 [role=tablist] > li:focus a, .wb-tabs.carousel-s1 [role=tablist] > li:hover a {
    border-top: 0;
    padding-top: 10px
}

.wb-tabs [role=tablist] > li, .wb-tabs [role=tablist] > li a, .wb-tabs.carousel-s1 [role=tablist] > li.control, .wb-tabs.carousel-s2 [role=tablist] > li.control {
    display: inline-block
}

.wb-tabs.carousel-s1 figcaption p, .wb-tabs.carousel-s2 figcaption p {
    margin-bottom: 0
}

.wb-tabs > .tabpanels > details, .wb-tabs > details {
    padding: 6px 12px
}

.wb-tabs > .tabpanels > details > summary, .wb-tabs > details > summary {
    margin: -6px -12px;
    padding: 6px 12px
}

.csstransitions .wb-tabs [role=tabpanel].out {
    position: absolute;
    top: 0;
    width: 100%;
    z-index: 0
}

.wb-tabs details[open] {
    border-top-left-radius: 0
}

.wb-tabs > .tabpanels {
    overflow: hidden;
    position: relative
}

.wb-tabs [role=tablist] {
    border-spacing: 10px 0;
    display: table;
    list-style: none;
    margin: 0;
    padding: 0;
    position: relative
}

.wb-tabs [role=tablist] > li {
    background: #ebf2fc;
    border-color: #ccc;
    border-style: solid;
    border-width: 1px;
    color: #000;
    cursor: pointer;
    display: table-cell;
    left: -10px;
    position: relative;
    text-align: center
}

.wb-tabs [role=tablist] > li a {
    color: #000;
    padding: 10px;
    text-decoration: none
}

.wb-tabs [role=tablist] > li:focus, .wb-tabs [role=tablist] > li:hover {
    background: #ccc;
    background: rgba(204, 204, 204, .9)
}

.wb-tabs [role=tablist] > li.active {
    background: #fff;
    border-bottom: 0;
    cursor: default;
    padding-bottom: 1px;
    z-index: 2
}

.wb-tabs [role=tablist] > li.active a {
    border-color: #666;
    border-style: solid;
    border-width: 4px 0 0;
    cursor: default;
    padding-top: 6px
}

.wb-tabs [role=tablist] > li.tab-count {
    line-height: normal
}

.wb-tabs [role=tablist] > li.tab-count > div {
    position: relative;
    top: .4em
}

.wb-tabs [role=tablist] > li.tab-count .curr-count {
    font-size: 1.5em
}

.wb-tabs [role=tablist] > li.tab-count:focus, .wb-tabs [role=tablist] > li.tab-count:hover {
    background: 0 0;
    cursor: default
}

.wb-tabs [role=tablist].generated li {
    border-bottom: 0;
    top: 1px
}

.wb-tabs [role=tablist].allow-wrap {
    border-spacing: 0;
    display: block
}

.wb-tabs [role=tablist].allow-wrap li {
    display: inline-block;
    left: auto
}

.wb-tabs [role=tabpanel] {
    overflow-x: auto;
    position: relative;
    z-index: 1
}

.wb-tabs.carousel-s1 {
    border-top: 0
}

.wb-tabs.carousel-s1 [role=tablist] {
    bottom: 1em;
    left: 1em;
    position: static
}

.wb-tabs.carousel-s1 [role=tablist] > li.prv {
    margin-right: 5px
}

.wb-tabs.carousel-s1 [role=tablist] > li.tab-count {
    background: 0 0;
    border: 0;
    font-size: .9em
}

.wb-tabs.carousel-s1 [role=tablist] > li.tab-count > div {
    top: .7em
}

.wb-tabs.carousel-s1 [role=tablist] > li.tab-count.active, .wb-tabs.carousel-s1 [role=tablist] > li.tab-count:focus, .wb-tabs.carousel-s1 [role=tablist] > li.tab-count:hover {
    cursor: default;
    top: 0
}

.wb-tabs.carousel-s1 [role=tablist] > li.active, .wb-tabs.carousel-s1 [role=tablist] > li:focus, .wb-tabs.carousel-s1 [role=tablist] > li:hover {
    top: 1px
}

.wb-tabs.carousel-s2 {
    background: #eee
}

.wb-tabs.carousel-s2.wb-init {
    padding-bottom: 4.375em
}

.wb-tabs.carousel-s2.exclude-controls {
    padding-bottom: 0
}

.wb-tabs.carousel-s2 [role=tablist] {
    bottom: 0;
    position: absolute;
    width: 100%
}

.wb-tabs.carousel-s2 [role=tablist] > li {
    background: 0 0;
    border: 0
}

.wb-tabs.carousel-s2 [role=tablist] > li.prv a {
    padding-left: 1em
}

.wb-tabs.carousel-s2 [role=tablist] > li.plypause {
    background: 0 0;
    border: 0;
    float: right;
    margin-right: 0;
    padding: 2px 0
}

.wb-tabs.carousel-s2 [role=tablist] > li.plypause a {
    font-size: 1.5em;
    margin-right: .65em;
    margin-top: .4em;
    padding: 8px 10px 4px
}

.wb-disable .csstransitions .wb-tabs [role=tabpanel].out {
    position: static;
    width: auto
}

.wb-disable .wb-tabs [role=tablist] {
    display: none
}

.wb-disable .wb-tabs [role=tabpanel] {
    display: block;
    opacity: 1
}

.wb-disable .wb-twitter .twitter-timeline {
    text-indent: 0 !important
}

.wb-twitter .twitter-timeline {
    display: block
}

.wb-twitter iframe[style] {
    width: 100% !important
}

.wb-enable .wb-twitter .twitter-timeline {
    min-height: 100px;
    min-width: 100px;
    position: relative
}

.wb-txthl .txthl {
    background-color: #ff0;
    color: #000;
    font-weight: 700
}

.olButtonGeolocateItemActive, .olButtonGeolocateItemInactive {
    background: url(../../wet-boew/assets/sprites_geomap.png) no-repeat
}

.olControlDragFeatureOver, .olDragDown {
    cursor: move
}

.olHandlerBoxSelectFeature, .olHandlerBoxZoomBox {
    background-color: #fff;
    font-size: .01em;
    opacity: .5;
    position: absolute
}

.olButtonGeolocateItemActive, .olButtonGeolocateItemInactive {
    -webkit-background-size: 33px auto;
    background-size: 33px auto
}

.olButton {
    height: 33px;
    width: 33px
}

.olButton img {
    float: left;
    height: 33px;
    left: 0;
    margin: 0;
    top: 0;
    width: 33px
}

.olControlzoomin {
    left: 15px;
    top: 10px
}

.olControlzoomout {
    left: 15px;
    top: 43px
}

.olControlzoomworld {
    left: 15px;
    top: 83px
}

.olPanelGeolocate {
    left: 19px;
    top: 127px
}

.olPanelGeolocate button {
    border: 0;
    cursor: pointer;
    height: 33px;
    width: 33px
}

.olButtonGeolocateItemInactive {
    background-position: 0 -34px
}

.olControlPanZoomBar div {
    font-size: .01em
}

.olMap {
    cursor: default;
    z-index: 0
}

.olMapViewport {
    text-align: left
}

.olLayerDiv {
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none
}

.olLayerDiv img {
    max-width: none !important
}

.olControlMousePosition {
    bottom: 5px;
    display: block;
    font-family: Arial;
    font-size: .75em;
    left: 100px;
    position: absolute
}

.olControlScale {
    bottom: 3em;
    display: block;
    font-size: .75em;
    position: absolute;
    right: 3px
}

.olControlScaleLine {
    bottom: 15px;
    display: block;
    font-size: .65em;
    left: 10px;
    position: absolute
}

.olControlScaleLineBottom {
    border: solid 2px #000;
    border-bottom: 0;
    margin-top: -2px;
    text-align: center
}

.olControlScaleLineTop {
    border: solid 2px #000;
    border-top: 0;
    text-align: center
}

.olControlAttribution {
    bottom: 5px;
    font-size: .75em;
    right: 5px
}

.olControlAttribution p {
    margin: 0
}

.olHandlerBoxZoomBox {
    border: 2px solid red
}

.olHandlerBoxSelectFeature {
    border: 2px solid #00f
}

.olPopupCloseBox {
    cursor: pointer
}

.olFramedCloudPopupContent {
    overflow: auto;
    padding: 5px
}

.olPopup h1, .olPopup h2, .olPopup h3, .olPopup h4, .olPopup h5, .olPopup h6, .olPopup ol, .olPopup p, .olPopup ul {
    margin: 5px
}

.olControlNoSelect {
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none
}

.olImageLoadError {
    display: none !important
}

.olCursorWait {
    cursor: wait
}

.olDrawBox {
    cursor: crosshair
}

.olControlDragFeatureActive.olControlDragFeatureOver.olDragDown {
    cursor: -webkit-grabbing;
    cursor: -moz-grabbing;
    cursor: grabbing
}

.olLayerGrid .olTileImage {
    -webkit-transition: opacity .2s linear;
    transition: opacity .2s linear
}

.wb-geomap-map {
    outline: 1px solid #ccc;
    position: relative
}

.wb-geomap-map.active {
    outline-color: #07f
}

.wb-geomap-detail {
    margin-bottom: 10px;
    margin-top: 10px
}

.geomap-legend-detail {
    padding-top: 10px
}

.geomap-legend-symbol {
    height: 18px;
    margin: 5px;
    width: 18px
}

.geomap-clear-format {
    clear: both
}

.geomap-legend-label {
    display: inline
}

.geomap-lgnd-layer {
    margin-top: 20px !important
}

.geomap-geoloc {
    left: 70px;
    position: absolute;
    right: 70px;
    top: 15px;
    z-index: 10000
}

.geomap-geoloc input[type=text] {
    width: 80%
}

button.geomap-geoloc-aoi-btn {
    background-color: #fff;
    border-color: #eee;
    -webkit-box-shadow: inset 0 -1px 0 rgba(0, 0, 0, .25);
    box-shadow: inset 0 -1px 0 rgba(0, 0, 0, .25);
    color: #666;
    position: absolute;
    right: 15px;
    top: 15px;
    z-index: 10000
}

.geomap-aoi legend {
    border: 0;
    font-size: 1em;
    margin-bottom: 1em
}

.geomap-aoi button.geomap-geoloc-aoi-btn {
    position: absolute;
    right: 15px;
    top: auto
}

.table-hover .wb-group-summary tr:hover td, .table-hover .wb-group-summary tr:hover th, .wb-zebra-col-hover .wb-group-summary col.table-hover {
    background-color: #fafaff
}

.wb-cell-layout {
    background-color: transparent
}

.wb-cell-desc, .wb-cell-key {
    font-style: italic
}

.wb-zebra > colgroup + colgroup {
    border-left: 2px solid #ddd
}

.wb-group-summary {
    background-color: #f0f2f4
}

.wb-zebra-col-hover col.table-hover {
    background-color: #f0f0f0
}

.feeds-cont.waiting:after, .feeds-cont.waiting:before {
    bottom: 0;
    content: " ";
    height: 50px;
    left: 0;
    margin: auto;
    position: absolute;
    right: 0;
    top: 0;
    width: 50px
}

.feeds-cont.waiting {
    min-height: 100px;
    min-width: 100px
}

.feeds-cont.waiting:after {
    -webkit-animation-duration: 1000ms;
    animation-duration: 1000ms;
    -webkit-animation-iteration-count: infinite;
    animation-iteration-count: infinite;
    -webkit-animation-name: spin;
    animation-name: spin;
    -webkit-animation-timing-function: linear;
    animation-timing-function: linear;
    background: url(../../wet-boew/assets/loading.png) center center no-repeat;
    -webkit-background-size: 30px 30px;
    background-size: 30px 30px;
    z-index: 2
}

.feeds-cont.waiting:before {
    background: 0 0;
    z-index: 1
}

.feeds-cont .feeds-date:before {
    content: "["
}

.feeds-cont .feeds-date:after {
    content: "]"
}

datalist {
    display: none
}

summary {
    display: list-item !important;
    visibility: visible !important
}

details .out details summary, details:not([open]) details summary {
    display: none !important
}

details {
    margin-bottom: .25em
}

details summary {
    border: 1px solid #ddd;
    border-radius: 4px;
    color: #295376;
    padding: 5px 15px
}

details summary:focus, details summary:hover {
    background-color: transparent;
    color: #0535d2;
    text-decoration: underline
}

details[open] {
    border: 1px solid #ddd;
    border-radius: 4px
}

details[open] > summary {
    border: 0;
    border-bottom: 1px solid #ddd;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
    margin-bottom: .25em
}

details:not([open]) {
    visibility: hidden
}

details:not([open]) > *, details:not([open]) > details {
    display: none
}

.tabpanels > details:not([open]), details.alert:not([open]) {
    visibility: visible
}

.wb-disable details {
    visibility: visible !important
}

.wb-disable details > * {
    display: block !important
}

.datepicker-format {
    display: none
}

.picker-overlay {
    width: 19em
}

@media screen {
    .mathml body > div > math, .no-mathml body > div > math, .nojs-show, .wb-disable .nojs-hide {
        display: none !important
    }

    #wb-dtmd {
        margin: 2em 0 0
    }

    #wb-dtmd dd, #wb-dtmd dt {
        display: inline;
        font-weight: 400;
        margin-right: 0
    }

    .nowrap {
        white-space: nowrap
    }

    .wb-disable .nojs-show {
        display: block !important
    }

    .atn, .dec, .typ, .var {
        color: #606
    }

    .clo, .opn, .pun {
        color: #660
    }

    .atv, .str {
        color: #2f6d2f
    }

    .kwd {
        color: #024b6e
    }

    .com {
        color: #800
    }

    .lit {
        color: #066
    }

    .tag {
        color: #125b7e
    }

    .fun {
        color: red
    }
}

@media screen and (max-width: 991px) {
    .dataTables_wrapper .dataTables_info {
        padding-bottom: 5px
    }

    .dataTables_wrapper .dataTables_filter {
        float: left;
        text-align: left;
        width: 100%
    }

    [dir=rtl] .dataTables_wrapper .dataTables_filter {
        float: right;
        text-align: right
    }

    .wb-tabs > .tabpanels > details, .wb-tabs > details {
        border: 0;
        border-bottom: #ccc solid 1px;
        border-bottom-left-radius: 0;
        border-bottom-right-radius: 0
    }

    .wb-tabs > .tabpanels > details:last-of-type, .wb-tabs > details:last-of-type {
        border-bottom: 0
    }

    .wb-tabs > .tabpanels > details[style], .wb-tabs > details[style] {
        min-height: 0 !important
    }

    .wb-tabs > .tabpanels > details > summary, .wb-tabs > details > summary {
        border: 0
    }

    .wb-tabs > .tabpanels > details[open] > summary, .wb-tabs > details[open] > summary {
        border: 0;
        margin-bottom: 0
    }

    .wb-tabs {
        border-color: #ccc;
        border-radius: 4px;
        border-style: solid;
        border-width: 1px;
        margin-bottom: 15px;
        padding-left: 0;
        padding-right: 0
    }

    .wb-tabs.tabs-acc > ul {
        display: none
    }
}

@media screen and (min-width: 480px) {
    .colcount-xs-2 {
        -webkit-column-count: 2;
        -moz-column-count: 2;
        column-count: 2
    }

    .colcount-xs-3 {
        -webkit-column-count: 3;
        -moz-column-count: 3;
        column-count: 3
    }

    .colcount-xs-4 {
        -webkit-column-count: 4;
        -moz-column-count: 4;
        column-count: 4
    }

    #mb-pnl {
        min-width: 300px
    }

    .dataTables_wrapper .dataTables_info:after {
        content: "|";
        font-size: 1.2em;
        line-height: 1em;
        padding: 0 .25em
    }
}

@media screen and (min-width: 768px) {
    .colcount-sm-2 {
        -webkit-column-count: 2;
        -moz-column-count: 2;
        column-count: 2
    }

    .colcount-sm-3 {
        -webkit-column-count: 3;
        -moz-column-count: 3;
        column-count: 3
    }

    .colcount-sm-4 {
        -webkit-column-count: 4;
        -moz-column-count: 4;
        column-count: 4
    }

    .pstn-lft-sm {
        position: absolute;
        left: 0;
        right: auto
    }

    .pstn-rght-sm {
        position: absolute;
        right: 0;
        left: auto
    }

    .pstn-tp-sm {
        position: absolute;
        top: 0;
        bottom: auto
    }

    .pstn-bttm-sm {
        position: absolute;
        bottom: 0;
        top: auto
    }
}

@media screen and (min-width: 992px) {
    [dir=rtl] main.col-md-push-3 {
        left: auto
    }

    [dir=rtl] #wb-sec.col-md-pull-9 {
        right: auto
    }

    .colcount-md-2 {
        -webkit-column-count: 2;
        -moz-column-count: 2;
        column-count: 2
    }

    .colcount-md-3 {
        -webkit-column-count: 3;
        -moz-column-count: 3;
        column-count: 3
    }

    .colcount-md-4 {
        -webkit-column-count: 4;
        -moz-column-count: 4;
        column-count: 4
    }

    .pstn-lft-md {
        position: absolute;
        left: 0;
        right: auto
    }

    .pstn-rght-md {
        position: absolute;
        right: 0;
        left: auto
    }

    .pstn-tp-md {
        position: absolute;
        top: 0;
        bottom: auto
    }

    .pstn-bttm-md {
        position: absolute;
        bottom: 0;
        top: auto
    }

    #details-facebook, #details-flickr, #details-youtube {
        padding-left: 0;
        padding-right: 0
    }

    .wb-tabs > .tabpanels > details, .wb-tabs > details {
        border-color: #ccc;
        border-style: solid;
        border-width: 1px;
        display: none
    }

    .wb-tabs > .tabpanels > details[open], .wb-tabs > details[open] {
        display: block
    }

    .wb-tabs > .tabpanels > details[open] > summary, .wb-tabs > details[open] > summary {
        display: none !important
    }

    .wb-tabs.carousel-s2.show-thumbs [role=tablist] li.active a {
        border-color: #666;
        border-style: solid;
        border-width: 10px;
        margin-bottom: 1px;
        padding: 0
    }

    .wb-tabs.carousel-s2.show-thumbs [role=tablist] li[role=presentation] {
        display: inline-block
    }

    .wb-tabs.carousel-s2.show-thumbs [role=tablist] li[role=presentation] img {
        opacity: .5;
        width: 140px
    }

    .wb-tabs.carousel-s2.show-thumbs [role=tablist] li[class=active] img {
        opacity: 1
    }

    .wb-tabs.carousel-s2.show-thumbs [role=tablist] li.nxt, .wb-tabs.carousel-s2.show-thumbs [role=tablist] li.prv, .wb-tabs.carousel-s2.show-thumbs [role=tablist] li.tab-count {
        display: none
    }
}

@media screen and (min-width: 1200px) {
    .clr-lft-lg {
        clear: left
    }

    .clr-rght-lg {
        clear: right
    }

    .colcount-lg-2 {
        -webkit-column-count: 2;
        -moz-column-count: 2;
        column-count: 2
    }

    .colcount-lg-3 {
        -webkit-column-count: 3;
        -moz-column-count: 3;
        column-count: 3
    }

    .colcount-lg-4 {
        -webkit-column-count: 4;
        -moz-column-count: 4;
        column-count: 4
    }

    .pstn-lft-lg {
        position: absolute;
        left: 0;
        right: auto
    }

    .pstn-rght-lg {
        position: absolute;
        right: 0;
        left: auto
    }

    .pstn-tp-lg {
        position: absolute;
        top: 0;
        bottom: auto
    }

    .pstn-bttm-lg {
        position: absolute;
        bottom: 0;
        top: auto
    }
}

@media screen and (max-width: 479px) {
    #mb-pnl {
        min-width: 65%
    }

    .dataTables_wrapper .dataTables_length {
        width: 100%
    }

    .wb-tabs.carousel-s2 [role=tablist] li.nxt, .wb-tabs.carousel-s2 [role=tablist] li.prv {
        margin-right: 0
    }

    .wb-tabs.carousel-s2 [role=tablist] li.prv {
        margin-left: 0
    }

    .wb-tabs.carousel-s2 [role=tablist] li.prv a {
        padding: 10px 0 10px .4em
    }

    .wb-tabs.carousel-s2 [role=tablist] li.nxt a {
        padding: 10px 0
    }

    .wb-tabs.carousel-s2 [role=tablist] li.tab-count {
        font-size: .9em;
        margin-right: 5px
    }

    .wb-tabs.carousel-s2 [role=tablist] li.plypause {
        margin-right: 2%
    }

    .wb-tabs.carousel-s2 [role=tablist] li.plypause a {
        font-size: 1.3em;
        margin-right: 0;
        padding: 12px 10px 7px
    }
}

@media screen and (min-width: 768px) and (max-width: 991px) {
    .clr-lft-sm {
        clear: left
    }

    .clr-rght-sm {
        clear: right
    }
}

@media screen and (min-width: 992px) and (max-width: 1199px) {
    .clr-lft-md {
        clear: left
    }

    .clr-rght-md {
        clear: right
    }
}

@media screen and (min-width: 1600px) {
    .colcount-xl-2 {
        -webkit-column-count: 2;
        -moz-column-count: 2;
        column-count: 2
    }

    .colcount-xl-3 {
        -webkit-column-count: 3;
        -moz-column-count: 3;
        column-count: 3
    }

    .colcount-xl-4 {
        -webkit-column-count: 4;
        -moz-column-count: 4;
        column-count: 4
    }
}

@media print {
    .pg-brk-aft {
        page-break-after: always
    }

    a[href]:after {
        content: none
    }

    #wb-bc .breadcrumb {
        margin-bottom: 0
    }

    #wb-bc a[href]:after {
        content: ""
    }

    .fn-lnk, .wb-fnote .fn-rtn a {
        background-color: transparent;
        border: 0;
        padding: 0
    }

    .wb-fnote {
        border-left: 0;
        border-right: 0;
        margin-bottom: 1em;
        margin-left: 0;
        margin-right: 0
    }

    .wb-fnote dd {
        border: 0;
        display: inline-block;
        width: 100%
    }

    .wb-fnote .fn-rtn {
        overflow: visible
    }

    .olControlMousePosition, .olControlPanZoomBar, .wb-geomap-detail {
        visibility: hidden
    }

    .mfp-container, .mfp-wrap {
        position: static
    }

    .mfp-arrow, .mfp-close {
        display: none !important
    }

    .wb-mm-ctrls, .wb-mm-ovrly {
        display: none
    }

    .kwd, .tag, .typ {
        font-weight: 700
    }

    .kwd, .tag {
        color: #006
    }

    .atv, .str {
        color: #060
    }

    .clo, .opn, .pun {
        color: #440
    }

    .atn, .typ {
        color: #404
    }

    .com {
        color: #600;
        font-style: italic
    }

    .lit {
        color: #044
    }

    .wb-tabs [role=tablist], .wb-tabs.print-active > .tabpanels > details.out .tgl-panel, .wb-tabs.print-active > .tabpanels > details > summary[aria-expanded=false] + .tgl-panel, .wb-tabs.print-active > .tabpanels > div.out {
        display: none !important
    }

    .wb-tabs [role=tabpanel] {
        display: block !important;
        opacity: 1 !important;
        position: static !important;
        visibility: visible !important
    }

    .wb-tabs [role=tabpanel] figcaption {
        position: static
    }

    .wb-tabs [role=tabpanel] summary {
        display: block !important
    }
}

body {
    background: #f8f8f8;
    font-family: Helvetica, Arial, sans-serif;
    font-size: 16px
}

a {
    color: #284162
}

a img.thumbnail:hover {
    -webkit-box-shadow: 1px 1px 5px #999;
    box-shadow: 1px 1px 5px #999
}

a.no-undrln {
    text-decoration: none
}

[placeholder], input[placeholder] {
    color: #5c5c5c !important
}

.h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
    font-family: Helvetica, Arial, sans-serif
}

h1 {
    border-bottom: 1px solid #af3c43;
    font-size: 34px;
    margin-bottom: .2em;
    margin-top: 1.25em;
    padding-bottom: .2em
}

.h2, h2 {
    font-size: 26px
}

.h3, h3 {
    font-size: 22px
}

.h4, h4 {
    font-size: 18px
}

.h5, h5 {
    font-size: 16px
}

.h6, h6 {
    font-size: 14px
}

.h3, .h4, .h5, .h6 {
    border: 0
}

aside.site-related h2 {
    font-size: 28px;
    margin-top: 0
}

aside.features {
    background-color: #eaebed;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#eaebed), to(#eaebed));
    background-image: -webkit-linear-gradient(top, #eaebed 0, #eaebed 100%);
    background-image: linear-gradient(to bottom, #eaebed 0, #eaebed 100%);
    padding-bottom: 1.5em
}

aside.features h2 {
    border: 0
}

aside.features figcaption {
    font-weight: 700;
    margin-top: 3px
}

aside.features .thumbnail {
    background-color: transparent;
    border: 0;
    border-radius: 0;
    margin-bottom: 1.5em;
    padding: 10px 10px 0
}

aside.features .thumbnail img {
    border: solid 1px #eee;
    max-width: 100%
}

.departments a h2, .departments a h3, .departments a h4, .priorities a h2, .priorities a h3, .priorities a h4, .sect-lnks h2 a, .sect-lnks h3 a, .sect-lnks h4 a {
    font-size: 16px
}

.gc-nttvs {
    border-top: 1px solid #ccc
}

.gc-nttvs a h2, .gc-nttvs a h3, .gc-nttvs a h4, .gc-prtts a h2, .gc-prtts a h3, .gc-prtts a h4 {
    font-size: 16px
}

.gc-nws a h2, .gc-nws a h3, .gc-nws a h4 {
    font-size: 16px;
    margin-top: 15px
}

.home .h1, .secondary .h1 {
    border-bottom: 1px solid #af3c43;
    font-size: 27px;
    margin-bottom: .2em;
    padding-bottom: .2em
}

.home .row a h2, .home .row a h3, .home .row a h4, .home .row h2 a, .home .row h3 a, .home .row h4 a, .secondary .row a h2, .secondary .row a h3, .secondary .row a h4, .secondary .row h2 a, .secondary .row h3 a, .secondary .row h4 a {
    font-size: 16px
}

.thumbnail {
    background: #eaebed;
    border-color: #eee;
    border-radius: 0;
    padding: 5px
}

.thumbnail:hover img {
    -webkit-box-shadow: 1px 1px 5px #999;
    box-shadow: 1px 1px 5px #999
}

.pagedetails {
    padding-bottom: 2em;
    padding-top: 2em
}

.pagedetails details {
    margin-left: 1.1em;
    margin-right: 1.1em
}

.pagedetails .datemod {
    padding-bottom: 7px;
    padding-top: 7px
}

.pagedetails .datemod #wb-dtmd {
    margin-top: 0
}

.lt-ie9 .h1, .lt-ie9 h1 {
    font-size: 27px !important
}

.lt-ie9 .h2, .lt-ie9 h2 {
    font-size: 25px
}

.lt-ie9 .h3, .lt-ie9 h3 {
    font-size: 22px
}

.lt-ie9 .h4, .lt-ie9 h4 {
    font-size: 20px
}

.lt-ie9 .h5, .lt-ie9 h5 {
    font-size: 18px
}

.lt-ie9 .h6, .lt-ie9 h6 {
    font-size: 16px;
    font-weight: 700
}

.lt-ie9 .features .thumbnail, .lt-ie9 .features .thumbnail a > img, .lt-ie9 .features .thumbnail > img, .lt-ie9 .priorities .thumbnail, .lt-ie9 .priorities .thumbnail a > img, .lt-ie9 .priorities .thumbnail > img {
    display: inline-block
}

.lt-ie9 .priorities .thumbnail {
    background-color: #eaebed
}

.lt-ie9 .sect-lnks {
    vertical-align: top !important
}

.lt-ie9 .inst-brand img {
    width: 100%
}

.gc-rprt-prblm-thnk {
    padding-bottom: 25px
}

.gc-rprt-prblm-frm.gc-rprt-prblm-tggl.show {
    display: none !important
}

.gc-fld-srvy-container {
    height: 0;
    overflow: hidden;
    -webkit-overflow-scrolling: touch;
    overflow-y: scroll;
    padding-bottom: 70%;
    position: relative
}

.gc-fld-srvy-mbd {
    border: 0;
    height: 100%;
    left: 0;
    position: absolute;
    top: 0;
    width: 100%;
    zoom: 1
}

#archived-bnr {
    background-color: #fd0
}

#archived-bnr p {
    margin: 0;
    text-align: center
}

#archived-bnr a {
    color: #000;
    display: block;
    font-weight: 700;
    padding: .75em 44px;
    text-decoration: none
}

#archived-bnr a:focus, #archived-bnr a:hover {
    text-decoration: underline
}

#archived-bnr .overlay-close {
    color: #000
}

header {
    position: relative
}

header .brand {
    margin-bottom: 10px;
    padding-top: 10px
}

header .brand a {
    display: block;
    height: auto;
    padding-bottom: 0;
    width: auto
}

header .brand a:after {
    bottom: 0;
    content: "";
    left: 0;
    position: absolute;
    right: 0;
    top: 0
}

header .brand img, header .brand object {
    height: auto;
    max-height: 40px
}

#wb-glb-mn {
    margin-top: 20px
}

#wb-glb-mn ul {
    min-width: 150px
}

#wb-glb-mn ul.chvrn {
    background: #335075;
    display: inline-block;
    float: right;
    height: 2.75em
}

#wb-glb-mn ul.chvrn li {
    display: block;
    padding-right: 0
}

#wb-glb-mn ul.chvrn li a {
    color: #fff;
    display: block;
    font-size: 1.9em;
    padding: 5px 20px 0 0
}

#wb-glb-mn ul.chvrn span .glyphicon-th-list {
    padding-left: 12px;
    top: 0
}

#wb-glb-mn ul.chvrn:before {
    border-bottom: 1.375em solid transparent;
    border-left: .6875em solid #f8f8f8;
    border-top: 1.375em solid transparent;
    content: " ";
    display: block;
    float: left;
    height: 0;
    position: relative;
    width: 0
}

.lt-ie9 header .brand a {
    margin-top: 0
}

.lt-ie9 header .brand img {
    height: 40px
}

[dir=rtl] header .brand {
    float: right
}

[dir=rtl] #wb-glb-mn ul.chvrn {
    padding-left: 1.5em;
    padding-right: 0;
    text-align: left
}

[dir=rtl] #wb-glb-mn ul.chvrn span .glyphicon-th-list {
    padding-left: 0;
    padding-right: 10px
}

[dir=rtl] #wb-glb-mn ul.chvrn:before {
    border-left: 0;
    border-right: 11px solid #f8f8f8;
    float: right
}

main .btn-primary {
    background-color: #335075;
    border-color: #335075
}

.sect-lnks {
    display: inline-block;
    width: 100%
}

.dshbrd .cntrls li {
    padding-right: 0
}

.dshbrd .cntrls a {
    background: #eee;
    border: 1px solid #ddd;
    color: #000;
    padding: 7px 5px
}

.dshbrd > details {
    display: inline;
    left: 0;
    position: relative;
    top: 0
}

.dshbrd > details > summary {
    font-size: 0;
    max-height: 0
}

@font-face {
    font-family: gcweb;
    src: url(../fonts/gcweb_0c4a4eb7974d0a7287c93c02965f9b3f.eot);
    src: url(../fonts/gcweb_0c4a4eb7974d0a7287c93c02965f9b3f.eot?#iefix) format("embedded-opentype"), url(../fonts/gcweb_0c4a4eb7974d0a7287c93c02965f9b3f.woff) format("woff"), url(../fonts/gcweb_0c4a4eb7974d0a7287c93c02965f9b3f.ttf) format("truetype"), url(../fonts/gcweb_0c4a4eb7974d0a7287c93c02965f9b3f.svg#gcweb) format("svg");
    font-weight: 400;
    font-style: normal
}

.cndwrdmrk:after, .cndwrdmrk:before, .icn-sig-en:before, .icn-sig-fr:before {
    display: block;
    font-family: gcweb;
    -webkit-font-smoothing: antialiased;
    font-style: normal;
    font-variant: normal;
    font-weight: 400;
    line-height: 1;
    text-decoration: none;
    text-shadow: 0 0 1px rgba(0, 0, 0, .3);
    -webkit-text-stroke: 1px transparent;
    text-transform: none;
    -webkit-transform: rotate(0);
    -ms-transform: rotate(0);
    transform: rotate(0)
}

header .brand {
    padding-bottom: 0
}

header .brand a {
    position: relative;
    text-decoration: none
}

.icn-sig-en, .icn-sig-fr {
    color: #fff;
    display: inline-block;
    font-size: 1.5em;
    padding: .7em 0 .5em
}

.icn-sig-en:before, .icn-sig-fr:before {
    position: relative
}

.icn-sig-fr:before, :root .icn-sig-en:before {
    left: -10em
}

.icn-sig-en:before {
    content: "\f102"
}

.icn-sig-fr:before {
    content: "\f103"
}

.cndwrdmrk {
    font-size: 3.5em;
    min-width: 100%;
    position: relative;
    text-decoration: none
}

.cndwrdmrk:after, .cndwrdmrk:before {
    display: inline;
    position: relative
}

.cndwrdmrk:before {
    color: #000;
    content: "\f100"
}

.cndwrdmrk:after {
    color: red;
    content: "\f101";
    left: -1em
}

#wb-info {
    background: #e1e4e7;
    position: relative;
    z-index: 5
}

#wb-info a {
    font-size: .875em;
    text-decoration: none
}

#wb-info a.wb-navcurr {
    font-weight: 800
}

#wb-info .brand {
    background: #f8f8f8;
    border-top: 4px solid #335175;
    line-height: 30px
}

#wb-info .brand img, #wb-info .brand object {
    height: 40px;
    margin-bottom: 10px;
    margin-top: 20px;
    width: auto
}

#wb-info .ftr-urlt-lnk ul {
    margin: 0;
    padding: 0
}

#wb-info .ftr-urlt-lnk ul li {
    display: inline-block;
    margin-right: .5em;
    padding: 0
}

#wb-info .ftr-urlt-lnk ul li:before {
    content: "\2022";
    margin-right: .7em
}

#wb-info .ftr-urlt-lnk ul li:first-child:before {
    content: none
}

#wb-info .tofpg {
    line-height: 90px
}

#wb-info .tofpg a {
    color: #000
}

#wb-info .tofpg a span {
    margin-left: 25px
}

#wb-info .tofpg a:hover {
    text-decoration: none
}

#wb-info nav {
    padding-bottom: 2em;
    padding-top: 2em;
    position: relative
}

#wb-info nav li {
    margin-bottom: .75em
}

[dir=rtl] footer .brand .text-right {
    text-align: left
}

[dir=rtl] footer .tofpg {
    float: right
}

[dir=rtl] footer .tofpg a span {
    margin-left: 0;
    margin-right: 10px
}

.margin-bottom-none {
    margin-bottom: 0 !important
}

.margin-bottom-small {
    margin-bottom: .25em !important
}

.margin-top-large {
    margin-top: 1.5em !important
}

.margin-top-medium {
    margin-top: .75em !important
}

#triangle-up {
    border-bottom: 10px solid #fff;
    border-left: 5px solid transparent;
    border-right: 5px solid transparent;
    height: 0;
    width: 0
}

#wb-lng {
    padding-top: 10px
}

#wb-lng li {
    padding-right: 0
}

[dir=rtl] #wb-lng {
    text-align: left
}

[dir=rtl] #wb-lng ul {
    padding-right: 0
}

main {
    position: relative
}

main .subtitle {
    color: #555;
    font-size: 1em;
    font-weight: 300;
    margin-bottom: 1em
}

main .departments .learnmore {
    padding: 3em 0
}

main .priorities {
    padding-top: 2em
}

main .priorities .thumbnail {
    margin-bottom: 1.5em;
    padding: 1em
}

main .gc-rms-lngth img {
    background-color: #fff;
    border: solid 1px #e1e4e7;
    padding: 18px
}

.wb-mltmd {
    margin-bottom: 10px;
    margin-top: 10px
}

.overlay-def header {
    background: #335075
}

.overlay-def .overlay-close {
    background: 0 0
}

.secondary .profile .thumbnail {
    margin-top: 1.25em
}

#wb-srch, .srchbox {
    padding-top: 1em
}

#wb-srch button, #wb-srch input, .srchbox button, .srchbox input {
    border-radius: 0
}

#wb-srch button, .srchbox button {
    background-color: #335075;
    border: 0;
    border-color: #335075;
    font-size: 17px
}

#wb-srch button:active, #wb-srch button:focus, #wb-srch button:hover, .srchbox button:active, .srchbox button:focus, .srchbox button:hover {
    background: #243850
}

#wb-srch .glyphicon, .srchbox .glyphicon {
    top: auto;
    vertical-align: middle
}

#wb-srch input, .srchbox input {
    background-color: #e0e0e0;
    border-color: #e0e0e0;
    border-right: 0;
    border-style: solid;
    -webkit-box-shadow: none;
    box-shadow: none;
    color: #555;
    margin-right: -4px;
    min-width: 246px;
    position: relative
}

[dir=rtl] #wb-srch {
    text-align: left
}

[dir=rtl] #wb-srch input {
    margin-left: -4px;
    margin-right: auto
}

#wb-sec {
    margin-top: 20px;
    padding-bottom: 2em
}

#wb-sec h3 {
    border: 1px solid #ddd;
    border-bottom: 5px solid #335075;
    margin: 0 0 1px
}

#wb-sec h3 a {
    color: #333;
    display: block;
    font-size: .8em;
    padding: 15px;
    text-decoration: none
}

#wb-sec h3 a:hover {
    background-color: #243850;
    color: #fff
}

#wb-sec .list-group {
    margin-bottom: 0;
    margin-left: 10px
}

#wb-sec .list-group a.list-group-item {
    background-color: #fff;
    border-radius: 0;
    color: #555;
    margin-top: -1px;
    text-decoration: none
}

#wb-sec .list-group a.list-group-item.wb-navcurr {
    background-color: #335075;
    color: #fff;
    cursor: text
}

#wb-sec .list-group a.list-group-item.wb-navcurr[href]:hover {
    background-color: #335075
}

#wb-sec .list-group a.list-group-item[href]:focus, #wb-sec .list-group a.list-group-item[href]:hover {
    background-color: #243850;
    color: #fff
}

#wb-sec .list-group .list-group .list-group-item {
    background-color: #e6e6e6;
    color: #000;
    padding-left: 1.8em
}

#wb-sec .list-group .list-group .list-group .list-group-item {
    background-color: #fff
}

[dir=rtl] #wb-sec .list-group .list-group .list-group-item {
    padding-left: 15px;
    padding-right: 1.8em
}

a.shr-opn, a.shr-opn:hover {
    text-decoration: none
}

.pagedetails.text-right .shr-pg {
    text-align: left
}

#wb-sm {
    background: #335075
}

#wb-sm .menu {
    display: table;
    margin-bottom: 0;
    text-shadow: 1px 1px 1px #222;
    width: 100%
}

#wb-sm .menu .active, #wb-sm .menu .selected, #wb-sm .menu .wb-navcurr {
    background: #243850 !important;
    color: #fff !important
}

#wb-sm .menu > li {
    border-left: 1px solid #999;
    display: table-cell;
    float: none
}

#wb-sm .menu > li:last-child {
    border-right: 1px solid #999
}

#wb-sm .menu > li a {
    color: #fff
}

#wb-sm .menu > li a:focus, #wb-sm .menu > li a:hover {
    background: #243850 !important;
    text-shadow: none
}

#wb-sm .sm.open {
    background: #ccc;
    border-bottom: 5px solid #243850
}

#wb-sm .sm.open li a, #wb-sm .sm.open li summary {
    color: #444;
    padding: 5px 10px;
    text-shadow: none
}

#wb-sm .sm.open li a:active, #wb-sm .sm.open li a:focus, #wb-sm .sm.open li a:hover, #wb-sm .sm.open li summary:active, #wb-sm .sm.open li summary:focus, #wb-sm .sm.open li summary:hover {
    background: #243850;
    color: #fff
}

#wb-sm .sm.open .slflnk a {
    background: #bbb
}

#wb-sm .sm .row {
    background: 0 0
}

#wb-sm .sm .row a {
    color: #6e6e6e
}

.wb-disable #wb-sm .nvbar {
    display: block !important
}

#mb-pnl {
    background: url(data:image/gif;base64,R0lGODlh6AMBAIAAABk0UQAAACH/C1hNUCBEYXRhWE1QPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS4zLWMwMTEgNjYuMTQ1NjYxLCAyMDEyLzAyLzA2LTE0OjU2OjI3ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M2IChNYWNpbnRvc2gpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkMxRUQ2ODczNUEyODExRTNBODM4OUNCRUJBOUJGN0REIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkMxRUQ2ODc0NUEyODExRTNBODM4OUNCRUJBOUJGN0REIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6QzFFRDY4NzE1QTI4MTFFM0E4Mzg5Q0JFQkE5QkY3REQiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6QzFFRDY4NzI1QTI4MTFFM0E4Mzg5Q0JFQkE5QkY3REQiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4B//79/Pv6+fj39vX08/Lx8O/u7ezr6uno5+bl5OPi4eDf3t3c29rZ2NfW1dTT0tHQz87NzMvKycjHxsXEw8LBwL++vby7urm4t7a1tLOysbCvrq2sq6qpqKempaSjoqGgn56dnJuamZiXlpWUk5KRkI+OjYyLiomIh4aFhIOCgYB/fn18e3p5eHd2dXRzcnFwb25tbGtqaWhnZmVkY2JhYF9eXVxbWllYV1ZVVFNSUVBPTk1MS0pJSEdGRURDQkFAPz49PDs6OTg3NjU0MzIxMC8uLSwrKikoJyYlJCMiISAfHh0cGxoZGBcWFRQTEhEQDw4NDAsKCQgHBgUEAwIBAAAh+QQAAAAAACwAAAAA6AMBAAACHoSPqcvtD6OctNqLs968+w+G4kiW5omm6sq27gs7BQA7);
    background-position: 15px 0;
    background-repeat: repeat-y;
    -webkit-box-shadow: none;
    box-shadow: none;
    padding-left: 15px
}

#mb-pnl a[href$="#wb-cont"] {
    display: none !important
}

#mb-pnl .modal-header {
    background: #2e5274;
    border-bottom: 1px solid #2e5274;
    -webkit-box-shadow: 0 3px 3px -2px rgba(0, 0, 0, .3), 3px 3px 3px -2px rgba(0, 0, 0, .3), -3px 3px 3px -2px rgba(0, 0, 0, .3);
    box-shadow: 0 3px 3px -2px rgba(0, 0, 0, .3), 3px 3px 3px -2px rgba(0, 0, 0, .3), -3px 3px 3px -2px rgba(0, 0, 0, .3);
    color: #fff;
    margin-left: 0;
    position: relative;
    text-align: left;
    text-decoration: none;
    top: 1em;
    z-index: 1045
}

#mb-pnl .modal-header:before {
    border-bottom: 1.45em solid #2e5274;
    border-left: 1em solid transparent;
    border-top: 1.45em solid #2e5274;
    content: "";
    left: -1em;
    position: absolute;
    top: 0
}

#mb-pnl .modal-header h2 {
    border: 0;
    margin-bottom: 0;
    margin-top: 1px;
    padding: 9px
}

#mb-pnl .modal-body {
    background: #0e4164;
    margin-left: 0;
    padding-bottom: 0;
    padding-left: 0;
    padding-right: 0;
    padding-top: 5em;
    position: relative;
    top: -3em
}

#mb-pnl .modal-body summary {
    color: #fff
}

#mb-pnl .modal-body summary:focus, #mb-pnl .modal-body summary:hover {
    background: 0 0;
    color: #fff
}

#mb-pnl .modal-body a {
    color: #fff;
    text-decoration: none
}

#mb-pnl .modal-body ul {
    list-style-type: none
}

#mb-pnl .modal-body li {
    line-height: 2;
    list-style-type: none
}

#mb-pnl .mfp-close {
    top: .55em
}

#mb-pnl .srch-pnl form button {
    background-color: #335075;
    border: 0;
    border-color: #335075;
    border-radius: 0;
    position: relative
}

#mb-pnl .srch-pnl form button:active, #mb-pnl .srch-pnl form button:focus, #mb-pnl .srch-pnl form button:hover {
    background: #243850
}

#mb-pnl .srch-pnl form input {
    background-color: #e0e0e0;
    border-color: #e0e0e0;
    border-radius: 0;
    border-right: 0;
    border-style: solid;
    -webkit-box-shadow: none;
    box-shadow: none;
    color: #555;
    margin-right: -4px;
    position: relative
}

#mb-pnl .srch-pnl .btn {
    line-height: 1.65;
    margin-top: -1px
}

#mb-pnl .srch-pnl .form-group {
    float: left;
    margin-left: 15px;
    width: 75%
}

#mb-pnl .srch-pnl .form-group.submit {
    margin-left: 0;
    width: 15%
}

#mb-pnl .lng-ofr {
    padding-right: 30px;
    text-align: right
}

#mb-pnl .sm-pnl {
    background: #0e4164;
    padding-left: 15px
}

#mb-pnl .info-pnl {
    background: #193451;
    border-top: 2px solid #061e38;
    color: #325375 !important;
    padding-left: 15px
}

#mb-pnl .active > a {
    font-weight: 800
}

#mb-pnl .sec-pnl {
    background: #cdd4da !important;
    display: none !important;
    padding-left: 15px
}

#mb-pnl .sec-pnl a, #mb-pnl .sec-pnl summary {
    color: #2e5576 !important
}

[dir=rtl] #wb-sm .menu > li {
    border-right: 1px solid #999
}

[dir=rtl] #mb-pnl {
    background: 0 0;
    padding-left: 0;
    padding-right: 15px
}

[dir=rtl] #mb-pnl .srch-pnl .form-group {
    float: right;
    margin-left: 0;
    margin-right: 15px
}

[dir=rtl] #mb-pnl .srch-pnl .form-group input {
    margin-left: 0;
    margin-right: -4px
}

[dir=rtl] #mb-pnl .srch-pnl .form-group.submit {
    margin-right: 0
}

[dir=rtl] #mb-pnl .modal-header {
    text-align: right
}

[dir=rtl] #mb-pnl .modal-header:before {
    border-left: 0;
    border-right: 1em solid transparent;
    left: auto;
    right: -1em
}

.foursquare {
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAbCAYAAACN1PRVAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYxIDY0LjE0MDk0OSwgMjAxMC8xMi8wNy0xMDo1NzowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNS4xIFdpbmRvd3MiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NjJBQzE4OUE2MjdDMTFFM0FGNUNFRUJBQTFBNTFFNzciIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NjJBQzE4OUI2MjdDMTFFM0FGNUNFRUJBQTFBNTFFNzciPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo2MkFDMTg5ODYyN0MxMUUzQUY1Q0VFQkFBMUE1MUU3NyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo2MkFDMTg5OTYyN0MxMUUzQUY1Q0VFQkFBMUE1MUU3NyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PqP7yl8AAAX0SURBVHjafFZLbFRVGP7OfcydmXamZWjpMFPaTlMphQCRYEWiYhFD0BgTKRhXLtxgRMVEV+rCBYkLIyZ04YIgamTDYwUsCKlGIGgIPnkUkyJFyqulMLYzvXMf5/ifc+9MS6ftuTn3nJlz7v/97/9nzUdHRgHE8MgQ4SLUlI/6S5TPaHJeWT26o9P+s+4GbM0lMOFyzDImDXrV0IxWHUkQERBmtKip8YABTmcs3NOB7/noSll4Jh2D7c0KJIcmwfhcEjEWAGlMTjHts/ArFlw1ad2UiaExaqAwNxg3qoDK9JiipegqMExnIFCtfHzaN1gaXm5NwPYF5hvGTFspddHDhUlvXRFmzCfAEgxSHWMamE7QnqdmUXBszNYiW2tAkHpZFdtVYKKyCJiI6w+xPPUTsjVXlCS3J5Zj6OF6skc9vH//gj3wK6K55bDaVyJGzLzYkkCExLdFQIeJakCTzo3pduIigpbERbzU+gUWRocUkBxdC09hbPEJnOzfgEsHT0Fz8yj81o/oc9vQ88JmYiwCX2BKKjYFKGdMZxixfWWSwHqktpR1i4A+x6L4IH1swuMRNX1uoiE6iJ6u/UgmJ4hSBLzk4L/+w1hbGkJj3KA7oVRlgqHN4wbD1byD98+NhGB0TydWVqR+QBMBOX68St+uZ2Bxh441m1xwn1FsAS2pJNZnkiiVvEeBQqeKEdDZO5PYeeYuTtNakcxgDpaQCqUkc5mYEYH2leQYPCD81JrV6Oxohz0xTs7iVKyv7EOXj1wbJ4nu4fqEi7ipBQ6ihYR05s7gb5bI1AL3j0Uj6N3yPBzXUxC+PQmdUoNlRVHyOfZdeYCvB/KwOSOb6fCJrlbmWNpsdDJHxNw5gTwiMnLDgOu4WLOiE6uWddB/PoJgIYl8D/fz49h9YQTfXM1TlmGwDCWF0qtWzn1c6Pj7QQ+5dwKG5lSHP1xYrA4dkS1k00m8unkjrEhEpTRGRGtiMVwevIY3P/gYx37+A5ZpqnCoPIwFamQEJiW6W+jE2eEdeDbbB9N0yCMDYh63KfqSeNzageiT3bjR62NV19IKUMyycPL0OXy6dx8Gb9zEktx6aKS6IO2FYKRO1nz0XkEDj0uDypxhaBqWxH9HbrIPjXU3ydXr8FhDN1bUvoIFfCUx4KLklqATMQkiAb89ehx7DhzEg7ExJNuWYdHru8Bj9XDozCUwOclmxUAyxirKkuO23Y2R8d0Y+64PxesD2LCOYdcbCaS7dHIICk7NIslNFIpF7Nn/PQ4cOQa3ZKO+bSmatr4FVt8Ih+wqpUKoQrnXk699+JEmvVXFBlO21OEhklyAeGsXSjev4eKF8+j/5QIBOehsb0VdIoGh4Vv45MuvcOjEKbrPUdvcgWzv2zDSrfBcl+JQg095VHohV2mcuaEaKR0yWQBluRAqTkw6tqJRiPvDuHO4D/nBy8ScjqfXrkbPuidw/MezOP/nJYofHdHFrchs2wm9qQUl2yZX0kh15L2cBStN8tmiAmPTwKSnTgeMkJfx0WHcPrQXE/8MELc6DIPSE7m8LnzEMm3Ibn8HZroNDqnSpbTlkjRUTxWQ3MsyRLmzqE2rlSSuNKSQXKjEKlXgULBqqQzSvTtRQ8Y3ZD1TocMRzeaQISBDAZVI+fJ7cjeSyKdLnLFKSyFLk1ZOalwByniTnLCAQ6UCRrnPBhZm0LTtXcQ7VivGoi3LkN7+HrR0js5LwV0/UJlXZlZ1EBI0hKGGp0Aw8SBtkSqlk8i4U44iKBTKTkPTpAJJkvr5URjJFFisBtxzKeNDSeErO4kQkEBor6QTqgQUjUo9kFmkUpGY4j7oMYRqpDgx5ztEQo+ANTQTQQ5BeVEo1dG5H6pf/Q7UJyUq05EvoyotiQBQhElTAYVqVlEjs4bwKgwJBGdcubhsJ0QwFeAU0IweZKp74GHlkz2FxoKPJKhqdpRHscptERJVXWQZJGQOM6qcEVaYqgOuesKQkJSm8lS3sxJEZngFJNg8fSNjBboxS7PHgoY3tKE2T42TAPOABDWMOuL/BRgAhjXnmC+gjRsAAAAASUVORK5CYII=)
}

.youtube {
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAbCAYAAAAQ2f3dAAAACXBIWXMAAAsTAAALEwEAmpwYAAAKT2lDQ1BQaG90b3Nob3AgSUNDIHByb2ZpbGUAAHjanVNnVFPpFj333vRCS4iAlEtvUhUIIFJCi4AUkSYqIQkQSoghodkVUcERRUUEG8igiAOOjoCMFVEsDIoK2AfkIaKOg6OIisr74Xuja9a89+bN/rXXPues852zzwfACAyWSDNRNYAMqUIeEeCDx8TG4eQuQIEKJHAAEAizZCFz/SMBAPh+PDwrIsAHvgABeNMLCADATZvAMByH/w/qQplcAYCEAcB0kThLCIAUAEB6jkKmAEBGAYCdmCZTAKAEAGDLY2LjAFAtAGAnf+bTAICd+Jl7AQBblCEVAaCRACATZYhEAGg7AKzPVopFAFgwABRmS8Q5ANgtADBJV2ZIALC3AMDOEAuyAAgMADBRiIUpAAR7AGDIIyN4AISZABRG8lc88SuuEOcqAAB4mbI8uSQ5RYFbCC1xB1dXLh4ozkkXKxQ2YQJhmkAuwnmZGTKBNA/g88wAAKCRFRHgg/P9eM4Ors7ONo62Dl8t6r8G/yJiYuP+5c+rcEAAAOF0ftH+LC+zGoA7BoBt/qIl7gRoXgugdfeLZrIPQLUAoOnaV/Nw+H48PEWhkLnZ2eXk5NhKxEJbYcpXff5nwl/AV/1s+X48/Pf14L7iJIEyXYFHBPjgwsz0TKUcz5IJhGLc5o9H/LcL//wd0yLESWK5WCoU41EScY5EmozzMqUiiUKSKcUl0v9k4t8s+wM+3zUAsGo+AXuRLahdYwP2SycQWHTA4vcAAPK7b8HUKAgDgGiD4c93/+8//UegJQCAZkmScQAAXkQkLlTKsz/HCAAARKCBKrBBG/TBGCzABhzBBdzBC/xgNoRCJMTCQhBCCmSAHHJgKayCQiiGzbAdKmAv1EAdNMBRaIaTcA4uwlW4Dj1wD/phCJ7BKLyBCQRByAgTYSHaiAFiilgjjggXmYX4IcFIBBKLJCDJiBRRIkuRNUgxUopUIFVIHfI9cgI5h1xGupE7yAAygvyGvEcxlIGyUT3UDLVDuag3GoRGogvQZHQxmo8WoJvQcrQaPYw2oefQq2gP2o8+Q8cwwOgYBzPEbDAuxsNCsTgsCZNjy7EirAyrxhqwVqwDu4n1Y8+xdwQSgUXACTYEd0IgYR5BSFhMWE7YSKggHCQ0EdoJNwkDhFHCJyKTqEu0JroR+cQYYjIxh1hILCPWEo8TLxB7iEPENyQSiUMyJ7mQAkmxpFTSEtJG0m5SI+ksqZs0SBojk8naZGuyBzmULCAryIXkneTD5DPkG+Qh8lsKnWJAcaT4U+IoUspqShnlEOU05QZlmDJBVaOaUt2ooVQRNY9aQq2htlKvUYeoEzR1mjnNgxZJS6WtopXTGmgXaPdpr+h0uhHdlR5Ol9BX0svpR+iX6AP0dwwNhhWDx4hnKBmbGAcYZxl3GK+YTKYZ04sZx1QwNzHrmOeZD5lvVVgqtip8FZHKCpVKlSaVGyovVKmqpqreqgtV81XLVI+pXlN9rkZVM1PjqQnUlqtVqp1Q61MbU2epO6iHqmeob1Q/pH5Z/YkGWcNMw09DpFGgsV/jvMYgC2MZs3gsIWsNq4Z1gTXEJrHN2Xx2KruY/R27iz2qqaE5QzNKM1ezUvOUZj8H45hx+Jx0TgnnKKeX836K3hTvKeIpG6Y0TLkxZVxrqpaXllirSKtRq0frvTau7aedpr1Fu1n7gQ5Bx0onXCdHZ4/OBZ3nU9lT3acKpxZNPTr1ri6qa6UbobtEd79up+6Ynr5egJ5Mb6feeb3n+hx9L/1U/W36p/VHDFgGswwkBtsMzhg8xTVxbzwdL8fb8VFDXcNAQ6VhlWGX4YSRudE8o9VGjUYPjGnGXOMk423GbcajJgYmISZLTepN7ppSTbmmKaY7TDtMx83MzaLN1pk1mz0x1zLnm+eb15vft2BaeFostqi2uGVJsuRaplnutrxuhVo5WaVYVVpds0atna0l1rutu6cRp7lOk06rntZnw7Dxtsm2qbcZsOXYBtuutm22fWFnYhdnt8Wuw+6TvZN9un2N/T0HDYfZDqsdWh1+c7RyFDpWOt6azpzuP33F9JbpL2dYzxDP2DPjthPLKcRpnVOb00dnF2e5c4PziIuJS4LLLpc+Lpsbxt3IveRKdPVxXeF60vWdm7Obwu2o26/uNu5p7ofcn8w0nymeWTNz0MPIQ+BR5dE/C5+VMGvfrH5PQ0+BZ7XnIy9jL5FXrdewt6V3qvdh7xc+9j5yn+M+4zw33jLeWV/MN8C3yLfLT8Nvnl+F30N/I/9k/3r/0QCngCUBZwOJgUGBWwL7+Hp8Ib+OPzrbZfay2e1BjKC5QRVBj4KtguXBrSFoyOyQrSH355jOkc5pDoVQfujW0Adh5mGLw34MJ4WHhVeGP45wiFga0TGXNXfR3ENz30T6RJZE3ptnMU85ry1KNSo+qi5qPNo3ujS6P8YuZlnM1VidWElsSxw5LiquNm5svt/87fOH4p3iC+N7F5gvyF1weaHOwvSFpxapLhIsOpZATIhOOJTwQRAqqBaMJfITdyWOCnnCHcJnIi/RNtGI2ENcKh5O8kgqTXqS7JG8NXkkxTOlLOW5hCepkLxMDUzdmzqeFpp2IG0yPTq9MYOSkZBxQqohTZO2Z+pn5mZ2y6xlhbL+xW6Lty8elQfJa7OQrAVZLQq2QqboVFoo1yoHsmdlV2a/zYnKOZarnivN7cyzytuQN5zvn//tEsIS4ZK2pYZLVy0dWOa9rGo5sjxxedsK4xUFK4ZWBqw8uIq2Km3VT6vtV5eufr0mek1rgV7ByoLBtQFr6wtVCuWFfevc1+1dT1gvWd+1YfqGnRs+FYmKrhTbF5cVf9go3HjlG4dvyr+Z3JS0qavEuWTPZtJm6ebeLZ5bDpaql+aXDm4N2dq0Dd9WtO319kXbL5fNKNu7g7ZDuaO/PLi8ZafJzs07P1SkVPRU+lQ27tLdtWHX+G7R7ht7vPY07NXbW7z3/T7JvttVAVVN1WbVZftJ+7P3P66Jqun4lvttXa1ObXHtxwPSA/0HIw6217nU1R3SPVRSj9Yr60cOxx++/p3vdy0NNg1VjZzG4iNwRHnk6fcJ3/ceDTradox7rOEH0x92HWcdL2pCmvKaRptTmvtbYlu6T8w+0dbq3nr8R9sfD5w0PFl5SvNUyWna6YLTk2fyz4ydlZ19fi753GDborZ752PO32oPb++6EHTh0kX/i+c7vDvOXPK4dPKy2+UTV7hXmq86X23qdOo8/pPTT8e7nLuarrlca7nuer21e2b36RueN87d9L158Rb/1tWeOT3dvfN6b/fF9/XfFt1+cif9zsu72Xcn7q28T7xf9EDtQdlD3YfVP1v+3Njv3H9qwHeg89HcR/cGhYPP/pH1jw9DBY+Zj8uGDYbrnjg+OTniP3L96fynQ89kzyaeF/6i/suuFxYvfvjV69fO0ZjRoZfyl5O/bXyl/erA6xmv28bCxh6+yXgzMV70VvvtwXfcdx3vo98PT+R8IH8o/2j5sfVT0Kf7kxmTk/8EA5jz/GMzLdsAAAAgY0hSTQAAeiUAAICDAAD5/wAAgOkAAHUwAADqYAAAOpgAABdvkl/FRgAAA5dJREFUeNrMl81vFWUUxn9n5p373RZjMVK1IRrKwmJciPG6YMOalS6UuPAv8M9xaWLcCInCmrZAbGuAGK0m0LgRi6XVFunt7e297dze93Exc+lHotxpL4aTnEwyycx55nnPeeY8tvDmGAaYWcXgbaCK8RowCJTSzAO5PenSDIEgTSMJAT7NDrCTZhuIge00W0ATqAN/ALclfpS0ofTlAC+CPhVcBEbwFIAoLdwF0C181FAKuJttoIXxF/A18AWw4oCC4BPEZ8Aozz5sD+PdGEK8DAwrYfdzJxgDPtT/A+pp8QrwAXDdSZxNbzwvcQJ4z0kaB4YyN4oEXhAYFgQg9QvYMWDceTECFDMD80I7OyBhYYiFIVhf5qMIjDgvHUsloFeqwItwcBArl+nU1ug8fkyQz4Nz/QAXAYNOopLKQQ/zZNDpoDgmGh5m6OOLKIqoXb5E/MvPsFHHCiUsF+0Kw+GmtuwklbL2ljodFIbkx05TrFaJXn+D+nc3ad64QfvePNbYJCgWIZ9PymTvv4LziapnUkcBvr2Dj2PMjEq1Sm58nMY779KYmqT1/Sw7v93HajXI5bBCAYIgC4U5J+0Tup5aTNpfwoD8wAC58+cpvnWGevV9NicmaM/9hF9dRe028h7rvf9Cp4w0S9rNAwwYUDr+ErkLFyidO0djdpbmlStsz86gZhMyTK7zyqpfu/lvJ+OAytAQOnWKrZER5CLU8SgIe65zaGD/9Vz84AH1a9eoTU7Smp9HjQZyUcJpj/WOeJT7EW//fp/16zepT03RnJuj8+gRGFihmDR/hlpOopOdMaEwhDCZm3hxkfr0NOuTUzRu3yFeeggSYamM5XJJL2b7/o7zydKWTS4s+fp46SG1iSnWrl6lPjPD9sICmBGUy1gUPWH2EBE7Sc1MdJlBFBGvrbF66TLtlRVa9+axICAYGEj1CuT9UX5LW05iI90kw57/GC4iXv2b7cUlhBKGggBlaO6nHMqm81It3cWLWUdTqS7JggRPf1afNlB3EsuCreyrT8Lck92sb+sYLYNlJ3FXsA68kJ30/qHZE+vAXeelO8ASxsnnYrEWfwpuOcGvgm9MjAKvij4atSztnsQy8K3BvCPpr68kAuAjJWagtMfYhgcMbT9g+H2+UmxB4ivN+BLYtOkTo4loiorgDOgs4iRwHKikQ5FPV153wIV3QXevB5243+PED7rxXSduLAK3DH4ws3UD/hkAxN++zimLNSwAAAAASUVORK5CYII=)
}

.twitter {
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAbCAYAAACN1PRVAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYxIDY0LjE0MDk0OSwgMjAxMC8xMi8wNy0xMDo1NzowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNS4xIFdpbmRvd3MiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6RjEwNzlCNEI2Mjc3MTFFMzgzNjNDMkIzMzRCNjAwMUMiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6RjEwNzlCNEM2Mjc3MTFFMzgzNjNDMkIzMzRCNjAwMUMiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDpGMTA3OUI0OTYyNzcxMUUzODM2M0MyQjMzNEI2MDAxQyIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpGMTA3OUI0QTYyNzcxMUUzODM2M0MyQjMzNEI2MDAxQyIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PiBBaDwAAAJWSURBVHja3JZLbExhGIZnqihCoqTVhroUC9Rlo5IGISFYWIiVxNLGhogNO4nEylqwkEiQ7qQblxAWhLjEJK4LhBKKShtUW4zxvPJWTkb/c07NZBbe5MlMp2fOe77L/32TLRQKmUqpKlNBVdSsuvV8Zynfb4XdsB5q4RmchFN+r2DmQyPkqmUIk/2PdyMwmg3rYIWNpDmwGl7DGKiHJfAEvsloEmzyE5yBBymMpsIe2AFjI59nYS3MhTswHX7Cfr0qmgnQBnvhALQ42pBGwQbYVmQUVRNsgZlw3691VU7fOIetC47AVpgSuFEDbHTqk1QHS+ELdCuCAXgVuaDN4a+EsyosfIZBKDjt9U5ZknrdLJdlKLNPcB0ewQJfpLB3wirn/p6LrNadBn2Qd0rj9BRO2ON3bfrhGrTDrkhnSYvMZkff64I3pYhKWXgRPctD3bjGN+gsMhtSbeDzJH2NRi/XiS74drd0uaRUd8OPqFkPXIAPboxyqQtuOro/ZvrjIhyFj2U008Pfhu/Fg1jn4JgNu9xppUqT6H1o6iu/t+BhNPR/lIZwh+ZhyEzva2AxjC/R7IrPbj5kptzehUspDmuccl4zPX/ts2HC3wePPb3VnTNiBm6xdPAPuxyJm1qn/iUc8lrIjWCbayAc9DwdHHZTB6ZFs5eg9tLoFEbP/YDt7uxMyGyWh2uDp/kyb995XjtxUl1uwHEPhv7Y3yCwEJZ7ITZ7mdYErh/wDftc19Nwzscm8WzK7KoL2mHTFps2Rpoj75roDL719freG2+BVMr+tz9SfwkwAFjOiZEdguqDAAAAAElFTkSuQmCC)
}

.flickr {
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAbCAYAAACN1PRVAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYxIDY0LjE0MDk0OSwgMjAxMC8xMi8wNy0xMDo1NzowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNS4xIFdpbmRvd3MiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NTNGMkVFMUY2MjdBMTFFMzhCMjNGNDNCRDQ2QTY3RTIiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NTNGMkVFMjA2MjdBMTFFMzhCMjNGNDNCRDQ2QTY3RTIiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo1M0YyRUUxRDYyN0ExMUUzOEIyM0Y0M0JENDZBNjdFMiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo1M0YyRUUxRTYyN0ExMUUzOEIyM0Y0M0JENDZBNjdFMiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pjapqp8AAAPMSURBVHjavFZNaFxVFP7ufX+TZpxMOklbS2tIaHWhQSZUGvAHu+hCUwXBta1SKLqrWKQrwYUirtxEkC4FtQtFDP7sBIk4uGmbbMwkYlAxmQZm5s3f+7v3eu57M5NpnKEuMjlwYOa98+53zvedc95jS0tLJtkbuVzutVQqNY19NKVUUKvVCuVy+T3G2M+m4zjv5vP56wSGYZgQYmF9ff1J8hfYxsaGmJmZ4e1M9h2MKoKUEoVC4Sczm83GQPrCMEwXwDlHOp2e5Tg4M8zeDIZsytQgHR8qEp3fF4w0hcnbP+iypHtikKQU0g5O/mvtRf/E/wNmGSzG+KcqUGtJ2BbD0YyBEYchCPYcokFIfJTqYK4fJ6eOpYFRBwhC7JWoRzPAsYBtV+D971x88WsTJQK0bYZzpxxcv5DB04+kEkCdnGOA1UMYH/wC/ukK2J81AuOQTx2HuDoP+eJpsDCKmemSsL29rcbHx4kEgXJT4aXFHSyveIRM5fE2Nb5CJsPx2ZUcnn8sBU9TGghYr3wL48vbmg/yTmNTRYaF8MYCxKXHgVYAy7awurrqcj1f2k2u8OEPLpbvENAhepDojGXQnmJwaxJv3qygVIvALQP8xm0CWqGbju5q7AbbpFkE8+0foYp3Ic1kqON507noAqpNia9vtShJ1r8RqNLf/gpR2AxhtXwYXxV7APaaBVYqw/j+DyirqxR4jMgUtlyJmtfDxgAr7giwVkj8N+4TrCimrtsz7uYuWBRJZFMKKQv3CNrneRxLk7rUNDI3cp9gDjExQp2gIIVIaIzBpMLEKMOzDxNaNODZUOHBSQPzD3EEaQfR+Sm90wcA0uHpNKJnTkB5YXe0ujyEBHjt/CimTxDHLbV7jky6UY/TOwujOEl7O2xGCC7PQjyhAf12kGp7FP/33zoDMTsBFojdWjvd6AUS0zmGb17P4OV5B5mRZHvYhP3olInPr2Rw8ayNJsXJIII87KB+8wL8V+egsk571RJ10zk0P34O3rUzUKRt5/x4zjY3N9XY2Jh+ycUXUtSNejXd+jvC7zsShwk0f9LEkQcYGoHCPSuUBltvDePOXRjrFahDJqL8UajjtEUIiDoj2RymiWKx6Jp72fZIG93Mc0Tn2akk3o8U6n4fbfwkQU1XNHckZpP5RGMjGLwbO0PX03QxqBf+z5XuEYC3+2y/jT9w6w/j9dJdxAcGdlCVkTMehmH8BTQs63xdRVFU4ltbW8saUH8B6Rv77frcSqWCarW6aNbr9Utra2ufTE5OnrNte9/pazQabqlUWqTqPvpXgAEAXskOrNb+EfQAAAAASUVORK5CYII=)
}

.facebook {
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABcAAAAXCAMAAADX9CSSAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyRpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoTWFjaW50b3NoKSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo2NTU5MTU0RTVBMkUxMUUzQTgzODlDQkVCQTlCRjdERCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDo2NTU5MTU0RjVBMkUxMUUzQTgzODlDQkVCQTlCRjdERCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjY1NTkxNTRDNUEyRTExRTNBODM4OUNCRUJBOUJGN0REIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjY1NTkxNTRENUEyRTExRTNBODM4OUNCRUJBOUJGN0REIi8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+tKO1uwAAAaRQTFRF9vf68/X5UGmoVm6rGzuNMlCZeIy8OlacSmSkPFidPlqfdoq7PVmePFieR2KjOVWcPFedU2ypJ0aTPlmeQlyg3uPvHj6OSGKkQFygPVie/f7+IUCQ9Pb6GjqMM1CZK0mVdYi6LEqVPFeePlqeHDyNOVacPlmf0tnqRl+iOladRV+hGzeLP1mfX3awVW2q2N7sHT6OOFWbLkyX4+fx9/j7NVGaMk+ZRV6irbjWMU+YME2XZ320PVqe6+713eLuI0ORg5XB6e30GjyNdYm6IUCP9/f7KEeTIkKReIu7NlKaKEeU5eny3+Tv5unyNlSaYHavSWOk0dfoSmKkPVmdTmenRmGiQl6hW3Ou5OjyJEOS3uLuNVKbYnix8vT5CSyEa4G1OFWcIkGRKkiUSmSl6u30h5jDn63QMU+ZRF6iKUeTO1ad7vH3K0qVr7rYMU6YJkSTYniw8vX58fT4LUqWLkyYbYK32d7sIUGReo689fb6TGal8PL3NlOb+Pr8/Pz909rpSGOkU2up+Pn8xs3iNFGZXXStXHStAySAP1qfT2in////O1ed8qxkgAAAARpJREFUeNqU0sVuxEAMBuApbTa8zFhmZtoyMzMzMzNOPC/ddKUko2ov/S+WP1mWD0b9JrPyN2bTIOIJHdGOMadWHkk0N37MujK7GUwkpBjKZnQdk8kRh7xnUWjHUc9Wc9P91Y4/m3ZhtyYH1DyNBTHl3pCt9pdhI9dFO+fPbwU4PBn+Gu8lhrOOUmsA3ooOtkNENFyo6vv2nsGtpy1mkzlqPkssmDgFZL2QV0i64eXLc89OH/gGSpyj69eFmjNrN6BlH3dwuod53d/D54K+5+Gu57OlEx43L9un58uM/Zah+qWpRUAvq9EjlqXuIfagkgSouI7JUxvKcWqy6ilp8eb/7k7obhRJ6BFUof3Da/VCACobpPg/zPwIMACYFdTbOAfyBwAAAABJRU5ErkJggg==)
}

.pinterest {
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAbCAYAAACN1PRVAAAACXBIWXMAAC4jAAAuIwF4pT92AAA50WlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS41LWMwMjEgNzkuMTU0OTExLCAyMDEzLzEwLzI5LTExOjQ3OjE2ICAgICAgICAiPgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgICAgICAgICB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iCiAgICAgICAgICAgIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIKICAgICAgICAgICAgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIgogICAgICAgICAgICB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIKICAgICAgICAgICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgICAgICAgICAgeG1sbnM6dGlmZj0iaHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iCiAgICAgICAgICAgIHhtbG5zOmV4aWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20vZXhpZi8xLjAvIj4KICAgICAgICAgPHhtcDpDcmVhdG9yVG9vbD5BZG9iZSBQaG90b3Nob3AgQ0MgKFdpbmRvd3MpPC94bXA6Q3JlYXRvclRvb2w+CiAgICAgICAgIDx4bXA6Q3JlYXRlRGF0ZT4yMDEzLTA4LTA5VDE1OjE4OjQ4LTA0OjAwPC94bXA6Q3JlYXRlRGF0ZT4KICAgICAgICAgPHhtcDpNb2RpZnlEYXRlPjIwMTQtMTAtMjhUMTI6Mjk6MTItMDQ6MDA8L3htcDpNb2RpZnlEYXRlPgogICAgICAgICA8eG1wOk1ldGFkYXRhRGF0ZT4yMDE0LTEwLTI4VDEyOjI5OjEyLTA0OjAwPC94bXA6TWV0YWRhdGFEYXRlPgogICAgICAgICA8ZGM6Zm9ybWF0PmltYWdlL3BuZzwvZGM6Zm9ybWF0PgogICAgICAgICA8cGhvdG9zaG9wOkNvbG9yTW9kZT4zPC9waG90b3Nob3A6Q29sb3JNb2RlPgogICAgICAgICA8eG1wTU06SW5zdGFuY2VJRD54bXAuaWlkOjdlMGJlZTI3LWEzZTAtNTM0YS1iMmQ2LTMyYTk3NjM5MzkzODwveG1wTU06SW5zdGFuY2VJRD4KICAgICAgICAgPHhtcE1NOkRvY3VtZW50SUQ+eG1wLmRpZDpkZjYyMDZlMi0zZTA3LTUyNDQtYjI4OS0xYjM3MjQyNzcwMmM8L3htcE1NOkRvY3VtZW50SUQ+CiAgICAgICAgIDx4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ+eG1wLmRpZDpkZjYyMDZlMi0zZTA3LTUyNDQtYjI4OS0xYjM3MjQyNzcwMmM8L3htcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD4KICAgICAgICAgPHhtcE1NOkhpc3Rvcnk+CiAgICAgICAgICAgIDxyZGY6U2VxPgogICAgICAgICAgICAgICA8cmRmOmxpIHJkZjpwYXJzZVR5cGU9IlJlc291cmNlIj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0OmFjdGlvbj5jcmVhdGVkPC9zdEV2dDphY3Rpb24+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDppbnN0YW5jZUlEPnhtcC5paWQ6ZGY2MjA2ZTItM2UwNy01MjQ0LWIyODktMWIzNzI0Mjc3MDJjPC9zdEV2dDppbnN0YW5jZUlEPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6d2hlbj4yMDEzLTA4LTA5VDE1OjE4OjQ4LTA0OjAwPC9zdEV2dDp3aGVuPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6c29mdHdhcmVBZ2VudD5BZG9iZSBQaG90b3Nob3AgQ0MgKFdpbmRvd3MpPC9zdEV2dDpzb2Z0d2FyZUFnZW50PgogICAgICAgICAgICAgICA8L3JkZjpsaT4KICAgICAgICAgICAgICAgPHJkZjpsaSByZGY6cGFyc2VUeXBlPSJSZXNvdXJjZSI+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDphY3Rpb24+c2F2ZWQ8L3N0RXZ0OmFjdGlvbj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0Omluc3RhbmNlSUQ+eG1wLmlpZDo3ZTBiZWUyNy1hM2UwLTUzNGEtYjJkNi0zMmE5NzYzOTM5Mzg8L3N0RXZ0Omluc3RhbmNlSUQ+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDp3aGVuPjIwMTQtMTAtMjhUMTI6Mjk6MTItMDQ6MDA8L3N0RXZ0OndoZW4+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDpzb2Z0d2FyZUFnZW50PkFkb2JlIFBob3Rvc2hvcCBDQyAoV2luZG93cyk8L3N0RXZ0OnNvZnR3YXJlQWdlbnQ+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDpjaGFuZ2VkPi88L3N0RXZ0OmNoYW5nZWQ+CiAgICAgICAgICAgICAgIDwvcmRmOmxpPgogICAgICAgICAgICA8L3JkZjpTZXE+CiAgICAgICAgIDwveG1wTU06SGlzdG9yeT4KICAgICAgICAgPHRpZmY6T3JpZW50YXRpb24+MTwvdGlmZjpPcmllbnRhdGlvbj4KICAgICAgICAgPHRpZmY6WFJlc29sdXRpb24+MzAwMDAwMC8xMDAwMDwvdGlmZjpYUmVzb2x1dGlvbj4KICAgICAgICAgPHRpZmY6WVJlc29sdXRpb24+MzAwMDAwMC8xMDAwMDwvdGlmZjpZUmVzb2x1dGlvbj4KICAgICAgICAgPHRpZmY6UmVzb2x1dGlvblVuaXQ+MjwvdGlmZjpSZXNvbHV0aW9uVW5pdD4KICAgICAgICAgPGV4aWY6Q29sb3JTcGFjZT42NTUzNTwvZXhpZjpDb2xvclNwYWNlPgogICAgICAgICA8ZXhpZjpQaXhlbFhEaW1lbnNpb24+Mjc8L2V4aWY6UGl4ZWxYRGltZW5zaW9uPgogICAgICAgICA8ZXhpZjpQaXhlbFlEaW1lbnNpb24+Mjc8L2V4aWY6UGl4ZWxZRGltZW5zaW9uPgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPD94cGFja2V0IGVuZD0idyI/PlHalvsAAAAgY0hSTQAAeiUAAICDAAD5/wAAgOkAAHUwAADqYAAAOpgAABdvkl/FRgAAAuFJREFUeNqc1k2IllUUB/DfPFqaWdbCoKZIN6kIVqYljQsrbZHpGBnMShSpTQQVBIIoRQsXhYK1DEGQaNGXpkFkWllZGX04ZKZtMnNIzcKIcejDNueF4+2+7zt4Ns+595x7/889H/97e76YOs0o5Ar0YRZuwAQM4xgG8THOdttkbBf7HDyKBzCpg99ZvIkXcaCdU9NmfhxeioUruwDBlViBz7EFl40WbDq+x2oXJ6twBDO7hXEavsGlHTb7CWdCvwbXVnyux9e4Bd/WwMbj0zZAu7ENewIsy0wsxWMF8Fjsj7k/yzC+hquKjc6gH4uwtQIk/nwDpkaeyyp+vczZfNxXOB7HDOyI8Z2x2UH8jB/CNhD2ETyM54t97sUC6Ik++yj6qCXncWM6ySY83iGPr+KhNN6PeWn8GeY10aR9xeK1CWhjAjqPkxWw5ViXxo8U9jswpcH9hWE4heJmPBH6V5GXXjxTAVyTimsQ3xX2JQ1mF5Pv4a/Qn4zv31iIH0N/ukJPE6J1ciiz3NpEbsrqasnc+O5LvQVj2hBCZo4/Cltvg8uLyX+K0oWhwud2TKyAnSoo7IIfaXCumJyS9KFEYfkk/RWgXyPMtX1gpKk06qKkPxs5mo3JXcA+wb+pf28r7ENNcGGWyanU38JvoZ9Op5xeAduc9IWVMA422FlZuCn4blyA70y5rHHn28GfLVlX8dnV4GhQUCnbcSL0HWn+IJ5L45exOI0Hgv6yHMKhFl0tbnPClszAYVySevC6yM3x5LcAeyvrl2F7q8J2xS1bk5MBBHfF9T8pTt0Cuhrr2wB9GVG64D5bGqXeUzjvKy7X/gB5B7/HRdnXpu9gSe3y/CXC8EHhnMd3x3ciHhzFE+GelPf/Uc6HEarhoiDy4tHISPTrnm4PnvdxUxByPv2yRF+d5N0I9+7S0NPlkToQD5ehyE8n2YsX8MbFPlJfSdX2VFy0vcHu5+J5MBh5PdLtyP8NANPznqhL35DdAAAAAElFTkSuQmCC)
}

.linkedin {
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAbCAYAAACN1PRVAAAACXBIWXMAAAsTAAALEwEAmpwYAAA7amlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS41LWMwMjEgNzkuMTU1NzcyLCAyMDE0LzAxLzEzLTE5OjQ0OjAwICAgICAgICAiPgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgICAgICAgICB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iCiAgICAgICAgICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgICAgICAgICB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIKICAgICAgICAgICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgICAgICAgICAgeG1sbnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvIgogICAgICAgICAgICB4bWxuczpwaG90b3Nob3A9Imh0dHA6Ly9ucy5hZG9iZS5jb20vcGhvdG9zaG9wLzEuMC8iCiAgICAgICAgICAgIHhtbG5zOnRpZmY9Imh0dHA6Ly9ucy5hZG9iZS5jb20vdGlmZi8xLjAvIgogICAgICAgICAgICB4bWxuczpleGlmPSJodHRwOi8vbnMuYWRvYmUuY29tL2V4aWYvMS4wLyI+CiAgICAgICAgIDx4bXA6Q3JlYXRvclRvb2w+QWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKFdpbmRvd3MpPC94bXA6Q3JlYXRvclRvb2w+CiAgICAgICAgIDx4bXA6Q3JlYXRlRGF0ZT4yMDEyLTExLTAxVDEzOjA4OjE0LTA0OjAwPC94bXA6Q3JlYXRlRGF0ZT4KICAgICAgICAgPHhtcDpNb2RpZnlEYXRlPjIwMTUtMDItMjRUMTM6MjY6MjMtMDU6MDA8L3htcDpNb2RpZnlEYXRlPgogICAgICAgICA8eG1wOk1ldGFkYXRhRGF0ZT4yMDE1LTAyLTI0VDEzOjI2OjIzLTA1OjAwPC94bXA6TWV0YWRhdGFEYXRlPgogICAgICAgICA8eG1wTU06SW5zdGFuY2VJRD54bXAuaWlkOjVjYTc1ZjdmLTU0NWMtOGY0YS05NDRiLTdmNjUwYmRjZjdkMDwveG1wTU06SW5zdGFuY2VJRD4KICAgICAgICAgPHhtcE1NOkRvY3VtZW50SUQ+YWRvYmU6ZG9jaWQ6cGhvdG9zaG9wOjkxYjg0YjE0LWJjNTItMTFlNC04ZmMyLWMzMmMzN2VlOTM3ODwveG1wTU06RG9jdW1lbnRJRD4KICAgICAgICAgPHhtcE1NOkRlcml2ZWRGcm9tIHJkZjpwYXJzZVR5cGU9IlJlc291cmNlIj4KICAgICAgICAgICAgPHN0UmVmOmluc3RhbmNlSUQ+eG1wLmlpZDpDMTAyMEM1NTFDN0IxMUUyQjkxNEY3RUNEMkY1ODRBRDwvc3RSZWY6aW5zdGFuY2VJRD4KICAgICAgICAgICAgPHN0UmVmOmRvY3VtZW50SUQ+eG1wLmRpZDpDMTAyMEM1NjFDN0IxMUUyQjkxNEY3RUNEMkY1ODRBRDwvc3RSZWY6ZG9jdW1lbnRJRD4KICAgICAgICAgPC94bXBNTTpEZXJpdmVkRnJvbT4KICAgICAgICAgPHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD54bXAuZGlkOkMxMDIwQzU4MUM3QjExRTJCOTE0RjdFQ0QyRjU4NEFEPC94bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ+CiAgICAgICAgIDx4bXBNTTpIaXN0b3J5PgogICAgICAgICAgICA8cmRmOlNlcT4KICAgICAgICAgICAgICAgPHJkZjpsaSByZGY6cGFyc2VUeXBlPSJSZXNvdXJjZSI+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDphY3Rpb24+c2F2ZWQ8L3N0RXZ0OmFjdGlvbj4KICAgICAgICAgICAgICAgICAgPHN0RXZ0Omluc3RhbmNlSUQ+eG1wLmlpZDpiYWU1MTMwNy0xYzQwLTQ5NGEtOGYyMS01MzlkMWRkNWU3NDE8L3N0RXZ0Omluc3RhbmNlSUQ+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDp3aGVuPjIwMTUtMDItMjRUMTM6MjM6NTgtMDU6MDA8L3N0RXZ0OndoZW4+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDpzb2Z0d2FyZUFnZW50PkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE0IChXaW5kb3dzKTwvc3RFdnQ6c29mdHdhcmVBZ2VudD4KICAgICAgICAgICAgICAgICAgPHN0RXZ0OmNoYW5nZWQ+Lzwvc3RFdnQ6Y2hhbmdlZD4KICAgICAgICAgICAgICAgPC9yZGY6bGk+CiAgICAgICAgICAgICAgIDxyZGY6bGkgcmRmOnBhcnNlVHlwZT0iUmVzb3VyY2UiPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6YWN0aW9uPnNhdmVkPC9zdEV2dDphY3Rpb24+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDppbnN0YW5jZUlEPnhtcC5paWQ6NWNhNzVmN2YtNTQ1Yy04ZjRhLTk0NGItN2Y2NTBiZGNmN2QwPC9zdEV2dDppbnN0YW5jZUlEPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6d2hlbj4yMDE1LTAyLTI0VDEzOjI2OjIzLTA1OjAwPC9zdEV2dDp3aGVuPgogICAgICAgICAgICAgICAgICA8c3RFdnQ6c29mdHdhcmVBZ2VudD5BZG9iZSBQaG90b3Nob3AgQ0MgMjAxNCAoV2luZG93cyk8L3N0RXZ0OnNvZnR3YXJlQWdlbnQ+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDpjaGFuZ2VkPi88L3N0RXZ0OmNoYW5nZWQ+CiAgICAgICAgICAgICAgIDwvcmRmOmxpPgogICAgICAgICAgICA8L3JkZjpTZXE+CiAgICAgICAgIDwveG1wTU06SGlzdG9yeT4KICAgICAgICAgPGRjOmZvcm1hdD5pbWFnZS9wbmc8L2RjOmZvcm1hdD4KICAgICAgICAgPHBob3Rvc2hvcDpDb2xvck1vZGU+MzwvcGhvdG9zaG9wOkNvbG9yTW9kZT4KICAgICAgICAgPHRpZmY6T3JpZW50YXRpb24+MTwvdGlmZjpPcmllbnRhdGlvbj4KICAgICAgICAgPHRpZmY6WFJlc29sdXRpb24+NzIwMDAwLzEwMDAwPC90aWZmOlhSZXNvbHV0aW9uPgogICAgICAgICA8dGlmZjpZUmVzb2x1dGlvbj43MjAwMDAvMTAwMDA8L3RpZmY6WVJlc29sdXRpb24+CiAgICAgICAgIDx0aWZmOlJlc29sdXRpb25Vbml0PjI8L3RpZmY6UmVzb2x1dGlvblVuaXQ+CiAgICAgICAgIDxleGlmOkNvbG9yU3BhY2U+NjU1MzU8L2V4aWY6Q29sb3JTcGFjZT4KICAgICAgICAgPGV4aWY6UGl4ZWxYRGltZW5zaW9uPjI3PC9leGlmOlBpeGVsWERpbWVuc2lvbj4KICAgICAgICAgPGV4aWY6UGl4ZWxZRGltZW5zaW9uPjI3PC9leGlmOlBpeGVsWURpbWVuc2lvbj4KICAgICAgPC9yZGY6RGVzY3JpcHRpb24+CiAgIDwvcmRmOlJERj4KPC94OnhtcG1ldGE+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgCjw/eHBhY2tldCBlbmQ9InciPz51EJCFAAAAIGNIUk0AAHolAACAgwAA+f8AAIDpAAB1MAAA6mAAADqYAAAXb5JfxUYAAAL9SURBVHjavJZLaNRQFIa/O0nm4UwfVouttiC1PkEUrRtdKBatiC4FEQQFwY3dWhBBBF3pTtyoaxE3ilIEERREQcRHfZf6wkdL7XNenUkmyXVxayaZqULttD+EzNxzc0/Of/7zE0FX9zHgNGAweygApwRd3ZI5Qggwi/8EOC6MZGEoA6at1ioDUwcsIEJIQK4AjmTX5qXEDY2b7wZxknmoiYI7YwIsvciqC47k8sENHNnUDEDPQIqOi48ZTJsQMypCo8LYBB0blniJANY1VnNyzxpImRXrmYLjUh8Pl21YlAiDlBVOVhvj9rMfvBlMe0uulJy/1wfxykxFsWcxg2QyT9uFR5xqX04ionHl6XdevR+EBXFwZLBCIZRSLRuyBUBCWIeoDpqAKcgQdHWngCrE5AFDWUjlVTSqQ0MVGBrkbXX9QVSHjAmJCOuaazE0wefRCUYH0uolyhWcLlZmuaALrnVuoSER8ZaP3nhN7/Of7Gxv5cS2Vq+o/VdfEKuNcf1QGxubagAYzlrc7Rvm+K23/OxPQd28QELd1yBAsG9tY2COF8bD9CbzLFsQZ2tLnbd+tmMle9Yson6eEdh7YP1itrcuZNWZeySzVmBkQj5CAfg2nguOve2CoZExixRK4HBbUyCRHw2JMJ07VkDa/Isap4E/hY/nCpy+84Fz9z9hlzjM3hX1UBUB252Cxul6j+Oy7dITeh58Ain5lbM4t3u1F19cHVEUWs7Mk30YytLzcRha6iBl8vDLWCCuCpUzpxFgZMJSP7QQaIKC65Ykk2Wz9t/JspYDBcdroBBiGnY1TWhCqIErEc2sJJuZEc9pMll0AT8MTYDtEjWC7zU/ZhSNWUq1j6DzUCJIvTTty/4UTTVRbzljOhAzGM4W+DqW80k/o5Q4qciM6QTiP5L5Mu6Kru9VWKJXv8oCMVGuin89O+n6Qd5sNzgfRkhVYLsB6yEkVExOStGV6jvGL09D858c1oFISZPKO+tKdXi4JCZ9dzFFPIiIDnTO1Rfx7wEA4YQP61bPS5MAAAAASUVORK5CYII=)
}

.googleplus {
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAuCAYAAABXuSs3AAAAAXNSR0IArs4c6QAAA9lJREFUaAXtmX9IU1EUx882tznnr0ynGREpFvRfkWZ/FCRSRGQWmEgU/VF/FNEPqD8LwiAoIUihfyMoSyywoP6oDCEtqUj6IWRIhKVu/pq2qU+39zrnuvt82x6Mt+3pgl04vHPPu+/cz/t6d3bvBPhPm0GFWy2mMmzJQ5JyRiUk+aaAka+8p3xmqX0CJvMHjL1AioLC9KayvCrPZm00GYyFiviyu35JHHTNzp3e/uLtU4TxEZAxQEXqmhMRmvhISEeqpYkY0dhKUIJbEk1pguYtwGbBfjg4H5TAV1Vw5XpPVHZiDFKcQFkgUYkDXDIjX+MJzhuOlwQP10TfSFJxffUNz55UPFwTfSMxfekY7HbIPlgH9i1bwZyP+zKssvPOIfB+6AZ36z2Qpqd1o48aPG1zGeSePAdmR0EQnHVtEZBl7KgAZ1MDCD0fg+7HqxMVuG1TKRRcvgYGw8IX2dyIC2a+9zIm24aNYMlzgOT3g2/wd7w4w/JoBjek2SHv1HkGLfp8MNZ8ByYfPwCDKLLkktEI6bv3wUx3J4jjo2ETxiugGTz7QK28PCYeNcNU6/2gTQ69gPd5W0S+4rZ2NqZ/f0XEsWoDNJdDe2k5yyPiB8/dclct55LENCtuLljNwISfP/AQRcfAxcZVXIwseJ7ODnBev8I6oWN4X6vymhWXJH7YlneYoZzhfROdwePbNCvuc/4B07oSsBaV4AkQj4Dz8zLRcGOD7JuysiDv6AnW942PyfG+qp3MX//kNbvyvilQoeSBERzNinvedbGURpsNcuqOBaX3vnwG3ExmOmUtNKH3C3fx4GtgxgOhfR6PdNWs+GRbC2RU7AJL/irIrj4EEpbEiYf4IcW6zVvm3mpYUXOYdYWBX+Dp6uC35Gu0SvMEmsGlmRlw3boBhfUNYMS1m1N7BDIr98Bsfx+AKOESKpbLpYilceT2zaCX4hNrXRr8OX7VDE4PCl97YPDSBXCcuciUT1mZC+loyuZzT4ALoYVvn5XhuPlRgdPsBD9w9jhkVtWAvWwbWAvXBDZZw+D99B4m8ctJ+jsVN9DQRFGDs0S4bKZwfZPxIglYLvkeJnSyePZjA1eQyFVdY1lTpNDkai6HmrLrODgJrqO4qqmTiqvKomMwqbiO4qqmTiquKouOQaXioiD6XTrOFVPqANvCTwmYiYPTVsPXPjR6VfD7R2KaQYeHienV8Fg9MaKxbRHfYtALpKPlo+WgpaLxe+guayPQWbRxNCeaB03kmyy6KaC5KYhG5y7+10B3WRvxzKHRHpkYgxTHPgOlf4ASNL1QIilOS4Tg6WTO1vk/yrUG/vk8ZeYAAAAASUVORK5CYII=)
}

.rss {
    background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB0AAAAdCAMAAABhTZc9AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA3ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDIxIDc5LjE1NTc3MiwgMjAxNC8wMS8xMy0xOTo0NDowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo0NzZiMjA1Zi00ZGUxLTZiNDctOTMyMC03ZWY5NWQ5OWI3MzEiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6QTUxRjNCOTIyODA5MTFFNjgyRDVDNTkyQTkzNDdBRjYiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6QTUxRjNCOTEyODA5MTFFNjgyRDVDNTkyQTkzNDdBRjYiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTQgKFdpbmRvd3MpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6NDc2YjIwNWYtNGRlMS02YjQ3LTkzMjAtN2VmOTVkOTliNzMxIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjQ3NmIyMDVmLTRkZTEtNmI0Ny05MzIwLTdlZjk1ZDk5YjczMSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pmuk6osAAAF9UExURfTr3vT08/eiNPTw6vXWrfTz8vXewfegLvXiyvefLPejN/XjzPbBfPTu5vimO/a/ePilOvinPvXfxPbAevTy8Pa2YfenP/XgxvXXr/XRovTn1PipQ/ayWvXewPa0XfXWrvXYs/XTp/a1YPbFh/XOmvTs4PTt4/XUqfa1YfXSpPegL/XVq/ekOPeqR/XQn/To1/Tw6/egMPeoQ/Tx7PvPlvilOfekOfbGh/a4aPbEhPXiy/auTva5afawU/Tm0/bAe/epRPTx7fa6bPXbuvbIjfXJj/a7b/XgxPTp2/XLlPayWPejNfTz8fXdv/XjzfXKkvXNmfeqRvTv6fepRfzWpfbEg/Xcu/Xbufa2Yvzcs/a8cPXYsva1X/ioQfXSpfbJj/Tt5PTn1fXZtfXUqveoQfTq3Pa0Xva9dPa8cfa3ZPXLk/awVfXUqPXMlvXcvfTv6PemPPTm1PbGiPirR/auUPayWfa3ZfTy7va6bfzWpPelOvXfw/imPPT09PeeKmiQOqoAAAFoSURBVHjafJJlY8IwEIaDU9yHO0M3mLu7u7u7+1buty9Jw4BReL/cNU96GrT1YuLFZfB8IQ9UF4/aalAD4gGsoQVjYkUq9i+m8jyW3jIV/hajobwgyYRVU0nj+T9pLznRyEyKgOMf3Xw+cN27JYx3v5VTIm6pMz0k4Hp7BcVSve5/UHz4Xkob9dm5Oz8p1/5EcaynhJ7Qcny6doCGdYrrHov0ltWjDgNonNRNinQkWwPI/FDvvJg3JivwDhx8kjhBVYGe9iV0AeGCQgewTTpvuSrtSOVVUvwwDakR4jhTZf1KoxRvNMHnLNnZYPk0wEUX1QszNIyxQI3a3NGYCqT0VCmFUWLjjPpt5KsLYFiBre0GdkmJ84ymhfng1BbiRMCBsDlj9FiYFE5xTRw5cFpsEKPjlC5iesGu+cgiGeWiy5LcTgZTr9bdnw3i2SKE1ISa8KFmIBlpFn3P5hqv3YRW9/hqMrf+CjAAaC1Z2TOY0NQAAAAASUVORK5CYII=)
}

.shr-pg a {
    background-image: none
}

.followus {
    background-color: #eaebed;
    display: inline-block;
    margin-bottom: 15px;
    padding: 10px 5px
}

.followus h2 {
    display: inline;
    font-size: 16px;
    margin-left: 5px
}

.followus ul {
    display: inline;
    margin-left: 5px;
    padding-left: 0
}

.followus ul li {
    display: inline-block;
    margin: 5px 0;
    padding: 0
}

.followus ul li a {
    border: solid 2px #eaebed;
    padding: 10px 17px
}

.followus ul li a:active, .followus ul li a:focus, .followus ul li a:hover {
    border: solid 2px #0535d2
}

.followus .facebook, .followus .flickr, .followus .linkedin, .followus .pinterest, .followus .rss, .followus .twitter, .followus .youtube {
    background-position: center center;
    background-repeat: no-repeat;
    display: inline;
    min-height: 27px;
    min-width: 27px;
    position: relative;
    vertical-align: text-bottom
}

.followus .youtube {
    min-width: 38px
}

.followus .googleplus {
    background-repeat: no-repeat;
    -webkit-background-size: 35px 35px;
    background-size: 35px 35px;
    padding-top: -1px
}

.icon {
    background-position: left bottom;
    background-repeat: no-repeat;
    display: inline-block;
    min-height: 32px;
    min-width: 32px
}

.icon.youtube {
    padding-left: 45px
}

.icon.googleplus {
    height: 45px;
    padding-left: 48px
}

.fd-wdgt.panel {
    padding-left: 0;
    padding-right: 0
}

.fd-wdgt .panel-heading {
    border-bottom: 1px solid #ddd
}

.fd-wdgt .panel-body {
    max-height: 25em;
    overflow-y: scroll;
    padding: 0
}

.fd-wdgt .media {
    border-top: 1px solid #ddd;
    margin-top: 0;
    padding: 15px 15px 0 5px;
    position: relative
}

.fd-wdgt .media:first-child {
    border-top: 0
}

.fd-wdgt .media p {
    font-size: .9em
}

.fd-wdgt .panel-title {
    padding-right: 30px
}

.fd-wdgt .panel-title .icon {
    position: absolute;
    right: 5px;
    top: 5px
}

.fd-wdgt .feeds-date {
    display: inline-block;
    float: none !important;
    padding-top: 10px
}

.fd-wdgt .media-body img {
    display: block;
    margin-left: auto;
    margin-right: auto;
    padding: 15px 10px 5px
}

.lt-ie9 .fd-wdgt .panel-title {
    padding-right: 30px
}

.lt-ie9 .fd-wdgt .panel-title .icon {
    padding-left: 0
}

.blog article .col-md-3, .blog article .col-md-9 {
    display: inline-block;
    float: none;
    margin-right: -4px;
    vertical-align: middle
}

.zbra section.brdr-tp:nth-child(odd) {
    background: #eee
}

.zbra section.brdr-tp .row {
    margin-left: -5px;
    margin-right: -5px
}

.pagntn-prv-nxt {
    margin-bottom: 15px
}

.pagntn-prv-nxt .glyphicon-chevron-left, .pagntn-prv-nxt .glyphicon-chevron-right {
    font-size: 2em
}

.pagntn-prv-nxt .glyphicon-chevron-left {
    float: left;
    margin: -4px 0 0 -32px
}

.pagntn-prv-nxt .glyphicon-chevron-right {
    float: right;
    margin: -4px -32px 0 0
}

.pagntn-prv-nxt li {
    font-size: 16px;
    font-weight: 300;
    list-style: none outside none
}

.pagntn-prv-nxt li a {
    display: block;
    padding: 15px 40px;
    text-decoration: none
}

.pagntn-prv-nxt li a:hover {
    background-color: #eaebed
}

.pagntn-prv-nxt li a .pgntn-lbl {
    display: block;
    font-size: 27px;
    font-weight: 400
}

.badge.badge-dept {
    background-color: #eee;
    color: #333;
    font-size: 2em;
    margin: 20px 10px 0
}

.toc li {
    display: inline
}

.toc li .list-group-item:focus, .toc li .list-group-item:hover {
    background-color: #f5f5f5;
    text-decoration: none
}

.toc li .list-group-item.active, .toc li .list-group-item.active:focus, .toc li .list-group-item.active:hover {
    background-color: #335075;
    color: #fff;
    cursor: auto;
    text-decoration: none;
    z-index: 2
}

.carousel-s1 a, .carousel-s2 a {
    text-decoration: none
}

.carousel-s1 a:hover, .carousel-s2 a:hover {
    text-decoration: underline
}

.backgroundsize.csstransitions #social-media-centre tbody {
    padding-top: 2em
}

.backgroundsize.csstransitions #social-media-centre tbody tr {
    -webkit-background-clip: content-box;
    background-clip: content-box;
    background-color: #eee;
    background-image: url(data:image/gif;base64,R0lGODlhAQABAIAAAMLCwgAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==), url(data:image/gif;base64,R0lGODlhAQABAIAAAMLCwgAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==), url(data:image/gif;base64,R0lGODlhAQABAIAAAMLCwgAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==), url(data:image/gif;base64,R0lGODlhAQABAIAAAMLCwgAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==);
    -webkit-background-origin: content-box;
    background-origin: content-box;
    background-position: top left, top left, bottom left, top right;
    background-repeat: repeat-x, repeat-y, repeat-x, repeat-y;
    border: 0;
    display: inline-block;
    margin-bottom: 20px;
    padding: 5px;
    text-align: center;
    vertical-align: middle;
    width: 100%
}

@media (min-width: 768px) {
    .backgroundsize.csstransitions #social-media-centre tbody tr {
        width: 50%
    }
}

@media (min-width: 1200px) {
    .backgroundsize.csstransitions #social-media-centre tbody tr {
        width: 33.333%
    }
}

.backgroundsize.csstransitions #social-media-centre tbody tr .product-department {
    height: 3em;
    white-space: normal
}

.backgroundsize.csstransitions .product-listing {
    border: 0;
    width: 100%
}

.backgroundsize.csstransitions .product-record {
    display: inline-block;
    margin-bottom: 20px;
    width: 100%
}

.backgroundsize.csstransitions .product-record:target {
    height: auto !important
}

.backgroundsize.csstransitions .product-department, .backgroundsize.csstransitions .product-language, .backgroundsize.csstransitions .product-link-container {
    margin-top: 1em
}

.backgroundsize.csstransitions .product-department, .backgroundsize.csstransitions .product-language {
    font-weight: 700;
    margin-top: 1em
}

.backgroundsize.csstransitions .product-link {
    display: block;
    padding: 6px 12px !important;
    text-decoration: none;
    text-transform: none !important;
    white-space: normal
}

.backgroundsize.csstransitions .product-link:focus, .backgroundsize.csstransitions .product-link:hover {
    text-decoration: none
}

#social-media-centre_wrapper .datatables_wrapper {
    margin-bottom: 3em
}

#social-media-centre_wrapper .product-listing {
    border: 1px solid #ddd
}

#social-media-centre_wrapper .product-listing td {
    padding: 8px
}

#mobile-centre_wrapper .product-department, #mobile-centre_wrapper .product-links, #mobile-centre_wrapper .product-longdescription, #mobile-centre_wrapper .product-name, #mobile-centre_wrapper .product-platforms, #mobile-centre_wrapper .product-shortdescription, .backgroundsize.csstransitions .product-department, .backgroundsize.csstransitions .product-language, .backgroundsize.csstransitions .product-link-container, .backgroundsize.csstransitions .product-name, .backgroundsize.csstransitions .product-platforms {
    border: 0;
    display: block
}

#mobile-centre_wrapper .product-data-expanded, #mobile-centre_wrapper .product-data-hidden, #mobile-centre_wrapper .record-close, #mobile-centre_wrapper :target .product-data-compressed, .backgroundsize.csstransitions #mobile-centre tbody tr .product-department, .backgroundsize.csstransitions #mobile-centre tbody tr .product-longdescription, .backgroundsize.csstransitions #mobile-centre tbody tr td.product-link-container {
    display: none;
    visibility: hidden
}

#mobile-centre_wrapper .product-data-compressed, #mobile-centre_wrapper :target .product-data-expanded, #mobile-centre_wrapper :target .record-close, .backgroundsize.csstransitions #mobile-centre tbody tr:target .product-department, .backgroundsize.csstransitions #mobile-centre tbody tr:target .product-longdescription, .backgroundsize.csstransitions #mobile-centre tbody tr:target td.product-link-container {
    display: block;
    visibility: visible
}

.backgroundsize.csstransitions #mobile-centre tbody {
    padding-top: 2em
}

.backgroundsize.csstransitions #mobile-centre tbody tr {
    -webkit-background-clip: content-box;
    background-clip: content-box;
    background-color: #eee;
    background-image: url(data:image/gif;base64,R0lGODlhAQABAIAAAMLCwgAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==), url(data:image/gif;base64,R0lGODlhAQABAIAAAMLCwgAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==), url(data:image/gif;base64,R0lGODlhAQABAIAAAMLCwgAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==), url(data:image/gif;base64,R0lGODlhAQABAIAAAMLCwgAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==);
    -webkit-background-origin: content-box;
    background-origin: content-box;
    background-position: top left, top left, bottom left, top right;
    background-repeat: repeat-x, repeat-y, repeat-x, repeat-y;
    border: 0;
    display: inline-block;
    margin-bottom: 20px;
    min-height: 20em;
    padding: 5px;
    vertical-align: middle;
    width: 100%
}

@media (min-width: 768px) {
    .backgroundsize.csstransitions #mobile-centre tbody tr {
        width: 50%
    }
}

@media (min-width: 1200px) {
    .backgroundsize.csstransitions #mobile-centre tbody tr {
        width: 33.333%
    }
}

.backgroundsize.csstransitions #mobile-centre tbody tr .product-platforms span {
    margin-right: 5px
}

.backgroundsize.csstransitions #mobile-centre tbody tr:target {
    height: auto !important;
    width: 100%
}

.backgroundsize.csstransitions #mobile-centre tbody tr:target .product-longdescription {
    float: none
}

.backgroundsize.csstransitions #mobile-centre tbody tr:target .product-link-container {
    border: 0;
    float: none
}

.backgroundsize.csstransitions #mobile-centre tbody tr:hover {
    background-color: #e8e8e8;
    border-color: #d6d6d6;
    cursor: pointer
}

.backgroundsize.no-csstransitions #mobile-centre tr, .no-backgroundsize.no-csstransitions #mobile-centre tr {
    border-bottom: 1px solid #999 !important;
    border-top: 1px solid #999 !important
}

.backgroundsize.no-csstransitions #mobile-centre .product-department, .backgroundsize.no-csstransitions #mobile-centre .product-links, .backgroundsize.no-csstransitions #mobile-centre .product-longdescription, .backgroundsize.no-csstransitions #mobile-centre .product-name, .backgroundsize.no-csstransitions #mobile-centre .product-platforms, .backgroundsize.no-csstransitions #mobile-centre .product-shortdescription, .no-backgroundsize.no-csstransitions #mobile-centre .product-department, .no-backgroundsize.no-csstransitions #mobile-centre .product-links, .no-backgroundsize.no-csstransitions #mobile-centre .product-longdescription, .no-backgroundsize.no-csstransitions #mobile-centre .product-name, .no-backgroundsize.no-csstransitions #mobile-centre .product-platforms, .no-backgroundsize.no-csstransitions #mobile-centre .product-shortdescription {
    float: left !important;
    margin-left: 10px;
    margin-right: 10px
}

.backgroundsize.no-csstransitions #mobile-centre .product-department, .backgroundsize.no-csstransitions #mobile-centre .product-longdescription, .backgroundsize.no-csstransitions #mobile-centre .product-name, .backgroundsize.no-csstransitions #mobile-centre .product-platforms, .backgroundsize.no-csstransitions #mobile-centre .product-shortdescription, .no-backgroundsize.no-csstransitions #mobile-centre .product-department, .no-backgroundsize.no-csstransitions #mobile-centre .product-longdescription, .no-backgroundsize.no-csstransitions #mobile-centre .product-name, .no-backgroundsize.no-csstransitions #mobile-centre .product-platforms, .no-backgroundsize.no-csstransitions #mobile-centre .product-shortdescription {
    width: 96% !important
}

.backgroundsize.no-csstransitions #mobile-centre .product-name, .backgroundsize.no-csstransitions #mobile-centre .product-platforms, .no-backgroundsize.no-csstransitions #mobile-centre .product-name, .no-backgroundsize.no-csstransitions #mobile-centre .product-platforms {
    margin-top: 10px
}

.backgroundsize.no-csstransitions #mobile-centre .product-name, .no-backgroundsize.no-csstransitions #mobile-centre .product-name {
    padding-bottom: 0
}

.backgroundsize.no-csstransitions #mobile-centre .product-platforms, .no-backgroundsize.no-csstransitions #mobile-centre .product-platforms {
    padding-top: 0
}

.backgroundsize.no-csstransitions #mobile-centre .product-department, .backgroundsize.no-csstransitions #mobile-centre .product-links, .backgroundsize.no-csstransitions #mobile-centre .product-longdescription, .backgroundsize.no-csstransitions #mobile-centre .product-platforms, .backgroundsize.no-csstransitions #mobile-centre .product-shortdescription, .no-backgroundsize.no-csstransitions #mobile-centre .product-department, .no-backgroundsize.no-csstransitions #mobile-centre .product-links, .no-backgroundsize.no-csstransitions #mobile-centre .product-longdescription, .no-backgroundsize.no-csstransitions #mobile-centre .product-platforms, .no-backgroundsize.no-csstransitions #mobile-centre .product-shortdescription {
    clear: left;
    margin-top: 0
}

.backgroundsize.no-csstransitions #mobile-centre .product-shortdescription, .backgroundsize.no-csstransitions #mobile-centre .record-close, .no-backgroundsize.no-csstransitions #mobile-centre .product-shortdescription, .no-backgroundsize.no-csstransitions #mobile-centre .record-close {
    display: none !important
}

.backgroundsize.no-csstransitions #mobile-centre .product-link-container, .no-backgroundsize.no-csstransitions #mobile-centre .product-link-container {
    border: none !important
}

.backgroundsize.no-csstransitions #mobile-centre .product-link-list li, .no-backgroundsize.no-csstransitions #mobile-centre .product-link-list li {
    display: inline;
    float: left
}

#mobile-centre_wrapper .product-record {
    display: inline-block;
    margin-bottom: 20px;
    width: 100%
}

#mobile-centre_wrapper .product-record:target {
    height: auto !important
}

#mobile-centre_wrapper .product-record:hover {
    background-color: #e8e8e8;
    border-color: #d6d6d6;
    cursor: pointer
}

#mobile-centre_wrapper .product-icon {
    border: 0;
    float: left;
    height: 48px;
    margin-bottom: 10px;
    margin-right: 10px;
    padding-bottom: 3px;
    padding-right: 3px;
    width: 48px
}

#mobile-centre_wrapper .product-longdescription, #mobile-centre_wrapper .product-shortdescription {
    margin-top: 1em
}

#mobile-centre_wrapper .product-department {
    font-weight: 700;
    margin-top: 1em
}

#mobile-centre_wrapper .product-link-list {
    list-style-type: none;
    margin-top: 1em;
    padding-left: 0
}

#mobile-centre_wrapper .product-link-container {
    margin-bottom: 1em
}

#mobile-centre_wrapper .product-link {
    display: block;
    padding: 6px 12px !important;
    text-align: left;
    text-decoration: none;
    text-transform: none !important;
    white-space: normal
}

#mobile-centre_wrapper .product-link:focus, #mobile-centre_wrapper .product-link:hover {
    text-decoration: none
}

#mobile-centre_wrapper .record-expand {
    color: inherit;
    text-decoration: none
}

#mobile-centre_wrapper .record-expand:focus, #mobile-centre_wrapper .record-expand:hover {
    color: inherit;
    text-decoration: underline
}

#mobile-centre_wrapper .record-close {
    float: right
}

#mobile-centre_wrapper .product-listing {
    border: 1px solid #ddd
}

#mobile-centre_wrapper .product-listing td {
    padding: 8px
}

@media (min-width: 768px) {
    #mobile-centre_wrapper .product-record {
        margin-left: 10px;
        margin-right: 10px;
        max-width: 47%
    }

    #mobile-centre_wrapper .product-record:target {
        max-width: 100%
    }

    #mobile-centre_wrapper .product-department, #mobile-centre_wrapper .product-links {
        margin-right: 10px;
        width: 30%
    }

    #mobile-centre_wrapper .product-longdescription {
        float: right;
        margin-left: 10px;
        width: 67%
    }
}

@media (min-width: 1200px) {
    #mobile-centre_wrapper .product-record {
        max-width: 31.5%
    }
}

.glyphicon-error {
    color: #96323a;
    font-size: 400%
}

.infostripe .btn-cnt {
    bottom: 5px;
    padding-right: 30px;
    position: absolute;
    text-align: center;
    width: 100%
}

.infostripe .col-md-6 {
    min-height: 830px !important;
    vertical-align: top
}

#anti_infographic_4.modal-dialog {
    width: 50%
}

.secondary .infostripe .h1 {
    font-size: 1.5em
}

.secondary .infostripe.dbl .h1 {
    min-height: 3.1em
}

.secondary .infostripe.trpl .h1 {
    min-height: 4em
}

[lang=fr] .infostripe .col-md-6 {
    min-height: 870px !important
}

.gc-prtts.dbl .h5 {
    min-height: 2.2em
}

.gc-dwnld .gc-dwnld-txt {
    text-decoration: underline
}

.gc-dwnld .gc-dwnld-txt:hover {
    text-decoration: none
}

.gc-dwnld .gc-dwnld-txt span {
    display: block
}

.whtwedo p {
    font-weight: 700;
    margin-bottom: 30px;
    margin-top: 15px
}

.whtwedo ul > li {
    margin-bottom: 10px
}

.lnkbx h2:nth-child(1) {
    margin-top: 0
}

.lnkbx p {
    font-weight: 700
}

.lnkbx > ul > li {
    margin-bottom: 10px
}

.gc-byline {
    font-weight: 700;
    margin-bottom: 30px
}

.gc-crprt ul:nth-child(1) {
    list-style: outside none none;
    margin: 0;
    padding: 0
}

.gc-crprt ul:nth-child(1) > li {
    margin-bottom: 10px
}

.gc-crprt h3 {
    margin-top: 0
}

.gc-crprt .col-md-8 .col-md-4 {
    margin-bottom: 15px
}

.gc-instttn p:nth-child(1), .gc-orgnztn p:nth-child(1) {
    font-weight: 700
}

.gc-instttn .gc-rms-lngth img, .gc-orgnztn .gc-rms-lngth img {
    margin-bottom: 30px
}

.gc-theme .profile {
    margin-bottom: 25px
}

.gc-cntct-lst dd, .gc-cntct-lst dt {
    border: 0
}

@media screen {
    body {
        background: #f9f9f9
    }

    .overlay-def .modal-header {
        background: #2e5274
    }

    .wb-sl {
        background: #335075;
        color: #fff;
        font-weight: 700
    }

    .wb-sl:focus {
        color: #fff;
        text-decoration: none
    }

    .prm-flpr {
        background-color: #eee;
        margin-top: 1px
    }

    .prm-flpr .wb-tabs.carousel-s2 [role=tablist] li.plypause {
        font-size: 1.3em
    }

    .prm-flpr .wb-tabs.carousel-s2 [role=tablist] li.plypause a {
        margin-top: .15em
    }

    .prm-flpr .wb-tabs.carousel-s2 figure figcaption {
        font-size: 1.3em
    }

    .prm-flpr .wb-tabs.carousel-s2 figure figcaption a {
        text-decoration: none
    }

    .prm-flpr .wb-tabs.carousel-s2 figure figcaption a:hover {
        text-decoration: underline
    }

    .wb-tabs.carousel-s2 [role=tablist] li.plypause a, .wb-tabs.carousel-s2 [role=tablist] li.tab-count .curr-count {
        font-size: 1.2em
    }

    .wb-tabs.carousel-s2 [role=tablist] li.nxt a .glyphicon, .wb-tabs.carousel-s2 [role=tablist] li.prv a .glyphicon {
        font-size: 1.65em
    }

    .gc-nttvs a:active h3, .gc-nttvs a:active img, .gc-nttvs a:focus h3, .gc-nttvs a:focus img {
        outline: thin dotted
    }

    .gc-nttvs h3 {
        float: left;
        text-decoration: underline
    }

    .gc-nttvs img {
        float: left;
        margin-right: 100%
    }

    .gc-nttvs p {
        clear: both
    }

    [dir=rtl] .gc-nttvs h3 {
        float: right
    }

    [dir=rtl] .gc-nttvs img {
        float: right;
        margin-left: 100%;
        margin-right: 0
    }
}

@media screen and (max-width: 767px) {
    header .brand a {
        margin-top: 15px
    }

    #wb-glb-mn {
        margin-top: 20px
    }

    #wb-glb-mn ul.chvrn li a {
        font-size: 1.7em
    }

    .pager {
        margin-bottom: 50px
    }

    .toc li {
        display: block;
        margin-bottom: 0
    }

    .toc li .list-group-item {
        border-bottom: 0;
        border-radius: 0;
        padding: 4px 10px
    }

    .toc li:last-child .list-group-item {
        border-bottom: 1px solid #ddd
    }
}

@media screen and (max-width: 991px) {
    main .h1, main h1 {
        font-size: 28px;
        margin-top: 15px
    }

    header .brand a {
        margin-top: 10px
    }

    .dshbrd details {
        display: block
    }

    .dshbrd details summary {
        background: #335075;
        color: #fff;
        font-size: 1em;
        margin-top: 5px;
        max-height: 999px;
        padding: 1em
    }

    .dshbrd details .cntnt {
        border: 1px solid #335075;
        padding: 15px
    }

    #wb-srch {
        width: 100%
    }

    #wb-srch .form-group {
        display: inline-block
    }

    #wb-srch .form-group.submit {
        float: right
    }

    [dir=rtl] #wb-srch .form-group.submit {
        float: left
    }

    #wb-info .ftr-urlt-lnk ul {
        -webkit-column-count: 2;
        -moz-column-count: 2;
        column-count: 2
    }

    #wb-info .ftr-urlt-lnk ul li {
        display: block;
        margin-bottom: .2em
    }

    #wb-info .ftr-urlt-lnk ul li:first-child:before {
        content: "\2022";
        margin-right: .7em
    }
}

@media screen and (max-width: 1199px) {
    #wb-sm .menu {
        border-right: 1px solid #999
    }

    #wb-sm .menu > li:last-child {
        border-right: 0
    }
}

@media screen and (min-width: 1200px) {
    .sect-lnks {
        margin-right: 15px;
        width: 31.7%
    }

    main.col-md-9 .sect-lnks {
        width: 31.2%
    }

    .lt-ie9 .sect-lnks, .lt-ie9 main.col-md-9 .sect-lnks {
        width: 30%
    }
}

@media screen and (max-width: 479px) {
    .gc-fld-srvy-container {
        padding-bottom: 100%
    }

    #wb-glb-mn, header .brand {
        float: none !important;
        width: auto !important
    }

    header .brand img, header .brand object {
        max-height: 25px
    }

    #wb-glb-mn ul {
        width: 100%
    }

    #wb-glb-mn ul.chvrn {
        margin-left: auto
    }

    #wb-glb-mn ul.chvrn:before {
        border: 0
    }

    #wb-info .ftr-urlt-lnk ul {
        -webkit-column-count: 1;
        -moz-column-count: 1;
        column-count: 1
    }

    #wb-info .ftr-urlt-lnk ul li {
        margin-bottom: .2em
    }

    #wb-info .brand img, #wb-info .brand object {
        height: 25px;
        margin-top: 15px;
        max-width: 100%;
        padding-right: 10px
    }

    #wb-info .tofpg {
        line-height: 60px
    }

    .prm-flpr .wb-tabs.carousel-s2 [role=tablist] li .plypause a {
        font-size: 1em;
        vertical-align: middle
    }

    .prm-flpr .wb-tabs.carousel-s2 [role=tablist] li .tab-count {
        height: 0;
        visibility: hidden;
        width: 0
    }

    .prm-flpr .wb-tabs.carousel-s2 [role=tablist] li .tab-count .curr-count {
        font-size: 1em
    }
}

@media screen and (min-width: 768px) and (max-width: 991px) {
    #wb-srch {
        margin-bottom: 15px
    }
}

@media screen and (min-width: 992px) and (max-width: 1199px) {
    .sect-lnks {
        margin-right: 15px;
        width: 48.1%
    }

    main.col-md-9 .sect-lnks {
        width: 47.5%
    }

    .lt-ie9 .sect-lnks {
        width: 47%
    }

    .lt-ie9 main.col-md-9 .sect-lnks {
        width: 46%
    }
}

@media print {
    #gc-sec, #wb-glb-mn, #wb-info, #wb-lng, #wb-sm, #wb-srch, .features, .followus, .pagedetails .btn, .tofpg {
        display: none !important
    }

    header .brand {
        margin-bottom: 0
    }

    h1 {
        margin-top: 0
    }

    .gc-nttvs {
        display: none
    }

    .jumbotron.pagebrand figcaption {
        position: static
    }
}
.fa {
  display: inline-block;
  font-family: FontAwesome;
  font-style: normal;
  font-weight: normal;
  line-height: 1;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
.fa-fw {
  width: 1.2857142857142858em;
  text-align: center;
}
.fa-lg {
  font-size: 1.3333333333333333em;
  line-height: 0.75em;
  vertical-align: -15%;
}
.fa-caret-right:before {
    content: "\f0da";
}
.fa-caret-down:before {
    content: "\f0d7";
}
span.mouseHover:hover {
	border: 1px solid black;
}

</style>
			</head>
            <body>
				<xsl:if test="count(TRANSACTION_ENROL) &gt; 0"> <xsl:apply-templates select="TRANSACTION_ENROL"></xsl:apply-templates> </xsl:if>
			</body>
		</html>
	</xsl:template>
	
	<!-- Transaction Enrolment -->
	<xsl:template match="TRANSACTION_ENROL">
		<h1>Regulatory Transaction Template: Regulatory Enrolment Process (REP)</h1>
					<div class="well well-sm" >
						<TABLE border="1" cellspacing="2" cellpadding="2" style="table-layout: fixed; width: 100%;word-wrap: break-word;">
							<TR>
								<TD style="text-align: center;font-weight:bold;"><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'COMPANY_ID'"/></xsl:call-template></TD>
								<TD style="text-align: center;font-weight:bold;"><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'DOSSIER_TYPE'"/></xsl:call-template></TD>
								<TD style="text-align: center;font-weight:bold;"><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'DossierID'"/></xsl:call-template></TD>
								<TD style="text-align: center;font-weight:bold;"><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'DateLastSaved'"/></xsl:call-template></TD>
							</TR>
							<TR>
								<TD style="text-align: center;"> <span class="mouseHover"><xsl:apply-templates select="ectd/company_id" /></span> </TD>
								<TD style="text-align: center;"> <span class="mouseHover"><xsl:call-template name="hp-label"><xsl:with-param name="code"><xsl:apply-templates select="ectd/dossier_type" /></xsl:with-param></xsl:call-template></span> </TD>
								<TD style="text-align: center;"> <span class="mouseHover"><xsl:apply-templates select="ectd/dossier_id" /></span> </TD>
								<TD style="text-align: center;"> <span class="mouseHover"><xsl:apply-templates select="date_saved" /></span> </TD>
							</TR>
						</TABLE>
					</div>
		<section>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h2 class="panel-title">Transaction Information</h2>
				</div>
				<div class="panel-body">										
					<div class="well well-sm" >
						<div class="row">
							<div class="col-xs-12">
								<label> <xsl:call-template name="hp-label"><xsl:with-param name="code" select="'PRODUCT_NAME'"/></xsl:call-template>&#160; </label>
								<span class="mouseHover">
									<xsl:value-of select="ectd/product_name"/>
								</span>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label> <xsl:call-template name="hp-label"><xsl:with-param name="code" select="'TRANSACTION_TYPE'"/></xsl:call-template>&#160; </label>
								<span class="mouseHover">
									<xsl:choose>
									<xsl:when test=" translate(./transaction_type, $smallcase, $uppercase) = 'NEW'">
										<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'NEW'"/></xsl:call-template>
										<div class="row">
											<div class="col-xs-12">
												<label> <xsl:call-template name="hp-label"><xsl:with-param name="code" select="'IS_THIRD_PARTY'"/></xsl:call-template>&#160; </label>
												<span class="mouseHover"><xsl:call-template name="YesNoUnknow"><xsl:with-param name="value" select="is_third_party"/></xsl:call-template>
												</span>
											</div>
											<xsl:if test="is_third_party = 'Y'">
											<div class="col-xs-11 alert alert-info">
												<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'IS_THIRD_PARTY_INFO'"/></xsl:call-template>
											</div>
											</xsl:if>
										</div>
										<div class="row">
											<div class="col-xs-12">
												<label> <xsl:call-template name="hp-label"><xsl:with-param name="code" select="'IS_PRIORITY'"/></xsl:call-template>&#160; </label>
												<span class="mouseHover"><xsl:call-template name="YesNoUnknow"><xsl:with-param name="value" select="is_priority"/></xsl:call-template>
												</span>
											</div>
										</div>
										<div class="row">
											<div class="col-xs-12">
												<label> <xsl:call-template name="hp-label"><xsl:with-param name="code" select="'IS_NOC'"/></xsl:call-template>&#160; </label>
												<span class="mouseHover"><xsl:call-template name="YesNoUnknow"><xsl:with-param name="value" select="is_noc"/></xsl:call-template>
												</span>
											</div>
										</div>
										<div class="row">
											<div class="col-xs-12">
												<label> <xsl:call-template name="hp-label"><xsl:with-param name="code" select="'IS_ADMIN_SUB'"/></xsl:call-template>&#160; </label>
												<span class="mouseHover"><xsl:call-template name="YesNoUnknow"><xsl:with-param name="value" select="is_admin_sub"/></xsl:call-template>
												</span>
											</div>
										</div>
										<xsl:if test="is_admin_sub = 'Y'">
										<div class="row">
											<div class="col-xs-12">
												<label> <xsl:call-template name="hp-label"><xsl:with-param name="code" select="'ADMIN_SUB_TYPE'"/></xsl:call-template>&#160; </label>
												<span class="mouseHover">
													<xsl:choose>
														<xsl:when test="$language = 'eng'"><xsl:value-of select="sub_type/en"/></xsl:when>
														<xsl:otherwise><xsl:value-of select="sub_type/fr"/></xsl:otherwise>
													</xsl:choose>
												</span>
											</div>
										</div>
										<div class="row">
											<div class="col-xs-12">
												<label> <xsl:call-template name="hp-label"><xsl:with-param name="code" select="'ADMIN_SUB_TYPE_DESC'"/></xsl:call-template>&#160; </label>
												<ul><li><span class="mouseHover"><xsl:call-template name="hp-label"><xsl:with-param name="code"><xsl:value-of select="concat(sub_type/id,'_li')"/></xsl:with-param></xsl:call-template></span></li></ul>
											</div>
										</div>
										<div class="row alert alert-info col-xs-12">
											<span class="mouseHover"><xsl:call-template name="hp-label"><xsl:with-param name="code"><xsl:value-of select="concat(sub_type/id, '_note')" disable-output-escaping="yes"/></xsl:with-param></xsl:call-template>
											</span>
										</div>
										</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="hp-label">
											<xsl:with-param name="code" select="'EXSITING'"/>
										</xsl:call-template>
									</xsl:otherwise>
									</xsl:choose>
								</span>
							</div>
						</div>
					</div>

					<div class="well well-sm" >
							<div class="row">
								<header class="panel-heading" >
									<h4 class="panel-title" ><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'LIFECYCLE_TITLE'"/></xsl:call-template></h4>
								</header>								
								
								<div class="panel-body" >
									<table border="1" cellspacing="2" cellpadding="2" style="table-layout: fixed; width: 100%;word-wrap: break-word;">
										<tr>
<!--											<td style="width:2%"></td>-->
											<td style="text-align: center;" width="10%"> <label> <xsl:call-template name="hp-label"><xsl:with-param name="code" select="'SEQUENCE_NUM'"/></xsl:call-template> </label> </td>
											<td style="text-align: center;" width="10%"> <label> <xsl:call-template name="hp-label"><xsl:with-param name="code" select="'DATE_SUBMITTED'"/></xsl:call-template> </label> </td>
											<td style="text-align: center;" width="10%"> <label> <xsl:call-template name="hp-label"><xsl:with-param name="code" select="'CONTROL_NUM'"/></xsl:call-template> </label> </td>
											<td style="text-align: center;" width="30%"> <label> <xsl:call-template name="hp-label"><xsl:with-param name="code" select="'REG_ACTIVITY'"/></xsl:call-template> </label> </td>
											<td style="text-align: center;" width="40%"> <label> <xsl:call-template name="hp-label"><xsl:with-param name="code" select="'SEQUENCE_DESCRIPT'"/></xsl:call-template> </label> </td>
										</tr>
										
										<xsl:for-each select="ectd/lifecycle_record">
											<tr>
<!--											<td class="fa fa-caret-right fa-lg fa-fw"></td>-->
											<td style="text-align: center;"><span class="mouseHover"> <xsl:apply-templates select="sequence_number" /></span> </td>
											<td style="text-align: center;"><span class="mouseHover"> <xsl:apply-templates select="date_submitted" /></span> </td>
											<td ><span class="mouseHover"> <xsl:apply-templates select="control_number" /></span> </td>
											<td> <span class="mouseHover">
												<xsl:call-template name="hp-label">
													<xsl:with-param name="code" select="sequence_activity_type"/>
													
												</xsl:call-template></span>
											</td>
											<td><span class="mouseHover"><xsl:apply-templates select="sequence_concat" /></span> </td>
											</tr>
											<tr>
												<td colspan="6"> 
													<fieldset>
														<legend><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'LIFECYCLE_RECORD'"/></xsl:call-template></legend>
														<div class="row">
															<div class="form-group col-md-4">
															<label><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'SEQUENCE_NUM'"/></xsl:call-template>:&#160;<span style="font-weight: normal;" class="mouseHover"><xsl:value-of select="sequence_number"/></span></label>
															</div>
															<div class="form-group col-md-4">
															<label><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'DATE_SUBMITTED'"/></xsl:call-template>:&#160;<span style="font-weight: normal;" class="mouseHover"><xsl:value-of select="./date_filed"/></span></label>
															</div>
															<div class="form-group col-md-4">
															<label><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'CONTROL_NUM'"/></xsl:call-template>:&#160;<span style="font-weight: normal;" class="mouseHover"><xsl:value-of select="control_number"/></span></label>
															</div>
														</div>
														<div class="row">
															<div class="form-group col-md-12">
															<label><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'REG_ACTIVITY_LEAD'"/></xsl:call-template>:&#160;<span style="font-weight: normal;" class="mouseHover"><xsl:call-template name="hp-label"><xsl:with-param name="code"><xsl:value-of select="./sequence_activity_lead"/></xsl:with-param></xsl:call-template></span></label>
															</div>
														</div>
														<div class="row">
															<div class="form-group col-md-6">
															<label><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'ACTIVITY_TYPE'"/></xsl:call-template>:&#160;<span style="font-weight: normal;" class="mouseHover"><xsl:call-template name="hp-label"><xsl:with-param name="code"><xsl:value-of select="./sequence_activity_type"/></xsl:with-param></xsl:call-template></span></label>
															</div>
															<div class="form-group col-md-6">
															<label><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'REG_TRANSACTION_DESC'"/></xsl:call-template>:&#160;<span style="font-weight: normal;" class="mouseHover"><xsl:call-template name="hp-label"><xsl:with-param name="code"><xsl:value-of select="./sequence_description_value"/></xsl:with-param></xsl:call-template></span></label>
															</div>
														</div>
														<div class="row">
															<xsl:choose>
															<xsl:when test="./sequence_description_value = 'UNSOLICITED_DATA'">
															<div class="form-group col-md-12">
																<label><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'BRIEF_DESC'"/></xsl:call-template>:&#160;</label>
																<span style="font-weight: normal;" class="mouseHover"><xsl:value-of select="./sequence_details"/></span>
															</div>
															</xsl:when>
															<xsl:otherwise>
															<div class="form-group col-md-6">
																<xsl:if test="./sequence_from_date != ''">
																	<xsl:choose>
																	<xsl:when test="./sequence_to_date = ''">
																		<label><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'DATED'"/></xsl:call-template>:&#160;<span style="font-weight: normal;" class="mouseHover"><xsl:value-of select="./sequence_from_date"/></span></label>
																	</xsl:when>
																	<xsl:otherwise>
																		<label><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'START_DATE'"/></xsl:call-template>:&#160;<span style="font-weight: normal;" class="mouseHover"><xsl:value-of select="./sequence_from_date"/></span></label>
																	</xsl:otherwise>
																	</xsl:choose>
																</xsl:if>
																<xsl:if test="./sequence_year != ''">
																	<label><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'YEAR_OF_CHANGE'"/></xsl:call-template>:&#160;<span style="font-weight: normal;" class="mouseHover"><xsl:value-of select="./sequence_year"/></span></label>
																</xsl:if>
															</div>
															<div class="form-group col-md-6">
																<xsl:if test="./sequence_to_date != ''">
																	<label><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'END_DATE'"/></xsl:call-template>:&#160;<span style="font-weight: normal;" class="mouseHover"><xsl:value-of select="./sequence_to_date"/></span></label>
																</xsl:if>
																<xsl:if test="./sequence_version != ''">
																	<label><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'VERSION_NO'"/></xsl:call-template>:&#160;<span style="font-weight: normal;" class="mouseHover"><xsl:value-of select="./sequence_version"/></span></label>
																</xsl:if>
															</div>
															</xsl:otherwise>
															</xsl:choose>
															<xsl:if test="./sequence_year != ''">
															<div class="form-group col-md-12">
																<label><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'LIST_DESC'"/></xsl:call-template>:&#160;</label>
																<span style="font-weight: normal;" class="mouseHover"><xsl:value-of select="./sequence_details"/></span>
															</div>
															</xsl:if>
														</div>
													</fieldset>
												</td>
											</tr>
										</xsl:for-each>
									</table>
								</div>
							</div>
						</div>
						

					<div class="well well-sm" >
						<div class="row">
							<div class="col-xs-12">
								<label> <xsl:call-template name="hp-label"><xsl:with-param name="code" select="'IS_SOLICITED'"/></xsl:call-template>&#160; </label>
								<span class="mouseHover"><xsl:call-template name="YesNoUnknow"><xsl:with-param name="value" select="is_solicited"/></xsl:call-template>
								</span>
							</div>
						</div>
						<xsl:if test="is_solicited = 'Y'">
							<div class="row">
								<div class="col-xs-12">
									<label> <xsl:call-template name="hp-label"><xsl:with-param name="code" select="'SOLICITED_RQ'"/></xsl:call-template>:&#160; </label>
									<span class="mouseHover"> <xsl:apply-templates select="solicited_requester" /> </span>
									<ol>
										<xsl:for-each select="solicited_requester_record">
											<li><span class="mouseHover"><xsl:value-of select="./solicited_requester"/></span></li>
										</xsl:for-each>
									</ol>
								</div>
							</div>
						</xsl:if>
					</div>
					
					<h4><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'PROJ_MANAGER_NAME'"/></xsl:call-template>: </h4>
					
					<div class="well well-sm" >
						<div class="row">
							<div class="col-xs-12">
								<span class="mouseHover"> <xsl:apply-templates select="regulatory_project_manager1" /> </span>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<span class="mouseHover"> <xsl:apply-templates select="regulatory_project_manager2" /> </span>
							</div>
						</div>
					</div>
					<div class="well well-sm" >
						<div class="row">
							<div class="col-xs-12">
								<label> <xsl:call-template name="hp-label"><xsl:with-param name="code" select="'IS_FEE_TRANSACTION'"/></xsl:call-template>&#160; </label>
								<span class="mouseHover"><xsl:call-template name="YesNoUnknow"><xsl:with-param name="value" select="is_fees"/></xsl:call-template>
								</span>
							</div>
						</div>
					</div>

				</div>		
			</div>
			<xsl:if test="is_fees = 'Y'">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h2 class="panel-title"><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'FEE_AMOUNT'"/></xsl:call-template></h2>
				</div>
				<div class="panel-body">
					<div class="well well-sm" >
						<div class="row">
							<div class="col-xs-12">
								<label> <xsl:call-template name="hp-label"><xsl:with-param name="code" select="'SUB_CLASS'"/></xsl:call-template>:&#160; </label>
								<span class="mouseHover">
								<xsl:choose>
								<xsl:when test="$language = 'fra'">
									<xsl:value-of select="fee_details/submission_class/fr"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="fee_details/submission_class/en"/>
								</xsl:otherwise>
								</xsl:choose>
								</span>
								<label>&#160;&#160;<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'FEE_AMOUNT'"/></xsl:call-template>:&#160;</label>
								<span class="mouseHover">$<xsl:value-of select="fee_details/submission_class/fee"/></span>
							</div>
							<div class="col-xs-12">
								<label><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'FEE_DESCRIPTION'"/></xsl:call-template>:&#160;</label>
								<span class="mouseHover">
								<xsl:choose>
								<xsl:when test="$language = 'fra'">
									<xsl:value-of select="fee_details/submission_class/description_fr"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="fee_details/submission_class/description_en"/>
								</xsl:otherwise>
								</xsl:choose>
								</span>
							</div>
						</div>
					</div>
					<div class="well well-sm" >
						<div class="row">
							<div class="col-xs-12">
								<label><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'DEFER_FEES'"/></xsl:call-template>?&#160; </label>
								<span class="mouseHover"><xsl:call-template name="YesNoUnknow"><xsl:with-param name="value" select="fee_details/deferral_request"/></xsl:call-template>
								</span>
							</div>
							<div class="col-xs-12">
								<label><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'FEE_REMISSION'"/></xsl:call-template>?&#160; </label>
								<span class="mouseHover"><xsl:call-template name="YesNoUnknow"><xsl:with-param name="value" select="fee_details/fee_remission"/></xsl:call-template>
								</span>
							</div>
							<xsl:if test="fee_details/fee_remission = 'Y'">
							<div class="col-xs-12">
								<label><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'GROSS_REVENUE'"/></xsl:call-template>:&#160; </label>
								<span class="mouseHover">$<xsl:value-of select="fee_details/gross_revenue"/></span>
								<label> &#160;&#160;<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'TEN_PERCENT_REVENUE'"/></xsl:call-template>:&#160; </label>
								<span class="mouseHover">$<xsl:value-of select="fee_details/percent_gross"/></span>
							</div>
							<div class="col-xs-12 alert alert-success">
								<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'NOTE_1'"/></xsl:call-template>
							</div>
							</xsl:if>
						</div>
					</div>
					<xsl:if test="fee_details/deferral_request = 'Y' or fee_details/fee_remission = 'Y'">
					<h4><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'REQUIRED_DOC'"/></xsl:call-template></h4>
					<div class="well well-sm" >
						<xsl:if test="fee_details/deferral_request = 'Y'">
						<div class="row">
							<div class="col-xs-12">
					            <xsl:element name="input">
                                    <xsl:attribute name="type">checkbox</xsl:attribute>
                                    <xsl:if test=" fee_details/required_docs/deferral_statement = 'Y'">
                                        <xsl:attribute name="checked"></xsl:attribute>
                                    </xsl:if>
                                    <xsl:attribute name="disabled">disabled</xsl:attribute>
									<xsl:attribute name="style">float:left;width:25px;</xsl:attribute>
                                </xsl:element>
								<span style="display:block;float:left;width:95%;" class="mouseHover">
									<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'DEFER_STATEMENT'"/></xsl:call-template>
								</span>
							</div>
						</div>
						</xsl:if>
						<xsl:if test="fee_details/fee_remission = 'Y' and fee_details/submission_class/fee &gt; fee_details/percent_gross">
						<div class="row">
							<div class="col-xs-12">
								<label><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'NOTE_2'"/></xsl:call-template></label>
							</div>
							<div class="col-xs-12">
					            <xsl:element name="input">
                                    <xsl:attribute name="type">checkbox</xsl:attribute>
                                    <xsl:if test=" fee_details/required_docs/remission_certified = 'Y'">
                                        <xsl:attribute name="checked"></xsl:attribute>
                                    </xsl:if>
                                    <xsl:attribute name="disabled">disabled</xsl:attribute>
									<xsl:attribute name="style">float:left;width:25px;</xsl:attribute>
                                </xsl:element>
								<span style="display:block;float:left;width:95%;" class="mouseHover">
									<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'STATEMENT_REVENUE'"/></xsl:call-template>
								</span>
							</div>
							<div class="col-xs-12">
					            <xsl:element name="input">
                                    <xsl:attribute name="type">checkbox</xsl:attribute>
                                    <xsl:if test=" fee_details/required_docs/est_market_share = 'Y'">
                                        <xsl:attribute name="checked"></xsl:attribute>
                                    </xsl:if>
                                    <xsl:attribute name="disabled">disabled</xsl:attribute>
									<xsl:attribute name="style">width:25px;</xsl:attribute>
                                </xsl:element>
								<span class="mouseHover">
									<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'EST_MARKET_SHARE'"/></xsl:call-template>
								</span>
							</div>
							<div class="col-xs-12">
					            <xsl:element name="input">
                                    <xsl:attribute name="type">checkbox</xsl:attribute>
                                    <xsl:if test=" fee_details/required_docs/comparison_products = 'Y'">
                                        <xsl:attribute name="checked"></xsl:attribute>
                                    </xsl:if>
                                    <xsl:attribute name="disabled">disabled</xsl:attribute>
									<xsl:attribute name="style">width:25px;</xsl:attribute>
                                </xsl:element>
								<span class="mouseHover">
									<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'SIMILAR_PRODUCT'"/></xsl:call-template>
								</span>
							</div>
							<div class="col-xs-12">
					            <xsl:element name="input">
                                    <xsl:attribute name="type">checkbox</xsl:attribute>
                                    <xsl:if test=" fee_details/required_docs/sales_history = 'Y'">
                                        <xsl:attribute name="checked"></xsl:attribute>
                                    </xsl:if>
                                    <xsl:attribute name="disabled">disabled</xsl:attribute>
									<xsl:attribute name="style">width:25px;</xsl:attribute>
                                </xsl:element>
								<span class="mouseHover">
									<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'SALES_HISTORY'"/></xsl:call-template>
								</span>
					            &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<xsl:element name="input">
                                    <xsl:attribute name="type">checkbox</xsl:attribute>
                                    <xsl:if test=" fee_details/required_docs/market_plan = 'Y'">
                                        <xsl:attribute name="checked"></xsl:attribute>
                                    </xsl:if>
                                    <xsl:attribute name="disabled">disabled</xsl:attribute>
                                </xsl:element>&#160;
								<span class="mouseHover">
									<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'MARKETING_PLAN'"/></xsl:call-template>
								</span>
							</div>
							<div class="col-xs-12">
					            <xsl:element name="input">
                                    <xsl:attribute name="type">checkbox</xsl:attribute>
                                    <xsl:if test=" fee_details/required_docs/avg_sale_price = 'Y'">
                                        <xsl:attribute name="checked"></xsl:attribute>
                                    </xsl:if>
                                    <xsl:attribute name="disabled">disabled</xsl:attribute>
									<xsl:attribute name="style">width:25px;</xsl:attribute>
                                </xsl:element>
								<span class="mouseHover">
									<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'AVG_SALES'"/></xsl:call-template>
								</span>
					            &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<xsl:element name="input">
                                    <xsl:attribute name="type">checkbox</xsl:attribute>
                                    <xsl:if test=" fee_details/required_docs/other = 'Y'">
                                        <xsl:attribute name="checked"></xsl:attribute>
                                    </xsl:if>
                                    <xsl:attribute name="disabled">disabled</xsl:attribute>
                                </xsl:element>&#160;
								<span class="mouseHover">
									<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'OTHER'"/></xsl:call-template>
								</span>
							</div>
							<xsl:if test="fee_details/required_docs/other = 'Y'">
							<div class="col-xs-12">
								<label>&#160;&#160;&#160;&#160;&#160;<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'OTHER'"/></xsl:call-template>:&#160;</label>
								<span class="mouseHover"><xsl:value-of select="fee_details/required_docs/other_details"/></span>
							</div>
							</xsl:if>
						</div>
						</xsl:if>
					</div>
					</xsl:if>

					<h3><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'PAYMENT'"/></xsl:call-template></h3>
					<div class="well well-sm" >
						<div class="row">
							<div class="col-xs-12 form-group alert alert-info">
							<xsl:choose>
							<xsl:when test="fee_details/fee_remission = 'N' and fee_details/deferral_request = 'N' and fee_details/submission_class/fee &gt; 10000">
								<p><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'NOTE_6'"/></xsl:call-template></p>
							</xsl:when>
							<xsl:when test="fee_details/fee_remission = 'N' and fee_details/deferral_request = 'Y' and fee_details/submission_class/fee &lt; 10000">
								<p><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'NOTE_4'"/></xsl:call-template></p>
							</xsl:when>
							<xsl:otherwise>
								<p><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'NOTE_3'"/></xsl:call-template></p>
							</xsl:otherwise>
							</xsl:choose>
							</div>
							<xsl:if test="fee_details/submission_class/fee &lt; 10000 and (fee_details/deferral_request = 'N' or fee_details/fee_remission = 'Y')">
							<div class="col-xs-12">
								<h4><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'PAYMENT_METHODS'"/></xsl:call-template></h4>
							</div>
							<div class="col-xs-12">
					            <label><xsl:element name="input">
                                    <xsl:attribute name="type">checkbox</xsl:attribute>
                                    <xsl:if test=" fee_details/payment_method/bill_payment = 'Y'">
                                        <xsl:attribute name="checked"></xsl:attribute>
                                    </xsl:if>
                                    <xsl:attribute name="disabled">disabled</xsl:attribute>
									<xsl:attribute name="style">float:left;width:25px;</xsl:attribute>
                                </xsl:element>
								<span style="font-weight:normal;" class="mouseHover">
									<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'PREFEERED_OPTION'"/></xsl:call-template>
								</span>&#160;&#160;</label>
					            <label><xsl:element name="input">
                                    <xsl:attribute name="type">checkbox</xsl:attribute>
                                    <xsl:if test=" fee_details/payment_method/existing_credit = 'Y'">
                                        <xsl:attribute name="checked"></xsl:attribute>
                                    </xsl:if>
                                    <xsl:attribute name="disabled">disabled</xsl:attribute>
									<xsl:attribute name="style">float:left;width:25px;</xsl:attribute>
                                </xsl:element>
								<span style="font-weight:normal;" class="mouseHover">
									<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'EXISTING_CREDIT'"/></xsl:call-template>
								</span>&#160;&#160;</label>
					            <label><xsl:element name="input">
                                    <xsl:attribute name="type">checkbox</xsl:attribute>
                                    <xsl:if test=" fee_details/payment_method/bank_wire = 'Y'">
                                        <xsl:attribute name="checked"></xsl:attribute>
                                    </xsl:if>
                                    <xsl:attribute name="disabled">disabled</xsl:attribute>
									<xsl:attribute name="style">float:left;width:25px;</xsl:attribute>
                                </xsl:element>
								<span style="font-weight:normal;" class="mouseHover">
									<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'BANK_WIRE'"/></xsl:call-template>
								</span></label>
							</div>
							<div class="col-xs-12">
					            <label><xsl:element name="input">
                                    <xsl:attribute name="type">checkbox</xsl:attribute>
                                    <xsl:if test=" fee_details/payment_method/credit_card = 'Y'">
                                        <xsl:attribute name="checked"></xsl:attribute>
                                    </xsl:if>
                                    <xsl:attribute name="disabled">disabled</xsl:attribute>
									<xsl:attribute name="style">float:left;width:25px;</xsl:attribute>
                                </xsl:element>
								<span style="font-weight:normal;" class="mouseHover">
									<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'CREDIT'"/></xsl:call-template>
								</span>&#160;&#160;</label>
					            <label><xsl:element name="input">
                                    <xsl:attribute name="type">checkbox</xsl:attribute>
                                    <xsl:if test=" fee_details/payment_method/cheque = 'Y'">
                                        <xsl:attribute name="checked"></xsl:attribute>
                                    </xsl:if>
                                    <xsl:attribute name="disabled">disabled</xsl:attribute>
									<xsl:attribute name="style">float:left;width:25px;</xsl:attribute>
                                </xsl:element>
								<span style="font-weight:normal;" class="mouseHover">
									<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'CHEQUE'"/></xsl:call-template>
								</span>&#160;&#160;</label>
					            <label><xsl:element name="input">
                                    <xsl:attribute name="type">checkbox</xsl:attribute>
                                    <xsl:if test=" fee_details/payment_method/money_order = 'Y'">
                                        <xsl:attribute name="checked"></xsl:attribute>
                                    </xsl:if>
                                    <xsl:attribute name="disabled">disabled</xsl:attribute>
									<xsl:attribute name="style">float:left;width:25px;</xsl:attribute>
                                </xsl:element>
								<span style="font-weight:normal;" class="mouseHover">
									<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'MONEY_ORDER'"/></xsl:call-template>
								</span>&#160;&#160;</label>
					            <label><xsl:element name="input">
                                    <xsl:attribute name="type">checkbox</xsl:attribute>
                                    <xsl:if test=" fee_details/payment_method/bank_draft = 'Y'">
                                        <xsl:attribute name="checked"></xsl:attribute>
                                    </xsl:if>
                                    <xsl:attribute name="disabled">disabled</xsl:attribute>
									<xsl:attribute name="style">float:left;width:25px;</xsl:attribute>
                                </xsl:element>
								<span style="font-weight:normal;" class="mouseHover">
									<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'BANK_DRAFT'"/></xsl:call-template>
								</span></label>
							</div>
							</xsl:if>
						</div>
					</div>

				</div>
			</div>
			</xsl:if>
			
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h2 class="panel-title"><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'REG_ACT_CONTACT'"/></xsl:call-template></h2>
				</div>
				<div class="panel-body">
					<h4><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'REG_CONTACT_THIS'"/></xsl:call-template></h4>
					<label><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'COMPANY_INFO'"/></xsl:call-template>: </label>
					<div class="well well-sm" >
						<div class="row">
							<div class="col-xs-12">
								<label><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'COMPANY_NOABBREV'"/></xsl:call-template></label>
							</div>
							<div class="col-xs-12">
								<span class="mouseHover"><xsl:apply-templates select="company_name" /> </span>
							</div>
						</div>
					</div>
					<label><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'ADDRESS_INFO'"/></xsl:call-template>: </label>
					<div class="well well-sm" >
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-2"><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'STREET_SUITE'"/></xsl:call-template></label>
								<span class="mouseHover"> <xsl:apply-templates select="regulatory_activity_address/street_address" /> </span>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-2"><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'CITY_TOWN'"/></xsl:call-template> </label>
								<span class="mouseHover"> <xsl:apply-templates select="regulatory_activity_address/city" /> </span>
								<label> &#160;&#160;<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'PROVINCE'"/></xsl:call-template>&#160;&#160; </label>
								<span class="mouseHover"> <xsl:choose><xsl:when test="(regulatory_activity_address/country = 'CAN') or (regulatory_activity_address/country = 'USA')"><xsl:call-template name="hp-label"><xsl:with-param name="code" select="regulatory_activity_address/province_lov" /></xsl:call-template></xsl:when><xsl:otherwise><xsl:apply-templates select="regulatory_activity_address/province_text" /></xsl:otherwise></xsl:choose> </span>
								<label> &#160;&#160;<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'COUNTRY'"/></xsl:call-template>&#160;&#160; </label>
								<span class="mouseHover"> 
								<xsl:choose>
								<xsl:when test="$language = 'fra'">
									<xsl:value-of select="regulatory_activity_address/country/@label_fr"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="regulatory_activity_address/country/@label_en"/>
								</xsl:otherwise>
								</xsl:choose>
								</span>
							</div>
							<div class="col-xs-12">
								<label class="col-xs-2"><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'POSTAL_ZIP'"/></xsl:call-template> </label>
								<span class="mouseHover"> <xsl:apply-templates select="regulatory_activity_address/postal_code" /> </span>
							</div>
						</div>
					</div>
					<h4><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'COMPANY_REP_THIS'"/></xsl:call-template>: </h4>
					<div class="well well-sm" >
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-3"><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'SALUTATION'"/></xsl:call-template>&#160;&#160;
								<span class="mouseHover" style="font-weight:normal;"> <xsl:call-template name="hp-label"><xsl:with-param name="code" select="regulatory_activity_contact/salutation" /></xsl:call-template> </span></label>
								<label class="col-xs-3"> &#160;&#160;<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'JOBTITLE'"/></xsl:call-template>&#160;&#160; 
								<span class="mouseHover" style="font-weight:normal;"> <xsl:apply-templates select="regulatory_activity_contact/job_title" /> </span></label>
								<label class="col-xs-3"> &#160;&#160;<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'LANGCORRESPOND'"/></xsl:call-template>&#160;&#160; 
								<span class="mouseHover" style="font-weight:normal;"><xsl:call-template name="hp-label"><xsl:with-param name="code" select="regulatory_activity_contact/language_correspondance"/></xsl:call-template></span></label>
							</div>
							<div class="col-xs-12">
								<label class="col-xs-3"><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'FIRSTNAME'"/></xsl:call-template>&#160;&#160;
								<span class="mouseHover" style="font-weight:normal;"> <xsl:apply-templates select="regulatory_activity_contact/given_name" /> </span> </label>
								<label class="col-xs-3"> &#160;&#160;<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'INITIALS'"/></xsl:call-template>&#160;&#160;
								<span class="mouseHover" style="font-weight:normal;"> <xsl:apply-templates select="regulatory_activity_contact/initials" /> </span> </label>
								<label class="col-xs-3"> &#160;&#160;<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'LASTNAME'"/></xsl:call-template>&#160;&#160;
								<span class="mouseHover" style="font-weight:normal;"> <xsl:apply-templates select="regulatory_activity_contact/surname" /> </span> </label>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<label class="col-xs-6"><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'PHONENUMBER'"/></xsl:call-template>&#160;&#160;
								<span class="mouseHover" style="font-weight:normal;"> <xsl:apply-templates select="regulatory_activity_contact/phone_num" /> </span>&#160;&#160;
								<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'EXTENSION'"/></xsl:call-template> &#160;&#160;
								<span class="mouseHover" style="font-weight:normal;"> <xsl:apply-templates select="regulatory_activity_contact/phone_ext" /> </span> </label>
								<label class="col-xs-3">&#160;&#160;<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'FAX_NUMBER'"/></xsl:call-template>&#160;&#160; 
								<span class="mouseHover" style="font-weight:normal;"> <xsl:apply-templates select="regulatory_activity_contact/fax_num" /> </span></label>
							</div>
							<div class="col-xs-12">
								<label class="col-xs-2"><xsl:call-template name="hp-label"><xsl:with-param name="code" select="'CONTACTEMAIL'"/></xsl:call-template>&#160;&#160;
								<span class="mouseHover" style="font-weight:normal;"> <xsl:apply-templates select="regulatory_activity_contact/email" /> </span></label>
							</div>
						</div>
					</div>
					<div class="well well-sm" >
						<div class="row">
							<div class="col-xs-12">
								<label><xsl:element name="input">
                                    <xsl:attribute name="type">checkbox</xsl:attribute>
                                    <xsl:if test=" confirm_regulatory_contact = 'Y'">
                                        <xsl:attribute name="checked"></xsl:attribute>
                                    </xsl:if>
                                    <xsl:attribute name="disabled">disabled</xsl:attribute>
									<xsl:attribute name="style">float:left;width:25px;</xsl:attribute>
                                </xsl:element>
								<span class="mouseHover">
									<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'CONFIRM_REGULATORY'"/></xsl:call-template>
								</span></label>
							</div>
						</div>
					</div>
					
				</div>		
			</div>
		</section>
	</xsl:template>
	<xsl:template name="hp-label">
		<xsl:param name="code" select="/.."/>
		<xsl:variable name="value" select="$labelLookup/SimpleCodeList/row[code=$code]/*[name()=$language]"/>
		<xsl:if test="$value">
			<xsl:for-each select="$labelLookup/SimpleCodeList/row[code=$code]/*[name()=$language]"><xsl:if test="position() > 1"><xsl:text disable-output-escaping="yes">&lt;br/&gt;</xsl:text></xsl:if><xsl:value-of select="."/></xsl:for-each>
		</xsl:if>
		<xsl:if test="not($value)">Error: code missing:(<xsl:value-of select="$code"/> in <xsl:value-of select="$labelFile"/>)</xsl:if>
	</xsl:template>
	<xsl:template name="YesNoUnknow">
		<xsl:param name="value" select="/.."/>
		<xsl:choose>
		<xsl:when test="$value = 'Y'">
			<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'Yes'"/></xsl:call-template>
		</xsl:when>
		<xsl:when test="$value = 'N'">
			<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'No'"/></xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="hp-label"><xsl:with-param name="code" select="'UNKNOWN'"/></xsl:call-template>
		</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:transform><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="yes" url="file:///e:/ip400Demo/tmp/hcreprt-2018-08-22-1125.xml" htmlbaseurl="" outputurl="..\..\..\..\..\..\..\..\SPM\test\transaction.html" processortype="saxon8"
		          useresolver="yes" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath=""
		          postprocessgeneratedext="" validateoutput="no" validator="internal" customvalidator="">
			<parameterValue name="labelFile" value="'file:///C:/Users/hcuser/git/HC-IMSD/REP/xslt/hp-ip400-labels.xml'"/>
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="schemaCache" value="||"/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bSchemaAware" value="true"/>
			<advancedProp name="bGenerateByteCode" value="true"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="xsltVersion" value="2.0"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->