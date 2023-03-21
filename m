Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1peXYS-0002oI-1L
	for mharc-qemu-riscv@gnu.org; Tue, 21 Mar 2023 04:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1peXYP-0002jf-FW; Tue, 21 Mar 2023 04:41:13 -0400
Received: from mga11.intel.com ([192.55.52.93])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1peXYM-0000qN-Rl; Tue, 21 Mar 2023 04:41:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679388070; x=1710924070;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tpfAChH6/dnMXyrE71GYoIVyyY9NMBW1Zehb1cgLjrg=;
 b=DqfJlhFKFsGbVDqDO8RlY7hPOqtWtGEgtKbFRoD55wcsS0OPPWyJAYs9
 Nelqy9qa4dab+sH+BOl7GEJqsain94D19tukkPJ5Omwg9WMiHypbGsJcY
 H6VVC2SxFOTvbCQNGYa6Dq17k3yY80sWvW/Mg2R1Z+f4f1zBVDsX9ySxC
 h4vPDgGqOA+/OT6gR2ZVK+9pXKxXuRaET+D1B8mPrIRMTFoUCJJrijZ7n
 Mu8ItH/hGJ94YYoXHv/Q/G4ZP7Wh9QvXpv/Rdlv+dUtAoJiMpzdVHNDy4
 LhtSRTxZF60QNXu6jGeQIzFr46uqo+1/GZjaT2J8Hdz2dCLpc7ffDb1GE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="336385866"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="336385866"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 01:41:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="631479440"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="631479440"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 21 Mar 2023 01:41:06 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 01:41:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 01:41:06 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 01:41:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9lj+ybrxV+ysCKewsIKVToAWv50L0N5OBxyd9J9VLcRWvFCPRurY0mq0wHFFqK1KOgFDfHhZuwkS0dDAEuBNp/aocF9xjtAUxvklQfEiPov9OldYWxUlq3ayfqCZFhdmpv0rhBFPLfd26klGLBKMkJi2eqzixIzbj1FyzA2DimeSR5T2DMtwExY8MXRa63RJdQg0Ry+ap1NCent5a58XfjKPcM6FT3BoE0rgy7/ye3JL1ZMG6TK6iBbpm4JFkYOXeeO37epDIupijsEytIBPuxs+T8fpYVWMYhPKF0dBRci2fAKGBxebFFBu8/ROiL+sN1AR0/ECUdORR91b7h/5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7Irr2QkPJc3oX4kbkCSY1mPhwFYCVf2iHcTRe6QCd8=;
 b=FunDmTsn+woLbpIu4pXem455lgFUQMkZQbEimJ0lVp1yHuLAGs3W2re3Cx0jRGLjzt8LfvfoeYZT1jRtzRkoFKaddFIU67Naq+bkJg53B9XFgGi79zboYnvk+jetu+0+87lFYlEKjaFz0GYTLxq6N8REMk0REDuT9IJySVkuHoyY0zXZ5xsULLHyPjkX4PEf+KGADaF+6WG3Cpb0VUdG1AECNfQCnx6f7hmLeaIOKDvUynUn/kErKinTyM4wtQs6FyaydJDO8PTl67RzEftQst3/7xynkl4XoFVwcg7onWt9jAjzgyIsVpD+J3/LLcSrwlb67I1QfCMUHT4t4okc6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by CY8PR11MB7747.namprd11.prod.outlook.com (2603:10b6:930:87::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 08:41:03 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5%4]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 08:41:02 +0000
