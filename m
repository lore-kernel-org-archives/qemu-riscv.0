Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmOvM-0007mB-W1
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 21:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pmOvI-0007lk-Pa; Tue, 11 Apr 2023 21:05:20 -0400
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pmOvC-0006jN-Og; Tue, 11 Apr 2023 21:05:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681261514; x=1712797514;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fPCzUf3eeS5iYE9Ek0hnIi2YUQFRzTuh1cozedTE+Fg=;
 b=QJvVUYRw3KopvqhV2bqZYmEJDWJ7o7evYR2KcISKs7/upiPfh7mT066t
 NlsQ8A5urKU082OhJSrZ7jof+zbb0o82CBnFExng3ezjUBgxLWSgivyUR
 2lUc0rQhesMtpW2zjO8H/p0p5oqOmTmJsXn1jID3VV9HiebvpD4ZHM5p0
 iVaHhsDRS2E1XdeLhBuwzWbP4Nt8PuBLy/BG67ZKiNgQlMLalDrUPxylB
 VXQSKIKmIDv2rBFNel1CudMGF7HgjqSJZSDe54zt8Oann9oMSOetjZL7z
 WZitR2VGFNuB/eBWF28rekacWvUjM+3qZDTPOw/RSMJJ34OKgxN8NumZh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="342529024"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="342529024"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 18:05:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="812789292"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="812789292"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 11 Apr 2023 18:05:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 18:05:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 11 Apr 2023 18:05:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 11 Apr 2023 18:05:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCxYNi6MEEg2/LIFvk7XjhMyYL7M1jMX1iaYHZywzL4PQrmtCCGxy/Z5IB8Yosks5hOuRxtawlZotab015nNIb+8E6DHWLUw0S//mjWf2MvwMCe5qo1T56833hwhYsX557+GMb8tid5eW0Scyo0U6bePaAshwyvHf6xzXJQ44CQSEFGKMdwdqdlR5s++rMHUmUexD3osk+F/2HAuNM543CkR+YUVp+5uirEpTfWp6TUYn36ii/LSHJ7c56GSRlZgWgxIUlJ7PClQjWTZhqECorwrTZobUifx8s3Eu0kMBnf+2zh5FC4ED6SN5gXRZgACYsJwnChclQa+g//bDP0eXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2UYY+2gbGh2lMPad7aGcJIiIbeAO7iKvDp38IHZIPYE=;
 b=n+n181rAE3ekRX6M7oAXit79acsGQjfqfoVESacEUDtNXeB+ka9M1hXtc1E129z8uhrapcmVZi88AEJaea+uouD686zwkd1evah/zxViYZ9h6Czqr9onOGNGaQe2HgU1MvgV9Q5keFdzrOKQNHmB7lyuk08hNgyxkuYAWEIc4OlmL1SzLsKTInYPTyfeERsoC8GRRsYcEKpurCVp1NcQ+s1/SlFjNpmxR3zaLz0FZPq7gw76IcbUT98wbo5oufAsKXtmQnhbx3hpJ6EzwV2TjNnOq28UlqXRdaUGwFRk8a3Wqq6vc1Vu6BftjsbWiKnNH/jrrFz6hc+ug2nl+LkjGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by IA0PR11MB8302.namprd11.prod.outlook.com (2603:10b6:208:482::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Wed, 12 Apr
 2023 01:05:02 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::cf58:e1db:41d4:ee3f]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::cf58:e1db:41d4:ee3f%6]) with mapi id 15.20.6277.038; Wed, 12 Apr 2023
 01:05:02 +0000
Message-ID: <b0d06bc4-d8f1-30ff-9bc1-252c7f15df89@intel.com>
Date: Wed, 12 Apr 2023 09:04:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] target/riscv: Restore the predicate() NULL check behavior
To: Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liweiwei@iscas.ac.cn>, "Palmer
 Dabbelt" <palmer@dabbelt.com>
