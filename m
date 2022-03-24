Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nXJ7d-0002ih-8l
	for mharc-qemu-riscv@gnu.org; Thu, 24 Mar 2022 04:47:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nXJ7V-0002eC-N2
 for qemu-riscv@nongnu.org; Thu, 24 Mar 2022 04:47:02 -0400
Received: from [2a00:1450:4864:20::134] (port=42689
 helo=mail-lf1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1nXJ7R-0001Hf-NQ
 for qemu-riscv@nongnu.org; Thu, 24 Mar 2022 04:47:01 -0400
Received: by mail-lf1-x134.google.com with SMTP id d5so6834588lfj.9
 for <qemu-riscv@nongnu.org>; Thu, 24 Mar 2022 01:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BQiyIslLq3E90bdrVOTzKhGW/chrmrz2mLNk3C0Pxu4=;
 b=X9Mr7orV1azARJCeI1wlRuM7FJdC4N7V/AhTpeRqnG2iZDqSaJoVKCbdobeN7Lk+rM
 dZR6zpVaHbOVXz2XzQk2Bz5iAXxiXrLTW7EaXL1xZuBs3GtSxYwOfxvxmcFJNmgn0BCv
 gtnw8oXevDgTvot9BiGhId8fJhMu/TPDgvJp2b6kWfOIpHVjmvghIN0kghI/B2O80Sra
 QoWqSg+0EWaJw+MO/wdhsq0XSpLx/SJUkIo5Zo8ciu0LWouOWHC6FwzRhdA88upSSRfH
 DoyUCYfrO/0MHA5lRAt2FjHRop3kAtj8CTV6ES7OW0D1WQjO7xb1g0MSZfiCnzzMFdU+
 xOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BQiyIslLq3E90bdrVOTzKhGW/chrmrz2mLNk3C0Pxu4=;
 b=euiHGBs5SXbrg0HA3EYkhL5E8qFtvRQa+NK2m2ON7FDMQC0WUrisHSAhKZuYLvYjth
 20bLjnHHBq3sUbd5mxmiK2U/dVX3qD/CJKIi71gT//ikdmrcuN2We8xt1SNZep7B3eue
 oBN2QS5U5zt8ysgi2VCMEBVEgj9XrXiN/c0Re7s/juxtbO51Jd2NP4IyDhPzJ+xSV5rn
 lgK8Em0TFxMyEDzW25w+uHqb9lKJG+tIBGxazkJlG375iXuRdwwz6++BRDJsn9QSLh1i
 cuVrZXDOs4WM168gB7RIJAJSB4I64O98YBbcc6X1KWRNPAZnzmfTl5slZFaXule5bNhS
 sO/g==
X-Gm-Message-State: AOAM531R3NH09/gTFZ3m/ChIMe8BYmkaD0EeljFClZPyJMHzHM2KAQub
 SnoEbqOyVB3Uk9JuTrJ0Nvm4W522TiDa26zxlFXfzA==
X-Google-Smtp-Source: ABdhPJy2euMEvP8DRO3S2ip7B4Y8Js66MkFYlsVtLEp4yW4MUpo78SYbUvPSnBCle72LAjw75c6egNIM/d+yT82HqKY=
X-Received: by 2002:ac2:5d67:0:b0:442:f135:3bcc with SMTP id
 h7-20020ac25d67000000b00442f1353bccmr3035325lft.452.1648111613442; Thu, 24
 Mar 2022 01:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220323111309.9109-1-mchitale@ventanamicro.com>
 <20220323111309.9109-2-mchitale@ventanamicro.com>
 <44dd2668-dfb6-d065-b826-ce83d725a11d@iscas.ac.cn>
In-Reply-To: <44dd2668-dfb6-d065-b826-ce83d725a11d@iscas.ac.cn>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Thu, 24 Mar 2022 14:16:16 +0530
Message-ID: <CAN37VV4Wzi1oTgQxpDLsrJPtAqxWmAYc+4Z3qM88arn3q1HFZQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/4] target/riscv: Add smstateen support
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::134
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=mchitale@ventanamicro.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 24 Mar 2022 08:47:02 -0000

