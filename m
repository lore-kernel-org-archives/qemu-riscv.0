Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNja4-0007C9-CD
	for mharc-qemu-riscv@gnu.org; Thu, 02 Feb 2023 19:05:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=39186c81e=Alistair.Francis@wdc.com>)
 id 1pNja1-00077f-A1
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 19:05:25 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=39186c81e=Alistair.Francis@wdc.com>)
 id 1pNjZy-0005zB-Fm
 for qemu-riscv@nongnu.org; Thu, 02 Feb 2023 19:05:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675382722; x=1706918722;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=w9ALbG/EgkhN7b11U4vXmots/uJHD8L3PURuqDel+pM=;
 b=jzpL2jqGNoMnd274HFwr/HlpWRzyBQ02m9qrWH/Oegj4m0mFsecNft3z
 nlJ3N6pJHiGPz6jxT/JubF0zmHLf8LrpuNud1ccz1NBwlakj1txLW8w6L
 WyRnvmg8IYP6KRhr8u8ngz5ny/hOInu2DHvnRtWfiNStSYl0jY22d9IPs
 3hj7/7S/ZXWplmRBb0GZvHW16kHxP+qsoYbXciKMCy5qHIKyv9sepcZLs
 C0ayU+w7wd35J6vgP2wBbSedF5100X3AgKbczKSqOO+uimroSY9EqowZW
 ehLnnrdAvyWS/O3lRA2ZAKLGFN0oNw8s0VmctdcdpEPs29BIoompaj08Y w==;
X-IronPort-AV: E=Sophos;i="5.97,268,1669046400"; d="scan'208";a="220731781"
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hgst.iphmx.com with ESMTP; 03 Feb 2023 08:05:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y42+av1O5ARBfCb9/aMYyH3eG0UDdBhdaVBoqCOBi/K8dRnH/56ZacdipnrLI+eH/zn/OK+4Ujp8JOkwapjgpr7qDiaRURCwMzuRDb30j7YxVG1zSpdU1+W0h6vmvC/Gw1iiXV7v3n5IoWCgWvjtLpYcSjA3oOJYbKRH54ykHiLfstM3Ir/+AgXrff7mE7Ml3JeepBU7KGnK8bGaf5lFHYyB32MWqq85cDot+Ul7LMJSWTjwCdNjEuD3iEzfFytRU5D27cPd6aRsbhRez0hf0jHDoC4qWofP1feduVswKmLMXUnKqkopkA5pli2jzzdem6pynnvQOpCaNpzYb7wXCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9ALbG/EgkhN7b11U4vXmots/uJHD8L3PURuqDel+pM=;
 b=G/0wVnSc2JUwyi11hPyBSwffgmWRQZVAgwNZ9HNdAok/2VnS6UB2ftzdX3p0ZVFCOM3AqrjUM1igqQTG4ic4PE5TUrWPu7KgvTIwbPzOTrdaI0YEgk4DfH1G54/bX0rdJupHcGBGQFPSdQu71vzdhOhYmD/9+jR0rtvl67lz3VqTrp500SZDpqsPlKCcDyKqQ1DT5CAueN188I+ZWvJk97HNifo44gcLh3yKImyzY+I3cHdvar8AxL22UkFW6bk5Oiuw2grhKAwdQrv3jyBveBguSabJh/8/KzxdltTeu3VOSdBCby4C97vdQnsCIzWuSQzV67tcFRNPLvRTG6WeOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9ALbG/EgkhN7b11U4vXmots/uJHD8L3PURuqDel+pM=;
 b=nwAUHz3YsK2gwlH6lWeJ8jNAK3OMzA/VQTRXZb5/PUZH2gCdeHmOHJ7tjF3FZ0kTFY4mLkM4k4vftS2597lZJBZaAnWqNmHUogT8SUSjiHKKe8yYdoZ+8//r0Of6/2K3Xv34a7rRtVofwQ4fwQ3bfdyOEdccaiTq1pCKlAC/yMA=
