Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CD4C35FFA
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 13:10:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tutBE-0005U3-6Z; Wed, 19 Mar 2025 09:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alvinga@andestech.com>)
 id 1tutBB-0005Tg-E7
 for qemu-riscv@nongnu.org; Wed, 19 Mar 2025 09:09:53 -0400
Received: from mail-psaapc01on2100.outbound.protection.outlook.com
 ([40.107.255.100] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alvinga@andestech.com>)
 id 1tutB8-00057A-Lc
 for qemu-riscv@nongnu.org; Wed, 19 Mar 2025 09:09:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6JA52OmTxI09gIlKmSOMT02Y1ChKL/OK5IZWa9nPRf3pjZ5S3spmOhssxKjZT0Wf1QVHVgeKS/G5sp7GsiIWzSU9vfGRXgOmJ2w9M00rb9nCrI8WQhEMiV3CETD1p73unSAsoGl+7QoJrSyJu3FTdPyY55EGilA1un2R8qmVokuN0Ix9B6QBADUZTE7giAeJjX4M12aK1oT5SN+CNNoiLzgySwi2x7nWwACXVMuljaBn3Mt1tjjuVMmeIK6rRi2Wc9LuvUuH1S6dJbyFkFBR9fcUne//WrXJvoKUef2qifirMxh7WwXs3AseCKmZeQxIDIe0Qxii6ws8p/ZXqAc/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYtToh+povNSs992zQ6gyMwYi4BQWUkkKi8FjGEhHDk=;
 b=nAE9Tm8RcN0aKGZgcdskDE9YVMhzr16c1qkig80TAnZ8Q7WKRNYYicahxqrzHc3Lqg+gkkAi8ou4KF9Auroqzv9TaSs8aH4DBcxqLeqNydNlN5rUgS8869oGlyAPves/EC0ln/yB2hEV6eTQDznWJdYUUzaUFhFpaGjEUiokgv9RXw2tbVRokEEaFJ37y/BcDUkCDmIZhJPX1q4gZOx+Vk/eb07Wi3pgtCZcIZnLFnpS2lmhkETy7PloCoA4k+KQuoM3JoZIIWGa3FwDZLk0hEmQ3lKcsO0fhfRtNQDWOQXiD/JMonMrKecA0h8FyrgRHHBkbjXSvc9stUs7hX0Ppg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=andestech.com; dmarc=pass action=none
 header.from=andestech.com; dkim=pass header.d=andestech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andestech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYtToh+povNSs992zQ6gyMwYi4BQWUkkKi8FjGEhHDk=;
 b=LWR73Jq+O2XNRfC1LyXc+bGXavRNuKuDa3eI76M4rMIJo6/+k6p/XiKK+jRe4qrMWFD/escBYocoFrEx2ajuxMbREpuLTJth48JhWJ7LE9qOVdp7yEjGnSeRKnAN1mfQzq5XjYPLqJR9tk+6hz2iNnU+mqb6XtS7GO1EXCE6D1ni5UM1SkkDsuBFLzZgqJJawyJEY6/bY+EDB3odGLycfE8/KcZwzTP4TVzVoaM1OWJTWnfOPzarNgVpwYWjRaUJjIGRPn9acZFHa5Tp6MI1LBFgzBuIsYX+XcLjxukDzKfAl94WI5k9UCZvFisK0Qld2NVQQOF3rL1KgCBHWy0GOA==
