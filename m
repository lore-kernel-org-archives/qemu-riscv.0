Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o9UlI-0003Oe-Mq
	for mharc-qemu-riscv@gnu.org; Thu, 07 Jul 2022 12:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1o9UlG-0003Ld-QB
 for qemu-riscv@nongnu.org; Thu, 07 Jul 2022 12:53:54 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:38488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1o9UlE-00031p-Fa
 for qemu-riscv@nongnu.org; Thu, 07 Jul 2022 12:53:54 -0400
Received: by mail-pg1-x52c.google.com with SMTP id e132so19566072pgc.5
 for <qemu-riscv@nongnu.org>; Thu, 07 Jul 2022 09:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=lapwo4gnhTEsxj0cKAvz6JRcNN9jlCpIhzJcifPab1c=;
 b=CN7lu/rXp3s5s/GzNuGJyBq6OlD50pM94cLV23z8oKHXEEfb/1ABaPMU+zoUfrdI8W
 oDsnn83VkB49bKvIkp8mE2u16kn4CvWKmS2qQLWgIibavkwBIDoiN1KM1DaTNew3shaG
 GvpR4Qv/jH88tTPZ0nR4Rn1SJQ2i1i6BqU+ImZEcrAWsUUJuoyhUIW5MF3HlTYuiFWwG
 lJPZDqXJsm2yLFoVy/TDyAcbGaL7HSIXUVXTqAH8AXwTn3HC2ZZRr1Sf1KE/Et8isrlb
 eg26zw2HUjKk6vtV8qI1lbnVzejvOajNjQ0gPNXjKRa8DLO7S1J9SnAnnsFVFflTLOFf
 tpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=lapwo4gnhTEsxj0cKAvz6JRcNN9jlCpIhzJcifPab1c=;
 b=5Hj5Wl754tg1DiWWDebbBM/UG2LQ8BBfXIEEP8wLcYANV1r/bXFKOcjy64jy3WCApT
 EOnfoDmH98M0N7c0l5L15vshIwTi1Z8BgXDp55J+H13cLLjvuZvMCnuU7uw9dcHpheBF
 21h6R/XiaS2WGRHjPMEYd/AqPg66lciBegExueb53fJujHo6dpDXtnq+0nPG8d6vMUoR
 JxCWi9LA43ftFzVumyicxtkZ3rlgjQ4XTRhBocC2Q+WDgA4M2F7Nh3EmeM/WT1gO0afZ
 CMHvAQ+IYXzexFflYAvU68/MDWEGV6HgoRw/bdH/7pkQgzK5t2L0JqVpahwvIvivkD9b
 LARw==
X-Gm-Message-State: AJIora+OsUKB423UBcy0PxyJJSQq2PaAG9t2BJg9MhcC4Jfg5EgDIwI+
 tnv8sbSWS8C/qf5gVrEj6Gk3Ag==
X-Google-Smtp-Source: AGRyM1sRZ5YC6w+Rp+SshFl4aM9l5PX1ZBVlyHtV9qLVykdWZC8eLSQzkwueeWuQhDd+oNkbB1cwJw==
X-Received: by 2002:a63:df49:0:b0:412:58fe:2332 with SMTP id
 h9-20020a63df49000000b0041258fe2332mr16068468pgj.505.1657212830992; 
 Thu, 07 Jul 2022 09:53:50 -0700 (PDT)
Received: from [192.168.1.18] ([182.64.106.38])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a63ff43000000b0041239bf9be8sm8195708pgk.1.2022.07.07.09.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 09:53:49 -0700 (PDT)
Message-ID: <746ba0e1f67cafde5fae05725ccef0587de67ad3.camel@ventanamicro.com>
Subject: Re: [RFC PATCH v5 1/4] target/riscv: Add smstateen support
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: angell1518 <angell1518@163.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Date: Thu, 07 Jul 2022 22:23:43 +0530
In-Reply-To: <43569e92.214c.181be6c8e52.Coremail.angell1518@163.com>
References: <20220603160425.3667456-1-mchitale@ventanamicro.com>
 <20220603160425.3667456-2-mchitale@ventanamicro.com>
 <43569e92.214c.181be6c8e52.Coremail.angell1518@163.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=mchitale@ventanamicro.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 07 Jul 2022 16:53:55 -0000

