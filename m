Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjb1s-0003JQ-1o
	for mharc-qemu-riscv@gnu.org; Tue, 04 Apr 2023 03:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pjb1n-0003Iq-RQ; Tue, 04 Apr 2023 03:24:28 -0400
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pjb1k-0003hB-60; Tue, 04 Apr 2023 03:24:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680593064; x=1712129064;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LY+Ug4y/cJdJul/FzsJK8ZPY9B4dDE+ZTlaO/2shpxE=;
 b=FTTSrSxwWsRUsD0qIWfy9AStOw6LOPPcDVI8ZNVf1yfq33EH3N67C5td
 O/PXL3xTF64a3rXw8G5MGPxjUi+V9++U0Fqkuh231hwlV7IZ/77BBP9K3
 e4izXPPZFdGlQaVQQ3BvFwx4bJhb6i4tqG3Dm4Ci4YkbLt9k9gtbXTZOj
 yx5b1brWDtBHhc/+3olka0+R2Vi6EiDK4XeoQnIAfGZQmuZXWRk0kifjM
 KlmFZ8AoXTBDXAdpD+opYn34y3iQVNf0PGI2SRBb/fnwfU9XEcbN4gzWe
 Ph4WgTBZXWRwC8dN4cc/2/SmnsLJWDa4qrSDLDOv7CTd4txzxywXANnge A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="342135798"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="342135798"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 00:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="663489110"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="663489110"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 04 Apr 2023 00:24:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 4 Apr 2023 00:24:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 4 Apr 2023 00:24:12 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 4 Apr 2023 00:24:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQnAbcGXfMnUr7H2HXtRR8jLuh7MP5opkwCNlzwLJqdtKSaSAhacnF6VeLxNw9ZcF2CgmTmkdcyQLpZGoer46t03IDoRPcYyLAb5xIiE4ha2WkX0XKeUqwr/4Mzs656aW5SZ2kTv9RkuNgrVDwzVrBwHbaj0t/KJOfLHILSM048qGQuydJi7n92dmkluyqhIkaL524+5zpRpS4SxBar9UwA0bTHB+K2jRXlhR2bO0erfLl13by5R2wDZNXx1k/y/xKD106pHzMnklpF1O8pmgoEdVjrkuSAX99nReUt/qX+uLlP6H0l0P0k5m+xJNSlccCj8kmgYa6yr0+0X2hoI8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8fEwoTsZUWvHoypoL0OS2SlhQzhC5sDvsfOAGoIPg0=;
 b=O5+BhSYib4VG+nkmqtJDciFhMoaPdZXTO4kjH1Lrelh8gg5RGPRut/n2hHMPoAFuntslhvnAoOentwkdevn9vyX1T65E5LwWM7KGjzm5y2VDDLwxk7n49a28LiMZOmO487yUQ7bclEuq3l2RuPOR6GM/ZVHBV56TMJ/ZH2uK3h7BGXrUduZ6KpQPU/mPiMn2vzPtQ1cByRQ9L+j8K8yBKzsF42G076PJKMzgCUT/ok9l8ayBzlLaiHnKMbqy3IGrhd+eCVNLw8Vjx1YlPuSSOMKxKY986R74z3WmRbS5zTniNgI0xxFtQxIaXDYOKmmhPpb2V4xKatQ6vuRPvcMY0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by DM4PR11MB6456.namprd11.prod.outlook.com (2603:10b6:8:bc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 4 Apr
 2023 07:24:10 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::cf58:e1db:41d4:ee3f]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::cf58:e1db:41d4:ee3f%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 07:24:09 +0000
