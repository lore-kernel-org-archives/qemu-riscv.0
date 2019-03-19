Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6Dvg-0004Ry-9Z
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 08:33:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lukas.auer@aisec.fraunhofer.de>) id 1h6Dvd-0004R5-Rp
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:33:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lukas.auer@aisec.fraunhofer.de>) id 1h6Dva-0001Aq-Jt
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:33:13 -0400
Received: from mail-edgeka27.fraunhofer.de ([153.96.1.27]:54163)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lukas.auer@aisec.fraunhofer.de>)
	id 1h6DvX-0000zX-91; Tue, 19 Mar 2019 08:33:08 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EoAAAo4ZBc/xoBYJljHAEBAQQBAQc?=
	=?us-ascii?q?EAQGBUQcBAQsBghCBWRInCoQBiBxfikuCDZgygXsNhGwCF4RVIjQJDQEBAwE?=
	=?us-ascii?q?BCQEDAgICaR0LhUwBBSMEDUUQAgEIGAICJgICAjAVEAIEDgWFFwGpQ3wzij6?=
	=?us-ascii?q?BCyQBizCBWD6BEYMShEpOgnOCVwOMNiqYCQMEAgKBJJIGGYsOiFCLDJMrgUc?=
	=?us-ascii?q?5gVZxgzuCFhcTjgs/AQExAYdngS6BHwEB?=
X-IPAS-Result: =?us-ascii?q?A2EoAAAo4ZBc/xoBYJljHAEBAQQBAQcEAQGBUQcBAQsBg?=
	=?us-ascii?q?hCBWRInCoQBiBxfikuCDZgygXsNhGwCF4RVIjQJDQEBAwEBCQEDAgICaR0Lh?=
	=?us-ascii?q?UwBBSMEDUUQAgEIGAICJgICAjAVEAIEDgWFFwGpQ3wzij6BCyQBizCBWD6BE?=
	=?us-ascii?q?YMShEpOgnOCVwOMNiqYCQMEAgKBJJIGGYsOiFCLDJMrgUc5gVZxgzuCFhcTj?=
	=?us-ascii?q?gs/AQExAYdngS6BHwEB?=
X-IronPort-AV: E=Sophos;i="5.58,497,1544482800"; d="scan'208";a="14022894"
Received: from mail-mtaka26.fraunhofer.de ([153.96.1.26])
	by mail-edgeKA27.fraunhofer.de with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Mar 2019 13:32:58 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AkAABr4JBcfRBhWMBjHAEBAQQBAQc?=
	=?us-ascii?q?EAQGBUQcBAQsBg0ghEicKhAGIHF+MWJgygXsNhGwCF4R2NAkNAQEDAQEJAQM?=
	=?us-ascii?q?CFAEBFjokC4VLAQIDIwQNRRACAQgYAgImAgICMBUQAgQOBYUYqUN8M4o+gQs?=
	=?us-ascii?q?kAY0IPoERgxKESk6Cc4JXA4w2KpgJAwQCAoEkkgYZiw6IUIsMkyuBRzeBV3G?=
	=?us-ascii?q?DO4IWFxOOCz8BAjABh2eBLoEfAQE?=
X-IronPort-AV: E=Sophos;i="5.58,497,1544482800"; d="scan'208";a="36108341"
Received: from fgdemucivp01ltm.xch.fraunhofer.de (HELO
	FGDEMUCIMP12EXC.ads.fraunhofer.de) ([192.88.97.16])
	by mail-mtaKA26.fraunhofer.de with ESMTP/TLS/AES256-SHA;
	19 Mar 2019 13:32:56 +0100
Received: from FGDEMUCIMP01EXC.ads.fraunhofer.de ([10.80.232.40]) by
	FGDEMUCIMP12EXC.ads.fraunhofer.de ([10.80.232.43]) with mapi id
	14.03.0435.000; Tue, 19 Mar 2019 13:32:56 +0100
