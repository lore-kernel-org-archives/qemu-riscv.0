Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h5b6W-0005cj-HG
	for mharc-qemu-riscv@gnu.org; Sun, 17 Mar 2019 15:05:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lukas.auer@aisec.fraunhofer.de>) id 1h5b6T-0005Nx-31
	for qemu-riscv@nongnu.org; Sun, 17 Mar 2019 15:05:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lukas.auer@aisec.fraunhofer.de>) id 1h5ayU-0004jS-Pb
	for qemu-riscv@nongnu.org; Sun, 17 Mar 2019 14:57:37 -0400
Received: from mail-edgeka24.fraunhofer.de ([153.96.1.24]:19097)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lukas.auer@aisec.fraunhofer.de>)
	id 1h5ayU-0004gY-EY; Sun, 17 Mar 2019 14:57:34 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2G7AABEl45c/xoBYJljHAEBAQQBAQc?=
	=?us-ascii?q?EAQGBVAQBAQsBghCBWRInCoQBiHuMT3yZMA2EbAIXhDoiNwYNAQEDAQEJAQM?=
	=?us-ascii?q?CAgJpHQuFSwEBAQECASMRRQULAgEIGAICJgICAjAVEAIEDgWFEAcBqTaBL4o?=
	=?us-ascii?q?lgQskAYsvgVg+gRABghRJNYUBgwqCVwOMLiqXfQMEAgKBJJF/GYsLiEyLB5M?=
	=?us-ascii?q?jgV0jgVZxgzuCFhcTjgs/AQExAY4QgR8BAQ?=
X-IPAS-Result: =?us-ascii?q?A2G7AABEl45c/xoBYJljHAEBAQQBAQcEAQGBVAQBAQsBg?=
	=?us-ascii?q?hCBWRInCoQBiHuMT3yZMA2EbAIXhDoiNwYNAQEDAQEJAQMCAgJpHQuFSwEBA?=
	=?us-ascii?q?QECASMRRQULAgEIGAICJgICAjAVEAIEDgWFEAcBqTaBL4olgQskAYsvgVg+g?=
	=?us-ascii?q?RABghRJNYUBgwqCVwOMLiqXfQMEAgKBJJF/GYsLiEyLB5MjgV0jgVZxgzuCF?=
	=?us-ascii?q?hcTjgs/AQExAY4QgR8BAQ?=
X-IronPort-AV: E=Sophos;i="5.58,490,1544482800"; d="scan'208";a="13835870"
Received: from mail-mtaka26.fraunhofer.de ([153.96.1.26])
	by mail-edgeKA24.fraunhofer.de with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Mar 2019 19:57:22 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CsAACAl45cfRBhWMBjHAEBAQQBAQc?=
	=?us-ascii?q?EAQGBVAQBAQsBg3snCoQBiHuMT3yZMA2EbAIXhFs3Bg0BAQMBAQkBAwIUAQE?=
	=?us-ascii?q?WOiQLhUoBAQEDASMRRQULAgEIGAICJgICAjAVEAIEDgWFEAipN4EviiWBCyQ?=
	=?us-ascii?q?BjQc+gRABghRJNYUBgwqCVwOMLiqXfQMEAgKBJJF/GYsLiEyLB5MjgV0hgVd?=
	=?us-ascii?q?xgzuCFhcTjgs/AQIwAY4QgR8BAQ?=
X-IronPort-AV: E=Sophos;i="5.58,490,1544482800"; d="scan'208";a="35765652"
Received: from fgdemucivp01ltm.xch.fraunhofer.de (HELO
	FGDEMUCIMP11EXC.ads.fraunhofer.de) ([192.88.97.16])
	by mail-mtaKA26.fraunhofer.de with ESMTP/TLS/AES256-SHA;
	17 Mar 2019 19:57:20 +0100
Received: from FGDEMUCIMP01EXC.ads.fraunhofer.de ([10.80.232.40]) by
	FGDEMUCIMP11EXC.ads.fraunhofer.de ([10.80.232.42]) with mapi id
	14.03.0435.000; Sun, 17 Mar 2019 19:57:20 +0100
