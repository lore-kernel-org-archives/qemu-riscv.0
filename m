Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pusmt-0003V1-Ty
	for mharc-qemu-riscv@gnu.org; Fri, 05 May 2023 06:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pusmi-0003MR-0B; Fri, 05 May 2023 06:35:32 -0400
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pusme-0004Cm-Rq; Fri, 05 May 2023 06:35:31 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R891e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0Vhp084V_1683282914; 
Received: from 30.221.98.0(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Vhp084V_1683282914) by smtp.aliyun-inc.com;
 Fri, 05 May 2023 18:35:15 +0800
Message-ID: <31fac540-105c-b2f7-c150-da1346339d05@linux.alibaba.com>
Date: Fri, 5 May 2023 18:35:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 38/57] tcg/riscv: Support softmmu unaligned accesses
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-39-richard.henderson@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230503070656.1746170-39-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.110;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-110.freemail.mail.aliyun.com
X-Spam_score_int: -141
X-Spam_score: -14.2
X-Spam_bar: --------------
X-Spam_report: (-14.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Fri, 05 May 2023 10:35:41 -0000


On 2023/5/3 15:06, Richard Henderson wrote:
> The system is required to emulate unaligned accesses, even if the
> hardware does not support it.  The resulting trap may or may not
> be more efficient than the qemu slow path.  There are linux kernel
> patches in flight to allow userspace to query hardware support;
> we can re-evaluate whether to enable this by default after that.
>
> In the meantime, softmmu now matches useronly, where we already
> assumed that unaligned accesses are supported.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/riscv/tcg-target.c.inc | 48 ++++++++++++++++++++++----------------
>   1 file changed, 28 insertions(+), 20 deletions(-)
>
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 19cd4507fb..415e6c6e15 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -910,12 +910,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
>   
>   #ifdef CONFIG_SOFTMMU
>       unsigned s_bits = opc & MO_SIZE;
> +    unsigned s_mask = (1u << s_bits) - 1;
>       int mem_index = get_mmuidx(oi);
>       int fast_ofs = TLB_MASK_TABLE_OFS(mem_index);
>       int mask_ofs = fast_ofs + offsetof(CPUTLBDescFast, mask);
>       int table_ofs = fast_ofs + offsetof(CPUTLBDescFast, table);
> -    TCGReg mask_base = TCG_AREG0, table_base = TCG_AREG0;
> -    tcg_target_long compare_mask;
> +    int compare_mask;
> +    TCGReg addr_adj;
>   
>       ldst = new_ldst_label(s);
>       ldst->is_ld = is_ld;
> @@ -924,14 +925,33 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
>   
>       QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
>       QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -(1 << 11));
> -    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, mask_base, mask_ofs);
> -    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, table_base, table_ofs);
> +    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP0, TCG_AREG0, mask_ofs);
> +    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_AREG0, table_ofs);
>   
>       tcg_out_opc_imm(s, OPC_SRLI, TCG_REG_TMP2, addr_reg,
>                       TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
>       tcg_out_opc_reg(s, OPC_AND, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP0);
>       tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP2, TCG_REG_TMP2, TCG_REG_TMP1);
>   
> +    /*
> +     * For aligned accesses, we check the first byte and include the alignment
> +     * bits within the address.  For unaligned access, we check that we don't
> +     * cross pages using the address of the last byte of the access.
> +     */
> +    addr_adj = addr_reg;
> +    if (a_bits < s_bits) {
> +        addr_adj = TCG_REG_TMP0;
> +        tcg_out_opc_imm(s, TARGET_LONG_BITS == 32 ? OPC_ADDIW : OPC_ADDI,
> +                        addr_adj, addr_reg, s_mask - a_mask);
> +    }
> +    compare_mask = TARGET_PAGE_MASK | a_mask;
> +    if (compare_mask == sextreg(compare_mask, 0, 12)) {
> +        tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP1, addr_adj, compare_mask);
> +    } else {
> +        tcg_out_movi(s, TCG_TYPE_TL, TCG_REG_TMP1, compare_mask);
> +        tcg_out_opc_reg(s, OPC_AND, TCG_REG_TMP1, TCG_REG_TMP1, addr_adj);
> +    }
> +
>       /* Load the tlb comparator and the addend.  */
>       tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP0, TCG_REG_TMP2,
>                  is_ld ? offsetof(CPUTLBEntry, addr_read)
> @@ -939,29 +959,17 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, TCGReg *pbase,
>       tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP2, TCG_REG_TMP2,
>                  offsetof(CPUTLBEntry, addend));
>   
> -    /* We don't support unaligned accesses. */
> -    if (a_bits < s_bits) {
> -        a_bits = s_bits;
> -    }
> -    /* Clear the non-page, non-alignment bits from the address.  */
> -    compare_mask = (tcg_target_long)TARGET_PAGE_MASK | a_mask;
> -    if (compare_mask == sextreg(compare_mask, 0, 12)) {
> -        tcg_out_opc_imm(s, OPC_ANDI, TCG_REG_TMP1, addr_reg, compare_mask);
> -    } else {
> -        tcg_out_movi(s, TCG_TYPE_TL, TCG_REG_TMP1, compare_mask);
> -        tcg_out_opc_reg(s, OPC_AND, TCG_REG_TMP1, TCG_REG_TMP1, addr_reg);
> -    }
> -
>       /* Compare masked address with the TLB entry. */
>       ldst->label_ptr[0] = s->code_ptr;
>       tcg_out_opc_branch(s, OPC_BNE, TCG_REG_TMP0, TCG_REG_TMP1, 0);
>   
>       /* TLB Hit - translate address using addend.  */
> +    addr_adj = addr_reg;
>       if (TARGET_LONG_BITS == 32) {
> -        tcg_out_ext32u(s, TCG_REG_TMP0, addr_reg);
> -        addr_reg = TCG_REG_TMP0;
> +        addr_adj = TCG_REG_TMP0;
> +        tcg_out_ext32u(s, addr_adj, addr_reg);
>       }
> -    tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP2, addr_reg);
> +    tcg_out_opc_reg(s, OPC_ADD, TCG_REG_TMP0, TCG_REG_TMP2, addr_adj);

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>       *pbase = TCG_REG_TMP0;
>   #else
>       if (a_mask) {

