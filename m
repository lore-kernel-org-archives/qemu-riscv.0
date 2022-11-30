Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0EtA-0001aN-Bp
	for mharc-qemu-riscv@gnu.org; Tue, 29 Nov 2022 23:40:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1p0Et8-0001Zu-Aq; Tue, 29 Nov 2022 23:40:02 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1p0Et3-0005tM-JX; Tue, 29 Nov 2022 23:40:01 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AU1NtvV005658; Wed, 30 Nov 2022 04:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=BUwQshr0SBaJrCmSzcshwmfqBV4xhsHPV6LnOwbAFBw=;
 b=ouJ1XGKzT8UHzehHW8hNRt/js2OeeXPFMIgum1SPUoUPWVQnlx+pejwjJCFV+Q7bfzP7
 fl6pvsBtdim1qT3SqSwd/CZtF9kDoxXQupPP9ooxVBsF40zoYz2fx/X8C0gr10FuhTV8
 xZw8N1c99skstiWHXW3CfQ/D+FfmBAfizrgRP7BgPmFIXk6DjKkNqOxg3aSHK8PtQwfv
 B2QoujdFQCe04N/KqGnmx4h5VNq9zR1SBrdSKBTnvWvTZ8rA3WiN4AQgJdVBuzUWAcT+
 8s5KhuFxUE1F54I7utBZ5Y/3nzrMdbMRQjKTNejKQSNpJEv80snHLG8mW+F0ZSTSwqv3 5A== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m5n1rsuac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Nov 2022 04:38:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtVGlrw+/YVCfrcT0bq1ZscEDLCkVY6M5QJcg/7QecSrqfj8gb1tAIDs3jWJVdqdbZz+PVdLZqhShyE+pBQbeGiYdbZReBKV+r9Q78g4TZsFdF8Zyn2UUfOB5w118SCaWr/bYRrCdZBzeHT/f4kFxxAuIjQxYDuSmZXirv8PaZZxjxI7iIOvDYa2gnEiM0Y/v4//ZbfBQdwsPZHYtK9xOydh/t7TFnz8C9NoCRawZpCu3u/6tLhPM8DE2PURiCWDFs1p0j6KnZIX2Q3xWQeNSJUeEq4SmD/gOrYb3QRG6aPgxs3ScA67uHCjNq8uybbfi179QKp3z5YY4vVHbyarFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BUwQshr0SBaJrCmSzcshwmfqBV4xhsHPV6LnOwbAFBw=;
 b=V0QOAK7GUyLqK6MEkgY0xZiST8l3SCX5cSXDkg8TyfI/oyB31rRZ3FL9cJia+VWyjm417/xITnSju5n9G4dIH60htg77dwL8VSi7nDBFhdMag3+A+RoetgQERWRIAeaEqDGqTjOeR7wbOTzeAXSAsSbtPB/96z7xKt1ZnDc69l49Pdo76Iur6dOYbiKIGP6QTwqL+jwXgJKRfnJAQyv4TBGWwADWUDffamywV0ca/F1I+0yECsTdvf8ZZtFAfjp/WRIXvfAR2mwwqRZMWZPl9YvxWklbh/F+cAuhPJ6Jw7YPexEwNEwfxMucStFHooM86L7Lq5Ms/g8czhbszTX1Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 04:38:15 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::caac:2d02:279d:4270]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::caac:2d02:279d:4270%8]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 04:38:14 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Michael Rolnik <mrolnik@gmail.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Song Gao <gaosong@loongson.cn>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, Laurent Vivier <laurent@vivier.eu>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar
 Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, Daniel Henrique
 Barboza <danielhb413@gmail.com>, =?iso-8859-1?Q?C=E9dric_Le_Goater?=
 <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>, Greg Kurz
 <groug@kaod.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Max Filippov
 <jcmvbkbc@gmail.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, "qemu-riscv@nongnu.org"
 <qemu-riscv@nongnu.org>
