Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3EFC001DB
	for <qemu-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 09:16:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qRque-0008Rf-No; Fri, 04 Aug 2023 05:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1qRqud-0008RS-5f; Fri, 04 Aug 2023 05:15:59 -0400
Received: from mgamail.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1qRqub-00084Z-46; Fri, 04 Aug 2023 05:15:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691140557; x=1722676557;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yq3ODszaMiymWhPcBB/vEdKiftA+zB2Hbd4cOutf7fc=;
 b=DFkiGPpzDU3llZVAVamxdUhbEjaPh7WfXbiRQYp2LBtJoFbtS2k5kwA/
 92AhL6Ngu4tdh6VqbKquwNgKJeB++FKo6a4DnQybhFZHPdsQmr1KFGwQM
 Kj0q9CId8C+5Weq0ag3SurgUK83XSZuiYA0VxtdwsaiiF0HT3rq4j5b+U
 N3B5qGsVVNWtTu+Tu5oSwDLEchPDg6kyJPaYBfHFQRoh7rdyenmRApjKg
 1IAvAvav0Dsl4ex5uz/GEo83xjIOX6vWtn/zCVLiNrcSjc6nJj167miKc
 Yw4QEx1444ts/XKoyZ/AhjkvuAgbMhjhdD6zjbvsZ/HuF2JFAbHSz0GUb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="360165069"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; d="scan'208";a="360165069"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 02:15:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="679902708"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; d="scan'208";a="679902708"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 04 Aug 2023 02:15:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 02:15:49 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 02:15:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 4 Aug 2023 02:15:49 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 4 Aug 2023 02:15:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2Mvr1ayeaVDTFDwhYK0QD0ZRPyXMeLzKdk/c59icexRa9WFXIZhNZKW8waZiMkLUNa6KQKCfVuSzyGVb39p8l+W40dssFK4P2mVY2VJQtQRBDKX+dXO/xC+Qm8c19sJLe1CImpDCmSN0VX3BOT7u6XwG/xMM/9si54QJeQRdDdokEl/ehdKb6/4jQAVzK7xTsiCzZvlh4AOYjVp5odgsN/1RInYsGbUPMnHYMC0S87cQM7f5a62CmWr38XSuwDJrafkyp5FWC6o3DSnwJV11D8mrMLAVvShffEWxkEf5UdNOWNGWwIrS1tNUElaxnv3z3fi/q1O2lJq0w/G8vDDCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5szc2EMdNAkxQi/Yy2dh3iMrltXnJKYaaNs06b5RCTA=;
 b=FVtY5sAwaJwhF961ZFyV/duz8AcJ3vGY3VlUKaIq20+KlDOoED4JIipbe7UUVprpRoIYAWhHvcz+NRw0LIm2C+40JRle9weoN3capD3Pxoe22LIhfqrlLbVrF1vYjgyp9171qUM8K1gUln4FbWKgLMLE5xf6MSa00bStvu/VFvdfAjV36bH1Y6sJRSUEY+Hp8YaoF1ARJNs+wHPL2XOi4Y7zryb480Qi1nEXacBeq1EokVKH34q9K/0UudbKGDzWEPhZu76jk65K0Vrlg8Pskpy8Hg/yX9grcTsIVMgXYjgM+Qa8zwUcPKf0EtLJNaMuPo2dj27gjou2Et7loHNfoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by CH3PR11MB8775.namprd11.prod.outlook.com (2603:10b6:610:1c7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 09:15:47 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::f5f4:f0a:d677:8017]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::f5f4:f0a:d677:8017%4]) with mapi id 15.20.6652.020; Fri, 4 Aug 2023
 09:15:40 +0000
Message-ID: <d654810c-4f4f-7491-7711-c6076f42dcae@intel.com>
Date: Fri, 4 Aug 2023 17:15:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Subject: Re: [PATCH] hw/riscv: split RAM into low and high memory
To: Andrew Jones <ajones@ventanamicro.com>
CC: <palmer@dabbelt.com>, <alistair.francis@wdc.com>,
 <bin.meng@windriver.com>, <liweiwei@iscas.ac.cn>,
 <dbarboza@ventanamicro.com>, <zhiwei_liu@linux.alibaba.com>,
 <qemu-riscv@nongnu.org>, <qemu-devel@nongnu.org>, Andrei Warkentin
 <andrei.warkentin@intel.com>
