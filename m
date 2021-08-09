Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mCuO2-0001Re-Bv
	for mharc-qemu-riscv@gnu.org; Sun, 08 Aug 2021 21:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mCuNz-0001RI-OV; Sun, 08 Aug 2021 21:47:27 -0400
Received: from out28-100.mail.aliyun.com ([115.124.28.100]:45429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mCuNw-00010I-81; Sun, 08 Aug 2021 21:47:27 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08423749|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0960993-0.000739715-0.903161;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KxCMULT_1628473632; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KxCMULT_1628473632)
 by smtp.aliyun-inc.com(10.147.44.145);
 Mon, 09 Aug 2021 09:47:12 +0800
Subject: Re: [RFC PATCH 02/13] target/riscv: Support UXL32 for branch
 instructions
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-3-zhiwei_liu@c-sky.com>
 <840d76cc-fd1c-6324-19cc-a6ec0075d032@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <5ae8f7a7-7659-aeee-9b4b-3521e19f4c75@c-sky.com>
Date: Mon, 9 Aug 2021 09:45:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <840d76cc-fd1c-6324-19cc-a6ec0075d032@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.100; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-100.mail.aliyun.com
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
X-List-Received-Date: Mon, 09 Aug 2021 01:47:28 -0000


On 2021/8/6 上午3:06, Richard Henderson wrote:
> On 8/4/21 4:53 PM, LIU Zhiwei wrote:
>> +static TCGv gpr_src_u(DisasContext *ctx, int reg_num)
>> +{
>> +    if (reg_num == 0) {
>> +        return ctx->zero;
>> +    }
>> +    if (ctx->uxl32) {
>> +        tcg_gen_ext32u_tl(cpu_gpr[reg_num], cpu_gpr[reg_num]);
>> +    }
>> +    return cpu_gpr[reg_num];
>> +}
>> +
>> +static TCGv gpr_src_s(DisasContext *ctx, int reg_num)
>> +{
>> +    if (reg_num == 0) {
>> +        return ctx->zero;
>> +    }
>> +    if (ctx->uxl32) {
>> +        tcg_gen_ext32s_tl(cpu_gpr[reg_num], cpu_gpr[reg_num]);
>> +    }
>> +    return cpu_gpr[reg_num];
>> +}
>
> This is bad: you cannot modify the source registers like this.

In my opinion, when uxl32, the only meaningful part is the low 32 bits, 
and it doesn't matter to modify the high parts.

>
> These incorrect modifications will be visible to the kernel on 
> transition back to S-mode.

When transition back to S-mode, I think the kernel will save the U-mode 
registers to memory.

Thanks,
Zhiwei

>
>>
>> +static bool gen_branch_u(DisasContext *ctx, arg_b *a, TCGCond cond)
>> +{
>> +    TCGv src1 = gpr_src_u(ctx, a->rs1);
>> +    TCGv src2 = gpr_src_u(ctx, a->rs2);
>> +
>> +    return gen_branch_internal(ctx, a, cond, src1, src2);
>> +}
>
> This is unnecessary.  Unsigned comparisons work just fine with 
> sign-extended values.  It will be simpler to keep all values 
> sign-extended.
>
>
> r~

