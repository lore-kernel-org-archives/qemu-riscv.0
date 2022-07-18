Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oDRmb-00065T-I0
	for mharc-qemu-riscv@gnu.org; Mon, 18 Jul 2022 10:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oDRmZ-00060O-2q; Mon, 18 Jul 2022 10:31:35 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:33158 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oDRmW-0008KY-7F; Mon, 18 Jul 2022 10:31:34 -0400
Received: from [192.168.3.6] (unknown [180.156.173.38])
 by APP-01 (Coremail) with SMTP id qwCowAD3_w+2btViyx5TEQ--.20908S2;
 Mon, 18 Jul 2022 22:31:20 +0800 (CST)
Subject: Re: [PATCH V3 6/6] target/riscv: Simplify the check in hmode to resue
 the check in riscv_csrrw_check
To: Andrew Jones <ajones@ventanamicro.com>, Weiwei Li <liweiwei@iscas.ac.cn>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com
References: <20220718130955.11899-1-liweiwei@iscas.ac.cn>
 <20220718130955.11899-7-liweiwei@iscas.ac.cn>
 <20220718134705.3irtvydqu6nn4uys@kamzik>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <fa430f1c-a341-8c2c-4a9f-e2c92f9d9740@iscas.ac.cn>
Date: Mon, 18 Jul 2022 22:31:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220718134705.3irtvydqu6nn4uys@kamzik>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowAD3_w+2btViyx5TEQ--.20908S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAw1fGr4DAF1fKw48Zw1fZwb_yoW5Cr43pr
 4rW3y7Ca4ktr92ka9IqF1UXF45uF43Jw4UJa1vg3y8AFnxZrW0krykXrWF9a4DZF1Duw4S
 vFWjyFn3AF4UAa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UU
 UUU
X-Originating-IP: [180.156.173.38]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 18 Jul 2022 14:31:35 -0000


ÔÚ 2022/7/18 ÏÂÎç9:47, Andrew Jones Ð´µÀ:
> Hi Weiwei,
>
> We still need the s/resue/reuse/ typo fix in $SUBJECT.
>
> (That's maybe something that could be fixed up while applying?)
>
> Thanks,
> drew

Thanks a lot.

Sorry for not finding this typo. I'll fix it in next version.

Regards,

Weiwei Li

> On Mon, Jul 18, 2022 at 09:09:55PM +0800, Weiwei Li wrote:
>> Just add 1 to the effective privledge level when in HS mode, then reuse
>> the check of 'effective_priv < csr_priv' in riscv_csrrw_check to replace
>> the privilege level related check in hmode. Then, hmode will only check
>> whether H extension is supported.
>>
>> When accessing Hypervior CSRs:
>>     1) If accessing from M privilege level, the check of
>> 'effective_priv< csr_priv' passes, returns hmode(...) which will return
>> RISCV_EXCP_ILLEGAL_INST when H extension is not supported and return
>> RISCV_EXCP_NONE otherwise.
>>     2) If accessing from HS privilege level, effective_priv will add 1,
>> the check passes and also returns hmode(...) too.
>>     3) If accessing from VS/VU privilege level, the check fails, and
>> returns RISCV_EXCP_VIRT_INSTRUCTION_FAULT
>>     4) If accessing from U privilege level, the check fails, and returns
>> RISCV_EXCP_ILLEGAL_INST
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> ---
>>   target/riscv/csr.c | 18 +++++-------------
>>   1 file changed, 5 insertions(+), 13 deletions(-)
>>
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index cf15aa67b7..0fb042b2fd 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -312,13 +312,7 @@ static int aia_smode32(CPURISCVState *env, int csrno)
>>   static RISCVException hmode(CPURISCVState *env, int csrno)
>>   {
>>       if (riscv_has_ext(env, RVH)) {
>> -        /* Hypervisor extension is supported */
>> -        if ((env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
>> -            env->priv == PRV_M) {
>> -            return RISCV_EXCP_NONE;
>> -        } else {
>> -            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -        }
>> +        return RISCV_EXCP_NONE;
>>       }
>>   
>>       return RISCV_EXCP_ILLEGAL_INST;
>> @@ -3279,13 +3273,11 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>>   #if !defined(CONFIG_USER_ONLY)
>>       int csr_priv, effective_priv = env->priv;
>>   
>> -    if (riscv_has_ext(env, RVH) && env->priv == PRV_S) {
>> +    if (riscv_has_ext(env, RVH) && env->priv == PRV_S &&
>> +        !riscv_cpu_virt_enabled(env)) {
>>           /*
>> -         * We are in either HS or VS mode.
>> -         * Add 1 to the effective privledge level to allow us to access the
>> -         * Hypervisor CSRs. The `hmode` predicate will determine if access
>> -         * should be allowed(HS) or if a virtual instruction exception should be
>> -         * raised(VS).
>> +         * We are in HS mode. Add 1 to the effective privledge level to
>> +         * allow us to access the Hypervisor CSRs.
>>            */
>>           effective_priv++;
>>       }
>> -- 
>> 2.17.1
>>
>>


