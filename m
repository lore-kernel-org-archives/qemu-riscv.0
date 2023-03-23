Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pf9jY-0005Q7-7T
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 21:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pf9jW-0005Pt-Hv; Wed, 22 Mar 2023 21:27:14 -0400
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pf9jU-0006qR-2D; Wed, 22 Mar 2023 21:27:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679534832; x=1711070832;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WXe7+sr/GlBcWF8BkdaOVzv0MP/sbdARlTNXvn4tyEM=;
 b=VubPemivIWoSphqU/fJgxC8TCWkc9bxik7zRGxXkutOOhJir8UIdcERd
 D9jJJrvnOSNzn59LCV9qf2o0GXXjrl82C5gUvBmJ9SKXAeuIA8ewHoxNl
 z5hCs4ggzJXLRW5dInHkCuJV0YZZ9bhikQh9hkLXMLLfMWPJX/EUF5laS
 qgwegX5jjGP7ACG0uT93ouNRckRcPkwaTTw0FCd9cOdf283gGZmy2hJLb
 5NE7Nwc3/3TfrGuLPYiC4DpwH+aQCvNiPaQlxcBiqa+xxxTKDM/PmY0ew
 UIfmlCydf1eVA/xilS0vRciVb/D6WNG39FgvDLUuh3Gbja9yqAYxxsNfP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="319022236"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="319022236"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 18:26:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675513625"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="675513625"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 22 Mar 2023 18:26:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 18:26:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 18:26:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 18:26:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 18:26:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TrIJl2f07N+78UyXlB1PLiwOwzIEY+5D6fHYMTnX+O9bxetLvcLH9OvUU00lZl3z9qvgvAan+O4pumIuiQB/eYufsDfSgadDboFYI0E5Afe6KiV7D5mqIwUMH+ZY0YD4I6aA1JFQuvyI4GA6t1Zz9dWjmwllZP6eZVNftWAPyUVwdeLN8TCgDjGpJuXXOqE1hgyivCD7a6x8HZ5j1VgscDPt+PHuZWYRH41CXAc09XtVqnKsbCh3Pho4GC8Z0lcsx3sPUi4wGQSfQHlzH3XJWUINnFpPBXVX5VZv4eZ/Tgkxm93dzyYhTL1WWj6CJKiC9noMcyRWZ2EJ5ZJktdW6pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UA+T2ajkcNoyGsNzsE6G6Rcku84vj13lWAErw/k9q+8=;
 b=aKht/xZ2XDYLPcB9BfSfJk487pWL11Gm3KBab/fNIuTN7gPA0cABRMS6g5FFvB94lYOQLl2NSLkbSjYvxDR1/3dJ7HspTo3OC93IGg+e0vy63o2ch5HQNu/xuWo+RQwFF08FfhCs2Nx2AMeTQ4lsgHV2pXSeRn3eKbTaMYqsDVoLgYobRQE7bogFaXB3zCmbWB8hdg4seYhu7B1fyk49aZpBh36yB8UkSbRY1fXubgJWAkrpnNkvFQhaUbu008neRIlO4SeZlsjfiVKdOtucjFIV3nfJ2J2enwZc6IiIGTR+e5wOvBGvFn23CuFMz70MXQcebolTavNN0HVSvQpuoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by DM4PR11MB5375.namprd11.prod.outlook.com (2603:10b6:5:396::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 01:26:37 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5%4]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 01:26:37 +0000
