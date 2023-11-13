Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D99C4332F
	for <qemu-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 14:39:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r2Y67-0006V6-Vh; Mon, 13 Nov 2023 09:39:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <LeoHou@canaan-creative.com>)
 id 1r2OWX-0003Kq-BF; Sun, 12 Nov 2023 23:26:09 -0500
Received: from mail-sh0chn02on20614.outbound.protection.partner.outlook.cn
 ([2406:e500:4420:2::614]
 helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <LeoHou@canaan-creative.com>)
 id 1r2OWL-0005Ya-2C; Sun, 12 Nov 2023 23:26:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+wtcu0pX09UqBnXSQ+tlb0Vz2W3AKkFerjEWqDOaT+4ElvZCUOw+ta/0pggoH3XOHXT1ibD/4U3v23y2DUq1woxoXg49xhtIX24R5j0W7KLr+le2iMTC7Bp+OVeCHv9A8Kx8Hu1wogqJ7CviXJ9M5anN7iRiW3pMYo0NpExh8Bf1vW+2cZtqFM4pg6hsBQwFmY/0Vopxm6H7IGdBZE+YUvXkG8ijuv3C/aQv0+sXYKk+fhQTa4yEw9xa9Vs7iCp723kWNM6FBlof2iM/HVssATwDxRoGOGnFtQAOv1BNjcp7714HyspdqM9SGRq8zqzrjSSFDJ8Rtjp1IdE4kEKUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zp80onDPaHatJBjSG5Zh1k1dfAt1pG8QpWi3imVsBDs=;
 b=BcLrSP3xWkDGO53Iu55kvsFhHqQ6LgJ0sHtHQryrbCiL5lYaeplb34P716Z8q4elVtOj1U8wkLxFDk8XrWLHsSDOjElZ3n2nuBEqgBQms8MJs0QDBgtz94U7g3cNGG0/wXCPevw7wyRtAqzqdFihh3UiwnNY4pmF0e6KYm6LLZVIkoatcsySRz+vXoQGvnczXbUU5jdQJ3LxMKkZRjoa8/KKzAlkech8WHWu7N+IW4YQBH0hJzAMKAo1BA3H7dR1EdV7i9NBLV+lxV6fZfxuDxcVf76HDxXRWMITY+K+Aq1iP1U7SpyC9TY1psHiPBJ3/mvKzo/VO3/zmVPJvvdpVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=canaan-creative.com; dmarc=pass action=none
 header.from=canaan-creative.com; dkim=pass header.d=canaan-creative.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canaan-creative.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zp80onDPaHatJBjSG5Zh1k1dfAt1pG8QpWi3imVsBDs=;
 b=fOYAA91wCVFgotDHEVfP+y601YjsFmFPIRxXmNIHy+UslaWaMQJbu5DihL3eJxi3S/fvDU+EIKTHo7TwWbx1XIl0cEcG1Iju0lf6TzVrO5x2Ikx5IhtMbRpnpQQVnNT+E4MNqCPBYS4JvGm2jPtpbgCIJraYvMonCrvtot3qRc3HkFhrKz6Je30sG9IJXN8ICV/Al+J+kEP/l/IaKDNiridX8k32n7FVznbMc04IbkQpwWdhZAmpEo2Mw/0ApMgdIFtpHjliUym5Z5yOXw9/uYK3xmMa58thGT8HW5klY1Bs8EcN2/qePDZ17b3mqm3qDeWL+V7kE8XgeMsGgwq/1w==
Received: from BJSPR01MB0627.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:d::14) by BJSPR01MB0497.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.38; Mon, 13 Nov
 2023 04:25:43 +0000
Received: from BJSPR01MB0627.CHNPR01.prod.partner.outlook.cn
 ([fe80::16f1:3381:bdd6:efc7]) by
 BJSPR01MB0627.CHNPR01.prod.partner.outlook.cn ([fe80::16f1:3381:bdd6:efc7%5])
 with mapi id 15.20.6933.038; Mon, 13 Nov 2023 04:25:43 +0000
