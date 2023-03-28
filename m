Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgy2j-0002ZB-By
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 21:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pgy2h-0002Yj-Lg; Mon, 27 Mar 2023 21:22:31 -0400
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pgy2e-0007MO-IP; Mon, 27 Mar 2023 21:22:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679966548; x=1711502548;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1bMobXm2apqWGlF7jSNrdZHNLTuvUpmXHiDR4uJ/XcA=;
 b=D3t9jZu3AlTsa4jIXu6UdwxG2yNgwf488Ik7Ru/p4N3OShZTEwuJCrtM
 y6gkJPGwBU6L8/GXsyOjaEpB7a19cwvLG8OySSScR+YpwuDZoXZPLwsYv
 VWyfNvNkgHazKaWnMbXA5QFmnVGf6uvz18YWfkTxFVPUYU6sA24d5mJIU
 1RonSu09O77vPA/gsyRlDF0QnLBfDVW0CWfduWxhPGTxCPZMFNBAo6rdR
 M5fa0jbN/u32x97WYpJcdoa5Qf4wobuYbHasQXNaOFN/ZXcg2Q/ObpEVr
 ECo8xJBaSkhxtizEBNmu905Kc2fUYOD8i/mJc52D+hipQJPop0FFCgtvH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="320838975"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="320838975"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 18:22:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="772940268"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="772940268"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Mar 2023 18:22:14 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 18:22:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 27 Mar 2023 18:22:13 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 27 Mar 2023 18:22:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YqfmugSH1f0seJwIkGJw/SBoBZYDd6SA+1ABMbGHaoTTOLgbNPKWL1BKESchRnza+S7999e8nS8khbmRY0Mw6LofaBpObr3UJ8LtatWtLwaHm7Y34x7JL+rTbTZu+qy+DIxPwHUKKPbG7EpWdyXI9DVDsK01hOFVdSB7eMUys5eoWlxgJSiZggdE2jGP6L1k3QjUb70GsUBHfvVdLOyW/2cujc1sKT25PHkwqsgPAfa48Dd2/2cB+97Qg9+mtgwtlpxoBcVSuizElXClmqHUlmrqpCvN1qI3ZTxYg9Sw+fFjzUj2ep1c0IwsJqhOx7cTCEtyHN0aYugn+zx1myxNxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nsh4LyhVriOWXTVgBksXsEl7EEH9T2a/9tslaIh4NI=;
 b=QMM1TmzkiVRxQrsYVKrkcSn1QcH+qI4zM5ov4TfUWEuMB61B3nsVES6RzYdjSSNq/ABnuYFVrKxPMRxh5tBYbsz3tIrt9l3YD8bL38k+tVQ1jud6QKiKcFz55RbQtbSIzUbNHX8MvKVD/nW8HWTmdmfELjMWHrqp/t5cj0C5JV9hlzlfi8wkujWmrE7LtwwQo6gePtZ0EJyeIvfeRVNJ3dPW7jHHDfO2saJ1Gs4GKU8IIlcZHbXNQ/KD/n/VUrrsRSOqHdl0m8mHQ71JVC/7p4R4kRSbTj1NJ6mbQqR185y6cNUwEIw6NLLEV3lfdfOsRI70YF6F8HlWVcYag3aOGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by PH0PR11MB5128.namprd11.prod.outlook.com (2603:10b6:510:39::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.29; Tue, 28 Mar
 2023 01:22:11 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::cf58:e1db:41d4:ee3f]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::cf58:e1db:41d4:ee3f%6]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 01:22:11 +0000
Message-ID: <74eaedfd-73ca-002c-f6bd-6b74628ef5ba@intel.com>
Date: Tue, 28 Mar 2023 09:22:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v6 00/25] target/riscv: MSTATUS_SUM + cleanups
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Richard Henderson
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
CC: <qemu-riscv@nongnu.org>, <alistair.francis@wdc.com>, <palmer@dabbelt.com>, 
 <zhiwei_liu@linux.alibaba.com>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <e36dba97-c182-c427-e051-2a8d1cfe96a8@ventanamicro.com>