Received: from SJ0PR04MB7872.namprd04.prod.outlook.com (2603:10b6:a03:303::20)
 by CY4PR04MB1079.namprd04.prod.outlook.com (2603:10b6:910:57::39)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 3 Feb
 2023 00:05:03 +0000
Received: from SJ0PR04MB7872.namprd04.prod.outlook.com
 ([fe80::3534:2f3b:3e73:759]) by SJ0PR04MB7872.namprd04.prod.outlook.com
 ([fe80::3534:2f3b:3e73:759%8]) with mapi id 15.20.6064.028; Fri, 3 Feb 2023
 00:05:03 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "palmer@dabbelt.com" <palmer@dabbelt.com>, "bin.meng@windriver.com"
 <bin.meng@windriver.com>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "bmeng@tinylab.org" <bmeng@tinylab.org>
CC: "frank.chang@sifive.com" <frank.chang@sifive.com>,
 "mchitale@ventanamicro.com" <mchitale@ventanamicro.com>,
 "abrestic@rivosinc.com" <abrestic@rivosinc.com>,
 "sergey.matyukevich@syntacore.com" <sergey.matyukevich@syntacore.com>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>, "zhiwei_liu@linux.alibaba.com"
 <zhiwei_liu@linux.alibaba.com>, "rpathak@ventanamicro.com"
 <rpathak@ventanamicro.com>, "apatel@ventanamicro.com"
 <apatel@ventanamicro.com>, "dbarboza@ventanamicro.com"
 <dbarboza@ventanamicro.com>, "liuyang22@iscas.ac.cn" <liuyang22@iscas.ac.cn>, 
 "jim.shu@sifive.com" <jim.shu@sifive.com>, "liweiwei@iscas.ac.cn"
 <liweiwei@iscas.ac.cn>, "atishp@rivosinc.com" <atishp@rivosinc.com>
