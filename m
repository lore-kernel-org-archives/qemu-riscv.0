Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjKSs-0001ao-GX
	for mharc-qemu-riscv@gnu.org; Mon, 03 Apr 2023 09:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pjKSq-0001aR-7Z; Mon, 03 Apr 2023 09:43:16 -0400
Received: from mga07.intel.com ([134.134.136.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pjKSo-0003j3-1e; Mon, 03 Apr 2023 09:43:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680529394; x=1712065394; h=message-id:date:to:from:subject:
 content-transfer-encoding:mime-version;
 bh=yBV6JZYougYTinHNHbaZVhFjLAbYb3LnYrtNEBEiUak=;
 b=MhJ55EZaIzV3oiFo1w8I91KxR16mcn1+rYC+tCX9h22n4dxjnFqA7JOJ
 zePFJA5LFCjnBz4Fcxg+7C8vEvvDNZoxT5eEDiQLs4W1seaDWVNBHHW96
 v9Yu3kbDXVCN0XOCrE4V7D4Qy6TF7gHmvjgFW2UKy0Mc7jNJ7ESiOISAK
 QVDqjpgZ+00iiOow7X4E8aj5J65SwGyF28sH8RwPgC1yqn6DtiFShJMl6
 OvvGUcm9XqgmIcAvlAtuBBoWl+EQPngyqygrLX6DXHDAcu6vMepEOBooO
 Kx1W0G0ZNMP7oTDT/vILUHGuh5a1UnBCRlWNvUPfVxPybbT/+jtVX1SDx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="406947855"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="406947855"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 06:43:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="685977363"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; d="scan'208";a="685977363"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 03 Apr 2023 06:43:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 06:43:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 06:43:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 06:43:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 06:43:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKOPc2ZxzFBg44XLWJgtKFvytcVGsbcLxlFzGnJDTLtJMne7CH0hR5xDOyHAa3EgFCUekA1rU+iBHyUlOh+opFfq0gxdmmEkuS2itjX2i8/d7MECqLx0FyxdXa9RZk0GdxlJO/+Dt+mX/qpt11SctOk8mRUGKFixXqPteBzKG4e9S9NlLoa3PeNGK+6Rn9tunkU20kOwpQr3Y6eIqx5RyC/m7kSuTq/mDl8NWE1QQ7uRA/49ExLhz0VUq83ZYZV/R3fO4h+TYhheeleZbFO3hpvw6Uc9x6j+grG8KsworqcHCJbtXf4EGzvjgrkicXE3IG1djoktJdZjcZ/E+LExSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cy0Ehf8+N0xqL8Op4btM7w3g0FOj75WdpIh8prFSLoA=;
 b=H/jM1HyNE2pXO3XoH3i+4Q8Vn0SKAW+Eh3uwpUi0U93pQgAW8I3D//2ZmKtXlsBCrG4P8wG6eRnDltsEKupG9SkzAujSL4YF9fxnxUrPSCiTMC/XB1SwUnCX/tEMAcmlGuDFjM/0ead1wfPU35J67aiSRyOFxFwej0GR3lbG37PIk6zQC4/aK+olfkyMcJHg173N0p72Ha5fCkiqQxbXzYMOxfqa3tzsjWnITQqoMYU38B+vKLTc/YLedz99TaLH+pHD74JLCZ9HSK9QZQTFePHtP+4LSs6PeSIxnAW05gXBKHFEqPFj/YUioXXmwRaLFRQIOM4tGK4O4WZ8tFshTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by PH8PR11MB6657.namprd11.prod.outlook.com (2603:10b6:510:1c0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.30; Mon, 3 Apr
 2023 13:43:07 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::cf58:e1db:41d4:ee3f]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::cf58:e1db:41d4:ee3f%6]) with mapi id 15.20.6254.030; Mon, 3 Apr 2023
 13:43:07 +0000
Message-ID: <e9de7676-b669-4f4e-e3e0-e57fb58b7bd7@intel.com>
Date: Mon, 3 Apr 2023 21:42:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, qemu-devel
 <qemu-devel@nongnu.org>, <bmeng@tinylab.org>, <fei2.wu@intel.com>
