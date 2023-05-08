Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pvznR-0001IY-Je
	for mharc-qemu-riscv@gnu.org; Mon, 08 May 2023 08:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pvznH-0001HT-6i; Mon, 08 May 2023 08:16:44 -0400
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pvzn1-0001Fs-Tz; Mon, 08 May 2023 08:16:42 -0400
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-54faddff4aaso98956eaf.2; 
 Mon, 08 May 2023 05:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683548182; x=1686140182;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VhtvHvgEySJwGblIogyOL3zFd2YH0VuYaQFFT/+efjU=;
 b=TIMh1YiA1QKr/GVENxBZ4apTQyIfEKxYEQa8Skso2mKdROxKfumq7sR7b/0WZ9AiBX
 xrDaT/R6j0X7O3kJ+yuumAd0yyNOsmMmDhgxSJTRdMHCXLu/Bo4npcg5XsXHfBIL/R3J
 Ng9/Y5xKcmYs2ByJxGwskGmyaYOUauI2ORaNjcfHP+VH5LezxDDJDFByl8lvrc5aWYCN
 5+n+QTnr8ysjA5kvrmUmKn6o7j3bAE3Znb+2zbAeyruzq9B0KNknG9cJxp1HAbJ7er/P
 Lf/7ZqfxWsRVCVFY5OktAS+4bct3zr6J24k3Juhqa1PCU0aiOXf40amDaiZe06zoiSip
 EqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683548182; x=1686140182;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VhtvHvgEySJwGblIogyOL3zFd2YH0VuYaQFFT/+efjU=;
 b=UvR2QwuWWlBTd3pq1FHjmLFlvr0tB7lbZMs0axQNC56wmn1Zp6Vz4O+CRnXFnKZcq9
 LBkYiZb14QDpgIBszEdgDwUoRcQmA6On8CrWFIVeT9GcF7WAXiTT+Cbdj0iopXTehm0N
 +4QqROwwmCrMVKxGkg4vVIfIGdDIjbo4nWoe2TKsqnjDBruk9beTa9p/vG4MzsL9zjYL
 Uu16K+8c5eI4IUV8Y1kgFHHJmO7XxwLvehrLUQB4nWA9H4TPMUFiE7bUQ7/GR4n+kIl9
 TmoTRCth934K9SDVJEN+AI47Jqfl4hXef4JDEvgqDfGNioZ5RVtzhy/D/xEi7dcnAy6n
 dwMA==
X-Gm-Message-State: AC+VfDxUcj5ZcCzP+BVPB7UqnSus7wTC9wqI/r+/hkbKv6Yo2TgCse9W
 q1hxNGsN0uflh37pCFS6zEA=
X-Google-Smtp-Source: ACHHUZ7KkkqmW7X6q0Oiigs8iY3K9sOi2/rCJb8pekMsJICfD/ake1yhE0q6b+32OuWoxTXVcGYPZg==
X-Received: by 2002:a4a:6503:0:b0:54f:8906:c2a3 with SMTP id
 y3-20020a4a6503000000b0054f8906c2a3mr906206ooc.4.1683548182227; 
 Mon, 08 May 2023 05:16:22 -0700 (PDT)
Received: from [192.168.68.107] (189-46-207-53.dsl.telesp.net.br.
 [189.46.207.53]) by smtp.gmail.com with ESMTPSA id
 z19-20020a4ac213000000b00529cc3986c8sm3936703oop.40.2023.05.08.05.16.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 05:16:21 -0700 (PDT)
Message-ID: <08a29d36-3293-793e-b91a-6375e8007884@gmail.com>
Date: Mon, 8 May 2023 09:16:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 56/57] tcg/ppc: Support 128-bit load/store
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-57-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230503070656.1746170-57-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2d.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.802,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 08 May 2023 12:16:50 -0000



