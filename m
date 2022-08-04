Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJZym-0004q2-N8
	for mharc-qemu-riscv@gnu.org; Thu, 04 Aug 2022 08:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oJZyh-0004nE-JR; Thu, 04 Aug 2022 08:29:28 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:33822 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oJZye-0001bM-Kt; Thu, 04 Aug 2022 08:29:27 -0400
Received: from [192.168.3.6] (unknown [116.224.155.20])
 by APP-05 (Coremail) with SMTP id zQCowAC3v4uUu+tiDoNwFg--.58128S2;
 Thu, 04 Aug 2022 20:29:09 +0800 (CST)
Subject: Re: [PATCH] target/riscv: Fix priority of csr related check in
 riscv_csrrw_check
To: Anup Patel <anup@brainfault.org>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com
References: <20220803123652.3700-1-liweiwei@iscas.ac.cn>
 <CAAhSdy0t+iNs8__nUytjuLAcX=FkVyT712+LJ9grmVRpi+cBdA@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <b6844eec-77db-1a6c-a518-7aa934d107d4@iscas.ac.cn>
Date: Thu, 4 Aug 2022 20:29:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy0t+iNs8__nUytjuLAcX=FkVyT712+LJ9grmVRpi+cBdA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAC3v4uUu+tiDoNwFg--.58128S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFy8uw4fCFWfuryxXF1DJrb_yoW5uw1Dpw
 48tw43G3y8XFZrCwsIqFn8XF13Xr1rJw47Aw42k3y8CrnrC34FyF1DWrs29F97XrZ5Cw4I
 vF4qyryxuF4jya7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
 kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
 67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
 CI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E
 3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
 sGvfC2KfnxnUUI43ZEXa7VUj0JPtUUUUU==
X-Originating-IP: [116.224.155.20]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 04 Aug 2022 12:29:30 -0000


在 2022/8/4 上午11:38, Anup Patel 写道:
> On Wed, Aug 3, 2022 at 6:16 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>> Normally, riscv_csrrw_check is called when executing Zicsr instructions.
>> And we can only do access control for existed CSRs. So the priority of
>> CSR related check, from highest to lowest, should be as follows:
>> 1) check whether Zicsr is supported: raise RISCV_EXCP_ILLEGAL_INST if not
>> 2) check whether csr is existed: raise RISCV_EXCP_ILLEGAL_INST if not
>> 3) do access control: raise RISCV_EXCP_ILLEGAL_INST or RISCV_EXCP_VIRT_
>> INSTRUCTION_FAULT if not allowed
>>
>> The predicates contain parts of function of both 2) and 3), So they need
>> to be placed in the middle of riscv_csrrw_check
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/csr.c | 44 +++++++++++++++++++++++++-------------------
>>   1 file changed, 25 insertions(+), 19 deletions(-)
>>
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 0fb042b2fd..d81f466c80 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -3270,6 +3270,30 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>>       /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
>>       int read_only = get_field(csrno, 0xC00) == 3;
>>       int csr_min_priv = csr_ops[csrno].min_priv_ver;
>> +
>> +    /* ensure the CSR extension is enabled. */
>> +    if (!cpu->cfg.ext_icsr) {
>> +        return RISCV_EXCP_ILLEGAL_INST;
>> +    }
>> +
>> +    if (env->priv_ver < csr_min_priv) {
>> +        return RISCV_EXCP_ILLEGAL_INST;
> This line breaks nested virtualization because for nested virtualization
> to work, the guest hypervisor accessing h<xyz> and vs<xyz> CSRs from
> VS-mode should result in a virtual instruction trap not illegal
> instruction trap.
>
> Regards,
> Anup

Do you mean "if (env->priv_ver < csr_min_priv)" ?

If so, I think illegal instruction trap is better, since the csr is not 
implemented(or existed) when

env->priv_ver < csr_min_priv and virtual instruction trap is only raised 
for implemented csr access.

Regards,

Weiwei Li

>> +    }
>> +
>> +    /* check predicate */
>> +    if (!csr_ops[csrno].predicate) {
>> +        return RISCV_EXCP_ILLEGAL_INST;
>> +    }
>> +
>> +    if (write_mask && read_only) {
>> +        return RISCV_EXCP_ILLEGAL_INST;
>> +    }
>> +
>> +    RISCVException ret = csr_ops[csrno].predicate(env, csrno);
>> +    if (ret != RISCV_EXCP_NONE) {
>> +        return ret;
>> +    }
>> +
>>   #if !defined(CONFIG_USER_ONLY)
>>       int csr_priv, effective_priv = env->priv;
>>
>> @@ -3290,25 +3314,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>>           return RISCV_EXCP_ILLEGAL_INST;
>>       }
>>   #endif
>> -    if (write_mask && read_only) {
>> -        return RISCV_EXCP_ILLEGAL_INST;
>> -    }
>> -
>> -    /* ensure the CSR extension is enabled. */
>> -    if (!cpu->cfg.ext_icsr) {
>> -        return RISCV_EXCP_ILLEGAL_INST;
>> -    }
>> -
>> -    /* check predicate */
>> -    if (!csr_ops[csrno].predicate) {
>> -        return RISCV_EXCP_ILLEGAL_INST;
>> -    }
>> -
>> -    if (env->priv_ver < csr_min_priv) {
>> -        return RISCV_EXCP_ILLEGAL_INST;
>> -    }
>> -
>> -    return csr_ops[csrno].predicate(env, csrno);
>> +    return RISCV_EXCP_NONE;
>>   }
>>
>>   static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
>> --
>> 2.17.1
>>
>>


