Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pes9s-00012K-Il
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 02:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pes9q-000123-T0; Wed, 22 Mar 2023 02:41:14 -0400
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pes9o-0000tP-Jg; Wed, 22 Mar 2023 02:41:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679467272; x=1711003272;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wTptRTftCQWOV5wcdp79JRpW9f9pYYcXJCzhMrVzVHE=;
 b=Zv90rX45jWJfBdWA9rF25lJFaDeCVnA2Tptjwqugcp5xHwrhFR2jEBzW
 xeigDUhKXoWU1mOorEXEOb88KDoPhbSxu7Twa0Q0mrgccBDZ2QDsnCjiS
 SLF4ccjn825fWXyDEWJrmf0NEBGuGI1T9R5G/8MFN7dqX7dZz04xE0naH
 +uj22POkWEa4MoPvQpnYLezRNU0WtLNtiT8c+DARnMhLvrWcXXv8eoO7B
 VatOWMzJLwOST2UUQxeOAvMRonC0UZn29XuPXAd0Uw2gaAjEeALMqV6sZ
 HjVBYSEd2nYeRDext4TDQSWkTKFt4js2GvvYoC4QCNG/NThW0jWKCfL6D g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="322980794"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="322980794"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 23:40:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="856009578"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="856009578"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 21 Mar 2023 23:40:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 23:40:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 23:40:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 23:40:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cW54f0CQ5MbHnQsj7BxzF+XOB/lg2YGlXPbokY80xvO41xXkdiLJcf8ttMvg6TN6BkJMo35ZllPm4yEFp3dlGsB0NyJo9NSiR+aE3guB7u3dOOiGIxfep/1sKvaQukdtUV760SpqAu+0e+y6oJGYpzZG9UYgpqVM3u7bjv8a7uE7SfZJzw/kHlUyuqzb4jk/HQXxDAvKvDOhQy8o7Xidh5li3EoWzcNlx/NNxgPPcmLHiISVmywQEnuV8WSz4plx9S5D8gM//5uiFyzuVZ4KLA5apdL6AZo6kQRI7rqPLpW+PKCqZtaMEgaA1tpVwNMTPo6YvlRa4dktXKTX34OcYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2w2/+0O2+J9G9BS+96uZR9xJeavIq9InKEdGF88QiI=;
 b=fFd0tgYXl5Jf/BeItdjr2xuzQ4vgoHQroUuO2UHyQwCadqCmqRuGvfd/8crFPD73t7JBMyt5ri+t7UAYyLPImtPG8VsSf9HBarSgxsuTmk2XIsBTU0EPqSh7WGqx+L0GYXhp3z09CuKSclCGvyjfBL4TgBxsQjTF1Aj7k2L2zOg2NAn0rm3G78sZRSm2G7LWG5P70jHBLlr8h+4mtRvaHDisXVQdKPJwkaKbnw5jHD8uSgkK15Fq0AicOhsvAzhkbBDQL5xIV1tUJ+ksPq3irkYipEeAdfpEt3Hjq+HP+HfsNZT1iE0Wr6XCJXUr0YG2Qxg+atcBgaEp/wd6j6mHqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by DM4PR11MB8227.namprd11.prod.outlook.com (2603:10b6:8:184::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 06:40:47 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5%4]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 06:40:47 +0000
Message-ID: <fcac17c1-0a7e-4e84-9fce-904037e52b29@intel.com>
Date: Wed, 22 Mar 2023 14:40:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] target/riscv: reduce overhead of MSTATUS_SUM change
From: "Wu, Fei" <fei2.wu@intel.com>
To: Richard Henderson <richard.henderson@linaro.org>, LIU Zhiwei
 <zhiwei_liu@linux.alibaba.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, "open list:All patches
 CC here" <qemu-devel@nongnu.org>
