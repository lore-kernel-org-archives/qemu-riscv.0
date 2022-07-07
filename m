Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o9Tdq-0001o3-Kq
	for mharc-qemu-riscv@gnu.org; Thu, 07 Jul 2022 11:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1o9Tdm-0001kx-AH
 for qemu-riscv@nongnu.org; Thu, 07 Jul 2022 11:42:06 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:46807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1o9Tdk-0002I1-1A
 for qemu-riscv@nongnu.org; Thu, 07 Jul 2022 11:42:06 -0400
Received: by mail-pf1-x42f.google.com with SMTP id a15so20134463pfv.13
 for <qemu-riscv@nongnu.org>; Thu, 07 Jul 2022 08:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=aGTaQCWlcspIJPCWv9vwD3+wPmV6ngyLhgkyDUaF0jE=;
 b=Pns1p3pu25+Cz7cMdlwo6oADiKPIf06CqVT9fh4lc7wNoNwqOElGnEhxxBXQEIGJfD
 QW9pCFHo9H7eNKmC0gwUpGqneB6GqGkJsYaD0kv8OOOxxPHc+ZhNhpslMyJeerJZtSy6
 9R/5iXUTagKLsHHi71M07ZjCy7/JLZy/KR38D2X15USmJraGQxUpJ00fi4qJq/Xb1GgB
 Wu+iGMeb7WSefVbA0gw+YSAtczueFA2HQMsoHt0GpVD3Uj/9bkDMzZ7V9+Sme1NJg/hO
 QA5/0P11fMxuxc9FBgPwfkzOA52eplA4aRF6r6N3AbCg4d5FIDb2WwMV1FfPBAhOKkoj
 QWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=aGTaQCWlcspIJPCWv9vwD3+wPmV6ngyLhgkyDUaF0jE=;
 b=uzOry7wNf/bVBUckrt4iNCyZPC7QoH44+am7DCeUTPPgZbvIoC0zPwB8o7d+63k3m9
 Y9ico1cMs+AlxbGcyqBKsB87QJbcGOfyVlkoqeWQMDqWW61Z+czYdL4v87pXXcapgpLe
 YsnxGgbjSxi96/adz3zB1SF7MKVbDePC7cf0AaoQZu8j1JzH4qGetDiAbJAa2kuVo34G
 2DCKaI2tYeLkwh38H/Gs+OY4fGLoySfnkZP3ZlHU9ccAQrC519Gmaom02SXjJpup1NTv
 tuQW3C4nPK0pzIUCGkKhBOa5yVNHudf5Q0fN7JD+ZspApUbTj3jEJIzhTMabODeUUtxL
 7HSg==
X-Gm-Message-State: AJIora9qhfBe9DGv8aTSMVB+9S7Y4WTCH7OuiWiaJ5XE6ajA/T+vWY8g
 m/pPtxB9B6uFr5zdPU4wLnulaQ==
X-Google-Smtp-Source: AGRyM1vCGylzH38yMJmlkKf0LW73XTG+0Uq8FneZjbHHiHYVNWQUUvCCza/KXJoFIbBodELFVHv0PQ==
X-Received: by 2002:a63:4c:0:b0:408:c003:a45c with SMTP id
 73-20020a63004c000000b00408c003a45cmr41361033pga.252.1657208521406; 
 Thu, 07 Jul 2022 08:42:01 -0700 (PDT)
Received: from [192.168.1.18] ([182.64.106.38])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a170902d48300b0016be702a535sm8630844plg.187.2022.07.07.08.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 08:42:00 -0700 (PDT)
Message-ID: <10132d91c0c54e33aaaa590a6b1c87f0f468480b.camel@ventanamicro.com>
Subject: Re: [RFC PATCH v5 1/4] target/riscv: Add smstateen support
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, "open
 list:RISC-V" <qemu-riscv@nongnu.org>, Alistair Francis
 <alistair.francis@wdc.com>
Date: Thu, 07 Jul 2022 21:11:53 +0530
In-Reply-To: <CAKmqyKPc8jYX4BCU-t93AmYA+-ukW7J0ENroK+k-+ZfQmHb+Hg@mail.gmail.com>
References: <20220603160425.3667456-1-mchitale@ventanamicro.com>
 <20220603160425.3667456-2-mchitale@ventanamicro.com>
 <CAKmqyKPc8jYX4BCU-t93AmYA+-ukW7J0ENroK+k-+ZfQmHb+Hg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pf1-x42f.google.com
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
X-List-Received-Date: Thu, 07 Jul 2022 15:42:06 -0000

