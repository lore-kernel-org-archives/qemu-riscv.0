Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p0aAP-0000dG-1b
	for mharc-qemu-riscv@gnu.org; Wed, 30 Nov 2022 22:23:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=327315efa=wilfred.mallawa@wdc.com>)
 id 1p0aAE-0000ch-3r; Wed, 30 Nov 2022 22:23:06 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=327315efa=wilfred.mallawa@wdc.com>)
 id 1p0aAA-0003kN-BD; Wed, 30 Nov 2022 22:23:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1669864982; x=1701400982;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5rxDPxSiu/mJkNShRJUhPEWsLwm5XehxxlVXxe/SYRI=;
 b=cgTZWAcIeXdIw27FP6XvnVwnPYKTjxtvMjfE3SRJKWrpYfgo0wD2DPp+
 h/H5PYQjY+Y233v1IQbw92ptCGgI6U43M8s8XNRitpSjzNUBHoXWSGoYG
 zpprma4couQdGZy33gx/xmL46BWivMYzHH+AvFS2reV+mEzILwA5KROHW
 sb6kjK1QqE7xZN4fZWiHaLlduCufRT8bm3Eivba7uZOWdTcfEs+tGmUE5
 egWT+wjQ5QSC7If5spyBGXq2juI+id6vCPf6GvdVXSsSiTK5tBdsas+i8
 WB7LOAttuoVXT/sFPgeWsegXBdEzetgg0zaFHuX7oMmUii4sdcc2OkK8g A==;
X-IronPort-AV: E=Sophos;i="5.96,207,1665417600"; d="scan'208";a="329714665"
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hgst.iphmx.com with ESMTP; 01 Dec 2022 11:22:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvQpryb5ittTnOTa/WS6Dm6+VTuaNPfrT/6ClCm4+VEbqc0UcgsjppMXKvOo8WWV/TiHMWtIJJzaGdgKAxQCptXGxm9hcp8EI3KhjA6JdZBxGRz6fDa6fSkGLs4Jmss6VrRDr9L3Gz0KvrqnCOAaANkFesjWbM2geKK890KGB6aV5cLqCyId4mylrbuicfL7OOF9Nl36+NOxuPtWh0w+yPpDLydT6b8kk3T3WPanuPNySHp3TuZzci0qX+de3oK2py3gNxxo4R/TI1K6r2QFYCsxmbbPogadY5Ujh23nWxdYpBfHs1WjuvVR0y31N3nRMkPj1sO95QJPOKbk1K0kwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rxDPxSiu/mJkNShRJUhPEWsLwm5XehxxlVXxe/SYRI=;
 b=LX/TviGgE6t9mOB9ut9Qz54axA9Cn+ct2J+0zj9Xl5DHIgC2JwRb0U07JW8/LAoF5+ivlKzOd76++2ox+6HJJLjDmiMxDtNLN9JPkcyxxlKh0d1wdq0myB1bx6MnbP34J8RTskEw1tePZ1/yO+HhdmnOWZbv9MnaY5m1odsHVxIU3NZ6ce/ZFTwC/Lz+hyT/vgUKLJXqlHq/PbkU06naOIvRkE778ggbHBgPHZsvDmabWyMArHhNrQXAARog5hN5seUEohmkIOAVBrd0AqdERRJXijFFMgLFtAKkOBV0Il2PmN+92tJvQDnh0VYYS5RZYfIM62zOGvyNDNTvagVvkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rxDPxSiu/mJkNShRJUhPEWsLwm5XehxxlVXxe/SYRI=;
 b=KCISFXFb6Qxpz27BLAV/Jr9in0oBR1kDzivU+RGt8RafLZvmUMpJE6GJ46Fl+4NJDitPTN4lguI+mop4rL3eAtcaaEUa8rl6MCn2zTCbayJA4KjmX3ypakMHD4rFotSki7hhruNL/zmmdKnSNFHD/KCWEeC9nuJFoRKnBzxt3BY=
