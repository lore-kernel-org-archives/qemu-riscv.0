Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67598C7EE22
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 13:09:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwjYt-0006pS-AO; Wed, 10 May 2023 09:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwjYo-0006nu-GA
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:08:50 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pwjYj-0001Si-Vk
 for qemu-riscv@nongnu.org; Wed, 10 May 2023 09:08:50 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-30626f4d74aso4666526f8f.0
 for <qemu-riscv@nongnu.org>; Wed, 10 May 2023 06:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683724123; x=1686316123;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ADkSSLve9v1bMBkpkFISv8yx6Aw4VV0zQyEamj+h8c=;
 b=xPHC9X8ZftQ4tmq8a8tSK6SA/3lTrvuQB8dGDiSkdGiYlBipaxjQGfnPBmf4aJtVYK
 gZRf7hw0E/nsxmOwLN2q0jfkI0YBXZ1skY3oOEOJPy9gz5MA3iBj3vMT3Gwhkb0fwH02
 KoN3unJPj8Q50zTUzi92m0hbfc0ONIN2RZZRE6ol7jvvyL2oz7K01Zqbzr14WmudIW9q
 jMEs6zt4U1inQ3DrCLlN4z1nChpdkywMOsnohLQh7fwFw62gGN+kZKvIlGZJuXNnLm/U
 B9izmyFy0PmUSf19B0WCnRpwuW5MBUQnwpQo57tRgbRup8hl2xzxWy02U4m6gKllV4cc
 dfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683724123; x=1686316123;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6ADkSSLve9v1bMBkpkFISv8yx6Aw4VV0zQyEamj+h8c=;
 b=CMJ20qmV9ZIFmAWBXResv/xmIg9IH52AlDQ7jBIjXMRNhc3b77uoExg/UrfVKdb38w
 8SuPk/imqCDxUh/9jYa9+fYB0cFbqdbQ8Sdv8TnGk65H//8dfLgR97AMtxTRxnSjWvTL
 MRoMUHargh3qUPm251nhofnZvMo/BKVGqKP5g/AJcuHruslGOYpt2TX5ahZv2exq7NZ5
 PKCoD4wiVhhkYz7Oq4kAD3HfOes2aXu5qhQouw+rV906Lt7KCLvOQXn7YqQzQriHIOqd
 YB2EgTpJ40Kamea415VuZCpS+5yBasoqCHStQPYiM3dtQNhY320SjX/Bhnfu0zAEjYIZ
 cH2w==
X-Gm-Message-State: AC+VfDzlhFcCbiP5BE0HJ4Vsq7PkeF0n8z1TmeOWzn0DYXfBJC5atLjU
 I3csglPKtuXPhYb6OjMCBLyO+w==
X-Google-Smtp-Source: ACHHUZ6704qqYS7GD18xUWqXy7E3krUKSrGAIsXtJEsvhT/EaDee9n5pQ9mfFydWX31f9tukxIfUcQ==
X-Received: by 2002:adf:f30b:0:b0:2cd:bc79:5432 with SMTP id
 i11-20020adff30b000000b002cdbc795432mr13463258wro.25.1683724123304; 
 Wed, 10 May 2023 06:08:43 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c6-20020adfef46000000b003047dc162f7sm17225207wrp.67.2023.05.10.06.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 06:08:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 75E9F1FFBB;
 Wed, 10 May 2023 14:08:42 +0100 (BST)
References: <20230506072235.597467-1-richard.henderson@linaro.org>
 <20230506072235.597467-11-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v5 10/30] tcg: Add routines for calling slow-path helpers
