Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfW9P-0003Lc-EJ
	for mharc-qemu-riscv@gnu.org; Thu, 23 Mar 2023 21:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfW9O-0003L8-F5; Thu, 23 Mar 2023 21:23:26 -0400
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfW9B-0006kJ-Gf; Thu, 23 Mar 2023 21:23:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679620993; x=1711156993;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tMfTY7b9KD+v0gQ4kI2DZXl+FImbtNc4kwNZR4X+kLQ=;
 b=ejL2hGOhEkdx5GrtFF95yU11MP1E6dHf7/nC6+NnKqTGImH1wBEhyVRW
 gEfLPV9kvU0Z0nX0rvONXbAe6KNPM+CgqW6ugyNLpyNYsJBWbekKdsoBq
 lwqKOp/devU7+wa+ud6KOMZ7rlOtrGB2m4HYzFC5mtrbwePbBx2CG8NT+
 wpHyXm8CQEFAkYyv8vm0iVapdYiOLVOYPu7PsD+xF2j4mJdypAtzOko/B
 dFZUp8x0tEfp7s9bXITBA0XrizdrhoXFD8Nqd4GgsTOXKwvh1kgZyMIeO
 7SuvmsvQkvclwH+HthfRyXyQSIPO+S+Qe8DDP1AVtCd12oFygvVnAd1i4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="339699483"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="339699483"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 18:23:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="771678523"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="771678523"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Mar 2023 18:23:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 18:23:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 18:23:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 18:23:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VIk8iQqi6u3SkZQ/ad/7YqT73FCtNKffDYGfWMmcn/m21eNqnollvKkjRnIMKbsBmytsNwtz06Fq6lpXiVpXodho9zEeiiJu13tmGdLdK+0kkGyIcHTFjSo17mfB+0Qo4MaBKOTYoSUNDGQ+V5YcjXJdfsYmEIZloWcHoXcJeIXZcHqwGEGSh4m9BLMKA4luYujOz1d2ZDlaOc/PKAKfu4AxzzHpZs7M33e54VeX8WeuEb/qk4OU2nQL5sXyEp5FJNg2NYu8uW/8JaLZuL3BJtcxnwtTBusALKRCaIzwgpjlupqX7PQaAm+VMZsUrTnoGnwvk5jEjWaW5G1h3jzTnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PI2nMwZhz0eZhQ3x4TnFZVLpESrKctFqiSOHxI8+uM0=;
 b=FBHtpWfvJx/ST2nu3pZIJFA2MY1XbtQe2DpXYYfJ67J3ilAUoPXlfuuJdBmX1umOo+/9kFSo/WlL6z75Uso+Uxjixg5N7FAeUkwlTzyY/ak34mzQ/sF9H/c9zujwKCu4GqmGEUCSrkURPf4NqtNgrt2gpdVK/wwEmcvwjoBqYKgh2+k2mdGJlUMFt4gMKm1l91nd/JptigGG7RZIibtw6w8RwEVgvs5zeSTnNB+nZGYaFIkH3CS03zMgH8VUfOsnjqHdogdjDL9kWM7VVi0XmXXG0nXnzlTqJHwvC4c8ikv2FtYlpaJ+wAXl9Wk1/YuP+RrTTIeJOMyZ8TBDCMrl+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by PH7PR11MB6769.namprd11.prod.outlook.com (2603:10b6:510:1af::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 01:22:58 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5%4]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 01:22:58 +0000
Message-ID: <ef1357c1-d324-65ef-240a-d98b5aa3b873@intel.com>
Date: Fri, 24 Mar 2023 09:22:49 +0800
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
X-ClientProxiedBy: SG2P153CA0037.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::6)
 To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|PH7PR11MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: da24cf8a-ce98-4be9-4464-08db2c064d39
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C9TEh268tDHdBx1qmoG/gSHI+VF1+js9T88YgkrMIOrrJPuSz75j1mYSMl8xRlLvbOHeSUMOU6jkddtp9SzuIKd2aa5Bbp9FD3hFdLYGIDJA5KP3x2MK+2qYTiqEA6yiU09NGX6JIHMLx3MZUi3WWuaPyRUHFXIj+fJTMKsABcCqOfcHGnW2oRetSxQmzca8b9YB4YWm1lDW0Dv8kHK7hI/zL3WemR7PaxiaoGDdBiRzfZI8GwqsJzv6pJzmgtZ8yqGUcr7U2Zbp+JyK3icyZ6bZSbixBIy3lOjNcDEslGVl5JTU02pak6pmEy11xvlVSX1bVzN8pXF8Pm9NEU7sQnCUPoJLhPuzlsXf74+HaHNNxuXRVTuoY/noNDMkj1Y1+xzv5d5+xEnl/Mtiz2AKfJUFiSbTlhwvfLVM4sZE92b14fPzioH9J9TYXDaooODYhdFX5EgIvLLC0x4X8BWEiBVZh8NYCucf5uaAjy6x/emHRcv3U32jKRe4GW/yH4XnMEl1rIiUtqkK6aQItXLzmSRg8FzsDaUueFrghGItLKqlIFy+ONn+1atyOcKRFYASzW+isHnWNzIMl7she4ALxvHy4HCKIKi2JC/S4L0yiOER78o83NW1eS29OnXFPiYuuW/Q/FpJX2yvNqlSlSsWBjbmmSoLGYK7fspFjKREenRolqmS6eeiw42uYs1NJRJeSGzMTcmqDwdkYzGIhUjyUtTeZJakiOwYBTfSsBwUOUM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(39860400002)(346002)(376002)(366004)(451199018)(31686004)(41300700001)(66556008)(7416002)(5660300002)(4326008)(66476007)(2906002)(8676002)(86362001)(36756003)(82960400001)(31696002)(38100700002)(26005)(6486002)(6666004)(478600001)(316002)(8936002)(83380400001)(54906003)(66946007)(6506007)(6512007)(2616005)(186003)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGdiVEg5UHk2WjQxZEJGRnpWVDlsM2haY3F3QXdBZkhhSlZOTWtkTHNCdjBz?=
 =?utf-8?B?U3NueVloS3htUGZ0TjBqK2d3WVVndnE4VjRyOHhlMjVpZ2IwT244elBwSDk3?=
 =?utf-8?B?K2JKeUEyU2Z5aGJCWlNTNkpCZW5yZWZSMUUyR2orS2FJSVpmUFpFZEZsVXZ1?=
 =?utf-8?B?ZXU3RlE4V2lZdG1ZTWZkR3dzbDc2c3h6dWJkOHpGZWdxTnhJZmFHMFZTZXFp?=
 =?utf-8?B?bkVyNmZGb0hkTituYjdoR0REWVp0clhVTUFKSkY1YlpaUzlVUGd4VmdwbHlz?=
 =?utf-8?B?RThtUUlqTTh1WTd6eFhIS3EyVTE1MzNoVEVmdEZVNGZ2azdIaDRXam1XR3FV?=
 =?utf-8?B?RFpsK3NHMmpGazluVlB0N3kvQTQyc1JTenpZQk1qMEhrdnRZdmFTUnZMb3dh?=
 =?utf-8?B?KzdrRzZoRkVWK2xOS3BFZUpYeEw3OEd2VFF2dnA5UXJqcXlRQlRLVE4xZnY3?=
 =?utf-8?B?Z0pZVysxck85WDU1UkFnUkpXajlaenhzZUVOdkdMa2JUVDkxdWJ4ckZ1VXU3?=
 =?utf-8?B?bjYwbGdVTmJKYVYwQ0M0SklLQU9pVHZ2blJGVURHNW1ManZQNHI0MVNiTVBS?=
 =?utf-8?B?d25QbktMZ1ZZZFNidnZQRFdlZTA0WWRmZEEwYld3dHUwOTcxR2d1a2lwRCs0?=
 =?utf-8?B?UithY0NUWGw0YUthNFAwdU1nRTlNdXFGZmEvY2NrcGxOVkFwVS82QnBnVUFE?=
 =?utf-8?B?bXYwUFpGR1NoMUhXc2lnTkR4enZSS1hDL3JoK2J0YlVKV2toN3NIcmxqWEhV?=
 =?utf-8?B?WGFZTGJaWFpvZFdlaE5qaHpxSEVaVnZ2M24reWVrQVBsOXJCTG1BRm1kZ2t6?=
 =?utf-8?B?enI0NnUzUG9Pc1l0ZzdTZ29XT0UvUVo2UGM5V3Y1LzNNdERWZkZ6azJGRG9F?=
 =?utf-8?B?cWVwcVlodERBL0FtNHJReUhhU2ZRa1loRGk0b01Ec0NvM1JMd2xRVWk1R3hI?=
 =?utf-8?B?MW1ncHpEUTRPOEZ2b0NsaDM5Szc1TVRoaWtHL2VaWHZwUU5qelBpSVZpKzZR?=
 =?utf-8?B?Nm4xdzIwYnZORVp4Zld0dVRkVEFndVBsS2xoUjN2UWNsaUo3ZG5wTCtnR2Z2?=
 =?utf-8?B?WlM1bVdzVUVaL3RwdFdPekwyY3pDdTB5ODZpaVRpSDAzbjVXNlJNS1hpeDBq?=
 =?utf-8?B?U1RLNUNYYk93QUo2NXpseDdVREVYYnVvRDF0LzJ4bXZIYytsbERzYklMWHM2?=
 =?utf-8?B?TzZaWlh6bzBROVZrTGhMdVVXYU5sTktldGxBVmR6NlJpZGpVMWdDSlNEMVc3?=
 =?utf-8?B?WUpBaTZ4dG9rOWJIc3JpVnArU2VUbXhhWlM0SGpKUXZmZ0s3MHlVamtycklm?=
 =?utf-8?B?TVRhRlhpc0tTTG0ydENIdVVYb3ZXaUZ3U1VMaC9URytzTGp4NjNqNCtHeW5X?=
 =?utf-8?B?bEI2VE1uVlVKK2hQeWIzQSt3TkRZZGtlZU5hM251Snp2QmVidHVNb3M1QWk5?=
 =?utf-8?B?eml6Q29FeStjTTk3MWVKa2QvQTVkL2l0dzBBOERuYmJSQnZ6S21mOFZFUFpQ?=
 =?utf-8?B?TDNMRTFNYXZNRWZXM0lHWE8xejR0L0krVm9jUDVOcXVlMXZxa2gybUdGa0pT?=
 =?utf-8?B?M0dGRkJubjVuMW5FbjVVTkE3dkE3QzRPUkEwQStSOFdodnpESlVVaUxyMVI2?=
 =?utf-8?B?cnVJYVY1T1B2YnlTSkxRYVZIV25hTzVackFOdGdhc0h6Z1JNYkxtUTJieVJm?=
 =?utf-8?B?aXlZVGhWd2l1WmVoYVR0ME5VbmVvZ01PNzFRNG16ZEltdDVQYXh3UlV0ak9H?=
 =?utf-8?B?ZlViQmZFNVJuci9UZkp1ZnA2NDk1bHRFVnd2NjkxM29Ka2luV216ZEY2SnBO?=
 =?utf-8?B?eTExcS9BWHVnNjlRbjNwc2dIa1k2TXpKQkFPSHBpdHBBZkdZUzZVeHA5M2kw?=
 =?utf-8?B?cnQ5RnFuanRXNEhZOWd5ZjdNY3E1ckQ0M2FraTZvcWdEaC9xbTduZGtMUlZ1?=
 =?utf-8?B?akl5VTczaDVmdWdoQU9DeVhBcUZDcXhLQXZ2ZXZ2bDdQNW5NODM5dGtSbzNi?=
 =?utf-8?B?RHZOOCs5VjZPazBZS25EZzJKekJFSkttN05MRkF3UnIvK0ppTVlLZDJ2Z011?=
 =?utf-8?B?QmRndjFDZ1lGR2dMWUJ4QmNod3RkZlh6UEE2eGh3RGpuSTU1Z3lWUFg2d2di?=
 =?utf-8?Q?3/7h9dnFLrG3Nb4u7UgLc8CC5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da24cf8a-ce98-4be9-4464-08db2c064d39
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 01:22:58.3519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YkgK4wT7BpNPHgjMYiaKEUFSEoWGcyN0PGwm9bBgIo9RLQQG3/RZCexgy6zV7S6xDCFS7HqOFqk1krvOIP5W2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6769
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
X-List-Received-Date: Fri, 24 Mar 2023 01:23:26 -0000

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
I'm not sure if this is good English, sorry for that if it's not. I mean
I want to keep this patch small.

Thanks,
Fei.

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
>> r~
> 


