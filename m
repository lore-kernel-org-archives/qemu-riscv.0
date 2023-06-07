Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AD4C77B7A
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 03:12:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6jbB-0006hD-Bb; Tue, 06 Jun 2023 23:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiao.w.wang@intel.com>)
 id 1q6jb9-0006gl-6I; Tue, 06 Jun 2023 23:12:35 -0400
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiao.w.wang@intel.com>)
 id 1q6jb6-00069p-Cy; Tue, 06 Jun 2023 23:12:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686107552; x=1717643552;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+nlnnoAH8UIZX+HJJe0ptqhCKEhbpBlXTU1l+Ml2hRI=;
 b=c5L9A2huqjg9HJnMxJ1qYObUygO1R2UpxfF3BZYkkk6G5lb98OXBQN9H
 EsAXmheTSAUlGT8a9WOHEPlI021mXWRvz8CaAOXdtdKWVyapViutzRZlU
 ZN8y52tbuY8uVD7+7b/bhT9LlFMtaW6BKI7Y7CkEeQHPSWz01Agirh7w6
 m8tUi4TI3nnB+pBCbeAtam3abubiAIqEW5vIg+R1Rf6hEphzSa2l5lA8u
 fFr9duqHWb6G485qJmepiwZldE4w+q5r3hyXLsRe+skronDJZF19oqDPT
 fL+AQ40mIaU8BGc00mCXMhJT+qMhCi3aAv2tJ4nPjv0hRP4I7u9OZHJw/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="360187324"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="360187324"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 20:12:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="883581205"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="883581205"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 06 Jun 2023 20:12:22 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 20:12:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 20:12:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 20:12:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDTni17gmmPk4AwqMcXMUGmXIS/FEwBEEHNDW1xaWhg0RjicEd0FQytY/glXl/eVzQZGlixoEyRfyWqwXbwL+LXq74ZxdWtWA/BMgVa84X9RmlTxyhmSmBAL/r9fUwQ2jS4LdcKQmRBdI3+Ij0AopnKZ0r14jYe+ULzA8Hnr17HKvuOscNPrnlj+N+mslMICD7Y++bumWT25Arl3JhNl3cLncBzTBcqninCNV1ELqe6HAOmIXCTiyvIqMDoWZVy5v9gRnkAKE9sAlpuMl6B3oAeXPFSeosM0DjusfgNZeXoxbcqsmewcTPWZydXwnCwV3Fis5gc8h8ZkXjha3BwSBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nlnnoAH8UIZX+HJJe0ptqhCKEhbpBlXTU1l+Ml2hRI=;
 b=JEtB8EeKtdiA0Dd2OIvALWEF5i2rTmmgqfnfITCjA5j6d5JfVDDOdAyabwqV1LbKEHO/RToQtUkyi+WHgBk1bTuJs8ZYUI1G9M1xCqxLJHiIwFTPmtGjbC118ZmCx0DPOV4uHNea6wZZTczjOpw0Il0eXyjEzenkSS8XlqUCM8u1YCdeEkDtOnnE64W9aMJER5ZmWdq7dDd8y/cyxHuaBozlTpP5ndGOVmQ0ahfK40ijvLInJBP1kieBg3uC7lFpzuzILYJa5SOMZ14VWB6TnSCY0q+6ZPg/bPZkWH8OQ3GfTxFb3nuO3sMRkCPN5di5Y7dakhotnLBzurPPGDaZTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SN7PR11MB6604.namprd11.prod.outlook.com (2603:10b6:806:270::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 03:12:19 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::749a:b0c8:4930:5a2]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::749a:b0c8:4930:5a2%6]) with mapi id 15.20.6477.016; Wed, 7 Jun 2023
 03:12:19 +0000
From: "Wang, Xiao W" <xiao.w.wang@intel.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, "Meng, Bin" <bin.meng@windriver.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, "open
 list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Subject: RE: [PATCH] target/riscv/vector_helper.c: Remove the check for extra
 tail elements
Thread-Topic: [PATCH] target/riscv/vector_helper.c: Remove the check for extra
 tail elements
