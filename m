Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pvpz3-00027N-1V
	for mharc-qemu-riscv@gnu.org; Sun, 07 May 2023 21:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yong.li@intel.com>)
 id 1pvpz1-000272-5c; Sun, 07 May 2023 21:48:11 -0400
Received: from mga07.intel.com ([134.134.136.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yong.li@intel.com>)
 id 1pvpyz-0007JV-0W; Sun, 07 May 2023 21:48:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683510488; x=1715046488;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UV/6n6Lp+pkc5jgNbNwk47LRceEs4pE+auJNIcRfw20=;
 b=dS9dllKLzP6Weu5hFLZoV1iVIM6kYWdU+06bTKxi4pK83lXBcpR/AyKx
 FjZfeDEFhSi3tg4CuQ5Lff3UoYemBdiNDC4dYoIa4L/GHaX3zgA8b2gHr
 CtGt1cvdPoZoMS5lnbCiPYAzS8npAqaeCS8046/Dt/Bl6cNibAdXltCP1
 urTo4j1ChGMP1i1JWNAAMcCYTp4WDzgDEmh/MY5nkY0VqDTY+dvpfWIgN
 kRWVt4J1xFAp7OD5qtFARS6CndzIKtKblN6G4ipNnQbhrY4RR4HHcpae6
 fI1TM5cNupOZwV1Az9+Pzl1lVOCwpBvImk3hvWE52WEJDsRrgD/KZTNtQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="415088333"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="415088333"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2023 18:48:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="675881901"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; d="scan'208";a="675881901"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 07 May 2023 18:48:04 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 7 May 2023 18:48:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 7 May 2023 18:48:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 7 May 2023 18:48:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 7 May 2023 18:48:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+IK/SJg+IhetNaJ+78uNEgO0RU+D648bGOZuGnl4QtCJhAXKd3zUIIUDCRF0AFMgZ2tMAuGfFQDMUuH2EIZgdOW0fa+via+pqk4YVF/jNpRSaX2yw/VDmf7W9TFu3LdRCZHafc2O34sv/uqlstQjPTBLhx/hPrHY8jFJTU7zMD0DhJhPdJPh5v8viqy+x99oiTivGt/HLjgaN5pCnGHYrWkDmGK42+kA3V0tQNiFwvGDLmST+AEo/TiVwnIIwhvAhFsmlZiBIVIy1XT3ISlCwuYxzFuqD13NBPl9fU3QJ/SsoYY240viK+1RVqr/y2k/NrG87RY0IUsXu2S7Q5MSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlZq087l45vqrYiYjxv7cWZ1jxsz9CzlhQfNAVok+D0=;
 b=TDjaiOJQhMFs43DbuijM/gGDKZiCdn9LNmKNL+XAbqq/dTGmkGJVmO8xrVe1V8uF9X1lpAlodD3yFsPejreRuzdX6vETQTTLOa9d3JuaQRR9Nm5pumWjyR9nRjCypzZNPBLTlFcT7ekbk7cbAHv6n7/4wCMYKBe+4XXap5h6VuUj/26JW2ntTIWbM46IV8p8HmIvesHoTu+MueUNg6/lM+yOKXjCAdwc3smMPxdeWse2z7cxwgqF7UTi776qjqdoUABGbLj7TyW52gWWDZgjnGMufkAJVZHa73uKa1ktMDrNakKogrs5fSUAHtKxBi0PJA8OplkZIuyysLVth5mzgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3861.namprd11.prod.outlook.com (2603:10b6:a03:18d::13)
 by PH0PR11MB5173.namprd11.prod.outlook.com (2603:10b6:510:39::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 01:48:00 +0000
Received: from BY5PR11MB3861.namprd11.prod.outlook.com
 ([fe80::857e:35a2:3afb:d9a6]) by BY5PR11MB3861.namprd11.prod.outlook.com
 ([fe80::857e:35a2:3afb:d9a6%5]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 01:48:00 +0000
Message-ID: <8cea83b6-38eb-88a2-2ca5-fef6e67df75c@intel.com>
Date: Mon, 8 May 2023 09:47:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] hw/riscv/virt: Add a second UART for secure world
To: Alistair Francis <alistair23@gmail.com>
CC: <qemu-devel@nongnu.org>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, Bin Meng
 <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, "Daniel Henrique
 Barboza" <dbarboza@ventanamicro.com>, "open list:RISC-V TCG CPUs"
 <qemu-riscv@nongnu.org>
References: <20230425073509.3618388-1-yong.li@intel.com>
 <CAKmqyKPOuryjYD=c=aJ0n0hfSx29HebGsyKwwUUa9U0GpfwOxg@mail.gmail.com>
Content-Language: en-US
From: "Li, Yong" <yong.li@intel.com>
In-Reply-To: <CAKmqyKPOuryjYD=c=aJ0n0hfSx29HebGsyKwwUUa9U0GpfwOxg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To BY5PR11MB3861.namprd11.prod.outlook.com (2603:10b6:a03:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3861:EE_|PH0PR11MB5173:EE_
X-MS-Office365-Filtering-Correlation-Id: ecd8a2f8-875d-4965-4635-08db4f6640c9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oXB5CO4E4X7ZG+Duyjywm6fVARJvzXFqmTZRFaYdKrS8rVSayfr7Vbevn7qiU/xOMub/kukfTEVM3dgkfD31IQ5ECHnkOeKINB2MxHOlDaeHk79et3dVIDwhI9cUyokuQ2+yaKVNxoQOg2zIcpUFW8rrVaPOzvFY312TILSn+caqSYFX49jwPm21YkqQ5rU2Y+5bwEUKLAcRVtbGYDFEGntB7Pq7u0G6C/+57nJdm0T50Q/JjYzDy4mYTsF5Brina07qAOki+WpYVIddZu4cvvR2vXWYdp3pPTUbuEWPtSGonZxsvzHm5hCY5iz4PzIBhfAVtC6hgarWwyeObm7QmvosTVZ7ISgN+nnlK63bkPKcey3UezA0VZKeUZpyP+p4Ce5PuWoTABmXYIcemIxXSyOvV9NHSXBKwrMfJKrLV5f4F70TyfPY5BeiNLNay3fCQIBmHWlxMpc4K4qmt2QFR0z7N3F5BoeXH2uqSyw2V7ywazwa41A3R0u23i3YbXXurDs5/S62K5UUhOLbOjZOOWYMvvV8M/ylq7BtpOE1oRjYFdmCvXX98BpaWvCNKuCuc/K40aHKWxatLX9l6EhRRqsVW7m2yV3TlkTnHrM6ucTasHq2Y3srE3F/6ljfvN9iFSRLVjdRisMF/K1kDfAUoFyS1BMMygNGOQ6G4XjI0Ich3WHo0wjsY0dqyu04XJQO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3861.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(136003)(376002)(396003)(366004)(451199021)(83380400001)(66946007)(66476007)(66556008)(2616005)(6486002)(53546011)(6512007)(6506007)(26005)(966005)(478600001)(54906003)(186003)(6666004)(2906002)(31696002)(5660300002)(86362001)(7416002)(36756003)(8676002)(82960400001)(38100700002)(6916009)(4326008)(41300700001)(8936002)(316002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTJPVmxjbkRuUnkrUDBXWDdiL2tuWHByRTZHakZ5Sy9scTdVWURvSnJZbWdm?=
 =?utf-8?B?VXMxSDJaS2R0VHFRbzg0M0xoYnFQRm9QL1JDclZTaThjbUg3MVJCTXBLY25p?=
 =?utf-8?B?bXRVcUVRaFFqdFl2U1djZCthMWVXN2NZSUNkb3ZoYWFudnltM1JlcExVbzRl?=
 =?utf-8?B?YU4yQUVsRGFsUVdQbDRtTWcvRWR1K0RsMm4zSWlUbzhKVFU1cE12ZktIa2h4?=
 =?utf-8?B?cXQvdUpyT2xrUEFUNEo0QUJZRllidGxXTXdadDhLL08yQk5LNDdKZ0Nob3B1?=
 =?utf-8?B?MnBOUjRMTUlFVFhrQ1hLaEx0UVVjczVrRTJSOTdzQUdLWFBFZTZpa05ldnNh?=
 =?utf-8?B?cUFJNG5KY1pDckszbXBkNFozQnRjTXZJcEU5RjlUY2I5OGVVTkNYQm5KVDVr?=
 =?utf-8?B?ei9UY096OUFvR1BwWmVxcWJsU3kydEtIZmZNbmFDZGIyMDFaUW0xdU1pZ2Q3?=
 =?utf-8?B?aXF5eEE2NFNiNHFUclZpUjczYXV0Zks4SWUyNEJMMzY1dmRYQmN3RlhlSk9t?=
 =?utf-8?B?dHZSU0d4bzdqQzE2QmtGNVphM1NSRWNCaVhDZnFPVlZEY1RmSXM4dTZ0L3lr?=
 =?utf-8?B?THEyaVZ2ak16NWM1NzcxYUlYcjZCMmljdER6UWRLVlpEL1plV21DaDFlNXAy?=
 =?utf-8?B?Qm5oc0o5Z1lDQmZqdGxTdlBtUUN2cGFRYjNGdEVFdnExRk1IeGlDVnBWa1N4?=
 =?utf-8?B?ZEpXMVVZUlN6a0Y3TmhYNEJGREtoUDJ6MVRuUmhMR2RmMXBFV292MTd4RDlD?=
 =?utf-8?B?WVF3dzhyY1Y3U1p3QUtSbitPT0dZaGZQTkVkMGEzN2pERzQ3RXoxTlVQNEdn?=
 =?utf-8?B?d29YMkZRcDJ6TFRycm80d3Q0NHVVU3pCZ1gxNFR1Y1Z6dDcvV2hYWlpYNnpq?=
 =?utf-8?B?djFKTWkrdVlvOStzZ2wzZC9PenkxdTVQc2VTNTNIcEN3UHZSTmQ3ME13RzZL?=
 =?utf-8?B?dmk4a3JGRTRsV1JEZ0d5d0RQTkpjdVUxMmo3OHB2RU8wRUJKcDZXWHRPMmx0?=
 =?utf-8?B?WGRFY3VWNmZ6YzJWZmVTWmxnRE9KVk5kNnNzZlNpc3FvMmZPNDZQQ0ZZTEVh?=
 =?utf-8?B?TWIxWWx3a2p3ZkdQczNEWkFMUE9vZHVrZVVwcUdPUThtY1Z1YlJPSGh5ZHNn?=
 =?utf-8?B?eXVLU0NSck5jOVI3VEJrUG14eXVUcmNlRDkvRHRJOWo1ZkFwSmhVTWxwRGp5?=
 =?utf-8?B?N3JEajRvbkFjeGM3MGo4NEpJeHA5WVVVWmdwZzRtMTZ4TzgxVFNBczdMdERu?=
 =?utf-8?B?WGNSSWpDeUpTQStKdk1HSEIrbTFmVjF3NnVGSVNUY09ONmQyc0RFak1seDNr?=
 =?utf-8?B?SzliOGNzVlJMT0wwWXFKTkd4OXo4QWNmcHYrNTcreU5OcnFZZ3pobHM2aG9F?=
 =?utf-8?B?QmxudmYzSE1IbmF0OUNQUURXSFA1bVZTV2h3NDRmMGJwVzJseGhWem5hV0FR?=
 =?utf-8?B?MFBkc3JGcmRkVmE2RklFWGg5aG1sa0NEbHdON25PQXloQ1IyQU5KVHdVMldk?=
 =?utf-8?B?d1ZnVEY3RURGc1psSy9QbzRKcmM4emF1L2Nvajd2S1RtM1g1WDA4RGdlYkc4?=
 =?utf-8?B?UHdWc2ZuTXdlNjlWVERUY2NaZWtlWkoyTDFlb1RzWTNzK3hiUUIrallya0tR?=
 =?utf-8?B?emV0SGJoZG82SGNIVWt6UmtQclA1Snh4REdHc2FHdnN3aThhd3QyTzluckhj?=
 =?utf-8?B?VUxxbjVweFhJazI1YnpJRWc2NUJyWWMvWDY0cVNLTVl3WWxUZXRydlRDeEtF?=
 =?utf-8?B?WXpTWE9CTmpqNGFGbk4xNURydnlJZXNQWXNrT1MydWZQcE00bmY4Zm0yd05I?=
 =?utf-8?B?bDlYR0x3OTl6dWM0Q3JKS3c0R0VMRld2QmpXbUp5WlNFeURoSnJ1K1F6N1l1?=
 =?utf-8?B?QlhEdnlVa0FVTksxQ2h4TWZEQmc4VjJ0NUpBclo2dFJWN0txY0ZNNkRXbUt1?=
 =?utf-8?B?U1dtZUVYL0NNSzdEQ2piNVBXakpIUFpSSkhRL3ZDZ2VqV3R5aWdsK3NVU0Rs?=
 =?utf-8?B?Qms0dHJDZlNVV2l4TjNwQU5BY2FEeUtBQy9vZzIyRWVHd25VYTdsTmt4NkJJ?=
 =?utf-8?B?SzlVYkJMOE1LU0xOWHpmNWk4a2dvd2toRkQwaStXYUFmQ2ZMVEtPS1ZSUGQ5?=
 =?utf-8?Q?2PrpDMIVpi+PILTzffVIXvqAI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd8a2f8-875d-4965-4635-08db4f6640c9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3861.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 01:47:59.8462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEMMoyvC6D0FealkT+lSKTti4uPjZWQMVRhlhw6ZS0soDbHETkxwNphnnyrdFR31WgS+UfF1ppcuDsW2IjH25g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5173
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100; envelope-from=yong.li@intel.com;
 helo=mga07.intel.com
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.964, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 08 May 2023 01:48:11 -0000

Hi Alistair,

Thanks for the information, what I'm doing is to implement the 
StandaloneMm and secure boot feature for RISC-V by following the ARM's way

https://trustedfirmware-a.readthedocs.io/en/latest/components/secure-partition-manager-mm.html

So here what I need from virt is actually the VIRT_SECURE_UART which 
will be delicately and isolated/used for secure world like it is in arm 
virt

(the isolation could be controlled by riscv worldguard feature if qemu 
will support)

Similar definition in ARM virt is 
https://github.com/qemu/qemu/blob/38441756b70eec5807b5f60dad11a93a91199866/hw/arm/virt.c#L142

I guess the secure uart should not be pass-through from the pcie, it 
would be more reasonable to make it a dedicated one in virt.c compared 
to the UART0 in normal world.


So sorry, I did not know the background and did not make it clear in the 
patch (it is not a second uart for normal world usage for vm, 
application and etc),

It is an UART for secure world. I guess I can re-do the patch and change 
the VIRT_UART1 to VIRT_SECURE_UART  to make it clear.

Please let me know if further comments. Thanks so much!


On 2023/5/8 7:05, Alistair Francis wrote:
> On Tue, Apr 25, 2023 at 5:36 PM Yong Li <yong.li@intel.com> wrote:
>> The virt machine can have two UARTs and the second UART
>> can be used by the secure payload, firmware or OS residing
>> in secure world. Will include the UART device to FDT in a
>> seperated patch.
>>
>> Signed-off-by: Yong Li <yong.li@intel.com>
>> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> This has come up before (see
> https://gitlab.com/qemu-project/qemu/-/issues/955) and we decided that
> we don't want to add a second UART. If you would like a second one you
> can attach it via PCIe.
>
> I think we need a really compelling reason to add another UART. There
> was a push recently to move more towards a "PCIe board" where
> everything is attached via PCIe, and this is going in the opposite
> direction.
>
> Alistair
>
>> ---
>>   hw/riscv/virt.c         | 4 ++++
>>   include/hw/riscv/virt.h | 2 ++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index 4e3efbee16..8e11c4b9b3 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -88,6 +88,7 @@ static const MemMapEntry virt_memmap[] = {
>>       [VIRT_APLIC_S] =      {  0xd000000, APLIC_SIZE(VIRT_CPUS_MAX) },
>>       [VIRT_UART0] =        { 0x10000000,         0x100 },
>>       [VIRT_VIRTIO] =       { 0x10001000,        0x1000 },
>> +    [VIRT_UART1] =        { 0x10002000,         0x100 },
>>       [VIRT_FW_CFG] =       { 0x10100000,          0x18 },
>>       [VIRT_FLASH] =        { 0x20000000,     0x4000000 },
>>       [VIRT_IMSIC_M] =      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
>> @@ -1506,6 +1507,9 @@ static void virt_machine_init(MachineState *machine)
>>       serial_mm_init(system_memory, memmap[VIRT_UART0].base,
>>           0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART0_IRQ), 399193,
>>           serial_hd(0), DEVICE_LITTLE_ENDIAN);
>> +    serial_mm_init(system_memory, memmap[VIRT_UART1].base,
>> +        0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART1_IRQ), 399193,
>> +        serial_hd(1), DEVICE_LITTLE_ENDIAN);
>>
>>       sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
>>           qdev_get_gpio_in(DEVICE(mmio_irqchip), RTC_IRQ));
>> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
>> index e5c474b26e..8d2f8f225d 100644
>> --- a/include/hw/riscv/virt.h
>> +++ b/include/hw/riscv/virt.h
>> @@ -74,6 +74,7 @@ enum {
>>       VIRT_APLIC_S,
>>       VIRT_UART0,
>>       VIRT_VIRTIO,
>> +    VIRT_UART1,
>>       VIRT_FW_CFG,
>>       VIRT_IMSIC_M,
>>       VIRT_IMSIC_S,
>> @@ -88,6 +89,7 @@ enum {
>>   enum {
>>       UART0_IRQ = 10,
>>       RTC_IRQ = 11,
>> +    UART1_IRQ = 12,
>>       VIRTIO_IRQ = 1, /* 1 to 8 */
>>       VIRTIO_COUNT = 8,
>>       PCIE_IRQ = 0x20, /* 32 to 35 */
>> --
>> 2.25.1
>>
>>