Message-ID: <d884e0e6-9963-bae9-b2b2-8d017e8f36a7@intel.com>
Date: Tue, 4 Apr 2023 15:23:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v6 00/25] target/riscv: MSTATUS_SUM + cleanups
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Richard Henderson
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
CC: <qemu-riscv@nongnu.org>, <alistair.francis@wdc.com>, <palmer@dabbelt.com>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
 <66a60213-0783-c929-5bbc-e012de2a4183@intel.com>
 <a2669beb-2bb5-32cd-c31b-2f5aaeee42c7@linux.alibaba.com>
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <a2669beb-2bb5-32cd-c31b-2f5aaeee42c7@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0182.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::20) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|DM4PR11MB6456:EE_
X-MS-Office365-Filtering-Correlation-Id: e7516023-a497-4951-6e69-08db34dd946e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qs+TxKPJojO1+SBM4WXBtgMW9AL+01ziFB3fAkezBsG0Ne+R4LVW/dul+t3X6B+633q9mpuinVbOHZk0ApoAQDCBq1/2D2OvHbx7nZ+grPtaAQb72XXUhHetSpcHfwUNA+xPKbPoh2NeO6OY9ZbY8T8AhLePEShl+qBxXEPcd5GdAI3sOL+f9rLCVyV0GPaUXiaqCfl+DpqJoV5+5pNQ6ElHCmLx6L4P8mPHf0s/DzB50BCMM6VD96Zo++b6OaOvdBIZtVouqLFhMIIAtvX8DlAb8b867bDypsWlXBJs4mZpAK4pYr4InDQJ6HSvdCJajpCiDMnHcC7ft0AiW4PJTFL+RfuT03Gdo/N16pClOnS7Hw7XmTz/bAsKLSRX52tLmktIen/mI1cgz/MmD+mSLODbm7REhAu2SNegzAr25wPsyZAEPvE36U8d+nRyTFI1i01FHq94VDCpkgyxA4ydYJeLCg/ky/anIAQ3d0QItWnk+BS5z9MrhGx7bcO915KIcjLAh+kb5ZhBL9ipRdcfkm2/8T6T8PYNPXfzjqAqmklgNic5Ofn9GlF26KltUBZrjivbmkt+79aw+QPuSTnXrQJRcb6Zwz8WgqujNsckqxqwlBHB7w7qrRAbf5859WOFUGTjTruYDzYN6mMa3vgSjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(136003)(396003)(376002)(39860400002)(451199021)(31696002)(66476007)(82960400001)(41300700001)(316002)(5660300002)(86362001)(53546011)(36756003)(6486002)(4326008)(83380400001)(6666004)(8936002)(478600001)(6512007)(6506007)(2616005)(2906002)(66556008)(38100700002)(8676002)(31686004)(66946007)(110136005)(186003)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGZyQWEvTWgya1lnYlhFQkRENjBlSEpsT2RQUnJ0b21PcVM5MWJNYlBqYUFl?=
 =?utf-8?B?aktzSU1xL0pCWGNwbTVkdmRRZmxzY2IzQ21uMFRndWpwMXZXcENRSXd6bnVp?=
 =?utf-8?B?eEZHYytQRTFVY25hWktMS21BcWx2QW9XQXkvZWoyeFFCQU91ekpnNDNoVHZP?=
 =?utf-8?B?c2lpVWROa21oSXZpK2o3aUhkWTRXVzdtY2p4dG5oNlFpTVFtS0VXOG1XclVN?=
 =?utf-8?B?SXNDZ2diMVNGbXFlcWJicFJWNlFPNTlBQmhBUytPTjM4U0JHaE5HYXM4WS9R?=
 =?utf-8?B?VlZUQmxLempKSUQ1b3dzL0Z1OVBlblJiSThoOXAzVURLMUNIU1NYYnJyTHVh?=
 =?utf-8?B?VGZoQituY085VGx1eTIvZzNXeFdOdmtrMzB5TUtHczA1SHpFOUhReitORkll?=
 =?utf-8?B?dGRkRXdraFhlcERNS3FDbU1pbjR0eXFwSDcvVW4zcEVpRzE4RW5MbUhFRndH?=
 =?utf-8?B?QU9KUEZvcVBZd2tUMzhTNThVUmc1eUNBTmsyTFNOR1Uwak9VaXFzb1pVbWtK?=
 =?utf-8?B?VjQwcm5mN3dFU2YxZEhCaGsweWU4SFRpOW9uK2piSCs4QTV1V2ZWakZ0Vko4?=
 =?utf-8?B?dWtvSG5YZnVPWUFKZWhEUE9ETjgrcXBHaldOZ1BsUDZBSldMQ3hhQU54RW54?=
 =?utf-8?B?dGdBYjB4anRsTSttS2taa0Y3ZHdiWU1hUURQSnNJZVgzZnJnWWtYUXF4cG5z?=
 =?utf-8?B?djNHM0dQUXNmMzNKZVkvVWdFQm5IZWJxSC9ydTFyNThDNm9xbC9CcmlIK0hV?=
 =?utf-8?B?dldtRG5ON0RyV0duMjY5U05RMkpJR2xONTMwWWk5K0xuOG92MFU5QlZTek8r?=
 =?utf-8?B?Y0ZHeEgxeUJaMXN4RmI3b0ZSWGhvbkZKa0FDMjh3NWowTmVEMWc5ZENRV0Rr?=
 =?utf-8?B?dVpCczlYTVp3Y2ZnejJMeUpWejd2Y3piL1NhWEJ0MEJWTmlJNUw5MjVWQVRN?=
 =?utf-8?B?WHdxS0hDQjBkWDVVcGVpY1VpRlhPMDROWitNRTdaRWlmQTVjdUFWeERwUXpS?=
 =?utf-8?B?dkhLM1ZsTUZRWXprRUNydHZ5RVV5cUFJc0l1U2thNHhJQWFMYXhSclhsTUJI?=
 =?utf-8?B?SVZSWTBNd2hHR1QwUnhsWHZ0NEFnbHlNQS9xY0RSZ2g2YWgrTGU5SUZZQnRM?=
 =?utf-8?B?Vi9GU2ptekVIRVFSN1EzYStwbW9ZeC9hbGV3Z0xUYVNOVlFYWjFiZFpFSU5m?=
 =?utf-8?B?TGtkZmk2cm9Db1JubGhvdC91NFRTdThUZTZ3U0lmOUZFc3BHb3hnZWFwYldV?=
 =?utf-8?B?cEI1MDQ1eUtmV2VUczF4Q1V4Z25FMHBUM1JzT2dTaG9ZRjV5ZTVucHI0ZWZ3?=
 =?utf-8?B?d0Z2N1AzUFRZNkFrRFdPRDk2bVpyOGNYSU94RWlmakdqS0pLMVd3cllYOGM0?=
 =?utf-8?B?Z0VIQllXZllQSFNFREJSRW5uWTd1alROUWdMNEZJNitMRTR5T3hxcEFXeVVx?=
 =?utf-8?B?YTN6OVZMUUpsRFQxK3Vtam9QUlphNnlLYVE1Qkg0QytRSXNaL2N0anZIV2Zs?=
 =?utf-8?B?V2YxMWs3aWZFTitWRVZNZUxDOHFINHlRQTk1SHF5OUhRT2lTejhYTHd1NnZT?=
 =?utf-8?B?UlQ5Ymh5c0ppeHRtK0hvak1zY0lQdTBjdjE3UERwY3U1bGRVTGsrU29CcW9u?=
 =?utf-8?B?SXZGK0tybktXOHNEclU3eXd4RmVkalNNNlNRUDEzOERkQmZrUmVGeXk5czhk?=
 =?utf-8?B?cjZHb1pUY0h0SDRjaGxWVzlRSzcvaEFGNXRPVU9LeS93V2srTzgvQlZRM1g0?=
 =?utf-8?B?Qi9IbEE0NU9BVXdpSVJJN3Z0aVFrZFJzTmxPR3JqeVg2RWx5dHNYMWo5K3pG?=
 =?utf-8?B?SnYrTU9ybHFrS0kwTnZ6Q1l5QjY5aUs0VThaZlV0WWhhcFVwOGl5YUZFancv?=
 =?utf-8?B?NC9nVHh2TEN1SGlBMW9vWjJRcG1QdXU5R3Q4cjNWMDBjRXBQdkM1aHhWbGk1?=
 =?utf-8?B?YTJGQjlVcVpnMHpJTEF2SysrUGVHV0xXbThRb0VKQzdmajR6eU05V1JwNm5P?=
 =?utf-8?B?T2Erdnl0UjE2MTVvbXRUOHlpeXpFQ0Z0cVlYSUtVQUJONGpPT0lLdFJESWRr?=
 =?utf-8?B?ZXluQXN1NFpWZUJ3NlhTVkY0V3J3RnRFa1BwcndUNmh3MGk0UDBFNmxUK2Vs?=
 =?utf-8?Q?csSiFac7aP+CByrhUm+HNMw8O?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7516023-a497-4951-6e69-08db34dd946e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 07:24:08.7635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t0ZnZmdzMQ0KGj87kEfFyJ0sSb84oQz+aV2v9uiGGxZlIYh2unpMaR5/ZcnR7lo9StBXxCvaaurb49IY3X9x5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6456
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115; envelope-from=fei2.wu@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.349, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 04 Apr 2023 07:24:28 -0000

