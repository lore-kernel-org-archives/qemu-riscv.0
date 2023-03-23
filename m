Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfLGL-0005lr-Ah
	for mharc-qemu-riscv@gnu.org; Thu, 23 Mar 2023 09:45:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfLGJ-0005l2-Uu; Thu, 23 Mar 2023 09:45:51 -0400
Received: from mga09.intel.com ([134.134.136.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfLGI-0004st-09; Thu, 23 Mar 2023 09:45:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679579150; x=1711115150;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H18swmCNydXpKZXNKpwXn5uHuSjBWl103txEDu2+JWA=;
 b=Nj49+eb1B+THoyDqJUA1+UAfTeLzgze61v3DZ8fek4FTDLqNg3RadaUI
 yNa+SkqNA++kug5rqqeFNKtxLANqBEy3zYV/foHHIxORR4eePjQ5BL6nQ
 rAAzyq7R8+bV46idtZa6I+peWMvq083tAebbHUlqyEDsJEYjjl9zdRQNJ
 g6EEJQF/McSRGZ5s6k2jmeVaLFLSSCqoHMCcG9gKvSTeZiHxn+R2xvUsI
 egaf6sMjhtNL/NnFg6ePDPSUR7ika++prRayVOTft1CqFRzFi4vhqHlpX
 FzFLXcZk36scZaHTc2RHjAqbxLRfSMxu294aYq8b8nwNU67KWftNI8PMd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="341039246"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; d="scan'208";a="341039246"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 06:24:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="746714218"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="746714218"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 23 Mar 2023 06:24:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 06:24:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 06:24:15 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 06:24:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYqNAbpfzV3tiCLiK81O9rdj0mJ3nkw0om1oOTlJEaKxgQ++ibwlfEyleiTwGaEe3ylRadykXQzU37O1gSoSsMDXXr7v1a0yFNHp0GXtAflOK9hUawBmyA66GQUMmLvl+z+UNiz1ZKa8TSPN7fC02FBNkkz1OfJGK9BKxmu7tGqZiX8Dgg6XUkrFzvoYZAd+ueOCANj/lHvYjbxfFrpynj+g8hQMTNHCUD7ysz91/F4yVupbenHzVa6TtOV+JAMgFT4DTqXj7EgJvCxdBgmPXtcF6JVsnGAMSyQ4M7Y03NFYayBcIlI6AyyZDVpBx8lO0INuhT/5dH+KzvXNIoNWjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0D9t8ifkeioe3zhzmzL6WgiFODRbOESIbt0S5v8NeTU=;
 b=BDDSHaFG4Y9ted2haeX3lOyT1U5kXBCSPlQvnRXJ4nmU31aa6DQ0nmmu5kHVVqSDeBO+Zne+0CspWSrZgdU64ECDDNHZoyALYWejyMOenWJPDVUSk2uEWoA68d77ue4Ds8WFNMBgreTVFZGu8/SJRvoA/DWllD+QBGpL0oHp5WNJr2PVvu+Ks5arp/r6t+Oh4dXz8MIwwNH2tQjuJLPWCSf68G+8AI8+DKORVJVHDMahg44+cFmi5AIRxkzixTzubN5pileGDWpNrgENomERbX3Rkm37bxI8zAA0Q1q0m0AqUX3JbXjozf9ZNz098ZefkDuOxo2on2LKreVtkorhow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 13:24:12 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5%4]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 13:24:12 +0000
Message-ID: <5a9a0d2b-6530-2436-712a-ef168266d2e9@intel.com>
Date: Thu, 23 Mar 2023 21:24:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3] target/riscv: reduce overhead of MSTATUS_SUM change
Content-Language: en-US
From: "Wu, Fei" <fei2.wu@intel.com>
To: Richard Henderson <richard.henderson@linaro.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, "open list:RISC-V TCG CPUs"
 <qemu-riscv@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20230322121240.232303-1-fei2.wu@intel.com>
 <cde0b3bf-7d38-2fc4-c8a9-7241d5bf7339@linaro.org>
 <4c0c210b-7a9a-34a8-b0c2-e32f9328bf07@intel.com>
