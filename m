Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h32q3-0005Xg-Kp
	for mharc-qemu-riscv@gnu.org; Sun, 10 Mar 2019 14:06:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lukas.auer@aisec.fraunhofer.de>) id 1h32q1-0005Vd-2D
	for qemu-riscv@nongnu.org; Sun, 10 Mar 2019 14:06:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lukas.auer@aisec.fraunhofer.de>) id 1h32nu-0007XN-Vz
	for qemu-riscv@nongnu.org; Sun, 10 Mar 2019 14:04:07 -0400
Received: from mail-edges23.fraunhofer.de ([153.97.7.23]:19891)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lukas.auer@aisec.fraunhofer.de>)
	id 1h32nu-0007Ix-KJ; Sun, 10 Mar 2019 14:04:06 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HDAADFUIVc/xoHYZlkHAEBAQQBAQc?=
	=?us-ascii?q?EAQGBVAQBAQsBgg+BWRInCoN/iHmKT4INfJklDYRsAheEHyI3Bg0BAQMBAQc?=
	=?us-ascii?q?BAwICAmkdC4VMAQUjEUUQAgEIGAICJgICAjAVEAIEDgWFFwGuOIEviiSBCyQ?=
	=?us-ascii?q?BiyyBWD6BEAGCXTWFAYMKglcDjCAql1cDBAICgSORZxmBeYkEiD2KeIESkV2?=
	=?us-ascii?q?BXSOBVnGDO4IWFxOOCz8BATEBj2WBHwEB?=
X-IPAS-Result: =?us-ascii?q?A2HDAADFUIVc/xoHYZlkHAEBAQQBAQcEAQGBVAQBAQsBg?=
	=?us-ascii?q?g+BWRInCoN/iHmKT4INfJklDYRsAheEHyI3Bg0BAQMBAQcBAwICAmkdC4VMA?=
	=?us-ascii?q?QUjEUUQAgEIGAICJgICAjAVEAIEDgWFFwGuOIEviiSBCyQBiyyBWD6BEAGCX?=
	=?us-ascii?q?TWFAYMKglcDjCAql1cDBAICgSORZxmBeYkEiD2KeIESkV2BXSOBVnGDO4IWF?=
	=?us-ascii?q?xOOCz8BATEBj2WBHwEB?=
X-IronPort-AV: E=Sophos;i="5.58,465,1544482800"; 
   d="scan'208";a="9678773"
Received: from mail-mtas26.fraunhofer.de ([153.97.7.26])
	by mail-edgeS23.fraunhofer.de with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Mar 2019 19:03:56 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CtAAAfUIVcfRBhWMBkHAEBAQQBAQc?=
	=?us-ascii?q?EAQGBVAQBAQsBg2gSJwqDf4h5jFx8mSUNhGwCF4RANwYNAQEDAQEHAQMCFAE?=
	=?us-ascii?q?BFjokC4VLAQIDIxFFEAIBCBgCAiYCAgIwFRACBA4FhRiuOYEviiSBCyQBjQQ?=
	=?us-ascii?q?+gRABgl01hQGDCoJXA4wgKpdXAwQCAoEjkWcZgXmJBIg9iniBEpFdgV0hgVd?=
	=?us-ascii?q?xgzuCFhcTjgs/AQIwAY9lgR8BAQ?=
X-IronPort-AV: E=Sophos;i="5.58,465,1544482800"; d="scan'208";a="66158817"
Received: from fgdemucivp01ltm.xch.fraunhofer.de (HELO
	FGDEMUCIMP11EXC.ads.fraunhofer.de) ([192.88.97.16])
	by mail-mtaS26.fraunhofer.de with ESMTP/TLS/AES256-SHA;
	10 Mar 2019 19:03:55 +0100
Received: from FGDEMUCIMP01EXC.ads.fraunhofer.de ([10.80.232.40]) by
	FGDEMUCIMP11EXC.ads.fraunhofer.de ([10.80.232.42]) with mapi id
	14.03.0435.000; Sun, 10 Mar 2019 19:03:55 +0100
From: "Auer, Lukas" <lukas.auer@aisec.fraunhofer.de>
To: "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>
CC: "palmer@sifive.com" <palmer@sifive.com>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"mjc@sifive.com" <mjc@sifive.com>, "sagark@eecs.berkeley.edu"
	<sagark@eecs.berkeley.edu>, "Alistair.Francis@wdc.com"
	<Alistair.Francis@wdc.com>
Thread-Topic: [Qemu-devel] [PATCH] hw/riscv/virt: re-add machine-specific
	compatible string to /soc/ node
Thread-Index: AQHUwX2/pwGZ00zQgE6v+yqcxIgIXaYEJ5sAgADTUQCAABSaAIAAM/MA
Date: Sun, 10 Mar 2019 18:03:54 +0000
Message-ID: <e131b4b0eb9109547ce0ed0993665206d6bf983a.camel@aisec.fraunhofer.de>
References: <20190210201726.3567-1-lukas.auer@aisec.fraunhofer.de>
	<CAEUhbmUtSAeznt1DCwJ7tS=YFeqwnYBemS6278=QQ60qs_MthA@mail.gmail.com>
	<c9f69861058412a1f71418a9c892daf0821a9e33.camel@aisec.fraunhofer.de>
	<CAEUhbmXjCqRRtNDqq5E5y60sDz+4=WqMuxFhaLndot7TSJuUiQ@mail.gmail.com>
In-Reply-To: <CAEUhbmXjCqRRtNDqq5E5y60sDz+4=WqMuxFhaLndot7TSJuUiQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.80.233.51]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.200.1013-24482.000
x-tm-as-result: No--11.994700-8.000000-31
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
Content-Type: text/plain; charset="utf-8"
Content-ID: <8CA85682BF11414581107E976302382F@xch.fraunhofer.de>
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
X-List-Received-Date: Sun, 10 Mar 2019 18:06:18 -0000

SGkgQmluLA0KDQpPbiBTdW4sIDIwMTktMDMtMTAgYXQgMjI6NTcgKzA4MDAsIEJpbiBNZW5nIHdy
b3RlOg0KPiBIaSBMdWthcywNCj4gDQo+IE9uIFN1biwgTWFyIDEwLCAyMDE5IGF0IDk6NDQgUE0g
QXVlciwgTHVrYXMNCj4gPGx1a2FzLmF1ZXJAYWlzZWMuZnJhdW5ob2Zlci5kZT4gd3JvdGU6DQo+
ID4gSGkgQmluLA0KPiA+IA0KPiA+IE9uIFN1biwgMjAxOS0wMy0xMCBhdCAwOTowNyArMDgwMCwg
QmluIE1lbmcgd3JvdGU6DQo+ID4gPiBIaSBMdWthcywNCj4gPiA+IA0KPiA+ID4gT24gTW9uLCBG
ZWIgMTEsIDIwMTkgYXQgNjoxMyBBTSBMdWthcyBBdWVyDQo+ID4gPiA8bHVrYXMuYXVlckBhaXNl
Yy5mcmF1bmhvZmVyLmRlPiB3cm90ZToNCj4gPiA+ID4gUmUtYWRkIHRoZSBwcmV2aW91cyBjb21w
YXRpYmxlIHN0cmluZyAicmlzY3YtdmlydGlvLXNvYyIgdG8gdGhlDQo+ID4gPiA+IHNvYw0KPiA+
ID4gPiBkZXZpY2UgdHJlZSBub2RlIHRvIGFsbG93IFUtQm9vdCBhbmQgTGludXggdG8gYmluZCBt
YWNoaW5lLQ0KPiA+ID4gPiBzcGVjaWZpYw0KPiA+ID4gPiBkcml2ZXJzIHRvIGl0LiBUaGUgY3Vy
cmVudCBjb21wYXRpYmxlIHN0cmluZyAic2ltcGxlLWJ1cyIgaXMNCj4gPiA+ID4gcmV0YWluZWQu
DQo+ID4gPiA+IA0KPiA+ID4gPiBUaGlzIGlzIHJlcXVpcmVkIGJ5IFUtQm9vdCB0byBiaW5kIGRl
dmljZXMgZWFybHksIGFzIHBhcnQgb2YNCj4gPiA+ID4gdGhlDQo+ID4gPiA+IHByZS1yZWxvY2F0
aW9uIGRyaXZlciBtb2RlbC4NCj4gPiA+ID4gDQo+ID4gPiANCj4gPiA+IEkgc2VlIG5vIHByb2Js
ZW0gd2l0aCBVLUJvb3Qgd29ya2luZyB3aXRoIGN1cnJlbnQgY29tcGF0aWJsZQ0KPiA+ID4gc3Ry
aW5nDQo+ID4gPiAic2ltcGxlLWJ1cyIuIEluIGZhY3QgSSBoYWQgcGxhbm5lZCB0byByZW1vdmUg
dGhlIGNvbXBhdGlibGUNCj4gPiA+IHN0cmluZw0KPiA+ID4gInJpc2N2LXZpcnRpby1zb2MiIGlu
IFUtQm9vdCBidXQgZGlkIG5vdCBnZXQgdGltZSB0byB3b3JrIG9uIGl0Lg0KPiA+ID4gDQo+ID4g
DQo+ID4gSXQgaXMgb25seSByZXF1aXJlZCBpZiBVLUJvb3QgaXMgcnVubmluZyBpbiBtYWNoaW5l
LW1vZGUuIEZvcg0KPiA+IHJlbG9jYXRpb24gaXQgbmVlZHMgdG8gdXNlIHRoZSBDTElOVCBkcml2
ZXIgdG8gc2VuZCBhcHByb3ByaWF0ZQ0KPiA+IElQSXMgdG8NCj4gPiB0aGUgb3RoZXIgaGFydHMu
IFRvIGJlIGFibGUgdG8gcHJvYmUgdGhlIGRyaXZlciwgdGhlIGRldmljZSBhbmQgaXRzDQo+ID4g
cGFyZW50IGRldmljZSB0cmVlIG5vZGUgKHNvYykgbXVzdCB0aGVyZWZvcmUgYmUgYXZhaWxhYmxl
IGluIHRoZQ0KPiA+IHByZS0NCj4gPiByZWxvY2F0aW9uIGRldmljZSBtb2RlbC4NCj4gPiBUaGlz
IHBhdGNoIHdhcyB0aGUgZWFzaWVzdCB3YXkgSSBjb3VsZCB0aGluayBvZiBmb3IgYWNoaWV2aW5n
IHRoaXMuDQo+ID4gSXQNCj4gPiBjb3VsZCBiZSB0aGF0IHRoZXJlIGlzIGEgYmV0dGVyIHdheSBv
ZiBzb2x2aW5nIHRoaXMuDQo+ID4gDQo+IA0KPiBJIHRlc3RlZCB5b3VyIFNNUCBVLUJvb3Qgc2Vy
aWVzIGluIGJvdGggTS1tb2RlIGFuZCBTLW1vZGUsIHVzaW5nIGEgNA0KPiBjb3JlICd2aXJ0JyB0
YXJnZXQuIFdvcmtzIGZpbmUuIEkgYW0gdXNpbmcgUUVNVSAzLjEuMCBzbyBpdCBpcw0KPiAic2lt
cGxlLWJ1cyIuDQo+IA0KDQpUaGF0IGlzIGFjdHVhbGx5IG15IGZhdWx0LCBpdCBzaG91bGQgbm90
IHdvcmsuDQpXaGF0IGlzIGhhcHBlbmluZyBpcyB0aGF0IFUtQm9vdCBmYWlscyB0byByZWxvY2F0
ZSB0aGUgc2Vjb25kYXJ5IGhhcnRzLA0KYmVjYXVzZSB0aGUgQ0xJTlQgZHJpdmVyIGNhbm5vdCBn
ZXQgdGhlIG1lbW9yeSBhZGRyZXNzIG9mIHRoZSBDTElOVA0KZGV2aWNlLiBUaGlzIGVycm9yIGlz
IGN1cnJlbnRseSBzaWxlbnRseSBpZ25vcmVkLg0KVGhlIHNlY29uZGFyeSBoYXJ0cyBhcmUgc3Rp
bGwgd2FpdGluZyB0byByZWNlaXZlIElQSXMsIHNvIGJvb3RpbmcgTGludXgNCndvcmtzIGZpbmUs
IGJlY2F1c2UgVS1Cb290IGNhbiBub3cgc2VuZCBJUElzLiBUaGlzIHdpbGwgaG93ZXZlciBicmVh
aw0KaWYgVS1Cb290IG92ZXJ3cml0ZXMgdGhlIGNvZGUgdGhlIHNlY29uZGFyeSBoYXJ0cyBhcmUg
cnVubmluZywgd2hpY2gNCmNvdWxkIGhhcHBlbiB3aGVuIGxvYWRpbmcgYW4gaW1hZ2UuDQoNCkkg
d2lsbCB1cGRhdGUgbXkgU01QIFUtQm9vdCBzZXJpZXMgdG8gcHJpbnQgYSB3YXJuaW5nIGlmIHNl
bmRpbmcgYW4gSVBJDQpmYWlscy4NCg0KVGhhbmtzLA0KTHVrYXMNCg==

