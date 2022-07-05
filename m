Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o8dLD-00020Z-Lr
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jul 2022 03:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o8dLC-0001yG-8r
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 03:51:26 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:42907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o8dLA-0005gA-6Y
 for qemu-riscv@nongnu.org; Tue, 05 Jul 2022 03:51:26 -0400
Received: by mail-pf1-x430.google.com with SMTP id b7so306629pfb.9
 for <qemu-riscv@nongnu.org>; Tue, 05 Jul 2022 00:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=S+suXfw+4t6v8+M3Im1Eo7yuKOZxUF1ozysWVDnppXQ=;
 b=6OleI1Xxzi21iiiwqYZ0CUjuqVDCLkxqy9CxgNI6QGx4Yhs+j+N623ZHhq/kEhI6s/
 7iblAVSfkoNlwIisPbaFWLtsZPMCVXHeK5tEdo/svShBTi2UVcNA7x/Mm4OLWs7Pt4l4
 FkY3AgICAPXWgQTbbcA+IT0vcUrw+0KnEMiqrYMx0zYVFg2Gzbdv300yNbIynGaluKLF
 QjOCe3j8yognaeItjTzqil/XDpDH6fsF++a2lyYMAP7aRl9GmJb4KLUUN+RCERvwatrn
 /FKMNm3nlXDRX2C7swg3TwJUmd4P6J7/tj89NoxiVweRXHki2SjHipnpkEnfTJMrDKs7
 W2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=S+suXfw+4t6v8+M3Im1Eo7yuKOZxUF1ozysWVDnppXQ=;
 b=5jDWE7G0K7sRvywqyGA/KCt6NOcqKGXDPJYzTA7voyNMwKK3K0XQlHnAYnGHw4Gq/z
 sldZsW2ER8ZZYDbk7M+p7aoFY4CCWje78kpcCAijTAOHUCpjDqoJZcuu0LKFvjxV3cmM
 4bV/s9EHEfxo6lWZ7F38ddbb3ReZyB5Ab7XKFsUNfl2io3F1/CjHZELIKC6Bg0ppYRJ0
 hpEkG00aRIyHGUh9SgjFncoFHSNro0VBoVN1GeJ2gGVJSvWSTuF1xwM3iwaSyWN9dz9a
 PIEu7jN3iCJesYP72X1VtemMPGR9UpDIZq6mMQF7do8ZlzX76sYNEBA7pxhE4omX3b7S
 OfSw==
X-Gm-Message-State: AJIora+3Nq36Sf0PEMfITBMBa3+ZUe40pMZJXHUt3pKDhXL4gY5dtpkB
 LqwzOQV1zq4r9wj1sC+QLsCROiBZsi20+uYfVm1Fnw==
X-Google-Smtp-Source: AGRyM1v+xOGgx0jIz0rd+/PZxxUYeHGIo6ywrNgLXGjSB32Km8hmW4F2XhBkIpOyNlhU3Vc9TGQ8uaF+op+9DV7L39o=
X-Received: by 2002:a05:6a00:811:b0:525:50c2:4c2f with SMTP id
 m17-20020a056a00081100b0052550c24c2fmr40967139pfk.62.1657007482793; Tue, 05
 Jul 2022 00:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220620231603.2547260-1-atishp@rivosinc.com>
 <20220620231603.2547260-5-atishp@rivosinc.com>
 <f9b33706-4630-1f9b-a190-29e64d630e0a@iscas.ac.cn>
 <be29c8d6-9099-70cf-6a7c-d1ab0dba066d@iscas.ac.cn>
In-Reply-To: <be29c8d6-9099-70cf-6a7c-d1ab0dba066d@iscas.ac.cn>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 5 Jul 2022 00:51:12 -0700
Message-ID: <CAHBxVyF7GfA+Mk=nA9Lss76xAQ5YdwLkvN=g+bxKjFe9JyatKw@mail.gmail.com>
Subject: Re: [PATCH v10 04/12] target/riscv: pmu: Make number of counters
 configurable
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bmeng.cn@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=atishp@rivosinc.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 05 Jul 2022 07:51:26 -0000

