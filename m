Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfEOr-0002Jb-Kk
	for mharc-qemu-riscv@gnu.org; Thu, 23 Mar 2023 02:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfEOn-0002JG-Pt; Thu, 23 Mar 2023 02:26:09 -0400
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfEOk-00021Z-IX; Thu, 23 Mar 2023 02:26:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679552766; x=1711088766;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/hYFc4cmyX0PSI5PadUQ6EBXH6MLzHXLAOgmgbkGALw=;
 b=Sd5OfRe9AochOypp9f+m8oI9JvoofL3JkNtZEciSktws4IY4FfmMSDOp
 KmRzzce4oMWKraHpPYXlz2S/neYzoBTW+rLvFjrGp9edclo7/Nxsz3Wv3
 AxkaWWCgm8FRgZN6xPSa8F7yVLxf5VL+4XxXHyR4CaTWhX114WKZ6pzoL
 vSo2Kpg5KU2lvvBQAg8yAuW4UB4BTc8i9R4yhFNOLTL8we0dDmrFnOx9H
 pRJ7LI1gf5AjorDFHv8CdXCj88mY3of4wcibDBBcXEMvmhnQXxM8NXKIF
 feGsFZ0HHDa9K5YJl2oDyKsWj1cBemIziYmpFStwXRPn0VkMO2cz2iZ/P g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="401977123"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="401977123"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 23:26:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="684590285"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="684590285"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 22 Mar 2023 23:26:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 23:25:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 23:25:59 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 23:25:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOpDP7MQFeaWQPae4LJY+/tuSrDCSH90c0oHGVYct4FA9BO2MnUYHWl35d66E5eRzY8ddhaPrgqN3CNq9lQn0cpyVwthBrDFtECtMq3BnMSnqsxnzxyBLB3/2HqUEGTFCczMW5YCXQA+1EW+4FjnoyP4BVjstYsPBCKyaHSBI/4joFd/u260+0zsF0e0QXZAZCPspJIUWGPdBYpEHnQCLd1Drm6krlWBG4Lw2JpVKsmMYXc/rimtDwmP2P3ZgbcbpNbuwg/AWVGnz2phL4YyWwV2OsvPvfuPNPwRN3Qt05iNtPHO7nHNbuthrbSbcREmr0dtPVfK0tMPSjKVqsBBKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7FQlo0CU9awcaT7sulUdLhuDGhb5yFmm5YhscEIYI8=;
 b=kPKT0EMjzft8rSYq/M0YHMjIS/Vg5T/eL/VZS+6nMTLiAsBZQ0/OClTGvE1LfDdqp2dc7El4je2W7vNxOnSbClJLcdLO1l4OniDRFSlvRXk23Rp1okdUm343s8jtBfm5d1hB6486VcQh9pJC7WUUIHfWLcfXrRwcRGd0LWoOv7vz0gD4R8DQhpYHNIzaB2/XajX25IKeAyG+e4x4yctRJSNCswKkkgvaTH+G98wHnJ7KhNeX7IcRDRyAYQK8kWaP2U4cnCwrtXMnjhfSzkU4oqMBTB3TqA99ArkONjXdCO2txUboyyJP7T8NwQQGigFyzGRtuktkYyqegrdxC087hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by CO1PR11MB5012.namprd11.prod.outlook.com (2603:10b6:303:90::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 06:25:58 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5%4]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 06:25:58 +0000
Message-ID: <77f5c495-f065-a559-4549-5d2e08a14642@intel.com>
Date: Thu, 23 Mar 2023 14:25:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 1/2] target/riscv: separate priv from mmu_idx
Content-Language: en-US
From: "Wu, Fei" <fei2.wu@intel.com>
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, <qemu-riscv@nongnu.org>,
 <qemu-devel@nongnu.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>, Richard Henderson
 <richard.henderson@linaro.org>
References: <20230323024412.324085-1-fei2.wu@intel.com>
 <20230323024412.324085-2-fei2.wu@intel.com>
 <9423db2e-257f-016d-b404-17d8e5adc0ac@linux.alibaba.com>
 <7db6d615-5ddc-5e1b-1d3c-a85c22e6af74@intel.com>
In-Reply-To: <7db6d615-5ddc-5e1b-1d3c-a85c22e6af74@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0073.apcprd02.prod.outlook.com
 (2603:1096:4:90::13) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|CO1PR11MB5012:EE_
X-MS-Office365-Filtering-Correlation-Id: 641c47b4-6689-492e-1bea-08db2b6776d0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aU5a9kexPlN4ybdP7LllNnLAT+GVUSNsCNF2GFQZSt7rEJO9gqjRbwKOpchRqubGBK8hkUCOHrnz4Dxp3tjjN7Iy6khrYs6hihV88GB3b5A6X97uNQaxXgjrNDm0UcHYNOeEmbTDZ9JlgklNDW/v2YqC2S+r9FADUn0IPHxlBDYoRuS5KvUdWoJGvIeEKX6y+yzSApoWWvQsOAstnDbOrboPNIRno5WhRGm60xaJzFCJ4wuq1OCDViqSghaFL77h8FIAsXCyn2HvhaAi7QlZXRHtEWhxoaRfAd2TXB8ydLrxyTvKLPtN//WSfSDENgl0YAXXWUmQXtbueLXwAf0l3h/KANiYGVBybD6PTjfnZDL9m45RJvCuva4WS0vqRG5UDmyqeZQvSlqX7X82fxZfXq3dt9W2Kd7fq5XFhn3NEhg90pcq5p3MF4YZrATiYc9oPnaPcPnaDg67H6ONq9rnWS/YdOqI7v5HOPhIqSoOxqNpGHxoZ0togW9xcsZo6ntfVNhRtCqU7UO1BqxYjH3nz/AnzWc96Ude4oI5m2vvaFqLN8ADXOhuMkt8Qojbo0SKWJVQUaTJTv0jQJefp/+kMZ7XUDUhuZgfbx/tFN0i/NRYINlHzuwD36SJwQrDiEvDFhk/Z8eTYjvvPpsewacRypywIlUCYBKb6asL4KdGCgZZQoBa4OOEr2EVXda9GYi3xBuvrnZTkV99Sw4WOMwbeZP1aiODZutDH8TiWBoKp3w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(39860400002)(366004)(396003)(346002)(376002)(451199018)(316002)(66946007)(478600001)(86362001)(31696002)(54906003)(66556008)(38100700002)(41300700001)(36756003)(7416002)(8936002)(5660300002)(2906002)(82960400001)(66476007)(8676002)(4326008)(186003)(31686004)(2616005)(6506007)(6512007)(26005)(6666004)(53546011)(6486002)(966005)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUNkcm40Y1d1SDNkY253N01UVG8zbkN3d25VRUJZcnJJTktwWXpvNTRVUXo0?=
 =?utf-8?B?ck1oV2VaTFVNQU1jdUF1S0hNQW5MUktzTjdkTVpVR0pQVFhMTDZBdWZ4S2dY?=
 =?utf-8?B?bHdLRmUwMnhSS2E2aU5Ea3pkb1A2NWVqK3UzNGpCQU9qT0t0ZEpHU1dGRUpO?=
 =?utf-8?B?N3pqQ09NR1pEZzFZT2xEQllqcEZFT0VPb1pVb3BvdmNSSW1PaWJkVDdsYlZT?=
 =?utf-8?B?SVdSemhXdC9HNHRub0NOVGd5WmVqeGNBc3JLaDhGOUd4dkRIM051OTg4ckho?=
 =?utf-8?B?YnNrZzVwOW5Cc21ZbnRMSG9BZGEzWHlvZTRtSTRKODd5djVaU2ROMTVaSzZR?=
 =?utf-8?B?SU5KcXp4emttcGFtdksrWHZFb0Fpb2VsVE4zM2hOZ1RzRFk3VzRrUjR1Rlls?=
 =?utf-8?B?NnJVMUtIZTR1dms2bDMxTGZGYytIcXZrN0VKd3h3dFR2SHE0ZDBKNDhHL0V1?=
 =?utf-8?B?RXg3T0lqYWc4bk10UFpOV2JCa1FZZk5QTkRUSUV3Mm5DYVZQNG1LTnNYWlRp?=
 =?utf-8?B?aVFJazNxTG16OGh5aFR6NGR6WG1EZmU0dUNXdFU2bURSQjZSK2Y5M2ZHL0Fk?=
 =?utf-8?B?U2tXOThOUGJYRHd0TlNHSkM5czlNaXV0NldxNmdqNGh6OVFtTml3L3RiTEFj?=
 =?utf-8?B?bURUVHpXZG4vSVcrbC9MendZYlBJSHZmSFNMZVh2amlBbkdGcUhpSTZHNTJJ?=
 =?utf-8?B?VFBTaEVydDFhQ2VqUlVoay9HMUxMa0RiUU8rV21BNmVnL0lnZ1dqV0I2YURr?=
 =?utf-8?B?MkdmeVVCYXhNUVNCenRoVDQzRnVmbzczemg2M0FNSGNiT3g5dmxCTGNXMjZB?=
 =?utf-8?B?YWVtdUpTMTIwMFNFazR2R3hVdzlmc0VqSXExRG1pZlNLZGp2TlVSd0pxQ0Vt?=
 =?utf-8?B?RUYyR3VlTDBYVGUydWEvbUl1YzVQQkhqRVNkLzd5bEh3MW5mcDdNekJod0Rp?=
 =?utf-8?B?b0xFMVJ2WkpuRHU3OFYxZml3Z2pxQUZYek1ESGNlaER6K1JlRjd0OHRvMFFq?=
 =?utf-8?B?cWxTazFwRjJCYWhYa1RsWXZPbmR3RTZvKzlxQUpWblA3UFdsM3VYejFNdWli?=
 =?utf-8?B?UFpvWGdaSWxKYkdjQ1p3Y2MreXlRRFhlM0w1N0tueXlLRlFCbFZZeWtqVEFI?=
 =?utf-8?B?Ui9Gdlh3cmJxZGh4ZlBwVXhhR2lKYSs3MGpwdE1VTCtlZkxTanJuSVJ5eUY1?=
 =?utf-8?B?V0FKQTdPYlFlVW9vUXRTeXV3Q0lCU3RQbGR1UzQxajlDbW5VZENuS3FlREtr?=
 =?utf-8?B?SS9VK0lFYWJvVWFhR2xDMUlkREZ3Q3NaV0xGOTVtcGJmaXVVc09JWVVSckZr?=
 =?utf-8?B?NGhLdHJxMFNzNG9rN3ROL2FoNWJwOGR3NGxQVW5IamY2NzV4Nk5mNzVTa3M2?=
 =?utf-8?B?eTVEUWl3WVFuYTV4czhlU2JJWEltT2NYUGljNW0yMm9lZjc2RDA1cDVyby8v?=
 =?utf-8?B?QkJ3MUZ3S3E2NjBSNlVyb0JaM0hla0YxaUFKcDZNeFZpS3FSWVVGT1VucWhP?=
 =?utf-8?B?RGtaKzdha05jL0RhdlhCZmg0UEZoajEzS3Zvd2xqY2Rmdnh2ZUhBL2todU1s?=
 =?utf-8?B?V2hNZyt0ZkFwZ0h6SEdUdVJhMC9GSHFrSEhmcTMwYmFxUWQ3V0hHTEI5NWNY?=
 =?utf-8?B?dE5xa2R2MWNXYk9Wcjd2eGZEUEZBNER4QnorUXB2aFlFV0tLd2pKM2Z1dkQ2?=
 =?utf-8?B?OHNKYk85eE9TaGlJMytOS0VGemRTd2owTEJPR2FicGpqVERpV0x5ODZvREFi?=
 =?utf-8?B?RTFINEhXZlIyNGV1dXN4NW9qYmc4b1ZMRVhiNGk1N0p5eGVPVXF1dlNRQ0NT?=
 =?utf-8?B?SE9KRjNZa3dRRncwOGZ1NDFydUlmVnRGWGNtQmpTSEZGRDFBejdIMXp1eEhh?=
 =?utf-8?B?Z2VZOThCKzk1anBLOWI0VTNXZGhOMGkyU0l5eHNYcHdJQ3d0djZDckpoU0Jl?=
 =?utf-8?B?eWdYaTJnN2dxdkpzQnRvalJKMEhtUThaZllqWEVBQlFpdGpYWWp5a1VkSElS?=
 =?utf-8?B?b3h5OFF2V05GWXZpWGJOa01pT29rY1Yrd0M0L1Z1RmtPUUpEcXhKTEZJZmd6?=
 =?utf-8?B?eHNzellWN25EZGpCNFRpa05lRitvZDhJUFZlN1RjOFlRZXZGOG80dkJ1LzV5?=
 =?utf-8?Q?Vdv3/qs8iSyh0TfveRgE02wKP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 641c47b4-6689-492e-1bea-08db2b6776d0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 06:25:58.1470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2kndM84tJj0LvVTVsycJ20sfxMAQl1Fs+uUw/CZ5euh9dXsvPKbJ7sO2ZEZ3SMAuafTQKqVjCyXCUZkkoKBag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5012
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31; envelope-from=fei2.wu@intel.com;
 helo=mga06.intel.com
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
X-List-Received-Date: Thu, 23 Mar 2023 06:26:10 -0000

