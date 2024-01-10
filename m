Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4031AC4706C
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 01:26:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNNMd-00025Q-FX; Tue, 09 Jan 2024 20:26:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alvinga@andestech.com>)
 id 1rNNMb-000242-GJ
 for qemu-riscv@nongnu.org; Tue, 09 Jan 2024 20:26:38 -0500
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70]
 helo=Atcsqr.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alvinga@andestech.com>)
 id 1rNNMX-0005C0-8K
 for qemu-riscv@nongnu.org; Tue, 09 Jan 2024 20:26:36 -0500
Received: from mail.andestech.com (ATCPCS33.andestech.com [10.0.1.100])
 by Atcsqr.andestech.com with ESMTP id 40A1QG2I063281;
 Wed, 10 Jan 2024 09:26:16 +0800 (+08)
 (envelope-from alvinga@andestech.com)
Received: from ATCPCS33.andestech.com (10.0.1.100) by ATCPCS33.andestech.com
 (10.0.1.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Wed, 10 Jan
 2024 09:26:16 +0800
Received: from ATCPCS31.andestech.com (10.0.1.89) by ATCPCS33.andestech.com
 (10.0.1.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7 via Frontend
 Transport; Wed, 10 Jan 2024 09:26:16 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (104.47.26.111)
 by mail.andestech.com (10.0.1.89) with Microsoft SMTP Server (TLS) id
 14.3.498.0; Wed, 10 Jan 2024 09:26:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FquUdpjtNuvteY1LfPkUbNFWwpDqpVormO3oMLOF0h1B4UPhR6wFWgBUjp7fQMQ9wwCRaOO/7a7MJXA/143pznK34ZfMBKj2mdRQ7sznsMxy3K75TjPHW9q4fb5kYrO32WbCs1kdowQjxhJbWoYVW+l9YM6piBDXYois2D0o4hR3gUWEQ1NBkxio1tfwrWFDxK77wBxMj5Xoa+oe1/CS54SXQ+YZUVrxTv/+iS7QwfDhSo4lt03CDTDrTbInstk19ni2yRmcPW8mKIbGyvvJ0wGes88DjHZBM4OE7ymJAM1jM7amb6crO6ew+5OrLDVjQ7n+b6t5gxjfqfgBTOTLTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZQwuznag6FKym4uX0GCQ856uRPZldTzGIVkpx/c82M=;
 b=ShoUGroMpZrjJdWK1JxircQAkV9efxSezixEoCbbcFBEhmEXWDdM0qqaT+CS+OuUDeqbPlYwXUXpr35WcyHrKVacHFplagvGcmF6/hKSiyK8ycfJSqxqo3DeyOCZojeQyE0UV4MZOz0klHVsbUmvKKRyXKlsxsZ9HZxku1gQl7UYS5gVvowdClATEryYT1odSBF5odUX+Jhf4z0YL0KIo3HDj7UiDwy3rOnRXiw0+uThODlHFOUlbelHXjoyyLUX9efxgP71iJJsW7pkDUF1fE8Y/UJXjWA4tSaGuuL2/S3MMI9W2KqkMEZRlfbtQe2r0V3Y9tBID6ajVLdSqCPLoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=andestech.com; dmarc=pass action=none
 header.from=andestech.com; dkim=pass header.d=andestech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andestech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZQwuznag6FKym4uX0GCQ856uRPZldTzGIVkpx/c82M=;
 b=e7TQkQG+83RvxRm9U6JjCgtVGDysukQwBb6xWLGeb7C9VMwYBm3xuUVtJQC5XIfc39+Uq70Fgy1BVfu5yl5o9xtIZePGIlu5dEW3JXU1QSgSnwMHH1f5WHcwed7KpPT+FucdH+x+6Pc1P51yrDLuogYjdTqFUZon+QcccZrcAzYTH1QhwetuTVOItPpj5/BFHHJeO87KPTBudXZkCzntf6fLIu6kC9FXw9NPQIfqdvut22JZ8OBHsejtr89gP5VTmosVzRv0eysSLyaeK23fIc5QdMsAHWWInw40kddi1AQaC+ibq3bagUI+xQSBVQP9oK8h3pB4qyurFjpmF1WfzQ==
Received: from SEYPR03MB6700.apcprd03.prod.outlook.com (2603:1096:101:69::14)
 by SEYPR03MB7480.apcprd03.prod.outlook.com (2603:1096:101:142::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 01:26:06 +0000
Received: from SEYPR03MB6700.apcprd03.prod.outlook.com
 ([fe80::f382:7607:9bc5:eac]) by SEYPR03MB6700.apcprd03.prod.outlook.com
 ([fe80::f382:7607:9bc5:eac%3]) with mapi id 15.20.7181.015; Wed, 10 Jan 2024
 01:26:05 +0000
From: =?utf-8?B?QWx2aW4gQ2hlLUNoaWEgQ2hhbmco5by15ZOy5ZiJKQ==?=
 <alvinga@andestech.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "alistair.francis@wdc.com" <alistair.francis@wdc.com>,
 "bin.meng@windriver.com" <bin.meng@windriver.com>, "liwei1518@gmail.com"
 <liwei1518@gmail.com>, "zhiwei_liu@linux.alibaba.com"
 <zhiwei_liu@linux.alibaba.com>
Subject: RE: [PATCH v2] target/riscv: Implement optional CSR mcontext of debug
 Sdtrig extension
Thread-Topic: [PATCH v2] target/riscv: Implement optional CSR mcontext of
 debug Sdtrig extension
Thread-Index: AQHaMnd8iF+Hn0qQ20y+KlIYsjwc/bDSKrEAgAA27+A=
Date: Wed, 10 Jan 2024 01:26:05 +0000
Message-ID: <SEYPR03MB67002D639E8B409A03FC2D17A8692@SEYPR03MB6700.apcprd03.prod.outlook.com>
References: <20231219123244.290935-1-alvinga@andestech.com>
 <8b57cb47-6344-4563-95f7-21f6b090c1b0@ventanamicro.com>
In-Reply-To: <8b57cb47-6344-4563-95f7-21f6b090c1b0@ventanamicro.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=andestech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6700:EE_|SEYPR03MB7480:EE_
x-ms-office365-filtering-correlation-id: e68d90b6-47e9-447e-7df4-08dc117b1da6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JZRZHoOCbvxPAMqoaz5Wt1lR+bmyydgAhHatG8v1E+rti/HT4volFxWizJg1JQ4mhw9ONyngsWQF2yiCaK5k0LqtctvIEvLfj4QmthLQEU7HFWjYNk/whw1oZHICRjC/SfGMVb/4+ylb6iikASSbF1NvUsH+QhiKvfp+sqKcq+sdfSH2iGBXNvCOnLswVfBa3JC7qjRXrmc6dUHJOGcl7PE8CV1JCagMlO9qnUFS4MDDI1/S4xNebWXuVeLo9Pd4G2F2wB+jsUjsEeYEPRDfF4aQ0SBOkITGFi1El9DnbWz0OHd+tL6uJWd7kfepxsGV8NrejEgf3w89IH8qsp26MFcdxjwXsf9NmafCN4sC0cN9xrYTxBIkoISTbxZZQ154he88q0yGXkJf39ucnpElmvWzHpXnhhFO/biH6iqw9+uQ1RS+DfxaWN+Zmv+Hx1YZPambRMKavG7fh078H1YCuu2LVJKQFqjsAFspk3sQSa0/X6VXst4I2YtNOSQyHU5Np25AtiHu039jGVHvWAUoI7g409dq7BwCcHGeEWA1Esqr0ABlmfLcWEmPwPH9HXGkhT8JxJEEd/5aPz5DBmmVNsO0/veDvxmEEBc3OadpbvFRcYXCA24FL6/qDYw2bjowTUkn70uIXH16yF/eCWvqG6gHLJkZev/ZEeHJF8lOqKA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB6700.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(366004)(346002)(39840400004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(71200400001)(7696005)(4326008)(52536014)(38100700002)(76116006)(6506007)(66446008)(66476007)(9686003)(8936002)(66946007)(8676002)(64756008)(110136005)(66556008)(53546011)(54906003)(316002)(83380400001)(26005)(478600001)(55016003)(2906002)(5660300002)(122000001)(33656002)(85182001)(86362001)(41300700001)(38070700009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZzRhcGdNcERuV3YyYVF1NTNVWGdaSlI4OEFpbitucXlzYXQydlp2MXludVNn?=
 =?utf-8?B?RDFhalBhbXRFVitoWHJ5RHVMTDczcS9VYVlkSXRKdDRndlV2VXVwSjl2cnBJ?=
 =?utf-8?B?WnVDSlVMS2JxMVF2VlBoWlozVmZ5YUIzYVQ0a2MzWlFzUlVOOWZGR3o4clRx?=
 =?utf-8?B?UWUyeHIzUmhKZ1F0d3AwRnpTSWlwT3BYM242STJwekVrODhTS2tIcGlTRUM3?=
 =?utf-8?B?VDlZY2hyOTcrMzRiV0xaS2ZmMGFVenArbXRLUFBqamVmRFY0YlJpN1pLd05n?=
 =?utf-8?B?ekNYY29zZlBnM08wVTJYeW1RWnhDV2R5Tk81TzZRMTBZUVdjUGdESHEzUzhr?=
 =?utf-8?B?V3hpZ1kvOG5ndzhvRnU3aldpbFI0N1pxU3l1bWRpQkQvMnF5UEJUZXYyUHV2?=
 =?utf-8?B?OHlrQjhkUjVsVTJkcnZuYlNuWWdQandtekdHRTJtNHJpNDJCM1dFTmZFdnh6?=
 =?utf-8?B?UU9RVFBFWndZMEVVSkdOY25aNit2aXI0MFpBeDdXVjRkSk5UT3JUMisvY2Nx?=
 =?utf-8?B?YmpTRkVLaGNQVHkrdWp5NXQ2a2xUeHVoVnhNZWlmK0huRnB1aEhvL1ptcTlG?=
 =?utf-8?B?eTU1QWR6czdOZFBobzJLL1d4cnlsYTJRNGliY3B6Um1sRTdWSVU4VG93RlI0?=
 =?utf-8?B?Rm1weDJYTWxPbjdJY0dzdXNOeEFvZUVBTklzRTJYell5WEo4QXlYS014UzZB?=
 =?utf-8?B?am1HdXBzZDZmcExEVDI3cWhrYlc5L1BRQ2R2b1dRTDJpSmhmalhuZVF0VDlw?=
 =?utf-8?B?QlR2WnBMckUrOThnb3pUaDEvSVJvREcrTmViNStoWlB1eDZITWxadXF2SHM2?=
 =?utf-8?B?QTVIcHhxcThENUhsaEo5eFljdFRPQ2k4OU5yTXRBQlB1OEFBQkdXK0piTm1V?=
 =?utf-8?B?L1BwRCsrR0ZBb0NkVGdCc2FFbklWbGt5QkQyVVJJaFM5eGZVbUVLK1BKQTN3?=
 =?utf-8?B?SVRoNVM3WXlzamU1aEoyNnBrM3ZmN2NWb0M3ZFZYZVNRdFh3U2dUVkp0K1VS?=
 =?utf-8?B?OUplSlU1NVVXaFZqSDlMQ1BXaENhY2hzUjBsVG5iMW9xb204MXpFeDBibG01?=
 =?utf-8?B?WHRFMUZLNFNDS0QzblZ5Q1FZQVErQmVSQnVTVmpIeFNPdklwcUVxRkMrNHU3?=
 =?utf-8?B?Q0dUTTJHL2M0YkVvaS9neDRBT1IvMTBQL0ZPeDFmZVQvYk1jNDJhaWFOcmdt?=
 =?utf-8?B?bWJiSkFaREsxMDlHdXIxL3g5QmgrRzh3MlluSzZEbWpVcE5iZXdUWWZkNHNV?=
 =?utf-8?B?cXluVDI4MkpON1I4UmVWRUV1RkEybm9jQ28vY2gybENxeDVEWmYzY0hyYkpR?=
 =?utf-8?B?WUYya0VSL25kcDE2YVQwbnZZNzVSaG5DYVRDdmFyQW1ieWlYaXcveGNxSmYw?=
 =?utf-8?B?RFJSYS9QMHRVRnVXeUUzbEZYNXNwMzlIOHRFTUp0ZHNBbzJqM2Ntc3RrQzJ4?=
 =?utf-8?B?WnVaK1djMmY4T25TcDNPemoyV29NNmh0VUhOUGdncW1ESnBoLytWcmZnU2Nx?=
 =?utf-8?B?Q3JrQ0V2OVk3NW80TFdGKzRpc2dpVlp0UVg3SVEvWVU4bFV4TXFpei9PVml0?=
 =?utf-8?B?NmoxR3laREh1dk9md3A5L2MvcHk2QnplZXIwaG15ZURRbWNMeStKWDBQaUNC?=
 =?utf-8?B?eVh5Z3ZhNzRHbjVoRzRBSTFreFVWK1orUG94c0krRXg2TDVpeFd2QmFtOHUr?=
 =?utf-8?B?UVdSbHpGeWUrdUFjMUZaa1NnLzZteGFNbjhYU1Z2QXVSK3I2bXUzOUNTN1lW?=
 =?utf-8?B?YWxhSU0xa2NQaG1kSk13NkZyanJkRW52Mk5BUE9ZcXBsblo3cDE0RjBpQjQy?=
 =?utf-8?B?aTNvT2FhWWUydVF3TFg5TmJIS0xmYmZWRUlOaEpyck1IOFdoUUVmWktGTm5C?=
 =?utf-8?B?eUlqMVFEWlBoNFc2ZXNSNnZvdXNpRnlDZzVPd203N1o5bUc5bnVBOW5zaTdl?=
 =?utf-8?B?dzc2M0hjYkJRcnQvaHhyNG05Ui9Ic0dRT2xxcDVGNzVkTTd2QWtjRzhodFpB?=
 =?utf-8?B?RXBlWHJIVjJzWjVyUE9meVI0OUQ5V2NDVk5TSmtnSGwrTG0yVGRjclJ4SVlF?=
 =?utf-8?B?VzBtMUp4L29MU0tTeFl5czdPMzFDaGxzMmtINEFnSE04K2Z2am1ib1Y5Mkhm?=
 =?utf-8?Q?5dV60ypEED12kqrg8GlmCSG31?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6700.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e68d90b6-47e9-447e-7df4-08dc117b1da6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2024 01:26:05.5753 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e3ec21b7-ec6c-4041-9add-61aea8171458
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UkZjTCaVRDGjnfXKW+SoA+zjAdToa7dhNvDxF8fdM8AU1ewLhH0vX7hKw67L6k7HY+czxdHpE5wLvX4uPDO5Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7480
X-OriginatorOrg: andestech.com
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 40A1QG2I063281
Received-SPF: pass client-ip=60.248.80.70; envelope-from=alvinga@andestech.com;
 helo=Atcsqr.andestech.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_DYNAMIC=0.982,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, TVD_RCVD_IP=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEYW5pZWwgSGVucmlxdWUgQmFy
Ym96YSA8ZGJhcmJvemFAdmVudGFuYW1pY3JvLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBKYW51
YXJ5IDEwLCAyMDI0IDY6MDQgQU0NCj4gVG86IEFsdmluIENoZS1DaGlhIENoYW5nKOW8teWTsuWY
iSkgPGFsdmluZ2FAYW5kZXN0ZWNoLmNvbT47DQo+IHFlbXUtcmlzY3ZAbm9uZ251Lm9yZzsgcWVt
dS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBhbGlzdGFpci5mcmFuY2lzQHdkYy5jb207IGJpbi5t
ZW5nQHdpbmRyaXZlci5jb207DQo+IGxpd2VpMTUxOEBnbWFpbC5jb207IHpoaXdlaV9saXVAbGlu
dXguYWxpYmFiYS5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gdGFyZ2V0L3Jpc2N2OiBJ
bXBsZW1lbnQgb3B0aW9uYWwgQ1NSIG1jb250ZXh0IG9mDQo+IGRlYnVnIFNkdHJpZyBleHRlbnNp
b24NCj4gDQo+IA0KPiBPbiAxMi8xOS8yMyAwOTozMiwgQWx2aW4gQ2hhbmcgd3JvdGU6DQo+ID4g
VGhlIGRlYnVnIFNkdHJpZyBleHRlbnNpb24gZGVmaW5lcyBhbiBDU1IgIm1jb250ZXh0Ii4gVGhp
cyBjb21taXQNCj4gPiBpbXBsZW1lbnRzIGl0cyBwcmVkaWNhdGUgYW5kIHJlYWQvd3JpdGUgb3Bl
cmF0aW9ucyBpbnRvIENTUiB0YWJsZS4NCj4gPiBJdHMgdmFsdWUgaXMgcmVzZXQgYXMgMCB3aGVu
IHRoZSB0cmlnZ2VyIG1vZHVsZSBpcyByZXNldC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFs
dmluIENoYW5nIDxhbHZpbmdhQGFuZGVzdGVjaC5jb20+DQo+ID4gLS0tDQo+IA0KPiBUaGUgcGF0
Y2ggcGVyIHNlIExHVE06DQo+IA0KPiBSZXZpZXdlZC1ieTogRGFuaWVsIEhlbnJpcXVlIEJhcmJv
emEgPGRiYXJib3phQHZlbnRhbmFtaWNyby5jb20+DQoNClRoYW5rIHlvdSEhDQoNCj4gDQo+IA0K
PiBCdXQgSSBoYXZlIGEgcXVlc3Rpb246IHNob3VsZG4ndCB3ZSBqdXN0IGdvIGFoZWFkIGFuZCBh
ZGQgdGhlICdzZHRyaWcnDQo+IGV4dGVuc2lvbj8NCj4gV2UgaGF2ZSBhIGhhbmRmdWwgb2YgaXRz
IENTUnMgYWxyZWFkeS4gQWRkaW5nIHRoZSBleHRlbnNpb24gd291bGQgYWxzbyBhZGQNCj4gJ3Nk
dHJpZycNCj4gaW4gcmlzY3YsaXNhLCBhbGxvd2luZyBzb2Z0d2FyZSB0byBiZSBhd2FyZSBvZiBp
dHMgZXhpc3RlbmNlIGluIFFFTVUuDQoNCkkgYWdyZWUgd2l0aCB5b3UuIEkgY2FuIHByZXBhcmUg
YW5vdGhlciBQUiBmb3IgYWRkaW5nICdzZHRyaWcnIGV4dGVuc2lvbi4NCkJUVywgY3VycmVudGx5
IHdlIGhhdmUgInJpc2N2X2NwdV9jZmcoZW52KS0+ZGVidWciIHRvIGNvbnRyb2wgdGhvc2UgdHJp
Z2dlciBtb2R1bGUgQ1NScy4NCk1heWJlIHdlIGNhbiBqdXN0IHJlbW92ZSAiZGVidWciIGFuZCB1
c2UgInNkdHJpZyIgaW5zdGVhZCA/IA0KDQpBbHZpbg0KDQo+IA0KPiANCj4gVGhhbmtzLA0KPiAN
Cj4gRGFuaWVsDQo+IA0KPiANCj4gDQo+ID4gQ2hhbmdlcyBmcm9tIHYxOiBSZW1vdmUgZGVkaWNh
dGVkIGNmZywgYWx3YXlzIGltcGxlbWVudCBtY29udGV4dC4NCj4gPg0KPiA+ICAgdGFyZ2V0L3Jp
c2N2L2NwdS5oICAgICAgfCAgMSArDQo+ID4gICB0YXJnZXQvcmlzY3YvY3B1X2JpdHMuaCB8ICA3
ICsrKysrKysNCj4gPiAgIHRhcmdldC9yaXNjdi9jc3IuYyAgICAgIHwgMzYgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tDQo+ID4gICB0YXJnZXQvcmlzY3YvZGVidWcuYyAgICB8
ICAyICsrDQo+ID4gICA0IGZpbGVzIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3Jpc2N2L2NwdS5oIGIvdGFyZ2V0
L3Jpc2N2L2NwdS5oIGluZGV4DQo+ID4gZDc0YjM2MS4uZTExNzY0MSAxMDA2NDQNCj4gPiAtLS0g
YS90YXJnZXQvcmlzY3YvY3B1LmgNCj4gPiArKysgYi90YXJnZXQvcmlzY3YvY3B1LmgNCj4gPiBA
QCAtMzQ1LDYgKzM0NSw3IEBAIHN0cnVjdCBDUFVBcmNoU3RhdGUgew0KPiA+ICAgICAgIHRhcmdl
dF91bG9uZyB0ZGF0YTFbUlZfTUFYX1RSSUdHRVJTXTsNCj4gPiAgICAgICB0YXJnZXRfdWxvbmcg
dGRhdGEyW1JWX01BWF9UUklHR0VSU107DQo+ID4gICAgICAgdGFyZ2V0X3Vsb25nIHRkYXRhM1tS
Vl9NQVhfVFJJR0dFUlNdOw0KPiA+ICsgICAgdGFyZ2V0X3Vsb25nIG1jb250ZXh0Ow0KPiA+ICAg
ICAgIHN0cnVjdCBDUFVCcmVha3BvaW50ICpjcHVfYnJlYWtwb2ludFtSVl9NQVhfVFJJR0dFUlNd
Ow0KPiA+ICAgICAgIHN0cnVjdCBDUFVXYXRjaHBvaW50ICpjcHVfd2F0Y2hwb2ludFtSVl9NQVhf
VFJJR0dFUlNdOw0KPiA+ICAgICAgIFFFTVVUaW1lciAqaXRyaWdnZXJfdGltZXJbUlZfTUFYX1RS
SUdHRVJTXTsgZGlmZiAtLWdpdA0KPiA+IGEvdGFyZ2V0L3Jpc2N2L2NwdV9iaXRzLmggYi90YXJn
ZXQvcmlzY3YvY3B1X2JpdHMuaCBpbmRleA0KPiA+IGViZDc5MTcuLjMyOTY2NDggMTAwNjQ0DQo+
ID4gLS0tIGEvdGFyZ2V0L3Jpc2N2L2NwdV9iaXRzLmgNCj4gPiArKysgYi90YXJnZXQvcmlzY3Yv
Y3B1X2JpdHMuaA0KPiA+IEBAIC0zNjEsNiArMzYxLDcgQEANCj4gPiAgICNkZWZpbmUgQ1NSX1RE
QVRBMiAgICAgICAgICAweDdhMg0KPiA+ICAgI2RlZmluZSBDU1JfVERBVEEzICAgICAgICAgIDB4
N2EzDQo+ID4gICAjZGVmaW5lIENTUl9USU5GTyAgICAgICAgICAgMHg3YTQNCj4gPiArI2RlZmlu
ZSBDU1JfTUNPTlRFWFQgICAgICAgIDB4N2E4DQo+ID4NCj4gPiAgIC8qIERlYnVnIE1vZGUgUmVn
aXN0ZXJzICovDQo+ID4gICAjZGVmaW5lIENTUl9EQ1NSICAgICAgICAgICAgMHg3YjANCj4gPiBA
QCAtOTA1LDQgKzkwNiwxMCBAQCB0eXBlZGVmIGVudW0gUklTQ1ZFeGNlcHRpb24gew0KPiA+ICAg
LyogSlZUIENTUiBiaXRzICovDQo+ID4gICAjZGVmaW5lIEpWVF9NT0RFICAgICAgICAgICAgICAg
ICAgICAgICAgICAgMHgzRg0KPiA+ICAgI2RlZmluZSBKVlRfQkFTRSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICh+MHgzRikNCj4gPiArDQo+ID4gKy8qIERlYnVnIFNkdHJpZyBDU1IgbWFza3Mg
Ki8NCj4gPiArI2RlZmluZSBNQ09OVEVYVDMyICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAw
MDAwM0YNCj4gPiArI2RlZmluZSBNQ09OVEVYVDY0DQo+IDB4MDAwMDAwMDAwMDAwMUZGRlVMTA0K
PiA+ICsjZGVmaW5lIE1DT05URVhUMzJfSENPTlRFWFQgICAgICAgICAgICAgICAgMHgwMDAwMDA3
Rg0KPiA+ICsjZGVmaW5lIE1DT05URVhUNjRfSENPTlRFWFQNCj4gMHgwMDAwMDAwMDAwMDAzRkZG
VUxMDQo+ID4gICAjZW5kaWYNCj4gPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3Jpc2N2L2Nzci5jIGIv
dGFyZ2V0L3Jpc2N2L2Nzci5jIGluZGV4DQo+ID4gZmRlN2NlMS4uZmYxZTEyOCAxMDA2NDQNCj4g
PiAtLS0gYS90YXJnZXQvcmlzY3YvY3NyLmMNCj4gPiArKysgYi90YXJnZXQvcmlzY3YvY3NyLmMN
Cj4gPiBAQCAtMzkwMCw2ICszOTAwLDMxIEBAIHN0YXRpYyBSSVNDVkV4Y2VwdGlvbiByZWFkX3Rp
bmZvKENQVVJJU0NWU3RhdGUNCj4gKmVudiwgaW50IGNzcm5vLA0KPiA+ICAgICAgIHJldHVybiBS
SVNDVl9FWENQX05PTkU7DQo+ID4gICB9DQo+ID4NCj4gPiArc3RhdGljIFJJU0NWRXhjZXB0aW9u
IHJlYWRfbWNvbnRleHQoQ1BVUklTQ1ZTdGF0ZSAqZW52LCBpbnQgY3Nybm8sDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRhcmdldF91bG9uZyAqdmFsKSB7DQo+ID4g
KyAgICAqdmFsID0gZW52LT5tY29udGV4dDsNCj4gPiArICAgIHJldHVybiBSSVNDVl9FWENQX05P
TkU7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBSSVNDVkV4Y2VwdGlvbiB3cml0ZV9tY29u
dGV4dChDUFVSSVNDVlN0YXRlICplbnYsIGludCBjc3JubywNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHRhcmdldF91bG9uZyB2YWwpIHsNCj4gPiArICAgIGJvb2wg
cnYzMiA9IHJpc2N2X2NwdV9teGwoZW52KSA9PSBNWExfUlYzMiA/IHRydWUgOiBmYWxzZTsNCj4g
PiArICAgIGludDMyX3QgbWFzazsNCj4gPiArDQo+ID4gKyAgICBpZiAocmlzY3ZfaGFzX2V4dChl
bnYsIFJWSCkpIHsNCj4gPiArICAgICAgICAvKiBTcGVjIHN1Z2dlc3QgNy1iaXQgZm9yIFJWMzIg
YW5kIDE0LWJpdCBmb3IgUlY2NCB3LyBIIGV4dGVuc2lvbg0KPiAqLw0KPiA+ICsgICAgICAgIG1h
c2sgPSBydjMyID8gTUNPTlRFWFQzMl9IQ09OVEVYVCA6DQo+IE1DT05URVhUNjRfSENPTlRFWFQ7
DQo+ID4gKyAgICB9IGVsc2Ugew0KPiA+ICsgICAgICAgIC8qIFNwZWMgc3VnZ2VzdCA2LWJpdCBm
b3IgUlYzMiBhbmQgMTMtYml0IGZvciBSVjY0IHcvbyBIDQo+IGV4dGVuc2lvbiAqLw0KPiA+ICsg
ICAgICAgIG1hc2sgPSBydjMyID8gTUNPTlRFWFQzMiA6IE1DT05URVhUNjQ7DQo+ID4gKyAgICB9
DQo+ID4gKw0KPiA+ICsgICAgZW52LT5tY29udGV4dCA9IHZhbCAmIG1hc2s7DQo+ID4gKyAgICBy
ZXR1cm4gUklTQ1ZfRVhDUF9OT05FOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICAgLyoNCj4gPiAgICAq
IEZ1bmN0aW9ucyB0byBhY2Nlc3MgUG9pbnRlciBNYXNraW5nIGZlYXR1cmUgcmVnaXN0ZXJzDQo+
ID4gICAgKiBXZSBoYXZlIHRvIGNoZWNrIGlmIGN1cnJlbnQgcHJpdiBsdmwgY291bGQgbW9kaWZ5
IEBAIC00Nzk0LDExDQo+ID4gKzQ4MTksMTIgQEAgcmlzY3ZfY3NyX29wZXJhdGlvbnMgY3NyX29w
c1tDU1JfVEFCTEVfU0laRV0gPSB7DQo+ID4gICAgICAgW0NTUl9QTVBBRERSMTVdID0gIHsgInBt
cGFkZHIxNSIsIHBtcCwgcmVhZF9wbXBhZGRyLA0KPiA+IHdyaXRlX3BtcGFkZHIgfSwNCj4gPg0K
PiA+ICAgICAgIC8qIERlYnVnIENTUnMgKi8NCj4gPiAtICAgIFtDU1JfVFNFTEVDVF0gICA9ICB7
ICJ0c2VsZWN0IiwgZGVidWcsIHJlYWRfdHNlbGVjdCwgd3JpdGVfdHNlbGVjdCB9LA0KPiA+IC0g
ICAgW0NTUl9UREFUQTFdICAgID0gIHsgInRkYXRhMSIsICBkZWJ1ZywgcmVhZF90ZGF0YSwNCj4g
d3JpdGVfdGRhdGEgICB9LA0KPiA+IC0gICAgW0NTUl9UREFUQTJdICAgID0gIHsgInRkYXRhMiIs
ICBkZWJ1ZywgcmVhZF90ZGF0YSwNCj4gd3JpdGVfdGRhdGEgICB9LA0KPiA+IC0gICAgW0NTUl9U
REFUQTNdICAgID0gIHsgInRkYXRhMyIsICBkZWJ1ZywgcmVhZF90ZGF0YSwNCj4gd3JpdGVfdGRh
dGEgICB9LA0KPiA+IC0gICAgW0NTUl9USU5GT10gICAgID0gIHsgInRpbmZvIiwgICBkZWJ1Zywg
cmVhZF90aW5mbywNCj4gd3JpdGVfaWdub3JlICB9LA0KPiA+ICsgICAgW0NTUl9UU0VMRUNUXSAg
ID0gIHsgInRzZWxlY3QiLCAgZGVidWcsIHJlYWRfdHNlbGVjdCwNCj4gd3JpdGVfdHNlbGVjdCAg
fSwNCj4gPiArICAgIFtDU1JfVERBVEExXSAgICA9ICB7ICJ0ZGF0YTEiLCAgIGRlYnVnLCByZWFk
X3RkYXRhLA0KPiB3cml0ZV90ZGF0YSAgICB9LA0KPiA+ICsgICAgW0NTUl9UREFUQTJdICAgID0g
IHsgInRkYXRhMiIsICAgZGVidWcsIHJlYWRfdGRhdGEsDQo+IHdyaXRlX3RkYXRhICAgIH0sDQo+
ID4gKyAgICBbQ1NSX1REQVRBM10gICAgPSAgeyAidGRhdGEzIiwgICBkZWJ1ZywgcmVhZF90ZGF0
YSwNCj4gd3JpdGVfdGRhdGEgICAgfSwNCj4gPiArICAgIFtDU1JfVElORk9dICAgICA9ICB7ICJ0
aW5mbyIsICAgIGRlYnVnLCByZWFkX3RpbmZvLA0KPiB3cml0ZV9pZ25vcmUgICB9LA0KPiA+ICsg
ICAgW0NTUl9NQ09OVEVYVF0gID0gIHsgIm1jb250ZXh0IiwgZGVidWcsIHJlYWRfbWNvbnRleHQs
DQo+ID4gKyB3cml0ZV9tY29udGV4dCB9LA0KPiA+DQo+ID4gICAgICAgLyogVXNlciBQb2ludGVy
IE1hc2tpbmcgKi8NCj4gPiAgICAgICBbQ1NSX1VNVEVdICAgID0gICAgeyAidW10ZSIsICAgIHBv
aW50ZXJfbWFza2luZywgcmVhZF91bXRlLA0KPiB3cml0ZV91bXRlIH0sDQo+ID4gZGlmZiAtLWdp
dCBhL3RhcmdldC9yaXNjdi9kZWJ1Zy5jIGIvdGFyZ2V0L3Jpc2N2L2RlYnVnLmMgaW5kZXgNCj4g
PiA0OTQ1ZDFhLi5lMzBkOTljIDEwMDY0NA0KPiA+IC0tLSBhL3RhcmdldC9yaXNjdi9kZWJ1Zy5j
DQo+ID4gKysrIGIvdGFyZ2V0L3Jpc2N2L2RlYnVnLmMNCj4gPiBAQCAtOTQwLDQgKzk0MCw2IEBA
IHZvaWQgcmlzY3ZfdHJpZ2dlcl9yZXNldF9ob2xkKENQVVJJU0NWU3RhdGUgKmVudikNCj4gPiAg
ICAgICAgICAgZW52LT5jcHVfd2F0Y2hwb2ludFtpXSA9IE5VTEw7DQo+ID4gICAgICAgICAgIHRp
bWVyX2RlbChlbnYtPml0cmlnZ2VyX3RpbWVyW2ldKTsNCj4gPiAgICAgICB9DQo+ID4gKw0KPiA+
ICsgICAgZW52LT5tY29udGV4dCA9IDA7DQo+ID4gICB9DQo=

