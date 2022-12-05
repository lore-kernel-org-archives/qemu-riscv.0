Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2JbL-0002Zh-Di
	for mharc-qemu-riscv@gnu.org; Mon, 05 Dec 2022 17:06:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=331af8b0c=wilfred.mallawa@wdc.com>)
 id 1p2JbI-0002Z0-UX; Mon, 05 Dec 2022 17:06:12 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=331af8b0c=wilfred.mallawa@wdc.com>)
 id 1p2JbA-0001EC-J3; Mon, 05 Dec 2022 17:06:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1670277964; x=1701813964;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=o49oFSUuLRz1S8lbBl9wuJEBn1Kfgw/28MLgIHTbD4c=;
 b=dVbWzfrxvmijeGXCm25V73Wx/5Fq8aSFFqCy7MrRifc1viDF0j24rjKu
 INRYvyYKvz7/6Hiqe2HMUgQjBO6pBWDn5jtVBot1xhJZVN3a/INP2nryF
 IMzUc1jUHq2S2ND06os/DPp9OdE9/eUEG5mZ2r4+LPn/omi2zKYdslqd+
 TC3LP70POFQyKB/l3g7kvoFMzrF/ZfgtqCQMknld/nhxqg25qKSGHTUfl
 JCa56AN8kZT0/fN+q6zGjP2vmNWN75C6XcsFeCzgu7LjwbKpWM4orkLH0
 OfQ2gH0E6aSWfCgDQMIFPl05TzmK6F33zU87QpNijt8FKgHOFNDS3Ph64 w==;
X-IronPort-AV: E=Sophos;i="5.96,220,1665417600"; d="scan'208";a="223105963"
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hgst.iphmx.com with ESMTP; 06 Dec 2022 06:05:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jR4HzznIL3OysH0n5iqvmvo9P9g3aGY6P0wN0jMc4/r6KPlwBUrEUHEhpj27LjgChIeRlZu15I73YIxLl2BH3V69GQT1tvvu/TWCZt10y9cbO9PqtUnYQRSbdnuS74TpnnIEDISGRsTT1hQAJiRGRwkXu4U5dD4vUkiRqReG2Jnqi6tcld1+54YmPN/O48nwRvdr65n9uL6QEU1jWMPV7VZPINS0UAu4XDBS2yWTHmd7K84omDg3C0nHrLf5CjCyQJtl6yXTV/kivD1ckbckAs9DedfAI0HIr6UrrGnL4+kqw4h0xrYattEWs5xrs6OnhTa0Sr5Sl0TQ8yIpbfoHUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o49oFSUuLRz1S8lbBl9wuJEBn1Kfgw/28MLgIHTbD4c=;
 b=WgkScjK28/kBhn02oXbRQ7eXPnQusCNYRd+6skkZONlMylhxeWTHSkx3y9lC1WyCsyE298MjYsV1WF3W5iV0lPrS9ZpL+S3xadDDsPnSuFQX2VhrLlPjYqNJDWHvlQCeWMfFaQxKHJqCsk99DBGb1BSVoXBtZwCqY8X9773h5xKxa5ckfyYvH3uAA7ijXWptG+mWKhH100AP/lnGC+0ecyIkF6stmOaoxOYutxi1wIJ7Acm+rNUrJCn1BIq4cAofVFh4DgUdtDzbhDtZLUlZhf4hlnOnU3TXuw2W7JWcJCYqQjJK7+EfHfOJogrjwM8u0jDT+0fkiuFylh7v17tr6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o49oFSUuLRz1S8lbBl9wuJEBn1Kfgw/28MLgIHTbD4c=;
 b=oZHDgI25geEiQY6d9GorESGi6EX96+HVCIKNg/r3f9T4EP0oO68Py1pxE3tRSdUOnbNWj+iu+MbLWfynFJSceyT9/iNdwk+ijGRjA8y+/Bfw0GXBvCGzsWgrnrKfBiAaHfy4lkvbFjFnFsoqxquISMvtRMiHjH29c2Pxepuv0t8=
Received: from CY4PR04MB0359.namprd04.prod.outlook.com (2603:10b6:903:b3::19)
 by CH0PR04MB8019.namprd04.prod.outlook.com (2603:10b6:610:fb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 22:05:44 +0000
Received: from CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255]) by CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255%6]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 22:05:44 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "bmeng.cn@gmail.com" <bmeng.cn@gmail.com>
CC: "bmeng@tinylab.org" <bmeng@tinylab.org>, "bin.meng@windriver.com"
 <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH 15/15] hw/intc: sifive_plic: Fix the pending register
 range check
