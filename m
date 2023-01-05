Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDTYu-0006j6-2z
	for mharc-qemu-riscv@gnu.org; Thu, 05 Jan 2023 11:57:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pDTYs-0006eA-1c; Thu, 05 Jan 2023 11:57:50 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pDTYq-0005rm-1E; Thu, 05 Jan 2023 11:57:49 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 305DPXq0001584; Thu, 5 Jan 2023 16:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=lNewZU35nqSOUBMZTFAjhEG8orOAFhkXK+p2Xufa47I=;
 b=WnAT1fUX8ZH4gZLX2q9nxHgtnGdLx4Ocv7xyLbObVvw1Sl2tk94MHOMLsFd/q0kdg9Hh
 0lvwrKyce+2QwC7OK1GJlQJQGZ2b5R3wxnj9yI7nfnKG505ZePnz2ETjTp0llhl4UBxO
 zdxDLBzUedMU+HWge055ljvmBXTgqlZNstS6zZo1HJ86sMTk8vsMSDeZibapmeTGLZ7R
 K03u3iuprRRBjku2XVjVkDRiu1uI/UUW/OexAj/AQSMkjcgDyKT2BcTS05q0J21zw/Ra
 FJMEr+p/MZQIdrWopgpEuyPfO6wkFP3MkPTrTgGiiKtH/guRwlmvCaO539W3OearPLx+ XA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mwdckjd3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Jan 2023 16:56:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0Mqw/vW0P/k7uAPvGhM21jWMlYr/WIgaAdrv3noPAHOC05M/J2TJfDOHLUpGjnbFSh4CYi1pGMfWDPAFBdWPpQwONoB5P1UThAud4PdTH2bVfq0gLbZ5n/JRh0WgUK0dR/nbR+3jcyX/n/H9ATTvQz3s8dgIbIBYVe33qCXLqYsx8Ca9bP8XCVpERfRxha1DUMaFp0N4BhvXi8GGDJE5HK3VxuhdgS9Eye0m13avPkoXWfPzw5RGjyCTrX7+i1oL6STzv7Ym0GmLsx0Cm9yS9+vDQ30Y4VYZEN7VlWv+Xuk0dlFlYm0SlhyTOgPZYMvL7I7qT6UL/pKvBFWi+MXYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNewZU35nqSOUBMZTFAjhEG8orOAFhkXK+p2Xufa47I=;
 b=E1/1voX83svZ01xhLHZdSdp/jnzPu39G2yDRYOLHk/5R3OKC96FbgtJNg8SRgKDvrOFQ8pJeq3/iHUlIUmm0AqPZ9MhnbFqV2JJve5u4y8HfHyoqGZ3jhpmuTTZUC/OxjCdUmxzAFaUzr3A2avQYe16lFaLtO8JRqY4NxCOTMZWORjJDfORFMBPXQEGObRhBWsu4kYg1FfAgQz8Mb3uxBE7BW27mfXwq1ETdxmVgoB4perxTaV80GYW820KzPgoPKxQGlGgiuHT8SWdsvBcqXtU6Lse0TzuR6cgnUb3QmZpZkwHTvqFeGR8orJaNbxgbHHk9R8lAn9btq2WzwhT6Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by CH2PR02MB6967.namprd02.prod.outlook.com
 (2603:10b6:610:5d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 16:56:21 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::8ba2:2429:9eea:75fc%8]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 16:56:21 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "alex.bennee@gmail.com"
 <alex.bennee@gmail.com>
CC: David Hildenbrand <david@redhat.com>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, Aurelien Jarno <aurelien@aurel32.net>, Michael
 Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Greg Kurz <groug@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, Laurent
 Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>, Yanan Wang
 <wangyanan55@huawei.com>, Marek Vasut <marex@denx.de>, Stafford Horne
 <shorne@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, "qemu-s390x@nongnu.org"
 <qemu-s390x@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Bin Meng
 <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>, David
 Gibson <david@gibson.dropbear.id.au>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: RE: [PATCH v2 19/21] gdbstub: move register helpers into standalone
 include
Thread-Topic: [PATCH v2 19/21] gdbstub: move register helpers into standalone
 include
