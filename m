Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pogHP-0000Kq-Ec
	for mharc-qemu-riscv@gnu.org; Tue, 18 Apr 2023 04:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pogHM-0000KG-TH; Tue, 18 Apr 2023 04:01:32 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pogHH-0001zL-5Q; Tue, 18 Apr 2023 04:01:32 -0400
Received: from [192.168.0.120] (unknown [180.165.241.15])
 by APP-01 (Coremail) with SMTP id qwCowABHKYJLTj5k2IPVBQ--.41085S2;
 Tue, 18 Apr 2023 16:01:15 +0800 (CST)
Message-ID: <a7416578-bc77-4fc5-73e6-6d20b9d1348a@iscas.ac.cn>
Date: Tue, 18 Apr 2023 16:01:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, richard.henderson@linaro.org,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH 1/6] target/riscv: Update pmp_get_tlb_size()
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair23@gmail.com>
References: <20230413090122.65228-1-liweiwei@iscas.ac.cn>
 <20230413090122.65228-2-liweiwei@iscas.ac.cn>
 <CAKmqyKO4zAf18FPAzkKF9j1CV+RBaLc6-e45ZpBkJoKf8Y-dvg@mail.gmail.com>
 <2cf1870a-b668-13e5-7452-32e20c3cd0c8@iscas.ac.cn>
 <6653f84e-85a9-f6a0-9cb2-699c07eac654@linux.alibaba.com>
 <142d0596-e10f-d04b-cd04-b641f7926361@iscas.ac.cn>
 <730f1284-882a-2cd2-8162-7e55796e8b4a@linux.alibaba.com>
Content-Language: en-US
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <730f1284-882a-2cd2-8162-7e55796e8b4a@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABHKYJLTj5k2IPVBQ--.41085S2
X-Coremail-Antispam: 1UD129KBjvJXoW3XFWfJFy7tF1kuw1DWw1xXwb_yoW3Kw4kpr
 W8JFyUJrWUGryrJw17tr1UXFyYyr1Utw1UXr18GF1UAwsrtryY9r1DZr1jgr18Jrs5Gr1j
 yr1UAFnrur15XF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
 c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-Originating-IP: [180.165.241.15]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.284,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 18 Apr 2023 08:01:33 -0000


