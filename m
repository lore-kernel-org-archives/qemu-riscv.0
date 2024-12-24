Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C26CE77188
	for <qemu-riscv@archiver.kernel.org>; Tue, 24 Dec 2024 05:00:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tPx24-0005yL-Jf; Tue, 24 Dec 2024 00:00:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiachao1990@outlook.com>)
 id 1tPuYl-0002qU-1b
 for qemu-riscv@nongnu.org; Mon, 23 Dec 2024 21:22:11 -0500
Received: from mail-psaapc01olkn2092.outbound.protection.outlook.com
 ([40.92.52.92] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiachao1990@outlook.com>)
 id 1tPuYh-0007Cs-NO
 for qemu-riscv@nongnu.org; Mon, 23 Dec 2024 21:22:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5bMxwtnwOVBnGYfLRVVSyrfRN7eGYryLNALRE/VGcPVLXx3EM2d3L8LgFuXufmdtT9ZfnnQMqqEuVbXYF5YpV0/KOOi6QjtBF2gLl7q76PINGwyeX8+8w0J5Oz3j8CcNidhTYdXT8qaiSQk92+8a/jNzc+PmyG80ZUndh2YwkdQ2n/pWfZ/5UdCbJ28xlKnf9iTxiSGi7cjvR+2oZdyN9/5Gmj4N0PKxHvBof60gfEuq7JKESc9cvNZB43jqxwk/in1X6bz4l4IJqTBjGkco81auV/MvXFEtyl0cKltDafK6vZup5qjv/UGzzXqD0GKL73qO/IaIs1C5LydgKQDXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RB3K4jdkuorKmariWhto0bPtBCGzGMGm8iWbhjYju7w=;
 b=CifaShPj9uEYotzWmDhCCq7XRwdxU1LV+12074kyaJbBpEA6UYRX/2N6l6ze7H8PcbIItuRoDvSYTLSNR33Tu6e7WkhbKjzG/xsZvwKpBKeQhLya1kxZ7K8H6zpfwbXepqjwXytxTznJHn3z7YhGYA9boJJMCwyZVvh0aZdwsBpb5RXjn9M398orW2FInua7moSQm0mqhXw9e1HTWGOuWIq4mzHPOhlhOL/UADzcJTJn4O2IdgOswbp0+iDogSMFxswlXzUBKw9sWf7PYS0Rz1//EY/q2zKU2SmVQFJbjedGcMTMRIIUbxz5Kwui2jr1PGA9n9R2EquTCHNEuLutkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RB3K4jdkuorKmariWhto0bPtBCGzGMGm8iWbhjYju7w=;
 b=fx3Cdqkz/CPffy70ooGqSUj62yAQMdoK8+diMIAs2XIYERaErKrANViVkQRnp/j4LYj0KXwp+vmMSdtNVUernmyL4MKFAy3AT9u8Y0YcYAeyvYBP2ZonTe7nQkRo6ZaSNXrWEM0iELbSJEJsA3kG2XW/HzQN0FzSsQ8Kk1/Wv/RhEbqlRyypqHitX38C0J/IW3sUdU9A6MUB2ttr6nYY1396vA0hPHwBfObVwkbxGsXAocS55MncvsITm8tBGUYKwusZgzsqJdwd4vYt9eax553LAw/hisljSAkuJMccJ4/hEey/u7R4AfmpRk4Q3W9mTZnby4uccEgupUpVyyI/5w==