On 4/4/2023 3:11 PM, LIU Zhiwei wrote:
> 
> On 2023/4/4 14:42, Wu, Fei wrote:
>> On 3/25/2023 6:54 PM, Richard Henderson wrote:
>>> This builds on Fei and Zhiwei's SUM and TB_FLAGS changes.
>>>
>>>    * Reclaim 5 TB_FLAGS bits, since we nearly ran out.
>>>
>>>    * Using cpu_mmu_index(env, true) is insufficient to implement
>>>      HLVX properly.  While that chooses the correct mmu_idx, it
>>>      does not perform the read with execute permission.
>>>      I add a new tcg interface to perform a read-for-execute with
>>>      an arbitrary mmu_idx.  This is still not 100% compliant, but
>>>      it's closer.
>>>
>>>    * Handle mstatus.MPV in cpu_mmu_index.
>>>    * Use vsstatus.SUM when required for MMUIdx_S_SUM.
>>>    * Cleanups for get_physical_address.
>>>
>>> While this passes check-avocado, I'm sure that's insufficient.
>>> Please have a close look.
>>>
>> I tested stress-ng to get the feeling of performance gain, although
>> stress-ng is not designed to be a performance workload. btw, I had to
>> revert commit 0ee342256af9 which is unrelated to this series, or qemu
>> exited during the test.
>>      ./stress-ng --timeout 5 --metrics-brief --class os --sequential 1
>>
>> Here is the result, in general most of the tests benefit from these
>> series, but please note that not all the results are necessary to be
>> consistent across multiple runs, and some regressions are not real but I
>> haven't checked it one by one.
>>
>>               master(60ca584b)   master + this      speedup
>>
>> stressor           bogo ops/s      bogo ops/s
>>                 (usr+sys time)  (usr+sys time)
>> sigsuspend            19430.09      1492746.34     76.8265
>> utime                  8779.64       271023.89     30.8696