On 3/23/2023 2:00 PM, Wu, Fei wrote:
> On 3/23/2023 1:37 PM, LIU Zhiwei wrote:
>>
>> On 2023/3/23 10:44, Fei Wu wrote:
>>> Currently it's assumed the 2 low bits of mmu_idx map to privilege mode,
>>> this assumption won't last as we are about to add more mmu_idx.
>> For patch set has more than 1 patch, usually add a cover letter.
> 
> This is cover letter:
>    https://www.mail-archive.com/qemu-devel@nongnu.org/msg950849.html
> 
> I added scripts/get_maintainer.pl to .git/config, it couldn't find out
> the maintainers for the cover letter, so I added the mail lists to "To"
> manually.
> 
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
>>>       bool use_background = false;
>>>       hwaddr ppn;
>>>       RISCVCPU *cpu = env_archcpu(env);
>>> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc
>>> b/target/riscv/insn_trans/trans_privileged.c.inc
>>> index 59501b2780..9305b18299 100644
>>> --- a/target/riscv/insn_trans/trans_privileged.c.inc
>>> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
>>> @@ -52,7 +52,7 @@ static bool trans_ebreak(DisasContext *ctx,
>>> arg_ebreak *a)
>>>        * that no exception will be raised when fetching them.
>>>        */
>>>   -    if (semihosting_enabled(ctx->mem_idx < PRV_S) &&
>>> +    if (semihosting_enabled(ctx->priv < PRV_S) &&
>>>           (pre_addr & TARGET_PAGE_MASK) == (post_addr &
>>> TARGET_PAGE_MASK)) {
>>>           pre    = opcode_at(&ctx->base, pre_addr);
>>>           ebreak = opcode_at(&ctx->base, ebreak_addr);
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
>>>     /* Test if priv level is M, S, or U (cannot fail). */
>>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>>> index 0ee8ee147d..e8880f9423 100644
>>> --- a/target/riscv/translate.c
>>> +++ b/target/riscv/translate.c
>>> @@ -69,6 +69,7 @@ typedef struct DisasContext {
>>>       uint32_t mstatus_hs_fs;
>>>       uint32_t mstatus_hs_vs;
>>>       uint32_t mem_idx;
>>> +    uint32_t priv;
>>>       /* Remember the rounding mode encoded in the previous fp
>>> instruction,
>>>          which we have already installed into env->fp_status.  Or -1 for
>>>          no previous fp instruction.  Note that we exit the TB when
>>> writing
>>> @@ -1162,8 +1163,10 @@ static void
>>> riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>>>       } else {
>>>           ctx->virt_enabled = false;
>>>       }
>>> +    ctx->priv = env->priv;
>>
>> This is not right. You should put env->priv into tb flags before you use
>> it in translation.
>>
> I see some other env usages in this function, when will env->priv and
> tb_flags.priv mismatch (assume we have recorded priv in tb_flags)?
> 
I looks that they are from the same source.

cpu_exec_loop
  cpu_get_tb_cpu_state(cpu->env_ptr, &pc, &cs_base, &flags);
    flags |= cpu_mmu_index(env, 0);  // <-- generate flags from env
  tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
    tb->flags = flags;
    setjmp_gen_code(env, tb, pc, host_pc, &max_insns, &ti);
      gen_intermediate_code(env_cpu(env), tb, max_insns, pc, host_pc);
        DisasContext dc;
        translator_loop(cpu, tb, ..., &dc.base);
          ops->init_disas_context(db, cpu); // riscv_tr_
            ctx->mem_idx = FIELD_EX32(tb_flags, TB_FLAGS, MEM_IDX);
      tcg_gen_code(tcg_ctx, tb, pc);

Thanks,
Fei.

> Thanks,
> Fei.
> 
>> Zhiwei
>>
>>>   #else
>>>       ctx->virt_enabled = false;
>>> +    ctx->priv = PRV_U;
>>>   #endif
>>>       ctx->misa_ext = env->misa_ext;
>>>       ctx->frm = -1;  /* unknown rounding mode */
> 