Date: Wed, 10 May 2023 13:27:28 +0100
In-reply-to: <20230506072235.597467-11-richard.henderson@linaro.org>
Message-ID: <87jzxg8hb9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> Add tcg_out_ld_helper_args, tcg_out_ld_helper_ret,
> and tcg_out_st_helper_args.  These and their subroutines
> use the existing knowledge of the host function call abi
> to load the function call arguments and return results.
>
> These will be used to simplify the backends in turn.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c | 456 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 453 insertions(+), 3 deletions(-)
>
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 057423c121..748be8426a 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -181,6 +181,22 @@ static bool tcg_target_const_match(int64_t val, TCGT=
ype type, int ct);
>  static int tcg_out_ldst_finalize(TCGContext *s);
>  #endif
>=20=20
> +typedef struct TCGLdstHelperParam {
> +    TCGReg (*ra_gen)(TCGContext *s, const TCGLabelQemuLdst *l, int arg_r=
eg);
> +    unsigned ntmp;
> +    int tmp[3];
> +} TCGLdstHelperParam;
> +
> +static void tcg_out_ld_helper_args(TCGContext *s, const TCGLabelQemuLdst=
 *l,
> +                                   const TCGLdstHelperParam *p)
> +    __attribute__((unused));
> +static void tcg_out_ld_helper_ret(TCGContext *s, const TCGLabelQemuLdst =
*l,
> +                                  bool load_sign, const TCGLdstHelperPar=
am *p)
> +    __attribute__((unused));
> +static void tcg_out_st_helper_args(TCGContext *s, const TCGLabelQemuLdst=
 *l,
> +                                   const TCGLdstHelperParam *p)
> +    __attribute__((unused));
> +
>  TCGContext tcg_init_ctx;
>  __thread TCGContext *tcg_ctx;
>=20=20
> @@ -459,9 +475,8 @@ static void tcg_out_movext1(TCGContext *s, const TCGM=
ovExtend *i)
>   * between the sources and destinations.
>   */
>=20=20
> -static void __attribute__((unused))
> -tcg_out_movext2(TCGContext *s, const TCGMovExtend *i1,
> -                const TCGMovExtend *i2, int scratch)
> +static void tcg_out_movext2(TCGContext *s, const TCGMovExtend *i1,
> +                            const TCGMovExtend *i2, int scratch)
>  {
>      TCGReg src1 =3D i1->src;
>      TCGReg src2 =3D i2->src;
> @@ -715,6 +730,50 @@ static TCGHelperInfo all_helpers[] =3D {
>  };
>  static GHashTable *helper_table;
>=20=20
> +#if TCG_TARGET_REG_BITS =3D=3D 32
> +# define dh_typecode_ttl  dh_typecode_i32
> +#else
> +# define dh_typecode_ttl  dh_typecode_i64
> +#endif
> +

Might be worth a small comment to mention this is doing manually what
the HELPER wrappers do although we don't use them for reasons.

> +static TCGHelperInfo info_helper_ld32_mmu =3D {
> +    .flags =3D TCG_CALL_NO_WG,
> +    .typemask =3D dh_typemask(ttl, 0)  /* return tcg_target_ulong */
> +              | dh_typemask(env, 1)
> +              | dh_typemask(tl, 2)   /* target_ulong addr */
> +              | dh_typemask(i32, 3)  /* unsigned oi */
> +              | dh_typemask(ptr, 4)  /* uintptr_t ra */
> +};
> +
> +static TCGHelperInfo info_helper_ld64_mmu =3D {
> +    .flags =3D TCG_CALL_NO_WG,
> +    .typemask =3D dh_typemask(i64, 0)  /* return uint64_t */
> +              | dh_typemask(env, 1)
> +              | dh_typemask(tl, 2)   /* target_ulong addr */
> +              | dh_typemask(i32, 3)  /* unsigned oi */
> +              | dh_typemask(ptr, 4)  /* uintptr_t ra */
> +};
> +
> +static TCGHelperInfo info_helper_st32_mmu =3D {
> +    .flags =3D TCG_CALL_NO_WG,
> +    .typemask =3D dh_typemask(void, 0)
> +              | dh_typemask(env, 1)
> +              | dh_typemask(tl, 2)   /* target_ulong addr */
> +              | dh_typemask(i32, 3)  /* uint32_t data */
> +              | dh_typemask(i32, 4)  /* unsigned oi */
> +              | dh_typemask(ptr, 5)  /* uintptr_t ra */
> +};
> +
> +static TCGHelperInfo info_helper_st64_mmu =3D {
> +    .flags =3D TCG_CALL_NO_WG,
> +    .typemask =3D dh_typemask(void, 0)
> +              | dh_typemask(env, 1)
> +              | dh_typemask(tl, 2)   /* target_ulong addr */
> +              | dh_typemask(i64, 3)  /* uint64_t data */
> +              | dh_typemask(i32, 4)  /* unsigned oi */
> +              | dh_typemask(ptr, 5)  /* uintptr_t ra */
> +};
> +
>  #ifdef CONFIG_TCG_INTERPRETER
>  static ffi_type *typecode_to_ffi(int argmask)
>  {
> @@ -1126,6 +1185,11 @@ static void tcg_context_init(unsigned max_cpus)
>                              (gpointer)&all_helpers[i]);
>      }
>=20=20
> +    init_call_layout(&info_helper_ld32_mmu);
> +    init_call_layout(&info_helper_ld64_mmu);
> +    init_call_layout(&info_helper_st32_mmu);
> +    init_call_layout(&info_helper_st64_mmu);
> +
>  #ifdef CONFIG_TCG_INTERPRETER
>      init_ffi_layouts();
>  #endif
> @@ -5011,6 +5075,392 @@ static void tcg_reg_alloc_call(TCGContext *s, TCG=
Op *op)
>      }
>  }
>=20=20
> +/*
> + * Similarly for qemu_ld/st slow path helpers.
> + * We must re-implement tcg_gen_callN and tcg_reg_alloc_call simultaneou=
sly,
> + * using only the provided backend tcg_out_* functions.
> + */
> +
> +static int tcg_out_helper_stk_ofs(TCGType type, unsigned slot)
> +{
> +    int ofs =3D arg_slot_stk_ofs(slot);
> +
> +    /*
> +     * Each stack slot is TCG_TARGET_LONG_BITS.  If the host does not
> +     * require extension to uint64_t, adjust the address for uint32_t.
> +     */
> +    if (HOST_BIG_ENDIAN &&
> +        TCG_TARGET_REG_BITS =3D=3D 64 &&
> +        type =3D=3D TCG_TYPE_I32) {
> +        ofs +=3D 4;
> +    }
> +    return ofs;
> +}
> +
> +static void tcg_out_helper_load_regs(TCGContext *s,
> +                                     unsigned nmov, TCGMovExtend *mov,
> +                                     unsigned ntmp, const int *tmp)
> +{
> +    switch (nmov) {
> +    default:
> +        /* The backend must have provided enough temps for the worst cas=
e. */
> +        tcg_debug_assert(ntmp + 1 >=3D nmov);
> +
> +        for (unsigned i =3D nmov - 1; i >=3D 2; --i) {
> +            TCGReg dst =3D mov[i].dst;
> +
> +            for (unsigned j =3D 0; j < i; ++j) {
> +                if (dst =3D=3D mov[j].src) {
> +                    /*
> +                     * Conflict.
> +                     * Copy the source to a temporary, recurse for the
> +                     * remaining moves, perform the extension from our
> +                     * scratch on the way out.
> +                     */
> +                    TCGReg scratch =3D tmp[--ntmp];
> +                    tcg_out_mov(s, mov[i].src_type, scratch, mov[i].src);
> +                    mov[i].src =3D scratch;
> +
> +                    tcg_out_helper_load_regs(s, i, mov, ntmp, tmp);
> +                    tcg_out_movext1(s, &mov[i]);
> +                    return;
> +                }
> +            }
> +
> +            /* No conflicts: perform this move and continue. */
> +            tcg_out_movext1(s, &mov[i]);
> +        }
> +        /* fall through for the final two moves */
> +
> +    case 2:
> +        tcg_out_movext2(s, mov, mov + 1, ntmp ? tmp[0] : -1);
> +        return;
> +    case 1:
> +        tcg_out_movext1(s, mov);
> +        return;
> +    case 0:
> +        g_assert_not_reached();
> +    }
> +}
> +
> +static void tcg_out_helper_load_slots(TCGContext *s,
> +                                      unsigned nmov, TCGMovExtend *mov,
> +                                      const TCGLdstHelperParam *parm)

