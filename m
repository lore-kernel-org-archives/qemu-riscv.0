Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pesWr-0006Xd-QN
	for mharc-qemu-riscv@gnu.org; Wed, 22 Mar 2023 03:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pesWq-0006XB-3j
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 03:05:00 -0400
Received: from mga01.intel.com ([192.55.52.88])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1pesWn-0000m1-MI
 for qemu-riscv@nongnu.org; Wed, 22 Mar 2023 03:04:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679468697; x=1711004697;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SWJ7hyz2crxFs+2tMZwG3eZHJ1s4oWWbLiRtgle2O0c=;
 b=HXZ8DjSLvI0Xyf4FY3dc1bn7f+NGczRjMw8VMTXeQmyy6lR4fW9QTIgf
 z/VeZ6UT3FS2jWtFRATkDL+U/U1ZRV4VL9B+6ieTsJytZMISkoYE6TK+8
 e1jvtd/X8zzzKM1zEA6QN6mP99cKQ5JMqc5sfweq9aAQJdvNluPhYXvSw
 4w96jGu818TA1HaDZiI0OVr56rouKTuHHL5uSn0W5bIAXhUbkDx6TaVmv
 mfdWGJep0QQ3566oCo0QfESUCPph35mc7nIMleH37IKbGTvG8E6rKHrpq
 P6cr83yBHxM/aYoi4QszdEnqd9oJuiLFsjGEYAA0/wTBHuqJxH0IxuQou A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="366880604"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="366880604"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 00:04:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="770943722"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; d="scan'208";a="770943722"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Mar 2023 00:04:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 00:04:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 00:04:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 00:04:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 00:04:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeL/7w+MMYP+ecxPmrJ6QFLEC9yUkFg5AH+sdJq8MxfATNZB9yohtKAkBoKQNpknuF2TGHbl+bYuMwZiKzGNRuaN9IsfqxaLyy05LNbMKJkZB3ikguzqtvNKrKNOkmPrycNSzR1fvfmJl9Z/yDCvtPajBiFbnGUyZgqf35QeksFK2k5uOTqGS/WpSpBgmbrV5BgT6ETgbGHiDhDrTSBwJLLA0DYTmMczdzzGfAZncNTUxLJWsQI0rF8j4rFwKWJnpS1IiynOwVpMVU+khmHWzdp/IPifeVVP8kNcYuhwwhEd6aB3wyWgw5mxkVJirff4akFwXOzAeEkOWmCKU8kngg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfn4H4//IIKLLBEiSiP6iWmFiKHOJ9GhCofL0c3mHuw=;
 b=mTI5gFniO23yDAW/HVq5zjIy8nCyU63AEWUAwBWeJfm31c8S0yi4DX9Uy54s5TNXhGYxzTTKvGBu1gqsaRY4Ik5ip9QhwOutoGMCGo6fR57Ew5HadxHgHXprxFE/DPK7AEi4XZg74gJoXcqwNa4p7KXrJFEBuhOvYKCgKr/ofmlcf6RMUBXzj7T8MjbR3mLcgcOXIxmCh+vSUHwvTpENC/ERpLxIAkBRQ114DVOc5jRT22DnuEmZxtnTXq/irGvP8Zpxy4ZcW4OMjGZKH+0Xo8vGh5suU0cvJN3yxh2EnL1OGMihUAtDndFhMAgt6tNJCpPlQM5E7+xJB4kIj6gkOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by DS0PR11MB8115.namprd11.prod.outlook.com (2603:10b6:8:12a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 07:04:38 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5%4]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 07:04:38 +0000