From: "Auer, Lukas" <lukas.auer@aisec.fraunhofer.de>
To: "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>
CC: "palmer@sifive.com" <palmer@sifive.com>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"sagark@eecs.berkeley.edu" <sagark@eecs.berkeley.edu>,
	"Alistair.Francis@wdc.com" <Alistair.Francis@wdc.com>
Thread-Topic: [Qemu-devel] [PATCH] hw/riscv/virt: re-add machine-specific
	compatible string to /soc/ node
Thread-Index: AQHUwX2/pwGZ00zQgE6v+yqcxIgIXaYEJ5sAgADTUQCAABSaAIAAM/MAgAFmzoCAAYTigIAAu5oAgALTm4CAAFH+gIAEQmKA
Date: Sun, 17 Mar 2019 18:57:19 +0000
Message-ID: <ff1f7475bce16a7a997be49ddb96574633acbbd1.camel@aisec.fraunhofer.de>
References: <20190210201726.3567-1-lukas.auer@aisec.fraunhofer.de>
	<CAEUhbmUtSAeznt1DCwJ7tS=YFeqwnYBemS6278=QQ60qs_MthA@mail.gmail.com>
	<c9f69861058412a1f71418a9c892daf0821a9e33.camel@aisec.fraunhofer.de>
	<CAEUhbmXjCqRRtNDqq5E5y60sDz+4=WqMuxFhaLndot7TSJuUiQ@mail.gmail.com>
	<e131b4b0eb9109547ce0ed0993665206d6bf983a.camel@aisec.fraunhofer.de>
	<CAEUhbmX=PT-46nqtMqSaGn5xu2tRJ50Sm6kK7b97Xc_Y+6stPw@mail.gmail.com>
	<33758c6945c9b1968247c5b6dfb12418e57e71e0.camel@aisec.fraunhofer.de>
	<CAEUhbmX5ygthHtEoMvRMND3hbmhXrp-ok_hyvAqC+REafNSNbQ@mail.gmail.com>
	<9beff9a660f1c3fd1317a52c6d1b7c7ae211a2dd.camel@aisec.fraunhofer.de>
	<CAEUhbmV9TS1wXfcSFX7P-JEWooXX8JHxW34vtGHLgFy7-z+evA@mail.gmail.com>
In-Reply-To: <CAEUhbmV9TS1wXfcSFX7P-JEWooXX8JHxW34vtGHLgFy7-z+evA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.80.233.50]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.200.1013-24494.006
x-tm-as-result: No--16.229300-8.000000-31
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
Content-Type: text/plain; charset="utf-8"
Content-ID: <E54021C10F21D5439201E0E558EA9DC2@xch.fraunhofer.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 153.96.1.24
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] hw/riscv/virt: re-add
 machine-specific compatible string to /soc/ node
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Mar 2019 19:05:50 -0000

