Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfW7L-0002jN-0X
	for mharc-qemu-riscv@gnu.org; Thu, 23 Mar 2023 21:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfW7G-0002ir-KN; Thu, 23 Mar 2023 21:21:15 -0400
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfW76-00068T-U9; Thu, 23 Mar 2023 21:21:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679620864; x=1711156864;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TN+6Ml5/ZiuLb8rGfpzlRBq7JHXYLzE0s9BVROMGRm8=;
 b=aAsY0FQ3w3XRc84PQOcb7heQZ88PEio4wDSRgfIOoqXPAiuWzCQmc+VT
 EOEEKUXZYcFSEZiEJyDmQ04hh7QkgqwcdSiBdJQulu0FyGFRhf1onf4Q/
 IelntiWarqoyA27vVeySxUls3Mh7tXFDf1Tv9QXOgp/EL1EP+/QCzY0c9
 ZqkbXQqSDQwm1JX0jjDZiHe/LmfPNhkM8RfEzuSU+6vYnG2NuKBMbImoY
 hfAiU/EH1nEgpREYr0DmTZ+ecHGHYDVrdX4gTneaWYohAagrINZ071qAb
 8X5T6Zvl7guZ5w6br+kHAI/T5tJpzzUP9RRTVDl/bY3Y0nhE8EcwphOHj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="338392347"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="338392347"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:20:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="632654001"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="632654001"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 23 Mar 2023 18:20:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 18:20:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 18:20:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 18:20:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpuPBuHeGUPIQM2HHmxz/Qem5nNHaZ/BvQF1gwLQMUj7q/egsglodkjW06T/CU80yoRfqr2V63Tk+Wnv+mAojaCu3Tsrl8mtVg7ap14GS/ud7tuoVwPZ/01SSpHRpAwazJC02/3/7ukJ34jmbsEOcVwMzyT6qjpsyZk7uGMaeDfaU4uXgYUs8cE6zaf0G865UDJCJWowrtm+8CYG9skULViENqZqK/C3Y/j4J5H1Rlzqwu1ykkGB/bMYrfQgMAu4xKrhwNyiaYZuqj18aw9t+AQHhZtoOyeVOpPnb3ZzLUMgznYZmOKgu9jEaL2JX5A2c3Rt9zA4z5OIsPqlPIgxiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q23vgJgTB1qzK2XwOY4qOhnm4STibWi34yJ+0FQORSw=;
 b=T61+ki39ZU4NSOpVVv2pz5TOo0kyWQn9n3n95DUKvFQk0sY3WCoHpncG/hc3T+xzUbtkBpWsQDcVXzSvalfH5JT6UDswJUc8bfYBi3SjQn+V1hUKtrb6DejiwPKDXYCk9rPaqNwblp2Kcwf5ADWi2SX/T6a7ksK1RMgEuXRO2GBQqtZRQJh1/wHIU/jxATi4xTNyCVI6ZmTRgjKpV0llhOY3nCgITn/g6PdiMnL41XNMvyqCEk6OmOisgDWGx0tONZ7VFPUVYTUc87JObVotn7RCNgglkrqibMrvOYu4KbliYG0G8egKavxNDsoHmQraIny9czqUrkx3iKyYq2OsRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by SA0PR11MB4656.namprd11.prod.outlook.com (2603:10b6:806:96::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 01:20:42 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5%4]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 01:20:42 +0000
Message-ID: <61e3c81c-b2e6-90d8-0a78-24cfe646a747@intel.com>
Date: Fri, 24 Mar 2023 09:20:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 1/2] target/riscv: separate priv from mmu_idx
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, LIU Zhiwei
 <zhiwei_liu@linux.alibaba.com>, <qemu-riscv@nongnu.org>,
 <qemu-devel@nongnu.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
References: <20230323024412.324085-1-fei2.wu@intel.com>
 <20230323024412.324085-2-fei2.wu@intel.com>
 <9423db2e-257f-016d-b404-17d8e5adc0ac@linux.alibaba.com>
 <7db6d615-5ddc-5e1b-1d3c-a85c22e6af74@intel.com>
 <ab0db790-b577-6ffb-a424-7b243b7019f2@linaro.org>
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <ab0db790-b577-6ffb-a424-7b243b7019f2@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0127.apcprd03.prod.outlook.com
 (2603:1096:4:91::31) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|SA0PR11MB4656:EE_
