Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pf8za-0007gY-N9
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 20:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pf8zY-0007gK-NZ; Wed, 22 Mar 2023 20:39:44 -0400
Received: from mga11.intel.com ([192.55.52.93])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pf8zV-0006IG-Mj; Wed, 22 Mar 2023 20:39:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679531981; x=1711067981;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iPeS+Pb6uhGdGyyTaZjRLM6ePUzB9WK7aAMItgQMDsc=;
 b=DKhsh5ArXHmqk1atC9r7K7FDJjgHC/9CJpYIRRy9pqcV0x7ucAd6IiiS
 Y3dyB+qVNtZxriIVuvAgaMmqrFZJ+4Ay0nxkY8+UxceTtyPdeyoXbNn+V
 TOX4PurQaqJyQHLfIrK7U38nPD99Fd5Ex5c5d3ZioQpD4L/tOgh3oB2xk
 EjUwfbjggpyZnGINIvZoKBpqLJuGeBbz/1iqX3JqGuFk4BPCyr04ihh0C
 lrBaKnCgjoIeamwlD5ETQ15FnORxs/5U5AfqVWv2rFwcNl9WvvMU3NbBv
 gRhGzhSpQ9Wvz1HWhi5hAaNqhJlDvdDqLc3EhFKp2hU5L2iN+30168551 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="336870425"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="336870425"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 17:39:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675501665"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="675501665"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 22 Mar 2023 17:39:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 17:39:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 17:39:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 17:39:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hps+7sowlZ+8Zqv/7/EEMVKwY8XwmscG5SXjwtU+4sgM2p7E1qXUBQs0cddayuNdzEdhhIFqEVW3eQUDnWLDW0QpmWWwzECy23t6ArrWGJ1WKYuG90xH+sv8T7YdfBNQQHmNReVSaMEz+CJXXo7oZPwjUfVFoM7B0ycQ5GBoNAEUDKf60dGdbnBZLJMEUcuwMgizQZYljv3sKcmzDW1elo/ZV679jZ4sFHBontScpPLlrHT2/ZVIvl+gLsw2Pd1bYP04Rww5feXbWeKd/G4s6pmCu4i6GfwODXKJGp8GES5yCenEquYslRjEMM1kQQyazr6xA7kl3379L2X1BJ1S5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QoBeOGUyiQWSvxSz7cz5dBo3bZrs8+z3T7l3UkFGhg=;
 b=i/e/xE8QHFPYRSN0Uqgv1ahpW9A/i8mWNES92sL/m1gfo2z+CFrOfnrd8hmWFW96d2pMwsvIrFe2E7eJH/9bEMaN+ePd5bpvMyqC1RPKwoNC1glSPpxogHjP0cIrljKIlKzmYQvV5uPjsd14A4TgqYoNVp8miWmydcb3Zuah4OVs7attqQkO55OWtVKFg/WZyjqP0zn0OT1+7nWey+N3nOOa+iZIC8GPBoscqjkf477NjQlhB+eOouemSsVHzgimEBCQhwKrA5O06NRsPgo+P4PkOtDVsA6BdYrK+e92JQbvFlwY911U7NA+SgpXrFXytS5vlKMQziOTQnsJREeI0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by CY5PR11MB6305.namprd11.prod.outlook.com (2603:10b6:930:23::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 00:38:56 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5%4]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 00:38:56 +0000
Message-ID: <4c0c210b-7a9a-34a8-b0c2-e32f9328bf07@intel.com>
Date: Thu, 23 Mar 2023 08:38:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3] target/riscv: reduce overhead of MSTATUS_SUM change
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, "open list:RISC-V TCG CPUs"
 <qemu-riscv@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20230322121240.232303-1-fei2.wu@intel.com>
 <cde0b3bf-7d38-2fc4-c8a9-7241d5bf7339@linaro.org>
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <cde0b3bf-7d38-2fc4-c8a9-7241d5bf7339@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0115.apcprd02.prod.outlook.com
 (2603:1096:4:92::31) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|CY5PR11MB6305:EE_