From: "Auer, Lukas" <lukas.auer@aisec.fraunhofer.de>
To: "palmer@sifive.com" <palmer@sifive.com>
CC: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "kbastian@mail.uni-paderborn.de"
	<kbastian@mail.uni-paderborn.de>, "mjc@sifive.com" <mjc@sifive.com>,
	"Alistair.Francis@wdc.com" <Alistair.Francis@wdc.com>,
	"sagark@eecs.berkeley.edu" <sagark@eecs.berkeley.edu>
Thread-Topic: [PATCH] hw/riscv/virt: re-add machine-specific compatible
	string to /soc/ node
Thread-Index: AQHUwX2/pwGZ00zQgE6v+yqcxIgIXaYTCC2AgAAD0wA=
Date: Tue, 19 Mar 2019 12:32:55 +0000
Message-ID: <b188551e95989a7875454c89bd8a09ce5327007d.camel@aisec.fraunhofer.de>
References: <mhng-b12b115d-057e-4fe4-a5df-9387d86c2e02@palmer-si-x1c4>
In-Reply-To: <mhng-b12b115d-057e-4fe4-a5df-9387d86c2e02@palmer-si-x1c4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.80.233.50]
x-tm-as-product-ver: SMEX-11.0.0.4179-8.200.1013-24498.001
x-tm-as-result: No--16.985300-8.000000-31
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
Content-Type: text/plain; charset="utf-8"
Content-ID: <03223F6EF896AE4B947BAD74BE690EEA@xch.fraunhofer.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 153.96.1.27
Subject: Re: [Qemu-riscv] [PATCH] hw/riscv/virt: re-add machine-specific
 compatible string to /soc/ node
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
X-List-Received-Date: Tue, 19 Mar 2019 12:33:14 -0000