On Thu, 2022-06-16 at 15:48 +1000, Alistair Francis wrote:
> On Sat, Jun 4, 2022 at 2:13 AM Mayuresh Chitale
> <mchitale@ventanamicro.com> wrote:
> > Smstateen extension specifies a mechanism to close
> > the potential covert channels that could cause security issues.
> > 
> > This patch adds the CSRs defined in the specification and
> > the corresponding predicates and read/write functions.
> > 
> > Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> > ---
> >  target/riscv/cpu.c      |   2 +
> >  target/riscv/cpu.h      |   4 +
> >  target/riscv/cpu_bits.h |  36 +++++++
> >  target/riscv/csr.c      | 210
> > ++++++++++++++++++++++++++++++++++++++++
> >  target/riscv/machine.c  |  21 ++++
> >  5 files changed, 273 insertions(+)
> > 
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index e6e878ceb3..2d65ccd90f 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -913,6 +913,7 @@ static Property riscv_cpu_properties[] = {
> >      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> >      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> >      DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
> > +    DEFINE_PROP_BOOL("smstateen", RISCVCPU, cfg.ext_smstateen,
> > false),
> 
> This allows a user to enable this extension. It should be a seperate
> patch at the end of the series. The idea is that we add support, then
> once it's fully supported we allow a user to enable the extension.
> 
> >      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> >      DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> > @@ -1104,6 +1105,7 @@ static void riscv_isa_string_ext(RISCVCPU
> > *cpu, char **isa_str, int max_str_len)
> >          ISA_EDATA_ENTRY(zve64f, ext_zve64f),
> >          ISA_EDATA_ENTRY(zhinx, ext_zhinx),
> >          ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
> > +        ISA_EDATA_ENTRY(smstateen, ext_smstateen),
> >          ISA_EDATA_ENTRY(svinval, ext_svinval),
> >          ISA_EDATA_ENTRY(svnapot, ext_svnapot),
> >          ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index f08c3e8813..1c269b77bd 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -327,6 +327,9 @@ struct CPUArchState {
> > 
> >      /* CSRs for execution enviornment configuration */
> >      uint64_t menvcfg;
> > +    uint64_t mstateen[SMSTATEEN_MAX_COUNT];
> > +    uint64_t hstateen[SMSTATEEN_MAX_COUNT];
> > +    uint64_t sstateen[SMSTATEEN_MAX_COUNT];
> >      target_ulong senvcfg;
> >      uint64_t henvcfg;
> >  #endif
> > @@ -411,6 +414,7 @@ struct RISCVCPUConfig {
> >      bool ext_zhinxmin;
> >      bool ext_zve32f;
> >      bool ext_zve64f;
> > +    bool ext_smstateen;
> > 
> >      uint32_t mvendorid;
> >      uint64_t marchid;
> > diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> > index 4a55c6a709..2a3ef26d21 100644
> > --- a/target/riscv/cpu_bits.h
> > +++ b/target/riscv/cpu_bits.h
> > @@ -208,6 +208,12 @@
> >  /* Supervisor Configuration CSRs */
> >  #define CSR_SENVCFG         0x10A
> > 
> > +/* Supervisor state CSRs */
> > +#define CSR_SSTATEEN0       0x10C
> > +#define CSR_SSTATEEN1       0x10D
> > +#define CSR_SSTATEEN2       0x10E
> > +#define CSR_SSTATEEN3       0x10F
> > +
> >  /* Supervisor Trap Handling */
> >  #define CSR_SSCRATCH        0x140
> >  #define CSR_SEPC            0x141
> > @@ -257,6 +263,16 @@
> >  #define CSR_HENVCFG         0x60A
> >  #define CSR_HENVCFGH        0x61A
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
> >  /* Virtual CSRs */
> >  #define CSR_VSSTATUS        0x200
> >  #define CSR_VSIE            0x204
> > @@ -304,6 +320,26 @@
> >  #define CSR_MENVCFG         0x30A
> >  #define CSR_MENVCFGH        0x31A
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
> >  /* Enhanced Physical Memory Protection (ePMP) */
> >  #define CSR_MSECCFG         0x747
> >  #define CSR_MSECCFGH        0x757
> > diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> > index 409a209f14..324fefce59 100644
> > --- a/target/riscv/csr.c
> > +++ b/target/riscv/csr.c
> > @@ -247,6 +247,42 @@ static RISCVException hmode32(CPURISCVState
> > *env, int csrno)
> > 
> >  }
> > 
> > +static RISCVException mstateen(CPURISCVState *env, int csrno)
> > +{
> > +    CPUState *cs = env_cpu(env);
> > +    RISCVCPU *cpu = RISCV_CPU(cs);
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
> > +    CPUState *cs = env_cpu(env);
> > +    RISCVCPU *cpu = RISCV_CPU(cs);
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
> > +    CPUState *cs = env_cpu(env);
> > +    RISCVCPU *cpu = RISCV_CPU(cs);
> > +
> > +    if (!cpu->cfg.ext_smstateen) {
> > +        return RISCV_EXCP_ILLEGAL_INST;
> > +    }
> > +
> > +    return smode(env, csrno);
> > +}
> > +
> >  /* Checks if PointerMasking registers could be accessed */
> >  static RISCVException pointer_masking(CPURISCVState *env, int
> > csrno)
> >  {
> > @@ -1574,6 +1610,129 @@ static RISCVException
> > write_henvcfgh(CPURISCVState *env, int csrno,
> >      return RISCV_EXCP_NONE;
> >  }
> > 
> > +static inline void write_smstateen(CPURISCVState *env, uint64_t
> > *reg,
> > +                                   uint64_t wr_mask, uint64_t
> > new_val)
> > +{
> > +    *reg = (*reg & ~wr_mask) | (new_val & wr_mask);
> > +}
> > +
> > +static RISCVException read_mstateen(CPURISCVState *env, int csrno,
> > +                                    target_ulong *val)
> > +{
> > +    *val = env->mstateen[csrno - CSR_MSTATEEN0];
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_mstateen(CPURISCVState *env, int
> > csrno,
> > +                                     target_ulong new_val)
> > +{
> > +    uint64_t *reg;
> > +    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
> 
> I'm not sure I understand, why is only bit 63 writable?
> 
> I guess you plan on expanding this, maybe make this a single const
> (or
> macro) that can be shared between them all?
Yes, it is expanded in the later patches depending on availability of
other features.
> 
> > +
> > +    reg = &env->mstateen[csrno - CSR_MSTATEEN0];
> > +    write_smstateen(env, reg, wr_mask, new_val);
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_mstateenh(CPURISCVState *env, int
> > csrno,
> > +                                     target_ulong *val)
> > +{
> > +    *val = env->mstateen[csrno - CSR_MSTATEEN0H] >> 32;
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_mstateenh(CPURISCVState *env, int
> > csrno,
> > +                                      target_ulong new_val)
> > +{
> > +    uint64_t *reg;
> > +    uint64_t val;
> > +    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
> > +
> > +    reg = &env->mstateen[csrno - CSR_MSTATEEN0H];
> > +    val = (uint64_t)new_val << 32;
> > +    val |= *reg & 0xFFFFFFFF;
> > +    write_smstateen(env, reg, wr_mask, val);
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_hstateen(CPURISCVState *env, int csrno,
> > +                                    target_ulong *val)
> > +{
> > +    *val = env->hstateen[csrno - CSR_HSTATEEN0];
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_hstateen(CPURISCVState *env, int
> > csrno,
> > +                                     target_ulong new_val)
> > +{
> > +    uint64_t *reg;
> > +    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
> > +    int index = csrno - CSR_HSTATEEN0;
> > +
> > +    reg = &env->hstateen[index];
> > +    wr_mask &= env->mstateen[index];
> > +    write_smstateen(env, reg, wr_mask, new_val);
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_hstateenh(CPURISCVState *env, int
> > csrno,
> > +                                     target_ulong *val)
> > +{
> > +    *val = env->hstateen[csrno - CSR_HSTATEEN0H] >> 32;
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_hstateenh(CPURISCVState *env, int
> > csrno,
> > +                                      target_ulong new_val)
> > +{
> > +    uint64_t *reg;
> > +    uint64_t val;
> > +    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
> > +    int index = csrno - CSR_HSTATEEN0H;
> > +
> > +    reg = &env->hstateen[index];
> > +    val = (uint64_t)new_val << 32;
> > +    val |= *reg & 0xFFFFFFFF;
> > +    wr_mask &= env->mstateen[index];
> > +
> > +    write_smstateen(env, reg, wr_mask, val);
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException read_sstateen(CPURISCVState *env, int csrno,
> > +                                    target_ulong *val)
> > +{
> > +    *val = env->sstateen[csrno - CSR_SSTATEEN0];
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> > +static RISCVException write_sstateen(CPURISCVState *env, int
> > csrno,
> > +                                     target_ulong new_val)
> > +{
> > +    uint64_t *reg;
> > +    uint64_t wr_mask = 0;
> > +    int index = csrno - CSR_SSTATEEN0;
> > +    bool virt = riscv_cpu_virt_enabled(env);
> > +
> > +    reg = &env->sstateen[index];
> > +    if (virt) {
> > +        wr_mask &= env->mstateen[index];
> > +    } else {
> > +        wr_mask &= env->hstateen[index];
> > +    }
> > +    write_smstateen(env, reg, wr_mask, new_val);
> > +
> > +    return RISCV_EXCP_NONE;
> > +}
> > +
> >  static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
> >                                  uint64_t *ret_val,
> >                                  uint64_t new_val, uint64_t
> > wr_mask)
> > @@ -3441,6 +3600,57 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE]
> > = {
> >      [CSR_HENVCFGH] = { "henvcfgh", hmode32, read_henvcfgh,
> > write_henvcfgh,
> >                                            .min_priv_ver =
> > PRIV_VERSION_1_12_0 },
> > 
> > +    /* Smstateen extension CSRs */
> > +    [CSR_MSTATEEN0] = { "mstateen0", mstateen, read_mstateen,
> > write_mstateen,
> > +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_MSTATEEN0H] = { "mstateen0h", mstateen, read_mstateenh,
> > +                          write_mstateenh,
> > +                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_MSTATEEN1] = { "mstateen1", mstateen, read_mstateen,
> > write_mstateen,
> > +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_MSTATEEN1H] = { "mstateen1h", mstateen, read_mstateenh,
> > +                          write_mstateenh,
> > +                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_MSTATEEN2] = { "mstateen2", mstateen, read_mstateen,
> > write_mstateen,
> > +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_MSTATEEN2H] = { "mstateen2h", mstateen, read_mstateenh,
> > +                          write_mstateenh,
> > +                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_MSTATEEN3] = { "mstateen3", mstateen, read_mstateen,
> > write_mstateen,
> > +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_MSTATEEN3H] = { "mstateen3h", mstateen, read_mstateenh,
> > +                          write_mstateenh,
> > +                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +
> > +    [CSR_HSTATEEN0] = { "hstateen0", hstateen, read_hstateen,
> > write_hstateen,
> > +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_HSTATEEN0H] = { "hstateen0h", hstateen, read_hstateenh,
> > +                          write_hstateenh,
> > +                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_HSTATEEN1] = { "hstateen1", hstateen, read_hstateen,
> > write_hstateen,
> > +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_HSTATEEN1H] = { "hstateen1h", hstateen, read_hstateenh,
> > +                          write_hstateenh,
> > +                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_HSTATEEN2] = { "hstateen2", hstateen, read_hstateen,
> > write_hstateen,
> > +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_HSTATEEN2H] = { "hstateen2h", hstateen, read_hstateenh,
> > +                          write_hstateenh,
> > +                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_HSTATEEN3] = { "hstateen3", hstateen, read_hstateen,
> > write_hstateen,
> > +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_HSTATEEN3H] = { "hstateen3h", hstateen, read_hstateenh,
> > +                          write_hstateenh,
> > +                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +
> > +    [CSR_SSTATEEN0] = { "sstateen0", sstateen, read_sstateen,
> > write_sstateen,
> > +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_SSTATEEN1] = { "sstateen1", sstateen, read_sstateen,
> > write_sstateen,
> > +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_SSTATEEN2] = { "sstateen2", sstateen, read_sstateen,
> > write_sstateen,
> > +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> > +    [CSR_SSTATEEN3] = { "sstateen3", sstateen, read_sstateen,
> > write_sstateen,
> > +                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> >      /* Supervisor Trap Setup */
> >      [CSR_SSTATUS]    = { "sstatus",    smode,
> > read_sstatus,    write_sstatus, NULL,
> >                                                read_sstatus_i128   
> >               },
> > diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> > index 2a437b29a1..84a75dbb08 100644
> > --- a/target/riscv/machine.c
> > +++ b/target/riscv/machine.c
> > @@ -262,6 +262,26 @@ static int riscv_cpu_post_load(void *opaque,
> > int version_id)
> >      return 0;
> >  }
> > 
> > +static bool smstateen_needed(void *opaque)
> > +{
> > +    RISCVCPU *cpu = opaque;
> > +
> > +    return cpu->cfg.ext_smstateen;
> > +}
> > +
> > +static const VMStateDescription vmstate_smstateen = {
> > +    .name = "cpu/smtateen",
> > +    .version_id = 1,
> > +    .minimum_version_id = 1,
> > +    .needed = smstateen_needed,
> > +    .fields = (VMStateField[]) {
> > +        VMSTATE_UINT64_ARRAY(env.mstateen, RISCVCPU, 4),
> > +        VMSTATE_UINT64_ARRAY(env.hstateen, RISCVCPU, 4),
> > +        VMSTATE_UINT64_ARRAY(env.sstateen, RISCVCPU, 4),
> > +        VMSTATE_END_OF_LIST()
> > +    }
> > +};
> > +
> >  static bool envcfg_needed(void *opaque)
> >  {
> >      RISCVCPU *cpu = opaque;
> > @@ -347,6 +367,7 @@ const VMStateDescription vmstate_riscv_cpu = {
> >          &vmstate_kvmtimer,
> >          &vmstate_envcfg,
> >          &vmstate_debug,
> > +        &vmstate_smstateen,
> >          NULL
> >      }
> >  };
> > --
> > 2.25.1
> > 
> > 


