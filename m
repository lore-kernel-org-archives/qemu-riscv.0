Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfhN1-0000AH-CM
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 09:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfhMz-0000A5-Cm; Fri, 24 Mar 2023 09:22:13 -0400
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfhLl-0000HI-2W; Fri, 24 Mar 2023 09:22:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679664057; x=1711200057;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YN04HM0AUCvn0q6spAPG4QEtYHi/K5WLFTu0NwUXaOs=;
 b=a9Qq5B/JsKtlgsxtKvRue4TY/jOrOKZs8JfigmqkVr2vx3KbNDkY3VWd
 HtToq5sPoava3PnGLq+UX/KqIlLM2nIdHL5uXKm5UwBeV/ZOVextSPueS
 SqvApI04tcFa4LadhzrnRbBFWlZKZ2pWP3HEO8MCIkwd8CrpyrURdiFPN
 c/cTw7L5JwgTS2XIRSaSGpKrQnCTXop9WQHW02GMGMMR2xWXQC5CAVJcA
 qUgxLt0CentfFnpXYazjVZq7MqP6rG0dioIfaH4oiQUqkCvwH6BZ+N+UY
 I5Jf60ng4fYU0CqOoDM9GwttbLPDfxqvmW3iGNzm+4oRGGwB0qLW6UWDs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="339792215"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="339792215"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 05:31:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="747147455"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="747147455"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 24 Mar 2023 05:31:27 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 05:31:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 05:31:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 05:31:26 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 05:31:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwLxPpJdzZy8tZiOV2cp1fEXTRORICvsBcB86/2wvooA8j1FZ627VF0tnoYvKmcIelY8muk4t0DgqR78wux0k1GYHT4y6LV8N40+BS1B+av9Lix/9iLOwJ+/utbsBzyc78PE6XkuS+ji4jJjR5l1/5WMz/9ET+6Kmr2yEbAgDQUDa2B3AxGjgL/6E2X+/anGfclq8KkqmydmawUrhxtd+BZCX1e0freAEcdU+XS2HTvAwOXgfy0xBgjv/VK2zpzyxzyXX3czOlD25opZBTnNvVRAklUeoQWE1PcBN+ydS6DX+gYJycdQTcoAEkVwk51kkYdMMOpJWGGo4eFWcmXrjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPZYu3waQQCEP0Ejhm0hLMakm3XmSwbp1aUxeJy7IO8=;
 b=KDreYP5A7fjdy1vtuu1pge7yxHkGukHnmf1vN2e25c8hFBiNURoSduLinUgSImXzw33CvXPQWIOaeHQ9YAJDutnMNnYKmoHphjTRJud6+GBrpOVjj6mSp5jA43IsToKtzjv3wOlkonwZ32RlzsMNIXzx8Zh7X8xnNz9H8ytSb4U7/mALO8EAJPEkbRS7sxwiadsS6ZdXSMzj9w583WK+90XIS6+mDwflfo4VzShkXNDwwdNrkbbQZXweHR3phxX3tNJBa9ZqLMmGiri2QlsQ3aYDYRzTah5hcUlOVDJ8hcF6cnZpain8KQeIq+C6tsWLcfpgmBYSLVBZ1LbV1BD70Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by MW4PR11MB7102.namprd11.prod.outlook.com (2603:10b6:303:22b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Fri, 24 Mar
 2023 12:31:23 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5%4]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 12:31:23 +0000
Message-ID: <aa30595d-5672-1462-5faf-c02287801669@intel.com>
Date: Fri, 24 Mar 2023 20:31:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 1/2] target/riscv: separate priv from mmu_idx
Content-Language: en-US
From: "Wu, Fei" <fei2.wu@intel.com>
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-riscv@nongnu.org>, 
 <qemu-devel@nongnu.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Christoph Muellner
 <christoph.muellner@vrull.eu>
References: <20230323024412.324085-1-fei2.wu@intel.com>
 <20230323024412.324085-2-fei2.wu@intel.com>
 <06d24ab8-bfca-6ade-4510-0bc961c97789@linaro.org>
 <e51ab3a9-4794-038d-7de1-8977d7f93b8a@intel.com>
In-Reply-To: <e51ab3a9-4794-038d-7de1-8977d7f93b8a@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0131.apcprd02.prod.outlook.com
 (2603:1096:4:188::6) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|MW4PR11MB7102:EE_