In-Reply-To: <4c0c210b-7a9a-34a8-b0c2-e32f9328bf07@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|DS0PR11MB7408:EE_
X-MS-Office365-Filtering-Correlation-Id: d1238fd9-0551-49ed-94c2-08db2ba1e3f3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aJhFJ/8kPnv5fLroCfAu1+n5dvU2ZG06l/rBI4EGsyOqwPl+NQTVrvASS1I95tP+uydJQYDhCqGh1ImVkCUfEU44BzWpG2i2eK0AAMfZM9zI2JD8+n+2EtvIe1XmKfUGSx76WLWwXkZEYtYMAcLdacJbitkVtW0vU4/MIIOaq71LPybHRPB36Fj90qz2NEV/Pjh+o93kcYg4uzGD4rhiztP1LfmQJ+RRPyxQNyhBcjbNJd16ZaAB4U0Dnr6S6GePODZdjJ9ZQizcNkcfbtXMKls/ZKWkMYc+a1nj9wGhwomwg5fVLYE71oM6HutZ5X+MEdJv85JbjLFIRHK3Y0FRV4GniZidiFiCnU5pTuMYyXmleMH3CyYPlHjLNvwAUS1D/OudalLOOqXPDrARxImhYbihrwjwOI4QLYPFd9zKfKLi41a4bE4TLzTHE5wIOtScoxf/dCj6HmW2D5l2qQZyJoKG1u9pwQ4uu/FEdS4B15rhLV43YWb4busrfVAmfUh0f6Y71fmHZsf3enXwuXvup4lc/CKLfxmBqSCsYUhQZe4LLgPegTIErZ/aM3CiQAdJUVn1MJ8eQZkjcxvFf8Du/lVeE2/Qxa/mBdtCMfjipX0M3lwyPI5lmRF+YkURhS8Z1LPf4kdEgfxzA/yv+RtrlxhCMnaC0rFEQQZv3gsZa0S2T/RBvXAsTH/N51cFx0TizILdRh5lRX8dsbPHUcNONUeqTTOViFcxzBRS9ZuITYo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199018)(31686004)(41300700001)(66556008)(5660300002)(8676002)(6916009)(4326008)(66476007)(2906002)(36756003)(86362001)(31696002)(82960400001)(38100700002)(26005)(6666004)(66946007)(6486002)(478600001)(316002)(8936002)(83380400001)(6512007)(6506007)(54906003)(2616005)(186003)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RE1KaHM2VGFNbE9wdFU1NnpHN0oyUEIvVjRBaHRwRmtrbFY5d1pkMDdQdHFV?=
 =?utf-8?B?NUlvSXdTcks3N1RvQ1B1RnRSYmJCSXFLdzQ1M2xYbkVFbktxbGRLTE81c25s?=
 =?utf-8?B?VDFDVFBMZGNhV0lsM2VVd1VObUxTQmlGaFRxVjRzWFpUbHVOVG81WFlseTRG?=
 =?utf-8?B?SlBqU2hHeXRwSUZEM1JiU3cvWHo0eGd4dzROOW1jOFVLQTBVVXZpRjBCaFpl?=
 =?utf-8?B?WXdlSENNVU1UMVVLVFYzY052aHExdE94eEt0OXBLUjBmaTUxQmZnTnpKNGxE?=
 =?utf-8?B?RURCSmRMUEpSVWhGdEFBTHNxNEtxSU5nbkU5a25tVVhENGRIRDcySGJHakl0?=
 =?utf-8?B?T1pLbEdEajVuYUowaUg1d2dnUzErc2k3a3pEVHIrOHhwQ0dVbjVMaFBzZ3Vp?=
 =?utf-8?B?MS9ibjM5c0RveEE0ZEhqR0J1SkJRS1dCY2IvWDg2bWdxbjEyUUQrSGhBQURT?=
 =?utf-8?B?bzJYUGc3bE5objAwM054U09JYmFoYU1lZkVuck9PSjl6MUlnS09obWtIWDNY?=
 =?utf-8?B?T1gvTCt3N3crK1h0UkxISXpUbVAvNG1DVG5zUzBjSjhYN2JJR2R4eGpaZU1v?=
 =?utf-8?B?NkVMNGZsVmNvQm1zVDB2VFdzWHNxV2hMV05pMW14V2hpcjdERnNwVzBMSjNI?=
 =?utf-8?B?aDRZOWtOVmloVkQzZnVlcXFSU2drd2NpaWlpV2RUWnYveE1zVVNST0ZiUEw0?=
 =?utf-8?B?UDdUV3Fqdi9xcHQrT2wyUkNFYnRvMjA0YTJ0UWZRMWVCV1A4UEdMd0w1dmJH?=
 =?utf-8?B?cEhXQkM2U1RieWkveFRPQmVpc2FVL2o5aVpyOUR6ZG5vUUxIeTByTjdNaEFU?=
 =?utf-8?B?bE10aUtFWDhYZzFBazJRNDRVZGlvQXZpUjZPYkRlTEZkUEN4YkNCcWVNVjVU?=
 =?utf-8?B?aXA4WFJoVU12WEVYWlZkVFp2ZWc5Rm40VzM5LzkvUDZYei81RjVmTnhYRzd1?=
 =?utf-8?B?OXZwSHpDcGc1Ump4OElvNFBkcnA1aENza0UwblM0S0xIQ1c3K0tmQWU4cXRL?=
 =?utf-8?B?UERlY3VzMHZaMEVTakxyQU02eDdkYlRWLzc1dU9oUjdWWk9LRzVVa2hhc3hm?=
 =?utf-8?B?ZUlNTlJWK2hubEZ5d244K3d3NnFacHZ6QUVIY0tPSDN5UnJtTnNNd2lRcWQ1?=
 =?utf-8?B?aTJ5aFFuRDhOYkEwNEU5UW5WY0ZpcSsyaHFseVI5T3A0cy9WeTlPd25UWUtw?=
 =?utf-8?B?WnZDb3RadnlVTTBXL1B1aGI0cGc4b0twV0NTNUs4UUFxTkdBYWpvamNiUXNI?=
 =?utf-8?B?djdYTElRM2JnS1JtOUdnejRhWTlBZGl6SGY2WWRiRlFTUTBlOXM2c0J2Wmpu?=
 =?utf-8?B?VjBNdHVVc2RPOW50UnBGRUpsVXI0LzB0VzdMaG0rOUhRbVh2L3BiQTk0clls?=
 =?utf-8?B?TEhEWjhySDVENkhqWXFuUTRyVnhYbjk1QW5JSXZyVkxKdjNjL1BkdkVGcFhu?=
 =?utf-8?B?VGZyOFpaOVUwN1ZuQ01NNTlNMHRTUWMveWl4ZVN4L0dFZmxvaWlMNzVtemk3?=
 =?utf-8?B?aU90ZHVnTUpUSmRhSENCMURraFBZK0YrQXRiOFVVNzFUOW53UGphYjQwS3d1?=
 =?utf-8?B?Mm9DbWlRVTUwRWU3d1luSWtnVGl0K2t5SDVQVWF1UC85R01vZVEvdE1kSkhn?=
 =?utf-8?B?WWdUQ3J1QTd5WFlMTThPYjJUZ3BIZHAwMGNTOGhkSGRGWTVMMFo3Wm40MVE2?=
 =?utf-8?B?enBLWVozWmJnYjdzS2ZmWXFJN0ZkSFZGRmNBYkdMS3IrUk0xNDNlMW8rYTVv?=
 =?utf-8?B?emQ1aU1IcG44NmtWcEZoSmVzTi91SWxpb2g4YWhLU01YSGV5WUpFZGRJVU9m?=
 =?utf-8?B?R01oWlhrY2ViK2Y2MWdVeTQ0TVJLYWJKcXdINW5lNXpBUXNCMnVPYzk2ZVRE?=
 =?utf-8?B?WW1ZOU9IUzdwYXdBMlhIbW16QkIyaFFNY244NFNQNTFpa1REamJhUnlDZkp6?=
 =?utf-8?B?RUFqT3VndWsvb01jTEVXMXpUTTkwRW5mR1RhY0UvblhoNkduRmJNalg4RW5w?=
 =?utf-8?B?V0p3NXE4cURHaTVNcWxHeVVuOGZ1eFZaQ0VCcndVaTNPcXlCSzRpQkdQeE93?=
 =?utf-8?B?MXlRYXdqRnpHNmp6MkMzbXhHSFJEQ2Iyc3hBbm5najhpK1Q0THJLaFNwQ1Ns?=
 =?utf-8?Q?PN80VMa9sPjXGAmST6uy17CDb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1238fd9-0551-49ed-94c2-08db2ba1e3f3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 13:24:12.0614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zo2PchqwLCSTRsbFewDLjHQQKTpuotKjGlwlwiSErOOEVgKjdL8gJz+/sjtvy+vW2gB+W0ciY2onE0pVelXO0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7408
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24; envelope-from=fei2.wu@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 23 Mar 2023 13:45:52 -0000

