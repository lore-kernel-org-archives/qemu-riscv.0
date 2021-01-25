Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l4BEK-0006tS-7T
	for mharc-qemu-riscv@gnu.org; Mon, 25 Jan 2021 18:25:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l4BEI-0006tH-W8; Mon, 25 Jan 2021 18:25:07 -0500
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:38822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l4BEG-0000AU-S3; Mon, 25 Jan 2021 18:25:06 -0500
Received: by mail-io1-xd36.google.com with SMTP id e22so30158843iom.5;
 Mon, 25 Jan 2021 15:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jPqnvlDtD9594QCUTTbHmmbHXh0LISKqar2kzJsIYOg=;
 b=Yro+GMiz3+CxX7kLvb9vEloo2el8tqJoI1tAUnZfXvw5JRyzaHRUBcdLQ8XV0FEIwK
 NNEy6ALAcq3FgxYnt4vVN8ri4ZgHIvh/hkkHj5PSQUhevFYOWTNt+caHZvoDxp2XXqWr
 qm1+kd4i008xd0Etv2TwXpkY4hmc4zHjvMmIPQszI7/Hi/aQeG8tKrV4JZNNOSAALFQx
 8GSCR5bJNseOcXgdwjwMWHBEQjl5Ne3I+Ep7FiII1XtjGuQjbCVbML7N4a9EVV+PFslF
 WoyIdqByUbnLSkST4gFFwm1LV7S01hEVvmKNEtYBVzwGNWLFe7cJ3NlFPy/R6hBkpzQw
 Z07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jPqnvlDtD9594QCUTTbHmmbHXh0LISKqar2kzJsIYOg=;
 b=ibcX1VEXzecP6FKaQetMEAHxRc5HXIJQn2oNIEYRpCmboqHfYmeGDben5Md64MakLi
 LJyO42UcTW0t//jv4W87ixjsGRP2D0pK+qo8sbWISLVBOkt71PEqaY/GPbWKrJR0SMi0
 rlJuiHBunogJaYEzj1WyeQRATqc6yG3uloHrTDUGHdlZs5zhKVHDG9z2mXEBHkoahZXw
 xTH7QSetu/7gcF/34IanW6mn2LBPmO0MU2bDtdmP50D+mb9nZrEeAc1XweOWqW2RnHaS
 MGQI7osIGOtLrtbb+bLSx3P5HDF/iYtdV09ZyFJo2AnXTA2+KNt0kQFnRprs7HZWDeDa
 bbwA==
X-Gm-Message-State: AOAM530cUCGyg5h6tkb6qloLlzX+c7D53ejakfoKnQ/TSpASpgWVOf5q
 od30evlCX+rtpfHqCKmYLI3zJDpAuCI5IJDQ5z4=
X-Google-Smtp-Source: ABdhPJyompUKJdoHX3ApNxr+gU9g2P79aIVVfEJ/tuYK70bDZR87b4jrIqkO9guMDHxGGLt6uNQBTeDVtz/+lAMtTM0=
X-Received: by 2002:a5d:9514:: with SMTP id d20mr2205692iom.118.1611617103434; 
 Mon, 25 Jan 2021 15:25:03 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-24-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-24-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Jan 2021 15:24:37 -0800
Message-ID: <CAKmqyKNB5XrhhoGWfkUXp0=qjb6iUmwNwJLgRjJ1A8j84MTOdg@mail.gmail.com>
Subject: Re: [PATCH v6 23/72] target/riscv: rvv-1.0: load/store whole register
 instructions
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 25 Jan 2021 23:25:07 -0000

