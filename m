Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMcyy-000789-2a
	for mharc-qemu-riscv@gnu.org; Wed, 17 Mar 2021 16:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMcyv-00077N-Vf; Wed, 17 Mar 2021 16:41:30 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:41898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lMcyt-0006gY-Ma; Wed, 17 Mar 2021 16:41:29 -0400
Received: by mail-io1-xd33.google.com with SMTP id z3so10663ioc.8;
 Wed, 17 Mar 2021 13:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+Bj37TnErGzpLBWZGEGXm7g2g0XZ8h28H1iwlxbZvOE=;
 b=pgevAMs9spp9gu7rxSWW1qQKBRGgwiw8q3D9ptbis72GBkI3kqebKlGGbzBZ5Uc80f
 BzC4LdeWzolsyg0iK6j0STNN6eCw8gWbqE6Xsswl7WSZBV4Nf0wCxJLc8++dc5ECAQSb
 KfHA72CwD149F45+ILXmcAbyPHqzaBC/jXsogIly6zRwcK6CYhNVg9As5sCVWdUFdgGA
 mWV2Y9ZSfpcTdGzrjrmZ2kRrQH6hY4NZQFc2r9RXFjbHy1xAbP/P7yS5EvMbJckZZX49
 9COIdz/KOfxmaAWF7IAkzmTJ+72A5Ik4dxoFlIoX9DXW36FWCoRKs1y5KF44FZb7LUDs
 xxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+Bj37TnErGzpLBWZGEGXm7g2g0XZ8h28H1iwlxbZvOE=;
 b=PKWo94n3glTGzgGkVNyVdXneRP9/+fGUOrE7J3W1GzEZPd9t5zZ+2ykrGjC3uiV38S
 JLBpK2HR/Joa0v1uEbufwKqgaNZ3EYJSxmG/ioWyII2YgczhX3ncIz2FniCngbZb6ohY
 J/Ol1tyjJ1iFDpwX1hiTSJOygeMe/uutV1zqV1hQFK27sScc6wqVQDj42ff4R5KfyzwS
 AVbRTLdnIBt1IIJIACTp5bA/iw1OJ6jvrUP02jbmU63h9FgGo2MU9CgPkSotoGkgPCjz
 BrohT1l78c6AbVAswAQ4acq+VPmINZtMYabQb/K+lg38V502mtvJPB6Ajn86d6sssiLI
 qhcA==
X-Gm-Message-State: AOAM5312Mgrm7VonZ0o/UrDkwJo7zGi6yEO14UjDk2ZIoOtihCpFsOiW
 FRHL85JpomL75U5RicanhvUz+SArM6qeM2PYbhQ=
X-Google-Smtp-Source: ABdhPJySHxyvR4Hqnaki8Gzu0XEd3DGRhNBxlYDP5M75x43sVX0UncjSFwEUlj/7iLnHbMC5A1iGQrrfNnJJxrDCo/s=
X-Received: by 2002:a02:cad9:: with SMTP id f25mr4260469jap.26.1616013685951; 
 Wed, 17 Mar 2021 13:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
 <20210212150256.885-7-zhiwei_liu@c-sky.com>
 <CAKmqyKP+=knMPnOtgQq477_=dwswG3TQ+xBBPULnvLma2HmsdQ@mail.gmail.com>
 <c4d020e2-cb88-869f-a504-22dd2e4eae05@c-sky.com>
 <CAKmqyKPm98gFz9n=hpkHdKcugiqG2ouAjJDtj1r0ON5ZjkQ9sQ@mail.gmail.com>
 <ac171814-cb77-c2e5-fa0c-db3d8251586d@c-sky.com>
In-Reply-To: <ac171814-cb77-c2e5-fa0c-db3d8251586d@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 Mar 2021 16:39:48 -0400
Message-ID: <CAKmqyKOEH0zoM3=26jJWWf=ELcjT_7C+YdB00oDEeRrNfd9Zww@mail.gmail.com>
Subject: Re: [PATCH 06/38] target/riscv: SIMD 16-bit Shift Instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Wed, 17 Mar 2021 20:41:30 -0000