Subject: RE: [PATCH for-8.0 05/19] target/hexagon: Convert to 3-phase reset
Thread-Topic: [PATCH for-8.0 05/19] target/hexagon: Convert to 3-phase reset
Thread-Index: AQHY//r6d0Q778NYWUuOn4hIgMMu065W6taw
Date: Wed, 30 Nov 2022 04:38:14 +0000
Message-ID: <SN4PR0201MB88085C02AEC71E27A5C3C43CDE159@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
 <20221124115023.2437291-6-peter.maydell@linaro.org>
In-Reply-To: <20221124115023.2437291-6-peter.maydell@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_
x-ms-office365-filtering-correlation-id: 1f09b110-5717-481f-0e5c-08dad28cb1ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VneTt0k1ktLFhQR46vx4RrOPWx2ptRzaK8Tu7Fk0KmgNqzXTqly6xCoqqm8R4HyUf/CA+lK98VSbfXf06c3fWXUTcgvL6VI+S2k+9W3XW95mmT9eeXFm7mSVGoEeKWaQ/Ys6RULWZS++rTywt5ctwLiIcpIR7MRF9y+qkR2I7qvd0Bpzcu5e9QgKg43Be8QTCVdyl9IPMLfT7j3Mi4K8Qb0yMy0ijtY+nWeTl9mnPyS0XX+AtrqjlwZyAuZJUxIywYGUDjsUIPNBIxzQZ2ofh19Yn4T6cf78C2hVKYTvY2XgboL9XWcWrRclNmg1hkkNn209MhdeFEovLIT0OHdVUwLZ1ZRYeBQWblwFYdxJ5mio57mVSV8QiHMfwXbxPa5r8ru4L6G0VfRoGcWj0G9CFo1MZ4DdCjDkUnWVXL73e+D/J+OkltMMCkfu+6TCcYlDYFX/0kepZ5kaXI53qKv5Hys3Ywqe6Td/y4VdEOV4hA50dAwLvJoJ2vFbyJ1CqpndftBiChCqZbZ9F4xCxe4vamlWQfdfIA1fhmBDT18vDrvB5LumpDJkUoRn63fQHCdB8E6BXXCDaph5tOkQ6NkFo29PF7yPaytfbc/2ppDnMj0UhpelKwaXpxT0HBGA4YdbnE8GRblaZ14WBJMPQn5qk+VBPbwONkfqHhvBM5nyHsbMWPZqqXWf1JEbNMN/h3lIVpP3RCD0zrAb9r+VGi6coQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(451199015)(2906002)(8676002)(41300700001)(5660300002)(86362001)(52536014)(66476007)(64756008)(8936002)(66556008)(7416002)(76116006)(66946007)(66446008)(33656002)(38070700005)(122000001)(4326008)(55016003)(38100700002)(83380400001)(316002)(6506007)(71200400001)(53546011)(9686003)(478600001)(26005)(54906003)(7696005)(110136005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?JZec64evcwUqmE7H1FWn7V9EqhH2Mnn87LTC3VwF0ZYlxcItYdd5r7NUHM?=
 =?iso-8859-1?Q?ElCef8PoF37EnhNfDlKeWaPL5JPYkbBTiC/w60rKqwzwQBjnw4tRCc6L5u?=
 =?iso-8859-1?Q?FwqP/BdaQ19RYJhJysESXdh3Zm8cTQnwILCYHdML+mrvAFWIzCR3H1ON/b?=
 =?iso-8859-1?Q?jKJfzBDpQrU5FsAsPSA9U9UkQWlJ9pvdFm/0pSgNUdf0xoG5q0SHyD1JjF?=
 =?iso-8859-1?Q?nF3V3EdTYjxIt3N1lFM8q1DGp85RPqBOBv/g8OGv6yMp+wxHwUtcM5L3c/?=
 =?iso-8859-1?Q?1qZUb6jYLyOv+iMQ0RGkGftQaZL9YERMrJPnHgs2MV7k4abNbNQenl3GCz?=
 =?iso-8859-1?Q?fx2on3CrcYU4wWBQ6+RwtcKvlP1s4keEHtpvW4Alc2j2UDoS+2wPOC1t0K?=
 =?iso-8859-1?Q?vUrzdPkJu2aXJNFfeEmi/ifbYLSDLK/AzbcB/EJcISu7nELxg3ZFqUB3PC?=
 =?iso-8859-1?Q?DdpGfktzCGFLvrSXZQ2KB0fsvAc2AAdifPBDrDRE3uh5XjSkX+UKEpIAfa?=
 =?iso-8859-1?Q?Y/w5lIJ47IOyfhIs4JWOEhe0+xHM4luNhaVhUTKTS4DpFwJtxZd/e0p2XK?=
 =?iso-8859-1?Q?pJOraX7VTOc8XPNkYLCoBNwMHK0rYtGDm1RGTBP3EOthS+VSR16ZIjp48i?=
 =?iso-8859-1?Q?1DaZtp66e2l0zx8WZvl/BETcxC+wQyjsa/rdu7N6xWZhcK+D9eSAFZ4vKE?=
 =?iso-8859-1?Q?si9cHcfGzac8cv8Q9a61ezSDx37YHHRDk3GRuJWt45F3K7gKvUB1aoKb+9?=
 =?iso-8859-1?Q?ti/FFXcJiumQfZtXusUN15xlyvTalCPat1h01hxzbRWP2XyO5V6x3U8aYF?=
 =?iso-8859-1?Q?EBOJDqB43dHZ479fYJbEo27siBwhexMYjkNlQPLXb6LedXgFIByJkivWxh?=
 =?iso-8859-1?Q?zeNi+fSIohigoZILAeO6MmZQTjY/eDdWCbydJ6scPc5ZlUrlf1x/FCTWq9?=
 =?iso-8859-1?Q?b1fs7Uhnij7L6W1FlChkFW4QM1ICHUD5arawrwzIgaYVQ9HUUnBtYF1w/q?=
 =?iso-8859-1?Q?cjtpRmNxCxEWU42dowKv5hJFAK8CDapvXw4jtjSmzUa8Su6/N1fXKZTgxS?=
 =?iso-8859-1?Q?AKlcNCuj5ZhrP02FY9IIz7F7XzSnvoV2EZSiLYKgM4Wm149RaqNw+/Xx5/?=
 =?iso-8859-1?Q?8S9v7xBmgMfpm/GjBWcu+xOj6CVx+6vSHvRSGSK4tAyx+UT+ZvXReG7IkU?=
 =?iso-8859-1?Q?nM3EpLABCk3x2Xy3PF6IerUH9dY89cl5PImX9GOCgnpCF80rCCOkD3k8C1?=
 =?iso-8859-1?Q?1xuFeeq3DRjbyFGGBKgR0MzAJduNoIs3PmB7IOkI38+cZ6L/QucuMBcr2s?=
 =?iso-8859-1?Q?7RMAqwF6090AN7inF09/ljPHSVGPsNw1VC7tc+xZoqXm1J+XFLQo46KbOm?=
 =?iso-8859-1?Q?WKyG3UWHYscMvmAHDdpAFc50UvavTSog6kIqpeYNSBqqDE/xLL9prhKVL/?=
 =?iso-8859-1?Q?CZQ6Sm+xUrEsqFM5YBZQD+5jInWXgVkXB/+AKpEepdBFNLR3BcpDFkc3OG?=
 =?iso-8859-1?Q?2XgHU93D1eKHxoDfP4b7AM/5Bsy1ecW9U3v3gDSfVkmsbBp0oN2WGMfyVo?=
 =?iso-8859-1?Q?m1MDhPHinPe8CgKrKXp4CkwzxyVx/NJc8yQj0npKH2ApjEKacL27LEBrAz?=
 =?iso-8859-1?Q?HzCXeZRJ0F0YE16ItIKh0xVIokOcDcz4x6?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?iso-8859-1?Q?VkHMwFUVNzWf43V+fmqtfvP5E4MJqScPOTvL7DKIytXO8zibgs4Bmiy1ZU?=
 =?iso-8859-1?Q?EaAKyLhV+wph5FGnpzl5I2vjr+W5kZTfuR+XhG42XCjxhWALDfEYoCQ7kC?=
 =?iso-8859-1?Q?5zycv5bKeiYUNdEcftQY5Bvl6Lr0B0/bfOPA2Gu6pEadODNogl+wwneQoX?=
 =?iso-8859-1?Q?U3T5A9LDo7ehESCHmcWA3fAc2U7ynuwpwiM6WGAsNdE+Kq7f2q5MKbVU5c?=
 =?iso-8859-1?Q?8cfVtdl8q1Qp0mWej6GwWHGdZHlHoZ6yTWF12s8ESUif0JcHtFtNo8hIFA?=
 =?iso-8859-1?Q?qRMFwvS9cAfl3OmgvPDcK2Vrp7sRSridiXtx2RICRNE1W0FfzZzQ1OiyUi?=
 =?iso-8859-1?Q?KkYx08st9h8rhs9Q3QdCH3lpLXGMdU4nYqqTTuvX95DfA2TgaaKd1EyU78?=
 =?iso-8859-1?Q?idqDkz7GTP5qvbh7jMNiPPGg+Jl3LmdlVMj5Mlk2UB2UKY3mJy1DeRLiDb?=
 =?iso-8859-1?Q?FURSdDiicfCYYW65/QfIw9qnIgXoNwIfvqeTKBIPfXpKobW2Ap0glmHtKC?=
 =?iso-8859-1?Q?/6X1xtVq+xYCiPtGgWmGEREyMJSfOuqIvQ0sVwoQ7zoRD1vKhcjcs36vAQ?=
 =?iso-8859-1?Q?HbaM5/n4zzMM6bgWpe6t8CQBWZAaLPZYykQCf4riZzbhcgEtDwrM0VCYxH?=
 =?iso-8859-1?Q?JO1KTp8/LhE5ayZklBS354RHxlepmfHH2gZCqD6ZeinthgfEEpeFe67HDa?=
 =?iso-8859-1?Q?5rVD4DjDJc+KTRR9i2umj8TemyPgjNVO+fsp0EHCWlqla0VmzgZsiFue/z?=
 =?iso-8859-1?Q?yYefdjURh95IcJiY4YEs8hk4aT2bSm7k8RV42rw2VO31pTB0mNG7nvXr+v?=
 =?iso-8859-1?Q?X8j5+6R2P0QrMAqP9y9SDw5kuLaSEzJ4s+fyUCAoPDcZyCFudm2ZRMMlYw?=
 =?iso-8859-1?Q?dajvYtIoP6VtvwFUodoEoY3AxTX6lPF9L4rD2uXq8MzE0OtvB6O7DkoKkx?=
 =?iso-8859-1?Q?12604kLL0yXs5PM/Boo56BM6iMWvzZbZjOVgbDZ/Jjr4+LxXKC5VQCBlan?=
 =?iso-8859-1?Q?m4DLJGWjYY68vq30YLbFe/Xs9IV+qlbDo7PAbxrsRWoQaTSunlsLB1Ddlf?=
 =?iso-8859-1?Q?wuuLILBhyMFOqxomlXL1iJfqjulesQdmcpKCtarFhDOBa0Jc6DZS0ZS0EA?=
 =?iso-8859-1?Q?S8l9EB4/oepE/viGo7ap5y7e9MvpQmuiaeRLifkGvRwaz8CYzEzA4j1rje?=
 =?iso-8859-1?Q?QDJFZXCbLYAGctIWAMmokHfdZWfsIEhTv9ah1glvDCF9t0Uqdjuf1xESID?=
 =?iso-8859-1?Q?XmdIu6zXmQpSjciQhVl76kWsrWh1vjrueZKgvlJJYD6i41jUAsOHftr9OM?=
 =?iso-8859-1?Q?xElffpi8ycI4UdPSKpDOCj8Bkp8yAKy+EhZ8WUQeoMWTmVipBVcKvcxgqY?=
 =?iso-8859-1?Q?+JLabujPuR+KMlj3ClQxiW9d3RGz5UHb4sqtf4zFNw+ybXvkIsaqqiXGR6?=
 =?iso-8859-1?Q?k3dK9C/bmEJqL9SqsVCCq4j2n2hOBYeVFMHqFdrs5lSGvaIwfldDdrsw9b?=
 =?iso-8859-1?Q?vMdqLoLoemVtdo7I/EVM2kANKNZZ0q5NTpmm1s000d1kvQFUhH4TWKueHN?=
 =?iso-8859-1?Q?2gX7LhGhZ3y1UNqHFK2wVN+2F8gy2h18760HSIK0QhTXwcLf9LOMv2bUQZ?=
 =?iso-8859-1?Q?FrMwHMQFhEbmtpypNxAYpDLyZwHNi/h5t/7UNTZNPUsxz4sFw04KjkOsSq?=
 =?iso-8859-1?Q?ONpdkHgxIbevdiEMbT51G+yPDtVUvqMovZN9G3P+q3/sK2EaWRZShoSiU8?=
 =?iso-8859-1?Q?h6mQ=3D=3D?=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f09b110-5717-481f-0e5c-08dad28cb1ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 04:38:14.8300 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FN2J12lc/QiQS0Aycrra1xcxhYZKtfMUl07tkUW0t5i2Qc9ZgUxCSRBEYTmgG11wss2SQNcUWu+NbrKaQBddJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB8808
X-Proofpoint-GUID: aj2PiQsMVhUyCr2fzC7gCNypYmYKPLd5
X-Proofpoint-ORIG-GUID: aj2PiQsMVhUyCr2fzC7gCNypYmYKPLd5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-30_04,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxlogscore=689 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1011 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211300031
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 30 Nov 2022 04:40:02 -0000



> -----Original Message-----
> From: Peter Maydell <peter.maydell@linaro.org>
> Sent: Thursday, November 24, 2022 5:50 AM
> To: qemu-devel@nongnu.org
> Cc: Peter Maydell <peter.maydell@linaro.org>; Michael Rolnik
> <mrolnik@gmail.com>; Edgar E. Iglesias <edgar.iglesias@gmail.com>; Taylor
> Simpson <tsimpson@quicinc.com>; Song Gao <gaosong@loongson.cn>;
> Xiaojuan Yang <yangxiaojuan@loongson.cn>; Laurent Vivier
> <laurent@vivier.eu>; Philippe Mathieu-Daud=E9 <philmd@linaro.org>;
> Aurelien Jarno <aurelien@aurel32.net>; Jiaxun Yang
> <jiaxun.yang@flygoat.com>; Aleksandar Rikalo
> <aleksandar.rikalo@syrmia.com>; Chris Wulff <crwulff@gmail.com>; Marek
> Vasut <marex@denx.de>; Stafford Horne <shorne@gmail.com>; Daniel
> Henrique Barboza <danielhb413@gmail.com>; C=E9dric Le Goater
> <clg@kaod.org>; David Gibson <david@gibson.dropbear.id.au>; Greg Kurz
> <groug@kaod.org>; Palmer Dabbelt <palmer@dabbelt.com>; Alistair Francis
> <alistair.francis@wdc.com>; Bin Meng <bin.meng@windriver.com>;
> Yoshinori Sato <ysato@users.sourceforge.jp>; Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk>; Artyom Tarasenko
> <atar4qemu@gmail.com>; Bastian Koppelmann <kbastian@mail.uni-
> paderborn.de>; Max Filippov <jcmvbkbc@gmail.com>; qemu-
> arm@nongnu.org; qemu-ppc@nongnu.org; qemu-riscv@nongnu.org
> Subject: [PATCH for-8.0 05/19] target/hexagon: Convert to 3-phase reset
>=20
> Convert the hexagon CPU class to use 3-phase reset, so it doesn't need to
> use device_class_set_parent_reset() any more.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/hexagon/cpu.h |  2 +-
>  target/hexagon/cpu.c | 12 ++++++++----
>  2 files changed, 9 insertions(+), 5 deletions(-)
>=20

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>


