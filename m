Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1podjs-00037x-JS
	for mharc-qemu-riscv@gnu.org; Tue, 18 Apr 2023 01:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1podjn-00036Y-TM; Tue, 18 Apr 2023 01:18:44 -0400
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1podjl-000409-4m; Tue, 18 Apr 2023 01:18:43 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0VgNwyPw_1681795110; 
Received: from 30.221.97.146(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VgNwyPw_1681795110) by smtp.aliyun-inc.com;
 Tue, 18 Apr 2023 13:18:31 +0800
Message-ID: <6653f84e-85a9-f6a0-9cb2-699c07eac654@linux.alibaba.com>
Date: Tue, 18 Apr 2023 13:18:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/6] target/riscv: Update pmp_get_tlb_size()
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, Alistair Francis <alistair23@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com,
 richard.henderson@linaro.org, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230413090122.65228-1-liweiwei@iscas.ac.cn>
 <20230413090122.65228-2-liweiwei@iscas.ac.cn>
 <CAKmqyKO4zAf18FPAzkKF9j1CV+RBaLc6-e45ZpBkJoKf8Y-dvg@mail.gmail.com>
 <2cf1870a-b668-13e5-7452-32e20c3cd0c8@iscas.ac.cn>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <2cf1870a-b668-13e5-7452-32e20c3cd0c8@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.113;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-113.freemail.mail.aliyun.com
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
X-List-Received-Date: Tue, 18 Apr 2023 05:18:46 -0000


On 2023/4/18 11:05, Weiwei Li wrote:
>
> On 2023/4/18 10:53, Alistair Francis wrote:
>> On Thu, Apr 13, 2023 at 7:04 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>> Not only the matched PMP entry, Any PMP entry that overlap with 
>>> partial of
>>> the tlb page may make the regions in that page have different 
>>> permission
>>> rights. So all of them should be taken into consideration.
>>>
>>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>>> ---
>>>   target/riscv/cpu_helper.c |  7 ++-----
>>>   target/riscv/pmp.c        | 34 +++++++++++++++++++++-------------
>>>   target/riscv/pmp.h        |  3 +--
>>>   3 files changed, 24 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>> index 433ea529b0..075fc0538a 100644
>>> --- a/target/riscv/cpu_helper.c
>>> +++ b/target/riscv/cpu_helper.c
>>> @@ -703,11 +703,8 @@ static int 
>>> get_physical_address_pmp(CPURISCVState *env, int *prot,
>>>       }
>>>
>>>       *prot = pmp_priv_to_page_prot(pmp_priv);
>>> -    if ((tlb_size != NULL) && pmp_index != MAX_RISCV_PMPS) {
>>> -        target_ulong tlb_sa = addr & ~(TARGET_PAGE_SIZE - 1);
>>> -        target_ulong tlb_ea = tlb_sa + TARGET_PAGE_SIZE - 1;
>>> -
>>> -        *tlb_size = pmp_get_tlb_size(env, pmp_index, tlb_sa, tlb_ea);
>>> +    if (tlb_size != NULL) {
>>> +        *tlb_size = pmp_get_tlb_size(env, addr);
>>>       }
>>>
>>>       return TRANSLATE_SUCCESS;
>>> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
>>> index 1f5aca42e8..4f9389e73c 100644
>>> --- a/target/riscv/pmp.c
>>> +++ b/target/riscv/pmp.c
>>> @@ -601,28 +601,36 @@ target_ulong mseccfg_csr_read(CPURISCVState *env)
>>>   }
>>>
>>>   /*
>>> - * Calculate the TLB size if the start address or the end address of
>>> + * Calculate the TLB size if any start address or the end address of
>>>    * PMP entry is presented in the TLB page.
>>>    */
>>> -target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
>>> -                              target_ulong tlb_sa, target_ulong 
>>> tlb_ea)
>>> +target_ulong pmp_get_tlb_size(CPURISCVState *env, target_ulong addr)
>>>   {
>>> -    target_ulong pmp_sa = env->pmp_state.addr[pmp_index].sa;
>>> -    target_ulong pmp_ea = env->pmp_state.addr[pmp_index].ea;
>>> +    target_ulong pmp_sa;
>>> +    target_ulong pmp_ea;
>>> +    target_ulong tlb_sa = addr & ~(TARGET_PAGE_SIZE - 1);
>>> +    target_ulong tlb_ea = tlb_sa + TARGET_PAGE_SIZE - 1;
>>> +    int i;
>>> +
>>> +    for (i = 0; i < MAX_RISCV_PMPS; i++) {
>>> +        pmp_sa = env->pmp_state.addr[i].sa;
>>> +        pmp_ea = env->pmp_state.addr[i].ea;
>>>
>>> -    if (pmp_sa <= tlb_sa && pmp_ea >= tlb_ea) {
>>> -        return TARGET_PAGE_SIZE;
>>> -    } else {
>>>           /*
>>> -         * At this point we have a tlb_size that is the smallest 
>>> possible size
>>> -         * That fits within a TARGET_PAGE_SIZE and the PMP region.
>> This comment points out that we should have the smallest region, so
>> I'm not clear why we need this change. Can you update the commit
>> description to be clear on why this change is needed and what it
>> fixes?
>
> This function return tlb_size to 1 to make the tlb uncached. However, 
> In previous implementation,
>
> only the matched PMP entry of current access address is taken into 
> consideration. Then, if other PMP entry
>
> that match other address in the same page, we  may also cannot cache 
> the tlb, since different address
>
> in that page may have different permission rights.

It doesn't matter. As the tlb size < page size, this tlb will have a 
TLB_INVALID_MASK flag and never match.

For this page, every access will  repeat the MMU check and TLB fill.

It is not fast, but with no error.

Zhiwei

>
> Regards,
>
> Weiwei Li
>
>> Alistair
>>
>>> -         *
>>> -         * If the size is less then TARGET_PAGE_SIZE we drop the 
>>> size to 1.
>>> +         * If any start address or the end address of PMP entry is 
>>> presented
>>> +         * in the TLB page and cannot override the whole TLB page 
>>> we drop the
>>> +         * size to 1.
>>>            * This means the result isn't cached in the TLB and is 
>>> only used for
>>>            * a single translation.
>>>            */
>>> -        return 1;
>>> +        if (((pmp_sa >= tlb_sa && pmp_sa <= tlb_ea) ||
>>> +             (pmp_ea >= tlb_sa && pmp_ea <= tlb_ea)) &&
>>> +            !(pmp_sa == tlb_sa && pmp_ea == tlb_ea)) {
>>> +            return 1;
>>> +        }
>>>       }
>>> +
>>> +    return TARGET_PAGE_SIZE;
>>>   }
>>>
>>>   /*
>>> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
>>> index b296ea1fc6..0a7e24750b 100644
>>> --- a/target/riscv/pmp.h
>>> +++ b/target/riscv/pmp.h
>>> @@ -76,8 +76,7 @@ int pmp_hart_has_privs(CPURISCVState *env, 
>>> target_ulong addr,
>>>                          target_ulong size, pmp_priv_t privs,
>>>                          pmp_priv_t *allowed_privs,
>>>                          target_ulong mode);
>>> -target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
>>> -                              target_ulong tlb_sa, target_ulong 
>>> tlb_ea);
>>> +target_ulong pmp_get_tlb_size(CPURISCVState *env, target_ulong addr);
>>>   void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
>>>   void pmp_update_rule_nums(CPURISCVState *env);
>>>   uint32_t pmp_get_num_rules(CPURISCVState *env);
>>> -- 
>>> 2.25.1
>>>
>>>

