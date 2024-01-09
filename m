Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C898C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 00:56:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rN0PT-0007XU-Vh; Mon, 08 Jan 2024 19:56:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alvinga@andestech.com>)
 id 1rN0PQ-0007XG-5l
 for qemu-riscv@nongnu.org; Mon, 08 Jan 2024 19:56:00 -0500
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70]
 helo=Atcsqr.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alvinga@andestech.com>)
 id 1rN0PI-0003kI-E7
 for qemu-riscv@nongnu.org; Mon, 08 Jan 2024 19:55:57 -0500
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTP id 4090tbus010308;
 Tue, 9 Jan 2024 08:55:37 +0800 (+08)
 (envelope-from alvinga@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Tue, 9 Jan 2024
 08:55:38 +0800
Received: from ATCPCS31.andestech.com (10.0.1.89) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7 via Frontend
 Transport; Tue, 9 Jan 2024 08:55:38 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (104.47.110.40)
 by mail.andestech.com (10.0.1.89) with Microsoft SMTP Server (TLS) id
 14.3.498.0; Tue, 9 Jan 2024 08:55:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KaeoMlNNWTp3CrVwTR+aQlOomZRHA63SXhyKMc/vKO/8X7P1ZRYNvS32icYdkLAbYi0gvvsYj3edXD4E3sAXmmfkHVNtizesr3Yy6J5Qheqbx98cESg8buAVIqnqzDZo+AWbYiL6ISGTa0XWNeopWvx+Td/e/BeRqBGAKrjsSX3p8g1KDI/Kx5I0aChj/ZKC2f2O6/YatqDakOgVJyB/XmR4PpVfET5gjnYi/+dDiHiRN+q39cilr7ZUSQa4b5ygidQZV72rPycrQyc2/z3sd3ulqus1uhObGd8PsbHArTa3QO94yqFUA611m+VzHqwF1+26N1pq22XtmLjKuzlqdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SggvziFXXAiLfClquzNDn8udi/iniCZoYct4/rD3ks=;
 b=AYmE6H0zviHaiNl1l5v6icfa1t5797yGSj8fE8ZunWjfyvJAI0e82+LLpWXaEhtVe4urCPwIjGiCMG4Ha+h9D2OG5U7TsN5xxdoYXpfQLjl3C77EsT+80gL2joS26eH44BX/UXLRWQ65dcbcEaWK7gScKzZiDV6Gi6XQIYk/jLyuEcGBC/rggLa7ZUVsDwpzVLFKjwNJ823yOJdE+l1ioNteRNcEABx6VtWGfeoVay1oRKyx/iVlK80IK9xJhhq06nH9pFGxFSmnOt1V+BJgfeZDeHAUTXML1Ieej+fFqgMOC1xJc9x9+Q1cnEVBgDGx5y5cPBNfAcblYt1VNvB4MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=andestech.com; dmarc=pass action=none
 header.from=andestech.com; dkim=pass header.d=andestech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andestech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SggvziFXXAiLfClquzNDn8udi/iniCZoYct4/rD3ks=;
 b=f3mWvFkAtOoKuMCiNj1YoFuq4Jl8eSalsvcY02Qn8v2fqujFEBPOPkQNyrLKx/IxyQ4R/E2McZiWb7C5pJ/KAzzv6SSLjmT33ocSoRxRuiAZqipjEmVn9SME568VY2b4ooFz9f10Fm8bxCDlG853etAmjrmqwWXiFxK3Gh5lL0OClPfNWB2EHdCVKmbislLUiaHKkAjs4aYpYdrBeArJTn2ghURS6NIjC3qLYsyJDU+GnM/bYgt+RYaRYQzc6+hvqphvFbkHX0Vzf1WAA77X2hVB97SniL34Kl0H7+51yCo96eRStMWmxZzrS27ZvRLBXtNOe/SWiiDlKRUv2yWHYA==
Received: from SEYPR03MB6700.apcprd03.prod.outlook.com (2603:1096:101:69::14)
 by SI2PR03MB6640.apcprd03.prod.outlook.com (2603:1096:4:1e8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 00:55:23 +0000
Received: from SEYPR03MB6700.apcprd03.prod.outlook.com
 ([fe80::f382:7607:9bc5:eac]) by SEYPR03MB6700.apcprd03.prod.outlook.com
 ([fe80::f382:7607:9bc5:eac%3]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 00:55:23 +0000
From: =?big5?B?QWx2aW4gQ2hlLUNoaWEgQ2hhbmcosWmt9bnFKQ==?=
 <alvinga@andestech.com>
To: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "alistair.francis@wdc.com" <alistair.francis@wdc.com>,
 "bin.meng@windriver.com" <bin.meng@windriver.com>, "liwei1518@gmail.com"
 <liwei1518@gmail.com>, "dbarboza@ventanamicro.com"
 <dbarboza@ventanamicro.com>, "zhiwei_liu@linux.alibaba.com"
 <zhiwei_liu@linux.alibaba.com>
Subject: RE: [PATCH v2] target/riscv: Implement optional CSR mcontext of debug
 Sdtrig extension
Thread-Topic: [PATCH v2] target/riscv: Implement optional CSR mcontext of
 debug Sdtrig extension
Thread-Index: AQHaMnd8iF+Hn0qQ20y+KlIYsjwc/bDQyAOg
Date: Tue, 9 Jan 2024 00:55:22 +0000
Message-ID: <SEYPR03MB670038F403BFDE25E2BD4F7BA86A2@SEYPR03MB6700.apcprd03.prod.outlook.com>
References: <20231219123244.290935-1-alvinga@andestech.com>
In-Reply-To: <20231219123244.290935-1-alvinga@andestech.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=andestech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6700:EE_|SI2PR03MB6640:EE_
x-ms-office365-filtering-correlation-id: acd3fa37-2438-4f84-0bd2-08dc10ada8c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: opvRukANkqE9/wSY/v06BRU1DLdVKjR3OLVz2dfTv4DjNo2pe6Iu2xQ3TP2fTkN4/1qu1r47jZk23b5qygyvtIklXLdVhuEaFkLqkKlqGZV6eJqo+p67pZnPjyzlBi/DmzhGFSb7lFxlbU/QbTWZnWsjZqAmmmb+NIqVbeRHktSQKCZqNQf4bthvbP/G3EO1PaMmVFJFSW8vqMjmUUoR7XJZhDnygbr2hgAfhOU/mQsu/S7+AgcOnpRcQ2zdafRLQsI5svXfLPRiEMwIpf/7c8mMl8ReIcCHMurQiTttWtf4bZJUDMVusZ4EHeN+hVAcdISUE1pg14DPk7UzbAfXWqIgkr3FvavBjYadQLxz3XjY+0FqzkI+FSgeV3G5j17VJ6X/t6A+T2Rcna3PWi15P4vJQTi5sBi9UIVWHYydqGuCihKfN8iLGUFMcsTwAc/YGytiAEEpW4XtELD2Jh//ov07l3AaXYWXMUUjQlFYSHnRDJ8Io4J+sQGKZb9N1X+lPrs3Rz2EdMJGVBlhSprnKiGcLG+JK1JMQGpDfWRa+iHeGQOm5szmM5AJXjGE/3gbB2H68oy7OmSO2CebOLkOSaILLgYdB3ORN3XUfDg3n6/RYUOAR+ltJINHwvTLChb9g2YmVddRVs9Fu9eNoLEHuiEgai9qU4sHcYWmVDfWQRk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB6700.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(366004)(396003)(39840400004)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(38100700002)(41300700001)(110136005)(66946007)(54906003)(66446008)(66476007)(66556008)(64756008)(76116006)(316002)(85182001)(52536014)(83380400001)(55016003)(86362001)(122000001)(478600001)(33656002)(5660300002)(2906002)(8676002)(8936002)(4326008)(26005)(6506007)(71200400001)(7696005)(53546011)(9686003)(38070700009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?eE91U2tNM2FZK1A5MjhEWSsweSswU09YUGt1V0JLSXNsSWhzaE1NM0lzREp3am1Y?=
 =?big5?B?YWtSR2pVbFNZR0dVTzlVMjNESDR2ZnBpR0laazRqZDFZMDczTWlJeW56Nys5Nk15?=
 =?big5?B?dXd2RXhmQlFBaHFHcWlKbkllSHlhNnlUUGN6T0Q3SXJlTTZMeDVSNmR6STBwV09r?=
 =?big5?B?ZW5CcEVZYXErVFo2ajlBWDRNVnBVZUNSWDZ4UEJQd29uK1dOdjRSSWRheGtabmFP?=
 =?big5?B?SlZ0ejZ6K2NacThzSEg0YkdsWUFiN2lJa1FueUFxS3RqRlQ4T1RwczdUOW84dkVk?=
 =?big5?B?bEhvVWlHejlJc2d0ek1kMjBzZnFNNjdQVklHeVY0ZWxVSFRaWlhGditsVHdIc3lk?=
 =?big5?B?WDE3amNUY1Z6d0ZieWZRZm52bVhRUmhGdWVKQTFkRlNUdkJ2NHhuQ2xlb1dISm4z?=
 =?big5?B?YTdsYWl2eEJ3bTlhRjJFN3V1aEFzZHVIRXJtcmJnaXpuVEozQUxtcCtxdWxPV20x?=
 =?big5?B?QW0rOUxJT1pWZUJvMUZUM1FldjlQVk15bkVKS1paV3FWZTNxTHFWRy8yOGtEamxk?=
 =?big5?B?MGxPNE1YeHdISUd2Mm1BaUo0cnVBc0xDRGNVemlEMitDam1HcmlyQ0JveFk5N0No?=
 =?big5?B?TWxlSG1kM2twY2xMTHlWeC9VWmdDTlQxNFVrdEtxeTU4MHVZK2hmcHFWQUR2YXp4?=
 =?big5?B?ZkRMbDhsRTZMeW1iQUpmSURRODh6eEJNMVdOMlJZQWxzVk1iRVZXZGpQS2w1SDR5?=
 =?big5?B?ZEF5Q1pqenZRSk95SnJqQU0yNnRJN3dmY3NqNmpJQzE1U3hQMjVyTHRsWDY2Z3Rm?=
 =?big5?B?MFNpVlN4R1JZUExyQXd0QXdzanBlajk1em1ad0RIQkxkWDdFa0JZNm1MYy9LUmhF?=
 =?big5?B?ekU3cUUrSHFBcEQwOTBrMjJqS3VNK2tGenNDblQ4bEJWUjB1cHFic2duUHMvVG5V?=
 =?big5?B?dEdWanluRkV1TG5hR3h6TXFrRXZVVG00MWQrcURSclF1dytLd2ZjS0FFOVFYMXFi?=
 =?big5?B?MkVkbXRVTm9peStKcDREak5BNEY4M1d6bjFyVVRoeXFzeStUR1hONGs5b3NkVDN0?=
 =?big5?B?SlhqL3dqTFh1ZXJCazNuUXJTNzJIZUdXUlBTR1ZrNG1TMDlzRE9qUGk2eXp4Z2tu?=
 =?big5?B?VmVHWXlBVE8yZzB0U3UyVmJPWVFGVFAwcm5qczlFRkpHUWNvdDNKSVNmT1BuVGJW?=
 =?big5?B?UjJCVktONlB4RUdnWExVKzRtd0ZPdVRvSENhb20wbS95MlNzN2ZzU0k1Z00vN0lN?=
 =?big5?B?ZlhjWENDRzZpUWVuM2hTTGh6akhZeGw0T3ZoSG9zMkxZWlcyQ3IvMmxxYm5HSHQ0?=
 =?big5?B?UjA5M0JqSU1zYjQwQ2c0dnRwd0lWa1ZmOE5wd1lGczNVNXU5TWpuQ0svTkhTbTNV?=
 =?big5?B?aWE2L1VMRlFnN0RyT21hVmlEbmJJOUdzZUZ6KzdlZEVGL0tkQ3orQktHelhPcXBU?=
 =?big5?B?eTlQdTgrWkZsT2ZqWHVBWXRmYzFEMVNaK2FQMWpZZ1RCRXRPQ3FDNzd5dTBwMVlp?=
 =?big5?B?blVPWllncU9PZzc5YWlwWWVtL05QNERydkxjeHh2WERWSTNZbzZnSEczNEVJNEhm?=
 =?big5?B?QjlNcEhnbnROR2pkVVAwcWlWaDVYQUxqd010RVZwT1pNQ2h4Z0k2ak1GUHdZNTVH?=
 =?big5?B?RFpQR1dpSWhseGVUb0xBUVhNVmpsZFd0cVJXeVU5cWVicFJaYU01YXkrSTZ2bjJF?=
 =?big5?B?aytudlRHV2Z5WFpsQzBEdERxOU5vOHZFekpLZFhnUU16M0ZoU3BUZUQ3ZVFUZEhv?=
 =?big5?B?azMzWUo4QjgxVGx3WlhyYWViN2E2cVJLZ2VUb1JkdkFEeHVpZldpQytRb3gxcGFJ?=
 =?big5?B?Z0pDemdoNy9XNkdLeVUxK3VQTmh3UFFOQXhYS2MwdXc0dFRkcFRyMzRLamY0OWFv?=
 =?big5?B?YS9QR0V5NDNxa3o3MVFqOGNwLzZYbXpzdEh6WHNVMWpnbERpcm9tWCtGNkIyRlRJ?=
 =?big5?B?QTZZeHJiUmlTb2UrNzlhQm1KMDVtendGTXplU3YyNWNFUUhwZzZJOGRIWUxBNmRH?=
 =?big5?B?QXR3aXcweDlSUmw1WXlBQWhxVXN2VzhqckxvMmpmL2NKcWJoNVBmcWZzckNXdkVs?=
 =?big5?Q?Qz6xhVQeevczkb8J?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6700.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd3fa37-2438-4f84-0bd2-08dc10ada8c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2024 00:55:22.6316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e3ec21b7-ec6c-4041-9add-61aea8171458
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: waaF09JeilJ4vXZer8RfZroxHG2/U/bYoiM5Q4ZYbTdVsb8LGKYhWT4QhG0HQe4MNbSOyNgxyhiyJEAgE6U+TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6640
X-OriginatorOrg: andestech.com
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 4090tbus010308
Received-SPF: pass client-ip=60.248.80.70; envelope-from=alvinga@andestech.com;
 helo=Atcsqr.andestech.com
X-Spam_score_int: 45
X-Spam_score: 4.5
X-Spam_bar: ++++
X-Spam_report: (4.5 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, RDNS_DYNAMIC=0.982, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, TVD_RCVD_IP=0.001,
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

UGluZyBmb3IgcmV2aWV3LCB0aGFua3MhIQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IEFsdmluIENoZS1DaGlhIENoYW5nKLFprfW5xSkgPGFsdmluZ2FAYW5kZXN0ZWNo
LmNvbT4NCj4gU2VudDogVHVlc2RheSwgRGVjZW1iZXIgMTksIDIwMjMgODozMyBQTQ0KPiBUbzog
cWVtdS1yaXNjdkBub25nbnUub3JnOyBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IGFsaXN0
YWlyLmZyYW5jaXNAd2RjLmNvbTsgYmluLm1lbmdAd2luZHJpdmVyLmNvbTsNCj4gbGl3ZWkxNTE4
QGdtYWlsLmNvbTsgZGJhcmJvemFAdmVudGFuYW1pY3JvLmNvbTsNCj4gemhpd2VpX2xpdUBsaW51
eC5hbGliYWJhLmNvbTsgQWx2aW4gQ2hlLUNoaWEgQ2hhbmcosWmt9bnFKQ0KPiA8YWx2aW5nYUBh
bmRlc3RlY2guY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjJdIHRhcmdldC9yaXNjdjogSW1wbGVt
ZW50IG9wdGlvbmFsIENTUiBtY29udGV4dCBvZiBkZWJ1Zw0KPiBTZHRyaWcgZXh0ZW5zaW9uDQo+
IA0KPiBUaGUgZGVidWcgU2R0cmlnIGV4dGVuc2lvbiBkZWZpbmVzIGFuIENTUiAibWNvbnRleHQi
LiBUaGlzIGNvbW1pdA0KPiBpbXBsZW1lbnRzIGl0cyBwcmVkaWNhdGUgYW5kIHJlYWQvd3JpdGUg
b3BlcmF0aW9ucyBpbnRvIENTUiB0YWJsZS4NCj4gSXRzIHZhbHVlIGlzIHJlc2V0IGFzIDAgd2hl
biB0aGUgdHJpZ2dlciBtb2R1bGUgaXMgcmVzZXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbHZp
biBDaGFuZyA8YWx2aW5nYUBhbmRlc3RlY2guY29tPg0KPiAtLS0NCj4gQ2hhbmdlcyBmcm9tIHYx
OiBSZW1vdmUgZGVkaWNhdGVkIGNmZywgYWx3YXlzIGltcGxlbWVudCBtY29udGV4dC4NCj4gDQo+
ICB0YXJnZXQvcmlzY3YvY3B1LmggICAgICB8ICAxICsNCj4gIHRhcmdldC9yaXNjdi9jcHVfYml0
cy5oIHwgIDcgKysrKysrKw0KPiAgdGFyZ2V0L3Jpc2N2L2Nzci5jICAgICAgfCAzNiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0NCj4gIHRhcmdldC9yaXNjdi9kZWJ1Zy5jICAg
IHwgIDIgKysNCj4gIDQgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90YXJnZXQvcmlzY3YvY3B1LmggYi90YXJnZXQvcmlz
Y3YvY3B1LmggaW5kZXggZDc0YjM2MS4uZTExNzY0MQ0KPiAxMDA2NDQNCj4gLS0tIGEvdGFyZ2V0
L3Jpc2N2L2NwdS5oDQo+ICsrKyBiL3RhcmdldC9yaXNjdi9jcHUuaA0KPiBAQCAtMzQ1LDYgKzM0
NSw3IEBAIHN0cnVjdCBDUFVBcmNoU3RhdGUgew0KPiAgICAgIHRhcmdldF91bG9uZyB0ZGF0YTFb
UlZfTUFYX1RSSUdHRVJTXTsNCj4gICAgICB0YXJnZXRfdWxvbmcgdGRhdGEyW1JWX01BWF9UUklH
R0VSU107DQo+ICAgICAgdGFyZ2V0X3Vsb25nIHRkYXRhM1tSVl9NQVhfVFJJR0dFUlNdOw0KPiAr
ICAgIHRhcmdldF91bG9uZyBtY29udGV4dDsNCj4gICAgICBzdHJ1Y3QgQ1BVQnJlYWtwb2ludCAq
Y3B1X2JyZWFrcG9pbnRbUlZfTUFYX1RSSUdHRVJTXTsNCj4gICAgICBzdHJ1Y3QgQ1BVV2F0Y2hw
b2ludCAqY3B1X3dhdGNocG9pbnRbUlZfTUFYX1RSSUdHRVJTXTsNCj4gICAgICBRRU1VVGltZXIg
Kml0cmlnZ2VyX3RpbWVyW1JWX01BWF9UUklHR0VSU107IGRpZmYgLS1naXQNCj4gYS90YXJnZXQv
cmlzY3YvY3B1X2JpdHMuaCBiL3RhcmdldC9yaXNjdi9jcHVfYml0cy5oIGluZGV4IGViZDc5MTcu
LjMyOTY2NDgNCj4gMTAwNjQ0DQo+IC0tLSBhL3RhcmdldC9yaXNjdi9jcHVfYml0cy5oDQo+ICsr
KyBiL3RhcmdldC9yaXNjdi9jcHVfYml0cy5oDQo+IEBAIC0zNjEsNiArMzYxLDcgQEANCj4gICNk
ZWZpbmUgQ1NSX1REQVRBMiAgICAgICAgICAweDdhMg0KPiAgI2RlZmluZSBDU1JfVERBVEEzICAg
ICAgICAgIDB4N2EzDQo+ICAjZGVmaW5lIENTUl9USU5GTyAgICAgICAgICAgMHg3YTQNCj4gKyNk
ZWZpbmUgQ1NSX01DT05URVhUICAgICAgICAweDdhOA0KPiANCj4gIC8qIERlYnVnIE1vZGUgUmVn
aXN0ZXJzICovDQo+ICAjZGVmaW5lIENTUl9EQ1NSICAgICAgICAgICAgMHg3YjANCj4gQEAgLTkw
NSw0ICs5MDYsMTAgQEAgdHlwZWRlZiBlbnVtIFJJU0NWRXhjZXB0aW9uIHsNCj4gIC8qIEpWVCBD
U1IgYml0cyAqLw0KPiAgI2RlZmluZSBKVlRfTU9ERSAgICAgICAgICAgICAgICAgICAgICAgICAg
IDB4M0YNCj4gICNkZWZpbmUgSlZUX0JBU0UgICAgICAgICAgICAgICAgICAgICAgICAgICAofjB4
M0YpDQo+ICsNCj4gKy8qIERlYnVnIFNkdHJpZyBDU1IgbWFza3MgKi8NCj4gKyNkZWZpbmUgTUNP
TlRFWFQzMiAgICAgICAgICAgICAgICAgICAgICAgICAweDAwMDAwMDNGDQo+ICsjZGVmaW5lIE1D
T05URVhUNjQNCj4gMHgwMDAwMDAwMDAwMDAxRkZGVUxMDQo+ICsjZGVmaW5lIE1DT05URVhUMzJf
SENPTlRFWFQgICAgICAgICAgICAgICAgMHgwMDAwMDA3Rg0KPiArI2RlZmluZSBNQ09OVEVYVDY0
X0hDT05URVhUDQo+IDB4MDAwMDAwMDAwMDAwM0ZGRlVMTA0KPiAgI2VuZGlmDQo+IGRpZmYgLS1n
aXQgYS90YXJnZXQvcmlzY3YvY3NyLmMgYi90YXJnZXQvcmlzY3YvY3NyLmMgaW5kZXggZmRlN2Nl
MS4uZmYxZTEyOCAxMDA2NDQNCj4gLS0tIGEvdGFyZ2V0L3Jpc2N2L2Nzci5jDQo+ICsrKyBiL3Rh
cmdldC9yaXNjdi9jc3IuYw0KPiBAQCAtMzkwMCw2ICszOTAwLDMxIEBAIHN0YXRpYyBSSVNDVkV4
Y2VwdGlvbiByZWFkX3RpbmZvKENQVVJJU0NWU3RhdGUNCj4gKmVudiwgaW50IGNzcm5vLA0KPiAg
ICAgIHJldHVybiBSSVNDVl9FWENQX05PTkU7DQo+ICB9DQo+IA0KPiArc3RhdGljIFJJU0NWRXhj
ZXB0aW9uIHJlYWRfbWNvbnRleHQoQ1BVUklTQ1ZTdGF0ZSAqZW52LCBpbnQgY3Nybm8sDQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0YXJnZXRfdWxvbmcgKnZhbCkgew0K
PiArICAgICp2YWwgPSBlbnYtPm1jb250ZXh0Ow0KPiArICAgIHJldHVybiBSSVNDVl9FWENQX05P
TkU7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBSSVNDVkV4Y2VwdGlvbiB3cml0ZV9tY29udGV4dChD
UFVSSVNDVlN0YXRlICplbnYsIGludCBjc3JubywNCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB0YXJnZXRfdWxvbmcgdmFsKSB7DQo+ICsgICAgYm9vbCBydjMyID0gcmlz
Y3ZfY3B1X214bChlbnYpID09IE1YTF9SVjMyID8gdHJ1ZSA6IGZhbHNlOw0KPiArICAgIGludDMy
X3QgbWFzazsNCj4gKw0KPiArICAgIGlmIChyaXNjdl9oYXNfZXh0KGVudiwgUlZIKSkgew0KPiAr
ICAgICAgICAvKiBTcGVjIHN1Z2dlc3QgNy1iaXQgZm9yIFJWMzIgYW5kIDE0LWJpdCBmb3IgUlY2
NCB3LyBIIGV4dGVuc2lvbg0KPiAqLw0KPiArICAgICAgICBtYXNrID0gcnYzMiA/IE1DT05URVhU
MzJfSENPTlRFWFQgOg0KPiBNQ09OVEVYVDY0X0hDT05URVhUOw0KPiArICAgIH0gZWxzZSB7DQo+
ICsgICAgICAgIC8qIFNwZWMgc3VnZ2VzdCA2LWJpdCBmb3IgUlYzMiBhbmQgMTMtYml0IGZvciBS
VjY0IHcvbyBIIGV4dGVuc2lvbg0KPiAqLw0KPiArICAgICAgICBtYXNrID0gcnYzMiA/IE1DT05U
RVhUMzIgOiBNQ09OVEVYVDY0Ow0KPiArICAgIH0NCj4gKw0KPiArICAgIGVudi0+bWNvbnRleHQg
PSB2YWwgJiBtYXNrOw0KPiArICAgIHJldHVybiBSSVNDVl9FWENQX05PTkU7DQo+ICt9DQo+ICsN
Cj4gIC8qDQo+ICAgKiBGdW5jdGlvbnMgdG8gYWNjZXNzIFBvaW50ZXIgTWFza2luZyBmZWF0dXJl
IHJlZ2lzdGVycw0KPiAgICogV2UgaGF2ZSB0byBjaGVjayBpZiBjdXJyZW50IHByaXYgbHZsIGNv
dWxkIG1vZGlmeSBAQCAtNDc5NCwxMSArNDgxOSwxMg0KPiBAQCByaXNjdl9jc3Jfb3BlcmF0aW9u
cyBjc3Jfb3BzW0NTUl9UQUJMRV9TSVpFXSA9IHsNCj4gICAgICBbQ1NSX1BNUEFERFIxNV0gPSAg
eyAicG1wYWRkcjE1IiwgcG1wLCByZWFkX3BtcGFkZHIsDQo+IHdyaXRlX3BtcGFkZHIgfSwNCj4g
DQo+ICAgICAgLyogRGVidWcgQ1NScyAqLw0KPiAtICAgIFtDU1JfVFNFTEVDVF0gICA9ICB7ICJ0
c2VsZWN0IiwgZGVidWcsIHJlYWRfdHNlbGVjdCwgd3JpdGVfdHNlbGVjdCB9LA0KPiAtICAgIFtD
U1JfVERBVEExXSAgICA9ICB7ICJ0ZGF0YTEiLCAgZGVidWcsIHJlYWRfdGRhdGEsDQo+IHdyaXRl
X3RkYXRhICAgfSwNCj4gLSAgICBbQ1NSX1REQVRBMl0gICAgPSAgeyAidGRhdGEyIiwgIGRlYnVn
LCByZWFkX3RkYXRhLA0KPiB3cml0ZV90ZGF0YSAgIH0sDQo+IC0gICAgW0NTUl9UREFUQTNdICAg
ID0gIHsgInRkYXRhMyIsICBkZWJ1ZywgcmVhZF90ZGF0YSwNCj4gd3JpdGVfdGRhdGEgICB9LA0K
PiAtICAgIFtDU1JfVElORk9dICAgICA9ICB7ICJ0aW5mbyIsICAgZGVidWcsIHJlYWRfdGluZm8s
DQo+IHdyaXRlX2lnbm9yZSAgfSwNCj4gKyAgICBbQ1NSX1RTRUxFQ1RdICAgPSAgeyAidHNlbGVj
dCIsICBkZWJ1ZywgcmVhZF90c2VsZWN0LA0KPiB3cml0ZV90c2VsZWN0ICB9LA0KPiArICAgIFtD
U1JfVERBVEExXSAgICA9ICB7ICJ0ZGF0YTEiLCAgIGRlYnVnLCByZWFkX3RkYXRhLA0KPiB3cml0
ZV90ZGF0YSAgICB9LA0KPiArICAgIFtDU1JfVERBVEEyXSAgICA9ICB7ICJ0ZGF0YTIiLCAgIGRl
YnVnLCByZWFkX3RkYXRhLA0KPiB3cml0ZV90ZGF0YSAgICB9LA0KPiArICAgIFtDU1JfVERBVEEz
XSAgICA9ICB7ICJ0ZGF0YTMiLCAgIGRlYnVnLCByZWFkX3RkYXRhLA0KPiB3cml0ZV90ZGF0YSAg
ICB9LA0KPiArICAgIFtDU1JfVElORk9dICAgICA9ICB7ICJ0aW5mbyIsICAgIGRlYnVnLCByZWFk
X3RpbmZvLA0KPiB3cml0ZV9pZ25vcmUgICB9LA0KPiArICAgIFtDU1JfTUNPTlRFWFRdICA9ICB7
ICJtY29udGV4dCIsIGRlYnVnLCByZWFkX21jb250ZXh0LA0KPiArIHdyaXRlX21jb250ZXh0IH0s
DQo+IA0KPiAgICAgIC8qIFVzZXIgUG9pbnRlciBNYXNraW5nICovDQo+ICAgICAgW0NTUl9VTVRF
XSAgICA9ICAgIHsgInVtdGUiLCAgICBwb2ludGVyX21hc2tpbmcsIHJlYWRfdW10ZSwNCj4gd3Jp
dGVfdW10ZSB9LA0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3Jpc2N2L2RlYnVnLmMgYi90YXJnZXQv
cmlzY3YvZGVidWcuYyBpbmRleCA0OTQ1ZDFhLi5lMzBkOTljDQo+IDEwMDY0NA0KPiAtLS0gYS90
YXJnZXQvcmlzY3YvZGVidWcuYw0KPiArKysgYi90YXJnZXQvcmlzY3YvZGVidWcuYw0KPiBAQCAt
OTQwLDQgKzk0MCw2IEBAIHZvaWQgcmlzY3ZfdHJpZ2dlcl9yZXNldF9ob2xkKENQVVJJU0NWU3Rh
dGUgKmVudikNCj4gICAgICAgICAgZW52LT5jcHVfd2F0Y2hwb2ludFtpXSA9IE5VTEw7DQo+ICAg
ICAgICAgIHRpbWVyX2RlbChlbnYtPml0cmlnZ2VyX3RpbWVyW2ldKTsNCj4gICAgICB9DQo+ICsN
Cj4gKyAgICBlbnYtPm1jb250ZXh0ID0gMDsNCj4gIH0NCj4gLS0NCj4gMi4zNC4xDQoNCg==