Content-Language: en-US
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <e36dba97-c182-c427-e051-2a8d1cfe96a8@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0169.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::25) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|PH0PR11MB5128:EE_
X-MS-Office365-Filtering-Correlation-Id: 590d3cd2-4634-461c-2809-08db2f2adafa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2K13qu+WdBELxVAXspuhOeDz2Duonu+wMlAamFqGAn9gxcL+zqv1VL11t3AGB2X5JiLmWYK7GaHgCPq7/lJxOVGh97vCqz/P6Rvg2MG4X+eJUCGFX69+yn5ARgvkl9UgSkE6vzPN4DoR3kYA6ySPr3momenXwexex/Tgd5nHnwD1QFrgQdcp5H9ZBgdmBn4E/kh9jpPr6z/phbVV9RsNY9B05D3wUjvMtHDa6lpgLITcHjXW11oBlQWfVi0Qu8tqwO1TPtmrIy8jjLPg7bRU1PkpfjYoYHLeYWaQMo4pTtmu+bbU7TJgt6QvFaHvUoLB1YjYyaDYMV4MQLUOa4MGFYZSfr8tsuNvzS0tEzW00T3TH4PgscX9b7FhNSb4U1lQfBZ/jFqhlaNOiayC0P0pR7udKZpLTxRiU7+mPGAwwCgOwfZQiTPxF5j4uE0F3tO8ZbiP2hiqMnYoYW3oJSGUvdgWN9f2iewIqBlCoJHdF+Bz4FGbxPQJlmuuhba88RPgLJx3uZ21HfkvWesQzSMAKbahhgso+ztEt8g0MpawW2RJlTpvfqaFpblbzPteBjpHxn8nqghI9uGtkI9/Aq6i8NaWNzH2ZagmCZcTLLcU95jDJuWWt5eurka58xdQbDG/A7rm1qy26mTvm/Sx1WtVaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(39860400002)(396003)(376002)(136003)(451199021)(31686004)(2616005)(83380400001)(41300700001)(31696002)(36756003)(86362001)(5660300002)(38100700002)(8936002)(6486002)(82960400001)(478600001)(8676002)(66946007)(66556008)(4326008)(2906002)(66476007)(6512007)(53546011)(6666004)(6506007)(316002)(186003)(26005)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzNCbWJJckhPQU9hLzZ6M3kvY05YbGZFZnF1aUFyWXJtcDBrb1RXNlRxNkFM?=
 =?utf-8?B?dXN0WHBXNm1YQmpOcE9CWkpKK0pORzY2VEdJL2FJcXkvUk5VQ1V6MWNmdDRT?=
 =?utf-8?B?UlFUcVRXVkRJTjJjK0JQc0ZwSnl3NEc4T3ltcGZNSVRVcys1NEFZSlZxL2ta?=
 =?utf-8?B?Z21TNno5RXluQ3RNQXEwdXpXODV0U0R1OVVuMkc1WFNhaXJQZGYwVUNCM3h4?=
 =?utf-8?B?VlN0aDIwd0R2ZC9jYjJGb0xja3RwNWVBcktMRDBqOXZTVHJlZXgzQW5yck1u?=
 =?utf-8?B?RWg4MGpRR3lmRjBDaE4zVjliOUV5dGxOUUY2L3V2cW9jNHQwcEJ1eWkwWnJn?=
 =?utf-8?B?eFNWV1JWRk0rYmtEeUR6NVQwTkdqQ3RpTjhKbHFILzRacm8vOEVaNVU4a0JJ?=
 =?utf-8?B?MVZBRHRaS291RUkyQXJkeUJlV01NVUJCdlZCR0tqQWdNeUxaOXdjK1VSQlRF?=
 =?utf-8?B?YWV0dGMwQVFqUDBEQWZSNEh5bWIvTXBmVU81TDJvL1VBODhSMTdDM3pJamVG?=
 =?utf-8?B?QlJtVXNFcXRXbkwxMVl5K1I1OUxRWEhRWUlSS0VYeUo0RzY4K3V0bU55VEF2?=
 =?utf-8?B?ZGNJUG1oNFZUd0ttR2RzbkRWOTBpVnZuNURKTExoSFVnYzltcDg5NmVIVXFL?=
 =?utf-8?B?dWE0cDZBUzNqQXRrcE5HUUptYVpYYS81RFRvN01kZnAzeE5ZYUpWY1l1VDVi?=
 =?utf-8?B?bmE0aW5FeGlQbUZYWDdCYWJJbVFQdTJyc1Vvd0o5L25SOU1zVDBLbG0wUExZ?=
 =?utf-8?B?TS9obkJSTTZpbE1qNkNhb1ZTNEJsc0F4RHhiVXdCZWN1YWFPUVV2alJlNTVi?=
 =?utf-8?B?WDFFRXUvd0EwQlI0aVM5dm9CNW5wci9DVmpYclZqREJSUGFNZHJWNVpCK0kr?=
 =?utf-8?B?dlZPZ2hGa1JYQVpXbGxSVGhsTUI2TWt3QjVCMXNQaGVLMGhlQWtBL2dqVGRo?=
 =?utf-8?B?UjJaZkJNb1l3Wnpmc3dJV0U0Z0o2NjRUMlRFMXROcFRza2MwQVo3SmNObG4y?=
 =?utf-8?B?em9MR0pEY3ZlZm9OZVVrQWdOZWc4aUx2ZnRFSTFXRmFaa2phajJhcmt5K0RZ?=
 =?utf-8?B?ZGZGeXl0Y0ZlQnFjemREU2g3bk1MVjZiWm1FNmtLS0s5bGdTc2toMWZ2aFVy?=
 =?utf-8?B?dEZiTk5HQ2pUb1N6UWZWNlVld0xmbU1DcnAzYkN4YjdpZFdhSzI3MFRKMERr?=
 =?utf-8?B?M09ZV05rOWRtcTF2U24vZTdQRUVhdm5VNjNqbUt2Qko0NHMzVnFJcGhmWTVE?=
 =?utf-8?B?cDFHeTc2Y0VmRjhmSnovcDZwNDhob1hKOHUwdXcyWXQwb0svNmROL3dzNGx4?=
 =?utf-8?B?SjVDTlF0eG5wSFhTSklFUi9FNGtWbm5ZQUU2dkZ4SWQyT1k5ZVJKVUNnMTRh?=
 =?utf-8?B?T1V5M2gvNkFkQTJFb1lDNVFlaDJmUjZuMU5GWmdPcUk0eTI2UEFvMFlFL2lX?=
 =?utf-8?B?eTNNcWF5ZE5MbGo5UGxiVElBSWhubWRYdGVLeEpzOFdSTEtxVDFBR2xlblhk?=
 =?utf-8?B?bUs3cXNZMGU4NEFYNEQ2dTM4R2RLbE5GQ0pEbWRueVQxMkFiK1pHTStMNXBM?=
 =?utf-8?B?anJJeVphYndpMW1tMk5WQllUd2JQazFiZjg4QXJuSHI0Z09RVzdONlVPZFhT?=
 =?utf-8?B?UW5nMWNIcTBVTmJrcGlMQmZJUnhhYXM1SmRMNmhxUjR0OS9lRzdYVEJwRmUr?=
 =?utf-8?B?OTNqdTdNdGlIYjBrS0IvckcyRm52TThWY0VFazFlQVRwSy8zc2U2a0MvNWFy?=
 =?utf-8?B?OVloaW4vQ25ZV0VPcGVVbHZlVTVrSllIWmh6SXpCa0Y2TnJmMWRJNGI5NmR5?=
 =?utf-8?B?NExhby9vNVVSRkFOUWRpaHVtdjluMFNwSUNvanlrS2Z1MFNPeDhRVUl3OWRm?=
 =?utf-8?B?M01NSEoxd1RLL0VEVE9UbGk2K21VUW5uSlVDTGMwU1VaMXA0a0wrVm82OGF0?=
 =?utf-8?B?NWRhSkU4akh3K3dlUjlnS25tQmo0U2ViSVRzNCs2NWl6cGx5aEN6WlZZMy9P?=
 =?utf-8?B?V3A4aGI3d3NtanBoUGNzcG1KbmYrM2tkRHAwelcyaHBoK0ZTaUptUHN6Y3pO?=
 =?utf-8?B?akY5cUpIT2tJbW9SQjZVN3pIMGtBcTRnRkFSWnBhbFpjODB5S0djSnl1RXUr?=
 =?utf-8?Q?9F0yG/x7qb8YeT1rkNTgF2dlf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 590d3cd2-4634-461c-2809-08db2f2adafa
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 01:22:11.4734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWCTYAyVjPDITkKBoON3d+tgVfWqnbhVG6fjgFdBoTfT4GvNgGCRzhgPP5+sapf91vUulmSPYgMXPzKCvgTi/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5128
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.151; envelope-from=fei2.wu@intel.com;
 helo=mga17.intel.com
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
X-List-Received-Date: Tue, 28 Mar 2023 01:22:32 -0000

