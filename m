Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1peoW1-0006Ae-IX
	for mharc-qemu-riscv@gnu.org; Tue, 21 Mar 2023 22:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1peoW0-0006AR-9X; Tue, 21 Mar 2023 22:47:52 -0400
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1peoVx-0002TF-Sk; Tue, 21 Mar 2023 22:47:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679453269; x=1710989269;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WKolp7IWWpPaVnMeicAXG+4vpBAI2NdOzOjmHYRSsf0=;
 b=Z3ZnZc3WituBweuyj5xex3ORUTYLhdHx7ScCxN+qH2KusRIsKjsgWmK3
 nlNXwpDoym9zMVmkmQb/0cSaJ3uq+lM98Lk410VGE2H0pNvbr2LqDGdS8
 tHI9TbQpfAQm/uTrrSit/mKZnoSW5uxQZop39c7Zb9ktXZSG1i+cDLNvj
 IDehcuNAKWv4Evopj+Q5BlBI805pDX2X23u/Rj4YDRAXqU2FBpEjsRcEp
 BOBfQ1DXpHPX8h53R2OFZi7DDBlPU5b7fh7RBSqgfpa9oI84uxTSQ7EQR
 5bpFqddZ6AYzH6kwX1e05vyQySoHMRisjy+p1PrTRu2Zi/SgYsvaVoK9F w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="319499932"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="319499932"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 19:47:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="684140856"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="684140856"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 21 Mar 2023 19:47:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 19:47:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 19:47:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 19:47:41 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 19:47:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kX/bBK+9gcBpWwSsGD9BP7vuE62mGboBxP1eeaj/L2WS39WPqsSqbBWjOvBstP41mb/yGBBLPVO9/1pDtnOyqc8FUnkNDwv4IUEQYOyuh7u8pvCmsZ9R81KyFML8S5OnveLABTZJg90tb17UOhOiEC7n9ybV7yK+3Y/PsSKY1OiQANQ3Xztan7n1IfHivJ2U3t0EqO/3hp7bHJyIg8xEuXMzPyTE+x2XkuVY5c974fEr6CeQ/jAzH1GA7BiobJ7C/8xNYWnhQ7DJq0GM1iqUokz3WKGcJtUGcD7MkpgYZceJ2o5oylFAbiY5P0VRBmIogSLjUlTyKT1HbOZvxTxlNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mc9+TiF0fqJj2/2/YEJekXz3Oa7MhyjGdOzbP+uYyLU=;
 b=Ylj7b4gCydtjd+0uou4D4b4Jfxtmj7ngof+6RqxTqXrYkjkA2OKLkg/TElDFHsycIU8usHy8JfKPNY6eoZxg8EbaJousqvTaOnBRQMip179CaOrLBaBoha6gKmWO9ice7vVQYs1tElFJGveHOCjNTkgJE3G2quAGJz2/qCwbKUGJ3zsSUR1+GIboZ6h/oZlpPbhEKcawVBw8U7SzDEDPHZ/uUeyxdpEZeczDhnvxIRVCaGTkpvUTzfUOa8ADcF2r3gC0s3NstfJ0s0R/yqxEFd85pvAaQt+XAII9CGxX77wUVsgh9+usmVIJuPcxonEF4fvAlcDjaZ2hCgsiMkt8Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by SA0PR11MB4768.namprd11.prod.outlook.com (2603:10b6:806:71::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 02:47:39 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5%4]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 02:47:38 +0000
Message-ID: <4f63f756-55d1-70f6-10e1-875c1e515fdf@intel.com>
Date: Wed, 22 Mar 2023 10:47:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] target/riscv: reduce overhead of MSTATUS_SUM change
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Richard Henderson
 <richard.henderson@linaro.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, "open list:All patches
 CC here" <qemu-devel@nongnu.org>
