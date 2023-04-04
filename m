Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjaOE-0002b6-Re
	for mharc-qemu-riscv@gnu.org; Tue, 04 Apr 2023 02:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pjaO8-0002ZM-0b; Tue, 04 Apr 2023 02:43:30 -0400
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pjaO2-0005cz-SX; Tue, 04 Apr 2023 02:43:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680590602; x=1712126602;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SWfXRL34/sdTL4pKhqDxgJqTT1i4cDXKd4GbQgob3II=;
 b=HWkap08xpDjzIgyufLltUZO8RhDRHDnykNX3oxDsSPtsA0e6ADw7TrCV
 AmHfbAiI+7nRwz77WqhO08kt3+RaoHNR5/DGuk9dez8QNM4Q/SLZF+eUU
 +9nwlEZmapqpBV80tNcHAcBwSGnRavDk8diaIBAb93D/FVjkAfccPhyU9
 +c9FkW3fOR/1Gihg5Eq7NxN4y3OF3l8ASNXb9UBTBa+hrkKIbpLNCC7+g
 U4wHYBagXn1xuzKexkYo9XH5ahHLEGGdUFdxPpdKE/AaIzahUhqfLH12u
 XzosxaCsuM04Mfqxdj7BQvFTlsJXINSY+oViRGRnVOpmW60d2keK2vvgR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="428389801"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="428389801"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 23:43:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="775520742"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="775520742"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Apr 2023 23:43:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 23:43:16 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 23:43:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 23:43:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 23:43:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HSZYH5261RVBjRHWz5Emsa7SvTIZaOEQzknqGapqzuroQHdzd+9ooLG1fX5ZLRoDZgdljdVq1rENPitCu6htxUuCpziRJxCqP4eiIVcaFaNtUHDIT2wJY2V6JFP1yWalg5UED+qkceOts4+6IhRYuRnlKsA75mhCANt7DyY243SotmeMCAFAIw+VPdyreKdQc2QpZUKwggdTIiLGAFsJ/uFKvnnZD+NtWT+iI301/jL5Zk3AoSlIdOCoj0jhDTYejm8vmMdIpSo6tbDPmMQCwMI0gdfdkktlkaHd3OYSZlTm7fH44EZRZ0qvN5MX7jazeE3R+InTBFNbc1sqobtvxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4zaQ328dIQhLcqkKoOQKHSheZ955VTOYxIK63aAiSA=;
 b=M5GznDc7x/lOgggDN3qWVSSQ8kw17sY7d1YtSQRdCTNDsDr0eb0NsI+QgQaBMPgn8GDevR7tghmzL/TR1yhrTcgneP5GRTFwRsZe0RUEhe8JOjLGSbr75LrVFSGI0WZMKOhJ/rKZMYr20K3lfY+poRpP86577ZgfKdSGtqqVJklya/eFGpv6VKYv4M06HfZ1T9MyhiP7A8MIF9eTrvoT4nLWQruwltTdXsKXySSQURhBJ0V/z/Mu9RS2v9cJdAbCyKG3Y8Depai+fY4H6nhfAxy7fRJzjxC7JgyIcHPlwWbT4wWcM4z2KYWV2j0osa0voI53l7DBODTf46DYBEbf0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 06:43:08 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::cf58:e1db:41d4:ee3f]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::cf58:e1db:41d4:ee3f%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 06:43:08 +0000
Message-ID: <66a60213-0783-c929-5bbc-e012de2a4183@intel.com>
Date: Tue, 4 Apr 2023 14:42:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v6 00/25] target/riscv: MSTATUS_SUM + cleanups
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
CC: <qemu-riscv@nongnu.org>, <alistair.francis@wdc.com>, <palmer@dabbelt.com>, 
 <zhiwei_liu@linux.alibaba.com>
References: <20230325105429.1142530-1-richard.henderson@linaro.org>
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <20230325105429.1142530-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0095.apcprd02.prod.outlook.com
 (2603:1096:4:90::35) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|PH8PR11MB6779:EE_
X-MS-Office365-Filtering-Correlation-Id: f371c341-8bd8-4958-1ef9-08db34d7d999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pmZ7rXDOQdn6lH/9zOgd7Km9813xOKMwSWTEEL0NmgvtMK7axhjbUUVorn4HsULSX5jcCzOJ+p7wp2J6cB4yevyAwhgtaPPf37Edj2MAVfacpIXPcSKTe9vN3v2L+onUec+JB6zTQLLs12rzE8hwRu3DNabNYgevjdCOENPxL3JWdSRvIjfBFBYA5XxGSqQRS4m5kOMzvu2rD8LoPdp/OB+TGY0p7vMW1f4XpebCjE51xZNFwmL+6/HLFNYofsq70QFb6h99lajEuwA4Jb4B3Oo/GqBlRXeEm9Oro9BvGXEt6+rFKWUiZBEohWg85a88oI8cwNlIli5oR+ii0jDP+kFKunzoe0+pcukp0J3RkvZWwAwBZS1wBiaQOiJGY4/8hmyBlyTM8o9JAWKSOcvq/VOQcQIZuGOPD8Zx1y6RslOPeZ9AVx+d/I+aoZILCABeEu0WiofJ/8KwvD3KyPO2TFJUHPu4F48ev64MCOI3g1I6rVWg3clMrerI9RwDxwNO40eQQkE/ejXAPmyLtCUT2D3P7jY/Maew5cnp4DRtMQWtV3Ap1xm7ktJ6kOubcp8RYLC6bTBmfOTOTQqp3t3nHf27vNu1LSqNY+19H96Pqj5sEC+kNU8qUv4GcAgPP9WLbvcy+Z67ByQtE47b/gsgtg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(396003)(376002)(39860400002)(136003)(451199021)(2906002)(31696002)(86362001)(36756003)(31686004)(2616005)(186003)(6486002)(53546011)(6666004)(83380400001)(6512007)(6506007)(26005)(66476007)(8676002)(66946007)(66556008)(41300700001)(5660300002)(82960400001)(38100700002)(478600001)(316002)(8936002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjIybm5LVVRvZVVBcU1RN3FEZW1oSWxMNDc5R01wNFlxdWFRb0dNT3B3Qmtt?=
 =?utf-8?B?OEtrMnNKSms0ZUY1eDNGQjdnc0JFODU5bEZCMmFNWnk5dzRBaElmeVdWb2th?=
 =?utf-8?B?aDVKMnVzQ0NiM1ltM1p6YUllQnQyalhVc2xWWHJHVnk3bVJBbTBJUDF1aVpl?=
 =?utf-8?B?OWlSaytybkJqSGhOeTZ2RTIzN1kwSW5nZHVEV0xZL201MGhwMUhNbXRCYnc2?=
 =?utf-8?B?a3c3NUI4bDA2dmJ2NnE0d2doNThiVkRFMGJxbzJXTFY4S0lCOHE1dUs5OVBF?=
 =?utf-8?B?eHF3TlJoa3htTmhWbVBKbjRkbk9DQlFEQ1Y4UFNtUXVNb2VPU3FqVklneU9K?=
 =?utf-8?B?YXNhRHhDY2ltUzRadExqQ1YxdTkzekVEcmJ4TngvQmJONWNydWRzTEIydkw1?=
 =?utf-8?B?UHB1aldXMWwzbzBKVGQ5SjJWRHMxQTdKVklnaFVkcE9RUWd5ZUI4WS9hblYy?=
 =?utf-8?B?N0lPTDcvNEZXZkgrUTJMK09oRnQ4YWhhMmxORWhuM2pTTUdrc1p6dGRUekJ6?=
 =?utf-8?B?eTYzTTNZUEpDdGErbFFoZHRQTElmN2kzaFpLdWxwNzVZL28xTXdNNkRONGV3?=
 =?utf-8?B?UDlzL0ZydXRHN3dzby9KLzNaaXlRSm1UdWc2cjJWRmc3S0xSbVNrMDd1V2Vp?=
 =?utf-8?B?eUdTYjdDa0FnNzRPRHViYjJ4bGNVQUJsU3JOYnc3cWUvYlg1V1ZLL3pDWnBj?=
 =?utf-8?B?T2F6VGd2aVNxZDVSUFlFYllWNm9Tb3dXR0twYWlUQ1Z6ZXQ4MmI2aDN5REVW?=
 =?utf-8?B?cnpoWDJKMldUV0NITnlaUmxsOThOdDhRbXdWQXhPSVhqaXRxeXJETllBMHFk?=
 =?utf-8?B?MkdpQ0JkeHNGSGlYVXlqMHRUMnFyMnYydFVwT29yZmR0K01ucVVMb005Qnkr?=
 =?utf-8?B?Z3U1eUFMalJzT2FiU2N4WVdKMElTK1UycGhOZUd0SkI1WTBFUDRzSWtNWlNV?=
 =?utf-8?B?VVZKSnNMVm0rUXNzUGZyTnkxVEZ1aVBreEhGcmRtSGpjQVhhaG5mMERuMnBG?=
 =?utf-8?B?aFF3Z0hjc2pDZTdDZXo1WnZpdGdWaGtvU2REUnZiU1NSQ3lrNFlyVFVXdW1P?=
 =?utf-8?B?bUlnNUNyV1NmOHJMcmtQeHZuenFVbTg0SVR5TDBiZGI0ZHova1NqREVMRkpr?=
 =?utf-8?B?MmpCV3h0T0d0S0V5MEFzRUZhamYzblN1aHlMQm5oaklsQitUYld3UWJjWnJl?=
 =?utf-8?B?RUlyblVZOEJSUUQ3bHhLZjlwZDY2ZGdMOGVwbmYvOGlOcjlYcHE1YzQvclVx?=
 =?utf-8?B?MjJXS1VpeTFoSXU1TXNWVXg4SHMxSU5OOWNtWm95YWpzR0RHYVlUY3NUU3pl?=
 =?utf-8?B?c3l6aU8yY01Kb21leFd0b0tHaGtWOVEzdm15QUU0c2I5dTMrU3ZZMUhEUm9L?=
 =?utf-8?B?NnZRQXdDbXV6N2l2RUFSclFEUmlEMVNma1dRZVpYRHpNeERtV3FROFZHNThG?=
 =?utf-8?B?MmZhcmwwQWhGd1JlYktQd0NhWW90MzF2ZVNKenoxUWJhM3l2Lzhmb0MrRE5m?=
 =?utf-8?B?cFFFVzFOWDZlUDVhcDlWUU9KaHZ3TmVPdE40eUw2ajExUVNtdU5tRFM4YlBr?=
 =?utf-8?B?TnIyangxd3h0SzVzaVNSbEk3ZVV0SzVXcUxZZHVKUWM1R0lMT3VPR2hxci9v?=
 =?utf-8?B?dGd4OEh2Zlp6TXRqbStZdUlyQkdEVmdCSE81by9ram90b2FqVzAyOEdNZWJy?=
 =?utf-8?B?dUFxd0paTnVFNlVzOFFwVVc4UWk1VTJSZ3ROaWUxdnVFZ0JxY2NrejQ4SEda?=
 =?utf-8?B?OEhPQ2cyQTJYYTZ1akU1RUJNTVByTEhOeWxJRWpyT3lEMVZEb0N5bUJNMUg5?=
 =?utf-8?B?K1BLbG9abmphVmdTRmZpdDEvYTBQV2plNEtSL1ZweG51TUIwYVRQdjhHZVhp?=
 =?utf-8?B?bDdMWHlPcTRTYkJQd1IvTkEzQ25xTzRlbFZUSFJ0dTVraTVFb1o4amJNeWEv?=
 =?utf-8?B?ZTE1MFNERDA2Mzh5UjJzdSszU3FaZVJaQW9QU2RKL3U1T0prZHVYeU9Fc3Bq?=
 =?utf-8?B?V3FKZ3lGMHNDUklsdndma0E1Q1hqSzJvdEVENmVOckdoSDA0VVBaeDJXUStj?=
 =?utf-8?B?dWR1UHgxRVZIVHBHVUNVazdXSGpJN3NnRmU4MEVHak5CbXM2WHlzWU1zYXYy?=
 =?utf-8?Q?m85/hLC2mfp/m0G56YfodqwnR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f371c341-8bd8-4958-1ef9-08db34d7d999
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 06:43:07.9991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1va3ah3+9Uhxf8DgGQypsmyFsP0mbK7H4A64TiP2sIRq2lzOt2Nkctp7wwvTtJXdSFl3J4ALDZEZ3mEINUSt2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6779
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.43; envelope-from=fei2.wu@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.349, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 04 Apr 2023 06:43:31 -0000

On 3/25/2023 6:54 PM, Richard Henderson wrote:
> This builds on Fei and Zhiwei's SUM and TB_FLAGS changes.
> 
>   * Reclaim 5 TB_FLAGS bits, since we nearly ran out.
> 
>   * Using cpu_mmu_index(env, true) is insufficient to implement
>     HLVX properly.  While that chooses the correct mmu_idx, it
>     does not perform the read with execute permission.
>     I add a new tcg interface to perform a read-for-execute with
>     an arbitrary mmu_idx.  This is still not 100% compliant, but
>     it's closer.
> 
>   * Handle mstatus.MPV in cpu_mmu_index.
>   * Use vsstatus.SUM when required for MMUIdx_S_SUM.
>   * Cleanups for get_physical_address.
> 
> While this passes check-avocado, I'm sure that's insufficient.
> Please have a close look.
> 
I tested stress-ng to get the feeling of performance gain, although
stress-ng is not designed to be a performance workload. btw, I had to
revert commit 0ee342256af9 which is unrelated to this series, or qemu
exited during the test.
    ./stress-ng --timeout 5 --metrics-brief --class os --sequential 1

Here is the result, in general most of the tests benefit from these
series, but please note that not all the results are necessary to be
consistent across multiple runs, and some regressions are not real but I
haven't checked it one by one.

             master(60ca584b)   master + this      speedup

stressor           bogo ops/s      bogo ops/s
               (usr+sys time)  (usr+sys time)
sigsuspend            19430.09      1492746.34     76.8265
utime                  8779.64       271023.89     30.8696
chmod                  1728.26        27050.50     15.6519
vdso               23527136.74    246955742.76     10.4966
signal               584521.13      5470775.44     9.35941
sigtrap              822935.76      7190973.63     8.7382
signest              802706.93      6969509.05     8.68251
sockpair             501188.08      4242275.08     8.46444
msg                 1627863.38     13557215.89     8.32823
sigpending           551174.68      4575836.91     8.30197
locka               1447750.95     11727762.91     8.10068
lockofd             1460020.77     11562178.66     7.91919
sigsegv              718492.57      5673228.57     7.89602
getrandom            129004.90      1006544.31     7.80237
sigq                 892062.12      6828556.43     7.6548
chdir                    13.39          100.66     7.51755
timerfd             2074142.37     15395307.29     7.42249
mq                   916620.00      6208148.59     6.77287
mutex               1124306.59      7285459.79     6.47996
urandom              104868.58       678510.46     6.4701
pipe                2243935.71     14391093.39     6.41333
loadavg              463874.30      2936816.17     6.33106
fifo                 423415.43      2632734.32     6.21785
vm                    16726.91        99928.62     5.97412
handle               199246.08      1131172.45     5.67726
fstat                  2383.12        13479.35     5.65618
sigrt                405007.13      2143758.11     5.29314
access                 8449.17        44145.10     5.22479
sigfd               1506073.95      7408089.06     4.91881
sysinfo               11711.47        54868.08     4.68499
sigio               1672452.59      7564833.33     4.5232
rlimit                26771.83       119476.12     4.46276
xattr                   772.25         3412.81     4.41931
udp                  595733.08      2495239.72     4.18852
sockfd               260825.22      1061910.05     4.07135
get                   13169.56        52788.06     4.00834
getdent              141465.81       564471.43     3.99016
rename                61771.74       246277.28     3.98689
chown                 54946.74       212353.58     3.86472
dev                    3555.80        13596.14     3.82365
mincore                6617.92        25215.66     3.81021
file-ioctl           105919.35       398122.29     3.75873
link                     15.45           56.02     3.62589
splice               239841.25       865390.06     3.60818
io-uring              45798.90       157006.17     3.42816
filename               7795.98        26238.75     3.36568
sock                   1746.96         5850.73     3.34909
vm-splice            953550.50      3188724.62     3.34405
schedpolicy          231915.33       773655.76     3.33594
clock                 21878.02        72400.21     3.30927
fcntl                 76122.11       245817.92     3.22926
dentry                79533.95       247610.80     3.11327
fpunch                11895.30        36608.97     3.0776
revio                866066.56      2596187.53     2.99768
null                2351038.37      6984334.92     2.97074
mknod                 71145.05       203284.26     2.85732
symlink                  12.40           35.41     2.85565
fiemap                45437.02       128983.69     2.83874
sleep                100093.89       282540.81     2.82276
dir                   99154.72       272727.21     2.75052
timer                126419.44       344857.10     2.72788
set                   70640.29       192423.96     2.724
udp-flood            662581.75      1782759.62     2.69063
ioprio                 7030.55        18807.67     2.67513
epoll                147525.39       387861.58     2.62912
vm-rw                  1437.12         3774.13     2.62618
kill                 234075.90       613281.66     2.62001
hdd                   99017.45       257841.08     2.604
rtc                   57639.55       149363.61     2.59134
dirmany              127249.90       323667.85     2.54356
sem-sysv            1096787.78      2753588.88     2.51059
close                194579.21       482854.54     2.48153
dnotify               15125.16        37097.94     2.45273
dccp                   7554.97        18429.65     2.43941
lease                285588.09       692990.31     2.42654
eventfd              282256.72       681576.60     2.41474
sockdiag           14803911.93     34934756.45     2.35983
memfd                  3632.45         8513.45     2.34372
tee                  124239.86       290298.68     2.3366
alarm                 78757.48       181210.40     2.30087
poll                 128638.34       292293.31     2.27221
open                 189323.41       418865.86     2.21244
sigpipe              222534.69       486854.87     2.18777
pty                      18.95           39.13     2.06491
futex               1333749.78      2742935.07     2.05656
lockf                648732.25      1321326.88     2.03678
kcmp                 734152.03      1452613.12     1.97863
procfs                 7378.58        14503.74     1.96565
sockmany              94910.81       180132.46     1.89791
dirdeep               10330.82        19390.08     1.87692
touch                 97843.94       182585.97     1.86609
chattr                 2952.98         5426.15     1.83752
mmaphuge                430.84          738.17     1.71333
sem                  649644.88      1107290.70     1.70446
ptrace              1010862.41      1677555.44     1.65953
vfork                244944.97       403514.39     1.64737
nanosleep             23147.04        38097.83     1.64591
mprotect            1068863.24      1729245.09     1.61784
pipeherd             720787.08      1157261.92     1.60555
pthread               48395.68        76169.49     1.57389
enosys                 8271.11        12705.37     1.53611
sockabuse              2825.44         4251.52     1.50473
af-alg               620270.87       916118.93     1.47697
fork                  10583.97        15363.15     1.45155
copy-file              6675.07         9389.54     1.40666
resched             1730236.55      2421449.49     1.39949
msync                 93196.18       122263.64     1.3119
vforkmany            239372.56       304313.41     1.2713
vm-segv               11918.23        14981.24     1.257
readahead            261489.55       321372.13     1.22901
sendfile             147043.77       174971.03     1.18992
dynlib                 8526.99        10078.23     1.18192
fault                 86430.63       100320.47     1.16071
dup                    9829.71        11264.11     1.14592
full                 473749.38       541801.33     1.14365
mmapaddr             315772.34       351766.42     1.11399
spawn                  3937.57         4384.92     1.11361
io                   371206.67       409205.80     1.10237
munmap                64162.14        70473.66     1.09837
exit-group             5990.95         6522.70     1.08876
pidfd                 37614.16        40687.85     1.08172
flock              14069057.61     15117799.43     1.07454
wait                 106334.40       113658.40     1.06888
mmapfork                  1.81            1.93     1.0663
daemon              1161091.36      1234795.43     1.06348
bigheap              185514.46       195279.13     1.05264
mmapfixed               319.65          333.70     1.04395
brk                 1410050.59      1456025.25     1.0326
sigabrt               12129.51        12520.45     1.03223
sysfs                   806.78          831.54     1.03069
dev-shm                  40.30           41.37     1.02655
bad-altstack           7310.53         7493.23     1.02499
shm                     823.73          842.50     1.02279
shm-sysv               1132.54         1151.86     1.01706
mmapmany             400323.77       406078.50     1.01438
session               12096.44        12228.64     1.01093
madvise                 116.81          117.96     1.00985
clone                 28152.35        28414.20     1.0093
msyncmany              2220.25         2238.88     1.00839
pageswap             205651.13       207367.84     1.00835
unshare                 637.92          642.98     1.00793
remap                   373.18          375.69     1.00673
personality         1698012.68      1706642.92     1.00508
reboot               117234.02       117421.91     1.0016
itimer                24962.64        24971.19     1.00034
sync-file                 0.00            0.00     1
sigfpe                    0.00            0.00     1
seek                      0.00            0.00     1
inode-flags               0.00            0.00     1
env                       0.00            0.00     1
prctl                 11805.81        11772.73     0.997198
malloc               991487.43       987061.41     0.995536
mmap                     14.48           14.39     0.993785
zombie                33753.24        33539.75     0.993675
rmap                    625.84          620.94     0.992171
tlb-shootdown           358.25          355.33     0.991849
switch              1251701.93      1240818.57     0.991305
zero                 127112.38       125254.50     0.985384
resources               685.62          674.89     0.98435
yield               4184626.17      4117860.34     0.984045
mlock                494527.50       485733.90     0.982218
fallocate             32711.39        32067.69     0.980322
sigchld               46289.82        44914.65     0.970292
inotify                3013.11         2879.87     0.95578
opcode                11315.78        10538.58     0.931317
nice                 154327.30       136797.63     0.886412
mremap                  225.29          198.82     0.882507
exec                   4118.89         3282.85     0.797023
vm-addr                 214.25          166.69     0.778016
landlock                950.00          722.74     0.760779

Thanks,
Fei.
> 
> r~
> 
> 
> Fei Wu (2):
>   target/riscv: Separate priv from mmu_idx
>   target/riscv: Reduce overhead of MSTATUS_SUM change
> 
> LIU Zhiwei (4):
>   target/riscv: Extract virt enabled state from tb flags
>   target/riscv: Add a general status enum for extensions
>   target/riscv: Encode the FS and VS on a normal way for tb flags
>   target/riscv: Add a tb flags field for vstart
> 
> Richard Henderson (19):
>   target/riscv: Remove mstatus_hs_{fs,vs} from tb_flags
>   accel/tcg: Add cpu_ld*_code_mmu
>   target/riscv: Use cpu_ld*_code_mmu for HLVX
>   target/riscv: Handle HLV, HSV via helpers
>   target/riscv: Rename MMU_HYP_ACCESS_BIT to MMU_2STAGE_BIT
>   target/riscv: Introduce mmuidx_sum
>   target/riscv: Introduce mmuidx_priv
>   target/riscv: Introduce mmuidx_2stage
>   target/riscv: Move hstatus.spvp check to check_access_hlsv
>   target/riscv: Set MMU_2STAGE_BIT in riscv_cpu_mmu_index
>   target/riscv: Check SUM in the correct register
>   target/riscv: Hoist second stage mode change to callers
>   target/riscv: Hoist pbmte and hade out of the level loop
>   target/riscv: Move leaf pte processing out of level loop
>   target/riscv: Suppress pte update with is_debug
>   target/riscv: Don't modify SUM with is_debug
>   target/riscv: Merge checks for reserved pte flags
>   target/riscv: Reorg access check in get_physical_address
>   target/riscv: Reorg sum check in get_physical_address
> 
>  include/exec/cpu_ldst.h                       |   9 +
>  target/riscv/cpu.h                            |  47 ++-
>  target/riscv/cpu_bits.h                       |  12 +-
>  target/riscv/helper.h                         |  12 +-
>  target/riscv/internals.h                      |  35 ++
>  accel/tcg/cputlb.c                            |  48 +++
>  accel/tcg/user-exec.c                         |  58 +++
>  target/riscv/cpu.c                            |   2 +-
>  target/riscv/cpu_helper.c                     | 393 +++++++++---------
>  target/riscv/csr.c                            |  21 +-
>  target/riscv/op_helper.c                      | 113 ++++-
>  target/riscv/translate.c                      |  72 ++--
>  .../riscv/insn_trans/trans_privileged.c.inc   |   2 +-
>  target/riscv/insn_trans/trans_rvf.c.inc       |   2 +-
>  target/riscv/insn_trans/trans_rvh.c.inc       | 135 +++---
>  target/riscv/insn_trans/trans_rvv.c.inc       |  22 +-
>  target/riscv/insn_trans/trans_xthead.c.inc    |   7 +-
>  17 files changed, 595 insertions(+), 395 deletions(-)
> 