From: LeoHou <LeoHou@canaan-creative.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Dongxue
 Zhang <elta.era@gmail.com>
CC: Alistair Francis <alistair.francis@wdc.com>, Anup Patel
 <apatel@ventanamicro.com>, Bin Meng <bin.meng@windriver.com>, Daniel Henrique
 Barboza <dbarboza@ventanamicro.com>, =?utf-8?B?5L6v6Iux5LmQ?=
 <houyingle@canaan-creative.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, QEMU Developers <qemu-devel@nongnu.org>, qemu-riscv
 <qemu-riscv@nongnu.org>, =?utf-8?B?5byg5Lic6Zuq?=
 <zhangdongxue@canaan-creative.com>, "leohou1402@gmail.com"
 <leohou1402@gmail.com>
Subject: Re: [PATCH 1/1] hw/intc/riscv_aclint:Change the way to get CPUState
 from hard-base to pu_index
Thread-Topic: [PATCH 1/1] hw/intc/riscv_aclint:Change the way to get CPUState
 from hard-base to pu_index
Thread-Index: AQHaErOXvFKdUra6MUCnagOpDbQODbBxRzYAgADVewCABY63LA==
Date: Mon, 13 Nov 2023 04:25:43 +0000
Message-ID: <BJSPR01MB062758831AA8BF73856F5DFC95B3A@BJSPR01MB0627.CHNPR01.prod.partner.outlook.cn>
References: <cover.1699496263.git.houyingle@canaan-creative.com>
 <6d1d8cc8c2b37b145e4a826095619097fa4a34d5.1699496263.git.houyingle@canaan-creative.com>
 <CAEomy4TmM0ShGkuV2mprB8Xm0Kn62ZWZA7Gnfvt07pioY9fCCA@mail.gmail.com>
 <bf0c7c6d-a940-4968-ab18-4af6125b8d0b@linaro.org>