On 2023/4/18 15:08, LIU Zhiwei wrote:
>
> On 2023/4/18 14:09, Weiwei Li wrote:
>>
>> On 2023/4/18 13:18, LIU Zhiwei wrote:
>>>
>>> On 2023/4/18 11:05, Weiwei Li wrote:
>>>>
>>>> On 2023/4/18 10:53, Alistair Francis wrote:
>>>>> On Thu, Apr 13, 2023 at 7:04 PM Weiwei Li <liweiwei@iscas.ac.cn> 
>>>>> wrote:
>>>>>> Not only the matched PMP entry, Any PMP entry that overlap with 
>>>>>> partial of
>>>>>> the tlb page may make the regions in that page have different 
>>>>>> permission
>>>>>> rights. So all of them should be taken into consideration.
>>>>>>
>>>>>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>>>>>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>>>>>> ---
>>>>>>   target/riscv/cpu_helper.c |  7 ++-----
>>>>>>   target/riscv/pmp.c        | 34 +++++++++++++++++++++-------------
>>>>>>   target/riscv/pmp.h        |  3 +--
>>>>>>   3 files changed, 24 insertions(+), 20 deletions(-)
>>>>>>
>>>>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>>>>> index 433ea529b0..075fc0538a 100644
>>>>>> --- a/target/riscv/cpu_helper.c
>>>>>> +++ b/target/riscv/cpu_helper.c
>>>>>> @@ -703,11 +703,8 @@ static int 
>>>>>> get_physical_address_pmp(CPURISCVState *env, int *prot,
>>>>>>       }
>>>>>>
>>>>>>       *prot = pmp_priv_to_page_prot(pmp_priv);
>>>>>> -    if ((tlb_size != NULL) && pmp_index != MAX_RISCV_PMPS) {
>>>>>> -        target_ulong tlb_sa = addr & ~(TARGET_PAGE_SIZE - 1);
>>>>>> -        target_ulong tlb_ea = tlb_sa + TARGET_PAGE_SIZE - 1;
>>>>>> -
>>>>>> -        *tlb_size = pmp_get_tlb_size(env, pmp_index, tlb_sa, 
>>>>>> tlb_ea);
>>>>>> +    if (tlb_size != NULL) {
>>>>>> +        *tlb_size = pmp_get_tlb_size(env, addr);
>>>>>>       }
>>>>>>
>>>>>>       return TRANSLATE_SUCCESS;
>>>>>> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
>>>>>> index 1f5aca42e8..4f9389e73c 100644
>>>>>> --- a/target/riscv/pmp.c
>>>>>> +++ b/target/riscv/pmp.c
>>>>>> @@ -601,28 +601,36 @@ target_ulong mseccfg_csr_read(CPURISCVState 
>>>>>> *env)
>>>>>>   }
>>>>>>
>>>>>>   /*
>>>>>> - * Calculate the TLB size if the start address or the end 
>>>>>> address of
>>>>>> + * Calculate the TLB size if any start address or the end 
>>>>>> address of
>>>>>>    * PMP entry is presented in the TLB page.
>>>>>>    */
>>>>>> -target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
>>>>>> -                              target_ulong tlb_sa, target_ulong 
>>>>>> tlb_ea)
>>>>>> +target_ulong pmp_get_tlb_size(CPURISCVState *env, target_ulong 
>>>>>> addr)
>>>>>>   {
>>>>>> -    target_ulong pmp_sa = env->pmp_state.addr[pmp_index].sa;
>>>>>> -    target_ulong pmp_ea = env->pmp_state.addr[pmp_index].ea;
>>>>>> +    target_ulong pmp_sa;
>>>>>> +    target_ulong pmp_ea;
>>>>>> +    target_ulong tlb_sa = addr & ~(TARGET_PAGE_SIZE - 1);
>>>>>> +    target_ulong tlb_ea = tlb_sa + TARGET_PAGE_SIZE - 1;
>>>>>> +    int i;
>>>>>> +
>>>>>> +    for (i = 0; i < MAX_RISCV_PMPS; i++) {
>>>>>> +        pmp_sa = env->pmp_state.addr[i].sa;
>>>>>> +        pmp_ea = env->pmp_state.addr[i].ea;
>>>>>>
>>>>>> -    if (pmp_sa <= tlb_sa && pmp_ea >= tlb_ea) {
>>>>>> -        return TARGET_PAGE_SIZE;
>>>>>> -    } else {
>>>>>>           /*
>>>>>> -         * At this point we have a tlb_size that is the smallest 
>>>>>> possible size
>>>>>> -         * That fits within a TARGET_PAGE_SIZE and the PMP region.
>>>>> This comment points out that we should have the smallest region, so
>>>>> I'm not clear why we need this change. Can you update the commit
>>>>> description to be clear on why this change is needed and what it
>>>>> fixes?
>>>>
>>>> This function return tlb_size to 1 to make the tlb uncached. 
>>>> However, In previous implementation,
>>>>
>>>> only the matched PMP entry of current access address is taken into 
>>>> consideration. Then, if other PMP entry
>>>>
>>>> that match other address in the same page, we  may also cannot 
>>>> cache the tlb, since different address
>>>>
>>>> in that page may have different permission rights.
>>>
>>> It doesn't matter. As the tlb size < page size, this tlb will have a 
>>> TLB_INVALID_MASK flag and never match.
>>
>> This is what I want. However,  tlb size will be page size without 
>> this patch in some cases.
>>
>> Assuming:
>>
>> PMP0:   sa: 0x80000008  ea: 0x8000000f, rights: R
>>
>> PMP1: sa: 0, ea: 0xffffffff, rights: RWX
>>
>> If we try to write data to 0x80000000,  PMP1 will be matched, In 
>> previous implementation,
>>
>> tlb_size will be PMP1 TARGET_PAGE_SIZE and this will be cached, since 
>> only matched PMP is checked ,
>>
>> and PMP1 covers the whole page. Then when we try to write data to 
>> 0x80000008, the tlb will be hit,
>>
>> and this access bypass the PMP check of PMP0.
>
> I see. You are fixing the priority of PMP check rule.
Yeah. You can see it as a priority problem.
>
> You can still pass the matched index to pmp_get_tlb_size.  And only 
> check first match index PMP rules.

Yeah. only the PMP rules before the matched PMP need be checked.

However, I  prefers separate the matched index from pmp_get_tlb_size, 
then we can separate

this function from  get_physical_address_pmp (not all pmp check needs 
caculate the tlb size).

Maybe we can improve the check to following code:

if (pmp_sa <= tlb_sa && pmp_ea >= tlb_ea) {
       return TARGET_PAGE_SIZE;
}  else if ((pmp_sa >= tlb_sa && pmp_sa <= tlb_ea) ||   (pmp_ea >= 
tlb_sa && pmp_ea <= tlb_ea)) {
             return 1;

  }

then the checked index will not be larger than matched index(the matched 
case will match one of the above conditions).

Regards,

Weiwei Li

>
>>
>> Regards,
>>
>> Weiwei Li
>>
>>>
>>> For this page, every access will  repeat the MMU check and TLB fill.
>>>
>>> It is not fast, but with no error.
>>>
>>> Zhiwei
>>>
>>>>
>>>> Regards,
>>>>
>>>> Weiwei Li
>>>>
>>>>> Alistair
>>>>>
>>>>>> -         *
>>>>>> -         * If the size is less then TARGET_PAGE_SIZE we drop the 
>>>>>> size to 1.
>>>>>> +         * If any start address or the end address of PMP entry 
>>>>>> is presented
>>>>>> +         * in the TLB page and cannot override the whole TLB 
>>>>>> page we drop the
>>>>>> +         * size to 1.
>>>>>>            * This means the result isn't cached in the TLB and is 
>>>>>> only used for
>>>>>>            * a single translation.
>>>>>>            */
>>>>>> -        return 1;
>>>>>> +        if (((pmp_sa >= tlb_sa && pmp_sa <= tlb_ea) ||
>>>>>> +             (pmp_ea >= tlb_sa && pmp_ea <= tlb_ea)) &&
>>>>>> +            !(pmp_sa == tlb_sa && pmp_ea == tlb_ea)) {
>>>>>> +            return 1;
>>>>>> +        }
>>>>>>       }
>>>>>> +
>>>>>> +    return TARGET_PAGE_SIZE;
>>>>>>   }
>>>>>>
>>>>>>   /*
>>>>>> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
>>>>>> index b296ea1fc6..0a7e24750b 100644
>>>>>> --- a/target/riscv/pmp.h
>>>>>> +++ b/target/riscv/pmp.h
>>>>>> @@ -76,8 +76,7 @@ int pmp_hart_has_privs(CPURISCVState *env, 
>>>>>> target_ulong addr,
>>>>>>                          target_ulong size, pmp_priv_t privs,
>>>>>>                          pmp_priv_t *allowed_privs,
>>>>>>                          target_ulong mode);
>>>>>> -target_ulong pmp_get_tlb_size(CPURISCVState *env, int pmp_index,
>>>>>> -                              target_ulong tlb_sa, target_ulong 
>>>>>> tlb_ea);
>>>>>> +target_ulong pmp_get_tlb_size(CPURISCVState *env, target_ulong 
>>>>>> addr);
>
> In this way, you need not to change the declaration of pmp_get_tlb_size.
>
> Otherwise,
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>
> Zhiwei
>
>>>>>>   void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
>>>>>>   void pmp_update_rule_nums(CPURISCVState *env);
>>>>>>   uint32_t pmp_get_num_rules(CPURISCVState *env);
>>>>>> -- 
>>>>>> 2.25.1
>>>>>>
>>>>>>


