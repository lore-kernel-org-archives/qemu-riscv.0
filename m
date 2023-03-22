Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1peyGX-0003eI-El
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 09:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1peyGV-0003dm-Tx; Wed, 22 Mar 2023 09:12:31 -0400
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1peyGT-0007y9-M5; Wed, 22 Mar 2023 09:12:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679490749; x=1711026749;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RK7592G0IVXDjMfkfjijll8TQid6pumVddasqzpnih8=;
 b=M4zY2Dt5jJQH/pB62X8d9u/PSFTwQ07WywY9fCj+NOIDVVHUQBPv83fq
 YiqcV6rYPC1giDeD+0NHwRWtevUpS1TY3La2rgskshfn66/Gnu0r2kOHQ
 U8Al7KtYk9I1C2qj9ViKcM9OhoBrMQe3qKbUuH1O8Munb6hDAZzJRDMNT
 7kFo34ZhOcgakyNrcC9F75CQzVslv8M73B+iSvZIbPBxuVeyJRaDAh6fb
 8hNUWO4jxE4Aw6Ip0nVAJChp0Pt7Xy8bLgfcwzvNHRi1RMoY5YFeo5Ccm
 IR62EbvaCwqY/5BUuUmDpeVgtfANtzCbo1Lifi6rVcNanx6resDv0Jg+/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="425495814"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="425495814"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 06:12:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="1011351600"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="1011351600"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 22 Mar 2023 06:12:24 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 06:12:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 06:12:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 06:12:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZ8SaakDZ5DWZoMtGbcHZ+nAh9DfqceSXHhTgUnafY5BmwYcp0OhhMfYg0VmvjHt7Lew+AkqMrKlEVLtvef8CZAEvEM9RkNoq8YuFNsKFWbO+p9t06zUUuDMuMub5L6RdoM9tMzTN1Ez03ZAgL8bq8hm6fgvXBHrJZk/ap53tgvDLCO1VCSgx/1iEtVvAeQPEXfuYxiNwbNQLBB0PLDoReUTfKJkRSM3RNcwSd+jLBkk9UFpDP54AObh9g2iVGXwx790W3eGSQheW0Rei7kQMiYHP0PRuBANu872oBuXCqZMHS1lTp+XU4ZZEr8MzmkJIZx1hz0KVYKsN9eQRh0HUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+U+Eg/Exeu3bkcgm2LvA/h4IQ7mJRHi8yvfFRsiXTQ=;
 b=SQ6dxt8i2sPxGXhpHyeIXY/0JRdx/gk7yq9gig/hGyt62wKRcSeQ6bTiezJOb24q/reHRWuOOIjuMukHCbU8+w3YLvPWvbkWjZypO5XADHaNAFSh/m2u1s0yVlOvOcdyMXOSUyVajkXA3bCUnh3S0h8BH/6xgqBjviQgvVSQDfBqRuR0rnQ7VpmqTCv9xTuvb6qFc2wSaeLC6jEk44J3Fz/NvY3bUAxyNdYlGs8QNactvrlogbSd2jgC4GAPCI2oAr7tN0gdfp3KgzQUk9/pPvSLXZ0R70YaflmUUTjWyusBrrm94Ak4q/Gh9fanNDlCKPKXB/a1T/EaH4CIfHBJVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by CY8PR11MB7848.namprd11.prod.outlook.com (2603:10b6:930:6c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 13:12:16 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5%4]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 13:12:15 +0000
