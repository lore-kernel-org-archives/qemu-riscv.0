Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0tYX-0004Ny-8P
	for mharc-qemu-riscv@gnu.org; Thu, 01 Dec 2022 19:05:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3286bccba=wilfred.mallawa@wdc.com>)
 id 1p0tYP-0004KK-Gm; Thu, 01 Dec 2022 19:05:21 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3286bccba=wilfred.mallawa@wdc.com>)
 id 1p0tYI-0001UK-P4; Thu, 01 Dec 2022 19:05:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1669939514; x=1701475514;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=auSA7Y23oCw+aOwMllDiSw9QidXuy+2pQ3ineu//WLY=;
 b=C7HC/5RL0VxyUhDDLmBjqiwHYsE3SFFuatNcRnRE66bWJBiZqKNfjoQB
 EKNC1tfbGo4ubNqjC/Mt80pmpYlQ5FG83BYUcxCMyLH4IRvuesOYtuvyV
 puHvX2/aD2/Pd0V/T6xML7ugO+HBFKPEl5XZ0XyMO26egmDL7XPskW3e1
 2tDcztPTaMN+K9ECZiJMJGPkH6DruaTQ4Q7+6zHXy8aQ09y/+h/Zy9p6y
 gUdVa7ZDVr5LsgNmQzWi/Hl0TKDkAjwi7eVvHr1UlTvFRJu/RZ4a7tx/O
 RQTTBAQl0sEzZ+GaQYj0fbn9FiRhAMF8meRSW1fznAqLrChfWY91UQXNj g==;
X-IronPort-AV: E=Sophos;i="5.96,210,1665417600"; d="scan'208";a="217706936"
Received: from mail-sn1nam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.47])
 by ob1.hgst.iphmx.com with ESMTP; 02 Dec 2022 08:05:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llLDZwHZt1iet9l5ggk2sjzq96lca9LxlOOkcdmPgakOXP4UpAQC+YYau7e9TKumeOCx/hN9YRLWZZ3LCYMoB0bIYI0lANxUx0IMaZF4Znk8GSfpdWyGkpE0Y+GOMwVFEAPmoWAsr7j4nxIc1Fpr20S2BbYNtVH+vp9o3xr1D7ND8PMb7DIJDRhQ6jCQPqIVVqb4aKsVZD+SDCBA/qxbtxKIAYg3K/iwxPvwfWTtoMBFN1xi0wJlyER+oOij8ebaUw93ZoccHaQZWsdqHgg/ofATs/7olN0TLwFb99eF5c4p1fUlg5Vd+dK9U4mGNkdcWPXherQ7rCumkF0AH4mDCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auSA7Y23oCw+aOwMllDiSw9QidXuy+2pQ3ineu//WLY=;
 b=hblbJBNJuUmkUc/wYtbL+x80RiEdL7Xf9hF0ysIvV7bP5l51ESeony5UXmWdMMOlpaM7ocj6+Ltad2Ogi2k7dHEnmEpDIhDDVOmaJcEFb/CddA+O9cprQJyrjpNqzmwaKglnQA9iom3605e0D3ATgtL+1Ofbp4xzX2J9XQJrICh74etaYCupJV6mt2nUXeXzHpsfYG8GnlavLh2iIfk6H7A8hR4Ng/z6IptExirnUK8sMV44exqNXAF5YX0KtH6JBoUeqf6+q7f5yo2G5CCRspmdBP+5ssDcArAenQRhfYoWFu9O0i95GMG1PmhqbEi8G6zJkAsevWVF5XY4rSbcEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auSA7Y23oCw+aOwMllDiSw9QidXuy+2pQ3ineu//WLY=;
 b=ntWphc9pEe6V2KPjnQn1mWoNRzVNc7k+mb1NY1zr9ihSzcGXFkuAJ2NWN5KkUBIdaTV6nYjgN+q/SiuQ5LFGbOL+gYyjYnHkUsjw7vUtU9cPY5M4DSaA9AvgxGNlO8dWXrqcVUcx9x0iN17Xwizsij4lKSUG82oihFgcIXr27V4=
Received: from CY4PR04MB0359.namprd04.prod.outlook.com (2603:10b6:903:b3::19)
 by BN7PR04MB5409.namprd04.prod.outlook.com (2603:10b6:408:35::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Fri, 2 Dec
 2022 00:05:07 +0000
Received: from CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255]) by CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255%5]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 00:05:07 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "bmeng@tinylab.org" <bmeng@tinylab.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "bin.meng@windriver.com" <bin.meng@windriver.com>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH 10/15] hw/riscv: sifive_e: Fix the number of interrupt
 sources of PLIC
