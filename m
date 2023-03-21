Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1peafq-0001mg-G4
	for mharc-qemu-riscv@gnu.org; Tue, 21 Mar 2023 08:01:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1peafY-0001cz-QE; Tue, 21 Mar 2023 08:01:02 -0400
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1peafV-0006pF-RV; Tue, 21 Mar 2023 08:00:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679400045; x=1710936045;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n+CVCjMJEmBRK1uWpEgHzlSGRZG4G1WRjXFHWuTFJDM=;
 b=b/JY8gvsGqpL22ifnHXHqgp3zRNcYydlHYbtLwqvhZWIk8fzDrYh3gNl
 KfObBZhd4PswQQPqWftIawuN8veSSg7K077iOqlIvuqaj5HdejfOG6inH
 gFpM735VIAaIYrj9nZWGoFS54GudjnMiKpgC7g0IHqhj0cyGIjceHkcMi
 QG0DcY5fOA0nH+vPqGnzZitDiRbEFLy7QEkhGKiVKdMeWEt0tGUabPAYs
 ReEScJG4zR0wG0PGQ1NWptlqb0bjtnNSbIJZhJsAghZfLSMuiuVMiGNbG
 NbbmQB5FQ/sCsB9ExE/EIpcqCHbEPtERArznj/Cjlbrl0BlIZcy4sjF8z Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="327295110"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="327295110"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 05:00:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="770600744"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="770600744"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Mar 2023 05:00:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 05:00:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 05:00:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 05:00:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/3Kq9m4G7vfEyoiH21Ihd1TNp3yEPnaOWobj4b8ipSts8PGBBSmbyWmAkPtvuw8ZUqkg3MF22LWa77/GvbjOTAg+WRSs9m2pXp98ioUNMTsSGQQ3dviLtt7uo4X8k2/jrGLfXbXmoK9d+K1wp47LbE20rRcOgHX+1uOfsqZSDhI3qxvVoSKCD/AFbyGmNG1wB2IxjDswh/izXXoQy22gzkU9xKYIv7iR8u1kBIxSOZTsamqOdIgMj/s+jeV9OhikYyQaaYDyQ4EkGs2wg2kFqc6bIUv7xRkteKo2K/qt5WuL9/HZJcHQJei22ij7oKai5onwT8tXLtnBeRkE5NtSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Hso4fAr06CYiXsvtitIrhRm8Ah28Kn/EpKGjD70WXY=;
 b=aPQ73Jp/sSEp9p/j/OTdLT5VvpV3vCbCuk/i+gyxLMlWPcRkxOkLeydPzKoW/LW13wJPCNsG8ELYr99WEbjjLPzwcyUTWMGCsRT+A9DVohEXea6DdWY1ArVKhAAjkzCp10bRNbfcT0l7jpDCrGPYGPnqU6jh+FiQ01dFXOMODAwGh7IbJcw8GZc0eRNP9yy5IX9nTtC/H3hQ079OB0B0JzK55F5lWrrwI7SN5uf781LGDcWUHopv5Hk+h6hEKI3YfjCI2oOlJ9BN6HTpExtDmyFF91xVx90OaDcn/pmMow6b/uWPJH6qg2tabkgWHZWYXFX3n1KhEb4SsdJvJ4vG6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by IA1PR11MB6074.namprd11.prod.outlook.com (2603:10b6:208:3d6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 12:00:27 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5%4]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 12:00:27 +0000
Message-ID: <84fecc21-4fba-ace3-c55b-316257d195a7@intel.com>
Date: Tue, 21 Mar 2023 20:00:17 +0800
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
 <ddeaba54-e9fc-0309-4f35-7ee72052264d@intel.com>
 <8029cbcf-520f-cfd3-5b5a-923685a1da80@iscas.ac.cn>
 <5e358d79-76be-b230-194c-a25ffad324c2@intel.com>
 <bf1b2b8f-66cf-5f22-843c-f9a7fbf29d99@iscas.ac.cn>
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <bf1b2b8f-66cf-5f22-843c-f9a7fbf29d99@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGAP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::20)
 To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|IA1PR11MB6074:EE_
