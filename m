Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfDzw-000432-Hz
	for mharc-qemu-riscv@gnu.org; Thu, 23 Mar 2023 02:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfDzv-00041l-2n; Thu, 23 Mar 2023 02:00:27 -0400
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfDzq-00013M-KM; Thu, 23 Mar 2023 02:00:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679551222; x=1711087222;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BHCm+rcUVvnhaEaLHde60s3WmKYIAHaJaoADI//qNm8=;
 b=XpZy9Cfwl0I6/07qTJQqoIoLw2qxjU3EChhszuMbSBseDnlo/5Gjj3Xc
 zVRvqPQltCdPwitWFtJFxJvZo4Bhdx3E8XbWAIY0TNd5NT5HCJA2tqbRg
 5FN6TWEW5+ZUmKVDCNmI4CI87t95cpg4Egr69SM2oCGTDPwYq+tYfuPoL
 AtIU23ECYB00QCwhF73b73ZkepcRql01FPu3hrvN4ypHjcSkCEn9EH313
 S/rUZZWm0R+TTwcXkLnwRda+/jMOdpBLpJgmf544jV131sUlN8X5jz/9S
 y+7Bmr3l0IBpg2UgempyBzZE1ynZkVAN1gQTk2Ea4nQ7VbrNfRQCwU/DK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="339439196"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="339439196"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 23:00:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="792875883"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="792875883"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 22 Mar 2023 23:00:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 23:00:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 23:00:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 23:00:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYJf8AitTZuP8i9iW7QedzTDJIjAr+bn1Vdw98XZG1EKNt1wg06bb0SNhaIP6Md7XkhkcOR6DqkaglqMrh8n9nw2O/0h/1ds66BdLv3PAF0KucPQ0g0yqSs+WsatxClg7lmdUWG5QLAMr96VKDkWdYGEwilKgeFpmBcWn/8CuSIXOJJXU3yXv51/n+z2iK4vVWQlCE3nbrXIt1wNJi1sHCf1T/YqncZ02dmV2bi8NzKnUOWmvS+HRFhk2U6n5snqw8pW1ATsao+72N1ZzQBXCzt37jz1qwTdkDM2nD+UjMjEuZEi+/o4PZ12Fui0v8+HCp/2UtGptxrH45NDHkQRtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmEuLZPD41wFYQ0iK9CsoSDXWhxUPJtVt95dZtV0y08=;
 b=J8c/KQLgviWg+halKEcUvVkOELQDDXSNzLkHOOIBNlkO5FKejj3ny7eBFDwkUcV5yZzbVYhMy/dcrGIfzCfHbzpI2ei+E3vSldkYiWvShI+/MA91nQ0Y/qZHo7FY+tKPbOukrCJkDjNB2LTL1hK6hKaIfS/kMDmuVSCuchvrhe3n4mKIBRTk4WeiXrJt3HBQgsjL1B9n0tMOyaVOJI0Ovz+u4JWagPqZ/aUS6RdCwOFSOp2HGMxWjWZ4SvipEeVou/KJODTHA9LrG3qHiGayoct5kIFeQqkzjIQzcqWim8T15mK3l4U9OYDaamPtQB0OpwOJog4wDjxZA4cYAeq2sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by CH3PR11MB8096.namprd11.prod.outlook.com (2603:10b6:610:155::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 06:00:15 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5%4]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 06:00:15 +0000
Message-ID: <7db6d615-5ddc-5e1b-1d3c-a85c22e6af74@intel.com>
Date: Thu, 23 Mar 2023 14:00:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 1/2] target/riscv: separate priv from mmu_idx
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, <qemu-riscv@nongnu.org>,
 <qemu-devel@nongnu.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
