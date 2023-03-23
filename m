Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfLAe-0002RG-OB
	for mharc-qemu-riscv@gnu.org; Thu, 23 Mar 2023 09:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfLAd-0002QW-JC; Thu, 23 Mar 2023 09:39:59 -0400
Received: from mga09.intel.com ([134.134.136.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>)
 id 1pfLAa-0002mb-Vy; Thu, 23 Mar 2023 09:39:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679578797; x=1711114797;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h6zlfcqZTgem7rZXaxKbdeYiS9InDM0NVxsPyfhdVNc=;
 b=aVXrkS+h0Gkcop+v+x175Bryfdb+VQQMirtGD6Ed3Kuy84yTmxIuwTHR
 wGAqEVWbBtPks8dgZK4ah0qwlWS0Is/ReBczb5lGxMduDH3Haqh6tNws+
 7B2jf3nQJ/S8YOb0VIhjAwjGMkl/fki2wcUOPNlxNZNH/9xgWrXBRxlwE
 ayQi9SOMSEP2TBhAqgl3qOvjUjeJt5k8j+EHfJXtpqA2WqCrZVVo6RTAO
 788Ia0DiOB4Wbn5NulubGagCM4aOH4/F+Na1BiKSlKFRHWMDyioCsHTH/
 wagJ+5zVMmtYeNfDuQVWNRd9svaXZ7Xu3QQ/f7pm9xH1rINs6n43sxszY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="341036041"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; d="scan'208";a="341036041"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 06:18:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="771458779"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="771458779"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Mar 2023 06:18:33 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 06:18:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 06:18:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 06:18:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+nLqn3wiZtC/7ZHW6EzJWzFA2y0ugfsSH9SSiIdsUjeDovGz+YEPaLJXuWtHPowch/Woq+4aHiZ2RUlMp8pxTZdRcF4ZA1pyT29YlSJlY3cFGv7XTdPWcQTwETZ2r6FnKboxL3bAjrUp5L88vJVVadH4mLioB100YqLCS9/kKom+gZYr9ns543TPmzKrPyb5pOJcbKwTIC6SG8Q01i3vuwN3RLNVzRrJf7HYTGIYHuxz4euX/cy9M/WE3gW5SY+3aO/v2pua7WVVQrxAVxNVcqLkF629YCTypNw2q/WACCnDuDqMYZBmzFM1vKjyE+yxXrIc+6PfV+YNxytKeorEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIYmZ33uvwqiRXkw29k1VGaS+YrJYHXKCt0LspNTVnk=;
 b=X+UUf0JZ2bDfCi+ZddvxqeiYVzg7RqWB0mvfQO17tyK470RYUaGU/PhY6KvbMhvQ8vRChcCc8yueXwkh4c1TAkI/VqPP+uoH6GgVshsN34V/o9LkIkKF7eCBW3OfmXyBjs6RxIi38ZizTTOoRmPSx/BVCs8jy4f+3M8mk8O1hNZ//fm4LURbDmsC4civoT9w3y2b8kTY6m7Sa+qC+zwsyePwbB0oTzOZH787MsF6X9waQi92AKU7KbYvw0eWI4Xc/X5nAnriOCAPlq+s/SavdcNeLgtwYVkyCcmItTTYlt6/D/mPZLs38tJWXUuwC7e2p21WCojIrwe72EYAG5eiBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4500.namprd11.prod.outlook.com (2603:10b6:a03:1c3::24)
 by SA2PR11MB5004.namprd11.prod.outlook.com (2603:10b6:806:112::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 13:18:25 +0000
Received: from BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5]) by BY5PR11MB4500.namprd11.prod.outlook.com
 ([fe80::68a4:ef95:6726:3fc5%4]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 13:18:25 +0000
Message-ID: <546d0159-1324-17ed-2382-5856e98b8f29@intel.com>
Date: Thu, 23 Mar 2023 21:18:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 1/2] target/riscv: separate priv from mmu_idx
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, <qemu-riscv@nongnu.org>,
 <qemu-devel@nongnu.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
