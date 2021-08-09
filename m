Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mD06E-0005vF-Vt
	for mharc-qemu-riscv@gnu.org; Mon, 09 Aug 2021 03:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mD06C-0005uc-LZ; Mon, 09 Aug 2021 03:53:28 -0400
Received: from out28-4.mail.aliyun.com ([115.124.28.4]:52531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mD069-0003iw-PZ; Mon, 09 Aug 2021 03:53:28 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07450922|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_system_inform|0.0456835-0.00181654-0.9525;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047192; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KxNQyd0_1628495596; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KxNQyd0_1628495596)
 by smtp.aliyun-inc.com(10.147.42.198);
 Mon, 09 Aug 2021 15:53:16 +0800
Subject: Re: [RFC PATCH 05/13] target/riscv: Support UXL32 for shift
 instruction
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-6-zhiwei_liu@c-sky.com>
 <78383182-7c74-72dc-7bf6-e45c54b97a7e@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <2fa362c9-d7a3-8aa3-13dd-ab46a525c977@c-sky.com>
Date: Mon, 9 Aug 2021 15:51:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <78383182-7c74-72dc-7bf6-e45c54b97a7e@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.4; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-4.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Aug 2021 07:53:29 -0000


On 2021/8/6 上午6:17, Richard Henderson wrote:
> On 8/4/21 4:53 PM, LIU Zhiwei wrote:
>>   static bool trans_srli(DisasContext *ctx, arg_srli *a)
>>   {
>> +    if (ctx->uxl32) {
>> +        return trans_srliw(ctx, a);
>> +    }
>>       return gen_shifti(ctx, a, tcg_gen_shr_tl);
>>   }
>
> First, trans_srliw begins with REQUIRE_64BIT, which *should* fail when 
> RV32 is in effect.  This means there's a missing change to is_32bit().

As I have replied in another patch, ctx->uxl32 already indicats 64 bit 
CPU.  Anyway, I will think more about how to merge is_32bit() and uxl32 
in next patch set.

>
> Second, the current decode for srli allows 7 bits of shift, while 
> srilw only allows 5.  As a consequence, gen_shifti contains a check 
> for TARGET_LONG_BITS and trans_srliw does not contain a check at all.  
> We need to diagnose an out-of-range shift for RV32 somewhere.
>
Yes, it's not proper directly use *w here.  Fix it in next patch set.

Zhiwei

> I recommend extending the gen_shift* family of helpers.
>
> static bool gen_shifti_imm(DisasContext *ctx, arg_shift *a, int width,
>                            void (*func)(TCGv, TCGv, target_long))
> {
>     TCGv dest, src1;
>
>     if (a->shamt >= width) {
>         return false;
>     }
>     dest = gpr_dst(ctx, a->rd);
>     src1 = gpr_src(ctx, a->rs1);
>     func(dest, src1, a->shamt);
>     return true;
> }
>
> static bool gen_shifti(DisasContext *ctx, arg_shift *a, int width,
>                        void (*func)(TCGv, TCGv, TCGv))
> {...}
>
> static void gen_srliw(TCGv dest, TCGv src1, target_long shamt)
> {
>     tcg_gen_extract_tl(dest, src1, shamt, 32 - shamt);
>     tcg_gen_ext32s_tl(dest, dest);
> }
>
> static bool trans_srliw(DisasContext *ctx, arg_shift *a)
> {
>     REQUIRE_64BIT(ctx);
>     return gen_shifti_imm(ctx, a, 32, gen_srliw);
> }
>
> static bool trans_srli(DisasContext *ctx, arg_shift *a)
> {
>     int xlen = is_32bit(ctx) ? 32 : 64;
>     return gen_shifti_imm(ctx, a, xlen,
>                           xlen == TARGET_LONG_BITS
>                           ? tcg_gen_shri_tl : gen_srliw);
> }
>
> etc.  Perhaps that is_32bit() check above could be consolidated into 
> some macro/inline.
>
>
> r~

