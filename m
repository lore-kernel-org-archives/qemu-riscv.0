Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA47FEC8747
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 00:17:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qePB0-0000uk-Rj; Thu, 07 Sep 2023 20:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1qePAz-0000ta-KV; Thu, 07 Sep 2023 20:16:45 -0400
Received: from mgamail.intel.com ([192.55.52.93])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1qePAu-0004ES-Ls; Thu, 07 Sep 2023 20:16:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694132200; x=1725668200;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pkzwdnaxO0KbzxGPq+1OX3IWCBE9/b5TpJ5tacqbJI0=;
 b=OBUcUHOgEcZv6DCQzRewFE3H6xjRXgHcQtNKAafIOOeQCtIHQYbTFGOn
 AlG7Hq420rIQPu+OpIFzDSaosQ7IYSqCaa07LEqduusxZgyPTUPG0qsEj
 ZfLvlz4yDWfRGTh4q++ZUnSQrBtlIgY/bLDenEyfTnwmV9kNCBr7iM9W9
 yYBxlzEhz1vTRdluDX+07J4gLhlcWLZawd55nib7qPsYd69BOOlzodlKW
 MdnIAf7Nk2JB5JoDDe+0+ZdJpxvrkz1jfOmNXTjtj00zZ5txgPgODuW0U
 I7SZeZSzOU6TVIPfDCXOAchq0kejJGbR5sYgEzc0906Sh309vQcwC6YYj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="374898727"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="374898727"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 17:16:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="735721239"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="735721239"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Sep 2023 17:16:36 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 7 Sep 2023 17:16:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 7 Sep 2023 17:16:35 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 7 Sep 2023 17:16:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OT8jGjiie4q6Rwe/lvwwiMG/y3eeUtP6RBiEYeuktSe99WT0glcwZTCKj8npBGDAr5Tb9oxzXNIQ+Tt4KxIlHeb2FM1Uj09TiVYKqpvEdogicYNhfRVIvIBqs+OgNP+YJMmPHa0RuOyhqOYECSebkZWblZd/1LnBT7/42AcdWf+9M6iZCeT4b+Fn9TgOho44aLNKYf6YyHqsSJKEG1D1XwDI3NtAxcr43C6KDz/+2hgPnYMG/oUaxi6FQMqeNqC1yr10xwiZclr82LQdEc2H/saqmaorvYVZfIdTvInhv9B2yPpebRg4O1afS2aRUtiTbFPcR5lyi819EyvAJfe9yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bH/DSoMVA/KomxkDHAUWzJH2mNIG2c1WlHt9AOYMJGA=;
 b=oPH4e6cxd/hBhzZ1NsTVaHKXtkPUkM9ZeQn8icgq7xUFKLfvqXXwyC5bt9LLx5UkBXMuiLaBYBUPnS/Ff89JJHEOESwKNvv2+cGUzQSILep11MMgtuqcuRLuSxROgEkhLuQhSFRPvDpp+XUu9e3d6tA+ZnTB05C1XR0GBPISUbgdrKsV1TxlzrcrUPxe7At/RLEiEQ3cIvTY4pakoVxB9pwKhQ8Ig0HmMtUhXOppuw+w/SMpEgB4NnBxFo9rNrbXGVM6CxAdjs3RzHnTOBbtKX16l9SCnOUizNK2gPZmGRNbpTXmIdQ/No5IcoxSqyezcmfjgwAZ15vsQ3tMATuESw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by SA2PR11MB5034.namprd11.prod.outlook.com (2603:10b6:806:f8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Fri, 8 Sep
 2023 00:16:32 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::a71b:fe6d:968d:291b]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::a71b:fe6d:968d:291b%7]) with mapi id 15.20.6745.034; Fri, 8 Sep 2023
 00:16:32 +0000
Message-ID: <63238be5-0d02-420b-5bac-5d839b68979c@intel.com>
Date: Fri, 8 Sep 2023 08:16:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
Subject: Re: [PATCH] hw/riscv: split RAM into low and high memory
To: Anup Patel <anup@brainfault.org>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>
CC: <palmer@dabbelt.com>, <alistair.francis@wdc.com>,
 <bin.meng@windriver.com>, <liweiwei@iscas.ac.cn>,
 <zhiwei_liu@linux.alibaba.com>, <qemu-riscv@nongnu.org>,
 <qemu-devel@nongnu.org>, Andrei Warkentin <andrei.warkentin@intel.com>
