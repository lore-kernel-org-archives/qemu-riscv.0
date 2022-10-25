Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1onDEZ-000834-HT
	for mharc-qemu-riscv@gnu.org; Tue, 25 Oct 2022 02:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1onDDh-0005QR-OV; Tue, 25 Oct 2022 02:15:25 -0400
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1onDDe-0007W5-HY; Tue, 25 Oct 2022 02:15:25 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=3; SR=0;
 TI=SMTPD_---0VT1k6bm_1666678192; 
Received: from 30.221.97.225(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VT1k6bm_1666678192) by smtp.aliyun-inc.com;
 Tue, 25 Oct 2022 14:09:52 +0800
Message-ID: <76c59d7d-ef83-a28b-6c83-03cbddd4399c@linux.alibaba.com>
Date: Tue, 25 Oct 2022 14:09:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] tcg/riscv: Fix base register for user-only qemu_ld/st
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org
References: <20221023233337.2846860-1-richard.henderson@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20221023233337.2846860-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.56;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-56.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 25 Oct 2022 06:15:26 -0000
X-List-Received-Date: Tue, 25 Oct 2022 06:15:26 -0000


On 2022/10/24 7:33, Richard Henderson wrote:
> When guest_base != 0, we were not coordinating the usage of
> TCG_REG_TMP0 as base properly, leading to a previous zero-extend
> of the input address being discarded.
>
> Shuffle the alignment check to the front, because that does not
> depend on the zero-extend, and it keeps the register usage clear.
> Set base after each step of the address arithmetic instead of before.
>
> Return the base register used from tcg_out_tlb_load, so as to
> keep that register choice localized to that function.
>
> Reported-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by:  LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Thanks,
Zhiwei

> ---
>   tcg/riscv/tcg-target.c.inc | 39 +++++++++++++++++++++-----------------
>   1 file changed, 22 insertions(+), 17 deletions(-)
>
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 2a84c57bec..e3b608034f 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -923,9 +923,9 @@ static void tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
>       tcg_debug_assert(ok);
>   }
>   
> -static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
> -                             TCGReg addrh, MemOpIdx oi,
> -                             tcg_insn_unit **label_ptr, bool is_load)
> +static TCGReg tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
> +                               TCGReg addrh, MemOpIdx oi,
> +                               tcg_insn_unit **label_ptr, bool is_load)
>   {
>       MemOp opc = get_memop(oi);
>       unsigned s_bits = opc & MO_SIZE;
> @@ -975,6 +975,7 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg addrl,
>           addrl = TCG_REG_TMP0;
>       }
>       tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP2, addrl);
> +    return TCG_REG_TMP0;
>   }
>   
>   static void add_qemu_ldst_label(TCGContext *s, int is_ld, MemOpIdx oi,
> @@ -1177,7 +1178,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
>   #else
>       unsigned a_bits;
>   #endif
> -    TCGReg base = TCG_REG_TMP0;
> +    TCGReg base;
>   
>       data_regl = *args++;
>       data_regh = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
> @@ -1187,23 +1188,25 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
>       opc = get_memop(oi);
>   
>   #if defined(CONFIG_SOFTMMU)
> -    tcg_out_tlb_load(s, addr_regl, addr_regh, oi, label_ptr, 1);
> +    base = tcg_out_tlb_load(s, addr_regl, addr_regh, oi, label_ptr, 1);
>       tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
>       add_qemu_ldst_label(s, 1, oi,
>                           (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
>                           data_regl, data_regh, addr_regl, addr_regh,
>                           s->code_ptr, label_ptr);
>   #else
> -    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
> -        tcg_out_ext32u(s, base, addr_regl);
> -        addr_regl = base;
> -    }
>       a_bits = get_alignment_bits(opc);
>       if (a_bits) {
>           tcg_out_test_alignment(s, true, addr_regl, a_bits);
>       }
> +    base = addr_regl;
> +    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
> +        tcg_out_ext32u(s, TCG_REG_TMP0, base);
> +        base = TCG_REG_TMP0;
> +    }
>       if (guest_base != 0) {
> -        tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
> +        tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_GUEST_BASE_REG, base);
> +        base = TCG_REG_TMP0;
>       }
>       tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
>   #endif
> @@ -1249,7 +1252,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
>   #else
>       unsigned a_bits;
>   #endif
> -    TCGReg base = TCG_REG_TMP0;
> +    TCGReg base;
>   
>       data_regl = *args++;
>       data_regh = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
> @@ -1259,23 +1262,25 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
>       opc = get_memop(oi);
>   
>   #if defined(CONFIG_SOFTMMU)
> -    tcg_out_tlb_load(s, addr_regl, addr_regh, oi, label_ptr, 0);
> +    base = tcg_out_tlb_load(s, addr_regl, addr_regh, oi, label_ptr, 0);
>       tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
>       add_qemu_ldst_label(s, 0, oi,
>                           (is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32),
>                           data_regl, data_regh, addr_regl, addr_regh,
>                           s->code_ptr, label_ptr);
>   #else
> -    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
> -        tcg_out_ext32u(s, base, addr_regl);
> -        addr_regl = base;
> -    }
>       a_bits = get_alignment_bits(opc);
>       if (a_bits) {
>           tcg_out_test_alignment(s, false, addr_regl, a_bits);
>       }
> +    base = addr_regl;
> +    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
> +        tcg_out_ext32u(s, TCG_REG_TMP0, base);
> +        base = TCG_REG_TMP0;
> +    }
>       if (guest_base != 0) {
> -        tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, addr_regl);
> +        tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_GUEST_BASE_REG, base);
> +        base = TCG_REG_TMP0;
>       }
>       tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
>   #endif

