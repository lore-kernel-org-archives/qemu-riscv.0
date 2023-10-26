Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B39C25B6B
	for <qemu-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 19:48:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qw6Ka-0000n0-Mm; Thu, 26 Oct 2023 15:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>)
 id 1qw5nj-0008CT-5O; Thu, 26 Oct 2023 15:13:52 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>)
 id 1qw5nf-0005XJ-Ec; Thu, 26 Oct 2023 15:13:50 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39QIJaKg019345; Thu, 26 Oct 2023 19:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=R/03CGGxvxDKjMA9ua9arAkhkEtiln8qpbJBfUPllT0=;
 b=hzp5PurJXe/PaARO44WALQpTkLjwzZarcXV6F/NzccqdJvE+osqOAtgCNZ/59zocXH5U
 D+fBkAjjEW/82IAmGbsgZTdePoEGbJKKpu8vZfL1IhsjFoZeymvikdELNfWxetAmEUH5
 smxVT5JGQ46sYMBDARC3q309W490nDeBJMYvPVhJLqedIoHIrw24dkNBdrAqvpMo4ebc
 JnlUAH+MnYRj7njVNuKhHtQpN5aour1DMWzRK+4EjuBriaG2s9om8nREWrYH9+U8equW
 R/Zks0gHQ4owAEUQ3g6x/kQZ3o+VD2VnLEKsp5l0aN1CYNN4H0+wk/353zq5oq5mKdmR 8g== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tyq8ts4g1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Oct 2023 19:11:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTXv0svH+ItXRp6gyl4cA8ScwtV7mEJpXWDf4cZtg+jIyHKt6INd9/FXaffiJgSV124TmHdEciKBnEFSKnXEh05Hr+j/XLGfqLLg0p/7St2rMWxbLF62Zyk6eVWGg31eo7FNlEqoztMqclpEKgA+uV9gNaxCadvwSsjhXZLy/BlqKvGisl3Ac3tVaFTmYGoTHc5uiLTZMkC8F5G50qPNigXbYGt1VakCoCJMYHqqGVi3r9lnnzzuLfr7TPIpHRP7+e7TilSoDDYVTrDgAisLp5Ol8w2I69asNgR2GZmR4zeW2npnjJLiLwpVoSYMCghPyuYcF6XNxtDKnhpztigxmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/03CGGxvxDKjMA9ua9arAkhkEtiln8qpbJBfUPllT0=;
 b=QNb/uZXUMODY3cgeNDr7a41Lez3Dcl+ABY9/2JqA85VlrTjFRvZSRRVQntUftPWyTg9OD7dvz/AtrfoDSdV//KTOAXDfgTyKhGpYPz6DEPspLGwlPMN41e+F3bGBe4DfkEj3+HAks45SxWaTIPPW2MG4c8HV8sbI1mCc/ZBLkZ42ViVJbenn7hGJJiP7TaIXLub8KyNXQZ4Z9iVCsP1OFvsN91oOviczFgZbedLP7eneGlrSJXudNIXg+pYaQ7qJrhgwhDRD5A8wcYwrOS8uJae7rUxB6wm2jWEj2HGSvsEBiGh95idbvTdXmc6ESsIBXET3SeftZ9jtw+agmukM7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by DS7PR02MB9528.namprd02.prod.outlook.com (2603:10b6:8:ee::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.33; Thu, 26 Oct 2023 19:11:48 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::546b:93ec:1242:265c]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::546b:93ec:1242:265c%6]) with mapi id 15.20.6907.032; Thu, 26 Oct 2023
 19:11:47 +0000
From: Brian Cain <bcain@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Eduardo Habkost <eduardo@habkost.net>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, David Hildenbrand <david@redhat.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao
 <gaosong@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne
 <shorne@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, Yanan Wang
 <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Laurent Vivier
 <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Bastian
 Koppelmann <kbastian@mail.uni-paderborn.de>, Bin Meng
 <bin.meng@windriver.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Weiwei Li
 <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Marek Vasut <marex@denx.de>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Sergio Lopez <slp@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>
Subject: RE: [PATCH v2 07/16] target/hexagon: Declare QOM definitions in
 'cpu-qom.h'
Thread-Topic: [PATCH v2 07/16] target/hexagon: Declare QOM definitions in
 'cpu-qom.h'