References: <20230731015317.1026996-1-fei2.wu@intel.com>
 <ea7d2188-97ad-9563-1b92-cf998f4b1747@ventanamicro.com>
 <CAAhSdy2jh25ORwh1ZoHWqi7jk=UizZBfivY4NxT+krp0G_M_-g@mail.gmail.com>
Content-Language: en-US
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <CAAhSdy2jh25ORwh1ZoHWqi7jk=UizZBfivY4NxT+krp0G_M_-g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|SA2PR11MB5034:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b849b30-b1f5-4f39-887e-08dbb000daac
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d2V8smD9asRo/1VcgTVdCiwDCnPJWpM9r8pAUAUpXcXQ8gDodTPJT9VeFCNQkGrwHa6zkYt/uM/xemOI6W0lTHfCAiBsQOi39Q3sMBqTsIbUOArii044NSLOu3w01aEw2djbbkKSN6Ea/h6PiZ+XEgnbBu+4NM0a5p29XR/ZQz0K3Y/1UCKWZVY40zp/cvMwJhg990rpryCJZImWQFdIH0w48Qvh2KGs6utw0MtoTSHtd+ukUH4geewS3QNOIz67iWlbjgJ79JFL1aJPR9H41OyiLwhMC8SGqFftPwhT0Eg72ftk4/ouyzG/sbsXTR0wPna4/lpK7D5ATZeUNq2CbdX57qTBROdvKL/HlarXtvphPaVdmcnlddK2YhA2/HwUIXg7vFCZa4raPy9SP1d1LfAg7vek4wVaFXoLnhs0dWoA04CtUZyakge5XywDmq1YdbI3MoFoQIqAZtcN5zQ8Irra6PjiDy480sow/4PPqsHrQpFD+ybCQCNsY5NHvObltDxVvOj0S36xuO+EvrnF291bGEx9+iOVYu4VpUn6Hm0JcrfTz60ui+qSBdLI6GF/VivjnEu4cZ/6nHZVRRETxAcD87YslxgL/vmN9t/8FnvRlNGPNiaFXpLU8gAQOKGY+zWslBTjPFyd2fcWmYy4pIFz+aGXoVBnngOCXUR3ytg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(346002)(376002)(136003)(1800799009)(186009)(451199024)(82960400001)(31686004)(53546011)(6486002)(6666004)(6506007)(31696002)(36756003)(86362001)(38100700002)(107886003)(2616005)(2906002)(30864003)(26005)(478600001)(6512007)(966005)(83380400001)(66476007)(41300700001)(4326008)(8936002)(5660300002)(8676002)(316002)(66556008)(66946007)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0ZYOVpSN2JLWUEzQjRTK1Qza2IxRHU3Wnh0bllpcjI2R2hIazdLMmpEcE8y?=
 =?utf-8?B?dGU2ZnhzM0R2S0pSQW93NTBlbnJqQmU2YTNtV3Y2cm9rcFlCeEw4T0RlOUFj?=
 =?utf-8?B?RUtvUkU0S1V6QytZS1hXaEt2cXNoYXFiMGZlWnQ1elB5VWdHSWtYNFhoYUE3?=
 =?utf-8?B?Wk0weWJiU3hPYnkrRGVMaGRhaDBMaGtUSmtuLzM0TzhzMFhoRTA3SzV0SEZj?=
 =?utf-8?B?U2JZTlBnbmMzdGdPaFlwdUg5bUtXYnJWSzNTTVJ4bmIvMmxoRHB2TjlUMDM0?=
 =?utf-8?B?dml0WjEzYVE5WDByNFBrRWZCOWNLQjlHSFJTQTMvWHhBbFZLUzI4RXNzZTY1?=
 =?utf-8?B?V21HK1lrYkUva2EzTzRuYVE5dGw2UUk5WmU2RzQ2T3B6UFRmMVBySFZHRjNC?=
 =?utf-8?B?SFh3clVsT3Z2SkdQaDQ5YTYvRU53K3FxWU5pbllqSkl2Z0NGai83Y25oRGFF?=
 =?utf-8?B?cElGaEtMTyt0Q2l1Wlg3eG8wMHh2Q2JQZEs4TElUVTk5Qk42MXBWeHpqZWlT?=
 =?utf-8?B?a3gxdXZ1V0Z4clMrbXd3NzQxbVdNV1UwZUR6cHRFVGR6RzZ4Vjg2LzZmeE80?=
 =?utf-8?B?NHBseU5EdXl5SjRpeTJTaWdHL2NTWFc3ZTdWU0hRNjFGMmZwbHZBbXpxNGF3?=
 =?utf-8?B?M28yR0RCTEZTZE9sRzY2WmZyZWhXNDAwKzBEc1JLVVAvNml5QjRuZ3VRZm1M?=
 =?utf-8?B?clp6aWxUT25mcDNCNVFySVhhRGVqR3Rjamw2aHQrRzA0SUd3dDdxcGtQSjQ5?=
 =?utf-8?B?MHZoZXdicU9sc1JaWXNLMFJnMTBMS0NlenVtZ0YveXVrWmxWOEV5dTkwZ2s5?=
 =?utf-8?B?QXNKWDRyTzI0MGpiTzd3RlB1eUtOZytvYTRvMC9odkVnOGkxTnRxOFBxckFX?=
 =?utf-8?B?S1hnK0V2amJkR0R6K1Y2MHQzU2hQL25HNWF4VW5jM2tCRlVSVUNhMldQUkxl?=
 =?utf-8?B?aEw5VUFsbEVsYlIzMThwVWdaQ1hJREVTQUVpR2hBVVd4N0l1RzBPQm90TENj?=
 =?utf-8?B?U1MvSWs5eVNKMHUzcVdOcXZxVWJJaW1sSVlDbnlMcjMrS216alo5RW5IWDll?=
 =?utf-8?B?WXY2VDA1NHRkRWZpMXNLY01BM3JSaUlucGxBcHp5dGRlNml6L0VvaGIyUDBR?=
 =?utf-8?B?WmRBejlVRUxiV3drU1RUZXk3YXZ4S0ZKWFlqbnhibU5IVytDWmdmSktNRUNk?=
 =?utf-8?B?OEZhTDdSMXBIbFlmazZZL0FvMU96b3I5ZytuUU9ISDJRZDBQdURxR1dmQUpo?=
 =?utf-8?B?cWZPZDV5RDNRTHhrVkhQSXJRdkh4bTczbVE2REtzSCsrSzhIa3ZYbjU4VllM?=
 =?utf-8?B?QWkrSFp4aTBxQzJpRTFIMnZqYXcvZEMzaUNSdnJNVHZxbWZkRGFxaDRzQWlW?=
 =?utf-8?B?UmVqNDlyRHQyUVhiTzAweENrbmZVZGRHRmsyaHFoQVN1b3ArU1lxNjE4cDNB?=
 =?utf-8?B?UDR5UVlGelRkTk9veXNOMUlvNGFxSDZXUVNIZlFUNDkrZkJzRkYxbTZUcmNu?=
 =?utf-8?B?MXpmaU84bjA1YVZwVWdWVmhhaG9SUUltQTlhVUZTOUlNRG03RUtNa29wMndt?=
 =?utf-8?B?bWhEMkpwNU04ZTVvRW1OdU5lYmFSNHJEUzk3UEtwMzBoem96c3g4cEE0ZGRv?=
 =?utf-8?B?VmZqRXNPbUt6OFdLRG14eVFjS3JtQ1NGYXI1WHpqNUl2VDF3d25FVTFSblNt?=
 =?utf-8?B?Y3N2RUxoYUwrL0pHTnB3d2ZLZGVncEk4dnFuY1lVVG9FRTdIWXlnWm1JcFdU?=
 =?utf-8?B?anowN3pMallDT3NEWmcxOHAxTEJnNTJRQmVmaURZNEFRaU5QNGpMMzN0YWh0?=
 =?utf-8?B?T3F5dndOYS93SWtMQ0pGcG4zdTczbEE3cy9qb2pqZExaeXNJWkE2UjBwSC9I?=
 =?utf-8?B?TkpkSG9SQjJSMmpiZjhKM3NzS3VLZGRTaThYS1VvV1FxUUNSc2txRC9qbW5J?=
 =?utf-8?B?djQzR0VBdDVLa21LZ0R5b1E4SlFIaFIvVHJ6RXZnSU5OQ1lCTGV0blZvTmZJ?=
 =?utf-8?B?aTNuUUZCcnhmNWpiT3lSL1d4R2hBUWdCM2JFM0tOZndIMm5JeVhuSVUzQ3Jn?=
 =?utf-8?B?UXE0OHVqTU1mN3RiNUFXTG8rb0VQbytLZlg3RGpYNllQNDB6TGdkYkE0cTE5?=
 =?utf-8?Q?0UAWdYgy9jZoSc9mMrnqm/yTP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b849b30-b1f5-4f39-887e-08dbb000daac
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 00:16:32.1281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rB6k+YN57dJC/pCp7IdwGzYSD5nNo2YIeZ0MJr5enQtHZlt9B9+G6gVMilXMNIXPr/AEt6th4N8ufNNQSLmoQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5034
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.93; envelope-from=fei2.wu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 9/7/2023 11:46 PM, Anup Patel wrote:
> On Tue, Aug 1, 2023 at 4:16 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>>
>>
>> On 7/30/23 22:53, Fei Wu wrote:
>>> riscv virt platform's memory started at 0x80000000 and
>>> straddled the 4GiB boundary. Curiously enough, this choice
>>> of a memory layout will prevent from launching a VM with
>>> a bit more than 2000MiB and PCIe pass-thru on an x86 host, due
>>> to identity mapping requirements for the MSI doorbell on x86,
>>> and these (APIC/IOAPIC) live right below 4GiB.
>>>
>>> So just split the RAM range into two portions:
>>> - 1 GiB range from 0x80000000 to 0xc0000000.
>>> - The remainder at 0x100000000
>>>
>>> ...leaving a hole between the ranges.
>>
>> I am afraid this breaks some existing distro setups, like Ubuntu. After this patch
>> this emulation stopped working:
>>
>> ~/work/qemu/build/qemu-system-riscv64 \
>>         -machine virt -nographic -m 8G -smp 8 \
>>         -kernel ./uboot-ubuntu/usr/lib/u-boot/qemu-riscv64_smode/uboot.elf \
>>         -drive file=snapshot.img,format=qcow2,if=virtio \
>>         -netdev bridge,id=bridge1,br=virbr0 -device virtio-net-pci,netdev=bridge1
>>
>>
>> This is basically a guest created via the official Canonical tutorial:
>>
>> https://wiki.ubuntu.com/RISC-V/QEMU
>>
>> The error being thrown:
>>
>> =================
>>
>> Boot HART ID              : 4
>> Boot HART Domain          : root
>> Boot HART Priv Version    : v1.12
>> Boot HART Base ISA        : rv64imafdch
>> Boot HART ISA Extensions  : time,sstc
>> Boot HART PMP Count       : 16
>> Boot HART PMP Granularity : 4
>> Boot HART PMP Address Bits: 54
>> Boot HART MHPM Count      : 16
>> Boot HART MIDELEG         : 0x0000000000001666
>> Boot HART MEDELEG         : 0x0000000000f0b509
>>
>>
>> U-Boot 2022.07+dfsg-1ubuntu4.2 (Nov 24 2022 - 18:47:41 +0000)
>>
>> CPU:   rv64imafdch_zicbom_zicboz_zicsr_zifencei_zihintpause_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sstc_svadu
>> Model: riscv-virtio,qemu
>> DRAM:  Unhandled exception: Store/AMO access fault
>> EPC: 00000000802018b8 RA: 00000000802126a0 TVAL: 00000000ff733f90
>>
>> Code: b823 06b2 bc23 06b2 b023 08b2 b423 08b2 (b823 08b2)
>>
>>
>> resetting ...
>> System reset not supported on this platform
>> ### ERROR ### Please RESET the board ###
>> QEMU 8.0.90 monitor - type 'help' for more infor
>> =================
> 
> Can you try again after setting CONFIG_NR_DRAM_BANKS=2 in
> qemu-riscv64_smode_defconfig and qemu-riscv64_spl_defconfig ?
> 
Yes, I made a u-boot patch to change this setting and also use
fdtdec_setup_mem_size_base_lowest() instead fdtdec_setup_mem_size_base()
in dram_init(), the latter is also necessary. The patch has been posted
to u-boot mailing list but got no reply yet:
    https://lists.denx.de/pipermail/u-boot/2023-September/529729.html

