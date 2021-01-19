Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1wOQ-0007Ta-Q7
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 14:10:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1wOO-0007SB-L6; Tue, 19 Jan 2021 14:10:16 -0500
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:42685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1wOJ-0006Mx-S0; Tue, 19 Jan 2021 14:10:16 -0500
Received: by mail-io1-xd2d.google.com with SMTP id z22so15187767ioh.9;
 Tue, 19 Jan 2021 11:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=g05ukjHYRSx+2/xCptYazmd7LWGVro7TCDA+FTefW5Y=;
 b=RQ0zto7OWyVoQj+hIRz4+RjUbrYe0zA/RbpZmdlNq1SUxMAGhpXWYINKF2/YbuQN6K
 kVu2hUm8g1oyGz1p/ismUY2gC6frmZlHAGbxspw3uPaOUIZw386gOnDBEP9908xnRNVd
 Wbs42T79dW/ew4e7ImNsyx5X/S757LAIClWtuioueaU8ETuNGXUNIzGlypA61BAZPpC8
 6lTXGGaPAHMQSDg0agW3BQ6W3E9twksnkie/GyZTz7bM5+wl34eTRSy1yafu8OVcNVg7
 P0eivop3a9zZZcgN09bnYQxYQlW9fa/Icez1/gL25mvycF0jR2deVqFeyovJFkkmTl8U
 inEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g05ukjHYRSx+2/xCptYazmd7LWGVro7TCDA+FTefW5Y=;
 b=IsyMaA5N0yVUtr6X1wWBM+YuU/lav29R8OW6LDWCEHJnfk1f8tozxAZuC9ke1Ryfny
 Nfxh5GaCKeaFRheBj+HFg3YytZKaV8DAJqrgnNZDM28ypxhyTYWaMYmoAgW5JXY8hzFA
 TgxwnF60grs1WceIRn2e+p0/LVgS0LC0vVGlc8pFASOyqWbMW34+wGX9i2lEglPqq9wK
 mzsbUIlBC9R8Zy5DdJ6zb5/rgdGINxMqqxcGC0zS1tSguKStyfs3a6acR22FfMhCtWry
 WpgWMgdqsD0BRfxU32SFoLT+h/Gm1sYbMZuIie1s8t2BWGLFsRjXhi7TYgg8V8Nlhlm+
 8kCA==
X-Gm-Message-State: AOAM532kGqlbyTB6i404jSQigiIwk4t+l6EvCVqOCAZlBbM+Pj+xLpfV
 50IEcRFr3ToFIqVNOILE6+l6/+nsY2USQF7leGA=
X-Google-Smtp-Source: ABdhPJwbinODnB3XTcv9IqARSn4deRTLtRXDkX9I1jCN5FQNqT04v8oIjlXIWMU687nYXK07gOsCzc4q0XLvYuoOkno=
X-Received: by 2002:a92:8455:: with SMTP id l82mr4705641ild.40.1611083410207; 
 Tue, 19 Jan 2021 11:10:10 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-20-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-20-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jan 2021 11:09:44 -0800
Message-ID: <CAKmqyKMs7R1gp3gAP0P_0Ua2Wg=ZCnTYpK8FaG76omX7YfUtOw@mail.gmail.com>
Subject: Re: [PATCH v6 19/72] target/riscv: rvv-1.0: index load and store
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
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2d.google.com
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
X-List-Received-Date: Tue, 19 Jan 2021 19:10:17 -0000