Message-ID: <70b966da-dfcc-c7c7-6895-5c5cdb7b7339@intel.com>
Date: Wed, 22 Mar 2023 21:12:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3] target/riscv: reduce overhead of MSTATUS_SUM change
Content-Language: en-US
To: liweiwei <liweiwei@iscas.ac.cn>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, "Daniel
 Henrique Barboza" <dbarboza@ventanamicro.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, "open list:RISC-V TCG CPUs"
 <qemu-riscv@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20230322121240.232303-1-fei2.wu@intel.com>
 <585bf39e-91e9-bd85-1fee-80ff0b4c0a8f@iscas.ac.cn>
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <585bf39e-91e9-bd85-1fee-80ff0b4c0a8f@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGBP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::13)
 To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|CY8PR11MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: 444a19e7-3405-4d64-6090-08db2ad70e76
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tj/YzmxbijA+I5y+l77qWMzUA0pek/XuAIrgGYO3kqSoNlMV967CYGpe2AF5AQcnaEFRjPdBQE1N4YdlGqCGDSISRb+CiO7B8tWyOiju4+M9cG3dDS4vaT6NC6veMyzAYZFZusiUqu45MEoN1rcAU1AzdMmB6rX6J7IufncIK224FB4Pd4KwTTFGVNoE6PDSiv23i42reoO6JStVWhXKnQ8wTF1ok67Hr+7Zug/z0Z/G9SStXQUuhbNoGeDuUEYWcqXX+hH+lDhu6NCArSQUaGtRLB/gkoBDse3mFtMq1xHVnQL66pU1VAo1uo10ry1zyrGQPEL6mtdwRqq68qMHiG1uwftMO47BvmJR8aE+lHOV7KyDT8fpOcFhTXVMK0Usbd3FcRkoAgx1rBQCeBqo9Q4PlP0yDnxOYC5SC94VgRMFqx9wjJoXr6GsSTU3z0gfuM8QchmVED9DuWNko/ZBIN4BaGtXyHn/atBq1jD01L1tGli2UkNJUzOk2sYutRXqMYQzm1Njk1RZ/a4R9zcRyKGVHGHCSsUFHbcMd6XzOlIsEmqateMFj5UHIhF3AdkODdV1cfx/WAd3WVq6DKO7u9X2ipRTAdbWrG16C0ChX8pq179I2hJ7aBpcfwyChWpr6xtyjiSBn3CvJfwcjGNsKcvK6G2kcsUaiawdcUCbVolrTeRj01IxDc50uqex6X0SyOrJo/rHCmI5VV3g9jdvVawh/Wplt9onw3tZf7zVzSg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199018)(31686004)(2616005)(6666004)(82960400001)(6486002)(53546011)(6506007)(26005)(186003)(6512007)(38100700002)(31696002)(478600001)(83380400001)(2906002)(86362001)(316002)(54906003)(8676002)(66476007)(66946007)(41300700001)(8936002)(4326008)(6916009)(5660300002)(36756003)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3VTKzI0a3YzUHJ2Y2VMTlVrdldYaDRKMm5yRkd4WHhmRVhpbVEyVG0xTFhX?=
 =?utf-8?B?WUVVMGVuQVpleTJwMSt2WDJUbTBxL01YZnYvdk1IdkhXbllab2dDYU9FNndn?=
 =?utf-8?B?dGFSTlhQVGxRbUxYYTBpclgzY3lBam43cDhIenh5TGY1d2hVamg3TitpUER3?=
 =?utf-8?B?SUFaRndkU2wrV04vZzRvQ3dHL3YraWg3cFhhaDBUbHNhV0pWODZlbmZoNmMw?=
 =?utf-8?B?c1cxMk9lUUt2akZnZDRTQm9RaDdoaHV6N1ZaYjdZZk5lUERWSDhPcnNDcTFj?=
 =?utf-8?B?d0IvUy9aOUpiNk93cVF5SzB1WnpSN1hvdmNDb2NuSmVSb0ViQjJzV0tkOUhu?=
 =?utf-8?B?a3dwTS9ZK2p0dDZ0ZTFEVlRQM3ZnOHYrQjVnK3lsSWFwcjRFNW4rY0lXemZK?=
 =?utf-8?B?Zk1tMU9SQmdWNGdHL1pwV1Vta05YamlzZDdmVDM2cDNMNXRFZlRNaHhQZktJ?=
 =?utf-8?B?dC9MdXQwNm5udjNmSXFyYVZLa3Rkbk1EaXpicmxiTFdrWkZJM1RhTExtQmth?=
 =?utf-8?B?TlNvd1IyUFZIUVBOWlRGa2Y2eHc1eDJCczRsNkhKL0dTSjAzZStqWnB5SGMx?=
 =?utf-8?B?L1F0YW5NbWpiQ2MrUGRWWlhyN1B1ZThpT0NZU29yclBIRzM1RE5la2hsdDN3?=
 =?utf-8?B?dEh5UW9KMHhCeGI2bGhmYkYyTC9OMTR2VVhJUitrUTQ5UUVtWUdYa0N2UzBt?=
 =?utf-8?B?SkRZT1JENlJjd1NyUERRUlFwdGN3UzRKTWhScGt5cnBjdTBSWEZrZmltdzRK?=
 =?utf-8?B?czNiTUJiclBPZWhraml5S0lUeEd6YyszQkNWTS9rVERJL0VBd09ERVp0cjlx?=
 =?utf-8?B?S3hua3c0R3lBL1N5Z3dGTFlPNC9jY2d3elBLcHBlMVJjUXhtazZEMEx2YnVK?=
 =?utf-8?B?M1ZSQ1lFek5ld05HckRKcVZZb2I5S0dYbHVrWm02TGN6bmVRUWlTdUd2QWdx?=
 =?utf-8?B?eUMvelpyU3ExdmhnR0VZZHIvL01lWWpnTDJjZTltaGljb2RnU1RPcEUxd2dj?=
 =?utf-8?B?V3R6RlRvM09WV1hlLytNZGp5Z291TGNybzN2T3NBeG1kaGFZMDBReDlvQzh2?=
 =?utf-8?B?czErdTVXNG9jVkhXUWt1T1hmV0hBemVZYllHUTlKeHF0OU5SUStQVEx0UnE1?=
 =?utf-8?B?OFIxQTRFMDVWMDExRlZHUkwxay80b3NFZEVCNm9UT21LS3dTQWUzdmZkWWJl?=
 =?utf-8?B?OW90NnZZMURoc0syVjdWSEZ0bk9lblE2cThtbFN5ZU0vQ2dkalpmWlF3TWFk?=
 =?utf-8?B?bTJmbHd3WjJiVjdpaXVmc2FJanRZNkZDVTVhY3RFSi8xdlZXZEcxZVl0K1VB?=
 =?utf-8?B?K2VHN3BqZ1NuU1kySThSN3pNVmx2YnYydW54TDFQQ2xZbVZqVnRYSGR1Lzdl?=
 =?utf-8?B?UzUxa0xYaFk0VWhPdWJMSkx6bk9NUlNPOXEyUGh6UGxRNVEzUmxmSGxLOG8r?=
 =?utf-8?B?MXB2RHB6aTExSld6T1FNQlBjK1RJcVN2bE5QZllZaU55ZGFxeFZ4Y2lDTTZ3?=
 =?utf-8?B?SjlCb0VqcHBIaFBWb3oxWnhndmNRRS9wOEJxUXgzME5jN0lOakwraFFrTWRv?=
 =?utf-8?B?MkhOTW83TWpDK0RYYWZLSWhOZkRwczJMK25Va1c3T2MzaGRZRVY4bGdUalpt?=
 =?utf-8?B?YWFLQ3F1TzdxdzVaOE1TTTI2M0VwZ01lQVRObjVUYWZqbjJMVVVWdlRPMGsz?=
 =?utf-8?B?cURYMmFZU3VyRjJjL3k3OVM4Z25XVE1EUWRpZmZVV1NFamhFMFFyMHYwNFc5?=
 =?utf-8?B?NXErSU1pY0V0UHdUNDJYL0FWb3BNMW1EVFAzSHQ0YytyVGs0c05OK1BvOWZD?=
 =?utf-8?B?bVB0WHhyK3NmZUV2UjBXZitaMkwwb2lnQ2o2YmFRMUpVdmtTSWxkbE9acnN3?=
 =?utf-8?B?UEdxSFZxMGJXL2E5SXlFbTF6c0tZQVE3aEQ4ajF1RVdHSEZ3cmFFa3FWYUZN?=
 =?utf-8?B?QVdLL1dTNVl4NGhMVm5aYkt0aVlPcklCazF4Rm1OUFVTK1ZvWUxVRGRYRFov?=
 =?utf-8?B?S3VsUzRUbFY0clVZY0xERUhJTDdhcmRIcGFkVTBkZkVOUldJVXlXMmI4U09q?=
 =?utf-8?B?S1lIdzNtTzU1dU1ISEVQWEh1dVBPejRhNGUxcWJRNDI4SVpKMWlPbGVzdE5Z?=
 =?utf-8?Q?XJXkpfu4yHyQ43HlIsR0AAlSZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 444a19e7-3405-4d64-6090-08db2ad70e76
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 13:12:15.5781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGyGW9rhKQYlwluaco0XxzCHsqTMiesaqSPEEw3Vnq9EoTKvAyoaKX8EosdNRammOQkIKiOWPzlbhvrAan5KqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7848
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.43; envelope-from=fei2.wu@intel.com;
 helo=mga05.intel.com
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
X-List-Received-Date: Wed, 22 Mar 2023 13:12:32 -0000

