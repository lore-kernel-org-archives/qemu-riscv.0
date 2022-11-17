Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ovdHa-0006xl-16
	for mharc-qemu-riscv@gnu.org; Thu, 17 Nov 2022 06:42:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ovdHX-0006x8-CI; Thu, 17 Nov 2022 06:42:12 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1ovdHU-0001OA-GH; Thu, 17 Nov 2022 06:42:11 -0500
Received: from [192.168.3.6] (unknown [180.165.240.202])
 by APP-01 (Coremail) with SMTP id qwCowAAHDnYCHnZjQi0qCg--.441S2;
 Thu, 17 Nov 2022 19:41:57 +0800 (CST)
Message-ID: <b7d38433-f9bf-8c4c-895c-0c8ca4783d91@iscas.ac.cn>
Date: Thu, 17 Nov 2022 19:41:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: liweiwei@iscas.ac.cn, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH v3 6/9] target/riscv: add support for Zcmp extension
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20221117070316.58447-1-liweiwei@iscas.ac.cn>
 <20221117070316.58447-7-liweiwei@iscas.ac.cn>
 <97ceaca3-109e-ba04-30b2-c7f55c6ed422@linaro.org>
Content-Language: en-US
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <97ceaca3-109e-ba04-30b2-c7f55c6ed422@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAHDnYCHnZjQi0qCg--.441S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr4rCFWDJrWxZry8XrWUJwb_yoWruFyrpr
 1kJrW5JryUJrs3Jr1UJF1UJFy3Ar18J3WDJr1Fq3WUJF43Ar10gr1UWrn0gr1UJr4kJr4U
 Ar1UXr9rZr43JrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
 IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUU
 U==
X-Originating-IP: [180.165.240.202]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Thu, 17 Nov 2022 11:42:12 -0000

Thanks for your detail comments!

On 2022/11/17 17:44, Richard Henderson wrote:
> On 11/16/22 23:03, Weiwei Li wrote:
>> Add encode, trans* functions for Zcmp instructions
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/insn16.decode                |  18 ++
>>   target/riscv/insn_trans/trans_rvzce.c.inc | 242 +++++++++++++++++++++-
>>   target/riscv/translate.c                  |   5 +
>>   3 files changed, 264 insertions(+), 1 deletion(-)
>
> Better, though...
>
>> +static bool gen_zcmp_check(DisasContext *ctx, arg_zcmp *a)
>> +{
>> +    /* rlist 0 to 3 are reserved for future EABI variant */
>> +    if (a->zcmp_rlist < 4) {
>> +        return false;
>> +    }
>> +
>> +    /* rlist <= 6 when RV32E/RV64E */
>> +    if (ctx->cfg_ptr->ext_e && a->zcmp_rlist > 6) {
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +}
>
> This could be merged into...
>
>> +
>> +#define X_S0    8
>> +#define X_S1    9
>> +#define X_Sn    16
>> +
>> +static inline void update_push_pop_list(target_ulong rlist, bool 
>> *xreg_list)
>
> ... here.
>
> For instance, one way is to return false when the list is invalid.
> Better is to return a uint32_t bitmap of the registers in the list, 
> with 0 indicating invalid.
>
> Nit 1: Remove the inline.
> Nit 2: A better name might be decode_push_pop_list.
OK. I'll update this in next version.
>
>> +static inline target_ulong caculate_stack_adj(int bytes, 
>> target_ulong rlist,
>> +                                              target_ulong spimm)
>> +{
>> +    target_ulong stack_adj_base = 0;
>> +    switch (rlist) {
>> +    case 15:
>> +        stack_adj_base = bytes == 4 ? 64 : 112;
>> +        break;
>> +    case 14:
>> +        stack_adj_base = bytes == 4 ? 48 : 96;
>> +        break;
>> +    case 13:
>> +    case 12:
>> +        stack_adj_base = bytes == 4 ? 48 : 80;
>> +        break;
>> +    case 11:
>> +    case 10:
>> +        stack_adj_base = bytes == 4 ? 32 : 64;
>> +        break;
>> +    case 9:
>> +    case 8:
>> +        stack_adj_base = bytes == 4 ? 32 : 48;
>> +        break;
>> +    case 7:
>> +    case 6:
>> +        stack_adj_base = bytes == 4 ? 16 : 32;
>> +        break;
>> +    case 5:
>> +    case 4:
>> +        stack_adj_base = 16;
>> +        break;
>> +    }
>
> I really dislike this, as it replicates the decoding done just above.
> I think this ought to be simply:
>
>     ROUND_UP(ctpop32(reg_bitmap) * reg_size, 16) + spimm
Yeah. This is more simply. I'll update this.
>
>
>> +static bool gen_pop(DisasContext *ctx, arg_zcmp *a, bool ret, bool 
>> ret_val)
>> +{
>> +    REQUIRE_ZCMP(ctx);
>> +
>> +    if (!gen_zcmp_check(ctx, a)) {
>> +        return false;
>> +    }
>> +
>> +    bool xreg_list[32] = {false};
>> +    int bytes = get_ol(ctx) == MXL_RV32 ? 4 : 8;
>
> Better with
>
>     MemOp memop = get_ol(ctx) == MXL_RV32 ? MO_TEUL : MO_TEUQ;
>     int reg_size = memop_size(memop);
OK.
>
>> +            switch (bytes) {
>> +            case 4:
>> +                tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, MO_32);
>> +                break;
>> +            case 8:
>> +                tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, MO_64);
>> +                break;
>> +            default:
>> +                break;
>> +            }
>
> These are incorrect in that they do not indicate the target endianness.
> Better to merge the two using the common memop computed above:
>
>     tcg_gen_qemu_ld_tl(dest, addr, ctx->mem_idx, memop);
Yeah. I didn't take the target endianness into consideration. I'll fix this.
>> +static bool trans_cm_mvsa01(DisasContext *ctx, arg_cm_mvsa01 *a)
>> +{
>> +    REQUIRE_ZCMP(ctx);
>> +
>> +    TCGv a0 = get_gpr(ctx, xA0, EXT_NONE);
>> +    TCGv a1 = get_gpr(ctx, xA1, EXT_NONE);
>> +
>> +    gen_set_gpr(ctx, a->rs1, a0);
>> +    gen_set_gpr(ctx, a->rs2, a1);
>
> rs1 must not equal rs2.
>
>
Yeah. I lost this check. I'll add it.

Regards,

Weiwei Li

> r~