Thread-Topic: [PATCH 15/15] hw/intc: sifive_plic: Fix the pending register
 range check
Thread-Index: AQHZBY7R/BnRbAxZ+0K9D0143fcrxa5ZvrEAgAU7awCAAOYzgA==
Date: Mon, 5 Dec 2022 22:05:44 +0000
Message-ID: <71b781e245b890e769c27fb37f7f380824bb239d.camel@wdc.com>
References: <20221201140811.142123-1-bmeng@tinylab.org>
 <20221201140811.142123-15-bmeng@tinylab.org>
 <4d2fa372f88dda106d80bd26806bc32c2a92d784.camel@wdc.com>
 <CAEUhbmVO-OL9Awds3Q19gGhGC-agdq7JqxR28i3W+0CS0K76uw@mail.gmail.com>
In-Reply-To: <CAEUhbmVO-OL9Awds3Q19gGhGC-agdq7JqxR28i3W+0CS0K76uw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR04MB0359:EE_|CH0PR04MB8019:EE_
x-ms-office365-filtering-correlation-id: 5d48dbaa-bbaa-4589-00e3-08dad70cdb57
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6NLHOSYnnIPvG4lCIENf/LRpQLEsRg8sm6Nc8OBNh3HMp7BFDXeFYSstZzArt+04lcl3h/dZtaU2iDzb8IzEWebU6fIjo17h02QWlgUNdx6Pw1LthAB96OH5TDK5v1AKp1RahDj4VNhn0VWRIrIX9D8/Jq/+cerlNIsKd6BJVpeeGnEhC8U9LpjiDaq+9XbuZCzEhzh6Z4x3VA2Kbn/EKklMCRvRuUJv1dprYRKAxD5pG0qyWC3UjwwpstkV+GftHI6Y/APZIggXuDaQnB3oCUYnNE5SRN2k5/p/7OVZcuMYaAZc/WTzjK0uc0bS2UoPGcQ2lwdLaW5Ln54BuX7ZLzY2uSfUonUzsOvkoXxm0zRFenxU8CJfT3xxjSxKQSw5FPkf4Y8jY2sSu9of0XoCKpvKC95nvAED1B0O4knq4Fe38x1qZvYW0uEJwMeBau333yuWztjOzp2B3d8JdJL5QaZBxPdzeAyFdGlpf6RpkO7A/sLsu12b9gNCi6kqCgVnl5QrmqF8m3b0BOsOd391k5eQ/E1Wp2SV/q+0G7/yyj21JPwNaLXndm5jPEZF9eN74AZvBHwLEnwfiuF3SSxWb4iCt+VrUnQYOQw5vNwU2k49V5cSwmXtbjVhhoOMVzOLa9vIAxM2XQ2EKc+4/DLn9KRUFABTA4R/2byHghBisN//u1ZrOTv5m7gcnren9abj6cKdiMkRPHplp/S/EMhpXA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB0359.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199015)(36756003)(38100700002)(82960400001)(86362001)(8936002)(2906002)(4326008)(41300700001)(38070700005)(44832011)(5660300002)(122000001)(83380400001)(91956017)(478600001)(66476007)(66556008)(76116006)(6486002)(66446008)(54906003)(316002)(2616005)(6916009)(66946007)(71200400001)(8676002)(186003)(53546011)(26005)(6512007)(64756008)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eW5UOXh3blM1enJOM3N4ZURCSE9LM1pCUDF2ZmF5bG8weFV2L1NQeGcrL3Iz?=
 =?utf-8?B?MnVCWTFxQmNCL0REZlVHQW5KeEhBTFJuWWtrZ2d1bG02aGd6M3BoNnZoald6?=
 =?utf-8?B?bmVPSnJaVk9rVGw0YjM3WXpSamRXWkhqYTh6N2dzSy81WUdhZGVGV0hwQVMz?=
 =?utf-8?B?emV0U3RKVU1XalJDdDdBYWlOT0EzcFVrbHhEMWhLVnNxMlBCM2w3SWp4ejV2?=
 =?utf-8?B?c3c1cVhEUDFpYjBabldERjMwd3Z5aTBhMzIzTDlYR0kveVJPcFhIeWdPU0pa?=
 =?utf-8?B?Sm5wbkFBdE4wZjMvMThHZ1N4cmVjakxVQ3VMSEVUNlRVbnh6YmFnOHBNVTRN?=
 =?utf-8?B?V0FCNDFaTVIzVWJFcjJZbytQQmcxVTd3L21LMEtEcENMa0k2dFF4dnRDN25S?=
 =?utf-8?B?cTlHVXFTL1FxZW1hb1Axa3poMWViNVA0dFVJZmIvcXRBbW53MGRxZGxzUm45?=
 =?utf-8?B?bUdFb3BSd1hlQmZEUWJiUStUMVFVVEJKYnlMWFlMQkZWdnoveStVT1Z5MGhN?=
 =?utf-8?B?aHhiNndSV2RONnNwZHgvTlFHcjErVmdvN3NMT0g1NVR6RkJpdHNsYmkrYVVE?=
 =?utf-8?B?ZGQyWklVMGtuT2VXVCtSWCtxK1dNV1BodVNBaGxlNlVObUJhNnNvejYzRnhX?=
 =?utf-8?B?R0IyeStoaER2NUxLamFiMzZUV1kxQmtxNXNtdyt5UXNSdGYyTjA0QTF2ejZC?=
 =?utf-8?B?SUU2c3RocVhvU0hPV20wUDJOQzRCTkhYWnVsalZWT2ViTC83eVV1ZmE5bUpo?=
 =?utf-8?B?Y3JuZ3ZxZjQrZDZLb3JnbHdtVGh4dzhnWnRUTlMwZm81ZXcrZHZkWE9rQzNI?=
 =?utf-8?B?WExvMHdxOVlrdWdMODM0aXRFbmEzaU5IcCtzZkZhL1FEbVZndFFEb0NSMWNz?=
 =?utf-8?B?Wmg5WmR2Um03V1BGaG01ZTJlcGw2Q0dYa1p3UHZMR0MwbjVXQ3BUdEpDMWJy?=
 =?utf-8?B?ZXFUdzJrd1JEVktLWjdjbzA1cXNKR3hBQXJoZVpUQ1dIUUpKT1IycHRYQmRq?=
 =?utf-8?B?LzFMV29KcGZvYUxwaU9JWkVGWXprc0VoS2EvamluM0Zia3ZQNUtWcjhlcG92?=
 =?utf-8?B?bGgrK0FzTFg3OFFxcUcxTGpQa0hTNG91T2FYWVpZVjlWbUFHZXdvbENtWG5k?=
 =?utf-8?B?U2s4VXc1aU5IdHllWU1xNzZjdTZ1bDdmQTZseC94TUJLTS8zam5sQTVYZlNX?=
 =?utf-8?B?MW1YNkoyOHRUeUZiRkh4aGdibHVIcWJyT0M5QUcwMENyTDQxV2VtM2Y3cVNR?=
 =?utf-8?B?cXZFeUN4eWpzYjRaT2VyL0RKVFVnYW1GbWtNMmovdGRLMWVCeVpzUHAyZXdv?=
 =?utf-8?B?Z2Y4WGszdFNpN1hUbjl3TUw0RjExMDVhWHlHTEoxRFdEOFg4a25ldThEOFZv?=
 =?utf-8?B?MzhkVFMwQlo3WXVGb29DTlhKd0NZSDR3NmtSR0Vqb0NUNFlRMVNvN2pWRUxu?=
 =?utf-8?B?S0liMHRwM1krTUtwZW51K203emh1Qk82a0Fhc2pGVGZNaFVuTVdVZUFEYUVr?=
 =?utf-8?B?bFlOK3plZStDc3VLbGl0U3FuTUlPMDM0bG9TU095T0xiSTZwNXI3Z3BMb051?=
 =?utf-8?B?V2ZxUWJta1kxUnB5R0ZhUGdGWmd0c3FxOHR0ZTJQZ0dxakZRbmh3VGkwZk55?=
 =?utf-8?B?ZS9zb0gvdUxGa09tR2pKdzZMUnk2TG1haFllUmtpV2RRT1RXZ09xNjdueFRU?=
 =?utf-8?B?SnAzd3dKQ1BoaExKUFhoUGMxN0lIZWRQWUE0RnBkSkE4bkJFRWxsaHluVWNi?=
 =?utf-8?B?S3JyVXlJMDhmcFhsMmlaOElHSEJneXdFL2UzRW9FOVY5TGo2dW5uUERydnlh?=
 =?utf-8?B?L2NsYTZaMS9FQjQ5Ui9wSENYekg2SXFNZEhNenZxaE5BRkl5aUJoRTFmdnlJ?=
 =?utf-8?B?ZWk0TTRISGF3c3BSTkxrTWtBVkRQMTJpMmVnQmc1UkZoYzVaR01KYTBRZWxz?=
 =?utf-8?B?NThTN3REQUIxVzQ1N2huUGlGa0dtT3FzU0hDT2laenl1K3g1QmNCTk0wZXlm?=
 =?utf-8?B?K1RMbFEwWVUxU3JjSjkzekdVdlVCOHlVU1ZUblVvem1JdHFRaVk2NnlQdUdZ?=
 =?utf-8?B?NkdsRmR0ZFM3Zy9VaHQxU2tuc3FEbTIxZTNnMUFnU2s2MU9qQ2RaUXJiM3NN?=
 =?utf-8?B?cWZON1pVV0xOY1RydEI5N0srSnhoTUFza3VXc0Rxb3ZpS3ZmZFpGSi9sd1Iy?=
 =?utf-8?B?Q3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <02CAA52C54FDE64592F147852C3C1EEF@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: IRMq7v64mOPn6wmCZlIuLRv2kyjrzaIKNPv5DoEqky8Ljl0te/697c7OybS9ZE6NUIQRMjHzEFL3gRXXjTONiHktLyPCodOOCAVWADBkoG1dPf41NjgWPimUdHWZA6BJdkdkH0r4g2t9xm4BnZDwGOISw9cuTk1wsL6OpXzGzCzBj9eLPegGUS7bv+JB5T0ZidvnNYSojkaRDzxSLIaL+yzmAe3Qmdj9SGI893ItkvBk0jIOrR8HkoZIk6bj6LtMBnH0nI4XhhTQyGlucEak69tn+igiwenPKadIghd2d5OVohM90H+Musd8PJV/D5utgscgOKV4fiCmJ+vgMFTcQs7KSkYSfo8R/ozs521fOkX23SI5gOmWgbbljuIPqWnw0UftsRZHFtGh8euJPuC8LrYEZC5Lp2ZmhUj0k3CBpGE446cj+hsijzSn3BOYEQcAYxE0KP6rcuLypeKICJGTvzMMsEj3FTvA8Br2SX+2fuJGjCfY6vfQjTk7aHo6BiJFlJotUKB8A5ARWjPf9b4+b5Es2jNYGGVCIKK7WjMjxCMkZiPjGGdXLNGfEB3kTvbF36Z2vdj7oj40uX7kZ8pvPIWb6RK9EomUf9X5p3kBo87FfJtHI83jip/iina5mzVA5REsDPjgJy9XAZpYcsIlTZSJV7D8+1SInQy8PLQnzcAXlPqQHis8cO3oivpQDGi/TBS3G7cKa0FYq4prgK2RILDCLLoNpxz1vc9gicM7LpuJyj1rYeaSDmODlp+iRY06jYgoDUz32tC35ax/y3m+sZ4wy+6iQj01STllQz8oSgbwJDwrGyd5I+DHDTKZf483JNihSSlwrEeWszWzKbHCricCUtxtPv2NBXUxSW3WD++rRnAggfJCSD1bn2ov9pT9NMHLlzdE+pLhySkKX5zz/305I62LBCVsbYUtqiKFUfg=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB0359.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d48dbaa-bbaa-4589-00e3-08dad70cdb57
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2022 22:05:44.5525 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K3IYZuMdSwQB/zqUfNf8xZjazlFQwE5+yjphS32xuHpbClHzwlbiliBTkcGp8EDpIpQt+6JZnm2O5CUWUNtE3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR04MB8019
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=331af8b0c=wilfred.mallawa@wdc.com; helo=esa3.hgst.iphmx.com
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
X-List-Received-Date: Mon, 05 Dec 2022 22:06:15 -0000

