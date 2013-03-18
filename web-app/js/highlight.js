/**
 * Created with IntelliJ IDEA.
 * User: ineilsen
 * Date: 2/27/13
 * Time: 1:16 PM
 * To change this template use File | Settings | File Templates.
 */

/*
 Syntax highlighting with language autodetection.
 URL: http://softwaremaniacs.org/soft/highlight/
 Author: Ivan Sagalaev <Maniac@SoftwareManiacs.Org>
 Contributors:
 - Peter Leonov <gojpeg@gmail.com>
 - Victor Karamzin <Victor.Karamzin@enterra-inc.com>
 - Vsevolod Solovyov <vsevolod.solovyov@gmail.com>
 - Anton Kovalyov <anton@kovalyov.net>
 - Nikita Ledyaev <lenikita@yandex.ru>
 License (BSD):
 * Copyright (c) 2006, Ivan Sagalaev
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * * Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 * * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * * Neither the name of the University of California, Berkeley nor the
 * names of its contributors may be used to endorse or promote products
 * derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE REGENTS AND CONTRIBUTORS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
var IDENT_RE = '[a-zA-Z][a-zA-Z0-9_]*';
var UNDERSCORE_IDENT_RE = '[a-zA-Z_][a-zA-Z0-9_]*';
var NUMBER_RE = '\\b\\d+(\\.\\d+)?';
var C_NUMBER_RE = '\\b(0x[A-Za-z0-9]+|\\d+(\\.\\d+)?)';
// Common modes
var APOS_STRING_MODE = {
    className: 'string',
    begin: '\'', end: '(^|[^\\\\])\'',
    relevance: 0
}
var QUOTE_STRING_MODE = {
    className: 'string',
    begin: '"', end: '(^|[^\\\\])"',
    relevance: 0
}
var C_LINE_COMMENT_MODE = {
    className: 'comment',
    begin: '//', end: '$',
    relevance: 0
}
var C_BLOCK_COMMENT_MODE = {
    className: 'comment',
    begin: '/\\*', end: '\\*/'


