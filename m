Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67136C35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 04:56:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rF5fX-0003M9-0D; Sun, 17 Dec 2023 23:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alvinga@andestech.com>)
 id 1rF5fW-0003LP-8L; Sun, 17 Dec 2023 23:55:54 -0500
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70]
 helo=Atcsqr.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alvinga@andestech.com>)
 id 1rF5fR-0007LA-UW; Sun, 17 Dec 2023 23:55:53 -0500
Received: from mail.andestech.com (ATCPCS33.andestech.com [10.0.1.100])
 by Atcsqr.andestech.com with ESMTP id 3BI4tIQD088180;
 Mon, 18 Dec 2023 12:55:18 +0800 (+08)
 (envelope-from alvinga@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by ATCPCS33.andestech.com
 (10.0.1.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 18 Dec
 2023 12:55:19 +0800
Received: from ATCPCS31.andestech.com (10.0.1.89) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7 via Frontend
 Transport; Mon, 18 Dec 2023 12:55:19 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (104.47.110.41)
 by mail.andestech.com (10.0.1.89) with Microsoft SMTP Server (TLS) id
 14.3.498.0; Mon, 18 Dec 2023 12:55:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQP5I9s7y4PDBBDf8HWQeCNBhFNLpmt5+AxADUDBagti/lbW6tNz6Pc1TElSAatYSVI6nA3m5IjOT1PTorB87PjAm8XfN31XEwozYnssZvzeoJGKwQULrBA+u9wuyYKsVqYSe4frH1XdOUm7jjyQnkdO6HGN+v0LAC83nJtftlmnJYUHxwLAwwLvLzYm4bObkdtV1y5XGw+5g18hqhZicL8P4nLcFioUg7et8UzMx0JG+mGvATalu1JEQrOyC2T66YZm+5DOB74rPCrme/QmuqusDmkuuL+Fd2bcxPGl1J0fwQOVvplrRdIqZwQ5f4WwM8dRgd55kycZ+8n7HlWHiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsF5WsxfCsldnTGi3Y5cPAODG2MZl2nLOQVymanbjc0=;
 b=LcNTkdfbjVQHOnPbXw9Ml3Lvsr+ngR7DozRfRVTJXt/51V3k+1nI13HR4ejrzSsiCqh87iil5DNg2k/d+gPlzqPiYFPj6JHbRCojJgA0REKUrSoP0nng2dS6ENSyUX+IOLk612liqauGf4j6Xt/dTgCDs3L9RJVNd3iRaCJFPF2FJRL/etFDgU/3Y/nTOXlRNc4zXMyaTNFwLTNm9cfygO1ae16n7Edq7N2wLvHd+p+mYWcSDAV6roZIUHQKWHDIjd6FVNmn9RRal2IWAr218DHcfT7tYXxaUHaEOD4T7kTK/eSRCY1P5Pw5tqtKIcMBK6OXyxPmIsne5nrlJtDKlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=andestech.com; dmarc=pass action=none
 header.from=andestech.com; dkim=pass header.d=andestech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andestech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsF5WsxfCsldnTGi3Y5cPAODG2MZl2nLOQVymanbjc0=;
 b=D0bv1eDrCGncxFYtxXEqIVJ1yRnRz+uwpjzKUyEqXZ59plvm01aqGFq5roMfLSDNRRYlkUaOcyWqilMuOGuhsDQAZhISnwNDnoq0BL6LwAG7Q7NypXiCknnp5u3tOWl3zNkwtq+t8ReOHEd3uuWxyvvzld5HQyVHQZKp1hPAdejIGzKYT4XT8q4vXvvKWW6CWaPHi4dT29d1+4iI8sML6/90XmYNzj7rCKtOtAV6mRVpvPIWx5fkUje9Zk7llHtp+0I5NeTguVHDXLZumhzhb40rS0pJfc2V58qpGIZfYUm+iTD1QLf9HFqw4kKLFysSAnZeJTdHR1NC0V10gIQz3w==
Received: from SEYPR03MB6700.apcprd03.prod.outlook.com (2603:1096:101:69::14)
 by TYSPR03MB7351.apcprd03.prod.outlook.com (2603:1096:400:410::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 04:55:07 +0000
Received: from SEYPR03MB6700.apcprd03.prod.outlook.com
 ([fe80::f382:7607:9bc5:eac]) by SEYPR03MB6700.apcprd03.prod.outlook.com
 ([fe80::f382:7607:9bc5:eac%3]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 04:55:06 +0000
From: =?utf-8?B?QWx2aW4gQ2hlLUNoaWEgQ2hhbmco5by15ZOy5ZiJKQ==?=
 <alvinga@andestech.com>
To: Alistair Francis <alistair23@gmail.com>
CC: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "alistair.francis@wdc.com"
 <alistair.francis@wdc.com>, "bin.meng@windriver.com"
 <bin.meng@windriver.com>, "liwei1518@gmail.com" <liwei1518@gmail.com>,
 "dbarboza@ventanamicro.com" <dbarboza@ventanamicro.com>,
 "zhiwei_liu@linux.alibaba.com" <zhiwei_liu@linux.alibaba.com>
Subject: RE: [PATCH] target/riscv: Implement optional CSR mcontext of debug
 Sdtrig extension
Thread-Topic: [PATCH] target/riscv: Implement optional CSR mcontext of debug
 Sdtrig extension
Thread-Index: AQHaMLj6JtAZmeYPVESEWOSS34jvObCueLeAgAABAmA=
Date: Mon, 18 Dec 2023 04:55:06 +0000
Message-ID: <SEYPR03MB6700171BF606F5EE83DF92C3A890A@SEYPR03MB6700.apcprd03.prod.outlook.com>
References: <20231217071628.151599-1-alvinga@andestech.com>
 <CAKmqyKO5U6biAAEjuLjoOiUnC+3BHvHTVCSEnY69b0t69=qtDg@mail.gmail.com>
In-Reply-To: <CAKmqyKO5U6biAAEjuLjoOiUnC+3BHvHTVCSEnY69b0t69=qtDg@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=andestech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6700:EE_|TYSPR03MB7351:EE_
x-ms-office365-filtering-correlation-id: 5d6add8c-76e4-4807-797f-08dbff858150
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nkOe7XqJI5azlroW/0X74w5ptgep0c44nomroba/yOAtcgAOExJPNGZjoo7Es7TgHZwuskYXF22OPNKCtsnbOimxArq1jsFGnHOaLatvWc6Tik4WDau1Gmwl5I0KiqmTv7MSl1DhTuAE5y4cneuZ5gO8SWlX22nYyZ9zvuCKTO+21MK7e5H6M8dL7nOjfDKiLrj99qJNphLChpe8HM2UNWfoWV59MkZ5RZVbQNd8HlVdFfWSY4j/PU2NdtTZEX+19sASmcbkyiGfjfCwbD/dc8Q8UkArpGq2oLguHlp25A1zgXbUML1zCHP1ZvR+/0vhe0ZMMD+x9XcCJx4YtQBpg938rZcxuVy1dbpIlWefoXyEM1boDsASoEAcu9gtqAn74DmBvlk8AYZc0Y1eHh3IjSQH786r5lJc4yWMksbKsvVG84FpR8Dh8Zowv9+7w+gS4EXLeQ9IA9SgZQpL4ehZGCc0FwmsciyKgCHa0glQqdVErzE/y08S3P53lUxDY/BDeJP42pGv0chDTlWlpRr24BJXDg4Si1q4hKkh3tRDlGILJNvm4rSXHNbmyIJLpxHi38g5hjPXQraXGl/VfLXKdACN7Nw27pRq2V1ngY9+dn/+NsRGylCtRJxoGevmLZLeHtxsIXd+QXhnC4r/OyErxrpuY4r9lDMpAj8BDrs6V2I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB6700.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39830400003)(346002)(136003)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(2906002)(71200400001)(86362001)(85182001)(33656002)(6506007)(53546011)(7696005)(9686003)(38070700009)(478600001)(83380400001)(122000001)(38100700002)(26005)(41300700001)(5660300002)(66946007)(66446008)(66556008)(52536014)(66476007)(64756008)(54906003)(76116006)(8936002)(8676002)(4326008)(6916009)(316002)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUNjQzRMcCsxSXNQelpGYmtZYkthak1WaVlUVTRDYnVjZ1pZUTBZaUZmZVhY?=
 =?utf-8?B?NFlZTFNRTG42WHloQWNaNTRVV3dWZmZ1cExjdnltTUFyMHpGL21nMFAzZkZu?=
 =?utf-8?B?YnYzdktoUmd1UW5JK0hoNlI5S3NRU1VGM2Z5Zmw1bi9ta0ptNjVucENJaTVp?=
 =?utf-8?B?dmdjVFpJakZZRFE4cUk1THNtd2dZS2lSZFR4d0UxaEhFTlU5UktIdFNFeG9D?=
 =?utf-8?B?ZytIbmxrdnFIenRKTEF3RmxzeUI3aFpMTEZQZE90TStWTGs0ZTUyQkN2OWdW?=
 =?utf-8?B?K3N1M2d0TFMzS0xIS1ppOUw2QUdwVW4ySE1PZHNyNWlyVWVoNTJKNEdIVzVq?=
 =?utf-8?B?ZktEeG1vKzh1RjBmTnJJNi9TUTJsQjRMNHFneFlJOUFWSUZJUWlzYWoxSyt3?=
 =?utf-8?B?TS8ycGNlYjFsWUtUQm5tTHB1dVBOcnpxTThZSjhqMCtVWkh5cWJUN1M3MHBw?=
 =?utf-8?B?dFpGblFiL3F1ZHZtL0pGdEF5MzF4b1d2R2FEckJkQnhBc1lmVk5sOSt3anY0?=
 =?utf-8?B?cWxTMGtSY2RSekRSOXFGaWpCNEdGTnRnMkdkZnA2eXJFRURUbFdqcUZ2YzEv?=
 =?utf-8?B?VldBK0N1S3B5ak81WmErRThYU2JpRkxRaUV0eHdWYlBlMXZHanFnMjMwVld5?=
 =?utf-8?B?UVppWGRXZjdvTE1RNnpaLy9QcTFkbldsa0V6U0FCb0xNVTNpVmIwYjRkVWZv?=
 =?utf-8?B?eVZ3Y1BIZ1NiZHNGckViNitnQ1l4Q2FocGo0QW52a2Z0ekRuSSthbFp6bXpE?=
 =?utf-8?B?OWx3ZzhrQVhWOCtiZGorUy9MYjZMeE9wbjFTd1FlWjY1WmFZcUdIdjQvRS9U?=
 =?utf-8?B?VWwwRzNBMHd4N2JiUk1rcXY2ank3cUR3OUg5UU10TmxmdG9ZSm90aGFXek56?=
 =?utf-8?B?dTc0a0tGV2haOFVZRU1adFZaVmFGNUpPeHJOSUFSUEt2YjVxQzgxNVpNeWNQ?=
 =?utf-8?B?WkI2RmNlUU85THg2dVg3Ync3STdGamZQeVFaWHdUOGw3d0taL3NmYWhVY05B?=
 =?utf-8?B?NlNTa0Q3d25Rbi9ROGxGc0JIMnNQekVuMjBOdFhSYTllUUZMWk0wV2oxN25T?=
 =?utf-8?B?clVWU1ZwVDA3TGpIL1lrcm1RWWRKd2MxemlwMmNWVkFmZkxiQUpjYmVZZ1lq?=
 =?utf-8?B?eVFyUjhING1qd0ozS2lzdWFpWkgraFFOanFTRGsyb04wU3JIYmVOREFZVGQy?=
 =?utf-8?B?Y1JRK2MrT1I1YWkxL2ViK0VzaW9zdWp6MmQ3R3RDa1BxaFN4WUtrTHRPVVVh?=
 =?utf-8?B?d3MvSkpFYmdhdDh6MGh4ODZBWkZacjdJc0R1b3JkMW0vb0tTWm12OXcvK1J2?=
 =?utf-8?B?U0dDSkFuaEVEbC9tWTBRTVVLRzBpRHZGN3FVVUZEcWppaXNUOHlYTEhsN2dW?=
 =?utf-8?B?cUpKSTFxRnBZc1R0bWJKa3F0T3NTOElHYzBPdjA5QVdiUVF0TU9lU2hWbU1D?=
 =?utf-8?B?eHk1MFJxNDQ5SnBDZnprVlU2UjhoOXdQUVpFVkhjTEpZU0QwZkpGZTN1Qkhh?=
 =?utf-8?B?Tm52R2hZWnJlclVaTFJXWHhPQUhFbzk4Q0RRSTh4SUF1QXZSYTBMcmFwSjlV?=
 =?utf-8?B?N3EvaUNROU4rUVlMYVFtZWRzaGpuUVg4Vm43TmJ0cytobUNYQlIzTEhpUlNX?=
 =?utf-8?B?cFY4NldYWGZtMFNiR2xucmRINEdUVGhvVS9HV3Q2cFF4bzRhK3NlUTNvYVJi?=
 =?utf-8?B?WnNWcWFLZFhOYWk1R2hCdk9ZVlE0V0k3cmM5d21RVzFBZ0ZNYkFBNDQ2SGF0?=
 =?utf-8?B?OG91WjRBakNCMGlYSmYrWHlKekVrRFppbHMybFM2YWt0L0tNRnl4dXR1Zkta?=
 =?utf-8?B?NDNMUkpZTnIrVXpWUElqMXJpdVJSc1c0cEs3Ulkzb2NNOFpMRnQvU2FrSGVD?=
 =?utf-8?B?MjlWUmVZeXRqUGs0cEdESWtNeTM5dWhTL2xDNlJlNy9CVWZPMzhLNzBoZnhM?=
 =?utf-8?B?Y1RHV0Q3dFB2aG9tYzNGOVRVdjBkdzgvY055VXMxQkRPbnVndXlsZjA3ZWtr?=
 =?utf-8?B?aFdPK2hwc1R5SDlYTjNtVG9sMTFHVXFqWFFMdWN1c1pBNzhNK1dsMUN3cVZv?=
 =?utf-8?B?L0J2NExJZ1paanZ1L1Z3WXE1UXdDTE9KdGltSExIcmIvQ1Z1bHhLbk1GNzcx?=
 =?utf-8?Q?XETnd/tajhHDfSC3/z877Ch8A?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6700.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d6add8c-76e4-4807-797f-08dbff858150
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2023 04:55:06.8264 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e3ec21b7-ec6c-4041-9add-61aea8171458
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bwgD62dZggbpnLnMX8LSmeCVWGoBiVsWJdWzAJlhr7yULXXyQeFV5aXyGngR8fE9EKyE1cwWV/mcGvfk7E65Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7351
X-OriginatorOrg: andestech.com
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3BI4tIQD088180
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGlzdGFpciBGcmFuY2lzIDxh
bGlzdGFpcjIzQGdtYWlsLmNvbT4NCj4gU2VudDogTW9uZGF5LCBEZWNlbWJlciAxOCwgMjAyMyAx
Mjo0NiBQTQ0KPiBUbzogQWx2aW4gQ2hlLUNoaWEgQ2hhbmco5by15ZOy5ZiJKSA8YWx2aW5nYUBh
bmRlc3RlY2guY29tPg0KPiBDYzogcWVtdS1yaXNjdkBub25nbnUub3JnOyBxZW11LWRldmVsQG5v
bmdudS5vcmc7DQo+IGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbTsgYmluLm1lbmdAd2luZHJpdmVy
LmNvbTsgbGl3ZWkxNTE4QGdtYWlsLmNvbTsNCj4gZGJhcmJvemFAdmVudGFuYW1pY3JvLmNvbTsg
emhpd2VpX2xpdUBsaW51eC5hbGliYWJhLmNvbQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSB0YXJn
ZXQvcmlzY3Y6IEltcGxlbWVudCBvcHRpb25hbCBDU1IgbWNvbnRleHQgb2YgZGVidWcNCj4gU2R0
cmlnIGV4dGVuc2lvbg0KPiANCj4gT24gU3VuLCBEZWMgMTcsIDIwMjMgYXQgNToxN+KAr1BNIEFs
dmluIENoYW5nIHZpYSA8cWVtdS1kZXZlbEBub25nbnUub3JnPg0KPiB3cm90ZToNCj4gPg0KPiA+
IFRoZSBkZWJ1ZyBTZHRyaWcgZXh0ZW5zaW9uIGRlZmluZXMgYW4gb3B0aW9uYWwgQ1NSICJtY29u
dGV4dCIuIFNpbmNlDQo+ID4gaXQgaXMgb3B0aW9uYWwsIHRoaXMgY29tbWl0IGFkZHMgbmV3IENQ
VSBjb25maWd1cmF0aW9uDQo+ID4gImV4dF9zZHRyaWdfbWNvbnRleHQiIGFuZCB1c2VzIHByb3Bl
cnR5ICJzZHRyaWdfbWNvbnRleHQiIHRvIGNvbnRyb2wNCj4gPiB3aGV0aGVyIGl0IGlzIGltcGxl
bWVudGVkIG9yIG5vdC4gSXRzIHByZWRpY2F0ZSBhbmQgcmVhZC93cml0ZQ0KPiA+IG9wZXJhdGlv
bnMgYXJlIGFsc28gaW1wbGVtZW50ZWQgaW50byBDU1IgdGFibGUuIEl0cyB2YWx1ZSBpcyByZXNl
dCBhcw0KPiA+IDAgd2hlbiB0aGUgdHJpZ2dlciBtb2R1bGUgaXMgcmVzZXQuDQo+IA0KPiBXZSBk
b24ndCBzdXBwb3J0IHRoZSBTZHRyaWcgZXh0ZW5zaW9uIHRob3VnaC4gSSdtIGd1ZXNzaW5nIGl0
J3MgYWxsIHBhY2thZ2VkIHVwDQo+IGFzIHBhcnQgb2YgdGhlICJkZWJ1ZyIgZXh0ZW5zaW9uIGJ1
dCBzaG91bGQgd2UgZXhwb3NlIFNkdHJpZyBiZWZvcmUgd2UgZXhwb3NlDQo+IG9wdGlvbnMgZm9y
IGl0Pw0KDQpZZXMsIFNkdHJpZyBleHRlbnNpb24gaXMgcGFydCBvZiB0aGUgImRlYnVnIiBleHRl
bnNpb24uIFRoZXJlIGhhdmUgYmVlbiBzZXZlcmFsIHRyaWdnZXIgaW1wbGVtZW50YXRpb25zIGlu
IHRhcmdldC9yaXNjdi9kZWJ1Zy57Y3xofS4NCkkgY2FuIHJlbmFtZSBpdCB0byBjZmcuZGVidWdf
bWNvbnRleHQgaW5zdGVhZC4NCg0KPiANCj4gQWxzbywgd2h5IGNhbid0IHdlIGp1c3QgYWx3YXlz
IGltcGxlbWVudCBtY29udGV4dCBpZiBTZHRyaWcgZXhpc3RzPyBJcyB0aGVyZSBhDQo+IHJlYXNv
biB0byBnYXRlIGl0IGJlaGluZCBhIGNvbmZpZz8NCj4gDQo+IEFsaXN0YWlyDQoNCkkgZ2F0ZSBp
dCBiZWhpbmQgYSBjb25maWcgYmVjYXVzZSBzcGVjIHNheXMgdGhhdCBtY29udGV4dCBpcyBvcHRp
b25hbCBDU1IuDQpTb21lIENQVXMgbWlnaHQgaW1wbGVtZW50IGl0IChzbyB0aGV5IGNhbiBzYXkg
Y2ZnLT5leHRfc2R0cmlnX21jb250ZXh0ID0gdHJ1ZTsgaW4gdGhlaXIgQ1BVIGluaXQpLCB3aGls
ZSBvdGhlcnMgZG9uJ3QuDQpPciBkbyB5b3UgdGhpbmsgd2Ugc2hvdWxkIGFsd2F5cyBpbXBsZW1l
bnQgaXQ/DQoNCkFsdmluDQoNCj4gDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbHZpbiBDaGFu
ZyA8YWx2aW5nYUBhbmRlc3RlY2guY29tPg0KPiA+IC0tLQ0KPiA+ICB0YXJnZXQvcmlzY3YvY3B1
LmMgICAgICB8ICA0ICsrKysNCj4gPiAgdGFyZ2V0L3Jpc2N2L2NwdS5oICAgICAgfCAgMSArDQo+
ID4gIHRhcmdldC9yaXNjdi9jcHVfYml0cy5oIHwgIDcgKysrKysrKw0KPiA+ICB0YXJnZXQvcmlz
Y3YvY3B1X2NmZy5oICB8ICAxICsNCj4gPiAgdGFyZ2V0L3Jpc2N2L2Nzci5jICAgICAgfCAzNiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgdGFyZ2V0L3Jpc2N2L2Rl
YnVnLmMgICAgfCAgMiArKw0KPiA+ICA2IGZpbGVzIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKykN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS90YXJnZXQvcmlzY3YvY3B1LmMgYi90YXJnZXQvcmlzY3Yv
Y3B1LmMgaW5kZXgNCj4gPiA4M2M3YzBjLi5kZmY3NTdmIDEwMDY0NA0KPiA+IC0tLSBhL3Rhcmdl
dC9yaXNjdi9jcHUuYw0KPiA+ICsrKyBiL3RhcmdldC9yaXNjdi9jcHUuYw0KPiA+IEBAIC0xNDc5
LDYgKzE0NzksMTAgQEAgUHJvcGVydHkgcmlzY3ZfY3B1X29wdGlvbnNbXSA9IHsNCj4gPiAgICAg
IERFRklORV9QUk9QX1VJTlQxNigiY2JvbV9ibG9ja3NpemUiLCBSSVNDVkNQVSwNCj4gY2ZnLmNi
b21fYmxvY2tzaXplLCA2NCksDQo+ID4gICAgICBERUZJTkVfUFJPUF9VSU5UMTYoImNib3pfYmxv
Y2tzaXplIiwgUklTQ1ZDUFUsDQo+ID4gY2ZnLmNib3pfYmxvY2tzaXplLCA2NCksDQo+ID4NCj4g
PiArICAgIC8qIE9wdGlvbmFsIENTUiBvZiBkZWJ1ZyBTZHRyaWcgZXh0ZW5zaW9uICovDQo+ID4g
KyAgICBERUZJTkVfUFJPUF9CT09MKCJzZHRyaWdfbWNvbnRleHQiLCBSSVNDVkNQVSwNCj4gY2Zn
LmV4dF9zZHRyaWdfbWNvbnRleHQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGZhbHNlKSwN
Cj4gPiArDQo+ID4gICAgICBERUZJTkVfUFJPUF9FTkRfT0ZfTElTVCgpLA0KPiA+ICB9Ow0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL3RhcmdldC9yaXNjdi9jcHUuaCBiL3RhcmdldC9yaXNjdi9jcHUu
aCBpbmRleA0KPiA+IGQ3NGIzNjEuLmUxMTc2NDEgMTAwNjQ0DQo+ID4gLS0tIGEvdGFyZ2V0L3Jp
c2N2L2NwdS5oDQo+ID4gKysrIGIvdGFyZ2V0L3Jpc2N2L2NwdS5oDQo+ID4gQEAgLTM0NSw2ICsz
NDUsNyBAQCBzdHJ1Y3QgQ1BVQXJjaFN0YXRlIHsNCj4gPiAgICAgIHRhcmdldF91bG9uZyB0ZGF0
YTFbUlZfTUFYX1RSSUdHRVJTXTsNCj4gPiAgICAgIHRhcmdldF91bG9uZyB0ZGF0YTJbUlZfTUFY
X1RSSUdHRVJTXTsNCj4gPiAgICAgIHRhcmdldF91bG9uZyB0ZGF0YTNbUlZfTUFYX1RSSUdHRVJT
XTsNCj4gPiArICAgIHRhcmdldF91bG9uZyBtY29udGV4dDsNCj4gPiAgICAgIHN0cnVjdCBDUFVC
cmVha3BvaW50ICpjcHVfYnJlYWtwb2ludFtSVl9NQVhfVFJJR0dFUlNdOw0KPiA+ICAgICAgc3Ry
dWN0IENQVVdhdGNocG9pbnQgKmNwdV93YXRjaHBvaW50W1JWX01BWF9UUklHR0VSU107DQo+ID4g
ICAgICBRRU1VVGltZXIgKml0cmlnZ2VyX3RpbWVyW1JWX01BWF9UUklHR0VSU107IGRpZmYgLS1n
aXQNCj4gPiBhL3RhcmdldC9yaXNjdi9jcHVfYml0cy5oIGIvdGFyZ2V0L3Jpc2N2L2NwdV9iaXRz
LmggaW5kZXgNCj4gPiBlYmQ3OTE3Li4zMjk2NjQ4IDEwMDY0NA0KPiA+IC0tLSBhL3RhcmdldC9y
aXNjdi9jcHVfYml0cy5oDQo+ID4gKysrIGIvdGFyZ2V0L3Jpc2N2L2NwdV9iaXRzLmgNCj4gPiBA
QCAtMzYxLDYgKzM2MSw3IEBADQo+ID4gICNkZWZpbmUgQ1NSX1REQVRBMiAgICAgICAgICAweDdh
Mg0KPiA+ICAjZGVmaW5lIENTUl9UREFUQTMgICAgICAgICAgMHg3YTMNCj4gPiAgI2RlZmluZSBD
U1JfVElORk8gICAgICAgICAgIDB4N2E0DQo+ID4gKyNkZWZpbmUgQ1NSX01DT05URVhUICAgICAg
ICAweDdhOA0KPiA+DQo+ID4gIC8qIERlYnVnIE1vZGUgUmVnaXN0ZXJzICovDQo+ID4gICNkZWZp
bmUgQ1NSX0RDU1IgICAgICAgICAgICAweDdiMA0KPiA+IEBAIC05MDUsNCArOTA2LDEwIEBAIHR5
cGVkZWYgZW51bSBSSVNDVkV4Y2VwdGlvbiB7DQo+ID4gIC8qIEpWVCBDU1IgYml0cyAqLw0KPiA+
ICAjZGVmaW5lIEpWVF9NT0RFICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgzRg0KPiA+ICAj
ZGVmaW5lIEpWVF9CQVNFICAgICAgICAgICAgICAgICAgICAgICAgICAgKH4weDNGKQ0KPiA+ICsN
Cj4gPiArLyogRGVidWcgU2R0cmlnIENTUiBtYXNrcyAqLw0KPiA+ICsjZGVmaW5lIE1DT05URVhU
MzIgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDAwMDAzRg0KPiA+ICsjZGVmaW5lIE1DT05U
RVhUNjQNCj4gMHgwMDAwMDAwMDAwMDAxRkZGVUxMDQo+ID4gKyNkZWZpbmUgTUNPTlRFWFQzMl9I
Q09OVEVYVCAgICAgICAgICAgICAgICAweDAwMDAwMDdGDQo+ID4gKyNkZWZpbmUgTUNPTlRFWFQ2
NF9IQ09OVEVYVA0KPiAweDAwMDAwMDAwMDAwMDNGRkZVTEwNCj4gPiAgI2VuZGlmDQo+ID4gZGlm
ZiAtLWdpdCBhL3RhcmdldC9yaXNjdi9jcHVfY2ZnLmggYi90YXJnZXQvcmlzY3YvY3B1X2NmZy5o
IGluZGV4DQo+ID4gZjQ2MDVmYi4uNGYxY2IwNCAxMDA2NDQNCj4gPiAtLS0gYS90YXJnZXQvcmlz
Y3YvY3B1X2NmZy5oDQo+ID4gKysrIGIvdGFyZ2V0L3Jpc2N2L2NwdV9jZmcuaA0KPiA+IEBAIC0x
NDcsNiArMTQ3LDcgQEAgc3RydWN0IFJJU0NWQ1BVQ29uZmlnIHsNCj4gPiAgICAgIGJvb2wgcG1w
Ow0KPiA+ICAgICAgYm9vbCBkZWJ1ZzsNCj4gPiAgICAgIGJvb2wgbWlzYV93Ow0KPiA+ICsgICAg
Ym9vbCBleHRfc2R0cmlnX21jb250ZXh0Ow0KPiA+DQo+ID4gICAgICBib29sIHNob3J0X2lzYV9z
dHJpbmc7DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3Jpc2N2L2Nzci5jIGIvdGFyZ2V0
L3Jpc2N2L2Nzci5jIGluZGV4DQo+ID4gZmRlN2NlMS4uMGI2ODc4NyAxMDA2NDQNCj4gPiAtLS0g
YS90YXJnZXQvcmlzY3YvY3NyLmMNCj4gPiArKysgYi90YXJnZXQvcmlzY3YvY3NyLmMNCj4gPiBA
QCAtNTQ5LDYgKzU0OSwxNSBAQCBzdGF0aWMgUklTQ1ZFeGNlcHRpb24gZGVidWcoQ1BVUklTQ1ZT
dGF0ZSAqZW52LA0KPiA+IGludCBjc3JubykNCj4gPg0KPiA+ICAgICAgcmV0dXJuIFJJU0NWX0VY
Q1BfSUxMRUdBTF9JTlNUOw0KPiA+ICB9DQo+ID4gKw0KPiA+ICtzdGF0aWMgUklTQ1ZFeGNlcHRp
b24gc2R0cmlnX21jb250ZXh0KENQVVJJU0NWU3RhdGUgKmVudiwgaW50IGNzcm5vKQ0KPiA+ICt7
DQo+ID4gKyAgICBpZiAocmlzY3ZfY3B1X2NmZyhlbnYpLT5kZWJ1ZyAmJg0KPiByaXNjdl9jcHVf
Y2ZnKGVudiktPmV4dF9zZHRyaWdfbWNvbnRleHQpIHsNCj4gPiArICAgICAgICByZXR1cm4gUklT
Q1ZfRVhDUF9OT05FOw0KPiA+ICsgICAgfQ0KPiA+ICsNCj4gPiArICAgIHJldHVybiBSSVNDVl9F
WENQX0lMTEVHQUxfSU5TVDsNCj4gPiArfQ0KPiA+ICAjZW5kaWYNCj4gPg0KPiA+ICBzdGF0aWMg
UklTQ1ZFeGNlcHRpb24gc2VlZChDUFVSSVNDVlN0YXRlICplbnYsIGludCBjc3JubykgQEAgLTM5
MDAsNg0KPiA+ICszOTA5LDMxIEBAIHN0YXRpYyBSSVNDVkV4Y2VwdGlvbiByZWFkX3RpbmZvKENQ
VVJJU0NWU3RhdGUgKmVudiwgaW50DQo+IGNzcm5vLA0KPiA+ICAgICAgcmV0dXJuIFJJU0NWX0VY
Q1BfTk9ORTsNCj4gPiAgfQ0KPiA+DQo+ID4gK3N0YXRpYyBSSVNDVkV4Y2VwdGlvbiByZWFkX21j
b250ZXh0KENQVVJJU0NWU3RhdGUgKmVudiwgaW50IGNzcm5vLA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB0YXJnZXRfdWxvbmcgKnZhbCkgew0KPiA+ICsgICAgKnZh
bCA9IGVudi0+bWNvbnRleHQ7DQo+ID4gKyAgICByZXR1cm4gUklTQ1ZfRVhDUF9OT05FOw0KPiA+
ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgUklTQ1ZFeGNlcHRpb24gd3JpdGVfbWNvbnRleHQoQ1BV
UklTQ1ZTdGF0ZSAqZW52LCBpbnQgY3Nybm8sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB0YXJnZXRfdWxvbmcgdmFsKSB7DQo+ID4gKyAgICBib29sIHJ2MzIgPSBy
aXNjdl9jcHVfbXhsKGVudikgPT0gTVhMX1JWMzIgPyB0cnVlIDogZmFsc2U7DQo+ID4gKyAgICBp
bnQzMl90IG1hc2s7DQo+ID4gKw0KPiA+ICsgICAgaWYgKHJpc2N2X2hhc19leHQoZW52LCBSVkgp
KSB7DQo+ID4gKyAgICAgICAgLyogU3BlYyBzdWdnZXN0IDctYml0IGZvciBSVjMyIGFuZCAxNC1i
aXQgZm9yIFJWNjQgdy8gSCBleHRlbnNpb24NCj4gKi8NCj4gPiArICAgICAgICBtYXNrID0gcnYz
MiA/IE1DT05URVhUMzJfSENPTlRFWFQgOg0KPiBNQ09OVEVYVDY0X0hDT05URVhUOw0KPiA+ICsg
ICAgfSBlbHNlIHsNCj4gPiArICAgICAgICAvKiBTcGVjIHN1Z2dlc3QgNi1iaXQgZm9yIFJWMzIg
YW5kIDEzLWJpdCBmb3IgUlY2NCB3L28gSA0KPiBleHRlbnNpb24gKi8NCj4gPiArICAgICAgICBt
YXNrID0gcnYzMiA/IE1DT05URVhUMzIgOiBNQ09OVEVYVDY0Ow0KPiA+ICsgICAgfQ0KPiA+ICsN
Cj4gPiArICAgIGVudi0+bWNvbnRleHQgPSB2YWwgJiBtYXNrOw0KPiA+ICsgICAgcmV0dXJuIFJJ
U0NWX0VYQ1BfTk9ORTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgLyoNCj4gPiAgICogRnVuY3Rpb25z
IHRvIGFjY2VzcyBQb2ludGVyIE1hc2tpbmcgZmVhdHVyZSByZWdpc3RlcnMNCj4gPiAgICogV2Ug
aGF2ZSB0byBjaGVjayBpZiBjdXJyZW50IHByaXYgbHZsIGNvdWxkIG1vZGlmeSBAQCAtNDc5OSw2
DQo+ID4gKzQ4MzMsOCBAQCByaXNjdl9jc3Jfb3BlcmF0aW9ucyBjc3Jfb3BzW0NTUl9UQUJMRV9T
SVpFXSA9IHsNCj4gPiAgICAgIFtDU1JfVERBVEEyXSAgICA9ICB7ICJ0ZGF0YTIiLCAgZGVidWcs
IHJlYWRfdGRhdGEsDQo+IHdyaXRlX3RkYXRhICAgfSwNCj4gPiAgICAgIFtDU1JfVERBVEEzXSAg
ICA9ICB7ICJ0ZGF0YTMiLCAgZGVidWcsIHJlYWRfdGRhdGEsDQo+IHdyaXRlX3RkYXRhICAgfSwN
Cj4gPiAgICAgIFtDU1JfVElORk9dICAgICA9ICB7ICJ0aW5mbyIsICAgZGVidWcsIHJlYWRfdGlu
Zm8sDQo+IHdyaXRlX2lnbm9yZSAgfSwNCj4gPiArICAgIFtDU1JfTUNPTlRFWFRdICA9ICB7ICJt
Y29udGV4dCIsIHNkdHJpZ19tY29udGV4dCwNCj4gcmVhZF9tY29udGV4dCwNCj4gPiArDQo+IHdy
aXRlX21jb250ZXh0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9LA0KPiA+DQo+ID4g
ICAgICAvKiBVc2VyIFBvaW50ZXIgTWFza2luZyAqLw0KPiA+ICAgICAgW0NTUl9VTVRFXSAgICA9
ICAgIHsgInVtdGUiLCAgICBwb2ludGVyX21hc2tpbmcsIHJlYWRfdW10ZSwNCj4gd3JpdGVfdW10
ZSB9LA0KPiA+IGRpZmYgLS1naXQgYS90YXJnZXQvcmlzY3YvZGVidWcuYyBiL3RhcmdldC9yaXNj
di9kZWJ1Zy5jIGluZGV4DQo+ID4gNDk0NWQxYS4uZTMwZDk5YyAxMDA2NDQNCj4gPiAtLS0gYS90
YXJnZXQvcmlzY3YvZGVidWcuYw0KPiA+ICsrKyBiL3RhcmdldC9yaXNjdi9kZWJ1Zy5jDQo+ID4g
QEAgLTk0MCw0ICs5NDAsNiBAQCB2b2lkIHJpc2N2X3RyaWdnZXJfcmVzZXRfaG9sZChDUFVSSVND
VlN0YXRlICplbnYpDQo+ID4gICAgICAgICAgZW52LT5jcHVfd2F0Y2hwb2ludFtpXSA9IE5VTEw7
DQo+ID4gICAgICAgICAgdGltZXJfZGVsKGVudi0+aXRyaWdnZXJfdGltZXJbaV0pOw0KPiA+ICAg
ICAgfQ0KPiA+ICsNCj4gPiArICAgIGVudi0+bWNvbnRleHQgPSAwOw0KPiA+ICB9DQo+ID4gLS0N
Cj4gPiAyLjM0LjENCj4gPg0KPiA+DQo=