References: <20230731015317.1026996-1-fei2.wu@intel.com>
 <20230803-3855259bbabb934c247c5607@orel>
Content-Language: en-US
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <20230803-3855259bbabb934c247c5607@orel>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0073.apcprd02.prod.outlook.com
 (2603:1096:4:90::13) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|CH3PR11MB8775:EE_
X-MS-Office365-Filtering-Correlation-Id: c149312e-d7c5-44b1-a522-08db94cb5f63
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kvFLXIqc74tk7ANDeBnT8lThAMPrxKlyfSKJj5xQrCqDlfnO81UKurOMhmbnFuw/gUutimPwBNNh/NmOBdoO9Rfk8NblpPAKSArAaRehSxzSb8LrXFznS0JRsyeUsdgmMUUtS9yibm6O9vBsRU/9AM+x1PcfJHUpzDKF+jiz1N1Gv/e4Q4cbvv44ySUNeDeWpagFYtdYbqKZhZYx8f+xPdKZbEN9zefHMYDd48tAPS8WfTrdioXQs/Baw3qx+Rvrg/6FLCv7oMQm0L0HVSZVBM3rBqMphvesFLDfNOuODNW3vRNWwWcSS9OkWD8K6f8fm6Hq0XGoGzMYVldU9DNCFE2juAe2WoKfhDSssq+368Vgp4KnvfIAUccnhyl3Tj8/V0OvXPPQuJ5pzQGEW0d8m542V9lb0EtYNJZiwUCj9Jsna4d7Xoc1f7AHu82zE5l5cSn6YnVzDQ0yXtu58vdczURUjCo+/bWgRDNde+NHVzltPIowzqKyB/vt3rLNel95nd3PEls1GSFoYLpW4wHTWqCpsNER1+C2Lc0Glr8/J4LPc4Ng+45zi5qyfFs89J4NtwrRGYh/rG9xVvP2jq7PgbQih1OgNNg3otaQEhxg7zKfUh1Poc3h1+njZTgJxCqJcTj8kzF/2Da1n3k3UNVHFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(376002)(366004)(396003)(346002)(186006)(1800799003)(451199021)(31686004)(26005)(53546011)(6506007)(107886003)(6666004)(6486002)(6512007)(478600001)(36756003)(2616005)(66476007)(6916009)(66556008)(66946007)(4326008)(8936002)(316002)(8676002)(41300700001)(83380400001)(5660300002)(2906002)(86362001)(31696002)(38100700002)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWt0c0xQK05OdjByYTAyZzQzU2owZm5wMTlUQzNscWhBRGNzd29oY3JOdXpU?=
 =?utf-8?B?d3Q4NE9QemQ2Zk9PdGN5MVUwdnJzR2JEdGswcXZ6anVYY1RSWm1IQWFmczli?=
 =?utf-8?B?bVdId3M0TjFEN2Z1RThuNEUvU1BZT1VqUGNoa0I2eC9XSm4xQjg5bW9EalZu?=
 =?utf-8?B?STFINlFoNHQwR0g3U3phTUlGZ1lFYUZZQUZUaG55TzBEN2QwNVlxdEdiM01k?=
 =?utf-8?B?Rk9ZMGJ3ajkwbjhMZERaVThkcDFaQ0dBc2JQcHRlbmRCR2EzNXVydkFISWZr?=
 =?utf-8?B?R0Z2cklRdmRGSWpVOXZRODRZbDMxUmwrQ0p0WU9xVjhaK3F0Ry9qcHlxN2Zr?=
 =?utf-8?B?N3krS1h2SDltOVRrYlVXQjZDTjJqNElUOGJvbnBhQWJtaU4xN3dlc1F0ZTFJ?=
 =?utf-8?B?NTZVMzBHWHBFenJ0N0xHOUtLZmMwRXQxU0NORjFROTUrdHJFQ3VHOENGQ3VX?=
 =?utf-8?B?YjlYdUJ6a0w5TDZ5dnpNci84dytFek1QMGxHWllCNGhLNldUNmF1UTlhblc2?=
 =?utf-8?B?ek9vck9SWUZoZ05VdUYzZWtuME15WW1nbG9KSXQ5L1pHK3AveHFQT0FvVDNW?=
 =?utf-8?B?NlVGRUpJcENoTlZkUHNYNG5HU2Nza3ViR05kTjlDbFp2cVNVcEUwZUFhd2JL?=
 =?utf-8?B?ZUpXd3JXOUxzcW9DWmtjbGFDckNQV3R3bzdGVEVIS3NVbFROZVVPamRXR0Vi?=
 =?utf-8?B?ZXVIMkZtWU5BWUlubDQreTlLdFp5SmZnYlVBNmE2MTlhU0xjU0trODgzOTR4?=
 =?utf-8?B?ZmhXN2Y5cTNFZjk2Q1pTbGliNURIT1BYWlkzWWxrMDh6bUNRVTRzOTcwMXo3?=
 =?utf-8?B?VW5vMkIrTXRiSHpkY3lVWlh1ZTN2aDJWV3pJWXFYQjI4UkNWc2RmR0gzdldY?=
 =?utf-8?B?OXJGWjl2UEdKUGFES1M1ZHZvR2MrL2wvOUZnZWNOdzBuRXp0VnRTeE1XK3Bv?=
 =?utf-8?B?YXZvbkJsdkpYUm9HSkRiTEJoaDhNM3lyMmxUWG1Ibk1LOWI3TFNXMHRqamhJ?=
 =?utf-8?B?Qm40WWNsM0xVWGxKdEwrUUgrQ0p3YUU4RXNSZnBWLzlsQzhDVXgvN3JZY0dl?=
 =?utf-8?B?MlhFL2VNWFRkVGJZTlZ6a0t0V0xxdHRJbDRuUHdGZkRSN2FWMzRGNUdLM3VP?=
 =?utf-8?B?ajlwRUFOcnFnVmRYMkloY0lxb085Y1lSemRYUU91N3hFUDVVUUpkc0xOdjFM?=
 =?utf-8?B?di9SY3Q3YW1wTEJvYm1taTFEYXJtSDZSK0p1MStzZUsvZkFrY1U1b25Gc1VY?=
 =?utf-8?B?ZTN3ckJLcWlvNnZXdm5ZZitpVnQvS0ZEaEtlQWhQbmZieHNZOFREenJTM2Qy?=
 =?utf-8?B?YlBlVzROV1ljWVNWN2JrallXR0tOQjZ2d3VETmhza3lveGFpekZaYXpabUtV?=
 =?utf-8?B?YlZlKzhBdjAxWG5LVFNnQ1RxamxCc3ExZFJqMUI3QXlRQlZ3ekVRSU9aNHZu?=
 =?utf-8?B?YkpvdmJaQ3JTblVLUXhrNWV6K3JyamJsRmhJcUJPbnE3VFJrSTBkVG1Ddm5C?=
 =?utf-8?B?dEpaYXczLzJCdXlCUmErU2h4cXJNNmJBb0VUeHBRWnpHTTFReDVrRnp0SDMv?=
 =?utf-8?B?UDFiYzdTWTErajZBNUkyTDRPSVhxWlBjWlUvWG5hbTMzMGEzTlhzRXpINlBQ?=
 =?utf-8?B?c3owZ0h3bVRSenhnL0x1R2hJS0I3ejdaYU1HOS9EVGpZa01XRmNRK1Z4ZXc3?=
 =?utf-8?B?R3RYTm80T3cyT2tkWUl1cnNlQU44Ui9leTM5L05lZHh3K2E0UUhORjF6c3lw?=
 =?utf-8?B?MENFVjZmeGhHcGZvN0RrT1FaL05QYllFZDcrQWMrc3JKamdYVjJpMU0vU2Fi?=
 =?utf-8?B?blNhOW1MTnNscFBiUmVOSUY5dnRrZTBoL0swaHp2RERsRGxLWGMvdDZJRUM4?=
 =?utf-8?B?dHBPcHpKVVZ5M01JUmoyWnlQbm93QWdOT3JXNUxrUEdDZUNaTC9GWnVIWS9k?=
 =?utf-8?B?QWVLbXg3V3oxS2xCQk1hcVJqQ1RJaVVhT0h5ZzlYeEl2dVNVbC9YVXFDSDNP?=
 =?utf-8?B?cnJ2Yld0cmpTOVUwL3VtOGdEZGg1aHBCTDI3NjJDL2p4TGFTR043TlFpY0V4?=
 =?utf-8?B?b3RGcS9oYTBVaHVsS1BHZTNSenU0R3ZYaXhKSnlTbjltd3ZMeDh1TWVlb0lH?=
 =?utf-8?Q?VhMIofJpN91xRoJPFMRIKhmbC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c149312e-d7c5-44b1-a522-08db94cb5f63
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 09:15:40.5712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJHW0W/wW+b4N/kQKcDc6Q2YRLVF+ROYuidaDCtIiik6+bZgyS5CN2bLC+4IKDVAUGj5eE7xisyLV65x6Nt3Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8775
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.20; envelope-from=fei2.wu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.091, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 8/3/2023 11:07 PM, Andrew Jones wrote:
> On Mon, Jul 31, 2023 at 09:53:17AM +0800, Fei Wu wrote:
>> riscv virt platform's memory started at 0x80000000 and
>> straddled the 4GiB boundary. Curiously enough, this choice
>> of a memory layout will prevent from launching a VM with
>> a bit more than 2000MiB and PCIe pass-thru on an x86 host, due
>> to identity mapping requirements for the MSI doorbell on x86,
>> and these (APIC/IOAPIC) live right below 4GiB.
>>
>> So just split the RAM range into two portions:
>> - 1 GiB range from 0x80000000 to 0xc0000000.
>> - The remainder at 0x100000000
>>
>> ...leaving a hole between the ranges.
> 
> Can you elaborate on the use case? Maybe provide details of the host
> system and the QEMU command line? I'm wondering why we didn't have
> any problems with the arm virt machine type. Has nobody tried this
> use case with that? Is the use case something valid for riscv, but
> not arm?
> 
Firstly we have to enable pcie passthru on host, find the device groups,
e.g. the vga card, and add their pci ids to host kernel cmdline:
	vfio-pci.ids=10de:0f02,10de:0e08