>> opcode                11315.78        10538.58     0.931317
>> nice                 154327.30       136797.63     0.886412
>> mremap                  225.29          198.82     0.882507
>> exec                   4118.89         3282.85     0.797023
>> vm-addr                 214.25          166.69     0.778016
>> landlock                950.00          722.74     0.760779
> 
> Thanks for testing. Have you analyzed the cases with worse performance?
> As we are doing a optimization.
> 
During the 1st run, 'io' showed the worst regression, and it's proved
not a real regression or at least not consistent when I tried it again.

       master(60ca584b)   this run1  speedup1       this run2  speedup2

stressor   bogo ops/s      bogo ops/s
          (usr+sys time)  (usr+sys time)
fallocate     32711.39     33794.28    1.0331        32067.69  0.980322
sigchld       46289.82     42975.50    0.928401      44914.65  0.970292
inotify        3013.11      3511.21    1.16531        2879.87  0.95578
opcode        11315.78     10084.42    0.891182      10538.58  0.931317
nice         154327.30    186649.43    1.20944      136797.63  0.886412
mremap          225.29       237.39    1.05371         198.82  0.882507
exec           4118.89      4248.12    1.03137        3282.85  0.797023
vm-addr         214.25       268.60    1.25368         166.69  0.778016
landlock        950.00       791.12    0.832758        722.74  0.760779