On Mon, Jul 4, 2022 at 5:38 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>
> =E5=9C=A8 2022/7/4 =E4=B8=8B=E5=8D=8811:26, Weiwei Li =E5=86=99=E9=81=93:
> >
> > =E5=9C=A8 2022/6/21 =E4=B8=8A=E5=8D=887:15, Atish Patra =E5=86=99=E9=81=
=93:
> >> The RISC-V privilege specification provides flexibility to implement
> >> any number of counters from 29 programmable counters. However, the QEM=
U
> >> implements all the counters.
> >>
> >> Make it configurable through pmu config parameter which now will
> >> indicate
> >> how many programmable counters should be implemented by the cpu.
> >>
> >> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> >> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> >> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> >> ---
> >>   target/riscv/cpu.c |  3 +-
> >>   target/riscv/cpu.h |  2 +-
> >>   target/riscv/csr.c | 94 ++++++++++++++++++++++++++++++--------------=
--
> >>   3 files changed, 63 insertions(+), 36 deletions(-)
> >>
> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> index 1b57b3c43980..d12c6dc630ca 100644
> >> --- a/target/riscv/cpu.c
> >> +++ b/target/riscv/cpu.c
> >> @@ -851,7 +851,6 @@ static void riscv_cpu_init(Object *obj)
> >>   {
> >>       RISCVCPU *cpu =3D RISCV_CPU(obj);
> >>   -    cpu->cfg.ext_pmu =3D true;
> >>       cpu->cfg.ext_ifencei =3D true;
> >>       cpu->cfg.ext_icsr =3D true;
> >>       cpu->cfg.mmu =3D true;
> >> @@ -879,7 +878,7 @@ static Property riscv_cpu_extensions[] =3D {
> >>       DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
> >>       DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
> >>       DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
> >> -    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
> >> +    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
> >
> > I think It's better to add  a check on cfg.pmu_num to  <=3D 29.
> >
> OK, I find this check in the following patch.
> >>       DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> >>       DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> >>       DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> >> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> >> index 252c30a55d78..ffee54ea5c27 100644
> >> --- a/target/riscv/cpu.h
> >> +++ b/target/riscv/cpu.h
> >> @@ -397,7 +397,6 @@ struct RISCVCPUConfig {
> >>       bool ext_zksed;
> >>       bool ext_zksh;
> >>       bool ext_zkt;
> >> -    bool ext_pmu;
> >>       bool ext_ifencei;
> >>       bool ext_icsr;
> >>       bool ext_svinval;
> >> @@ -421,6 +420,7 @@ struct RISCVCPUConfig {
> >>       /* Vendor-specific custom extensions */
> >>       bool ext_XVentanaCondOps;
> >>   +    uint8_t pmu_num;
> >>       char *priv_spec;
> >>       char *user_spec;
> >>       char *bext_spec;
> >> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> >> index 0ca05c77883c..b4a8e15f498f 100644
> >> --- a/target/riscv/csr.c
> >> +++ b/target/riscv/csr.c
> >> @@ -73,9 +73,17 @@ static RISCVException ctr(CPURISCVState *env, int
> >> csrno)
> >>       CPUState *cs =3D env_cpu(env);
> >>       RISCVCPU *cpu =3D RISCV_CPU(cs);
> >>       int ctr_index;
> >> +    int base_csrno =3D CSR_HPMCOUNTER3;
> >> +    bool rv32 =3D riscv_cpu_mxl(env) =3D=3D MXL_RV32 ? true : false;
> >>   -    if (!cpu->cfg.ext_pmu) {
> >> -        /* The PMU extension is not enabled */
> >> +    if (rv32 && csrno >=3D CSR_CYCLEH) {
> >> +        /* Offset for RV32 hpmcounternh counters */
> >> +        base_csrno +=3D 0x80;
> >> +    }
> >> +    ctr_index =3D csrno - base_csrno;
> >> +
> >> +    if (!cpu->cfg.pmu_num || ctr_index >=3D (cpu->cfg.pmu_num)) {
> >> +        /* No counter is enabled in PMU or the counter is out of
> >> range */
> >
> > I seems unnecessary to add '!cpu->cfg.pmu_num ' here, 'ctr_index >=3D
> > (cpu->cfg.pmu_num)' is true

The check is improved in the following patches as well.

> Typo.  I -> It
> >
> > when cpu->cfg.pmu_num is zero if the problem for base_csrno is fixed.
> >
> > Ragards,
> >
> > Weiwei Li
> >
> >>           return RISCV_EXCP_ILLEGAL_INST;
> >>       }
> >>   @@ -103,7 +111,7 @@ static RISCVException ctr(CPURISCVState *env,
> >> int csrno)
> >>               }
> >>               break;
> >>           }
> >> -        if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
> >> +        if (rv32) {
> >>               switch (csrno) {
> >>               case CSR_CYCLEH:
> >>                   if (!get_field(env->mcounteren, COUNTEREN_CY)) {
> >> @@ -158,7 +166,7 @@ static RISCVException ctr(CPURISCVState *env, int
> >> csrno)
> >>               }
> >>               break;
> >>           }
> >> -        if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
> >> +        if (rv32) {
> >>               switch (csrno) {
> >>               case CSR_CYCLEH:
> >>                   if (!get_field(env->hcounteren, COUNTEREN_CY) &&
> >> @@ -202,6 +210,26 @@ static RISCVException ctr32(CPURISCVState *env,
> >> int csrno)
> >>   }
> >>     #if !defined(CONFIG_USER_ONLY)
> >> +static RISCVException mctr(CPURISCVState *env, int csrno)
> >> +{
> >> +    CPUState *cs =3D env_cpu(env);
> >> +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> >> +    int ctr_index;
> >> +    int base_csrno =3D CSR_MHPMCOUNTER3;
> >> +
> >> +    if ((riscv_cpu_mxl(env) =3D=3D MXL_RV32) && csrno >=3D CSR_MCYCLE=
H) {
> >> +        /* Offset for RV32 mhpmcounternh counters */
> >> +        base_csrno +=3D 0x80;
> >> +    }
> >> +    ctr_index =3D csrno - base_csrno;
> >> +    if (!cpu->cfg.pmu_num || ctr_index >=3D cpu->cfg.pmu_num) {
> >> +        /* The PMU is not enabled or counter is out of range*/
> >> +        return RISCV_EXCP_ILLEGAL_INST;
> >> +    }
> >> +
> >> +    return RISCV_EXCP_NONE;
> >> +}
> >> +
> >>   static RISCVException any(CPURISCVState *env, int csrno)
> >>   {
> >>       return RISCV_EXCP_NONE;
> >> @@ -3687,35 +3715,35 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =
=3D {
> >>       [CSR_HPMCOUNTER30]   =3D { "hpmcounter30",   ctr, read_zero },
> >>       [CSR_HPMCOUNTER31]   =3D { "hpmcounter31",   ctr, read_zero },
> >>   -    [CSR_MHPMCOUNTER3]   =3D { "mhpmcounter3",   any, read_zero },
> >> -    [CSR_MHPMCOUNTER4]   =3D { "mhpmcounter4",   any, read_zero },
> >> -    [CSR_MHPMCOUNTER5]   =3D { "mhpmcounter5",   any, read_zero },
> >> -    [CSR_MHPMCOUNTER6]   =3D { "mhpmcounter6",   any, read_zero },
> >> -    [CSR_MHPMCOUNTER7]   =3D { "mhpmcounter7",   any, read_zero },
> >> -    [CSR_MHPMCOUNTER8]   =3D { "mhpmcounter8",   any, read_zero },
> >> -    [CSR_MHPMCOUNTER9]   =3D { "mhpmcounter9",   any, read_zero },
> >> -    [CSR_MHPMCOUNTER10]  =3D { "mhpmcounter10",  any, read_zero },
> >> -    [CSR_MHPMCOUNTER11]  =3D { "mhpmcounter11",  any, read_zero },
> >> -    [CSR_MHPMCOUNTER12]  =3D { "mhpmcounter12",  any, read_zero },
> >> -    [CSR_MHPMCOUNTER13]  =3D { "mhpmcounter13",  any, read_zero },
> >> -    [CSR_MHPMCOUNTER14]  =3D { "mhpmcounter14",  any, read_zero },
> >> -    [CSR_MHPMCOUNTER15]  =3D { "mhpmcounter15",  any, read_zero },
> >> -    [CSR_MHPMCOUNTER16]  =3D { "mhpmcounter16",  any, read_zero },
> >> -    [CSR_MHPMCOUNTER17]  =3D { "mhpmcounter17",  any, read_zero },
> >> -    [CSR_MHPMCOUNTER18]  =3D { "mhpmcounter18",  any, read_zero },
> >> -    [CSR_MHPMCOUNTER19]  =3D { "mhpmcounter19",  any, read_zero },
> >> -    [CSR_MHPMCOUNTER20]  =3D { "mhpmcounter20",  any, read_zero },
> >> -    [CSR_MHPMCOUNTER21]  =3D { "mhpmcounter21",  any, read_zero },
> >> -    [CSR_MHPMCOUNTER22]  =3D { "mhpmcounter22",  any, read_zero },
> >> -    [CSR_MHPMCOUNTER23]  =3D { "mhpmcounter23",  any, read_zero },
> >> -    [CSR_MHPMCOUNTER24]  =3D { "mhpmcounter24",  any, read_zero },
> >> -    [CSR_MHPMCOUNTER25]  =3D { "mhpmcounter25",  any, read_zero },
> >> -    [CSR_MHPMCOUNTER26]  =3D { "mhpmcounter26",  any, read_zero },
> >> -    [CSR_MHPMCOUNTER27]  =3D { "mhpmcounter27",  any, read_zero },
> >> -    [CSR_MHPMCOUNTER28]  =3D { "mhpmcounter28",  any, read_zero },
> >> -    [CSR_MHPMCOUNTER29]  =3D { "mhpmcounter29",  any, read_zero },
> >> -    [CSR_MHPMCOUNTER30]  =3D { "mhpmcounter30",  any, read_zero },
> >> -    [CSR_MHPMCOUNTER31]  =3D { "mhpmcounter31",  any, read_zero },
> >> +    [CSR_MHPMCOUNTER3]   =3D { "mhpmcounter3",   mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER4]   =3D { "mhpmcounter4",   mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER5]   =3D { "mhpmcounter5",   mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER6]   =3D { "mhpmcounter6",   mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER7]   =3D { "mhpmcounter7",   mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER8]   =3D { "mhpmcounter8",   mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER9]   =3D { "mhpmcounter9",   mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER10]  =3D { "mhpmcounter10",  mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER11]  =3D { "mhpmcounter11",  mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER12]  =3D { "mhpmcounter12",  mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER13]  =3D { "mhpmcounter13",  mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER14]  =3D { "mhpmcounter14",  mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER15]  =3D { "mhpmcounter15",  mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER16]  =3D { "mhpmcounter16",  mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER17]  =3D { "mhpmcounter17",  mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER18]  =3D { "mhpmcounter18",  mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER19]  =3D { "mhpmcounter19",  mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER20]  =3D { "mhpmcounter20",  mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER21]  =3D { "mhpmcounter21",  mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER22]  =3D { "mhpmcounter22",  mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER23]  =3D { "mhpmcounter23",  mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER24]  =3D { "mhpmcounter24",  mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER25]  =3D { "mhpmcounter25",  mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER26]  =3D { "mhpmcounter26",  mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER27]  =3D { "mhpmcounter27",  mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER28]  =3D { "mhpmcounter28",  mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER29]  =3D { "mhpmcounter29",  mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER30]  =3D { "mhpmcounter30",  mctr, read_zero },
> >> +    [CSR_MHPMCOUNTER31]  =3D { "mhpmcounter31",  mctr, read_zero },
> >>         [CSR_MHPMEVENT3]     =3D { "mhpmevent3",     any, read_zero },
> >>       [CSR_MHPMEVENT4]     =3D { "mhpmevent4",     any, read_zero },
> >
>