On Sat, 2022-07-02 at 18:19 +0800, angell1518 wrote:
> At 2022-06-04 00:04:22, "Mayuresh Chitale" <mchitale@ventanamicro.com
> > wrote:
> >Smstateen extension specifies a mechanism to close
> >the potential covert channels that could cause security issues.
> >
> >This patch adds the CSRs defined in the specification and
> >the corresponding predicates and read/write functions.
> >
> >Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> >---
> > target/riscv/cpu.c      |   2 +
> > target/riscv/cpu.h      |   4 +
> > target/riscv/cpu_bits.h |  36 +++++++
> > target/riscv/csr.c      | 210
> ++++++++++++++++++++++++++++++++++++++++
> > target/riscv/machine.c  |  21 ++++
> > 5 files changed, 273 insertions(+)
> >
> >diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >index e6e878ceb3..2d65ccd90f 100644
> >--- a/target/riscv/cpu.c
> >+++ b/target/riscv/cpu.c
> >@@ -913,6 +913,7 @@ static Property riscv_cpu_properties[] = {
> >     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> >     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> >     DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
> >+    DEFINE_PROP_BOOL("smstateen", RISCVCPU, cfg.ext_smstateen,
> false),
> > 
> >     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> >     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> >@@ -1104,6 +1105,7 @@ static void riscv_isa_string_ext(RISCVCPU
> *cpu, char **isa_str, int max_str_len)
> >         ISA_EDATA_ENTRY(zve64f, ext_zve64f),
> >         ISA_EDATA_ENTRY(zhinx, ext_zhinx),
> >         ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
> >+        ISA_EDATA_ENTRY(smstateen, ext_smstateen),
> >         ISA_EDATA_ENTRY(svinval, ext_svinval),
> >         ISA_EDATA_ENTRY(svnapot, ext_svnapot),
> >         ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
> >diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> >index f08c3e8813..1c269b77bd 100644
> >--- a/target/riscv/cpu.h
> >+++ b/target/riscv/cpu.h
> >@@ -327,6 +327,9 @@ struct CPUArchState {
> > 
> >     /* CSRs for execution enviornment configuration */
> >     uint64_t menvcfg;
> >+    uint64_t mstateen[SMSTATEEN_MAX_COUNT];
> >+    uint64_t hstateen[SMSTATEEN_MAX_COUNT];
> >+    uint64_t sstateen[SMSTATEEN_MAX_COUNT];
> >     target_ulong senvcfg;
> >     uint64_t henvcfg;
> > #endif
> >@@ -411,6 +414,7 @@ struct RISCVCPUConfig {
> >     bool ext_zhinxmin;
> >     bool ext_zve32f;
> >     bool ext_zve64f;
> >+    bool ext_smstateen;
> > 
> >     uint32_t mvendorid;
> >     uint64_t marchid;
> >diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> >index 4a55c6a709..2a3ef26d21 100644
> >--- a/target/riscv/cpu_bits.h
> >+++ b/target/riscv/cpu_bits.h
> >@@ -208,6 +208,12 @@
> > /* Supervisor Configuration CSRs */
> > #define CSR_SENVCFG         0x10A
> > 
> >+/* Supervisor state CSRs */
> >+#define CSR_SSTATEEN0       0x10C
> >+#define CSR_SSTATEEN1       0x10D
> >+#define CSR_SSTATEEN2       0x10E
> >+#define CSR_SSTATEEN3       0x10F
> >+
> > /* Supervisor Trap Handling */
> > #define CSR_SSCRATCH        0x140
> > #define CSR_SEPC            0x141
> >@@ -257,6 +263,16 @@
> > #define CSR_HENVCFG         0x60A
> > #define CSR_HENVCFGH        0x61A
> > 
> >+/* Hypervisor state CSRs */
> >+#define CSR_HSTATEEN0       0x60C
> >+#define CSR_HSTATEEN0H      0x61C
> >+#define CSR_HSTATEEN1       0x60D
> >+#define CSR_HSTATEEN1H      0x61D
> >+#define CSR_HSTATEEN2       0x60E
> >+#define CSR_HSTATEEN2H      0x61E
> >+#define CSR_HSTATEEN3       0x60F
> >+#define CSR_HSTATEEN3H      0x61F
> >+
> > /* Virtual CSRs */
> > #define CSR_VSSTATUS        0x200
> > #define CSR_VSIE            0x204
> >@@ -304,6 +320,26 @@
> > #define CSR_MENVCFG         0x30A
> > #define CSR_MENVCFGH        0x31A
> > 
> >+/* Machine state CSRs */
> >+#define CSR_MSTATEEN0       0x30C
> >+#define CSR_MSTATEEN0H      0x31C
> >+#define CSR_MSTATEEN1       0x30D
> >+#define CSR_MSTATEEN1H      0x31D
> >+#define CSR_MSTATEEN2       0x30E
> >+#define CSR_MSTATEEN2H      0x31E
> >+#define CSR_MSTATEEN3       0x30F
> >+#define CSR_MSTATEEN3H      0x31F
> >+
> >+/* Common defines for all smstateen */
> >+#define SMSTATEEN_MAX_COUNT 4
> >+#define SMSTATEEN0_CS       0
> >+#define SMSTATEEN0_FCSR     0
> >+#define SMSTATEEN0_IMSIC    58
> >+#define SMSTATEEN0_AIA      59
> >+#define SMSTATEEN0_SVSLCT   60
> >+#define SMSTATEEN0_HSENVCFG 62
> >+#define SMSTATEEN_STATEN    63
> >+
> > /* Enhanced Physical Memory Protection (ePMP) */
> > #define CSR_MSECCFG         0x747
> > #define CSR_MSECCFGH        0x757
> >diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> >index 409a209f14..324fefce59 100644
> >--- a/target/riscv/csr.c
> >+++ b/target/riscv/csr.c
> >@@ -247,6 +247,42 @@ static RISCVException hmode32(CPURISCVState
> *env, int csrno)
> > 
> > }
> > 
> >+static RISCVException mstateen(CPURISCVState *env, int csrno)
> >+{
> >+    CPUState *cs = env_cpu(env);
> >+    RISCVCPU *cpu = RISCV_CPU(cs);
> >+
> >+    if (!cpu->cfg.ext_smstateen) {
> >+        return RISCV_EXCP_ILLEGAL_INST;
> >+    }
> >+
> >+    return any(env, csrno);
> >+}
> >+
> >+static RISCVException hstateen(CPURISCVState *env, int csrno)
> >+{
> >+    CPUState *cs = env_cpu(env);
> >+    RISCVCPU *cpu = RISCV_CPU(cs);
> >+
> >+    if (!cpu->cfg.ext_smstateen) {
> >+        return RISCV_EXCP_ILLEGAL_INST;
> >+    }
> >+
> >+    return hmode(env, csrno);
> >+}
> >+
> 
> I think we should take the stateen bit(bit 63) for matching mstateen
> into consideration here. 
> Similar to following sstateen function.
ok.

> >+static RISCVException sstateen(CPURISCVState *env, int csrno)
> >+{
> >+    CPUState *cs = env_cpu(env);
> >+    RISCVCPU *cpu = RISCV_CPU(cs);
> >+
> >+    if (!cpu->cfg.ext_smstateen) {
> >+        return RISCV_EXCP_ILLEGAL_INST;
> >+    }
> >+
> >+    return smode(env, csrno);
> >+}
> >+
> > /* Checks if PointerMasking registers could be accessed */
> > static RISCVException pointer_masking(CPURISCVState *env, int
> csrno)
> > {
> >@@ -1574,6 +1610,129 @@ static RISCVException
> write_henvcfgh(CPURISCVState *env, int csrno,
> >     return RISCV_EXCP_NONE;
> > }
> > 
> >+static inline void write_smstateen(CPURISCVState *env, uint64_t
> *reg,
> >+                                   uint64_t wr_mask, uint64_t
> new_val)
> >+{
> >+    *reg = (*reg & ~wr_mask) | (new_val & wr_mask);
> >+}
> >+
> >+static RISCVException read_mstateen(CPURISCVState *env, int csrno,
> >+                                    target_ulong *val)
> >+{
> >+    *val = env->mstateen[csrno - CSR_MSTATEEN0];
> >+
> >+    return RISCV_EXCP_NONE;
> >+}
> >+
> >+static RISCVException write_mstateen(CPURISCVState *env, int csrno,
> >+                                     target_ulong new_val)
> >+{
> >+    uint64_t *reg;
> >+    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
> >+
> >+    reg = &env->mstateen[csrno - CSR_MSTATEEN0];
> >+    write_smstateen(env, reg, wr_mask, new_val);
> >+
> >+    return RISCV_EXCP_NONE;
> >+}
> >+
> >+static RISCVException read_mstateenh(CPURISCVState *env, int csrno,
> >+                                     target_ulong *val)
> >+{
> >+    *val = env->mstateen[csrno - CSR_MSTATEEN0H] >> 32;
> >+
> >+    return RISCV_EXCP_NONE;
> >+}
> >+
> >+static RISCVException write_mstateenh(CPURISCVState *env, int
> csrno,
> >+                                      target_ulong new_val)
> >+{
> >+    uint64_t *reg;
> >+    uint64_t val;
> >+    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
> >+
> >+    reg = &env->mstateen[csrno - CSR_MSTATEEN0H];
> >+    val = (uint64_t)new_val << 32;
> >+    val |= *reg & 0xFFFFFFFF;
> >+    write_smstateen(env, reg, wr_mask, val);
> >+
> >+    return RISCV_EXCP_NONE;
> >+}
> >+
> >+static RISCVException read_hstateen(CPURISCVState *env, int csrno,
> >+                                    target_ulong *val)
> >+{
> >+    *val = env->hstateen[csrno - CSR_HSTATEEN0];
> >+
> >+    return RISCV_EXCP_NONE;
> >+}
> >+
> 
> I think we should also take mstateen into consideration here just
> like the following write function.
> As the spec said, If we set certain bit in the matching mstateen csr
> to zero, the same bit in hstateen should be read-only zero.
> However, writes to mstateen will not affect the value in matching
> hstateen directly in current implementation, 
> so if we read hstateen just immediately after write zero to certain
> bit of mstateen, the same bit  read from hstateen may not be zero.
I need to check this but as per my understanding this it is the
responsibility of the software to clear the corresponding
hstateen/stateen bits.
> 
> similar to read function of sstateen.
> >+static RISCVException write_hstateen(CPURISCVState *env, int csrno,
> >+                                     target_ulong new_val)
> >+{
> >+    uint64_t *reg;
> >+    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
> >+    int index = csrno - CSR_HSTATEEN0;
> >+
> >+    reg = &env->hstateen[index];
> >+    wr_mask &= env->mstateen[index];
> >+    write_smstateen(env, reg, wr_mask, new_val);
> >+
> >+    return RISCV_EXCP_NONE;
> >+}
> >+
> >+static RISCVException read_hstateenh(CPURISCVState *env, int csrno,
> >+                                     target_ulong *val)
> >+{
> >+    *val = env->hstateen[csrno - CSR_HSTATEEN0H] >> 32;
> >+
> >+    return RISCV_EXCP_NONE;
> >+}
> >+
> >+static RISCVException write_hstateenh(CPURISCVState *env, int
> csrno,
> >+                                      target_ulong new_val)
> >+{
> >+    uint64_t *reg;
> >+    uint64_t val;
> >+    uint64_t wr_mask = 1UL << SMSTATEEN_STATEN;
> >+    int index = csrno - CSR_HSTATEEN0H;
> >+
> >+    reg = &env->hstateen[index];
> >+    val = (uint64_t)new_val << 32;
> >+    val |= *reg & 0xFFFFFFFF;
> >+    wr_mask &= env->mstateen[index];
> >+
> >+    write_smstateen(env, reg, wr_mask, val);
> >+    return RISCV_EXCP_NONE;
> >+}
> >+
> >+static RISCVException read_sstateen(CPURISCVState *env, int csrno,
> >+                                    target_ulong *val)
> >+{
> >+    *val = env->sstateen[csrno - CSR_SSTATEEN0];
> >+
> >+    return RISCV_EXCP_NONE;
> >+}
> >+
> >+static RISCVException write_sstateen(CPURISCVState *env, int csrno,
> >+                                     target_ulong new_val)
> >+{
> >+    uint64_t *reg;
> >+    uint64_t wr_mask = 0;
> >+    int index = csrno - CSR_SSTATEEN0;
> >+    bool virt = riscv_cpu_virt_enabled(env);
> >+
> >+    reg = &env->sstateen[index];
> >+    if (virt) {
> >+        wr_mask &= env->mstateen[index];
> >+    } else {
> >+        wr_mask &= env->hstateen[index];
> >+    }
> Why this? I think hstateen works in virt mode, so this may be:
> if (virt) {
>   wr_mask &= env->mstateen[index] & env->hstateen[index];;
> } else {
>   wr_mask &= env->mstateen[index];
> }
> >+    write_smstateen(env, reg, wr_mask, new_val);
> >+
> >+    return RISCV_EXCP_NONE;
> >+}
> >+
> > static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
> >                                 uint64_t *ret_val,
> >                                 uint64_t new_val, uint64_t wr_mask)
> >@@ -3441,6 +3600,57 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE]
> = {
> >     [CSR_HENVCFGH] = { "henvcfgh", hmode32, read_henvcfgh,
> write_henvcfgh,
> >                                           .min_priv_ver =
> PRIV_VERSION_1_12_0 },
> > 
> >+    /* Smstateen extension CSRs */
> >+    [CSR_MSTATEEN0] = { "mstateen0", mstateen, read_mstateen,
> write_mstateen,
> >+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> >+    [CSR_MSTATEEN0H] = { "mstateen0h", mstateen, read_mstateenh,
> >+                          write_mstateenh,
> >+                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> >+    [CSR_MSTATEEN1] = { "mstateen1", mstateen, read_mstateen,
> write_mstateen,
> >+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> 
> It seems unreasonable for mstateen1~3 to share the same read/write
> function with mstateen0 , 
> since their field mask is different.
> Similar to sstateen1~3 and hstateen1~3

I will fix it in the next version.
> 
> Regards,
> Weiwei Li
> >+    [CSR_MSTATEEN1H] = { "mstateen1h", mstateen, read_mstateenh,
> >+                          write_mstateenh,
> >+                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> >+    [CSR_MSTATEEN2] = { "mstateen2", mstateen, read_mstateen,
> write_mstateen,
> >+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> >+    [CSR_MSTATEEN2H] = { "mstateen2h", mstateen, read_mstateenh,
> >+                          write_mstateenh,
> >+                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> >+    [CSR_MSTATEEN3] = { "mstateen3", mstateen, read_mstateen,
> write_mstateen,
> >+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> >+    [CSR_MSTATEEN3H] = { "mstateen3h", mstateen, read_mstateenh,
> >+                          write_mstateenh,
> >+                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> >+
> >+    [CSR_HSTATEEN0] = { "hstateen0", hstateen, read_hstateen,
> write_hstateen,
> >+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> >+    [CSR_HSTATEEN0H] = { "hstateen0h", hstateen, read_hstateenh,
> >+                          write_hstateenh,
> >+                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> >+    [CSR_HSTATEEN1] = { "hstateen1", hstateen, read_hstateen,
> write_hstateen,
> >+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> >+    [CSR_HSTATEEN1H] = { "hstateen1h", hstateen, read_hstateenh,
> >+                          write_hstateenh,
> >+                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> >+    [CSR_HSTATEEN2] = { "hstateen2", hstateen, read_hstateen,
> write_hstateen,
> >+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> >+    [CSR_HSTATEEN2H] = { "hstateen2h", hstateen, read_hstateenh,
> >+                          write_hstateenh,
> >+                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> >+    [CSR_HSTATEEN3] = { "hstateen3", hstateen, read_hstateen,
> write_hstateen,
> >+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> >+    [CSR_HSTATEEN3H] = { "hstateen3h", hstateen, read_hstateenh,
> >+                          write_hstateenh,
> >+                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> >+
> >+    [CSR_SSTATEEN0] = { "sstateen0", sstateen, read_sstateen,
> write_sstateen,
> >+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> >+    [CSR_SSTATEEN1] = { "sstateen1", sstateen, read_sstateen,
> write_sstateen,
> >+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> >+    [CSR_SSTATEEN2] = { "sstateen2", sstateen, read_sstateen,
> write_sstateen,
> >+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> >+    [CSR_SSTATEEN3] = { "sstateen3", sstateen, read_sstateen,
> write_sstateen,
> >+                         .min_priv_ver = PRIV_VERSION_1_12_0 },
> >     /* Supervisor Trap Setup */
> >     [CSR_SSTATUS]    = { "sstatus",    smode,
> read_sstatus,    write_sstatus, NULL,
> >                                               read_sstatus_i128    
>              },
> >diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> >index 2a437b29a1..84a75dbb08 100644
> >--- a/target/riscv/machine.c
> >+++ b/target/riscv/machine.c
> >@@ -262,6 +262,26 @@ static int riscv_cpu_post_load(void *opaque,
> int version_id)
> >     return 0;
> > }
> > 
> >+static bool smstateen_needed(void *opaque)
> >+{
> >+    RISCVCPU *cpu = opaque;
> >+
> >+    return cpu->cfg.ext_smstateen;
> >+}
> >+
> >+static const VMStateDescription vmstate_smstateen = {
> >+    .name = "cpu/smtateen",
> >+    .version_id = 1,
> >+    .minimum_version_id = 1,
> >+    .needed = smstateen_needed,
> >+    .fields = (VMStateField[]) {
> >+        VMSTATE_UINT64_ARRAY(env.mstateen, RISCVCPU, 4),
> >+        VMSTATE_UINT64_ARRAY(env.hstateen, RISCVCPU, 4),
> >+        VMSTATE_UINT64_ARRAY(env.sstateen, RISCVCPU, 4),
> >+        VMSTATE_END_OF_LIST()
> >+    }
> >+};
> >+
> > static bool envcfg_needed(void *opaque)
> > {
> >     RISCVCPU *cpu = opaque;
> >@@ -347,6 +367,7 @@ const VMStateDescription vmstate_riscv_cpu = {
> >         &vmstate_kvmtimer,
> >         &vmstate_envcfg,
> >         &vmstate_debug,
> >+        &vmstate_smstateen,
> >         NULL
> >     }
> > };
> >-- 
> >2.25.1
> >