On 3/28/2023 12:43 AM, Daniel Henrique Barboza wrote:
> 
> 
> On 3/25/23 07:54, Richard Henderson wrote:
>> This builds on Fei and Zhiwei's SUM and TB_FLAGS changes.
>>
>>    * Reclaim 5 TB_FLAGS bits, since we nearly ran out.
>>
>>    * Using cpu_mmu_index(env, true) is insufficient to implement
>>      HLVX properly.  While that chooses the correct mmu_idx, it
>>      does not perform the read with execute permission.
>>      I add a new tcg interface to perform a read-for-execute with
>>      an arbitrary mmu_idx.  This is still not 100% compliant, but
>>      it's closer.
>>
>>    * Handle mstatus.MPV in cpu_mmu_index.
>>    * Use vsstatus.SUM when required for MMUIdx_S_SUM.
>>    * Cleanups for get_physical_address.
>>
>> While this passes check-avocado, I'm sure that's insufficient.
>> Please have a close look.
> 
> Tested fine in my end with some buildroot tests and 'stress-ng' in a 'virt'
> machine with Ubuntu.
> 
> Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> 
Great. I suppose class 'os' in stress-ng should see performance boost too.

btw, Is there any public URL for us to check QEMU regressions and
performance data?

Thanks,
Fei.