In-Reply-To: <bf0c7c6d-a940-4968-ab18-4af6125b8d0b@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=canaan-creative.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BJSPR01MB0627:EE_|BJSPR01MB0497:EE_
x-ms-office365-filtering-correlation-id: 6b93aeaf-137a-401b-e5fc-08dbe4009a0a
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g4OVSqwm8E/A8V+aOw1AhOZf7W4YXY70FNYyVhzFiA9LwZA6ZouHyKeKOSLnGE4L9t6El8Yz+PtjaMi/A4jGBZV+VjCzIH44MnMUWZx2t1uKq3/SBLA5kxXPAnvj0JAS5vv21MeH+c6Hfk8JZw5F8q6stTWfFR+D1aRbR889jcTLNiwaYdXvWDU3LKLfdOpjbK+g1SxoShJBK2VDaxjYTjqSnyFKbunefDjWgAWxyNz8sDermB7bU9BrwLb2cJX9HhuOwdTKfnGweBRvnDhavVolrmyhDaKrdkXdHUfYJmuIA+/XZXd2jCCnFR3RSRN2EdV/uDwcHv22qKQWTt2fZ7UULoRvJr3Ghi3DiOOlFCtYtRL5gt2dIpn7lRDlz3OgstlfTrvWPEw3C47XFsq0lankxB3G7Yq/wU+US5p47V1Oslz0XToSfYQ6tXF3r9jb9n9CUedLjmhDwQfvbro1Jc2MQ+AsiWZKC/QhkkGu7iwdwe6vQobAwjTKJU9JsC9t6OBRYwzIBfNO0kZvK/CKfBUj+gZqgtdaR9//JdOMetHIOUhXINNCzBRX70g+tn4oKW1q7XhOV+fpEn1H8NmJoA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BJSPR01MB0627.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(366004)(39830400003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(38100700002)(7416002)(41300700001)(2906002)(41320700001)(33656002)(38070700009)(40180700001)(122000001)(40160700002)(66476007)(110136005)(54906003)(66946007)(71200400001)(66556008)(26005)(64756008)(76116006)(66446008)(86362001)(5660300002)(7696005)(9686003)(966005)(53546011)(55016003)(508600001)(8936002)(4326008)(8676002)(83380400001)(43043002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2RtU1RxLzRhelMxeU5WcmpzQ044MnBZN3J3RUxibXdtSkN5a3NHN1lTS3pr?=
 =?utf-8?B?VGVtaFV6NVVVN2NhakxUUDJXMnhZVmFmb3BJUk04SDcrekxYbGZtNjFla1VX?=
 =?utf-8?B?dHkreXVXSzA3WEhoYWZhbTZDOW9zTDIzSVQwakZhY2NDZXd3TFdWMVdCdTVn?=
 =?utf-8?B?K2R6R3hmOHBNMUVYTHkrdnJDS1QxUk96RnlhakozRGdmWWhLQ3RaU0U0bHJQ?=
 =?utf-8?B?S0NYMzVTRDRWZTcxa2pGdHVDTDVzNVF1aTI1cUd4MzFRc0R4NjArZmpjUWpK?=
 =?utf-8?B?SGhpeHdWRDJ3NjdxdXVNZjhCcURWWTZwL0JNTWxRbFdsODNvSzAvVmJoWU5p?=
 =?utf-8?B?MExwNjF6NjNucFRIS1piNEJBK3JKZTIrbWNORlRHcW1YazdzaHVuSjNId3Np?=
 =?utf-8?B?OE5rTnlSTldLU0RhQW4vTjd0aWtnTjVPWnZuTXRLSXI5N3V2bWJPdEhOcGcy?=
 =?utf-8?B?enJQTG5aalQwNnYzbXNpd285VGYzMlRMcHdPSzhJclBRZDlyT0UyMzRxNEtm?=
 =?utf-8?B?Ym5ZaXU1WTFKSnh6UjlteXZvSlE5Z0RJUnhza09GV2VLeDd2NVh1OVRieHhw?=
 =?utf-8?B?MWVNcVRmb2ZpZGhaajBPZWI5UEIyOUNnUCswbEMzR0tZNUU5ckp5TzNRN2V3?=
 =?utf-8?B?UktmNHB5RUVwc25zWjJ1ZjdYbEJBRFBSYU9uTE0wK09iMjliOWdkUzZxZkhn?=
 =?utf-8?B?eGNIc0d0clNKOHEwYStMMDRqVlNkZmtKNFQ4a1ZPRVljQmVCNUljNTVmMG9u?=
 =?utf-8?B?ZVFuUUx3ZGxBSzdEMjRHRmx1OVRCWGF6ZGx5NmkreUJkeWFUZ2hMaExIQlZ1?=
 =?utf-8?B?NnNJNmVUbVQxVE5QQ05xRTQ4VG5yNUhSbmk1T3Z0UGxsaU5jZWF0VW9pRHdy?=
 =?utf-8?B?cm1KZU9YWnZvUkZ1Ykhld1NVMC9zSEtNQmVIeU5OVlBWQU5KNUFrSjMvNTRG?=
 =?utf-8?B?WjJqNFZKc211NUgyb0liQVl2MFJ2YWJsTTB4V08vdlBjcTJXT2VOcjhqTUVJ?=
 =?utf-8?B?dzlQWC90NTNtSnZ2bWx4OXlFSFFxWk4xalZndlVObkpNYnppbm1TckMzc25X?=
 =?utf-8?B?Q0licUt6V1krUlZrMCs4S3Z5S1dHTFNZOTJrMnBKQ2FJcFd5RjhpWVA1cXd1?=
 =?utf-8?B?SHZ5Qm4xYk1rakZtNVJ6eGxrNnluQ1ZLaDhLU250Rkd1OGttanF2ZExTcERL?=
 =?utf-8?B?K05hZHNLMmhlc0VBUVpJTmdTQVZpZzJsWFZKY0EvQ0hqTlFNeW4zVllPOEVs?=
 =?utf-8?B?UC9ZTXhBR0R0bnlLTmM0eVBjd080UFpvaFRXZE4yZ1ZpNTlVT1RzTTZ5WHBr?=
 =?utf-8?B?QzNMUlN5Yys2THptRTYwY3BKRytHMlUyckJEeTl0RzFoOVBoZ21Hc0l4dDQ4?=
 =?utf-8?B?U0g2UEN2ZENHUGZFZ2ZlQ0ZRSEpkWG0rRUdtdUdlcUVKK2lvYVpoSTh6alVN?=
 =?utf-8?B?NmRpRXFiY2NKY2M5Vmw1ODhkQXhteVJlb3VzRm4rQjk1NXZRQ3VTTFhDTkd4?=
 =?utf-8?B?cy8xdXJ5Y2NQMXF2RGhBbzBRWjFGbHZsdTdaMzdpYkt3MjZDV3ZSNGdBaW5Y?=
 =?utf-8?B?Qkk5WG1KNjhFTnowUCs3aW9yVTZxaHdrQVRlL2ExdHdjUzFreFNVVHNJNVJh?=
 =?utf-8?B?QWY4RnNpUEhaSGhiNUR3VzFBeHppV2phUExZSVdIU3JWM3N5eDVUTE1TZUJj?=
 =?utf-8?B?SW9XR2dGbDBVd2JBbUUzcG4wK01jV0w4dHVkUXcxNXFHN3JobzFGcFY3blVm?=
 =?utf-8?B?U1VnemhyWFN2N1ZOdlRvQm5ZMWkrczFRNHZ4S0NUVlNMSmFvZlVvTGVwNnJq?=
 =?utf-8?B?K3Ztd0IwMmdVK20rclA4aGhDOWJuaUJXdmJJdXU5a1ZVN21Vc3VrNWttMXJi?=
 =?utf-8?B?NXloSFdGYnZXemxsNGt4MmdGWVgwQURMSmNmMDFtTi80K2lSTjV1SElsQjJq?=
 =?utf-8?B?RTJvWHdkQmJzRXhsVHNxZzRTK2l6MmltNVVidUZxYmlqc2ljeERoeitnUzJw?=
 =?utf-8?B?Z0EwcW9nNU5yUmhZb2JZZmw5cVJTMm1JcEpPSE13V2lRcndUNC9lMWJYNTB2?=
 =?utf-8?B?elAyT3RPaHRZWlFTZDh1SzhWSHVDbExGdXZrSFNVRHkrbHFXdW83K0lzTldB?=
 =?utf-8?Q?sqBD5FPD1G6Ft4mv7gSKYtXZc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: canaan-creative.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0627.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b93aeaf-137a-401b-e5fc-08dbe4009a0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 04:25:43.8057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fb9be9d7-8f56-4a62-b26e-3018a3e771a5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jIxMO8z1XyxDlyZieVY8uuG76QysnTOaxLktGMCdUjxIoX5dKuxLtSb/AoEwB3ywP/TWJULw2tpnnZAlYgcYspS9lJPRQVePUjMZta4Jam0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0497