CC: <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
References: <20230411090211.3039186-1-bmeng@tinylab.org>
Content-Language: en-US
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <20230411090211.3039186-1-bmeng@tinylab.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0171.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::27) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|IA0PR11MB8302:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dad99d0-9140-47a4-a618-08db3af1f1c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: drUKNd3rdY7MCzawE7Kz6l8R/ufEpdF/9B7+9FjwZgPnjKWVoNyIPDxlzjcOA+3gu3c4lSaeue3WLn8MvTzb+il1XytYzwBNnE4N2JlOOvJA++D+DQAkpLdCAAuIS9h6nv8tvPitOzQhMJyge8pIU/sFYr8CMxTcbnKnnaNx9uLRcA8RrynnT6qrt7Ty9QuOk2cxPMuqfy16L/JUejTKrwx82wo/8nhFV5/1GpEGBTTHYJXZMVcinhZKO3fWrgXYhGIk59fOJ5Z5UnAWGELHH2RgdBxeW0KoI2vLMqubK2uqgqOIrHBdJ4mV6Bz72f7oOdZGmysaaw5HfPZj4hpIp3r/3bDVFTfjjC/MaEY4BntWU9ZE03rZtQ6eY3C88H8Yx9Y41f8xN21MPkNEb2tWbLu0Aq9N0RMAK6jsL1beeo7HmJyzS6YGLIiYzgyK7jdPo7LduPNPQzt57duDiOtkhwH3MrcwrvUaHxWvx3zUgiX6XFySLBG+699a3HUfy8kQ2NF+gijeX0wcarRb/LTz2zF+wzj4HwIXXHUD/u6vB0nRHzf16zGYN6cazXJifscumFAIkpRMTeu/TqsB9pK5Ymo6nUEpThb0IJ29Vnt2fu9PpWjpFaDTXWS1KaLoA+FjycfXXTih9HbAaBZJuotMGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(376002)(39860400002)(366004)(136003)(451199021)(478600001)(53546011)(26005)(316002)(110136005)(6506007)(186003)(5660300002)(2906002)(66946007)(4326008)(8676002)(6666004)(6486002)(66476007)(41300700001)(66556008)(8936002)(31696002)(86362001)(83380400001)(6512007)(36756003)(82960400001)(2616005)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUFzdGY3YllUWE0za1VQRnVtZWw4SkFnQTd1TUhtQy9CVlI1cXM1SjdDaHRD?=
 =?utf-8?B?S1hwYTdabS85aWZCeEdzTENZMkNRY3c1T2ZhTHdhRzhnbUZHMzE4cUtjYS9t?=
 =?utf-8?B?OU1IYVVwbk9CWWNRK2N4YkZITVRmakxhZkdPVUF2ZGJrL3lYaVkvcU5RK3pr?=
 =?utf-8?B?eWw1dFEzbU4yMnF2UnVCOVZTdW1pdVV5V1BGU3pRMnhiOTgrZnBrdGNVbVgy?=
 =?utf-8?B?NEd6anJ4dUcvem91RUNNMVF2bzZKVW1pQm8zVFRtY3dJRkQ1OVoyaVNJcWgv?=
 =?utf-8?B?dy9RRCtRZG9UcWl3OStuUUwyT1pVRGt5L2pFME1xUFJETkJ2RjY4cGpQWU80?=
 =?utf-8?B?M3V6UDdpdVVyYmg5VDVkYWpaL1VhQUVGSncrU3c5OERUZVBLeTlhMW91ekJQ?=
 =?utf-8?B?cXJmMElTQm0zMitEN0JFNE9rWG5zYUZiOVdnK3c4bXBoK0l1S21aUDJGZTFR?=
 =?utf-8?B?WFRGMUpCMjFLTThwN01ON213VDN6MWdoT2tvbVoxZlB0Q21mRWlOVjVrclpL?=
 =?utf-8?B?eXg4S0JHNlhuLzAvVGlXTlhOZ3pmSDJPTElqd1RJVlpaOWdvMTBkWEdaUWdC?=
 =?utf-8?B?aklCeStTQjVJRDU3cXF6bWdYem9JK2UrVEVORFM4L1IvUWNIWjhmWGhHMG85?=
 =?utf-8?B?RVQ1ajJEaTNrZERKblRuaXhRbUxqTjBPemY0RkdDVlNrWndXVytSSWFmU0tH?=
 =?utf-8?B?SWYwOTYzNFRvQk9nR2dSbktIQmVnZTZYb2lKOFkxWHRrcGJzNjg2dmtkdWhC?=
 =?utf-8?B?UDRZNlNuQ2Jid3pmdno2WkZDYTZhZGhHQWovUWhWU2l2cEF5WDZtUmc1MkVO?=
 =?utf-8?B?Qk9jSjNidXZNYVZTWUIvRUltV3JhUzR1cHFLcmxyTnlFc1o5aUh0ZjJZVWsz?=
 =?utf-8?B?MUo1T0Y2ZnBrYUhVdzNNdm8zaWJNcGgrVzZtT0IrMzJ5YU5OZzFSQjE2em5m?=
 =?utf-8?B?eHRXdU83eTUrM2ZNMG42RVU1aldaTnVPRXJpcS9NZnQ4d2QxVi95NTVkRG40?=
 =?utf-8?B?N3c2bDRNTDZMSDUxbStXODRCYmNnSjJCbHlSc2RNbDU2TUZZVm1xb3psanc1?=
 =?utf-8?B?Ykw5UFpLZGx3VlAxS2laVmVLSXVUUTZ1TElWWWRYVDcvb3ppSnNFb2o2c2Rk?=
 =?utf-8?B?ckc5UVdYdjFtQk16RFhYa2JDbVNGSXNrRG9oNnF5dkNEOUpGbnpDenVvL3Jr?=
 =?utf-8?B?VGJTUUIwM28wdVZVMDJuTTBjOUVuSnFScGdSOVljd04xNjNuc3ErZjNQVmxi?=
 =?utf-8?B?VTZFZWhuRExFSUVlYUErWXNtdEhiRW5zamJ6MGZub1ZGUk5DZTF4QzgyMzh5?=
 =?utf-8?B?akxFeVlWYjRjcmZ1d3JwUFZuM2hWNjBxK2lRa1ViZHlsbGxtTXI0YUpXc2pS?=
 =?utf-8?B?ME9IbTlKM1gwRWg0aXVnNHNtWS96UjlHa2FIS3ZIejl4K1plZEtKaHRZZjlX?=
 =?utf-8?B?YXV6L3E5dzlxMXlpRFVJZi92Qm4xWXFyWHpXak9ZdTZJR1h1bVZOSFR3NlZ0?=
 =?utf-8?B?N2ZtOW5EQ1BTTzhtTk1ZOEkxL25kcnRvdzFOUXVQeElxS2h0Z3NsTzFYV3o0?=
 =?utf-8?B?aXE3UGp1N2M4Y1RnUGdyMHhoZVg5VUZiTWxaQ1FJL2JWUHFRa05FWnN2Znpt?=
 =?utf-8?B?b0N5Snd6b1JLNERIOEYzNjZCc1o0MXhmNlZ3VDg1VU03clk4dHhVUlo0bXg1?=
 =?utf-8?B?UjI0bUd3TU5hNG1tWkFxNDBYdEtwODBUdEgrN0N5bHN4dmRXZEFZOXp5U2Zn?=
 =?utf-8?B?akI4WFRZOEVWb2gwSFlteS9zNmhxTDhFSWFLYkZ1THJvSEdIVVVFSUhCSnBM?=
 =?utf-8?B?aVhsSEpGNDJZMFN3STBmZXh3YnVXZlZFcXZPVktWbUIxTW4zc2FxTFppR0Rk?=
 =?utf-8?B?S0F1U0VjUjlzN0hNa1ozTDdzOVB6bjJheEFIRktHc3pvbGJEdHZlaGovdXR4?=
 =?utf-8?B?U3dkaElwSXk3OHpiaVFZZ2hXQldPbkc4RFlJeWRhVW5reS9Db2Z4a3BuOWl3?=
 =?utf-8?B?TEJQZ1UxaUp6YTlORFMxRE45T1dLMSs1cmFoNDVWRFAxSUN1RjBUMjZVVmUx?=
 =?utf-8?B?cDJtS2dycEFGOEl2OWtTNTA5YTNkQmRPY0laSzU0Z1NaYUUrcGRGY1FDcm0x?=
 =?utf-8?Q?JW/K7gHiX2cve7pVT57hwumyS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dad99d0-9140-47a4-a618-08db3af1f1c6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 01:05:02.4346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNMaANK3P4rvmDjM0ey08CFPCvHoqXmskRfKeHvDW16Ev5CW3qrBkssah8E7mD4b3Y6ILj5c5E7GDTUdwNd0KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8302
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120; envelope-from=fei2.wu@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.17, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 12 Apr 2023 01:05:24 -0000

