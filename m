Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pepHE-0008M7-K2
	for mharc-qemu-riscv@gnu.org; Tue, 21 Mar 2023 23:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pepHD-0008Lr-UE; Tue, 21 Mar 2023 23:36:39 -0400
Received: from mga09.intel.com ([134.134.136.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pepHB-0005Lz-L6; Tue, 21 Mar 2023 23:36:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679456197; x=1710992197;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MExxKqz94ZvWN4IRUfQmw/U8egfcrYfnKcUibEvHZV8=;
 b=PiM/8zt1BPhV45Vt6PThfbZ6DLeGjD6D3lucO5hnHVURYZj0G27jNoQT
 J27oGZYwocPz1BHJ08Np5Fzk2VTOU8/fSJ3wYhIKqkCDF1M/6yrRnVAkD
 qdtAztTpwmAQQLaIHUcciKiIBsJ8BHV2SSX/o816cw/3Lr1bFzMQf3nEu
 Y6PMxXROkhiHRye6Ta34WjNUMoq4Wp+wSdO/V9wvNyyL2m48BEd9TTE5k
 imuXVAv3fmBOkrwiNdTKEkpQg6s4ErPKakz9tw7w1kdDs7fuqUgxltE7J
 qzQ7+7N1qAS0lS7wkEjdBiwUksrxLV3+YyQmbYouNj71sDmq+8rNVws6z Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="340654425"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="340654425"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 20:36:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="825225820"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; d="scan'208";a="825225820"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 21 Mar 2023 20:36:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 20:36:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 20:36:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 21 Mar 2023 20:36:21 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 21 Mar 2023 20:36:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWqT3Y8qIfVXmNAIhRABO1Y7t9TazvgTLSlH/0gMUZZ7kxXqtuap6TpyoxHxipHJ3La2qSQlceWzNPulLIHld5WmKFjoyspse//p4M6Hl/0Vt4jo53P1rfqRhWUj+5aa2Ff5pLyUYNaQE4qVNLTqhGoDKEIz72ZPsOQvl21Aa9g5NgK5UDHsfP/3S7OcRHfH2cSVCOzvrUoD1tVkYOAYcJFUkIWv1ktz4Cqe62Iyp8AyAtf8fSeCJNK9eCC7wtIrIFN1Y7GkMZklHS07V18wQKZaX/RM17Lgbyw9LTUrF8xsk/psELDOXEWyj1kfTiqnuig6tZh9Bvmc62Q6MVVGuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOJkWL9bPqJX4wi2gco2qbUYUniHUaJo6GycbzdbCV4=;
 b=dIknRczfJxas7tYGBwzYIqkeLivrc1gkxMT4/JKwKn6CDlm/THWOdKiPLwT8jJUzqLQ8BdLMbZvSh9BHIizFwqhH/KnZSb5hr78pcAM9DaJ7C9kzMc2b6CRaRVglZ/xvtHRcu2mQxFhY78PEZbswDQ6WlL0J0iy0ofdpeHCANs5tOBXAEvts+3Ys/X8iIB3bR7M5MH/QaOBmSZVJvVQKCU+L1dQTctLJ0NFJvGC3kQiAKD8cvosLDDGf2j4up770CfSLbvDP+3E/WUshiTzDNnRop2ep8hrVNeUIrSZTkUkRcGjn75sr+P3PItP9sgt9cu2l1/flbSJhchTL4f2XLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by CO1PR11MB4900.namprd11.prod.outlook.com (2603:10b6:303:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 03:36:13 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5%4]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 03:36:13 +0000
Message-ID: <38598c82-f625-b84b-0f91-30b1fe98e8c6@intel.com>
Date: Wed, 22 Mar 2023 11:36:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] target/riscv: reduce overhead of MSTATUS_SUM change
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, LIU Zhiwei
 <zhiwei_liu@linux.alibaba.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, "open list:All patches
 CC here" <qemu-devel@nongnu.org>
References: <20230321063746.151107-1-fei2.wu@intel.com>
 <609e4659-532f-0fe2-447a-f7deaa0824e5@linaro.org>
 <209d36a3-c136-5288-a842-3c0b5f1b5d0a@linux.alibaba.com>
 <4f63f756-55d1-70f6-10e1-875c1e515fdf@intel.com>
 <b48b2cb9-bf2c-f527-435d-df497ea4df76@linaro.org>
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <b48b2cb9-bf2c-f527-435d-df497ea4df76@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0176.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::32) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|CO1PR11MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: f4c8b867-fd33-45e6-4f2f-08db2a8695dd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xnWdipPlZPT2q7jgntvo6/YR4MXxfrVTOE9HlOxPwZnCXKyDhowpsl4RVD8I3boj+oZaK9oJrG4nQFh8piPZkj5TnTJxNfwaL51krQckIkcqHLNwpOfp0Il/ecP+hc9nkMqkCjlzPj3A5TKpWQem9ZtN4CEV5UTvivFTBlgEweEYSF71bcOd1bDf84rxdEGn0DeH72gqTqEKNgTHujFJUVsUoNndB92JHrrDCop8CrtVpVno4lH1jkStG/8hMDZqa3COVqKl75OyvBlRnRtBfRc08UY4IC5DNEV1l+r9/MdQMQfSI+cC0dE3PvjHRJDNJCCBJaqL1BcQ7ophnGEmNPefgruPjvIGGFKtD4PYuzc7D6s/taa4rLbPlIdNt7z09WV6xxw3/vvVDfbdR2XU/CXA8vNtD5BljpLUyVXa3k1rdA/ypBlMoBDT1s++YXQVGURae4cHW1c5IX5Vp8A9gJ/cCK3U2M4+tiwznA7NIfh3LnXkiwwlUc6H5VzQH/gtmRtnfjwPnBdi1TCtqeEpPJqCAAn96Cdaf4UU32l877dttxsXQeixYrPksw9/iaR0FjG0mETYFru40sE2q+kd13Qc0+zYP+uko6HuvabKp3GtG5Ug2maW2M0KqMh9p03//9TaYfwS0AeISB13epHifx/d/UMzzTin/opfZ7UCxfADkTeggh9HSSGZc9IJly/zrkavtl8O++UD3IFN61IFVtae7GN2wcfksN5AfOEWRSs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(376002)(346002)(136003)(396003)(451199018)(38100700002)(31696002)(110136005)(66946007)(66476007)(8676002)(316002)(54906003)(36756003)(66556008)(8936002)(4326008)(5660300002)(41300700001)(2906002)(83380400001)(478600001)(86362001)(82960400001)(6666004)(2616005)(31686004)(6506007)(26005)(186003)(6512007)(53546011)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Njd0ekhRMUZKZHA1azFWY0kydUxlTGRZc3R6cEdjK3NKamZiUS96REU3SU14?=
 =?utf-8?B?RGhaMVg0VVVoM1ZsZUFHcXNkS1VFemsvdzZicGd3bXpEbXUvbWVwVzRhZUtH?=
 =?utf-8?B?bmhZYjFzK0J4cUtMSUM5eUdPL2U2eEg1dS9hZkI5Y3NwL0dyalN0cm9YS3pr?=
 =?utf-8?B?MXJwWTBaN1Mxb2M0RmZ6L0VOeFlkOHN3WG1nVlBtU1FvVWFsbU9rQ3Z6SGlv?=
 =?utf-8?B?czJ2MXRUTWw1ck5zMUFEbzhkTG5xelAxWnNsU2xxZlJ5VTJ5TjJBcEdIdytJ?=
 =?utf-8?B?SXpaSVlNR2xRbE1EY2E3VytuMWEzWG9XdVlKQzhQQ09URGNuREw5ZzBZNGx5?=
 =?utf-8?B?SWw3d0UrZ0pwTGFaZFN1OU1XZkM3M2VheEllZDBic3dYOW42UUV0c1JiRCs2?=
 =?utf-8?B?aHB2UjBSM2pRd1hVWEcxWWVNUXd1Q2JMNVN3UWxOTm1tbjlodWxwTXdpTWZY?=
 =?utf-8?B?RVU1SlRoTUxWd0ZKNU94akNia0JhQjYrZFBIbkF2YkMvRDhoWU9BMXZEY2hn?=
 =?utf-8?B?NTlreXdneUtjQ2hXSlBCQ09OZXpLQk5FNkFwQlh1NVZiUkhzS3grak1pM3NS?=
 =?utf-8?B?eExDWjZKVFJYV21kY3plcVpPZmlrS1A5ZjRJSWZ0dkxjSHZVemJ0MExLNTQ2?=
 =?utf-8?B?Z2gwWm55S2NGOW13MzNNd0N4Q1ZiaWxkSmhZNk1HeVcvdDQ3R252RnBlUHRM?=
 =?utf-8?B?ZkVKOGdBU3pvVjlmVm8zbjB6Mm55WE9pNjd2bm5mRm12TEIzZmZPVERiOEVL?=
 =?utf-8?B?T0JycTIvN0RjTmkzSzliZERVdWZMemI1M1BlSW1RcEN6R0E0cXFtNlZoQ0wv?=
 =?utf-8?B?MjkrY0EyVmRRWEdML0ZOSGFNWlRDTVhldDcvekpxOHg2UHY5TkdjNFdHUFl3?=
 =?utf-8?B?bXR4dTFidGVwYW5wTm9IemU1UkNXdTV5NStHT1FDMjE1VW50dHpZR3JncmxQ?=
 =?utf-8?B?R0JnZ2ZhMkNiV3hFTnNmeW5ibmZTWHBnVkkwdGFKVlNSQStYbEx6TXFwbEow?=
 =?utf-8?B?ZTlTSkZWbExaeEtUSlorSnMwRWh3ZDQ3bVdUS1ZPaG4wSFdFWEptT2ZnQS9M?=
 =?utf-8?B?SURNN25QRTlFdCtNTHZ4VzJHSlQ5MCtHYVltKzEwcVRKVGw1NnI5WWlrOUV2?=
 =?utf-8?B?WDhzZWx6MWtjdm1uaGdMM2Zqa0hFeWtxN3ZkVHIvdFFmZHIxMDR0anovNWx0?=
 =?utf-8?B?alEyczFLWXcxYS8rY2hGNlFYbTJmaktzd252aERzODFOMnhEMlVRYzJNLzM3?=
 =?utf-8?B?d2xLYmtFMXZxMGJPZTg0ZzZlS1FpbzZ4NWZNT3libEFXazh0V2ozWXBxRzVF?=
 =?utf-8?B?REowUldJUE9FNWgzZXkxUGJJWTRMUG5DTm1xNTlEaXNQdTBrNjlralBZb24v?=
 =?utf-8?B?ODFRUitmMWxMakE0Z1E0NW9sYWtDMGdjTURPbmRDWVAyV0swb09xSXd2WmpG?=
 =?utf-8?B?MEpEbmlQdjVaOVNiT3lteisrWmFzUlgyYXpLZ2N6SDRZaS9rdTNBdmFKdDJW?=
 =?utf-8?B?dGhrUzg4SGFSWGdka1c3LzQxT2phSVNtbzlsbkQ1YmxsbW5VSCtUTENvZ1U5?=
 =?utf-8?B?QVpqNllYUXU1bEwyNTcxdW14b2FZUDNiVkE1RHBDSGtTTG5FZWJnZXZmaEpG?=
 =?utf-8?B?dUxLRVYrSjZ0NlJrWVdwcVIwaUwxbEJhTG1zYzFXWjkwUGpnSlU0M2tYSkJR?=
 =?utf-8?B?RHhtVlpaK09LcHhTTGM1MVgyVTBOdTBZTDdxZjJKYWJoVVFpRnBySVdqdk9t?=
 =?utf-8?B?SFZVWktxWVNjUUN2TUh4ektlMGR0aWNlRWZQZDF0VzZLSzRHU05jM3N3UFc4?=
 =?utf-8?B?VDZpVlNxbFVucEp1Y3NGUVZXT0VwclpiamkxZ3hEcnZjSDQ2N1BDbTdoc0F3?=
 =?utf-8?B?ME1Nc0FxVCtlM1VCc2gxNkh6SWVrdUR6WTg5R1E4dUlydXpJSXgyRnlEYkJN?=
 =?utf-8?B?dTE0Szk4ZGhlZlk4YzNNSGtMVXA0SVBTTEdhVHoxdkNjRG1jckRZTnREN1p2?=
 =?utf-8?B?bzQ2QmpjTWlqMld6d3V1aUhFeGRueTBZRERGd09oVHZwcTl2aUFKeERDVGRT?=
 =?utf-8?B?Sjgweld2bWNLYlB3K1NGOE9wbGc1Tlc4bDQzMWlnVDZwWDNVN2FhVWlmYk9C?=
 =?utf-8?Q?r38q3FtglIePYWeRef4MTTMmx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c8b867-fd33-45e6-4f2f-08db2a8695dd
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 03:36:13.4787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omx9/anhy7DsQRdHhtbSJu64/0CV+VmvbfNjwdwXRg9ndzwTQhdkL3m11FkawWWcMm4aQrb7nP+r/Eeno/OEHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4900
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24; envelope-from=fei2.wu@intel.com;
 helo=mga09.intel.com
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
X-List-Received-Date: Wed, 22 Mar 2023 03:36:40 -0000

On 3/22/2023 11:31 AM, Richard Henderson wrote:
> On 3/21/23 19:47, Wu, Fei wrote:
>>>> You should be making use of different softmmu indexes, similar to how
>>>> ARM uses a separate index for PAN (privileged access never) mode.  If
>>>> I read the manual properly, PAN == !SUM.
>>>>
>>>> When you do this, you need no additional flushing.
>>>
>>> Hi Fei,
>>>
>>> Let's follow Richard's advice.
>>> Yes, I'm thinking about how to do it, and thank Richard for the advice.
>>
>> My question is:
>> * If we ensure this separate index (S+SUM) has no overlapping tlb
>> entries with S-mode (ignore M-mode so far), during SUM=1, we have to
>> look into both (S+SUM) and S index for kernel address translation, that
>> should be not desired.
> 
> This is an incorrect assumption.  S+SUM may very well have overlapping
> tlb entries with S.
> With SUM=1, you *only* look in S+SUM index; with SUM=0, you *only* look
> in S index.
> 
> The only difference is a check in get_physical_address is no longer
> against MSTATUS_SUM directly, but against the mmu_index.
> 
>> * If all the tlb operations are against (S+SUM) during SUM=1, then
>> (S+SUM) could contain some duplicated tlb entries of kernel address in S
>> index, the duplication means extra tlb lookup and fill.
> 
> Yes, if the same address is probed via S and S+SUM, there is a
> duplicated lookup.  But this is harmless.
> 
> 
>> Also if we want
>> to flush tlb entry of specific addr0, we have to flush both index.
> 
> Yes, this is also true.  But so far target/riscv is making no use of
> per-mmuidx flushing. At the moment you're *only* using tlb_flush(cpu),
> which flushes every mmuidx.  Nor are you making use of per-page flushing.
> 
> So, really, no change required at all there.
> 
Got it, let me try this method.

Thanks,
Fei.

> 
> r~


