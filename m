Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfXkT-0003Rt-PF
	for mharc-qemu-riscv@gnu.org; Thu, 23 Mar 2023 23:05:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfXkS-0003Rf-6q; Thu, 23 Mar 2023 23:05:48 -0400
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfXgy-0001lL-96; Thu, 23 Mar 2023 23:05:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679626932; x=1711162932;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KITWcMNDU0hrDwxso3sAXMYfUdLStpDU7zx6SEtg3UY=;
 b=b5XPGHpCBApGCE4fWtaal062+yG1H1CBkvtP9vbXrUob4rSp/xf2Yfl2
 TFuXbeEBKB7QTuAt+5TZIKMHs/gUMDjcCggicVldqRThtZKYPkWb5PdZr
 fLqe+6KBfPhXvWphIEt6vn7G80AM56kfPZBc4SlZKDFWoA1KyjSWG51ew
 wm1VehtdweZSX2wRzSg16MraRvoSeRuWOds/nSlaUHAZ2MEZiF8eUEJ21
 lNb/MhLpTPYc7gDPgoCFO3nClyu1PZQNBP0If1WlmTE74bKfHNkmMHK2X
 XgRUr7EXNjc2rAou00plD6K+TdH01n9SYxcWpafVR6kWyW4hRC36ETSP3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="328092879"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="328092879"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 20:01:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="856716810"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="856716810"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 23 Mar 2023 20:01:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 20:01:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 20:01:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 20:01:42 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 20:01:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGplh+Y2whcD7I0NuZoGbpjmKVzU4CHRBS8vnfvgiuDriLEIVZVGCR8wjMFSildC8z5wszq1ieG/HoWXKFbzfcB7hILkNRRbWCApTA6NrekmI02ZDaTjXNu9soeYBBscjM0pPr1iiqibtQJVCmMHFEPCLIIUnSffDAl/CoBdrKupgM14gE3ll0sL+iSsJqOjnuoHfvINjeri8Cl2AaRMj/bSjzkPCMwLd9TKOY+HlbuaZT3r/FNcMrIP0LDHAee2QVMoUrhSKoSM9443zJq+i93/B89Vqix+Q/KoTMpiiR2zDfOZdcdQpJ8nbU5psJa/1hThsOaYQUMoaHBc2Fx4XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRujuAIzTmcjm1M577iyfytbmsu7VZYjvq+W2jhj5Go=;
 b=e40r+09fSXvRKdKT+cjkjIzqJIegx3OXRXs05A2yDDofLr5a4B35tuUK6q3fzbXl9lUPfp9C+as7il+IzF3zoL2OA4ywl2Azpr4p8MioeOIxfsOaxDJGYyWNN8gBPDn1O8aDIlfUmF1lhSc3qjqEU7SGpIrRH/CC4Uz78RlPMTJzTs4IWoqO8kSjq2OGEa4+XKrhmf40VnP/bPMFgYYZzumA7UDIf6QdvnETb2KH9T2tSguZ/2Ht0MS8OL8q2CdWGGz5YD2olFpk2GJvLt7tJRPWC0ALKx7gUmfYNNeW1dAXdE92S/pm2rFpCWGW8rLcbRDm7xkmTq35vWmyqrFh4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by SA1PR11MB6918.namprd11.prod.outlook.com (2603:10b6:806:2bf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Fri, 24 Mar
 2023 03:01:37 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5%4]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 03:01:37 +0000
Message-ID: <419d1abd-9664-3de7-af0c-97bbfa1d099b@intel.com>
Date: Fri, 24 Mar 2023 11:01:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 1/2] target/riscv: separate priv from mmu_idx
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, LIU Zhiwei
 <zhiwei_liu@linux.alibaba.com>, <qemu-riscv@nongnu.org>,
 <qemu-devel@nongnu.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