T24gVHVlLCAyMDE5LTAzLTE5IGF0IDA1OjE5IC0wNzAwLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToN
Cj4gT24gU3VuLCAxMCBGZWIgMjAxOSAxMjoxNzoyNiBQU1QgKC0wODAwKSwgDQo+IGx1a2FzLmF1
ZXJAYWlzZWMuZnJhdW5ob2Zlci5kZSB3cm90ZToNCj4gPiBSZS1hZGQgdGhlIHByZXZpb3VzIGNv
bXBhdGlibGUgc3RyaW5nICJyaXNjdi12aXJ0aW8tc29jIiB0byB0aGUgc29jDQo+ID4gZGV2aWNl
IHRyZWUgbm9kZSB0byBhbGxvdyBVLUJvb3QgYW5kIExpbnV4IHRvIGJpbmQgbWFjaGluZS1zcGVj
aWZpYw0KPiA+IGRyaXZlcnMgdG8gaXQuIFRoZSBjdXJyZW50IGNvbXBhdGlibGUgc3RyaW5nICJz
aW1wbGUtYnVzIiBpcw0KPiA+IHJldGFpbmVkLg0KPiA+IA0KPiA+IFRoaXMgaXMgcmVxdWlyZWQg
YnkgVS1Cb290IHRvIGJpbmQgZGV2aWNlcyBlYXJseSwgYXMgcGFydCBvZiB0aGUNCj4gPiBwcmUt
cmVsb2NhdGlvbiBkcml2ZXIgbW9kZWwuDQo+ID4gDQo+ID4gRml4ZXM6IDUzZjU0NTA4ZGFlNigi
aHcvcmlzY3YvdmlydGlvOiBTZXQgdGhlIHNvYyBkZXZpY2UgdHJlZSBub2RlDQo+ID4gYXMgYQ0K
PiA+IHNpbXBsZS1idXMiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEx1a2FzIEF1ZXIgPGx1a2FzLmF1
ZXJAYWlzZWMuZnJhdW5ob2Zlci5kZT4NCj4gDQo+IEkgc3RpbGwgaGFkIHRoaXMgYXQgdGhlIHRv
cCBvZiBteSBwYXRjaCBxdWV1ZSwgYnV0IGZyb20gbG9va2luZyBhdA0KPiB0aGUgdGhyZWFkIA0K
PiBpdCBhcHBlYXJzIHRoZSByZXNvbHV0aW9uIGhlcmUgaXMgdG8gZHJvcCB0aGlzIGluIGZhdm9y
IG9mIGdlbmVyaWMNCj4gc3VwcG9ydC4gIA0KPiBMTUsgaWYgSSBtaXNzZWQgc29tZXRoaW5nLg0K
DQpZZXMsIHlvdSBhcmUgcmlnaHQuIFdlIGFyZSBnb2luZyB0byBmaXggdGhpcyBmcm9tIHRoZSBV
LUJvb3Qgc2lkZSwgc28NCnRoaXMgcGF0Y2ggY2FuIGJlIGRyb3BwZWQuDQoNClRoYW5rcywNCkx1
a2FzDQoNCj4gDQo+ID4gLS0tDQo+ID4gDQo+ID4gIGh3L3Jpc2N2L3ZpcnQuYyB8IDMgKystDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiAN
Cj4gPiBkaWZmIC0tZ2l0IGEvaHcvcmlzY3YvdmlydC5jIGIvaHcvcmlzY3YvdmlydC5jDQo+ID4g
aW5kZXggM2U4YjE5YzY2OC4uYzUzYmI5MDVmZiAxMDA2NDQNCj4gPiAtLS0gYS9ody9yaXNjdi92
aXJ0LmMNCj4gPiArKysgYi9ody9yaXNjdi92aXJ0LmMNCj4gPiBAQCAtMTU3LDYgKzE1Nyw3IEBA
IHN0YXRpYyB2b2lkICpjcmVhdGVfZmR0KFJJU0NWVmlydFN0YXRlICpzLA0KPiA+IGNvbnN0IHN0
cnVjdCBNZW1tYXBFbnRyeSAqbWVtbWFwLA0KPiA+ICAgICAgY2hhciAqbm9kZW5hbWU7DQo+ID4g
ICAgICB1aW50MzJfdCBwbGljX3BoYW5kbGUsIHBoYW5kbGUgPSAxOw0KPiA+ICAgICAgaW50IGk7
DQo+ID4gKyAgICBjb25zdCBjaGFyIHNvY19jb21wYXRbXSA9ICJyaXNjdi12aXJ0aW8tc29jXDBz
aW1wbGUtYnVzIjsNCj4gPiANCj4gPiAgICAgIGZkdCA9IHMtPmZkdCA9IGNyZWF0ZV9kZXZpY2Vf
dHJlZSgmcy0+ZmR0X3NpemUpOw0KPiA+ICAgICAgaWYgKCFmZHQpIHsNCj4gPiBAQCAtMTcxLDcg
KzE3Miw3IEBAIHN0YXRpYyB2b2lkICpjcmVhdGVfZmR0KFJJU0NWVmlydFN0YXRlICpzLA0KPiA+
IGNvbnN0IHN0cnVjdCBNZW1tYXBFbnRyeSAqbWVtbWFwLA0KPiA+IA0KPiA+ICAgICAgcWVtdV9m
ZHRfYWRkX3N1Ym5vZGUoZmR0LCAiL3NvYyIpOw0KPiA+ICAgICAgcWVtdV9mZHRfc2V0cHJvcChm
ZHQsICIvc29jIiwgInJhbmdlcyIsIE5VTEwsIDApOw0KPiA+IC0gICAgcWVtdV9mZHRfc2V0cHJv
cF9zdHJpbmcoZmR0LCAiL3NvYyIsICJjb21wYXRpYmxlIiwgInNpbXBsZS0NCj4gPiBidXMiKTsN
Cj4gPiArICAgIHFlbXVfZmR0X3NldHByb3AoZmR0LCAiL3NvYyIsICJjb21wYXRpYmxlIiwgc29j
X2NvbXBhdCwNCj4gPiBzaXplb2Yoc29jX2NvbXBhdCkpOw0KPiA+ICAgICAgcWVtdV9mZHRfc2V0
cHJvcF9jZWxsKGZkdCwgIi9zb2MiLCAiI3NpemUtY2VsbHMiLCAweDIpOw0KPiA+ICAgICAgcWVt
dV9mZHRfc2V0cHJvcF9jZWxsKGZkdCwgIi9zb2MiLCAiI2FkZHJlc3MtY2VsbHMiLCAweDIpOw0K

