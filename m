Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ppzmK-0001KB-RB
	for mharc-qemu-riscv@gnu.org; Fri, 21 Apr 2023 19:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzmJ-0001He-3N
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 19:02:55 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppzmE-0005em-To
 for qemu-riscv@nongnu.org; Fri, 21 Apr 2023 19:02:54 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-2febac9cacdso1399911f8f.1
 for <qemu-riscv@nongnu.org>; Fri, 21 Apr 2023 16:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682118169; x=1684710169;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EbFyb0Ad1lYHY0EHwo8oisfMbNW33j+iwsZIrczwpyc=;
 b=RNYI1RMwKUjt52lNe2Cy1viGFpyd6RC7CvSugyFp9DvD7EAlfvfXa5EyyVP2EsH1hb
 AjAQ1AL09g2qfk3K7u8EmWPsrgsb3J36eIQ8xwggTqzIFZuE1/xkP1ya40q1Bs9tY1Xm
 bSDqpUoQhPclpdMLqCwMSHtxSuzfVRwMmYtzbKSU2fC7qVuAmV31s4ZS2D409TmGz3lY
 LGsyusAWorCI18MXxUuUzy6YgZvIwRtyw/J83of87LJroEHe4z/pgyqPrUAp0m//N+Wz
 FZ3OscE845ivqwP3kovDLrRvF0tCriiWBGMyt3mYBZBDUiKk8Tex+x6p89AycKwKVVXz
 9+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682118169; x=1684710169;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EbFyb0Ad1lYHY0EHwo8oisfMbNW33j+iwsZIrczwpyc=;
 b=emklmscTmMzGfBO+komLDt6peXgr/F+DwJ55rOC3IVs4T/CD9KoWTzHdqFrekHnk4y
 WE7leSCTf+pKsepL7BajSBsIteMqQmeiEBIyQc9hShhnNz3unMTM32Of1l9gV638Yeeo
 55P1/0NuhJ4tFyRSkSOeYjdJmO2WCbHztLjHjTDVfPmdV/59TTasFuafvbd+3HoCwlzU
 aopQAYAKvzEvI6jBfiW+idyvv7uVWf6Sw+/jKIEvizUiM56ZllJL1joLyTtcY7I+F63V
 51cPUI2qYP+zKE6PLVBnbb/1EtNkBn/y+KKoWgYu50l+rD97xcTF9WUbExxNF3l9qvOm
 QOhA==
X-Gm-Message-State: AAQBX9fxB226e0a29NlPfg7keSzqp4DB8weUrdwJ/i6QFEWESyCM6o/E
 MxwXjdlQp8aSjyXRMaAebvuDsQ==
X-Google-Smtp-Source: AKy350YDm1H9AwhJspVbArho5zBcgFq6dIIYmI6CuoVm63lxHatzqhny1wYjxKUrPSTf8UOLm8s9Gg==
X-Received: by 2002:adf:ec90:0:b0:2f0:27cc:1e7 with SMTP id
 z16-20020adfec90000000b002f027cc01e7mr4670313wrn.9.1682118169127; 
 Fri, 21 Apr 2023 16:02:49 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 j3-20020a5d5643000000b002e4cd2ec5c7sm5316055wrw.86.2023.04.21.16.02.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 16:02:48 -0700 (PDT)
Message-ID: <8c880789-0afe-aa91-7503-b62c6b07dc96@linaro.org>
Date: Sat, 22 Apr 2023 01:02:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 16/54] tcg: Introduce tcg_out_movext
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 21 Apr 2023 23:02:55 -0000

On 11/4/23 03:04, Richard Henderson wrote:
> This is common code in most qemu_{ld,st} slow paths, extending the
> input value for the store helper data argument or extending the
> return value from the load helper.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        | 63 ++++++++++++++++++++++++++++++++
>   tcg/aarch64/tcg-target.c.inc     |  8 +---
>   tcg/arm/tcg-target.c.inc         | 16 ++------
>   tcg/i386/tcg-target.c.inc        | 30 +++------------
>   tcg/loongarch64/tcg-target.c.inc | 53 ++++-----------------------
>   tcg/ppc/tcg-target.c.inc         | 38 +++++--------------
>   tcg/riscv/tcg-target.c.inc       | 13 +------
>   tcg/s390x/tcg-target.c.inc       | 19 ++--------
>   tcg/sparc64/tcg-target.c.inc     | 32 ++++------------
>   9 files changed, 104 insertions(+), 168 deletions(-)


> diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
> index 1820655ee3..f865294861 100644
> --- a/tcg/arm/tcg-target.c.inc
> +++ b/tcg/arm/tcg-target.c.inc
> @@ -1567,17 +1567,7 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
>   
>       datalo = lb->datalo_reg;
>       datahi = lb->datahi_reg;
> -    switch (opc & MO_SSIZE) {
> -    case MO_SB:
> -        tcg_out_ext8s(s, TCG_TYPE_I32, datalo, TCG_REG_R0);
> -        break;
> -    case MO_SW:
> -        tcg_out_ext16s(s, TCG_TYPE_I32, datalo, TCG_REG_R0);
> -        break;
> -    default:
> -        tcg_out_mov_reg(s, COND_AL, datalo, TCG_REG_R0);
> -        break;
> -    case MO_UQ:
> +    if ((opc & MO_SIZE) == MO_64) {
>           if (datalo != TCG_REG_R1) {
>               tcg_out_mov_reg(s, COND_AL, datalo, TCG_REG_R0);
>               tcg_out_mov_reg(s, COND_AL, datahi, TCG_REG_R1);
> @@ -1589,7 +1579,9 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
>               tcg_out_mov_reg(s, COND_AL, datahi, TCG_REG_R1);
>               tcg_out_mov_reg(s, COND_AL, datalo, TCG_REG_TMP);
>           }
> -        break;
> +    } else {
> +        tcg_out_movext(s, TCG_TYPE_I32, lb->datalo_reg,

Why not use 'datalo' like in i386?

> +                       TCG_TYPE_I32, opc & MO_SSIZE, TCG_REG_R0);
>       }
>   
>       tcg_out_goto(s, COND_AL, lb->raddr);
> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
> index a166a195c4..4847da7e1a 100644
> --- a/tcg/i386/tcg-target.c.inc
> +++ b/tcg/i386/tcg-target.c.inc
> @@ -1946,28 +1946,8 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
>       tcg_out_branch(s, 1, qemu_ld_helpers[opc & (MO_BSWAP | MO_SIZE)]);
>   
>       data_reg = l->datalo_reg;
> -    switch (opc & MO_SSIZE) {
> -    case MO_SB:
> -        tcg_out_ext8s(s, l->type, data_reg, TCG_REG_EAX);
> -        break;
> -    case MO_SW:
> -        tcg_out_ext16s(s, l->type, data_reg, TCG_REG_EAX);
> -        break;
> -#if TCG_TARGET_REG_BITS == 64
> -    case MO_SL:
> -        tcg_out_ext32s(s, data_reg, TCG_REG_EAX);
> -        break;
> -#endif
> -    case MO_UB:
> -    case MO_UW:
> -        /* Note that the helpers have zero-extended to tcg_target_long.  */
> -    case MO_UL:
> -        tcg_out_mov(s, TCG_TYPE_I32, data_reg, TCG_REG_EAX);
> -        break;
> -    case MO_UQ:
> -        if (TCG_TARGET_REG_BITS == 64) {
> -            tcg_out_mov(s, TCG_TYPE_I64, data_reg, TCG_REG_RAX);
> -        } else if (data_reg == TCG_REG_EDX) {
> +    if (TCG_TARGET_REG_BITS == 32 && (opc & MO_SIZE) == MO_64) {
> +        if (data_reg == TCG_REG_EDX) {
>               /* xchg %edx, %eax */
>               tcg_out_opc(s, OPC_XCHG_ax_r32 + TCG_REG_EDX, 0, 0, 0);
>               tcg_out_mov(s, TCG_TYPE_I32, l->datahi_reg, TCG_REG_EAX);
> @@ -1975,9 +1955,9 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
>               tcg_out_mov(s, TCG_TYPE_I32, data_reg, TCG_REG_EAX);
>               tcg_out_mov(s, TCG_TYPE_I32, l->datahi_reg, TCG_REG_EDX);
>           }
> -        break;
> -    default:
> -        g_assert_not_reached();
> +    } else {
> +        tcg_out_movext(s, l->type, data_reg,
> +                       TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_EAX);
>       }
>   
>       /* Jump to the code corresponding to next IR of qemu_st */


[I'm skipping the ppc change hopping Daniel can review it]

> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index 4c4178b700..b1d9c0bbe4 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -1971,10 +1971,6 @@ static const uint32_t qemu_stx_opc[(MO_SIZE + MO_BSWAP) + 1] = {
>       [MO_BSWAP | MO_UQ] = STDBRX,
>   };
>   
> -static const uint32_t qemu_exts_opc[4] = {
> -    EXTSB, EXTSH, EXTSW, 0
> -};
> -
>   #if defined (CONFIG_SOFTMMU)
>   /* helper signature: helper_ld_mmu(CPUState *env, target_ulong addr,
>    *                                 int mmu_idx, uintptr_t ra)
> @@ -2168,11 +2164,9 @@ static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
>       if (TCG_TARGET_REG_BITS == 32 && (opc & MO_SIZE) == MO_64) {
>           tcg_out_mov(s, TCG_TYPE_I32, lo, TCG_REG_R4);
>           tcg_out_mov(s, TCG_TYPE_I32, hi, TCG_REG_R3);
> -    } else if (opc & MO_SIGN) {
> -        uint32_t insn = qemu_exts_opc[opc & MO_SIZE];
> -        tcg_out32(s, insn | RA(lo) | RS(TCG_REG_R3));
>       } else {
> -        tcg_out_mov(s, TCG_TYPE_REG, lo, TCG_REG_R3);
> +        tcg_out_movext(s, lb->type, lo,
> +                       TCG_TYPE_REG, opc & MO_SSIZE, TCG_REG_R3);
>       }
>   
>       tcg_out_b(s, 0, lb->raddr);
> @@ -2206,25 +2200,13 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
>   
>       lo = lb->datalo_reg;
>       hi = lb->datahi_reg;
> -    if (TCG_TARGET_REG_BITS == 32) {
> -        switch (s_bits) {
> -        case MO_64:
> -            arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
> -            tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
> -            /* FALLTHRU */
> -        case MO_32:
> -            tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
> -            break;
> -        default:
> -            tcg_out_rlw(s, RLWINM, arg++, lo, 0, 32 - (8 << s_bits), 31);
> -            break;
> -        }
> +    if (TCG_TARGET_REG_BITS == 32 && s_bits == MO_64) {
> +        arg |= (TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN);
> +        tcg_out_mov(s, TCG_TYPE_I32, arg++, hi);
> +        tcg_out_mov(s, TCG_TYPE_I32, arg++, lo);
>       } else {
> -        if (s_bits == MO_64) {
> -            tcg_out_mov(s, TCG_TYPE_I64, arg++, lo);
> -        } else {
> -            tcg_out_rld(s, RLDICL, arg++, lo, 0, 64 - (8 << s_bits));
> -        }
> +        tcg_out_movext(s, s_bits == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
> +                       arg++, lb->type, s_bits, lo);
>       }
>   
>       tcg_out_movi(s, TCG_TYPE_I32, arg++, oi);
> @@ -2371,8 +2353,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
>           } else {
>               insn = qemu_ldx_opc[opc & (MO_SIZE | MO_BSWAP)];
>               tcg_out32(s, insn | TAB(datalo, rbase, addrlo));
> -            insn = qemu_exts_opc[s_bits];
> -            tcg_out32(s, insn | RA(datalo) | RS(datalo));
> +            tcg_out_movext(s, TCG_TYPE_REG, datalo,
> +                           TCG_TYPE_REG, opc & MO_SSIZE, datalo);
>           }
>       }
>   


> diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
> index 18ddd6bb9f..99ba0fdc2b 100644
> --- a/tcg/sparc64/tcg-target.c.inc
> +++ b/tcg/sparc64/tcg-target.c.inc
> @@ -917,26 +917,6 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
>   static const tcg_insn_unit *qemu_ld_trampoline[(MO_SSIZE | MO_BSWAP) + 1];
>   static const tcg_insn_unit *qemu_st_trampoline[(MO_SIZE | MO_BSWAP) + 1];
>   
> -static void emit_extend(TCGContext *s, TCGReg r, int op)
> -{
> -    /* Emit zero extend of 8, 16 or 32 bit data as
> -     * required by the MO_* value op; do nothing for 64 bit.
> -     */
> -    switch (op & MO_SIZE) {
> -    case MO_8:
> -        tcg_out_ext8u(s, r, r);
> -        break;
> -    case MO_16:
> -        tcg_out_ext16u(s, r, r);
> -        break;
> -    case MO_32:
> -        tcg_out_ext32u(s, r, r);
> -        break;
> -    case MO_64:
> -        break;
> -    }
> -}
> -
>   static void build_trampolines(TCGContext *s)
>   {
>       static void * const qemu_ld_helpers[] = {
> @@ -993,8 +973,6 @@ static void build_trampolines(TCGContext *s)
>           }
>           qemu_st_trampoline[i] = tcg_splitwx_to_rx(s->code_ptr);
>   
> -        emit_extend(s, TCG_REG_O2, i);
> -
>           /* Set the retaddr operand.  */
>           tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_O4, TCG_REG_O7);
>   
> @@ -1341,7 +1319,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
>   }
>   
>   static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
> -                            MemOpIdx oi)
> +                            MemOpIdx oi, bool is64)

