Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppUjm-0004FR-Qj
	for mharc-qemu-riscv@gnu.org; Thu, 20 Apr 2023 09:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ppUjj-000476-K5; Thu, 20 Apr 2023 09:54:12 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ppUjZ-0003eO-U5; Thu, 20 Apr 2023 09:54:11 -0400
Received: from [192.168.0.120] (unknown [180.165.241.15])
 by APP-05 (Coremail) with SMTP id zQCowACHjxfxQ0FkdI4IFg--.6742S2;
 Thu, 20 Apr 2023 21:53:53 +0800 (CST)
Message-ID: <95bcffd4-d41f-051b-5044-1bb6018a0e92@iscas.ac.cn>
Date: Thu, 20 Apr 2023 21:53:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com,
 richard.henderson@linaro.org, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH v3 6/7] target/riscv: Make the short cut really work in
 pmp_hart_has_privs
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230419032725.29721-1-liweiwei@iscas.ac.cn>
 <20230419032725.29721-7-liweiwei@iscas.ac.cn>
 <7d197a70-5e19-9dc7-11f2-d4656dd9e03f@linux.alibaba.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <7d197a70-5e19-9dc7-11f2-d4656dd9e03f@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACHjxfxQ0FkdI4IFg--.6742S2
X-Coremail-Antispam: 1UD129KBjvAXoW3KFW3Aw4kuF4xZFW8uw17KFg_yoW8CrWUZo
 WUGr1UJr15Jr1UGr1UJr1UJr15Jr1UJr1DJr1UJry7Jr1UJF1UJ34UJryUt3yUJr18Gr1U
 Jr1UJr1UtFyUJr1Un29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYD7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
 x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWx
 JVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
 kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
 67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
 CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
 VFxhVjvjDU0xZFpf9x0JUZa9-UUUUU=
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
X-List-Received-Date: Thu, 20 Apr 2023 13:54:12 -0000


On 2023/4/20 21:33, LIU Zhiwei wrote:
>
> On 2023/4/19 11:27, Weiwei Li wrote:
>> We needn't check the PMP entries if there is no PMP rules.
> This commit doesn't give much information. If you are fixing a bug, 
> you should point it out why the original implementation is wrong.

This patch is not to fix bug , but to improve the original implementation.

I'll add more description in the commit message.