X-MS-Office365-Filtering-Correlation-Id: 37ad9617-6f00-4a0f-42ef-08db2c63ad8a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6LwRJfQ9GELBPVmcId1qrJLwyZCRvMrWTw2s56j+CRjas61UgOd3s53yFgLgLMHP+x7zvROMQk5jCS1RcmiJnxydNOg2I4z+mGvUfwCVj4Bq9WnwaOa6rPMLEdnmhdnwcWkM61Vh+c4DRwXfF6/YlrXIYxQTv9jD17CN0/KRI7bREDX/EhmNhbL1g+4/L7xth/q97hZYbn0JJpKSOR7/JTylJfWDZMq8IQweswwlizTosf62M8VZtyoi4A8+XrFg03CGhITxdviA9AOpRszsX7tsdtGPslU6gwmxiFhgeLanCjwpiCwRrt9/N7YLN0zGFiB1F9ulqvxRF8EGIekyGQK21UouP/9L0972FVpIl4B6UUUllW3OscrfAQMcvFO9l8IYXFCysC5TY/PVfqtnFCWZPHhDcy2YOpcxnXJ2ZVorLQ7VW3kEzh1MJ52SXXF0/FEWD84Hzc7UApjCqgvltK3xdcTcC4Q0W2vfgWOuOuF5lRXqHB3HVHZkbqbDq2ULRaWGh4U+rCe85FZ6ZFj1ukv4y6ZGs1ox0KGEH65DYhxOqRmOKCFazealISkdX8zxL9LfkJx2cG5usgg4djJre0+r52/S2PAJYFl7SAQY7k/ypT+N51VTrLGVW34pmKtEdHkxpQL+FavoTx7A27Jy6puHDx+lXux7wIvSTCZ8GRRLVIW1tTkfbUi+IZjtFEO8+CSsXmvjZ9Wqcl364jl9+GSNwe1lMs44HAlVZdocgnw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(366004)(136003)(396003)(39860400002)(451199018)(31686004)(38100700002)(2906002)(478600001)(83380400001)(6486002)(31696002)(186003)(2616005)(36756003)(86362001)(53546011)(66946007)(316002)(54906003)(4326008)(8676002)(66556008)(66476007)(6512007)(6666004)(26005)(6506007)(8936002)(7416002)(82960400001)(41300700001)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3E4RzVoTUVsQkxhWmM2ZHhPUkwzeXc5ZnhLUW9MRHRtYStOelUxN1REMWEx?=
 =?utf-8?B?bFBaOTdKUVhoQ2RESGk2ZG5CTUZxL3lYU2pocDdtclpsTjFiOUcreXRwQTRp?=
 =?utf-8?B?TWt3empycGVzc3pYNk90VTJhSThIblhpSjlIWm9LNHJ1eER3ZmhyY0lMRmk0?=
 =?utf-8?B?d3VtUGdLMmRRMERqNGlhekV1eE92NzJVVmg3MGIvWXVtUW8wZkdCSXZYZDNi?=
 =?utf-8?B?VnFqMXRTMkJ3ZnYwQkVidlNzb1drV040R1NwYU54OXcxNXh6MFFSOHFJbmh2?=
 =?utf-8?B?TGwrL1RhcFhYYXdLOGtETTlSWk4wek9qd1FLVUJOdTBBUU9qUHpEYy8rcEJJ?=
 =?utf-8?B?Ky9UdW9nNE94SlIrWmRlc2gxZXhUdnRzelROTTU2UzNKSm5DSWJCdUdIWE9U?=
 =?utf-8?B?VHNBUFU1dUhIeElKaDNzVmdJSmZWTUFtTnhSQm5KTmNKdC9TY1ZWVnlXZE5N?=
 =?utf-8?B?Z2NyWkF2R0ZIVTBjd0FtbFJ6RkJIR3V5ZGk4MjVZeHRySWRnaVIxbkprNFRl?=
 =?utf-8?B?YjBBMFlZY2pFQ2Z4d0Z1YmY5LzFrZEgxdkJNYStyQ0JpR3p1LzBRN3N2dGZO?=
 =?utf-8?B?eFQ1K2RjR2ovMzJEOHNNQ2ZFbDVlQy9uWnNjbkM5clV0NGVZYWpvdHVSYUpu?=
 =?utf-8?B?NGpiVzhJWWlIVGtZelIwVGpkY2Q1VlZKSkt1R2VMbzdORlZuSXRkNnhaaDVq?=
 =?utf-8?B?MFYva0N0cUhMZS9EeEMrU2dCaCtFa2lEZkFmMDlpQWQ5VXBOZi91YjMyU09L?=
 =?utf-8?B?emN2TzdCUkp0aEN5T1JSNUhmK1ZWTVorMUplS3M2ZXJrdnJaNmRFZFEzbnQy?=
 =?utf-8?B?emk3SVNvTU95OWZjL04yNlNtNWpSRWFveU5rSmpHYnhlWjFMVTBMRkVCSDhx?=
 =?utf-8?B?czI0SzFwRnRrOE9kZnE1b2UrTlRpRllValFJV1doSHJ0Tzl2ajFZRXZtR2Zk?=
 =?utf-8?B?VWJuWmxIT3lJTFNJOWtIKzJZcDhXMUNabmlQYmhXZHQ5Und2WWZMbW92NE1V?=
 =?utf-8?B?eUtDUkNJZ2NjNXNwQ3BnNFlmTjlwMmJzMjFYaEtjUWNwNVBlT2pDUTRsQmFo?=
 =?utf-8?B?THdPRTBKUU9yWFpINzM5U3R0Y2FQYXgrL3JQV2p2Wjd4MFVpWHVCZFJ0WXFD?=
 =?utf-8?B?K2dMRUREVURobUtibkRtVTRJeHlNM1krcit3ZmxkWktRQTY3K0pvc01haDhN?=
 =?utf-8?B?NFFORGNhcCtyd2xFZ2tsaXZ6L01jblpja2t2bGtqTmFOMHhBWmFJZDdMMUNL?=
 =?utf-8?B?Z3A4SEV4RWxaZmdDOVl1OENOdWM5MWlGbEhqSFpJMThLZmVtbjBPSGo3UFpv?=
 =?utf-8?B?a1o4aGp2bXYwRFBBZXdJK0l5ZGJRK2RLR1M2dnBoUUNIWm14Tyt4MHBEdUlz?=
 =?utf-8?B?cFFZOXE1OFVBbE9td1dPM0dkRGR6ZzM2MVpIR2JPME9oSDdKTVNPZEtmaWQ0?=
 =?utf-8?B?ZzRkby9hMVpNQTg4OHp0RXlSbkFMZ0RZeVNTWml2UWlJVXJPa01IVFQweEk5?=
 =?utf-8?B?WlhIR1pHTS9TOHdLTnlUMmFuMitMTFZsUDhHbGN1aDlnR1RYVXh0Mi9CMlJZ?=
 =?utf-8?B?L0t0bXRLbzRXbTNRejlIcnAzKzZyUzViSkNuVFR5bkx3emFhTGdJOFFoVmRC?=
 =?utf-8?B?TEhLN3gvSmxrOU9hR2d6WjUxUDFtKzVJSjB3SmRHeWN0TWxuMkVBWDdENjRY?=
 =?utf-8?B?dXFHUWxRaktEMkR6MEtKU0t1czYxak10MXRtYkRHeHBWeWhua1JXeG9zbzZN?=
 =?utf-8?B?WXJsK2l2di9QNU1vZlovZVlSQ0tlRnhqWGxlQzJORWJFTkJsU3V3aWd2cTVw?=
 =?utf-8?B?SUx2UHBDNysxaTZFY1pzSUI2VTJlZnRLOStGZHQya1RXeWNuRTVzbGVzRFJI?=
 =?utf-8?B?c29WR1NQNXp5TkpEUmNVRkxxSDZIeTdoNGRPWXpZSUpsUHErWWd3a2MzVjBw?=
 =?utf-8?B?Zm01T25VL203RmVNc2RTNXp2enhlRHRXRFdLemFMbFgycFVoREFqTm9VUEEx?=
 =?utf-8?B?enlEWFdVOUk1NWRpcVhpQm94RFhDeGpUYjhSUjVISHdPZ2dSQ1l6a1FqbGMv?=
 =?utf-8?B?U2Y5aHNESVpNb0tyZHU4NWJPMXpUNUdvMlhRandaWmV5bWEzUDZ4R3NkMWtv?=
 =?utf-8?Q?d137bCK0yjO69Yc8B0UXVvlHB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ad9617-6f00-4a0f-42ef-08db2c63ad8a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 12:31:23.1398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bHKnO5tqksV/q1HS2qdRW/smcJRZ/zZw/dAsYw1zyuIBn77/FoyG2SjxhRL+fcy/VA3xgYY3T9HaAe3YNOY5xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7102
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.115; envelope-from=fei2.wu@intel.com;
 helo=mga14.intel.com
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
X-List-Received-Date: Fri, 24 Mar 2023 13:22:13 -0000

On 3/24/2023 9:02 AM, Wu, Fei wrote:
> On 3/23/2023 11:53 PM, Richard Henderson wrote:
>> On 3/22/23 19:44, Fei Wu wrote:
>>> Currently it's assumed the 2 low bits of mmu_idx map to privilege mode,
>>> this assumption won't last as we are about to add more mmu_idx.
>>>
>>> Signed-off-by: Fei Wu <fei2.wu@intel.com>
>>> ---
>>>   target/riscv/cpu.h                             | 1 -
>>>   target/riscv/cpu_helper.c                      | 2 +-
>>>   target/riscv/insn_trans/trans_privileged.c.inc | 2 +-
>>>   target/riscv/insn_trans/trans_xthead.c.inc     | 7 +------
>>>   target/riscv/translate.c                       | 3 +++
>>>   5 files changed, 6 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>> index 638e47c75a..66f7e3d1ba 100644
>>> --- a/target/riscv/cpu.h
>>> +++ b/target/riscv/cpu.h
>>> @@ -623,7 +623,6 @@ G_NORETURN void
>>> riscv_raise_exception(CPURISCVState *env,
>>>   target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
>>>   void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>>>   -#define TB_FLAGS_PRIV_MMU_MASK                3
>>>   #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
>>>   #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
>>>   #define TB_FLAGS_MSTATUS_VS MSTATUS_VS
>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>> index f88c503cf4..76e1b0100e 100644
>>> --- a/target/riscv/cpu_helper.c
>>> +++ b/target/riscv/cpu_helper.c
>>> @@ -762,7 +762,7 @@ static int get_physical_address(CPURISCVState
>>> *env, hwaddr *physical,
>>>        * (riscv_cpu_do_interrupt) is correct */
>>>       MemTxResult res;
>>>       MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
>>> -    int mode = mmu_idx & TB_FLAGS_PRIV_MMU_MASK;
>>> +    int mode = env->priv;
>>
>> This is incorrect.  You must map back from mmu_idx to priv.
>> Recall the semantics of MPRV.
>>
> The following code (~20 lines below) takes MPRV into consideration:
> 
>     if (riscv_cpu_two_stage_lookup(mmu_idx)) {
>         mode = get_field(env->hstatus, HSTATUS_SPVP);
>     } else if (mode == PRV_M && access_type != MMU_INST_FETCH) {
>         if (get_field(env->mstatus, MSTATUS_MPRV)) {
>             mode = get_field(env->mstatus, MSTATUS_MPP);
>         }
>     }
> 
> I think it's the same logic as the original one.
> 
this logic is good? I'm not going to map it back if it's okay.

>>> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc
>>> b/target/riscv/insn_trans/trans_xthead.c.inc
>>> index df504c3f2c..adfb53cb4c 100644
>>> --- a/target/riscv/insn_trans/trans_xthead.c.inc
>>> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
>>> @@ -265,12 +265,7 @@ static bool trans_th_tst(DisasContext *ctx,
>>> arg_th_tst *a)
>>>     static inline int priv_level(DisasContext *ctx)
>>>   {
>>> -#ifdef CONFIG_USER_ONLY
>>> -    return PRV_U;
>>> -#else
>>> -     /* Priv level is part of mem_idx. */
>>> -    return ctx->mem_idx & TB_FLAGS_PRIV_MMU_MASK;
>>> -#endif
>>> +    return ctx->priv;
>>>   }
>>
>> I guess we aren't expecting optimization to remove dead system code?
>> That would be the only reason to keep the ifdef.
>>
>> This function should be hoisted to translate.c, or simply replaced by
>> the field access.
>>
> I only want to replace mem_idx to priv here, Zhiwei might decide how to
> adjust the code further.
> 
I will fix this.

> Thanks,
> Fei.
> 
>>> @@ -1162,8 +1163,10 @@ static void
>>> riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>>>       } else {
>>>           ctx->virt_enabled = false;
>>>       }
>>> +    ctx->priv = env->priv;
>>
>> Incorrect, as Zhiwei pointed out.
>> I gave you the changes required to TB_FLAGS...
>>
>>
Could you take a look at v5 patches? I added an extra PRIV into TB_FLAGS
instead of the SUM flag, waste a bit in TB_FLAGS for a little clarity. I
will switch it to PRIV + SUM if it's preferred.

And if there is anything else I need to fix please let me do, I will fix
it all in v6.

Thanks,
Fei.

>> r~
> 


