Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF3BC001DE
	for <qemu-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 02:35:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qQfE2-000400-W6; Mon, 31 Jul 2023 22:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1qQfE2-0003zf-27; Mon, 31 Jul 2023 22:35:06 -0400
Received: from [192.55.52.88] (helo=mgamail.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1qQfDy-0004dv-IP; Mon, 31 Jul 2023 22:35:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690857302; x=1722393302;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q3x6AJqKBHvAAy14e+xJAmrE+CEDeQ5+thr7d9CpEa8=;
 b=fNkblMTMwFq46NVb9AUEyBY1yGgw3X/RiT4jEI9sZtnAdS3J77Cv7fts
 kK7HYdxbrfJEl6d7ymODAuKDhDe6C4WvevGEMbz/LsLP+q1mQljlJ9Vi1
 fJ4DqkOFoQmkMTm6huCGp5dyXIRm+NbcYMjzEGOHkjABUhZt/y8BfUya8
 97VPvHh8GjN1i8PlCTgFMv+tsdapSZBHU0oc9sVgyaTAfwj8ETS1/+JjG
 lB1Y/UGdM9BXeWHODiidMJ4F6CCxFkLusazn/u3rw9+yZL+++/y0jpYlG
 qJoyubtznVUVcKvDKthpCiq9bV9beA64CwzX2UNJs8EPImULubHx0lZoq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="400128635"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="400128635"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 19:34:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="705644708"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="705644708"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 31 Jul 2023 19:34:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 19:34:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 31 Jul 2023 19:34:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 31 Jul 2023 19:34:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmvlmLSc4qZVyKzHxqQVBnpT15saE2YvCx2JEZIXSAtfq+PW4PDjwWaJqQsdaxs+GZxcQ0cQ/+8S09P6baSmzz2uLeXnVxwviX7goEtK/Wa65ebrQRFArIJxSmG2kzUuigXJNzQVpOq84w1JIdHaZIWCSqE10nyWIjyYZh//LYilqWfgP+jfofddKEDLV7a8I7FnIXxM/qLHWK6WVW27ozSYWjjNI6MONFjXYDFwNPK1J2qwDbWDJFkqYLJtD1Bx6CHv06im5GLdN5Pw194hq+arHXpyMjQdomNjdFQvvQGydADt58/+RLQa7OjXBmg4LuGmTIH40uJgd+usllop/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NMP7BwX4LdaGEWXkZmLqugLu02HYmCo+c+Un/ryvlY=;
 b=k93PL1jypCljv4t9DE13Egk+VDj1Aow/UZzgyb4uoCUaVbJ9nw0xwfq6TDnlby2wogHduBI6fQAJiAu5fHw1RNwrgVynUX9aFrQhSV39RLtGer/zjmgiMxeqqQTvynE9j0Pj9l7VfKAywQ5ViAUlmoiuHRMXF2sfKB/0w/tXyGMdySThos9Gr78l5NpZOfcAVaQy+gVEoX88AABuNzJQCWmdgG2XovHSstHZgPe5X6N7PCsSkPMdkXKlWl9VepD6+mg10dvnFeuURsFGWEXmTreyzOVTK61+wxwz+30MapQTyBdA9ZcwO4Ia0Nebj7rd7iGyYem3NcocTrEivZlFGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by PH7PR11MB8121.namprd11.prod.outlook.com (2603:10b6:510:234::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Tue, 1 Aug
 2023 02:34:51 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::5b6b:aaed:74b9:dfb]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::5b6b:aaed:74b9:dfb%4]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 02:34:51 +0000
Message-ID: <0c26742a-4974-c92d-1778-8b2ed8d9529c@intel.com>
Date: Tue, 1 Aug 2023 10:34:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
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
X-ClientProxiedBy: KL1PR0401CA0011.apcprd04.prod.outlook.com
 (2603:1096:820:f::16) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|PH7PR11MB8121:EE_