X-MS-Office365-Filtering-Correlation-Id: 810cb5f1-ed89-4aff-51a0-08db2b36fc2e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q5+x9OLnhyhjEbYwEXz7QHaqKkKax1lfIFGVfQ5MOLkhCh4YwWkXCHAeJln/+W2yczTekFhDifotv5L8EFDOV8FxO8nLq8NBrrA0f7L10bXFf6ZeCU0q51cWKfI2RsqfhEhv83trQOb3IUEEvR/THfhmkMNOAlW9UdvplQyhsDWBKf8s3L+EF+0AY55C9s62Vs4N7t5UGkC6k5hsVB1IPZIYts0j2kh+Ti+8uWVCTGz94wDI1QqfWLvYq1V+LcRMLA2ggj2AtgJw4hu1/HCVGxKraBuacCbxtXGOqZPhR6T8gT+oXS0XKhwobGNb8VfE4VQm9AABhz4DSW1c8kE2FWVjcT8xN4kLrpSGAbbrNBlbTR5B6EA0/veRkm93sLRrjXJMNPtidXi0g94bvJcnMLdLkYdzc9U8LNR0FnYogGqxvg0+JyDqLC90Zwb7SFvzxuCAhn9sIFmLjSiIaO9WAltjlqn1wgZy66Dc243Zk6jmGEnArKC9enBVUwoNtsWqzM7ZQDTZ7M9LnCLx0lBbUk94UqRAWqsalr0zskuwi8G1nNrrW2ABlSUvN4/fVqZ8JrhrA9/j5ifwFTeLW0XyVKA4NSencQOAa8cIQusqiP3KDr5TRcQkdHiZjfcbmvdg8JDQbbx47ah/Axdhfq/5OZo2La7sfZiB1yWmMBZYwj4MXeW/sr+dxv1J8F/wrd7VjbLRjMBI1uwaPCGaIY00eY/2L39Ang2OtQvHr28ljdo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199018)(6512007)(6506007)(26005)(8936002)(41300700001)(6666004)(6486002)(54906003)(36756003)(478600001)(83380400001)(316002)(4326008)(6916009)(31696002)(86362001)(8676002)(66476007)(66556008)(66946007)(82960400001)(186003)(38100700002)(2616005)(2906002)(31686004)(5660300002)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVdyVVpCd0NDb3hadDF6SjlXSEtwTjM5TDhSSzFib2t4ZkRFVlZPS012MENp?=
 =?utf-8?B?ZkJrWkR0YXkxRUdVc1IxWWZDdWpQbkhpMGJkemxpdGxYOERGSzR0Sk1hUHlt?=
 =?utf-8?B?c1NjM1BvTjNWRk5sZ1JiMHIwYjZwVHQyVEw4azVSTTlhb2VZemJhdHQvMHVF?=
 =?utf-8?B?c2tiYUFobmxuQmwwMUJMTjlYaVVlUy9CTzg4U0d2NjlMNmJtc0hKZUhmT2JL?=
 =?utf-8?B?MnA1RXd1LzNSK3Rnbk5rTGNIWnFWVzNEOHNlRWZGbCtCcEpvUFRvdmJGeWVl?=
 =?utf-8?B?OWRhOVlMbTBpTjVhVUJkdHJhTThqZTFsRnhJa3pKbncwWTVEam1oOHpnYlNE?=
 =?utf-8?B?aXROUERETEdFWkM1UFAzY3VDZExmeW5zRGYvSkVpdVFBMEt4SGJhdkErajUx?=
 =?utf-8?B?SWRJTXdaRGJVeHowZmMrdTFSOUc3KzduYzR0ZnlkeW0zeElQYVF4R3pKbytC?=
 =?utf-8?B?anArM093ckV5Rnh5RWVqUnQ2cml1cENTeWxrOGw5YUU0emNGQW55SGNPT244?=
 =?utf-8?B?NnhZblNGc3J4Sk1KaW9UMEd0OEVQRHJLNW5EL1dHUExFeHgrcXExU3ZIVjNa?=
 =?utf-8?B?anlMY1A5d21Vc29jcEIzb1k3ZlhrY3F6VDh0MnVvY3c4OEpYaTFvNXEvOU5j?=
 =?utf-8?B?VlFMYTFkWWNlZi9uZWwvZVBmcmw2Rld0Ykl6UjVXYXMwc1B2ZCtMcit4YytN?=
 =?utf-8?B?b0ZSNnprcEZOMEZxbnlRblAyeWRoRHExejMwa0pLUWxIdks4TTdzQmpBa0lO?=
 =?utf-8?B?WE1VK1A0VjNoaXczS0lBQUZybHpObjAzSjlNTHh1SU85TTk1RFBhNDRuRGMz?=
 =?utf-8?B?Z1VNRGxDVURkbW9DRXJkWWRiTTV4Ykg2MnBYM2NpbGoxMmxSQit2b0dmYXRN?=
 =?utf-8?B?LzdOR1QzVmlsbjNFTE1vc0FXTjdiYlBXS2VFQWRrdHo1aWNiS3N6M3dyNUp4?=
 =?utf-8?B?S280M0pOR200RVFuRnpPQTlXdWFmWTFTbk9kV1FIZVFjelRVYVlTUERkdytL?=
 =?utf-8?B?eUNvekpzNG9OeS9WWVRoMEg1WGQrc3J1UFVMTU5wYnpmemM4UjVURVBQWnVP?=
 =?utf-8?B?c003amk3d2pqd2tNM3QxSzZnZUxHU3oxWm1HUkpqMTRwM1lVUC9TMUc0dWZC?=
 =?utf-8?B?TDJaVnl4bjgxVW96Y1laSmxtSDNXYjFmMlBWd0xJd3JIWWpmWDJscDFTVUJh?=
 =?utf-8?B?eVZKN0NhNjdRYzJYb0FBVjN5S3IxcndmTGtQVTdxZDNaU2UydkU0MktzNGMw?=
 =?utf-8?B?MWlqQUlPUnRwVDV3ekpGcWt3ZlN3Kzg4akxHODJ4ZDNQdTNWelNYQzlXdWZu?=
 =?utf-8?B?dkprVG5pL3lHOHN4cExKbDJCMUNmVFVxSGkwSDlxM05FVFZtVUlXRXBoN0V5?=
 =?utf-8?B?TUM0UFB6dk1TbXlodGdPSXZTeVpTenUyRG00MENSaEdhUklISExxeXd3clQ5?=
 =?utf-8?B?VFAwQnVyNkRVVDRaMXRsd213ZzM3TEdQYXB1aWZCNXU1TlJERW04OE5jS0Zk?=
 =?utf-8?B?UGdNSnBoL2V0WVh3L09jUm45Y2xzUUdtc0hxMEJHL0JVSWxlekdjKytkekl5?=
 =?utf-8?B?QjdwTEhQMGxKYitrK2lGQ2dESnNhN0s1Q2l1bzJwZFFQWWNhNlpldmUwbFNv?=
 =?utf-8?B?QTRlWk5IMU1BclpMOG14dTAyemg2S2h0UVFWSHVNRWFTOVpqSGJTK3dHdmcx?=
 =?utf-8?B?NEIzVXg5M01TZzdNR3I1RlZGNnBkM2hHS1VIYlJCYlpvbVhlRUVKQWJxYm84?=
 =?utf-8?B?QmxHMUNxMmJnelROWCtWdC9PZGRGTm1xZndabU1oTHNDOWZrTDl1TDNOWnRE?=
 =?utf-8?B?U3YyaFJBWW5GaW1KRU5qR0dsMU9qMHNCS3pSNTR4U3RNY1A3UGtPT3NoZ1dM?=
 =?utf-8?B?NUJSTFpnaHBqeWFkMk9veTNzM09PSXdyUCt0anQwZ1hxUjgvSTNoTFJUN01P?=
 =?utf-8?B?b3dJbXRVeCtKdkszUnIybnBlTkVKbzB6MExHMnB1c3FkVmtLTmdITE1yV2xP?=
 =?utf-8?B?UU5kRVNaY2RHWXlncjdLY3FMK2JXM1BFQ3p0U0JPYUJLQ2lUbVJ2cE1UVFYr?=
 =?utf-8?B?TkM4T3pXZFVKbFBrTVFNVE9kMng5aWpZRFlUS2hGUktpRFBxeW53Tkd1Y25q?=
 =?utf-8?Q?1+NUjYYhAL1OpYHHklL7BoKTa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 810cb5f1-ed89-4aff-51a0-08db2b36fc2e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 00:38:56.5616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFxjHqovmu2aH1c7mW/FctOowmljYzZRK4ZuO+3ukdXlQmWRnubalzA6DSUniZk9U4hatSDIBHVxZ2YfwNqoBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6305
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.93; envelope-from=fei2.wu@intel.com;
 helo=mga11.intel.com
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
X-List-Received-Date: Thu, 23 Mar 2023 00:39:45 -0000