On 5/3/23 04:06, Richard Henderson wrote:
> Use LQ/STQ with ISA v2.07, and 16-byte atomicity is required.
> Note that these instructions do not require 16-byte alignment.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   tcg/ppc/tcg-target-con-set.h |   2 +
>   tcg/ppc/tcg-target-con-str.h |   1 +
>   tcg/ppc/tcg-target.h         |   3 +-
>   tcg/ppc/tcg-target.c.inc     | 173 +++++++++++++++++++++++++++++++----
>   4 files changed, 158 insertions(+), 21 deletions(-)
> 
> diff --git a/tcg/ppc/tcg-target-con-set.h b/tcg/ppc/tcg-target-con-set.h
> index f206b29205..bbd7b21247 100644
> --- a/tcg/ppc/tcg-target-con-set.h
> +++ b/tcg/ppc/tcg-target-con-set.h
> @@ -14,6 +14,7 @@ C_O0_I2(r, r)
>   C_O0_I2(r, ri)
>   C_O0_I2(v, r)
>   C_O0_I3(r, r, r)
> +C_O0_I3(o, m, r)
>   C_O0_I4(r, r, ri, ri)
>   C_O0_I4(r, r, r, r)
>   C_O1_I1(r, r)
> @@ -34,6 +35,7 @@ C_O1_I3(v, v, v, v)
>   C_O1_I4(r, r, ri, rZ, rZ)
>   C_O1_I4(r, r, r, ri, ri)
>   C_O2_I1(r, r, r)
> +C_O2_I1(o, m, r)
>   C_O2_I2(r, r, r, r)
>   C_O2_I4(r, r, rI, rZM, r, r)
>   C_O2_I4(r, r, r, r, rI, rZM)
> diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
> index 094613cbcb..20846901de 100644
> --- a/tcg/ppc/tcg-target-con-str.h
> +++ b/tcg/ppc/tcg-target-con-str.h
> @@ -9,6 +9,7 @@
>    * REGS(letter, register_mask)
>    */
>   REGS('r', ALL_GENERAL_REGS)
> +REGS('o', ALL_GENERAL_REGS & 0xAAAAAAAAu)  /* odd registers */
>   REGS('v', ALL_VECTOR_REGS)
>   
>   /*
> diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
> index 0914380bd7..204b70f86a 100644
> --- a/tcg/ppc/tcg-target.h
> +++ b/tcg/ppc/tcg-target.h
> @@ -149,7 +149,8 @@ extern bool have_vsx;
>   #define TCG_TARGET_HAS_mulsh_i64        1
>   #endif
>   
> -#define TCG_TARGET_HAS_qemu_ldst_i128   0
> +#define TCG_TARGET_HAS_qemu_ldst_i128   \
> +    (TCG_TARGET_REG_BITS == 64 && have_isa_2_07)
>   
>   /*
>    * While technically Altivec could support V64, it has no 64-bit store
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index 60375804cd..682743a466 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -295,25 +295,27 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
>   
>   #define B      OPCD( 18)
>   #define BC     OPCD( 16)
> +
>   #define LBZ    OPCD( 34)
>   #define LHZ    OPCD( 40)
>   #define LHA    OPCD( 42)
>   #define LWZ    OPCD( 32)
>   #define LWZUX  XO31( 55)
> -#define STB    OPCD( 38)
> -#define STH    OPCD( 44)
> -#define STW    OPCD( 36)
> -
> -#define STD    XO62(  0)
> -#define STDU   XO62(  1)
> -#define STDX   XO31(149)
> -
>   #define LD     XO58(  0)
>   #define LDX    XO31( 21)
>   #define LDU    XO58(  1)
>   #define LDUX   XO31( 53)
>   #define LWA    XO58(  2)
>   #define LWAX   XO31(341)
> +#define LQ     OPCD( 56)
> +
> +#define STB    OPCD( 38)
> +#define STH    OPCD( 44)
> +#define STW    OPCD( 36)
> +#define STD    XO62(  0)
> +#define STDU   XO62(  1)
> +#define STDX   XO31(149)
> +#define STQ    XO62(  2)
>   
>   #define ADDIC  OPCD( 12)
>   #define ADDI   OPCD( 14)
> @@ -2015,11 +2017,25 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
>   typedef struct {
>       TCGReg base;
>       TCGReg index;
> +    MemOp align;
> +    MemOp atom;
>   } HostAddress;
>   
>   bool tcg_target_has_memory_bswap(MemOp memop)
>   {
> -    return true;
> +    MemOp atom_a, atom_u;
> +
> +    if ((memop & MO_SIZE) <= MO_64) {
> +        return true;
> +    }
> +
> +    /*
> +     * Reject 16-byte memop with 16-byte atomicity,
> +     * but do allow a pair of 64-bit operations.
> +     */
> +    (void)atom_and_align_for_opc(tcg_ctx, &atom_a, &atom_u, memop,
> +                                 MO_ATOM_IFALIGN, true);
> +    return atom_a <= MO_64;
>   }
>   
>   /*
> @@ -2034,7 +2050,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
>   {
>       TCGLabelQemuLdst *ldst = NULL;
>       MemOp opc = get_memop(oi);
> -    MemOp a_bits, atom_a, atom_u;
> +    MemOp a_bits, atom_u, s_bits;
>   
>       /*
>        * Book II, Section 1.4, Single-Copy Atomicity, specifies:
> @@ -2046,10 +2062,19 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
>        * As of 3.0, "the non-atomic access is performed as described in
>        * the corresponding list", which matches MO_ATOM_SUBALIGN.
>        */
> -    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
> +    s_bits = opc & MO_SIZE;
> +    a_bits = atom_and_align_for_opc(s, &h->atom, &atom_u, opc,
>                                       have_isa_3_00 ? MO_ATOM_SUBALIGN
>                                                     : MO_ATOM_IFALIGN,
> -                                    false);
> +                                    s_bits == MO_128);
> +
> +    if (TCG_TARGET_REG_BITS == 32) {
> +        /* We don't support unaligned accesses on 32-bits. */
> +        if (a_bits < s_bits) {
> +            a_bits = s_bits;
> +        }
> +    }
> +    h->align = a_bits;
>   
>   #ifdef CONFIG_SOFTMMU
>       int mem_index = get_mmuidx(oi);
> @@ -2058,7 +2083,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
>       int fast_off = TLB_MASK_TABLE_OFS(mem_index);
>       int mask_off = fast_off + offsetof(CPUTLBDescFast, mask);
>       int table_off = fast_off + offsetof(CPUTLBDescFast, table);
> -    unsigned s_bits = opc & MO_SIZE;
>   
>       ldst = new_ldst_label(s);
>       ldst->is_ld = is_ld;
> @@ -2108,13 +2132,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
>   
>       /* Clear the non-page, non-alignment bits from the address in R0. */
>       if (TCG_TARGET_REG_BITS == 32) {
> -        /* We don't support unaligned accesses on 32-bits.
> -         * Preserve the bottom bits and thus trigger a comparison
> -         * failure on unaligned accesses.
> -         */
> -        if (a_bits < s_bits) {
> -            a_bits = s_bits;
> -        }
>           tcg_out_rlw(s, RLWINM, TCG_REG_R0, addrlo, 0,
>                       (32 - a_bits) & 31, 31 - TARGET_PAGE_BITS);
>       } else {
> @@ -2299,6 +2316,108 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg datalo, TCGReg datahi,
>       }
>   }
>   
> +static TCGLabelQemuLdst *
> +prepare_host_addr_index_only(TCGContext *s, HostAddress *h, TCGReg addr_reg,
> +                             MemOpIdx oi, bool is_ld)
> +{
> +    TCGLabelQemuLdst *ldst;
> +
> +    ldst = prepare_host_addr(s, h, addr_reg, -1, oi, true);
> +
> +    /* Compose the final address, as LQ/STQ have no indexing. */
> +    if (h->base != 0) {
> +        tcg_out32(s, ADD | TAB(TCG_REG_TMP1, h->base, h->index));
> +        h->index = TCG_REG_TMP1;
> +        h->base = 0;
> +    }
> +
> +    return ldst;
> +}
> +
> +static void tcg_out_qemu_ld128(TCGContext *s, TCGReg datalo, TCGReg datahi,
> +                               TCGReg addr_reg, MemOpIdx oi)
> +{
> +    TCGLabelQemuLdst *ldst;
> +    HostAddress h;
> +    bool need_bswap;
> +
> +    ldst = prepare_host_addr_index_only(s, &h, addr_reg, oi, true);
> +    need_bswap = get_memop(oi) & MO_BSWAP;
> +
> +    if (h.atom == MO_128) {
> +        tcg_debug_assert(!need_bswap);
> +        tcg_debug_assert(datalo & 1);
> +        tcg_debug_assert(datahi == datalo - 1);
> +        tcg_out32(s, LQ | TAI(datahi, h.index, 0));
> +    } else {
> +        TCGReg d1, d2;
> +
> +        if (HOST_BIG_ENDIAN ^ need_bswap) {
> +            d1 = datahi, d2 = datalo;
> +        } else {
> +            d1 = datalo, d2 = datahi;
> +        }
> +
> +        if (need_bswap) {
> +            tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R0, 8);
> +            tcg_out32(s, LDBRX | TAB(d1, 0, h.index));
> +            tcg_out32(s, LDBRX | TAB(d2, h.index, TCG_REG_R0));
> +        } else {
> +            tcg_out32(s, LD | TAI(d1, h.index, 0));
> +            tcg_out32(s, LD | TAI(d2, h.index, 8));
> +        }
> +    }
> +
> +    if (ldst) {
> +        ldst->type = TCG_TYPE_I128;
> +        ldst->datalo_reg = datalo;
> +        ldst->datahi_reg = datahi;
> +        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
> +    }
> +}
> +
> +static void tcg_out_qemu_st128(TCGContext *s, TCGReg datalo, TCGReg datahi,
> +                               TCGReg addr_reg, MemOpIdx oi)
> +{
> +    TCGLabelQemuLdst *ldst;
> +    HostAddress h;
> +    bool need_bswap;
> +
> +    ldst = prepare_host_addr_index_only(s, &h, addr_reg, oi, false);
> +    need_bswap = get_memop(oi) & MO_BSWAP;
> +
> +    if (h.atom == MO_128) {
> +        tcg_debug_assert(!need_bswap);
> +        tcg_debug_assert(datalo & 1);
> +        tcg_debug_assert(datahi == datalo - 1);
> +        tcg_out32(s, STQ | TAI(datahi, h.index, 0));
> +    } else {
> +        TCGReg d1, d2;
> +
> +        if (HOST_BIG_ENDIAN ^ need_bswap) {
> +            d1 = datahi, d2 = datalo;
> +        } else {
> +            d1 = datalo, d2 = datahi;
> +        }
> +
> +        if (need_bswap) {
> +            tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R0, 8);
> +            tcg_out32(s, STDBRX | TAB(d1, 0, h.index));
> +            tcg_out32(s, STDBRX | TAB(d2, h.index, TCG_REG_R0));
> +        } else {
> +            tcg_out32(s, STD | TAI(d1, h.index, 0));
> +            tcg_out32(s, STD | TAI(d2, h.index, 8));
> +        }
> +    }
> +
> +    if (ldst) {
> +        ldst->type = TCG_TYPE_I128;
> +        ldst->datalo_reg = datalo;
> +        ldst->datahi_reg = datahi;
> +        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
> +    }
> +}
> +
>   static void tcg_out_nop_fill(tcg_insn_unit *p, int count)
>   {
>       int i;
> @@ -2849,6 +2968,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>                               args[4], TCG_TYPE_I64);
>           }
>           break;
> +    case INDEX_op_qemu_ld_i128:
> +        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
> +        tcg_out_qemu_ld128(s, args[0], args[1], args[2], args[3]);
> +        break;
> +
>       case INDEX_op_qemu_st_i32:
>           if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
>               tcg_out_qemu_st(s, args[0], -1, args[1], -1,
> @@ -2870,6 +2994,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>                               args[4], TCG_TYPE_I64);
>           }
>           break;
> +    case INDEX_op_qemu_st_i128:
> +        tcg_debug_assert(TCG_TARGET_REG_BITS == 64);
> +        tcg_out_qemu_st128(s, args[0], args[1], args[2], args[3]);
> +        break;
>   
>       case INDEX_op_setcond_i32:
>           tcg_out_setcond(s, TCG_TYPE_I32, args[3], args[0], args[1], args[2],
> @@ -3705,6 +3833,11 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
>                   : TARGET_LONG_BITS == 32 ? C_O0_I3(r, r, r)
>                   : C_O0_I4(r, r, r, r));
>   
> +    case INDEX_op_qemu_ld_i128:
> +        return C_O2_I1(o, m, r);
> +    case INDEX_op_qemu_st_i128:
> +        return C_O0_I3(o, m, r);
> +
>       case INDEX_op_add_vec:
>       case INDEX_op_sub_vec:
>       case INDEX_op_mul_vec:

