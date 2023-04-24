Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqvoW-0002LN-L7
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 09:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yong.li@intel.com>)
 id 1pqtgK-0006v5-LU; Mon, 24 Apr 2023 06:44:28 -0400
Received: from mga01.intel.com ([192.55.52.88])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yong.li@intel.com>)
 id 1pqtgI-00050f-5l; Mon, 24 Apr 2023 06:44:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682333066; x=1713869066;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=d4A9vJsD+saaHG9wchVOenGSx4rqvfTPVc/6Yldzj+I=;
 b=aPH5mnCdcWHoQ781atZXdPmTfpFR6V/xcjveLs1WyAjz/vIc/zVy25V8
 F6qJwxPCDf9IIw2nIw+rNtq4yTsKUAPvYkgJalurLiIufghqWZDBaCFBL
 DJ+/PlYgDVyXVpLbTRKiHUzvY/ONb4kGdfBr/KhnXy2XyUP2g075TxLfj
 gEXG2kW+fkQ3oGnyXuzCwhmgH8DuzJ+Xz3ZimQj8fkZdEfy73k2/zgZy0
 0rJFfHXmO1aMAmfdkeyBF91zBalZEYCfmouOVT2y5WC0XuT8xdL1RkQTM
 cNTXYc9woY5zqYomv/Q2W340DhdSXsSH0anokwWuXqMK19uOfyyoSq8fA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="374366424"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; 
 d="scan'208,217";a="374366424"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2023 03:44:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="762379152"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; 
 d="scan'208,217";a="762379152"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 24 Apr 2023 03:44:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 03:44:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 03:44:04 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 24 Apr 2023 03:44:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmSrX4dCHTU0YwedS8/IsuRKOQdjpt18k/9fGsZse1RMI76GWFeHcWvHilY2u61XZonrOAxzv+znIaTEsp3GwAHnwN3LjB0HI770L+ulhIxMkxKzr/PPjdIWgtHSbXLsqEMmu5EAj+CBba9liUrGdrTzjRulGEb3yj8Dz5muOeAJ056CCxTq0LgLnzVPLsfhwLlIokG9+JTgzFc/Xl+35EAxBGahOqfVOn5W68WO7KAUkfgDb90mkggSM4avkdZJb1uiii/xA7zkI4Ns2MjwA52bQKoIeIFtgD5ee6J+/mZIntLY09tmsr+2SkHxwUjWHAVvIfHYO/xfmcUKvBOQGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uS6oZchCJhFlSFzwTQHeV1NHlJTZOIKZ6vyH5YEoHrA=;
 b=Y3Bziaf6+KBPmv7r8jO9G3v7m9dOSpTkH9urJFAzbHzNET8aUaf4MGVsOWod7QFXTvvSmpAG+MI7ocJW7mmm4muJrfRjGzC2D0Kg0AAMHptSnZJQbG1fDj0UhlCwq6rmL/9sknTj4x7fN28xzDH9BMRN/2YJ4ACddmRm+FEnA4mfzlsa4cGwdqhgLjks/dH95f9xe7WTB1oO3uLyd6aJ5syeBPdifFgZ+mucgtXAUF3pWuc3hTsdUFkT3bO85e9fC9BuYiRS8bODAayYNcAak26b0R2xJp8zIzqOr7jpDYm/t+mSAXDKIB5MXAL6PnU9XO6a1uxy3GI6Da2bMJJNMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3861.namprd11.prod.outlook.com (2603:10b6:a03:18d::13)
 by PH8PR11MB7967.namprd11.prod.outlook.com (2603:10b6:510:25e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 10:44:00 +0000
Received: from BY5PR11MB3861.namprd11.prod.outlook.com
 ([fe80::e047:d647:7996:4c7a]) by BY5PR11MB3861.namprd11.prod.outlook.com
 ([fe80::e047:d647:7996:4c7a%4]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 10:44:00 +0000
Content-Type: multipart/alternative;
 boundary="------------w2vxDgiRC1PC05uviQfwd1ki"
Message-ID: <1f17fe7f-9587-8dfd-f698-646f536fbf85@intel.com>
Date: Mon, 24 Apr 2023 18:43:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] hw/riscv/virt: Add a second UART for secure world
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-devel@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Alistair
 Francis" <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "Weiwei Li" <liweiwei@iscas.ac.cn>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, "open
 list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20230424062409.3395609-1-yong.li@intel.com>
 <CAFEAcA-qEUzFkhzqr2xNpPHK2=mZWz+J-7Gtf-5KDYdkK6A00g@mail.gmail.com>
From: "Li, Yong" <yong.li@intel.com>
In-Reply-To: <CAFEAcA-qEUzFkhzqr2xNpPHK2=mZWz+J-7Gtf-5KDYdkK6A00g@mail.gmail.com>
X-ClientProxiedBy: SG2PR01CA0114.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::18) To BY5PR11MB3861.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3861:EE_|PH8PR11MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b430967-835d-4336-0c00-08db44b0d040
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gKmGMeOssj8KR3NR6NVQrML1aGnmieDoqaInCyKAh0XwL9fN6ISJG9WdzvoJemlstX+t0Hlmqrn5+tZoFN6/FUz/FrahCe4fORSDFfKlrzzlnELp9Wdf+CoNVpjUse0LRAqvCvRvbwiXhn2SYjDWC9ey80clRcbm0tBTXVF4vgRWMktK4ATSl/xOC12Gw9SQz80eiPUwxoENxc8hcOSMQ+cAiFQ9NxK4xGWclzXeFgTpy/zPNZc8Iwqckfdh/Xay3DKyjH8X+AY0kZyTpUeGmeuyNh5TtAZILL5VgKx4izjfqU1wg81CaGvRuo0YdLOahv63Jj0CdgvKVm3U7bcfWDFdsYJw5JmaDDgxIhyT3C7ldb+bf9ciijjKx5gBgiofzRKdMZDmF44pupTGxcF2UJK2wsyJwFAIDXzVrovcz4wobXyc78gnsTRuaT0tvs80WNl/ckZucpYrOI3mRfxOOsvADSxavIO17clEdEXupb2sd4B938YBzOxJ2LVA40xq2Z6doV/8toW0RgJMPFELggjJC0WtG6gsgdNYgQA8Cpd8pXtN0ooANCCWLoq61yQ/YQ+bxi1qaSpzO1w/5jguJF2qE3ldAmUs2E5D7WG5iqw5wBRYwvs6bt30UeMLXcohIR2R5pmENte3o55LlXIqxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3861.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199021)(478600001)(31696002)(54906003)(86362001)(36756003)(186003)(53546011)(6486002)(26005)(6506007)(33964004)(6512007)(6666004)(4326008)(6916009)(66476007)(66556008)(316002)(82960400001)(83380400001)(66946007)(2906002)(38100700002)(41300700001)(8676002)(8936002)(31686004)(5660300002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGt3aTg3aWpWWDRvSzRDVGhWMGxRendVM0JVSmhtck0xaUdKQUxrYU91SUJS?=
 =?utf-8?B?OUdveTUxK2kzTjVVWXJZSGF2N1p5UVYxQmEyQzRhdU9hR2lqenltazhpWjBy?=
 =?utf-8?B?NW1RaldTZDVOTEM4UFgrU0RTR0J6R1dZbTUyZTQvdDN1ZTRydm5uK1o4dXlC?=
 =?utf-8?B?K1Y2enNNYUVHTjFiZVFkNGptc1JBQnUwWVJVOWswb1VaWkpneGRZeHh5Q3RE?=
 =?utf-8?B?Mm9IUEpGSE93cXVyWFhIUzJhaHR6RDQ4TU9ZYU9rTDI3cDRsYmNNR0RGU24v?=
 =?utf-8?B?UG4rVGp2ektKM3BESFFFdDdxQjY1RUFCUm9YTE42Z1JISDBIekZJRWE1TnhS?=
 =?utf-8?B?MC9UL3Y1NUozeDkvQ3UzYk9yZ1IzY2h4cTVtOGxXVWhVMXFmQzIxQkZuWmMx?=
 =?utf-8?B?UHlqSXpUSUxNUngvNmI1NlNKOVFSQ3htMk5zdFRSL0UwNUE3bTJuU2lMbnMv?=
 =?utf-8?B?N0o2UlJDaGhrVFVvWEVnTGlFT1ZZY2kyTERZOWhaQUZqV1pQTU9ON1Fzazc0?=
 =?utf-8?B?T1lvQ2wzQk0xUlBmWFZ5cWZOZGZ3TGVPRVk5SnNvbHhSZU5ZR3lPZ0xXRm42?=
 =?utf-8?B?TEVLWHNqMjZsU1dzam00RVdybU4rVWEzdU94Mms5RFVYd01OdzdZVnJwRVpR?=
 =?utf-8?B?OGNkMG1sL0R3WlkwR2lCSkp1aWhWMjFsdnZYa3NKcWlwNDJpWWliMUxuL3hX?=
 =?utf-8?B?Q3VUUkJERndncE5vekc3ZTZXZEh3cXdYVytQaE05Q3VQWm0zQnhlT2FBenVr?=
 =?utf-8?B?ZXFyZDhjNnZhQ2Z3azJMUDRGbWpGRFl0UnRaMXFuOXV1ajF4Ykk1Sm9iQi9B?=
 =?utf-8?B?V1JTQ0drck9yOTlheWtmZGdCZ1RrZFFYR01RQ3Irc3ZieEdGRWl5MFFqS1dj?=
 =?utf-8?B?R1ZWN3BRcUNFek4vQmI0UTIwSFhiMWhOYmFTUUkxV3ErQXFFTE95ZnJ3OE9y?=
 =?utf-8?B?cmxvazdjWGNhTWFvem5wcVpEL20zL0pWclIwdnhZTWZEYzZtTWF6Qm5tc0Vn?=
 =?utf-8?B?STczbVRHaVhENkFyNUVqT0RYRStML3lXWTFLMThReUMvU2dHRldHeFdWeVhU?=
 =?utf-8?B?azVsWk9vVzNVNmZHSXNKeVZoYjZ4eHlycE9Dd01LNjFONmtESWh0Y2hPU3hG?=
 =?utf-8?B?ZlpTbkVVTExZRnAyeERCNzBhM28zWFl4QzMzUWtUTmhUTjRKSkdEQzMraXNv?=
 =?utf-8?B?cEI3ejR3bU9sRUxkeWdjeXB4TFdpT0RMdFFPamVsK0FwdCt2U28xVGF2K3U0?=
 =?utf-8?B?TUpaUjIraE56NGlRUXVxY0VaQksyMGQzTWMwYld0czhjSkQ0UkU1Ynk5UXBT?=
 =?utf-8?B?Y2dVYmR1ODRlajZtRDkxRlM5SElPaXRndllZdVlNTE5SS3F1WnhrTGxua2pi?=
 =?utf-8?B?ZzR3U0FaTlpzV0V5M25oV0hOVmQ3MVN5ZDl4R2N6TjJXZEtTbFlmUDlLVE5S?=
 =?utf-8?B?KzI4ekV0MGN4T2F4TEZzNjA4RTcvckJTUXFXWllyNHptUVJFMi9oNG9SdFZW?=
 =?utf-8?B?Zlp5c3c4ZUQ1ZkFRNElmQ08yakN3WElvMW5PT3hHTWxqejlmcjZYVTdyMlNY?=
 =?utf-8?B?eDBvM1NDekJRVU1vTEs3S0I4SkwxME16NE15Rnd5L1RucEFidVNLVjcrV2lN?=
 =?utf-8?B?VFF2QjRTMHNVTWJBbWtwUmkrREc3QzZhRXY2OEt6aldoN0pxTDd6RDU2YXUw?=
 =?utf-8?B?eExVcGwxbys2UGQxRWsvVDBYWDlXa0FRcy9rRnFGT21uSnRodHFkdUtwVE5Z?=
 =?utf-8?B?SEFWVDBDZDYwVE1aUmRpeGljenJVSDRNYzBYTkJ1N1FCRTBaOVV6NGlJTUFB?=
 =?utf-8?B?RldWV0xJNC92bDEvNWlvaDlVc3dNRjcyT3UveG1IYVZHNnI4WWtXVy9xbFdT?=
 =?utf-8?B?UkhoeDBHY21LV3dOOEo0SXpjS3F3Y1lSTWdSdjRkeWt3MjFMaHVNVUtWOXo5?=
 =?utf-8?B?MjJnSVFVU0VhOTFLNWZsZnJYcUNjNXk0dkZsTWRyQ3FyR1l4WldLYVJETjd4?=
 =?utf-8?B?aEdnV1p6ZmFrUHBPc1Z5dExjOUl3eHZ1UE5oVllha2FIYVNvbXJXWmFXVEhj?=
 =?utf-8?B?SG1Rc1lIdUNXUEs1dGxHMUFxL1JyOC94cUVFVjRxKytkbENNQVlRWEg1WUVp?=
 =?utf-8?Q?b6lJBiGFXscs/8dQ1qxSbOYu1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b430967-835d-4336-0c00-08db44b0d040
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3861.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 10:44:00.5553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xVhXyReRYEggb7oLbZovgywdfxkT+y6zfb6VtYniBspTlw27XgAmGiocfHFhKrHaNVZDb7EMcBstrFX9pcSkQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7967
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.88; envelope-from=yong.li@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.172,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-2.143, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 24 Apr 2023 09:00:57 -0400
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
X-List-Received-Date: Mon, 24 Apr 2023 10:44:29 -0000

--------------w2vxDgiRC1PC05uviQfwd1ki
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 2023/4/24 16:59, Peter Maydell wrote:
> On Mon, 24 Apr 2023 at 07:24, Yong Li<yong.li@intel.com>  wrote:
>> The virt machine can have two UARTs and the second UART
>> can be used when host secure-mode support is enabled.
> Do you mean "host" here, or "guest" ?

Currently, it is an UEFI secure firmware residing in a secure 
partition.  Let me update the message with a v2 patch

>> Signed-off-by: Yong Li<yong.li@intel.com>
>> ---
>>   hw/riscv/virt.c         | 4 ++++
>>   include/hw/riscv/virt.h | 2 ++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index b38b41e685..02475e1678 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -88,6 +88,7 @@ static const MemMapEntry virt_memmap[] = {
>>       [VIRT_APLIC_S] =      {  0xd000000, APLIC_SIZE(VIRT_CPUS_MAX) },
>>       [VIRT_UART0] =        { 0x10000000,         0x100 },
>>       [VIRT_VIRTIO] =       { 0x10001000,        0x1000 },
>> +    [VIRT_UART1] =        { 0x10002000,         0x100 },
>>       [VIRT_FW_CFG] =       { 0x10100000,          0x18 },
>>       [VIRT_FLASH] =        { 0x20000000,     0x4000000 },
>>       [VIRT_IMSIC_M] =      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
>> @@ -1508,6 +1509,9 @@ static void virt_machine_init(MachineState *machine)
>>       serial_mm_init(system_memory, memmap[VIRT_UART0].base,
>>           0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART0_IRQ), 399193,
>>           serial_hd(0), DEVICE_LITTLE_ENDIAN);
>> +    serial_mm_init(system_memory, memmap[VIRT_UART1].base,
>> +        0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART1_IRQ), 399193,
>> +        serial_hd(1), DEVICE_LITTLE_ENDIAN);
>>
>>       sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
>>           qdev_get_gpio_in(DEVICE(mmio_irqchip), RTC_IRQ));
> Is it intentional that you only create the UART device
> and do not add it to the FDT ? (UART0 doesn't seem to be
> in the ACPI table generation code so I guess that part
> is OK.)
>
> You probably also want to test for compatibility:
> for arm we found that different bits of software
> (firmware, Linux kernel) annoyingly iterated through
> the dtb in different orders.