Thanks,
Fei.

> Regards,
> Anup
> 
>>
>>
>> Based on the change made I can make an educated guess on what is going wrong.
>> We have another board with a similar memory topology you're making here, the
>> Microchip Polarfire (microchip_pfsoc.c). We were having some problems with this
>> board while trying to consolidate the boot process between all boards in
>> hw/riscv/boot.c because of its non-continuous RAM bank. The full story can be
>> read in the commit message of 4b402886ac89 ("hw/riscv: change riscv_compute_fdt_addr()
>> semantics") but the short version can be seen in riscv_compute_fdt_addr()
>> from boot.c:
>>
>>   - if ram_start is less than 3072MiB, the FDT will be  put at the lowest value
>> between 3072 MiB and the end of that RAM bank;
>>
>> - if ram_start is higher than 3072 MiB the FDT will be put at the end of the
>> RAM bank.
>>
>> So, after this patch, since riscv_compute_fdt_addr() is being used with the now
>> lower RAM bank, the fdt is being put in LOW_MEM - fdt_size for any setup that has
>> more than 1Gb RAM, and this breaks assumptions made by uboot and Ubuntu and possibly
>> others that are trying to retrieve the FDT from the gap that you created between
>> low and hi mem in this patch.
>>
>> In fact, this same Ubuntu guest I mentioned above will boot if I put only 1 Gb of RAM
>> (-m 1Gb). If I try with -m 1.1Gb I reproduce this error. This can be a validation of
>> the guess I'm making here: Ubuntu is trying to fetch stuff (probably the fdt) from
>> the gap between the memory areas.
>>
>> This change on top of this patch doesn't work either:
>>
>> $ git diff
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index 8fbdc7220c..dfff48d849 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -1335,9 +1335,16 @@ static void virt_machine_done(Notifier *notifier, void *data)
>>                                            kernel_start_addr, true, NULL);
>>       }
>>
>> -    fdt_load_addr = riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
>> +    if (machine->ram_size < memmap[VIRT_DRAM].size) {
>> +        fdt_load_addr = riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
>>                                              memmap[VIRT_DRAM].size,
>>                                              machine);
>> +    } else {
>> +        fdt_load_addr = riscv_compute_fdt_addr(memmap[VIRT_DRAM_HIGH].base,
>> +                                           memmap[VIRT_DRAM_HIGH].size,
>> +                                           machine);
>> +    }
>> +
>>
>>
>> This would put the fdt at the end of the HI RAM for guests with more than 1Gb of RAM.
>> This change in fact makes the situation even worse, breaking setups that were working
>> before with this patch.
>>
>> There's a chance that reducing the gap between the RAM banks can make Ubuntu work
>> reliably again but now I'm a little cold feet with this change.
>>
>>
>> I think we'll need some kernel/Opensbi folks to weight in here to see if there's a
>> failsafe memory setup that won't break distros out there and allow your passthrough
>> to work.
>>
>>
>>
>> Thanks,
>>
>> Daniel
>>
>>>
>>> Signed-off-by: Andrei Warkentin <andrei.warkentin@intel.com>
>>> Signed-off-by: Fei Wu <fei2.wu@intel.com>
>>> ---
>>>   hw/riscv/virt.c         | 74 ++++++++++++++++++++++++++++++++++++-----
>>>   include/hw/riscv/virt.h |  1 +
>>>   2 files changed, 66 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>>> index d90286dc46..8fbdc7220c 100644
>>> --- a/hw/riscv/virt.c
>>> +++ b/hw/riscv/virt.c
>>> @@ -75,7 +75,9 @@
>>>   #error "Can't accomodate all IMSIC groups in address space"
>>>   #endif
>>>
>>> -static const MemMapEntry virt_memmap[] = {
>>> +#define LOW_MEM (1 * GiB)
>>> +
>>> +static MemMapEntry virt_memmap[] = {
>>>       [VIRT_DEBUG] =        {        0x0,         0x100 },
>>>       [VIRT_MROM] =         {     0x1000,        0xf000 },
>>>       [VIRT_TEST] =         {   0x100000,        0x1000 },
>>> @@ -96,6 +98,7 @@ static const MemMapEntry virt_memmap[] = {
>>>       [VIRT_PCIE_ECAM] =    { 0x30000000,    0x10000000 },
>>>       [VIRT_PCIE_MMIO] =    { 0x40000000,    0x40000000 },
>>>       [VIRT_DRAM] =         { 0x80000000,           0x0 },
>>> +    [VIRT_DRAM_HIGH] =    { 0x100000000,          0x0 },
>>>   };
>>>
>>>   /* PCIe high mmio is fixed for RV32 */
>>> @@ -295,15 +298,12 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>>>       }
>>>   }
>>>
>>> -static void create_fdt_socket_memory(RISCVVirtState *s,
>>> -                                     const MemMapEntry *memmap, int socket)
>>> +static void create_fdt_socket_mem_range(RISCVVirtState *s, uint64_t addr,
>>> +                                        uint64_t size, int socket)
>>>   {
>>>       char *mem_name;
>>> -    uint64_t addr, size;
>>>       MachineState *ms = MACHINE(s);
>>>
>>> -    addr = memmap[VIRT_DRAM].base + riscv_socket_mem_offset(ms, socket);
>>> -    size = riscv_socket_mem_size(ms, socket);
>>>       mem_name = g_strdup_printf("/memory@%lx", (long)addr);
>>>       qemu_fdt_add_subnode(ms->fdt, mem_name);
>>>       qemu_fdt_setprop_cells(ms->fdt, mem_name, "reg",
>>> @@ -313,6 +313,34 @@ static void create_fdt_socket_memory(RISCVVirtState *s,
>>>       g_free(mem_name);
>>>   }
>>>
>>> +static void create_fdt_socket_memory(RISCVVirtState *s,
>>> +                                     const MemMapEntry *memmap, int socket)
>>> +{
>>> +    uint64_t addr, size;
>>> +    MachineState *mc = MACHINE(s);
>>> +    uint64_t sock_offset = riscv_socket_mem_offset(mc, socket);
>>> +    uint64_t sock_size = riscv_socket_mem_size(mc, socket);
>>> +
>>> +    if (sock_offset < memmap[VIRT_DRAM].size) {
>>> +        uint64_t low_mem_end = memmap[VIRT_DRAM].base + memmap[VIRT_DRAM].size;
>>> +
>>> +        addr = memmap[VIRT_DRAM].base + sock_offset;
>>> +        size = MIN(low_mem_end - addr, sock_size);
>>> +        create_fdt_socket_mem_range(s, addr, size, socket);
>>> +
>>> +        size = sock_size - size;
>>> +        if (size > 0) {
>>> +            create_fdt_socket_mem_range(s, memmap[VIRT_DRAM_HIGH].base,
>>> +                                        size, socket);
>>> +        }
>>> +    } else {
>>> +        addr = memmap[VIRT_DRAM_HIGH].base +
>>> +               sock_offset - memmap[VIRT_DRAM].size;
>>> +
>>> +        create_fdt_socket_mem_range(s, addr, sock_size, socket);
>>> +    }
>>> +}
>>> +
>>>   static void create_fdt_socket_clint(RISCVVirtState *s,
>>>                                       const MemMapEntry *memmap, int socket,
>>>                                       uint32_t *intc_phandles)
>>> @@ -1334,10 +1362,12 @@ static void virt_machine_done(Notifier *notifier, void *data)
>>>
>>>   static void virt_machine_init(MachineState *machine)
>>>   {
>>> -    const MemMapEntry *memmap = virt_memmap;
>>> +    MemMapEntry *memmap = virt_memmap;
>>>       RISCVVirtState *s = RISCV_VIRT_MACHINE(machine);
>>>       MemoryRegion *system_memory = get_system_memory();
>>>       MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
>>> +    MemoryRegion *ram_below_4g, *ram_above_4g;
>>> +    uint64_t ram_size_low, ram_size_high;
>>>       char *soc_name;
>>>       DeviceState *mmio_irqchip, *virtio_irqchip, *pcie_irqchip;
>>>       int i, base_hartid, hart_count;
>>> @@ -1448,6 +1478,17 @@ static void virt_machine_init(MachineState *machine)
>>>           }
>>>       }
>>>
>>> +    if (machine->ram_size > LOW_MEM) {
>>> +        ram_size_high = machine->ram_size - LOW_MEM;
>>> +        ram_size_low = LOW_MEM;
>>> +    } else {
>>> +        ram_size_high = 0;
>>> +        ram_size_low = machine->ram_size;
>>> +    }
>>> +
>>> +    memmap[VIRT_DRAM].size = ram_size_low;
>>> +    memmap[VIRT_DRAM_HIGH].size = ram_size_high;
>>> +
>>>       if (riscv_is_32bit(&s->soc[0])) {
>>>   #if HOST_LONG_BITS == 64
>>>           /* limit RAM size in a 32-bit system */
>>> @@ -1460,7 +1501,8 @@ static void virt_machine_init(MachineState *machine)
>>>           virt_high_pcie_memmap.size = VIRT32_HIGH_PCIE_MMIO_SIZE;
>>>       } else {
>>>           virt_high_pcie_memmap.size = VIRT64_HIGH_PCIE_MMIO_SIZE;
>>> -        virt_high_pcie_memmap.base = memmap[VIRT_DRAM].base + machine->ram_size;
>>> +        virt_high_pcie_memmap.base = memmap[VIRT_DRAM_HIGH].base +
>>> +                                     memmap[VIRT_DRAM_HIGH].size;
>>>           virt_high_pcie_memmap.base =
>>>               ROUND_UP(virt_high_pcie_memmap.base, virt_high_pcie_memmap.size);
>>>       }
>>> @@ -1468,8 +1510,22 @@ static void virt_machine_init(MachineState *machine)
>>>       s->memmap = virt_memmap;
>>>
>>>       /* register system main memory (actual RAM) */
>>> +    ram_below_4g = g_malloc(sizeof(*ram_below_4g));
>>> +    memory_region_init_alias(ram_below_4g, NULL, "ram-below-4g", machine->ram,
>>> +                             0, memmap[VIRT_DRAM].size);
>>>       memory_region_add_subregion(system_memory, memmap[VIRT_DRAM].base,
>>> -        machine->ram);
>>> +                                ram_below_4g);
>>> +
>>> +    if (memmap[VIRT_DRAM_HIGH].size) {
>>> +        ram_above_4g = g_malloc(sizeof(*ram_above_4g));
>>> +        memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g",
>>> +                                 machine->ram,
>>> +                                 memmap[VIRT_DRAM].size,
>>> +                                 memmap[VIRT_DRAM_HIGH].size);
>>> +        memory_region_add_subregion(system_memory,
>>> +                                    memmap[VIRT_DRAM_HIGH].base,
>>> +                                    ram_above_4g);
>>> +    }
>>>
>>>       /* boot rom */
>>>       memory_region_init_rom(mask_rom, NULL, "riscv_virt_board.mrom",
>>> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
>>> index e5c474b26e..36004eb6ef 100644
>>> --- a/include/hw/riscv/virt.h
>>> +++ b/include/hw/riscv/virt.h
>>> @@ -79,6 +79,7 @@ enum {
>>>       VIRT_IMSIC_S,
>>>       VIRT_FLASH,
>>>       VIRT_DRAM,
>>> +    VIRT_DRAM_HIGH,
>>>       VIRT_PCIE_MMIO,
>>>       VIRT_PCIE_PIO,
>>>       VIRT_PLATFORM_BUS,
>>