On 3/22/2023 9:19 PM, Richard Henderson wrote:
> On 3/22/23 05:12, Fei Wu wrote:
>> Kernel needs to access user mode memory e.g. during syscalls, the window
>> is usually opened up for a very limited time through MSTATUS.SUM, the
>> overhead is too much if tlb_flush() gets called for every SUM change.
>>
>> This patch creates a separate MMU index for S+SUM, so that it's not
>> necessary to flush tlb anymore when SUM changes. This is similar to how
>> ARM handles Privileged Access Never (PAN).
>>
>> Result of 'pipe 10' from unixbench boosts from 223656 to 1705006. Many
>> other syscalls benefit a lot from this too.
>>
>> Signed-off-by: Fei Wu <fei2.wu@intel.com>
>> ---
>>   target/riscv/cpu-param.h  |  2 +-
>>   target/riscv/cpu.h        |  2 +-
>>   target/riscv/cpu_bits.h   |  1 +
>>   target/riscv/cpu_helper.c | 11 +++++++++++
>>   target/riscv/csr.c        |  2 +-
>>   5 files changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/riscv/cpu-param.h b/target/riscv/cpu-param.h
>> index ebaf26d26d..9e21b943f9 100644
>> --- a/target/riscv/cpu-param.h
>> +++ b/target/riscv/cpu-param.h
>> @@ -27,6 +27,6 @@
>>    *  - S mode HLV/HLVX/HSV 0b101
>>    *  - M mode HLV/HLVX/HSV 0b111
>>    */
>> -#define NB_MMU_MODES 8
>> +#define NB_MMU_MODES 16
> 
> This line no longer exists on master.
> The comment above should be updated, and perhaps moved.
> 
>>   #define TB_FLAGS_PRIV_MMU_MASK                3
>> -#define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
>> +#define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 3)
> 
> You can't do this, as you're now overlapping
> 
As you mentioned below HYP_ACCESS_MASK is set directly by hyp
instruction translation, there is no overlapping if it's not part of
TB_FLAGS.