Thanks for the comments.

Yes, tested with our software stack which has edk2 , u-boot firmware,  
and also linux/debian os.  No compatibility issue.


>
> thanks
> -- PMM
--------------w2vxDgiRC1PC05uviQfwd1ki
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023/4/24 16:59, Peter Maydell
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAFEAcA-qEUzFkhzqr2xNpPHK2=mZWz+J-7Gtf-5KDYdkK6A00g@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Mon, 24 Apr 2023 at 07:24, Yong Li <a class="moz-txt-link-rfc2396E" href="mailto:yong.li@intel.com">&lt;yong.li@intel.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
The virt machine can have two UARTs and the second UART
can be used when host secure-mode support is enabled.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Do you mean &quot;host&quot; here, or &quot;guest&quot; ?
</pre>
    </blockquote>
    <p>Currently, it is an UEFI secure firmware residing in a secure
      partition.&nbsp; Let me update the message with a v2 patch<br>
      <span style="color: rgb(23, 43, 77); font-family: -apple-system,
        BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Oxygen,
        Ubuntu, &quot;Fira Sans&quot;, &quot;Droid Sans&quot;,
        &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px;
        font-style: normal; font-variant-ligatures: normal;
        font-variant-caps: normal; font-weight: 400; letter-spacing:
        normal; orphans: 2; text-align: left; text-indent: 0px;
        text-transform: none; white-space: normal; widows: 2;
        word-spacing: 0px; -webkit-text-stroke-width: 0px;
        background-color: rgb(255, 255, 255); text-decoration-thickness:
        initial; text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;"></span></p>
    <blockquote type="cite" cite="mid:CAFEAcA-qEUzFkhzqr2xNpPHK2=mZWz+J-7Gtf-5KDYdkK6A00g@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Yong Li <a class="moz-txt-link-rfc2396E" href="mailto:yong.li@intel.com">&lt;yong.li@intel.com&gt;</a>