Subject: QEMU SIG
Thread-Topic: QEMU SIG
Thread-Index: AQHZN2MqbK+R7lg+g0yTxTwXPSGGdA==
Date: Fri, 3 Feb 2023 00:05:03 +0000
Message-ID: <d20982479d00087a817be34b470cdd3ab35cc927.camel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.3 (by Flathub.org) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR04MB7872:EE_|CY4PR04MB1079:EE_
x-ms-office365-filtering-correlation-id: 9b78154e-5583-4f8a-eda8-08db057a4c99
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NIZKBrbTbparuUdAlg+ymAEwAJazLTBzjgV8zO1a6ei+R2Lky1LQ77IIETU+1vU5KZBH3QDxF2EJGesjCc4d1fanNzatXeflklI2kYz+j6N7GB1grVWGmHtjvX4pkI1Pa/3S9LaUUypLSmZ39QHW4EiD4bq6mjkX575Uxfihlsl/o4+cUwCpqvc6BX/XZMZVNyUUXONDWl2dFhzjZngc4P9uXqSmHkSTpJ2eCk+2cfqDlkySxkCtob+w2kgUo7VD5a/uNE8wAumvZCDXsBLbpOrR3mOrHo+CVdCOVeA8lM/UO73zHGoFAGtEQljPrZur1REW6VBdS1iYzdr7kAZ9bD8aQX7LQMyFCmlIPEgHc3X0fPnvaOlHFLf6VyxhV/ceXnB8M4dptXJSxXSl0JcXK6G5MmXpwn37rsXNz3qbryExOiFqdMgc1o436XIne5nFNPbGsFCDsiiXUA7xqhSLcB66YDZAzOMuvTCQp8O/et34jsdOhS9Ls3vQ1hbDahXhqVvZBmFkZfN4dRU58QJmoDxqV6+2xgLGpPucbRKBoZP7+gGhBAr2Mr09cVoFQpwAPrHyT+Bpl6XwjSljX0b8PjQC4dXaY3t3l9RzAjmydWJw2DFV0ouqYvc02pRBzo4bSsMMpQKpDxTbqvbOsCDNVNrhqkkGGMxcfYi6YdE30ZSiFHPGVi5NIuIuey6XKMSpOSYMrFuvqyxcBX9NTte9fKmiOCVG2RhFw1C92yaIFA8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB7872.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(451199018)(6486002)(186003)(6512007)(966005)(71200400001)(2616005)(66899018)(54906003)(38100700002)(41300700001)(3480700007)(316002)(64756008)(122000001)(110136005)(6506007)(82960400001)(66446008)(66556008)(478600001)(66946007)(8676002)(7416002)(38070700005)(91956017)(2906002)(36756003)(5660300002)(4326008)(66476007)(76116006)(86362001)(7116003)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qkg1ZEwwZmdJUG9ZV1daWnFDbnpQOUFMR1FFUS96Y3lHSWlXSU5hcThhZU5S?=
 =?utf-8?B?bGQ0T3psekJ0Yk5naExCTVpuUVUyRTFQN0hIekMrZTRZR3k2eXRBNkppYjlE?=
 =?utf-8?B?Rkw2eTRtS1N6REprM0JXOXNIV0l0dHZOdFd6ZGFUcnBBTk11Mm4xZi9hL3hQ?=
 =?utf-8?B?aTlmbnczaW5VYzRtZ1FoWDJKT2RMSklUK0wvMGJqbVNnNzJhaTdQdkVEWXVM?=
 =?utf-8?B?SlQrTTBBbEhNT1p3YzQyTEZvaG1Penk5YlFKZ3ZuR0cza3ZFVHB2R2lmY1NQ?=
 =?utf-8?B?SG5rclhObGpoWEJBRDdweVZkVWQrbUtsc2JxeXFkdVhVbVFxZW5EV0F6MHJH?=
 =?utf-8?B?L3ZZclY2QVl0Sko2MWpuTzhQdjRGNnlvbHUwNmlBak9hRjNPc2hWTGpjS0hj?=
 =?utf-8?B?c0NweWxCUVN5WjZXTjVwNjRLKys4UzAyYkFPSFpDRHpmVmpQSFQ3WXJ1RzVO?=
 =?utf-8?B?Mm5HdHoxOUVQRVhmMlFFL1FZeTVndlhKVG1ZZ3VKUE5tcTFNdDVwR29pdEt4?=
 =?utf-8?B?cDUxZ3MxYTJ3UXFWcjgrYjZydE1KS04xcU44K2FNb2FVV2dtZE9lZFkzd1pp?=
 =?utf-8?B?MFpaZllBNW1aMWFka2Zoa0FMWDV5eWJzaXlkRzExZkhSeDIrdmpUN1IvOUFJ?=
 =?utf-8?B?L2U3WEVUQUMzMm1va0Y5RmVlMm5oTzFER3lLTWtOMjhianpiQTZ6bURpZGNM?=
 =?utf-8?B?aGF3OWV1cUdtZG92SU0zYTJzZkY1THArcEZhVWdTNmUwNG9zc05SaThWb29I?=
 =?utf-8?B?cXoyV2NVV1pPYzJiWUpWTG9VSUdNdDdCbDVON282UHZ2YW1kNmpDNEFCUXJn?=
 =?utf-8?B?SjhjTytXNnFKaUVpb1BZdHZMeFJxOC9kWHo0cW0yRk5FOVRxcTFFUE9xL1Ry?=
 =?utf-8?B?b3pFU3FTUm1wSHE1Qm9lclJkT0N6ZHROU052M09UUGFwank4dzRIZERWUlFp?=
 =?utf-8?B?aStoZFNkSXAwdzRZd1hMNDJTTkpPeThQSU5jMFpvSWJ1UjF4YVpaem81UEUv?=
 =?utf-8?B?N2huQmF2cGVpektjbUR4NWVOUXpXV1B1b0lORHZLZE1iQkZlOG5KQTZMTm9K?=
 =?utf-8?B?NFJLVmU2VUZrSW1sTTVkMmNUU0FMSmNOSGpycmtrd240WDNBRkFua0MzRGhm?=
 =?utf-8?B?Q0t4aGRPZXFIZDlNcUR2MWhMRUR3c2Ird29SaFRMMDc5OTF4UGRYa2dPODhu?=
 =?utf-8?B?WXprc3oxdmk5QVlNTHNSQVlFZUdWRXJuQmFQY0F4bndXQyt1L1ZWTnRaejNS?=
 =?utf-8?B?NnM1a2NURGo1V2lnYW42bUU2aXd0YksrTGI5emIzVHE4eGI0OWNxS1A5dGlP?=
 =?utf-8?B?MlpyVHAzeWxUcHI1VUhQckEvbXBFbE1BQVRaTG9tYUxmSzgyMjhBd1hJejkz?=
 =?utf-8?B?SWN1c1UxWFpsWGFMMHVnZmNJREJMeEdUS1JZTllnMmVjTDVnb20rMlkrV0R4?=
 =?utf-8?B?ejRDYlhvZUxkcFN0ZXByVmVTNmRLWTR2NWJCUEsxeWdMRGpGSTQ2Wm80dVYy?=
 =?utf-8?B?Sm9HOHZTNXVhVUFkTE16VUtrUDhwQTBoU0JiYU9ReGtkeTd4ancvcUE5UCtH?=
 =?utf-8?B?bFlNYXBtU1g5RzViVjNnLzJmd0JiSkMzeVdMSCt5eGFYcDZ0SkRXTEFGa0U1?=
 =?utf-8?B?TGJ0eU1BY3JabStzNDBzR0lLVWZaT2t5UGQ5eVcxZ3dQMGJkd1cxdk54QWdx?=
 =?utf-8?B?a2VFTjNFcCswMnM3ZTl2ZjhkRHdIalpCYW5rV0tPTEJybExhdjhnVVdoUkxW?=
 =?utf-8?B?aWZSazUvc2Q2bkZWNk5oekpVN3pYZEVYZ3BGSGo3L3Yzek5xWmlHU3ZnZWQ1?=
 =?utf-8?B?eWU1NmROaTJqb2pTd0l0ckJEaFpiRmlYbFhiZjRWS3F3SmR4QXYyYWxzWXFP?=
 =?utf-8?B?UGNvNTBjeGI3SDVIMUo2NGtKai9SdVhsTnZuV1phWm5tVkREMUZHemV1UXh0?=
 =?utf-8?B?NGlKeFJ6RFlOemsrVTV2TW5BcklVL1pGSXFtdjJQeTgveEE2SldiTDhpMGdz?=
 =?utf-8?B?Nng3cUZMZDhXaktCT0M3YWN2WmZiaGR4dzhDaXRNMks0TEQyUUJlT2paN2F0?=
 =?utf-8?B?WTZUbWFVcWttbjhlaXFPWGJXM3R0RFU2ZTEwQ3VUWEJ6NEJBK1ozSjRVUGxX?=
 =?utf-8?B?UWxqZDBjREFKemxDRHJBdVN5MGljVnhacXVhb1hvWWE4WWVkMUdsMDdmVzVk?=
 =?utf-8?B?VTV0cnVPSlhSYkV0bHErNGJUeGRiSmZONVFSMkcvejlQMG9VTTAwVkNINHhC?=
 =?utf-8?B?bktTR056dGZZK0xuWFNVd0ZnOS9BPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1DC3F3658EE8674F8E073A2A1B3752AA@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?S283c094anJhalU2Y3pyRDhQcHZLUitSRTFDSkdEK2M2TXEyWktvbDBaa0Yr?=
 =?utf-8?B?RGc5eUNXZEJqVUt1Zk13cXVrNGcrNUw5Ui92enJDQnNla1pPSjZlRUlOa21F?=
 =?utf-8?B?L1RiRTBpV3h1M29LV2tjMHphaTI2Z00rOWcwQ21oV1o4eGdtWjdrT0kvbWlh?=
 =?utf-8?B?UWRhWktRSitsWDJvSzR6YVpPamh2cllQZVdLczZlTS9NSUM4QUlrU0NpekFC?=
 =?utf-8?B?RzBnSDNjUEVXVVo2L3RENlkxWXRvaEJuWXdLbUJKRWNBWENaNEFrdHRFbk9V?=
 =?utf-8?B?UGVEKzgxQmVGZzdIekg5ZkJ1TllvdExRTytyT2lGTTRrckNhQmdITVdsYTFQ?=
 =?utf-8?B?cStTc3VaTzVhd2d1RDhaLzV3WVFSVEVmdCs4OGVWejgzUWdkYmFjZ3R4N2hk?=
 =?utf-8?B?Vk83NVBWdDBYekNtZ0k5dmpqR0tmTGlhTm1EekNENFhQaEtDTTk3NUN0OVFG?=
 =?utf-8?B?ems4allVU3JDaHlFam9mRFJRRkVjMUJkcFVXVlV5VnVlUXEweXl6YlMranBJ?=
 =?utf-8?B?TTRlZnBNcFNadDI3cjFDQkdybi9LaWt4aXUwRmQzY2JxeEtxK0l4cGNOZnlG?=
 =?utf-8?B?SnBzTEViVFJFa3JMK2I0cTdRZHF6VFUyMEdiZDZmMUFpUSsyYWh5T2dzREE2?=
 =?utf-8?B?UnEzc0VDYWhyQnNvRjFCVFlkWEs5aVlUQzRJZW9rTjRzcngyQjhjV2FQNmpD?=
 =?utf-8?B?RU9YaUlvWS82OWRFRy94cnNLQmRVQXhrSExZZ3BiYmZTc1ZoR2dvOFJueGRM?=
 =?utf-8?B?SUlaMnVaZ1R0dnlRU0VLRWR3QUcxc1BFcThGWHgya1hlQ1VFajIwYWxFRjVI?=
 =?utf-8?B?OUVHZ08wTTNySGtGRTRLZFNnb3Rxcyt3WHRHYW1pR25rR2R4djRFYUpYZlMv?=
 =?utf-8?B?V01BaHl1MnVNck9HS1JCUVVBclo2RmpvRWtxZUZrdFlLQ1Z3WDBHT2dZWEFi?=
 =?utf-8?B?T2RqVkJHZWhrUkJVckxkV2RkZnBJUEFxaS9PaDVCbkhkTnowOERqVnl3V3Y3?=
 =?utf-8?B?cnRkOTBab2tWamJJOVQ2VW9hQmM3cUFrNDNZbGM5N21QcHBYb1dPNHBETkRS?=
 =?utf-8?B?Tit0bDJRNWxtNUdwWVJhSGJ6eERhYXNQQnVrWEI0OFJpRDlYWGlSTXlzZmFs?=
 =?utf-8?B?YUp4VU91USswWUprRFZjYldlRk5xYUw0Q09OWk5obDl6d3ozb3I2WjJJRkI3?=
 =?utf-8?B?TWdxNk4rdHB3RlJYMGxzWHpZY2RiaW9iblF2L0MzbGlLQ1FkZjF3NWpOdTFS?=
 =?utf-8?B?eWdrNUVFRlJvZjltZWxUYktpaFZpdCtMRnBPckNYK3JNMTR5SkR4NlZQOEpN?=
 =?utf-8?B?czJDdmZ6OHZKR0RsTGt4QlpSaDE1ZDBZUEZjQ2VySmEvWnh0MmxEYWJLdGgr?=
 =?utf-8?B?aFNkSlpOaUFwUnRMdnNZQ0czNER4OUdsaFY1cUIrcDRUbmU3czJQcW4zYnpa?=
 =?utf-8?B?a3NMa0xUVzZMVGIvSmU4RSt0Y3hOSjVsYkRMMjN3PT0=?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB7872.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b78154e-5583-4f8a-eda8-08db057a4c99
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2023 00:05:03.1979 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Kc7LE1WfwuijFyKV4mnMBYKIEgtC6HVvzh3ITGCmSgwu4j5WTFbDpbzkUEE+fKgeeBfcwAfvCc4mwD3ZQStutJ+rxagJBjBbloRZLPYD44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1079
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=39186c81e=Alistair.Francis@wdc.com;
 helo=esa4.hgst.iphmx.com
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
X-List-Received-Date: Fri, 03 Feb 2023 00:05:25 -0000

