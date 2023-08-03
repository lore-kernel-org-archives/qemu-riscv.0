Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E3CC001DE
	for <qemu-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 00:46:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qRMTr-0005zx-J4; Wed, 02 Aug 2023 20:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1qRMTl-0005zN-8r; Wed, 02 Aug 2023 20:46:13 -0400
Received: from [192.55.52.115] (helo=mgamail.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1qRMTg-0008Px-LA; Wed, 02 Aug 2023 20:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691023568; x=1722559568;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AJWEUot5wENtQbwdsEAEc+gPVr2WL4ZnTUnSZnTvTRc=;
 b=AWsNewnHVwiZDQGv4LWSPTzFPtogDQM1XzcmUtgdBToXJed0FiQPTGFO
 2Q5ke5eWFFEdbnrIiGcykqVRObcdYQklAWjt014cuqca5zyaQDssjf3GY
 6yWcua2QriS7LnBpcvszw1zXOccXPibJuvmyHRgUIkL+idn1SYlauVK8M
 tMVmv3gJduCgtpm+VRr0kUoD3QTDbwVuYQTTE6PoeS6jIt+mPR1qlCBeU
 W8wUNJimgMfuOB7cjOnJAb9mZQBE4moJfEUeK4lyE96r2d9G+7opdkT0p
 8tcuCk3pq5CwEsMjl9tVHlIQ60bgHKdp+vK+9qY8WyyZ/0w4dW+RM7ZVm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="369739695"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; d="scan'208";a="369739695"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 17:46:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="799325226"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; d="scan'208";a="799325226"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 02 Aug 2023 17:46:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 17:46:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 2 Aug 2023 17:46:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 2 Aug 2023 17:46:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 2 Aug 2023 17:46:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFQJwY6ZDhF9T1T+YZRFdMSz7dDfpWO8wtaXJXR79IhUWxG4NrilHJpAoKyvXPtRYiklSV7InJEzkqH+JB88v+juGMBLmjXSRLbRXyS9IwLuoJgX1krpbIZlwj1xtYiL1WFkZyX5s8RUPIgurAi7Zb1Uvrdd1yYNH9ZDk8MyaNfDfyemVCf1BsQN6SZnP2o0PWGJi0BPQVK5+ZngmXpdVzsIranNZbmU/HoAoOvnazlSjHQAkGl4Qitd9aC1XGboni+i2qikwwxLTv9m5lzyHu0Ss7theYDiA2dkLmvwwUYsXYE3jAd4oPin7YxZm4OSi5vuIsQj3Tu4RWGdY6RRLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Crr7Dweef7nFQ+nXButJCktuQajETfIg34HYQr6sNU=;
 b=PLPblFHHWm9JN+wRN8Qncrze/fq0Q6qej3mADr6GLIfKn+nvEUwbmB8BSXZ1tmfgVAp2VbJExmmsLThkmcVGXlXLkYeV2IjksDgX+KGeSuvao4q/HZ5Bm7gWQnKhSYAJar4j0/MeXeLbe4uKRXExRBq6xhJokUjjMixesozYrtTMFtD1GCm20GF+2BRGa71pbWdFQvFpRFA7aFUanz83yYodXXudHthj+d5pGiNplIhPF7MifWd98+11DbCfclj36l4PShGj149ywbexPyqH6LUI6zTLb4GejXelU+fVPZV4yTdTmjQ5XyoOtC6tEJyguaPxqulzSVgFuKmcy6N1lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by MN2PR11MB4629.namprd11.prod.outlook.com (2603:10b6:208:264::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19; Thu, 3 Aug
 2023 00:45:58 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::f5f4:f0a:d677:8017]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::f5f4:f0a:d677:8017%4]) with mapi id 15.20.6652.020; Thu, 3 Aug 2023
 00:45:58 +0000