Received: from SEZPR02MB8046.apcprd02.prod.outlook.com (2603:1096:101:215::5)
 by SG2PR02MB5973.apcprd02.prod.outlook.com (2603:1096:4:1dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.18; Tue, 24 Dec
 2024 02:16:43 +0000
Received: from SEZPR02MB8046.apcprd02.prod.outlook.com
 ([fe80::3929:d2f:a877:3443]) by SEZPR02MB8046.apcprd02.prod.outlook.com
 ([fe80::3929:d2f:a877:3443%6]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 02:16:43 +0000
From: jia chao <jiachao1990@outlook.com>
To: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Subject: How to build a dynamic library for qemu
Thread-Topic: How to build a dynamic library for qemu
Thread-Index: AQHbVangxf9yRUaWUUWcKvVIyHogoQ==
Date: Tue, 24 Dec 2024 02:16:43 +0000
Message-ID: <FE74F6EE-3AA7-42C2-B539-858AA26E5A30@outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR02MB8046:EE_|SG2PR02MB5973:EE_
x-ms-office365-filtering-correlation-id: 041aca3f-41ab-41c6-ee0d-08dd23c102cd
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|8060799006|461199028|15080799006|8022599003|8062599003|7092599003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?RlgrVVU0R1UwL255MHcvSU9GMm1SckJKazN0dG9FTDFodUtkcGZiOVNyYmRa?=
 =?utf-8?B?b0VVeEY0MWppd1FPOXMyekdyQWRxQnRRVUlpNHpGcGJ4SUZJTGViL0lXUkQ5?=
 =?utf-8?B?Z1QxUWF5bStoMzVzNTl3NVZzSmVxeDNsNENpM1pCbHlQcFB5NFpBNlkwSXJH?=
 =?utf-8?B?RlpsY0haSzhCaVNqa01tK1BlZ2JwTTJVeWE3UVQ4OEJyNGdzQ1k3ZklIZUlK?=
 =?utf-8?B?aFdoN21Bbkp2QVc3NVVDcUJ0Mmc2TGIzeVI1UHVzS3FyTkhOZVB1YWJJZy8z?=
 =?utf-8?B?OXZqaitZelBRY1JZOVZCSHlza1lLUUpISFBMZGFDQUdwb0o4dlQxaWdQeHpH?=
 =?utf-8?B?ZzhXa3BGcncvR0VEVE5EU2ZLWnZYZjdMSjNmeHhCbU9Rc1lZTTBSM01wR290?=
 =?utf-8?B?VGJ0VE5TcGR1cjRtUUtDNXJDV0UzOThoZWZvdExqa09iTmZlOXZKNXlRMjBa?=
 =?utf-8?B?MWJkR09rUTdmL0JyQnJwV1Exdi9oRzBhQ3NjczVRWU5YbDcxZjMzYjNpOGE4?=
 =?utf-8?B?ZE1Hbi9ERkFvVEF0cTNzN001K1pMWmZVQ05hdnoyVVpmSXhSSjVLYzlZZjM5?=
 =?utf-8?B?bVQzKzNORzRCdFo2d0NlQkw2d3d0bVplNHJGLzNwNUtKMnVWOEVaNjVTRExz?=
 =?utf-8?B?NmY5Ykw1cUtML0VEVG1jQ2ZzVmhieG8yN2dEL2NNL3VwNlUzT1c0SjdUck9S?=
 =?utf-8?B?Z2FJM3dMK09RdlRuQld3R3JaSEgrc0QrZWdsaVdXeEoyd3c0MHY1bW4yeEcr?=
 =?utf-8?B?THBYSnNYMnNsMVpaYWNncjk4UmIyMWE5MUl6NFllMGZDbXhSZE1WR1lzcW9t?=
 =?utf-8?B?dXlrZm5hSEFaalY1WEhsYTNzSlpNdlR4TWUyNlVGdGZtRkt1VnBYbENBN1Bt?=
 =?utf-8?B?K0lYTHdUK3BkUUsrd0x1TVJQU1BhK2xmSVNQRmQ2QWdHNGdBT01ySVRJWnp3?=
 =?utf-8?B?U1JGSnFGQWhwRWVsa1RoNEFqUFNnaStnUXhmbTNhWlBEUTdBM05JYkYxVGlO?=
 =?utf-8?B?NkxBRWZMQXJmR21zYXQzcnRHTXZUWjBpZ25tanlzd2ljSGZnRmZtZ0JZOGJp?=
 =?utf-8?B?czY5cVZuQ1U1L3pqSmlNcFJRWmZUTllQWVg1MGJhM0JNOWxVam1zNEJsSTJp?=
 =?utf-8?B?OFdJa1VaTjFSVGVUNXRwTWxHaXMrTHVxNklNVU1nRWlNOWFKbU5CSFFJOE1Q?=
 =?utf-8?B?ZllNWmFvRm9UMHFhWXlBdThTd0s4ZnJLYmExSi85aENCaDh6eXI1VzBxTWlW?=
 =?utf-8?B?YndvS0NUS0hRVEd2cmNIMEpwZ214RDRMZkZQU3I0NEtSVnZNZ0dFQkM0QzhZ?=
 =?utf-8?B?ak55MWNaNENYV28wdzdteEFWTTkxMFpiNmZlaldsY25DZEJiV0RZZ1p4UnlF?=
 =?utf-8?B?ajlPV1hjbWZRZy9sWHJsOW1iQ1BYenRnOVlnWGpaNmJiaFBRZFFMTU5tQzQ2?=
 =?utf-8?B?K0ovNUhELzZZb1Ntc0RQTUYweEhQV2YyMXEwY1YycFV4UXExbm9iZWpvWUdU?=
 =?utf-8?Q?a0bBSc=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bW1lWExURnVWOVVCcEVFQXBEem5EeFpkdms3cG5WMEJqT2dNdm1GNmNHNUdT?=
 =?utf-8?B?M3JTSXVGTWJiYy9WVXFmUVFzeUlNT0pHZlU3LzB2NGR5cDVoeEs1M3dqYUkr?=
 =?utf-8?B?VFNTOUFXRzhtbFhtQnU5OU54M09acUdSMXQ1NHJOaXh3S093MVF2NXlBT3FF?=
 =?utf-8?B?OGt4dG9hK3lPWVZCb001VEN5Mm5LU2NHM2RRRjU3RWZGeGJZR0hUcVFXZ0s3?=
 =?utf-8?B?OUJ3N1d6eVg2blc3VTZodHQ5bG0xZGZZSktpeEtmeUdXVlFBZDU0VXNKQnVk?=
 =?utf-8?B?SFhpV0JITmxES01FTXRXbER1WFNjamNxNHMyMTBJN3ZaNm4xTExlYkVqckRx?=
 =?utf-8?B?bEMwOENMakE0WjBzZ3VrZFlEYjY5ZlFYQkwybHJvUkZ0b2dyczBBS2pJL3NZ?=
 =?utf-8?B?czQ4M3l6emNJRXNBRzdrOWJ3UlBjVGpSeFBsRU9qZ1hzWFRHSVl1VllFZGNt?=
 =?utf-8?B?R0IybDVJVjdnYmJuTkhiR1VrTFZVNVlZemhkRFZKTkN2TTFMaThZMnFFYU5t?=
 =?utf-8?B?NzMyUUM2NFVQUm9ydWNCM0FnMWNpTnloZFBQR0RhTndHMWd0dHVENGNzSnJu?=
 =?utf-8?B?U2k1ZURDdHBCMENwbFVTNXk4QTZUNTFBcmgwZXZxVlNZNWt6ajVCUHNzbGxS?=
 =?utf-8?B?bkVuMHY0ODBUV0tCRG9GVXhIelA0eXlMTE5YVG1HVkY1MTRPd1VMSjdJaWZl?=
 =?utf-8?B?RkpVK040SXBUN0hEekpVcnN5WDJIVGsvWjJkTGxNczhWc1pEZFZFczBpb0No?=
 =?utf-8?B?ZHBwNzF0ZHpMckJaclZscDJoNk50b0UyOFlvZUxoZ003MGZvVVU2SXh4ajkz?=
 =?utf-8?B?ZlFza3RXM0lsd3Blc0Rxb25QRENKUVg1NTRsZUpiYnhDS3FPSWx6V0VGQVB0?=
 =?utf-8?B?Z0FpL0pxLzR5YUZtRVFwN09XcnFJLysxQUFaaG04VENVd0RsTVlKSWJyQ0hL?=
 =?utf-8?B?NWVaVWdCT2F6cWJHVXBwK1JzSU1aUzA2UGY0Zm1DN3dNbW9jVmpxMDRFN0Fn?=
 =?utf-8?B?MzN6dGV6dmpaZXBnWlVBQ1VoeFdnem5nckNZWVdZdkQ4aDRhTlkrVG8wakli?=
 =?utf-8?B?bEljY0l6TWt1VWJwT3gzMTRRVEFyZUcxd3VVR2paR0FiME5pTzA4NnRmdnk0?=
 =?utf-8?B?OEgyUjhGeE9xQkFZZGdYb2EyakxEeThaY3kyV21VUnhjVnMvcXgyVnVaRXNa?=
 =?utf-8?B?R2xGdEtwRDZvMXlXeVQ4ZW1JTXhDVHd2NUllUHQ0Z1Bnd3BDclB6bWtGRXJy?=
 =?utf-8?B?U3RJVGhDT2V4OVU2MEJaZVBlN3Y1L3c0SWZpM01KTnBKeC96SVFvM1hHNG9D?=
 =?utf-8?B?L0UxdjFBdUZrZmh1R2dhdTB2ODBtSzBHVzQwUE15WXcrajM3WWRwUG5JeVI1?=
 =?utf-8?B?ZEo3S29CRHpOMThheGNtVXhVSHVJVlNaRWltU3J5TTVIeEwvazV0cFo5WWNr?=
 =?utf-8?B?VXIvUG1FcU9FOWtnVFptc3VCd29RYmRDUTlXK1kxR1FMVzdSUDZ2VHNsbTJD?=
 =?utf-8?B?RDUvVEZIYlNmaERPNnAwOGh0VXZKMFU4MXYzYktkSDNYbkxkWDVQMDJaWmh5?=
 =?utf-8?B?SU93RE1vY2dncXo1a0JDcG1yeW8vQk9HM0lsdERoSE9LWmZpdm9LU2lqMmVk?=
 =?utf-8?B?Z1d5UGhBTG5tOTBvcnBnTnYwc1pLOTFSaUdiTm00dXlKUUF5a1VobExkTllz?=
 =?utf-8?Q?Zo4ea+RwlaP6U93cbEsW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6F3BAD32F405048BB632A1F97A8B5ED@apcprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB8046.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 041aca3f-41ab-41c6-ee0d-08dd23c102cd
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2024 02:16:43.8564 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB5973
Received-SPF: pass client-ip=40.92.52.92; envelope-from=jiachao1990@outlook.com;
 helo=APC01-PSA-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 24 Dec 2024 00:00:33 -0500
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

SSB3YW50IHRvIGNvbXBpbGUgcWVtdSByaXNjdiBhcmNoIGludG8gYSBkeW5hbWljIGxpYnJhcnks
IGFuZCB0aGVuIG9wZW4gdGhlIGxpYnJhcnkgaW4gbXkgbWFpbi5jIHZpYSBsIGRvcGVuIGFuZCBz
dGFydCBxZW11IHZpYSBwYXJhbWV0ZXIgcGFzc2luZ++8jEhvdyB0byBidWlsZCBhIGR5bmFtaWMg
bGlicmFyeSBmb3IgcWVtdS4gTG9va2luZyBmb3J3YXJkIHRvIHlvdXIgcmVwbHkuICBUaGFua3M=