Message-ID: <5b6e142a-0792-0ed0-73c8-df0d44b90c87@intel.com>
Date: Wed, 22 Mar 2023 15:04:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] target/riscv: reduce overhead of MSTATUS_SUM change
Content-Language: en-US
To: <qemu-riscv@nongnu.org>
References: <20230321063746.151107-1-fei2.wu@intel.com>
 <609e4659-532f-0fe2-447a-f7deaa0824e5@linaro.org>
 <209d36a3-c136-5288-a842-3c0b5f1b5d0a@linux.alibaba.com>
 <4f63f756-55d1-70f6-10e1-875c1e515fdf@intel.com>
 <b48b2cb9-bf2c-f527-435d-df497ea4df76@linaro.org>
 <38598c82-f625-b84b-0f91-30b1fe98e8c6@intel.com>
 <fcac17c1-0a7e-4e84-9fce-904037e52b29@intel.com>
 <2a0ad699-f5fa-e007-70db-4891caaacd36@linux.alibaba.com>
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <2a0ad699-f5fa-e007-70db-4891caaacd36@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::18)
 To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|DS0PR11MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: ad6228c1-0475-49b6-98d2-08db2aa3b340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DMP7oM3j7Oq4J9dezE55U3TCHZ13D2lrePQywVRN4Sro3ePUuacaLMS6rq0KqKqYLetW6HaucGOqQV4do/jCiTuqDnCtxYd/mvu/2a7ykWkUWf31Ndjp9fSpK3cRzflnaD4xR0H7zOjblodXsqMRohhZguxtie4lXr6koRhAMBjQSVy4dp5WeVyoCAy5Lm8ujMJd8eDhB03rGv3ec9aDyCM2Lk2etUYMXgesORSeU9Mq1J2nwbcA+AozbAXxSNghBVPqQg/Jn12ZD3kohE5PgXwavCC/JdFduB2+JH2V5iFPTSmEMxDtltioShTspJVGZ8ibS/0O9p5gmB4BI1RE5MyeORR8AXENnvSQxxh26uTIqGAT8doJZ96UceIdK/ctIty2rq9gDFMW7z9IQNOIt7m26bNzi0cFuAzTTEMOoe+LpUPS7O32tHSEsAl2f5TfO1z2SxgVlVrFxZqC4UcHZf+3QQ3y2wJAcyeupi2pUVj0pVExl4hDV/hOeAT8v62RRjiZ/E0Csk9T+FI1c8APDBnqJe0QvZcBTcYPHS4MtX382Pfoy3/KBVYAL23MCI5qynAWbgn2nmamxMcPgh47tpz0tado1Be52U7GkP+9obzcY1NBsY7HZvrIY9CdUywLlQkEVHOKPjvTW9RTSHM0sCgr+vFWFFE4kOTo3P/Yf093+0MKJyx4AUSwFQ7FB/tSH7a7JItJAW8KcDAwNJDM2RBaLY4K6ppB2BvXdETXyuI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199018)(86362001)(31686004)(31696002)(6486002)(478600001)(38100700002)(316002)(66556008)(66476007)(6916009)(66946007)(186003)(6666004)(82960400001)(8676002)(26005)(41300700001)(6506007)(6512007)(53546011)(5660300002)(36756003)(8936002)(2616005)(2906002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmVLdHdydkF6OUg4ZnNnM3JtNER4TXlUNzVEV0tPZFdoMzd0M2F2bFVmOSti?=
 =?utf-8?B?ejR2YUNGaTRVaW1JNFBBTGpRMlRhdnUvcHFiUHlkcVhGMDBFdWpETXJGbzJn?=
 =?utf-8?B?RU5SZDlqQTNaV3N3bkpBTDhGMjF3ZERtWmVXd3UvRzhnOUJ6cERSWFRvaExw?=
 =?utf-8?B?YUFiNm9GSlJYNlJUQWpHWWlwK3hsVk9iY1hZakxxRUppMTc1bHpmY3NBem1t?=
 =?utf-8?B?eEVlS2RxL1NTUXJ1RU1zM25FUnJEY2c4OTc2MklKemtYU2xzZ2lIQVd4eWdU?=
 =?utf-8?B?S1pwV0w5WTVuNmlMakxOTFJ4V0NzQzc4WGVLV3pLVTNpNVRNQnlrL1d1elN1?=
 =?utf-8?B?QVgyK2FHSDBqSWppZHhFZ0ZVaEVmSHR0Sm4wUVZGL0RQWGRKcVRYcVRkR1ZC?=
 =?utf-8?B?S3JZS3JRSXY5RmpDTmVTN1FCc3UxNmVJd0VtRlR1Ykg0YU5UaERMS2l5ajhQ?=
 =?utf-8?B?bEhlOXVMTDg0dTg0SFdNWitvVUZSdzVzZ0ZGeWdMZmFUUGNHVFpGbld5WW01?=
 =?utf-8?B?VnRkb0VYZk5uYTY1S3c2RngwaSszelA2OXpaQ0RRbVMzY1ZuNGVsc0Z1M09R?=
 =?utf-8?B?bXZQTFhKTzR1N0ErZG1ydU56eWUyMDRTRVRpbjlPWEdEZEV5Q3NkMzI3YUhj?=
 =?utf-8?B?Q3NGTUZPQnJHYnp5bGFuY2NmNGVPczdWbWRyWDFhUVRtU1RiZklzU0M4OVhY?=
 =?utf-8?B?R0ZtbEQwYzVqWnFwayt6cG5VUFhlVUlpUThlcEhFZUc1TmpzeDk5WnRmcFRq?=
 =?utf-8?B?ZHVkcC84aGxybmpleVl2c1dCb3FDU1c1WlBsN3Nla3p4Vzd6RDlYMFl6QUE4?=
 =?utf-8?B?S3NUaUxQYUZvY3hBZDBJRm45QTFteXlqSmt6cEdGRGswVjZmK1JvV3hLQmVZ?=
 =?utf-8?B?ZXkrZ0NkcW8vSU0rVFR1K2QxdWkxQmExZUlYMFpwNEVVa21tTmtWSzREcXdn?=
 =?utf-8?B?c2tFc1RnTTkyUmF0WWdNTnR6Q0lacWJWY2EvWEpMNWw1TWU3djEzaVRKRGxY?=
 =?utf-8?B?SFZGVTNIWXNacnc5aE9VanBDTk1oTEgvdWk1Skw4Z2tLdE0rZ1lPSDRnbGhm?=
 =?utf-8?B?WS9GVXVWTEI1cFNQeHM5N252UCtFQWY2N3ZNK3FSOVcyM1RlbXFJaUlKV25y?=
 =?utf-8?B?dzc1T1A5M1IrdUs4b1RFOVRxVG1HMUZTZVQ4eHdabXBhQUZZeHhTanJsQVhl?=
 =?utf-8?B?YVZZemNxRmh4VGhiZjNuN2RUUndsaE1odThBYlFVeml6bE9wemhwWjErOHRk?=
 =?utf-8?B?L0N6ZEROUXVaaTgxTWJXUkR5aGVSejU0eEpMK3dRVW42ajBOZnFzTkJldUNU?=
 =?utf-8?B?NEJieCtWVG83S2xjRFFzQVFGQUdGL3l0TVJadklpcmxjeDFWVWptWlY2YTVM?=
 =?utf-8?B?TFdDYzBEc3l6eDl0YXdVZjk2eGxBQmQ4Rnk1V2FtbVJRSXU4YjF0RjJESzV1?=
 =?utf-8?B?QmExaVhGMXpBbzh2ZVlFYUlWaFJvUGJEWCtyclJBVXBiOHN4TUd1Zk5RbGJh?=
 =?utf-8?B?WnFuVDBQbk51VHBOSjJVZUl4dUYrMG9uTStFY3JCeWFMaHBWdUZQK1F2VXcv?=
 =?utf-8?B?SDZhVHM0Qzh3bWFPdXZ6N0NRS0I4SWpTdGtobGlkSHJ5R2hXSGFCV2ovOGlk?=
 =?utf-8?B?dHBQQmRQOFY5Y1pYZnFuUVdRZWNSMjBHTWd0U2l5UGk5bFhNcGdGL2cwQ3ZO?=
 =?utf-8?B?cWMya0ZPcVl1VjJIQ2szZVlaV3pXSG10WWcrcTc5U2RNKzUvaTZ1clhRMVkw?=
 =?utf-8?B?L3hKUzNkL3d3T3VneVB1RHFxTGNKRVJxWUMrd0k3ZjU4L1NTZ3M2UzZ6NStS?=
 =?utf-8?B?eDA4bXJXZnBFbnNxUGFVdng2YVBWSkk5R2cxS1lpVlBNNk1Wdy9Eb20rdkR4?=
 =?utf-8?B?c044aC9OQ0pRdkFnd3l5S1hpbTdDaDZ3VDJDa1B5U0dtK0JlaGRqMmZhajQx?=
 =?utf-8?B?SUhablZpeElIa0F5UXJTL1FYblUrM0R6ZXZmMERUay9oc0ZuT2JiWGRkY3hJ?=
 =?utf-8?B?YjJBWHczb1FwRTZJS0dkSHNHd0dpVmZ1bjhTV2UrOWdLZldHNGxxZmpXUHg0?=
 =?utf-8?B?SCtEeWcwNVNyVFFJVHU4Vm1Gbk5walN1Sk9YMEg1V1ZILzkwRmRWWi9wS1l6?=
 =?utf-8?Q?9+b4af3SCdHPbFtjR5BfXPVz1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6228c1-0475-49b6-98d2-08db2aa3b340
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 07:04:38.1416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWr2ilopi07m+fCT2AKIEpgnlycBQgiPLJDZZdXYt8OxRTX9sy9CbmBOD6Ojmf7DZqEQmRRG3+qW2YDQeXDoiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8115
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
X-List-Received-Date: Wed, 22 Mar 2023 07:05:00 -0000

On 3/22/2023 2:50 PM, LIU Zhiwei wrote:
> 
> On 2023/3/22 14:40, Wu, Fei wrote:
>> On 3/22/2023 11:36 AM, Wu, Fei wrote:
>>> On 3/22/2023 11:31 AM, Richard Henderson wrote:
>>>> On 3/21/23 19:47, Wu, Fei wrote:
>>>>>>> You should be making use of different softmmu indexes, similar to
>>>>>>> how
>>>>>>> ARM uses a separate index for PAN (privileged access never)
>>>>>>> mode.  If
>>>>>>> I read the manual properly, PAN == !SUM.
>>>>>>>
>>>>>>> When you do this, you need no additional flushing.
>>>>>> Hi Fei,
>>>>>>
>>>>>> Let's follow Richard's advice.
>>>>>> Yes, I'm thinking about how to do it, and thank Richard for the
>>>>>> advice.
>>>>> My question is:
>>>>> * If we ensure this separate index (S+SUM) has no overlapping tlb
>>>>> entries with S-mode (ignore M-mode so far), during SUM=1, we have to
>>>>> look into both (S+SUM) and S index for kernel address translation,
>>>>> that
>>>>> should be not desired.
>>>> This is an incorrect assumption.  S+SUM may very well have overlapping
>>>> tlb entries with S.
>>>> With SUM=1, you *only* look in S+SUM index; with SUM=0, you *only* look
>>>> in S index.
>>>>
>>>> The only difference is a check in get_physical_address is no longer
>>>> against MSTATUS_SUM directly, but against the mmu_index.
>>>>
>>>>> * If all the tlb operations are against (S+SUM) during SUM=1, then
>>>>> (S+SUM) could contain some duplicated tlb entries of kernel address
>>>>> in S
>>>>> index, the duplication means extra tlb lookup and fill.
>>>> Yes, if the same address is probed via S and S+SUM, there is a
>>>> duplicated lookup.  But this is harmless.
>>>>
>>>>
>>>>> Also if we want
>>>>> to flush tlb entry of specific addr0, we have to flush both index.
>>>> Yes, this is also true.  But so far target/riscv is making no use of
>>>> per-mmuidx flushing. At the moment you're *only* using tlb_flush(cpu),
>>>> which flushes every mmuidx.  Nor are you making use of per-page
>>>> flushing.
>>>>
>>>> So, really, no change required at all there.
>>>>
>>> Got it, let me try this method.
>>>
>> There seems no room in flags for this extra index, all 3 bits for
>> mem_idx have been used in target/riscv/cpu.h. We need some trick.
>>
>> #define TB_FLAGS_PRIV_MMU_MASK                3
>> #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
> 
> #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 3)
> 
> Renumber the new mmu index to 5 (Probably by extending the function
> riscv_cpu_mmu_index)
> 
Currently mem_idx is also saved in flags (tb_flags) below, which only
has 3 bits for mem_idx and can't expand.

Thanks,
Fei.

> Zhiwei
> 
>> FIELD(TB_FLAGS, MEM_IDX, 0, 3)
>> FIELD(TB_FLAGS, LMUL, 3, 3)
>>
>> Thanks,
>> Fei.
>>
>>> Thanks,
>>> Fei.
>>>
>>>> r~
> 