Message-ID: <49bbec5d-d0da-55e2-875b-3a8874bc3322@intel.com>
Date: Thu, 3 Aug 2023 08:45:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Subject: Re: [PATCH] hw/riscv: split RAM into low and high memory
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, <palmer@dabbelt.com>, 
 <alistair.francis@wdc.com>, <bin.meng@windriver.com>,
 <liweiwei@iscas.ac.cn>, 
 <zhiwei_liu@linux.alibaba.com>, <qemu-riscv@nongnu.org>,
 <qemu-devel@nongnu.org>
CC: Andrei Warkentin <andrei.warkentin@intel.com>
References: <20230731015317.1026996-1-fei2.wu@intel.com>
 <ea7d2188-97ad-9563-1b92-cf998f4b1747@ventanamicro.com>
Content-Language: en-US
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <ea7d2188-97ad-9563-1b92-cf998f4b1747@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0241.apcprd06.prod.outlook.com
 (2603:1096:4:ac::25) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|MN2PR11MB4629:EE_
X-MS-Office365-Filtering-Correlation-Id: 2202f985-98a6-4d89-e73f-08db93bb0034
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kCx3+JLHd5CklqAyM2yDl64+edqbRr72Bu2mi2ZuqS6wBDgq/3Ic2s+y3ZSMUhomz8zo9JoKNcaIU1sRV3vGt/rRREoqlOm1ncSmKRjdyKe8x5qkWbzROJeLOv3SNWhFmQRHLMmps1vwGZH+NwR1CdiANflKJAhjF6fAaI8FiGztZiIYC0rXmLOP416mkBxCRk4L40NgKJSEea6tcEoU0urJTo54OGN8fXzV+yRZK+f4wYLJepMUV6PXJVya02V8FDlleCUsLMgYeEK3TWgyGj3mv0QSF0Be3tCoxafNB8n0tCyvoEFcAsyPMEykqbssATA6nrkxqc8OgFx2Ebc2Zw2fsdyymYtWJko9N1f3qR+iqG9F6M1to8RiDr2oqrgi5Ry+vfudBEqZxxdWQE/VIgJdY17EilaP4TuMUDmWu/iD7m2XjAHOJE/5613v6mf496eaBoNAloDMy6p+HnLA0LAv2X1aIEs56hY4koC4WJGjEuL2l9h+dOGMdr05fnEcouVE2YUrpWcynrEvNIHuInr8qAxcrSlDAFkIrII/O/iv1WnFGwE8i0tPi/f7vmI+Flhn0Hc7WDc7FFR4mM946E1mtwal1JC07rzJGZW4jCFfn8soD912YtV4u8uxdOMu7BBnGRPA9napRzA3i1rUFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(396003)(39860400002)(136003)(366004)(451199021)(30864003)(107886003)(36756003)(478600001)(86362001)(31696002)(6512007)(966005)(6666004)(6486002)(8936002)(8676002)(41300700001)(316002)(5660300002)(31686004)(66556008)(4326008)(66476007)(83380400001)(38100700002)(66946007)(26005)(6506007)(2616005)(82960400001)(186003)(2906002)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGNUbDg1b2xqYzVxK3BpSE4xdXZTN3B2NVRZNnFPcGZRWjdmSWRMaXZEZmpr?=
 =?utf-8?B?NDNWTnBmOWgvWklWNFVacFkrUjdBV2R3VDJrNzQzR2VZellYY0t6M1NWS1J6?=
 =?utf-8?B?MmU1M0oxM1k4WXVhZ09aU3JYOEljSzlxaXBuam84Q2N2TXJpSnMzemhUQ2g2?=
 =?utf-8?B?aS8zSzZtRFJPaXhNMnFPeDB5dmZ1QTlEanROTkdmRDVFUXBJcFE3ZHFaSTUx?=
 =?utf-8?B?R01WbmNHa3o1bWRzdkd5WkRzdVpRRVc0ZDlSYmpJK2Zib0ZTa1J4WjJWMU5p?=
 =?utf-8?B?WEtUem16NW9rL2V3cnVKRUp4L00xSDlOUzBPVlZHY0V1Qm5jVUtkMjZNWUVr?=
 =?utf-8?B?RitaZmNudjQwRkxTUE9jaHZ0MHZnTmI1TlUvVElEYjc1T2krMmhid3ptSVVQ?=
 =?utf-8?B?VlJNOFowZUhXQUNLdXJVak9LQ0RkZk9uOTg1Uk5XWmJ3YjVobE90SlVIQkRU?=
 =?utf-8?B?WVZyWUxRYkFlTWUwaHJTYVVCNytYam5xM2N3Zk5Yb2doN0xTbDJqZmUvcU9l?=
 =?utf-8?B?MWFPM2dmaGFNUlhCSUtNYXhEQXFqVWJKQ2JyNjdFUk8wYkFQQkNlNi9BdWNr?=
 =?utf-8?B?bnFuZ0FvSGo3SW82TnlvY3RERnp2dzFBN1Fldm13azM3RW1WMU14dmI1bWh6?=
 =?utf-8?B?SFJGb0lqZ2lBai85MTUyeGxmLzNweldqWE9vRDRXeHkrVEZ5ZlJpZ0tPTEM3?=
 =?utf-8?B?REoyUU4zb0JWc1lsbFMxTThuTXo1QXNnQTBBTTkxVEFwazVGSWN3SENlZDFo?=
 =?utf-8?B?ZXAwSVZTN2FLbTdsdzhlUWMrWjgvSWdVSVRhM0U4YUtmYUY0eWRLam9NUjNz?=
 =?utf-8?B?b2djZ0c5ckNPcnNvY1oySFptVW9leU51d1NzWHYwMlMzM0ZBTTdzbnh2bWUx?=
 =?utf-8?B?Vm9qa1RkMUFiWXA5MG5MYitIbmZKc3NBMGV2UXVZOUVlK3FSYTkrM0pMTERI?=
 =?utf-8?B?b3EwQ0VRSzdtNlhoa2VMOGlOS3FVbVBwUjhrU24rRmlxUUdvaGN3bmpVTE12?=
 =?utf-8?B?K09PbXkrMFB2TGM0OTh6VHpHdUN4Q2hCbzNidndrQ09FVGlETGRpYU00cFl0?=
 =?utf-8?B?dUdoVy9hWmtNQkQyNlhoRnNRUVdoai9QajgwazhaL2pUZXNBdWFYaktoZEgz?=
 =?utf-8?B?N3ZEYnhNZ1gxa1VsekRaK0lHYnExZEEwcFExbVR5WW42bW90ejZ5eWNRTXNk?=
 =?utf-8?B?cFlsNTk3cHlCaWlGaTdXMFF3MHhGSm1XQ2ZoWG1PNSthZDZSODZGSVN1S3Yv?=
 =?utf-8?B?a2czNnZWaHFvSFowT1lMb2ZJTG5NR3ZrRy8vM3RKNEs0QlVoZ05kMzhZQVFI?=
 =?utf-8?B?WDZXVUQ0NTJsRUs5MWRKcFlUdGhrRVhkUEt1THN1Vzl5NTB6M1NIekhqUmlB?=
 =?utf-8?B?S3E0NmNRblhLWDltYVM0dThLUVRKamdPSUpJalJVd0lWdStJeFllVU0wdHBm?=
 =?utf-8?B?dzZ5eVdaSGtaR2x1dXc5Nml2Wk5uN3d6TjhzbGpzWEZvMnVoMWpDelBnYUJH?=
 =?utf-8?B?T1dzZElTNGxxY2lkUzltRGR5eWF3Smw3WVZmcVFIVVk0ZVViL3dGYkhWc3Q0?=
 =?utf-8?B?eGJZZ2RNWUVQcktMcGhzeUxzakRqekRVSTc5SGZCVWROMEs4eUVjZkJ0bUZ0?=
 =?utf-8?B?NC84V3F4bHdGbHV2NURLeEp1TmZ4WGovRGxqY3pZdGtXZVJaaStReTd2Mmxw?=
 =?utf-8?B?bXJPUlhMdnluS3ZCU1BRV3FCNWJZVHZoazd4eS9MWS9hQW1xWXZZLzREeEt1?=
 =?utf-8?B?UURab2VMRFNIZzBQeEZKSUtLdTNLcUg1dzRpQUV3VWJ1OG5ORHgxNTlTSlQ0?=
 =?utf-8?B?MFVRTXpWdzJ4WFRCN2hJZ2dRSnRVMlRMeXBYL21DdXRXQWVJVHVzK0lBcVVB?=
 =?utf-8?B?ZitJd2lpNURxamFqMUpkK2RYUjdZV0thaUt4SitOUHU1a21CcmNzN3h3Rk5N?=
 =?utf-8?B?amZHekMxSFVCaG11aFE1YjhjVHErR05GeXJRVEhOMHJnZC9qTHlVbUFZcnpH?=
 =?utf-8?B?cWplM3pPWGRQYVV6WHRRTGZaZjc3T0hSdGNyb2o2a1dHK1hOQS8xODR0cEZM?=
 =?utf-8?B?T1JqQ2JpUGl4TVdxMGhydVp2SUl5QVJsUE1jekt0MU1sU2toUzlpYVVWbTFj?=
 =?utf-8?Q?NLBqL9KGb/o7HPEBdGfZfkQbC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2202f985-98a6-4d89-e73f-08db93bb0034
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:45:58.0155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ibqZHd9yT54I4cJ4uIxtpAB5T5S9YSH8ZEuDkWPqqVauC3/J7LNYZWOKPTGcnBtbZF7KWcD8ugdygCxUKsXnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4629
X-OriginatorOrg: intel.com
X-Host-Lookup-Failed: Reverse DNS lookup failed for 192.55.52.115 (failed)
Received-SPF: pass client-ip=192.55.52.115; envelope-from=fei2.wu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.102, RCVD_IN_DNSWL_MED=-2.3, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/1/2023 6:46 AM, Daniel Henrique Barboza wrote:
> 
> 
> On 7/30/23 22:53, Fei Wu wrote:
>> riscv virt platform's memory started at 0x80000000 and
>> straddled the 4GiB boundary. Curiously enough, this choice
>> of a memory layout will prevent from launching a VM with
>> a bit more than 2000MiB and PCIe pass-thru on an x86 host, due
>> to identity mapping requirements for the MSI doorbell on x86,
>> and these (APIC/IOAPIC) live right below 4GiB.
>>
>> So just split the RAM range into two portions:
>> - 1 GiB range from 0x80000000 to 0xc0000000.
>> - The remainder at 0x100000000
>>
>> ...leaving a hole between the ranges.
> 
> I am afraid this breaks some existing distro setups, like Ubuntu. After
> this patch
> this emulation stopped working:
> 
> ~/work/qemu/build/qemu-system-riscv64 \
>     -machine virt -nographic -m 8G -smp 8 \
>     -kernel ./uboot-ubuntu/usr/lib/u-boot/qemu-riscv64_smode/uboot.elf \
>     -drive file=snapshot.img,format=qcow2,if=virtio \
>     -netdev bridge,id=bridge1,br=virbr0 -device
> virtio-net-pci,netdev=bridge1
> 
> 
> This is basically a guest created via the official Canonical tutorial:
> 
> https://wiki.ubuntu.com/RISC-V/QEMU
> 
> The error being thrown:
> 
> =================
> 
> Boot HART ID              : 4
> Boot HART Domain          : root
> Boot HART Priv Version    : v1.12
> Boot HART Base ISA        : rv64imafdch
> Boot HART ISA Extensions  : time,sstc
> Boot HART PMP Count       : 16
> Boot HART PMP Granularity : 4
> Boot HART PMP Address Bits: 54
> Boot HART MHPM Count      : 16
> Boot HART MIDELEG         : 0x0000000000001666
> Boot HART MEDELEG         : 0x0000000000f0b509
> 
> 
> U-Boot 2022.07+dfsg-1ubuntu4.2 (Nov 24 2022 - 18:47:41 +0000)
> 
> CPU:  
> rv64imafdch_zicbom_zicboz_zicsr_zifencei_zihintpause_zawrs_zfa_zca_zcd_zba_zbb_zbc_zbs_sstc_svadu
> Model: riscv-virtio,qemu
> DRAM:  Unhandled exception: Store/AMO access fault
> EPC: 00000000802018b8 RA: 00000000802126a0 TVAL: 00000000ff733f90
> 
> Code: b823 06b2 bc23 06b2 b023 08b2 b423 08b2 (b823 08b2)
> 
> 
> resetting ...
> System reset not supported on this platform
> ### ERROR ### Please RESET the board ###
> QEMU 8.0.90 monitor - type 'help' for more infor
> =================
> 
> 
> Based on the change made I can make an educated guess on what is going
> wrong.
> We have another board with a similar memory topology you're making here,
> the
> Microchip Polarfire (microchip_pfsoc.c). We were having some problems
> with this
> board while trying to consolidate the boot process between all boards in
> hw/riscv/boot.c because of its non-continuous RAM bank. The full story
> can be
> read in the commit message of 4b402886ac89 ("hw/riscv: change
> riscv_compute_fdt_addr()
> semantics") but the short version can be seen in riscv_compute_fdt_addr()
> from boot.c:
> 
>  - if ram_start is less than 3072MiB, the FDT will be  put at the lowest
> value
> between 3072 MiB and the end of that RAM bank;
> 
> - if ram_start is higher than 3072 MiB the FDT will be put at the end of
> the
> RAM bank.
> 
> So, after this patch, since riscv_compute_fdt_addr() is being used with
> the now
> lower RAM bank, the fdt is being put in LOW_MEM - fdt_size for any setup
> that has
> more than 1Gb RAM, and this breaks assumptions made by uboot and Ubuntu
> and possibly
> others that are trying to retrieve the FDT from the gap that you created
> between
> low and hi mem in this patch.
> 
> In fact, this same Ubuntu guest I mentioned above will boot if I put
> only 1 Gb of RAM
> (-m 1Gb). If I try with -m 1.1Gb I reproduce this error. This can be a
> validation of
> the guess I'm making here: Ubuntu is trying to fetch stuff (probably the
> fdt) from
> the gap between the memory areas.
> 
> This change on top of this patch doesn't work either:
> 
> $ git diff
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 8fbdc7220c..dfff48d849 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1335,9 +1335,16 @@ static void virt_machine_done(Notifier *notifier,
> void *data)
>                                           kernel_start_addr, true, NULL);
>      }
>  
> -    fdt_load_addr = riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
> +    if (machine->ram_size < memmap[VIRT_DRAM].size) {
> +        fdt_load_addr = riscv_compute_fdt_addr(memmap[VIRT_DRAM].base,
>                                             memmap[VIRT_DRAM].size,
>                                             machine);
> +    } else {
> +        fdt_load_addr =
> riscv_compute_fdt_addr(memmap[VIRT_DRAM_HIGH].base,
> +                                           memmap[VIRT_DRAM_HIGH].size,
> +                                           machine);
> +    }
> +
>   
> This would put the fdt at the end of the HI RAM for guests with more
> than 1Gb of RAM.
> This change in fact makes the situation even worse, breaking setups that
> were working
> before with this patch.
> 
> There's a chance that reducing the gap between the RAM banks can make
> Ubuntu work
> reliably again but now I'm a little cold feet with this change.
> 
> 
> I think we'll need some kernel/Opensbi folks to weight in here to see if
> there's a
> failsafe memory setup that won't break distros out there and allow your
> passthrough
> to work.
> 
Hi Daniel,

