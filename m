Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmfna-0001IJ-T9
	for mharc-qemu-riscv@gnu.org; Wed, 12 Apr 2023 15:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pmfnY-0001HH-OU; Wed, 12 Apr 2023 15:06:28 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pmfnW-0006ua-5g; Wed, 12 Apr 2023 15:06:28 -0400
Received: by mail-oi1-x22d.google.com with SMTP id bl22so26432367oib.11;
 Wed, 12 Apr 2023 12:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681326383; x=1683918383;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dy8T/Xmdv9DJBXd/g/t5Ziumrw996mNRkYD8cQ8V9zE=;
 b=WCvhb8ii16dMY6Sf24V4TCjCRArh0A2UogHsMjNgW1bYf/Ls8yTZVU5E3H2IkowP60
 uElwwEFdj585krj0hK3C4Itp4vKteRHowhinmZm6Tfwiuvsvfjj3BvXQ601K776qBh/Z
 U7PdRsmh4hyFz2XqoI3XzoI8QVUm7JK/rSc6KqCjzEvpDvmjb0v6Lpf5upicrMI+oqRU
 oDHjoU3eYqxnUWkBxihCcNmyvrKLD7zOEkTdpsLNMLGsNlwu/rhyB2pyNaLgSQJ/Pwoe
 Qf89jb8w5gVWB7LzlxNBOATu1BA6Ev7B8yv4U552G23VIIvOI5HtEch7UC3x6BshyidL
 1g1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681326383; x=1683918383;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dy8T/Xmdv9DJBXd/g/t5Ziumrw996mNRkYD8cQ8V9zE=;
 b=jE0T6eh5fSOZJEliDRZO0UJvYNh2c776B0PyAQVitUHkzD7U+b0A34sDoB+HpiUwoy
 uhcWAmYxL/jzCokY+sxZyXkEnWp1YgGjECinAYjWrzGJt5J0ie1PKb8ByQNgb5rgxYgM
 XfzHQ8MfD6vjtA+T8qDjylyYgxU+YNX+W7hfjeTJcj0OINJs/VmbmLWeMIwzPOmSzteo
 nI4fd1HPz7Z0K0I8s+FrTB0i5EegJA30VL1W/jhHszZHxAMjfySgpV7i/LXKAkgOcLng
 11lufnaTysbjXGwg95pYcaw3QW/t+wVT2iyqSlqhxCrPqy1cHrNQnq/wfD5qpeR5M7O7
 8SoQ==
X-Gm-Message-State: AAQBX9cMvF0r5lnSl5YpwpCFMCll/URL0daNtYj++ZOUEJXOLRk/Ralq
 M7J26jkNTJrnlfiQv0r+L7o=
X-Google-Smtp-Source: AKy350bHmsTb4HztOsUMjFXg0qrRWNq6rij1ErClwA+VEkxm6lwpuN+ckc9NqKtkToui/3Enx1P7+Q==
X-Received: by 2002:aca:280e:0:b0:38b:b27b:325e with SMTP id
 14-20020aca280e000000b0038bb27b325emr5894381oix.30.1681326382975; 
 Wed, 12 Apr 2023 12:06:22 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 ex19-20020a056808299300b003875e29808esm6951933oib.0.2023.04.12.12.06.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 12:06:22 -0700 (PDT)
