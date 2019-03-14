Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4Xeo-00081e-2E
	for mharc-qemu-riscv@gnu.org; Thu, 14 Mar 2019 17:12:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lukas.auer@aisec.fraunhofer.de>) id 1h4Xej-0007vK-ER
	for qemu-riscv@nongnu.org; Thu, 14 Mar 2019 17:12:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lukas.auer@aisec.fraunhofer.de>) id 1h4XTh-0007wg-05
	for qemu-riscv@nongnu.org; Thu, 14 Mar 2019 17:01:28 -0400
Received: from mail-edgeka24.fraunhofer.de ([153.96.1.24]:59277)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lukas.auer@aisec.fraunhofer.de>)
	id 1h4XTg-0007ri-4q; Thu, 14 Mar 2019 17:01:24 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HmAADWv4pc/xwBYJlkHAEBAQQBAQc?=
	=?us-ascii?q?EAQGBVAQBAQsBgg+BaycKhAGIe4pDgg18mS8NhGwCF4Q6IjcGDQEBAwEBCQE?=
	=?us-ascii?q?DAgICaR0LhUwBBSMRRRACAQgYAgImAgICMBUQAgQOBYUXAa0vgS+KM4ELJAG?=
	=?us-ascii?q?LLIFYPoEQAYIUSTWIC4JXA4woKotBjC0DBAICgSORehmLBYhHin+TEIFdI4F?=
	=?us-ascii?q?WcYM7ghYXE44LPwEBMQGPJ4EfAQE?=
X-IPAS-Result: =?us-ascii?q?A2HmAADWv4pc/xwBYJlkHAEBAQQBAQcEAQGBVAQBAQsBg?=
	=?us-ascii?q?g+BaycKhAGIe4pDgg18mS8NhGwCF4Q6IjcGDQEBAwEBCQEDAgICaR0LhUwBB?=
	=?us-ascii?q?SMRRRACAQgYAgImAgICMBUQAgQOBYUXAa0vgS+KM4ELJAGLLIFYPoEQAYIUS?=
	=?us-ascii?q?TWIC4JXA4woKotBjC0DBAICgSORehmLBYhHin+TEIFdI4FWcYM7ghYXE44LP?=
	=?us-ascii?q?wEBMQGPJ4EfAQE?=
X-IronPort-AV: E=Sophos;i="5.58,479,1544482800"; d="scan'208";a="13803404"
Received: from mail-mtaka28.fraunhofer.de ([153.96.1.28])
	by mail-edgeKA24.fraunhofer.de with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Mar 2019 22:01:16 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CvAADWv4pcfRBhWMBkHAEBAQQBAQc?=
	=?us-ascii?q?EAQGBVAQBAQsBg0chEicKhAGIe4xQfJkvDYRsAheEWzcGDQEBAwEBCQEDAhQ?=
	=?us-ascii?q?BARY6JAuFSwEFIxFFEAIBCBgCAiYCAgIwFRACBA4FhRitL4EvijOBCyQBjQQ?=
	=?us-ascii?q?+gRABghRJNYgLglcDjCgqi0GMLQMEAgKBI5F6GYsFiEeKf5MQgV0hgVdxgzu?=
	=?us-ascii?q?CFhcTjgs/AQIwAY8ngR8BAQ?=
X-IronPort-AV: E=Sophos;i="5.58,479,1544482800"; d="scan'208";a="19584776"
Received: from fgdemucivp01ltm.xch.fraunhofer.de (HELO
	FGDEMUCIMP12EXC.ads.fraunhofer.de) ([192.88.97.16])
	by mail-mtaKA28.fraunhofer.de with ESMTP/TLS/AES256-SHA;
	14 Mar 2019 22:01:14 +0100
Received: from FGDEMUCIMP01EXC.ads.fraunhofer.de ([10.80.232.40]) by
	FGDEMUCIMP12EXC.ads.fraunhofer.de ([10.80.232.43]) with mapi id
	14.03.0435.000; Thu, 14 Mar 2019 22:01:14 +0100
From: "Auer, Lukas" <lukas.auer@aisec.fraunhofer.de>
To: "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>
CC: "palmer@sifive.com" <palmer@sifive.com>, "qemu-riscv@nongnu.org"
	<qemu-riscv@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"sagark@eecs.berkeley.edu" <sagark@eecs.berkeley.edu>,
	"Alistair.Francis@wdc.com" <Alistair.Francis@wdc.com>
Thread-Topic: [Qemu-devel] [PATCH] hw/riscv/virt: re-add machine-specific
	compatible string to /soc/ node
Thread-Index: AQHUwX2/pwGZ00zQgE6v+yqcxIgIXaYEJ5sAgADTUQCAABSaAIAAM/MAgAFmzoCAAYTigIAAu5oAgALTm4A=
Date: Thu, 14 Mar 2019 21:01:13 +0000
Message-ID: <9beff9a660f1c3fd1317a52c6d1b7c7ae211a2dd.camel@aisec.fraunhofer.de>
References: <20190210201726.3567-1-lukas.auer@aisec.fraunhofer.de>
	<CAEUhbmUtSAeznt1DCwJ7tS=YFeqwnYBemS6278=QQ60qs_MthA@mail.gmail.com>
	<c9f69861058412a1f71418a9c892daf0821a9e33.camel@aisec.fraunhofer.de>
	<CAEUhbmXjCqRRtNDqq5E5y60sDz+4=WqMuxFhaLndot7TSJuUiQ@mail.gmail.com>
	<e131b4b0eb9109547ce0ed0993665206d6bf983a.camel@aisec.fraunhofer.de>
	<CAEUhbmX=PT-46nqtMqSaGn5xu2tRJ50Sm6kK7b97Xc_Y+6stPw@mail.gmail.com>
	<33758c6945c9b1968247c5b6dfb12418e57e71e0.camel@aisec.fraunhofer.de>
	<CAEUhbmX5ygthHtEoMvRMND3hbmhXrp-ok_hyvAqC+REafNSNbQ@mail.gmail.com>
In-Reply-To: <CAEUhbmX5ygthHtEoMvRMND3hbmhXrp-ok_hyvAqC+REafNSNbQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.80.233.51]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.200.1013-24488.004
x-tm-as-result: No--16.813800-8.000000-31
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5BE6700177C834289CAD27A9A104728@xch.fraunhofer.de>
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
X-List-Received-Date: Thu, 14 Mar 2019 21:12:51 -0000

SGkgQmluLA0KDQpPbiBXZWQsIDIwMTktMDMtMTMgYXQgMDk6NTEgKzA4MDAsIEJpbiBNZW5nIHdy
b3RlOg0KPiBIaSBMdWthcywNCj4gDQo+IE9uIFR1ZSwgTWFyIDEyLCAyMDE5IGF0IDEwOjM5IFBN
IEF1ZXIsIEx1a2FzDQo+IDxsdWthcy5hdWVyQGFpc2VjLmZyYXVuaG9mZXIuZGU+IHdyb3RlOg0K
PiA+IEhpIEJpbiwNCj4gPiANCj4gPiBPbiBNb24sIDIwMTktMDMtMTEgYXQgMjM6MjggKzA4MDAs
IEJpbiBNZW5nIHdyb3RlOg0KPiA+ID4gSGkgTHVrYXMsDQo+ID4gPiANCj4gPiA+IE9uIE1vbiwg
TWFyIDExLCAyMDE5IGF0IDI6MDMgQU0gQXVlciwgTHVrYXMNCj4gPiA+IDxsdWthcy5hdWVyQGFp
c2VjLmZyYXVuaG9mZXIuZGU+IHdyb3RlOg0KPiA+ID4gPiBIaSBCaW4sDQo+ID4gPiA+IA0KPiA+
ID4gPiBPbiBTdW4sIDIwMTktMDMtMTAgYXQgMjI6NTcgKzA4MDAsIEJpbiBNZW5nIHdyb3RlOg0K
PiA+ID4gPiA+IEhpIEx1a2FzLA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IE9uIFN1biwgTWFyIDEw
LCAyMDE5IGF0IDk6NDQgUE0gQXVlciwgTHVrYXMNCj4gPiA+ID4gPiA8bHVrYXMuYXVlckBhaXNl
Yy5mcmF1bmhvZmVyLmRlPiB3cm90ZToNCj4gPiA+ID4gPiA+IEhpIEJpbiwNCj4gPiA+ID4gPiA+
IA0KPiA+ID4gPiA+ID4gT24gU3VuLCAyMDE5LTAzLTEwIGF0IDA5OjA3ICswODAwLCBCaW4gTWVu
ZyB3cm90ZToNCj4gPiA+ID4gPiA+ID4gSGkgTHVrYXMsDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4g
PiA+ID4gPiBPbiBNb24sIEZlYiAxMSwgMjAxOSBhdCA2OjEzIEFNIEx1a2FzIEF1ZXINCj4gPiA+
ID4gPiA+ID4gPGx1a2FzLmF1ZXJAYWlzZWMuZnJhdW5ob2Zlci5kZT4gd3JvdGU6DQo+ID4gPiA+
ID4gPiA+ID4gUmUtYWRkIHRoZSBwcmV2aW91cyBjb21wYXRpYmxlIHN0cmluZyAicmlzY3Ytdmly
dGlvLQ0KPiA+ID4gPiA+ID4gPiA+IHNvYyIgdG8NCj4gPiA+ID4gPiA+ID4gPiB0aGUNCj4gPiA+
ID4gPiA+ID4gPiBzb2MNCj4gPiA+ID4gPiA+ID4gPiBkZXZpY2UgdHJlZSBub2RlIHRvIGFsbG93
IFUtQm9vdCBhbmQgTGludXggdG8gYmluZA0KPiA+ID4gPiA+ID4gPiA+IG1hY2hpbmUtDQo+ID4g
PiA+ID4gPiA+ID4gc3BlY2lmaWMNCj4gPiA+ID4gPiA+ID4gPiBkcml2ZXJzIHRvIGl0LiBUaGUg
Y3VycmVudCBjb21wYXRpYmxlIHN0cmluZyAic2ltcGxlLQ0KPiA+ID4gPiA+ID4gPiA+IGJ1cyIN
Cj4gPiA+ID4gPiA+ID4gPiBpcw0KPiA+ID4gPiA+ID4gPiA+IHJldGFpbmVkLg0KPiA+ID4gPiA+
ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+IFRoaXMgaXMgcmVxdWlyZWQgYnkgVS1Cb290IHRvIGJp
bmQgZGV2aWNlcyBlYXJseSwgYXMNCj4gPiA+ID4gPiA+ID4gPiBwYXJ0DQo+ID4gPiA+ID4gPiA+
ID4gb2YNCj4gPiA+ID4gPiA+ID4gPiB0aGUNCj4gPiA+ID4gPiA+ID4gPiBwcmUtcmVsb2NhdGlv
biBkcml2ZXIgbW9kZWwuDQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4g
PiA+ID4gPiBJIHNlZSBubyBwcm9ibGVtIHdpdGggVS1Cb290IHdvcmtpbmcgd2l0aCBjdXJyZW50
DQo+ID4gPiA+ID4gPiA+IGNvbXBhdGlibGUNCj4gPiA+ID4gPiA+ID4gc3RyaW5nDQo+ID4gPiA+
ID4gPiA+ICJzaW1wbGUtYnVzIi4gSW4gZmFjdCBJIGhhZCBwbGFubmVkIHRvIHJlbW92ZSB0aGUN
Cj4gPiA+ID4gPiA+ID4gY29tcGF0aWJsZQ0KPiA+ID4gPiA+ID4gPiBzdHJpbmcNCj4gPiA+ID4g
PiA+ID4gInJpc2N2LXZpcnRpby1zb2MiIGluIFUtQm9vdCBidXQgZGlkIG5vdCBnZXQgdGltZSB0
byB3b3JrDQo+ID4gPiA+ID4gPiA+IG9uDQo+ID4gPiA+ID4gPiA+IGl0Lg0KPiA+ID4gPiA+ID4g
PiANCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gSXQgaXMgb25seSByZXF1aXJlZCBpZiBVLUJv
b3QgaXMgcnVubmluZyBpbiBtYWNoaW5lLW1vZGUuDQo+ID4gPiA+ID4gPiBGb3INCj4gPiA+ID4g
PiA+IHJlbG9jYXRpb24gaXQgbmVlZHMgdG8gdXNlIHRoZSBDTElOVCBkcml2ZXIgdG8gc2VuZA0K
PiA+ID4gPiA+ID4gYXBwcm9wcmlhdGUNCj4gPiA+ID4gPiA+IElQSXMgdG8NCj4gPiA+ID4gPiA+
IHRoZSBvdGhlciBoYXJ0cy4gVG8gYmUgYWJsZSB0byBwcm9iZSB0aGUgZHJpdmVyLCB0aGUgZGV2
aWNlDQo+ID4gPiA+ID4gPiBhbmQNCj4gPiA+ID4gPiA+IGl0cw0KPiA+ID4gPiA+ID4gcGFyZW50
IGRldmljZSB0cmVlIG5vZGUgKHNvYykgbXVzdCB0aGVyZWZvcmUgYmUgYXZhaWxhYmxlDQo+ID4g
PiA+ID4gPiBpbg0KPiA+ID4gPiA+ID4gdGhlDQo+ID4gPiA+ID4gPiBwcmUtDQo+ID4gPiA+ID4g
PiByZWxvY2F0aW9uIGRldmljZSBtb2RlbC4NCj4gPiA+ID4gPiA+IFRoaXMgcGF0Y2ggd2FzIHRo
ZSBlYXNpZXN0IHdheSBJIGNvdWxkIHRoaW5rIG9mIGZvcg0KPiA+ID4gPiA+ID4gYWNoaWV2aW5n
DQo+ID4gPiA+ID4gPiB0aGlzLg0KPiA+ID4gPiA+ID4gSXQNCj4gPiA+ID4gPiA+IGNvdWxkIGJl
IHRoYXQgdGhlcmUgaXMgYSBiZXR0ZXIgd2F5IG9mIHNvbHZpbmcgdGhpcy4NCj4gPiA+ID4gPiA+
IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEkgdGVzdGVkIHlvdXIgU01QIFUtQm9vdCBzZXJpZXMg
aW4gYm90aCBNLW1vZGUgYW5kIFMtbW9kZSwNCj4gPiA+ID4gPiB1c2luZw0KPiA+ID4gPiA+IGEg
NA0KPiA+ID4gPiA+IGNvcmUgJ3ZpcnQnIHRhcmdldC4gV29ya3MgZmluZS4gSSBhbSB1c2luZyBR
RU1VIDMuMS4wIHNvIGl0DQo+ID4gPiA+ID4gaXMNCj4gPiA+ID4gPiAic2ltcGxlLWJ1cyIuDQo+
ID4gPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGF0IGlzIGFjdHVhbGx5IG15IGZhdWx0LCBp
dCBzaG91bGQgbm90IHdvcmsuDQo+ID4gPiA+IFdoYXQgaXMgaGFwcGVuaW5nIGlzIHRoYXQgVS1C
b290IGZhaWxzIHRvIHJlbG9jYXRlIHRoZQ0KPiA+ID4gPiBzZWNvbmRhcnkNCj4gPiA+ID4gaGFy
dHMsDQo+ID4gPiA+IGJlY2F1c2UgdGhlIENMSU5UIGRyaXZlciBjYW5ub3QgZ2V0IHRoZSBtZW1v
cnkgYWRkcmVzcyBvZiB0aGUNCj4gPiA+ID4gQ0xJTlQNCj4gPiA+ID4gZGV2aWNlLiBUaGlzIGVy
cm9yIGlzIGN1cnJlbnRseSBzaWxlbnRseSBpZ25vcmVkLg0KPiA+ID4gDQo+ID4gPiBJIHN0aWxs
IGRvbid0IHVuZGVyc3RhbmQuIFdoeSBkb2VzIHRoZSBDTElOVCBkcml2ZXIgZmFpbCB0byBnZXQN
Cj4gPiA+IHRoZQ0KPiA+ID4gbWVtb3J5IGFkZHJlc3M/IFUtQm9vdCBoYXMgYmVlbiBzdXBwb3J0
aW5nICJzaW1waWxlLWJ1cyIgZm9yIGENCj4gPiA+IGxvbmcNCj4gPiA+IHRpbWUuIEl0IHdhcyBi
ZWNhdXNlIFFFTVUgMy4wLjAgZ2VuZXJhdGVkIHRoZSAvc29jIG5vZGUgd2l0aA0KPiA+ID4gInJp
c2N2LXZpcnRpby1zb2MiIGNvbXBhdGlibGUgc3RyaW5nLCBVLUJvb3Qgd2FzIHRhdWdodCB0byB0
cmVhdA0KPiA+ID4gc3VjaA0KPiA+ID4gY29tcGF0aWJsZSBzdHJpbmcgYXMgYSAic2ltcGxlLWJ1
cyIgdG9vICh0aGF0IHdhcyB0aGUgVS1Cb290DQo+ID4gPiBjb21taXQNCj4gPiA+IDI3ZGMyYzEz
MGUyOSkNCj4gPiANCj4gPiBUaGF0J3MgY29ycmVjdC4gVGhlIHByb2JsZW0gd2l0aCB0aGUgZGVm
YXVsdCBzaW1wbGUtYnVzIFUtQm9vdA0KPiA+IGRyaXZlcg0KPiA+IGlzIHRoYXQgaXQgZG9lcyBu
b3QgaGF2ZSB0aGUgRE1fRkxBR19QUkVfUkVMT0MgZmxhZyBzZXQuIFRoZSAvc29jDQo+ID4gYW5k
DQo+ID4gL3NvYy9jbGludCBub2RlcyBhcmUgdGhlcmVmb3JlIG5vdCBhdmFpbGFibGUgYmVmb3Jl
IHJlbG9jYXRpb24sDQo+ID4gbWVhbmluZw0KPiA+IHRoYXQgSVBJcyBjYW5ub3QgYmUgc2VudCB0
byByZWxvY2F0ZSB0aGUgc2Vjb25kYXJ5IGhhcnRzLg0KPiA+IA0KPiANCj4gVGhhbmtzIGZvciB0
aGUgY2xhcmlmaWNhdGlvbnMuIE5vdyBJIHNlZSB0aGUgcHJvYmxlbS4gQnV0IEkgdGhpbmsgd2UN
Cj4gc2hvdWxkIGZpeCBVLUJvb3QgInNpbXBsZS1idXMiIGRyaXZlciBpbnN0ZWFkLiBBcyBzZWVu
IG9uIEZVNTQwIG9yDQo+IGxpa2VseSBvdGhlciBoYXJkd2FyZSwgUUVNVSBnZW5lcmF0ZXMgdGhl
ICJzaW1wbGUtYnVzIiBjb21wYXRpYmxlDQo+IHN0cmluZyBmb3IgdGhlIC9zb2Mgbm9kZSwgYXMg
d2VsbCBhcyB0aGUgRFQgcHJvdmlkZWQgYnkgdGhlIGhhcmR3YXJlLg0KPiANCg0KVGhhdCBtYWtl
cyBzZW5zZSwgSSBjYW4gc2VuZCBhIHBhdGNoIHRvIHNldCB0aGUgRE1fRkxBR19QUkVfUkVMT0Mg
ZmxhZw0KaW4gdGhlIHNpbXBsZS1idXMgVS1Cb290IGRyaXZlci4gSSB0aGluayBpdCdzIGJlc3Qg
dG8gc2VuZCBpdA0Kc2VwYXJhdGVseSBmcm9tIHRoZSBTTVAgcGF0Y2ggc2VyaWVzLCBzaW5jZSBp
dCBjb3VsZCBhZmZlY3Qgb3RoZXINCmJvYXJkcyBhbmQgaXQncyBhIGJpdCBsYXRlIGluIHRoZSBy
ZWxlYXNlIGN5Y2xlLiBXaGF0IGRvIHlvdSB0aGluaz8NCg0KVGhpcyBwYXRjaCBjYW4gYmUgZHJv
cHBlZCB0aGVuLg0KDQpUaGFua3MsDQpMdWthcw0K