I think a documentation patch before this for TCGMoveExtend describing
the reg/slot duality for dst might be worthwhile.

> +{
> +    unsigned i;
> +
> +    /*
> +     * Start from the end, storing to the stack first.
> +     * This frees those registers, so we need not consider overlap.
> +     */
> +    for (i =3D nmov; i-- > 0; ) {
> +        unsigned slot =3D mov[i].dst;
> +
> +        if (arg_slot_reg_p(slot)) {
> +            goto found_reg;
> +        }
> +
> +        TCGReg src =3D mov[i].src;
> +        TCGType dst_type =3D mov[i].dst_type;
> +        MemOp dst_mo =3D dst_type =3D=3D TCG_TYPE_I32 ? MO_32 : MO_64;
> +
> +        /* The argument is going onto the stack; extend into scratch. */
> +        if ((mov[i].src_ext & MO_SIZE) !=3D dst_mo) {
> +            tcg_debug_assert(parm->ntmp !=3D 0);
> +            mov[i].dst =3D src =3D parm->tmp[0];
> +            tcg_out_movext1(s, &mov[i]);
> +        }
> +
> +        tcg_out_st(s, dst_type, src, TCG_REG_CALL_STACK,
> +                   tcg_out_helper_stk_ofs(dst_type, slot));
> +    }
> +    return;
> +
> + found_reg:
> +    /*
> +     * The remaining arguments are in registers.
> +     * Convert slot numbers to argument registers.
> +     */
> +    nmov =3D i + 1;
> +    for (i =3D 0; i < nmov; ++i) {
> +        mov[i].dst =3D tcg_target_call_iarg_regs[mov[i].dst];
> +    }
> +    tcg_out_helper_load_regs(s, nmov, mov, parm->ntmp, parm->tmp);
> +}
> +
> +static void tcg_out_helper_load_imm(TCGContext *s, unsigned slot,
> +                                    TCGType type, tcg_target_long imm,
> +                                    const TCGLdstHelperParam *parm)
> +{
> +    if (arg_slot_reg_p(slot)) {
> +        tcg_out_movi(s, type, tcg_target_call_iarg_regs[slot], imm);
> +    } else {
> +        int ofs =3D tcg_out_helper_stk_ofs(type, slot);
> +        if (!tcg_out_sti(s, type, imm, TCG_REG_CALL_STACK, ofs)) {
> +            tcg_debug_assert(parm->ntmp !=3D 0);
> +            tcg_out_movi(s, type, parm->tmp[0], imm);
> +            tcg_out_st(s, type, parm->tmp[0], TCG_REG_CALL_STACK, ofs);
> +        }
> +    }
> +}
> +
> +static void tcg_out_helper_load_common_args(TCGContext *s,
> +                                            const TCGLabelQemuLdst *ldst,
> +                                            const TCGLdstHelperParam *pa=
rm,
> +                                            const TCGHelperInfo *info,
> +                                            unsigned next_arg)
> +{
> +    TCGMovExtend ptr_mov =3D {
> +        .dst_type =3D TCG_TYPE_PTR,
> +        .src_type =3D TCG_TYPE_PTR,
> +        .src_ext =3D sizeof(void *) =3D=3D 4 ? MO_32 : MO_64
> +    };
> +    const TCGCallArgumentLoc *loc =3D &info->in[0];
> +    TCGType type;
> +    unsigned slot;
> +    tcg_target_ulong imm;
> +
> +    /*
> +     * Handle env, which is always first.
> +     */
> +    ptr_mov.dst =3D loc->arg_slot;
> +    ptr_mov.src =3D TCG_AREG0;
> +    tcg_out_helper_load_slots(s, 1, &ptr_mov, parm);
> +
> +    /*
> +     * Handle oi.
> +     */
> +    imm =3D ldst->oi;
> +    loc =3D &info->in[next_arg];
> +    type =3D TCG_TYPE_I32;
> +    switch (loc->kind) {
> +    case TCG_CALL_ARG_NORMAL:
> +        break;
> +    case TCG_CALL_ARG_EXTEND_U:
> +    case TCG_CALL_ARG_EXTEND_S:
> +        /* No extension required for MemOpIdx. */
> +        tcg_debug_assert(imm <=3D INT32_MAX);
> +        type =3D TCG_TYPE_REG;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    tcg_out_helper_load_imm(s, loc->arg_slot, type, imm, parm);
> +    next_arg++;
> +
> +    /*
> +     * Handle ra.
> +     */
> +    loc =3D &info->in[next_arg];
> +    slot =3D loc->arg_slot;
> +    if (parm->ra_gen) {
> +        int arg_reg =3D -1;
> +        TCGReg ra_reg;
> +
> +        if (arg_slot_reg_p(slot)) {
> +            arg_reg =3D tcg_target_call_iarg_regs[slot];
> +        }
> +        ra_reg =3D parm->ra_gen(s, ldst, arg_reg);
> +
> +        ptr_mov.dst =3D slot;
> +        ptr_mov.src =3D ra_reg;
> +        tcg_out_helper_load_slots(s, 1, &ptr_mov, parm);
> +    } else {
> +        imm =3D (uintptr_t)ldst->raddr;
> +        tcg_out_helper_load_imm(s, slot, TCG_TYPE_PTR, imm, parm);
> +    }
> +}
> +
> +static unsigned tcg_out_helper_add_mov(TCGMovExtend *mov,
> +                                       const TCGCallArgumentLoc *loc,
> +                                       TCGType dst_type, TCGType src_typ=
e,
> +                                       TCGReg lo, TCGReg hi)
> +{
> +    if (dst_type <=3D TCG_TYPE_REG) {
> +        MemOp src_ext;
> +
> +        switch (loc->kind) {
> +        case TCG_CALL_ARG_NORMAL:
> +            src_ext =3D src_type =3D=3D TCG_TYPE_I32 ? MO_32 : MO_64;
> +            break;
> +        case TCG_CALL_ARG_EXTEND_U:
> +            dst_type =3D TCG_TYPE_REG;
> +            src_ext =3D MO_UL;
> +            break;
> +        case TCG_CALL_ARG_EXTEND_S:
> +            dst_type =3D TCG_TYPE_REG;
> +            src_ext =3D MO_SL;
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
> +
> +        mov[0].dst =3D loc->arg_slot;
> +        mov[0].dst_type =3D dst_type;
> +        mov[0].src =3D lo;
> +        mov[0].src_type =3D src_type;
> +        mov[0].src_ext =3D src_ext;
> +        return 1;
> +    }
> +
> +    assert(TCG_TARGET_REG_BITS =3D=3D 32);
> +
> +    mov[0].dst =3D loc[HOST_BIG_ENDIAN].arg_slot;
> +    mov[0].src =3D lo;
> +    mov[0].dst_type =3D TCG_TYPE_I32;
> +    mov[0].src_type =3D TCG_TYPE_I32;
> +    mov[0].src_ext =3D MO_32;
> +
> +    mov[1].dst =3D loc[!HOST_BIG_ENDIAN].arg_slot;
> +    mov[1].src =3D hi;
> +    mov[1].dst_type =3D TCG_TYPE_I32;
> +    mov[1].src_type =3D TCG_TYPE_I32;
> +    mov[1].src_ext =3D MO_32;
> +
> +    return 2;
> +}
> +
> +static void tcg_out_ld_helper_args(TCGContext *s, const TCGLabelQemuLdst=
 *ldst,
> +                                   const TCGLdstHelperParam *parm)
> +{
> +    const TCGHelperInfo *info;
> +    const TCGCallArgumentLoc *loc;
> +    TCGMovExtend mov[2];
> +    unsigned next_arg, nmov;
> +    MemOp mop =3D get_memop(ldst->oi);
> +
> +    switch (mop & MO_SIZE) {
> +    case MO_8:
> +    case MO_16:
> +    case MO_32:
> +        info =3D &info_helper_ld32_mmu;
> +        break;
> +    case MO_64:
> +        info =3D &info_helper_ld64_mmu;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    /* Defer env argument. */
> +    next_arg =3D 1;

This could be assigned on creation but maybe even just open code:

 loc =3D &info->in[1]
 ..
 tcg_out_helper_load_common_args(s, ldst, parm, info, 1 + nmov);

although I concede that matching up with the store helper makes sense.=20
=20
> +
> +    loc =3D &info->in[next_arg];
> +    nmov =3D tcg_out_helper_add_mov(mov, loc, TCG_TYPE_TL, TCG_TYPE_TL,
> +                                  ldst->addrlo_reg, ldst->addrhi_reg);
> +    next_arg +=3D nmov;
> +
> +    tcg_out_helper_load_slots(s, nmov, mov, parm);
> +
> +    /* No special attention for 32 and 64-bit return values. */
> +    tcg_debug_assert(info->out_kind =3D=3D TCG_CALL_RET_NORMAL);
> +
> +    tcg_out_helper_load_common_args(s, ldst, parm, info, next_arg);
> +}
> +
> +static void tcg_out_ld_helper_ret(TCGContext *s, const TCGLabelQemuLdst =
*ldst,
> +                                  bool load_sign,
> +                                  const TCGLdstHelperParam *parm)
> +{
> +    TCGMovExtend mov[2];
> +
> +    if (ldst->type <=3D TCG_TYPE_REG) {
> +        MemOp mop =3D get_memop(ldst->oi);
> +
> +        mov[0].dst =3D ldst->datalo_reg;
> +        mov[0].src =3D tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL, 0);
> +        mov[0].dst_type =3D ldst->type;
> +        mov[0].src_type =3D TCG_TYPE_REG;
> +
> +        /*
> +         * If load_sign, then we allowed the helper to perform the
> +         * appropriate sign extension to tcg_target_ulong, and all
> +         * we need now is a plain move.
> +         *
> +         * If they do not, then we expect the relevant extension
> +         * instruction to be no more expensive than a move, and
> +         * we thus save the icache etc by only using one of two
> +         * helper functions.
> +         */
> +        if (load_sign || !(mop & MO_SIGN)) {
> +            if (TCG_TARGET_REG_BITS =3D=3D 32 || ldst->type =3D=3D TCG_T=
YPE_I32) {
> +                mov[0].src_ext =3D MO_32;
> +            } else {
> +                mov[0].src_ext =3D MO_64;
> +            }
> +        } else {
> +            mov[0].src_ext =3D mop & MO_SSIZE;
> +        }
> +        tcg_out_movext1(s, mov);
> +    } else {
> +        assert(TCG_TARGET_REG_BITS =3D=3D 32);
> +
> +        mov[0].dst =3D ldst->datalo_reg;
> +        mov[0].src =3D
> +            tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL, HOST_BIG_ENDIA=
N);
> +        mov[0].dst_type =3D TCG_TYPE_I32;
> +        mov[0].src_type =3D TCG_TYPE_I32;
> +        mov[0].src_ext =3D MO_32;
> +
> +        mov[1].dst =3D ldst->datahi_reg;
> +        mov[1].src =3D
> +            tcg_target_call_oarg_reg(TCG_CALL_RET_NORMAL, !HOST_BIG_ENDI=
AN);
> +        mov[1].dst_type =3D TCG_TYPE_REG;
> +        mov[1].src_type =3D TCG_TYPE_REG;
> +        mov[1].src_ext =3D MO_32;
> +
> +        tcg_out_movext2(s, mov, mov + 1, parm->ntmp ? parm->tmp[0] : -1);
> +    }
> +}
> +
> +static void tcg_out_st_helper_args(TCGContext *s, const TCGLabelQemuLdst=
 *ldst,
> +                                   const TCGLdstHelperParam *parm)
> +{
> +    const TCGHelperInfo *info;
> +    const TCGCallArgumentLoc *loc;
> +    TCGMovExtend mov[4];
> +    TCGType data_type;
> +    unsigned next_arg, nmov, n;
> +    MemOp mop =3D get_memop(ldst->oi);
> +
> +    switch (mop & MO_SIZE) {
> +    case MO_8:
> +    case MO_16:
> +    case MO_32:
> +        info =3D &info_helper_st32_mmu;
> +        data_type =3D TCG_TYPE_I32;
> +        break;
> +    case MO_64:
> +        info =3D &info_helper_st64_mmu;
> +        data_type =3D TCG_TYPE_I64;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    /* Defer env argument. */
> +    next_arg =3D 1;
> +    nmov =3D 0;
> +
> +    /* Handle addr argument. */
> +    loc =3D &info->in[next_arg];
> +    n =3D tcg_out_helper_add_mov(mov, loc, TCG_TYPE_TL, TCG_TYPE_TL,
> +                               ldst->addrlo_reg, ldst->addrhi_reg);
> +    next_arg +=3D n;
> +    nmov +=3D n;
> +
> +    /* Handle data argument. */
> +    loc =3D &info->in[next_arg];
> +    n =3D tcg_out_helper_add_mov(mov + nmov, loc, data_type, ldst->type,
> +                               ldst->datalo_reg, ldst->datahi_reg);
> +    next_arg +=3D n;
> +    nmov +=3D n;
> +    tcg_debug_assert(nmov <=3D ARRAY_SIZE(mov));
> +
> +    tcg_out_helper_load_slots(s, nmov, mov, parm);
> +    tcg_out_helper_load_common_args(s, ldst, parm, info, next_arg);
> +}
> +
>  #ifdef CONFIG_PROFILER
>=20=20
>  /* avoid copy/paste errors */

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