>>
>>
>> r~
>>
>>
>> Fei Wu (2):
>>    target/riscv: Separate priv from mmu_idx
>>    target/riscv: Reduce overhead of MSTATUS_SUM change
>>
>> LIU Zhiwei (4):
>>    target/riscv: Extract virt enabled state from tb flags
>>    target/riscv: Add a general status enum for extensions
>>    target/riscv: Encode the FS and VS on a normal way for tb flags
>>    target/riscv: Add a tb flags field for vstart
>>
>> Richard Henderson (19):
>>    target/riscv: Remove mstatus_hs_{fs,vs} from tb_flags
>>    accel/tcg: Add cpu_ld*_code_mmu
>>    target/riscv: Use cpu_ld*_code_mmu for HLVX
>>    target/riscv: Handle HLV, HSV via helpers
>>    target/riscv: Rename MMU_HYP_ACCESS_BIT to MMU_2STAGE_BIT
>>    target/riscv: Introduce mmuidx_sum
>>    target/riscv: Introduce mmuidx_priv
>>    target/riscv: Introduce mmuidx_2stage
>>    target/riscv: Move hstatus.spvp check to check_access_hlsv
>>    target/riscv: Set MMU_2STAGE_BIT in riscv_cpu_mmu_index
>>    target/riscv: Check SUM in the correct register
>>    target/riscv: Hoist second stage mode change to callers
>>    target/riscv: Hoist pbmte and hade out of the level loop
>>    target/riscv: Move leaf pte processing out of level loop
>>    target/riscv: Suppress pte update with is_debug
>>    target/riscv: Don't modify SUM with is_debug
>>    target/riscv: Merge checks for reserved pte flags
>>    target/riscv: Reorg access check in get_physical_address
>>    target/riscv: Reorg sum check in get_physical_address
>>
>>   include/exec/cpu_ldst.h                       |   9 +
>>   target/riscv/cpu.h                            |  47 ++-
>>   target/riscv/cpu_bits.h                       |  12 +-
>>   target/riscv/helper.h                         |  12 +-
>>   target/riscv/internals.h                      |  35 ++
>>   accel/tcg/cputlb.c                            |  48 +++
>>   accel/tcg/user-exec.c                         |  58 +++
>>   target/riscv/cpu.c                            |   2 +-
>>   target/riscv/cpu_helper.c                     | 393 +++++++++---------
>>   target/riscv/csr.c                            |  21 +-
>>   target/riscv/op_helper.c                      | 113 ++++-
>>   target/riscv/translate.c                      |  72 ++--
>>   .../riscv/insn_trans/trans_privileged.c.inc   |   2 +-
>>   target/riscv/insn_trans/trans_rvf.c.inc       |   2 +-
>>   target/riscv/insn_trans/trans_rvh.c.inc       | 135 +++---
>>   target/riscv/insn_trans/trans_rvv.c.inc       |  22 +-
>>   target/riscv/insn_trans/trans_xthead.c.inc    |   7 +-
>>   17 files changed, 595 insertions(+), 395 deletions(-)
>>