References: <20230321063746.151107-1-fei2.wu@intel.com>
 <609e4659-532f-0fe2-447a-f7deaa0824e5@linaro.org>
 <209d36a3-c136-5288-a842-3c0b5f1b5d0a@linux.alibaba.com>
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <209d36a3-c136-5288-a842-3c0b5f1b5d0a@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0046.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::15)
 To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|SA0PR11MB4768:EE_
X-MS-Office365-Filtering-Correlation-Id: 60ac4e42-179e-4d02-9d7d-08db2a7fcc31
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ia6Ai4H5KgzRZctPOPNJirzEQXKorwMLXFMbeGEnFdPicCKzN82xbNqVWJ0U/mMo4qy2e7uRHQxF6huhWbIuzsdVjnsy8bHW9IdD76buAQxU8bVPVh8xJb74D9nTjjBveolnF4VEqc2Bvrz9y1gdBws/7NX3/nD3Z/DNZNaxyrtg5UdayHV8hJTmXlr2MD8co9jdVmxYxpAJhTqM+NlM+A6+kUN85HFJccJ/eLy3V5bH16xp8m0DeLxgcHKW4+PzTTrFQtGmftLlJ/WgtXfUFha4ofrDzFLfHfvlz/TXLtnpeIF01z0Sxzz/U+DnRJfkO1M5TpCMJU8vVGJCMNnT0FGIQCJaSxPCtJdlaBPxato/iNx83xr/8EqGLI0yKL5K4xPiwkGGyWmwfUv22YYfXO6UzsKYK4CkoizPpZgMtrAAEV/fZxsA9KEg1OvxKZ3uJQtpc68xplBn8g7dUZnCN1BYBgKP6mrikIKwLQmjn7aBiDuRKZCuQKQNP84neAr1TGKtBWlF1ZjLA+qo8hGIRT0EhArhr9umpdqykbCeKyFiExe9DKi879jnMsNE1zbUPxJLFhQVXR3MbX9WJOPmhYG39Tr5lE4jC+RLyaH7KyfF6pj6lmwWQho8y4+k+Ey4Bp8ssdzhFjIJwU9CJ6t6gVJJ/71S7DvYe1zrnMoC3Ts4WNf3fyomxmgRdxZHgibNxlJWIC9Pc1NqhHL2Z+eW/9KUixby4F22ouqk4C2sTmA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(396003)(376002)(39860400002)(346002)(451199018)(2616005)(31686004)(6666004)(82960400001)(6512007)(53546011)(6486002)(186003)(26005)(83380400001)(6506007)(31696002)(54906003)(38100700002)(2906002)(478600001)(86362001)(110136005)(316002)(8676002)(41300700001)(8936002)(4326008)(66556008)(66476007)(5660300002)(36756003)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXl6a3hzTDJVd2V0TnpWVXhGTkVXQ09ERDZaMkM1LzErSnVWZ2NhV3N6Z2pB?=
 =?utf-8?B?VktRM3RjbTdkd05ya2JmOFcyNHZsNVdqSm9MeVI5cWFEK1dKN2lDTWNhZith?=
 =?utf-8?B?NGJHUytYWUYvMHVOUW5kYXp2NkdQbFdNSUJxN3JNNWo0SDlHaGpHSkt0ZHUx?=
 =?utf-8?B?Qmk5QjJLRldzUnJETGxGMVVZT3dlVmVUSDdZVm9QY0FMM0RRSlBxSWp1NnBV?=
 =?utf-8?B?M2FWaExtOE5jTXZnbjdtOS9WUytZUk1zeXlmTTZMZXFnTFgzSnE5VFlLb2l0?=
 =?utf-8?B?MlNwVlZtYXFXa2c1ckZYRkQybjhGK0FKcGhpbGwvWXdwQ1lTbUxHQmxHM0ZL?=
 =?utf-8?B?SW1XMFFIdmVHcjcvQzlvYmZqd09sbUh4V1grWStJMWdrTWxUUnc0UW9DOHhv?=
 =?utf-8?B?aXJIUG9UU202dWxqc3hXMEx4UExPTkJ1bEJ4ajM4SjlBZU14R3VwYUpUbEcw?=
 =?utf-8?B?TFlFNHFpZzBxYUVUQVprQTZINElLdWRBTDFPT2FEYks1U0N1RG1vZFR6OFk5?=
 =?utf-8?B?THJVZkx2bHNHazkyTEhaVFlxYzgxRW1nSDZidEg1cUdYQjZLTU5MSUVJbWNt?=
 =?utf-8?B?S0RMcC9KS010YVdTb05QbUIvTWFPY3ovQnQwOTg4cE00bkhZSTNoWmdDTkNp?=
 =?utf-8?B?MnpVVEZrNUVKVXc4VW1Kb0hIeXZlbm1pSzFZcjZUa1RoR0t4OXhseEJnZWFY?=
 =?utf-8?B?NHFjLzcrNlBDR21QaE5YUVpJRjY2N2ovalRJVXl1Ym9Nd3pXWEs4akFpR0pI?=
 =?utf-8?B?a2cwUHNYYnJlZFR2L0xnTlBwZGxLUFhKSXRMR2U0WWhhdXZWQXdtR0xVekxL?=
 =?utf-8?B?UjRZRFNjazVBd0htM3hJVVZyTWEzUU8rMUZxT2c1a1pZRkpncWx2S3NpQ0lq?=
 =?utf-8?B?UTZ2RnJhUlE5ekZOOG9rOTZmWENJYXRQOFJWc3gxUk5PZmxjS2lmT0hjeFZN?=
 =?utf-8?B?T3RxeXcrc3hxemp2VmhxTTlkQnExdyt0NzhZQXFaaDF5c09jbnQrNGRwWHAw?=
 =?utf-8?B?L08wZkJNbVM3TmhUNDZEbmVLbERKUTlTUU5DZk1oWnA5Y21uRVgwaXpWdjlq?=
 =?utf-8?B?VUdoQzFWOWFuNCtaam9mb3RKVlQzOCtRSUJtTEJUWE1pUjlQVjRWV2x6S0du?=
 =?utf-8?B?S2ZabGM4VVpPNVhyUitXd1RIOWVyQXVKVkx5V1djYlJQTndHUWR0bG5FL3Z5?=
 =?utf-8?B?c243MHlVM0luRWtNZmtoeGduYUoydzN3ZlBSTElzanJIWUdaVmxaSTlUakE2?=
 =?utf-8?B?eW5qV2hObTB3NHNqcXJNQ1poSTRPR3lybkVOSGg3MFdhL3JtTU1Tc3RuVzVZ?=
 =?utf-8?B?V1JYZVI2czRONXE5ZkJQZ1VOMmNuMXVrT1lLM2J4Zzg1bCtyR1NnYWxVM1BG?=
 =?utf-8?B?Z29sbGtwZ3BPVWNUZk9OWWp3dm1abnVCTXpVZXhiTlVISWlvc3c1K2NBZnBS?=
 =?utf-8?B?ejA3ZUxKbFJ0d2VPbmFJM1htMjArYjhUQUY4cGR6a0dPWDRJV251WGdvclZD?=
 =?utf-8?B?UW5Bamk3c2FFUGMxZCtvMDVxQml0K01peHE5T2NqQ3pvVzZZWWpQUkpEV3hC?=
 =?utf-8?B?S2xsYmJTcGhNbEN1bktBb1NYd01pdWx5ZU9VN0JlaU1YM0s0bFVQb1ZTNnBU?=
 =?utf-8?B?b1JwVVBVa2N1NU5VYkJsSm85NVQyNEN3dGwzMWRxNE80U3hyQ05vcml4ZkVR?=
 =?utf-8?B?eUVjSHpTRGgzSHhCMFI4ZVBVYU5wbEY2T25jNmJCenV6ay9uWFFlMktIaFlD?=
 =?utf-8?B?d3NnbXlnNUZiQlBCSFdhYXhUTDlmSHN2Q1JBTFF5aUx1Mm5BemM3WGtwL0FU?=
 =?utf-8?B?SGtsTlEvUEJPSmhJM2NEN2ErcFpCdDZyZDZETEZhUGhRM28vYVptTEdyK0tI?=
 =?utf-8?B?QmdzR29QeGNvelI3TGlQZ25nL203Y2Z4cmovcHdWelBIVCtKUVdQQnhlUEt2?=
 =?utf-8?B?TXJuSGZtV1U0N3F4cEhBWllFVUVEOGp0eGdHUVlaYXJjdnNlVE51QlFQWGxu?=
 =?utf-8?B?UWh5R1FQZmhXVmFXNURiN1lVTk5MWFdCMEoyOTBsK2xsOHl1aWYrYU5pbklj?=
 =?utf-8?B?ZXZkV3lUeXpsUHArN1A3R25UTnRpZVNYTEJXZjN3cTlHWmpyeDlCakVhd0VF?=
 =?utf-8?Q?aauzjiF1BzMX6oUhaXlIr9tzf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ac4e42-179e-4d02-9d7d-08db2a7fcc31
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 02:47:38.1667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ix3zb5G04rsOMqCUcgfxAZyai+7Qo2IKhYG55cR4TnPjHZK85AIzFdp7AiHFhTpUumWoF+gaSZklp5YA10drww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4768
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
X-List-Received-Date: Wed, 22 Mar 2023 02:47:52 -0000