Received: from SEYPR03MB6700.apcprd03.prod.outlook.com (2603:1096:101:69::14)
 by PUZPR03MB7235.apcprd03.prod.outlook.com (2603:1096:301:11a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 13:04:37 +0000
Received: from SEYPR03MB6700.apcprd03.prod.outlook.com
 ([fe80::292f:e1ce:7df8:115e]) by SEYPR03MB6700.apcprd03.prod.outlook.com
 ([fe80::292f:e1ce:7df8:115e%6]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 13:04:37 +0000
From: =?iso-2022-jp?B?QWx2aW4gQ2hlLUNoaWEgQ2hhbmcoGyRCRCVFLzJFGyhCKQ==?=
 <alvinga@andestech.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Yanfeng Liu
 <yfliu2008@qq.com>, qemu-riscv <qemu-riscv@nongnu.org>
Subject: =?iso-2022-jp?B?GyRCMnNKJBsoQjogZW11bGF0ZWQgcmlzY3YgUExJQw==?=
Thread-Topic: emulated riscv PLIC
Thread-Index: AQHbmKT/t5FxSQ9/G06Fv6VCDwcxqrN6abmAgAADDCU=
Date: Wed, 19 Mar 2025 13:04:37 +0000
Message-ID: <SEYPR03MB67004C8A706EC1F1BE648E23A8D92@SEYPR03MB6700.apcprd03.prod.outlook.com>
References: <tencent_B08E6CCE1DE2E1580A782D03697B9EC40F05@qq.com>
 <a7ffa471-c5f6-4a80-9e2c-f1b4d0c19b64@ventanamicro.com>
In-Reply-To: <a7ffa471-c5f6-4a80-9e2c-f1b4d0c19b64@ventanamicro.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=andestech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6700:EE_|PUZPR03MB7235:EE_
x-ms-office365-filtering-correlation-id: 3d4e729e-e6b0-4b2b-ced0-08dd66e69a2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|69100299015|366016|1800799024|38070700018|7053199007|13003099007|8096899003;
x-microsoft-antispam-message-info: =?iso-2022-jp?B?N2lVQnZBYnlUdGNKVHhqUGN1bGRSWis5Q3dSOHNUMWcySHJOTlYwV3RY?=
 =?iso-2022-jp?B?OVkyNjdJaGU1TW1pVXc2QTRqUDBiZ2Q2T1dzdkpMSXU4VUZ6Sy9GdnFV?=
 =?iso-2022-jp?B?RWJVVDlBYnBFSUxLUVA4RjJuZVBOY0dCWXVJeU5LalVDL1FwWnVWUy9H?=
 =?iso-2022-jp?B?STBFblY3RGxTcytDNFhxYTU0TVBCVXdwNzNpR2ZnZ0ZOak5sbHg3b0dr?=
 =?iso-2022-jp?B?QWMyKzMxMm9Sc1FoNmV1dFF2cHNkRHJobkhpRklkb3dRN2N6SWlQdDFu?=
 =?iso-2022-jp?B?SER1Q1F4UjZHVFowM3Y3QzNVOUJXOUZMc2dSMGNmWjU0RENENWQ4VktE?=
 =?iso-2022-jp?B?Y05JdmgyQ2JidXVoN0VRQmJnMGNFNGdPSm1xR2p5dUJQeGJ4em5oNnZN?=
 =?iso-2022-jp?B?YVg0YnVON1F0L29URGsxNDZBRjhLUUcwcG55VjhDOFhaL1U0K1BTZUUw?=
 =?iso-2022-jp?B?TVZ6WkU2b3BKZFBGcW1uTHpEdkxpc3U2SWVMTU9xKzNtd0ZyRVlGaHV2?=
 =?iso-2022-jp?B?akI2aTdoQk1NWmg4a3VqNDlDYk14QUZVM1NxZG5KNjBSSzU4MkZKRWRs?=
 =?iso-2022-jp?B?Nkc2cGpzVXJIek02Zy9zMmJnRnNhVngxd1E4TTcwN2VISms1RzZWTjA3?=
 =?iso-2022-jp?B?L0tYNHJYcG9XM09LZ3ErK0tQMUEvaVZOV0tXZEkrVEkyTDM2c3JLdlh1?=
 =?iso-2022-jp?B?QjJ1bDRBbWZKS1RFdkZZSXozMXFlUWJoOXZUU2hPYVAxQVc0U0cwTUk5?=
 =?iso-2022-jp?B?Z2U2MG5kalJyVzBKWnBqYUNvaGJ4c2lHRUJ1OFNidWdSSmJTTWIwSDBB?=
 =?iso-2022-jp?B?MHRHNVhZcm9yWXlQNkdPdDhaREttOTRSL1B0MU9RWnJlYkx1UjVGUER3?=
 =?iso-2022-jp?B?M0MzbVVHN0NEUENycDJVV0ZiUjhIMzVIM0ZCYVBtM1VkVlU3WktaM0Rh?=
 =?iso-2022-jp?B?Uk1wUzFIazZVVEdXd1hPWUNvampScUNxemVzWlFiMzByeUJWWFNrQ0ho?=
 =?iso-2022-jp?B?YUhqcisxSDFnSlNMUmZOZFI0eFd6QTVtOVEvVlM4Nm5LYUw2SlRXbERB?=
 =?iso-2022-jp?B?a3BxWkp6MmVON1NjQ2huYVpua2R1dSs4RzJzZzZMODg4NjdtL09sb0M1?=
 =?iso-2022-jp?B?TGxFRXkzb2lLa2R4UVdvUUgvTE5aR2ZOb2N2UFVScEZwb2NqQWJWQTJh?=
 =?iso-2022-jp?B?cFZDUnE0TjB5aGxocmJHTERBN1NiMHNHZUJ0S0dvNFNQZjRpOWRXN2Jz?=
 =?iso-2022-jp?B?dXpTQzRmRXVDTi9laGhhUGxGNm40TE8zM01kbjBwRk5JMktybTlUaWNu?=
 =?iso-2022-jp?B?V0tObHFiZ1hRMUxzVDYwTTJKZDNIQXljTDRQdTA0Y3ZEVk14bi9EeFJN?=
 =?iso-2022-jp?B?dHgyT0xNaERKK2pRa0VXNCtRWm8vdjBZVlVNblBsKzNtN05GcldpMEpB?=
 =?iso-2022-jp?B?MXhsMTRXaGJQZWM1cFN0T1J6YmQ3L3U3WHAybERqdnFsZVpzNERTOXpj?=
 =?iso-2022-jp?B?cWk1eDFsWTlTQnFudVR5S3FieUZLUTNFdWlKS0JoanBLa3FRRXFnZWJK?=
 =?iso-2022-jp?B?dXVpb2trRjRLci9tL3NNVHgwNVBZOTZZeVFnUDV1TmNFNUI2TjAzazNT?=
 =?iso-2022-jp?B?TW9Ya3NMMWkwOGc2OXk2OFI1WGU5Ukw2SHo0dlJyZ0JkZnhLdE0rRGxn?=
 =?iso-2022-jp?B?VGdPcXBmUEprUk9HSkVVVWdrcXhqWFhHTWdpLytvT3pFNWFDS2FVYnRn?=
 =?iso-2022-jp?B?LzR4Q3VyT3lBWUcvMzVxeU1hdzM0d2g0MjFDS1pLcWtxdkN3eHVRUGts?=
 =?iso-2022-jp?B?SG9kZzRnL2llREhXZHBubkE0Nm5Yc1hXaUs4R3YySFFSak9kWWVRdU9S?=
 =?iso-2022-jp?B?SUowMWNRbWs0TTFuVWlpUHVDNlRjMGt1allnWlJWK25CaHN5aTlsSHMy?=
 =?iso-2022-jp?B?UzZGQkQzRnhhOXpuVWRJK2IvM3FqaXVnYU82TzhHUWtUV01IejlOcnBz?=
 =?iso-2022-jp?B?dkpxMnIwcU5BWStvdGd1b29vOGZZdHdjYTdNbFZFb3BhbFlxK3l5eitt?=
 =?iso-2022-jp?B?MXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:ja; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR03MB6700.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(69100299015)(366016)(1800799024)(38070700018)(7053199007)(13003099007)(8096899003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?QWdNZTBqa2dpVHdjdHk5OEY5WUdWcDJweTZoQlpFRitBMUxzK3M2TXRv?=
 =?iso-2022-jp?B?amJibE1STldZaWdYang3TEt0Vkp4ZGp3cmdRSk53b0xSTld0d040UEZz?=
 =?iso-2022-jp?B?V1A5MDlSWHNuSVZKMWNHMmxhQnc5anVCT0ZGQUF5Vy9NTTBOK2NCMExK?=
 =?iso-2022-jp?B?aUxBN2JGc2drY0xaVy9Za3NGK0hYd3VwSUNvVkdiNy9Vb1IrWkFWUVJS?=
 =?iso-2022-jp?B?Rm80ak1PZERSVnhDNEFIRHhZWG1OUmU4RVJVZHN6cnJIZ2tpSnVkQUJC?=
 =?iso-2022-jp?B?UHFnQ3V4YWw5Z3JNbTRBRVI1L092c1d0eXpQYmdiRlBFbVAySWsyZ1lT?=
 =?iso-2022-jp?B?SW4rMzFvc1lUeFM2N3h5Ymt0Y1FIRW5sNlZUUlBsVnQyeEtTNXdIZnNL?=
 =?iso-2022-jp?B?c1JwWGJuV3dUSUdWaVY1MnNXZ3RqVGhLM29XMEZmOHprRldjSHoxNExI?=
 =?iso-2022-jp?B?ZFI2NWtYdjRpUTh6Y3JsMW9WeDN3OTlBSnFJSVczR2NkRXovMVFBT3BS?=
 =?iso-2022-jp?B?cmNWUlVwRDBrSGdVK21wM0UvT1JPSXdlMy9VcUdvNG5Rem9PNmh1bFJR?=
 =?iso-2022-jp?B?TktQbHpYTnladERYRWdQWG5LOEFQNmFZT1JZVVloL25PNURXZVIrMTNa?=
 =?iso-2022-jp?B?bkRGVU1MNE9wQm9IV2U3WmdFV2FhWFluRlFPcGtDVEVGcVZveWdHVWNP?=
 =?iso-2022-jp?B?Smg2azZWS3BOeWppVHNDd2NyODB1NW5HYU5aVTY1dWd4Z01JMFN4V0pM?=
 =?iso-2022-jp?B?NGwzbUxBMlcwa1J6NkpSNUFtV3B2b2g2bVFPTG9NUHlUc29KY3RLTnNz?=
 =?iso-2022-jp?B?OTJYbkN2RjFsNEE0RXhqa0dxRHV2bEd5bHhYSE1IcVZtSGlzeTdHNkdv?=
 =?iso-2022-jp?B?dlh1cHJQVTdrMEZuNzZXakNHWG93a3NoVG9hRnhqajBiNG10MnZjMVA2?=
 =?iso-2022-jp?B?bXQxaG9ZTDhHWFU4NHlQVy9rZ2xIZ052WmJJb1JPcDNkTkdZMFZ5eEZk?=
 =?iso-2022-jp?B?UjcrbWwrZTJ4RTlqZzkreXhQcEIxZzdMMzA0aU53NVhCRTN6ekZ5QzRz?=
 =?iso-2022-jp?B?akwrbW5lNjN4NTNuZlI0T1Uyc1dXNWx3SlljVTRqZnFJcFp4aktZUFBB?=
 =?iso-2022-jp?B?MERFNEZGM0VxZzU3K1pmNEdLQ3RRTWNacmFZMTNTREhMalFLSXh1RkNN?=
 =?iso-2022-jp?B?eTZzZmp1aXhGQ1ZDWlc0Y0FTeFdZNEZtMkhxNjZtVHRUSldPbThmSXJl?=
 =?iso-2022-jp?B?K2xSZG5SOEIrMlJHTTNSalZ6SUpacTFBczRIcVlrM0lwdjZZcjRjTXNT?=
 =?iso-2022-jp?B?MksyWFZpUWtydEtFMGhoWVl0Y0pmVVlBQ0t0czc3RDZXNGc0SkhESXJS?=
 =?iso-2022-jp?B?OTFtcXpwbnR6aURnOGExV1hOQjVRcWtnNnJBUlZnT1B3OUVKR09FRGoz?=
 =?iso-2022-jp?B?d0lyY3ZjOEdlUXFOa0h0M2ZVaFFGak1KSGx2RXUwa1lsRHY4M0JLc3hl?=
 =?iso-2022-jp?B?ZGJWUjJ4a0FtRXVleDdBY1FlRC95TUlqMEg0cE5yM0hBaDQrcldEQWR4?=
 =?iso-2022-jp?B?RzIwaUs1SGhxczJFcHJ6bHlIdXk2dE9TNi9NbE1JUjVWd2d6NDVBZm43?=
 =?iso-2022-jp?B?b0U3T0NXZUFSWVdRcG5jcWFET1o4cDVmNWtscEMzd0RwSlVWT2o4OC9D?=
 =?iso-2022-jp?B?Y29LMTRtcDJNTGdaQkxXUXFDZ2k3Zkk1MGpUdWQzUzc2ZC9PMG1LVDhv?=
 =?iso-2022-jp?B?V1dyS3cvdlAwcGxUeTdlVGJPOVlJZFFxeEJKenJtVW5JRFlCS3RFalNJ?=
 =?iso-2022-jp?B?MHhzSWlTM3c2Y3Byb2Nib2tjZTNtYmJXN1JXOWY5ZkJ2NnFLYTF4QjVD?=
 =?iso-2022-jp?B?ZUMxMGJtTk43U21PUUFYcjF4TUpzdjQ0bTgrZzNDdGdmTGo1bGlXRjRF?=
 =?iso-2022-jp?B?ZjNYZWVaaFpuMHB5dVgxNGpxbUxpa0dKWnUyZW43S0lMZzM1ZEdSZ3Z2?=
 =?iso-2022-jp?B?N0Q0NThhbmZ2QjdTS2l4d0t5ZmZUZUUrMzBSTXJwSnA4M1REcXJMYmUy?=
 =?iso-2022-jp?B?dU1DRlFGaFBnS055TUtLWHoxTUhTUnVmZko5bVg4QklWN2pFeVhyVHA3?=
 =?iso-2022-jp?B?aUlGMmNETklDck0rZ3ZIZlVOWjNvaEpSbUphTmdnQUY0Q0c1VXlBR1pa?=
 =?iso-2022-jp?B?R0RwYTZSZCtrQ0E4ZnVaSzhKdnptdm5lZVhyaE5Ib2VrcVV3NTRWT204?=
 =?iso-2022-jp?B?cWM0eldPWWlFa0lKSUYyTnpxd2pnQnI3WXVIcmphSjUrZStSR1haRHdN?=
 =?iso-2022-jp?B?YmwxWExkQU56ajlUQm9vZS9DYWFIMEs4TTQwK2JOTHRWYU52bGpFVmU0?=
 =?iso-2022-jp?B?TWFISkg4RXU0dXl5THRmcGR1ejFNS1UrRG4=?=
Content-Type: multipart/alternative;
 boundary="_000_SEYPR03MB67004C8A706EC1F1BE648E23A8D92SEYPR03MB6700apcp_"
MIME-Version: 1.0
X-OriginatorOrg: andestech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6700.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4e729e-e6b0-4b2b-ced0-08dd66e69a2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2025 13:04:37.1466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e3ec21b7-ec6c-4041-9add-61aea8171458
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yi2hBSPAARmAj/9kjuQ0Ke+P6b+msuXzxxi51aEa5BH2+uhYpF4KgNfywJdUepHNmA/Pdv0K3dh9Be8QXgdzgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7235
Received-SPF: pass client-ip=40.107.255.100;
 envelope-from=alvinga@andestech.com;
 helo=APC01-PSA-obe.outbound.protection.outlook.com
X-Spam_score_int: 36
X-Spam_score: 3.6
X-Spam_bar: +++
X-Spam_report: (3.6 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, MIME_CHARSET_FARAWAY=2.45, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--_000_SEYPR03MB67004C8A706EC1F1BE648E23A8D92SEYPR03MB6700apcp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

If you are using sifive_plic device, the pending registers are read-only.
https://github.com/qemu/qemu/blob/master/hw/intc/sifive_plic.c#L213
[https://opengraph.githubassets.com/330b9ad4759e334541fcb6e9e3108402f454725=
445d7013e75efa01fcf01429c/qemu/qemu]<https://github.com/qemu/qemu/blob/mast=
er/hw/intc/sifive_plic.c#L213>
qemu/hw/intc/sifive_plic.c at master - GitHub<https://github.com/qemu/qemu/=
blob/master/hw/intc/sifive_plic.c#L213>
You signed in with another tab or window. Reload to refresh your session. Y=
ou signed out in another tab or window. Reload to refresh your session. You=
 switched accounts on another tab or window.
github.com

Regards,
Alvin

________________________________
=1B$B4s7o<T=1B(B: qemu-riscv-bounces+alvinga=3Dandestech.com@nongnu.org <qe=
mu-riscv-bounces+alvinga=3Dandestech.com@nongnu.org> =1B$BBeI=3D=1B(B Danie=
l Henrique Barboza <dbarboza@ventanamicro.com>
=1B$B4s7oF|4|=1B(B: 2025=1B$BG/=1B(B3=1B$B7n=1B(B19=1B$BF|=1B(B =1B$B2<8a=
=1B(B 08:50
=1B$BZ@7o<T=1B(B: Yanfeng Liu <yfliu2008@qq.com>; qemu-riscv <qemu-riscv@no=
ngnu.org>
=1B$B<g;]=1B(B: Re: emulated riscv PLIC

[EXTERNAL MAIL]

On 3/19/25 4:55 AM, Yanfeng Liu wrote:
> Dear experts,
>
> I am wondering the emulated riscv PLIC in QEMU allows triggering an inter=
rupt by
> writing directly to the memory mapped pending register?
>
> For example, to trigger PLIC interrupt 12, I wrote uint32_t (1 << 12) to
> 0xc001000. But with QEMU v6.2 this seems has no effect.

Can you test with a newer QEMU release? There were a lot of bug fixes and
changes that landed in the PLIC emulation in the last 3 years.

Thanks,

Daniel

>
> Regards,
> yf
>
>


CONFIDENTIALITY NOTICE:

This e-mail (and its attachments) may contain confidential and legally priv=
ileged information or information protected from disclosure. If you are not=
 the intended recipient, you are hereby notified that any disclosure, copyi=
ng, distribution, or use of the information contained herein is strictly pr=
ohibited. In this case, please immediately notify the sender by return e-ma=
il, delete the message (and any accompanying documents) and destroy all pri=
nted hard copies. Thank you for your cooperation.

Copyright ANDES TECHNOLOGY CORPORATION - All Rights Reserved.

--_000_SEYPR03MB67004C8A706EC1F1BE648E23A8D92SEYPR03MB6700apcp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
If you are using sifive_plic device, the pending registers are read-only.</=
div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<a href=3D"https://github.com/qemu/qemu/blob/master/hw/intc/sifive_plic.c#L=
213" id=3D"LPlnk">https://github.com/qemu/qemu/blob/master/hw/intc/sifive_p=
lic.c#L213</a></div>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview _EReadonly_=
1" style=3D"color: inherit; background-color: inherit;">
<div id=3D"LPBorder_GTaHR0cHM6Ly9naXRodWIuY29tL3FlbXUvcWVtdS9ibG9iL21hc3Rlc=
i9ody9pbnRjL3NpZml2ZV9wbGljLmMjTDIxMw.." class=3D"LPBorder893460" style=3D"=
width: 100%; margin-top: 16px; margin-bottom: 16px; position: relative; max=
-width: 800px; min-width: 424px;">
<table id=3D"LPContainer893460" role=3D"presentation" style=3D"padding: 12p=
x 36px 12px 12px; width: 100%; border-width: 1px; border-style: solid; bord=
er-color: rgb(200, 200, 200); border-radius: 2px;">
<tbody>
<tr valign=3D"top" style=3D"border-spacing: 0px;">
<td>
<div id=3D"LPImageContainer893460" style=3D"position: relative; margin-righ=
t: 12px; height: 120px; overflow: hidden; width: 240px;">
<a target=3D"_blank" id=3D"LPImageAnchor893460" href=3D"https://github.com/=
qemu/qemu/blob/master/hw/intc/sifive_plic.c#L213"><img id=3D"LPThumbnailIma=
geId893460" alt=3D"" height=3D"120" style=3D"display: block;" width=3D"240"=
 src=3D"https://opengraph.githubassets.com/330b9ad4759e334541fcb6e9e3108402=
f454725445d7013e75efa01fcf01429c/qemu/qemu"></a></div>
</td>
<td style=3D"width: 100%;">
<div id=3D"LPTitle893460" style=3D"font-size: 21px; font-weight: 300; margi=
n-right: 8px; font-family: wf_segoe-ui_light, &quot;Segoe UI Light&quot;, &=
quot;Segoe WP Light&quot;, &quot;Segoe UI&quot;, &quot;Segoe WP&quot;, Taho=
ma, Arial, sans-serif; margin-bottom: 12px;">
<a target=3D"_blank" id=3D"LPUrlAnchor893460" href=3D"https://github.com/qe=
mu/qemu/blob/master/hw/intc/sifive_plic.c#L213" style=3D"text-decoration: n=
one;">qemu/hw/intc/sifive_plic.c at master - GitHub</a></div>
<div id=3D"LPDescription893460" style=3D"font-size: 14px; max-height: 100px=
; color: rgb(102, 102, 102); font-family: wf_segoe-ui_normal, &quot;Segoe U=
I&quot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif; margin-bottom: 12=
px; margin-right: 8px; overflow: hidden;">
You signed in with another tab or window. Reload to refresh your session. Y=
ou signed out in another tab or window. Reload to refresh your session. You=
 switched accounts on another tab or window.</div>
<div id=3D"LPMetadata893460" style=3D"font-size: 14px; font-weight: 400; co=
lor: rgb(166, 166, 166); font-family: wf_segoe-ui_normal, &quot;Segoe UI&qu=
ot;, &quot;Segoe WP&quot;, Tahoma, Arial, sans-serif;">
github.com</div>
</td>
</tr>
</tbody>
</table>
</div>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Alvin</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=1B$B4s7o<T=1B(B:</b> qemu-risc=
v-bounces+alvinga=3Dandestech.com@nongnu.org &lt;qemu-riscv-bounces+alvinga=
=3Dandestech.com@nongnu.org&gt; =1B$BBeI=3D=1B(B Daniel Henrique Barboza &l=
t;dbarboza@ventanamicro.com&gt;<br>
<b>=1B$B4s7oF|4|=1B(B:</b> 2025=1B$BG/=1B(B3=1B$B7n=1B(B19=1B$BF|=1B(B =1B$=
B2<8a=1B(B 08:50<br>
<b>=1B$BZ@7o<T=1B(B:</b> Yanfeng Liu &lt;yfliu2008@qq.com&gt;; qemu-riscv &=
lt;qemu-riscv@nongnu.org&gt;<br>
<b>=1B$B<g;]=1B(B:</b> Re: emulated riscv PLIC</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[EXTERNAL MAIL]<br>
<br>
On 3/19/25 4:55 AM, Yanfeng Liu wrote:<br>
&gt; Dear experts,<br>
&gt;<br>
&gt; I am wondering the emulated riscv PLIC in QEMU allows triggering an in=
terrupt by<br>
&gt; writing directly to the memory mapped pending register?<br>
&gt;<br>
&gt; For example, to trigger PLIC interrupt 12, I wrote uint32_t (1 &lt;&lt=
; 12) to<br>
&gt; 0xc001000. But with QEMU v6.2 this seems has no effect.<br>
<br>
Can you test with a newer QEMU release? There were a lot of bug fixes and<b=
r>
changes that landed in the PLIC emulation in the last 3 years.<br>
<br>
Thanks,<br>
<br>
Daniel<br>
<br>
&gt;<br>
&gt; Regards,<br>
&gt; yf<br>
&gt;<br>
&gt;<br>
<br>
<br>
</div>
</span></font></div>
<div style=3D"background-color:#D5EAFF; border:1px dotted #003333; padding:=
.8em; ">
<span style=3D"font-size:12pt;  font-family: 'Cambria','times new roman','g=
aramond',serif; color:#ff0000;">CONFIDENTIALITY NOTICE:</span><br>
<p style=3D"font-size:11pt; line-height:10pt; font-family: 'Cambria','times=
 roman',serif;">
This e-mail (and its attachments) may contain confidential and legally priv=
ileged information or information protected from disclosure. If you are not=
 the intended recipient, you are hereby notified that any disclosure, copyi=
ng, distribution, or use of the
 information contained herein is strictly prohibited. In this case, please =
immediately notify the sender by return e-mail, delete the message (and any=
 accompanying documents) and destroy all printed hard copies. Thank you for=
 your cooperation.
</p>
<span style=3D"font-size:12pt;  font-family: 'Cambria','times new roman','g=
aramond',serif; color:#ff0000;">Copyright ANDES TECHNOLOGY CORPORATION - Al=
l Rights Reserved.</span>
</div>
</body>
</html>

--_000_SEYPR03MB67004C8A706EC1F1BE648E23A8D92SEYPR03MB6700apcp_--