References: <20230323024412.324085-1-fei2.wu@intel.com>
 <20230323024412.324085-2-fei2.wu@intel.com>
 <9423db2e-257f-016d-b404-17d8e5adc0ac@linux.alibaba.com>
 <7db6d615-5ddc-5e1b-1d3c-a85c22e6af74@intel.com>
 <91754207-f91f-25dd-605c-1d10b33d229a@linux.alibaba.com>
From: "Wu, Fei" <fei2.wu@intel.com>
In-Reply-To: <91754207-f91f-25dd-605c-1d10b33d229a@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:3:18::27) To BY5PR11MB4500.namprd11.prod.outlook.com
 (2603:10b6:a03:1c3::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4500:EE_|SA2PR11MB5004:EE_
X-MS-Office365-Filtering-Correlation-Id: cf5978ad-48bd-490c-d08e-08db2ba1152c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XKa5wDrKg1tqQW90/W7Gz76bBzzcHHd+3ClUoCO3eaet3rDPZCyCYITsFQcY03X6MFumrFYWPzmv5THGPhkuwYWVUqDG0utDZ1IyJvvWVZz8paItaA8j06ii81fhO928ax6EBCCKvQ65seBw/+s5SWHcl2c3s1u+rq8KBSRolcxydHMcC+l3/bXOEE1O1x+7tjxkggSaawo0kfMGaCbQsVdYwrQNR9GjqiMs6BmNI/f+xdw6GI88ehEkkXT7x8mSIYXnDpyCnp6hRmXz1T6LOrrK6SrDDk0KUf3oBx2xm86iOiZEVUq7tRNcwEtHEQ0x/xIurAwA5S+6FzoZyOivcVG1a0v52gJxAlyGsOqa3JwvbGqvRF9sEXsI6A4YzPt2kGktA8LbJqE5bg38IauL13izGJIbJWiKFRQVVhz66SaYan0RD6xQXz7+vNsMjIgWEk+C0e/vtVO9Dz9sRUgXXFfYIheSR3cwKuIkwqAn4eY7NHj8kbfjxzWNlA5tj9/UrPyJH5iRGSZs1U6863SF+P9vEkpvtUZX+LH/XwZAYdBxxb3cFto3jvDUGR0Rli9tX6uIl/3fj/zJJDxA13j2aOvDuhNixdL8lXbqEZ4AgglVrgDuklm3LcnKfQkeSWcB/m43bEFeNo4KJ5Ymluh5QMO8J59PHNZmGeiLjmD3e3svwwA9HNKO12lipwlXSv3GlSwLZzDeoJLLuqzD9plABiYOwC38Weme9hxofRHzyLQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4500.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(376002)(346002)(396003)(136003)(451199018)(31696002)(86362001)(36756003)(82960400001)(38100700002)(2906002)(41300700001)(66476007)(4326008)(66556008)(8676002)(5660300002)(8936002)(66946007)(2616005)(53546011)(186003)(83380400001)(6512007)(6506007)(54906003)(478600001)(316002)(26005)(6666004)(6486002)(966005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHkwRFpCOUN3TW9jeFYrdWtQRmFsaVlPUzRqM1RNYUp6dTJNM1JvRC93ZzhR?=
 =?utf-8?B?UUZhbENIOFlaVVdEUU16ZStuakQ5TFJoNXZacmpkZGxmUzlrMEZBUXJNaEJq?=
 =?utf-8?B?VTI4S24vYTlXWFhqZjlsUjNZUktYc1M4SVdIendxcUwxUXZZcVBReW8vZ1dF?=
 =?utf-8?B?SGkwN1d1TkRyQmJ0UXEvZE8wWnZuWU1kRHczb2pnZTBQZ3lCQkdGQ3I5Rlg0?=
 =?utf-8?B?WUJmZ3ZxZEE4ZHhZZzAxUFg3ZW5FcEVMWHVtYXdjRStIdEVNdk1EQ3h1WEc5?=
 =?utf-8?B?eTlRRFIraWN4Q05CTnowYVpqQ1FnMmczNmVSSEJFZURoYWVSMGpEZ1BKMmtG?=
 =?utf-8?B?YnNaTGRjeDI1R09GbGZmdkRFK05mVk1kNzNkYnFLai81U0FXd2VMRnFWUjZI?=
 =?utf-8?B?azNhRUpQVlhJd1hMY2tQb01TVzBvV2FqQ0ErL2R5RUw5dmwyQzJMRlhtWUJw?=
 =?utf-8?B?OU1PaUVKcXRlQ0hrRnBVT1pqQjl6b3pQOWNhbWlLN0c0TnVVRTRwb3FrTS9E?=
 =?utf-8?B?RXkzSXFVR0t4V3EvQnQyT0FsUmFNVjQ5WU41VzI2MmZlMDYxQmRtNjI0Sncy?=
 =?utf-8?B?WS9NZEg2UXloUU9wNlJXM2JaamZkZDBzaExBZEpUaUNVbnJJR0ViYWwxV2dD?=
 =?utf-8?B?blRtQkhEc0laQThjRVB5dkRPbXhvTkwzV1RTSWlCTGNOZFRVVmhpMWlMbUNB?=
 =?utf-8?B?cmlkUXZnWmFBN214bE0ySkdtYzZTRlZjSlJTdTh4dEczTElCZnFlZFMwbHg2?=
 =?utf-8?B?RWNBdXRSNW5VT1B5SENIMnJVbkhtUzVnU1BFN2RQNjA2Nm1DTnNNWU9OdnJ5?=
 =?utf-8?B?dTZBQmYydkJRdjZuNUtrRDcwMUdZUk52N01vME02UFBXOFNDWGNLMis5Vyt3?=
 =?utf-8?B?Zmk5cTkvdjBJZGwyQ09TbTRiaCs4MDd3WmN1WTMwaHVVUTcxblJSNFdrSnNm?=
 =?utf-8?B?dzk0L3kzU3lBakd6VHp6amJ6alBCbkpldWgwM2hkL2VINFdxR1lPNVg4UmRv?=
 =?utf-8?B?UEJ6MmVFVStnRm4zMXpXSHRGbzV1VHREa3Q4ZHVvQ3pQRHM1TDhJbWxjb0VE?=
 =?utf-8?B?YUk5ME5ubk8xRmxYSlJLWGZsTytZUis5SitBeEFMN3pRTUhVa1RLRFR1OGZF?=
 =?utf-8?B?bmJqQjdTRFIwLzNZaUI2TGljWXgvdnRsNGZkaExqWW5BWU5jVzNTMXBEREY2?=
 =?utf-8?B?Zno4Skc0TGJVWVBoSGd6L2k1VFdYRG1NYWJMczI1Q2lEclpHcEkxRzlaelcz?=
 =?utf-8?B?dlY4YUJ6UllnTXFWUk81ci9nTVJEYTdXMG4xaU1zeFRlcVA2U0VpTFFaWVJ3?=
 =?utf-8?B?azFDVi9sVnRzM2dqeWdxY1pZQXU2c1JFL0JIL1VyVkU3OE1mR3o0QVBIMCtK?=
 =?utf-8?B?cGFqeHMvbC9iM3hJdFd1ckJRUXJjZ2tyYzNGbzRFell4Snk1LytLVm0weUlx?=
 =?utf-8?B?Wlg4eWRYaklDM3Qyb3plUW4xYWRjWVo0VmlaWWkrU1pVUW8rTTRFQm5zR3pj?=
 =?utf-8?B?QVFvRW9kVVhzeXVyREoyTWtYNC9iekVlcHkrKzYrUHRZcThhNmpKMkxZaWVo?=
 =?utf-8?B?eXd1K3BwckJZRW9kaUdsVEtsN3d3RmV4V29Kcmg1VnNQdWJzdEtLYzRIbjhZ?=
 =?utf-8?B?YkhlK2VuY0dhN1diYUpwUnY3VnVEYXZMYXUyNFRIUWJjWWE4bkNMSEhzenlx?=
 =?utf-8?B?dUprdXduVGNzN05sVHZSLytHS3RMNThwNlFrQ2JweUxRK1RRUDlJaWNHQXJI?=
 =?utf-8?B?MGJmb0wxeTZmZG9nMXB2ZE4vTVkxVUZJU254YnlORFJSellGUTNQMTRCMkJK?=
 =?utf-8?B?Rkx5NkQ4bDAxOUVvMUlURlpRRDArZndTb1lIVXMvOHZhaTNKWVg2T2FObmN5?=
 =?utf-8?B?UDdSZU9TTkNPY2FaYzVOYmZmTmhCVEkzTnhpR0oxa0t2aU00UjFyOVh3NVhi?=
 =?utf-8?B?cUR1OXZEWTg3QXlGTWZNYjdVTkFIZDdDVnNZT0dpNnZFeEc4MEg5RC9xWmVD?=
 =?utf-8?B?WDU2K1oxYk1oZUlRc28yektOakFsUnErNGdxVmJlY0lGWExKeThPcHVqSjlU?=
 =?utf-8?B?S1lsb1ZKSHJNUWxwMjVabitjRzMxVWZScVJZVC9MTklDc3ZnbXdZMFArOGNv?=
 =?utf-8?Q?Quf+wRDCCCdsm6u8BkJU7db0q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5978ad-48bd-490c-d08e-08db2ba1152c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4500.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 13:18:25.1169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6RAUhtFlOb4I+f7oENR/IX1k15Z20/Wzj/3sgHSI7hBB0nvwKWNIaUB+S5Jmn7p1iLCpvw7Qpl3WA8k1k7V2eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5004
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
X-List-Received-Date: Thu, 23 Mar 2023 13:40:00 -0000

On 3/23/2023 2:59 PM, LIU Zhiwei wrote:
> 
> On 2023/3/23 14:00, Wu, Fei wrote:
>> On 3/23/2023 1:37 PM, LIU Zhiwei wrote:
>>> On 2023/3/23 10:44, Fei Wu wrote:
>>>> Currently it's assumed the 2 low bits of mmu_idx map to privilege mode,
>>>> this assumption won't last as we are about to add more mmu_idx.
>>> For patch set has more than 1 patch, usually add a cover letter.
>> This is cover letter:
>>     https://www.mail-archive.com/qemu-devel@nongnu.org/msg950849.html
>>
>> I added scripts/get_maintainer.pl to .git/config,
> Interesting.
>> it couldn't find out
>> the maintainers for the cover letter, so I added the mail lists to "To"
>> manually.
> Maybe you should also cc to maintainers manually. I don't know the
> automatically way.
>>
>>>> Signed-off-by: Fei Wu <fei2.wu@intel.com>
>>>> ---
>>>>    target/riscv/cpu.h                             | 1 -
>>>>    target/riscv/cpu_helper.c                      | 2 +-
>>>>    target/riscv/insn_trans/trans_privileged.c.inc | 2 +-
>>>>    target/riscv/insn_trans/trans_xthead.c.inc     | 7 +------
>>>>    target/riscv/translate.c                       | 3 +++
>>>>    5 files changed, 6 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>>>> index 638e47c75a..66f7e3d1ba 100644
>>>> --- a/target/riscv/cpu.h
>>>> +++ b/target/riscv/cpu.h
>>>> @@ -623,7 +623,6 @@ G_NORETURN void
>>>> riscv_raise_exception(CPURISCVState *env,
>>>>    target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
>>>>    void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>>>>    -#define TB_FLAGS_PRIV_MMU_MASK                3
>>>>    #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
>>>>    #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
>>>>    #define TB_FLAGS_MSTATUS_VS MSTATUS_VS
>>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>>> index f88c503cf4..76e1b0100e 100644
>>>> --- a/target/riscv/cpu_helper.c
>>>> +++ b/target/riscv/cpu_helper.c
>>>> @@ -762,7 +762,7 @@ static int get_physical_address(CPURISCVState
>>>> *env, hwaddr *physical,
>>>>         * (riscv_cpu_do_interrupt) is correct */
>>>>        MemTxResult res;
>>>>        MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
>>>> -    int mode = mmu_idx & TB_FLAGS_PRIV_MMU_MASK;
>>>> +    int mode = env->priv;
>>>>        bool use_background = false;
>>>>        hwaddr ppn;
>>>>        RISCVCPU *cpu = env_archcpu(env);
>>>> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc
>>>> b/target/riscv/insn_trans/trans_privileged.c.inc
>>>> index 59501b2780..9305b18299 100644
>>>> --- a/target/riscv/insn_trans/trans_privileged.c.inc
>>>> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
>>>> @@ -52,7 +52,7 @@ static bool trans_ebreak(DisasContext *ctx,
>>>> arg_ebreak *a)
>>>>         * that no exception will be raised when fetching them.
>>>>         */
>>>>    -    if (semihosting_enabled(ctx->mem_idx < PRV_S) &&
>>>> +    if (semihosting_enabled(ctx->priv < PRV_S) &&
>>>>            (pre_addr & TARGET_PAGE_MASK) == (post_addr &
>>>> TARGET_PAGE_MASK)) {
>>>>            pre    = opcode_at(&ctx->base, pre_addr);
>>>>            ebreak = opcode_at(&ctx->base, ebreak_addr);
>>>> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc
>>>> b/target/riscv/insn_trans/trans_xthead.c.inc
>>>> index df504c3f2c..adfb53cb4c 100644
>>>> --- a/target/riscv/insn_trans/trans_xthead.c.inc
>>>> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
>>>> @@ -265,12 +265,7 @@ static bool trans_th_tst(DisasContext *ctx,
>>>> arg_th_tst *a)
>>>>      static inline int priv_level(DisasContext *ctx)
>>>>    {
>>>> -#ifdef CONFIG_USER_ONLY
>>>> -    return PRV_U;
>>>> -#else
>>>> -     /* Priv level is part of mem_idx. */
>>>> -    return ctx->mem_idx & TB_FLAGS_PRIV_MMU_MASK;
>>>> -#endif
>>>> +    return ctx->priv;
>>>>    }
>>>>      /* Test if priv level is M, S, or U (cannot fail). */
>>>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>>>> index 0ee8ee147d..e8880f9423 100644
>>>> --- a/target/riscv/translate.c
>>>> +++ b/target/riscv/translate.c
>>>> @@ -69,6 +69,7 @@ typedef struct DisasContext {
>>>>        uint32_t mstatus_hs_fs;
>>>>        uint32_t mstatus_hs_vs;
>>>>        uint32_t mem_idx;
>>>> +    uint32_t priv;
>>>>        /* Remember the rounding mode encoded in the previous fp
>>>> instruction,
>>>>           which we have already installed into env->fp_status.  Or
>>>> -1 for
>>>>           no previous fp instruction.  Note that we exit the TB when
>>>> writing
>>>> @@ -1162,8 +1163,10 @@ static void
>>>> riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>>>>        } else {
>>>>            ctx->virt_enabled = false;
>>>>        }
>>>> +    ctx->priv = env->priv;
>>> This is not right. You should put env->priv into tb flags before you use
>>> it in translation.
>>>
>> I see some other env usages in this function,
> Don't do it that way. It just be merged by accident. It will make review
> harder and probably be wrong.
>> when will env->priv and
>> tb_flags.priv mismatch (assume we have recorded priv in tb_flags)?
> 
> We always record the env->priv in tb flags if we don't merge your second
> patch in this patch set.
> After your second patch, we will not record the env->priv  into tb flags
> when SUM is 1. Thus we may execute a S-mode code when we actually in
> M-mode, which is forbidden by RISC-V.
> 
Do you mean the case of calling tb_lookup(flags) to reuse TB? priv
should be part of flags or it finds the wrong TB, SUM not?

Thanks,
Fei.

> Zhiwei
> 
>>
>> Thanks,
>> Fei.
>>
>>> Zhiwei
>>>
>>>>    #else
>>>>        ctx->virt_enabled = false;
>>>> +    ctx->priv = PRV_U;
>>>>    #endif
>>>>        ctx->misa_ext = env->misa_ext;
>>>>        ctx->frm = -1;  /* unknown rounding mode */