On 3/22/2023 9:58 AM, LIU Zhiwei wrote:
> 
> On 2023/3/22 0:10, Richard Henderson wrote:
>> On 3/20/23 23:37, fei2.wu@intel.com wrote:
>>> From: Fei Wu <fei2.wu@intel.com>
>>>
>>> Kernel needs to access user mode memory e.g. during syscalls, the window
>>> is usually opened up for a very limited time through MSTATUS.SUM, the
>>> overhead is too much if tlb_flush() gets called for every SUM change.
>>> This patch saves addresses accessed when SUM=1, and flushs only these
>>> pages when SUM changes to 0. If the buffer is not large enough to save
>>> all the pages during SUM=1, it will fall back to tlb_flush when
>>> necessary.
>>>
>>> The buffer size is set to 4 since in this MSTATUS.SUM open-up window,
>>> most of the time kernel accesses 1 or 2 pages, it's very rare to see
>>> more than 4 pages accessed.
>>>
>>> It's not necessary to save/restore these new added status, as
>>> tlb_flush() is always called after restore.
>>>
>>> Result of 'pipe 10' from unixbench boosts from 223656 to 1327407. Many
>>> other syscalls benefit a lot from this one too.
>>
>> This is not the correct approach.
>>
>> You should be making use of different softmmu indexes, similar to how
>> ARM uses a separate index for PAN (privileged access never) mode.  If
>> I read the manual properly, PAN == !SUM.
>>
>> When you do this, you need no additional flushing.
> 
> Hi Fei,
> 
> Let's follow Richard's advice.
>Yes, I'm thinking about how to do it, and thank Richard for the advice.

My question is:
* If we ensure this separate index (S+SUM) has no overlapping tlb
entries with S-mode (ignore M-mode so far), during SUM=1, we have to
look into both (S+SUM) and S index for kernel address translation, that
should be not desired.

* If all the tlb operations are against (S+SUM) during SUM=1, then
(S+SUM) could contain some duplicated tlb entries of kernel address in S
index, the duplication means extra tlb lookup and fill. Also if we want
to flush tlb entry of specific addr0, we have to flush both index.

I will take a look at how arm handles this.

Thanks,
Fei.

> Zhiwei
> 
>>
>>
>> r~