>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/pmp.c | 251 ++++++++++++++++++++++-----------------------
>
> Have we changed all the logic of this function? It's really a lot of 
> code change. I am not sure if there is a git option to reduce the code 
> move in the patch.
>
> Zhiwei
>
>>   1 file changed, 123 insertions(+), 128 deletions(-)
>>
>> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
>> index 7feaddd7eb..755ed2b963 100644
>> --- a/target/riscv/pmp.c
>> +++ b/target/riscv/pmp.c
>> @@ -314,149 +314,144 @@ int pmp_hart_has_privs(CPURISCVState *env, 
>> target_ulong addr,
>>       target_ulong e = 0;
>>         /* Short cut if no rules */
>> -    if (0 == pmp_get_num_rules(env)) {
>> -        if (pmp_hart_has_privs_default(env, addr, size, privs,
>> -                                       allowed_privs, mode)) {
>> -            ret = MAX_RISCV_PMPS;
>> -        }
>> -    }
>> -

In original code,  short cut if no rules didn't really work. all the 
following check also should be done when pmp_get_num_rules() == 0, and 
this is unneccessary.

So I move the following check into the condition pmp_get_num_rules(env) 
!= 0, and reuse the pmp_hart_has_privs_default() check at the end of 
this function for pmp_get_num_rules() == 0.

Regards,

Weiwei Li

>> -    if (size == 0) {
>> -        if (riscv_cpu_cfg(env)->mmu) {
>> -            /*
>> -             * If size is unknown (0), assume that all bytes
>> -             * from addr to the end of the page will be accessed.
>> -             */
>> -            pmp_size = -(addr | TARGET_PAGE_MASK);
>> +    if (pmp_get_num_rules(env) != 0) {
>> +        if (size == 0) {
>> +            if (riscv_cpu_cfg(env)->mmu) {
>> +                /*
>> +                 * If size is unknown (0), assume that all bytes
>> +                 * from addr to the end of the page will be accessed.
>> +                 */
>> +                pmp_size = -(addr | TARGET_PAGE_MASK);
>> +            } else {
>> +                pmp_size = sizeof(target_ulong);
>> +            }
>>           } else {
>> -            pmp_size = sizeof(target_ulong);
>> -        }
>> -    } else {
>> -        pmp_size = size;
>> -    }
>> -
>> -    /*
>> -     * 1.10 draft priv spec states there is an implicit order
>> -     * from low to high
>> -     */
>> -    for (i = 0; i < MAX_RISCV_PMPS; i++) {
>> -        s = pmp_is_in_range(env, i, addr);
>> -        e = pmp_is_in_range(env, i, addr + pmp_size - 1);
>> -
>> -        /* partially inside */
>> -        if ((s + e) == 1) {
>> -            qemu_log_mask(LOG_GUEST_ERROR,
>> -                          "pmp violation - access is partially 
>> inside\n");
>> -            ret = -1;
>> -            break;
>> +            pmp_size = size;
>>           }
>>   -        /* fully inside */
>> -        const uint8_t a_field =
>> -            pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg);
>> -
>>           /*
>> -         * Convert the PMP permissions to match the truth table in the
>> -         * ePMP spec.
>> +         * 1.10 draft priv spec states there is an implicit order
>> +         * from low to high
>>            */
>> -        const uint8_t epmp_operation =
>> -            ((env->pmp_state.pmp[i].cfg_reg & PMP_LOCK) >> 4) |
>> -            ((env->pmp_state.pmp[i].cfg_reg & PMP_READ) << 2) |
>> -            (env->pmp_state.pmp[i].cfg_reg & PMP_WRITE) |
>> -            ((env->pmp_state.pmp[i].cfg_reg & PMP_EXEC) >> 2);
>> +        for (i = 0; i < MAX_RISCV_PMPS; i++) {
>> +            s = pmp_is_in_range(env, i, addr);
>> +            e = pmp_is_in_range(env, i, addr + pmp_size - 1);
>> +
>> +            /* partially inside */
>> +            if ((s + e) == 1) {
>> +                qemu_log_mask(LOG_GUEST_ERROR,
>> +                              "pmp violation - access is partially 
>> inside\n");
>> +                ret = -1;
>> +                break;
>> +            }
>> +
>> +            /* fully inside */
>> +            const uint8_t a_field =
>> + pmp_get_a_field(env->pmp_state.pmp[i].cfg_reg);
>>   -        if (((s + e) == 2) && (PMP_AMATCH_OFF != a_field)) {
>>               /*
>> -             * If the PMP entry is not off and the address is in range,
>> -             * do the priv check
>> +             * Convert the PMP permissions to match the truth table 
>> in the
>> +             * ePMP spec.
>>                */
>> -            if (!MSECCFG_MML_ISSET(env)) {
>> -                /*
>> -                 * If mseccfg.MML Bit is not set, do pmp priv check
>> -                 * This will always apply to regular PMP.
>> -                 */
>> -                *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
>> -                if ((mode != PRV_M) || pmp_is_locked(env, i)) {
>> -                    *allowed_privs &= env->pmp_state.pmp[i].cfg_reg;
>> -                }
>> -            } else {
>> +            const uint8_t epmp_operation =
>> +                ((env->pmp_state.pmp[i].cfg_reg & PMP_LOCK) >> 4) |
>> +                ((env->pmp_state.pmp[i].cfg_reg & PMP_READ) << 2) |
>> +                (env->pmp_state.pmp[i].cfg_reg & PMP_WRITE) |
>> +                ((env->pmp_state.pmp[i].cfg_reg & PMP_EXEC) >> 2);
>> +
>> +            if (((s + e) == 2) && (PMP_AMATCH_OFF != a_field)) {
>>                   /*
>> -                 * If mseccfg.MML Bit set, do the enhanced pmp priv 
>> check
>> +                 * If the PMP entry is not off and the address is in 
>> range,
>> +                 * do the priv check
>>                    */
>> -                if (mode == PRV_M) {
>> -                    switch (epmp_operation) {
>> -                    case 0:
>> -                    case 1:
>> -                    case 4:
>> -                    case 5:
>> -                    case 6:
>> -                    case 7:
>> -                    case 8:
>> -                        *allowed_privs = 0;
>> -                        break;
>> -                    case 2:
>> -                    case 3:
>> -                    case 14:
>> -                        *allowed_privs = PMP_READ | PMP_WRITE;
>> -                        break;
>> -                    case 9:
>> -                    case 10:
>> -                        *allowed_privs = PMP_EXEC;
>> -                        break;
>> -                    case 11:
>> -                    case 13:
>> -                        *allowed_privs = PMP_READ | PMP_EXEC;
>> -                        break;
>> -                    case 12:
>> -                    case 15:
>> -                        *allowed_privs = PMP_READ;
>> -                        break;
>> -                    default:
>> -                        g_assert_not_reached();
>> +                if (!MSECCFG_MML_ISSET(env)) {
>> +                    /*
>> +                     * If mseccfg.MML Bit is not set, do pmp priv check
>> +                     * This will always apply to regular PMP.
>> +                     */
>> +                    *allowed_privs = PMP_READ | PMP_WRITE | PMP_EXEC;
>> +                    if ((mode != PRV_M) || pmp_is_locked(env, i)) {
>> +                        *allowed_privs &= 
>> env->pmp_state.pmp[i].cfg_reg;
>>                       }
>>                   } else {
>> -                    switch (epmp_operation) {
>> -                    case 0:
>> -                    case 8:
>> -                    case 9:
>> -                    case 12:
>> -                    case 13:
>> -                    case 14:
>> -                        *allowed_privs = 0;
>> -                        break;
>> -                    case 1:
>> -                    case 10:
>> -                    case 11:
>> -                        *allowed_privs = PMP_EXEC;
>> -                        break;
>> -                    case 2:
>> -                    case 4:
>> -                    case 15:
>> -                        *allowed_privs = PMP_READ;
>> -                        break;
>> -                    case 3:
>> -                    case 6:
>> -                        *allowed_privs = PMP_READ | PMP_WRITE;
>> -                        break;
>> -                    case 5:
>> -                        *allowed_privs = PMP_READ | PMP_EXEC;
>> -                        break;
>> -                    case 7:
>> -                        *allowed_privs = PMP_READ | PMP_WRITE | 
>> PMP_EXEC;
>> -                        break;
>> -                    default:
>> -                        g_assert_not_reached();
>> +                    /*
>> +                     * If mseccfg.MML Bit set, do the enhanced pmp 
>> priv check
>> +                     */
>> +                    if (mode == PRV_M) {
>> +                        switch (epmp_operation) {
>> +                        case 0:
>> +                        case 1:
>> +                        case 4:
>> +                        case 5:
>> +                        case 6:
>> +                        case 7:
>> +                        case 8:
>> +                            *allowed_privs = 0;
>> +                            break;
>> +                        case 2:
>> +                        case 3:
>> +                        case 14:
>> +                            *allowed_privs = PMP_READ | PMP_WRITE;
>> +                            break;
>> +                        case 9:
>> +                        case 10:
>> +                            *allowed_privs = PMP_EXEC;
>> +                            break;
>> +                        case 11:
>> +                        case 13:
>> +                            *allowed_privs = PMP_READ | PMP_EXEC;
>> +                            break;
>> +                        case 12:
>> +                        case 15:
>> +                            *allowed_privs = PMP_READ;
>> +                            break;
>> +                        default:
>> +                            g_assert_not_reached();
>> +                        }
>> +                    } else {
>> +                        switch (epmp_operation) {
>> +                        case 0:
>> +                        case 8:
>> +                        case 9:
>> +                        case 12:
>> +                        case 13:
>> +                        case 14:
>> +                            *allowed_privs = 0;
>> +                            break;
>> +                        case 1:
>> +                        case 10:
>> +                        case 11:
>> +                            *allowed_privs = PMP_EXEC;
>> +                            break;
>> +                        case 2:
>> +                        case 4:
>> +                        case 15:
>> +                            *allowed_privs = PMP_READ;
>> +                            break;
>> +                        case 3:
>> +                        case 6:
>> +                            *allowed_privs = PMP_READ | PMP_WRITE;
>> +                            break;
>> +                        case 5:
>> +                            *allowed_privs = PMP_READ | PMP_EXEC;
>> +                            break;
>> +                        case 7:
>> +                            *allowed_privs = PMP_READ | PMP_WRITE | 
>> PMP_EXEC;
>> +                            break;
>> +                        default:
>> +                            g_assert_not_reached();
>> +                        }
>>                       }
>>                   }
>> -            }
>>   -            /*
>> -             * If matching address range was found, the protection bits
>> -             * defined with PMP must be used. We shouldn't fallback on
>> -             * finding default privileges.
>> -             */
>> -            ret = i;
>> -            break;
>> +                /*
>> +                 * If matching address range was found, the 
>> protection bits
>> +                 * defined with PMP must be used. We shouldn't 
>> fallback on
>> +                 * finding default privileges.
>> +                 */
>> +                ret = i;
>> +                break;
>> +            }
>>           }
>>       }