then start vm through qemu as follows:
$Q -machine virt -m 4G -smp 4 -nographic \
  -bios /usr/lib/riscv64-linux-gnu/opensbi/generic/fw_jump.elf \
  -kernel ./vmlinuz -initrd initrd.img -append "root=/dev/vda1 rw" \
  -drive
file=ubuntu-22.04.1-preinstalled-server-riscv64+unmatched.img,if=virtio,format=raw
\
  -device vfio-pci,host=01:00.0 -device vfio-pci,host=01:00.1 \
  -netdev user,id=vnet,hostfwd=:127.0.0.1:2223-:22 -device
virtio-net-pci,netdev=vnet

Without this patch, qemu exits immediately instead of boots up.

Just tried pcie passthru on arm, it cannot handle 4G memory either.
$Q -m 4G -smp 4 -cpu max -M virt -nographic \
  -pflash /usr/share/AAVMF/AAVMF_CODE.fd -pflash flash1.img \
  -drive if=none,file=ubuntu-22.04-server-cloudimg-arm64.img,id=hd0 \
  -device virtio-blk-device,drive=hd0 \
  -device vfio-pci,host=01:00.0 -device vfio-pci,host=01:00.1

qemu-system-aarch64: -device vfio-pci,host=01:00.0: VFIO_MAP_DMA failed:
Invalid argument
qemu-system-aarch64: -device vfio-pci,host=01:00.0: vfio 0000:01:00.0:
failed to setup container for group 11: memory listener initialization
failed: Region mach-virt.ram: vfio_dma_map(0x55de3c2a97f0, 0x40000000,
0x100000000, 0x7f8fcbe00000) = -22 (Invalid argument)

Thanks,
Fei.

> Thanks,
> drew