Received-SPF: permerror client-ip=2406:e500:4420:2::614;
 envelope-from=LeoHou@canaan-creative.com;
 helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1.199,
 SPF_HELO_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 13 Nov 2023 09:39:25 -0500
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

T24gOS8xMS8yMyAyMzoyNiwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgIHdyb3RlOgrCoAo+SGkg
TGVvLAo+Cj5GaXJzdCwgSSBjYW4ndCBmaW5kIHlvdXIgcGF0Y2ggaW4gbXkgbWFpbGJveCwgc28g
SSdtIHJlcGx5aW5nIHRvCj5Eb25neHVlJ3MgcmV2aWV3Lgo+Cj5PbiA5LzExLzIzIDAzOjQxLCBE
b25neHVlIFpoYW5nIHdyb3RlOgo+PiBSZXZpZXdlZC1ieTogRG9uZ3h1ZSBaaGFuZyA8emhhbmdk
b25neHVlQGNhbmFhbi1jcmVhdGl2ZS5jb20+Cj4+IAo+PiAKPj4+IE9uIFRodSwgTm92IDksIDIw
MjMgYXQgMTA6MjLigK9BTSBMZW8gSG91IDxMZW9Ib3VAY2FuYWFuLWNyZWF0aXZlLmNvbT4gd3Jv
dGU6Cj4+Pgo+Pj4gRnJvbTogTGVvIEhvdSA8aG91eWluZ2xlQGNhbmFhbi1jcmVhdGl2ZS5jb20+
Cj4+Pgo+Pj4gY3B1X2J5X2FyY2hfaWQoKSB1c2VzIGhhcnRpZC1iYXNlIGFzIHRoZSBpbmRleCB0
byBvYnRhaW4gdGhlIGNvcnJlc3BvbmRpbmcgQ1BVU3RhdGUgc3RydWN0dXJlIHZhcmlhYmxlLgo+
Pj4gcWVtdV9nZXRfY3B1KCkgdXNlcyBjcHVfaW5kZXggYXMgdGhlIGluZGV4IHRvIG9idGFpbiB0
aGUgY29ycmVzcG9uZGluZyBDUFVTdGF0ZSBzdHJ1Y3R1cmUgdmFyaWFibGUuCj4+Pgo+Pj4gSW4g
aGV0ZXJvZ2VuZW91cyBDUFUgb3IgbXVsdGktc29ja2V0IHNjZW5hcmlvcywgbXVsdGlwbGUgYWNs
aW50IG5lZWRzIHRvIGJlIGluc3RhbnRpYXRlZCwKPj4+IGFuZCB0aGUgaGFydGlkLWJhc2Ugb2Yg
ZWFjaCBjcHUgYm91bmQgYnkgYWNsaW50IGNhbiBzdGFydCBmcm9tIDAuIElmIGNwdV9ieV9hcmNo
X2lkKCkgaXMgc3RpbGwgdXNlZAo+Pj4gaW4gdGhpcyBjYXNlLCBhbGwgYWNsaW50IHdpbGwgYmlu
ZCB0byB0aGUgZWFybGllc3QgaW5pdGlhbGl6ZWQgaGFydCB3aXRoIGhhcnRpZC1iYXNlIDAgYW5k
IGNhdXNlIGNvbmZsaWN0cy4KPj4+Cj4+PiBTbyB3aXRoIGNwdV9pbmRleCBhcyB0aGUgaW5kZXgs
IHVzZSBxZW11X2dldF9jcHUoKSB0byBnZXQgdGhlIENQVVN0YXRlIHN0cnVjdCB2YXJpYWJsZSwK
Pj4+IGFuZCBjb25uZWN0IHRoZSBhY2xpbnQgaW50ZXJydXB0IGxpbmUgdG8gdGhlIGhhcnQgb2Yg
dGhlIENQVSBpbmRleGVkIHdpdGggY3B1X2luZGV4Cj4+PiAodGhlIGNvcnJlc3BvbmRpbmcgaGFy
dGlkLWJhc2UgY2FuIHN0YXJ0IGF0IDApLiBJdCdzIG1vcmUgcmVhc29uYWJsZS4KPj4+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBMZW8gSG91IDxob3V5aW5nbGVAY2FuYWFuLWNyZWF0aXZlLmNvbT4KPj4+
IC0tLQo+Pj7CoMKgIGh3L2ludGMvcmlzY3ZfYWNsaW50LmMgfCAxNiArKysrKysrKy0tLS0tLS0t
Cj4+PsKgwqAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkK
Pj4+Cj4+PmRpZmYgLS1naXQgYS9ody9pbnRjL3Jpc2N2X2FjbGludC5jIGIvaHcvaW50Yy9yaXNj
dl9hY2xpbnQuYwo+Pj4gaW5kZXggYWIxYTBiNGIzYS4uYmU4ZjUzOWZjYiAxMDA2NDQKPj4+IC0t
LSBhL2h3L2ludGMvcmlzY3ZfYWNsaW50LmMKPj4+ICsrKyBiL2h3L2ludGMvcmlzY3ZfYWNsaW50
LmMKPj4+IEBAIC0xMzAsNyArMTMwLDcgQEAgc3RhdGljIHVpbnQ2NF90IHJpc2N2X2FjbGludF9t
dGltZXJfcmVhZCh2b2lkICpvcGFxdWUsIGh3YWRkciBhZGRyLAo+Pj7CoMKgwqDCoMKgwqDCoMKg
wqDCoCBhZGRyIDwgKG10aW1lci0+dGltZWNtcF9iYXNlICsgKG10aW1lci0+bnVtX2hhcnRzIDw8
IDMpKSkgewo+Pj7CoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplX3QgaGFydGlkID0gbXRpbWVyLT5o
YXJ0aWRfYmFzZSArCj4+PsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgKChhZGRyIC0gbXRpbWVyLT50aW1lY21wX2Jhc2UpID4+IDMpOwo+Pj4gLcKg
wqDCoMKgwqDCoMKgIENQVVN0YXRlICpjcHUgPSBjcHVfYnlfYXJjaF9pZChoYXJ0aWQpOwo+Pj4g
K8KgwqDCoMKgwqDCoMKgIENQVVN0YXRlICpjcHUgPSBxZW11X2dldF9jcHUoaGFydGlkKTsKPgo+
VGhlcmUgaXMgc29tZSBjb2RlIHNtZWxsIGhlcmUuIHFlbXVfZ2V0X2NwdSgpIHNob3VsZG4ndCBi
ZSBjYWxsZWQgYnkKPmRldmljZSBtb2RlbHMsIGJ1dCBvbmx5IGJ5IGFjY2VsZXJhdG9ycy4KClll
cywgcWVtdV9nZXRfY3B1KCkgaXMgZGVzaWduZWQgdG8gYmUgY2FsbGVkIGJ5IGFjY2VsZXJhdG9y
cy4KQnV0IHRoZXJlIGlzIGN1cnJlbnRseSBubyBuZXcgQVBJIHRvIHN1cHBvcnQgbXVsdGktc29j
a2V0IGFuZApoZXRlcm9nZW5lb3VzIHByb2Nlc3NvciBhcmNoaXRlY3R1cmVz77yMYW5kIHNpZml2
ZV9wbGljIGhhcyBiZWVuCmRlc2lnbmVkIHdpdGggcWVtdV9nZXRfY3B1KCkuClBsZWFzZSByZWZl
ciB0bzoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3FlbXUtZGV2ZWwvMTUxOTY4MzQ4MC0z
MzIwMS0xNi1naXQtc2VuZC1lbWFpbC1tamNAc2lmaXZlLmNvbS8KWzJdIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3FlbXUtZGV2ZWwvMjAyMDA4MjUxODQ4MzYuMTI4MjM3MS0zLWFsaXN0YWlyLmZy
YW5jaXNAd2RjLmNvbS8KCgo+TWF5YmUgdGhlIHRpbWVyIHNob3VsZCBnZXQgYSBsaW5rIG9mIHRo
ZSBoYXJ0IGFycmF5IGl0IGJlbG9uZ3MgdG8sCj5hbmQgb2Zmc2V0IHRvIHRoaXMgYXJyYXkgYmFz
ZSBoYXJ0aWQ/CgpUaGUgc2FtZSBwcm9ibGVtIGV4aXN0cyBub3Qgb25seSB3aXRoIHRpbWVyLCBi
dXQgYWxzbyB3aXRoIGFjbGludC4KVGhlcmUgbmVlZHMgdG8gYmUgYSBnZW5lcmFsIGFwcHJvYWNo
IHRvIHRoaXMgcHJvYmxlbS4KCgo+SSdtIGdvaW5nIHRvCj5OQUNLCj50aGlzIHBhdGNoIHVudGls
IGZ1cnRoZXIgcmV2aWV3IC8gY2xhcmlmaWNhdGlvbnMuCgpSZWdhcmRzLAoKTGVvIEhvdS4=