On Tue, Jan 12, 2021 at 1:59 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Add the following instructions:
>
> * vl<nf>re<eew>.v
> * vs<nf>r.v
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   | 21 ++++++++
>  target/riscv/insn32.decode              | 22 ++++++++
>  target/riscv/insn_trans/trans_rvv.c.inc | 69 +++++++++++++++++++++++++
>  target/riscv/vector_helper.c            | 65 +++++++++++++++++++++++
>  4 files changed, 177 insertions(+)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index b3fa28d4354..5ec364caecc 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -140,6 +140,27 @@ DEF_HELPER_5(vle16ff_v, void, ptr, ptr, tl, env, i32)
>  DEF_HELPER_5(vle32ff_v, void, ptr, ptr, tl, env, i32)
>  DEF_HELPER_5(vle64ff_v, void, ptr, ptr, tl, env, i32)
>
> +DEF_HELPER_4(vl1re8_v, void, ptr, tl, env, i32)
> +DEF_HELPER_4(vl1re16_v, void, ptr, tl, env, i32)
> +DEF_HELPER_4(vl1re32_v, void, ptr, tl, env, i32)
> +DEF_HELPER_4(vl1re64_v, void, ptr, tl, env, i32)
> +DEF_HELPER_4(vl2re8_v, void, ptr, tl, env, i32)
> +DEF_HELPER_4(vl2re16_v, void, ptr, tl, env, i32)
> +DEF_HELPER_4(vl2re32_v, void, ptr, tl, env, i32)
> +DEF_HELPER_4(vl2re64_v, void, ptr, tl, env, i32)
> +DEF_HELPER_4(vl4re8_v, void, ptr, tl, env, i32)
> +DEF_HELPER_4(vl4re16_v, void, ptr, tl, env, i32)
> +DEF_HELPER_4(vl4re32_v, void, ptr, tl, env, i32)
> +DEF_HELPER_4(vl4re64_v, void, ptr, tl, env, i32)
> +DEF_HELPER_4(vl8re8_v, void, ptr, tl, env, i32)
> +DEF_HELPER_4(vl8re16_v, void, ptr, tl, env, i32)
> +DEF_HELPER_4(vl8re32_v, void, ptr, tl, env, i32)
> +DEF_HELPER_4(vl8re64_v, void, ptr, tl, env, i32)
> +DEF_HELPER_4(vs1r_v, void, ptr, tl, env, i32)
> +DEF_HELPER_4(vs2r_v, void, ptr, tl, env, i32)
> +DEF_HELPER_4(vs4r_v, void, ptr, tl, env, i32)
> +DEF_HELPER_4(vs8r_v, void, ptr, tl, env, i32)
> +
>  DEF_HELPER_6(vamoswapei8_32_v, void, ptr, ptr, tl, ptr, env, i32)
>  DEF_HELPER_6(vamoswapei8_64_v, void, ptr, ptr, tl, ptr, env, i32)
>  DEF_HELPER_6(vamoswapei16_32_v, void, ptr, ptr, tl, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 2047f23bd62..e11666f16df 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -278,6 +278,28 @@ vle16ff_v     ... 000 . 10000 ..... 101 ..... 0000111 @r2_nfvm
>  vle32ff_v     ... 000 . 10000 ..... 110 ..... 0000111 @r2_nfvm
>  vle64ff_v     ... 000 . 10000 ..... 111 ..... 0000111 @r2_nfvm
>
> +# Vector whole register insns
> +vl1re8_v      000 000 1 01000 ..... 000 ..... 0000111 @r2
> +vl1re16_v     000 000 1 01000 ..... 101 ..... 0000111 @r2
> +vl1re32_v     000 000 1 01000 ..... 110 ..... 0000111 @r2
> +vl1re64_v     000 000 1 01000 ..... 111 ..... 0000111 @r2
> +vl2re8_v      001 000 1 01000 ..... 000 ..... 0000111 @r2
> +vl2re16_v     001 000 1 01000 ..... 101 ..... 0000111 @r2
> +vl2re32_v     001 000 1 01000 ..... 110 ..... 0000111 @r2
> +vl2re64_v     001 000 1 01000 ..... 111 ..... 0000111 @r2
> +vl4re8_v      011 000 1 01000 ..... 000 ..... 0000111 @r2
> +vl4re16_v     011 000 1 01000 ..... 101 ..... 0000111 @r2
> +vl4re32_v     011 000 1 01000 ..... 110 ..... 0000111 @r2
> +vl4re64_v     011 000 1 01000 ..... 111 ..... 0000111 @r2
> +vl8re8_v      111 000 1 01000 ..... 000 ..... 0000111 @r2
> +vl8re16_v     111 000 1 01000 ..... 101 ..... 0000111 @r2
> +vl8re32_v     111 000 1 01000 ..... 110 ..... 0000111 @r2
> +vl8re64_v     111 000 1 01000 ..... 111 ..... 0000111 @r2
> +vs1r_v        000 000 1 01000 ..... 000 ..... 0100111 @r2
> +vs2r_v        001 000 1 01000 ..... 000 ..... 0100111 @r2
> +vs4r_v        011 000 1 01000 ..... 000 ..... 0100111 @r2
> +vs8r_v        111 000 1 01000 ..... 000 ..... 0100111 @r2
> +
>  #*** Vector AMO operations are encoded under the standard AMO major opcode ***
>  vamoswapei8_v   00001 . . ..... ..... 000 ..... 0101111 @r_wdvm
>  vamoswapei16_v  00001 . . ..... ..... 101 ..... 0101111 @r_wdvm
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 4c93f8a5c8e..2b0e0590efc 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1014,6 +1014,75 @@ GEN_VEXT_TRANS(vle16ff_v, MO_16, r2nfvm, ldff_op, ld_us_check)
>  GEN_VEXT_TRANS(vle32ff_v, MO_32, r2nfvm, ldff_op, ld_us_check)
>  GEN_VEXT_TRANS(vle64ff_v, MO_64, r2nfvm, ldff_op, ld_us_check)
>
> +/*
> + * load and store whole register instructions
> + */
> +typedef void gen_helper_ldst_whole(TCGv_ptr, TCGv, TCGv_env, TCGv_i32);
> +
> +static bool ldst_whole_trans(uint32_t vd, uint32_t rs1, uint32_t nf,
> +                             gen_helper_ldst_whole *fn, DisasContext *s,
> +                             bool is_store)
> +{
> +    TCGv_ptr dest;
> +    TCGv base;
> +    TCGv_i32 desc;
> +
> +    uint32_t data = FIELD_DP32(0, VDATA, NF, nf);
> +    dest = tcg_temp_new_ptr();
> +    base = tcg_temp_new();
> +    desc = tcg_const_i32(simd_desc(0, s->vlen / 8, data));
> +
> +    gen_get_gpr(base, rs1);
> +    tcg_gen_addi_ptr(dest, cpu_env, vreg_ofs(s, vd));
> +
> +    fn(dest, base, cpu_env, desc);
> +
> +    tcg_temp_free_ptr(dest);
> +    tcg_temp_free(base);
> +    tcg_temp_free_i32(desc);
> +    if (!is_store) {
> +        mark_vs_dirty(s);
> +    }
> +    return true;
> +}
> +
> +/*
> + * load and store whole register instructions ignore vtype and vl setting.
> + * Thus, we don't need to check vill bit. (Section 7.9)
> + */
> +#define GEN_LDST_WHOLE_TRANS(NAME, ARG_NF, IS_STORE)                      \
> +static bool trans_##NAME(DisasContext *s, arg_##NAME * a)                 \
> +{                                                                         \
> +    if (require_rvv(s) &&                                                 \
> +        QEMU_IS_ALIGNED(a->rd, ARG_NF)) {                                 \
> +        return ldst_whole_trans(a->rd, a->rs1, ARG_NF, gen_helper_##NAME, \
> +                                s, IS_STORE);                             \
> +    }                                                                     \
> +    return false;                                                         \
> +}
> +
> +GEN_LDST_WHOLE_TRANS(vl1re8_v,  1, false)
> +GEN_LDST_WHOLE_TRANS(vl1re16_v, 1, false)
> +GEN_LDST_WHOLE_TRANS(vl1re32_v, 1, false)
> +GEN_LDST_WHOLE_TRANS(vl1re64_v, 1, false)
> +GEN_LDST_WHOLE_TRANS(vl2re8_v,  2, false)
> +GEN_LDST_WHOLE_TRANS(vl2re16_v, 2, false)
> +GEN_LDST_WHOLE_TRANS(vl2re32_v, 2, false)
> +GEN_LDST_WHOLE_TRANS(vl2re64_v, 2, false)
> +GEN_LDST_WHOLE_TRANS(vl4re8_v,  4, false)
> +GEN_LDST_WHOLE_TRANS(vl4re16_v, 4, false)
> +GEN_LDST_WHOLE_TRANS(vl4re32_v, 4, false)
> +GEN_LDST_WHOLE_TRANS(vl4re64_v, 4, false)
> +GEN_LDST_WHOLE_TRANS(vl8re8_v,  8, false)
> +GEN_LDST_WHOLE_TRANS(vl8re16_v, 8, false)
> +GEN_LDST_WHOLE_TRANS(vl8re32_v, 8, false)
> +GEN_LDST_WHOLE_TRANS(vl8re64_v, 8, false)
> +
> +GEN_LDST_WHOLE_TRANS(vs1r_v, 1, true)
> +GEN_LDST_WHOLE_TRANS(vs2r_v, 2, true)
> +GEN_LDST_WHOLE_TRANS(vs4r_v, 4, true)
> +GEN_LDST_WHOLE_TRANS(vs8r_v, 8, true)
> +
>  /*
>   *** vector atomic operation
>   */
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 743883449a4..57564c5c0c9 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -534,6 +534,71 @@ GEN_VEXT_LDFF(vle16ff_v, int16_t, lde_h)
>  GEN_VEXT_LDFF(vle32ff_v, int32_t, lde_w)
>  GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d)
>
> +/*
> + *** load and store whole register instructions
> + */
> +static void
> +vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
> +                vext_ldst_elem_fn *ldst_elem, uint32_t esz, uintptr_t ra,
> +                MMUAccessType access_type)
> +{
> +    uint32_t i, k;
> +    uint32_t nf = vext_nf(desc);
> +    uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> +    uint32_t max_elems = vlenb >> esz;
> +
> +    /* probe every access */
> +    probe_pages(env, base, vlenb * nf, ra, access_type);
> +
> +    /* load bytes from guest memory */
> +    for (k = 0; k < nf; k++) {
> +        for (i = 0; i < max_elems; i++) {
> +            target_ulong addr = base + ((i + k * max_elems) << esz);
> +            ldst_elem(env, addr, i + k * max_elems, vd, ra);
> +        }
> +    }
> +}
> +
> +#define GEN_VEXT_LD_WHOLE(NAME, ETYPE, LOAD_FN)      \
> +void HELPER(NAME)(void *vd, target_ulong base,       \
> +                  CPURISCVState *env, uint32_t desc) \
> +{                                                    \
> +    vext_ldst_whole(vd, base, env, desc, LOAD_FN,    \
> +                    ctzl(sizeof(ETYPE)), GETPC(),    \
> +                    MMU_DATA_LOAD);                  \
> +}
> +
> +GEN_VEXT_LD_WHOLE(vl1re8_v,  int8_t,  lde_b)
> +GEN_VEXT_LD_WHOLE(vl1re16_v, int16_t, lde_h)
> +GEN_VEXT_LD_WHOLE(vl1re32_v, int32_t, lde_w)
> +GEN_VEXT_LD_WHOLE(vl1re64_v, int64_t, lde_d)
> +GEN_VEXT_LD_WHOLE(vl2re8_v,  int8_t,  lde_b)
> +GEN_VEXT_LD_WHOLE(vl2re16_v, int16_t, lde_h)
> +GEN_VEXT_LD_WHOLE(vl2re32_v, int32_t, lde_w)
> +GEN_VEXT_LD_WHOLE(vl2re64_v, int64_t, lde_d)
> +GEN_VEXT_LD_WHOLE(vl4re8_v,  int8_t,  lde_b)
> +GEN_VEXT_LD_WHOLE(vl4re16_v, int16_t, lde_h)
> +GEN_VEXT_LD_WHOLE(vl4re32_v, int32_t, lde_w)
> +GEN_VEXT_LD_WHOLE(vl4re64_v, int64_t, lde_d)
> +GEN_VEXT_LD_WHOLE(vl8re8_v,  int8_t,  lde_b)
> +GEN_VEXT_LD_WHOLE(vl8re16_v, int16_t, lde_h)
> +GEN_VEXT_LD_WHOLE(vl8re32_v, int32_t, lde_w)
> +GEN_VEXT_LD_WHOLE(vl8re64_v, int64_t, lde_d)
> +
> +#define GEN_VEXT_ST_WHOLE(NAME, ETYPE, STORE_FN)     \
> +void HELPER(NAME)(void *vd, target_ulong base,       \
> +                  CPURISCVState *env, uint32_t desc) \
> +{                                                    \
> +    vext_ldst_whole(vd, base, env, desc, STORE_FN,   \
> +                    ctzl(sizeof(ETYPE)), GETPC(),    \
> +                    MMU_DATA_STORE);                 \
> +}
> +
> +GEN_VEXT_ST_WHOLE(vs1r_v, int8_t, ste_b)
> +GEN_VEXT_ST_WHOLE(vs2r_v, int8_t, ste_b)
> +GEN_VEXT_ST_WHOLE(vs4r_v, int8_t, ste_b)
> +GEN_VEXT_ST_WHOLE(vs8r_v, int8_t, ste_b)
> +
>  /*
>   *** Vector AMO Operations (Zvamo)
>   */
> --
> 2.17.1
>
>