References: <20230321063746.151107-1-fei2.wu@intel.com>
 <609e4659-532f-0fe2-447a-f7deaa0824e5@linaro.org>
 <209d36a3-c136-5288-a842-3c0b5f1b5d0a@linux.alibaba.com>
 <4f63f756-55d1-70f6-10e1-875c1e515fdf@intel.com>
 <b48b2cb9-bf2c-f527-435d-df497ea4df76@linaro.org>
 <38598c82-f625-b84b-0f91-30b1fe98e8c6@intel.com>
Content-Language: en-US
In-Reply-To: <38598c82-f625-b84b-0f91-30b1fe98e8c6@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0066.apcprd02.prod.outlook.com
 (2603:1096:4:54::30) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|DM4PR11MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: 413f5845-d4b8-4c8c-fb65-08db2aa05e86
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3VoFy9Wo+w6jcSyA6VcnXUgbxACF4FsGnVGyBKg4VgS219lFvPaRz97qrlVL7AhQVg+0D6Rg52v8zINuQSnRsiGlVLZ/szagr/5JNIevVIK4gbElonRIJW0GKxY72fRFLLskMA7lQt57FRM1aOPv6sJ7ZXpWCKbSGsxrMqlprgi8A/U/XigUqvhm9+NfUuCgVtGIW9TL090DCpvtWx7xGh2gV1kLYzIla8e8huQ7pDYJNwW9HNQTfhH4vbbufM6UJ/O+hbcNYli/2o6+BPjH6Wq/Zd0SHW/i9+U1vxKMMXFuIBSq8Jt9Yd2topR62MZm19xm2Pnr0FbWpogxLhHfo6+35xsRKPp8PcXUQGxAugsYVR4yqY+VbSSQo+xX8yPH5S8Yz5IdHYMPN7dMha8Z8AC7Hi9GhuJOJZR1apEsxdOtJZgoHqJSQez31DMPI4jkeAqdKbR7rT8ebjWdRiYHI/7L4Ize2+OC/GyVIJiqiB0npiCIC57JfT8JlnsaQEbycltET+59pc/hM2eY8Kgly5OdVw5ETiVRwjZn1pzVXpbzTmVAP73UGnU58il0Y/V5srGcmCAkxBubgMDa59cBxga4nlOYSUb3584XWkHoSEaYC7qOOQD6v4z7xaYOH3SIpSR6b0Q1DnvZMK8sXZt6ALfYQ+zZSopDzABs03kSnrGlGo+/OCsjLhk1DiEK9dUcghvT/yEEOXVXaW2a3wf3VK4JfDlh/IQMaChVnQGJhyk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199018)(2616005)(6512007)(31686004)(110136005)(53546011)(6506007)(26005)(6666004)(6486002)(83380400001)(8676002)(4326008)(54906003)(316002)(66476007)(186003)(66946007)(478600001)(8936002)(5660300002)(2906002)(82960400001)(41300700001)(38100700002)(66556008)(86362001)(31696002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZW9sQzBtNjBtWlliRUd1QnlveHV4V0ZSb2wrT2F5SWs5MDJ2ODhabmJmVVY3?=
 =?utf-8?B?ZlYvVDRDOTNMQ1UwMXBJbEFFTG1hSnhIVlhGemJ2VGZId3R1enpnT2JuVXJY?=
 =?utf-8?B?UHVyZ3l6a29ENWRBNE82bE0wSG9XWUoxemh6Z1I4NTdicTNrSUhrKzh5OE1o?=
 =?utf-8?B?d0x0UnVMak4rakw1SUhoNTkzSDcvbG1UOWQ1RjYwMjVRa2lRSEdXZUl4WDlX?=
 =?utf-8?B?L2p0eTE4ZzJZdmdocEE3ZHA3ZWJ1VytOTy9oSko0VnR3MitTcDBoNUhOY0tL?=
 =?utf-8?B?eklTWmRvODVleWZVSTllL2Y4Vy9NV0RSRU1aQUJNMFYyaDlXQ1FxZDRmT01W?=
 =?utf-8?B?aFVFTGN6Wm5IdldLYUdhNXM4c3NLblc0OFpIUUJjUmJXVk9tNG42VCtlY0ov?=
 =?utf-8?B?ajZTbWFRaGRWSU9jZHdVV1UzRSt3YUplSzA5Q0NveFdaQTdKUG5iWnVWWlc5?=
 =?utf-8?B?ZzN1enc1bGF1Uy94SmIzeTU4Y3U3NGQwbzlBQWo3M0JXc3hOQTBsdTVnb25Y?=
 =?utf-8?B?UFNQVmZQWlhwK0h2TXFmSzgzYUE5dnVUbjVQS1BFdS9Ca0xjWHpuazZmbit1?=
 =?utf-8?B?RUpvY3hTTEY5dnF6eURIQXZkTk9PL00ycnQ5eHpTanNUS2FZYmFRak5Yd0Rq?=
 =?utf-8?B?UHdVUTJYK053TFRvejRSREl2Y0paTkt0TmliM0xZWkRWWm1hdmxwdGFkbGhV?=
 =?utf-8?B?Qjl2L1h3N0JuR2tHZjgxeWUwMUI3Nm1oTmw4SzhRODlnd05tUWlKaS8xMEpI?=
 =?utf-8?B?YVYyUWNrRklRdGpvN1lidEd6b3pDWHdFMWloTXhuMXVLWjE3MXF6amtNZkU5?=
 =?utf-8?B?R2t4MEt4bmQzTUZRbGtBYlRnSnZscUZmWmk3SjhJdjhOWlpyaDhLRXVyK0FL?=
 =?utf-8?B?OHBuMmhjRk5kSkJvTFdLRVEvYVdEWFFkeERpamhpcWlEc2hRRzROVjV5aVJD?=
 =?utf-8?B?V2daWXg0ZWJKWWFiS0ZpYWZSbWVPanJ4TDk2M2hmQ2NHbVQwQ2dNRlVMVTFM?=
 =?utf-8?B?a2JrL3ZzemdIMmtrYUIvSUMrZWRzc24vNVAvZld4Qk1ibTBDYU9YL2p5bDRE?=
 =?utf-8?B?MlU2a0hFb24wbmxnbkVqc1pNSytMSm9raC9ZVDZmYzNRbTJ6Q1VhVVk4c1dz?=
 =?utf-8?B?S0xnNmptZ0x2bkgreEw3V08rRzRaV2s4ZmRPdGxNY0ZBZ0d5R1EzNGp3WkFy?=
 =?utf-8?B?aWpYaWovN0Z4WENwRFFTZTBwSkJCY0RwRkpZajBQWUIyd2U0cDNwb00vODNK?=
 =?utf-8?B?Y3hJT0E2bzFLdEQ2YndES3RvdEltTDZQaUpvWFEwMWZaOWFRTDZZdGFqNnJy?=
 =?utf-8?B?VTBFZ3FvNy9vdFJ3bjJBaWlib3QvZzZENjFRbTZMampzclF2b2JVVmluM0xE?=
 =?utf-8?B?aU85dUhrL3ZkWnJJK3pzalZTeVh2WXlWaC82WnFwMEozaXp5ZmNmdkdGU0Fo?=
 =?utf-8?B?OXpyK3FlK0JuZFlMaWRacnVaQ3ZVWUV1OFZSdU9sZnUvWktncW56K1VPYkVx?=
 =?utf-8?B?S1pkUTJBWkF4elhkcFF6VkFDSDM5YlllUG4vYTZjdmJGQjNJWU9ndmV4SzFB?=
 =?utf-8?B?SG1CRVpYS290eUtJcjl4SHMwNzdyOWxFVnlWZU5qaUxISHI2SGNEMHg2T0xt?=
 =?utf-8?B?eG1NL3dQWlFPRFdzN29FMHlmYnh0MTJKK2M2UklnTnZycWJoNXFaN0M1Q0oy?=
 =?utf-8?B?bzNQbHd1SG0xTktUdWJFSkZtRGNQY3Y2Z05BWStBY3pScFJrcC8rWkU1bERJ?=
 =?utf-8?B?R1h0NjRLcXlGWkhrSGtkRllGS3Fpb2hhN1R6WE10akZHU1R3RzJ2eE9pam9o?=
 =?utf-8?B?M3dwLzBUT0tRMkg0OVZUMENwTjMrZThiM2luZVE0WUxjTkZlNi82QVFibUdX?=
 =?utf-8?B?czdUaHRSLzFoUmt4dndCSmo5VE13VFVYNTNmd0JTU2NhV1prbU9rSmVOWDNL?=
 =?utf-8?B?bWVtMDBRc3pXSmlqcStMdFlvbDFjK2RrTnFNdTNLMit6aUhmOVYxUXAzSm9v?=
 =?utf-8?B?c2Y1QXFta1VTT3V0di9zeStaWUVMVnhuMm1xamgxdDhuS21iUHhnWU9rajVJ?=
 =?utf-8?B?S21qZE83MWpjb3phVVRQcHZYVTArMFlWY2djTUJzTkV2TTJsekxMZGR1ck1I?=
 =?utf-8?Q?qSSl3i4z9ZsvqKJ5swXZoIQMf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 413f5845-d4b8-4c8c-fb65-08db2aa05e86
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 06:40:47.5845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqkqgSyc5nQMFe3ilcZ24GoFeEZ3Hh8fnVBUpCjLnUfqTdFK7+DWfAu20Hohw4cc+5cCnQ+rURWRvYrMhPwD+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8227
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.126; envelope-from=fei2.wu@intel.com;
 helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 22 Mar 2023 06:41:15 -0000

On 3/22/2023 11:36 AM, Wu, Fei wrote:
> On 3/22/2023 11:31 AM, Richard Henderson wrote:
>> On 3/21/23 19:47, Wu, Fei wrote:
>>>>> You should be making use of different softmmu indexes, similar to how
>>>>> ARM uses a separate index for PAN (privileged access never) mode.  If
>>>>> I read the manual properly, PAN == !SUM.
>>>>>
>>>>> When you do this, you need no additional flushing.
>>>>
>>>> Hi Fei,
>>>>
>>>> Let's follow Richard's advice.
>>>> Yes, I'm thinking about how to do it, and thank Richard for the advice.
>>>
>>> My question is:
>>> * If we ensure this separate index (S+SUM) has no overlapping tlb
>>> entries with S-mode (ignore M-mode so far), during SUM=1, we have to
>>> look into both (S+SUM) and S index for kernel address translation, that
>>> should be not desired.
>>
>> This is an incorrect assumption.  S+SUM may very well have overlapping
>> tlb entries with S.
>> With SUM=1, you *only* look in S+SUM index; with SUM=0, you *only* look
>> in S index.
>>
>> The only difference is a check in get_physical_address is no longer
>> against MSTATUS_SUM directly, but against the mmu_index.
>>
>>> * If all the tlb operations are against (S+SUM) during SUM=1, then
>>> (S+SUM) could contain some duplicated tlb entries of kernel address in S
>>> index, the duplication means extra tlb lookup and fill.
>>
>> Yes, if the same address is probed via S and S+SUM, there is a
>> duplicated lookup.  But this is harmless.
>>
>>
>>> Also if we want
>>> to flush tlb entry of specific addr0, we have to flush both index.
>>
>> Yes, this is also true.  But so far target/riscv is making no use of
>> per-mmuidx flushing. At the moment you're *only* using tlb_flush(cpu),
>> which flushes every mmuidx.  Nor are you making use of per-page flushing.
>>
>> So, really, no change required at all there.
>>
> Got it, let me try this method.
> 
There seems no room in flags for this extra index, all 3 bits for
mem_idx have been used in target/riscv/cpu.h. We need some trick.

#define TB_FLAGS_PRIV_MMU_MASK                3
#define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)

FIELD(TB_FLAGS, MEM_IDX, 0, 3)
FIELD(TB_FLAGS, LMUL, 3, 3)

Thanks,
Fei.

> Thanks,
> Fei.
> 
>>
>> r~
> 