Thread-Topic: [PATCH 10/15] hw/riscv: sifive_e: Fix the number of interrupt
 sources of PLIC
Thread-Index: AQHZBY6VPcZN3z6EjEOgGlBUM8SHbq5ZuFmA
Date: Fri, 2 Dec 2022 00:05:07 +0000
Message-ID: <b6b206aba88ff31eeed34ecfd3effd22ef62136b.camel@wdc.com>
References: <20221201140811.142123-1-bmeng@tinylab.org>
 <20221201140811.142123-10-bmeng@tinylab.org>
In-Reply-To: <20221201140811.142123-10-bmeng@tinylab.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR04MB0359:EE_|BN7PR04MB5409:EE_
x-ms-office365-filtering-correlation-id: 5a52e54a-c8b4-4efe-7bd3-08dad3f8df17
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WCVUzmrk/5gB0r5hxwYdbQ329F8Jl5NxR3S1GpcWFKm/5uMrRTWzPmQRMER9YkzRB6oN0QpEzJy/wZ5811bgxx9N2HBqzQNvnC3zeA6nUvt0jVSTsPWD29KXVl/QY6Gx1069RnMFLZ/zIN9mtT2cd99EptPLBlyht5JdUNO50aECEelwqOcWNEGGlsn1P8fCkePRhd6zMZztICU3BLHCeksJmR8/q0dRt8dXJAC6dVo6zkYotafc3Hl/SH3KFqiJdLqQGUcoTAoY0VodowP4amVkjEaw+4IJUpzTsdTNykSMuPopEd/Ivmk/IWVqtQROWeKfv9bP8vf79tZDaQVZkvLsOdjrKyVn9Jw+aBdtBRESD2zlOAJQ1YAU40GS5xKahJKq35sf3M0U+DrsxofLhYYfzf9BMkrMxR6vTN3HsqtJgzww4NUFZy0TRVxWMJysjVdq+GNlT6AMsIuafPk2D1P6hN/n0K+Bt2+ngg0aNLNEymhmjIA4p6QYKotgFFnoLzXdG43XvcO8vcpuui3s4vIoMLS1D0VHoTGvN5LWx1oe/LlTKyHdHgevzBYjJZegneu7uXcguI4zQKPVhIaHJsxd6kVw102cWgyL31XJ9j5ckhVSSnqfI84pOlr9xBRGdSrAR0iqh60nMhTooKBY9+fTPzxI15oN0od3LZ2TghjxZGqbu5/2UxuifB3Zf5XpEnbjGEfw3UYB+mlBRARH4tJJha8sZmQZesmHYjEpc2c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB0359.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39860400002)(366004)(136003)(346002)(451199015)(86362001)(82960400001)(26005)(6512007)(38070700005)(6506007)(966005)(36756003)(478600001)(71200400001)(6486002)(122000001)(2616005)(83380400001)(38100700002)(8936002)(2906002)(186003)(91956017)(5660300002)(44832011)(76116006)(64756008)(66476007)(66556008)(66446008)(41300700001)(4326008)(316002)(8676002)(110136005)(66946007)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVJuUmpENEUwRkFjcW5sUGYrWCtvNHhHUzY0VCtlR1lRNkhUZzd0bG9xL3I1?=
 =?utf-8?B?VC9QcFZraTRnVHlUV3lVWUFLUGxxWHIzUlhZOHBJWWlVMXlKZzdlK1kwMktM?=
 =?utf-8?B?NFlpSkR3RUIvUERwVXFicHpPSi90WTZrdGM5Sm9KZmNiK01vbEtMTC9HUnBP?=
 =?utf-8?B?eVlDTnJ5R2pYSHlXQU5ZajFocSs1UWt3dkk1WGVyTXFDNEJLNHlpZi9nZzg4?=
 =?utf-8?B?RlNxMTVsVlNNNDVxbkxuMVduQ1ozTjdtcVludXpONys3R1U2UzJVaWhsVUJM?=
 =?utf-8?B?UHdLMit2MHdZbERrd3VRU0h5SnVJN0tSZ1dJZUlzeHhVT0VRUUdMY2VxMEZF?=
 =?utf-8?B?Wkg5MWQ3MndueXltcDN3VVBSbGI4WEdkWGVUakVJcXdXVThLNFEyOXhaNFIw?=
 =?utf-8?B?NElCVEVVTWl4Q1k4aVJRV3dnMXFaU2xWTC9PUVp2N0JmeERkVk50MkJzK29s?=
 =?utf-8?B?M21DS2E2UHpQR2JZK3M3cW41Umsvd3ZubVRLR05PMWEwWS9kaFRwbjAvVEx3?=
 =?utf-8?B?QU96ZG15eHdHcWtES215NDRrMGpycDJxalNiSUxjTVRxcFVtTmRXNVBncnVn?=
 =?utf-8?B?dVc3STlvdU5zeElUajI2WExzcVYvZ0VKRXlveGhOYXo5WGk3aTdSV2ZRVFQ2?=
 =?utf-8?B?bDhwc1lNazN0MnpROVUzNE9IVFBqWGtoMEpHaEtpOCtLREg2ZGtPeTZCc1RX?=
 =?utf-8?B?LzEyZVZCZ1h2a0svbWFNR21uUElIWmZEbkpON09XOXdST0hwaDFUdlg0cUgv?=
 =?utf-8?B?REhNUkEwQ0ovSU84YkhEM1pmMjZLbFk2djRUWUttaHp2MjdZZFNta0VwREZS?=
 =?utf-8?B?VDFQRkdUQXNOMlFvQkRYdk9NUllzM2FlRU8rUmJvLzBYNE1pRDRIdEpYSDJ5?=
 =?utf-8?B?WkFzZFlkWWxIL1hLMzNWMXJQY2ZIeGZrUEhwUHBTazh0RFNyTzZFS3dnam4z?=
 =?utf-8?B?czdRSjdBMkpGVjdzSk1jdUQ5bXNxN3RTeHpZRUp2ZzJlSlZBVUZKVC81SitN?=
 =?utf-8?B?R0FnK2l6MkMxY1R0RXdGQTJnRFF1bkV3NGYzQmR1UXNyR2NoSkJtV1lPbVl5?=
 =?utf-8?B?T0JlUU15eUtHbE1nb0hJWC95eXd6RmhHVXhZQ3l0Unp2cndrVTh3VnB2STh5?=
 =?utf-8?B?ODE0ZkRxaHZXVXdOZWtrZFdIa1Jxc09CN2swR20yV1hackM2bTkwelpWRkN3?=
 =?utf-8?B?MHJNN2xISzhPU2JEOUtuTHJHQkdNaGpPUm1JQU1MUEQra3JwNEswQVJSVFox?=
 =?utf-8?B?aVoyMlRzbGNFQkM0d0NIY3d1dVhGQzVmVzl2eUhnUDhBNTB4b1AxV1J3SlVK?=
 =?utf-8?B?ZXhYMjBFV2ZpZDgxRXdNbjNESnFEc0NqaFdIdWQ4QUZZWTBpdkFzUW5wcW5r?=
 =?utf-8?B?aGpPSFpnWkQvME8zeWVyODBLTituSklUMGlnU1lrMm5BNjF6L2t4d2c5OWJD?=
 =?utf-8?B?SlFxcnVCWXVwd2NkS3BZN3VvYkxBMlh4RjBLbkRqMHB6M2NIU000ZjBlK2lm?=
 =?utf-8?B?bHdzMHRIVGRlbTg0bkUycmtrYjQvOWNTUG5uMktPSzM0RXhHbWdMR2hQV2Ry?=
 =?utf-8?B?ajNiMXJHTWNReWdIYXZ2UVdWY2EvQ1VkNEU1am9wSVdHUHZRNGQ1bEhqZDJv?=
 =?utf-8?B?bWZRMGxRemVZQ0ZEaEZNcTZHN1N3K2RaVmIyeHRoRHQ4SERTWmoxQlFLY2xl?=
 =?utf-8?B?dVpVZVZjbGVSSUJ5T3NQNWoxQ1FnRmhsUE5VMVhWUzA0bHJmWVJmRHlsQ29v?=
 =?utf-8?B?TmZsd0I0YjhMUklHV0VRR0hTdlhSVWZXUXh3VTZLYTlJdU5YSkp1Snh1cGFQ?=
 =?utf-8?B?bi9sQXFBUFpDcUtIYzJtOWJJQUlFRkVNWFk2aGxVSkhzLzM0WEg0RG9uMGJr?=
 =?utf-8?B?REJ3ODhmbXVOZjJuaGFJblN6eE9XT3lXTVg3eTNEaS9TV1JoaDFrZURYTEh0?=
 =?utf-8?B?TXd1OC9zOUF1bHpuMUpBZldjaFJiUW8xSDhZbDdSb21UcGJjVDNBN0dLMUJ2?=
 =?utf-8?B?ck40VzNwcGd1QXpFS3Jod3RjM25DZ1BDWjBFSTJmUERNd0V3Vlg1QjNvT2wr?=
 =?utf-8?B?U0RaelYwVkpLYURnNm5ZMTNQNWNlNm4wTTkxQStNNGdVNjZwL1l1L3cvRDZ4?=
 =?utf-8?B?MXNXTGlwbE92NkhJT1BVbU1FM29WWVNEYU9jQWJ3aUxOTXZmeHJpMlZ1VXVR?=
 =?utf-8?B?Tnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BDCD4006749CED4286879EFD85763E91@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: wN5ry66/2QL/XQuyOlMDOchBHHe267zU+VzLF6bHkldFn2EMGy2WEH6rR1/2wGD+UPP56763bbThD3wermy5YVkJ4AInPgFYKkCj2qGz/MJ1HilRrOQxHABmeggpW+kDgxVjt+8RVkcBK0DmwGwGGyQvbyACynfJ/kCUoWvfhXMN6u55ZSS/cXF3jQTQfdgiT/cfviAukju1+EPE8nEehqIf9cm7Y6VEGYzq44hJ/86M8l91KljmYRta/lZooU9lJvkucCPTpNQO9P3CSGSUroKdGA5zDiUGXVLP1iqcwOLBtHIwRZA4pU8gvVKEzcr5SdeCNONoUDScBGHAfxjkC/kP5tB+RoqEHtpaO9nxpDmDM+rUXt01nmCWwKIY/RCg2ptm9Fyr3vL5JACyTTylh6i+57x8D8z6gfoz/liO4KLybWr4RFkgOyKrxm15vgrNEodfuYNy9SH1R+FdIHCc5lfIbwUb6jmLb1HQWOYZSA/irM/vBnaAFPueo6ba9IfAiHUnduzqiUhCb7ek7wqDbnelCVCLCF2sp5MHoSFmKaTffmiyF6bJ7vw4eCZqPQ5lSAyszLX8Poxpcp8Xjey6vvgNlHYQZbmahpczcvMwWcYMVLxSLlkB5kiWjf/lWVkJcA1wAfp3S/esqVp8ndVtvgN1r7mD884UUdfWLG4QIgaBMrngW6AuopjQvNEgOeyGukFMi8/tTxarpt6LKmCOm7eCsgCcDZSTyTO2gmX56CUzaIbk3EpqaQ0X9g55HEL7fNipCSGb5Zv1gNh1F28GSEXWSIe7uG9wg95KGdnXFRABVfT1uwniKORg7gvKvye4z6E9Cf7k6KzhkkEnNBgBGGrNv4DHfiBTHRUJBF1IuSbKg2kjQk9vVue0Xpfs1ulJlW8AmgksV0C/KFvZZ8KbcA==
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB0359.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a52e54a-c8b4-4efe-7bd3-08dad3f8df17
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 00:05:07.3929 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JSZFpeuak5mDW4YuR68GTl0puoqKn/T94ejhdvGnlLw5JkO3LHoZSjLdXGFxbgutbSMdipzNqZlwdAmjcZq2UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR04MB5409
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=3286bccba=wilfred.mallawa@wdc.com; helo=esa5.hgst.iphmx.com
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
X-List-Received-Date: Fri, 02 Dec 2022 00:05:27 -0000