On Tue, Mar 16, 2021 at 10:31 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
>
>
> On 2021/3/17 3:54, Alistair Francis wrote:
> > On Mon, Mar 15, 2021 at 10:40 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
> >>
> >>
> >> On 2021/3/16 5:25, Alistair Francis wrote:
> >>> On Fri, Feb 12, 2021 at 10:16 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
> >>>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> >>>> ---
> >>>>    target/riscv/helper.h                   |   9 ++
> >>>>    target/riscv/insn32.decode              |  17 ++++
> >>>>    target/riscv/insn_trans/trans_rvp.c.inc | 115 ++++++++++++++++++++++++
> >>>>    target/riscv/packed_helper.c            | 104 +++++++++++++++++++++
> >>>>    4 files changed, 245 insertions(+)
> >>>>
> >>>> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> >>>> index a69a6b4e84..20bf400ac2 100644
> >>>> --- a/target/riscv/helper.h
> >>>> +++ b/target/riscv/helper.h
> >>>> @@ -1184,3 +1184,12 @@ DEF_HELPER_3(rsub8, tl, env, tl, tl)
> >>>>    DEF_HELPER_3(ursub8, tl, env, tl, tl)
> >>>>    DEF_HELPER_3(ksub8, tl, env, tl, tl)
> >>>>    DEF_HELPER_3(uksub8, tl, env, tl, tl)
> >>>> +
> >>>> +DEF_HELPER_3(sra16, tl, env, tl, tl)
> >>>> +DEF_HELPER_3(sra16_u, tl, env, tl, tl)
> >>>> +DEF_HELPER_3(srl16, tl, env, tl, tl)
> >>>> +DEF_HELPER_3(srl16_u, tl, env, tl, tl)
> >>>> +DEF_HELPER_3(sll16, tl, env, tl, tl)
> >>>> +DEF_HELPER_3(ksll16, tl, env, tl, tl)
> >>>> +DEF_HELPER_3(kslra16, tl, env, tl, tl)
> >>>> +DEF_HELPER_3(kslra16_u, tl, env, tl, tl)
> >>>> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> >>>> index 358dd1fa10..6f053bfeb7 100644
> >>>> --- a/target/riscv/insn32.decode
> >>>> +++ b/target/riscv/insn32.decode
> >>>> @@ -23,6 +23,7 @@
> >>>>    %rd        7:5
> >>>>
> >>>>    %sh10    20:10
> >>>> +%sh4    20:4
> >>>>    %csr    20:12
> >>>>    %rm     12:3
> >>>>    %nf     29:3                     !function=ex_plus_1
> >>>> @@ -59,6 +60,7 @@
> >>>>    @j       ....................      ..... ....... &j      imm=%imm_j          %rd
> >>>>
> >>>>    @sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh10      %rs1 %rd
> >>>> +@sh4     ......  ...... .....  ... ..... ....... &shift  shamt=%sh4      %rs1 %rd
> >>>>    @csr     ............   .....  ... ..... .......               %csr     %rs1 %rd
> >>>>
> >>>>    @atom_ld ..... aq:1 rl:1 ..... ........ ..... ....... &atomic rs2=0     %rs1 %rd
> >>>> @@ -635,3 +637,18 @@ rsub8      0000101  ..... ..... 000 ..... 1111111 @r
> >>>>    ursub8     0010101  ..... ..... 000 ..... 1111111 @r
> >>>>    ksub8      0001101  ..... ..... 000 ..... 1111111 @r
> >>>>    uksub8     0011101  ..... ..... 000 ..... 1111111 @r
> >>>> +
> >>>> +sra16      0101000  ..... ..... 000 ..... 1111111 @r
> >>>> +sra16_u    0110000  ..... ..... 000 ..... 1111111 @r
> >>>> +srai16     0111000  0.... ..... 000 ..... 1111111 @sh4
> >>>> +srai16_u   0111000  1.... ..... 000 ..... 1111111 @sh4
> >>>> +srl16      0101001  ..... ..... 000 ..... 1111111 @r
> >>>> +srl16_u    0110001  ..... ..... 000 ..... 1111111 @r
> >>>> +srli16     0111001  0.... ..... 000 ..... 1111111 @sh4
> >>>> +srli16_u   0111001  1.... ..... 000 ..... 1111111 @sh4
> >>>> +sll16      0101010  ..... ..... 000 ..... 1111111 @r
> >>>> +slli16     0111010  0.... ..... 000 ..... 1111111 @sh4
> >>>> +ksll16     0110010  ..... ..... 000 ..... 1111111 @r
> >>>> +kslli16    0111010  1.... ..... 000 ..... 1111111 @sh4
> >>>> +kslra16    0101011  ..... ..... 000 ..... 1111111 @r
> >>>> +kslra16_u  0110011  ..... ..... 000 ..... 1111111 @r
> >>>> diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
> >>>> index 109f560ec9..848edab7e5 100644
> >>>> --- a/target/riscv/insn_trans/trans_rvp.c.inc
> >>>> +++ b/target/riscv/insn_trans/trans_rvp.c.inc
> >>>> @@ -238,3 +238,118 @@ GEN_RVP_R_OOL(rsub8);
> >>>>    GEN_RVP_R_OOL(ursub8);
> >>>>    GEN_RVP_R_OOL(ksub8);
> >>>>    GEN_RVP_R_OOL(uksub8);
> >>>> +
> >>>> +/* 16-bit Shift Instructions */
> >>>> +static bool rvp_shift_ool(DisasContext *ctx, arg_r *a,
> >>>> +                          gen_helper_rvp_r *fn, target_ulong mask)
> >>>> +{
> >>>> +    TCGv src1, src2, dst;
> >>>> +
> >>>> +    src1 = tcg_temp_new();
> >>>> +    src2 = tcg_temp_new();
> >>>> +    dst = tcg_temp_new();
> >>>> +
> >>>> +    gen_get_gpr(src1, a->rs1);
> >>>> +    gen_get_gpr(src2, a->rs2);
> >>>> +    tcg_gen_andi_tl(src2, src2, mask);
> >>>> +
> >>>> +    fn(dst, cpu_env, src1, src2);
> >>>> +    gen_set_gpr(a->rd, dst);
> >>>> +
> >>>> +    tcg_temp_free(src1);
> >>>> +    tcg_temp_free(src2);
> >>>> +    tcg_temp_free(dst);
> >>>> +    return true;
> >>>> +}
> >>>> +
> >>>> +typedef void GenGvecShift(unsigned, uint32_t, uint32_t, TCGv_i32,
> >>>> +                          uint32_t, uint32_t);
> >>>> +static inline bool
> >>>> +rvp_shift(DisasContext *ctx, arg_r *a, uint8_t vece,
> >>>> +          GenGvecShift *f64, gen_helper_rvp_r *fn,
> >>>> +          uint8_t mask)
> >>>> +{
> >>>> +    if (!has_ext(ctx, RVP)) {
> >>>> +        return false;
> >>>> +    }
> >>>> +
> >>>> +#ifdef TARGET_RISCV64
> >>> Hmm....
> >>>
> >>> I don't want to add any more #defines on the RISC-V xlen. We are
> >>> trying to make the QEMU RISC-V implementation xlen independent.
> >> I noticed the change, but was not quite clear about the benefit of it.
> >>
> >> Could you give a brief explanation?
> > Yep, there are a few reasons for it.
> >
> > AFAIK every QEMU platform except RISC-V allows the 64-bit binary to
> > run the 32-bit guests. So for example in the ARM QEMU builds I can use
> > qemu-system-aarch64 to run 32-bit ARMv7 guests. This is a step towards
> > allowing us to do the same with RISC-V.
> Get it. By explicitly specifying a 32bit CPU option in command line,
> qemu-system-riscv64
> can run a 32-bit guest application. Is it right?

Yep, that's the idea.

> >
> > It's also a step towards allowing fixed XLEN CPUS to run. For example
> > 4 64-bit application CPUs and a single 32-bit power management CPU can
> > all run together.
> >
> > Also XLEN in RISC-V is configurable. A 64-bit Hypervisor can have
> > 32-bit XLEN guests according to the spec. This is a step towards
> > allowing that as well.
> Really interesting points.
>
> I have not used QEMU in this way. Are these features ready now?

Nope, we are still pretty far away unfortunately, but I don't want to
get even further away.

> >>> Can you use `riscv_cpu_is_32bit(env)` instead, here are everywhere
> >>> else you add a #define TARGET... ?
> >> Sure, I think there are two ways.
> >>
> >> 1) Get env from the current_cpu, then call riscv_cpu_is_32bit(env).
> >>
> >> It's some strange,  because I can't find current_cpu reference from many
> >> archs.
> >>
> >> I don't know whether it has side effects.
> >>
> >> 2)  Add a similar function cpu_is_32bit(DisasContext *ctx).
> > This is probably a better option, but I'm open to either way if you
> > have a strong preference.
> I will add a patch in this way in v2. Thanks a lot.

