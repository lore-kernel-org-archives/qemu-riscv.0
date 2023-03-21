Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1peY5Y-0000Io-Nh
	for mharc-qemu-riscv@gnu.org; Tue, 21 Mar 2023 05:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1peY5W-0000Gg-Cn; Tue, 21 Mar 2023 05:15:26 -0400
Received: from mga07.intel.com ([134.134.136.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1peY5T-0000jU-RS; Tue, 21 Mar 2023 05:15:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679390123; x=1710926123;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8pPH76yu07djS9plpg5AtsYku+mLe3vetUjFIoXv/rc=;
 b=M3HsoHTOaODyOI7LOWKwyNW7ZSp37BlkdGBO3epb1ERRtPlKFGq3gG7h
 FYyujDDaYfMRy1Jim5jIUQPmY6hh7Ix5il2AuZM0xMI96B4kk3HhsQPyr
 9vGERo6eFcQrp2B8bcv1F+RO+2fAcjRsS7PNjhdFW3zLmtIQvminENZ+A
 Z6rcZ1tOLufW7UeJ2wYQcfnITChoca+Gn3xQaZIa5v5tk/W1jL60lXaY6
 wuQMPbk402rfxDpwN+0nrzZSVSQXRUO3Vn2ZsqxbIsJM3pY0yzxxeLGat
 tKVWYZycd3gDZ8TJ4lWKFDf5HBMnXHmTnNpjISJViq+DzHOf1dra2K1jw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="403762983"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="403762983"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 02:15:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="791996699"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; d="scan'208";a="791996699"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2023 02:15:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 02:15:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 02:15:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 02:15:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBF+ryDC0WgreT5a1NBOqRtqvioKmLRvJ07Us6EEvzAyKQ5D6kRsrT/A7S9tq6BLrEeS6/g7d/bJZ0ECdj5O0aZaEq8u9elhsqFCvPXoH7v1lJrWkYfv014H5AFvG/QyFoMDF77QF3VAj0m3tkCxCpayC+cYVmLCF1M1JYa8ZosTm3fIKZhJd0WTNy8Hn6WHT+I/D+4EXrjunShKRmvrmc2DY20JPI314vzo4q69ywqPLli030IlY56RvpTpowqNIxgfe5n6LhwMorHWgxFWyY38eDSnPzFuB9zmA10bQU5pKRURts28BWBMkKJDA+kzOyjTw2Ba3xas9Cu6AzAnrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4UxbAPi3dO4BzDg9FHgkKpBuhPWf/qX6BtC83l5QDw=;
 b=Gjw9ejEjf2saty3uw3iBJBJXUnTOeByd1AAcgrfDk//gJgODDI6H2XG3YQra/7eCtjpoxT5A7UwCsCivYNWJD0dJRFpKaTZnXd0qoW4Bscm7IBxDQW7Q63tkcn4D+GkRxAOsH13J00C6TOTjtbYpsuM8tnxA7AQh3X1hyciLhAUWtmXS+vLpYzjvgvH2hUwa3qqOp5Ku/RKS2FpnLn1XKWaaL5tD2IrYNFHBJU4i1dzW+vN2DUc9NOVMPLnTd0EdAjIm5z0A7g2RkK2xVHsx9titUZinGxsba+lvZ9IFdkpCQTS2gXrTBNx4p1tmmk8bZdw5GbSrY8vAvdzYkeYp9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by SA1PR11MB6760.namprd11.prod.outlook.com (2603:10b6:806:25f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 09:15:07 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5%4]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 09:15:07 +0000
Message-ID: <5e358d79-76be-b230-194c-a25ffad324c2@intel.com>
Date: Tue, 21 Mar 2023 17:14:56 +0800
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
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <8029cbcf-520f-cfd3-5b5a-923685a1da80@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR03CA0088.apcprd03.prod.outlook.com
 (2603:1096:4:7c::16) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|SA1PR11MB6760:EE_
X-MS-Office365-Filtering-Correlation-Id: 578cab6b-ca23-49c6-e2f2-08db29ecc345
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3WzcC2g00JIp/Sd6Whuk6cmONM1oVa4rujAXnMed1f2JSN2S8Zm5RnwIN6qS2cWjHZV9WhqxnJR25U83lZXz9iZh092JBPh8cpeKg0n2bFTJC+iojkNouG/I6uLgsWGYy/OJKXf7tgD3PsdKGTcGpl4I7CyvO3n7kRJZjJpq3pEFbDRUPlZw5klhtLKUe9dBoQc+80IppzBO8AXmXDlsYpMXMvDx9jVYf/JBVOzEqq6b/ujkqh/vqct8p59h4ThXtjyK/JrZfWoJGUnIOJVYjTgf9C17rjEcFkvC1HxgCd0ZzLkpHS9XRqrNpSt9OCa7Y5lkk4SfP5DRO6VbC3dt6PMM2FMJq2IWvuMDN5bsF2qQBJ3LKqDqg+UXeqba0khr1jDlmkPVeQ5SOhepRUw/R1jbyZrCuuZTrp0RQ+m7AG2ZFiVkrpglCFTnd5SU9wwbnNdK01WLjbgZOZ/UI63hVAapogjonm3do7+xQ1zHi0quU/T8N5tfP9HbyYQfCoqSVHJYzfdilTSFfIrPH0TihJmBwtYbGY1U+Jp/g+hNZmM8UlZdnNlbrHv0RlZdjAPhzQaYzwTn0GRXYdCylHlAs3z3K9cqDJYmh8CMKZIajB1Ph3ehLdw5eqxYxAxWXShbSbFSKxPuUdK8fW6Gim54XTu/pq7+yxf0d/aKNfxSMCRHRz6s/qs7qkvGC8wpL501U96uUdtyLjyl0tJQ222exCWuMGZj1i1N7qhT0y/38dk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(396003)(376002)(346002)(39860400002)(451199018)(6666004)(478600001)(186003)(6486002)(6506007)(83380400001)(6512007)(26005)(31686004)(53546011)(2616005)(316002)(66946007)(54906003)(66556008)(66476007)(8676002)(6916009)(4326008)(8936002)(5660300002)(41300700001)(82960400001)(38100700002)(2906002)(86362001)(31696002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWdkREFqUytEenByRWQ1Wk1ZY09RYVF4OEprcFZPY1NUSjIxV3RUTUtDaVlm?=
 =?utf-8?B?SlVHTlkvc2NPSTZMTmR1UW1NTFBBbUJUbjhDWDdOSCtoUjlDZWxWSkZETVNt?=
 =?utf-8?B?c294VHU4QjQxSGNsWVRlOXVnN3k0TG5zbjhFZE1vRlJJZFNlamNJWU9HWlZu?=
 =?utf-8?B?a3F2UFJoTkVYREhPUDduckppSzJsVWJXQi9xYkN5YUZCUTk5S2pTMFRRT3Rj?=
 =?utf-8?B?T25OZjFzc2Y0UllESWQzOTZpcUpqamJPRnRra2tQS3hVYzBXcG1xayt4UzFy?=
 =?utf-8?B?cTBheXZQOWlSaGZkdlQzcks5bHNkUE9xZWMrdFEyd245U3RMRldobDZ5SUVB?=
 =?utf-8?B?YmtET24zcWJKSjRaa1BxNWp0WnFyTzEvWVh6bTgwa0dGeGlXVFdvQkdVbjBB?=
 =?utf-8?B?VVJ2ZW4weUNJWXVyZGZiNG1ackVkM2x4bWVZT0ZneHJsL21QSWErQXBsWnFC?=
 =?utf-8?B?QmRTMmlIY1Voa1Y1emlYeTRoa3dMcWZHdVFxcFNBYVJIM0ZvUFdLVlFja3Zm?=
 =?utf-8?B?dTJHQlh6cXBvNTBiUlQrakwvV0VqRE8xdFA2T2haUzFCMWIvazFwWktMYWNB?=
 =?utf-8?B?b2VOcGhNVkcxemhvZFpzYUxWYnJtNGZvSVNGWmVGOVE3ZERqVEZPc3lqR1FR?=
 =?utf-8?B?SHFOY0ZqM2NOYVJBT0VUVFVBZmM5TjVUY0pkVTY1SktFcGVvQ1VaRGZ0Z2VL?=
 =?utf-8?B?TUdTMTlOTk5LckRVcTJDNzBlOGhuZncxSVlZMkhxS3I3NTk3eVZxRlFrSWk5?=
 =?utf-8?B?MkNRVnRMYXFOWW05WW9VOXJlVHZjY1lnSGZhM2xUTktNK1ZpU1hna0psbDJz?=
 =?utf-8?B?NVJPUDdrS2JMSUxNcjBPODN3Mnl5RnNGa3hSTFB3djVnbmRFcHJoZm1ob2lW?=
 =?utf-8?B?Zi9zalVUQW1FODhGcTdnWU1XTkxuemNBVld4TFd6REZ6RVNUV3NIeEhodE9C?=
 =?utf-8?B?cHBRSys0eXNjaDFIMHkrL2Z6NGNUeUFEY25hZWQ0SWYxY1hIRFU1Z1RxV25N?=
 =?utf-8?B?NXFNVmdSSTZzbzBuRGNVZlA2ZXBSdnkzRmJQVnl4OXZsZGhnQklOMTlkMHJ2?=
 =?utf-8?B?QmNUaTRKK0pYNlhBU0NOVUhzK0FpeTVWWEFyeEREeWdOZDVrbmxBcGZ2cWdM?=
 =?utf-8?B?SE81MkFSVWVFZVN5SmU2TUpmK1FEREE1c3FmMUFaeVg5MEE0YmZUWk1aR2l2?=
 =?utf-8?B?NFEwTncwZXZETm4zbktkTEU2SE9VcHhEdWlDUlNCU1pTdWlWSmZDS2lqU0lh?=
 =?utf-8?B?bDdOOE5tNlBzUzJOZUFlS2dyV0syakxOeFNWeHBMbmFYTHhrN1MzN2dCZVhx?=
 =?utf-8?B?dmN5d3hOMXVkbXFrMnJ6YnVET1I4ZVZQZzlIdERKTk1FeUw2UTNCSU9KQytS?=
 =?utf-8?B?b3ZBa1QvWm9KdE51VG52dllrSWMrcUtMYXd2Q3ZkK1B5enh5OU5pZFpVSDVr?=
 =?utf-8?B?OTE1QzFyY25FaWd3WnpDUmNpQUg2b2U2ejQyL2w3bG96UjgxRS9HQmhZK2d6?=
 =?utf-8?B?czB6K1pVbjJhZ3gzeCtNaUhKdXZVMDNDb0Q3ZjBFN2JxOUppZGxScVBlNlFj?=
 =?utf-8?B?UVV5RjB5NGRkZXhxTnkzcUcza0NNR0ZRTU9acSswdWxlMUIycmJKWjdmZlV5?=
 =?utf-8?B?UDF3MVUyWlNKU05DQUxjdUlOSFFCMWdpYlNSY21SbktMWEV5Z3haaGhWQm5I?=
 =?utf-8?B?ekRYMDkrMmlEZ0RkZkc3UEVQNHJWWXJEQk1DMHNveElicVhjdnNvbWxKRThw?=
 =?utf-8?B?RVBST1lUNVpVdndOZFZuRkNQekNGVnJXeUJQL0JMSldLd1QxM0R1V1B2MGdw?=
 =?utf-8?B?cDE0WitlSjRqZGJySUJRa2hwcmFoSXJNSFZvQTFDOFN2cUtTcGF1bzMvSXdD?=
 =?utf-8?B?ZytCSFkwM2tLWXpuTjVGak40aWxqbWU0S3J6UWRxUU1UZGlRWGxFbVRiQ0pi?=
 =?utf-8?B?VFp0NzIvakFRTEd1QXlicmxGYmZ2Z3lLbnlWZWZQZUtRdEY4NXhacmNVVG9r?=
 =?utf-8?B?clpzYVpqTFRzNGE3OHUzZmE5bkROQmwrbGVibm9KQnhoS1pyVHhOOTNoSFdH?=
 =?utf-8?B?Q25sNmU5WnNxa3NpNjhkNUNwOTgzTnJyUnN2VFl6Sm1SZ0txVzVmRnllNjdV?=
 =?utf-8?Q?nggjTpglkGxexfucLG8xXRgpK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 578cab6b-ca23-49c6-e2f2-08db29ecc345
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 09:15:07.1964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1z4dT6WfU9JRHkQvZoIDL6pYRrn9u+6CxVwf2zfe7aCA8ykqOMEvvjzE/s1Hl48/TG4j845XWReKdygooelDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6760
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100; envelope-from=fei2.wu@intel.com;
 helo=mga07.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 21 Mar 2023 09:15:26 -0000

On 3/21/2023 4:50 PM, liweiwei wrote:
> 
> On 2023/3/21 16:40, Wu, Fei wrote:
>> On 3/21/2023 4:28 PM, liweiwei wrote:
>>> On 2023/3/21 14:37, fei2.wu@intel.com wrote:
>>>> From: Fei Wu <fei2.wu@intel.com>
>>>>
>>>> Kernel needs to access user mode memory e.g. during syscalls, the
>>>> window
>>>> is usually opened up for a very limited time through MSTATUS.SUM, the
>>>> overhead is too much if tlb_flush() gets called for every SUM change.
>>>> This patch saves addresses accessed when SUM=1, and flushs only these
>>>> pages when SUM changes to 0. If the buffer is not large enough to save
>>>> all the pages during SUM=1, it will fall back to tlb_flush when
>>>> necessary.
>>>>
>>>> The buffer size is set to 4 since in this MSTATUS.SUM open-up window,
>>>> most of the time kernel accesses 1 or 2 pages, it's very rare to see
>>>> more than 4 pages accessed.
>>>>
>>>> It's not necessary to save/restore these new added status, as
>>>> tlb_flush() is always called after restore.
>>>>
>>>> Result of 'pipe 10' from unixbench boosts from 223656 to 1327407. Many
>>>> other syscalls benefit a lot from this one too.
>>>>
>>>> Signed-off-by: Fei Wu <fei2.wu@intel.com>
>>>> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>>>> ---
>>>>    target/riscv/cpu.h        |  4 ++++
>>>>    target/riscv/cpu_helper.c |  7 +++++++
>>>>    target/riscv/csr.c        | 14 +++++++++++++-
>>>>    3 files changed, 24 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>>> index 638e47c75a..926dbce59f 100644
>>>> --- a/target/riscv/cpu.h
>>>> +++ b/target/riscv/cpu.h
>>>> @@ -383,6 +383,10 @@ struct CPUArchState {
>>>>        uint64_t kvm_timer_compare;
>>>>        uint64_t kvm_timer_state;
>>>>        uint64_t kvm_timer_frequency;
>>>> +
>>>> +#define MAX_CACHED_SUM_U_ADDR_NUM 4
>>>> +    uint64_t sum_u_count;
>>>> +    uint64_t sum_u_addr[MAX_CACHED_SUM_U_ADDR_NUM];
>>>>    };
>>>>      OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
>>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>>> index f88c503cf4..5ad0418eb6 100644
>>>> --- a/target/riscv/cpu_helper.c
>>>> +++ b/target/riscv/cpu_helper.c
>>>> @@ -1068,6 +1068,13 @@ restart:
>>>>                        (access_type == MMU_DATA_STORE || (pte &
>>>> PTE_D))) {
>>>>                    *prot |= PAGE_WRITE;
>>>>                }
>>>> +            if ((pte & PTE_U) && (mode & PRV_S) &&
>>>> +                    get_field(env->mstatus, MSTATUS_SUM)) {
>>>> +                if (env->sum_u_count < MAX_CACHED_SUM_U_ADDR_NUM) {
>>>> +                    env->sum_u_addr[env->sum_u_count] = addr;
>>>> +                }
>>>> +                ++env->sum_u_count;
>>>> +            }
>>>>                return TRANSLATE_SUCCESS;
>>>>            }
>>>>        }
>>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>>> index ab566639e5..74b7638c8a 100644
>>>> --- a/target/riscv/csr.c
>>>> +++ b/target/riscv/csr.c
>>>> @@ -1246,9 +1246,21 @@ static RISCVException
>>>> write_mstatus(CPURISCVState *env, int csrno,
>>>>          /* flush tlb on mstatus fields that affect VM */
>>>>        if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
>>>> -            MSTATUS_MPRV | MSTATUS_SUM)) {
>>>> +            MSTATUS_MPRV)) {
>>>>            tlb_flush(env_cpu(env));
>>>> +        env->sum_u_count = 0;
>>>> +    } else if ((mstatus & MSTATUS_SUM) && !(val & MSTATUS_SUM)) {
>>>> +        if (env->sum_u_count > MAX_CACHED_SUM_U_ADDR_NUM) {
>>>> +            tlb_flush(env_cpu(env));
>>>> +        } else {
>>>> +            for (int i = 0; i < env->sum_u_count; ++i) {
>>>> +                tlb_flush_page_by_mmuidx(env_cpu(env),
>>>> env->sum_u_addr[i],
>>>> +                                         1 << PRV_S | 1 << PRV_M);
>>>> +            }
>>>> +        }
>>>> +        env->sum_u_count = 0;
>>>>        }
>>> Whether tlb should  be flushed when SUM is changed from 0 to 1?
>>>
>> When SUM is changed from 0 to 1, all the existing tlb entries remain
>> valid as the permission is elevated instead of reduced, so I don't think
>> it's necessary to flush tlb.
> 
> If elevated not unchanged, I think the tlb also needs update, since new
> permitted access rights may be added to the tlb.
> 
Assume the following flow, if the new rights have been added to tlb
during SUM=0, they're visible and still valid after setting SUM=1 again.
Could you please add a specific counter example in this flow?


enable uaccess (set SUM = 1)
... (access user mem from S mode)
disable uaccess (set SUM = 0)

... (update TLB_SUM_0)

    <-- flush tlb or not right before enabling uaccess?
enable uaccess (set SUM = 1)
    <-- okay to access TLB_SUM_0?
disable uaccess (set SUM = 0)


Thanks,
Fei.

> Regards,
> 
> Weiwei Li
> 
>>
>> Thanks,
>> Fei.
>>
>>> Regards,
>>>
>>> Weiwei Li
>>>
>>>> +
>>>>        mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
>>>>            MSTATUS_SPP | MSTATUS_MPRV | MSTATUS_SUM |
>>>>            MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
> 


