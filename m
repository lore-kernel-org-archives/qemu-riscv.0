Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p3PcS-0004lM-Fy
	for mharc-qemu-riscv@gnu.org; Thu, 08 Dec 2022 17:43:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=33486e341=wilfred.mallawa@wdc.com>)
 id 1p3PcP-0004ks-15; Thu, 08 Dec 2022 17:43:53 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=33486e341=wilfred.mallawa@wdc.com>)
 id 1p3PcH-00033k-KA; Thu, 08 Dec 2022 17:43:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1670539425; x=1702075425;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ED7wgTvtyOpQouK27K0ummL507Xt8dd3PZ6+54VNryw=;
 b=FhR6oBNQkveDvSAzqhKctLvWlJlYeSQsNu00hBbf7ia/l+uQPEZaIDTS
 USLaQpVYIsM2kIatKVf4x+QHLZhVOvEwg1GE335VaDdhyDCOUBQZssYer
 38GTNFd0GumVap3P/K2Wck/89g8MtASlhptrl3f4hvs49PjYBCKyJUumG
 Gp5+5Nupavk543LC4z1SiuZwKe8uJz10A4iFVUVSI/jo8q4ByZUOTvdHb
 HECxRgU8WMrdgMXk39Yw6ONeYB0XXQHgqDTcD54pTnTSPwdQ+5jZWuGPW
 cIhLokBDx/cBBLTxWe3AoPKyvy0ChcilplmEKT6fu9w5xZ6t8SXU1AVth g==;
X-IronPort-AV: E=Sophos;i="5.96,228,1665417600"; d="scan'208";a="322590965"
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hgst.iphmx.com with ESMTP; 09 Dec 2022 06:43:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmtmJFGC1t5HJRClX18VKZ041CSMPi6Zd07kbuFCS1+7YsKLSBb3M5UHELvxpbUMHZVrraz8Lu8EoDlGzYgyL9o96leQJepZS25LtCmia5qH1cWE4ByIxriDLRuNFp1S0m2nKLQotvGACHkIGKO9AKP0ojpHgLPqO3K58GEfMk/BT8/mVurQ4l2Kt7abzP5tGcEr3A+o+oOX898o0HAwuvHbm+mkYwPrNqmnxIMrxwKJmvrrIcwczyyDDcDqD+uhw+AVYs28+hRHBK3r3WSAW24UL7UI39ZZo0f3ZkAYbFPHt46AZWZEbo8ib9kzFzCWY67OkChp0gAuRKCj3o8z5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ED7wgTvtyOpQouK27K0ummL507Xt8dd3PZ6+54VNryw=;
 b=jUf9X14R+mFjN7HvvRV9BalCLy2mL2Y8pMl7vjpqZ90PPstpqWg5G3q9dVRYe2POWArW1VOXZZ/uoD530jpxaPrrvvBE8JxxjCLPRGXdypFwW6+yR/h7lRQwPM+CyYSI2XO7OBHLnY9/tJwsNkz6XN6jY2W5SprzoLKwPjvTD6w4FBw624S6PgqKye83P8XVzGzV0tbz+eDmCDlNAryp8dejPshjV+cWxZVECPvmbJgWEvUB7cjQGdJM/HAbcp7krCUv9eic6bcxHVmDzaK46nfiQ7ads1Eq7jNyFvfzEEP+XADEHbw0AMOQZ3k0mqeuiGW+BuhL2eiOSjKAKYUkuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ED7wgTvtyOpQouK27K0ummL507Xt8dd3PZ6+54VNryw=;
 b=xM3ygnBNXgmbnPeYoxhrIzJQ2LKeEgchGIdkK9nRGK3bJFnBVVznZK5XH9GoVXB+kH9Ct2Q9QpnNB0w/KmJEAlZ3JLyfbKdkOBj9gfwtGWhlop3gvaKOfoP+mkmW8J4hHOI+2Rpz+KmEIfetbFynDsTepFSbei7TZiy4krZ+KYA=
