Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppUcl-0005df-VN
	for mharc-qemu-riscv@gnu.org; Thu, 20 Apr 2023 09:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ppUcj-0005Rl-CV; Thu, 20 Apr 2023 09:46:57 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ppUcf-0001D2-VR; Thu, 20 Apr 2023 09:46:57 -0400
Received: from [192.168.0.120] (unknown [180.165.241.15])
 by APP-05 (Coremail) with SMTP id zQCowACXnkJDQkFkpqYHFg--.46124S2;
 Thu, 20 Apr 2023 21:46:43 +0800 (CST)
Message-ID: <e2beef3e-8e5f-e389-e561-7f5766e01176@iscas.ac.cn>
Date: Thu, 20 Apr 2023 21:46:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com,
 richard.henderson@linaro.org, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH v3 2/7] target/riscv: Move pmp_get_tlb_size apart from
 get_physical_address_pmp
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230419032725.29721-1-liweiwei@iscas.ac.cn>
 <20230419032725.29721-3-liweiwei@iscas.ac.cn>
 <c1f22f14-f7ee-3355-152e-eefff10915ee@linux.alibaba.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <c1f22f14-f7ee-3355-152e-eefff10915ee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACXnkJDQkFkpqYHFg--.46124S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Gr15CryUXF1ruw4DuFy3Jwb_yoWxuF1kpr
 1kJrWUJryUJrykJr1UJr1UJryUJr1UJw1UJr18JF15Ar4UJr1jvr1UXr1jgr1UJr48Jr1U
 Jr1UAr1UZr1UJr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
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
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.669,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 20 Apr 2023 13:46:57 -0000


On 2023/4/20 21:19, LIU Zhiwei wrote:
>
> On 2023/4/19 11:27, Weiwei Li wrote:
>> pmp_get_tlb_size can be separated from get_physical_address_pmp and 
>> is only
>> needed when ret == TRANSLATE_SUCCESS.
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/cpu_helper.c | 21 +++++++--------------
>>   target/riscv/pmp.c        |  4 ++++
>>   2 files changed, 11 insertions(+), 14 deletions(-)
>>
>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> index 075fc0538a..ea08ca9fbb 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -676,14 +676,11 @@ void riscv_cpu_set_mode(CPURISCVState *env, 
>> target_ulong newpriv)
>>    *
>>    * @env: CPURISCVState
>>    * @prot: The returned protection attributes
>> - * @tlb_size: TLB page size containing addr. It could be modified 
>> after PMP
>> - *            permission checking. NULL if not set TLB page for addr.
>>    * @addr: The physical address to be checked permission
>>    * @access_type: The type of MMU access
>>    * @mode: Indicates current privilege level.
>>    */
>> -static int get_physical_address_pmp(CPURISCVState *env, int *prot,
>> -                                    target_ulong *tlb_size, hwaddr 
>> addr,
>> +static int get_physical_address_pmp(CPURISCVState *env, int *prot, 
>> hwaddr addr,
>>                                       int size, MMUAccessType 
>> access_type,
>>                                       int mode)
>>   {
>> @@ -703,9 +700,6 @@ static int get_physical_address_pmp(CPURISCVState 
>> *env, int *prot,
>>       }
>>         *prot = pmp_priv_to_page_prot(pmp_priv);
>> -    if (tlb_size != NULL) {
>> -        *tlb_size = pmp_get_tlb_size(env, addr);
>> -    }
>>         return TRANSLATE_SUCCESS;
>>   }
>> @@ -905,7 +899,7 @@ restart:
>>           }
>>             int pmp_prot;
>> -        int pmp_ret = get_physical_address_pmp(env, &pmp_prot, NULL, 
>> pte_addr,
>> +        int pmp_ret = get_physical_address_pmp(env, &pmp_prot, 
>> pte_addr,
>> sizeof(target_ulong),
>>                                                  MMU_DATA_LOAD, PRV_S);
>>           if (pmp_ret != TRANSLATE_SUCCESS) {
>> @@ -1300,13 +1294,12 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr 
>> address, int size,
>>               prot &= prot2;
>>                 if (ret == TRANSLATE_SUCCESS) {
>> -                ret = get_physical_address_pmp(env, &prot_pmp, 
>> &tlb_size, pa,
>> +                ret = get_physical_address_pmp(env, &prot_pmp, pa,
>>                                                  size, access_type, 
>> mode);
>>                     qemu_log_mask(CPU_LOG_MMU,
>>                                 "%s PMP address=" HWADDR_FMT_plx " 
>> ret %d prot"
>> -                              " %d tlb_size " TARGET_FMT_lu "\n",
>> -                              __func__, pa, ret, prot_pmp, tlb_size);
> We discard the tlb_size message here，which is not good.
> If we really want to discard it, we should give a reason and remove it 
> in a separated patch.

We don't need the tlb size if the translation fails. so I move the 
pmp_get_tlb_size to the following code.

In this way, we don't get the tlb size here, so  it's delete from the 
above message. It seems not very good to separate it alone.

>> +                              " %d\n", __func__, pa, ret, prot_pmp);
>>                     prot &= prot_pmp;
>>               }
>> @@ -1333,13 +1326,12 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr 
>> address, int size,
>>                         __func__, address, ret, pa, prot);
>>             if (ret == TRANSLATE_SUCCESS) {
>> -            ret = get_physical_address_pmp(env, &prot_pmp, 
>> &tlb_size, pa,
>> +            ret = get_physical_address_pmp(env, &prot_pmp, pa,
>>                                              size, access_type, mode);
>>                 qemu_log_mask(CPU_LOG_MMU,
>>                             "%s PMP address=" HWADDR_FMT_plx " ret %d 
>> prot"
>> -                          " %d tlb_size " TARGET_FMT_lu "\n",
>> -                          __func__, pa, ret, prot_pmp, tlb_size);
>> +                          " %d\n", __func__, pa, ret, prot_pmp);
>>                 prot &= prot_pmp;
>>           }
>> @@ -1350,6 +1342,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr 
>> address, int size,
>>       }
>>         if (ret == TRANSLATE_SUCCESS) {
>> +        tlb_size = pmp_get_tlb_size(env, pa);
>>           tlb_set_page(cs, address & ~(tlb_size - 1), pa & ~(tlb_size 
>> - 1),
>>                        prot, mmu_idx, tlb_size);
>>           return true;
>> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
>> index 22f3b3f217..d1ef9457ea 100644
>> --- a/target/riscv/pmp.c
>> +++ b/target/riscv/pmp.c
>> @@ -612,6 +612,10 @@ target_ulong pmp_get_tlb_size(CPURISCVState 
>> *env, target_ulong addr)
>>       target_ulong tlb_ea = tlb_sa + TARGET_PAGE_SIZE - 1;
>>       int i;
>>   +    if (!riscv_cpu_cfg(env)->pmp || !pmp_get_num_rules(env)) {
>> +        return TARGET_PAGE_SIZE;
>> +    }
>
> Can we move this to the first patch? So that we have a right 
> implementation when  change of the prototype of  this function。

I didn't add this in the first patch, because this check is unnecessary 
if we don't move this pmp_get_tlb_size() apart from 
get_physical_address_pmp().

It have been checked in get_physical_address_pmp() before calling 
pmp_get_tlb_size().

Regards,

Weiwei Li

>
> Zhiwei
>
>> +
>>       for (i = 0; i < MAX_RISCV_PMPS; i++) {
>>           if (pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg) == 
>> PMP_AMATCH_OFF) {
>>               continue;


