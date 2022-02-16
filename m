Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nKKj0-0006R6-AV
	for mharc-qemu-riscv@gnu.org; Wed, 16 Feb 2022 08:52:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nKKiw-0006QA-Ha; Wed, 16 Feb 2022 08:52:02 -0500
Received: from mail-vk1-f172.google.com ([209.85.221.172]:34655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nKKir-0006NU-O7; Wed, 16 Feb 2022 08:52:02 -0500
Received: by mail-vk1-f172.google.com with SMTP id j9so1293160vkj.1;
 Wed, 16 Feb 2022 05:51:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uy78uV0IAMyPoANfemcaNnfn8kZvsVFaYEEO1NSJdgA=;
 b=QztpJaxQHq6hku54QRJyK58RY1E2zw4FJl98JligpjF3wT/xALGbAIsg8tfzp1RKM+
 ivUfxJOsyx9/ihiiuD/hoY2IXaG68p7KaRUOKkeEBARMO0x4YLhujTnFjcEzLPKrXyOc
 tHNbYfIeXuWgUWeYnP5OiVs+h1Pt521PqflAaWPDkW8puTAxjl3fLwBwXp17edrT/tHV
 xplVKG5x5h+aCtpDp8p4jlDK6ciGqZ59fX/UlSZgGwYLRKMmw0PqPQAUnwXanKAgJo0F
 BAAf9c74ot5IEFjlUwu5wAwmv9svgeF5aHVdHGPNCrtdx2N7ux4V/Rg73TPoow7/hJgi
 JRnA==
X-Gm-Message-State: AOAM5304+cXhO23CI0qAhWs24P5Dqb35STuds1MrfBnPeCabTD9eCL+D
 hXdSdM/p9nwFsWX0NaqjhatyTTqw5DZ0MF6B
X-Google-Smtp-Source: ABdhPJytLZJ8MlPHZPCFkk3YOPMkAd94ReYTXf2RZtV4irP5LnPi8kwyZLg3gv9zP1lNrIm6qyVdXA==
X-Received: by 2002:a05:6122:2213:b0:31b:76c3:16df with SMTP id
 bb19-20020a056122221300b0031b76c316dfmr1045699vkb.31.1645019509702; 
 Wed, 16 Feb 2022 05:51:49 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com.
 [209.85.217.51])
 by smtp.gmail.com with ESMTPSA id y22sm482195vsk.6.2022.02.16.05.51.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 05:51:49 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id j20so2505089vsg.5;
 Wed, 16 Feb 2022 05:51:49 -0800 (PST)
X-Received: by 2002:a05:6102:3222:b0:30e:28cb:3518 with SMTP id
 x2-20020a056102322200b0030e28cb3518mr1029541vsf.27.1645019509193; Wed, 16 Feb
 2022 05:51:49 -0800 (PST)
MIME-Version: 1.0
References: <20220210163449.3859905-1-cmuellner@linux.com>
 <2901768a-7aaa-2288-b971-a2b091a4ff51@iscas.ac.cn>
In-Reply-To: <2901768a-7aaa-2288-b971-a2b091a4ff51@iscas.ac.cn>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <cmuellner@linux.com>
Date: Wed, 16 Feb 2022 14:51:37 +0100
X-Gmail-Original-Message-ID: <CAHB2gtQB96r32SY9U9yXn-4p8w+6m8+RT6aSfSJKaguuja3AFw@mail.gmail.com>
Message-ID: <CAHB2gtQB96r32SY9U9yXn-4p8w+6m8+RT6aSfSJKaguuja3AFw@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: Enable Zicbo[m,z,p] instructions
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000007e82b205d822f36f"
Received-SPF: pass client-ip=209.85.221.172;
 envelope-from=christophm30@gmail.com; helo=mail-vk1-f172.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 16 Feb 2022 13:52:02 -0000

--0000000000007e82b205d822f36f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 11, 2022 at 3:41 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:

>
> =E5=9C=A8 2022/2/11 =E4=B8=8A=E5=8D=8812:34, Christoph Muellner =E5=86=99=
=E9=81=93:
> > The RISC-V base cache management operation ISA extension has been
> > ratified [1]. This patch adds support for the defined instructions.
> >
> > The cmo.prefetch instructions are nops for QEMU (no emulation of the
> memory
> > hierarchy, no illegal instructions, no permission faults, no traps),
> > therefore there's only a comment where they would be decoded.
> >
> > The other cbo* instructions are moved into an overlap group to
> > resolve the overlapping pattern with the LQ instruction.
> > The cbo.zero zeros a configurable amount of bytes.
> > Similar to other extensions (e.g. atomic instructions),
> > the trap behavior is limited such, that only the page permissions
> > are checked (ignoring other optional protection mechanisms like
> > PMA or PMP).
> >
> > [1] https://wiki.riscv.org/display/TECH/Recently+Ratified+Extensions
> >
> > v3:
> > - Enable by default (like zb*)
> > - Rename flags Zicbo* -> zicbo* (like zb*)
> > - Rename ext_zicbo* -> ext_icbo* (like ext_icsr)
> > - Rename trans_zicbo.c.inc -> trans_rvzicbo.c.inc (like all others)
> > - Simplify prefetch instruction support to a single comment
> > - Rebase on top of github-alistair23/riscv-to-apply.next plus the
> >    Priv v1.12 series from github-atishp04/priv_1_12_support_v3
> >
> > v2:
> > - Fix overlapping instruction encoding with LQ instructions
> > - Drop CSR related changes and rebase on Priv 1.12 patchset
> >
> > Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> > Signed-off-by: Christoph Muellner <cmuellner@linux.com>
> > ---
> >   target/riscv/cpu.c                          |  3 +
> >   target/riscv/cpu.h                          |  3 +
> >   target/riscv/helper.h                       |  5 ++
> >   target/riscv/insn32.decode                  | 16 +++-
> >   target/riscv/insn_trans/trans_rvzicbo.c.inc | 57 +++++++++++++
> >   target/riscv/op_helper.c                    | 94 ++++++++++++++++++++=
+
> >   target/riscv/translate.c                    |  1 +
> >   7 files changed, 178 insertions(+), 1 deletion(-)
> >   create mode 100644 target/riscv/insn_trans/trans_rvzicbo.c.inc
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 39ffb883fc..cbd0a34318 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -764,6 +764,9 @@ static Property riscv_cpu_properties[] =3D {
> >       DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> >       DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> >       DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> > +    DEFINE_PROP_BOOL("zicbom", RISCVCPU, cfg.ext_icbom, true),
> > +    DEFINE_PROP_BOOL("zicboz", RISCVCPU, cfg.ext_icboz, true),
> > +    DEFINE_PROP_UINT16("cbozlen", RISCVCPU, cfg.cbozlen, 64),
> >       DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> >       DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
> >       DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index fe80caeec0..7bd2fd26d6 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -368,6 +368,8 @@ struct RISCVCPUConfig {
> >       bool ext_counters;
> >       bool ext_ifencei;
> >       bool ext_icsr;
> > +    bool ext_icbom;
> > +    bool ext_icboz;
> >       bool ext_zfh;
> >       bool ext_zfhmin;
> >       bool ext_zve32f;
> > @@ -382,6 +384,7 @@ struct RISCVCPUConfig {
> >       char *vext_spec;
> >       uint16_t vlen;
> >       uint16_t elen;
> > +    uint16_t cbozlen;
> >       bool mmu;
> >       bool pmp;
> >       bool epmp;
> > diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> > index 72cc2582f4..ef1944da8f 100644
> > --- a/target/riscv/helper.h
> > +++ b/target/riscv/helper.h
> > @@ -92,6 +92,11 @@ DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64,
> env, tl)
> >   DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
> >   DEF_HELPER_FLAGS_1(fclass_h, TCG_CALL_NO_RWG_SE, tl, i64)
> >
> > +/* Cache-block operations */
> > +DEF_HELPER_2(cbo_clean_flush, void, env, tl)
> > +DEF_HELPER_2(cbo_inval, void, env, tl)
> > +DEF_HELPER_2(cbo_zero, void, env, tl)
> > +
> >   /* Special functions */
> >   DEF_HELPER_2(csrr, tl, env, int)
> >   DEF_HELPER_3(csrw, void, env, int, tl)
> > diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> > index 5bbedc254c..d5f8329970 100644
> > --- a/target/riscv/insn32.decode
> > +++ b/target/riscv/insn32.decode
> > @@ -128,6 +128,7 @@ addi     ............     ..... 000 ..... 0010011 @=
i
> >   slti     ............     ..... 010 ..... 0010011 @i
> >   sltiu    ............     ..... 011 ..... 0010011 @i
> >   xori     ............     ..... 100 ..... 0010011 @i
> > +# cbo.prefetch_{i,r,m} instructions are ori with rd=3Dx0 and not decod=
ed.
> >   ori      ............     ..... 110 ..... 0010011 @i
> >   andi     ............     ..... 111 ..... 0010011 @i
> >   slli     00000. ......    ..... 001 ..... 0010011 @sh
> > @@ -168,7 +169,20 @@ sraw     0100000 .....  ..... 101 ..... 0111011 @r
> >
> >   # *** RV128I Base Instruction Set (in addition to RV64I) ***
> >   ldu      ............   ..... 111 ..... 0000011 @i
> > -lq       ............   ..... 010 ..... 0001111 @i
> > +{
> > +  [
> > +    # *** RV32 Zicbom Standard Extension ***
> > +    cbo_clean  0000000 00001 ..... 010 00000 0001111 @sfence_vm
> > +    cbo_flush  0000000 00010 ..... 010 00000 0001111 @sfence_vm
> > +    cbo_inval  0000000 00000 ..... 010 00000 0001111 @sfence_vm
> > +
> > +    # *** RV32 Zicboz Standard Extension ***
> > +    cbo_zero   0000000 00100 ..... 010 00000 0001111 @sfence_vm
> > +  ]
> > +
> > +  # *** RVI128 lq ***
> > +  lq       ............   ..... 010 ..... 0001111 @i
> > +}
> >   sq       ............   ..... 100 ..... 0100011 @s
> >   addid    ............  .....  000 ..... 1011011 @i
> >   sllid    000000 ......  ..... 001 ..... 1011011 @sh6
> > diff --git a/target/riscv/insn_trans/trans_rvzicbo.c.inc
> b/target/riscv/insn_trans/trans_rvzicbo.c.inc
> > new file mode 100644
> > index 0000000000..35c277261f
> > --- /dev/null
> > +++ b/target/riscv/insn_trans/trans_rvzicbo.c.inc
> > @@ -0,0 +1,57 @@
> > +/*
> > + * RISC-V translation routines for the RISC-V CBO Extension.
> > + *
> > + * Copyright (c) 2021 Philipp Tomsich, philipp.tomsich@vrull.eu
> > + *
> > + * This program is free software; you can redistribute it and/or modif=
y
> it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2 or later, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but
> WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
> License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> along with
> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#define REQUIRE_ZICBOM(ctx) do {             \
> > +    if (!RISCV_CPU(ctx->cs)->cfg.ext_icbom) {        \
> > +        return false;                                \
> > +    }                                                \
> > +} while (0)
> > +
> It's better to use ctx->cfg_ptr->ext_icbom instead.
>

Ok.


> > +#define REQUIRE_ZICBOZ(ctx) do {             \
> > +    if (!RISCV_CPU(ctx->cs)->cfg.ext_icboz) {        \
> > +        return false;                                \
> > +    }                                                \
> > +} while (0)
> > +
> > +static bool trans_cbo_clean(DisasContext *ctx, arg_cbo_clean *a)
> > +{
> > +    REQUIRE_ZICBOM(ctx);
> > +    gen_helper_cbo_clean_flush(cpu_env, cpu_gpr[a->rs1]);
> > +    return true;
> > +}
> > +
> > +static bool trans_cbo_flush(DisasContext *ctx, arg_cbo_flush *a)
> > +{
> > +    REQUIRE_ZICBOM(ctx);
> > +    gen_helper_cbo_clean_flush(cpu_env, cpu_gpr[a->rs1]);
> > +    return true;
> > +}
> > +
> > +static bool trans_cbo_inval(DisasContext *ctx, arg_cbo_inval *a)
> > +{
> > +    REQUIRE_ZICBOM(ctx);
> > +    gen_helper_cbo_inval(cpu_env, cpu_gpr[a->rs1]);
> > +    return true;
> > +}
> > +
> > +static bool trans_cbo_zero(DisasContext *ctx, arg_cbo_zero *a)
> > +{
> > +    REQUIRE_ZICBOZ(ctx);
> > +    gen_helper_cbo_zero(cpu_env, cpu_gpr[a->rs1]);
> > +    return true;
> > +}
> > diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> > index 1a75ba11e6..21762bc2e0 100644
> > --- a/target/riscv/op_helper.c
> > +++ b/target/riscv/op_helper.c
> > @@ -3,6 +3,7 @@
> >    *
> >    * Copyright (c) 2016-2017 Sagar Karandikar, sagark@eecs.berkeley.edu
> >    * Copyright (c) 2017-2018 SiFive, Inc.
> > + * Copyright (c) 2022      VRULL GmbH
> >    *
> >    * This program is free software; you can redistribute it and/or
> modify it
> >    * under the terms and conditions of the GNU General Public License,
> > @@ -114,6 +115,99 @@ target_ulong helper_csrrw_i128(CPURISCVState *env,
> int csr,
> >       return int128_getlo(rv);
> >   }
> >
> > +
> > +/* helper_zicbo_envcfg
> > + *
> > + * Raise virtual exceptions and illegal instruction exceptions for
> > + * Zicbo[mz] instructions based on the settings of [mhs]envcfg as
> > + * specified in section 2.5.1 of the CMO specification.
> > + */
> > +static void helper_zicbo_envcfg(CPURISCVState *env, target_ulong
> envbits,
> > +                                uintptr_t ra)
> > +{
> > +#ifndef CONFIG_USER_ONLY
> > +    /* Check for virtual instruction exceptions first, as we don't see
> > +     * VU and VS reflected in env->priv (these are just the translated
> > +     * U and S stated with virtualisation enabled.
> > +     */
> > +    if (riscv_cpu_virt_enabled(env) &&
> > +        (((env->priv < PRV_H) && !get_field(env->henvcfg, envbits)) ||
> > +         ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits)))) =
{
> > +        riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT,
> ra);
> > +    }
> > +
> > +    if (((env->priv < PRV_M) && !get_field(env->menvcfg, envbits)) ||
> > +        ((env->priv < PRV_S) && !get_field(env->senvcfg, envbits))) {
> > +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
> > +    }
> > +#endif
> > +}
> > +
> > +/* helper_zicbom_access
> > + *
> > + * Check access permissions (LOAD, STORE or FETCH as specified in
> section
> > + * 2.5.2 of the CMO specification) for Zicbom, raising either store
> > + * page-fault (non-virtualised) or store guest-page fault (virtualised=
).
> > + */
> > +static void helper_zicbom_access(CPURISCVState *env, target_ulong
> address,
> > +                                 uintptr_t ra)
> > +{
> > +    void* phost;
> > +    int ret =3D TLB_INVALID_MASK;
> > +    MMUAccessType access_type =3D MMU_DATA_LOAD;
> > +
> > +    while (ret =3D=3D TLB_INVALID_MASK && access_type <=3D MMU_INST_FE=
TCH) {
> > +        ret =3D probe_access_flags(env, address, access_type++,
> > +                                 cpu_mmu_index(env, false),
> > +                                 true, &phost, ra);
>
> Using probe_access_flags here will make the size of   pmp check for
> final physical address to be zero.
>

> Maybe it's better to use probe_access with cbozlen as size and address
> aligned to cbozlen.
>
>
The current API let's me to decide between:
* probe_access() -> implies nonfault =3D=3D false (-> no control over the
faults)
* probe_access_flags() -> implies size =3D=3D 0 (-> access to the whole pag=
e)

The size value is indeed forwarded to pmp_hart_has_privs(), but there is a
comment, which states:
  If size is unknown (0), assume that all bytes from addr to the end of the
page will be accessed.
...and the code below does:
  pmp_size =3D -(addr | TARGET_PAGE_MASK);

So, indeed we might raise a PMP error outside of the cache line.

Given the API restriction, I'll do the following:
* Add a new call probe_access_flags_with_size()
* Introduce a cbom block size env variable similar to cbozlen.



>
> > +    }
> > +
> > +    if (ret =3D=3D TLB_INVALID_MASK) {
> > +        uint32_t exc =3D RISCV_EXCP_STORE_PAGE_FAULT;
> > +
> > +#ifndef CONFIG_USER_ONLY
> > +        /* User-mode emulation does not have virtualisation. */
> > +        if (riscv_cpu_virt_enabled(env)) {
> > +            exc =3D RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT;
> > +        }
> > +#endif
> > +        riscv_raise_exception(env, exc, ra);
>
> If pmp violation triggers, the exception type should be
> RISCV_EXCP_STORE_AMO_ACCESS_FAULT.
>

The probe_access*() API does not allow distinguishing different reasons for
a translation error (we just get TLB_INVALID_MASK).
Looking into the details of the current PMP implementation in QEMU, I agree
that translation errors could be analysed in more detail.
...


> And It seems that not all exception triggered when virtualisation is
> enabled is guest page fault(RISCV_EXCP_STORE_GUEST_*_ACCESS_FAULT) .
> The exception triggered in first stage(G-Stage) is normal page fault.
>

...here we have the same issue:
The probe_access*() calls don't provide the necessary details of the
translation error.
And the RISC-V backend does not provide convenient APIs to get better
information.

However, looking at target/riscv/cpu_helper.c, I can see that the
function raise_mmu_exception()
creates exactly the faults that we need for access_type=3D=3DMMU_DATA_STORE=
.

Based on that, here is how I intend to solve the issue:
* change the probe_access_flags() loop as mentioned above
* in the error-paths (if ret =3D=3D TLB_INVALID_MASK): call probe_access(ST=
ORE,
nonfault=3Dfalse) to create the correct exception

Thanks,
Christoph


>
> > +    }
> > +}
> > +
> > +void helper_cbo_clean_flush(CPURISCVState *env, target_ulong address)
> > +{
> > +    uintptr_t ra =3D GETPC();
> > +    helper_zicbo_envcfg(env, MENVCFG_CBCFE, ra);
> > +    helper_zicbom_access(env, address, ra);
> > +}
> > +
> > +void helper_cbo_inval(CPURISCVState *env, target_ulong address)
> > +{
> > +    uintptr_t ra =3D GETPC();
> > +    helper_zicbo_envcfg(env, MENVCFG_CBIE, ra);
> > +    helper_zicbom_access(env, address, ra);
> > +}
> > +
> > +void helper_cbo_zero(CPURISCVState *env, target_ulong address)
> > +{
> > +    uintptr_t ra =3D GETPC();
> > +    helper_zicbo_envcfg(env, MENVCFG_CBZE, ra);
> > +
> > +    /* Get the size of the cache block for zero instructions. */
> > +    RISCVCPU *cpu =3D env_archcpu(env);
> > +    uint16_t cbozlen =3D cpu->cfg.cbozlen;
> > +
> > +    /* Mask off low-bits to align-down to the cache-block. */
> > +    address &=3D ~(cbozlen - 1);
> > +
> > +    void* mem =3D probe_access(env, address, cbozlen, MMU_DATA_STORE,
> > +                             cpu_mmu_index(env, false), GETPC());
> > +
> > +    /* Zero the block */
> > +    memset(mem, 0, cbozlen);
> > +}
> > +
> >   #ifndef CONFIG_USER_ONLY
> >
> >   target_ulong helper_sret(CPURISCVState *env)
> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > index eaf5a72c81..0ee2ce85ec 100644
> > --- a/target/riscv/translate.c
> > +++ b/target/riscv/translate.c
> > @@ -861,6 +861,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase,
> target_ulong pc)
> >   #include "insn_trans/trans_rvv.c.inc"
> >   #include "insn_trans/trans_rvb.c.inc"
> >   #include "insn_trans/trans_rvzfh.c.inc"
> > +#include "insn_trans/trans_rvzicbo.c.inc"
> >   #include "insn_trans/trans_privileged.c.inc"
> >   #include "insn_trans/trans_xventanacondops.c.inc"
> >
>