X-MS-Office365-Filtering-Correlation-Id: 51461ce2-d0ee-4092-dbfc-08db2a03dbd3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: edDGQzfp/nNls+pGITZUBwV6aeAuEMvF8GYifws1VD7mfXE46FPNZwUKvKI9vy2Y0yK5soi84LYSn5LCTFQgTIIqvISASdHf3fEELOZ5F0/BY0o4hJ0F5Zi54wg3symQgyc68W7j61q90Z8A6oOw46TvOYWnYsokymUW8eJWBmo6WFE24x0WIMjlakh9uAQr3j4jVRswFRlqdLIGTk/UD06XfexSC1B+v0LNZeLdJ6GG5hruF/xz0rQev5YVi4ierbcUi0KxUiOAy2wxS/rY8NxTjtcUwAWEaQ74AsUTOZhk+Lc4t9gw2jQveCAwgdoqck1WF/hDL1k4EAcAPTPNXo+if6F9pI6jnTnycyWUhTnaxOGqmBmrLwghDUKbXHOGTdwxvDrZ22zWbRmCq68hjzgqQkiWp/dpxlIGGQMpUo5JdnpzvkGWIb/opCEWsD8AnWIGPUjUXdR6akFFQnQLEO5BUu+lCOk6RxWGih2wx7wuc98/b47YyEzQ+FgB7sDOlfULclhcYJFWoe24kGmBRpnVk+M3dL6d6Y4hyRhtD2qWrQ6lfYUQdPkW8WQJ//3cHYbnTtx1up3BYKuGXrDyF9Ow7HU6lny8VoSOCAJC5DC8C+LzTCkLGzBN8lPijO6en52pBkQNrVhssxsQ0lgyVd4bz88ItEYVmunHwi0XdzOJBVEetQ6JhUHCk0zX5O4NjJEQhywOwR/eonq6Pa+fdwTd5hpbBuHVPdqueqeZACs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(366004)(39860400002)(376002)(136003)(451199018)(31696002)(478600001)(2616005)(2906002)(82960400001)(66946007)(6916009)(66476007)(4326008)(83380400001)(8676002)(8936002)(66556008)(41300700001)(36756003)(5660300002)(86362001)(54906003)(316002)(6666004)(6486002)(26005)(53546011)(186003)(6512007)(31686004)(6506007)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUF2TkUzbzYzeFoxOFIydE1Kb1FlSGF1bHowa3NBdjk1SmJSZmEvL3NvellN?=
 =?utf-8?B?RVRGMGRGVktWdVRMQ0lCdHp0U0drSGpwcHJCWU5BTXFpcng4NlVhM1JLcFBE?=
 =?utf-8?B?ZnVRUVlSYUQ5eGZramVGVmdsN1BjbkVLS0M0K0dkM3FodHNTZnZrei9nQnYv?=
 =?utf-8?B?dmlqaStSSmk4NFVMMEVyU01yTUt2OStLa3lwdE9pT1lrd3MvZUtZOE5ENVFo?=
 =?utf-8?B?ZDhzZnB6THduRjB6VGVyWkh3WFJ0YU1vY1B5Q0RLSTVFUVBQNWo5VjdqcG85?=
 =?utf-8?B?QWdmQ29XdGlPZzd5K1N3OU5DN3M1TnVhYVZ3MVhhdlpoeXFLQ0g3MjVMVEFS?=
 =?utf-8?B?Ty9Gdi9vRFZjZ1dKZDI5UksvTGI0ZlEvSzZvZzEvVmkwa1IzZndIUlFkUzVW?=
 =?utf-8?B?anlhbTNMYXowNVl5Q0VtQXhNOFZQTE1iNUIzOUIrckN0OWJRR3dwWnJORXc5?=
 =?utf-8?B?TTRKWGtITDk3VzUwYi8vbzdUVjhhR0o5RmJJTkNGbnVRMkVCVnhvaFpXdVI4?=
 =?utf-8?B?ekwwYXVWOFdGVWo0Wk9DamVWK0JrdzR4bndObG9jWXYzNk9FSkRESFdCNDhj?=
 =?utf-8?B?b2ZzRnh6SGNaZGxqa2lYbXYvOGluWEF0Z1o1WUEzQ090N0wxVmlhYk4xZTdO?=
 =?utf-8?B?cHdqaEEyMU1xdUEvTmZsSzYzUGQ5bUxMdHhhSDlFN1V1Wjhhbi9RV0VRa2lr?=
 =?utf-8?B?UDNvLzZ5S1YzZ3A4K2I2dXdXZmFaWHNUSjRCU1l1SWl2ZTE3aE84cStJMTJj?=
 =?utf-8?B?ekRDQS83a1pCektxMDNiNWk5QkRUYm9SM1RhZUtFNUZnNWU1WmhwQjNYSTlS?=
 =?utf-8?B?cUtIMWxnWDQ3MmtMbUZMV0oxL3lxSzlVWjhCTXVCcGpmZlFidHFTREdsN01B?=
 =?utf-8?B?RWx4Y2p6TlRocVhpaHY5Z3hWek5hSzNUY2xsRHV5dDY5VUNFRUxGbVpQNjM2?=
 =?utf-8?B?ZGtXN3FESXN4RVFRT0pScVM3bWRHY1NIalM0SWQrZW5LNDB3bjY3MjRIeS8z?=
 =?utf-8?B?Y2RXNVArWkNZMjBTQXNxNmlsemE0TGNMQ0w0SUgvUGlJUHo5WjRDNmdya2Ji?=
 =?utf-8?B?T1lLVmRWQ3lob1dEV2kxZTlaSFhBeEFZVWE1RjJjVWRsTU9CZTRQQ1RVelFK?=
 =?utf-8?B?b2FsTkZxaDN5NlAyTHJEUlNlc1NQSUhPdjQrY2YvbXFkdUkrMXVpUW9Mak92?=
 =?utf-8?B?WGNDVXdRd0VrVXdSVHZZdVBGUVlzT1MrcGE0bHRtZVVDWmJ1VVBQeFVIbG1r?=
 =?utf-8?B?SmVNSWQzQlQ2WTRSR2NNZXIxVjdUU1M2TzcvZjJOYlVlajVJcllKVjFwMGxW?=
 =?utf-8?B?aGF5ODAwNHZsMW1Zb2tYOUR0bmx6U08xMUQvWURnYmdlZEtkQ1l5bzR6Yzg4?=
 =?utf-8?B?Wkd1YVpCaGVYeHQ1RitieHFZbGQ5M2tYTkxJQVl1MDlMblVPYjltOHlUUU91?=
 =?utf-8?B?bjY5eXdSaWJoYkk1NFN4bFBtS1dyMWphd3EzdkdtQVFMV1g1MkdiY3hFcDFY?=
 =?utf-8?B?ZjdTMTNIbjZtZWIwaTV1V0F3RmVGQUhWMlkydDJ6d204Y3ZNNEpLcXNublVQ?=
 =?utf-8?B?STlJZFJrVGo1SzVRRHArTyt2MkhCZzJoU1VicHVaYWllMHZpTFdIVk1IVnZ3?=
 =?utf-8?B?c3FNT0NlNy9YWkJxVlpOaWEyZ1IrQ0Z4djhzdjRtcHN0WnNJdnhQR1RqWHFt?=
 =?utf-8?B?UUN1NmJidmFyT0ZtbzJNejJETVhic1B4QVVTVytjNmNaWDduWDJBTUpXUVdX?=
 =?utf-8?B?b2thaVpTM0gyQ1RpMmpJM3hueE5DeVlNSE1QUE0rZzdneHhQelhsTkxVSmdO?=
 =?utf-8?B?cFEvTkc2SXhuR3RLV2xyZVZZYkRHR0JuY3JleExXQjMrSDZxdWZ2dkRUZlEr?=
 =?utf-8?B?ZXB4KzNLOXhGQW1KRUhtdXVqWE1SSkg0eEdMbUV2VkFZOWdqWVQ1TURpbDZ2?=
 =?utf-8?B?ZWpOS1hCellHalFUTEFWSHFkL2RLRnlteW83WnNiY1J2ZFpoMUcxa2pMYUI5?=
 =?utf-8?B?TW9pTUF5RW9BcXJpbmNESjBkRWNtL21hQ1pIUmgrRDhvNlVPYVh2dVJyT3d2?=
 =?utf-8?B?dzViT1dOMWoyTXVxTldMUHZZbE9UZkJsTEROS2tTa0t0NGxHS2JDSGZTcUVz?=
 =?utf-8?Q?mb1h1PEQH9+GzypmibhQWAicg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51461ce2-d0ee-4092-dbfc-08db2a03dbd3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 12:00:26.8638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SrHmrpTyZZYMjScXAChkx2uN9abY97r7lvwLeAHKKOzaPOnaeiEaPuMBHAvsNjwKChTCuSTT6RAyrvsOurYThg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6074
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.20; envelope-from=fei2.wu@intel.com;
 helo=mga02.intel.com
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
X-List-Received-Date: Tue, 21 Mar 2023 12:01:03 -0000

On 3/21/2023 5:47 PM, liweiwei wrote:
> 
> On 2023/3/21 17:14, Wu, Fei wrote:
>> On 3/21/2023 4:50 PM, liweiwei wrote:
>>> On 2023/3/21 16:40, Wu, Fei wrote:
>>>> On 3/21/2023 4:28 PM, liweiwei wrote:
>>>>> On 2023/3/21 14:37, fei2.wu@intel.com wrote:
>>>>>> From: Fei Wu <fei2.wu@intel.com>
>>>>>>
>>>>>> Kernel needs to access user mode memory e.g. during syscalls, the
>>>>>> window
>>>>>> is usually opened up for a very limited time through MSTATUS.SUM, the
>>>>>> overhead is too much if tlb_flush() gets called for every SUM change.
>>>>>> This patch saves addresses accessed when SUM=1, and flushs only these
>>>>>> pages when SUM changes to 0. If the buffer is not large enough to
>>>>>> save
>>>>>> all the pages during SUM=1, it will fall back to tlb_flush when
>>>>>> necessary.
>>>>>>
>>>>>> The buffer size is set to 4 since in this MSTATUS.SUM open-up window,
>>>>>> most of the time kernel accesses 1 or 2 pages, it's very rare to see
>>>>>> more than 4 pages accessed.
>>>>>>
>>>>>> It's not necessary to save/restore these new added status, as
>>>>>> tlb_flush() is always called after restore.
>>>>>>
>>>>>> Result of 'pipe 10' from unixbench boosts from 223656 to 1327407.
>>>>>> Many
>>>>>> other syscalls benefit a lot from this one too.
>>>>>>
>>>>>> Signed-off-by: Fei Wu <fei2.wu@intel.com>
>>>>>> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>>>>>> ---
>>>>>>     target/riscv/cpu.h        |  4 ++++
>>>>>>     target/riscv/cpu_helper.c |  7 +++++++
>>>>>>     target/riscv/csr.c        | 14 +++++++++++++-
>>>>>>     3 files changed, 24 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>>>>> index 638e47c75a..926dbce59f 100644
>>>>>> --- a/target/riscv/cpu.h
>>>>>> +++ b/target/riscv/cpu.h
>>>>>> @@ -383,6 +383,10 @@ struct CPUArchState {
>>>>>>         uint64_t kvm_timer_compare;
>>>>>>         uint64_t kvm_timer_state;
>>>>>>         uint64_t kvm_timer_frequency;
>>>>>> +
>>>>>> +#define MAX_CACHED_SUM_U_ADDR_NUM 4
>>>>>> +    uint64_t sum_u_count;
>>>>>> +    uint64_t sum_u_addr[MAX_CACHED_SUM_U_ADDR_NUM];
>>>>>>     };
>>>>>>       OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
>>>>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>>>>> index f88c503cf4..5ad0418eb6 100644
>>>>>> --- a/target/riscv/cpu_helper.c
>>>>>> +++ b/target/riscv/cpu_helper.c
>>>>>> @@ -1068,6 +1068,13 @@ restart:
>>>>>>                         (access_type == MMU_DATA_STORE || (pte &
>>>>>> PTE_D))) {
>>>>>>                     *prot |= PAGE_WRITE;
>>>>>>                 }
>>>>>> +            if ((pte & PTE_U) && (mode & PRV_S) &&
>>>>>> +                    get_field(env->mstatus, MSTATUS_SUM)) {
>>>>>> +                if (env->sum_u_count < MAX_CACHED_SUM_U_ADDR_NUM) {
>>>>>> +                    env->sum_u_addr[env->sum_u_count] = addr;
>>>>>> +                }
>>>>>> +                ++env->sum_u_count;
>>>>>> +            }
>>>>>>                 return TRANSLATE_SUCCESS;
>>>>>>             }
>>>>>>         }
>>>>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>>>>> index ab566639e5..74b7638c8a 100644
>>>>>> --- a/target/riscv/csr.c
>>>>>> +++ b/target/riscv/csr.c
>>>>>> @@ -1246,9 +1246,21 @@ static RISCVException
>>>>>> write_mstatus(CPURISCVState *env, int csrno,
>>>>>>           /* flush tlb on mstatus fields that affect VM */
>>>>>>         if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP |
>>>>>> MSTATUS_MPV |
>>>>>> -            MSTATUS_MPRV | MSTATUS_SUM)) {
>>>>>> +            MSTATUS_MPRV)) {
>>>>>>             tlb_flush(env_cpu(env));
>>>>>> +        env->sum_u_count = 0;
>>>>>> +    } else if ((mstatus & MSTATUS_SUM) && !(val & MSTATUS_SUM)) {
>>>>>> +        if (env->sum_u_count > MAX_CACHED_SUM_U_ADDR_NUM) {
>>>>>> +            tlb_flush(env_cpu(env));
>>>>>> +        } else {
>>>>>> +            for (int i = 0; i < env->sum_u_count; ++i) {
>>>>>> +                tlb_flush_page_by_mmuidx(env_cpu(env),
>>>>>> env->sum_u_addr[i],
>>>>>> +                                         1 << PRV_S | 1 << PRV_M);
>>>>>> +            }
>>>>>> +        }
>>>>>> +        env->sum_u_count = 0;
>>>>>>         }
>>>>> Whether tlb should  be flushed when SUM is changed from 0 to 1?
>>>>>
>>>> When SUM is changed from 0 to 1, all the existing tlb entries remain
>>>> valid as the permission is elevated instead of reduced, so I don't
>>>> think
>>>> it's necessary to flush tlb.
>>> If elevated not unchanged, I think the tlb also needs update, since new
>>> permitted access rights may be added to the tlb.
>>>
>> Assume the following flow, if the new rights have been added to tlb
>> during SUM=0, they're visible and still valid after setting SUM=1 again.
>> Could you please add a specific counter example in this flow?
>>
> Assuming addr0 cannot be access from S mode when SUM = 0, but can be
> accessed from S mode if SUM=1,
> 
> and there is a tlb entry for it when SUM = 0
> 
>> enable uaccess (set SUM = 1)
> if we don't flush it when we change SUM to 1 in this step
>> ... (access user mem from S mode)
> when we access addr0 here, tlb will be hit( not updated) and the access
> will trigger fault instead of allowing the access
>> disable uaccess (set SUM = 0)
>>
>> ... (update TLB_SUM_0)
>>
>>      <-- flush tlb or not right before enabling uaccess?
>> enable uaccess (set SUM = 1)
>>      <-- okay to access TLB_SUM_0?
>> disable uaccess (set SUM = 0)
> 
> So, I think the question is whether the rights in TLB entry can be
> elevated. Or whether there is legal tlb entry for this addr0 when SUM = 0?
> 
I think there is no such tlb entry:
* If it's loaded into tlb when SUM = 0. This is impossible as it's not
accessible when SUM = 0, it's a fault instead of being loaded into tlb.
* If it's loaded into tlb when SUM = 1. It will be flushed when SUM sets
to 0.

Thanks,
Fei.

> If not,  all my above assumption will not be right.
> 
> Regards,
> 
> Weiwei Li
> 
>>
>> Thanks,
>> Fei.
>>
> 
> 
> 
>>> Regards,
>>>
>>> Weiwei Li
>>>
>>>> Thanks,
>>>> Fei.
>>>>
>>>>> Regards,
>>>>>
>>>>> Weiwei Li
>>>>>
>>>>>> +
>>>>>>         mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE |
>>>>>> MSTATUS_MPIE |
>>>>>>             MSTATUS_SPP | MSTATUS_MPRV | MSTATUS_SUM |
>>>>>>             MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
> 


