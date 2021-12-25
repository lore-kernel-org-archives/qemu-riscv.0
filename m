Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n0xVQ-0001bI-6l
	for mharc-qemu-riscv@gnu.org; Fri, 24 Dec 2021 22:14:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n0xVO-0001b5-Aj; Fri, 24 Dec 2021 22:13:58 -0500
Received: from smtp21.cstnet.cn ([159.226.251.21]:39924 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n0xVL-000253-Hb; Fri, 24 Dec 2021 22:13:58 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowAAHDp5rjMZhR7odBQ--.30613S2;
 Sat, 25 Dec 2021 11:13:48 +0800 (CST)
Subject: Re: [PATCH 2/6] target/riscv: add support for unique fpr read/write
 with support for zfinx
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
References: <20211224034915.17204-1-liweiwei@iscas.ac.cn>
 <20211224034915.17204-3-liweiwei@iscas.ac.cn>
 <ec5adcb4-3090-50e2-4981-38149e120249@linaro.org>
From: liweiwei <liweiwei@iscas.ac.cn>
Message-ID: <2acd9ead-d9e8-46be-b306-2aa26ced06b5@iscas.ac.cn>
Date: Sat, 25 Dec 2021 11:13:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ec5adcb4-3090-50e2-4981-38149e120249@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowAAHDp5rjMZhR7odBQ--.30613S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr17KFWxXr1fXFWftr1rCrg_yoW7Jr1rpr
 18JrWUJryUJrn5Jr1UJr1UJFyUAr1UJ3WDJr48XFyUJr47Jr1jgr1UXr1qgr1UAr4kJr1U
 Jr1UXrnrZr1UJ37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBa14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
 n2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28Icx
 kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
 xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
 IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY
 6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
 Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JU2fOwUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.133,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 25 Dec 2021 03:13:58 -0000

Thanks for your comments.

在 2021/12/25 上午6:00, Richard Henderson 写道:
> On 12/23/21 7:49 PM, liweiwei wrote:
>> +static TCGv_i64 get_fpr_hs(DisasContext *ctx, int reg_num)
>> +{
>> +    if (ctx->ext_zfinx) {
>> +        switch (get_ol(ctx)) {
>> +        case MXL_RV32:
>> +#ifdef TARGET_RISCV32
>> +            if (reg_num == 0) {
>> +                tcg_gen_concat_i32_i64(t, ctx->zero, ctx->zero);
>
> return tcg_constant_i64(0);
> You could hoist this above the switch.
>
OK.
>> +                tcg_gen_concat_i32_i64(t, cpu_gpr[reg_num], ctx->zero);
> tcg_gen_extu_i32_i64 -- though I would think a signed extraction would 
> be more natural, as compared with the signed value you'll get from the 
> RV64 case.
>
In RV64 case, this should be nan-boxing value( upper bits are all 
ones).  However, zfinx will not check nan-boxing of source, the upper 32 
bits have no effect on the final result. So I think both zero-extended 
or sign-extended are OK.
>> +        case MXL_RV64:
>> +            if (reg_num == 0) {
>> +                return ctx->zero;
>> +            } else {
>> +                return cpu_gpr[reg_num];
>> +            }
>> +#endif
>> +        default:
>> +            g_assert_not_reached();
>> +        }
>
>> +    } else {
>> +        return cpu_fpr[reg_num];
>> +    }
>
> It is tempting to reverse the sense of the zfinx if, to eliminate this 
> case first, and keep the indentation level down.
>
OK I'll update this.
>
>> +static TCGv_i64 get_fpr_d(DisasContext *ctx, int reg_num)
>> +{
>> +    if (ctx->ext_zfinx) {
>> +        switch (get_ol(ctx)) {
>> +        case MXL_RV32:
>> +            if (reg_num & 1) {
>> +                gen_exception_illegal(ctx);
>> +                return NULL;
>
> Not keen on checking this here.  It should be done earlier.
>
OK. I'll put this check into the trans_* function
>> +            } else {
>> +#ifdef TARGET_RISCV32
>> +                TCGv_i64 t = ftemp_new(ctx);
>> +                if (reg_num == 0) {
>> +                    tcg_gen_concat_i32_i64(t, ctx->zero, ctx->zero);
>> +                } else {
>> +                    tcg_gen_concat_i32_i64(t, cpu_gpr[reg_num], 
>> cpu_gpr[reg_num + 1]);
>> +                }
>> +                return t;
>> +            }
>> +#else
>> +                if (reg_num == 0) {
>> +                    return ctx->zero;
>> +                } else {
>> +                    TCGv_i64 t = ftemp_new(ctx);
>> +                    tcg_gen_deposit_i64(t, cpu_gpr[reg_num], 
>> cpu_gpr[reg_num + 1], 32, 32);
>> +                    return t;
>> +                }
>> +            }
>> +        case MXL_RV64:
>> +            if (reg_num == 0) {
>> +                return ctx->zero;
>> +            } else {
>> +                return cpu_gpr[reg_num];
>> +            }
>> +#endif
>> +        default:
>> +            g_assert_not_reached();
>> +        }
>> +    } else {
>> +        return cpu_fpr[reg_num];
>> +    }
>
> Very similar comments to above.
>
>> +static void gen_set_fpr_d(DisasContext *ctx, int reg_num, TCGv_i64 t)
>> +{
>> +    if (ctx->ext_zfinx) {
>> +        if (reg_num != 0) {
>> +            switch (get_ol(ctx)) {
>> +            case MXL_RV32:
>> +                if (reg_num & 1) {
>> +                    gen_exception_illegal(ctx);
>
> This is *far* too late to diagnose illegal insn.  You've already 
> modified global state in the FPSCR, or have taken an fpu exception in 
> fpu_helper.c.
OK. I'll put this check into the trans_* function too.
>
>> +                } else {
>> +#ifdef TARGET_RISCV32
>> +                    tcg_gen_extrl_i64_i32(cpu_gpr[reg_num], t);
>> +                    tcg_gen_extrh_i64_i32(cpu_gpr[reg_num + 1], t);
>> +                }
>
> tcg_gen_extr_i64_i32 does both at once.
> Never split braces around ifdefs like this.
OK. I'll update this.
>
>
> r~