Do you know who we should talk to? I think it's not uncommon to have
seperated multi-range memory, the stack should support this configuration.

Thanks,
Fei.
> 
> 
> Thanks,
> 
> Daniel
> 
>>
>> Signed-off-by: Andrei Warkentin <andrei.warkentin@intel.com>
>> Signed-off-by: Fei Wu <fei2.wu@intel.com>
>> ---
>>   hw/riscv/virt.c         | 74 ++++++++++++++++++++++++++++++++++++-----
>>   include/hw/riscv/virt.h |  1 +
>>   2 files changed, 66 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index d90286dc46..8fbdc7220c 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -75,7 +75,9 @@
>>   #error "Can't accomodate all IMSIC groups in address space"
>>   #endif
>>   -static const MemMapEntry virt_memmap[] = {
>> +#define LOW_MEM (1 * GiB)
>> +
>> +static MemMapEntry virt_memmap[] = {
>>       [VIRT_DEBUG] =        {        0x0,         0x100 },
>>       [VIRT_MROM] =         {     0x1000,        0xf000 },
>>       [VIRT_TEST] =         {   0x100000,        0x1000 },
>> @@ -96,6 +98,7 @@ static const MemMapEntry virt_memmap[] = {
>>       [VIRT_PCIE_ECAM] =    { 0x30000000,    0x10000000 },
>>       [VIRT_PCIE_MMIO] =    { 0x40000000,    0x40000000 },
>>       [VIRT_DRAM] =         { 0x80000000,           0x0 },
>> +    [VIRT_DRAM_HIGH] =    { 0x100000000,          0x0 },
>>   };
>>     /* PCIe high mmio is fixed for RV32 */
>> @@ -295,15 +298,12 @@ static void
>> create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>>       }
>>   }
>>   -static void create_fdt_socket_memory(RISCVVirtState *s,
>> -                                     const MemMapEntry *memmap, int
>> socket)
>> +static void create_fdt_socket_mem_range(RISCVVirtState *s, uint64_t
>> addr,
>> +                                        uint64_t size, int socket)
>>   {
>>       char *mem_name;
>> -    uint64_t addr, size;
>>       MachineState *ms = MACHINE(s);
>>   -    addr = memmap[VIRT_DRAM].base + riscv_socket_mem_offset(ms,
>> socket);
>> -    size = riscv_socket_mem_size(ms, socket);
>>       mem_name = g_strdup_printf("/memory@%lx", (long)addr);
>>       qemu_fdt_add_subnode(ms->fdt, mem_name);
>>       qemu_fdt_setprop_cells(ms->fdt, mem_name, "reg",
>> @@ -313,6 +313,34 @@ static void
>> create_fdt_socket_memory(RISCVVirtState *s,
>>       g_free(mem_name);
>>   }
>>   +static void create_fdt_socket_memory(RISCVVirtState *s,
>> +                                     const MemMapEntry *memmap, int
>> socket)
>> +{
>> +    uint64_t addr, size;
>> +    MachineState *mc = MACHINE(s);
>> +    uint64_t sock_offset = riscv_socket_mem_offset(mc, socket);
>> +    uint64_t sock_size = riscv_socket_mem_size(mc, socket);
>> +
>> +    if (sock_offset < memmap[VIRT_DRAM].size) {
>> +        uint64_t low_mem_end = memmap[VIRT_DRAM].base +
>> memmap[VIRT_DRAM].size;
>> +
>> +        addr = memmap[VIRT_DRAM].base + sock_offset;
>> +        size = MIN(low_mem_end - addr, sock_size);
>> +        create_fdt_socket_mem_range(s, addr, size, socket);
>> +
>> +        size = sock_size - size;
>> +        if (size > 0) {
>> +            create_fdt_socket_mem_range(s, memmap[VIRT_DRAM_HIGH].base,
>> +                                        size, socket);
>> +        }
>> +    } else {
>> +        addr = memmap[VIRT_DRAM_HIGH].base +
>> +               sock_offset - memmap[VIRT_DRAM].size;
>> +
>> +        create_fdt_socket_mem_range(s, addr, sock_size, socket);
>> +    }
>> +}
>> +
>>   static void create_fdt_socket_clint(RISCVVirtState *s,
>>                                       const MemMapEntry *memmap, int
>> socket,
>>                                       uint32_t *intc_phandles)
>> @@ -1334,10 +1362,12 @@ static void virt_machine_done(Notifier
>> *notifier, void *data)
>>     static void virt_machine_init(MachineState *machine)
>>   {
>> -    const MemMapEntry *memmap = virt_memmap;
>> +    MemMapEntry *memmap = virt_memmap;
>>       RISCVVirtState *s = RISCV_VIRT_MACHINE(machine);
>>       MemoryRegion *system_memory = get_system_memory();
>>       MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
>> +    MemoryRegion *ram_below_4g, *ram_above_4g;
>> +    uint64_t ram_size_low, ram_size_high;
>>       char *soc_name;
>>       DeviceState *mmio_irqchip, *virtio_irqchip, *pcie_irqchip;
>>       int i, base_hartid, hart_count;
>> @@ -1448,6 +1478,17 @@ static void virt_machine_init(MachineState
>> *machine)
>>           }
>>       }
>>   +    if (machine->ram_size > LOW_MEM) {
>> +        ram_size_high = machine->ram_size - LOW_MEM;
>> +        ram_size_low = LOW_MEM;
>> +    } else {
>> +        ram_size_high = 0;
>> +        ram_size_low = machine->ram_size;
>> +    }
>> +
>> +    memmap[VIRT_DRAM].size = ram_size_low;
>> +    memmap[VIRT_DRAM_HIGH].size = ram_size_high;
>> +
>>       if (riscv_is_32bit(&s->soc[0])) {
>>   #if HOST_LONG_BITS == 64
>>           /* limit RAM size in a 32-bit system */
>> @@ -1460,7 +1501,8 @@ static void virt_machine_init(MachineState
>> *machine)
>>           virt_high_pcie_memmap.size = VIRT32_HIGH_PCIE_MMIO_SIZE;
>>       } else {
>>           virt_high_pcie_memmap.size = VIRT64_HIGH_PCIE_MMIO_SIZE;
>> -        virt_high_pcie_memmap.base = memmap[VIRT_DRAM].base +
>> machine->ram_size;
>> +        virt_high_pcie_memmap.base = memmap[VIRT_DRAM_HIGH].base +
>> +                                     memmap[VIRT_DRAM_HIGH].size;
>>           virt_high_pcie_memmap.base =
>>               ROUND_UP(virt_high_pcie_memmap.base,
>> virt_high_pcie_memmap.size);
>>       }
>> @@ -1468,8 +1510,22 @@ static void virt_machine_init(MachineState
>> *machine)
>>       s->memmap = virt_memmap;
>>         /* register system main memory (actual RAM) */
>> +    ram_below_4g = g_malloc(sizeof(*ram_below_4g));
>> +    memory_region_init_alias(ram_below_4g, NULL, "ram-below-4g",
>> machine->ram,
>> +                             0, memmap[VIRT_DRAM].size);
>>       memory_region_add_subregion(system_memory, memmap[VIRT_DRAM].base,
>> -        machine->ram);
>> +                                ram_below_4g);
>> +
>> +    if (memmap[VIRT_DRAM_HIGH].size) {
>> +        ram_above_4g = g_malloc(sizeof(*ram_above_4g));
>> +        memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g",
>> +                                 machine->ram,
>> +                                 memmap[VIRT_DRAM].size,
>> +                                 memmap[VIRT_DRAM_HIGH].size);
>> +        memory_region_add_subregion(system_memory,
>> +                                    memmap[VIRT_DRAM_HIGH].base,
>> +                                    ram_above_4g);
>> +    }
>>         /* boot rom */
>>       memory_region_init_rom(mask_rom, NULL, "riscv_virt_board.mrom",
>> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
>> index e5c474b26e..36004eb6ef 100644
>> --- a/include/hw/riscv/virt.h
>> +++ b/include/hw/riscv/virt.h
>> @@ -79,6 +79,7 @@ enum {
>>       VIRT_IMSIC_S,
>>       VIRT_FLASH,
>>       VIRT_DRAM,
>> +    VIRT_DRAM_HIGH,
>>       VIRT_PCIE_MMIO,
>>       VIRT_PCIE_PIO,
>>       VIRT_PLATFORM_BUS,