SGVsbG8sDQoNClRoZSBSSVNDLVYgZm91bmRhdGlvbiBoYXMgY3JlYXRlZCBhIFFFTVUgc2lnLg0K
DQpUaGUgaWRlYSBpcyBpdCdzIGEgcGxhY2UgdG8gY29tbXVuaWNhdGUgYWJvdXQgdGhlIFJJU0Mt
ViBRRU1VIHdvcmsNCnBlb3BsZSBhcmUgZG9pbmcuDQoNCkl0IG1vc3RseSB3aWxsIGJlIHVzZWQg
dG8gdHJ5IGFuZCBpbmNyZWFzZSByZXZpZXdlciBwYXJ0aWNpcGF0aW9uIGFuZA0KYWxpZ24gb24g
d2hhdCBwZW9wbGUgYXJlIHdvcmtpbmcgb24uDQoNClRoZSBvZmZpY2lhbCBkZXNjcmlwdGlvbiBp
cyBiZWxvdzoNCg0KIiIiDQpUaGUgUUVNVSBTSUcgYWltcyB0bzoNCg0KKiBDb29yZGluYXRlIHdp
dGggdGhlIHVwc3RyZWFtIFFFTVUgY29tbXVuaXR5IGFuZCBSSVNDLVYgY29udHJpYnV0b3JzOw0K
KiBJZGVudGlmeSBnYXBzIGFuZCBtYWludGFpbiBhIHN0YXR1cy9yb2FkbWFwIGZvciBSSVNDLVYg
c3VwcG9ydCBpbg0KUUVNVTsNCiogUmVjcnVpdCByZXZpZXdlcnMgYW5kIGNvbnRyaWJ1dG9ycyB0
byBRRU1VIHdpdGhpbiB0aGUgUklTQy1WDQplY29zeXN0ZW07DQoqIFByb3ZpZGUgZ3VpZGFuY2Ug
YW5kIHRyYWluaW5nIGZvciBvdGhlciBncm91cHMgd2l0aGluIFJJU0MtViB0aGF0DQpjb250cmli
dXRlIHRvIFFFTVUgKGUuZy4sIGFzIHBhcnQgb2YgdGhlIEFjY2VwdGFuY2UgQ3JpdGVyaWEgIGZv
ciBuZXcNCmV4dGVuc2lvbnMpIGFuZCBhc3Npc3QvY29vcmRpbmF0ZSB0aGUgdXBzdHJlYW1pbmcg
b2YgUklTQy1WIHNwZWNpZmljDQpjb250cmlidXRpb25zOw0KIiIiDQoNCldlIHdpbGwgcHJvYmFi
bHkgb3JnYW5pc2UgZm9ydG5pZ2h0bHkgY2hhdHMsIHRoYXQgd2lsbCBiZSBpbiBhDQpBc2lhL0F1
c3RyYWxpYSBmcmllbmRseSB0aW1lem9uZS4NCg0KSWYgYW55b25lIHdhbnRzIHRvIGpvaW4geW91
IGFyZSB3ZWxjb21lIHRvLg0KDQpJdCdzIG5vdCByZXBsYWNpbmcgbWFpbGluZyBsaXN0cyBvciBh
bnkgdHJhZGl0aW9uYWwgUUVNVSBkZXZlbG9wbWVudA0KZmxvd3MuIFNvIGlmIHlvdSBqdXN0IHdh
bnQgdG8gc2VuZCBhbmQgcmV2aWV3IHBhdGNoZXMgeW91IGRvbid0IG5lZWQgdG8NCmJlIGludm9s
dmVkLiBUaGlzIGlzIGtpbmQgb2Ygb3V0c2lkZSB0aGUgYWN0dWFsIFFFTVUgZGV2ZWxvcG1lbnQg
ZmxvdywNCnRvIHRyeSBhbmQgaW5jcmVhc2UgUUVNVSBSSVNDLVYgcGFydGljaXBhdGlvbi4NCg0K
WW91IGNhbiBqb2luIHRoZSBncm91cCBoZXJlOiBodHRwczovL2xpc3RzLnJpc2N2Lm9yZy9nL3Np
Zy1xZW11DQoNCkFsaXN0YWlyDQo=

