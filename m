Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pebwr-0003tG-OI
	for mharc-qemu-riscv@gnu.org; Tue, 21 Mar 2023 09:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pebwn-0003s3-5f; Tue, 21 Mar 2023 09:22:41 -0400
Received: from mga01.intel.com ([192.55.52.88])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pebwj-0008Bo-6t; Tue, 21 Mar 2023 09:22:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679404957; x=1710940957;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9HF+0UZ9wHL60jsdP69MW/thlTJ3T2ffhjcY+0qmuNM=;
 b=kpqnjCwtP1hBPvI7dut4NZeYC3oeJLe9Pb2Gpm3aguezG9cbTqbV/FEn
 ghD47OeskQbKKPq91b3dxwZB4syC01bgFaWBSVh75B2ciOPBWY2VuxjEQ
 hvN35iLQFwf2W9rlsB3NltuaBdyZT+ZoH08J4AOxMz9pjvRbXOB680sm+
 rCiUi+ShPIdGjjouDR2YUgfXN2GRBYmpV4C/jIg2MhxkKAOaKSS97kVX4
 nD1aFCMV5QGyI692omaXPkudyHAmcy1PI5ykrQw591LCpMXEuPnXRunfT
 opDuZIpEiXffZnrCMj76Y/jz4jheDIBHqptyx1VNUYuYcNS5vLQlAvqE6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="366666943"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="366666943"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 06:22:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="681474313"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="681474313"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 21 Mar 2023 06:22:34 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 06:22:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 06:22:31 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 06:22:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+fpgOB5jVd6ZxZrnwmbdcnvP8DZd6Kx4o1r+EQSL4xrVPo9rzqMQnGcdfXW7xHm0G4BrN1gnaJ+JP1wunA31ujsE/veES7bow6gOyxi9iibk/MGKGTGP1xnkU4hVmbk9lk2As0iUy300i7iUJLdLMfvBGD7N8SQPFyCKlgM3eyu7GBMZNGP6lPB3fcKDTrFieYf0HOUgqHiDs2ndsgRt3a0q6KWLYsQctvBTTzzCCOfhus771rt1NHTLjGVtd3zrHKUoMn7O91eMM3MPqniQBty3wBC1l2L2MjxcnyTBOO2RgjJD5zFnMGPwZgle/x7JyTFmH5K8fuEhCvj4WyVTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3N2EnQZAfpcb01fMlL9jKCxqH2BsjPZ+pfJla8jGTs=;
 b=ZenB6xAKzZlBWnBH6rYOc+uinm6AI4i7tCreqblNsfhg3WwG7hctcNv/67bZ318RV5OMqhlIHAA3rEePOFTtoDWvqDF9+Xcx0wEKFPr1GVi5wJHz995FJsZzbVqFcvrSqsWtT6CfW7YIMsuYFqrHsdDi5tIpizlCG1x1tTxgAweR0OfS0YPNbg1gBaPGfK/YBWTkU9kxRmseifzuPNdsW8wmYNJwIZKrVlTKgVorXsSykpK2aSGM/wyUG3rRn31Chke/jiDM+uvyWfac+omL4mh5B09jtiKUX0/GPNyEznchprYNlVmzfrsWooWXXKghXWJqaUaXU18xc0VRzdIRJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by SA2PR11MB5067.namprd11.prod.outlook.com (2603:10b6:806:111::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 13:22:29 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5%4]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 13:22:29 +0000
Message-ID: <c9c33a1e-73fc-921c-8c3b-c6d2cfca5016@intel.com>
Date: Tue, 21 Mar 2023 21:22:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] target/riscv: reduce overhead of MSTATUS_SUM change
To: liweiwei <liweiwei@iscas.ac.cn>
CC: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, Bin Meng
 <bin.meng@windriver.com>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>, "open list:RISC-V TCG CPUs"
 <qemu-riscv@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20230321063746.151107-1-fei2.wu@intel.com>
 <6648a495-d5d4-60df-cf88-90c98cc429c6@iscas.ac.cn>
Content-Language: en-US
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <6648a495-d5d4-60df-cf88-90c98cc429c6@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0096.apcprd03.prod.outlook.com
 (2603:1096:4:7c::24) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|SA2PR11MB5067:EE_
X-MS-Office365-Filtering-Correlation-Id: d3216405-f696-45fb-2046-08db2a0f51a5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J/VAChNCImTw++2/RD0Pb3DCjLgKAy+ycvN8jA+kzXSXNpGrT6CyyLTQJVD+VPhqr07ibSp8mliVGMqdst4YsIV38IkEQkFAHnAYDrOnMYhLpwOlfw2IXgo+0zxK7N0wknigkOCm89NBT89ZjphDUMZxD7NbTFZvYQ/2ZURD7cUOlGPzegE9au7kR07yDRF8TJ9rFGYUrGdfOkQ3DR1A/aOBnPIOpCHGbTVtcjNjt9F11BUNKqHddt4QaKjY4ncvkuwtab7lhJvdORJzWK6R8f9c1TgemPxEkmkcJAqwcg3U8XX12ICGLpocD2+2485k7N6tzwN8iwUvG2ZlrFjv+eQuCt0vRfrSFUMWJ5PzYusKtvD5m/bL+wocRCJtkKCgiOuJ1f6y1M1K6/krpaQFAyHd98CsrWZ0kHhPLE+l0SqWz6tAlJp+bKV4Ls+t/AWfxYSh1XRmpdsrLRWgQkoOmBk7HWBHx9P0HsQGqRmBJtxmpyTHjcj+IwzwsVd712ZLn3IbX1woZ7N7O/ywAiFCuDZWAwQgP10Z1T2UedFHjY1F3VnW0byiPljHgHsMeuedELWMgdDnjE6P9jcIhLdzT8DaCZ6AFodylJuIHKQ9rIDQFK9ZgPr7/KrNonNYhdgxHUzOU7HY1KuQBNpkXH5eAvcjDvkDyhAzy1h+dL2wjVUJtygJzUqcuoNrJVLw/tTiCPnfIU2QFZX6aoYsrDvLvGKUXEtDxohDUlXQpfirego=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(366004)(39860400002)(136003)(346002)(451199018)(6512007)(6506007)(53546011)(6666004)(6486002)(31686004)(36756003)(38100700002)(31696002)(86362001)(82960400001)(186003)(26005)(2616005)(316002)(478600001)(54906003)(83380400001)(66476007)(8676002)(6916009)(4326008)(2906002)(5660300002)(66556008)(41300700001)(66946007)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEI5d1pjcHY5WVFRZmlEYUUrWnlicVF2dHdFcTR0SVJEMU5ObjgxeHQrSkFU?=
 =?utf-8?B?d3F0NmdPUitFMVN5cnVZMkVjRVFNS1ZHRWV5YW1XN1QwY2h1ZmRXL2Z4YThL?=
 =?utf-8?B?OEJuMlZlUkYyYXVST3dnSlpieHhCcG9vU2J1b3hCalJDdWtTZjNOczF6N1pu?=
 =?utf-8?B?cVpiQlNwZG5HRytVRWhOS2Vrb2RFZGd5RERuVHJwaVcwdU9lSzAyc1dHUDJp?=
 =?utf-8?B?bEdnOHFYd0hZeExsc2s0eWhPcnl0VU83YWQyREs5RytpSG81RHJ4NzA2RVVZ?=
 =?utf-8?B?MXkyUWxJRjd6dFFEckhRR1pYWk1DaHBPZGp5TmlvcVdFalozSi9IWnhDUDdu?=
 =?utf-8?B?dTZ6SFBKaFJJVVNvNW15bU9qM2R4aEo5bWZPTFFFUlZHdWxrYjFOeGtvZFRy?=
 =?utf-8?B?V1ZYeVk3bUo3bWJpNVNWem95NFk0WDNJUHQzNDVoV05YdVluME5VU1IzOHAv?=
 =?utf-8?B?NUxyWXFyTlVXSzlTdUpGbnRscFozVWw2cnFTUHVOSzNLcXJwQ2U0UTNxTmV1?=
 =?utf-8?B?UWs1MEV1REplRGV3UFYwbTVZQ1BJd2FXaUNBazFzYkcvQkZtS21MZmN2U0V1?=
 =?utf-8?B?RUdQMkZSM0dUZ0RJaHAraWtnOWJZS294a2hiVHUzdXV1em5yWHJvem85dW0r?=
 =?utf-8?B?bHBMckIvNElQdHVsK1I3Zkkxc1YwdHZOVCtTZE1PUEFTWFh2VXdxelp6UkxO?=
 =?utf-8?B?cnVhcVVrRmgrWUk0S3VSNGEwZ2VSVjJodDZuZzVCbTJRbm5PM1pBdThvQlFJ?=
 =?utf-8?B?Zk5Sdk1HOUJzcTBMUjJranFucUNRekY0WXVjKzFqSFJiak9URklraS9aQWVi?=
 =?utf-8?B?ckh4aU1mZnFWdTYwSFZEVkh4c0tUT2FxVUU4UFJCTlJkOVR4RGgzalZxVGtr?=
 =?utf-8?B?N0VaMjVHYnN6VWhNQUdYY1hjTDhxbmJkcHhuNHc0bVFWRkFVZ2dVemhFRTJL?=
 =?utf-8?B?NGNCOWxLZUZ4K2RBYW9xZStObUkvZ0Z2Yld0Y2hUdy9Wc3BHZEtkclcrWWtD?=
 =?utf-8?B?Q3BOTHBTUzd6TDJNTWVieDllZGdpckdQazFjbytpbk1FZU1HZUEyOXFmUTl3?=
 =?utf-8?B?eW4yM2t3cE4zaWo0WTJtRXdmZ052UWpyeDV3a1J0MlNRVExuTlZBanp0RW53?=
 =?utf-8?B?YTFSenNhUGMzbnJzWlpYa3BwZUJaMWtQTjVwMkl6cVZLYUNORXpIbXZPTWlk?=
 =?utf-8?B?RUduRmpTQzhxeXRrcFN3SEJxSmFrL3ZFdFF4bUpiWGVHeG41RFB0aDZLVEE1?=
 =?utf-8?B?SWNrTzErcUtlVzN2YkZXbHZ5U3h6cXFHSzczZmlpTDJaVzROUkZhYmZmS0ly?=
 =?utf-8?B?dkhGZS9QMVZkVXZPdVh5UXJzV29FRGVXa1Q3ZHhvbm92bkhCR3ZRYzI4RjVk?=
 =?utf-8?B?MU40UktXcEQ0OFI3a2hDbm9tVnVZNVFVOS9WamJxbnF4bkg4Slh3SlFKYTJN?=
 =?utf-8?B?NHN4dlpJWmxRbW9OUmNoRE51a29WT1M3SkY5L3k3Vmk4U1dRa2hvemI4aHFy?=
 =?utf-8?B?M3d6RG42REN6WnFPRXk4RkgybzJSTkhSMHpkZElxS2taMUMxbmtYZHJlN0Zh?=
 =?utf-8?B?akF6c0dPYkVFOGFwQ25qRzJnakxsang2TlAySlFJQkZNcWU5dkdMNkE1U1A5?=
 =?utf-8?B?c3F3RVo5aHRCWFBjb2ZvTDhlYm1ZU3FhVi9aZEQrQmRDM0YvQ3F5SFAyMUJp?=
 =?utf-8?B?cUJ5NUdJMnJSV2UvSDlVL3ZyQjBVMGhydlMzZkNKVlNQRUFTWDBxRSs0cmtw?=
 =?utf-8?B?T0RRYms4MFVhMkpQenk0RUFDRG4rWU9CRzZkQnZFaDRyYkVDdmxYTlRibTkr?=
 =?utf-8?B?amNWT0lXR1MyU215MTJ4aTdEYXZRWUpVdlZSaDFRUE4yWXJCczFBOU5lKzY3?=
 =?utf-8?B?c3JXc2dIZGZOZ2h6Y2IxUEM1OUdzTkZxMmdxVVpNNU5wVnQ2TEp6MTRoSlJP?=
 =?utf-8?B?cEwwNHpXV0xkZFVxcEp5MWpWbW52ajJYVllkdGt0c2dxNmJDMy9ZaElaNVFH?=
 =?utf-8?B?cExJSjhTcEdqaVhNMy9zWjBNbEJyK0c4RG5EL2FFT0lyKzhUVUdVWE5jY1pS?=
 =?utf-8?B?THhVbTJ4eVJiVll4RG9rRWFvZDZwK3I5Ymg0ejY3U1EzVnptZVJIdVpaYyt6?=
 =?utf-8?Q?7BFBAF4YP4dXcHpStLl9mb1JR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3216405-f696-45fb-2046-08db2a0f51a5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 13:22:28.8990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9yJNfmTLiGUtZ1bkVDbcjB2ZIT7WFYQfiJFBEhkylYxoGczc9NpxoQcAPxnPAHS1Bs0T8gDLv0OTjEbeElMwCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5067
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.88; envelope-from=fei2.wu@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 21 Mar 2023 13:22:42 -0000

On 3/21/2023 8:58 PM, liweiwei wrote:
> 
> On 2023/3/21 14:37, fei2.wu@intel.com wrote:
>> From: Fei Wu <fei2.wu@intel.com>
>>
>> Kernel needs to access user mode memory e.g. during syscalls, the window
>> is usually opened up for a very limited time through MSTATUS.SUM, the
>> overhead is too much if tlb_flush() gets called for every SUM change.
>> This patch saves addresses accessed when SUM=1, and flushs only these
>> pages when SUM changes to 0. If the buffer is not large enough to save
>> all the pages during SUM=1, it will fall back to tlb_flush when
>> necessary.
>>
>> The buffer size is set to 4 since in this MSTATUS.SUM open-up window,
>> most of the time kernel accesses 1 or 2 pages, it's very rare to see
>> more than 4 pages accessed.
>>
>> It's not necessary to save/restore these new added status, as
>> tlb_flush() is always called after restore.
>>
>> Result of 'pipe 10' from unixbench boosts from 223656 to 1327407. Many
>> other syscalls benefit a lot from this one too.
>>
>> Signed-off-by: Fei Wu <fei2.wu@intel.com>
>> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>> ---
>>   target/riscv/cpu.h        |  4 ++++
>>   target/riscv/cpu_helper.c |  7 +++++++
>>   target/riscv/csr.c        | 14 +++++++++++++-
>>   3 files changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 638e47c75a..926dbce59f 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -383,6 +383,10 @@ struct CPUArchState {
>>       uint64_t kvm_timer_compare;
>>       uint64_t kvm_timer_state;
>>       uint64_t kvm_timer_frequency;
>> +
>> +#define MAX_CACHED_SUM_U_ADDR_NUM 4
>> +    uint64_t sum_u_count;
>> +    uint64_t sum_u_addr[MAX_CACHED_SUM_U_ADDR_NUM];
>>   };
>>     OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> index f88c503cf4..5ad0418eb6 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -1068,6 +1068,13 @@ restart:
>>                       (access_type == MMU_DATA_STORE || (pte & PTE_D))) {
>>                   *prot |= PAGE_WRITE;
>>               }
>> +            if ((pte & PTE_U) && (mode & PRV_S) &&
>> +                    get_field(env->mstatus, MSTATUS_SUM)) {
>> +                if (env->sum_u_count < MAX_CACHED_SUM_U_ADDR_NUM) {
>> +                    env->sum_u_addr[env->sum_u_count] = addr;
>> +                }
>> +                ++env->sum_u_count;
>> +            }
>>               return TRANSLATE_SUCCESS;
>>           }
>>       }
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index ab566639e5..74b7638c8a 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -1246,9 +1246,21 @@ static RISCVException
>> write_mstatus(CPURISCVState *env, int csrno,
>>         /* flush tlb on mstatus fields that affect VM */
>>       if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
>> -            MSTATUS_MPRV | MSTATUS_SUM)) {
>> +            MSTATUS_MPRV)) {
>>           tlb_flush(env_cpu(env));
>> +        env->sum_u_count = 0;
>> +    } else if ((mstatus & MSTATUS_SUM) && !(val & MSTATUS_SUM)) {
>> +        if (env->sum_u_count > MAX_CACHED_SUM_U_ADDR_NUM) {
>> +            tlb_flush(env_cpu(env));
> 
> SUM seems only affect S mode TLB. Maybe we can only flush S mode TLB here.
> 
It's also in effect when MPRV=1 and MPP=S in M mode, we can only flush
the tlb of PRV_S and PRV_M.

Thanks,
Fei.

>> +        } else {
>> +            for (int i = 0; i < env->sum_u_count; ++i) {
>> +                tlb_flush_page_by_mmuidx(env_cpu(env),
>> env->sum_u_addr[i],
>> +                                         1 << PRV_S | 1 << PRV_M);
> 
> Similar case here.
> 
> Regards,
> 
> Weiwei Li
> 
>> +            }
>> +        }
>> +        env->sum_u_count = 0;
>>       }
>> +
>>       mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
>>           MSTATUS_SPP | MSTATUS_MPRV | MSTATUS_SUM |
>>           MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
> 


