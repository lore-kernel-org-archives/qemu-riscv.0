Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1podFg-0005ab-MD
	for mharc-qemu-riscv@gnu.org; Tue, 18 Apr 2023 00:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1podFf-0005a4-Cj; Tue, 18 Apr 2023 00:47:35 -0400
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1podFc-0007x6-Ru; Tue, 18 Apr 2023 00:47:35 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VgNwMUW_1681793238; 
Received: from 30.221.97.146(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VgNwMUW_1681793238) by smtp.aliyun-inc.com;
 Tue, 18 Apr 2023 12:47:19 +0800
Message-ID: <860f1cb8-71d0-51e8-eb5d-878c059a5eae@linux.alibaba.com>
Date: Tue, 18 Apr 2023 12:47:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/6] target/riscv: Fix PMP related problem
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, richard.henderson@linaro.org,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230413090122.65228-1-liweiwei@iscas.ac.cn>
 <3038155a-6190-5aa5-7425-ad0d957fd7a6@linux.alibaba.com>
 <3ace9e9e-91cf-36e6-a18f-494fd44dffab@iscas.ac.cn>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <3ace9e9e-91cf-36e6-a18f-494fd44dffab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.98;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-98.freemail.mail.aliyun.com
X-Spam_score_int: -121
X-Spam_score: -12.2
X-Spam_bar: ------------
X-Spam_report: (-12.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-2.284, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 18 Apr 2023 04:47:35 -0000


On 2023/4/18 11:36, Weiwei Li wrote:
>
> On 2023/4/18 11:07, LIU Zhiwei wrote:
>>
>> On 2023/4/13 17:01, Weiwei Li wrote:
>>> This patchset tries to fix the PMP bypass problem issue 
>>> https://gitlab.com/qemu-project/qemu/-/issues/1542
>>
>> Please add your analysis of this issue here.
>>
>> By the way, I think this problem is introduced by
>>
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg939331.html
>
> It seems have no relationship with this commit.
>
> I think there are several problems for this issue:
>
> 1. TLB will not be cached only when the access address have matched 
> PMP entry. 
TLB will be filled only when PMP check and PTW check pass.
> So the other address access  may hit the TLB(if first access of the 
> page didn't hit the PMP entry)
This page will not be filled to TLB if the first access of the page 
didn't pass the PMP check.
>
> and bypass the pmp check. This is fixed by patch 1.

Never it should be.

Zhiwei

>
> 2. Writing to pmpaddr  didn't trigger tlb flush. This is fixed by 
> patch 3.
>
> 3. The tb isn't flushed when PMP permission changes, so It also may 
> hit the tb and bypass the changed PMP check for instruction fetch. 
> This is fixed by patch 5.
>
> 4. We set the tlb_size to 1 to make the TLB_INVALID_MASK set. However 
> this flag will be cleared after fill_tlb, and this will make the host 
> address be cached, and let the following instruction fetch in the same 
> tb bypass the PMP check. This is fixed by patch 6.
>
> Regards,
>
> Weiwei Li
>
>>
>> I have commented on how to correct this patch. But by accident, it 
>> has been merged.
>>
>> Zhiwei
>>
>>>
>>> The port is available here:
>>> https://github.com/plctlab/plct-qemu/tree/plct-pmp-fix
>>>
>>> Weiwei Li (6):
>>>    target/riscv: Update pmp_get_tlb_size()
>>>    target/riscv: Move pmp_get_tlb_size apart from
>>>      get_physical_address_pmp
>>>    target/riscv: flush tlb when pmpaddr is updated
>>>    target/riscv: Flush TLB only when pmpcfg/pmpaddr really changes
>>>    target/riscv: flush tb when PMP entry changes
>>>    accel/tcg: Remain TLB_INVALID_MASK in the address when TLB is
>>>      re-filled
>>>
>>>   accel/tcg/cputlb.c        |  7 -----
>>>   target/riscv/cpu_helper.c | 19 ++++---------
>>>   target/riscv/pmp.c        | 60 
>>> ++++++++++++++++++++++++++-------------
>>>   target/riscv/pmp.h        |  3 +-
>>>   4 files changed, 47 insertions(+), 42 deletions(-)
>>>