SGkgQmluLA0KDQpPbiBGcmksIDIwMTktMDMtMTUgYXQgMDk6NTQgKzA4MDAsIEJpbiBNZW5nIHdy
b3RlOg0KPiBIaSBMdWthcywNCj4gDQo+IE9uIEZyaSwgTWFyIDE1LCAyMDE5IGF0IDU6MDEgQU0g
QXVlciwgTHVrYXMNCj4gPGx1a2FzLmF1ZXJAYWlzZWMuZnJhdW5ob2Zlci5kZT4gd3JvdGU6DQo+
ID4gSGkgQmluLA0KPiA+IA0KPiA+IE9uIFdlZCwgMjAxOS0wMy0xMyBhdCAwOTo1MSArMDgwMCwg
QmluIE1lbmcgd3JvdGU6DQo+ID4gPiBIaSBMdWthcywNCj4gPiA+IA0KPiA+ID4gT24gVHVlLCBN
YXIgMTIsIDIwMTkgYXQgMTA6MzkgUE0gQXVlciwgTHVrYXMNCj4gPiA+IDxsdWthcy5hdWVyQGFp
c2VjLmZyYXVuaG9mZXIuZGU+IHdyb3RlOg0KPiA+ID4gPiBIaSBCaW4sDQo+ID4gPiA+IA0KPiA+
ID4gPiBPbiBNb24sIDIwMTktMDMtMTEgYXQgMjM6MjggKzA4MDAsIEJpbiBNZW5nIHdyb3RlOg0K
PiA+ID4gPiA+IEhpIEx1a2FzLA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IE9uIE1vbiwgTWFyIDEx
LCAyMDE5IGF0IDI6MDMgQU0gQXVlciwgTHVrYXMNCj4gPiA+ID4gPiA8bHVrYXMuYXVlckBhaXNl
Yy5mcmF1bmhvZmVyLmRlPiB3cm90ZToNCj4gPiA+ID4gPiA+IEhpIEJpbiwNCj4gPiA+ID4gPiA+
IA0KPiA+ID4gPiA+ID4gT24gU3VuLCAyMDE5LTAzLTEwIGF0IDIyOjU3ICswODAwLCBCaW4gTWVu
ZyB3cm90ZToNCj4gPiA+ID4gPiA+ID4gSGkgTHVrYXMsDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4g
PiA+ID4gPiBPbiBTdW4sIE1hciAxMCwgMjAxOSBhdCA5OjQ0IFBNIEF1ZXIsIEx1a2FzDQo+ID4g
PiA+ID4gPiA+IDxsdWthcy5hdWVyQGFpc2VjLmZyYXVuaG9mZXIuZGU+IHdyb3RlOg0KPiA+ID4g
PiA+ID4gPiA+IEhpIEJpbiwNCj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiBPbiBT
dW4sIDIwMTktMDMtMTAgYXQgMDk6MDcgKzA4MDAsIEJpbiBNZW5nIHdyb3RlOg0KPiA+ID4gPiA+
ID4gPiA+ID4gSGkgTHVrYXMsDQo+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+
IE9uIE1vbiwgRmViIDExLCAyMDE5IGF0IDY6MTMgQU0gTHVrYXMgQXVlcg0KPiA+ID4gPiA+ID4g
PiA+ID4gPGx1a2FzLmF1ZXJAYWlzZWMuZnJhdW5ob2Zlci5kZT4gd3JvdGU6DQo+ID4gPiA+ID4g
PiA+ID4gPiA+IFJlLWFkZCB0aGUgcHJldmlvdXMgY29tcGF0aWJsZSBzdHJpbmcgInJpc2N2LQ0K
PiA+ID4gPiA+ID4gPiA+ID4gPiB2aXJ0aW8tDQo+ID4gPiA+ID4gPiA+ID4gPiA+IHNvYyIgdG8N
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gdGhlDQo+ID4gPiA+ID4gPiA+ID4gPiA+IHNvYw0KPiA+ID4g
PiA+ID4gPiA+ID4gPiBkZXZpY2UgdHJlZSBub2RlIHRvIGFsbG93IFUtQm9vdCBhbmQgTGludXgg
dG8gYmluZA0KPiA+ID4gPiA+ID4gPiA+ID4gPiBtYWNoaW5lLQ0KPiA+ID4gPiA+ID4gPiA+ID4g
PiBzcGVjaWZpYw0KPiA+ID4gPiA+ID4gPiA+ID4gPiBkcml2ZXJzIHRvIGl0LiBUaGUgY3VycmVu
dCBjb21wYXRpYmxlIHN0cmluZw0KPiA+ID4gPiA+ID4gPiA+ID4gPiAic2ltcGxlLQ0KPiA+ID4g
PiA+ID4gPiA+ID4gPiBidXMiDQo+ID4gPiA+ID4gPiA+ID4gPiA+IGlzDQo+ID4gPiA+ID4gPiA+
ID4gPiA+IHJldGFpbmVkLg0KPiA+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+
ID4gVGhpcyBpcyByZXF1aXJlZCBieSBVLUJvb3QgdG8gYmluZCBkZXZpY2VzIGVhcmx5LA0KPiA+
ID4gPiA+ID4gPiA+ID4gPiBhcw0KPiA+ID4gPiA+ID4gPiA+ID4gPiBwYXJ0DQo+ID4gPiA+ID4g
PiA+ID4gPiA+IG9mDQo+ID4gPiA+ID4gPiA+ID4gPiA+IHRoZQ0KPiA+ID4gPiA+ID4gPiA+ID4g
PiBwcmUtcmVsb2NhdGlvbiBkcml2ZXIgbW9kZWwuDQo+ID4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+
ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gPiBJIHNlZSBubyBwcm9ibGVtIHdpdGgg
VS1Cb290IHdvcmtpbmcgd2l0aCBjdXJyZW50DQo+ID4gPiA+ID4gPiA+ID4gPiBjb21wYXRpYmxl
DQo+ID4gPiA+ID4gPiA+ID4gPiBzdHJpbmcNCj4gPiA+ID4gPiA+ID4gPiA+ICJzaW1wbGUtYnVz
Ii4gSW4gZmFjdCBJIGhhZCBwbGFubmVkIHRvIHJlbW92ZSB0aGUNCj4gPiA+ID4gPiA+ID4gPiA+
IGNvbXBhdGlibGUNCj4gPiA+ID4gPiA+ID4gPiA+IHN0cmluZw0KPiA+ID4gPiA+ID4gPiA+ID4g
InJpc2N2LXZpcnRpby1zb2MiIGluIFUtQm9vdCBidXQgZGlkIG5vdCBnZXQgdGltZSB0bw0KPiA+
ID4gPiA+ID4gPiA+ID4gd29yaw0KPiA+ID4gPiA+ID4gPiA+ID4gb24NCj4gPiA+ID4gPiA+ID4g
PiA+IGl0Lg0KPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
PiA+ID4gSXQgaXMgb25seSByZXF1aXJlZCBpZiBVLUJvb3QgaXMgcnVubmluZyBpbiBtYWNoaW5l
LQ0KPiA+ID4gPiA+ID4gPiA+IG1vZGUuDQo+ID4gPiA+ID4gPiA+ID4gRm9yDQo+ID4gPiA+ID4g
PiA+ID4gcmVsb2NhdGlvbiBpdCBuZWVkcyB0byB1c2UgdGhlIENMSU5UIGRyaXZlciB0byBzZW5k
DQo+ID4gPiA+ID4gPiA+ID4gYXBwcm9wcmlhdGUNCj4gPiA+ID4gPiA+ID4gPiBJUElzIHRvDQo+
ID4gPiA+ID4gPiA+ID4gdGhlIG90aGVyIGhhcnRzLiBUbyBiZSBhYmxlIHRvIHByb2JlIHRoZSBk
cml2ZXIsIHRoZQ0KPiA+ID4gPiA+ID4gPiA+IGRldmljZQ0KPiA+ID4gPiA+ID4gPiA+IGFuZA0K
PiA+ID4gPiA+ID4gPiA+IGl0cw0KPiA+ID4gPiA+ID4gPiA+IHBhcmVudCBkZXZpY2UgdHJlZSBu
b2RlIChzb2MpIG11c3QgdGhlcmVmb3JlIGJlDQo+ID4gPiA+ID4gPiA+ID4gYXZhaWxhYmxlDQo+
ID4gPiA+ID4gPiA+ID4gaW4NCj4gPiA+ID4gPiA+ID4gPiB0aGUNCj4gPiA+ID4gPiA+ID4gPiBw
cmUtDQo+ID4gPiA+ID4gPiA+ID4gcmVsb2NhdGlvbiBkZXZpY2UgbW9kZWwuDQo+ID4gPiA+ID4g
PiA+ID4gVGhpcyBwYXRjaCB3YXMgdGhlIGVhc2llc3Qgd2F5IEkgY291bGQgdGhpbmsgb2YgZm9y
DQo+ID4gPiA+ID4gPiA+ID4gYWNoaWV2aW5nDQo+ID4gPiA+ID4gPiA+ID4gdGhpcy4NCj4gPiA+
ID4gPiA+ID4gPiBJdA0KPiA+ID4gPiA+ID4gPiA+IGNvdWxkIGJlIHRoYXQgdGhlcmUgaXMgYSBi
ZXR0ZXIgd2F5IG9mIHNvbHZpbmcgdGhpcy4NCj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+
ID4gDQo+ID4gPiA+ID4gPiA+IEkgdGVzdGVkIHlvdXIgU01QIFUtQm9vdCBzZXJpZXMgaW4gYm90
aCBNLW1vZGUgYW5kIFMtDQo+ID4gPiA+ID4gPiA+IG1vZGUsDQo+ID4gPiA+ID4gPiA+IHVzaW5n
DQo+ID4gPiA+ID4gPiA+IGEgNA0KPiA+ID4gPiA+ID4gPiBjb3JlICd2aXJ0JyB0YXJnZXQuIFdv
cmtzIGZpbmUuIEkgYW0gdXNpbmcgUUVNVSAzLjEuMCBzbw0KPiA+ID4gPiA+ID4gPiBpdA0KPiA+
ID4gPiA+ID4gPiBpcw0KPiA+ID4gPiA+ID4gPiAic2ltcGxlLWJ1cyIuDQo+ID4gPiA+ID4gPiA+
IA0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBUaGF0IGlzIGFjdHVhbGx5IG15IGZhdWx0LCBp
dCBzaG91bGQgbm90IHdvcmsuDQo+ID4gPiA+ID4gPiBXaGF0IGlzIGhhcHBlbmluZyBpcyB0aGF0
IFUtQm9vdCBmYWlscyB0byByZWxvY2F0ZSB0aGUNCj4gPiA+ID4gPiA+IHNlY29uZGFyeQ0KPiA+
ID4gPiA+ID4gaGFydHMsDQo+ID4gPiA+ID4gPiBiZWNhdXNlIHRoZSBDTElOVCBkcml2ZXIgY2Fu
bm90IGdldCB0aGUgbWVtb3J5IGFkZHJlc3Mgb2YNCj4gPiA+ID4gPiA+IHRoZQ0KPiA+ID4gPiA+
ID4gQ0xJTlQNCj4gPiA+ID4gPiA+IGRldmljZS4gVGhpcyBlcnJvciBpcyBjdXJyZW50bHkgc2ls
ZW50bHkgaWdub3JlZC4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBJIHN0aWxsIGRvbid0IHVuZGVy
c3RhbmQuIFdoeSBkb2VzIHRoZSBDTElOVCBkcml2ZXIgZmFpbCB0bw0KPiA+ID4gPiA+IGdldA0K
PiA+ID4gPiA+IHRoZQ0KPiA+ID4gPiA+IG1lbW9yeSBhZGRyZXNzPyBVLUJvb3QgaGFzIGJlZW4g
c3VwcG9ydGluZyAic2ltcGlsZS1idXMiIGZvcg0KPiA+ID4gPiA+IGENCj4gPiA+ID4gPiBsb25n
DQo+ID4gPiA+ID4gdGltZS4gSXQgd2FzIGJlY2F1c2UgUUVNVSAzLjAuMCBnZW5lcmF0ZWQgdGhl
IC9zb2Mgbm9kZSB3aXRoDQo+ID4gPiA+ID4gInJpc2N2LXZpcnRpby1zb2MiIGNvbXBhdGlibGUg
c3RyaW5nLCBVLUJvb3Qgd2FzIHRhdWdodCB0bw0KPiA+ID4gPiA+IHRyZWF0DQo+ID4gPiA+ID4g
c3VjaA0KPiA+ID4gPiA+IGNvbXBhdGlibGUgc3RyaW5nIGFzIGEgInNpbXBsZS1idXMiIHRvbyAo
dGhhdCB3YXMgdGhlIFUtQm9vdA0KPiA+ID4gPiA+IGNvbW1pdA0KPiA+ID4gPiA+IDI3ZGMyYzEz
MGUyOSkNCj4gPiA+ID4gDQo+ID4gPiA+IFRoYXQncyBjb3JyZWN0LiBUaGUgcHJvYmxlbSB3aXRo
IHRoZSBkZWZhdWx0IHNpbXBsZS1idXMgVS1Cb290DQo+ID4gPiA+IGRyaXZlcg0KPiA+ID4gPiBp
cyB0aGF0IGl0IGRvZXMgbm90IGhhdmUgdGhlIERNX0ZMQUdfUFJFX1JFTE9DIGZsYWcgc2V0LiBU
aGUNCj4gPiA+ID4gL3NvYw0KPiA+ID4gPiBhbmQNCj4gPiA+ID4gL3NvYy9jbGludCBub2RlcyBh
cmUgdGhlcmVmb3JlIG5vdCBhdmFpbGFibGUgYmVmb3JlIHJlbG9jYXRpb24sDQo+ID4gPiA+IG1l
YW5pbmcNCj4gPiA+ID4gdGhhdCBJUElzIGNhbm5vdCBiZSBzZW50IHRvIHJlbG9jYXRlIHRoZSBz
ZWNvbmRhcnkgaGFydHMuDQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiBUaGFua3MgZm9yIHRoZSBj
bGFyaWZpY2F0aW9ucy4gTm93IEkgc2VlIHRoZSBwcm9ibGVtLiBCdXQgSSB0aGluaw0KPiA+ID4g
d2UNCj4gPiA+IHNob3VsZCBmaXggVS1Cb290ICJzaW1wbGUtYnVzIiBkcml2ZXIgaW5zdGVhZC4g
QXMgc2VlbiBvbiBGVTU0MA0KPiA+ID4gb3INCj4gPiA+IGxpa2VseSBvdGhlciBoYXJkd2FyZSwg
UUVNVSBnZW5lcmF0ZXMgdGhlICJzaW1wbGUtYnVzIiBjb21wYXRpYmxlDQo+ID4gPiBzdHJpbmcg
Zm9yIHRoZSAvc29jIG5vZGUsIGFzIHdlbGwgYXMgdGhlIERUIHByb3ZpZGVkIGJ5IHRoZQ0KPiA+
ID4gaGFyZHdhcmUuDQo+ID4gPiANCj4gPiANCj4gPiBUaGF0IG1ha2VzIHNlbnNlLCBJIGNhbiBz
ZW5kIGEgcGF0Y2ggdG8gc2V0IHRoZSBETV9GTEFHX1BSRV9SRUxPQw0KPiA+IGZsYWcNCj4gPiBp
biB0aGUgc2ltcGxlLWJ1cyBVLUJvb3QgZHJpdmVyLiBJIHRoaW5rIGl0J3MgYmVzdCB0byBzZW5k
IGl0DQo+ID4gc2VwYXJhdGVseSBmcm9tIHRoZSBTTVAgcGF0Y2ggc2VyaWVzLCBzaW5jZSBpdCBj
b3VsZCBhZmZlY3Qgb3RoZXINCj4gPiBib2FyZHMgYW5kIGl0J3MgYSBiaXQgbGF0ZSBpbiB0aGUg
cmVsZWFzZSBjeWNsZS4gV2hhdCBkbyB5b3UgdGhpbms/DQo+ID4gDQo+IA0KPiBZZXMsIGFncmVl
ZCB0aGF0IHRoZSAic2ltcGxlLWJ1cyIgZHJpdmVyIGNoYW5nZXMgc2hvdWxkIGJlIG5leHQgVS0N
Cj4gQm9vdA0KPiByZWxlYXNlLiBXZSBzaG91bGQgdHJ5IHRvIGdldCB0aGUgVS1Cb290IFNNUCBz
ZXJpZXMgaW4gdGhlIHYyMDE5LjA0DQo+IHJlbGVhc2UuDQo+IA0KDQpZZXMgZGVmaW5pdGVseSwg
SSBoYXZlIGp1c3Qgc2VudCB2ZXJzaW9uIDMgb2YgdGhlIHNlcmllcy4gSSBob3BlIGl0IGlzDQpy
ZWFkeSB0byBnbyBpbnRvIG1haW5saW5lIG5vdy4NCg0KVGhhbmtzLA0KTHVrYXMNCg==