X-MS-Office365-Filtering-Correlation-Id: 21323740-9fe8-4666-f33d-08db2c05fbc8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jZzs0QKx71sEnGlW/RpD3aFTaQNyjPJkjhkYuIewxAOqrfn5lcumaPrg7XKOLxbOGacvLVpoK43Hm7JCMXt/+PJjfWsa7tQ6jNmpHqNEz14KU8XGeXoQV8YXRRWQiCuFb8WgVX9NxaKYpLAfqP96ZkPLN5T/bFsV6+mMVkothqsa1YOIF5wdzA3pQod8iqPaaOc/jmsp9cSYskgl3enmh6QsmfOwFIOZRl+FgVI+tDpIwPLKGJhzZuh0fMLJyaocI+s4bONskKupCzmwTvJ8x69elaOXXPETjdIuXt1CoznvZoqofhBdTG5H3VR7VJBW6ntL/7QWh2pbGGaN70g9uNUSMD3UMGRpgPBSIVqpWLAuWacx0T6fCEr2N3fhhJPxnvkYGUnV9MR7w+8CW/J1SWLnB805wXkJMCO7nTZYmyDqcQEiyhSJlY4nXK7Yn+MerjiYTZF8b1congsrdFoBWq5h9lQ1VUs7k2YRaXRERQWBJLw9v7h61C40rhIj0jJAiVBuWBP+TvjQ6Pk3CNpcPWdF17+ig3vDmFm9gHoy4E1j85qcXbOhj9fypAAgAlcU/vPQeuZamMsK8Ba1h39T6sl0C5B+5jHH4aZF3d9nkKCPOAGkjTp+56huq5JucMtnkhOLzcJJovryieAqSrE9+/s2LigGD6mBd7jO7E7rEqJ/5YLlMumEaWyMZ5ncfEphMLBkNw9ujuip63kAh8GXz4qA6/p0OBr7egeVd9iYInc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(39860400002)(396003)(376002)(366004)(346002)(451199018)(31686004)(38100700002)(82960400001)(36756003)(66476007)(31696002)(66556008)(110136005)(66946007)(4326008)(316002)(8676002)(478600001)(54906003)(6486002)(2616005)(186003)(6666004)(6512007)(6506007)(53546011)(26005)(2906002)(7416002)(5660300002)(8936002)(86362001)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlFzVDNsMDBOQVVxRUN5SytQTUEwUGU0em9YQ0M0Y3VwbFRUS2ZaMFJMR0Fy?=
 =?utf-8?B?K2hlZW5DRWlnMGI5VmVJaEI3S21TdlQzWTlqU3FxKzh5b1crTnA5djFLQXhQ?=
 =?utf-8?B?MktaODNqY3U0MkVPTGowRFM5NFpSY2s0RENqc0VhMXBIbjR4amlNMk5Cb2hT?=
 =?utf-8?B?SktEc2tQblEveTNLc251MldIb0NmSmNObFRTVy9uckNtSEJtMUE1eHFGN0VE?=
 =?utf-8?B?VEo2MCtNTCt3OGpmaXFIR3dGVTN2K0NKeXFFQXU2WlNBMFFYcVVtTm95WmU5?=
 =?utf-8?B?N1RTbmhOZ1o4OVp5Q1NTNTBFaGNPQlFUUWNaUDU3dGxXOHFoZGJWNHNMUnpj?=
 =?utf-8?B?RW43NzBJR2RzV2FzZDYzMExnY3d4ZXRvYjkzRDVqOHZqZWl0TC9HT1diWG1M?=
 =?utf-8?B?VndBTmVpb016T294aHAvWUZKVTFsVzZHajJodyt5MDFhN051QmwvQ1lkM0Zi?=
 =?utf-8?B?ZkF1T0ZUN21Ib21LOU51TjVZeTFYUllDdzArZ0ZYUWdTYm5WeGw1OUtid00x?=
 =?utf-8?B?TlNTbUFmejZHa05xdDkwbUIwK1NFdGl1dHV1ejQ0ZWRwMXR6a1pZNGkyeGhX?=
 =?utf-8?B?djJZYTZaWm5wL0dJY0IxUVhUYjdGM3FTWGNWQ2lYRjEvTVo3UlRJc1VtdGNJ?=
 =?utf-8?B?MGtlN2l5U21Ka3dUMlIwYmUrRUtSYjRMK3N6TlZqZnBEckNnSVlZZkVwcTI2?=
 =?utf-8?B?NWFtSTU5Tld3Z0t5R3FyQzZSOXdIY0RPV2ZKMEZianVsb1YxaEFFRXhnNm9n?=
 =?utf-8?B?N0gxZjUxaU51N1BTWmI4Njlpa3BXVmFUWlluaFZObmdsQzREem0xOVRmQVc5?=
 =?utf-8?B?cWRTNkV3ZURoa0F4V2twUmRjSi8zMVlsNlNvSk94RnpoaUhGRHpjbXlPeDJG?=
 =?utf-8?B?YkQwSnRkRm1iTTMyRFo0WmNkbmN1SWlkNC91eFNtWFNDTlFuaW15Y29PYk1D?=
 =?utf-8?B?b21IZi9mYXpneG9CaHRXVG5BcWhsVHRvQkNhOENCOWZtTy9VbStiUUdpaDZS?=
 =?utf-8?B?TFhZMEc1dkh3emtRUkhoeVNueTU5VzZHMEVySEorTHlBV0VCSW9DWnZKbDVp?=
 =?utf-8?B?Y1Zoc0c5NFBXQlhrZ3hIWmYweGZyT3hrMHNHYmJhVVpraEZENm5YSTJPRjhO?=
 =?utf-8?B?RnZNdjZWUS9lQ0ZhMmx4V0xRVURCV2Y2MFNvc1hvL1VidkZsNWR0Z012ZzM4?=
 =?utf-8?B?SWl6bXJVZUt5YnFYUWphWkxybGpCRVVYVHptdmpOSlNDa1BIdlhGU3FVdWo0?=
 =?utf-8?B?MXdHdmx2OXZ2bmU0K09LMnhnWTFJMmROY3lmSFRCU2dRV3g4SGRURm9OUC8r?=
 =?utf-8?B?azl4VS9rbUFuQkd4SkZVdW1CcFU0K2VOMlNpa0Q3WUJMS2xrWCtTZDh0Z1ZU?=
 =?utf-8?B?Ti9hOUFmZ3ZlVmpXaGxZRG41TUdsMkNkRGhSeVB6ajJXZlZBd0RNSy9UUnJQ?=
 =?utf-8?B?a0hkcldQeTlCZ1pRcUZESWpnVE1PSVVrQ3FOR1RWUTFxd2E0MjFRMW9hSnNT?=
 =?utf-8?B?NjRZNUltU1JRdm5sd0VQdDFwS3cwS0RDQVBOOXp6N2piUDBia3FVMkVaeVNw?=
 =?utf-8?B?b1N6eHQ2NjJYOEpvVEpwSkVEWUgyQU9JZVFtb1o0Y0tGeG8zTnJRRm41N2da?=
 =?utf-8?B?di9mZmJBSTJmVkV6bnVKczVDOFl3eWF4Qk9vR3ZjQndscHMvR1lEQXpWMzhU?=
 =?utf-8?B?VEcvL0x6R1Jhd21WS1NYZXdFd0lMQndseVpjc3V5cXQ5Zy95aC9TMTBSa1lj?=
 =?utf-8?B?ZDBxQ1k0Q1o4TGU2SHIwRDZtdGcwQ1F0dERDQzJYOGt1aGVLdjlBZXlONU81?=
 =?utf-8?B?c3p4ODd5ZWNFNENiUXI0NTRQYzE1Rk1vTHlkRENTUFk4SEpnTGY4QUs3MmdE?=
 =?utf-8?B?M0RkeHpldDArSlJQaW1pR1ZISTlyUENQSUVKMGo3TTU2YmlGUEozNHlwUkha?=
 =?utf-8?B?N1AwMkd4cENSeC93UWJYZjhucDJieUlVNzJXY3E5NnN4UUVCZ25MUm5ZSm11?=
 =?utf-8?B?MWlDd3lvWkxraWttNWpwbXp5WVdnQ0ZJTjYvREZIcTlWUmFyeE1NY2F1SU4z?=
 =?utf-8?B?UDlhdUhaZndZSjNHSVRCbFFEc2FNS0lLT3FJb0ZqelZhazJjRHgvMGdZU1Ur?=
 =?utf-8?Q?4TA5U9fNfbhaTtu4JZergeYny?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21323740-9fe8-4666-f33d-08db2c05fbc8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 01:20:41.7047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zHLHxQs0bQY5HTUJ/hcr8ZVsDnJ4BnBIGfRGm/CoMZUMUXtFFzF7kYqmNKgCgPTM3IYYFUrnEY3HQTU4W+QeRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4656
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120; envelope-from=fei2.wu@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 24 Mar 2023 01:21:15 -0000