On 4/11/2023 5:02 PM, Bin Meng wrote:
> When reading a non-existent CSR QEMU should raise illegal instruction
> exception, but currently it just exits due to the g_assert() check.
> 
I verified that 'csrr t3, 0x4' in user space didn't cause qemu exit but
raised illegal instruction after applying this patch.

Thanks,
Fei.

> This actually reverts commit 0ee342256af9205e7388efdf193a6d8f1ba1a617,
> Some comments are also added to indicate that predicate() must be
> provided for an implemented CSR.
> 
> Reported-by: Fei Wu <fei2.wu@intel.com>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
> 
>  target/riscv/csr.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d522efc0b6..736ab64275 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3797,6 +3797,11 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>  
> +    /* ensure CSR is implemented by checking predicate */
> +    if (!csr_ops[csrno].predicate) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
>      /* privileged spec version check */
>      if (env->priv_ver < csr_min_priv) {
>          return RISCV_EXCP_ILLEGAL_INST;
> @@ -3814,7 +3819,6 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>       * illegal instruction exception should be triggered instead of virtual
>       * instruction exception. Hence this comes after the read / write check.
>       */
> -    g_assert(csr_ops[csrno].predicate != NULL);
>      RISCVException ret = csr_ops[csrno].predicate(env, csrno);
>      if (ret != RISCV_EXCP_NONE) {
>          return ret;
> @@ -3991,7 +3995,10 @@ RISCVException riscv_csrrw_debug(CPURISCVState *env, int csrno,
>      return ret;
>  }
>  
> -/* Control and Status Register function table */
> +/*
> + * Control and Status Register function table
> + * riscv_csr_operations::predicate() must be provided for an implemented CSR
> + */
>  riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      /* User Floating-Point CSRs */
>      [CSR_FFLAGS]   = { "fflags",   fs,     read_fflags,  write_fflags },