References: <20230323024412.324085-1-fei2.wu@intel.com>
 <20230323024412.324085-2-fei2.wu@intel.com>
 <9423db2e-257f-016d-b404-17d8e5adc0ac@linux.alibaba.com>
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <9423db2e-257f-016d-b404-17d8e5adc0ac@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0218.apcprd06.prod.outlook.com
 (2603:1096:4:68::26) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|CH3PR11MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: bbba6298-f5d8-46df-a1b5-08db2b63def4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GfjnIF9yOjTbyDSazF5i2iDKTdyDLqGiCfgubfOFFNswQaY58LdbdDEAbcmBvqM2iocexVmY4hboGbhMExMUOyseO0L6rfvMPQafLyoz+dGO4wNgqzHhneq2J8ZYquQRxdwZ5h7zqYUO1Cg37QU3cWOAsjyN8gsSvQINLSeBkzkg3AebZrOrYZIxi90V6Buqdc9ytXwdiNG/dsOOS/YXn2SYlWVt7fM2tAK8GH/CEkLYE1UWa+vKBfU/64AYBCuMnFzjZZlpTWRaa+6eLqGna05j/+pz2r+tvnoZ17V1G/iUF6aqP8zyO6x9PH/bqUkKkjbIl2Zxj0SVxgbl7QKJ0pcjSCCuLTowE44oG4QE8VVqJmIDGwfbq5ok4dgnCojiWvPlp3BO65cMqSZkVaqeL0mKEZ61QK7BvDM06BU3RB+9pYnFIUUkHKXMFCD5C1JuvI3k3/1cfyOscSKwSXXSA82ukdKH08KcETRet1iw7KmOPe3pmoInsuWfVIaBx/veXtjx5pLcrv20YonfeD27kBdLJU0o5dLkAsnxkQtJH39JS/8GE1w8W5nUZdFw7VheZ8rX2kdnuzvmABm1ABqcjW+dqM0kIyjP3cGpHchWfyp31PuSGQjEir/9+OpIOb+S5afwtKPZ3DjFuXLQAsZuOtrxlNg9PACvGzvFHoD4uaMJHC6ux5vLn8SpfIQdShDchgloJkjPiXDSS67J1CJb1/cGH0mec190weXYU5CfQn0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199018)(66556008)(8676002)(66476007)(4326008)(66946007)(41300700001)(8936002)(82960400001)(31686004)(2616005)(54906003)(38100700002)(2906002)(966005)(86362001)(478600001)(5660300002)(6486002)(31696002)(83380400001)(6666004)(36756003)(26005)(6506007)(53546011)(6512007)(316002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGVIak5nMzI4NDdSTXJwQjE4ZmoxNEY2b0ZYOGxHaW1ERTZXSmRvRy9UREFS?=
 =?utf-8?B?bURyQnBocDNLaXhnMFpwWUtYdFJYQk8rUGxVNlk4OEJtZE9Uai81N1VJcFB3?=
 =?utf-8?B?N2ZLTnNZbTBWQ3FFWXVMZEs5ZHlCbnpBc1Z4b1UrMERoSGRtSEZDeU5MVDVF?=
 =?utf-8?B?N1ZHNHBWSWFRQjc0NTdzZ09OcE81RHhUSVc4dzFpRU1ibWtpdVJVUGptV3FX?=
 =?utf-8?B?eDU2SElSKzBYUmdzTVVFMGtkd1RJc0xNTlgybFFjMHU5VlBjMDlqU0dMbjFR?=
 =?utf-8?B?eXNxclluaDVWWUhtRlBuQzByei9zeWRzb1l1MXc4azBSM2FDVWJRUUhRdFBu?=
 =?utf-8?B?R1lTOG04djhVUDJyWDF5WkEraUE4YjQzUVpOS2kxV1pDcFk3M21xNzZBL2Ir?=
 =?utf-8?B?R0VuL1ZoYjM2U2ZNRm05UkJ5bzFWOFFVVmNyYWRIMi9MbXFaNGJ5d2JSc2sx?=
 =?utf-8?B?WXBIY2k5ZkJqdHZqazJicXk4M1VYNmxaS1RidEM0SHRyY2h5dEpnUGd3c3Zi?=
 =?utf-8?B?S096OHkveU00N1BNOERZQzA1dWk5T2R0aTJLS2xrOWNhMXlJNXU1TXl2N2Qz?=
 =?utf-8?B?anNVa0Y0US9tOTRXeXJKTmRCK0YxRGwrV0grOUhGMU45cHVJQmR3RGVIS3cw?=
 =?utf-8?B?c2R2a1hJSmQxb0tVYktkd3RnNWV3U2pDaFFHSWR1ZFgwbDFzRis1SWY1S0E5?=
 =?utf-8?B?M0d2MVM5YllRMUxQWHFoTlRnMStWUUFjNWlJVEt6K09nYi9wZnUzSHVncGs5?=
 =?utf-8?B?dWFSR2loMGJlMGpKV1BFMzVQcDJ5cUJMbVh3NkJyTmI2UEVOSkNROGYzWHFk?=
 =?utf-8?B?djRHdjh3eVZhRnZoUDY2Z2UzQ0Z6UndudHQyWlV3MEZhdjB4cmRGWG1xb1VQ?=
 =?utf-8?B?VS8xYkN2MVNSdUdITGZ3TGkwN24rRnc3NFF4MEpXT2J0RGxGd2NsejF0N3ZV?=
 =?utf-8?B?TU1KQ1E5dlRjMUljVUJxb0kzNmhKUXIweFdqUUpRT1NkN25ERGc2UjcwN0Fz?=
 =?utf-8?B?WHNGcDhCUERlZVFNOStsMkM0VlVud2xIUlRXRjhFVWhXRXVlU1JGZVA3c3Z6?=
 =?utf-8?B?MGFGWTF3NmZOS3ZyMDJsY0Fpby9RTXhRQWdjaDBlVGhHazdEOUU3SlQxSWRY?=
 =?utf-8?B?Uks5RnlJM1VicUhDNE02d2VGaW55SGNlVzRDRnJ3SkNkQ0hvR2p4aUZGeXBF?=
 =?utf-8?B?M2VvaEo2VTdQNkFMQi8veDI2Z2wzZnNkU3lXb1NzWElHYVIvbWZYeFJsV1Bw?=
 =?utf-8?B?UExxUzFnYTJzemtxUmVLYWVhRVZGYzlNRE1XWDQ2aGQ2T1J6eTNCbWhIMkxm?=
 =?utf-8?B?dFkzVXJ6WkNHVUorZ1QzVGkwYzY3Y1NVMGZnYktDMk1CSU9DdDF2T3VRTEMy?=
 =?utf-8?B?U3I3aTJQY1Z5empQdWhDU1pOSW5yWDlWSTZ3OFdSSUZGZTBmdVNiTW9KQnQy?=
 =?utf-8?B?VjBMK3JBMHVnbFJHcHNjZEd2ZUV3SlFlN3lUenM1VHdyQzRYNTdIQjdHOHcw?=
 =?utf-8?B?dFo5eVFBMk5FVzNJT090Z0E5aTNMelJpVnR2M3JvcEI4RHFpMjU4c2M1bEpM?=
 =?utf-8?B?MzdOdVpnUGREOGJCdVVXSS9VV2ZtMVZJVEJZRWNITktHb0ZBNmE5OUtSODU4?=
 =?utf-8?B?MXZqSGY4MDBFZkNZclNOQ2F5MjdkZy96UldhQzgrQzFoWmlvcVVQVUhNNlpW?=
 =?utf-8?B?YjRKSlowSUNqdkszWWVRd3lwMU9XY0tYY0hTWHBOS0VMZTlEQUhGL2VacG9I?=
 =?utf-8?B?RGVPOXJFcld6Y04wMjJFMzJZUlJnaEYrL0dDS3BiQmdRVlQ2MzZKOUJWOGE0?=
 =?utf-8?B?VUFSbmdiL25xS1BGQnoxOS9Zb1pKTWNIZU5vVEl3aWZLS3ZLUEJKRjM1MFhi?=
 =?utf-8?B?aGUrUWdwOVBjdzFuUmhNbWFHbHpFY2gvT1Z2Rjk4dWIxS3M0RkdBS0djNWty?=
 =?utf-8?B?SjFYem15K2ZCaXdFNGM1Z0RqRnhHV3lCeUYzS1I1Q0hRUVBjUEZBSENXcFJP?=
 =?utf-8?B?ZmVUN0IrQUZJZnJqbHIrRlFFVGo4VVdTRnJYT2hZNytlQ3pNYVl1ajNGcnRC?=
 =?utf-8?B?WjgralZ1eS9sN0N5cFplYndYTW5NSzM5aEtTUDFrUEVQa2llUVUySWN3a054?=
 =?utf-8?Q?KbDCmgxshcuu1ijJ2Op05NLhL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbba6298-f5d8-46df-a1b5-08db2b63def4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 06:00:14.8981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 17tPNmhADDV/ZE6iEURj5lSAjK+1aVkGNMQAmZJuKbsM0FovaZVKqB2sQQ3uVoOh4k7iTIWsInnvAQC40kVxiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8096
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
X-List-Received-Date: Thu, 23 Mar 2023 06:00:27 -0000

On 3/23/2023 1:37 PM, LIU Zhiwei wrote:
> 
> On 2023/3/23 10:44, Fei Wu wrote:
>> Currently it's assumed the 2 low bits of mmu_idx map to privilege mode,
>> this assumption won't last as we are about to add more mmu_idx.
> For patch set has more than 1 patch, usually add a cover letter.

This is cover letter:
   https://www.mail-archive.com/qemu-devel@nongnu.org/msg950849.html

I added scripts/get_maintainer.pl to .git/config, it couldn't find out
the maintainers for the cover letter, so I added the mail lists to "To"
manually.

>>
>> Signed-off-by: Fei Wu <fei2.wu@intel.com>
>> ---
>>   target/riscv/cpu.h                             | 1 -
>>   target/riscv/cpu_helper.c                      | 2 +-
>>   target/riscv/insn_trans/trans_privileged.c.inc | 2 +-
>>   target/riscv/insn_trans/trans_xthead.c.inc     | 7 +------
>>   target/riscv/translate.c                       | 3 +++
>>   5 files changed, 6 insertions(+), 9 deletions(-)
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 638e47c75a..66f7e3d1ba 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -623,7 +623,6 @@ G_NORETURN void
>> riscv_raise_exception(CPURISCVState *env,
>>   target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
>>   void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>>   -#define TB_FLAGS_PRIV_MMU_MASK                3
>>   #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
>>   #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
>>   #define TB_FLAGS_MSTATUS_VS MSTATUS_VS
>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> index f88c503cf4..76e1b0100e 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -762,7 +762,7 @@ static int get_physical_address(CPURISCVState
>> *env, hwaddr *physical,
>>        * (riscv_cpu_do_interrupt) is correct */
>>       MemTxResult res;
>>       MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
>> -    int mode = mmu_idx & TB_FLAGS_PRIV_MMU_MASK;
>> +    int mode = env->priv;
>>       bool use_background = false;
>>       hwaddr ppn;
>>       RISCVCPU *cpu = env_archcpu(env);
>> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc
>> b/target/riscv/insn_trans/trans_privileged.c.inc
>> index 59501b2780..9305b18299 100644
>> --- a/target/riscv/insn_trans/trans_privileged.c.inc
>> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
>> @@ -52,7 +52,7 @@ static bool trans_ebreak(DisasContext *ctx,
>> arg_ebreak *a)
>>        * that no exception will be raised when fetching them.
>>        */
>>   -    if (semihosting_enabled(ctx->mem_idx < PRV_S) &&
>> +    if (semihosting_enabled(ctx->priv < PRV_S) &&
>>           (pre_addr & TARGET_PAGE_MASK) == (post_addr &
>> TARGET_PAGE_MASK)) {
>>           pre    = opcode_at(&ctx->base, pre_addr);
>>           ebreak = opcode_at(&ctx->base, ebreak_addr);
>> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc
>> b/target/riscv/insn_trans/trans_xthead.c.inc
>> index df504c3f2c..adfb53cb4c 100644
>> --- a/target/riscv/insn_trans/trans_xthead.c.inc
>> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
>> @@ -265,12 +265,7 @@ static bool trans_th_tst(DisasContext *ctx,
>> arg_th_tst *a)
>>     static inline int priv_level(DisasContext *ctx)
>>   {
>> -#ifdef CONFIG_USER_ONLY
>> -    return PRV_U;
>> -#else
>> -     /* Priv level is part of mem_idx. */
>> -    return ctx->mem_idx & TB_FLAGS_PRIV_MMU_MASK;
>> -#endif
>> +    return ctx->priv;
>>   }
>>     /* Test if priv level is M, S, or U (cannot fail). */
>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>> index 0ee8ee147d..e8880f9423 100644
>> --- a/target/riscv/translate.c
>> +++ b/target/riscv/translate.c
>> @@ -69,6 +69,7 @@ typedef struct DisasContext {
>>       uint32_t mstatus_hs_fs;
>>       uint32_t mstatus_hs_vs;
>>       uint32_t mem_idx;
>> +    uint32_t priv;
>>       /* Remember the rounding mode encoded in the previous fp
>> instruction,
>>          which we have already installed into env->fp_status.  Or -1 for
>>          no previous fp instruction.  Note that we exit the TB when
>> writing
>> @@ -1162,8 +1163,10 @@ static void
>> riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>>       } else {
>>           ctx->virt_enabled = false;
>>       }
>> +    ctx->priv = env->priv;
> 
> This is not right. You should put env->priv into tb flags before you use
> it in translation.
> 
I see some other env usages in this function, when will env->priv and
tb_flags.priv mismatch (assume we have recorded priv in tb_flags)?

Thanks,
Fei.

> Zhiwei
> 
>>   #else
>>       ctx->virt_enabled = false;
>> +    ctx->priv = PRV_U;
>>   #endif
>>       ctx->misa_ext = env->misa_ext;
>>       ctx->frm = -1;  /* unknown rounding mode */