Thanks!

Alistair

>
> Zhiwei
> >
> > Alistair
> >
> >> In this way, the type of  misa field  in struct DisasContext should be
> >> target_ulong.
> >> Currently, the type of misa filed is uint32_t.
> >>
> >> Do you think which one is better? Thanks very much.
> >>
> >> Zhiwei
> >>> Alistair
> >>>
> >>>> +    if (a->rd && a->rs1 && a->rs2) {
> >>>> +        TCGv_i32 shift = tcg_temp_new_i32();
> >>>> +        tcg_gen_extrl_i64_i32(shift, cpu_gpr[a->rs2]);
> >>>> +        tcg_gen_andi_i32(shift, shift, mask);
> >>>> +        f64(vece, offsetof(CPURISCVState, gpr[a->rd]),
> >>>> +            offsetof(CPURISCVState, gpr[a->rs1]),
> >>>> +            shift, 8, 8);
> >>>> +        tcg_temp_free_i32(shift);
> >>>> +        return true;
> >>>> +    }
> >>>> +#endif
> >>>> +    return rvp_shift_ool(ctx, a, fn, mask);
> >>>> +}
> >>>> +
> >>>> +#define GEN_RVP_SHIFT(NAME, GVEC, VECE)                     \
> >>>> +static bool trans_##NAME(DisasContext *s, arg_r *a)         \
> >>>> +{                                                           \
> >>>> +    return rvp_shift(s, a, VECE, GVEC, gen_helper_##NAME,   \
> >>>> +                     (8 << VECE) - 1);                      \
> >>>> +}
> >>>> +
> >>>> +GEN_RVP_SHIFT(sra16, tcg_gen_gvec_sars, 1);
> >>>> +GEN_RVP_SHIFT(srl16, tcg_gen_gvec_shrs, 1);
> >>>> +GEN_RVP_SHIFT(sll16, tcg_gen_gvec_shls, 1);
> >>>> +GEN_RVP_R_OOL(sra16_u);
> >>>> +GEN_RVP_R_OOL(srl16_u);
> >>>> +GEN_RVP_R_OOL(ksll16);
> >>>> +GEN_RVP_R_OOL(kslra16);
> >>>> +GEN_RVP_R_OOL(kslra16_u);
> >>>> +
> >>>> +static bool rvp_shifti_ool(DisasContext *ctx, arg_shift *a,
> >>>> +                           gen_helper_rvp_r *fn)
> >>>> +{
> >>>> +    TCGv src1, dst, shift;
> >>>> +
> >>>> +    src1 = tcg_temp_new();
> >>>> +    dst = tcg_temp_new();
> >>>> +
> >>>> +    gen_get_gpr(src1, a->rs1);
> >>>> +    shift = tcg_const_tl(a->shamt);
> >>>> +    fn(dst, cpu_env, src1, shift);
> >>>> +    gen_set_gpr(a->rd, dst);
> >>>> +
> >>>> +    tcg_temp_free(src1);
> >>>> +    tcg_temp_free(dst);
> >>>> +    tcg_temp_free(shift);
> >>>> +    return true;
> >>>> +}
> >>>> +
> >>>> +static inline bool
> >>>> +rvp_shifti(DisasContext *ctx, arg_shift *a,
> >>>> +           void (* f64)(TCGv_i64, TCGv_i64, int64_t),
> >>>> +           gen_helper_rvp_r *fn)
> >>>> +{
> >>>> +    if (!has_ext(ctx, RVP)) {
> >>>> +        return false;
> >>>> +    }
> >>>> +
> >>>> +#ifdef TARGET_RISCV64
> >>>> +    if (a->rd && a->rs1 && f64) {
> >>>> +        f64(cpu_gpr[a->rd], cpu_gpr[a->rs1], a->shamt);
> >>>> +        return true;
> >>>> +    }
> >>>> +#endif
> >>>> +    return rvp_shifti_ool(ctx, a, fn);
> >>>> +}
> >>>> +
> >>>> +#define GEN_RVP_SHIFTI(NAME, OP, GVEC)                   \
> >>>> +static bool trans_##NAME(DisasContext *s, arg_shift *a)  \
> >>>> +{                                                        \
> >>>> +    return rvp_shifti(s, a, GVEC, gen_helper_##OP);      \
> >>>> +}
> >>>> +
> >>>> +GEN_RVP_SHIFTI(srai16, sra16, tcg_gen_vec_sar16i_i64);
> >>>> +GEN_RVP_SHIFTI(srli16, srl16, tcg_gen_vec_shr16i_i64);
> >>>> +GEN_RVP_SHIFTI(slli16, sll16, tcg_gen_vec_shl16i_i64);
> >>>> +GEN_RVP_SHIFTI(srai16_u, sra16_u, NULL);
> >>>> +GEN_RVP_SHIFTI(srli16_u, srl16_u, NULL);
> >>>> +GEN_RVP_SHIFTI(kslli16, ksll16, NULL);
> >>>> diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
> >>>> index 62db072204..7e31c2fe46 100644
> >>>> --- a/target/riscv/packed_helper.c
> >>>> +++ b/target/riscv/packed_helper.c
> >>>> @@ -425,3 +425,107 @@ static inline void do_uksub8(CPURISCVState *env, void *vd, void *va,
> >>>>    }
> >>>>
> >>>>    RVPR(uksub8, 1, 1);
> >>>> +
> >>>> +/* 16-bit Shift Instructions */
> >>>> +static inline void do_sra16(CPURISCVState *env, void *vd, void *va,
> >>>> +                            void *vb, uint8_t i)
> >>>> +{
> >>>> +    int16_t *d = vd, *a = va;
> >>>> +    uint8_t shift = *(uint8_t *)vb & 0xf;
> >>>> +    d[i] = a[i] >> shift;
> >>>> +}
> >>>> +
> >>>> +RVPR(sra16, 1, 2);
> >>>> +
> >>>> +static inline void do_srl16(CPURISCVState *env, void *vd, void *va,
> >>>> +                            void *vb, uint8_t i)
> >>>> +{
> >>>> +    uint16_t *d = vd, *a = va;
> >>>> +    uint8_t shift = *(uint8_t *)vb & 0xf;
> >>>> +    d[i] = a[i] >> shift;
> >>>> +}
> >>>> +
> >>>> +RVPR(srl16, 1, 2);
> >>>> +
> >>>> +static inline void do_sll16(CPURISCVState *env, void *vd, void *va,
> >>>> +                            void *vb, uint8_t i)
> >>>> +{
> >>>> +    uint16_t *d = vd, *a = va;
> >>>> +    uint8_t shift = *(uint8_t *)vb & 0xf;
> >>>> +    d[i] = a[i] << shift;
> >>>> +}
> >>>> +
> >>>> +RVPR(sll16, 1, 2);
> >>>> +
> >>>> +static inline void do_sra16_u(CPURISCVState *env, void *vd, void *va,
> >>>> +                              void *vb, uint8_t i)
> >>>> +{
> >>>> +    int16_t *d = vd, *a = va;
> >>>> +    uint8_t shift = *(uint8_t *)vb & 0xf;
> >>>> +
> >>>> +    d[i] = vssra16(env, 0, a[i], shift);
> >>>> +}
> >>>> +
> >>>> +RVPR(sra16_u, 1, 2);
> >>>> +
> >>>> +static inline void do_srl16_u(CPURISCVState *env, void *vd, void *va,
> >>>> +                              void *vb, uint8_t i)
> >>>> +{
> >>>> +    uint16_t *d = vd, *a = va;
> >>>> +    uint8_t shift = *(uint8_t *)vb & 0xf;
> >>>> +
> >>>> +    d[i] = vssrl16(env, 0, a[i], shift);
> >>>> +}
> >>>> +
> >>>> +RVPR(srl16_u, 1, 2);
> >>>> +
> >>>> +static inline void do_ksll16(CPURISCVState *env, void *vd, void *va,
> >>>> +                             void *vb, uint8_t i)
> >>>> +{
> >>>> +    int16_t *d = vd, *a = va, result;
> >>>> +    uint8_t shift = *(uint8_t *)vb & 0xf;
> >>>> +
> >>>> +    result = a[i] << shift;
> >>>> +    if (shift > (clrsb32(a[i]) - 16)) {
> >>>> +        env->vxsat = 0x1;
> >>>> +        d[i] = (a[i] & INT16_MIN) ? INT16_MIN : INT16_MAX;
> >>>> +    } else {
> >>>> +        d[i] = result;
> >>>> +    }
> >>>> +}
> >>>> +
> >>>> +RVPR(ksll16, 1, 2);
> >>>> +
> >>>> +static inline void do_kslra16(CPURISCVState *env, void *vd, void *va,
> >>>> +                              void *vb, uint8_t i)
> >>>> +{
> >>>> +    int16_t *d = vd, *a = va;
> >>>> +    int32_t shift = sextract32((*(target_ulong *)vb), 0, 5);
> >>>> +
> >>>> +    if (shift >= 0) {
> >>>> +        do_ksll16(env, vd, va, vb, i);
> >>>> +    } else {
> >>>> +        shift = -shift;
> >>>> +        shift = (shift == 16) ? 15 : shift;
> >>>> +        d[i] = a[i] >> shift;
> >>>> +    }
> >>>> +}
> >>>> +
> >>>> +RVPR(kslra16, 1, 2);
> >>>> +
> >>>> +static inline void do_kslra16_u(CPURISCVState *env, void *vd, void *va,
> >>>> +                                void *vb, uint8_t i)
> >>>> +{
> >>>> +    int16_t *d = vd, *a = va;
> >>>> +    int32_t shift = sextract32((*(uint32_t *)vb), 0, 5);
> >>>> +
> >>>> +    if (shift >= 0) {
> >>>> +        do_ksll16(env, vd, va, vb, i);
> >>>> +    } else {
> >>>> +        shift = -shift;
> >>>> +        shift = (shift == 16) ? 15 : shift;
> >>>> +        d[i] = vssra16(env, 0, a[i], shift);
> >>>> +    }
> >>>> +}
> >>>> +
> >>>> +RVPR(kslra16_u, 1, 2);
> >>>> --
> >>>> 2.17.1
> >>>>
>

