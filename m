Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfVqZ-0008MI-Ss
	for mharc-qemu-riscv@gnu.org; Thu, 23 Mar 2023 21:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfVqW-0008Lu-Oy; Thu, 23 Mar 2023 21:03:56 -0400
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfVq7-0001vN-Ar; Thu, 23 Mar 2023 21:03:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679619811; x=1711155811;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IuBn9GhuEvLtZISIyMRPhlDQluWGkNunGsHMzc3KYb8=;
 b=iFoK5jBROI6wr1rIkfXXLwVnIZULy8PG96JQLr/1q8prc/tNkyh3/04p
 hTD98iwp8YJf+qrzEJ9euZC2cGGnXQhXiLbL4G2uiDg7mmNnQ8CTTHcD/
 OnD/RX7Tn/8EezSk5cLXDPc7YKctyZr71ap0pmEGETRBJNxn9n30EKD4I
 /8GxwuXTBzFcLbBgmr2add+/giKRdv0NWe9ycJBw/fPK+elBQK0TJO/fo
 Xy5Bn+fi1RGeYh/0A3/36yejMBb+Bnsbgf2zaToq6NJFQD6zygl++PlS8
 MHK12fmUYxo85BmxEZlHPFBappyIEFHyLyyPOmlIDrINBI/fYLwZU2ZYa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="320057625"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="320057625"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:02:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="751698478"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="751698478"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 23 Mar 2023 18:02:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 18:02:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 18:02:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 18:02:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 18:02:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfW2tl3rVBNhHhZiZuATeG0OmG+5Q1DXOAHCgRg7HC+kY7fEQU3tLJFqxJDe5lZnPjL7sHa5r3PG4YI27Qhbp5PZjTx2mcyn1mXzAEDey6U0E+1gbpIXNxqv5lt15tbjlQQW1uwhqzjf66ls2mAO66SUDcKXXtqbN5o6dA8FQNVIb1Sxy/9nWlIsjrjPoAB8UQPQ6ExaW9h07MqnN6i/OjjzhCj8RtL+6erhK2CMll1gBaRkuwmIgNFQukqfwb/NRKQXoNEIgsa1l6LCJZ2ydUseCb5L+A8BSenq+xtf75PYCq/2LPGO92IJ2HrQ9KxFQu1Mo/H74ORU/ltbJ+o9cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXht5owvelKsokyZhIuue2RIqsiW4ZHMfNtW0pFhKlM=;
 b=jHU32kDJpfM/Y1lZT9g7qrNxEWzOYMm4dXxuIGUam6aoenvx+gIEdtHN5butRla6Usumd1lVAm3JvOd15HLsT27SDXnfNRU7MS49EDvLQDy0b6UURciRvqEZ8qdyI532RCrQIAHFoqupBtINTG72Nke2+ynrdXW43oh3f90uh8eYJugVYnLArSgUn0pdJdA/W9yRsy+59iR/+My5x0OvYxuYTPMqkxM7yc8ZLDF+gYA1BEqhsTSn150WPYDLqEaYaubMIf3gXl55z57q4fa4e+tMIjFtpHyhgLjhGqBKN0uzEHbVeG5PRXjwzopRkD+KhTt/1F6e+kMIYabnYgVKTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by DS0PR11MB7681.namprd11.prod.outlook.com (2603:10b6:8:f0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 01:02:55 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5%4]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 01:02:55 +0000
Message-ID: <e51ab3a9-4794-038d-7de1-8977d7f93b8a@intel.com>
Date: Fri, 24 Mar 2023 09:02:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 1/2] target/riscv: separate priv from mmu_idx
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-riscv@nongnu.org>, 
 <qemu-devel@nongnu.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Christoph Muellner
 <christoph.muellner@vrull.eu>