> FIELD(TB_FLAGS, LMUL, 3, 3)
> 
> You'd need to shift all other fields up to do this.
> There is room, to be sure.
> 
> Or you could reuse MMU mode number 2.  For that you'd need to separate
> DisasContext.mem_idx from priv.  Which should probably be done anyway,
> because tests such as
> 
Yes, it looks good to reuse number 2. I tried this v3 patch again with a
different MMUIdx_S_SUM number, only 5 is okay below 8, for the other
number there is no kernel message from guest after opensbi output. I
need to find it out.

> insn_trans/trans_privileged.c.inc:    if
> (semihosting_enabled(ctx->mem_idx < PRV_S) &&
> 
> are already borderline wrong.
>Yes, it's better not to compare idx to priv.

> I suggest
> 
> - #define TB_FLAGS_PRIV_MMU_MASK                3
> - #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
> 
> HYP_ACCESS_MASK never needed to be part of TB_FLAGS; it is only set
> directly by the hyp access instruction translation.  Drop the PRIV mask
> and represent that directly:
> 
> - FIELD(TB_FLAGS, MEM_IDX, 0, 3)
> + FIELD(TB_FLAGS, PRIV, 0, 2)
> + FIELD(TB_FLAGS, SUM, 2, 1)
> 
> Let SUM occupy the released bit.
> 
> In internals.h,
> 
> /*
>  * The current MMU Modes are:
>  *  - U                 0b000
>  *  - S                 0b001
>  *  - S+SUM             0b010
>  *  - M                 0b011
>  *  - HLV/HLVX/HSV adds 0b100
>  */
> #define MMUIdx_U            0
> #define MMUIdx_S            1
> #define MMUIdx_S_SUM        2
> #define MMUIdx_M            3
> #define MMU_HYP_ACCESS_BIT  (1 << 2)
> 
> 
> In riscv_tr_init_disas_context:
> 
>     ctx->priv = FIELD_EX32(tb_flags, TB_FLAGS, PRIV);
>     ctx->mmu_idx = ctx->priv;
>     if (ctx->mmu_idx == PRV_S && FIELD_EX32(tb_flags, TB_FLAGS, SUM)) {
>         ctx->mmu_idx = MMUIdx_S_SUM;
>     }
> 
There is MSTATUS_MPRV and MSTATUS_MPP kind of thing, priv+sum is not
able to represent all of the status, probably we can just add an extra
'priv' at the back of TB_FLAGS?

Thanks,
Fei.

> and similarly in riscv_cpu_mmu_index.
> 
> Fix all uses of ctx->mmu_idx that are not specifically for memory
> operations.
> 
> 
> r~


