Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209C7EE14D4
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 10:05:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeBt9-0006BN-JH; Thu, 07 Sep 2023 06:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1qeBt6-0006B0-D3; Thu, 07 Sep 2023 06:05:24 -0400
Received: from mgamail.intel.com ([192.55.52.93])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1qeBsq-0002v1-Hq; Thu, 07 Sep 2023 06:05:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694081108; x=1725617108;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1Yh8DK90+TuHfdr3n/qz/nPA3qWlIxTWN0ka9HTfxvc=;
 b=Tif4jQ4QPHA/gQX0/QejlMfuI6a0Aym3bBgCJKao9k75Dj7TQg8ofkkx
 rgSYFKmOeQ5EmUftbDOA3PhcsBpRsvHKBwIuB7q4o9K+pVisH3jygg8Hf
 EB76MGokuzY8K+nHvj8v+ZboY/AsXZhGDBnAmXD2RADfa5msn1W266oZu
 2q7fytJBDKi/IqNiS0jhCm/XPfiwFYuMsUavbMzz/4bC/tjRf/MltzDiW
 BdGZyLzerEwXfukxpGdfnm6wGD49DQSbaaA7fCL/5uBhXodiHn5kRuzvv
 6HWBco4NG1jAekh+EbBnVj9zoxIzSeLQ7GDIVdya4dL/S0QTcoLF0ToX4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="374705598"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="374705598"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 03:05:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="807483522"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="807483522"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Sep 2023 03:05:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 7 Sep 2023 03:05:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 7 Sep 2023 03:04:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 7 Sep 2023 03:04:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 7 Sep 2023 03:04:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6xD8iExnrJsXcEeXPYZgwfTwgb70F+dje/pqj+cU11PE3dofJMb/59cbwCj4xIHoD6HXE8fNwHeP9/PvzHBxyY/cmcG93oxHIMwCmZMl1FDR3JmOwppatrlnMpOR9KrbuzO3y3P0IIO66jydmj7kRRknie/LnGWrxfbQiN/pRUHC822Ka16lGavHkjUIRB26Imr4AoiHpE+SxNaLN1fiOWx8mrSr5WWcXLC02qGs24c3cYuvwoRM1vGeBWJG1ZN6ulzIE/C/OPQv+93hXUBlKE4MWJPWzU2w3KCkLVwpbRHF2m535XFRj4O943PnN6YU1b2PHSsqtNakTA5X6Q2NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAVm4n8z1MhO3ufpZJM/brOii3rgYePYO/aZ/sD2AXo=;
 b=ROiQR2sZMP7PPK/qX03vg/uaFoURI0X0V4W2QpmQSd7X418u6cANhl0wY+hMDsRnYvAlNa8vAMYYtbpWPZWPugYeSD4QLlf9pdxu1SyJPaYpS9/5tDo6c8iWhFhKk+RdaTUu8nzQ9ioeQ2ALQ7cHNTIjXTs6ywOoaeEFdg7oOTqMq3y1INBQ58ulXQME5YxBrPbALspAL0j3jOG6mE7GnsaULVtAoL0i842aC1GHmim9C5EKNFxbUxfGxs/stO6agnZGnE+lMmvi5RSyuCjareI1O9VY998GYS/oajWVFNophOCkgkpggVIpLknhkMHOcjz4iqLnQMQ/5BEzAJiyFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by CY8PR11MB7730.namprd11.prod.outlook.com (2603:10b6:930:74::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 10:04:56 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::a71b:fe6d:968d:291b]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::a71b:fe6d:968d:291b%7]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 10:04:56 +0000
Message-ID: <57b4ae4f-ea55-e17c-bb58-2f878c121038@intel.com>
Date: Thu, 7 Sep 2023 18:04:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
Subject: Re: [PATCH] hw/riscv: split RAM into low and high memory
To: <eric.auger@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Andrew Jones <ajones@ventanamicro.com>
CC: <palmer@dabbelt.com>, <alistair.francis@wdc.com>,
 <bin.meng@windriver.com>, <liweiwei@iscas.ac.cn>,
 <dbarboza@ventanamicro.com>, <zhiwei_liu@linux.alibaba.com>,
 <qemu-riscv@nongnu.org>, <qemu-devel@nongnu.org>, Andrei Warkentin
 <andrei.warkentin@intel.com>, qemu-arm <qemu-arm@nongnu.org>, Alex Williamson
 <alex.williamson@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>