Received: from CY4PR04MB0359.namprd04.prod.outlook.com (2603:10b6:903:b3::19)
 by BN8PR04MB5604.namprd04.prod.outlook.com (2603:10b6:408:77::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 03:22:51 +0000
Received: from CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255]) by CY4PR04MB0359.namprd04.prod.outlook.com
 ([fe80::6068:b90:7b94:c255%5]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 03:22:50 +0000
From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "philmd@linaro.org"
 <philmd@linaro.org>
CC: "thuth@redhat.com" <thuth@redhat.com>, "jiaxun.yang@flygoat.com"
 <jiaxun.yang@flygoat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "aleksandar.rikalo@syrmia.com" <aleksandar.rikalo@syrmia.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "sw@weilnetz.de" <sw@weilnetz.de>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
 "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "aurelien@aurel32.net"
 <aurelien@aurel32.net>, "git@xen0n.name" <git@xen0n.name>
Subject: Re: [PATCH-for-8.0 1/3] tcg/s390x: Fix coding style
Thread-Topic: [PATCH-for-8.0 1/3] tcg/s390x: Fix coding style
Thread-Index: AQHZBL+8Do4YdAzJl0abQ/UPPHRXJa5YXt0A
Date: Thu, 1 Dec 2022 03:22:50 +0000
Message-ID: <08fb935ac1c54f6758fcf233a25a56bf4fb4fddf.camel@wdc.com>
References: <20221130132654.76369-1-philmd@linaro.org>
 <20221130132654.76369-2-philmd@linaro.org>
In-Reply-To: <20221130132654.76369-2-philmd@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR04MB0359:EE_|BN8PR04MB5604:EE_
x-ms-office365-filtering-correlation-id: 1c019fcb-713c-486f-ff0b-08dad34b5392
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q3rDEWOAwuKYQJ1FG7p+MLDrfMm9xqyLtiIolYmePfQkG8/rd3/ceXAL7SblQVL0z/Kne5Gr20604dP+XhykLNKG+ElahfbDeO5T2w/LKbg+GAXLEct6lckPV7gJV7ndewRsfIQ3K0sMl92Tewt9c1edQ10FQvH63a1jv8W30eWEJXY71w0guNodPwXnCSBb8UKBv4U23EImKSEWMmTDAFXK0QOYwAlphMDjsyQbD3VX9js/kOkR+Y9lq41NwrysZIOCrkhLi1Vvg36n1JAoDhT2dZt18+prl0pINN8VA6h7XW/bPdrZH6b/KVJ97MUtx/XIH67pxOzXEwZUggia01cZssZ433b5Y69Ns5zgsd4WkHAPaQ0ZuuT0fR+NjbIfjZWo7lKSRH/8k2BdLYC/pOMUCWzpYpjOOTFLtwHDJol0CL6By6NnOHAi587R1tD4p0nrgrEhnimbr+CkyP2n43gYLDH6Ul1qNUMUymAzxYlOvqpaU3cycclmkoiKLMDayAHsg1jlZvP7fdglyndVJ/wSEhAMjX3mMDyueMZPIp9Cuxgarc4HPoXx+Ghf52Nqimwv7EA2yfrmmCVnR1rl34zZSH0ktVV+itZjsEDyHcrkCrmamHF2VJDUj3ph/Mw3DnZjieZYqLJIfqOa+9sdMeCdnW1FmGKpnNZMkWjO1SDpc5TvgH3D6L/1WtgOz1OO3ex+PaGSwC8znbA7dYwfMw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB0359.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199015)(122000001)(36756003)(64756008)(82960400001)(2906002)(7416002)(41300700001)(44832011)(38070700005)(66446008)(86362001)(66556008)(83380400001)(76116006)(8676002)(71200400001)(2616005)(6486002)(91956017)(316002)(54906003)(478600001)(38100700002)(110136005)(4001150100001)(66946007)(8936002)(5660300002)(66476007)(26005)(186003)(4326008)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VnE4NlUrdjE4NU9IUVN3aVNKeG9LOTdyTVlzOUQ3eXIwQXRZalJGZkF3TFlt?=
 =?utf-8?B?dGZCVlVPZUYzNDRPUFMxb1RqTFZieHJDbEs1bHpqL25YdmR1QXg0T1NKQUoy?=
 =?utf-8?B?Z3JyVXlYLzh1enRTSEExRVh1eE96SUQybFNDTjdteUg3aGFYY0h3TVBqSjRE?=
 =?utf-8?B?TlBCb0E5REFlUGNTZWI1SG8zdysycnQvM08rVFo4b0o1eHkxd05tSTJpTWpm?=
 =?utf-8?B?MGp6QWdMNHl2amVaL0JlclVpUzRDbmJYNUNrYlBIU3dOM25wSjFDYjJtYzA3?=
 =?utf-8?B?T2dydThCREhZYjJLZm5TZzhTb25ETHdsQ25FS1dxODBoVFhJcFhNVlM2cWd3?=
 =?utf-8?B?WHlXL1ZTTDVYemdoUS91azZlaGJMdVBnbHY3Y09lQjBTQWltbWFEb3F4a1RB?=
 =?utf-8?B?ZC9IcWpudVhOZlBDRWlqT3doc0d0aXNVdG9OcEx0alpOQWdqdWN6ZVFiVitO?=
 =?utf-8?B?VFozdjUwR0dldUtJeTZKdkE1TTd4NW1kTHZ3WjNucHcwYmlGNHQ0SDBacXE1?=
 =?utf-8?B?akt4cXNwQnJ3V1RLK2xPMTNvZWhmbmh5ZW4xNVR2Uk9xRG12Qk1LUmlpUXJG?=
 =?utf-8?B?ZHdQUmdVcndwY08rNEw2UnFicGhCQlVOOUhNOUF4T3RTUW5oSUtkRUsrcHNI?=
 =?utf-8?B?VjJrRFRjOEw2UjBrcGZ5QVljbEpkenBVN3lIMjZxSDdCTURkUXlrSStQemN6?=
 =?utf-8?B?R2hDWEJKbmNYd3RTcndvTG1yR0ZvMGJ3bjg0Y1VVSmFpR211MlJWVGFHQlZX?=
 =?utf-8?B?Mkd1RzRML2k0eThTRlpGeVBLdWpablFMNUg4UkN6cWpYN0lTemNGa3hyaWNa?=
 =?utf-8?B?bFdKSUQ5d2dIV3hGUmcrYmdBaDlCVG8xbTBtbXBZZ1FkaGV6dlJQdVBENHow?=
 =?utf-8?B?bW9FaGtCbFkyYmFNNGovRFcxRFpRSUNpcGp0ZUxRNm1kTm5zNjZacHl4dEtv?=
 =?utf-8?B?OTZmU3VlT1l5aWVpNlBsdkRvZzU3WVQrOC9vNnZKWlRHSXVCQjRsWW9zVmV1?=
 =?utf-8?B?aEZCN2xFcHJraytCNC9lNzRXK01sUkQyYklxem5rakRvRjNYRzZCRW80bjJI?=
 =?utf-8?B?QTh5djZxMWV4d3R5TzNPU2pYalBqMVlCSlZaR3BNTVVtWUhjc1psMlBjbkFx?=
 =?utf-8?B?Ry9ZM2ZHV3NnSnppZlBTUzJ1WnF4OW5tU1pIbERHUHJVYi8wNjk0UzZ4MXZP?=
 =?utf-8?B?K3FvY3o4b3V3cEJkN0gxQU9NdXFFQ3VVb3cxRDRTN1BhdHRoc09UbnVMMWda?=
 =?utf-8?B?NFRiMWxZU1hObHRWUG1FbjZDaXArMFRVUmxPTzBzdWY0S1hXK04vTlZnNzJU?=
 =?utf-8?B?Zy9qOVRGUWNEemJ5Z3NnNkpBQmoxQWNlTXFURWlzeXovZUZudFpLZFpEVnk2?=
 =?utf-8?B?RGRHVjJWSjF5RTVicmN2WkVqemFxTlJ2dFk3dEh4NC91UWRxbkYxUGROMlVs?=
 =?utf-8?B?MVN4MklkM1N2ekxiVUxBd3FobTdZeTMwTmtVWXExdFRMQVZlUnkwejNiMjU0?=
 =?utf-8?B?UVRWTmJ0NmZ4QWhMRlBEUHo2S0I4ZHN3R2VxMmg2a2pFRkNmTEszcm1xUmlB?=
 =?utf-8?B?Yk5mRjJsbjdCK0diKy9vdkNZcm5BSlJGMG9mMEkzc0c3QWRPNVRRV0tKL3N2?=
 =?utf-8?B?SFB1b2YxakIyVG1IeXlPM29VZGl2RUJwNUU4MnVneElOS0MzQURXVDI3cElv?=
 =?utf-8?B?SmxlZ2FPMllkZ3hjNlo3UU5zY0lSbUdzeFJ6V01Ib1ZrWTI1aERDa1FXWVZz?=
 =?utf-8?B?ODJvNTByd2M3VGZkNi9UalFWbjJPTm1oZEpjQ2hYSXU1UEYyTjRpRUthMHlG?=
 =?utf-8?B?WUQzUy9lVUFIK2gvTnhiZnpVTVFTQ0JTMWtuU1JmS0ZLK3l0aDE3OHdVMS9t?=
 =?utf-8?B?TmFLQ21HNDBZa2sxdTBPbnNyUTJFZU04MXFUMEs5bEczTzBsV0NLTzJHSnhC?=
 =?utf-8?B?ZjZLRGx4RTUrUW1RdFNoNTZkVVZwZUhuYzFrTWxidlB4RHlHNG4vbERkcUFH?=
 =?utf-8?B?UEh2a3U3VUNZcVVuMWVkL0VxdTY2WGRUaXd2cjRiVVNHcFFROTBGemtHakhU?=
 =?utf-8?B?TmJ4Q0VIWGVtajBWTVJ3dmRoYTkyTUU0dVNLWkgvVHM3eE51RGc5Sk1RQWFO?=
 =?utf-8?B?K0daTFZLUFN0bEY2OU9kNnVTR212ekQ4VFJLd29ZUk5SZVpwUGl4UnNqcXE2?=
 =?utf-8?B?Y2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6D28E205E6FC546B14900C0E421CC39@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?Ym41a1VKY2hjTlJDSUhuRlpXRHN6ZzJPUmllQWJNc1hMSzVhWnYwVzZJdW1t?=
 =?utf-8?B?U1NScHFNdDZPMHdnV25wNEJGdisvRG9RZ0plb2pVNHpvQTNuSE1tbGlhZ3Mx?=
 =?utf-8?B?VjdPeEhSSEZFWXNwVmxVaDFZTllMclFLaFdKN0tHcnpGaGp6T2FzcklPWmF1?=
 =?utf-8?B?V1hrNG95RnM1b1FURUNhcUZFNzduQUtyaHAzbVFyc2JFMEY0dTA2d3pHZE01?=
 =?utf-8?B?alhJSU16MkxqVjBiSE43UWg2bnJjY2N6L1VPSlg5SWFFMW55RnhvZXkzNGFU?=
 =?utf-8?B?T0xGSEF5RGxxcHVhVGxaU3BGVnBGSC91STZSZngyOVIzanpuU0NyUVBYMFlW?=
 =?utf-8?B?YWdHMkVhZWtzeVFTOWUyR3hjK1dOV1dEbHZkQStiS1BOaE9FREpNLy9XVGpP?=
 =?utf-8?B?TlVZcUUvY1BJQ3JFakgxN1FNbDluOGxURFl1NDEvYmR6emoxVzdGWFBlUjhH?=
 =?utf-8?B?ZVFyVE9Fb0xnU0p1RklXNFJVdEM4VkRya3kxVllKc0VkMURMWXNkNTBEaEZk?=
 =?utf-8?B?UVppWVlLRHNobEpPcTBzR1FnUXR6bXVMNi9HWlNtZ0xjOG9QZXdSV3RDb29Y?=
 =?utf-8?B?MkRFUEI5L1J1U0EyOFRtYXpueFZ2UGJXSmFoUnZnRU9yZUh6SWtsNG03dlc0?=
 =?utf-8?B?TnIwMmdFZ3diWkY3V1B0ak5nQSs2alpWbnRWSG1MYkRxam5PNlZOaXEzUFZ2?=
 =?utf-8?B?VGFINnlHTzEwSmNicXBTTnpPbG1hL3pzbXNyZUR1cHllc1MyOENVc0M2dmt5?=
 =?utf-8?B?Zk95Z0NmeVFIZmd1VFRMbmt6L0l0bVhaL052QVE2WTRpcFJxZGZCSlNCWWRJ?=
 =?utf-8?B?SWttS1lsRzZUWGhKZ21sOGc3aExpbW13NHNKRVYwYXRmQXMyRVR2WE1tWnBY?=
 =?utf-8?B?OEpDbGhqMDlaWHdlMWUwS3N2ZnZPYjJrWHhuMFpHTGpTS3ByUkhzUjhZWTdi?=
 =?utf-8?B?bkdsWm4yUXRvWTVua0Y5VzhxZWxQZUpMNlU2d29yZlhsbUp0UHh6N0swMVZz?=
 =?utf-8?B?Z2doQzdtMkVCSGpXOE9BeVBoVFlqeGJtZm5FbVh0UkRnN1VRZUVzZEFNQXZw?=
 =?utf-8?B?b2RiQWlEZzZ4VGd3NTlTWldUbkYrbTBxK004QjlwMGo4RTI3T0tSckdiK1Fz?=
 =?utf-8?B?bFRhV3h0VUVMYk80cHNyWlFFajZub1FZVjRBaTd6OGJaOENkeE9RY0tJeUZG?=
 =?utf-8?B?QTM5cjJsdDhqZlNmQU9tZ2toemVyc3ovWWM4T3hYVmNMYlZVWXJuYTR5SklL?=
 =?utf-8?B?bUxKVlRtZFVFY3kwcnlQZDBiWlk0ckcxeks0K3pCYkVyamZJa2NKM01zaFNy?=
 =?utf-8?B?Wjh3b0RkaFF2N0RyZ05VNnJkVzhtUjFEaGlYeTFRWDhvV2lubWJzbU9zQkZB?=
 =?utf-8?B?SXV5VFJjU0xHSDMwem94S1B2QytDVUFsZWNMd2tDWUdaNjdlcEhLNHNHSVJk?=
 =?utf-8?B?ZllkZ2tnbXBLeUFKNVpTKzNmbVBHZEVsUDRIbmtVOHdMSTJ2Z3htZDQxZ21r?=
 =?utf-8?B?MmJ6cktXb3UzQ0FQaUFwYW04WnhqK3JPUU44TSs0TlVNMlBoMHR4WWNXZWow?=
 =?utf-8?Q?OwK1AnsHXtBwxAjbalHdbZ4AdKRWqS8R79ZUDLJfTPjgTG?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB0359.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c019fcb-713c-486f-ff0b-08dad34b5392
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 03:22:50.4340 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoyGthYsMctesZc+Is8IWMpE1Bw3pVEsQfRZ4oMLaCMzJpJ4H0bSWoqHEHeXBrUaoSWXddGSgUA28Q7SW7pkOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR04MB5604
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=327315efa=wilfred.mallawa@wdc.com; helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Thu, 01 Dec 2022 03:23:12 -0000