References: <20230323024412.324085-1-fei2.wu@intel.com>
 <20230323024412.324085-2-fei2.wu@intel.com>
 <9423db2e-257f-016d-b404-17d8e5adc0ac@linux.alibaba.com>
 <7db6d615-5ddc-5e1b-1d3c-a85c22e6af74@intel.com>
 <ab0db790-b577-6ffb-a424-7b243b7019f2@linaro.org>
 <61e3c81c-b2e6-90d8-0a78-24cfe646a747@intel.com>
 <4951f368-400f-9dac-524a-d3264f0b96ab@linaro.org>
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <4951f368-400f-9dac-524a-d3264f0b96ab@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0192.apcprd06.prod.outlook.com (2603:1096:4:1::24)
 To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|SA1PR11MB6918:EE_
X-MS-Office365-Filtering-Correlation-Id: c5d300e2-8090-4670-a5fd-08db2c141541
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6PfPCRxLohyNgvvyf0vv0JO1yenlgGo255eWfVDwNYISjjzEiBl0KGaA6RaPRJSjBUkPobXwAca20Jz343BESezR/+mFJPI1ihdJBTQRxo3pTxEltlenrNbfT9uxZe1fE9b8x3JLTUogk1JACQmGQkl2OY1Xa9chtik400Ue6OFjLntTBuYbkmBDMe27gLmc275xy9amap/T3+6QpOVblevldh29cS6fDIfjPge9oSwdgOmWnFA1obMX1gUgIc2kKipBPA0ymOwWlwPRY9/ZeUDRR14cpDSgJbEcfD+sSOq9H/+nHocDzY9f4M+uSudeb1N0+YuW5vqezjVeG4GvrcDxE7XiPrE5F2DFRy75jjqbbiiIMhGY34y6ewVyBxwVzvHNAG7oz5HL9Z9KN++UYXuWTcRcV7IkIgpJC+E/vB7cK2LRLGCwZdFopHm6EUyh2Pd0Baobu3Fj8xkac0p9y7Zg0DeUymaxg0vRTxeBEke1aCuBMbOSAYqm4W96QuLz+ZyTYvjOB+b2lojd1rk386g+XIiHyxBLVgJEwS6oTop96SCJ2cDrWxFu3VrIvYVYINY/RH58cN3SmoJ8JT/P5SvqBfhWiw55ksR9flE3IiooaEWJrOiYaOHEjOYunplB4LJyNqk8roPZh9LhPpK+HH98eO6nO0hgrnCNRV2JZLayI3GRW2XrfYiv/9pRReWAEcMdvmaDeR5S7NFjfX8f2msbAzYrFe6+MFUR4PIDrnU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(376002)(136003)(366004)(39860400002)(451199018)(36756003)(26005)(6512007)(6506007)(41300700001)(186003)(53546011)(54906003)(110136005)(316002)(66946007)(66556008)(66476007)(4326008)(6666004)(478600001)(8676002)(6486002)(31696002)(86362001)(2616005)(2906002)(7416002)(8936002)(38100700002)(5660300002)(82960400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjczWDRkb1l5VHVGQzZQUjViSlAyNW42NExSRHVyUkVrRVUwZTEwYzJNQUV0?=
 =?utf-8?B?TmtyMTIrYm80WGRhaVZCWmhadE5IcWVZeGEwdXdqMzRUZ09Hc2pMUm03RjZN?=
 =?utf-8?B?UUFXWVhNMUNJTngvYzlrUTkxY2VHaVNFUnpuR1hraUdUaklrRlhmUURFYitt?=
 =?utf-8?B?emF2M2xyN1ZJTWRuNnRXK0Uvd2ozUHBhVmlpUlZQMTRHcVk5MlM0V3EwNlBp?=
 =?utf-8?B?RFdTd3IvWTErY3hqRDB0aVo1N0JnZHBHdnBCcHNwTkFXd1dhOTgzbk1qRmFQ?=
 =?utf-8?B?WW1qZGRJalFLRjV6dXlkQ1JOMVQrb2dIbi96SEZ1c3JoYk5HYWRSZW1aYnUv?=
 =?utf-8?B?N0lvWEdtK2JXaXhSS1JCTmxGSzJKV05MMytkTFZ5eVV0UEhKbHkwdjJLQm5m?=
 =?utf-8?B?amdzMVlaby9ZUzlGaWdnWkRQdEpLTVFMYVFvT3V0aXFRL2c1elYvUUpDRVM1?=
 =?utf-8?B?bWRDcGNVRVoxM1gzMDZYV29kMzZ6dGJRRnJOQVBHcWhvak5kTkhhdU9zOVlv?=
 =?utf-8?B?LzNOMFVBcm9xRk9JVVM0MFNqeWxYdlNHL0hmOXQ4TzdxcmZoZ3d2OXJqRlVz?=
 =?utf-8?B?ZkZZQldOdGQrKzhLYzdwQm00SVZTajRYKzlHNjIzNjNVZmNLd1JCN0l0eGd1?=
 =?utf-8?B?a1BvTytFTmdhREdoOWtocENha0gweHZFZW5objJPUUVOMjVPSW91SFg3VGpG?=
 =?utf-8?B?ZG5nL3V3akhMZlMrcnhYUGg3U0FSenI2L2NuU0Y5RGgwb3ROcmdKSFpXVC9w?=
 =?utf-8?B?NjY0V2g0d05odEFKNGhjYVFVWUdPZ2VhZU5xUzgyWE41TlZOK1VheXM1Qk5H?=
 =?utf-8?B?ZjY0aE4ray9PZzFDd3AyMEFyY09nOHpqWHg2MGJkLzlDY1VIRHN4dzZCZjRU?=
 =?utf-8?B?WFZxL2pKWGVPYWc2d01uaVJWQ1ZHak5HWCtEZmRRVXcvTEo2V3FRV2dmcWJR?=
 =?utf-8?B?RnI5LzRHWS9COEJWSmhVNzdpTWp1dGo1Wko3bkxrRUd3OS8wYXZsMmQ0U3pp?=
 =?utf-8?B?U0tuaUxqYWhyK0pZTXZtbXdKWlVJbVBneTBzKzdBV3pWM2h3Skx4Ky9zSHhE?=
 =?utf-8?B?TExpMFRmb2VodFZ5S0FqdlpGVzF6UW1RaHhYa1lvb3JLZUhZNmpwK2Via21W?=
 =?utf-8?B?YzNxa0xTTW1UcHVqTXRlOFY5SmlXWnRTRThzVzhIQ1VtSXd1ZU5VNmxhbjVF?=
 =?utf-8?B?NGhGZVNpNUhpV0RreWFKa28wSDNMb0V1WGhFWmVweVZ5NnBrZDZUejl0U3F6?=
 =?utf-8?B?NGNyYTRwUDBJQXR5VVZIL0dNQTU5eFFCQm1iNUtoM0JKakFpM0pGUFozS1Rs?=
 =?utf-8?B?U0NQcFFja05CaFpXaTY3YmkyVlRQTkVtcEluL1NiQ3Y5dEJCNlZjZ2xkbTJG?=
 =?utf-8?B?WGZWSVZ1M2oxU3hPZUxXV0E2cnV6NEVjYVpVNkJtSDlSQlBMUEdqSGtDelNR?=
 =?utf-8?B?S2o1cnhqRVVObFgvRFVnVHRkei9wNXhQYVVUMXU5VFBJMGRzWVAzblhZT3V3?=
 =?utf-8?B?Z2wvcTJEa1ZJcjNBVlNUTTE0bkZ1MlNNSVhPcDNnNVhHdENMYkxvUkErVHFV?=
 =?utf-8?B?cHNZbVR1eER2R2JYdVk1S0FxUEJOcnFPdCtxVnpVS0Z0dE9PMFNmTVdITEpy?=
 =?utf-8?B?WnF4R0UzYmp6cGtMMDY3aGpyc3R1OGhPUVdqN05XQWJzTHF1Nzc2MVNwQWZE?=
 =?utf-8?B?NUhMMjRtSlE5UGkxVkpERWFzNDNGUnNpYjZ2Nm5MYmUvZDNnNzNoWUhDbGNi?=
 =?utf-8?B?d1lLRDZnS3NUQnBnazFpZVZ5dVV4LytaWkhleEM5UnRqRnp6YXdxNCtCOWNw?=
 =?utf-8?B?YldzUmVKVXlYT29zYmh5ZEJmR1l2NUtxYUFCNDh1TVA2NnFKTFl1VTRncHBp?=
 =?utf-8?B?dlBSMGFCT0xVVzRDMXVzTFBxVkY5NFNBdFhLdHZVbzVTdFJZWktERllGM0o3?=
 =?utf-8?B?L3hrK1gxQ2JOY0oyWUVlenEwWmtlbEtNUnZnaEVId2t3OThuTEltNEdhRkgr?=
 =?utf-8?B?MEh1S1F3Q09ENkxySEs5VVpCQVFLWmc4V3dFYjN6RE9uakZmRWdkcnQxMDZX?=
 =?utf-8?B?OGhSSFZxa1EwcWRpaEI5QTBXc1ZUTEluTU1iVDdwOFNXRTZWN3RBY1huTXpO?=
 =?utf-8?Q?TblYAhN9wG1lNaa7KXu/36TOg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d300e2-8090-4670-a5fd-08db2c141541
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 03:01:37.3305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nPoBln6Uo+X1y0cuoNPbb1qdPPgbSEOxQAMDqFjtvb8xPEEyzcwSFmNkyeBUwR6iem4B1TAlehWEVJZt2/IPzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6918
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
X-List-Received-Date: Fri, 24 Mar 2023 03:05:48 -0000

On 3/24/2023 10:37 AM, Richard Henderson wrote:
> On 3/23/23 18:20, Wu, Fei wrote:
>> I lack some background here, why should tb_flags be preferred if env has
>> the same info? Then for reading from tb_flags, we need to add it to
>> tb_flags first.
> 
> We read from tb_flags in translate because that proves we've added the
> data to tb_flags for the TB hash.  It avoids errors like the one for
> vstart.
> 
Got it.

>> Correct me if I'm wrong. The only strong reason we add some flag to
>> tb_flags is that it causes codegen generate different code because of
>> this flag change, and it looks like priv is not one of them, neither is
>> mmu_idx, the generated code does use mmu_idx, but no different code
>> generated for it.
> 
> PRIV definitely affects the generated code: for a supervisor
> instruction, such as REQUIRE_PRIV_MS, we emit gen_exception_illegal() if
> PRIV == U.
> 
You are right, another one is just mentioned semihosting_enabled() in
trans_ebreak.

> MMU_IDX definitely affects the generated code, because that immediate
> value makes its way into the memory offsets in the softmmu lookup
> sequence.  Have a look at the output of -d op_opt,out_asm.
> 

Yes, I think you mean the fast path for softmmu lookup.

>> I think here we have some other reasons to include more, e.g. reference
>> env can be error-prone in some way. So there are minimal flags must be
>> in tb_flags, but we think it's better to add more?
> 
> We add the ones required for efficiency of execution.
> 
> We had not originally added PRIV, because the (original) few
> instructions in trans_privileged.c.inc all call helpers anyway, so it
> was easy enough to check PRIV in the helper.
> 
> Since then more uses have grown.  We *could* turn those into helper
> functions as well, but every other guest arch includes the privilege
> level in tb_flags, and it seems natural to do so.  Only if you
> completely run out of bits would I consider working hard to eliminate
> that one.
> 
It makes sense. This is very informative, I appreciate it very much.

Thanks,
Fei.

> 
> r~