Thread-Index: AQHZ/d3yRByVIjD2sE+oaNdjskhp+rBchJ1g
Date: Thu, 26 Oct 2023 19:11:47 +0000
Message-ID: <SN6PR02MB4205FD8EFF7EC0665C508297B8DDA@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <20231013140116.255-1-philmd@linaro.org>
 <20231013140116.255-8-philmd@linaro.org>
In-Reply-To: <20231013140116.255-8-philmd@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4205:EE_|DS7PR02MB9528:EE_
x-ms-office365-filtering-correlation-id: c864c48c-88a6-48d6-93e4-08dbd65766a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ngYU6eXDpKtlHxHmfSnNbPkdluVyzPosMZWTQskDZ/SFuV0D8Ych5EAiMO7YnKCHFf8fZugr9Ke9oFzzyLDRLmhBTMNdSwHPo96XWGfC37tB3I0a3f3tOhDRbSh94pGNa3lNse2rWX/CD+5DwO8D8dfKUVDq5X5HXEJON13srA9AOmP2NbGwrsEP7dbIi3M4JXKT1ltPsA/k3kQ/S2SBTlwjy27q60Nj8CjU2P24YFapqEb+Th60T4e1Cz/Rt1pdQcuwV71h5swwtYPiliyVWvNenoMSIFw8fwudMorUPxZcRK4zsPRfyAUp5rZInu4BVcCsHfCD9GkVbRvNhy+wmBkJHzEYi65MhQ4VdWmRU4Iw1L4e4uyFJP5S+i5qyq98FIpUU4ZYjju/1KW8siepwa6eubU+hW3eJgW3NKNcqF3KeMIMjJbJCb+z6vfqyUsSpDZoVIoDfyPVsQ8HgeyK3LA3B+WEme+yXu0c/3bzgBAnrOZ7jcjcdpgcgyDUA1v/AG2Ei2PDEH9AEuasWz+gBINKh9pjmavmDJ6ePT50HCipoPBtWU98c+0a5hBUnsjNmLT+sCe5REHtCH/NMzD4e407e9bliU4+hRBe6UYD2zYgmHsgHNID0ripQrNlytgU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(366004)(136003)(39860400002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(52536014)(5660300002)(4326008)(8936002)(83380400001)(122000001)(7696005)(38070700009)(41300700001)(6506007)(8676002)(26005)(66574015)(316002)(66476007)(66446008)(9686003)(55016003)(54906003)(64756008)(66946007)(110136005)(76116006)(38100700002)(66556008)(53546011)(71200400001)(478600001)(86362001)(7406005)(7416002)(33656002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bXI2eUZmN2xWOU4reWEycHhsWFBwZklUOU9tckJweDBOdUV6dEJ1bUlaN2VV?=
 =?utf-8?B?NmZ5bnhVeWF2aW93dk1LZWhjck5vWWhpaExXV2w0VFAzcVczNm90UWhvU0xH?=
 =?utf-8?B?NFMyZVp1RXNFWHZ4eEZxK3RWaHlGaDNyZUNIYTZ5dGlJcE5NQTlRNHViQ2dL?=
 =?utf-8?B?SHdKaG5nTnlqcDltTFpIRzlyTzdUZVlIZDdkeERQWFI2Z294a1QrZlBnaHZW?=
 =?utf-8?B?YjJSdWNxQ3hhTWNLcXI5WHR4ZkZJNk1sWm1kd0dyS0JmaXlJQWFxdUVmaW1v?=
 =?utf-8?B?OEhyU2RmOG03VXhwUnprVWNWMTFENGJreXJiVGhrVFNFQW1JUE9ac0tVbVlQ?=
 =?utf-8?B?MndHaVBnR2UxZGVvMm1GNmxEaS9RaDlkMHlYNGwyQmVDR3k0d2JJS0ZmS0o2?=
 =?utf-8?B?TWlNOHRuclJGNURWM3ljcUN4T3RsWlc3U2EwL3VXRThkOUc4K0dkYk83RUpr?=
 =?utf-8?B?ZVhKREFkYzZWNk9UVkRhOVhIcCtKY3RsQnp5RDlXeDgyMDVxRGg0ZnNnaW5o?=
 =?utf-8?B?R09EYWgzNVlZYXJBdy8yL3NDcnd3NDV3c0xRNk9MdHBUZlk1Zmo4dWQ0S3ds?=
 =?utf-8?B?bDF1MjFINFBOcENwdnNmRHh2NW13dUdYd1BVSVZZRHZhWWFmd3FPb1paYkpr?=
 =?utf-8?B?enVNUzRlS3gyZldGT09NVDM0WG1VNmlBYUQ4Vi9OSDVPZzFyaHUvdUJiRk9T?=
 =?utf-8?B?cTg3RmhlUGN0Y0xJT1dSWmhVT2lHL3JCenErdE5qdlpQVU03Qkl3cVRabVpO?=
 =?utf-8?B?RW5idGdSQTg3TThTb0dpRWZYZkIxRGFmenlOU3lNZE5uVVRqR09GK1RkL3Rn?=
 =?utf-8?B?eXJzUlFLcE1tYmdIQzRWZGRkdHIwOUxkeEZiUTJvSS9MeHpQeDJkWFMyNmR3?=
 =?utf-8?B?bzgxUGt2ejJkaGZJdVA1NmJkRWpCNDRLMlZoeTRMblN0TFF1elZEMHA5L3R2?=
 =?utf-8?B?RG1VTmhoWE56L2Zlc2ordUJiOE5wZ295bzR2TjI2WkErNzZ6ZEtNL3Q5WDhY?=
 =?utf-8?B?TFRmTGROQXZ2b1ZEbnNwYjRoc1NCUUJSQlliWEhDM0ZMUFNGazR2dDB5YWFV?=
 =?utf-8?B?YktvRVRYTTlnV25aclBzdTJMZlk5Q2ZtUHRhLytDZGYyYmw0NCt0eCs1NWJQ?=
 =?utf-8?B?QTg1VVFNdWpLcUx3d3FyOVAyZndQM3NNdDhWd0ZUOU84RHMxWmJzK1lBOFoz?=
 =?utf-8?B?SW80NXAxMkZHelFITGdoemtDelVORSthd01ZVE40MjRKNlMzNTZNaW8vc3hV?=
 =?utf-8?B?QmJ1dWJ3Wm5DUytmb0ZzUlBpSnVnallJbXo1c3lmVmN0QmZZVmJOY1dCbG53?=
 =?utf-8?B?T1RrbWRsR3VINjZzSE9IbW5SaGYyek5XVlA1WlRvYW9ORGlMNC84aTMrNlhk?=
 =?utf-8?B?YVJrbmp5QkNlS2dWZjcwUnJCRVk3THVlWWJnaVhOQkp0V2pQd3ZrQUhMam41?=
 =?utf-8?B?SUZBaFFnM1pZeVB2Q2xubnJCZzFwU2FsdVBRTWFOd09tV094Sm9vR0pndlg2?=
 =?utf-8?B?RnVqeUhBV3hNcG9LTnVUYWhOWjhiM0pSa3h0MDJBMnBZUlZNL3RzNnVwS3BJ?=
 =?utf-8?B?bjZyZ0hSc1R2YTIrbktCNXZSYXhqVnFJNHA1UnJsTnBqZ1lONnRuVmZlT09N?=
 =?utf-8?B?eGIxUlBUdU16NjM4aEZlY1Q5ZklWcmJDNTFMcmlSSFkwOHZTOVRWUUJ1eXZG?=
 =?utf-8?B?akVsZGY3ZHBlNGNtY1pIeTROMXdraS94UTVPRllIUTFIR05VV0VuQzZtK051?=
 =?utf-8?B?YXpUWUZXL2xWb3UrV1BaS1lySThyUnh6czNpa2RkQUdSSlpZWDkra2UrN3pO?=
 =?utf-8?B?dnBqcUNwWXlvckpjN0Rhck5aL2o3d3VvM1d0NTRRTXAvOEZtcHVlUWlZSlFw?=
 =?utf-8?B?MVljdFYyUGhnRE5UenBRL0tQaDVQUWhlTHpya3ROUkpMaGVkVzRQTi9HbGNl?=
 =?utf-8?B?ZkFKSVB4eVk0YkpMeTlpeCtiN0NMTkJaa3hDZjFyVU9XVWtzTTJmbU5hVHNJ?=
 =?utf-8?B?ZVd5TVp2Y0U4bGlFTjVQdjFhQ1ZHYjNzb3paU2FMbGUzVi9ETVpPdWQ4V09G?=
 =?utf-8?B?dTZ4TG9idU1RaklFVGZKZHBIL3BFajR3TVdwUXJ3MlJEUzVTZU41Q1RuaElk?=
 =?utf-8?Q?yaA0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?M3daL1YwcjBlc25RdTl1Q1lDclBWV2REYXkybUhvYWpqVWdYcmpmbEM2VGND?=
 =?utf-8?B?U2tmYmJaKzRCY2xvVWo4VGxBZ1hycnB1Q1NFOFFYTU9IQ21qUjkxVTEycG8w?=
 =?utf-8?B?cENNWlFPRkUwMUVnV3RDV1ZkWGdPWHppTmdxZXRZVzI4SXhWRjFwNlp6QXI4?=
 =?utf-8?B?WWpDN0hQOEVNTCt5NmtiNE1yVkZqOU1FWEh2YTloZUk1ZzNBbXdsVGx3aGdV?=
 =?utf-8?B?TGJKbDkxa3lLQllRemRPYmxMbWtzRmRWckJwdGRreGtkMWRVTXJKb3lieFNB?=
 =?utf-8?B?dWlQV1pSYXZRQjh5ZEFlN1VPbUNRS2wzd1ptUTZtK3pXVVR1M2t0SitzbVhZ?=
 =?utf-8?B?R1lRaFRIZ3piZzJMM3FjeWcvQy9penFoVFc2djJuYU15bFlya2R0UW1HWkh0?=
 =?utf-8?B?UlNKQUlUQk1CMEIzeTh0b1R5SjhQbUZPV2VlaUZPa25taVZKU0gwNHV6d01P?=
 =?utf-8?B?SCtkNEhWdDBNOFJBWlRmWHlkeFZ6eUp4cEVwS1NibFM1QWwzVHJNU0x4WDZO?=
 =?utf-8?B?WjIraXhhdjFMR3M2bXpwSG1FUDJSTitjSmZoQVp2R3IyZXpvL2M0cnhNSmpE?=
 =?utf-8?B?ZG14WEtSaXk2MHNESGxNOFJCdWdpREp6Yk1Ra0pseU9SUjRPSTdwakZWVEhk?=
 =?utf-8?B?blRuUlFMR2hGWllyb1I1YXE3Y01YNk5yU1YxNEpNdW4yRzJOVzhXS3lvT1U5?=
 =?utf-8?B?bTlCSmIxdXlwNHRBZFI5SjlLaXBUdGoyY2hybC8yaWdOQWlFcFNiOGoxOWtv?=
 =?utf-8?B?UHg2ZVBLbkpUYzkyUmt5ZitjTHZXMXZOd3NlRWxNcGlGZE42dWg0N28wcmZ1?=
 =?utf-8?B?SlJTNmUzaDdPNHMwQlRYTzIrcTc4SkUrUW1RMXJFTVl3anU2Vlc2aXkzWEor?=
 =?utf-8?B?MWd2Ni9DSWJIZ0dDcXdmZzRIZ0prWTNzd0M1QzQyaEN0QVlJbE1YU1ZvWVFh?=
 =?utf-8?B?a0Vra1B1VFVaOG04V0pHSGRZbjUzandNWWhLanIvUjFRcGhZWnhtWWkrZEJB?=
 =?utf-8?B?VHI5S2x2M2tkYzZWRUpDcXo0ZWVxbUdFdFNHbVYwNnh4SDdaWk9Db01wa3VR?=
 =?utf-8?B?SzVPQU5CZTRXZ0owaUpoUXdnU0UycEMrTUV3dElHQjNOTEFhNVhqa05QaVdQ?=
 =?utf-8?B?QU44anJtQ1VMbTJLVUNSNURVZlB0NHI2RjEzcHNGTG0rUVBpZDcwMVNlaHJZ?=
 =?utf-8?B?MFVmZjdHYjRuRkFhallNTlp1REQ2cG13S2o4SWlCZ2h2VUN3K1M5S09GY1Q1?=
 =?utf-8?B?K2xVUEdMYzArTnpkOTUxN2Q5WkViKzNmRTVaQVN4MUVOTXhNa3paRHhwOFRF?=
 =?utf-8?B?MzVZWk9mbFJTaElCWkFIQituWFNERUxrZHpGdml5SEp1MjNJcVQraFhuSXFJ?=
 =?utf-8?B?dDBiWFBDUWpvWTBucWlqOERwUHRFc1Znd2J4WDQ5eis5cyt4ZGo5d3dOb2xH?=
 =?utf-8?B?VlVJWFNMazhxZXB5TlpRZzljYVBKc0ZmRllRTFpQVHA2KzVHbDVPU25vZW5M?=
 =?utf-8?B?OGtNV0VYSnJkak0ybmFya3VJdjVGak1xMU1sc0dCbXNZeml6c0dQcVhpdEZ5?=
 =?utf-8?B?ZXpmS3phYVdseEJTVFFjT2VOR3lXWEZzQjdFN3dxQlZtUWRGSWt0dlZIazhE?=
 =?utf-8?B?bVVDNm04RTh5eTFxQnV0dWlKVitGRmY2MGxWSEpueVVMVXNqN3EyNHUxaTZP?=
 =?utf-8?B?N1N2bWg1aElXZ1dVSndueG4ySitQbXJvVXQvakdjdlM1NWtrb0hlYTRja0Rs?=
 =?utf-8?B?bTBOTTcvV0VFSTZQVFlZQXVnMk13NVFkVHRYdjdmTDZ5ZGVCbzZudlpKRmNQ?=
 =?utf-8?B?WkFOUkF2dFJyNG1lbFloU2tyRHFDTWF2UXBoMWJKcGs4ekcxTm9GQ256cU80?=
 =?utf-8?B?MDdLc1RGYlZ2djZKRFJIdklQcGN0d1B2cWVCTnNWQUZDUk9Xd295aEE5MjQr?=
 =?utf-8?B?OUFqei9BRkZaNFlidEdoNlRyR2FiYTlaRExndVQwamZlVWxxSXZ3RzV5VSs3?=
 =?utf-8?B?QjVadUl2REZ0MHdrNUcvTkFhbVcyOGxENHM2Yk5xSDBCcjhhMWh2akU4QWph?=
 =?utf-8?Q?gJHOEp?=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c864c48c-88a6-48d6-93e4-08dbd65766a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 19:11:47.5667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IdqFYfIVimsv7pb+i9X8SLO3NcfH+1RcovxxSXpX9kPRMm81En2qglxqp5MXfD+usn6E7uD/6GANYrMuneHfig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR02MB9528
X-Proofpoint-ORIG-GUID: ShMcHET2xLWCrCdEJVHwXVReaRnFfdA1
X-Proofpoint-GUID: ShMcHET2xLWCrCdEJVHwXVReaRnFfdA1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-26_17,2023-10-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=484
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310260165
Received-SPF: pass client-ip=205.220.180.131; envelope-from=bcain@quicinc.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 26 Oct 2023 15:47:47 -0400
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPg0KPiBTZW50OiBGcmlkYXksIE9jdG9iZXIgMTMs
IDIwMjMgOTowMSBBTQ0KPiBUbzogcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBFZHVhcmRv
IEhhYmtvc3QgPGVkdWFyZG9AaGFia29zdC5uZXQ+OyBYaWFvanVhbiBZYW5nDQo+IDx5YW5neGlh
b2p1YW5AbG9vbmdzb24uY24+OyBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPjsg
cWVtdS0NCj4gcHBjQG5vbmdudS5vcmc7IEFsZWtzYW5kYXIgUmlrYWxvIDxhbGVrc2FuZGFyLnJp
a2Fsb0BzeXJtaWEuY29tPjsgRGF2aWQNCj4gSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+
OyBxZW11LXMzOTB4QG5vbmdudS5vcmc7IEVkZ2FyIEUuIElnbGVzaWFzDQo+IDxlZGdhci5pZ2xl
c2lhc0BnbWFpbC5jb20+OyBKaWF4dW4gWWFuZyA8amlheHVuLnlhbmdAZmx5Z29hdC5jb20+OyBT
b25nDQo+IEdhbyA8Z2Fvc29uZ0Bsb29uZ3Nvbi5jbj47IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOp
IDxwaGlsbWRAbGluYXJvLm9yZz47DQo+IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5j
b20+OyBTdGFmZm9yZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT47DQo+IEFsaXN0YWlyIEZyYW5j
aXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT47IFlhbmFuIFdhbmcNCj4gPHdhbmd5YW5hbjU1
QGh1YXdlaS5jb20+OyBNYXggRmlsaXBwb3YgPGpjbXZia2JjQGdtYWlsLmNvbT47IEFydHlvbQ0K
PiBUYXJhc2Vua28gPGF0YXI0cWVtdUBnbWFpbC5jb20+OyBNYXJjZWwgQXBmZWxiYXVtDQo+IDxt
YXJjZWwuYXBmZWxiYXVtQGdtYWlsLmNvbT47IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5v
cmc+OyBMYXVyZW50DQo+IFZpdmllciA8bHZpdmllckByZWRoYXQuY29tPjsgQXVyZWxpZW4gSmFy
bm8gPGF1cmVsaWVuQGF1cmVsMzIubmV0PjsgcWVtdS0NCj4gcmlzY3ZAbm9uZ251Lm9yZzsgUGFs
bWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT47IFlvc2hpbm9yaSBTYXRvDQo+IDx5c2F0
b0B1c2Vycy5zb3VyY2Vmb3JnZS5qcD47IEJhc3RpYW4gS29wcGVsbWFubiA8a2Jhc3RpYW5AbWFp
bC51bmktDQo+IHBhZGVyYm9ybi5kZT47IEJpbiBNZW5nIDxiaW4ubWVuZ0B3aW5kcml2ZXIuY29t
PjsgRGFuaWVsIEhlbnJpcXVlDQo+IEJhcmJvemEgPGRhbmllbGhiNDEzQGdtYWlsLmNvbT47IE1h
cmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS0NCj4gYXlsYW5kQGlsYW5kZS5jby51az47IFdlaXdl
aSBMaSA8bGl3ZWl3ZWlAaXNjYXMuYWMuY24+OyBEYW5pZWwgSGVucmlxdWUNCj4gQmFyYm96YSA8
ZGJhcmJvemFAdmVudGFuYW1pY3JvLmNvbT47IE5pY2hvbGFzIFBpZ2dpbg0KPiA8bnBpZ2dpbkBn
bWFpbC5jb20+OyBxZW11LWFybUBub25nbnUub3JnOyBMaXUgWmhpd2VpDQo+IDx6aGl3ZWlfbGl1
QGxpbnV4LmFsaWJhYmEuY29tPjsgTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+OyBMYXVyZW50
DQo+IFZpdmllciA8bGF1cmVudEB2aXZpZXIuZXU+OyBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlk
ZWxsQGxpbmFyby5vcmc+OyBCcmlhbg0KPiBDYWluIDxiY2FpbkBxdWljaW5jLmNvbT47IFRob21h
cyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPjsgQ2hyaXMgV3VsZmYNCj4gPGNyd3VsZmZAZ21haWwu
Y29tPjsgU2VyZ2lvIExvcGV6IDxzbHBAcmVkaGF0LmNvbT47IFJpY2hhcmQgSGVuZGVyc29uDQo+
IDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPjsgSWx5YSBMZW9zaGtldmljaCA8aWlpQGxp
bnV4LmlibS5jb20+Ow0KPiBNaWNoYWVsIFJvbG5payA8bXJvbG5pa0BnbWFpbC5jb20+DQo+IFN1
YmplY3Q6IFtQQVRDSCB2MiAwNy8xNl0gdGFyZ2V0L2hleGFnb246IERlY2xhcmUgUU9NIGRlZmlu
aXRpb25zIGluICdjcHUtDQo+IHFvbS5oJw0KPiANCj4gV0FSTklORzogVGhpcyBlbWFpbCBvcmln
aW5hdGVkIGZyb20gb3V0c2lkZSBvZiBRdWFsY29tbS4gUGxlYXNlIGJlIHdhcnkgb2YNCj4gYW55
IGxpbmtzIG9yIGF0dGFjaG1lbnRzLCBhbmQgZG8gbm90IGVuYWJsZSBtYWNyb3MuDQo+IA0KPiAi
dGFyZ2V0L2Zvby9jcHUuaCIgY29udGFpbnMgdGhlIHRhcmdldCBzcGVjaWZpYyBkZWNsYXJhdGlv
bnMuDQo+IA0KPiBBIGhldGVyb2dlbmVvdXMgc2V0dXAgbmVlZCB0byBhY2Nlc3MgdGFyZ2V0IGFn
bm9zdGljIGRlY2xhcmF0aW9ucw0KPiAoYXQgbGVhc3QgdGhlIFFPTSBvbmVzLCB0byBpbnN0YW50
aWF0ZSB0aGUgb2JqZWN0cykuDQo+IA0KPiBPdXIgY29udmVudGlvbiBpcyB0byBhZGQgc3VjaCB0
YXJnZXQgYWdub3N0aWMgUU9NIGRlY2xhcmF0aW9ucyBpbg0KPiB0aGUgInRhcmdldC9mb28vY3B1
LXFvbS5oIiBoZWFkZXIuDQo+IA0KPiBFeHRyYWN0IFFPTSBkZWZpbml0aW9ucyBmcm9tICJjcHUu
aCIgdG8gImNwdS1xb20uaCIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1
LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgdGFyZ2V0L2hleGFnb24vY3B1
LXFvbS5oIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgdGFyZ2V0L2hleGFn
b24vY3B1LmggICAgIHwgMTUgKy0tLS0tLS0tLS0tLS0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDI5
IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRh
cmdldC9oZXhhZ29uL2NwdS1xb20uaA0KPiANCj4gZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhhZ29u
L2NwdS1xb20uaCBiL3RhcmdldC9oZXhhZ29uL2NwdS1xb20uaA0KPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwLi5mMDJkZjdlZTZmDQo+IC0tLSAvZGV2L251bGwNCj4g
KysrIGIvdGFyZ2V0L2hleGFnb24vY3B1LXFvbS5oDQo+IEBAIC0wLDAgKzEsMjggQEANCj4gKy8q
DQo+ICsgKiBRRU1VIEhleGFnb24gQ1BVIFFPTSBoZWFkZXIgKHRhcmdldCBhZ25vc3RpYykNCj4g
KyAqDQo+ICsgKiBDb3B5cmlnaHQoYykgMjAxOS0yMDIzIFF1YWxjb21tIElubm92YXRpb24gQ2Vu
dGVyLCBJbmMuIEFsbCBSaWdodHMNCj4gUmVzZXJ2ZWQuDQo+ICsgKg0KPiArICogU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXINCj4gKyAqLw0KPiArDQo+ICsjaWZuZGVm
IFFFTVVfSEVYQUdPTl9DUFVfUU9NX0gNCj4gKyNkZWZpbmUgUUVNVV9IRVhBR09OX0NQVV9RT01f
SA0KPiArDQo+ICsjaW5jbHVkZSAiaHcvY29yZS9jcHUuaCINCj4gKyNpbmNsdWRlICJxb20vb2Jq
ZWN0LmgiDQo+ICsNCj4gKyNkZWZpbmUgVFlQRV9IRVhBR09OX0NQVSAiaGV4YWdvbi1jcHUiDQo+
ICsNCj4gKyNkZWZpbmUgSEVYQUdPTl9DUFVfVFlQRV9TVUZGSVggIi0iIFRZUEVfSEVYQUdPTl9D
UFUNCj4gKyNkZWZpbmUgSEVYQUdPTl9DUFVfVFlQRV9OQU1FKG5hbWUpIChuYW1lDQo+IEhFWEFH
T05fQ1BVX1RZUEVfU1VGRklYKQ0KPiArDQo+ICsjZGVmaW5lIFRZUEVfSEVYQUdPTl9DUFVfVjY3
IEhFWEFHT05fQ1BVX1RZUEVfTkFNRSgidjY3IikNCj4gKyNkZWZpbmUgVFlQRV9IRVhBR09OX0NQ
VV9WNjggSEVYQUdPTl9DUFVfVFlQRV9OQU1FKCJ2NjgiKQ0KPiArI2RlZmluZSBUWVBFX0hFWEFH
T05fQ1BVX1Y2OSBIRVhBR09OX0NQVV9UWVBFX05BTUUoInY2OSIpDQo+ICsjZGVmaW5lIFRZUEVf
SEVYQUdPTl9DUFVfVjcxIEhFWEFHT05fQ1BVX1RZUEVfTkFNRSgidjcxIikNCj4gKyNkZWZpbmUg
VFlQRV9IRVhBR09OX0NQVV9WNzMgSEVYQUdPTl9DUFVfVFlQRV9OQU1FKCJ2NzMiKQ0KPiArDQo+
ICtPQkpFQ1RfREVDTEFSRV9DUFVfVFlQRShIZXhhZ29uQ1BVLCBIZXhhZ29uQ1BVQ2xhc3MsDQo+
IEhFWEFHT05fQ1BVKQ0KPiArDQo+ICsjZW5kaWYNCj4gZGlmZiAtLWdpdCBhL3RhcmdldC9oZXhh
Z29uL2NwdS5oIGIvdGFyZ2V0L2hleGFnb24vY3B1LmgNCj4gaW5kZXggMDM1YWM0ZmI2ZC4uN2Qx
NjA4M2M2YSAxMDA2NDQNCj4gLS0tIGEvdGFyZ2V0L2hleGFnb24vY3B1LmgNCj4gKysrIGIvdGFy
Z2V0L2hleGFnb24vY3B1LmgNCj4gQEAgLTIwLDExICsyMCwxMCBAQA0KPiANCj4gICNpbmNsdWRl
ICJmcHUvc29mdGZsb2F0LXR5cGVzLmgiDQo+IA0KPiArI2luY2x1ZGUgImNwdS1xb20uaCINCj4g
ICNpbmNsdWRlICJleGVjL2NwdS1kZWZzLmgiDQo+ICAjaW5jbHVkZSAiaGV4X3JlZ3MuaCINCj4g
ICNpbmNsdWRlICJtbXZlYy9tbXZlYy5oIg0KPiAtI2luY2x1ZGUgInFvbS9vYmplY3QuaCINCj4g
LSNpbmNsdWRlICJody9jb3JlL2NwdS5oIg0KPiAgI2luY2x1ZGUgImh3L3JlZ2lzdGVyZmllbGRz
LmgiDQo+IA0KPiAgI2RlZmluZSBOVU1fUFJFR1MgNA0KPiBAQCAtMzYsMTggKzM1LDggQEANCj4g
ICNkZWZpbmUgUFJFRF9XUklURVNfTUFYIDUgICAgICAgICAgICAgICAgICAgLyogNCBpbnNucyAr
IGVuZGxvb3AgKi8NCj4gICNkZWZpbmUgVlNUT1JFU19NQVggMg0KPiANCj4gLSNkZWZpbmUgVFlQ
RV9IRVhBR09OX0NQVSAiaGV4YWdvbi1jcHUiDQo+IC0NCj4gLSNkZWZpbmUgSEVYQUdPTl9DUFVf
VFlQRV9TVUZGSVggIi0iIFRZUEVfSEVYQUdPTl9DUFUNCj4gLSNkZWZpbmUgSEVYQUdPTl9DUFVf
VFlQRV9OQU1FKG5hbWUpIChuYW1lDQo+IEhFWEFHT05fQ1BVX1RZUEVfU1VGRklYKQ0KPiAgI2Rl
ZmluZSBDUFVfUkVTT0xWSU5HX1RZUEUgVFlQRV9IRVhBR09OX0NQVQ0KPiANCj4gLSNkZWZpbmUg
VFlQRV9IRVhBR09OX0NQVV9WNjcgSEVYQUdPTl9DUFVfVFlQRV9OQU1FKCJ2NjciKQ0KPiAtI2Rl
ZmluZSBUWVBFX0hFWEFHT05fQ1BVX1Y2OCBIRVhBR09OX0NQVV9UWVBFX05BTUUoInY2OCIpDQo+
IC0jZGVmaW5lIFRZUEVfSEVYQUdPTl9DUFVfVjY5IEhFWEFHT05fQ1BVX1RZUEVfTkFNRSgidjY5
IikNCj4gLSNkZWZpbmUgVFlQRV9IRVhBR09OX0NQVV9WNzEgSEVYQUdPTl9DUFVfVFlQRV9OQU1F
KCJ2NzEiKQ0KPiAtI2RlZmluZSBUWVBFX0hFWEFHT05fQ1BVX1Y3MyBIRVhBR09OX0NQVV9UWVBF
X05BTUUoInY3MyIpDQo+IC0NCj4gIHZvaWQgaGV4YWdvbl9jcHVfbGlzdCh2b2lkKTsNCj4gICNk
ZWZpbmUgY3B1X2xpc3QgaGV4YWdvbl9jcHVfbGlzdA0KPiANCj4gQEAgLTEyNyw4ICsxMTYsNiBA
QCB0eXBlZGVmIHN0cnVjdCBDUFVBcmNoU3RhdGUgew0KPiAgICAgIFZUQ01TdG9yZUxvZyB2dGNt
X2xvZzsNCj4gIH0gQ1BVSGV4YWdvblN0YXRlOw0KPiANCj4gLU9CSkVDVF9ERUNMQVJFX0NQVV9U
WVBFKEhleGFnb25DUFUsIEhleGFnb25DUFVDbGFzcywNCj4gSEVYQUdPTl9DUFUpDQo+IC0NCj4g
IHR5cGVkZWYgc3RydWN0IEhleGFnb25DUFVDbGFzcyB7DQo+ICAgICAgQ1BVQ2xhc3MgcGFyZW50
X2NsYXNzOw0KPiANCj4gLS0NCj4gMi40MS4wDQoNClJldmlld2VkLWJ5OiBCcmlhbiBDYWluIDxi
Y2FpbkBxdWljaW5jLmNvbT4NCg==