---
 hw/riscv/virt.c         | 4 ++++
 include/hw/riscv/virt.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b38b41e685..02475e1678 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -88,6 +88,7 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_APLIC_S] =      {  0xd000000, APLIC_SIZE(VIRT_CPUS_MAX) },
     [VIRT_UART0] =        { 0x10000000,         0x100 },
     [VIRT_VIRTIO] =       { 0x10001000,        0x1000 },
+    [VIRT_UART1] =        { 0x10002000,         0x100 },
     [VIRT_FW_CFG] =       { 0x10100000,          0x18 },
     [VIRT_FLASH] =        { 0x20000000,     0x4000000 },
     [VIRT_IMSIC_M] =      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
@@ -1508,6 +1509,9 @@ static void virt_machine_init(MachineState *machine)
     serial_mm_init(system_memory, memmap[VIRT_UART0].base,
         0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART0_IRQ), 399193,
         serial_hd(0), DEVICE_LITTLE_ENDIAN);
+    serial_mm_init(system_memory, memmap[VIRT_UART1].base,
+        0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART1_IRQ), 399193,
+        serial_hd(1), DEVICE_LITTLE_ENDIAN);

     sysbus_create_simple(&quot;goldfish_rtc&quot;, memmap[VIRT_RTC].base,
         qdev_get_gpio_in(DEVICE(mmio_irqchip), RTC_IRQ));
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Is it intentional that you only create the UART device
and do not add it to the FDT ? (UART0 doesn't seem to be
in the ACPI table generation code so I guess that part
is OK.)

You probably also want to test for compatibility:
for arm we found that different bits of software
(firmware, Linux kernel) annoyingly iterated through
the dtb in different orders.</pre>
    </blockquote>
    <p>Thanks for the comments.</p>
    <p>Yes, tested with our software stack which has edk2 , u-boot
      firmware,&nbsp; and also linux/debian os.&nbsp; No compatibility issue.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CAFEAcA-qEUzFkhzqr2xNpPHK2=mZWz+J-7Gtf-5KDYdkK6A00g@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

thanks
-- PMM
</pre>
    </blockquote>
  </body>
</html>

--------------w2vxDgiRC1PC05uviQfwd1ki--