X-MS-Office365-Filtering-Correlation-Id: bd35778b-5e4d-4ad0-3571-08db9237e147
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kELHAQD8XBXQ8YxdFdZcE00Kx3u3TSnacuFjSBHJiNaLXrmAiH1CDjbMY8NBDaJKdLVCohuxwC9dJJqPW8w3MHOCsbtepersS3llZNGkhhAldhcMYiQTpzaBdsJPtVGo76O3HmLUcgEjH7zsvmAx1R5lQjFujhkeYWoMKEiGkTe7h+brQ9lQHqqWH5+AgtGqaAOxo0wEnpqB+CS2m+WrFQxE+yvzXVvuJBPEw5K8N/HrY4PZpgZHUtWMq/QUQcUcS+QKZjqyQNbrL0XZ6+M8O74TllEf+nVX6pYNg1DzYdiJTB97m41kqNtymXkiK/lDXBysOzPuTLSO3S6UqWRjajV3oEsaLHJVqfMWb5dp8bdTsJYyHvQocSAOJydyWa+GSTKiamZI7ZtnM/Y1ZGONctW6IyO+npv+A1KBnRO3clChqRLVKJk4b8a79b04zuftJyIsqVnT7P170+jZcPa8a6w8U334L8HC62B+3gvHmVUVkym0sDpwPsYErBqmCIEm04Zql0UeHH7c0RJ/GXEpZEEvecEwYgFmJl50R/jiZKcVeUaxXx/QXlcJfRil92x9ynCx61Q8FSor71sRkjeLBID3W6JZwXSK8H4DSa3+QbZANzkf+KgBDue4qrnEWGVih7Z+AiDMh+/EN6sqr/Bl9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199021)(6666004)(6512007)(478600001)(6486002)(186003)(36756003)(107886003)(966005)(53546011)(26005)(66556008)(5660300002)(2906002)(4326008)(30864003)(8676002)(2616005)(38100700002)(41300700001)(316002)(82960400001)(66946007)(8936002)(6506007)(86362001)(31696002)(66476007)(83380400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW4ra1JQKzF1MDRUSDh2YXRPRmo4Q3p5RVdJR3BuOGFVQXFtZUM0VmdQZmFm?=
 =?utf-8?B?ME4rdHdEcE1wV3lHblRkMDd2UjRaSCtMaVppZUxoSG1MS0NXWVg1NWpnM2N3?=
 =?utf-8?B?Ti9obkpCQktLMmdQSlNuMWdhUUZKcDdqRlJDMXhraDYxV3BrYm5rOHdhN2lh?=
 =?utf-8?B?aUM4SFJiTlV0cEt0d0pZaHpIY1B3L1JtM1I3UjhHbGRMUkZFK2sxcElmQW1m?=
 =?utf-8?B?WnNrKy9UQTRpZ3RkWjhOYTlERnpGSkE1SGY1aDdKR0hXTnhwLzNBRW9KSjBh?=
 =?utf-8?B?OWM5YlB6WG1GcFZUS1VLVEtMeWd5aC9TZWFUTklvaVRQYWJ0T3JVNEZIRHYx?=
 =?utf-8?B?Ty9tTWRKQWZWZGxaQ01UQThad2lIN2FRcUJmeE5uekFXWHR0RnMycVBxWTNU?=
 =?utf-8?B?UFRxVWhjSXd5dWM3c2VjakpONXJHTDh4aG55NjE2TVBhTVFLZ2pRN3NNQ2V0?=
 =?utf-8?B?aEdxNmpVdk9FR1RndWlNL2tSUy95K1NDVGR3eW9RN0VWMG1PVC9HU2c2RHNJ?=
 =?utf-8?B?Vjl2VzBUc3ZxakxBRnRPM0xNVjF1Z1NhQ0lSZXkvZmV6SjVFNm5uUWd3Y1pF?=
 =?utf-8?B?U2lwVHFBVkxLWFJGZE5QSkJudnBNZFFCdjB2TFh4bHBuTWFGcDhmWjkxZStP?=
 =?utf-8?B?bHpHSlJFMkhUWTN0aHgxT1pSakFTc2x4QUxBMDFYZ3laUWY0S2E3aEExSDVz?=
 =?utf-8?B?aDBPblhWMEVhazlvd1JNWmpyZE9lSkdHSHZFWXNvRWNNREdJa2hkUjVmcXl4?=
 =?utf-8?B?aFRCZ0tHNjB1VHhRaUI2amdRUmY3VEd3cm9oL1FOQ3AzaXVNMUhQWVNkZUJj?=
 =?utf-8?B?OGYwamRvZWNaY0JHTEVqQVFWOGhGdWdZaFBrZ2RYWGVROHNqQ3Vtd29kcFkz?=
 =?utf-8?B?UEtOay9RMVhoSVRPNnc4cy93cmV6Y1AxRHdZaGhDbUYwN0UwSDhBTExqL0hZ?=
 =?utf-8?B?d3V4QTk5WFk0TktRTkpmNUVVZHk2cDQ2M0ppd0VVcFo4RURVaDhTZDQ2c05x?=
 =?utf-8?B?L0lkVnZ1MTBNWkFoeC9YV0hyMExjODNhN3piRnhHUDRCcGhJZUpnRVd2OGVR?=
 =?utf-8?B?TGl4RVplSFJxVUZYNnR2aS9KVXNWS096WWFsUE5UUE42WVRFWENVL0Nwbmpv?=
 =?utf-8?B?QzNVTkVMQ01mWHZUVU9QZ2dhK3R6cDdYbjVLOWVqRmdhaWdMZC8vR0NpeGpv?=
 =?utf-8?B?dGZrQ0JLTWtRZENONVNnT2YzS3VVUmYxcUJFK1pmTUVraWpFQ2o3QkJwUlBv?=
 =?utf-8?B?NnZBeWJKL1JmWmNmN25zSHMxZjc0aUlvM0I0WThzR29lcE44aTF0dEExaW1N?=
 =?utf-8?B?Tm1qY0FKSlo5WkRQd1M1UUlNWlNzUTRtcVNPR0t0QTUyd3BnMVFMRFhrdWM3?=
 =?utf-8?B?TXYwY3MrK0dhUHo4N1FqUXBocHIweUpPK2J3VkJOUVN2QXJieVlxSkdhY2lX?=
 =?utf-8?B?Z0hqZU5LT3h0RERNU3lLQTdxaDBVU1pZajZIbStURWZVRUxKNktsN2xiZzJt?=
 =?utf-8?B?TmM2NnY0ckszSkVBQXF6R2k3dmFkeVViRlEyU09iUnZaU0N1UnRaUjBPOFpv?=
 =?utf-8?B?Ry9MaXluYWxhekRTa1VLMmdTWWo0dFNXNFk3VmRNNVMxQ1dxNzFvZ3FuMGZq?=
 =?utf-8?B?R3RZSHpBVEFsN2ZXTXlDellmMXlnT25sd0FzWjNtZUhjcnJROGFwcFVsYVBW?=
 =?utf-8?B?OWZGOE95Nnl1eGtOVkJ6bUxJb1VBemhwMG1uaXFCcFNjVVBDeTFNeS9idVVo?=
 =?utf-8?B?NnpsRlVSd01EQTMvM1VXRWFLWDJVaWlTU1RYWkdSNTlhbXI2bnVaV0ROdll1?=
 =?utf-8?B?NDdjRUxzS1dTZVFjUURIY3FlTGprZWZLcDlWMi83SHpIcnZ6ZW01WjE1aG93?=
 =?utf-8?B?N2gxbGJvRGFzd1BUZFpaWEdwQW10cEp2VXF3N0pKZFhCRHdZdytyTWlyZmFY?=
 =?utf-8?B?YjBOMmhaUjRhNld2eG5ZMG1DSkNiUncveWhBTHBMdml5K0NQbU9UR1pkUFY2?=
 =?utf-8?B?Y29LejZOdW55OExuMVVsZktiZkovYmlkdWFNbU5UMUorVTRubEs5S2F1WWsr?=
 =?utf-8?B?NEZaSm9DaGZXVU4yZ2RaT1ZOTVJmdDczdmZwY0k4VkJGZzJzRWRmVGJDM3hk?=
 =?utf-8?Q?zZ8whhE4GDQjiMe6PeCdb8npR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd35778b-5e4d-4ad0-3571-08db9237e147
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 02:34:50.6838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vaxink7JV5tNsrJe/nmMesdhZeV9N8LNN+9aaM+E7JQtj9LN3ajeJ9MjST1fhw6eGfY26DBjc4xQxEZkEafDlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8121
X-OriginatorOrg: intel.com
X-Host-Lookup-Failed: Reverse DNS lookup failed for 192.55.52.88 (failed)
Received-SPF: pass client-ip=192.55.52.88; envelope-from=fei2.wu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.101, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Thank you for the review. Yes, we need to consolidate the whole stack in
the boot process.

In my testing, u-boot can read fdt, but it doesn't handle the
multi-range physical memory situation well but assumes a contiguous
range, see fdtdec_setup_mem_size_base() in u-boot:

int fdtdec_setup_mem_size_base(void)
{
        int ret;
        ofnode mem;
        struct resource res;

        mem = ofnode_path("/memory");
        if (!ofnode_valid(mem)) {
                debug("%s: Missing /memory node\n", __func__);
                return -EINVAL;
        }

        ret = ofnode_read_resource(mem, 0, &res);
        if (ret != 0) {
                debug("%s: Unable to decode first memory bank\n", __func__);
                return -EINVAL;
        }

        gd->ram_size = (phys_size_t)(res.end - res.start + 1);
        gd->ram_base = (unsigned long)res.start;
        debug("- Ram base: %08llX\n", (unsigned long long)gd->ram_base);
        debug("%s: Initial DRAM size %llx\n", __func__,
              (unsigned long long)gd->ram_size);

        return 0;
}

Also, board_get_usable_ram_top() returns 4G-1 for this setting, that's
why the error message TVAL: 00000000ff733f90 comes from. Actually it
does boot up if I switch the order of the two memory nodes in fdt, but
certainly it's not a generic solution.

There is a similar issue in grub grub_efi_mm_add_regions().

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