On Tue, Jan 12, 2021 at 1:54 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   |  67 ++++----
>  target/riscv/insn32.decode              |  21 ++-
>  target/riscv/insn_trans/trans_rvv.c.inc | 209 ++++++++++++++++--------
>  target/riscv/vector_helper.c            |  89 +++++-----
>  4 files changed, 222 insertions(+), 164 deletions(-)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index ab865f4919f..98c0c6e29b6 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -103,41 +103,38 @@ DEF_HELPER_6(vsse8_v, void, ptr, ptr, tl, tl, env, =
i32)
>  DEF_HELPER_6(vsse16_v, void, ptr, ptr, tl, tl, env, i32)
>  DEF_HELPER_6(vsse32_v, void, ptr, ptr, tl, tl, env, i32)
>  DEF_HELPER_6(vsse64_v, void, ptr, ptr, tl, tl, env, i32)
> -DEF_HELPER_6(vlxb_v_b, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vlxb_v_h, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vlxb_v_w, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vlxb_v_d, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vlxh_v_h, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vlxh_v_w, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vlxh_v_d, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vlxw_v_w, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vlxw_v_d, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vlxe_v_b, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vlxe_v_h, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vlxe_v_w, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vlxe_v_d, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vlxbu_v_b, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vlxbu_v_h, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vlxbu_v_w, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vlxbu_v_d, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vlxhu_v_h, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vlxhu_v_w, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vlxhu_v_d, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vlxwu_v_w, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vlxwu_v_d, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vsxb_v_b, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vsxb_v_h, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vsxb_v_w, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vsxb_v_d, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vsxh_v_h, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vsxh_v_w, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vsxh_v_d, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vsxw_v_w, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vsxw_v_d, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vsxe_v_b, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vsxe_v_h, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vsxe_v_w, void, ptr, ptr, tl, ptr, env, i32)
> -DEF_HELPER_6(vsxe_v_d, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxei8_8_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxei8_16_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxei8_32_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxei8_64_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxei16_8_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxei16_16_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxei16_32_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxei16_64_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxei32_8_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxei32_16_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxei32_32_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxei32_64_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxei64_8_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxei64_16_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxei64_32_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vlxei64_64_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxei8_8_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxei8_16_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxei8_32_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxei8_64_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxei16_8_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxei16_16_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxei16_32_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxei16_64_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxei32_8_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxei32_16_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxei32_32_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxei32_64_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxei64_8_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxei64_16_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxei64_32_v, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vsxei64_64_v, void, ptr, ptr, tl, ptr, env, i32)
>  DEF_HELPER_5(vlbff_v_b, void, ptr, ptr, tl, env, i32)
>  DEF_HELPER_5(vlbff_v_h, void, ptr, ptr, tl, env, i32)
>  DEF_HELPER_5(vlbff_v_w, void, ptr, ptr, tl, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 63811c0bd19..c0058c6c756 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -268,18 +268,17 @@ vlbuff_v   ... 000 . 10000 ..... 000 ..... 0000111 =
@r2_nfvm
>  vlhuff_v   ... 000 . 10000 ..... 101 ..... 0000111 @r2_nfvm
>  vlwuff_v   ... 000 . 10000 ..... 110 ..... 0000111 @r2_nfvm
>
> -vlxb_v     ... 111 . ..... ..... 000 ..... 0000111 @r_nfvm
> -vlxh_v     ... 111 . ..... ..... 101 ..... 0000111 @r_nfvm
> -vlxw_v     ... 111 . ..... ..... 110 ..... 0000111 @r_nfvm
> -vlxe_v     ... 011 . ..... ..... 111 ..... 0000111 @r_nfvm
> -vlxbu_v    ... 011 . ..... ..... 000 ..... 0000111 @r_nfvm
> -vlxhu_v    ... 011 . ..... ..... 101 ..... 0000111 @r_nfvm
> -vlxwu_v    ... 011 . ..... ..... 110 ..... 0000111 @r_nfvm
> +# Vector ordered-indexed and unordered-indexed load insns.
> +vlxei8_v      ... 0-1 . ..... ..... 000 ..... 0000111 @r_nfvm
> +vlxei16_v     ... 0-1 . ..... ..... 101 ..... 0000111 @r_nfvm
> +vlxei32_v     ... 0-1 . ..... ..... 110 ..... 0000111 @r_nfvm
> +vlxei64_v     ... 0-1 . ..... ..... 111 ..... 0000111 @r_nfvm
> +
>  # Vector ordered-indexed and unordered-indexed store insns.
> -vsxb_v     ... -11 . ..... ..... 000 ..... 0100111 @r_nfvm
> -vsxh_v     ... -11 . ..... ..... 101 ..... 0100111 @r_nfvm
> -vsxw_v     ... -11 . ..... ..... 110 ..... 0100111 @r_nfvm
> -vsxe_v     ... -11 . ..... ..... 111 ..... 0100111 @r_nfvm
> +vsxei8_v      ... 0-1 . ..... ..... 000 ..... 0100111 @r_nfvm
> +vsxei16_v     ... 0-1 . ..... ..... 101 ..... 0100111 @r_nfvm
> +vsxei32_v     ... 0-1 . ..... ..... 110 ..... 0100111 @r_nfvm
> +vsxei64_v     ... 0-1 . ..... ..... 111 ..... 0100111 @r_nfvm
>
>  #*** Vector AMO operations are encoded under the standard AMO major opco=
de ***
>  vamoswapw_v     00001 . . ..... ..... 110 ..... 0101111 @r_wdvm
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
> index ec65ee65adb..320d710695f 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -126,12 +126,6 @@ static bool require_noover(const int8_t dst, const i=
nt8_t dst_lmul,
>      return !is_overlapped(dst, dst_size, src, src_size);
>  }
>
> -static bool require_noover_seg(const int8_t dst, const int8_t nf,
> -                               const int8_t src)
> -{
> -    return !is_overlapped(dst, nf, src, 1);
> -}
> -
>  static bool do_vsetvl(DisasContext *ctx, int rd, int rs1, TCGv s2)
>  {
>      TCGv s1, dst;
> @@ -224,9 +218,76 @@ static bool vext_check_load(DisasContext *s, int vd,=
 int nf, int vm,
>      return vext_check_store(s, vd, nf, eew) && require_vm(vm, vd);
>  }
>
> -static bool vext_check_isa_ill(DisasContext *s)
> +/*
> + * Vector indexed, indexed segment store check function.
> + *
> + * Rules to be checked here:
> + *   1. EMUL must within the range: 1/8 <=3D EMUL <=3D 8. (Section 7.3)
> + *   2. Index vector register number is multiples of EMUL.
> + *      (Section 3.3.2, 7.3)
> + *   3. Destination vector register number is multiples of LMUL.
> + *      (Section 3.3.2, 7.3)
> + *   4. The EMUL setting must be such that EMUL * NFIELDS =E2=89=A4 8. (=
Section 7.8)
> + *   5. Vector register numbers accessed by the segment load or store
> + *      cannot increment past 31. (Section 7.8)
> + */
> +static bool vext_check_st_index(DisasContext *s, int vd, int vs2, int nf=
,
> +                                uint8_t eew)
>  {
> -    return !s->vill;
> +    int8_t emul =3D eew - s->sew + s->lmul;
> +    return (emul >=3D -3 && emul <=3D 3) &&
> +            require_align(vs2, emul) &&
> +            require_align(vd, s->lmul) &&
> +            require_nf(vd, nf, s->lmul);
> +}
> +
> +/*
> + * Vector indexed, indexed segment load check function.
> + *
> + * Rules to be checked here:
> + *   1. All rules applies to store instructions are applies
> + *      to load instructions.
> + *   2. Destination vector register group for a masked vector
> + *      instruction cannot overlap the source mask register (v0).
> + *      (Section 5.3)
> + *   3. Destination vector register cannot overlap a source vector
> + *      register (vs2) group.
> + *      (Section 5.2)
> + *   4. Destination vector register groups cannot overlap
> + *      the source vector register (vs2) group for
> + *      indexed segment load instructions. (Section 7.8.3)
> + */
> +static bool vext_check_ld_index(DisasContext *s, int vd, int vs2,
> +                                int nf, int vm, uint8_t eew)
> +{
> +    int8_t seg_vd;
> +    int8_t emul =3D eew - s->sew + s->lmul;
> +    bool ret =3D vext_check_st_index(s, vd, vs2, nf, eew) &&
> +        require_vm(vm, vd);
> +
> +    /* Each segment register group has to follow overlap rules. */
> +    for (int i =3D 0; i < nf; ++i) {
> +        seg_vd =3D vd + (1 << MAX(s->lmul, 0)) * i;
> +
> +        if (eew > s->sew) {
> +            if (seg_vd !=3D vs2) {
> +                ret &=3D require_noover(seg_vd, s->lmul, vs2, emul);
> +            }
> +        } else if (eew < s->sew) {
> +            ret &=3D require_noover(seg_vd, s->lmul, vs2, emul);
> +        }
> +
> +        /*
> +         * Destination vector register groups cannot overlap
> +         * the source vector register (vs2) group for
> +         * indexed segment load instructions.
> +         */
> +        if (nf > 1) {
> +            ret &=3D !is_overlapped(seg_vd, 1 << MAX(s->lmul, 0),
> +                                  vs2, 1 << MAX(emul, 0));
> +        }
> +    }
> +    return ret;
>  }
>
>  static bool vext_check_ss(DisasContext *s, int vd, int vs, int vm)
> @@ -747,31 +808,38 @@ static bool ldst_index_trans(uint32_t vd, uint32_t =
rs1, uint32_t vs2,
>      return true;
>  }
>
> -static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
> +static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>  {
>      uint32_t data =3D 0;
>      gen_helper_ldst_index *fn;
> -    static gen_helper_ldst_index * const fns[7][4] =3D {
> -        { gen_helper_vlxb_v_b,  gen_helper_vlxb_v_h,
> -          gen_helper_vlxb_v_w,  gen_helper_vlxb_v_d },
> -        { NULL,                 gen_helper_vlxh_v_h,
> -          gen_helper_vlxh_v_w,  gen_helper_vlxh_v_d },
> -        { NULL,                 NULL,
> -          gen_helper_vlxw_v_w,  gen_helper_vlxw_v_d },
> -        { gen_helper_vlxe_v_b,  gen_helper_vlxe_v_h,
> -          gen_helper_vlxe_v_w,  gen_helper_vlxe_v_d },
> -        { gen_helper_vlxbu_v_b, gen_helper_vlxbu_v_h,
> -          gen_helper_vlxbu_v_w, gen_helper_vlxbu_v_d },
> -        { NULL,                 gen_helper_vlxhu_v_h,
> -          gen_helper_vlxhu_v_w, gen_helper_vlxhu_v_d },
> -        { NULL,                 NULL,
> -          gen_helper_vlxwu_v_w, gen_helper_vlxwu_v_d },
> +    static gen_helper_ldst_index * const fns[4][4] =3D {
> +        /*
> +         * offset vector register group EEW =3D 8,
> +         * data vector register group EEW =3D SEW
> +         */
> +        { gen_helper_vlxei8_8_v,  gen_helper_vlxei8_16_v,
> +          gen_helper_vlxei8_32_v, gen_helper_vlxei8_64_v },
> +        /*
> +         * offset vector register group EEW =3D 16,
> +         * data vector register group EEW =3D SEW
> +         */
> +        { gen_helper_vlxei16_8_v, gen_helper_vlxei16_16_v,
> +          gen_helper_vlxei16_32_v, gen_helper_vlxei16_64_v },
> +        /*
> +         * offset vector register group EEW =3D 32,
> +         * data vector register group EEW =3D SEW
> +         */
> +        { gen_helper_vlxei32_8_v, gen_helper_vlxei32_16_v,
> +          gen_helper_vlxei32_32_v, gen_helper_vlxei32_64_v },
> +        /*
> +         * offset vector register group EEW =3D 64,
> +         * data vector register group EEW =3D SEW
> +         */
> +        { gen_helper_vlxei64_8_v, gen_helper_vlxei64_16_v,
> +          gen_helper_vlxei64_32_v, gen_helper_vlxei64_64_v }
>      };
>
> -    fn =3D  fns[seq][s->sew];
> -    if (fn =3D=3D NULL) {
> -        return false;
> -    }
> +    fn =3D fns[eew][s->sew];
>
>      data =3D FIELD_DP32(data, VDATA, VM, a->vm);
>      data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
> @@ -779,50 +847,50 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm =
*a, uint8_t seq)
>      return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
>  }
>
> -/*
> - * For vector indexed segment loads, the destination vector register
> - * groups cannot overlap the source vector register group (specified by
> - * `vs2`), else an illegal instruction exception is raised.
> - */
> -static bool ld_index_check(DisasContext *s, arg_rnfvm* a)
> +static bool ld_index_check(DisasContext *s, arg_rnfvm* a, uint8_t eew)
>  {
> -    return (vext_check_isa_ill(s) &&
> -            vext_check_overlap_mask(s, a->rd, a->vm, false) &&
> -            vext_check_reg(s, a->rd, false) &&
> -            vext_check_reg(s, a->rs2, false) &&
> -            vext_check_nf(s, a->nf) &&
> -            ((a->nf =3D=3D 1) ||
> -             vext_check_overlap_group(a->rd, a->nf << s->lmul,
> -                                      a->rs2, 1 << s->lmul)));
> +    return require_rvv(s) &&
> +           vext_check_isa_ill(s) &&
> +           vext_check_ld_index(s, a->rd, a->rs2, a->nf, a->vm, eew);
>  }
>
> -GEN_VEXT_TRANS(vlxb_v, 0, rnfvm, ld_index_op, ld_index_check)
> -GEN_VEXT_TRANS(vlxh_v, 1, rnfvm, ld_index_op, ld_index_check)
> -GEN_VEXT_TRANS(vlxw_v, 2, rnfvm, ld_index_op, ld_index_check)
> -GEN_VEXT_TRANS(vlxe_v, 3, rnfvm, ld_index_op, ld_index_check)
> -GEN_VEXT_TRANS(vlxbu_v, 4, rnfvm, ld_index_op, ld_index_check)
> -GEN_VEXT_TRANS(vlxhu_v, 5, rnfvm, ld_index_op, ld_index_check)
> -GEN_VEXT_TRANS(vlxwu_v, 6, rnfvm, ld_index_op, ld_index_check)
> +GEN_VEXT_TRANS(vlxei8_v,  MO_8,  rnfvm, ld_index_op, ld_index_check)
> +GEN_VEXT_TRANS(vlxei16_v, MO_16, rnfvm, ld_index_op, ld_index_check)
> +GEN_VEXT_TRANS(vlxei32_v, MO_32, rnfvm, ld_index_op, ld_index_check)
> +GEN_VEXT_TRANS(vlxei64_v, MO_64, rnfvm, ld_index_op, ld_index_check)
>
> -static bool st_index_op(DisasContext *s, arg_rnfvm *a, uint8_t seq)
> +static bool st_index_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>  {
>      uint32_t data =3D 0;
>      gen_helper_ldst_index *fn;
>      static gen_helper_ldst_index * const fns[4][4] =3D {
> -        { gen_helper_vsxb_v_b,  gen_helper_vsxb_v_h,
> -          gen_helper_vsxb_v_w,  gen_helper_vsxb_v_d },
> -        { NULL,                 gen_helper_vsxh_v_h,
> -          gen_helper_vsxh_v_w,  gen_helper_vsxh_v_d },
> -        { NULL,                 NULL,
> -          gen_helper_vsxw_v_w,  gen_helper_vsxw_v_d },
> -        { gen_helper_vsxe_v_b,  gen_helper_vsxe_v_h,
> -          gen_helper_vsxe_v_w,  gen_helper_vsxe_v_d }
> +        /*
> +         * offset vector register group EEW =3D 8,
> +         * data vector register group EEW =3D SEW
> +         */
> +        { gen_helper_vsxei8_8_v,  gen_helper_vsxei8_16_v,
> +          gen_helper_vsxei8_32_v, gen_helper_vsxei8_64_v },
> +        /*
> +         * offset vector register group EEW =3D 16,
> +         * data vector register group EEW =3D SEW
> +         */
> +        { gen_helper_vsxei16_8_v, gen_helper_vsxei16_16_v,
> +          gen_helper_vsxei16_32_v, gen_helper_vsxei16_64_v },
> +        /*
> +         * offset vector register group EEW =3D 32,
> +         * data vector register group EEW =3D SEW
> +         */
> +        { gen_helper_vsxei32_8_v, gen_helper_vsxei32_16_v,
> +          gen_helper_vsxei32_32_v, gen_helper_vsxei32_64_v },
> +        /*
> +         * offset vector register group EEW =3D 64,
> +         * data vector register group EEW =3D SEW
> +         */
> +        { gen_helper_vsxei64_8_v, gen_helper_vsxei64_16_v,
> +          gen_helper_vsxei64_32_v, gen_helper_vsxei64_64_v }
>      };
>
> -    fn =3D  fns[seq][s->sew];
> -    if (fn =3D=3D NULL) {
> -        return false;
> -    }
> +    fn =3D fns[eew][s->sew];
>
>      data =3D FIELD_DP32(data, VDATA, VM, a->vm);
>      data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
> @@ -830,18 +898,17 @@ static bool st_index_op(DisasContext *s, arg_rnfvm =
*a, uint8_t seq)
>      return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
>  }
>
> -static bool st_index_check(DisasContext *s, arg_rnfvm* a)
> +static bool st_index_check(DisasContext *s, arg_rnfvm* a, uint8_t eew)
>  {
> -    return (vext_check_isa_ill(s) &&
> -            vext_check_reg(s, a->rd, false) &&
> -            vext_check_reg(s, a->rs2, false) &&
> -            vext_check_nf(s, a->nf));
> +    return require_rvv(s) &&
> +           vext_check_isa_ill(s) &&
> +           vext_check_st_index(s, a->rd, a->rs2, a->nf, eew);
>  }
>
> -GEN_VEXT_TRANS(vsxb_v, 0, rnfvm, st_index_op, st_index_check)
> -GEN_VEXT_TRANS(vsxh_v, 1, rnfvm, st_index_op, st_index_check)
> -GEN_VEXT_TRANS(vsxw_v, 2, rnfvm, st_index_op, st_index_check)
> -GEN_VEXT_TRANS(vsxe_v, 3, rnfvm, st_index_op, st_index_check)
> +GEN_VEXT_TRANS(vsxei8_v,  MO_8,  rnfvm, st_index_op, st_index_check)
> +GEN_VEXT_TRANS(vsxei16_v, MO_16, rnfvm, st_index_op, st_index_check)
> +GEN_VEXT_TRANS(vsxei32_v, MO_32, rnfvm, st_index_op, st_index_check)
> +GEN_VEXT_TRANS(vsxei64_v, MO_64, rnfvm, st_index_op, st_index_check)
>
>  /*
>   *** unit stride fault-only-first load
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 7ce6d0fb50f..368259f75a0 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -371,8 +371,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base=
,
>                  void *vs2, CPURISCVState *env, uint32_t desc,
>                  vext_get_index_addr get_index_addr,
>                  vext_ldst_elem_fn *ldst_elem,
> -                uint32_t esz, uint32_t msz, uintptr_t ra,
> -                MMUAccessType access_type)
> +                uint32_t esz, uintptr_t ra, MMUAccessType access_type)
>  {
>      uint32_t i, k;
>      uint32_t nf =3D vext_nf(desc);
> @@ -384,7 +383,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base=
,
>          if (!vm && !vext_elem_mask(v0, i)) {
>              continue;
>          }
> -        probe_pages(env, get_index_addr(base, i, vs2), nf * msz, ra,
> +        probe_pages(env, get_index_addr(base, i, vs2), nf * esz, ra,
>                      access_type);
>      }
>      /* load bytes from guest memory */
> @@ -394,67 +393,63 @@ vext_ldst_index(void *vd, void *v0, target_ulong ba=
se,
>              continue;
>          }
>          while (k < nf) {
> -            abi_ptr addr =3D get_index_addr(base, i, vs2) + k * msz;
> +            abi_ptr addr =3D get_index_addr(base, i, vs2) + k * esz;
>              ldst_elem(env, addr, i + k * vlmax, vd, ra);
>              k++;
>          }
>      }
>  }
>
> -#define GEN_VEXT_LD_INDEX(NAME, MTYPE, ETYPE, INDEX_FN, LOAD_FN)        =
   \