Why not directly pass 'TCGType data_type' instead of is64?

Otherwise (except ppc),

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   {
>       MemOp memop = get_memop(oi);
>       tcg_insn_unit *label_ptr;
> @@ -1367,7 +1345,9 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
>       /* TLB Miss.  */
>   
>       tcg_out_mov(s, TCG_TYPE_REG, TCG_REG_O1, addrz);
> -    tcg_out_mov(s, TCG_TYPE_REG, TCG_REG_O2, data);
> +    tcg_out_movext(s, (memop & MO_SIZE) == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
> +                   TCG_REG_O2, is64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
> +                   memop & MO_SIZE, data);
>   
>       func = qemu_st_trampoline[memop & (MO_BSWAP | MO_SIZE)];
>       tcg_debug_assert(func != NULL);
> @@ -1658,8 +1638,10 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>           tcg_out_qemu_ld(s, a0, a1, a2, true);
>           break;
>       case INDEX_op_qemu_st_i32:
> +        tcg_out_qemu_st(s, a0, a1, a2, false);
> +        break;
>       case INDEX_op_qemu_st_i64:
> -        tcg_out_qemu_st(s, a0, a1, a2);
> +        tcg_out_qemu_st(s, a0, a1, a2, true);
>           break;
>   
>       case INDEX_op_ld32s_i64:


