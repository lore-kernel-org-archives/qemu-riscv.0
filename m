Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h3inf-0001DW-Ab
	for mharc-qemu-riscv@gnu.org; Tue, 12 Mar 2019 10:54:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lukas.auer@aisec.fraunhofer.de>) id 1h3inc-00010e-BG
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 10:54:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lukas.auer@aisec.fraunhofer.de>) id 1h3iZf-0007BG-7D
	for qemu-riscv@nongnu.org; Tue, 12 Mar 2019 10:40:13 -0400
Received: from mail-edges23.fraunhofer.de ([153.97.7.23]:12693)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lukas.auer@aisec.fraunhofer.de>)
	id 1h3iZe-0006kv-Qh; Tue, 12 Mar 2019 10:40:11 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GFAADNw4dc/xwBYJlkHQEBBQEHBQG?=
	=?us-ascii?q?BUwYBCwGCD4FZEicKhACIeYxmfJcvgXsNhGwCF4QjIjYHDQEBAwEBCQEDAgI?=
	=?us-ascii?q?CaR0LhUsBAQEDASMRRRACAQgYAgImAgICMBUQAgQOBYUQBwGwRoEvikCBCyQ?=
	=?us-ascii?q?BiyyBWD6BEAGCXTWIC4JXA4wlKpdfAwQCAoEjkXAZgXmJA4hAinqBE5FogU4?=
	=?us-ascii?q?ELoFWcYM7ghYXE44LPwEBMQGQH4EfAQE?=
X-IPAS-Result: =?us-ascii?q?A2GFAADNw4dc/xwBYJlkHQEBBQEHBQGBUwYBCwGCD4FZE?=
	=?us-ascii?q?icKhACIeYxmfJcvgXsNhGwCF4QjIjYHDQEBAwEBCQEDAgICaR0LhUsBAQEDA?=
	=?us-ascii?q?SMRRRACAQgYAgImAgICMBUQAgQOBYUQBwGwRoEvikCBCyQBiyyBWD6BEAGCX?=
	=?us-ascii?q?TWIC4JXA4wlKpdfAwQCAoEjkXAZgXmJA4hAinqBE5FogU4ELoFWcYM7ghYXE?=
	=?us-ascii?q?44LPwEBMQGQH4EfAQE?=
X-IronPort-AV: E=Sophos;i="5.58,471,1544482800"; 
   d="scan'208";a="9724889"
Received: from mail-mtaka28.fraunhofer.de ([153.96.1.28])
	by mail-edgeS23.fraunhofer.de with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Mar 2019 15:39:55 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0B7AAA7xIdcfRBhWMBkHQEBBQEHBQG?=
	=?us-ascii?q?BUwYBCwGDRyESJwqEAIh5jGZ8ly+Bew2EbAIXhEQ2Bw0BAQMBAQkBAwIUAQE?=
	=?us-ascii?q?WOiQLhUoBAQEDASMRRRACAQgYAgImAgICMBUQAgQOBYUQCLBGgS+KPoELJAG?=
	=?us-ascii?q?NBD6BEAGCXTWIC4JXA4wlKpdfAwQCAoEjkXAZgXmJA4hAinqBE5FogU4ELIF?=
	=?us-ascii?q?XcYM7ghYXE44LPwECMAGQH4EfAQE?=
X-IronPort-AV: E=Sophos;i="5.58,471,1544482800"; d="scan'208";a="19556676"
Received: from fgdemucivp01ltm.xch.fraunhofer.de (HELO
	FGDEMUCIMP11EXC.ads.fraunhofer.de) ([192.88.97.16])
	by mail-mtaKA28.fraunhofer.de with ESMTP/TLS/AES256-SHA;
	12 Mar 2019 15:39:56 +0100
Received: from FGDEMUCIMP01EXC.ads.fraunhofer.de ([10.80.232.40]) by
	FGDEMUCIMP11EXC.ads.fraunhofer.de ([10.80.232.42]) with mapi id
	14.03.0435.000; Tue, 12 Mar 2019 15:39:54 +0100
From: "Auer, Lukas" <lukas.auer@aisec.fraunhofer.de>
To: "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>
CC: "palmer@sifive.com" <palmer@sifive.com>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"sagark@eecs.berkeley.edu" <sagark@eecs.berkeley.edu>,
	"Alistair.Francis@wdc.com" <Alistair.Francis@wdc.com>
Thread-Topic: [Qemu-devel] [PATCH] hw/riscv/virt: re-add machine-specific
	compatible string to /soc/ node
Thread-Index: AQHUwX2/pwGZ00zQgE6v+yqcxIgIXaYEJ5sAgADTUQCAABSaAIAAM/MAgAFmzoCAAYTigA==
Date: Tue, 12 Mar 2019 14:39:53 +0000
Message-ID: <33758c6945c9b1968247c5b6dfb12418e57e71e0.camel@aisec.fraunhofer.de>
References: <20190210201726.3567-1-lukas.auer@aisec.fraunhofer.de>
	<CAEUhbmUtSAeznt1DCwJ7tS=YFeqwnYBemS6278=QQ60qs_MthA@mail.gmail.com>
	<c9f69861058412a1f71418a9c892daf0821a9e33.camel@aisec.fraunhofer.de>
	<CAEUhbmXjCqRRtNDqq5E5y60sDz+4=WqMuxFhaLndot7TSJuUiQ@mail.gmail.com>
	<e131b4b0eb9109547ce0ed0993665206d6bf983a.camel@aisec.fraunhofer.de>
	<CAEUhbmX=PT-46nqtMqSaGn5xu2tRJ50Sm6kK7b97Xc_Y+6stPw@mail.gmail.com>
In-Reply-To: <CAEUhbmX=PT-46nqtMqSaGn5xu2tRJ50Sm6kK7b97Xc_Y+6stPw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.80.233.50]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.200.1013-24484.007
x-tm-as-result: No--13.446600-8.000000-31
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
Content-Type: text/plain; charset="utf-8"
Content-ID: <95AC91E372DCB041B1A3921BAEE974E9@xch.fraunhofer.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 153.97.7.23
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
X-List-Received-Date: Tue, 12 Mar 2019 14:54:37 -0000

SGkgQmluLA0KDQpPbiBNb24sIDIwMTktMDMtMTEgYXQgMjM6MjggKzA4MDAsIEJpbiBNZW5nIHdy
b3RlOg0KPiBIaSBMdWthcywNCj4gDQo+IE9uIE1vbiwgTWFyIDExLCAyMDE5IGF0IDI6MDMgQU0g
QXVlciwgTHVrYXMNCj4gPGx1a2FzLmF1ZXJAYWlzZWMuZnJhdW5ob2Zlci5kZT4gd3JvdGU6DQo+
ID4gSGkgQmluLA0KPiA+IA0KPiA+IE9uIFN1biwgMjAxOS0wMy0xMCBhdCAyMjo1NyArMDgwMCwg
QmluIE1lbmcgd3JvdGU6DQo+ID4gPiBIaSBMdWthcywNCj4gPiA+IA0KPiA+ID4gT24gU3VuLCBN
YXIgMTAsIDIwMTkgYXQgOTo0NCBQTSBBdWVyLCBMdWthcw0KPiA+ID4gPGx1a2FzLmF1ZXJAYWlz
ZWMuZnJhdW5ob2Zlci5kZT4gd3JvdGU6DQo+ID4gPiA+IEhpIEJpbiwNCj4gPiA+ID4gDQo+ID4g
PiA+IE9uIFN1biwgMjAxOS0wMy0xMCBhdCAwOTowNyArMDgwMCwgQmluIE1lbmcgd3JvdGU6DQo+
ID4gPiA+ID4gSGkgTHVrYXMsDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gT24gTW9uLCBGZWIgMTEs
IDIwMTkgYXQgNjoxMyBBTSBMdWthcyBBdWVyDQo+ID4gPiA+ID4gPGx1a2FzLmF1ZXJAYWlzZWMu
ZnJhdW5ob2Zlci5kZT4gd3JvdGU6DQo+ID4gPiA+ID4gPiBSZS1hZGQgdGhlIHByZXZpb3VzIGNv
bXBhdGlibGUgc3RyaW5nICJyaXNjdi12aXJ0aW8tc29jIiB0bw0KPiA+ID4gPiA+ID4gdGhlDQo+
ID4gPiA+ID4gPiBzb2MNCj4gPiA+ID4gPiA+IGRldmljZSB0cmVlIG5vZGUgdG8gYWxsb3cgVS1C
b290IGFuZCBMaW51eCB0byBiaW5kIG1hY2hpbmUtDQo+ID4gPiA+ID4gPiBzcGVjaWZpYw0KPiA+
ID4gPiA+ID4gZHJpdmVycyB0byBpdC4gVGhlIGN1cnJlbnQgY29tcGF0aWJsZSBzdHJpbmcgInNp
bXBsZS1idXMiDQo+ID4gPiA+ID4gPiBpcw0KPiA+ID4gPiA+ID4gcmV0YWluZWQuDQo+ID4gPiA+
ID4gPiANCj4gPiA+ID4gPiA+IFRoaXMgaXMgcmVxdWlyZWQgYnkgVS1Cb290IHRvIGJpbmQgZGV2
aWNlcyBlYXJseSwgYXMgcGFydA0KPiA+ID4gPiA+ID4gb2YNCj4gPiA+ID4gPiA+IHRoZQ0KPiA+
ID4gPiA+ID4gcHJlLXJlbG9jYXRpb24gZHJpdmVyIG1vZGVsLg0KPiA+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gDQo+ID4gPiA+ID4gSSBzZWUgbm8gcHJvYmxlbSB3aXRoIFUtQm9vdCB3b3JraW5nIHdp
dGggY3VycmVudCBjb21wYXRpYmxlDQo+ID4gPiA+ID4gc3RyaW5nDQo+ID4gPiA+ID4gInNpbXBs
ZS1idXMiLiBJbiBmYWN0IEkgaGFkIHBsYW5uZWQgdG8gcmVtb3ZlIHRoZSBjb21wYXRpYmxlDQo+
ID4gPiA+ID4gc3RyaW5nDQo+ID4gPiA+ID4gInJpc2N2LXZpcnRpby1zb2MiIGluIFUtQm9vdCBi
dXQgZGlkIG5vdCBnZXQgdGltZSB0byB3b3JrIG9uDQo+ID4gPiA+ID4gaXQuDQo+ID4gPiA+ID4g
DQo+ID4gPiA+IA0KPiA+ID4gPiBJdCBpcyBvbmx5IHJlcXVpcmVkIGlmIFUtQm9vdCBpcyBydW5u
aW5nIGluIG1hY2hpbmUtbW9kZS4gRm9yDQo+ID4gPiA+IHJlbG9jYXRpb24gaXQgbmVlZHMgdG8g
dXNlIHRoZSBDTElOVCBkcml2ZXIgdG8gc2VuZCBhcHByb3ByaWF0ZQ0KPiA+ID4gPiBJUElzIHRv
DQo+ID4gPiA+IHRoZSBvdGhlciBoYXJ0cy4gVG8gYmUgYWJsZSB0byBwcm9iZSB0aGUgZHJpdmVy
LCB0aGUgZGV2aWNlIGFuZA0KPiA+ID4gPiBpdHMNCj4gPiA+ID4gcGFyZW50IGRldmljZSB0cmVl
IG5vZGUgKHNvYykgbXVzdCB0aGVyZWZvcmUgYmUgYXZhaWxhYmxlIGluDQo+ID4gPiA+IHRoZQ0K
PiA+ID4gPiBwcmUtDQo+ID4gPiA+IHJlbG9jYXRpb24gZGV2aWNlIG1vZGVsLg0KPiA+ID4gPiBU
aGlzIHBhdGNoIHdhcyB0aGUgZWFzaWVzdCB3YXkgSSBjb3VsZCB0aGluayBvZiBmb3IgYWNoaWV2
aW5nDQo+ID4gPiA+IHRoaXMuDQo+ID4gPiA+IEl0DQo+ID4gPiA+IGNvdWxkIGJlIHRoYXQgdGhl
cmUgaXMgYSBiZXR0ZXIgd2F5IG9mIHNvbHZpbmcgdGhpcy4NCj4gPiA+ID4gDQo+ID4gPiANCj4g
PiA+IEkgdGVzdGVkIHlvdXIgU01QIFUtQm9vdCBzZXJpZXMgaW4gYm90aCBNLW1vZGUgYW5kIFMt
bW9kZSwgdXNpbmcNCj4gPiA+IGEgNA0KPiA+ID4gY29yZSAndmlydCcgdGFyZ2V0LiBXb3JrcyBm
aW5lLiBJIGFtIHVzaW5nIFFFTVUgMy4xLjAgc28gaXQgaXMNCj4gPiA+ICJzaW1wbGUtYnVzIi4N
Cj4gPiA+IA0KPiA+IA0KPiA+IFRoYXQgaXMgYWN0dWFsbHkgbXkgZmF1bHQsIGl0IHNob3VsZCBu
b3Qgd29yay4NCj4gPiBXaGF0IGlzIGhhcHBlbmluZyBpcyB0aGF0IFUtQm9vdCBmYWlscyB0byBy
ZWxvY2F0ZSB0aGUgc2Vjb25kYXJ5DQo+ID4gaGFydHMsDQo+ID4gYmVjYXVzZSB0aGUgQ0xJTlQg
ZHJpdmVyIGNhbm5vdCBnZXQgdGhlIG1lbW9yeSBhZGRyZXNzIG9mIHRoZSBDTElOVA0KPiA+IGRl
dmljZS4gVGhpcyBlcnJvciBpcyBjdXJyZW50bHkgc2lsZW50bHkgaWdub3JlZC4NCj4gDQo+IEkg
c3RpbGwgZG9uJ3QgdW5kZXJzdGFuZC4gV2h5IGRvZXMgdGhlIENMSU5UIGRyaXZlciBmYWlsIHRv
IGdldCB0aGUNCj4gbWVtb3J5IGFkZHJlc3M/IFUtQm9vdCBoYXMgYmVlbiBzdXBwb3J0aW5nICJz
aW1waWxlLWJ1cyIgZm9yIGEgbG9uZw0KPiB0aW1lLiBJdCB3YXMgYmVjYXVzZSBRRU1VIDMuMC4w
IGdlbmVyYXRlZCB0aGUgL3NvYyBub2RlIHdpdGgNCj4gInJpc2N2LXZpcnRpby1zb2MiIGNvbXBh
dGlibGUgc3RyaW5nLCBVLUJvb3Qgd2FzIHRhdWdodCB0byB0cmVhdCBzdWNoDQo+IGNvbXBhdGli
bGUgc3RyaW5nIGFzIGEgInNpbXBsZS1idXMiIHRvbyAodGhhdCB3YXMgdGhlIFUtQm9vdCBjb21t
aXQNCj4gMjdkYzJjMTMwZTI5KQ0KDQpUaGF0J3MgY29ycmVjdC4gVGhlIHByb2JsZW0gd2l0aCB0
aGUgZGVmYXVsdCBzaW1wbGUtYnVzIFUtQm9vdCBkcml2ZXINCmlzIHRoYXQgaXQgZG9lcyBub3Qg
aGF2ZSB0aGUgRE1fRkxBR19QUkVfUkVMT0MgZmxhZyBzZXQuIFRoZSAvc29jIGFuZA0KL3NvYy9j
bGludCBub2RlcyBhcmUgdGhlcmVmb3JlIG5vdCBhdmFpbGFibGUgYmVmb3JlIHJlbG9jYXRpb24s
IG1lYW5pbmcNCnRoYXQgSVBJcyBjYW5ub3QgYmUgc2VudCB0byByZWxvY2F0ZSB0aGUgc2Vjb25k
YXJ5IGhhcnRzLg0KDQpUaGFua3MsDQpMdWthcw0KDQo+IA0KPiA+IFRoZSBzZWNvbmRhcnkgaGFy
dHMgYXJlIHN0aWxsIHdhaXRpbmcgdG8gcmVjZWl2ZSBJUElzLCBzbyBib290aW5nDQo+ID4gTGlu
dXgNCj4gPiB3b3JrcyBmaW5lLCBiZWNhdXNlIFUtQm9vdCBjYW4gbm93IHNlbmQgSVBJcy4gVGhp
cyB3aWxsIGhvd2V2ZXINCj4gPiBicmVhaw0KPiA+IGlmIFUtQm9vdCBvdmVyd3JpdGVzIHRoZSBj
b2RlIHRoZSBzZWNvbmRhcnkgaGFydHMgYXJlIHJ1bm5pbmcsDQo+ID4gd2hpY2gNCj4gPiBjb3Vs
ZCBoYXBwZW4gd2hlbiBsb2FkaW5nIGFuIGltYWdlLg0KPiA+IA0KPiA+IEkgd2lsbCB1cGRhdGUg
bXkgU01QIFUtQm9vdCBzZXJpZXMgdG8gcHJpbnQgYSB3YXJuaW5nIGlmIHNlbmRpbmcgYW4NCj4g
PiBJUEkNCj4gPiBmYWlscy4NCj4gPiANCj4gDQo+IFJlZ2FyZHMsDQo+IEJpbg0K