On 3/23/2023 8:38 AM, Wu, Fei wrote:
> On 3/22/2023 9:19 PM, Richard Henderson wrote:
>> On 3/22/23 05:12, Fei Wu wrote:
>>> Kernel needs to access user mode memory e.g. during syscalls, the window
>>> is usually opened up for a very limited time through MSTATUS.SUM, the
>>> overhead is too much if tlb_flush() gets called for every SUM change.
>>>
>>> This patch creates a separate MMU index for S+SUM, so that it's not
>>> necessary to flush tlb anymore when SUM changes. This is similar to how
>>> ARM handles Privileged Access Never (PAN).
>>>
>>> Result of 'pipe 10' from unixbench boosts from 223656 to 1705006. Many
>>> other syscalls benefit a lot from this too.
>>>
>>> Signed-off-by: Fei Wu <fei2.wu@intel.com>
>>> ---
>>>   target/riscv/cpu-param.h  |  2 +-
>>>   target/riscv/cpu.h        |  2 +-
>>>   target/riscv/cpu_bits.h   |  1 +
>>>   target/riscv/cpu_helper.c | 11 +++++++++++
>>>   target/riscv/csr.c        |  2 +-
>>>   5 files changed, 15 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/target/riscv/cpu-param.h b/target/riscv/cpu-param.h
>>> index ebaf26d26d..9e21b943f9 100644
>>> --- a/target/riscv/cpu-param.h
>>> +++ b/target/riscv/cpu-param.h
>>> @@ -27,6 +27,6 @@
>>>    *  - S mode HLV/HLVX/HSV 0b101
>>>    *  - M mode HLV/HLVX/HSV 0b111
>>>    */
>>> -#define NB_MMU_MODES 8
>>> +#define NB_MMU_MODES 16
>>
>> This line no longer exists on master.
>> The comment above should be updated, and perhaps moved.
>>
>>>   #define TB_FLAGS_PRIV_MMU_MASK                3
>>> -#define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
>>> +#define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 3)
>>
>> You can't do this, as you're now overlapping
>>
> As you mentioned below HYP_ACCESS_MASK is set directly by hyp
> instruction translation, there is no overlapping if it's not part of
> TB_FLAGS.
> 
>> FIELD(TB_FLAGS, LMUL, 3, 3)
>>
>> You'd need to shift all other fields up to do this.
>> There is room, to be sure.
>>
>> Or you could reuse MMU mode number 2.  For that you'd need to separate
>> DisasContext.mem_idx from priv.  Which should probably be done anyway,
>> because tests such as
>>
> Yes, it looks good to reuse number 2. I tried this v3 patch again with a
> different MMUIdx_S_SUM number, only 5 is okay below 8, for the other
> number there is no kernel message from guest after opensbi output. I
> need to find it out.
> 
>> insn_trans/trans_privileged.c.inc:    if
>> (semihosting_enabled(ctx->mem_idx < PRV_S) &&
>>
>> are already borderline wrong.
>> Yes, it's better not to compare idx to priv.
> 
>> I suggest
>>
>> - #define TB_FLAGS_PRIV_MMU_MASK                3
>> - #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
>>
>> HYP_ACCESS_MASK never needed to be part of TB_FLAGS; it is only set
>> directly by the hyp access instruction translation.  Drop the PRIV mask
>> and represent that directly:
>>
>> - FIELD(TB_FLAGS, MEM_IDX, 0, 3)
>> + FIELD(TB_FLAGS, PRIV, 0, 2)
>> + FIELD(TB_FLAGS, SUM, 2, 1)
>>
>> Let SUM occupy the released bit.
>>
>> In internals.h,
>>
>> /*
>>  * The current MMU Modes are:
>>  *  - U                 0b000
>>  *  - S                 0b001
>>  *  - S+SUM             0b010
>>  *  - M                 0b011
>>  *  - HLV/HLVX/HSV adds 0b100
>>  */
>> #define MMUIdx_U            0
>> #define MMUIdx_S            1
>> #define MMUIdx_S_SUM        2
>> #define MMUIdx_M            3
>> #define MMU_HYP_ACCESS_BIT  (1 << 2)
>>
>>
>> In riscv_tr_init_disas_context:
>>
>>     ctx->priv = FIELD_EX32(tb_flags, TB_FLAGS, PRIV);
>>     ctx->mmu_idx = ctx->priv;
>>     if (ctx->mmu_idx == PRV_S && FIELD_EX32(tb_flags, TB_FLAGS, SUM)) {
>>         ctx->mmu_idx = MMUIdx_S_SUM;
>>     }
>>
> There is MSTATUS_MPRV and MSTATUS_MPP kind of thing, priv+sum is not
> able to represent all of the status, probably we can just add an extra
> 'priv' at the back of TB_FLAGS?
> 
MPRV+MPP looks not necessary be in TB_FLAGS, it's just used to calculate
the mmu_idx. Is it necessary to encode SUM into TB_FLAGS?

Thanks,
Fei.

> Thanks,
> Fei.
> 
>> and similarly in riscv_cpu_mmu_index.
>>
>> Fix all uses of ctx->mmu_idx that are not specifically for memory
>> operations.
>>
>>
>> r~
> 