On 3/22/2023 8:37 PM, liweiwei wrote:
> 
> On 2023/3/22 20:12, Fei Wu wrote:
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
>>     #endif
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 638e47c75a..ac8bee11a7 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -624,7 +624,7 @@ target_ulong riscv_cpu_get_fflags(CPURISCVState
>> *env);
>>   void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>>     #define TB_FLAGS_PRIV_MMU_MASK                3
>> -#define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
>> +#define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 3)
>>   #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
>>   #define TB_FLAGS_MSTATUS_VS MSTATUS_VS
>>   diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>> index fca7ef0cef..dd9e62b6e4 100644
>> --- a/target/riscv/cpu_bits.h
>> +++ b/target/riscv/cpu_bits.h
>> @@ -606,6 +606,7 @@ typedef enum {
>>   #define PRV_S 1
>>   #define PRV_H 2 /* Reserved */
>>   #define PRV_M 3
>> +#define MMUIdx_S_SUM 5
>>     /* Virtulisation Register Fields */
>>   #define VIRT_ONOFF          1
>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> index f88c503cf4..e52e9765d0 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -36,6 +36,17 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool
>> ifetch)
>>   #ifdef CONFIG_USER_ONLY
>>       return 0;
>>   #else
>> +    if (ifetch) {
>> +        return env->priv;
>> +    }
>> +
>> +    int mode = env->priv;
>> +    if (mode == PRV_M && get_field(env->mstatus, MSTATUS_MPRV)) {
>> +        mode = get_field(env->mstatus, MSTATUS_MPP);
>> +    }
>> +    if (mode == PRV_S && get_field(env->mstatus, MSTATUS_SUM)) {
>> +        return MMUIdx_S_SUM;
>> +    }
>>       return env->priv;
> 
> If we return mode here, whether tlb needn't flush for changes to
> MSTATUS_MPRV and MSTATUS_MPP?
> 
Good point. Besides performance improvement, it sounds more reasonable
to return the effective privilege mode instead of the plain priv, why it
should use the M-mode tlb index when it behaves as S-mode.

Thanks,
Fei.

> Regards,
> 
> Weiwei Li
> 
>>   #endif
>>   }
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index ab566639e5..eacc40e912 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -1246,7 +1246,7 @@ static RISCVException
>> write_mstatus(CPURISCVState *env, int csrno,
>>         /* flush tlb on mstatus fields that affect VM */
>>       if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
>> -            MSTATUS_MPRV | MSTATUS_SUM)) {
>> +            MSTATUS_MPRV)) {
>>           tlb_flush(env_cpu(env));
>>       }
>>       mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
> 