T24gVGh1LCAyMDIyLTEyLTAxIGF0IDIyOjA4ICswODAwLCBCaW4gTWVuZyB3cm90ZToNCj4gUGVy
IGNoYXB0ZXIgMTAgaW4gRnJlZWRvbSBFMzEwIG1hbnVhbHMgWzFdWzJdWzNdLCBFMzEwIEcwMDIg
YW5kIEcwMDMNCj4gc3VwcG9ydHMgNTIgaW50ZXJydXB0IHNvdXJjZXMgd2hpbGUgRzAwMCBzdXBw
b3J0cyA1MSBpbnRlcnJ1cHQNCj4gc291cmNlcy4NCj4gDQo+IFdlIHVzZSB0aGUgdmFsdWUgb2Yg
RzAwMiBhbmQgRzAwMywgc28gaXQgaXMgNTMgKGluY2x1ZGluZyBzb3VyY2UgMCkuDQo+IA0KPiBb
MV0gRzAwMCBtYW51YWw6DQo+IGh0dHBzOi8vc2lmaXZlLmNkbi5wcmlzbWljLmlvL3NpZml2ZS80
ZmFmM2UzNC00YTQyLTRjMmYtYmU5ZS1jNzdiYWE0OTI4YzdfZmUzMTAtZzAwMC1tYW51YWwtdjNw
Mi5wZGYNCj4gDQo+IFsyXSBHMDAyIG1hbnVhbDoNCj4gaHR0cHM6Ly9zaWZpdmUuY2RuLnByaXNt
aWMuaW8vc2lmaXZlLzAzNDc2MGI1LWFjNmEtNGIxYy05MTFjLWY0MTQ4YmIyYzRhNV9mZTMxMC1n
MDAyLXYxcDUucGRmDQo+IA0KPiBbM10gRzAwMyBtYW51YWw6DQo+IGh0dHBzOi8vc2lmaXZlLmNk
bi5wcmlzbWljLmlvL3NpZml2ZS8zYWYzOWM1OS02NDk4LTQ3MWUtOWRhYi01MzU1YTBkNTM5ZWJf
ZmUzMTAtZzAwMy1tYW51YWwucGRmDQo+IA0KPiBGaXhlczogZWI2MzdlZGIxMjQxICgiU2lGaXZl
IEZyZWVkb20gRSBTZXJpZXMgUklTQy1WIE1hY2hpbmUiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBCaW4g
TWVuZyA8Ym1lbmdAdGlueWxhYi5vcmc+DQo+IC0tLQ0KPiANCj4gwqBpbmNsdWRlL2h3L3Jpc2N2
L3NpZml2ZV9lLmggfCA3ICsrKysrKy0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KUmV2aWV3ZWQtYnk6IFdpbGZyZWQgTWFsbGF3YSA8d2ls
ZnJlZC5tYWxsYXdhQHdkYy5jb20+DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3Jpc2N2L3Np
Zml2ZV9lLmgNCj4gYi9pbmNsdWRlL2h3L3Jpc2N2L3NpZml2ZV9lLmgNCj4gaW5kZXggZDczODc0
NTkyNS4uOWU1ODI0N2ZkOCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9ody9yaXNjdi9zaWZpdmVf
ZS5oDQo+ICsrKyBiL2luY2x1ZGUvaHcvcmlzY3Yvc2lmaXZlX2UuaA0KPiBAQCAtODIsNyArODIs
MTIgQEAgZW51bSB7DQo+IMKgfTsNCj4gwqANCj4gwqAjZGVmaW5lIFNJRklWRV9FX1BMSUNfSEFS
VF9DT05GSUcgIk0iDQo+IC0jZGVmaW5lIFNJRklWRV9FX1BMSUNfTlVNX1NPVVJDRVMgMTI3DQo+
ICsvKg0KPiArICogRnJlZWRvbSBFMzEwIEcwMDIgYW5kIEcwMDMgc3VwcG9ydHMgNTIgaW50ZXJy
dXB0IHNvdXJjZXMgd2hpbGUNCj4gKyAqIEZyZWVkb20gRTMxMCBHMDAwIHN1cHBvcnRzIDUxIGlu
dGVycnVwdCBzb3VyY2VzLiBXZSB1c2UgdGhlIHZhbHVlDQo+ICsgKiBvZiBHMDAyIGFuZCBHMDAz
LCBzbyBpdCBpcyA1MyAoaW5jbHVkaW5nIGludGVycnVwdCBzb3VyY2UgMCkuDQo+ICsgKi8NCj4g
KyNkZWZpbmUgU0lGSVZFX0VfUExJQ19OVU1fU09VUkNFUyA1Mw0KPiDCoCNkZWZpbmUgU0lGSVZF
X0VfUExJQ19OVU1fUFJJT1JJVElFUyA3DQo+IMKgI2RlZmluZSBTSUZJVkVfRV9QTElDX1BSSU9S
SVRZX0JBU0UgMHgwNA0KPiDCoCNkZWZpbmUgU0lGSVZFX0VfUExJQ19QRU5ESU5HX0JBU0UgMHgx
MDAwDQoNCg==