Message-ID: <57a14beb-3c77-c0e4-21b8-948844deb50a@gmail.com>
Date: Wed, 12 Apr 2023 16:06:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 25/54] tcg/ppc: Rationalize args to tcg_out_qemu_{ld,st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-26-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230411010512.5375-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22d.google.com
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
X-List-Received-Date: Wed, 12 Apr 2023 19:06:29 -0000



On 4/10/23 22:04, Richard Henderson wrote:
> Interpret the variable argument placement in the caller.
> Mark the argument register const, because they must be passed to
> add_qemu_ldst_label unmodified.  This requires a bit of local
> variable renaming, because addrlo was being modified.
> 
> Pass data_type instead of is64 -- there are several places where
> we already convert back from bool to type.  Clean things up by
> using type throughout.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   tcg/ppc/tcg-target.c.inc | 164 +++++++++++++++++++++------------------
>   1 file changed, 89 insertions(+), 75 deletions(-)
> 
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index 77abb7d20c..90093a6509 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -2118,7 +2118,8 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, MemOp opc,
>   /* Record the context of a call to the out of line helper code for the slow
>      path for a load or store, so that we can later generate the correct
>      helper code.  */
> -static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
> +static void add_qemu_ldst_label(TCGContext *s, bool is_ld,
> +                                TCGType type, MemOpIdx oi,
>                                   TCGReg datalo_reg, TCGReg datahi_reg,
>                                   TCGReg addrlo_reg, TCGReg addrhi_reg,
>                                   tcg_insn_unit *raddr, tcg_insn_unit *lptr)
> @@ -2126,6 +2127,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
>       TCGLabelQemuLdst *label = new_ldst_label(s);
>   
>       label->is_ld = is_ld;
> +    label->type = type;
>       label->oi = oi;
>       label->datalo_reg = datalo_reg;
>       label->datahi_reg = datahi_reg;
> @@ -2288,30 +2290,19 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
>   
>   #endif /* SOFTMMU */
>   
> -static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
> +static void tcg_out_qemu_ld(TCGContext *s,
> +                            const TCGReg datalo, const TCGReg datahi,
> +                            const TCGReg addrlo, const TCGReg addrhi,
> +                            const MemOpIdx oi, TCGType data_type)
>   {
> -    TCGReg datalo, datahi, addrlo, rbase;
> -    TCGReg addrhi __attribute__((unused));
> -    MemOpIdx oi;
> -    MemOp opc, s_bits;
> +    MemOp opc = get_memop(oi);
> +    MemOp s_bits = opc & MO_SIZE;
> +    TCGReg rbase, index;
> +
>   #ifdef CONFIG_SOFTMMU
> -    int mem_index;
>       tcg_insn_unit *label_ptr;
> -#else
> -    unsigned a_bits;
> -#endif
>   
> -    datalo = *args++;
> -    datahi = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
> -    addrlo = *args++;
> -    addrhi = (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
> -    oi = *args++;
> -    opc = get_memop(oi);
> -    s_bits = opc & MO_SIZE;
> -
> -#ifdef CONFIG_SOFTMMU
> -    mem_index = get_mmuidx(oi);
> -    addrlo = tcg_out_tlb_read(s, opc, addrlo, addrhi, mem_index, true);
> +    index = tcg_out_tlb_read(s, opc, addrlo, addrhi, get_mmuidx(oi), true);
>   
>       /* Load a pointer into the current opcode w/conditional branch-link. */
>       label_ptr = s->code_ptr;
> @@ -2319,80 +2310,71 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
>   
>       rbase = TCG_REG_R3;
>   #else  /* !CONFIG_SOFTMMU */
> -    a_bits = get_alignment_bits(opc);
> +    unsigned a_bits = get_alignment_bits(opc);
>       if (a_bits) {
>           tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
>       }
>       rbase = guest_base ? TCG_GUEST_BASE_REG : 0;
>       if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
>           tcg_out_ext32u(s, TCG_REG_TMP1, addrlo);
> -        addrlo = TCG_REG_TMP1;
> +        index = TCG_REG_TMP1;
> +    } else {
> +        index = addrlo;
>       }
>   #endif
>   
>       if (TCG_TARGET_REG_BITS == 32 && s_bits == MO_64) {
>           if (opc & MO_BSWAP) {
> -            tcg_out32(s, ADDI | TAI(TCG_REG_R0, addrlo, 4));
> -            tcg_out32(s, LWBRX | TAB(datalo, rbase, addrlo));
> +            tcg_out32(s, ADDI | TAI(TCG_REG_R0, index, 4));
> +            tcg_out32(s, LWBRX | TAB(datalo, rbase, index));
>               tcg_out32(s, LWBRX | TAB(datahi, rbase, TCG_REG_R0));
>           } else if (rbase != 0) {
> -            tcg_out32(s, ADDI | TAI(TCG_REG_R0, addrlo, 4));
> -            tcg_out32(s, LWZX | TAB(datahi, rbase, addrlo));
> +            tcg_out32(s, ADDI | TAI(TCG_REG_R0, index, 4));
> +            tcg_out32(s, LWZX | TAB(datahi, rbase, index));
>               tcg_out32(s, LWZX | TAB(datalo, rbase, TCG_REG_R0));
> -        } else if (addrlo == datahi) {
> -            tcg_out32(s, LWZ | TAI(datalo, addrlo, 4));
> -            tcg_out32(s, LWZ | TAI(datahi, addrlo, 0));
> +        } else if (index == datahi) {
> +            tcg_out32(s, LWZ | TAI(datalo, index, 4));
> +            tcg_out32(s, LWZ | TAI(datahi, index, 0));
>           } else {
> -            tcg_out32(s, LWZ | TAI(datahi, addrlo, 0));
> -            tcg_out32(s, LWZ | TAI(datalo, addrlo, 4));
> +            tcg_out32(s, LWZ | TAI(datahi, index, 0));
> +            tcg_out32(s, LWZ | TAI(datalo, index, 4));
>           }
>       } else {
>           uint32_t insn = qemu_ldx_opc[opc & (MO_BSWAP | MO_SSIZE)];
>           if (!have_isa_2_06 && insn == LDBRX) {
> -            tcg_out32(s, ADDI | TAI(TCG_REG_R0, addrlo, 4));
> -            tcg_out32(s, LWBRX | TAB(datalo, rbase, addrlo));
> +            tcg_out32(s, ADDI | TAI(TCG_REG_R0, index, 4));
> +            tcg_out32(s, LWBRX | TAB(datalo, rbase, index));
>               tcg_out32(s, LWBRX | TAB(TCG_REG_R0, rbase, TCG_REG_R0));
>               tcg_out_rld(s, RLDIMI, datalo, TCG_REG_R0, 32, 0);
>           } else if (insn) {
> -            tcg_out32(s, insn | TAB(datalo, rbase, addrlo));
> +            tcg_out32(s, insn | TAB(datalo, rbase, index));
>           } else {
>               insn = qemu_ldx_opc[opc & (MO_SIZE | MO_BSWAP)];
> -            tcg_out32(s, insn | TAB(datalo, rbase, addrlo));
> +            tcg_out32(s, insn | TAB(datalo, rbase, index));
>               tcg_out_movext(s, TCG_TYPE_REG, datalo,
>                              TCG_TYPE_REG, opc & MO_SSIZE, datalo);
>           }
>       }
>   
>   #ifdef CONFIG_SOFTMMU
> -    add_qemu_ldst_label(s, true, oi, datalo, datahi, addrlo, addrhi,
> -                        s->code_ptr, label_ptr);
> +    add_qemu_ldst_label(s, true, data_type, oi, datalo, datahi,
> +                        addrlo, addrhi, s->code_ptr, label_ptr);
>   #endif
>   }
>   
> -static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
> +static void tcg_out_qemu_st(TCGContext *s,
> +                            const TCGReg datalo, const TCGReg datahi,
> +                            const TCGReg addrlo, const TCGReg addrhi,
> +                            const MemOpIdx oi, TCGType data_type)
>   {
> -    TCGReg datalo, datahi, addrlo, rbase;
> -    TCGReg addrhi __attribute__((unused));
> -    MemOpIdx oi;
> -    MemOp opc, s_bits;
> +    MemOp opc = get_memop(oi);
> +    MemOp s_bits = opc & MO_SIZE;
> +    TCGReg rbase, index;
> +
>   #ifdef CONFIG_SOFTMMU
> -    int mem_index;
>       tcg_insn_unit *label_ptr;
> -#else
> -    unsigned a_bits;
> -#endif
>   
> -    datalo = *args++;
> -    datahi = (TCG_TARGET_REG_BITS == 32 && is_64 ? *args++ : 0);
> -    addrlo = *args++;
> -    addrhi = (TCG_TARGET_REG_BITS < TARGET_LONG_BITS ? *args++ : 0);
> -    oi = *args++;
> -    opc = get_memop(oi);
> -    s_bits = opc & MO_SIZE;
> -
> -#ifdef CONFIG_SOFTMMU
> -    mem_index = get_mmuidx(oi);
> -    addrlo = tcg_out_tlb_read(s, opc, addrlo, addrhi, mem_index, false);
> +    index = tcg_out_tlb_read(s, opc, addrlo, addrhi, get_mmuidx(oi), false);
>   
>       /* Load a pointer into the current opcode w/conditional branch-link. */
>       label_ptr = s->code_ptr;
> @@ -2400,45 +2382,47 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
>   
>       rbase = TCG_REG_R3;
>   #else  /* !CONFIG_SOFTMMU */
> -    a_bits = get_alignment_bits(opc);
> +    unsigned a_bits = get_alignment_bits(opc);
>       if (a_bits) {
>           tcg_out_test_alignment(s, false, addrlo, addrhi, a_bits);
>       }
>       rbase = guest_base ? TCG_GUEST_BASE_REG : 0;
>       if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
>           tcg_out_ext32u(s, TCG_REG_TMP1, addrlo);
> -        addrlo = TCG_REG_TMP1;
> +        index = TCG_REG_TMP1;
> +    } else {
> +        index = addrlo;
>       }
>   #endif
>   
>       if (TCG_TARGET_REG_BITS == 32 && s_bits == MO_64) {
>           if (opc & MO_BSWAP) {
> -            tcg_out32(s, ADDI | TAI(TCG_REG_R0, addrlo, 4));
> -            tcg_out32(s, STWBRX | SAB(datalo, rbase, addrlo));
> +            tcg_out32(s, ADDI | TAI(TCG_REG_R0, index, 4));
> +            tcg_out32(s, STWBRX | SAB(datalo, rbase, index));
>               tcg_out32(s, STWBRX | SAB(datahi, rbase, TCG_REG_R0));
>           } else if (rbase != 0) {
> -            tcg_out32(s, ADDI | TAI(TCG_REG_R0, addrlo, 4));
> -            tcg_out32(s, STWX | SAB(datahi, rbase, addrlo));
> +            tcg_out32(s, ADDI | TAI(TCG_REG_R0, index, 4));
> +            tcg_out32(s, STWX | SAB(datahi, rbase, index));
>               tcg_out32(s, STWX | SAB(datalo, rbase, TCG_REG_R0));
>           } else {
> -            tcg_out32(s, STW | TAI(datahi, addrlo, 0));
> -            tcg_out32(s, STW | TAI(datalo, addrlo, 4));
> +            tcg_out32(s, STW | TAI(datahi, index, 0));
> +            tcg_out32(s, STW | TAI(datalo, index, 4));
>           }
>       } else {
>           uint32_t insn = qemu_stx_opc[opc & (MO_BSWAP | MO_SIZE)];
>           if (!have_isa_2_06 && insn == STDBRX) {
> -            tcg_out32(s, STWBRX | SAB(datalo, rbase, addrlo));
> -            tcg_out32(s, ADDI | TAI(TCG_REG_TMP1, addrlo, 4));
> +            tcg_out32(s, STWBRX | SAB(datalo, rbase, index));
> +            tcg_out32(s, ADDI | TAI(TCG_REG_TMP1, index, 4));
>               tcg_out_shri64(s, TCG_REG_R0, datalo, 32);
>               tcg_out32(s, STWBRX | SAB(TCG_REG_R0, rbase, TCG_REG_TMP1));
>           } else {
> -            tcg_out32(s, insn | SAB(datalo, rbase, addrlo));
> +            tcg_out32(s, insn | SAB(datalo, rbase, index));
>           }
>       }
>   
>   #ifdef CONFIG_SOFTMMU
> -    add_qemu_ldst_label(s, false, oi, datalo, datahi, addrlo, addrhi,
> -                        s->code_ptr, label_ptr);
> +    add_qemu_ldst_label(s, false, data_type, oi, datalo, datahi,
> +                        addrlo, addrhi, s->code_ptr, label_ptr);
>   #endif
>   }
>   
> @@ -2972,16 +2956,46 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
>           break;
>   
>       case INDEX_op_qemu_ld_i32:
> -        tcg_out_qemu_ld(s, args, false);
> +        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
> +            tcg_out_qemu_ld(s, args[0], -1, args[1], -1,
> +                            args[2], TCG_TYPE_I32);
> +        } else {
> +            tcg_out_qemu_ld(s, args[0], -1, args[1], args[2],
> +                            args[3], TCG_TYPE_I32);
> +        }
>           break;
>       case INDEX_op_qemu_ld_i64:
> -        tcg_out_qemu_ld(s, args, true);
> +        if (TCG_TARGET_REG_BITS == 64) {
> +            tcg_out_qemu_ld(s, args[0], -1, args[1], -1,
> +                            args[2], TCG_TYPE_I64);
> +        } else if (TARGET_LONG_BITS == 32) {
> +            tcg_out_qemu_ld(s, args[0], args[1], args[2], -1,
> +                            args[3], TCG_TYPE_I64);
> +        } else {
> +            tcg_out_qemu_ld(s, args[0], args[1], args[2], args[3],
> +                            args[4], TCG_TYPE_I64);
> +        }
>           break;
>       case INDEX_op_qemu_st_i32:
> -        tcg_out_qemu_st(s, args, false);
> +        if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
> +            tcg_out_qemu_st(s, args[0], -1, args[1], -1,
> +                            args[2], TCG_TYPE_I32);
> +        } else {
> +            tcg_out_qemu_st(s, args[0], -1, args[1], args[2],
> +                            args[3], TCG_TYPE_I32);
> +        }
>           break;
>       case INDEX_op_qemu_st_i64:
> -        tcg_out_qemu_st(s, args, true);
> +        if (TCG_TARGET_REG_BITS == 64) {
> +            tcg_out_qemu_st(s, args[0], -1, args[1], -1,
> +                            args[2], TCG_TYPE_I64);
> +        } else if (TARGET_LONG_BITS == 32) {
> +            tcg_out_qemu_st(s, args[0], args[1], args[2], -1,
> +                            args[3], TCG_TYPE_I64);
> +        } else {
> +            tcg_out_qemu_st(s, args[0], args[1], args[2], args[3],
> +                            args[4], TCG_TYPE_I64);
> +        }
>           break;
>   
>       case INDEX_op_setcond_i32:

