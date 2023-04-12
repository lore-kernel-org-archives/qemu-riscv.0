Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmfqU-0004Mf-DD
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 15:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pmfqS-0004Lo-S8; Wed, 12 Apr 2023 15:09:28 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pmfqQ-0007nC-Qt; Wed, 12 Apr 2023 15:09:28 -0400
Received: by mail-oi1-x234.google.com with SMTP id w19so8445027oiv.13;
 Wed, 12 Apr 2023 12:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681326564; x=1683918564;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J8xaAOsvAymfXqle1+eIeI5LKAaWJYrCJLIKBMQ2xyk=;
 b=JG2+DHUahf12C9YJ7YZ2x/wwMWNdyF0/ofbn7p2fypF9QVrdXG1AJcf6jP17BvhYuP
 jqmwjk3t1B8YjUAjuH5CmV94uoiIKpXJA9iX1HfS/wn33ZVmLZ6vLRUWTAR9m7zNRgEC
 43ZzoAhKTVnNEEP+XXpLF/ypG5DP651uxcIiTQDF0O1L22/CHZrsv4Lip3W+Cfp1saZX
 H0RO/HdJioXBLUqt2M2O5TuA78PsqAuXyNBW8K33l2ydbksAdNdYw8U5sA23bnGOX5Uz
 uKcJvl3aeV/QRbLnfdqyXcKXVusdUKf38a54svhUxgJs/1ZZKTRnNSXRmXiRvZ+6AGNM
 rwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681326564; x=1683918564;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J8xaAOsvAymfXqle1+eIeI5LKAaWJYrCJLIKBMQ2xyk=;
 b=Os05FZIYmy1Wv7r5jX0ctVUANvxaTuCe0dBan7LLAeOnK2zlvgfFsao8mCIC/I8ffO
 4jslZnNdPOg7Am8iH1aNAVa0xCpB1Nd/Lq8rHTtNJqmvrpuU6CIsuK/LCFFW8esG0B4C
 iP1HJeXdE/jQd2KyRtxTjJ3VUGLR7qmW3QIvsTy/wAHvPwnMFDsdKPAj3iC+KF9lfqe8
 kvWnwHdp9S0A0KpxnfF1tH7d6XyFUvfwwpqFgyB8nLyJ8ZIGLRYuaOUtNb1/H4n8+tlg
 Lxl047x42lrKjeKsa2Y90LyvQRfm6T2YI3K79TAnSt+l1XuOKfO2+kDh886sVHe6UcnJ
 Nmvw==
X-Gm-Message-State: AAQBX9egNTQbktCu9SO0nXqg3LftLo88pElx4jvv8rq5sNHad27NmEBR
 Ze+scpNhNvVtRIbXU1wUC/KliFJX3HI=
X-Google-Smtp-Source: AKy350bWVRi7dJbfBbbBoJ989faWL2+kT+B8ugHLI32DqykxehX7/pxVQpLMsiE4dH88IPnfLkC2FQ==
X-Received: by 2002:a05:6808:b04:b0:38b:f3ab:aa71 with SMTP id
 s4-20020a0568080b0400b0038bf3abaa71mr1336460oij.16.1681326563978; 
 Wed, 12 Apr 2023 12:09:23 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 y203-20020acae1d4000000b0038b734b335csm7023839oig.43.2023.04.12.12.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 12:09:23 -0700 (PDT)
Message-ID: <00f5a587-37ad-1f2a-e8d7-b6f20ef76e45@gmail.com>
Date: Wed, 12 Apr 2023 16:09:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 49/54] tcg/ppc: Reorg tcg_out_tlb_read
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-50-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230411010512.5375-50-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.083,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 12 Apr 2023 19:09:29 -0000



On 4/10/23 22:05, Richard Henderson wrote:
> Allocate TCG_REG_TMP2.  Use R0, TMP1, TMP2 instead of any of
> the normally allocated registers for the tlb load.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   tcg/ppc/tcg-target.c.inc | 84 +++++++++++++++++++++++-----------------
>   1 file changed, 49 insertions(+), 35 deletions(-)
> 
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index 1b60166d2f..613cd73583 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -68,6 +68,7 @@
>   #else
>   # define TCG_REG_TMP1   TCG_REG_R12
>   #endif
> +#define TCG_REG_TMP2    TCG_REG_R11
>   
>   #define TCG_VEC_TMP1    TCG_REG_V0
>   #define TCG_VEC_TMP2    TCG_REG_V1
> @@ -2007,10 +2008,11 @@ static void * const qemu_st_helpers[(MO_SIZE | MO_BSWAP) + 1] = {
>   QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) > 0);
>   QEMU_BUILD_BUG_ON(TLB_MASK_TABLE_OFS(0) < -32768);
>   
> -/* Perform the TLB load and compare.  Places the result of the comparison
> -   in CR7, loads the addend of the TLB into R3, and returns the register
> -   containing the guest address (zero-extended into R4).  Clobbers R0 and R2. */
> -
> +/*
> + * Perform the TLB load and compare.  Places the result of the comparison
> + * in CR7, loads the addend of the TLB into TMP1, and returns the register
> + * containing the guest address (zero-extended into TMP2).  Clobbers R0.
> + */
>   static TCGReg tcg_out_tlb_read(TCGContext *s, MemOp opc,
>                                  TCGReg addrlo, TCGReg addrhi,
>                                  int mem_index, bool is_read)
> @@ -2026,40 +2028,44 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, MemOp opc,
>       unsigned a_bits = get_alignment_bits(opc);
>   
>       /* Load tlb_mask[mmu_idx] and tlb_table[mmu_idx].  */
> -    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_R3, TCG_AREG0, mask_off);
> -    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_R4, TCG_AREG0, table_off);
> +    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_AREG0, mask_off);
> +    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP2, TCG_AREG0, table_off);
>   
>       /* Extract the page index, shifted into place for tlb index.  */
>       if (TCG_TARGET_REG_BITS == 32) {
> -        tcg_out_shri32(s, TCG_REG_TMP1, addrlo,
> +        tcg_out_shri32(s, TCG_REG_R0, addrlo,
>                          TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
>       } else {
> -        tcg_out_shri64(s, TCG_REG_TMP1, addrlo,
> +        tcg_out_shri64(s, TCG_REG_R0, addrlo,
>                          TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
>       }
> -    tcg_out32(s, AND | SAB(TCG_REG_R3, TCG_REG_R3, TCG_REG_TMP1));
> +    tcg_out32(s, AND | SAB(TCG_REG_TMP1, TCG_REG_TMP1, TCG_REG_R0));
>   
> -    /* Load the TLB comparator.  */
> +    /* Load the (low part) TLB comparator into TMP2. */
>       if (cmp_off == 0 && TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
>           uint32_t lxu = (TCG_TARGET_REG_BITS == 32 || TARGET_LONG_BITS == 32
>                           ? LWZUX : LDUX);
> -        tcg_out32(s, lxu | TAB(TCG_REG_TMP1, TCG_REG_R3, TCG_REG_R4));
> +        tcg_out32(s, lxu | TAB(TCG_REG_TMP2, TCG_REG_TMP1, TCG_REG_TMP2));
>       } else {
> -        tcg_out32(s, ADD | TAB(TCG_REG_R3, TCG_REG_R3, TCG_REG_R4));
> +        tcg_out32(s, ADD | TAB(TCG_REG_TMP1, TCG_REG_TMP1, TCG_REG_TMP2));
>           if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
> -            tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_TMP1, TCG_REG_R3, cmp_off + 4);
> -            tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_R4, TCG_REG_R3, cmp_off);
> +            tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_TMP2,
> +                       TCG_REG_TMP1, cmp_off + 4);
>           } else {
> -            tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP1, TCG_REG_R3, cmp_off);
> +            tcg_out_ld(s, TCG_TYPE_TL, TCG_REG_TMP2, TCG_REG_TMP1, cmp_off);
>           }
>       }
>   
> -    /* Load the TLB addend for use on the fast path.  Do this asap
> -       to minimize any load use delay.  */
> -    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_R3, TCG_REG_R3,
> -               offsetof(CPUTLBEntry, addend));
> +    /*
> +     * Load the TLB addend for use on the fast path.
> +     * Do this asap to minimize any load use delay.
> +     */
> +    if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
> +        tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_REG_TMP1,
> +                   offsetof(CPUTLBEntry, addend));
> +    }
>   
> -    /* Clear the non-page, non-alignment bits from the address */
> +    /* Clear the non-page, non-alignment bits from the address into R0. */
>       if (TCG_TARGET_REG_BITS == 32) {
>           /* We don't support unaligned accesses on 32-bits.
>            * Preserve the bottom bits and thus trigger a comparison
> @@ -2090,9 +2096,6 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, MemOp opc,
>           if (TARGET_LONG_BITS == 32) {
>               tcg_out_rlw(s, RLWINM, TCG_REG_R0, t, 0,
>                           (32 - a_bits) & 31, 31 - TARGET_PAGE_BITS);
> -            /* Zero-extend the address for use in the final address.  */
> -            tcg_out_ext32u(s, TCG_REG_R4, addrlo);
> -            addrlo = TCG_REG_R4;
>           } else if (a_bits == 0) {
>               tcg_out_rld(s, RLDICR, TCG_REG_R0, t, 0, 63 - TARGET_PAGE_BITS);
>           } else {
> @@ -2102,16 +2105,28 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, MemOp opc,
>           }
>       }
>   
> +    /* Full or low part comparison into cr7. */
> +    tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP2, 0, 7, TCG_TYPE_I32);
> +
>       if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
> -        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP1,
> -                    0, 7, TCG_TYPE_I32);
> -        tcg_out_cmp(s, TCG_COND_EQ, addrhi, TCG_REG_R4, 0, 6, TCG_TYPE_I32);
> +        tcg_out_ld(s, TCG_TYPE_I32, TCG_REG_R0, TCG_REG_TMP1, cmp_off);
> +
> +        /* Load addend, deferred for this case. */
> +        tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TMP1, TCG_REG_TMP1,
> +                   offsetof(CPUTLBEntry, addend));
> +
> +        /* High part comparison into cr6. */
> +        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, addrhi, 0, 6, TCG_TYPE_I32);
> +
> +        /* Combine comparisons into cr7. */
>           tcg_out32(s, CRAND | BT(7, CR_EQ) | BA(6, CR_EQ) | BB(7, CR_EQ));
> -    } else {
> -        tcg_out_cmp(s, TCG_COND_EQ, TCG_REG_R0, TCG_REG_TMP1,
> -                    0, 7, TCG_TYPE_TL);
>       }
>   
> +    if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
> +        /* Zero-extend the address for use in the final address.  */
> +        tcg_out_ext32u(s, TCG_REG_TMP2, addrlo);
> +        return TCG_REG_TMP2;
> +    }
>       return addrlo;
>   }
>   
> @@ -2149,13 +2164,11 @@ static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
>   /*
>    * For the purposes of ppc32 sorting 4 input registers into 4 argument
>    * registers, there is an outside chance we would require 3 temps.
> - * Because of constraints, no inputs are in r3, and env will not be
> - * placed into r3 until after the sorting is done, and is thus free.
>    */
>   static const TCGLdstHelperParam ldst_helper_param = {
>       .ra_gen = ldst_ra_gen,
>       .ntmp = 3,
> -    .tmp = { TCG_REG_TMP1, TCG_REG_R0, TCG_REG_R3 }
> +    .tmp = { TCG_REG_TMP1, TCG_REG_TMP2, TCG_REG_R0 }
>   };
>   
>   static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
> @@ -2272,7 +2285,7 @@ static void tcg_out_qemu_ld(TCGContext *s,
>       label_ptr = s->code_ptr;
>       tcg_out32(s, BC | BI(7, CR_EQ) | BO_COND_FALSE | LK);
>   
> -    rbase = TCG_REG_R3;
> +    rbase = TCG_REG_TMP1;
>   #else  /* !CONFIG_SOFTMMU */
>       unsigned a_bits = get_alignment_bits(opc);
>       if (a_bits) {
> @@ -2344,7 +2357,7 @@ static void tcg_out_qemu_st(TCGContext *s,
>       label_ptr = s->code_ptr;
>       tcg_out32(s, BC | BI(7, CR_EQ) | BO_COND_FALSE | LK);
>   
> -    rbase = TCG_REG_R3;
> +    rbase = TCG_REG_TMP1;
>   #else  /* !CONFIG_SOFTMMU */
>       unsigned a_bits = get_alignment_bits(opc);
>       if (a_bits) {
> @@ -3944,7 +3957,8 @@ static void tcg_target_init(TCGContext *s)
>   #if defined(_CALL_SYSV) || TCG_TARGET_REG_BITS == 64
>       tcg_regset_set_reg(s->reserved_regs, TCG_REG_R13); /* thread pointer */
>   #endif
> -    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP1); /* mem temp */
> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP1);
> +    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP2);
>       tcg_regset_set_reg(s->reserved_regs, TCG_VEC_TMP1);
>       tcg_regset_set_reg(s->reserved_regs, TCG_VEC_TMP2);
>       if (USE_REG_TB) {