T24gV2VkLCAyMDIyLTExLTMwIGF0IDE0OjI2ICswMTAwLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSB3cm90ZToKPiBXZSBhcmUgZ29pbmcgdG8gbW9kaWZ5IHRoaXMgY29kZSwgc28gZml4IGl0cyBz
dHlsZSBmaXJzdCB0byBhdm9pZDoKPiAKPiDCoCBFUlJPUjogc3BhY2VzIHJlcXVpcmVkIGFyb3Vu
ZCB0aGF0ICcqJyAoY3R4OlZ4VikKPiDCoCAjMjgxOiBGSUxFOiB0Y2cvczM5MHgvdGNnLXRhcmdl
dC5jLmluYzoxMjI0Ogo+IMKgICvCoMKgwqDCoMKgwqDCoCB1aW50cHRyX3QgbWFzayA9IH4oMHhm
ZmZmdWxsIDw8IGkqMTYpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+
Cj4gLS0tCj4gwqB0Y2cvczM5MHgvdGNnLXRhcmdldC5jLmluYyB8IDIwICsrKysrKysrKystLS0t
LS0tLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25z
KC0pClJldmlld2VkLWJ5OiBXaWxmcmVkIE1hbGxhd2EgPHdpbGZyZWQubWFsbGF3YUB3ZGMuY29t
Pgo+IAo+IGRpZmYgLS1naXQgYS90Y2cvczM5MHgvdGNnLXRhcmdldC5jLmluYyBiL3RjZy9zMzkw
eC90Y2ctdGFyZ2V0LmMuaW5jCj4gaW5kZXggMzNiZWNkNzY5NC4uZjFkMzkwN2NkOCAxMDA2NDQK
PiAtLS0gYS90Y2cvczM5MHgvdGNnLXRhcmdldC5jLmluYwo+ICsrKyBiL3RjZy9zMzkweC90Y2ct
dGFyZ2V0LmMuaW5jCj4gQEAgLTgwMiw5ICs4MDIsOSBAQCBzdGF0aWMgYm9vbCBtYXliZV9vdXRf
c21hbGxfbW92aShUQ0dDb250ZXh0ICpzLAo+IFRDR1R5cGUgdHlwZSwKPiDCoMKgwqDCoCB9Cj4g
wqAKPiDCoMKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgNDsgaSsrKSB7Cj4gLcKgwqDCoMKgwqDCoMKg
IHRjZ190YXJnZXRfbG9uZyBtYXNrID0gMHhmZmZmdWxsIDw8IGkqMTY7Cj4gK8KgwqDCoMKgwqDC
oMKgIHRjZ190YXJnZXRfbG9uZyBtYXNrID0gMHhmZmZmdWxsIDw8IGkgKiAxNjsKPiDCoMKgwqDC
oMKgwqDCoMKgIGlmICgodXZhbCAmIG1hc2spID09IHV2YWwpIHsKPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB0Y2dfb3V0X2luc25fUkkocywgbGxpX2luc25zW2ldLCByZXQsIHV2YWwgPj4gaSox
Nik7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGNnX291dF9pbnNuX1JJKHMsIGxsaV9pbnNu
c1tpXSwgcmV0LCB1dmFsID4+IGkgKiAxNik7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiB0cnVlOwo+IMKgwqDCoMKgwqDCoMKgwqAgfQo+IMKgwqDCoMKgIH0KPiBAQCAtMTIyMSw5
ICsxMjIxLDkgQEAgc3RhdGljIHZvaWQgdGdlbl9hbmRpKFRDR0NvbnRleHQgKnMsIFRDR1R5cGUK
PiB0eXBlLCBUQ0dSZWcgZGVzdCwgdWludDY0X3QgdmFsKQo+IMKgCj4gwqDCoMKgwqAgLyogVHJ5
IGFsbCAzMi1iaXQgaW5zbnMgdGhhdCBjYW4gcGVyZm9ybSBpdCBpbiBvbmUgZ28uwqAgKi8KPiDC
oMKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgNDsgaSsrKSB7Cj4gLcKgwqDCoMKgwqDCoMKgIHRjZ190
YXJnZXRfdWxvbmcgbWFzayA9IH4oMHhmZmZmdWxsIDw8IGkqMTYpOwo+ICvCoMKgwqDCoMKgwqDC
oCB0Y2dfdGFyZ2V0X3Vsb25nIG1hc2sgPSB+KDB4ZmZmZnVsbCA8PCBpICogMTYpOwo+IMKgwqDC
oMKgwqDCoMKgwqAgaWYgKCgodmFsIHwgfnZhbGlkKSAmIG1hc2spID09IG1hc2spIHsKPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB0Y2dfb3V0X2luc25fUkkocywgbmlfaW5zbnNbaV0sIGRlc3Qs
IHZhbCA+PiBpKjE2KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0Y2dfb3V0X2luc25fUkko
cywgbmlfaW5zbnNbaV0sIGRlc3QsIHZhbCA+PiBpICogMTYpOwo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm47Cj4gwqDCoMKgwqDCoMKgwqDCoCB9Cj4gwqDCoMKgwqAgfQo+IEBAIC0x
MjMxLDkgKzEyMzEsOSBAQCBzdGF0aWMgdm9pZCB0Z2VuX2FuZGkoVENHQ29udGV4dCAqcywgVENH
VHlwZQo+IHR5cGUsIFRDR1JlZyBkZXN0LCB1aW50NjRfdCB2YWwpCj4gwqDCoMKgwqAgLyogVHJ5
IGFsbCA0OC1iaXQgaW5zbnMgdGhhdCBjYW4gcGVyZm9ybSBpdCBpbiBvbmUgZ28uwqAgKi8KPiDC
oMKgwqDCoCBpZiAoSEFWRV9GQUNJTElUWShFWFRfSU1NKSkgewo+IMKgwqDCoMKgwqDCoMKgwqAg
Zm9yIChpID0gMDsgaSA8IDI7IGkrKykgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRjZ190
YXJnZXRfdWxvbmcgbWFzayA9IH4oMHhmZmZmZmZmZnVsbCA8PCBpKjMyKTsKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB0Y2dfdGFyZ2V0X3Vsb25nIG1hc2sgPSB+KDB4ZmZmZmZmZmZ1bGwgPDwg
aSAqIDMyKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCgodmFsIHwgfnZhbGlkKSAm
IG1hc2spID09IG1hc2spIHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRjZ19v
dXRfaW5zbl9SSUwocywgbmlmX2luc25zW2ldLCBkZXN0LCB2YWwgPj4KPiBpKjMyKTsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRjZ19vdXRfaW5zbl9SSUwocywgbmlmX2luc25z
W2ldLCBkZXN0LCB2YWwgPj4gaSAqCj4gMzIpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybjsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+IMKgwqDCoMKgwqDC
oMKgwqAgfQo+IEBAIC0xMjc5LDkgKzEyNzksOSBAQCBzdGF0aWMgdm9pZCB0Z2VuX29yaShUQ0dD
b250ZXh0ICpzLCBUQ0dUeXBlCj4gdHlwZSwgVENHUmVnIGRlc3QsIHVpbnQ2NF90IHZhbCkKPiDC
oAo+IMKgwqDCoMKgIC8qIFRyeSBhbGwgMzItYml0IGluc25zIHRoYXQgY2FuIHBlcmZvcm0gaXQg
aW4gb25lIGdvLsKgICovCj4gwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IDQ7IGkrKykgewo+IC3C
oMKgwqDCoMKgwqDCoCB0Y2dfdGFyZ2V0X3Vsb25nIG1hc2sgPSAoMHhmZmZmdWxsIDw8IGkqMTYp
Owo+ICvCoMKgwqDCoMKgwqDCoCB0Y2dfdGFyZ2V0X3Vsb25nIG1hc2sgPSAoMHhmZmZmdWxsIDw8
IGkgKiAxNik7Cj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAoKHZhbCAmIG1hc2spICE9IDAgJiYgKHZh
bCAmIH5tYXNrKSA9PSAwKSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGNnX291dF9pbnNu
X1JJKHMsIG9pX2luc25zW2ldLCBkZXN0LCB2YWwgPj4gaSoxNik7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdGNnX291dF9pbnNuX1JJKHMsIG9pX2luc25zW2ldLCBkZXN0LCB2YWwgPj4gaSAq
IDE2KTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+IMKgwqDCoMKgwqDCoMKg
wqAgfQo+IMKgwqDCoMKgIH0KPiBAQCAtMTI4OSw5ICsxMjg5LDkgQEAgc3RhdGljIHZvaWQgdGdl
bl9vcmkoVENHQ29udGV4dCAqcywgVENHVHlwZQo+IHR5cGUsIFRDR1JlZyBkZXN0LCB1aW50NjRf
dCB2YWwpCj4gwqDCoMKgwqAgLyogVHJ5IGFsbCA0OC1iaXQgaW5zbnMgdGhhdCBjYW4gcGVyZm9y
bSBpdCBpbiBvbmUgZ28uwqAgKi8KPiDCoMKgwqDCoCBpZiAoSEFWRV9GQUNJTElUWShFWFRfSU1N
KSkgewo+IMKgwqDCoMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IDI7IGkrKykgewo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHRjZ190YXJnZXRfdWxvbmcgbWFzayA9ICgweGZmZmZmZmZmdWxs
IDw8IGkqMzIpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRjZ190YXJnZXRfdWxvbmcgbWFz
ayA9ICgweGZmZmZmZmZmdWxsIDw8IGkgKiAzMik7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGlmICgodmFsICYgbWFzaykgIT0gMCAmJiAodmFsICYgfm1hc2spID09IDApIHsKPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRjZ19vdXRfaW5zbl9SSUwocywgb2lmX2luc25zW2ld
LCBkZXN0LCB2YWwgPj4KPiBpKjMyKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHRjZ19vdXRfaW5zbl9SSUwocywgb2lmX2luc25zW2ldLCBkZXN0LCB2YWwgPj4gaSAqCj4gMzIp
Owo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfQo+IMKgwqDCoMKgwqDCoMKgwqAgfQoK