> +#define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)               =
   \
>  void HELPER(NAME)(void *vd, void *v0, target_ulong base,                =
   \
>                    void *vs2, CPURISCVState *env, uint32_t desc)         =
   \
>  {                                                                       =
   \
>      vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,             =
   \
> -                    LOAD_FN, sizeof(ETYPE), sizeof(MTYPE),              =
   \
> -                    GETPC(), MMU_DATA_LOAD);                            =
   \
> -}
> -
> -GEN_VEXT_LD_INDEX(vlxb_v_b,  int8_t,   int8_t,   idx_b, ldb_b)
> -GEN_VEXT_LD_INDEX(vlxb_v_h,  int8_t,   int16_t,  idx_h, ldb_h)
> -GEN_VEXT_LD_INDEX(vlxb_v_w,  int8_t,   int32_t,  idx_w, ldb_w)
> -GEN_VEXT_LD_INDEX(vlxb_v_d,  int8_t,   int64_t,  idx_d, ldb_d)
> -GEN_VEXT_LD_INDEX(vlxh_v_h,  int16_t,  int16_t,  idx_h, ldh_h)
> -GEN_VEXT_LD_INDEX(vlxh_v_w,  int16_t,  int32_t,  idx_w, ldh_w)
> -GEN_VEXT_LD_INDEX(vlxh_v_d,  int16_t,  int64_t,  idx_d, ldh_d)
> -GEN_VEXT_LD_INDEX(vlxw_v_w,  int32_t,  int32_t,  idx_w, ldw_w)
> -GEN_VEXT_LD_INDEX(vlxw_v_d,  int32_t,  int64_t,  idx_d, ldw_d)
> -GEN_VEXT_LD_INDEX(vlxe_v_b,  int8_t,   int8_t,   idx_b, lde_b)
> -GEN_VEXT_LD_INDEX(vlxe_v_h,  int16_t,  int16_t,  idx_h, lde_h)
> -GEN_VEXT_LD_INDEX(vlxe_v_w,  int32_t,  int32_t,  idx_w, lde_w)
> -GEN_VEXT_LD_INDEX(vlxe_v_d,  int64_t,  int64_t,  idx_d, lde_d)
> -GEN_VEXT_LD_INDEX(vlxbu_v_b, uint8_t,  uint8_t,  idx_b, ldbu_b)
> -GEN_VEXT_LD_INDEX(vlxbu_v_h, uint8_t,  uint16_t, idx_h, ldbu_h)
> -GEN_VEXT_LD_INDEX(vlxbu_v_w, uint8_t,  uint32_t, idx_w, ldbu_w)
> -GEN_VEXT_LD_INDEX(vlxbu_v_d, uint8_t,  uint64_t, idx_d, ldbu_d)
> -GEN_VEXT_LD_INDEX(vlxhu_v_h, uint16_t, uint16_t, idx_h, ldhu_h)
> -GEN_VEXT_LD_INDEX(vlxhu_v_w, uint16_t, uint32_t, idx_w, ldhu_w)
> -GEN_VEXT_LD_INDEX(vlxhu_v_d, uint16_t, uint64_t, idx_d, ldhu_d)
> -GEN_VEXT_LD_INDEX(vlxwu_v_w, uint32_t, uint32_t, idx_w, ldwu_w)
> -GEN_VEXT_LD_INDEX(vlxwu_v_d, uint32_t, uint64_t, idx_d, ldwu_d)
> -
> -#define GEN_VEXT_ST_INDEX(NAME, MTYPE, ETYPE, INDEX_FN, STORE_FN)\
> +                    LOAD_FN, sizeof(ETYPE), GETPC(), MMU_DATA_LOAD);    =
   \
