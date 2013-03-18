/**
 * Created with IntelliJ IDEA.
 * User: ineilsen
 * Date: 2/27/13
 * Time: 1:16 PM
 * To change this template use File | Settings | File Templates.
 */

//
// oooldddshowdown.js -- A javascript port of Markdown.
//
// Copyright (c) 2007 John Fraser.
//
// Original Markdown Copyright (c) 2004-2005 John Gruber
// <http://daringfireball.net/projects/markdown/>
//
// Redistributable under a BSD-style open source license.
// See license.txt for more information.
//
// The full source distribution is at:
//
// A A L
// T C A
// T K B
//
// <http://www.attacklab.net/>
//
//
// Wherever possible, Showdown is a straight, line-by-line port
// of the Perl version of Markdown.
//
// This is not a normal parser design; it's basically just a
// series of string substitutions. It's hard to read and
// maintain this way, but keeping Showdown close to the original
// design makes it easier to port new features.
//
// More importantly, Showdown behaves like markdown.pl in most
// edge cases. So web applications can do client-side preview
// in Javascript, and then build identical HTML on the server.
//
// This port needs the new RegExp functionality of ECMA 262,
// 3rd Edition (i.e. Javascript 1.5). Most modern web browsers
// should do fine. Even with the new regular expression features,
// We do a lot of work to emulate Perl's regex functionality.
// The tricky changes in this file mostly have the "attacklab:"
// label. Major or self-explanatory changes don't.
//
// Smart diff tools like Araxis Merge will be able to match up
// this file with markdown.pl in a useful way. A little tweaking
// helps: in a copy of markdown.pl, replace "#" with "//" and
// replace "$text" with "text". Be sure to ignore whitespace
// and line endings.
//
//
// Showdown usage:
//
// var text = "Markdown *rocks*.";
//
// var converter = new Showdown.converter();
// var html = converter.makeHtml(text);
//
// alert(html);
//
// Note: move the sample code to the bottom of this
// file before uncommenting it.
//
//
// Showdown namespace
//
var Showdown = {};