T24gTW9uLCAyMDIyLTEyLTA1IGF0IDE2OjIxICswODAwLCBCaW4gTWVuZyB3cm90ZToNCj4gT24g
RnJpLCBEZWMgMiwgMjAyMiBhdCA4OjI4IEFNIFdpbGZyZWQgTWFsbGF3YQ0KPiA8d2lsZnJlZC5t
YWxsYXdhQHdkYy5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IE9uIFRodSwgMjAyMi0xMi0wMSBhdCAy
MjowOCArMDgwMCwgQmluIE1lbmcgd3JvdGU6DQo+ID4gPiBUaGUgcGVuZGluZyByZWdpc3RlciB1
cHBlciBsaW1pdCBpcyBjdXJyZW50bHkgc2V0IHRvDQo+ID4gPiBwbGljLT5udW1fc291cmNlcyA+
PiAzLCB3aGljaCBpcyB3cm9uZywgZS5nLjogY29uc2lkZXJpbmcNCj4gPiA+IHBsaWMtPm51bV9z
b3VyY2VzIGlzIDcsIHRoZSB1cHBlciBsaW1pdCBiZWNvbWVzIDAgd2hpY2ggZmFpbHMNCj4gPiA+
IHRoZSByYW5nZSBjaGVjayBpZiByZWFkaW5nIHRoZSBwZW5kaW5nIHJlZ2lzdGVyIGF0IHBlbmRp
bmdfYmFzZS4NCj4gPiA+IA0KPiA+ID4gRml4ZXM6IDFlMjQ0MjllNDBkZiAoIlNpRml2ZSBSSVND
LVYgUExJQyBCbG9jayIpDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaW4gTWVuZyA8Ym1lbmdAdGlu
eWxhYi5vcmc+DQo+ID4gPiANCj4gPiA+IC0tLQ0KPiA+ID4gDQo+ID4gPiDCoGh3L2ludGMvc2lm
aXZlX3BsaWMuYyB8IDUgKysrLS0NCj4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2h3L2ludGMv
c2lmaXZlX3BsaWMuYyBiL2h3L2ludGMvc2lmaXZlX3BsaWMuYw0KPiA+ID4gaW5kZXggN2E2YTM1
OGM1Ny4uYTNmYzgyMjJjNyAxMDA2NDQNCj4gPiA+IC0tLSBhL2h3L2ludGMvc2lmaXZlX3BsaWMu
Yw0KPiA+ID4gKysrIGIvaHcvaW50Yy9zaWZpdmVfcGxpYy5jDQo+ID4gPiBAQCAtMTQzLDcgKzE0
Myw4IEBAIHN0YXRpYyB1aW50NjRfdCBzaWZpdmVfcGxpY19yZWFkKHZvaWQNCj4gPiA+ICpvcGFx
dWUsDQo+ID4gPiBod2FkZHIgYWRkciwgdW5zaWduZWQgc2l6ZSkNCj4gPiA+IMKgwqDCoMKgwqDC
oMKgwqAgdWludDMyX3QgaXJxID0gKGFkZHIgLSBwbGljLT5wcmlvcml0eV9iYXNlKSA+PiAyOw0K
PiA+ID4gDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBwbGljLT5zb3VyY2VfcHJpb3Jp
dHlbaXJxXTsNCj4gPiA+IC3CoMKgwqAgfSBlbHNlIGlmIChhZGRyX2JldHdlZW4oYWRkciwgcGxp
Yy0+cGVuZGluZ19iYXNlLCBwbGljLQ0KPiA+ID4gPiBudW1fc291cmNlcyA+PiAzKSkgew0KPiA+
ID4gK8KgwqDCoCB9IGVsc2UgaWYgKGFkZHJfYmV0d2VlbihhZGRyLCBwbGljLT5wZW5kaW5nX2Jh
c2UsDQo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIChwbGljLT5udW1fc291cmNlcyArIDMxKSA+PiAzKSkgew0KPiA+IHdoeSBkb2Vz
IGFkZGluZyBzcGVjaWZpY2FsbHkgMzEgd29yayBoZXJlPw0KPiA+IA0KPiANCj4gRWFjaCBwZW5k
aW5nIHJlZ2lzdGVyIGlzIDMyLWJpdCBmb3IgMzIgaW50ZXJydXB0IHNvdXJjZXMuIEFkZGluZyAz
MQ0KPiBpcw0KPiB0byByb3VuZCB1cCB0byBuZXh0IHBlbmRpbmcgcmVnaXN0ZXIgb2Zmc2V0Lg0K
PiANCkFoIEkgc2VlLCB0aGFua3MgZm9yIHRoYXQuDQoNClJlZ2FyZHMsDQpXaWxmcmVkDQo+IFJl
Z2FyZHMsDQo+IEJpbg0KDQo=