--0000000000007e82b205d822f36f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 11, 2022 at 3:41 AM Weiwe=
i Li &lt;<a href=3D"mailto:liweiwei@iscas.ac.cn">liweiwei@iscas.ac.cn</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
=E5=9C=A8 2022/2/11 =E4=B8=8A=E5=8D=8812:34, Christoph Muellner =E5=86=99=
=E9=81=93:<br>
&gt; The RISC-V base cache management operation ISA extension has been<br>
&gt; ratified [1]. This patch adds support for the defined instructions.<br=
>
&gt;<br>
&gt; The cmo.prefetch instructions are nops for QEMU (no emulation of the m=
emory<br>
&gt; hierarchy, no illegal instructions, no permission faults, no traps),<b=
r>
&gt; therefore there&#39;s only a comment where they would be decoded.<br>
&gt;<br>
&gt; The other cbo* instructions are moved into an overlap group to<br>
&gt; resolve the overlapping pattern with the LQ instruction.<br>
&gt; The cbo.zero zeros a configurable amount of bytes.<br>
&gt; Similar to other extensions (e.g. atomic instructions),<br>
&gt; the trap behavior is limited such, that only the page permissions<br>
&gt; are checked (ignoring other optional protection mechanisms like<br>
&gt; PMA or PMP).<br>
&gt;<br>
&gt; [1] <a href=3D"https://wiki.riscv.org/display/TECH/Recently+Ratified+E=
xtensions" rel=3D"noreferrer" target=3D"_blank">https://wiki.riscv.org/disp=
lay/TECH/Recently+Ratified+Extensions</a><br>
&gt;<br>
&gt; v3:<br>
&gt; - Enable by default (like zb*)<br>
&gt; - Rename flags Zicbo* -&gt; zicbo* (like zb*)<br>
&gt; - Rename ext_zicbo* -&gt; ext_icbo* (like ext_icsr)<br>
&gt; - Rename trans_zicbo.c.inc -&gt; trans_rvzicbo.c.inc (like all others)=
<br>
&gt; - Simplify prefetch instruction support to a single comment<br>
&gt; - Rebase on top of github-alistair23/riscv-to-apply.next plus the<br>
&gt;=C2=A0 =C2=A0 Priv v1.12 series from github-atishp04/priv_1_12_support_=
v3<br>
&gt;<br>
&gt; v2:<br>
&gt; - Fix overlapping instruction encoding with LQ instructions<br>
&gt; - Drop CSR related changes and rebase on Priv 1.12 patchset<br>
&gt;<br>
&gt; Co-developed-by: Philipp Tomsich &lt;<a href=3D"mailto:philipp.tomsich=
@vrull.eu" target=3D"_blank">philipp.tomsich@vrull.eu</a>&gt;<br>
&gt; Signed-off-by: Christoph Muellner &lt;<a href=3D"mailto:cmuellner@linu=
x.com" target=3D"_blank">cmuellner@linux.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +<br>
&gt;=C2=A0 =C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +<br>
&gt;=C2=A0 =C2=A0target/riscv/helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 ++<br>
&gt;=C2=A0 =C2=A0target/riscv/insn32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 16 +++-<br>
&gt;=C2=A0 =C2=A0target/riscv/insn_trans/trans_rvzicbo.c.inc | 57 +++++++++=
++++<br>
&gt;=C2=A0 =C2=A0target/riscv/op_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 94 +++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A07 files changed, 178 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 target/riscv/insn_trans/trans_rvzicbo.c=
.inc<br>
&gt;<br>
&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; index 39ffb883fc..cbd0a34318 100644<br>
&gt; --- a/target/riscv/cpu.c<br>
&gt; +++ b/target/riscv/cpu.c<br>
&gt; @@ -764,6 +764,9 @@ static Property riscv_cpu_properties[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Counters&quot;, RISCV=
CPU, cfg.ext_counters, true),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zifencei&quot;, RISCV=
CPU, cfg.ext_ifencei, true),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zicsr&quot;, RISCVCPU=
, cfg.ext_icsr, true),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;zicbom&quot;, RISCVCPU, cfg.ext_=
icbom, true),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;zicboz&quot;, RISCVCPU, cfg.ext_=
icboz, true),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT16(&quot;cbozlen&quot;, RISCVCPU, cfg.c=
bozlen, 64),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zfh&quot;, RISCVCPU, =
cfg.ext_zfh, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zfhmin&quot;, RISCVCP=
U, cfg.ext_zfhmin, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zve32f&quot;, RISCVCP=
U, cfg.ext_zve32f, false),<br>
&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; index fe80caeec0..7bd2fd26d6 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -368,6 +368,8 @@ struct RISCVCPUConfig {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_counters;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_ifencei;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_icsr;<br>
&gt; +=C2=A0 =C2=A0 bool ext_icbom;<br>
&gt; +=C2=A0 =C2=A0 bool ext_icboz;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_zfh;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_zfhmin;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_zve32f;<br>
&gt; @@ -382,6 +384,7 @@ struct RISCVCPUConfig {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0char *vext_spec;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint16_t vlen;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint16_t elen;<br>
&gt; +=C2=A0 =C2=A0 uint16_t cbozlen;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool mmu;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool pmp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool epmp;<br>
&gt; diff --git a/target/riscv/helper.h b/target/riscv/helper.h<br>
&gt; index 72cc2582f4..ef1944da8f 100644<br>
&gt; --- a/target/riscv/helper.h<br>
&gt; +++ b/target/riscv/helper.h<br>
&gt; @@ -92,6 +92,11 @@ DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, =
env, tl)<br>
&gt;=C2=A0 =C2=A0DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, t=
l)<br>
&gt;=C2=A0 =C2=A0DEF_HELPER_FLAGS_1(fclass_h, TCG_CALL_NO_RWG_SE, tl, i64)<=
br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/* Cache-block operations */<br>
&gt; +DEF_HELPER_2(cbo_clean_flush, void, env, tl)<br>
&gt; +DEF_HELPER_2(cbo_inval, void, env, tl)<br>
&gt; +DEF_HELPER_2(cbo_zero, void, env, tl)<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0/* Special functions */<br>
&gt;=C2=A0 =C2=A0DEF_HELPER_2(csrr, tl, env, int)<br>
&gt;=C2=A0 =C2=A0DEF_HELPER_3(csrw, void, env, int, tl)<br>
&gt; diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode<b=
r>
&gt; index 5bbedc254c..d5f8329970 100644<br>
&gt; --- a/target/riscv/insn32.decode<br>
&gt; +++ b/target/riscv/insn32.decode<br>
&gt; @@ -128,6 +128,7 @@ addi=C2=A0 =C2=A0 =C2=A0............=C2=A0 =C2=A0 =
=C2=A0..... 000 ..... 0010011 @i<br>
&gt;=C2=A0 =C2=A0slti=C2=A0 =C2=A0 =C2=A0............=C2=A0 =C2=A0 =C2=A0..=
... 010 ..... 0010011 @i<br>
&gt;=C2=A0 =C2=A0sltiu=C2=A0 =C2=A0 ............=C2=A0 =C2=A0 =C2=A0..... 0=
11 ..... 0010011 @i<br>
&gt;=C2=A0 =C2=A0xori=C2=A0 =C2=A0 =C2=A0............=C2=A0 =C2=A0 =C2=A0..=
... 100 ..... 0010011 @i<br>
&gt; +# cbo.prefetch_{i,r,m} instructions are ori with rd=3Dx0 and not deco=
ded.<br>
&gt;=C2=A0 =C2=A0ori=C2=A0 =C2=A0 =C2=A0 ............=C2=A0 =C2=A0 =C2=A0..=
... 110 ..... 0010011 @i<br>
&gt;=C2=A0 =C2=A0andi=C2=A0 =C2=A0 =C2=A0............=C2=A0 =C2=A0 =C2=A0..=
... 111 ..... 0010011 @i<br>
&gt;=C2=A0 =C2=A0slli=C2=A0 =C2=A0 =C2=A000000. ......=C2=A0 =C2=A0 ..... 0=
01 ..... 0010011 @sh<br>
&gt; @@ -168,7 +169,20 @@ sraw=C2=A0 =C2=A0 =C2=A00100000 .....=C2=A0 .....=
 101 ..... 0111011 @r<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# *** RV128I Base Instruction Set (in addition to RV64I) *=