Message-ID: <b509a953-a5ac-7580-b97a-5ef29f31c5eb@intel.com>
Date: Thu, 23 Mar 2023 09:26:27 +0800
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
X-ClientProxiedBy: SG2PR06CA0217.apcprd06.prod.outlook.com
 (2603:1096:4:68::25) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|DM4PR11MB5375:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cd3edcc-57fe-403a-5119-08db2b3da512
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rTQ7RJZFTVUW0og8q8vwpm70ZIoeUe8k9oAFsjbMoOjJBhKwj/YYTEIj5Ze0FMHdR5N6PhZdHmE/MqSGQj4k0xVQrFvhM4iEHLloHwT0X0llvr9ptHFw3incETNKUJQokkQFAzj0S8i99+5aiOn7YEFAHLk3U63yPRBA6H/WIUQdAo3XIKStHzbfVsPTUUMjH6hjrT5heQOZCGXoaEPWUWyDBajs5wsoiboQBR9in7FFWdTzvPzqCfwCaY1LGA3dKHpkCFOBBrHkDbZLnY9jsce2kEMg3KRT+a7E3IJ+s0bjTM90iLkNuWbZ98byGACfLvQVANz3esT7pDwQ18N11+tyGN7R91DO/UIGkYfx34KxO8K0Efb/3Dd5DNZwvVQ29xWQDxFIt19KVovVpX4QUGGf9H/RtplNn27mc6LxbB0XjfnBVvxOcW3njP9eGMHDHXX12HqHTtpqcWpyFYu5X+OsI87uCr8w1rRK5tt1+a699Kcmei1TU+k5wp8gfF9K4/MwPmJro44rEpIFyBxIawzkxWfZm7ZGDp7zyivUKh8WhK/YIcw0pts8nMTSpgt/OP+J7rLhh6Kgtyc17y2oj0lOU/pxXtOwWYxAOtjswZE2Ok0/GzFKeRjikrVS5amUxLeQDnS4nSmLYsFXlP3/CwuwbXhQLCYGQAFuAMTZlDIFbV4n++LCLiJJQDY9VD9LvOAovXrhk1HjbM6I08eDk3LEKuE54Wx1zI23eYR8TVs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(39860400002)(376002)(366004)(136003)(396003)(451199018)(31696002)(31686004)(316002)(66946007)(6916009)(478600001)(82960400001)(2906002)(86362001)(83380400001)(4326008)(8676002)(66476007)(66556008)(2616005)(186003)(38100700002)(36756003)(6486002)(41300700001)(54906003)(5660300002)(26005)(6506007)(8936002)(53546011)(6512007)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cllvS3BvTURPbGFVMHA3ZllaVVBBWTBlbnJBSVFjR0NSbG1VSDBtQlR6emJQ?=
 =?utf-8?B?SEx6Vi9nZFE4VjFNOUhmaTlQS0RoWXpBZVhDU1RlNmVrQTloNlNzS0FORDJL?=
 =?utf-8?B?NHNONUlJdU9mT0s5MVJ0NDU0eWN2RUpiL2FQNThwVjlML0xMREZVc0F5bysr?=
 =?utf-8?B?SVB2WGtMYzNSd3VzMFNrZnNKeWdIeXU5NnBjOHdlRFI0YzNVVEpUVWV3RkJZ?=
 =?utf-8?B?SXlXYlkxTEFvZ0hKYmZXVFBvWlc4c3cwcFQ1cEZyNmpiRHVjQ0xuT1VqTnhh?=
 =?utf-8?B?ZDlYc1FMV1d3V1BBbFh4Vk9MamsyZ3Y2UFBrM0ozZG02U0lUcm9rekV5aDZX?=
 =?utf-8?B?N2RGblpDVWh4bXY0OHZIT2cyZ2hEaW85QWJxT3JpbzlUN1JDNVVzQ3hqTDBC?=
 =?utf-8?B?Sy9mZGxKdkQwRVBFT1hTaWxlektZT1F0ZVNSMUJGY09mT3VySTNidHZTZFIy?=
 =?utf-8?B?OHNkZTBnV2NtUEhycmRmeVhkSFdSVG5IL213cnhmai9WWjkvNnRjQVpRWjFz?=
 =?utf-8?B?YWJwMmRZMWMwbFgxQklHcmF5REtkQlRRY1loWjNPY1lHK01kU3k3MHU2RHJR?=
 =?utf-8?B?d0RGK1d3TkZscnQ4QlpRZGFFTHc3bm15d2hQa1VmMXA5cU1tTGNCZEJ4SXN4?=
 =?utf-8?B?dm5zbGxaWnliVE1yN1M2ejRBb3pBc1cvVW5JU3FkcDc2T0w3SzNwTG1GYTZq?=
 =?utf-8?B?UFluMjc4TG5Ib085T0lsa0tLYnM2Y2Y3OFBlUzNrb2ViQW5oL1pMWDNrSXYy?=
 =?utf-8?B?SnpwQjgvM0p3blA1VDRPS0I2eElPNm9RcGJjSVphTk9BZzViZS85ZmVocU1D?=
 =?utf-8?B?TnVNTTNHYWpHVU1leTdkZFUxTGJYQW92RmxTYmVlaktWQ0ROanN6VUFXRDY3?=
 =?utf-8?B?WWEwVzk4N09kS0h1dDRvM01ENzgyTHNnTGZmbm5raEFEYnJZKzRjUDhaR1lr?=
 =?utf-8?B?bU5VdUhMRDhHU0VOWDBpcEhYdmc2MkF3VlJSc1NLQTJwMlZ1YW90VFNZUGIy?=
 =?utf-8?B?TUhGTDl5WUtEN1lrVVIzcTFETFlkNWN2ejdDT1AreVNMcDRPQ0FrbmFXSG53?=
 =?utf-8?B?b05KR1RxbTFGMDNBcFRnSVhIdnptZGJZUXZiNzdmRUs5OHA1ZnBRUnJrV29n?=
 =?utf-8?B?RFdwYTZBSzFkL3ZucnRZdkdsT21yeXJOek5PVXRLVVU5SU92UERjRkVWWkY4?=
 =?utf-8?B?R0VjZGVnbnMzQmpmbE4vMy9qTEZOQVgwaDB0K0I1Nlo3YXhnWEdIcHBsRVYy?=
 =?utf-8?B?aEhCeklZWjkyNHY3dEtFVnlkcmJNK25CUzg5OGZpanYyeXkwc1o4ckpLK0p0?=
 =?utf-8?B?RW1od3RkdTNHaGxiUzdiaWtCdU8rSllEM1JtVTZUSVJVUU9BLzQzTEVyL3lq?=
 =?utf-8?B?UzBoSVpob0p4UEE0MSttZDJtdnU2Vml6Slp6NnBXVk1LSTMxR2NQUXhDb0tK?=
 =?utf-8?B?Qmc0OVJqZHl5SFhKTzdwb3lzL2ZRU1F2MVBTKzh0Vmluemsvbm4rQ3Nlb1NT?=
 =?utf-8?B?QXdaVmVBYzhxYktTQUNraTZRUlV2U1EvZzRtMVlqSGUyRkNNYWZyZHl1WUlT?=
 =?utf-8?B?VHltMHdEUlhnK1ZhVXRMdzduRkFUeDZxRnJzUXprT1ptaTUzSDZUQ0FTdXNZ?=
 =?utf-8?B?QzVoUXJrRmpnRnNqWlF2V3Ryb0hYajJsUEh2OHV2UzUzaE9KMVJud1dFMWpq?=
 =?utf-8?B?R3g4dGdOS3BIdkkwRUJ1QWN0T2tqYzhHaEJFSFpCRWllWFg4MHlwVGJaVWdF?=
 =?utf-8?B?V1lyTm9VMnRpZ3R2a0c2UmpYdkNMd1kxUThta0dYTlFRTWR5cUY1dUppd2Yx?=
 =?utf-8?B?SFNiMTFhSHNIRk5rZW1QRUFJZVRPWnNScjJqUGRYWnkydGN3eERXTm5XU0Y4?=
 =?utf-8?B?RFlnV3VSUWdyZi9jNU9JYTdLRmFTKzdPbGVFd3VHa1lqYURoQzM4QTVJMmg1?=
 =?utf-8?B?UG1kQ3lOak5pYXdRSHFXMHE3NHhtNVdYaDVQeTdwSkZIS1UvaGZrS0tEVHNt?=
 =?utf-8?B?cjZoL1RPSTJsMi96em9vMDRrZnN2OStlalBJdXNMMjVFejFnZi9zK3lvcTJV?=
 =?utf-8?B?ZnZ4RmxqdFF1Y04yKzdHemdyUVZ4OFhaSW13dURic2tyb0FFUUU4c1hXa2hm?=
 =?utf-8?Q?DXmIT8n4iC4Odyc2W1wy89IYQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd3edcc-57fe-403a-5119-08db2b3da512
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 01:26:36.9247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYbgUluvu1S6jP7RdZxqC9dnT88QJqgL7lAgu5AXyC1Jcj/KljR60z/zqQqMXCs1B5b09Iq3E9Ec/VqAou0bZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5375
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136; envelope-from=fei2.wu@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Thu, 23 Mar 2023 01:27:15 -0000

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
In get_physical_address():
    int mode = mmu_idx & TB_FLAGS_PRIV_MMU_MASK;

We do need separate priv from idx.

Thanks,
Fei.

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