References: <20230323024412.324085-1-fei2.wu@intel.com>
 <20230323024412.324085-2-fei2.wu@intel.com>
 <06d24ab8-bfca-6ade-4510-0bc961c97789@linaro.org>
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <06d24ab8-bfca-6ade-4510-0bc961c97789@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0088.apcprd03.prod.outlook.com
 (2603:1096:4:7c::16) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|DS0PR11MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a9248fb-a2cc-4bb6-f6c8-08db2c038022
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MKSYuM0KkpA2HVwCfIdy/8r8e0RfWmyCC3MT0jEn21ZXSha+l9eVJdZJWp7HRKIfOm0RLp8JNTN8Z7aDgal3J0HcOvW2b58YumH3ueZ7RSP5Fu/W4ELtoqZCT18MlztPBOlZSQmMxsBjzhmurJW9E/1kMwVV1rg0AuCCKPyIoh9FnE8uwQnpoHG6ybS6skfdMxnifGttjpKGPg+hmEpkolkyZoQDwfzrnVsdaUhQBxw7K6w160ruVFdhQrjL9XNrNAELDKy6WJnPO/P3Ng04owwQBkiAsvYZcLO0uiStUb68ERXM4xOSZvzvOFAJ3e1k0pbHAANW5achu0xxhceywkKCc2l64P7/O9AQRukEC9IZeJ0AqsUOIg/PbNA3e3itrbpnD8VTTeg4/8TqkUCryYndDvZG8wzKoorpvQmQ5/GQYJv+0oZdDdXpuQdCCyUxbIEBAcSUuQtF2uVk89QoOcms2m7kfAoV+nH3zon3b4lKhfWBl72wo2zBXzNwLW67VnIUj4HYfJimJGnY4GSkyRBSBP8oDHMBxG43xRMtFq0/jzSuaJ87u8a1C+KK39Ow8PZojM/HlGSRwoJ8C+jSS/Vw42l2qXb/0gFWStaTQv19Qp2+NHOUyP+dbtCHO9HLP8eqIEU6Q0zZLLhBA/sjnsPHNczaCF8HtjDldnd657QNQtlaSt1PoMUHe9MNP4utzLumIzmzLeO7DnC28Rp3f5+3I1NcOfHwD+Db4jaH158=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(39860400002)(396003)(346002)(366004)(136003)(451199018)(36756003)(2616005)(26005)(41300700001)(6512007)(6506007)(186003)(53546011)(54906003)(83380400001)(316002)(66946007)(66476007)(66556008)(4326008)(6666004)(478600001)(8676002)(6486002)(31696002)(86362001)(2906002)(7416002)(8936002)(38100700002)(5660300002)(82960400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUxIeERpLzBlNVR0WjFFa3ArUTA2anVNOFIyOXVTYnBCRHloZWd6cFJLbEZU?=
 =?utf-8?B?MHFiY2l4YTh6QUdHaXpvRUpnOEoyTnF4MXh1d28xRmRKTE5nUzc2L0c5bUpI?=
 =?utf-8?B?QnBncGQ5WUUxMG54N1laNXBiQlplVHQwdzFBRm1yV2lKZlJrSXpQTTF5eW4y?=
 =?utf-8?B?YlNneVZmdDFadkx5WE5KaEhOT29qMFJvNkxlU0ZBaVpyZTgxMHduVDFyWFJQ?=
 =?utf-8?B?UlBGclVCSnJJVHQxemZQdG9CbTc1QUVjeUkxeGUwbjh4Ti9Tb081RFBZbTZj?=
 =?utf-8?B?djNZSjk3ME9vVllSV3hYWVp5QWtXcHNCbi9mNTNmZHNZUDdzTGY5WjVidnZy?=
 =?utf-8?B?dnYveit6VWhjYTNDMEVueVRVZEhhd3VBMXFNaktINjdNTkh2dmozb3VwTk42?=
 =?utf-8?B?eVRpR2hJSEh4YjV4OStFbHpIZEozcTVyRXpaZzA1a2JGSkFSSW1ZT2ZUeVJV?=
 =?utf-8?B?ejNzcmd2Y05MVGxBMFBzOXVyeXlnZm5CQW9yVlIyVUNjakNLRXZidVY0akhj?=
 =?utf-8?B?TlFmTm5Cd0tNdllpTExnSlA0aHpWQ1kzdnlHNWRvdzNyemYzYlJ3akhCVmFx?=
 =?utf-8?B?d1Qxc04wWGh6NVBwUlpMRW9WWlNlTi9nbk53VUtIYTRHTml4N3VyR3FveWFL?=
 =?utf-8?B?czl2anRxMTI4Qkk2MzZnY0xEWjJOeVJ2Mk1SVkwxczd6VVFKOUJsMFp0T0xr?=
 =?utf-8?B?ZjNXa3dEamw5RDBHN2VobDNHYnlTWHMydThjL0hCOXZOb205NWsySTJPaEJU?=
 =?utf-8?B?aXRMRkFLdmlwSm1xVC9rdUdjMm5RVWFyNkRWeG5uSWx1UnFlWEVQY01FbmpL?=
 =?utf-8?B?akdjR0NaeitNM0tuQmNNaDRqVkhaSDJ6NTJiMktKMkU4SG9xbUFrdWFBOElW?=
 =?utf-8?B?eGdWTUtvMEZVSHdjcmdyT2tSUFgyUEhWVzE1YWlIQmNrUG1mWWN6alBKaHNM?=
 =?utf-8?B?Qis0VU1UL1AraVZZOWdKMVJweG1Pejl2a2dnVkZvUFlMc3pyQWZhbDFzZlhS?=
 =?utf-8?B?dEswZ2J6UEQwdCt0cC9Pb0tLYkE1ZytLNDhzakVobEcrYm5Ga3o2bVVxaENu?=
 =?utf-8?B?bmxoQXhpWlQ5eDFyZnBoSVVOVXErazV2eVlLK1VJRUh4WG9TMmtraktkcWFO?=
 =?utf-8?B?dkR4OUViaGM3aTVtL2VyUjkzZzVrdlVKaTVqOWt3N25VRWpEeHdMdG5RQitX?=
 =?utf-8?B?NThIMlQ5djU1U1JXSldOMm5KQitaYUpaQTB4dUJxRERqUWJYeFlxa0pHQzZ2?=
 =?utf-8?B?dUZTR1kzWkZOM051OVpROHN3Z05uemhVSzlkQ3JzeUVtWWsvQ1dJS1JBRWoz?=
 =?utf-8?B?YUV5am5SakZxWFJyTm9LaHJ5ak1jYU91dU1FMU00TjJ3MDl3K21ZL3ROVGJr?=
 =?utf-8?B?VDVNemMwdFJmd1VraXI3dTdKck02eUcvNllJTU9ZQVV0RGs2WnBNSGdQYnph?=
 =?utf-8?B?eDZVWWpYUmloWTlIb3M1RDFCNlBHclp0NG5hbjdiWlN1MUF4SUllOFRuSHd2?=
 =?utf-8?B?Yy83eXF3S3MreU1DeUVJSlR5ek95c0VJMXErejBOVy94VDJkY0pSVTh1eXor?=
 =?utf-8?B?QnBxamdkRkZ5bXFiU2F6MzFZUktYUVp6TlVlNXBLNmNJYmxkalFEZGlySkF5?=
 =?utf-8?B?ZUJFRHB2Wkk5cmQvdDR5OTRwUlZsVnhPUGVpTXBhYmN5bG1pcCt2VnhCaGND?=
 =?utf-8?B?V3VicWVUc2JoTjZDbDJ0RFpXVzJSTDdEU3FUZGoxL0FmSE1VQWY0RVNCKzBP?=
 =?utf-8?B?TlZsdk9Sd2g1NXRMUlZWZ0RUSFI3RjFSMHVEL0loa29qcnd3cCtuOWRhR3lo?=
 =?utf-8?B?dmpVdVY5eEp1UW1mYTZ0U2tINEQyWjZuZkgxY0c2a28xaWxjaFZyazJSOUF4?=
 =?utf-8?B?QjlNcXZtdUxXZTc3azExaW81UEpuOWRtcitiV3BqK0xIc0JBdk9obnNlR2lJ?=
 =?utf-8?B?bU9va0tuMzNTS01OMXpramRiU0gvVStCamd0REVCanhtT29QYUdQaXVMNFdw?=
 =?utf-8?B?dzdseExuTENmMFlST3VnUzFaenRpNU1VbzZiSjIzTmoxa05tVDNMSUlLR1hF?=
 =?utf-8?B?clUvRjR3ZFpHVkhWVTU2dWFGSy9KMExTREtEZFRHbXhnYkdHa1Rxb3NTMnND?=
 =?utf-8?Q?kjZLglDZJVcEiEYnZTH3WA/Id?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9248fb-a2cc-4bb6-f6c8-08db2c038022
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 01:02:55.2637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ciUJsyeIg3QYhIZwLJCTL0psvI5bNZ2MHbqX5lzVmVI03/GTl2IeScHyibxGkxBm9kHoXPZ/ZQ/4Qq9boEnsjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7681
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
X-List-Received-Date: Fri, 24 Mar 2023 01:03:57 -0000

On 3/23/2023 11:53 PM, Richard Henderson wrote:
> On 3/22/23 19:44, Fei Wu wrote:
>> Currently it's assumed the 2 low bits of mmu_idx map to privilege mode,
>> this assumption won't last as we are about to add more mmu_idx.
>>
>> Signed-off-by: Fei Wu <fei2.wu@intel.com>
>> ---
>>   target/riscv/cpu.h                             | 1 -
>>   target/riscv/cpu_helper.c                      | 2 +-
>>   target/riscv/insn_trans/trans_privileged.c.inc | 2 +-
>>   target/riscv/insn_trans/trans_xthead.c.inc     | 7 +------
>>   target/riscv/translate.c                       | 3 +++
>>   5 files changed, 6 insertions(+), 9 deletions(-)
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 638e47c75a..66f7e3d1ba 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -623,7 +623,6 @@ G_NORETURN void
>> riscv_raise_exception(CPURISCVState *env,
>>   target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
>>   void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>>   -#define TB_FLAGS_PRIV_MMU_MASK                3
>>   #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
>>   #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
>>   #define TB_FLAGS_MSTATUS_VS MSTATUS_VS
>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> index f88c503cf4..76e1b0100e 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -762,7 +762,7 @@ static int get_physical_address(CPURISCVState
>> *env, hwaddr *physical,
>>        * (riscv_cpu_do_interrupt) is correct */
>>       MemTxResult res;
>>       MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
>> -    int mode = mmu_idx & TB_FLAGS_PRIV_MMU_MASK;
>> +    int mode = env->priv;
> 
> This is incorrect.  You must map back from mmu_idx to priv.
> Recall the semantics of MPRV.
> 
The following code (~20 lines below) takes MPRV into consideration:

    if (riscv_cpu_two_stage_lookup(mmu_idx)) {
        mode = get_field(env->hstatus, HSTATUS_SPVP);
    } else if (mode == PRV_M && access_type != MMU_INST_FETCH) {
        if (get_field(env->mstatus, MSTATUS_MPRV)) {
            mode = get_field(env->mstatus, MSTATUS_MPP);
        }
    }

I think it's the same logic as the original one.

>> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc
>> b/target/riscv/insn_trans/trans_xthead.c.inc
>> index df504c3f2c..adfb53cb4c 100644
>> --- a/target/riscv/insn_trans/trans_xthead.c.inc
>> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
>> @@ -265,12 +265,7 @@ static bool trans_th_tst(DisasContext *ctx,
>> arg_th_tst *a)
>>     static inline int priv_level(DisasContext *ctx)
>>   {
>> -#ifdef CONFIG_USER_ONLY
>> -    return PRV_U;
>> -#else
>> -     /* Priv level is part of mem_idx. */
>> -    return ctx->mem_idx & TB_FLAGS_PRIV_MMU_MASK;
>> -#endif
>> +    return ctx->priv;
>>   }
> 
> I guess we aren't expecting optimization to remove dead system code?
> That would be the only reason to keep the ifdef.
> 
> This function should be hoisted to translate.c, or simply replaced by
> the field access.
> 
I only want to replace mem_idx to priv here, Zhiwei might decide how to
adjust the code further.

Thanks,
Fei.

>> @@ -1162,8 +1163,10 @@ static void
>> riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>>       } else {
>>           ctx->virt_enabled = false;
>>       }
>> +    ctx->priv = env->priv;
> 
> Incorrect, as Zhiwei pointed out.
> I gave you the changes required to TB_FLAGS...
> 
> 
> r~