References: <20230731015317.1026996-1-fei2.wu@intel.com>
 <20230803-3855259bbabb934c247c5607@orel>
 <d654810c-4f4f-7491-7711-c6076f42dcae@intel.com>
 <efc85591-fd5e-c6e7-ab3d-220d5ca57aa5@linaro.org>
 <2916216f-39a0-1a27-ad4e-6c664bf4a04e@redhat.com>
Content-Language: en-US
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <2916216f-39a0-1a27-ad4e-6c664bf4a04e@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::19) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|CY8PR11MB7730:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b1b9af6-3992-4603-bd25-08dbaf89e363
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mloGSXwXalQQ+ZJmZe0NCqpbkUBdJvQYyUaeADp5eaNnjy21VX+GMIgZO6yC4evIOz31J36FTn5WmV6mO3U3+fhj7nrUoMht8LWxAmLkYRq7kjXdEPnhe+L0qPz4FXpUD0UlUihO/XPrp3iglkSQoOPxcB5sZ7etfpg70h0G8y7dGgb2r/zJyc6H+tB4MM9c5dYdbgG74NtHVQ46zSxWfDv34r6q20ziZM5S3Y/R+bXtRtwcd4qbzQ3zQBjpvY51KCL0PNNzGSGP/SzhaUdk9BAlUnr6DEqqzDJNBgqjHYdGWwXexJPvzMoRZYSMWWH9IS7CiA9IfkYN76Mj0qjX1bY5i1pEzK1lSqFcwdVUYNU+Fb2EO+VibbzfQZzITe4EUlxLYV1AL+KGPA3fZxbpSOjuimZ/jdWOL8JzMSJU3F/6WUiv1kwKNy9JEkXjc/TZSDrNbb+rtQ177sVIA5lWVhX57d8Kb9ESoTU1tqM7HSdUtRl5wSr+PxZeSBQMb6RdJvATxVSJv6NjXOND3KHSwJTdeHx6lauWR3EZNPp5UM8+w/h7EEijC4VoUMNyaQyqIAXv2cHZ1eoKF5IZ7IOGWELmTDzXMVYbFPgKLCJW3+r33gJeX5gKEc/4t1v0uG0kyvtql3uUGc/ndbcRdYY4gA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(376002)(39860400002)(136003)(1800799009)(186009)(451199024)(82960400001)(31686004)(53546011)(6486002)(6666004)(6506007)(31696002)(36756003)(86362001)(38100700002)(2616005)(2906002)(26005)(478600001)(6512007)(83380400001)(66476007)(8936002)(8676002)(41300700001)(4326008)(5660300002)(316002)(7416002)(66556008)(66946007)(54906003)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXBmTUNlTGxjOTlZbGJPYUg4MzVtODhUVTJtc0ZUK1EybkduL002aGFYR2h6?=
 =?utf-8?B?U092VlJ0b20zU3FnSENadk5nOFB6NXFFRGorN3FHSkJkSHhNZGV6bk8rQkR1?=
 =?utf-8?B?bEdoclljdTZrRHg4UWxGdTd4NmozVnpPcnZnRXVSTk1IRGplQWI4TTI5bFFC?=
 =?utf-8?B?d3Y1VVd5aUljZDk5N1h2YW9VcDl4Q2JkemdQRFUxbVY2V0dLY0JHeHIxcnRQ?=
 =?utf-8?B?dEl3VUl6ajA5Z1ZXQ2xsY2xnV1BsSldlZ3RPOXlKc2kzNFB0Y2VYNnlmQW9W?=
 =?utf-8?B?cmF1RGhaRkNlaktCNWFlY3JVOHlvaENjT0dQR2wxWlFNV2srWXpyUStNK3lL?=
 =?utf-8?B?dFIzcmt0VDVMWVdsWlZjQUlpVEtGTWZJKzRQYi9lY29ubWhSV2dMYm4vZ3N1?=
 =?utf-8?B?SEZvbVBJaVA0WGFlbnNjRHl6SjdZTnhMK0pxUnYxOUxyczBCalpjTkhjemND?=
 =?utf-8?B?Y2hQUldBY1F2R2g1MDltTnkwSlR4TVI5UW92eWtoejVOMUZQbE5kdnZWUTMz?=
 =?utf-8?B?SStBVnJ0Tkx2RFpZUW5qQi9haG5NZVBlV2ZUeWxtc0xHbExMbWxtQ0c5RXQv?=
 =?utf-8?B?YmdtWDVxQlR1d1hNaExHS05qdm5ibEhtaGJHR0xkMGNORWo1dFFMTjRtR0xU?=
 =?utf-8?B?eTgrR0xmK01mUzV0cmNUZ0NWSFZ2Tk1GUmNYVXJUdmplRDRhWlIzd3dPV0ZP?=
 =?utf-8?B?SE55TmdMRE81YW1CV0poRUowSlY4YW1KckhvNkNSZmtwbVRRcWVhdE4zVmxp?=
 =?utf-8?B?VDV4eTNtaFFMM1NxeHpZckh4WTIyYXQzTEFObGNEaUMvNlpCU3MyZ0hzUk9R?=
 =?utf-8?B?enBkK2VSNHJiaDhrSlVMbTMyeXp3eFhpRFdpTEk4TnAvYjc2bnQ5WmNXVHlY?=
 =?utf-8?B?YUQ5OWlYOWluRUFNYVMyWnNhLy84NDQ4OWhxSXNzUkJ5cytsYTJXSko1RWRG?=
 =?utf-8?B?UlJMNXpuczVQVlpuakVQVVdTbzF0QlFOcVE2d250dkJnU2oxRVB0QzlYdUVl?=
 =?utf-8?B?ZTErcDloa2xscWhBS3JiOXlWOVloOGhvUkozaHhndFF0WG5Ka0o3bFBXRG16?=
 =?utf-8?B?cU04K1h3RXVORTdUNFlZQndjbjdyRFRkbm0yMkNsSEtOeUh0eXBRcVVzME9h?=
 =?utf-8?B?SnFIV3EwT0Q0UVBvcWI1aWxoK1dSbGY4VnpCRXM0eWs3K3JvTm10Q2tLV3hE?=
 =?utf-8?B?RjJPd2pia3lNK2hyYnU2SnFnbHhSV3dJaVZHWlRybWZRZ0hZenZTVkpRcDRJ?=
 =?utf-8?B?OUpmQU9Wc1RIOEdkY21rRXJNMHdMR0JBTFFtTVJnU1haelA4clgyVmZ5aHhY?=
 =?utf-8?B?a1dTUGxQa1VDWlZhWUllbUYrK1d4UEcvLzR2eWViYlFjenpmRVp1ZGRCSVBK?=
 =?utf-8?B?RjFHUmZLdnBIY2xFdDJvVXVnZ0FSMno1V0p1M3BqTytCd1JyMWJybGJqZ2kz?=
 =?utf-8?B?RTB0d2RySFN2bHAvK0dwa2xrc3FPY2E0dXVDMGhtM2hyZDhBWkM2dFNRT3J1?=
 =?utf-8?B?M2xPdnF2R0JSa1pHaGtYZWR1ZHg0Ukl3NDRFN3BtNEs4bG1Qb0IzNzcvTjBi?=
 =?utf-8?B?QnBQczVrdnFsSWZKUlQvSENBYWJ4dW4xRDJmNEFmSlNKcHhMaVV5bVpZUzd4?=
 =?utf-8?B?MkYxSFdIOTJrbmZZZ2cxbzFlZWtuM0lVQkxPRzlpdGw2cUhLaVpGRGgzR3V4?=
 =?utf-8?B?ZjIrZHJRS3ppL3RXUDJVQ29KUk9WK1hCR01jMlN1STY3SEMvSmkyTTIvTmdz?=
 =?utf-8?B?NEdZc2hrVE95SjE3R0RTTXBXZlB5ZUJHU1dRQXNUZGVMWmtBQXNPa1ZOZHRP?=
 =?utf-8?B?Ym9NTGd3STIwODlKTTBPcVdidm1FandxRW83dHUrbjdPQ2gxdDAySzBpYmpq?=
 =?utf-8?B?ditmUnIrSFpBQ0Ezd1FPN1h6RnZVdmd0L0NsN2ZJVk83czU2LzVzWTZseWlh?=
 =?utf-8?B?NUxSc09adWtnTXI1YVJaVWtkcWNxU3lRTThYVGFvdngyU0ViVCtMUlJTaXBV?=
 =?utf-8?B?MmkzZVZFSEVNb1JLMkw0a2hkbmdPNXoyZTBzMHRscEw5QzN1MnhBa3lXOGhK?=
 =?utf-8?B?T3VlQ1lIM2NsZlgzUmNJSTFWR0VENFJHRGtibGJsMmlqS2xmNTNWNnVUYjQ2?=
 =?utf-8?Q?TTGxEJ7Kp7cj6x9sxmEQLdH9Q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b1b9af6-3992-4603-bd25-08dbaf89e363
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 10:04:56.6288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYNJl/wYfFg3QKZXf83RtPtvsDjkj3Ldi48lYBt4uvQ8Ok8GQxUn080jW0jQ0VMPQ/e+D94TbZzZU4YR941NQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7730
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.93; envelope-from=fei2.wu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, SPF_HELO_NONE=0.001,
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

