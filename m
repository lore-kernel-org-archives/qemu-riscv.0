Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nB784-0003u1-GY
	for mharc-qemu-riscv@gnu.org; Fri, 21 Jan 2022 22:31:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nB76o-0003iH-0C
 for qemu-riscv@nongnu.org; Fri, 21 Jan 2022 22:31:32 -0500
Received: from [2607:f8b0:4864:20::b31] (port=39727
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nB76j-0001G5-Hp
 for qemu-riscv@nongnu.org; Fri, 21 Jan 2022 22:30:33 -0500
Received: by mail-yb1-xb31.google.com with SMTP id o80so33131244yba.6
 for <qemu-riscv@nongnu.org>; Fri, 21 Jan 2022 19:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bPkD/P+bog3+hC1O1EFSsF7YzPS/4KU80DCyX7ugVu0=;
 b=XaZ/g1LjZ5K1H81PYUpk2UAvZIMjJNBtTZ56YwCL8C9xW3OLXWjyAc8k2XkwTHrZET
 pZXToakLhkd7yqf5xS5RqH67fM9Fy6W0RS6ZWbZUBJ1wii8FqlhNSlxrMqFnv5PcrCmk
 fmSxJ/4GPBUpb2AaV4VI8l1joxMpopzHh4xJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bPkD/P+bog3+hC1O1EFSsF7YzPS/4KU80DCyX7ugVu0=;
 b=E7FgKu615fcjb2nM8kO0Cgd+EuKpllzxmM/YmMCGqlmiMZnZu1K5iTMXp/mR7wOohx
 qR/4VGPuiFaW/gSBJCWJWFVk9eGhELvmoiIRtVAhLIsdPVdF9lT4CObFn/fpIEd4P14m
 iYvhstQixE9vIbY5Z/Os0lFm+svTiPMSXUp2k8GE6rNDxth4snGdNOCBCFG0rSLGGtZ+
 5gmSngWbN02hfR2Mfx4/T4bxR+LJWg2jQdILqbdOpwQxckL8X7G7oppyRX0io6gAPOqa
 z23cowLURiH3CxarF5mEBo9knGUDoy2mAfHk7m9UmP4NCmHdsTEn+Yvvqu6DIpMo44CE
 PEvg==
X-Gm-Message-State: AOAM530x6QBJ7BIEp1NCt0rwSkECtHIEDRMXAY5Xx1f5d9hFwHvo5urS
 0RwpRlWAxoEL38tfP6y3sn3C+394SQvA/vGwljzw
X-Google-Smtp-Source: ABdhPJxOQKQYNLAtNl4EKVhKmTivAbKyhVQykRes2prk3we5fxSCnoMMoFUPkbhmb/c1spbJLxIcfBZM8b1XydNe9Lg=
X-Received: by 2002:a25:910e:: with SMTP id v14mr10535544ybl.713.1642822211499; 
 Fri, 21 Jan 2022 19:30:11 -0800 (PST)
MIME-Version: 1.0
References: <20220118163250.2596615-1-cmuellner@linux.com>
 <CAOnJCUJbk+2uGvL5oWHqLLjV_gpo8Yv1+u+1s0DieqrN5N2knA@mail.gmail.com>
 <CAHB2gtTMjzdfOvCNNwa1KfOhQ0RQdVKSoKmafuwot6PWNihWJA@mail.gmail.com>
In-Reply-To: <CAHB2gtTMjzdfOvCNNwa1KfOhQ0RQdVKSoKmafuwot6PWNihWJA@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 21 Jan 2022 19:30:00 -0800
Message-ID: <CAOnJCULeaytg0MoHEWg7N06T7_i4exqtYZJA2_0ps185cUUE3g@mail.gmail.com>
Subject: Re: [RESEND] target/riscv: Enable bitmanip Zicbo[m,z,p] instructions
To: =?UTF-8?Q?Christoph_M=C3=BCllner?= <cmuellner@linux.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 22 Jan 2022 03:31:48 -0000

On Fri, Jan 21, 2022 at 1:55 AM Christoph M=C3=BCllner <cmuellner@linux.com=
> wrote:
>
> On Tue, Jan 18, 2022 at 9:31 PM Atish Patra <atishp@atishpatra.org> wrote=
:
> >
> > On Tue, Jan 18, 2022 at 8:48 AM Christoph Muellner <cmuellner@linux.com=
> wrote:
> > >
> > > The RISC-V base cache management operation ISA extension has been
> > > ratified [1]. This patch adds support for the defined instructions
> > > and CSRs.
> > >
> > > [1] https://wiki.riscv.org/display/TECH/Recently+Ratified+Extensions
> > >
> > > Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> > > Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> > > Signed-off-by: Christoph Muellner <cmuellner@linux.com>
> > > ---
> > >  target/riscv/cpu.c                        |  4 +
> > >  target/riscv/cpu.h                        |  9 +++
> > >  target/riscv/cpu_bits.h                   | 10 +++
> > >  target/riscv/csr.c                        | 47 ++++++++++++
> > >  target/riscv/helper.h                     |  5 ++
> > >  target/riscv/insn32.decode                | 20 ++++-
> > >  target/riscv/insn_trans/trans_zicbo.c.inc | 72 ++++++++++++++++++
> > >  target/riscv/op_helper.c                  | 89 +++++++++++++++++++++=
++
> > >  target/riscv/translate.c                  |  1 +
> > >  9 files changed, 256 insertions(+), 1 deletion(-)
> > >  create mode 100644 target/riscv/insn_trans/trans_zicbo.c.inc
> > >
> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > index 9bc25d3055..b4a87cfcdc 100644
> > > --- a/target/riscv/cpu.c
> > > +++ b/target/riscv/cpu.c
> > > @@ -660,6 +660,10 @@ static Property riscv_cpu_properties[] =3D {
> > >      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> > >      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> > >      DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
> > > +    DEFINE_PROP_BOOL("Zicbom", RISCVCPU, cfg.ext_zicbom, false),
> > > +    DEFINE_PROP_BOOL("Zicbop", RISCVCPU, cfg.ext_zicbop, false),
> > > +    DEFINE_PROP_BOOL("Zicboz", RISCVCPU, cfg.ext_zicboz, false),
> > > +    DEFINE_PROP_UINT16("cbolen", RISCVCPU, cfg.cbolen, 64),
> > >      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> > >      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> > >
> > > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > > index 4d63086765..acfe21cb75 100644
> > > --- a/target/riscv/cpu.h
> > > +++ b/target/riscv/cpu.h
> > > @@ -263,6 +263,11 @@ struct CPURISCVState {
> > >      target_ulong spmbase;
> > >      target_ulong upmmask;
> > >      target_ulong upmbase;
> > > +
> > > +    /* [mhs]envcfg CSRs */
> > > +    target_ulong menvcfg;
> > > +    target_ulong henvcfg;
> > > +    target_ulong senvcfg;
> > >  #endif
> > >
> > >      float_status fp_status;
> > > @@ -329,6 +334,9 @@ struct RISCVCPU {
> > >          bool ext_icsr;
> > >          bool ext_zfh;
> > >          bool ext_zfhmin;
> > > +        bool ext_zicbom;
> > > +        bool ext_zicbop;
> > > +        bool ext_zicboz;
> > >
> > >          char *priv_spec;
> > >          char *user_spec;
> > > @@ -336,6 +344,7 @@ struct RISCVCPU {
> > >          char *vext_spec;
> > >          uint16_t vlen;
> > >          uint16_t elen;
> > > +        uint16_t cbolen;
> > >          bool mmu;
> > >          bool pmp;
> > >          bool epmp;
> > > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > > index 5a6d49aa64..38c529b493 100644
> > > --- a/target/riscv/cpu_bits.h
> > > +++ b/target/riscv/cpu_bits.h
> > > @@ -217,6 +217,11 @@
> > >  #define CSR_MTINST          0x34a
> > >  #define CSR_MTVAL2          0x34b
> > >
> > > +/* Environment configuration */
> > > +#define CSR_SENVCFG         0x10a
> > > +#define CSR_MENVCFG         0x30a
> > > +#define CSR_HENVCFG         0x60a
> > > +
> > >  /* Enhanced Physical Memory Protection (ePMP) */
> > >  #define CSR_MSECCFG         0x747
> > >  #define CSR_MSECCFGH        0x757
> > > @@ -449,6 +454,11 @@ typedef enum {
> > >  #define COUNTEREN_IR         (1 << 2)
> > >  #define COUNTEREN_HPM3       (1 << 3)
> > >
> > > +/* [msh]envcfg CSR bits */
> > > +#define ENVCFG_CBIE          (0b11 << 4)
> > > +#define ENVCFG_CBCFE         (1 << 6)
> > > +#define ENVCFG_CBZE          (1 << 7)
> > > +
> > >  /* Privilege modes */
> > >  #define PRV_U 0
> > >  #define PRV_S 1
> > > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > > index adb3d4381d..6693f695e4 100644
> > > --- a/target/riscv/csr.c
> > > +++ b/target/riscv/csr.c
> > > @@ -1478,6 +1478,48 @@ static RISCVException write_mtinst(CPURISCVSta=
te *env, int csrno,
> > >      return RISCV_EXCP_NONE;
> > >  }
> > >
> > > +static RISCVException read_menvcfg(CPURISCVState *env, int csrno,
> > > +                                   target_ulong *val)
> > > +{
> > > +    *val =3D env->menvcfg;
> > > +    return RISCV_EXCP_NONE;
> > > +}
> > > +
> > > +static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
> > > +                                    target_ulong val)
> > > +{
> > > +    env->menvcfg =3D val;
> > > +    return RISCV_EXCP_NONE;
> > > +}
> > > +
> > > +static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
> > > +                                   target_ulong *val)
> > > +{
> > > +    *val =3D env->henvcfg;
> > > +    return RISCV_EXCP_NONE;
> > > +}
> > > +
> > > +static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
> > > +                                    target_ulong val)
> > > +{
> > > +    env->henvcfg =3D val;
> > > +    return RISCV_EXCP_NONE;
> > > +}
> > > +
> > > +static RISCVException read_senvcfg(CPURISCVState *env, int csrno,
> > > +                                   target_ulong *val)
> > > +{
> > > +    *val =3D env->senvcfg;
> > > +    return RISCV_EXCP_NONE;
> > > +}
> > > +
> > > +static RISCVException write_senvcfg(CPURISCVState *env, int csrno,
> > > +                                    target_ulong val)
> > > +{
> > > +    env->senvcfg =3D val;
> > > +    return RISCV_EXCP_NONE;
> > > +}
> > > +
> > >  /* Physical Memory Protection */
> > >  static RISCVException read_mseccfg(CPURISCVState *env, int csrno,
> > >                                     target_ulong *val)
> > > @@ -2091,6 +2133,11 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =
=3D {
> > >      [CSR_MTVAL2]      =3D { "mtval2",      hmode,   read_mtval2,    =
  write_mtval2      },
> > >      [CSR_MTINST]      =3D { "mtinst",      hmode,   read_mtinst,    =
  write_mtinst      },
> > >
> > > +    /* Environment configuration */
> > > +    [CSR_MENVCFG]     =3D { "menvcfg",     any,     read_menvcfg,   =
  write_menvcfg     },
> > > +    [CSR_HENVCFG]     =3D { "henvcfg",     hmode,   read_henvcfg,   =
  write_henvcfg     },
> > > +    [CSR_SENVCFG]     =3D { "senvcfg",     smode,   read_senvcfg,   =
  write_senvcfg     },
> >
> >
> > I was also adding support for these as a part of sstc implementaion :)
> > Here are the patches
> >
> > https://github.com/atishp04/qemu/commits/sstc_dev
> >
> > Few missing things in this patch:
> >
> > 1. It would be good to separate envcfg csr support from the CBO
>
> I'll put the introduction of them into an earlier patch.
>
> > 2. All these CSrs are added priv 1.12. Thus, priv version should be
> > updated and checked
> > before accessing these CSRs.
>
> Ok.
>
> > 3. Priv 1.12 also adds menvcfgh & henvcfgh. These are missing in this p=
atch
>
> Ok.
>
> > I can send a separate series for basic infa support priv 1.12 (by
> > dropping 1st patch in sstc_dev branch) or you can use use my patches
> > from the github.
> > I am fine with either way. Let me know how should we proceed with these=
 changes.
>
> I'll prepare a series including your patches.
>

I have revised it with a much cleaner approach. Here is the series
https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg04478.html

Let me know if it looks okay to you or has any obvious shortcomings.

> >
> > > +
> > >      /* Physical Memory Protection */
> > >      [CSR_MSECCFG]    =3D { "mseccfg",  epmp, read_mseccfg, write_mse=
ccfg },
> > >      [CSR_PMPCFG0]    =3D { "pmpcfg0",   pmp, read_pmpcfg,  write_pmp=
cfg  },
> > > diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> > > index 6cf6d6ce98..4a2ebdabbd 100644
> > > --- a/target/riscv/helper.h
> > > +++ b/target/riscv/helper.h
> > > @@ -92,6 +92,11 @@ DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64,=
 env, tl)
> > >  DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
> > >  DEF_HELPER_FLAGS_1(fclass_h, TCG_CALL_NO_RWG_SE, tl, i64)
> > >
> > > +/* Cache-block operations */
> > > +DEF_HELPER_2(cbo_inval, void, env, tl)
> > > +DEF_HELPER_2(cbo_clean, void, env, tl)
> > > +DEF_HELPER_2(cbo_zero, void, env, tl)
> > > +
> > >  /* Special functions */
> > >  DEF_HELPER_2(csrr, tl, env, int)
> > >  DEF_HELPER_3(csrw, void, env, int, tl)
> > > diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> > > index d3f798ca10..1dca5bf346 100644
> > > --- a/target/riscv/insn32.decode
> > > +++ b/target/riscv/insn32.decode
> > > @@ -89,6 +89,8 @@
> > >  @sfence_vma ....... ..... .....   ... ..... ....... %rs2 %rs1
> > >  @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
> > >
> > > +@cbo_pref   simm:7 ..... .....   ... ..... ....... %rs1
> > > +
> > >  # Formats 64:
> > >  @sh5     .......  ..... .....  ... ..... ....... &shift  shamt=3D%sh=
5      %rs1 %rd
> > >
> > > @@ -128,7 +130,15 @@ addi     ............     ..... 000 ..... 001001=
1 @i
> > >  slti     ............     ..... 010 ..... 0010011 @i
> > >  sltiu    ............     ..... 011 ..... 0010011 @i
> > >  xori     ............     ..... 100 ..... 0010011 @i
> > > -ori      ............     ..... 110 ..... 0010011 @i
> > > +{
> > > +  {
> > > +    # *** RV32 Zicbop Sandard Extension (hints in the ori-space) ***
> > > +    prefetch_i  ....... 00000 ..... 110 00000 0010011 @cbo_pref
> > > +    prefetch_r  ....... 00001 ..... 110 00000 0010011 @cbo_pref
> > > +    prefetch_w  ....... 00011 ..... 110 00000 0010011 @cbo_pref
> > > +  }
> > > +  ori      ............     ..... 110 ..... 0010011 @i
> > > +}
> > >  andi     ............     ..... 111 ..... 0010011 @i
> > >  slli     00000. ......    ..... 001 ..... 0010011 @sh
> > >  srli     00000. ......    ..... 101 ..... 0010011 @sh
> > > @@ -804,6 +814,14 @@ fcvt_h_w   1101010  00000 ..... ... ..... 101001=
1 @r2_rm
> > >  fcvt_h_wu  1101010  00001 ..... ... ..... 1010011 @r2_rm
> > >  fmv_h_x    1111010  00000 ..... 000 ..... 1010011 @r2
> > >
> > > +# *** RV32 Zicbom Standard Extension ***
> > > +cbo_clean  0000000 00001 ..... 010 00000 0001111 @sfence_vm
> > > +cbo_flush  0000000 00010 ..... 010 00000 0001111 @sfence_vm
> > > +cbo_inval  0000000 00000 ..... 010 00000 0001111 @sfence_vm
> > > +
> > > +# *** RV32 Zicboz Standard Extension ***
> > > +cbo_zero   0000000 00100 ..... 010 00000 0001111 @sfence_vm
> > > +
> > >  # *** RV64 Zfh Extension (in addition to RV32 Zfh) ***
> > >  fcvt_l_h   1100010  00010 ..... ... ..... 1010011 @r2_rm
> > >  fcvt_lu_h  1100010  00011 ..... ... ..... 1010011 @r2_rm
> > > diff --git a/target/riscv/insn_trans/trans_zicbo.c.inc b/target/riscv=
/insn_trans/trans_zicbo.c.inc
> > > new file mode 100644
> > > index 0000000000..e75f7d99e3
> > > --- /dev/null
> > > +++ b/target/riscv/insn_trans/trans_zicbo.c.inc
> > > @@ -0,0 +1,72 @@
> > > +/*
> > > + * RISC-V translation routines for the RISC-V CBO Extension.
> > > + *
> > > + * Copyright (c) 2021 Philipp Tomsich, philipp.tomsich@vrull.eu
> > > + *
> > > + * This program is free software; you can redistribute it and/or mod=
ify it
> > > + * under the terms and conditions of the GNU General Public License,
> > > + * version 2 or later, as published by the Free Software Foundation.
> > > + *
> > > + * This program is distributed in the hope it will be useful, but WI=
THOUT
> > > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILIT=
Y or
> > > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Lic=
ense for
> > > + * more details.
> > > + *
> > > + * You should have received a copy of the GNU General Public License=
 along with
> > > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > > + */
> > > +
> > > +#define REQUIRE_ZICBOM(ctx) do {                 \
> > > +    if (!RISCV_CPU(ctx->cs)->cfg.ext_zicbom) {   \
> > > +        return false;                            \
> > > +    }                                            \
> > > +} while (0)
> > > +
> > > +#define REQUIRE_ZICBOZ(ctx) do {                 \
> > > +    if (!RISCV_CPU(ctx->cs)->cfg.ext_zicboz) {   \
> > > +        return false;                            \
> > > +    }                                            \
> > > +} while (0)
> > > +
> > > +static bool trans_cbo_clean(DisasContext *ctx, arg_cbo_clean *a)
> > > +{
> > > +    REQUIRE_ZICBOM(ctx);
> > > +    gen_helper_cbo_clean(cpu_env, cpu_gpr[a->rs1]);
> > > +    return true;
> > > +}
> > > +
> > > +static bool trans_cbo_flush(DisasContext *ctx, arg_cbo_flush *a)
> > > +{
> > > +    REQUIRE_ZICBOM(ctx);
> > > +    gen_helper_cbo_clean(cpu_env, cpu_gpr[a->rs1]);
> > > +    return true;
> > > +}
> > > +
> > > +static bool trans_cbo_inval(DisasContext *ctx, arg_cbo_inval *a)
> > > +{
> > > +    REQUIRE_ZICBOM(ctx);
> > > +    gen_helper_cbo_inval(cpu_env, cpu_gpr[a->rs1]);
> > > +    return true;
> > > +}
> > > +
> > > +static bool trans_cbo_zero(DisasContext *ctx, arg_cbo_zero *a)
> > > +{
> > > +    REQUIRE_ZICBOZ(ctx);
> > > +    gen_helper_cbo_zero(cpu_env, cpu_gpr[a->rs1]);
> > > +    return true;
> > > +}
> > > +
> > > +static bool trans_prefetch_i(DisasContext *ctx, arg_prefetch_i *a)
> > > +{
> > > +    return true;
> > > +}
> > > +
> > > +static bool trans_prefetch_r(DisasContext *ctx, arg_prefetch_i *a)
> > > +{
> > > +    return true;
> > > +}
> > > +
> > > +static bool trans_prefetch_w(DisasContext *ctx, arg_prefetch_i *a)
> > > +{
> > > +    return true;
> > > +}
> > > diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> > > index 6f040f2fb9..06919abd49 100644
> > > --- a/target/riscv/op_helper.c
> > > +++ b/target/riscv/op_helper.c
> > > @@ -3,6 +3,7 @@
> > >   *
> > >   * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.ed=
u
> > >   * Copyright (c) 2017-2018 SiFive, Inc.
> > > + * Copyright (c) 2021      VRULL GmbH
> > >   *
> > >   * This program is free software; you can redistribute it and/or mod=
ify it
> > >   * under the terms and conditions of the GNU General Public License,
> > > @@ -69,6 +70,33 @@ target_ulong helper_csrrw(CPURISCVState *env, int =
csr,
> > >      return val;
> > >  }
> > >
> > > +/* helper_zicbo_envcfg
> > > + *
> > > + * Raise virtual exceptions and illegal instruction exceptions for
> > > + * Zicbo[mz] instructions based on the settings of [mhs]envcfg.
> > > + */
> > > +static void helper_zicbo_envcfg(CPURISCVState *env, target_ulong env=
bits)
> > > +{
> > > +#ifndef CONFIG_USER_ONLY
> > > +    target_ulong ra =3D GETPC();
> > > +
> > > +    /* Check for virtual instruction exceptions first, as we don't s=
ee
> > > +     * VU and VS reflected in env->priv (these are just the translat=
ed
> > > +     * U and S stated with virtualisation enabled.
> > > +     */
> > > +    if (riscv_cpu_virt_enabled(env) &&
> > > +        (((env->priv < PRV_H) && !get_field(env->henvcfg, envbits)) =
||
> > > +         ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits)))=
) {
> > > +        riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT=
, ra);
> > > +    }
> > > +
> > > +    if (((env->priv < PRV_M) && !get_field(env->menvcfg, envbits)) |=
|
> > > +        ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits))) =
{
> > > +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
> > > +    }
> > > +#endif
> > > +}
> > > +
> > >  target_ulong helper_csrr_i128(CPURISCVState *env, int csr)
> > >  {
> > >      Int128 rv =3D int128_zero();
> > > @@ -113,6 +141,67 @@ target_ulong helper_csrrw_i128(CPURISCVState *en=
v, int csr,
> > >      return int128_getlo(rv);
> > >  }
> > >
> > > +/* helper_zicbom_access
> > > + *
> > > + * Check access permissions (LOAD or STORE or FETCH) for Zicbom,
> > > + * raising either store page-fault (non-virtualised) or store
> > > + * guest-page fault (virtualised).
> > > + */
> > > +static void helper_zicbom_access(CPURISCVState *env, target_ulong ad=
dress)
> > > +{
> > > +    void* phost;
> > > +    int ret =3D TLB_INVALID_MASK;
> > > +    MMUAccessType access_type =3D MMU_DATA_LOAD;
> > > +    target_ulong ra =3D GETPC();
> > > +
> > > +    while (ret =3D=3D TLB_INVALID_MASK && access_type <=3D MMU_INST_=
FETCH) {
> > > +        ret =3D probe_access_flags(env, address, access_type++,
> > > +                                 cpu_mmu_index(env, false),
> > > +                                 true, &phost, ra);
> > > +    }
> > > +
> > > +    if (ret =3D=3D TLB_INVALID_MASK) {
> > > +        uint32_t exc =3D RISCV_EXCP_STORE_PAGE_FAULT;
> > > +
> > > +#ifndef CONFIG_USER_ONLY
> > > +        /* User-mode emulation does not have virtualisation... */
> > > +        if (riscv_cpu_virt_enabled(env)) {
> > > +            exc =3D RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT;
> > > +        }
> > > +#endif
> > > +        riscv_raise_exception(env, exc, ra);
> > > +    }
> > > +}
> > > +
> > > +void helper_cbo_inval(CPURISCVState *env, target_ulong address)
> > > +{
> > > +    helper_zicbo_envcfg(env, ENVCFG_CBIE);
> > > +    helper_zicbom_access(env, address);
> > > +
> > > +    /* We don't emulate the cache-hierarchy, so we're done. */
> > > +}
> > > +
> > > +void helper_cbo_clean(CPURISCVState *env, target_ulong address)
> > > +{
> > > +    helper_zicbo_envcfg(env, ENVCFG_CBCFE);
> > > +    helper_zicbom_access(env, address);
> > > +
> > > +    /* We don't emulate the cache-hierarchy, so we're done. */
> > > +}
> > > +
> > > +void helper_cbo_zero(CPURISCVState *env, target_ulong address)
> > > +{
> > > +    helper_zicbo_envcfg(env, ENVCFG_CBZE);
> > > +
> > > +    /* mask off low-bits to align-down to the cache-block */
> > > +    address &=3D ~(RISCV_CPU(env)->cfg.cbolen - 1);
> > > +    void* mem =3D probe_access(env, address, 4, MMU_DATA_STORE,
> > > +                             cpu_mmu_index(env, false), GETPC());
> > > +
> > > +    /* Zeroize the block */
> > > +    memset(mem, 0, RISCV_CPU(env)->cfg.cbolen);
> > > +}
> > > +
> > >  #ifndef CONFIG_USER_ONLY
> > >
> > >  target_ulong helper_sret(CPURISCVState *env, target_ulong cpu_pc_deb=
)
> > > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > > index 615048ec87..d3203a1f2f 100644
> > > --- a/target/riscv/translate.c
> > > +++ b/target/riscv/translate.c
> > > @@ -837,6 +837,7 @@ static uint32_t opcode_at(DisasContextBase *dcbas=
e, target_ulong pc)
> > >  #include "insn_trans/trans_rvv.c.inc"
> > >  #include "insn_trans/trans_rvb.c.inc"
> > >  #include "insn_trans/trans_rvzfh.c.inc"
> > > +#include "insn_trans/trans_zicbo.c.inc"
> > >  #include "insn_trans/trans_privileged.c.inc"
> > >
> > >  /* Include the auto-generated decoder for 16 bit insn */
> > > --
> > > 2.34.1
> > >
> > >
> >
> >
> > --
> > Regards,
> > Atish



--=20
Regards,
Atish