Received: from CY4PR04MB0359.namprd04.prod.outlook.com (2603:10b6:903:b3::19)
 by MWHPR04MB1088.namprd04.prod.outlook.com (2603:10b6:301:3f::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 22:43:31 +0000
Received: from CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255]) by CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255%6]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 22:43:30 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "bmeng@tinylab.org" <bmeng@tinylab.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "bin.meng@windriver.com" <bin.meng@windriver.com>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH 1/2] target/riscv: Simplify helper_sret() a little bit
Thread-Topic: [PATCH 1/2] target/riscv: Simplify helper_sret() a little bit
Thread-Index: AQHZChqpaKfvCNPr9U658AR9OP4TH65kmMIA
Date: Thu, 8 Dec 2022 22:43:30 +0000
Message-ID: <791571c04e8bfe1608a18ef8d191c1568f3eabe9.camel@wdc.com>
References: <20221207090037.281452-1-bmeng@tinylab.org>
In-Reply-To: <20221207090037.281452-1-bmeng@tinylab.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR04MB0359:EE_|MWHPR04MB1088:EE_
x-ms-office365-filtering-correlation-id: f28633ee-774f-41dc-89db-08dad96da14c
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oaORionwr8Xt8m/Hmt41ps6dIoEgnANfJoGZrUIG/27CTJIFB/OCLxVIv6LezX0wbUHNrP71ZQJF+FHSUMl9473vBcI+VDeR1vdTUrbuYw960VtJ+cyi0or4HUIbTwZKnTSHM/mYyOxNzwROxgtPCc8SMNyOKon6oB4MuL52lX67wSSDXvKqAle+24FUx7And8qRbYq3rktMafBvb8DwAgULuAPvIwlH3mOXIHUDrcHoxH8Ug9yU6fSqaSS2Mu9GiyuMjLjoN7jD095icDQ6UcdNZXnYPQSvZBPmDcXC1iN4duzQyYLCz23GmkiXqo3UEa8KeO8oA85SZjCtwTryk3c9C/tdJToJNq2/duutK/bry3zbCbeVq/T1KhW3MAv3WOkeeenglDioR9TK30Ugoq5nnVdholqdm9LD5qELjKN63/HYCGCXCsuOcomQBzcW3iOHF0WKfKTFfnpVfedZB9djqxoHDXPE5HslD4Ro3xAfj/Ekl6g9F1DZ+yIO0YzOo7p+AMmlWmSRz9/fGArPuO9njTA/HSJyR+yOVKWconEC9x2LO2j6XyMP68iybOUbguYl3JqEc+auGUV6FNJ+flaum5zuxgaIdG9vDv7sEw4xoQR1umjxgfvD+RD9r5tvzh4g2R1UWvgrC/mugU0LTFGaMHfgv6pnvbJs2tDofvlP2ODOTUJJZpFPRJ1LOyIbalO9mvq7qhTmti+UK/ogZg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB0359.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(366004)(136003)(451199015)(38070700005)(6486002)(6512007)(71200400001)(86362001)(6506007)(26005)(82960400001)(66476007)(8936002)(66446008)(2906002)(110136005)(54906003)(316002)(122000001)(38100700002)(41300700001)(36756003)(186003)(66946007)(66556008)(2616005)(8676002)(4326008)(478600001)(44832011)(64756008)(83380400001)(76116006)(91956017)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2VZUm9sR25KODA0akNrS3BkVE5jVUJXUjBtRGpkcmczS0dCcThqcklPNGxG?=
 =?utf-8?B?QnhQa2EzeXZmb3dSL3dqRUE0Rm1vam96bXRidzBPREI2QVdoRnp1ZEpyWlpU?=
 =?utf-8?B?T082T1duOUxBbC9Sci96azRWeXRpRms0WVh6VHZwZGh6UThEckRSVFBZZldW?=
 =?utf-8?B?K0h3SE1wdEx1Z2Fnemd5a2w4UFVCeUVnV0JHYXlpTFlMbVZtcG9XOU5CVm82?=
 =?utf-8?B?aytDSTlLaE90eVNuUEM1cUt0TzlFekZjbU5OaFhBSDhZeGYvQzBCYlRyd05F?=
 =?utf-8?B?VWROdDhONTZNV09JajNYSnRDa1ZDZENUVUZTRHpDRjErancxTDh1ckV4V3ZW?=
 =?utf-8?B?MUVoZ29kRENQYURxb0hhQXYvZ0RDbittVDN0QXNLSldkQ0EwckRxZWxMdCtV?=
 =?utf-8?B?aHl3WkNhQjZVNkMvemk0OVZKdmNBV2thKytFTjA5cHMxbnAvMGdUMktjWmdR?=
 =?utf-8?B?K0V4VEtJT0IzSmduaXdsV1pOTVJ6cDhnY0o3Qkx2RkVVMy9ieEN4NUpleDBQ?=
 =?utf-8?B?UjFOT0JEUjUrRmVvS1hWZlZaOXlxejZGMTFTNzdZNkpSN3VHUVdDZGhCelpr?=
 =?utf-8?B?UUo5K0hwb0I0bExJWWgyTkxUb1Q3WEV4ZjgrUjVEdlN6NkRXNVNyaUtFQkRU?=
 =?utf-8?B?Y2cxT2p1SW1tbGg5MnVDUHBwbVhaekt5ajRQdUZDQlk4UEQ4a29wN3gvNzFh?=
 =?utf-8?B?S3k3MGJ2QmRJTnRZOUM2WmNDNUN3Vy9NZG9GMGQvbDIveHRVcmlwbXptZzFW?=
 =?utf-8?B?dWRJYVVmUWZ6NHB3Z1NIRVcxcVUrZ1FtcCtyMUhVSUFyTS9kVlZ2MEc1YktL?=
 =?utf-8?B?WlB4UnRIY1ZYbEVUVWJkU0R4aG41cEQvRkpPUzBQOGxCOUFRSnBseEwwQ3hV?=
 =?utf-8?B?U1BzSzdQcjZrVWpmYXJQd3NhcERid2dmTkpxYUV0S2ZZcW1TNjAwc25XT2tO?=
 =?utf-8?B?NnFxa29mS3RPOVNxTG14c3UwdUh2WSsxVFhhbHJHOHZ2ZFZhRGYxZWNRN24x?=
 =?utf-8?B?YzNRZnVKUklHajNiNUdJbEtHajZUS1lzUVBjRmt5cTBaK1M3c1VsWTZXSDJy?=
 =?utf-8?B?M0ZBTW0zMTRjMStOSGdaRGNlRndGMm1MTHBiTlpsckdwTXlsK2EvblBVb2VG?=
 =?utf-8?B?c01HZFh6WXhuUjRuM3hid0hLZXJSTkJ4Zzh3V2RDQlFJbDhIdmFUcmI4aFJQ?=
 =?utf-8?B?Y0hUbGpPS29wL1RoU0VTLzNRcWJtcVJqTDBoSThhY1BobzU3V2tjVWpRTGxU?=
 =?utf-8?B?VTM4eHVDSVlZNUprRDJ3c3BwVU9XMUpIemc1Q3VkU2p0SnpMU0xPTG4xT2xU?=
 =?utf-8?B?QkJwdms3cnhvK0JlbWJNY1BnNVVIMGVmcDF3cFFLTDlabFRPY1lka2V4Y0dn?=
 =?utf-8?B?V3pXUmpJUy9QNU92OENDckNkY0pPaUF5cVp2Y1hpTzBYbnNycHB6TGFHeFph?=
 =?utf-8?B?UW83SXdIRkZ4RnpQTWprY09hSThFRXVWV1poVi9LZ2hKbHN4Mk42a2lNa3NB?=
 =?utf-8?B?SXVVekdSbG40Nlh0M0tVdlBFOU4vWVhaYk13ZGVzWjBiV21zY0thVFJZSnk1?=
 =?utf-8?B?dXpHbU9IdzMwUHJPajZGUjlzQVl1b2MwZ0huTkoxSTE2MldKWTR2c2UrNnhq?=
 =?utf-8?B?UDJQV3JrdUhPT09OR1JYYjA1dkxNQjBDb2RsdGFqZ2FBVXZ5QURjeUFoNlpG?=
 =?utf-8?B?Rk9XRmVwNHZqUld1YVlqOTEwUGMyNGpZUXdKb1FFNTJoaGZyQmF6a1R0VW9t?=
 =?utf-8?B?WGRIOWc0aysvdkFxL3BhRmJSU0lFMlJXQWpwclYza1A4TG0yempmUlpKejF1?=
 =?utf-8?B?MnhEWDNuT0FGSERJVFlMV0pJZi8xRjFIUG5DNlBSdkI5R0kzTVdOY1BucW1w?=
 =?utf-8?B?SWdjMFlBdFlEMWxkS1BveDlSaEVmUEwvMzVOSG95QWJackpPdjAyT2lDNjFv?=
 =?utf-8?B?aFNIRFZzYmIrcXFuREZBOHZQemVkUmhmMzlVcEZaem9yanJGR3plOFFiUjlm?=
 =?utf-8?B?YVhWeTMxMXpPQXdYU1dhajUrTUE3cWpUZ2pxd3hKd3g2S1VDbnVkYVJVMFZl?=
 =?utf-8?B?QUt1a1BvVy95aFo4MEh6ajh4SUNyZlBBbGFqUzdSenhJOWJ6eFdUVUNCcW5M?=
 =?utf-8?B?cEl3RW85a0hhZWJGbDBhL0lRNFhvdzgrSzlIeDlJODVhOE1xZXhTOXFXOTE1?=
 =?utf-8?B?Zmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <06056C2D59ED5B4E95B0D3B53494876F@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB0359.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f28633ee-774f-41dc-89db-08dad96da14c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2022 22:43:30.6532 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZkmBqdF3U5JS66tsfXBcn68xhwUHq/FCV8OQEu5pllBjKm4oWSrw2WyhJtC5ok2BKyJ3XQOBgx2vjhAQ3pzS3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1088
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=33486e341=wilfred.mallawa@wdc.com; helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Dec 2022 22:43:54 -0000