On 9/7/2023 5:10 PM, Eric Auger wrote:
> Hi,
> 
> On 9/7/23 09:16, Philippe Mathieu-Daudé wrote:
>> Widening Cc to ARM/VFIO.
>>
>> On 4/8/23 11:15, Wu, Fei wrote:
>>> On 8/3/2023 11:07 PM, Andrew Jones wrote:
>>>> On Mon, Jul 31, 2023 at 09:53:17AM +0800, Fei Wu wrote:
>>>>> riscv virt platform's memory started at 0x80000000 and
>>>>> straddled the 4GiB boundary. Curiously enough, this choice
>>>>> of a memory layout will prevent from launching a VM with
>>>>> a bit more than 2000MiB and PCIe pass-thru on an x86 host, due
>>>>> to identity mapping requirements for the MSI doorbell on x86,
>>>>> and these (APIC/IOAPIC) live right below 4GiB.
>>>>>
>>>>> So just split the RAM range into two portions:
>>>>> - 1 GiB range from 0x80000000 to 0xc0000000.
>>>>> - The remainder at 0x100000000
>>>>>
>>>>> ...leaving a hole between the ranges.
>>>>
>>>> Can you elaborate on the use case? Maybe provide details of the host
>>>> system and the QEMU command line? I'm wondering why we didn't have
>>>> any problems with the arm virt machine type. Has nobody tried this
>>>> use case with that? Is the use case something valid for riscv, but
>>>> not arm?
>>>>
>>> Firstly we have to enable pcie passthru on host, find the device groups,
>>> e.g. the vga card, and add their pci ids to host kernel cmdline:
>>>     vfio-pci.ids=10de:0f02,10de:0e08
>>>
>>> then start vm through qemu as follows:
>>> $Q -machine virt -m 4G -smp 4 -nographic \
>>>    -bios /usr/lib/riscv64-linux-gnu/opensbi/generic/fw_jump.elf \
>>>    -kernel ./vmlinuz -initrd initrd.img -append "root=/dev/vda1 rw" \
>>>    -drive
>>> file=ubuntu-22.04.1-preinstalled-server-riscv64+unmatched.img,if=virtio,format=raw
>>>
>>> \
>>>    -device vfio-pci,host=01:00.0 -device vfio-pci,host=01:00.1 \
>>>    -netdev user,id=vnet,hostfwd=:127.0.0.1:2223-:22 -device
>>> virtio-net-pci,netdev=vnet
>>>
>>> Without this patch, qemu exits immediately instead of boots up.
>>>
>>> Just tried pcie passthru on arm, it cannot handle 4G memory either.
>>> $Q -m 4G -smp 4 -cpu max -M virt -nographic \
>>>    -pflash /usr/share/AAVMF/AAVMF_CODE.fd -pflash flash1.img \
>>>    -drive if=none,file=ubuntu-22.04-server-cloudimg-arm64.img,id=hd0 \
>>>    -device virtio-blk-device,drive=hd0 \
>>>    -device vfio-pci,host=01:00.0 -device vfio-pci,host=01:00.1
>>>
>>> qemu-system-aarch64: -device vfio-pci,host=01:00.0: VFIO_MAP_DMA failed:
>>> Invalid argument
>>> qemu-system-aarch64: -device vfio-pci,host=01:00.0: vfio 0000:01:00.0:
>>> failed to setup container for group 11: memory listener initialization
>>> failed: Region mach-virt.ram: vfio_dma_map(0x55de3c2a97f0, 0x40000000,
>>> 0x100000000, 0x7f8fcbe00000) = -22 (Invalid argument)
> 
> The collision between the x86 host MSI reserved region [0xfee00000,
> 0xfeefffff] and the ARM guest RAM starting at 1GB has also always
> existed. But now this collision is properly detected instead of being
> silenced. People have not really complained about this so far. Since the
> existing guest RAM layout couldn't be changed, I am afraid we couldn't
> do much.
> 
Just as what this patch does for riscv, arm guest on x86 could do the
same thing to adjust the guest RAM layout if necessary? This looks like
a nice-to-have feature for arm if there still is a requirement to run
arm guest on x86.

Thanks,
Fei.

> Eric
>>>
>>> Thanks,
>>> Fei.
>>>
>>>> Thanks,
>>>> drew
>>>
>>>
>>
> 