On 3/24/2023 12:07 AM, Richard Henderson wrote:
> On 3/22/23 23:00, Wu, Fei wrote:
>>>> +    ctx->priv = env->priv;
>>>
>>> This is not right. You should put env->priv into tb flags before you use
>>> it in translation.
>>>
>> I see some other env usages in this function, when will env->priv and
>> tb_flags.priv mismatch (assume we have recorded priv in tb_flags)?
> 
> You are correct that they should match, because of tb_flags, but it is
> bad form to read from env, as that leads to errors.  Since you *can*
> read the same data from tb_flags, you should.
> 
I lack some background here, why should tb_flags be preferred if env has
the same info? Then for reading from tb_flags, we need to add it to
tb_flags first.

Correct me if I'm wrong. The only strong reason we add some flag to
tb_flags is that it causes codegen generate different code because of
this flag change, and it looks like priv is not one of them, neither is
mmu_idx, the generated code does use mmu_idx, but no different code
generated for it.

I think here we have some other reasons to include more, e.g. reference
env can be error-prone in some way. So there are minimal flags must be
in tb_flags, but we think it's better to add more?

Thanks,
Fei.

> The read of misa_ext and misa_mxl_max are correct, because they are
> constant set at cpu init/realize.
> 
> The read of vstart is incorrect.  The TB_FLAGS field is VL_EQ_VLMAX,
> which includes a test for vstart == 0, but the smaller vstart == 0 test
> is not extractable from that.  Thus the usage in e.g.
> vext_check_reduction is incorrect.  One would require a new TB_FLAGS bit
> to encode vstart ==/!= 0 alone.
> 
> 
> r~