Thread-Index: AQHZISYJFqY3Eqs4zEafmXomZkqWva6QCjuA
Date: Thu, 5 Jan 2023 16:56:20 +0000
Message-ID: <SN4PR0201MB880848FE36FEF4181812D1AADEFA9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-20-alex.bennee@linaro.org>
In-Reply-To: <20230105164320.2164095-20-alex.bennee@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|CH2PR02MB6967:EE_
x-ms-office365-filtering-correlation-id: 58b8e38a-e19d-499a-4e97-08daef3dc55f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tAPPapytDk58CC2OlG9Z8rToNRTD1GDeqTgCP9mVNUgRETnDTS5HcrElw9MuXaA7pSxBFGoDNiuE1PF+4CJ5v37v9WIZijGd+vr4Olk7lmAjU1HreuuWyHvItaPc/ZZJuo7Dcn9wcPSakhRb6TRjD/pp0h0iUiXKzpb3FOlINln57yxyiAJGG4jNDJXNcem1Kdcj9r2PivKNd779xVJZoN4aPNLGbE4hRjpVaEAm4iSoo/tp9PlLug7DHsLwNUdamkXQAx+N3bk3pLx7L5rF+xRRQU/iZMZkTruwo+19CxUwZWWKtHRkvC+Udr3KzDa0ZxKmaDS5izIdzlznlxTJ1HlrjvjA2Q3af9/fCjS03BB4xPufSJSD5hS2wv9QDEzxgpZaVNyJvzfLbeuEA4qEpcIjTTdI4ye+W+rW6Q7P/heS8nNisPYVwaGHjrhtu7NXDp6iZcXi8xfb/yAuIvrc4n7lDmv1msOpZ/GfGD8v5i7EnZvc7Oz0xxM+6r5ogviowU5LhWGAjVIKQ6HfOs4fd/Co4maRbVZ5+X9mPQmyKk9VGN6hHE5IGtgTS5ZICm9PPmLLcTgleZ3PizZ8luk8hgWVHffZ4H6238AM2L8EEQkgS5rh9bMUvZQ0BsQG5/idBYPXqxivUROU/5nlUCTJZWXG2teH54nU40IDaJSkjcQus7WZf+tNtLnw6Xn8847ZsyHf6f+o9t5Wohps4jY7vQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39860400002)(136003)(346002)(366004)(451199015)(86362001)(83380400001)(38070700005)(7406005)(8936002)(122000001)(52536014)(38100700002)(41300700001)(7416002)(5660300002)(2906002)(7696005)(186003)(4326008)(6506007)(55016003)(53546011)(316002)(66446008)(26005)(9686003)(66476007)(64756008)(478600001)(54906003)(66946007)(110136005)(71200400001)(66556008)(76116006)(8676002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlNMaEJPR205em5SSXgyYmRnUGF4dE5ndStZL3ZXUFJmcFBadjE1MXQzVmhP?=
 =?utf-8?B?MWxuVUZISDdxQ0s4ZjNMaW5GbGZmdmJLbW1wK1VyMGxXQVRnVE1DS3ovbjdq?=
 =?utf-8?B?VFo1NFdzVE9zNUdCWXZOa1A2ZDVxNUZydDRSTlBRRS9pVWV4SWxGNmdCMG5r?=
 =?utf-8?B?N1o0N0xTeWI5UGVjWStmUXZkbjY2MnUxa1A0eUxQbjQya2doTXNWT0JveHU5?=
 =?utf-8?B?Y3BYa2l2aEFPTTQxS01uM2U2SHZ5MWlXdDJ6NlNDSDYwaERpdUxOaTUyaGRV?=
 =?utf-8?B?Vno4RkVpc3dEa3dnR0VMOWFqSEw3M0VqZmovZDNBekpwd2RZL1dqRDFXdnZY?=
 =?utf-8?B?aDZsMmlnOFo1V2ZPQmgwZkhPb1FFMktqMS92a0dlM3VwYzhMa2dYbFhmMW5Z?=
 =?utf-8?B?U2Zwb0FFUHpoRnVRK1JxSEVLMGthejg0WFFUeXJoWmx1R0tRa1Y1VEpBZ1lV?=
 =?utf-8?B?amN3NURDN2hWMjN1OFJvVXhrMkpQSDNOTWZFMEJVdHE2VG1lbnhnKzFDV2JU?=
 =?utf-8?B?R2lZU3lwKzJqRHdsL3Zuek5qdE5Dd09VRGJ1ZjU4OEY4VUJWb3Rmc0RvcWRX?=
 =?utf-8?B?bW42Ri9UeUFYSDVpSlBRRUMwVEN0R0t4L2xUVVplZzd0ZS8vSmF4SU9TbDVI?=
 =?utf-8?B?ZDlySzVhb1BXZUZtZGhzaUxsMjBMcEZ3K3FhUXoycjNkSGM1RVIzMEJkUjQ2?=
 =?utf-8?B?d2pJNHRvbFgxQXRJUEFEYjBqbUxHWVpscHM1R2w1K2JlV2M3dmVxUUU0Tmdp?=
 =?utf-8?B?ekpKM1NMS1hnem04U0dIK21oMFJiMndkRGF4QXVoeVcwUVcreEx1ZFk0M2R4?=
 =?utf-8?B?NUFmOFhUVzJ1dStpRlpqUS9tdXlWUVZ6Y2kxcFJvT3dQZVhKMkRvaDhZSCtE?=
 =?utf-8?B?TVpwY0xrYmhsQUwxaUhLK1E5MU1Nd3M4c0lzWUtQZTBMbHpkNDBIWkoySGFj?=
 =?utf-8?B?dFlka1pFZzdtZ3I3S2pZb0N6eWV6aW9USGU4Nk5XMk56VXR1N21rVzA2K2d0?=
 =?utf-8?B?VllxRFFNMitWZ0ZRQ1NDOGNSQ0RQeGpTSVp0YTNhY3IxNVI5S1h0alJURHc5?=
 =?utf-8?B?MzRqK1lhT090STBTa0I1SElLMW5iSm4xV1c3dVJCTURPZEFsUmNiSHcweExR?=
 =?utf-8?B?S1VMQ0srQ0JjbXpFSzlOS0ZNVU9xa2ZjNG1IQkt4MVhET1h4M0JWT2NCcEl3?=
 =?utf-8?B?RzIvaVAzeG94eTFuT1FzNUV2VkRVaUNaZDIwbkdJaitBK3dYU05KUVViK3JO?=
 =?utf-8?B?YVBtUTVvQUNoM1ZaaEVYZitWUWVNa2gxZGFBOWlIQ1JKSWxaSUR2TU9ReU4y?=
 =?utf-8?B?VGdteEVjOFNRMkptUWZVTmFIR1FlR3A3dDhXMjBTeit1dWRKRi82aVdPVFpS?=
 =?utf-8?B?cVpWN01QNGQ5MmpiN0lQR1BkY285OUYzWllTcGxZaWNieFpkZ1hLUWlEYVJJ?=
 =?utf-8?B?WTgvSVlMbXRLY2U2UGU0YiszSEQ4UXZFQ1BFM2hjK1dyOG1JRmVIbWlQN0NJ?=
 =?utf-8?B?YzFvSTd1THNPTUh5WDFpMWtJQWIwemtsdVZsVkRBdzJISndYcFh6MEVkSEdx?=
 =?utf-8?B?VzZJMUtuL3czTHNxS0JqNFBaYXFVS3BOVkI0cWhYbWh0SzQyaWE0K3I3VWhn?=
 =?utf-8?B?OG0veXk4VXkxMmR6eFZKYVMyOGVsdDFOY0UzYVROV1lnVDF5cnNFRFY3c2Uw?=
 =?utf-8?B?YUtCWUovWmVlM3Q2MzloVGIwZDEzNE5SNnp0V2NGOHBuMWhMUCtGMGdzcnlv?=
 =?utf-8?B?b0UwQ0xGL2VDaENSSFpJUzhidm03a1ZQMUZDYU0wdXdKb0dZNkFMVzM3cU9M?=
 =?utf-8?B?VFEwVnhhekljakNlUXV2c1FwdEpmNkhNbHlPcUpnMHZoZTdvbXlYRGtnSFIx?=
 =?utf-8?B?RUlTeDE4SHZxNUhWUldSQzNVNW5qbUd0L1JFUVErKzdKRmhrdFZES1IyL0Fz?=
 =?utf-8?B?T25rOHRKUGIwZU5CSHpvQVhxeEVFRnhWY0N4Y1dDZHlIekt0dXhaZjUzOHhV?=
 =?utf-8?B?bnpNVUhEZGFmUlZYYWJVVGU0Y3VLSWhUQzZWSmFoRlJVT2ZaNGpmb1pwS0ZY?=
 =?utf-8?B?anV0ZUJSZ3MveTJJNU4rRmZDWlVkd2QzL1lQSTJBd1RSY1BheVZOMXFvVkdn?=
 =?utf-8?Q?hrEr6X0+szNmZv/yBwph5DupU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?SXN0b0xoWWoyNHZHaVJweExvSTdrNGNrMHNNMGVlUEFFUXphVmdPcnV2K2NL?=
 =?utf-8?B?YlZuY083S1ZzWEpsampWTXFqS3Z5VmdvM0U1TndHK2Mrb0tGZFJ2YnZMZlY0?=
 =?utf-8?B?NXBlZGxDSUZsV09GNnJsdnVYNllDQnI3eFl5a2NpNHpTY1NXSEFic3drL3Ra?=
 =?utf-8?B?K1luRTJLeFpOdnZiMW1EVnE2aUdoTmh6eE5CbjNDL1BBSEhlbzdQd1JsTGM5?=
 =?utf-8?B?QkZnVk56TlRENCswOERFZFV1T3B2RzVsYVZEL0xsRE9HTXN0dWUyZkVYZHJx?=
 =?utf-8?B?S3BESFdvWGxPTDRHb1NScHNJZkFOQy95Z3U2VE1zTm5ZNmIvSU13K05ZOWor?=
 =?utf-8?B?WGNZY2w3UlIrNUk4YjdqMkhXZUI4YnJNQnVEMkg2Z0dDMXdUdHFvLzFCeVla?=
 =?utf-8?B?MnN3Vk1MdGVXd01aazd5bjVSK0EyK2d3d1kySUNUNHJqSUNjYU5xb1g3c2hw?=
 =?utf-8?B?ejZFNTJHRisxdFd2eTNLN1doaGY4OG1oQVpwV2hEYXdTanJqVVVnR3dZeENx?=
 =?utf-8?B?VnZ1RHI0VHBXZW80ZjNLT2J6dy9RRFAxVSt6eGw3RzNHY0ZQQnN3ZU1aM2NV?=
 =?utf-8?B?ZTZXRjMzTmJZajNKaE44QnFkaHpCeXZFTFBSeTc4ckwraFZCQ1hyL3N4Kzdi?=
 =?utf-8?B?dHFLY3Q4bFRwbEZjNnpLTjk5N2FCNkEyRlZkZkRDWTlZVWhqaG51RGVXKzhk?=
 =?utf-8?B?cmVtMVdKelkzUXBLMEpLcGZpUW04bDZ6ZGhhKzFYT0gxRmNSMEJMNHdjRzQ5?=
 =?utf-8?B?TUI5eG1YdGRKUHk1M0x2a3J1UlMydXROK043VkdNYTJlaTczTmJOK3RsOEJ5?=
 =?utf-8?B?Z2FZYklmODhoR3RadDdTSGpyMkxhaXZ4c1RvZEdvM1Q1RnU2cHBnRlpyZjRN?=
 =?utf-8?B?dkhIelJ4QlNaYTJna0hqL2FnbkFoajJTajU3K0lUVEREWngrSzJOKzdJalpM?=
 =?utf-8?B?Unp4eUQ4TEt5QndmZFNJRllQMXJFWkZQdXFmRm1ZZXpZRmFPM3N0T0dNT2wr?=
 =?utf-8?B?RndKSCtleHB5WWdYNnJHOUZBWWJyWmhWWmN3eFNpbldrWnMrS2hNRGF4c3pH?=
 =?utf-8?B?emcwdEVFdGZid0Z1YVM0bldGZS90VHUvbXB3N2lBSURFNUhTY25hcVZiaWln?=
 =?utf-8?B?L0ExMkdqZ1c4eFEwZU84MFEzdFZQWk0zY01INFdScHRldk5wOUMwU1hhTFJC?=
 =?utf-8?B?NDE3N1Rpc3EzK1lacUFOSWYxbDNXZ1F1K09QMjNEbXJ3Z2lZQ1kwVFJ0MC90?=
 =?utf-8?B?a1d3OVdvSzNlYlhRcjNDVThUOWdXdC8zS0NqemQyMG9FTm9RZzdrZ3JjYW1U?=
 =?utf-8?B?YXVqajdabHA1MHZlZCtxODN6ZVVqYUJqL3dTL2RNcXEyMVJ1MUxXb0JCTmhP?=
 =?utf-8?B?aVdVNzRpZkRUN3g2Ym91UTh1bjJHd3A3TEZEeGVBd1BjL2RrMkdUa3YrOG53?=
 =?utf-8?B?c21SK0J4WFhMb1B1aU5Qa08vdHlQWDN6SEJla3NxNjdLd1V5Z05XTXFFaCtF?=
 =?utf-8?B?YmgwOEwvZ1k2L0JFRm5sbi9BTkc4aWtNZlRxdzNqOVBHZnkvV3EwZDhFbUJw?=
 =?utf-8?B?aysyOXNlRFZZVGpmdTcwcTJxMUdFZXhHTjhXNzl0QlEwSzZ6SGlKWFdvYzZh?=
 =?utf-8?B?RGFBTGZkekQ1QkluUFFUbE5lUFJVVGJOdjRSUFVFblZhWjFzVEVPWlo5QnI1?=
 =?utf-8?B?Zk9makcvTzNramdZNjdZVnNZWTM1VUV5WUYvSDZ0Q2RaR3lFZkljOXNTeWZn?=
 =?utf-8?B?UlZ3d2hwTGFQblRvYmVHQStaK3p2ajM2SmZRUWJuVmZLUlgyc1BSaDZGNnFj?=
 =?utf-8?B?UjVTZitoNEMybUVLZGxlY09aYUZ5RjFKV3hwL05nUWZ6UFFBakRhL0lDbjJV?=
 =?utf-8?B?RE9wQnppalllZDRxTnZNZkh1TC9Eakh5ZmhpeXhDQmZPL2w1TlpJaXkvcmZp?=
 =?utf-8?B?S2Q0bXlmRUtYZ0JrSmZ6TzNNa3ZJeDhFeUM2YUZjbnVISldvcktNTEUrOUNp?=
 =?utf-8?B?cTl2QXQyTlU3ZU5rT1lCUmNxN3BOSUpmdXlsMXlUSzBwcUZTRUtWclB0NlA0?=
 =?utf-8?B?SzY2TXZEdTBicnFoUUFBOU5QbnlKVm9ZYnRNK0IwR1ZzSHNpV2tlVmxLdG5t?=
 =?utf-8?B?S3JJMElLNXZuSzN4WGF6a2hXck9oZzNuL2pLRlRpSk9RMXgxTE5ObW5Gc1E5?=
 =?utf-8?B?SmlkNFFGOG1FdmdNWkdsVG0rUFV2L25tRFB5YjFhOVR1YUwwWFQ3Z3RuejNY?=
 =?utf-8?B?UkZSQnl6Tlh0NW5Uc1dXSjUydVZ6MFdGemtWQWRHZXVFdTZYQmFtKzYxSzZ4?=
 =?utf-8?B?V1QvRmE0UHN2YlVSUi9OYThRZUNTYjZtU2hvaEJrdjlyV3JYZUhqK2lrdncy?=
 =?utf-8?Q?IaODy9ffWTsdgHjx3w9ooww4WfVWBo18I/YlRL7Yh3XN0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-1: awE03DOKnGF1hh4p8sKMnRSncjPu7X24y5YmUfuMUkwKDwPVFevjI7X+kfhrKeGam4W/qE2IqwOqHKOoaNvmgd5ehMZVXqN5JpuF1Rq2tBdGzb2NHhHC7tXkXC4mv9tST+gNoO/s8o0UFGa43uonF/48rM6PpHlWCUaglz1HiSiuZL/VGJ2w53rAMC8wUhC4h1VC8RZrBwS4Tsj1LeYaQWJMDSBAfLIXTIUK1o3rDPq/NLCiKMaQtxaHsJtDpwVBsXkuM/or5bd9j+QxRZ/YeS8ix5QSzWAyoJg=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b8e38a-e19d-499a-4e97-08daef3dc55f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2023 16:56:20.9278 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HYvuijp6jWf/xlLZ1GGro8ndT+N9D+ZBpU0ZaNH+XfIdeNRlwvGyW5quiQeriXWiRUxqUKk4a8t4my5sVuALbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6967
X-Proofpoint-GUID: LhATNnSXhYXRPwifkTW_GmyR9eEP_d_g
X-Proofpoint-ORIG-GUID: LhATNnSXhYXRPwifkTW_GmyR9eEP_d_g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_08,2023-01-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050134
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 05 Jan 2023 16:57:50 -0000

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleCBCZW5uw6llIDxh
bGV4LmJlbm5lZUBsaW5hcm8ub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgSmFudWFyeSA1LCAyMDIz
IDEwOjQzIEFNDQo+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmc7IGFsZXguYmVubmVlQGdtYWls
LmNvbQ0KPiBDYzogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+OyBTdW5pbCBN
dXRodXN3YW15DQo+IDxzdW5pbG11dEBtaWNyb3NvZnQuY29tPjsgQXVyZWxpZW4gSmFybm8gPGF1
cmVsaWVuQGF1cmVsMzIubmV0PjsNCj4gTWljaGFlbCBSb2xuaWsgPG1yb2xuaWtAZ21haWwuY29t
PjsgQWxla3NhbmRhciBSaWthbG8NCj4gPGFsZWtzYW5kYXIucmlrYWxvQHN5cm1pYS5jb20+OyBH
cmVnIEt1cnogPGdyb3VnQGthb2Qub3JnPjsgSWx5YQ0KPiBMZW9zaGtldmljaCA8aWlpQGxpbnV4
LmlibS5jb20+OyBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT47DQo+IHFlbXUtcHBjQG5v
bmdudS5vcmc7IExhdXJlbnQgVml2aWVyIDxsYXVyZW50QHZpdmllci5ldT47IE1heCBGaWxpcHBv
dg0KPiA8amNtdmJrYmNAZ21haWwuY29tPjsgWWFuYW4gV2FuZyA8d2FuZ3lhbmFuNTVAaHVhd2Vp
LmNvbT47IE1hcmVrDQo+IFZhc3V0IDxtYXJleEBkZW54LmRlPjsgU3RhZmZvcmQgSG9ybmUgPHNo
b3JuZUBnbWFpbC5jb20+OyBQZXRlcg0KPiBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5v
cmc+OyBEYW5pZWwgSGVucmlxdWUgQmFyYm96YQ0KPiA8ZGFuaWVsaGI0MTNAZ21haWwuY29tPjsg
UGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT47IEFsZXgNCj4gQmVubsOpZSA8YWxl
eC5iZW5uZWVAbGluYXJvLm9yZz47IFRheWxvciBTaW1wc29uDQo+IDx0c2ltcHNvbkBxdWljaW5j
LmNvbT47IE1hcmNlbCBBcGZlbGJhdW0NCj4gPG1hcmNlbC5hcGZlbGJhdW1AZ21haWwuY29tPjsg
QWxleGFuZHJlIElvb3NzIDxlcmRuYXhlQGNyYW5zLm9yZz47DQo+IENocmlzIFd1bGZmIDxjcnd1
bGZmQGdtYWlsLmNvbT47IFJpY2hhcmQgSGVuZGVyc29uDQo+IDxyaWNoYXJkLmhlbmRlcnNvbkBs
aW5hcm8ub3JnPjsgRWR1YXJkbyBIYWJrb3N0DQo+IDxlZHVhcmRvQGhhYmtvc3QubmV0PjsgU29u
ZyBHYW8gPGdhb3NvbmdAbG9vbmdzb24uY24+OyBNYXJrIENhdmUtDQo+IEF5bGFuZCA8bWFyay5j
YXZlLWF5bGFuZEBpbGFuZGUuY28udWs+OyBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3Jn
PjsNCj4gQXJ0eW9tIFRhcmFzZW5rbyA8YXRhcjRxZW11QGdtYWlsLmNvbT47IFBhb2xvIEJvbnpp
bmkNCj4gPHBib256aW5pQHJlZGhhdC5jb20+OyBxZW11LXJpc2N2QG5vbmdudS5vcmc7IHFlbXUt
DQo+IHMzOTB4QG5vbmdudS5vcmc7IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNA
d2RjLmNvbT47IEVkZ2FyIEUuDQo+IElnbGVzaWFzIDxlZGdhci5pZ2xlc2lhc0BnbWFpbC5jb20+
OyBCYXN0aWFuIEtvcHBlbG1hbm4NCj4gPGtiYXN0aWFuQG1haWwudW5pLXBhZGVyYm9ybi5kZT47
IEppYXh1biBZYW5nDQo+IDxqaWF4dW4ueWFuZ0BmbHlnb2F0LmNvbT47IFBoaWxpcHBlIE1hdGhp
ZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz47DQo+IEJpbiBNZW5nIDxiaW4ubWVuZ0B3aW5k
cml2ZXIuY29tPjsgTWFobW91ZCBNYW5kb3VyDQo+IDxtYS5tYW5kb3VyckBnbWFpbC5jb20+OyBE
YXZpZCBHaWJzb24gPGRhdmlkQGdpYnNvbi5kcm9wYmVhci5pZC5hdT47DQo+IFlvc2hpbm9yaSBT
YXRvIDx5c2F0b0B1c2Vycy5zb3VyY2Vmb3JnZS5qcD47IFhpYW9qdWFuIFlhbmcNCj4gPHlhbmd4
aWFvanVhbkBsb29uZ3Nvbi5jbj47IHFlbXUtYXJtQG5vbmdudS5vcmcNCj4gU3ViamVjdDogW1BB
VENIIHYyIDE5LzIxXSBnZGJzdHViOiBtb3ZlIHJlZ2lzdGVyIGhlbHBlcnMgaW50byBzdGFuZGFs
b25lDQo+IGluY2x1ZGUNCj4gDQo+IFRoZXNlIGlubGluZSBoZWxwZXJzIGFyZSBhbGwgdXNlZCBi
eSB0YXJnZXQgc3BlY2lmaWMgY29kZSBzbyBtb3ZlIHRoZW0gb3V0IG9mDQo+IHRoZSBnZW5lcmFs
IGhlYWRlciBzbyB3ZSBkb24ndCBuZWVkbGVzc2x5IHBvbGx1dGUgdGhlIHJlc3Qgb2YgdGhlIEFQ
SSB3aXRoDQo+IHRhcmdldCBzcGVjaWZpYyBzdHVmZi4NCj4gDQo+IE5vdGUgd2UgaGF2ZSB0byBp
bmNsdWRlIGNwdS5oIGluIHNlbWlob3N0aW5nIGFzIGl0IHdhcyByZWx5aW5nIG9uIGEgc2lkZQ0K
PiBlZmZlY3QgYmVmb3JlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4
LmJlbm5lZUBsaW5hcm8ub3JnPg0KPg0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFnb24vZ2Ri
c3R1Yi5jIGIvdGFyZ2V0L2hleGFnb24vZ2Ric3R1Yi5jDQo+IGluZGV4IGQxNTJkMDFiZmUuLjQ2
MDgzZGE2MjAgMTAwNjQ0DQo+IC0tLSBhL3RhcmdldC9oZXhhZ29uL2dkYnN0dWIuYw0KPiArKysg
Yi90YXJnZXQvaGV4YWdvbi9nZGJzdHViLmMNCj4gQEAgLTE2LDcgKzE2LDcgQEANCj4gICAqLw0K
PiANCj4gICNpbmNsdWRlICJxZW11L29zZGVwLmgiDQo+IC0jaW5jbHVkZSAiZXhlYy9nZGJzdHVi
LmgiDQo+ICsjaW5jbHVkZSAiZ2Ric3R1Yi9oZWxwZXJzLmgiDQo+ICAjaW5jbHVkZSAiY3B1Lmgi
DQo+ICAjaW5jbHVkZSAiaW50ZXJuYWwuaCINCg0KUmV2aWV3ZWQtYnk6IFRheWxvciBTaW1wc29u
IDx0c2ltcHNvbkBxdWljaW5jLmNvbT4NCg==