From: "Wu, Fei" <fei2.wu@intel.com>
Subject: riscv: g_assert for NULL predicate?
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|PH8PR11MB6657:EE_
X-MS-Office365-Filtering-Correlation-Id: 744a0189-ddcc-47c7-f997-08db34495b35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6v+OcsK4D5gClu6PizApktacfNO1vYPtuwJMkxRqS6kIHUKrd6rwTSf0Y/+vNNIV+JyQoo0sKAktzLdD34TckXINl9D0Oa0xdtcVN6Ie4/q/buExW3jm3b72stzByqdvhvpAAKK84sVrHyJiPeIkbZTUX9GGQ90Bf3W9Eyq6hxfilh7nowwj+rSw9AkHtp0BjdM1SuM08vJZeAaNQ07ZtmlYeCgIkyu2JM/2LEy/lEwIA31JCttBweHYMMHg4hr6G2sAgpIGHNOHbz6DKO1rI4HqzT0rXMwrB7uF4t0SS4iMRc2b1yme/fwI6khx8N2Yj6FxgdA+mMjgBUpxIdf/uSUuCD7A0mSiEgGRayHj4SnlQV/bF4w1qa1RNEaqqr0qu0TVtQvdkcbx9i4KYceR02iQcNFdn5Obdq9nSqhE9bVW1js7xRo7i1kMCgNFvmaAlViiDB7QfQqVxDP3IpRyqdLk6Ojv5EtNKGhnE1xOqhbSmVBtnvmUg+cqN26pWtoWhSJ2As6dXA3BVAF88eY3AxK3t92pIR6cT+q517DR3aZNU5G2xHdoo8ne07rWgfuuYme164yhDshgLAq9oyQhKapS+bYKOo0Khc46hUVEj9Cs2h92XzQDyVuhdh1oYc6cOJH50kiH5wANqE7dG+82Ag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(376002)(39860400002)(366004)(136003)(451199021)(41300700001)(8936002)(82960400001)(26005)(110136005)(316002)(5660300002)(31696002)(4744005)(86362001)(38100700002)(66556008)(31686004)(66946007)(66476007)(8676002)(478600001)(2906002)(6486002)(2616005)(186003)(36756003)(6506007)(6666004)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDN0di9jZE5sMmNLd2V3Q0VCRTlrTFczcEhtUE9QQnZ6Qit2K1pNN2RtUEZQ?=
 =?utf-8?B?WWZUc0R1UnBBNkdkSVNJaUt0Nkk4dFJ1QTloVGlpM1VtMmoyUVBPSkpuUkwy?=
 =?utf-8?B?WmJPWkI3VXlwWnZZZ3VHdmg1SHpzYWNPMzkzZFpvTmtmK3phTmxJRlY5cXNJ?=
 =?utf-8?B?SWxFRi9NYmFTeG81U2NZWGErdHhVRUVEMTY4MWlML1hPOEdRL0c3dmlXZXdw?=
 =?utf-8?B?K0JDcDJQVjZMd0Z5VUpZWlkvUktwY1NXWlorM2Zod0gvS0VWNXFBY0JoREJX?=
 =?utf-8?B?MDJuS1J1Z010N08zYk5yUHlqcWhVRTdGTXpKYUtqdXVVa0FKN212aEhMdUpq?=
 =?utf-8?B?TTN6U3NheW1VQTE1aTFSOUhVUUlFUks2aFM0Umo4SUdKMkI1Z1dKdkR4WmFR?=
 =?utf-8?B?bldxeXFGa2I4WHUza3hmNWl0SmNDWU5hdGp2ekpmaVFBUGF6NmNKODVNK3Br?=
 =?utf-8?B?bHNFNUc0alNOZ0YxMEIvbkZmSzZuMWVzQm9iKy9iTkIzOHpGbnZjd0d3c1I1?=
 =?utf-8?B?alBoSVJYUEtNbUQ5UitZczRyTzFxWmtlanIyMTNOcXRPUDBtRVB0MDV1ejZs?=
 =?utf-8?B?RWdDdzBwM0pxai9yQ1FiUy9YNVN4TjdzNXQ3ajhBTWhhbVVUOFZya1RwcXc5?=
 =?utf-8?B?aVg3TW4xUUdaSjlHS2E5WWxwak1MYm5YeUpxVUpLVGkrTjcxMG9jSERVUGQw?=
 =?utf-8?B?b1lDUDRHZkxBVnMxUTBJUnZ2M2I2WGttVFJCbGl5SXZpeTM4bno2aCtxdUQr?=
 =?utf-8?B?WW5qMEZkOW5mTEpBODc4STFaTDFvQVpjb2hjbWc4ekJqSkJkc2Nzb1FQSVJo?=
 =?utf-8?B?MW11MkRwM1k2ajA5ZDA5NWpid21KYzlrQ0tvYTBKb2hUZWtEbzNCYnFiUldj?=
 =?utf-8?B?bjVoMGtXdzM2YldjK1p2enVSL3hTRGhEaHBlbk1Lb1EvTUZjd2U0Z2lCNTVH?=
 =?utf-8?B?d2lIRzhicEtkL2tkc1JnQXhvVTd5amhBVVgxekNYZW13U3UrZzMwUnFPTVV4?=
 =?utf-8?B?enR6Zi9iQXpDQUl5cmJZejlwUGNlVG1HZUhuV25aUXNWWXg1bnorck9uL21v?=
 =?utf-8?B?V2x4QURjRkxCNXVKOTlyMnFzbEFjb1FiQTh5UWNSV3dod3pIRGVLS0FKV2Vt?=
 =?utf-8?B?MGJ2bHRYL2tSKzNkdmZsS0FHWmg3WXg5MWx0ZDlWeExudGpXVE1YN1ByVjVN?=
 =?utf-8?B?SmZOTVZRWmxxR3FBZDdwa21SeTMvby9uTHBaSlk0RHlyMUFFMDY1ZlBpczh6?=
 =?utf-8?B?YUVOWWJzRlNJcys4d2ZtdHcwVHFOeVhUYnhNYVVBWVg1OWpsNk5LalVFNDRm?=
 =?utf-8?B?T0NCNTc4WDd0REJaQ0pmU1BBN2F6SU5PclA0V0RkdDRUdUJwQkxHY3hMYm9l?=
 =?utf-8?B?RmQ2eGV2YlBWRXNObVA4aEoySmROQ0hiVll3Q29ueEhDRWdKQ3pkZ3J6QlFP?=
 =?utf-8?B?c3kxVXY2YUJmQnlkaXhHaURYT2p0TmNOT056bnRRZFJOcjFQcDNlVlBVdDcr?=
 =?utf-8?B?VExGRDRPWjI5OVJHYXBoU21yRTVtdTdWMENncHpHRXVaK2d6RUxQUDZrZGpE?=
 =?utf-8?B?S2tERGxPTm5pT3FBc1FyVEdVdnNsSVpHYTdsZXo2cjZiV2lzN3JBbGdYNXpn?=
 =?utf-8?B?dFpTU09sMFJhM0ZqV3JJZ3VqbGpLd1NBV3c5VDVzNkN3bE5keDVTajlHMEZ3?=
 =?utf-8?B?eGY5VG1LbmVKOS9BUU1YcXZqT2V3Rjl3a01XbkNyV0tmeDFWcyszZVJTdDlp?=
 =?utf-8?B?dkxtL1lzd2pUOTlsbkNOd0VwT0lNb1VPMUhMcFZIM0pyY0wyYWpBcVJPVXVm?=
 =?utf-8?B?YmFZVDFRSTk5RlVueEFTRmQ4dll0ckIvYzlzcVc0M2E5RzVPY2x6RWFtODU4?=
 =?utf-8?B?ZUdVbU04eHNCUCtzK0NuZzc0Wi85VTNScVAwMHpYc2RyNSs4T3A5b042cEYv?=
 =?utf-8?B?Q3ZEWXhkWi80SlRVQmYvWDVBRERDSXN0bDJZQTViQlNQbExZTmJMUUNzaHdv?=
 =?utf-8?B?WDBpWUdWd2lSais0UUpXbldvOVdrTHRHcmlHUkN3cUVMRDd0SjAxNDJ6WHpN?=
 =?utf-8?B?N0cwM29aYlNsSVp6eDRGdDFxQ1BrRzBrblhqZG9qK29GNndqV0xiQlA4VG9W?=
 =?utf-8?Q?mphwdGYim0lb8JEE/rnYHhN9+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 744a0189-ddcc-47c7-f997-08db34495b35
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 13:43:07.4575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LkuQwKy+/6FXdFld16Mnnza1+uV6doBkMuGmVvd1XDXRmaBfAfa3qorKz/t9WANqvx32/iKg2eYbbEmqiR25aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6657
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.100; envelope-from=fei2.wu@intel.com;
 helo=mga07.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 03 Apr 2023 13:43:16 -0000

Recent commit 0ee342256af92 switches to g_assert() for the predicate()
NULL check from returning RISCV_EXCP_ILLEGAL_INST. Qemu doesn't have
predicate() for un-allocated CSRs, then a buggy userspace application
reads CSR such as 0x4 causes qemu to exit, I don't think it's expected.

  .global _start

  .text
  _start:
      csrr t3, 0x4

Thanks,
Fei.