io           371206.67    205232.61    0.55288      409205.80  1.10237

Thanks,
Fei.

> Thanks,
> Zhiwei
> 
>> Thanks,
>> Fei.
>>> r~
>>>
>>>
>>> Fei Wu (2):
>>>    target/riscv: Separate priv from mmu_idx
>>>    target/riscv: Reduce overhead of MSTATUS_SUM change
>>>
>>> LIU Zhiwei (4):
>>>    target/riscv: Extract virt enabled state from tb flags
>>>    target/riscv: Add a general status enum for extensions
>>>    target/riscv: Encode the FS and VS on a normal way for tb flags
>>>    target/riscv: Add a tb flags field for vstart
>>>
>>> Richard Henderson (19):
>>>    target/riscv: Remove mstatus_hs_{fs,vs} from tb_flags
>>>    accel/tcg: Add cpu_ld*_code_mmu
>>>    target/riscv: Use cpu_ld*_code_mmu for HLVX
>>>    target/riscv: Handle HLV, HSV via helpers
>>>    target/riscv: Rename MMU_HYP_ACCESS_BIT to MMU_2STAGE_BIT
>>>    target/riscv: Introduce mmuidx_sum
>>>    target/riscv: Introduce mmuidx_priv
>>>    target/riscv: Introduce mmuidx_2stage
>>>    target/riscv: Move hstatus.spvp check to check_access_hlsv
>>>    target/riscv: Set MMU_2STAGE_BIT in riscv_cpu_mmu_index
>>>    target/riscv: Check SUM in the correct register
>>>    target/riscv: Hoist second stage mode change to callers
>>>    target/riscv: Hoist pbmte and hade out of the level loop
>>>    target/riscv: Move leaf pte processing out of level loop
>>>    target/riscv: Suppress pte update with is_debug
>>>    target/riscv: Don't modify SUM with is_debug
>>>    target/riscv: Merge checks for reserved pte flags
>>>    target/riscv: Reorg access check in get_physical_address
>>>    target/riscv: Reorg sum check in get_physical_address
>>>
>>>   include/exec/cpu_ldst.h                       |   9 +
>>>   target/riscv/cpu.h                            |  47 ++-
>>>   target/riscv/cpu_bits.h                       |  12 +-
>>>   target/riscv/helper.h                         |  12 +-
>>>   target/riscv/internals.h                      |  35 ++
>>>   accel/tcg/cputlb.c                            |  48 +++
>>>   accel/tcg/user-exec.c                         |  58 +++
>>>   target/riscv/cpu.c                            |   2 +-
>>>   target/riscv/cpu_helper.c                     | 393 +++++++++---------
>>>   target/riscv/csr.c                            |  21 +-
>>>   target/riscv/op_helper.c                      | 113 ++++-
>>>   target/riscv/translate.c                      |  72 ++--
>>>   .../riscv/insn_trans/trans_privileged.c.inc   |   2 +-
>>>   target/riscv/insn_trans/trans_rvf.c.inc       |   2 +-
>>>   target/riscv/insn_trans/trans_rvh.c.inc       | 135 +++---
>>>   target/riscv/insn_trans/trans_rvv.c.inc       |  22 +-
>>>   target/riscv/insn_trans/trans_xthead.c.inc    |   7 +-
>>>   17 files changed, 595 insertions(+), 395 deletions(-)
>>>


