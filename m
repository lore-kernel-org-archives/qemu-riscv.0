Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWhOA-0005C3-Bw
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 12:34:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWhO8-0005BW-7L; Mon, 27 Feb 2023 12:34:12 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWhO5-00006O-LM; Mon, 27 Feb 2023 12:34:11 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31R9xGfq019214; Mon, 27 Feb 2023 17:33:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=PPW2W4uDPRS3UmLrnpvdfT+5DtLOkdF2+3rbm2rzU50=;
 b=XVpiH9swk9EWyUcjs5g+zXr9on2rNFdpFbnisQF+1yAdFsQahzbAubI4F32dwZ8mu26t
 +/WuKNuOxbeDk/25AZmyNcuCVy91PaJZuxbLWOXbacIINA0dI1vU9ON1q4OVRBGXlv3A
 3BT93Ke6j9ndm2VIMRPsanSGz5SFgBzi7Kxcv6zzcnMIeMWd1UkM7YIOIp2tG2nkHBPN
 2pHexUwbRAKpHPrcn/M1seXS2spBektCiChyhIdAPfke9Cr5Ee+qtCX3A9HTKSivlkZZ
 hDMD2tmr/Mw1EahpVmy1+1VdJ9l24h+IAly9GScDsrDXdUfdqKd9EjSsRsV2HYiTqDxY /w== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ny9nuwn0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 17:33:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDCi2PiUBfq15j2RA+JB2FDSz06KXsIOlcaptFYkjak+ihJqRCWhfnyrIkWtRwuLyER23QIjlIrLTuKGLsGbKADecyWVOI0x1mxOU7sK9CG0xIb/PQan7CnOFV6Q31V6Wjt0Cs3dJeeriB3drdohiazJZR75aS40AZ153udfDsjOm0Mjg4rFxSkUapcLlVm2xqeHvMYN53NbgS7Lc934nyeUBBLnq0BNIscoXkzh2tJL4SMz2NuPDcaLF/JwEvvvYoOocLuPtz/MTAFG43zaZoIb+0OHYtUblJPuRvcSo2EUDuVDJZv0hONnRMkY3AzffcFlEpng2Y+S46c/vaSFKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPW2W4uDPRS3UmLrnpvdfT+5DtLOkdF2+3rbm2rzU50=;
 b=Cb/hZ2La0WHxpgf69wLW6o/d73OybPot6i+vgspBq1fYarTdD1jABsTNiAPPNSgsKzHnLWx47DgeIe6NJb8Q5EZb40s5cQwJ4gWB3KvHJMBw6xxWQ0BpKYjhFfgljxYtVXTDfZaQeyBayqHEz7Mv9s6zQOigKnYA3cSM1tDxc4/NY2SU1wf+uvJcPTuGUHnddFWb3BsRT9uPYP9xuQbHZETFtOV7Lf29PdA7C8BqOhqnGepTLeH5P20LavEv/1iFer/kKuA3sbFD4+y5NJYk+Km8VvoalyKmq2EG0NiUoyXgf1pvOAHRiGx624SEZo6UtwPsm2FaZjo4AZrxt4DHUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BN0PR02MB7917.namprd02.prod.outlook.com
 (2603:10b6:408:160::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 17:33:35 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 17:33:35 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-ppc@nongnu.org"
 <qemu-ppc@nongnu.org>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>, "jcmvbkbc@gmail.com"
 <jcmvbkbc@gmail.com>, "kbastian@mail.uni-paderborn.de"
 <kbastian@mail.uni-paderborn.de>, "ysato@users.sourceforge.jp"
 <ysato@users.sourceforge.jp>, "gaosong@loongson.cn" <gaosong@loongson.cn>,
 "jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>, "ale@rev.ng"
 <ale@rev.ng>, "mrolnik@gmail.com" <mrolnik@gmail.com>,
 "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Subject: RE: [PATCH v4 22/31] target/hexagon: Don't use tcg_temp_local_new_*
Thread-Topic: [PATCH v4 22/31] target/hexagon: Don't use tcg_temp_local_new_*
Thread-Index: AQHZSm2x+jyJC6NazUiTfMmNdKrGCK7jDjWw
Date: Mon, 27 Feb 2023 17:33:35 +0000
Message-ID: <SN4PR0201MB88081D51C7771526F66A9AE7DEAF9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
 <20230227053701.368744-23-richard.henderson@linaro.org>
In-Reply-To: <20230227053701.368744-23-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|BN0PR02MB7917:EE_
x-ms-office365-filtering-correlation-id: 44a9b5cf-4a59-4a1f-4427-08db18e8c154
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YE6M41c2xXs8Tm/mTb4sfxBFY3RBdK3EwCTrBshoCfgkCZdhEsZzcRTYRk0AY+sys14BddY00Iig3C2p7gOOYSmK38SreXEAxG+bAEoaudFzuw5axLlDi3DEy10T/s3caJzKy0JWSFblP3Stzs58vHVosN4a8USguI/6FWNv4TBZZBf2lBz4a0y72oFx+RjGqz6x8859ZYibyPMZBWJqHI+V8G1MvjjPpe6AIjpOWpuUhPvkaFLW7PMAUG8pEDIeO7hvQ6LnoTu6+Bviv8wo007ZaWy8rqOmrG/Uon6rb2GF41hUlIKpdRuT1/WvnGTElBB0z438QQHuxlat8iagbO+OcKTVLCXJii7yM1boclyTQVREhv8rgYj867ah/PvFrc+3oVRjVEgydTupW04C13DtTrcS2huPt5Ah23DsFzwRu2PmTR7BUu236S5EYvGhPiy2mQsEm4ugtN4FZDBTVSCL9++//ylWYKpA2WGApb4aYbVbrRt3uQAQ0ZKcutikSNhnlhT/wpLNto+/C1CmmmE0lZqjT/7PZvErShvyTszLcxweaSnThDC94UAd836XL0SCT43Ui3dPH4wVULuqZLRpO1Q5e3bgW1gNMy49Z6bOs3q7hbH4SCQ/9VJpjmZjEfiyRUIr08rjkxwFlBV8pfkZVd5PuhOUOid9k4ZpzLqkPiLqYrvDhYIuLEH5rOfBLvos9vNMt0ThZwILL+wYvw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(451199018)(122000001)(316002)(2906002)(7416002)(33656002)(5660300002)(8936002)(52536014)(55016003)(86362001)(53546011)(76116006)(66946007)(26005)(9686003)(8676002)(66556008)(71200400001)(4326008)(66476007)(66446008)(110136005)(64756008)(54906003)(38100700002)(41300700001)(38070700005)(6506007)(83380400001)(186003)(478600001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MG5uTTZmNjBRVlRZUUhXYm5saDU3RGEyYktMSmxEMWFpQ0hxS25FUDFwdzIy?=
 =?utf-8?B?ME9USXg5Y1V1WitReWVMNzhMRnR0QnFhSDFIN01hTDRXU2RGNURjU05qZEZa?=
 =?utf-8?B?cXNmYlhtb0haeXQzRXllRWtmb0tQeWtjM3p4Y2xrNEFTcTFWOENIN3hYazFt?=
 =?utf-8?B?bnVTTUZjSDFMbjFBTzJicm9jT2I0RVNQQkRlSVBSakM0R1UrQ2lTUkdRa3Bm?=
 =?utf-8?B?ZFhyRTQyZjRWbk52bGtSdFlud1ZFTUsxbkdiRUdmNmZkTS9wY1R6OUFOa0p0?=
 =?utf-8?B?NXRZVVhsekVFUWpFZERxUm1QUUNxY2RyS1YrUHQ3NDVTOWYxYkg3RGlNK0h2?=
 =?utf-8?B?WklON1BkQVIyVURCclVyV0F2ZU1wQ2N2RlZZWWViK1NDLzVOL2EweHI2VzFV?=
 =?utf-8?B?UVNmZ1pIOEFhU1RhdVU0UjZ2Y05YaENaQ01Tc29pS3R6WVhESlprdHdrRlhE?=
 =?utf-8?B?cTREbmp5eDRYa0MrRmVSSVdvVTdlelRtM3R4ZXNReFNDeTZuRVdKZUpZaHVR?=
 =?utf-8?B?SDBSVEttc0pIUGtzWThsN3lsYk56ZkhTRlQ1WnFzYUdrazNxZklMUVEzYTBY?=
 =?utf-8?B?TDNjUjdSNGxORzRubDMvZHNPakZ2bHkxU2M5VWhDT3FqNU4rYnN5TS9yeU55?=
 =?utf-8?B?OEorOVdPd3puOXE4RFlGRkwvSk50WlhwZ09WR090bUF3NUR6OERFOEJYSWYv?=
 =?utf-8?B?TXdvd2ZRTHJIbXRqNnNOb1NNajdlRXpyek1lU0NUT2lWbHVFWTVEc2VyR0Ra?=
 =?utf-8?B?YWE2TE9FZUZUMVhST0xxWlNCYUdXQXRjQ3psNWtnRllRajNlQXg1bmh6VW5n?=
 =?utf-8?B?aXVWMFFOUEtuZ29Ha2lCamVJYitGSXBsczlhQWIyVk54bzE4WUY1ZVVZYXBs?=
 =?utf-8?B?OUhXK09ZNWxLcUlpM1FXQ1NlUTJMd1dzMVg0T1dySEY4dDE2Njc1cFdzcERU?=
 =?utf-8?B?aTI1ZmtiYndOaDdQdFJFaXRERWkwNldxemM3RjJLY3FxSmg0clpvdE84djZu?=
 =?utf-8?B?aXJSSlJocmtFZE94NHIwRGZKRENvUWlUTFlIWWFQcFdocXFNRng1TjNDb21l?=
 =?utf-8?B?WTJqZmYzNk11RTVFR0xIc3o4bzBjTCtKdzVKaGV6bHlpOW5iUkVZRm1hYWtU?=
 =?utf-8?B?cFM4RmkwYm5vVEZHcWNpMWFmeExsUXFJUmhTVFM2ZU5vdG1xOEZNL0JFc3Jo?=
 =?utf-8?B?T1NXWG03TUVPYUozSzNObkhiTElJZFdrMzR5amFIQzY5dkJtRnA3MVh0cTRP?=
 =?utf-8?B?NWNzN05mcE1jbTN5dy9wNWZPbVpTcDh6K3c1Mnp1STV4cVRqV0QxTGEvY0Rr?=
 =?utf-8?B?MlVkTklRWjZzWWJ2a1JWbVh6MHg2Wm9CbTUram9YdDVETTFVV3Bwbm9qcEZz?=
 =?utf-8?B?TFRuNURmYU9NeUUxNmY1clJLWnV4Z1dtN1V0b2hsR0lCZ1doYVQreXgxblBt?=
 =?utf-8?B?RlZBYnpqSXMrbjFDTDNzZk01aGxBVFcxVUd0K1pzSVRPazhrQ0NuOWFBUnlU?=
 =?utf-8?B?MDhDNkJIdEpyQ210SjRvM3hRSkxpM0taOEtZYjRJdHd1OFV5Ri9SREVhVzlp?=
 =?utf-8?B?OUp5OHhOZnB0WGZtSFExT2JDZCtOTGFteTBlZUYxejdmNExWTGd4YmFqWEZC?=
 =?utf-8?B?OC9MVEhqZ2pXK0NKdC8xWkFjeG1paDJPQXFaUHU4TFF1SjdvcitRYUthQU4z?=
 =?utf-8?B?LytldzlEV05PNk9YK2pvVTh2d24wbkJrVVFaUzVFUE5IQkxoZmozeW5WQTlT?=
 =?utf-8?B?T1RoM0ZzM0Z5eGxDS3RaV1RnOG5FS0Uzd0NpUkc0Z0VBcEFRZ2E0YWlMTlI4?=
 =?utf-8?B?bmZLRjd1MDAyZkFxQ0M2K3VSbjViVTlhYUEvay9pNEFObEFqSENXYXpSMUVi?=
 =?utf-8?B?L2dnZTF1aUQ1cDFHYXdoaS9IZVVhaFhoeGJFcnkwTlNGZ1pweTRZTWx5eHY5?=
 =?utf-8?B?QVM1YWl0ODJvYXlWY3YvcjNjdGZkVUYxUFFsVGlYM0U3dS9MQURIVXBEc1g0?=
 =?utf-8?B?VUVrSkgvVnJKc2puaStxSDBra3V3bVpWZnBKVlQwcytUV3lLZ3lWWUgyYjZF?=
 =?utf-8?B?SnVRelFkcHl3a0h2bHNQRDZIMzRwTFJNRm9mQkxSQ0VMdXN1YUFCMWhvZGQx?=
 =?utf-8?Q?XF6nE8zpAZiDVwWBf0W6kSIqu?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?ekxGZEJNVUgwRmUxWXJEdTBUdS9oQWdHYm01dE0ybVdaQ2hqM3dTRHp6Zi9P?=
 =?utf-8?B?dmhQa0NVMG1UU2FVOUNoRk9SaUM4UUdNMkVxMnRBekp4TFJVT1dqcHFlL3pv?=
 =?utf-8?B?RVZaM296QmNUd0hRdEsxekR3a1Z6T2plaHRZSXBXcmEwWFJLSXRZVnBMM3hJ?=
 =?utf-8?B?eVppbzVvM1ZIb1ZkSXg5NHQ5dmx4L2xOV2xzRER4S0ZNbzFhWFQ2RWlRMW9y?=
 =?utf-8?B?Z05PTms5TkNlN2FpS1VzRG90bXV0QlRCZlBUdEVPZzlpaEhSdkN4Z3lMQjJI?=
 =?utf-8?B?NFRCb01OM1NTZFBFTlRNeTN2YlR1NDVjNXY2dWI3a1lpZ00zS2ZGaUhOaE5R?=
 =?utf-8?B?L0VRYlhKeTJ1dFV1YkxlSythWDAwU0huc0tTYTRyMzcreStkM0lDNDdWWkFu?=
 =?utf-8?B?NnQyRDNPZ1ZMOTlVR0k2cmYzVVppUGhmRUsvdHI4b3dLUU9YdllRR1ZTQ2xt?=
 =?utf-8?B?S1hpZXNDNHNseGpLRnBPby8rWXIzbENsQll6NXZnVHBLdy9lODVmTG1BeUtk?=
 =?utf-8?B?WGFiS3hSQ1RSTWJDeWlHaDdxdSt3bWR2Njkwb0VTRmozbCsxL1A0OVZxNzZF?=
 =?utf-8?B?dnA4S2pkU0xoWlRJcHJaRWdJRE9LbFhLRzBSd0NOb2dOSWpBaE1GRlI1dCtw?=
 =?utf-8?B?QTNVaU5La2pZMytWSG43WFdWbEp3M0x3Q2IvMnI2WG51TWl4bnBZSUxJcU5O?=
 =?utf-8?B?UWU2bFR5Uks2VGUyQTNDZkZBcHlIT3lSeUtvbnRTOW9meDlXSkZ6WEUrY3Z3?=
 =?utf-8?B?dEZrM3JsOEUrTWo3RWkzZjc0TlZYY1MvekwvSllIK1ZPdlo0aVJJZ1U3Nll1?=
 =?utf-8?B?TFpaRmgxclN1TWd3NnhIZmN5SFQ5NVo2WC9jV3RuVVZidXJHSTBJaHQvdm1i?=
 =?utf-8?B?UGtVYUdUdDU5V0FoSlEyWHR3Q1JYZVI1Sk5rSGx3SWZTTnVRMnV5VkxkenNW?=
 =?utf-8?B?MENLdVBHMWlSMXc2UWY0ZjluanVFbjd2c2oxdVVuSndpQmd1RHFpSXhqUkRM?=
 =?utf-8?B?YnN6NG1sWEM0YklVakhpRG5IbWpjdnE1Q0RkNDlGZTRmLzdoSElCdnlncTlJ?=
 =?utf-8?B?eXRIellGaDFrK0NoT2dCdDJZOUluVTRxRXM1VDVhb2dub0diUEo1NFJZV3lT?=
 =?utf-8?B?aDdiZFpXaEE3WWpYZkhrVTF5OEtvUDhzRWlUSzJIOTNNU3k5RjJRZFFtSWdk?=
 =?utf-8?B?VFkyQXZVWG9CdGxydlM5YllwV09LYjdjNE5aZHhKWkpFQlpydHdtNElQVFVK?=
 =?utf-8?B?V3Bzb0pCR2FNSjRSbXY1bzZURm9MMmVPUmNVVDM5NzZHNjQ5NGpxS0pKQjRz?=
 =?utf-8?B?NkNtT3EvWFZYaFk2a2dvVThQUVNqVnYxOE9NSUMzMlVEc3N0ZHlFZlVjaVBt?=
 =?utf-8?B?UVNCYWxseVBvVFE9PQ==?=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a9b5cf-4a59-4a1f-4427-08db18e8c154
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 17:33:35.7436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BtDyVtB1jUZELdEbhG165RLyD+8aFFtB9IP2PW9zZLaeKfZNh5zvO3ADI0R25lOuVau+BrpcGXCFRQLj3E3IZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB7917
X-Proofpoint-ORIG-GUID: mzq_VeFwTsp4E3SdqbGZjax2nkdftgaI
X-Proofpoint-GUID: mzq_VeFwTsp4E3SdqbGZjax2nkdftgaI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_14,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxlogscore=251 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270136
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
X-List-Received-Date: Mon, 27 Feb 2023 17:34:13 -0000

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFN1bmRheSwgRmVicnVh
cnkgMjYsIDIwMjMgMTA6MzcgUE0NCj4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzog
cWVtdS1hcm1Abm9uZ251Lm9yZzsgcWVtdS1wcGNAbm9uZ251Lm9yZzsgcWVtdS0NCj4gcmlzY3ZA
bm9uZ251Lm9yZzsgcWVtdS1zMzkweEBub25nbnUub3JnOyBqY212YmtiY0BnbWFpbC5jb207DQo+
IGtiYXN0aWFuQG1haWwudW5pLXBhZGVyYm9ybi5kZTsgeXNhdG9AdXNlcnMuc291cmNlZm9yZ2Uu
anA7DQo+IGdhb3NvbmdAbG9vbmdzb24uY247IGppYXh1bi55YW5nQGZseWdvYXQuY29tOyBUYXls
b3IgU2ltcHNvbg0KPiA8dHNpbXBzb25AcXVpY2luYy5jb20+OyBhbGVAcmV2Lm5nOyBtcm9sbmlr
QGdtYWlsLmNvbTsNCj4gZWRnYXIuaWdsZXNpYXNAZ21haWwuY29tOyBQaGlsaXBwZSBNYXRoaWV1
LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+DQo+IFN1YmplY3Q6IFtQQVRDSCB2NCAyMi8zMV0g
dGFyZ2V0L2hleGFnb246IERvbid0IHVzZSB0Y2dfdGVtcF9sb2NhbF9uZXdfKg0KPiANCj4gDQo+
IFNpbmNlIHRjZ190ZW1wX25ld18qIGlzIG5vdyBpZGVudGljYWwsIHVzZSB0aG9zZS4NCj4gDQo+
IFJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+
DQo+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBs
aW5hcm8ub3JnPg0KPiAtLS0NCj4gIHRhcmdldC9oZXhhZ29uL2lkZWYtcGFyc2VyL1JFQURNRS5y
c3QgICAgICAgfCAgNCArKy0tDQo+ICB0YXJnZXQvaGV4YWdvbi9nZW5fdGNnLmggICAgICAgICAg
ICAgICAgICAgIHwgIDQgKystLQ0KPiAgdGFyZ2V0L2hleGFnb24vZ2VucHRyLmMgICAgICAgICAg
ICAgICAgICAgICB8IDE2ICsrKysrKysrLS0tLS0tLS0NCj4gIHRhcmdldC9oZXhhZ29uL2lkZWYt
cGFyc2VyL3BhcnNlci1oZWxwZXJzLmMgfCAgNCArKy0tDQo+ICB0YXJnZXQvaGV4YWdvbi90cmFu
c2xhdGUuYyAgICAgICAgICAgICAgICAgIHwgIDIgKy0NCj4gIHRhcmdldC9oZXhhZ29uL1JFQURN
RSAgICAgICAgICAgICAgICAgICAgICAgfCAgOCArKysrLS0tLQ0KPiAgdGFyZ2V0L2hleGFnb24v
Z2VuX3RjZ19mdW5jcy5weSAgICAgICAgICAgICB8IDE4ICsrKysrKystLS0tLS0tLS0tLQ0KPiAg
NyBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkNCg0KUmV2
aWV3ZWQtYnk6IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4NCg0K