T24gV2VkLCAyMDIyLTEyLTA3IGF0IDE3OjAwICswODAwLCBCaW4gTWVuZyB3cm90ZToKPiBUaGVy
ZSBhcmUgMiBwYXRocyBpbiBoZWxwZXJfc3JldCgpIGFuZCB0aGUgc2FtZSBtc3RhdHVzIHVwZGF0
ZSBjb2Rlcwo+IGFyZSByZXBsaWNhdGVkLiBFeHRyYWN0IHRoZSBjb21tb24gcGFydHMgdG8gc2lt
cGxpZnkgaXQgYSBsaXR0bGUgYml0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJpbiBNZW5nIDxibWVu
Z0B0aW55bGFiLm9yZz4KUmV2aWV3ZWQtYnk6IFdpbGZyZWQgTWFsbGF3YSA8d2lsZnJlZC5tYWxs
YXdhQHdkYy5jb20+CgpXaWxmcmVkCj4gLS0tCj4gCj4gwqB0YXJnZXQvcmlzY3Yvb3BfaGVscGVy
LmMgfCAyMCArKysrKystLS0tLS0tLS0tLS0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3RhcmdldC9yaXNjdi9v
cF9oZWxwZXIuYyBiL3RhcmdldC9yaXNjdi9vcF9oZWxwZXIuYwo+IGluZGV4IGQ3YWY3ZjA1NmIu
LmEwNDdkMzgxNTIgMTAwNjQ0Cj4gLS0tIGEvdGFyZ2V0L3Jpc2N2L29wX2hlbHBlci5jCj4gKysr
IGIvdGFyZ2V0L3Jpc2N2L29wX2hlbHBlci5jCj4gQEAgLTE0OSwyMSArMTQ5LDIxIEBAIHRhcmdl
dF91bG9uZyBoZWxwZXJfc3JldChDUFVSSVNDVlN0YXRlICplbnYpCj4gwqDCoMKgwqAgfQo+IMKg
Cj4gwqDCoMKgwqAgbXN0YXR1cyA9IGVudi0+bXN0YXR1czsKPiArwqDCoMKgIHByZXZfcHJpdiA9
IGdldF9maWVsZChtc3RhdHVzLCBNU1RBVFVTX1NQUCk7Cj4gK8KgwqDCoCBtc3RhdHVzID0gc2V0
X2ZpZWxkKG1zdGF0dXMsIE1TVEFUVVNfU0lFLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdldF9maWVsZChtc3RhdHVzLCBNU1RBVFVTX1NQSUUpKTsK
PiArwqDCoMKgIG1zdGF0dXMgPSBzZXRfZmllbGQobXN0YXR1cywgTVNUQVRVU19TUElFLCAxKTsK
PiArwqDCoMKgIG1zdGF0dXMgPSBzZXRfZmllbGQobXN0YXR1cywgTVNUQVRVU19TUFAsIFBSVl9V
KTsKPiArwqDCoMKgIGVudi0+bXN0YXR1cyA9IG1zdGF0dXM7Cj4gwqAKPiDCoMKgwqDCoCBpZiAo
cmlzY3ZfaGFzX2V4dChlbnYsIFJWSCkgJiYgIXJpc2N2X2NwdV92aXJ0X2VuYWJsZWQoZW52KSkg
ewo+IMKgwqDCoMKgwqDCoMKgwqAgLyogV2Ugc3VwcG9ydCBIeXBlcnZpc29yIGV4dGVuc2lvbnMg
YW5kIHZpcnR1bGlzYXRpb24gaXMKPiBkaXNhYmxlZCAqLwo+IMKgwqDCoMKgwqDCoMKgwqAgdGFy
Z2V0X3Vsb25nIGhzdGF0dXMgPSBlbnYtPmhzdGF0dXM7Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqAg
cHJldl9wcml2ID0gZ2V0X2ZpZWxkKG1zdGF0dXMsIE1TVEFUVVNfU1BQKTsKPiDCoMKgwqDCoMKg
wqDCoMKgIHByZXZfdmlydCA9IGdldF9maWVsZChoc3RhdHVzLCBIU1RBVFVTX1NQVik7Cj4gwqAK
PiDCoMKgwqDCoMKgwqDCoMKgIGhzdGF0dXMgPSBzZXRfZmllbGQoaHN0YXR1cywgSFNUQVRVU19T
UFYsIDApOwo+IC3CoMKgwqDCoMKgwqDCoCBtc3RhdHVzID0gc2V0X2ZpZWxkKG1zdGF0dXMsIE1T
VEFUVVNfU1BQLCAwKTsKPiAtwqDCoMKgwqDCoMKgwqAgbXN0YXR1cyA9IHNldF9maWVsZChtc3Rh
dHVzLCBTU1RBVFVTX1NJRSwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGdldF9maWVsZChtc3RhdHVzLCBTU1RBVFVTX1NQSUUpKTsKPiAt
wqDCoMKgwqDCoMKgwqAgbXN0YXR1cyA9IHNldF9maWVsZChtc3RhdHVzLCBTU1RBVFVTX1NQSUUs
IDEpOwo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgIGVudi0+bXN0YXR1cyA9IG1zdGF0dXM7Cj4gwqDC
oMKgwqDCoMKgwqDCoCBlbnYtPmhzdGF0dXMgPSBoc3RhdHVzOwo+IMKgCj4gwqDCoMKgwqDCoMKg
wqDCoCBpZiAocHJldl92aXJ0KSB7Cj4gQEAgLTE3MSwxNCArMTcxLDYgQEAgdGFyZ2V0X3Vsb25n
IGhlbHBlcl9zcmV0KENQVVJJU0NWU3RhdGUgKmVudikKPiDCoMKgwqDCoMKgwqDCoMKgIH0KPiDC
oAo+IMKgwqDCoMKgwqDCoMKgwqAgcmlzY3ZfY3B1X3NldF92aXJ0X2VuYWJsZWQoZW52LCBwcmV2
X3ZpcnQpOwo+IC3CoMKgwqAgfSBlbHNlIHsKPiAtwqDCoMKgwqDCoMKgwqAgcHJldl9wcml2ID0g
Z2V0X2ZpZWxkKG1zdGF0dXMsIE1TVEFUVVNfU1BQKTsKPiAtCj4gLcKgwqDCoMKgwqDCoMKgIG1z
dGF0dXMgPSBzZXRfZmllbGQobXN0YXR1cywgTVNUQVRVU19TSUUsCj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnZXRfZmllbGQobXN0YXR1
cywgTVNUQVRVU19TUElFKSk7Cj4gLcKgwqDCoMKgwqDCoMKgIG1zdGF0dXMgPSBzZXRfZmllbGQo
bXN0YXR1cywgTVNUQVRVU19TUElFLCAxKTsKPiAtwqDCoMKgwqDCoMKgwqAgbXN0YXR1cyA9IHNl
dF9maWVsZChtc3RhdHVzLCBNU1RBVFVTX1NQUCwgUFJWX1UpOwo+IC3CoMKgwqDCoMKgwqDCoCBl
bnYtPm1zdGF0dXMgPSBtc3RhdHVzOwo+IMKgwqDCoMKgIH0KPiDCoAo+IMKgwqDCoMKgIHJpc2N2
X2NwdV9zZXRfbW9kZShlbnYsIHByZXZfcHJpdik7Cgo=