Thread-Index: AQHZmFEWnko+Rh5/8k6n2le30wXjOa99k08AgAETF2A=
Date: Wed, 7 Jun 2023 03:12:19 +0000
Message-ID: <DM8PR11MB5751B576F990CE3BA91DB435B853A@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20230606083408.3972300-1-xiao.w.wang@intel.com>
 <8ee427d8-3272-c9ba-23e8-78de86ad5cd0@ventanamicro.com>
In-Reply-To: <8ee427d8-3272-c9ba-23e8-78de86ad5cd0@ventanamicro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SN7PR11MB6604:EE_
x-ms-office365-filtering-correlation-id: d0b537aa-9d3b-4c60-3ac4-08db670500f6
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8O6KCxf+akAtaZLwcwjaoGILSRFljmqkxc3HH7p7E2yCW33qzyqyZQmwfyPrhFrgZ7UuYfx8bda7dZoHHNtbHGZEBPrMLY4pLu5dEYH4LW7UwhIU7NnpkwGpcaERbaZ8mAmE/aqbS/MwyMF1ZnYe8jI8mrtA8FS9Njd9Mn+MhQnqz0CtqCHj9eey3g+adv4PRTGPpcBLYHLT7o7JmMUlYU3XQ+0f6Wp8SmRhx08mehp9hhjXgzeTu+xDeJ+C2i9H6z+eXz6bbCvn+x4/RFmvB1AbYVlrfx++HJ70Ap+H/lmCFHtHUr5qLivK4q0qw8AjuN6bl3kLQv/2ZkF0GaoZ4VsvkkWqLdZjp3NQ1AxWP/aLeepZU+KNjVQlbDDd630/DDfVMoJiu0j4mME67+FZRTHKmMt3kDZdoMp24OAtwiTQGod9qV9XYwnwMY55Pb9HTXS3NnxkphPdu0JrSPWMZKtNvpLz7vf/8diU/LyRukv+ez+OmZql9YxuOp6BI1rKRk0nHanZOHEMyn+EviKExDyPil45Rg0ye0ITJ/83852hDX3Wj6ErCjVUwZ99ZewtG+jh3WhWnP2oRKxCYr/+/+0KNAYDNKLV4fyVtKq1544=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(136003)(39860400002)(376002)(366004)(451199021)(54906003)(71200400001)(110136005)(478600001)(66476007)(52536014)(5660300002)(8676002)(86362001)(33656002)(38070700005)(2906002)(8936002)(4326008)(64756008)(122000001)(66446008)(76116006)(66556008)(316002)(66946007)(55016003)(82960400001)(38100700002)(41300700001)(83380400001)(26005)(6506007)(9686003)(53546011)(186003)(966005)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDAweVphaFJvK3QydlFqd09PcU5oOGtSR0VrZFl0U1pnSWpiTTBYcFdxa1NI?=
 =?utf-8?B?bVZVZCtsVWJld1UxMzduNWNMejBuSmdaL1pUdEF1RjgwMHZ5cHhINTFJQm9m?=
 =?utf-8?B?SjJPZXNHcWtGMi90WG93SXRDYnA4OUpyMFlOdzR1VU1PZ3BrZEY0TEtkVkdM?=
 =?utf-8?B?ejI3bUlJeHE1eXU3ckJyUXlyczU0TW1aa1g5cC9qV054b2s0bTlBS09DS1JY?=
 =?utf-8?B?SW5vOEFlZ2V4ZTUyZHY5LzFwTGNhZjJ5WnNNZjY2aFZDdGtsYnNCbnEvZ1Bu?=
 =?utf-8?B?ZmRmK3dKQzUxb0o2emxtUlA0UVpkdVY3YkdOa2oxdFJDd2c4VHhoQTlOcnNR?=
 =?utf-8?B?blY5OSt1RGxPZDJzd3FPZ2tSOFc0VGdZc2J6dzNkSW1VUVdqYTR0L0FvZUtx?=
 =?utf-8?B?TVNEbE9OVzNFbU1Tdy9aSEV4ZzJQM1F3QzFtTVdBNUwvVWlobUROLzZkTFoz?=
 =?utf-8?B?Q1B4MnJzOFgwRzA1YVpjcE9TWmpzZFMvTE1jSTlGNm1IWWFyZEVCVU05ajZV?=
 =?utf-8?B?c1NTTDdoRUpOTU4xUkxQdHZvSDZLRnYxYTluZldKSTNlMVNGejVaMW1ZWFU4?=
 =?utf-8?B?SXFnTGtQeEwrTVpNSFJNcWJTSGFnczBFRGRYN1F3cHI2LytoNTlHc1p6VlRI?=
 =?utf-8?B?SlpzbHRFK0FBOWRoS0s4UTdIbEJiZHB3N1FYOWZ2dy9iU2hFQWJEVFRTT08y?=
 =?utf-8?B?SStDMk9lV2R5YUFUTnRuRmJ2WFlJTDlDaGpadWdXODI2aThDSlVRL21GZWZt?=
 =?utf-8?B?cTJmeVhsVmZDQ1hrOFRONHdHaW81VUdTYjZCTy9TUkc0c0c5ZnVmK3hiSnJ1?=
 =?utf-8?B?VWd4RHZBeXNCSmpCNTk5WXNZcHpFdTJNZXhaYTVjZm9vY0xMNEdhNHJCZUdN?=
 =?utf-8?B?alRaVFNrbDkvS2VEbG01UTRzUDNLbnZBL3pSVTNxd1dkZTYwdlJNRGhmMEpT?=
 =?utf-8?B?cUtYd3NDSVRNUi9KVGV5VkM2dTRtSlRUU25lQVlXdnF4Z3lGdHNZV3VhY0xm?=
 =?utf-8?B?ZnJvR0taTEV0T1lsOWQxQzU1MFdGOHZVMDFXRVh5TVZQaEZUZm4rQXhocUVF?=
 =?utf-8?B?Yzc3MndHb1dSa1pwZnh4SkcrcEVJWXE2bkM2Z2pLZCtsTEdLeE10b1QxUUl4?=
 =?utf-8?B?anlZSUZXQ2FrU2htcThzU1VueVJEQ3ZwZm42U2hNTFBvbGcxVnoyQVJXMUZo?=
 =?utf-8?B?L3lqNmZMZGZESDFYWGx3dXRLeEZNUXM2L1lRdUlHMlh3S3ZYdldtR0pKK2hB?=
 =?utf-8?B?a3dOSjZ4a0ttM1pJQ3lUYXRoZnZ5MVEvZFRWQUJ4QmJ0WGNZQmt5dWtmaWlS?=
 =?utf-8?B?MTVVOWtiOTdENytFVnFGUCs2bWo2YWVDN2E4cXJRbjZuY2kvS0tjeStPWlg1?=
 =?utf-8?B?U0VnTXNiTkpjc3BIZjFWd0NtbHI2dHhPRWgrcUVvclVIazJBeXN0Qmc0aDBy?=
 =?utf-8?B?OWNES1RleEtMbHlkSnJHZERIZVVnQSt2dHVoUzBPdi9QWHJ4UFIxdlRKRGpq?=
 =?utf-8?B?dWdrdjVCZnFwTEJLdURhS2xkb29QOEdOQ0MwZ2laZGVrR3F1ZE1xVTdkZ2hM?=
 =?utf-8?B?QXRtVHhCb1hpQ21nczIyb000MTFFWXZ5SHFORWxVaC9MSkNUL0h4WmpLT01k?=
 =?utf-8?B?Y0JJTVYyMm5pUkl3VlVXZjBMdU5jd2Nydnp3MWsxQytyV0dwZFR1SkloVVdV?=
 =?utf-8?B?ZCtpRFMwQjFMaG1YVnNtcDRrNWpvRkgvcUZKc0hhNGJUNHpPZE0yb2h0SklB?=
 =?utf-8?B?Nisvc3FyRU9MMkVIMGF2Vk1DT3VWczhIVGNHMUcwUCtTa0ErVEliUkladUF6?=
 =?utf-8?B?WGI2U1YxeXRuVHQ0VGthOVBEekZHb1M2TWcweDkwcG95Qnp0aE01eGRBRUdY?=
 =?utf-8?B?QTQzR01Kb2M5SmMyTVFRMjJlWnJHQXBaUllqekN2MzFieWE3YWZUczdyNjBh?=
 =?utf-8?B?UGsrMlNuc1N5cjNPdHVsS2h5SS90R0V5SHM3OWN6NkhPeUE3Z1NFbFV1bk5H?=
 =?utf-8?B?a09hNVM1d1lRSmhMejQ5WWlyUWgvMER0b2JWdzVnMUVobGlXQTI2SXdOUnZt?=
 =?utf-8?B?ZDU4Q3VBNUZqdlN0aE52VWFTWUdRRVFuYWUyTVg3cWhnMHozRVFaL1hLWjRR?=
 =?utf-8?Q?JMmTmZg8iLHuByK+o7CFnJw3S?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b537aa-9d3b-4c60-3ac4-08db670500f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 03:12:19.1276 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lPhs2ibPeaCd21vte/2/OpLEt9mMhbYuZPltpPxo9fdY51pxQiPLNYbA42WXYgBqt/ohHra7TeuMKUN6YoW3EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6604
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=xiao.w.wang@intel.com; helo=mga03.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFuaWVsIEhlbnJp
cXVlIEJhcmJvemEgPGRiYXJib3phQHZlbnRhbmFtaWNyby5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IEp1bmUgNiwgMjAyMyA2OjMxIFBNDQo+IFRvOiBXYW5nLCBYaWFvIFcgPHhpYW8udy53YW5nQGlu
dGVsLmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogUGFsbWVyIERhYmJlbHQgPHBh
bG1lckBkYWJiZWx0LmNvbT47IEFsaXN0YWlyIEZyYW5jaXMNCj4gPGFsaXN0YWlyLmZyYW5jaXNA
d2RjLmNvbT47IE1lbmcsIEJpbiA8YmluLm1lbmdAd2luZHJpdmVyLmNvbT47IFdlaXdlaQ0KPiBM
aSA8bGl3ZWl3ZWlAaXNjYXMuYWMuY24+OyBMaXUgWmhpd2VpIDx6aGl3ZWlfbGl1QGxpbnV4LmFs
aWJhYmEuY29tPjsgb3Blbg0KPiBsaXN0OlJJU0MtViBUQ0cgQ1BVcyA8cWVtdS1yaXNjdkBub25n
bnUub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSB0YXJnZXQvcmlzY3YvdmVjdG9yX2hlbHBl
ci5jOiBSZW1vdmUgdGhlIGNoZWNrIGZvcg0KPiBleHRyYSB0YWlsIGVsZW1lbnRzDQo+IA0KPiBI
aSwNCj4gDQo+IA0KPiBPbiA2LzYvMjMgMDU6MzQsIFhpYW8gV2FuZyB3cm90ZToNCj4gPiBDb21t
aXQgNzUyNjE0Y2FiOGU2ICgidGFyZ2V0L3Jpc2N2OiBydnY6IEFkZCB0YWlsIGFnbm9zdGljIGZv
ciB2ZWN0b3INCj4gPiBsb2FkIC8gc3RvcmUgaW5zdHJ1Y3Rpb25zIikgYWRkZWQgYW4gZXh0cmEg
Y2hlY2sgZm9yIExNVUwgZnJhZ21lbnRhdGlvbiwNCj4gPiBpbnRlbmRlZCBmb3Igc2V0dGluZyB0
aGUgInJlc3QgdGFpbCBlbGVtZW50cyIgaW4gdGhlIGxhc3QgcmVnaXN0ZXIgZm9yIGENCj4gPiBz
ZWdtZW50IGxvYWQgaW5zbi4NCj4gPg0KPiA+IEFjdHVhbGx5LCB0aGUgbWF4X2VsZW1lbnRzIGRl
cml2ZWQgaW4gdmV4dF9sZCooKSB3b24ndCBiZSBhIGZyYWN0aW9uIG9mDQo+ID4gdmVjdG9yIHJl
Z2lzdGVyIHNpemUsIHNpbmNlIHRoZSBsbXVsIGVuY29kZWQgaW4gZGVzYyBpcyBlbXVsLCB3aGlj
aCBoYXMNCj4gPiBhbHJlYWR5IGJlZW4gYWRqdXN0ZWQgdG8gMSBmb3IgTE1VTCBmcmFnbWVudGF0
aW9uIGNhc2UgYnkNCj4gdmV4dF9nZXRfZW11bCgpDQo+ID4gaW4gdHJhbnNfcnZ2LmMuaW5jLCBm
b3IgbGRfc3RyaWRlKCksIGxkX3VzKCksIGxkX2luZGV4KCkgYW5kIGxkZmYoKS4NCj4gPg0KPiA+
IEJlc2lkZXMsIHZleHRfZ2V0X2VtdWwoKSBoYXMgYWxzbyB0YWtlbiBFRVcvU0VXIGludG8gY29u
c2lkZXJhdGlvbiwgc28NCj4gbm8NCj4gPiBuZWVkIHRvIGNhbGwgdmV4dF9nZXRfdG90YWxfZWxl
bXMoKSB3aGljaCB3b3VsZCBiYXNlIG9uIHRoZSBlbXVsIHRvDQo+IGRlcml2ZQ0KPiA+IGFub3Ro
ZXIgZW11bCwgdGhlIHNlY29uZCBlbXVsIHdvdWxkIGJlIGluY29ycmVjdCB3aGVuIGVzeiBkaWZm
ZXJzIGZyb20NCj4gc2V3Lg0KPiA+DQo+ID4gVGh1cyB0aGlzIHBhdGNoIHJlbW92ZXMgdGhlIGNo
ZWNrIGZvciBleHRyYSB0YWlsIGVsZW1lbnRzLg0KPiA+DQo+ID4gRml4ZXM6IDc1MjYxNGNhYjhl
NiAoInRhcmdldC9yaXNjdjogcnZ2OiBBZGQgdGFpbCBhZ25vc3RpYyBmb3IgdmVjdG9yIGxvYWQg
Lw0KPiBzdG9yZSBpbnN0cnVjdGlvbnMiKQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWGlhbyBX
YW5nIDx4aWFvLncud2FuZ0BpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICB0YXJnZXQvcmlzY3Yv
dmVjdG9yX2hlbHBlci5jIHwgMjEgKysrKysrLS0tLS0tLS0tLS0tLS0tDQo+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS90YXJnZXQvcmlzY3YvdmVjdG9yX2hlbHBlci5jIGIvdGFyZ2V0L3Jpc2N2L3ZlY3Rv
cl9oZWxwZXIuYw0KPiA+IGluZGV4IGY0ZDA0Mzg5ODguLjU2YTc5YmI1ZmEgMTAwNjQ0DQo+ID4g
LS0tIGEvdGFyZ2V0L3Jpc2N2L3ZlY3Rvcl9oZWxwZXIuYw0KPiA+ICsrKyBiL3RhcmdldC9yaXNj
di92ZWN0b3JfaGVscGVyLmMNCj4gPiBAQCAtMjY0LDI2ICsyNjQsMTcgQEAgR0VOX1ZFWFRfU1Rf
RUxFTShzdGVfaCwgaW50MTZfdCwgSDIsIHN0dykNCj4gPiAgIEdFTl9WRVhUX1NUX0VMRU0oc3Rl
X3csIGludDMyX3QsIEg0LCBzdGwpDQo+ID4gICBHRU5fVkVYVF9TVF9FTEVNKHN0ZV9kLCBpbnQ2
NF90LCBIOCwgc3RxKQ0KPiA+DQo+ID4gLXN0YXRpYyB2b2lkIHZleHRfc2V0X3RhaWxfZWxlbXNf
MXMoQ1BVUklTQ1ZTdGF0ZSAqZW52LCB0YXJnZXRfdWxvbmcgdmwsDQo+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqdmQsIHVpbnQzMl90IGRlc2MsIHVpbnQzMl90
IG5mLA0KPiA+ICtzdGF0aWMgdm9pZCB2ZXh0X3NldF90YWlsX2VsZW1zXzFzKHRhcmdldF91bG9u
ZyB2bCwgdm9pZCAqdmQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dWludDMyX3QgZGVzYywgdWludDMyX3QgbmYsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVpbnQzMl90IGVzeiwgdWludDMyX3QgbWF4X2VsZW1zKQ0KPiA+ICAgew0K
PiA+IC0gICAgdWludDMyX3QgdG90YWxfZWxlbXMgPSB2ZXh0X2dldF90b3RhbF9lbGVtcyhlbnYs
IGRlc2MsIGVzeik7DQo+ID4gLSAgICB1aW50MzJfdCB2bGVuYiA9IHJpc2N2X2NwdV9jZmcoZW52
KS0+dmxlbiA+PiAzOw0KPiA+ICAgICAgIHVpbnQzMl90IHZ0YSA9IHZleHRfdnRhKGRlc2MpOw0K
PiA+IC0gICAgdWludDMyX3QgcmVnaXN0ZXJzX3VzZWQ7DQo+ID4gICAgICAgaW50IGs7DQo+ID4N
Cj4gPiAgICAgICBmb3IgKGsgPSAwOyBrIDwgbmY7ICsraykgew0KPiA+ICAgICAgICAgICB2ZXh0
X3NldF9lbGVtc18xcyh2ZCwgdnRhLCAoayAqIG1heF9lbGVtcyArIHZsKSAqIGVzeiwNCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKGsgKiBtYXhfZWxlbXMgKyBtYXhfZWxlbXMpICog
ZXN6KTsNCj4gPiAgICAgICB9DQo+ID4gLQ0KPiA+IC0gICAgaWYgKG5mICogbWF4X2VsZW1zICUg
dG90YWxfZWxlbXMgIT0gMCkgew0KPiA+IC0gICAgICAgIHJlZ2lzdGVyc191c2VkID0gKChuZiAq
IG1heF9lbGVtcykgKiBlc3ogKyAodmxlbmIgLSAxKSkgLyB2bGVuYjsNCj4gPiAtICAgICAgICB2
ZXh0X3NldF9lbGVtc18xcyh2ZCwgdnRhLCAobmYgKiBtYXhfZWxlbXMpICogZXN6LA0KPiA+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ2lzdGVyc191c2VkICogdmxlbmIpOw0KPiA+IC0g
ICAgfQ0KPiA+ICAgfQ0KPiANCj4gDQo+IENhbiB5b3UgcGxlYXNlIHJlYmFzZSBpdCBvbiB0b3Ag
b2YgbWFzdGVyPyBUaGlzIGZ1bmN0aW9uIGhhcyBhdCBsZWFzdCBvbmUNCj4gY2hhbmdlIChhIHZ0
YSBjaGVjayByaWdodCBhdCB0aGUgc3RhcnQpIHRoYXQgaXNuJ3QgYWNjb3VudGVkIGZvciBpbiB0
aGlzDQo+IHBhdGNoLg0KPiANCj4gQ29kZSBMR1RNIG90aGVyd2lzZS4gVGhhbmtzLA0KPiANCj4g
DQo+IERhbmllbA0KPiANCg0KT0suIEkgdGhpbmsgeW91IHJlZmVyIHRvIHRoZSByaXNjdi10by1h
cHBseS5uZXh0IGJyYW5jaCBpbiBodHRwczovL2dpdGh1Yi5jb20vYWxpc3RhaXIyMy9xZW11Lmdp
dCwgSSBzZWUgdGhlIHZ0YSBjaGVjayBpbiB0aGF0IGJyYW5jaCBvbmx5Lg0KV291bGQgZG8gYSBy
ZWJhc2UuIFRoYW5rcy4NCg0KLVhpYW8NCg0K