On Wed, Mar 23, 2022 at 6:31 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>
> =E5=9C=A8 2022/3/23 =E4=B8=8B=E5=8D=887:13, Mayuresh Chitale =E5=86=99=E9=
=81=93:
> > Smstateen extension specifies a mechanism to close
> > the potential covert channels that could cause security issues.
> >
> > This patch adds the CSRs defined in the specification and
> > the corresponding predicates and read/write functions.
> >
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >   target/riscv/cpu.c      |   2 +
> >   target/riscv/cpu.h      |   4 +
> >   target/riscv/cpu_bits.h |  36 +++++++
> >   target/riscv/csr.c      | 210 +++++++++++++++++++++++++++++++++++++++=
+
> >   target/riscv/machine.c  |  22 ++++-
> >   5 files changed, 273 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 8e338daf72..832602d91f 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -807,6 +807,7 @@ static Property riscv_cpu_properties[] =3D {
> >       DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> >       DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> >       DEFINE_PROP_BOOL("sstc", RISCVCPU, cfg.ext_sstc, true),
> > +    DEFINE_PROP_BOOL("smstateen", RISCVCPU, cfg.ext_smstateen, true),
> >
> >       DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> >       DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> > @@ -970,6 +971,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, cha=
r **isa_str, int max_str_len)
> >           ISA_EDATA_ENTRY(svinval, ext_svinval),
> >           ISA_EDATA_ENTRY(svnapot, ext_svnapot),
> >           ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
> > +        ISA_EDATA_ENTRY(smstateen, ext_smstateen),
> >       };
> >
> >       for (i =3D 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index ea23666e8e..8e61edca6f 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -338,6 +338,9 @@ struct CPURISCVState {
> >
> >       /* CSRs for execution enviornment configuration */
> >       uint64_t menvcfg;
> > +    uint64_t mstateen[SMSTATEEN_MAX_COUNT];
> > +    uint64_t hstateen[SMSTATEEN_MAX_COUNT];
> > +    uint64_t sstateen[SMSTATEEN_MAX_COUNT];
> >       target_ulong senvcfg;
> >       uint64_t henvcfg;
> >   #endif
> > @@ -416,6 +419,7 @@ struct RISCVCPUConfig {
> >       bool ext_zve32f;
> >       bool ext_zve64f;
> >       bool ext_sscofpmf;
> > +    bool ext_smstateen;
> >
> >       /* Vendor-specific custom extensions */
> >       bool ext_XVentanaCondOps;
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index 7454f4087f..66edb26686 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -205,6 +205,12 @@
> >   /* Supervisor Configuration CSRs */
> >   #define CSR_SENVCFG         0x10A
> >
> > +/* Supervisor state CSRs */
> > +#define CSR_SSTATEEN0       0x10C
> > +#define CSR_SSTATEEN1       0x10D
> > +#define CSR_SSTATEEN2       0x10E
> > +#define CSR_SSTATEEN3       0x10F
> > +
> >   /* Supervisor Trap Handling */
> >   #define CSR_SSCRATCH        0x140
> >   #define CSR_SEPC            0x141
> > @@ -258,6 +264,16 @@
> >   #define CSR_HENVCFG         0x60A
> >   #define CSR_HENVCFGH        0x61A
> >
> > +/* Hypervisor state CSRs */
> > +#define CSR_HSTATEEN0       0x60C
> > +#define CSR_HSTATEEN0H      0x61C
> > +#define CSR_HSTATEEN1       0x60D
> > +#define CSR_HSTATEEN1H      0x61D
> > +#define CSR_HSTATEEN2       0x60E
> > +#define CSR_HSTATEEN2H      0x61E
> > +#define CSR_HSTATEEN3       0x60F
> > +#define CSR_HSTATEEN3H      0x61F
> > +
> >   /* Virtual CSRs */
> >   #define CSR_VSSTATUS        0x200
> >   #define CSR_VSIE            0x204
> > @@ -309,6 +325,26 @@
> >   #define CSR_MENVCFG         0x30A
> >   #define CSR_MENVCFGH        0x31A
> >
> > +/* Machine state CSRs */
> > +#define CSR_MSTATEEN0       0x30C
> > +#define CSR_MSTATEEN0H      0x31C
> > +#define CSR_MSTATEEN1       0x30D
> > +#define CSR_MSTATEEN1H      0x31D
> > +#define CSR_MSTATEEN2       0x30E
> > +#define CSR_MSTATEEN2H      0x31E
> > +#define CSR_MSTATEEN3       0x30F
> > +#define CSR_MSTATEEN3H      0x31F
> > +
> > +/* Common defines for all smstateen */
> > +#define SMSTATEEN_MAX_COUNT 4
> > +#define SMSTATEEN0_CS       0
> > +#define SMSTATEEN0_FCSR     0
> > +#define SMSTATEEN0_IMSIC    58
> > +#define SMSTATEEN0_AIA      59
> > +#define SMSTATEEN0_SVSLCT   60
> > +#define SMSTATEEN0_HSENVCFG 62
> > +#define SMSTATEEN_STATEN    63
> > +
> >   /* Enhanced Physical Memory Protection (ePMP) */
> >   #define CSR_MSECCFG         0x747
> >   #define CSR_MSECCFGH        0x757
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index d3d16d71de..215c8ecef1 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -265,6 +265,42 @@ static RISCVException hmode32(CPURISCVState *env, =
int csrno)
> >
> >   }
> >
> > +static RISCVException mstateen(CPURISCVState *env, int csrno)
> > +{
> > +    CPUState *cs =3D env_cpu(env);
> > +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> > +
> > +    if (!cpu->cfg.ext_smstateen) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    return any(env, csrno);
> > +}
> > +
> > +static RISCVException hstateen(CPURISCVState *env, int csrno)
> > +{
> > +    CPUState *cs =3D env_cpu(env);
> > +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> > +
> > +    if (!cpu->cfg.ext_smstateen) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    return hmode(env, csrno);
> > +}
> > +
> > +static RISCVException sstateen(CPURISCVState *env, int csrno)
> > +{
> > +    CPUState *cs =3D env_cpu(env);
> > +    RISCVCPU *cpu =3D RISCV_CPU(cs);
> > +
> > +    if (!cpu->cfg.ext_smstateen) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    return smode(env, csrno);
> > +}
> > +
> >   /* Checks if PointerMasking registers could be accessed */
> >   static RISCVException pointer_masking(CPURISCVState *env, int csrno)
> >   {
> > @@ -1882,6 +1918,129 @@ static RISCVException write_henvcfgh(CPURISCVSt=
ate *env, int csrno,
> >       return RISCV_EXCP_NONE;
> >   }
> >
> > +static inline void write_smstateen(CPURISCVState *env, uint64_t *reg,
> > +        uint64_t wr_mask, uint64_t new_val)
>
> It's better that 'uint64_t' is aligned with 'CPURISCVState' here.  The
> same to following similar cases.

Ok. Will fix it in the next version.
>
> > +{
> > +    *reg =3D (*reg & ~wr_mask) | (new_val & wr_mask);
> > +}
> > +
> > +static RISCVException read_mstateen(CPURISCVState *env, int csrno,
> > +                                 target_ulong *val)
> > +{
> > +    *val =3D env->mstateen[csrno - CSR_MSTATEEN0];
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_mstateen(CPURISCVState *env, int csrno,
> > +                                  target_ulong new_val)
> > +{
> > +    uint64_t *reg;
> > +    uint64_t wr_mask =3D 1UL << SMSTATEEN_STATEN;
> > +
> > +    reg =3D &env->mstateen[csrno - CSR_MSTATEEN0];
> > +    write_smstateen(env, reg, wr_mask, new_val);
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_mstateenh(CPURISCVState *env, int csrno,
> > +                                 target_ulong *val)
> > +{
> > +    *val =3D env->mstateen[csrno - CSR_MSTATEEN0H - 0x10] >> 32;
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
>
> Why minus 0x10 here?
>
> when read CSR_MSTATEEN0H, the csrno should be CSR_MSTATEEN0H, and the
> expected result is  mstateen[0] >> 32.
>
> So, minus 0x10 seems unnecessary.
>
> The same to following similar cases.
Correct. I will fix in the next version.
>
> > +
> > +static RISCVException write_mstateenh(CPURISCVState *env, int csrno,
> > +                                  target_ulong new_val)
> > +{
> > +    uint64_t *reg;
> > +    uint64_t val;
> > +    uint64_t wr_mask =3D 1UL << SMSTATEEN_STATEN;
> > +
> > +    reg =3D &env->mstateen[csrno - CSR_MSTATEEN0H - 0x10];
> > +    val =3D (uint64_t)new_val << 32;
> > +    val |=3D *reg & 0xFFFFFFFF;
> > +    write_smstateen(env, reg, wr_mask, val);
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_hstateen(CPURISCVState *env, int csrno,
> > +                                 target_ulong *val)
> > +{
> > +    *val =3D env->hstateen[csrno - CSR_HSTATEEN0];
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_hstateen(CPURISCVState *env, int csrno,
> > +                                  target_ulong new_val)
> > +{
> > +    uint64_t *reg;
> > +    uint64_t wr_mask =3D 1UL << SMSTATEEN_STATEN;
> > +    int index =3D csrno - CSR_HSTATEEN0;
> > +
> > +    reg =3D &env->hstateen[index];
> > +    wr_mask &=3D env->mstateen[index];
> > +    write_smstateen(env, reg, wr_mask, new_val);
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_hstateenh(CPURISCVState *env, int csrno,
> > +                                 target_ulong *val)
> > +{
> > +    *val =3D env->hstateen[csrno - CSR_HSTATEEN0H - 0x10] >> 32;
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_hstateenh(CPURISCVState *env, int csrno,
> > +                                  target_ulong new_val)
> > +{
> > +    uint64_t *reg;
> > +    uint64_t val;
> > +    uint64_t wr_mask =3D 1UL << SMSTATEEN_STATEN;
> > +    int index =3D csrno - CSR_HSTATEEN0H - 0x10;
> > +
> > +    reg =3D &env->hstateen[index];
> > +    val =3D (uint64_t)new_val << 32;
> > +    val |=3D *reg & 0xFFFFFFFF;
> > +    wr_mask &=3D env->mstateen[index];
> > +
> > +    write_smstateen(env, reg, wr_mask, val);
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_sstateen(CPURISCVState *env, int csrno,
> > +                                 target_ulong *val)
> > +{
> > +    *val =3D env->sstateen[csrno - CSR_SSTATEEN0];
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_sstateen(CPURISCVState *env, int csrno,
> > +                                  target_ulong new_val)
> > +{
> > +    uint64_t *reg;
> > +    uint64_t wr_mask =3D 0;
> > +    int index =3D csrno - CSR_SSTATEEN0;
> > +    bool virt =3D riscv_cpu_virt_enabled(env);
> > +
> > +    reg =3D &env->sstateen[index];
> > +    if (virt) {
> > +        wr_mask &=3D env->mstateen[index];
> > +    } else {
> > +        wr_mask &=3D env->hstateen[index];
> > +    }
> > +    write_smstateen(env, reg, wr_mask, new_val);
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> >   static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
> >                                   uint64_t *ret_val,
> >                                   uint64_t new_val, uint64_t wr_mask)
> > @@ -3664,6 +3823,57 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D=
 {
> >       [CSR_HENVCFGH] =3D { "henvcfgh", hmode32, read_henvcfgh, write_he=
nvcfgh,
> >                                             .min_priv_ver =3D PRIV_VERS=
ION_1_12_0 },
> >
> > +    /* Smstateen extension CSRs */
> > +    [CSR_MSTATEEN0] =3D { "mstateen0", mstateen, read_mstateen, write_=
mstateen,
> > +                                          .min_priv_ver =3D PRIV_VERSI=
ON_1_12_0 },
> > +    [CSR_MSTATEEN0H] =3D { "mstateen0h", mstateen, read_mstateenh,
> > +                                          write_mstateenh,
> > +                                          .min_priv_ver =3D PRIV_VERSI=
ON_1_12_0 },
>
> It' better to aligned with CSR_MSTATEEN0 here.
>
> Regards,
>
> Weiwei Li
>
> > +    [CSR_MSTATEEN1] =3D { "mstateen1", mstateen, read_mstateen, write_=
mstateen,
> > +                                          .min_priv_ver =3D PRIV_VERSI=
ON_1_12_0 },
> > +    [CSR_MSTATEEN1H] =3D { "mstateen1h", mstateen, read_mstateenh,
> > +                                          write_mstateenh,
> > +                                          .min_priv_ver =3D PRIV_VERSI=
ON_1_12_0 },
> > +    [CSR_MSTATEEN2] =3D { "mstateen2", mstateen, read_mstateen, write_=
mstateen,
> > +                                          .min_priv_ver =3D PRIV_VERSI=
ON_1_12_0 },
> > +    [CSR_MSTATEEN2H] =3D { "mstateen2h", mstateen, read_mstateenh,
> > +                                          write_mstateenh,
> > +                                          .min_priv_ver =3D PRIV_VERSI=
ON_1_12_0 },
> > +    [CSR_MSTATEEN3] =3D { "mstateen3", mstateen, read_mstateen, write_=
mstateen,
> > +                                          .min_priv_ver =3D PRIV_VERSI=
ON_1_12_0 },
> > +    [CSR_MSTATEEN3H] =3D { "mstateen3h", mstateen, read_mstateenh,
> > +                                          write_mstateenh,
> > +                                          .min_priv_ver =3D PRIV_VERSI=
ON_1_12_0 },
> > +
> > +    [CSR_HSTATEEN0] =3D { "hstateen0", hstateen, read_hstateen, write_=
hstateen,
> > +                                          .min_priv_ver =3D PRIV_VERSI=
ON_1_12_0 },
> > +    [CSR_HSTATEEN0H] =3D { "hstateen0h", hstateen, read_hstateenh,
> > +                                          write_hstateenh,
> > +                                          .min_priv_ver =3D PRIV_VERSI=
ON_1_12_0 },
> > +    [CSR_HSTATEEN1] =3D { "hstateen1", hstateen, read_hstateen, write_=
hstateen,
> > +                                          .min_priv_ver =3D PRIV_VERSI=
ON_1_12_0 },
> > +    [CSR_HSTATEEN1H] =3D { "hstateen1h", hstateen, read_hstateenh,
> > +                                          write_hstateenh,
> > +                                          .min_priv_ver =3D PRIV_VERSI=
ON_1_12_0 },
> > +    [CSR_HSTATEEN2] =3D { "hstateen2", hstateen, read_hstateen, write_=
hstateen,
> > +                                          .min_priv_ver =3D PRIV_VERSI=
ON_1_12_0 },
> > +    [CSR_HSTATEEN2H] =3D { "hstateen2h", hstateen, read_hstateenh,
> > +                                          write_hstateenh,
> > +                                          .min_priv_ver =3D PRIV_VERSI=
ON_1_12_0 },
> > +    [CSR_HSTATEEN3] =3D { "hstateen3", hstateen, read_hstateen, write_=
hstateen,
> > +                                          .min_priv_ver =3D PRIV_VERSI=
ON_1_12_0 },
> > +    [CSR_HSTATEEN3H] =3D { "hstateen3h", hstateen, read_hstateenh,
> > +                                          write_hstateenh,
> > +                                          .min_priv_ver =3D PRIV_VERSI=
ON_1_12_0 },
> > +
> > +    [CSR_SSTATEEN0] =3D { "sstateen0", sstateen, read_sstateen, write_=
sstateen,
> > +                                          .min_priv_ver =3D PRIV_VERSI=
ON_1_12_0 },
> > +    [CSR_SSTATEEN1] =3D { "sstateen1", sstateen, read_sstateen, write_=
sstateen,
> > +                                          .min_priv_ver =3D PRIV_VERSI=
ON_1_12_0 },
> > +    [CSR_SSTATEEN2] =3D { "sstateen2", sstateen, read_sstateen, write_=
sstateen,
> > +                                          .min_priv_ver =3D PRIV_VERSI=
ON_1_12_0 },
> > +    [CSR_SSTATEEN3] =3D { "sstateen3", sstateen, read_sstateen, write_=
sstateen,
> > +                                          .min_priv_ver =3D PRIV_VERSI=
ON_1_12_0 },
> >       /* Supervisor Trap Setup */
> >       [CSR_SSTATUS]    =3D { "sstatus",    smode, read_sstatus,    writ=
e_sstatus, NULL,
> >                                                 read_sstatus_i128      =
           },
> > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > index aa968dc29c..e376f82ca0 100644
> > --- a/target/riscv/machine.c
> > +++ b/target/riscv/machine.c
> > @@ -232,6 +232,26 @@ static int riscv_cpu_post_load(void *opaque, int v=
ersion_id)
> >       return 0;
> >   }
> >
> > +static bool smstateen_needed(void *opaque)
> > +{
> > +    RISCVCPU *cpu =3D opaque;
> > +
> > +    return cpu->cfg.ext_smstateen;
> > +}
> > +
> > +static const VMStateDescription vmstate_smstateen =3D {
> > +    .name =3D "cpu/smtateen",
> > +    .version_id =3D 1,
> > +    .minimum_version_id =3D 1,
> > +    .needed =3D smstateen_needed,
> > +    .fields =3D (VMStateField[]) {
> > +        VMSTATE_UINT64_ARRAY(env.mstateen, RISCVCPU, 4),
> > +        VMSTATE_UINT64_ARRAY(env.hstateen, RISCVCPU, 4),
> > +        VMSTATE_UINT64_ARRAY(env.sstateen, RISCVCPU, 4),
> > +        VMSTATE_END_OF_LIST()
> > +    }
> > +};
> > +
> >   static bool envcfg_needed(void *opaque)
> >   {
> >       RISCVCPU *cpu =3D opaque;
> > @@ -331,7 +351,6 @@ const VMStateDescription vmstate_riscv_cpu =3D {
> >           VMSTATE_UINT64(env.mtohost, RISCVCPU),
> >           VMSTATE_UINT64(env.mtimecmp, RISCVCPU),
> >           VMSTATE_UINT64(env.stimecmp, RISCVCPU),
> > -
> >           VMSTATE_END_OF_LIST()
> >       },
> >       .subsections =3D (const VMStateDescription * []) {
> > @@ -342,6 +361,7 @@ const VMStateDescription vmstate_riscv_cpu =3D {
> >           &vmstate_rv128,
> >           &vmstate_kvmtimer,
> >           &vmstate_envcfg,
> > +        &vmstate_smstateen,
> >           NULL
> >       }
> >   };
>