**<br>
&gt;=C2=A0 =C2=A0ldu=C2=A0 =C2=A0 =C2=A0 ............=C2=A0 =C2=A0..... 111=
 ..... 0000011 @i<br>
&gt; -lq=C2=A0 =C2=A0 =C2=A0 =C2=A0............=C2=A0 =C2=A0..... 010 .....=
 0001111 @i<br>
&gt; +{<br>
&gt; +=C2=A0 [<br>
&gt; +=C2=A0 =C2=A0 # *** RV32 Zicbom Standard Extension ***<br>
&gt; +=C2=A0 =C2=A0 cbo_clean=C2=A0 0000000 00001 ..... 010 00000 0001111 @=
sfence_vm<br>
&gt; +=C2=A0 =C2=A0 cbo_flush=C2=A0 0000000 00010 ..... 010 00000 0001111 @=
sfence_vm<br>
&gt; +=C2=A0 =C2=A0 cbo_inval=C2=A0 0000000 00000 ..... 010 00000 0001111 @=
sfence_vm<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # *** RV32 Zicboz Standard Extension ***<br>
&gt; +=C2=A0 =C2=A0 cbo_zero=C2=A0 =C2=A00000000 00100 ..... 010 00000 0001=
111 @sfence_vm<br>
&gt; +=C2=A0 ]<br>
&gt; +<br>
&gt; +=C2=A0 # *** RVI128 lq ***<br>
&gt; +=C2=A0 lq=C2=A0 =C2=A0 =C2=A0 =C2=A0............=C2=A0 =C2=A0..... 01=
0 ..... 0001111 @i<br>
&gt; +}<br>
&gt;=C2=A0 =C2=A0sq=C2=A0 =C2=A0 =C2=A0 =C2=A0............=C2=A0 =C2=A0....=
. 100 ..... 0100011 @s<br>
&gt;=C2=A0 =C2=A0addid=C2=A0 =C2=A0 ............=C2=A0 .....=C2=A0 000 ....=
. 1011011 @i<br>
&gt;=C2=A0 =C2=A0sllid=C2=A0 =C2=A0 000000 ......=C2=A0 ..... 001 ..... 101=
1011 @sh6<br>
&gt; diff --git a/target/riscv/insn_trans/trans_rvzicbo.c.inc b/target/risc=
v/insn_trans/trans_rvzicbo.c.inc<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..35c277261f<br>
&gt; --- /dev/null<br>
&gt; +++ b/target/riscv/insn_trans/trans_rvzicbo.c.inc<br>
&gt; @@ -0,0 +1,57 @@<br>
&gt; +/*<br>
&gt; + * RISC-V translation routines for the RISC-V CBO Extension.<br>
&gt; + *<br>
&gt; + * Copyright (c) 2021 Philipp Tomsich, <a href=3D"mailto:philipp.toms=
ich@vrull.eu" target=3D"_blank">philipp.tomsich@vrull.eu</a><br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy it<br>
&gt; + * under the terms and conditions of the GNU General Public License,<=
br>
&gt; + * version 2 or later, as published by the Free Software Foundation.<=
br>
&gt; + *<br>
&gt; + * This program is distributed in the hope it will be useful, but WIT=
HOUT<br>
&gt; + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY=
 or<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Public=
 License for<br>
&gt; + * more details.<br>
&gt; + *<br>
&gt; + * You should have received a copy of the GNU General Public License =
along with<br>
&gt; + * this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu.org/=
licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses=
/</a>&gt;.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#define REQUIRE_ZICBOM(ctx) do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 if (!RISCV_CPU(ctx-&gt;cs)-&gt;cfg.ext_icbom) {=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +} while (0)<br>
&gt; +<br>
It&#39;s better to use ctx-&gt;cfg_ptr-&gt;ext_icbom instead.<br></blockquo=
te><div><br></div><div>Ok.</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
&gt; +#define REQUIRE_ZICBOZ(ctx) do {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br>
&gt; +=C2=A0 =C2=A0 if (!RISCV_CPU(ctx-&gt;cs)-&gt;cfg.ext_icboz) {=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +} while (0)<br>
&gt; +<br>
&gt; +static bool trans_cbo_clean(DisasContext *ctx, arg_cbo_clean *a)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 REQUIRE_ZICBOM(ctx);<br>
&gt; +=C2=A0 =C2=A0 gen_helper_cbo_clean_flush(cpu_env, cpu_gpr[a-&gt;rs1])=
;<br>
&gt; +=C2=A0 =C2=A0 return true;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool trans_cbo_flush(DisasContext *ctx, arg_cbo_flush *a)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 REQUIRE_ZICBOM(ctx);<br>
&gt; +=C2=A0 =C2=A0 gen_helper_cbo_clean_flush(cpu_env, cpu_gpr[a-&gt;rs1])=
;<br>
&gt; +=C2=A0 =C2=A0 return true;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool trans_cbo_inval(DisasContext *ctx, arg_cbo_inval *a)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 REQUIRE_ZICBOM(ctx);<br>
&gt; +=C2=A0 =C2=A0 gen_helper_cbo_inval(cpu_env, cpu_gpr[a-&gt;rs1]);<br>
&gt; +=C2=A0 =C2=A0 return true;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool trans_cbo_zero(DisasContext *ctx, arg_cbo_zero *a)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 REQUIRE_ZICBOZ(ctx);<br>
&gt; +=C2=A0 =C2=A0 gen_helper_cbo_zero(cpu_env, cpu_gpr[a-&gt;rs1]);<br>
&gt; +=C2=A0 =C2=A0 return true;<br>
&gt; +}<br>
&gt; diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c<br>
&gt; index 1a75ba11e6..21762bc2e0 100644<br>
&gt; --- a/target/riscv/op_helper.c<br>
&gt; +++ b/target/riscv/op_helper.c<br>
&gt; @@ -3,6 +3,7 @@<br>
&gt;=C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 * Copyright (c) 2016-2017 Sagar Karandikar, <a href=3D"ma=
ilto:sagark@eecs.berkeley.edu" target=3D"_blank">sagark@eecs.berkeley.edu</=
a><br>
&gt;=C2=A0 =C2=A0 * Copyright (c) 2017-2018 SiFive, Inc.<br>
&gt; + * Copyright (c) 2022=C2=A0 =C2=A0 =C2=A0 VRULL GmbH<br>
&gt;=C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 * This program is free software; you can redistribute it =
and/or modify it<br>
&gt;=C2=A0 =C2=A0 * under the terms and conditions of the GNU General Publi=
c License,<br>
&gt; @@ -114,6 +115,99 @@ target_ulong helper_csrrw_i128(CPURISCVState *env=
, int csr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return int128_getlo(rv);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +<br>
&gt; +/* helper_zicbo_envcfg<br>
&gt; + *<br>
&gt; + * Raise virtual exceptions and illegal instruction exceptions for<br=
>
&gt; + * Zicbo[mz] instructions based on the settings of [mhs]envcfg as<br>
&gt; + * specified in section 2.5.1 of the CMO specification.<br>
&gt; + */<br>
&gt; +static void helper_zicbo_envcfg(CPURISCVState *env, target_ulong envb=
its,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uintptr_t ra)<br>
&gt; +{<br>
&gt; +#ifndef CONFIG_USER_ONLY<br>
&gt; +=C2=A0 =C2=A0 /* Check for virtual instruction exceptions first, as w=
e don&#39;t see<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* VU and VS reflected in env-&gt;priv (these are =
just the translated<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* U and S stated with virtualisation enabled.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if (riscv_cpu_virt_enabled(env) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (((env-&gt;priv &lt; PRV_H) &amp;&amp; !g=
et_field(env-&gt;henvcfg, envbits)) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((env-&gt;priv &lt; PRV_S) &amp;&am=
p; !get_field(env-&gt;senvcfg, envbits)))) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_raise_exception(env, RISCV_EXCP_VIR=
T_INSTRUCTION_FAULT, ra);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (((env-&gt;priv &lt; PRV_M) &amp;&amp; !get_field(en=
v-&gt;menvcfg, envbits)) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((env-&gt;priv &lt; PRV_S) &amp;&amp; !ge=
t_field(env-&gt;senvcfg, envbits))) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_raise_exception(env, RISCV_EXCP_ILL=
EGAL_INST, ra);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +#endif<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* helper_zicbom_access<br>
&gt; + *<br>
&gt; + * Check access permissions (LOAD, STORE or FETCH as specified in sec=
tion<br>
&gt; + * 2.5.2 of the CMO specification) for Zicbom, raising either store<b=
r>
&gt; + * page-fault (non-virtualised) or store guest-page fault (virtualise=
d).<br>
&gt; + */<br>
&gt; +static void helper_zicbom_access(CPURISCVState *env, target_ulong add=
ress,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t ra)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 void* phost;<br>
&gt; +=C2=A0 =C2=A0 int ret =3D TLB_INVALID_MASK;<br>
&gt; +=C2=A0 =C2=A0 MMUAccessType access_type =3D MMU_DATA_LOAD;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 while (ret =3D=3D TLB_INVALID_MASK &amp;&amp; access_ty=
pe &lt;=3D MMU_INST_FETCH) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D probe_access_flags(env, address, =
access_type++,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_mmu_index(env, false),=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0true, &amp;phost, ra);<br>
<br>
Using probe_access_flags here will make the size of=C2=A0=C2=A0 pmp check f=
or <br>
final physical address to be zero.<br></blockquote><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><br>
Maybe it&#39;s better to use probe_access with cbozlen as size and address =
<br>
aligned to cbozlen.<br>
<br></blockquote><div><br></div><div><div>The current API let&#39;s me to d=
ecide between:</div><div>*=C2=A0probe_access() -&gt; implies nonfault=C2=A0=
=3D=3D false (-&gt; no control over the faults)</div><div>*=C2=A0probe_acce=
ss_flags() -&gt; implies size =3D=3D 0 (-&gt; access to the whole page)<br>=
</div><div><br></div><div>The size value is indeed forwarded to=C2=A0pmp_ha=
rt_has_privs(), but there is a comment, which states:</div><div>=C2=A0=C2=
=A0If size is unknown (0), assume that all bytes=C2=A0from addr to the end =
of the page will be accessed.</div><div>...and the code below does:</div><d=
iv>=C2=A0 pmp_size =3D -(addr | TARGET_PAGE_MASK);</div><div><br></div><div=
>So, indeed we might raise a PMP error outside of the cache line.</div><div=
><br></div><div>Given the API restriction, I&#39;ll do the following:</div>=
<div>* Add a new call probe_access_flags_with_size()</div><div>* Introduce=
=C2=A0a cbom block size env variable similar to cbozlen.</div><div><br></di=
v><div>=C2=A0=C2=A0<br></div></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (ret =3D=3D TLB_INVALID_MASK) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t exc =3D RISCV_EXCP_STORE_PAGE_FA=
ULT;<br>
&gt; +<br>
&gt; +#ifndef CONFIG_USER_ONLY<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* User-mode emulation does not have virt=
ualisation. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (riscv_cpu_virt_enabled(env)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exc =3D RISCV_EXCP_STORE_GU=
EST_AMO_ACCESS_FAULT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 riscv_raise_exception(env, exc, ra);<br>
<br>
If pmp violation triggers, the exception type should be <br>
RISCV_EXCP_STORE_AMO_ACCESS_FAULT.<br></blockquote><div><br></div><div>The =
probe_access*() API does not allow distinguishing different reasons for a t=
ranslation error (we just get=C2=A0TLB_INVALID_MASK).</div><div>Looking int=
o the details of the current PMP implementation in QEMU, I agree that trans=
lation errors could be analysed in more detail.</div><div>...</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">And It seems tha=
t not all exception triggered when virtualisation is <br>
enabled is guest page fault(RISCV_EXCP_STORE_GUEST_*_ACCESS_FAULT) .=C2=A0 =
<br>
The exception triggered in first stage(G-Stage) is normal page fault.<br></=
blockquote><div><br></div><div>...here we have the same issue:</div><div>Th=
e probe_access*() calls don&#39;t provide the necessary details of the tran=
slation error.</div><div>And the RISC-V backend does not provide convenient=
 APIs to get better information.</div><div><br></div><div>However, looking =
at target/riscv/cpu_helper.c, I can see that the function=C2=A0raise_mmu_ex=
ception()</div><div>creates exactly the faults that we need for access_type=
=3D=3DMMU_DATA_STORE.</div><div><br></div><div>Based on that, here is how I=
 intend to solve the issue:</div><div>* change the probe_access_flags() loo=
p as mentioned above</div><div>* in the error-paths (if ret =3D=3D TLB_INVA=
LID_MASK): call probe_access(STORE, nonfault=3Dfalse) to create the correct=
 exception</div><div>=C2=A0<br></div><div>Thanks,</div><div>Christoph</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +void helper_cbo_clean_flush(CPURISCVState *env, target_ulong address)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uintptr_t ra =3D GETPC();<br>
&gt; +=C2=A0 =C2=A0 helper_zicbo_envcfg(env, MENVCFG_CBCFE, ra);<br>
&gt; +=C2=A0 =C2=A0 helper_zicbom_access(env, address, ra);<br>
&gt; +}<br>
&gt; +<br>
&gt; +void helper_cbo_inval(CPURISCVState *env, target_ulong address)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uintptr_t ra =3D GETPC();<br>
&gt; +=C2=A0 =C2=A0 helper_zicbo_envcfg(env, MENVCFG_CBIE, ra);<br>
&gt; +=C2=A0 =C2=A0 helper_zicbom_access(env, address, ra);<br>
&gt; +}<br>
&gt; +<br>
&gt; +void helper_cbo_zero(CPURISCVState *env, target_ulong address)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uintptr_t ra =3D GETPC();<br>
&gt; +=C2=A0 =C2=A0 helper_zicbo_envcfg(env, MENVCFG_CBZE, ra);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Get the size of the cache block for zero instruction=
s. */<br>
&gt; +=C2=A0 =C2=A0 RISCVCPU *cpu =3D env_archcpu(env);<br>
&gt; +=C2=A0 =C2=A0 uint16_t cbozlen =3D cpu-&gt;cfg.cbozlen;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Mask off low-bits to align-down to the cache-block. =
*/<br>
&gt; +=C2=A0 =C2=A0 address &amp;=3D ~(cbozlen - 1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 void* mem =3D probe_access(env, address, cbozlen, MMU_D=
ATA_STORE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_mmu_index(env, false), GETPC());<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Zero the block */<br>
&gt; +=C2=A0 =C2=A0 memset(mem, 0, cbozlen);<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0#ifndef CONFIG_USER_ONLY<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0target_ulong helper_sret(CPURISCVState *env)<br>
&gt; diff --git a/target/riscv/translate.c b/target/riscv/translate.c<br>
&gt; index eaf5a72c81..0ee2ce85ec 100644<br>
&gt; --- a/target/riscv/translate.c<br>
&gt; +++ b/target/riscv/translate.c<br>
&gt; @@ -861,6 +861,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase=
, target_ulong pc)<br>
&gt;=C2=A0 =C2=A0#include &quot;insn_trans/trans_rvv.c.inc&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;insn_trans/trans_rvb.c.inc&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;insn_trans/trans_rvzfh.c.inc&quot;<br>
&gt; +#include &quot;insn_trans/trans_rvzicbo.c.inc&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;insn_trans/trans_privileged.c.inc&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;insn_trans/trans_xventanacondops.c.inc&quot=
;<br>
&gt;=C2=A0 =C2=A0<br>
</blockquote></div></div>

--0000000000007e82b205d822f36f--