> +}
> +
> +GEN_VEXT_LD_INDEX(vlxei8_8_v,   int8_t,  idx_b, lde_b)
> +GEN_VEXT_LD_INDEX(vlxei8_16_v,  int16_t, idx_b, lde_h)
> +GEN_VEXT_LD_INDEX(vlxei8_32_v,  int32_t, idx_b, lde_w)
> +GEN_VEXT_LD_INDEX(vlxei8_64_v,  int64_t, idx_b, lde_d)
> +GEN_VEXT_LD_INDEX(vlxei16_8_v,  int8_t,  idx_h, lde_b)
> +GEN_VEXT_LD_INDEX(vlxei16_16_v, int16_t, idx_h, lde_h)
> +GEN_VEXT_LD_INDEX(vlxei16_32_v, int32_t, idx_h, lde_w)
> +GEN_VEXT_LD_INDEX(vlxei16_64_v, int64_t, idx_h, lde_d)
> +GEN_VEXT_LD_INDEX(vlxei32_8_v,  int8_t,  idx_w, lde_b)
> +GEN_VEXT_LD_INDEX(vlxei32_16_v, int16_t, idx_w, lde_h)
> +GEN_VEXT_LD_INDEX(vlxei32_32_v, int32_t, idx_w, lde_w)
> +GEN_VEXT_LD_INDEX(vlxei32_64_v, int64_t, idx_w, lde_d)
> +GEN_VEXT_LD_INDEX(vlxei64_8_v,  int8_t,  idx_d, lde_b)
> +GEN_VEXT_LD_INDEX(vlxei64_16_v, int16_t, idx_d, lde_h)
> +GEN_VEXT_LD_INDEX(vlxei64_32_v, int32_t, idx_d, lde_w)
> +GEN_VEXT_LD_INDEX(vlxei64_64_v, int64_t, idx_d, lde_d)
> +
> +#define GEN_VEXT_ST_INDEX(NAME, ETYPE, INDEX_FN, STORE_FN)       \
>  void HELPER(NAME)(void *vd, void *v0, target_ulong base,         \
>                    void *vs2, CPURISCVState *env, uint32_t desc)  \
>  {                                                                \
>      vext_ldst_index(vd, v0, base, vs2, env, desc, INDEX_FN,      \
> -                    STORE_FN, sizeof(ETYPE), sizeof(MTYPE),      \
> +                    STORE_FN, sizeof(ETYPE),                     \
>                      GETPC(), MMU_DATA_STORE);                    \
>  }
>
> -GEN_VEXT_ST_INDEX(vsxb_v_b, int8_t,  int8_t,  idx_b, stb_b)
> -GEN_VEXT_ST_INDEX(vsxb_v_h, int8_t,  int16_t, idx_h, stb_h)
> -GEN_VEXT_ST_INDEX(vsxb_v_w, int8_t,  int32_t, idx_w, stb_w)
> -GEN_VEXT_ST_INDEX(vsxb_v_d, int8_t,  int64_t, idx_d, stb_d)
> -GEN_VEXT_ST_INDEX(vsxh_v_h, int16_t, int16_t, idx_h, sth_h)
> -GEN_VEXT_ST_INDEX(vsxh_v_w, int16_t, int32_t, idx_w, sth_w)
> -GEN_VEXT_ST_INDEX(vsxh_v_d, int16_t, int64_t, idx_d, sth_d)
> -GEN_VEXT_ST_INDEX(vsxw_v_w, int32_t, int32_t, idx_w, stw_w)
> -GEN_VEXT_ST_INDEX(vsxw_v_d, int32_t, int64_t, idx_d, stw_d)
> -GEN_VEXT_ST_INDEX(vsxe_v_b, int8_t,  int8_t,  idx_b, ste_b)
> -GEN_VEXT_ST_INDEX(vsxe_v_h, int16_t, int16_t, idx_h, ste_h)
> -GEN_VEXT_ST_INDEX(vsxe_v_w, int32_t, int32_t, idx_w, ste_w)
> -GEN_VEXT_ST_INDEX(vsxe_v_d, int64_t, int64_t, idx_d, ste_d)
> +GEN_VEXT_ST_INDEX(vsxei8_8_v,   int8_t,  idx_b, ste_b)
> +GEN_VEXT_ST_INDEX(vsxei8_16_v,  int16_t, idx_b, ste_h)
> +GEN_VEXT_ST_INDEX(vsxei8_32_v,  int32_t, idx_b, ste_w)
> +GEN_VEXT_ST_INDEX(vsxei8_64_v,  int64_t, idx_b, ste_d)
> +GEN_VEXT_ST_INDEX(vsxei16_8_v,  int8_t,  idx_h, ste_b)
> +GEN_VEXT_ST_INDEX(vsxei16_16_v, int16_t, idx_h, ste_h)
> +GEN_VEXT_ST_INDEX(vsxei16_32_v, int32_t, idx_h, ste_w)
> +GEN_VEXT_ST_INDEX(vsxei16_64_v, int64_t, idx_h, ste_d)
> +GEN_VEXT_ST_INDEX(vsxei32_8_v,  int8_t,  idx_w, ste_b)
> +GEN_VEXT_ST_INDEX(vsxei32_16_v, int16_t, idx_w, ste_h)
> +GEN_VEXT_ST_INDEX(vsxei32_32_v, int32_t, idx_w, ste_w)
> +GEN_VEXT_ST_INDEX(vsxei32_64_v, int64_t, idx_w, ste_d)
> +GEN_VEXT_ST_INDEX(vsxei64_8_v,  int8_t,  idx_d, ste_b)
> +GEN_VEXT_ST_INDEX(vsxei64_16_v, int16_t, idx_d, ste_h)
> +GEN_VEXT_ST_INDEX(vsxei64_32_v, int32_t, idx_d, ste_w)
> +GEN_VEXT_ST_INDEX(vsxei64_64_v, int64_t, idx_d, ste_d)
>
>  /*
>   *** unit-stride fault-only-fisrt load instructions
> --
> 2.17.1
>
>