Message-ID: <ddeaba54-e9fc-0309-4f35-7ee72052264d@intel.com>
Date: Tue, 21 Mar 2023 16:40:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] target/riscv: reduce overhead of MSTATUS_SUM change
Content-Language: en-US
To: liweiwei <liweiwei@iscas.ac.cn>
CC: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, Bin Meng
 <bin.meng@windriver.com>, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>, "open list:RISC-V TCG CPUs"
 <qemu-riscv@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20230321063746.151107-1-fei2.wu@intel.com>
 <cf407a04-9717-6a82-6405-d836874c5613@iscas.ac.cn>
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <cf407a04-9717-6a82-6405-d836874c5613@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0112.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::16) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|CY8PR11MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: 10d04c02-7acc-4c31-2004-08db29e800a2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v1poFRc3eWGtsz88YGJuBOytdOp3I1A7jIIrDjMU//oaGzlnLvDWrQQqm5R2Mg+G1hpQVd49lRWb0+Z0mzWVdGbXME58zU9ee1JWW6KnDfpGRhA0YOeBqktmk1mlWAhPwglG2fJ3746zIucgkZxpJNOTjxBzaznXojMjjTvtHkgz+FU3AsW8aU6oXR4LbaSU548ZWMi0SbELjFZmG/8d77S9B1baE+BHmaCZLP8LxLeHhozaM0051SQ0wwB6qJWxpX0SA0yGy6XuQdVQXgCAbf9bIfQu8f87rHJ2co2qPjPxHvN8SDwBynuK1vwx9p2/iydHIi9r7JuskTu6gg2vdQhHhmgTLiUihjw27ojaVfz+sl7xAUEjybEYq38ACNitTIug2pFMBJShdfFc2tfwteqCPE3dPUvdIlufSWxmIn0roeyUhiVjupwRYMZSSWCA+ML9EOiaZu0aFrCA3bQT4f6oDdou4AscxIcB7b4NRUf2GtKa4jizikPjl+8XhzGM7sY+UPnUuNghnoxHKIKpF4qB5whBlBtDeikC56TtWzNGnePUFzAVr7IGFXAMvz4aq/7PZH5TJGHXkE9o1cLAo71PPDnJmhJPUwkyhWkIQUbBIdZqOuoM2lGMEa975yekuEE2wzyE5t6SLwp/+Ko3hKPNwfBPmLlbOUdzJzZ9CFMSpVrUIqIWUeXqiS7qPxmtguJe1rSeqjcug7c3km+ERUPRBTt8GGUdCbd+iVFLBds=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199018)(86362001)(31696002)(36756003)(83380400001)(66556008)(316002)(6916009)(4326008)(66946007)(478600001)(8676002)(66476007)(186003)(54906003)(6512007)(26005)(6506007)(31686004)(2616005)(53546011)(6486002)(6666004)(38100700002)(8936002)(5660300002)(41300700001)(2906002)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eloyV2ZibjN4NWhrSTZLM0p6WHNNZHBVblc4Y3VqdW9aT0V2UzF1cDREYVVi?=
 =?utf-8?B?azhRSDh2VGRQeG45eWpwR2QxcGZVYmVCYXhwN2FncnFRczdCYkxaelpjVVVt?=
 =?utf-8?B?c1hsdVJxZHFVYmdjY1Z6TjRuZTN1MG84Z0RJdyszZ0w0cUYzd0hLMTVSVVMy?=
 =?utf-8?B?QXN6cjVNVGJwNHMxTXJ1Q2dtVkhySCtBRnpvSkprQ1FhMzNFUjFJeFFxc1FY?=
 =?utf-8?B?OXVqbU1zMGFJMUdiam1XUFFKM3ZaMi9DQU9zbXhEbVJ0ZDZ0TTdRejFKVGZH?=
 =?utf-8?B?NCt5UCsvaS9PMVUyM1BpN2t2Q0RLWEgyUnB3K04zdXg0aEVsUXlkYjFnSEZw?=
 =?utf-8?B?V1RaOUFaaXlxRW9sTHg0Wnh6bDNFZnY0MXQ5Uy9BdGZhK3R4ZUFpWVM3WXFR?=
 =?utf-8?B?MzEzY2NjcG1tUys5cHBvV0FKZVJtcnZCS2ZreHpWNVRZTHVIUXk1YjdGN3Bi?=
 =?utf-8?B?WWljWG45U25kd1RPbkxGRmdIemVDZ1BGUHVwYk1QeUZRbG1hVHFibm5Sd1Jl?=
 =?utf-8?B?WTl0SlNJMzRIMGU5RDFUb29udFV1UjhabHFOM3NVc3NveW1QdkFmRFNJdXUx?=
 =?utf-8?B?RGk5cHNtdTNaRk8zWjF6Uy82SWNlT2dmTTViaEJJNUxLcXdQRFh6N0QwY0FS?=
 =?utf-8?B?U0VyYitaQS9qaHVJdUgxOHpDbFNORUovSlpYWURIMElObXEySDlpQmJMc1FG?=
 =?utf-8?B?MzArd3J5VlQyL1hKSjluRXk3VGtvYXU4WVoyOTlXY3BPM082MThyMzlLblZv?=
 =?utf-8?B?N3c3SFVHcXVlUm1XeGZVNUVsQ2srd2lNZjJYOEI0VVR5cmFFbi96U0l6M09M?=
 =?utf-8?B?Mzc3b3hMcTYwL0xlSjJZdmlvOHlhRmY1STNsL0pRbU5BNHpwdHV3VzU1bWtp?=
 =?utf-8?B?YWhWOTgvSjJMWUxwQkNHMytPemJtRXRkTE5DMjAvTXRBeHdjMTEyb0xDcEF5?=
 =?utf-8?B?WDIvdkUvUTFPMm1Pd0doU0pMbFNVMzlDRFowYXRiVDM1OU9JR3NyMUJLMjRU?=
 =?utf-8?B?YnFoWmY1b3dDanFidFRhT2REVXo4V3ppdXovcThUMXU5cVhnWjBOK1pXcmg4?=
 =?utf-8?B?ekhRNHVNMVFyTVgybG1OczV5VmhXNngrenFKbHBCdXkwWWxQVXJyY3BkNXFX?=
 =?utf-8?B?bkRXQjV4N0piWUNwY0tweDZLVWxlaXd5aTAxMlpnNU1RZHB3SXRhMWJmRnoz?=
 =?utf-8?B?VEMyZmpORWxJcm5Iay9KbFptU25HMXRIMno0RDdPbXBoUzRDamxtWEJIUnoy?=
 =?utf-8?B?c20vOUx3Z08wRlFMdWZqYWVXakNrYXIraGpUZTFuSDBzMWZtYlVKR1Z2cFRw?=
 =?utf-8?B?UU40S1RtWVRpZVBqTGtuazRydlJDblNWMFY5WTByQk1BM1ZseHFkZWdPQkdv?=
 =?utf-8?B?QklwbG9aSUZEdDNtTVpOdDB4UUxzS3VGQTBDTGlMYVJFMVVHaDlEc2RpMi9B?=
 =?utf-8?B?K29SVXd5bVB3L2YyQUdiL2RYQ0tUSHp2SlkzZEVHNWlwMGNTRVhVMThMUlFs?=
 =?utf-8?B?K3VEdi9iek1PQmhzck5jVXdUeVN0dWFpUnFwbVFaY3hxSzB5aFlMelg5bkpD?=
 =?utf-8?B?cnQyVnR1b3pEK3ZHdUhieHpWOW5VOVdDZnlGWmE2d0diZC9NK3lSM2I5NmNk?=
 =?utf-8?B?NExZcjdtejkwTzhNOVRpQkRMNzdueEgxR05xUzB6VHRCRzdmMll4aElSVmJw?=
 =?utf-8?B?RnBhOXBYbmNsQU9BS0ZDOEF2ODUyQ1ZVNVkzdkdjSm1LTFNhd3d3aHZ2YzlX?=
 =?utf-8?B?cmF6OTI2WTVmVjB1ZTR1bE9pdUlCVWJMdWtpRUMyTmExV2dFQmJWRFpxSU5p?=
 =?utf-8?B?MnVXR042YUZxaWk3bVhiYS9YQmhaTEdESHZMMFR6NGRib1ExeVlLZUZKU3pV?=
 =?utf-8?B?REN1eDRYZUhHUVhpeXRmMjFYZEFubjF0dFo5WGtxbndSQ3FXQjBDNU5iRmU3?=
 =?utf-8?B?YzY4QWloaG85K3hYTThxUDNsNlgxOGh1M3FMK094MmQ1WitEL2dEK3J3ais3?=
 =?utf-8?B?Uk1xdk9FdmNCNk9DVG1icms1NGd5RU9lOW5BN2lCc2t3eSswc01YSnZYekFn?=
 =?utf-8?B?MHpZWkJreEE5cWhHdDJlbFZRWGt6WjAwbW5OaFhsSjNJTUtBaC9OdlhscVoy?=
 =?utf-8?Q?QJQ56z8fD/O48YceMqFejIy7w?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d04c02-7acc-4c31-2004-08db29e800a2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 08:41:02.6427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMr63EQPnu83WrrrKisgJbYg+XGUYbsJqhFfAwMraGPu+ltMBho3fpVF30owkKaf1vNO/gm3aburuYnmaL75EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7747
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.93; envelope-from=fei2.wu@intel.com;
 helo=mga11.intel.com
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
X-List-Received-Date: Tue, 21 Mar 2023 08:41:13 -0000

On 3/21/2023 4:28 PM, liweiwei wrote:
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
>> +        } else {
>> +            for (int i = 0; i < env->sum_u_count; ++i) {
>> +                tlb_flush_page_by_mmuidx(env_cpu(env),
>> env->sum_u_addr[i],
>> +                                         1 << PRV_S | 1 << PRV_M);
>> +            }
>> +        }
>> +        env->sum_u_count = 0;
>>       }
> 
> Whether tlb should  be flushed when SUM is changed from 0 to 1?
> 
When SUM is changed from 0 to 1, all the existing tlb entries remain
valid as the permission is elevated instead of reduced, so I don't think
it's necessary to flush tlb.

Thanks,
Fei.

> Regards,
> 
> Weiwei Li
> 
>> +
>>       mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
>>           MSTATUS_SPP | MSTATUS_MPRV | MSTATUS_SUM |
>>           MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
> 


