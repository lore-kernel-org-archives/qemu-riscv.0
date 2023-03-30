Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phgYm-0005YJ-Gj
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 20:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1phgYj-0005Xv-PX; Wed, 29 Mar 2023 20:54:34 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1phgYU-00082P-DT; Wed, 29 Mar 2023 20:54:33 -0400
Received: from [192.168.0.119] (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowAC3vDCm3SRkiKkEDA--.22749S2;
 Thu, 30 Mar 2023 08:53:59 +0800 (CST)
Message-ID: <51f307ab-e1ed-b9d3-aae1-530f0cff959a@iscas.ac.cn>
Date: Thu, 30 Mar 2023 08:53:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH v2 3/5] target/riscv: Sync cpu_pc before update badaddr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230329032346.55185-1-liweiwei@iscas.ac.cn>
 <20230329032346.55185-4-liweiwei@iscas.ac.cn>
 <092397fd-3b97-b866-6c72-aab132422f2f@linaro.org>
Content-Language: en-US
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <092397fd-3b97-b866-6c72-aab132422f2f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAC3vDCm3SRkiKkEDA--.22749S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFWktrWkGrWrCr4UAF1UKFg_yoW8tF1Dpr
 40krWUGr98Gr93AF4xtr4UXFy5Jr45Gw4DJw1vy3Z5Jr43JrWYvF4qgrW2gr4UJF4xXr1j
 vF4UAF9xZF17XFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
 4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
 c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Thu, 30 Mar 2023 00:54:35 -0000


On 2023/3/29 23:33, Richard Henderson wrote:
> On 3/28/23 20:23, Weiwei Li wrote:
>> We should sync cpu_pc before storing it into badaddr when mis-aligned
>> exception is triggered.
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/insn_trans/trans_rvi.c.inc | 1 +
>>   target/riscv/translate.c                | 1 +
>>   2 files changed, 2 insertions(+)
>
> Yes, badaddr should get the invalid pc, but surely epc should contain 
> the pc of the branch instruction causing the fault.  I thought that 
> was the primary reason to handle this exception here, rather than at 
> the start of the translation loop.
>
Yeah. the pc will be restored to the current pc in gen_exception() after 
updating the invalid pc into badaddr.

Regards,

Weiwei Li

>
> r~
>
>>
>> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc 
>> b/target/riscv/insn_trans/trans_rvi.c.inc
>> index 4ad54e8a49..05d8b5d57f 100644
>> --- a/target/riscv/insn_trans/trans_rvi.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
>> @@ -171,6 +171,7 @@ static bool gen_branch(DisasContext *ctx, arg_b 
>> *a, TCGCond cond)
>>         if (!has_ext(ctx, RVC) && ((ctx->base.pc_next + a->imm) & 
>> 0x3)) {
>>           /* misaligned */
>> +        gen_set_pc_imm(ctx, ctx->base.pc_next + a->imm);
>>           gen_exception_inst_addr_mis(ctx);
>>       } else {
>>           gen_goto_tb(ctx, 0, ctx->base.pc_next + a->imm);
>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>> index 0ee8ee147d..f7ddf4c50d 100644
>> --- a/target/riscv/translate.c
>> +++ b/target/riscv/translate.c
>> @@ -551,6 +551,7 @@ static void gen_jal(DisasContext *ctx, int rd, 
>> target_ulong imm)
>>       next_pc = ctx->base.pc_next + imm;
>>       if (!has_ext(ctx, RVC)) {
>>           if ((next_pc & 0x3) != 0) {
>> +            gen_set_pc_imm(ctx, next_pc);
>>               gen_exception_inst_addr_mis(ctx);
>>               return;
>>           }


