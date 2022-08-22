Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQ26Z-0000wV-VL
	for mharc-qemu-riscv@gnu.org; Mon, 22 Aug 2022 03:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oQ26Y-0000wE-KP; Mon, 22 Aug 2022 03:44:14 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:44782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oQ26W-0002sM-L0; Mon, 22 Aug 2022 03:44:14 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 r15-20020a17090a1bcf00b001fabf42a11cso10400023pjr.3; 
 Mon, 22 Aug 2022 00:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=uFl98zEOmu4MtScHdg5XAW2FOeMp0kjIzL5b1fp1gxw=;
 b=KwQe26od9v3Q/eVR3PcjHLcerqsHAER5Nfg1qR7Ur/cilDDff9GKUOuPXyfyaTV/aC
 gyySFb1wDy3aWj4JeJakj663RG+i/n7URn7HY5qtYH5QxyZihCeZ/7rZM52JYe5FsUsA
 zsDdHE2kfx3e09d9bqI/b0csIZul2YdzGj9QuwzcU4I63BlzPDsu0wDTubhBEqNH9v+s
 z5/agYuZc8YUM1WG+jdr2RcKEdIxds2ZCQgef6fGZGTPm9aRF79txhFg9+9Df3bDG53d
 vGi9c8DcvOJCf3KrCPAMw6d7KSpLhp2bWuV93GbFyOXG87OgqXJG+g52yJAOy1v7Fwxx
 QB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=uFl98zEOmu4MtScHdg5XAW2FOeMp0kjIzL5b1fp1gxw=;
 b=gB0yvkSFHlQSpHE7aexamF7UO9KU5EPFVteoK22MCof1N4rJLpX0uoKA5BTe8RoKOj
 +aLSK7MbggGMOWxeoaIcWc0rXfWF/46PSri/+c2LnGWwRps700NujMIxaYJnPFBbHTDd
 EjRQ8aPClqc1bCmCFIYyUxBhnWdoDCi5ZvWxL1iEIFy9rvCEZn4Xvm1Sq7AKQ6owXgYb
 b3VQjSkxvkLjrJj7wmf/vqgBT0H5zTjwtbxFmnSukbD/DppCN4qSSMbBQXvMGgh+lsT8
 XXmolXYC6E7PAJurXm7JgJ66K/UwALONa3TTvX3Bsuad3fJDkACKixFKvHGGHpvcOMSo
 5ELA==
X-Gm-Message-State: ACgBeo2rQLij4/3Be/ELkg96iZDD/jnf6Yh5H5V3BgVFrlOyuW4A4HVc
 rvShnq3ZnRu1S6TFv24GpenEd901IC0SkW8RfyU=
X-Google-Smtp-Source: AA6agR7Jx159/eu7TUDanmCu8t8PUDs30wBKPoJVgPqPp53gJL2JGFAU3V/smrq8G9FESFX9uPlHOUyj02o7vG2HHqs=
X-Received: by 2002:a17:903:2281:b0:172:f8e3:6f07 with SMTP id
 b1-20020a170903228100b00172f8e36f07mr244347plh.121.1661154250413; Mon, 22 Aug
 2022 00:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220820042958.377018-1-apatel@ventanamicro.com>
In-Reply-To: <20220820042958.377018-1-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Aug 2022 17:43:43 +1000
Message-ID: <CAKmqyKPr97jLQVm3u0KKQNGQJTjUiPoGzjkDSyX09AuYd9-P9A@mail.gmail.com>
Subject: Re: [PATCH v3] target/riscv: Use official extension names for AIA CSRs
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Atish Patra <atishp@atishpatra.org>, 
 Anup Patel <anup@brainfault.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 22 Aug 2022 07:44:14 -0000

On Sat, Aug 20, 2022 at 2:30 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The arch review of AIA spec is completed and we now have official
> extension names for AIA: Smaia (M-mode AIA CSRs) and Ssaia (S-mode
> AIA CSRs).
>
> Refer, section 1.6 of the latest AIA v0.3.1 stable specification at
> https://github.com/riscv/riscv-aia/releases/download/0.3.1-draft.32/riscv-interrupts-032.pdf)
>
> Based on above, we update QEMU RISC-V to:
> 1) Have separate config options for Smaia and Ssaia extensions
>    which replace RISCV_FEATURE_AIA in CPU features
> 2) Not generate AIA INTC compatible string in virt machine
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Changes since v2:
>  - Use env_archcpu() to get RISCVCPU * from CPURISCVState *
> Changes since v1:
>  - Remove redundant "has_aia" parameter from riscv_cpu_pending_to_irq()
> ---
>  hw/intc/riscv_imsic.c     |  4 +++-
>  hw/riscv/virt.c           | 13 ++-----------
>  target/riscv/cpu.c        |  9 ++++-----
>  target/riscv/cpu.h        |  4 ++--
>  target/riscv/cpu_helper.c |  3 ++-
>  target/riscv/csr.c        | 24 ++++++++++++++++++------
>  6 files changed, 31 insertions(+), 26 deletions(-)
>
> diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
> index 8615e4cc1d..4d4d5b50ca 100644
> --- a/hw/intc/riscv_imsic.c
> +++ b/hw/intc/riscv_imsic.c
> @@ -344,9 +344,11 @@ static void riscv_imsic_realize(DeviceState *dev, Error **errp)
>
>      /* Force select AIA feature and setup CSR read-modify-write callback */
>      if (env) {
> -        riscv_set_feature(env, RISCV_FEATURE_AIA);
>          if (!imsic->mmode) {
> +            rcpu->cfg.ext_ssaia = true;
>              riscv_cpu_set_geilen(env, imsic->num_pages - 1);
> +        } else {
> +            rcpu->cfg.ext_smaia = true;
>          }
>          riscv_cpu_set_aia_ireg_rmw_fn(env, (imsic->mmode) ? PRV_M : PRV_S,
>                                        riscv_imsic_rmw, imsic);
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index e779d399ae..b041b33afc 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -261,17 +261,8 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
>          qemu_fdt_add_subnode(mc->fdt, intc_name);
>          qemu_fdt_setprop_cell(mc->fdt, intc_name, "phandle",
>              intc_phandles[cpu]);
> -        if (riscv_feature(&s->soc[socket].harts[cpu].env,
> -                          RISCV_FEATURE_AIA)) {
> -            static const char * const compat[2] = {
> -                "riscv,cpu-intc-aia", "riscv,cpu-intc"
> -            };
> -            qemu_fdt_setprop_string_array(mc->fdt, intc_name, "compatible",
> -                                      (char **)&compat, ARRAY_SIZE(compat));
> -        } else {
> -            qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
> -                "riscv,cpu-intc");
> -        }
> +        qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
> +            "riscv,cpu-intc");
>          qemu_fdt_setprop(mc->fdt, intc_name, "interrupt-controller", NULL, 0);
>          qemu_fdt_setprop_cell(mc->fdt, intc_name, "#interrupt-cells", 1);
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d11113fbaa..3cf0c86661 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -101,6 +101,8 @@ static const struct isa_ext_data isa_edata_arr[] = {
>      ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_12_0, ext_zve64f),
>      ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
>      ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
> +    ISA_EXT_DATA_ENTRY(smaia, true, PRIV_VERSION_1_12_0, ext_smaia),
> +    ISA_EXT_DATA_ENTRY(ssaia, true, PRIV_VERSION_1_12_0, ext_ssaia),
>      ISA_EXT_DATA_ENTRY(sscofpmf, true, PRIV_VERSION_1_12_0, ext_sscofpmf),
>      ISA_EXT_DATA_ENTRY(sstc, true, PRIV_VERSION_1_12_0, ext_sstc),
>      ISA_EXT_DATA_ENTRY(svinval, true, PRIV_VERSION_1_12_0, ext_svinval),
> @@ -669,10 +671,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          }
>      }
>
> -    if (cpu->cfg.aia) {
> -        riscv_set_feature(env, RISCV_FEATURE_AIA);
> -    }
> -
>      if (cpu->cfg.debug) {
>          riscv_set_feature(env, RISCV_FEATURE_DEBUG);
>      }
> @@ -1058,7 +1056,8 @@ static Property riscv_cpu_extensions[] = {
>      DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>      /* ePMP 0.9.3 */
>      DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
> -    DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
> +    DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
> +    DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
>
>      DEFINE_PROP_END_OF_LIST(),
>  };
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 42edfa4558..15cad73def 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -85,7 +85,6 @@ enum {
>      RISCV_FEATURE_PMP,
>      RISCV_FEATURE_EPMP,
>      RISCV_FEATURE_MISA,
> -    RISCV_FEATURE_AIA,
>      RISCV_FEATURE_DEBUG
>  };
>
> @@ -452,6 +451,8 @@ struct RISCVCPUConfig {
>      bool ext_zve64f;
>      bool ext_zmmul;
>      bool ext_sscofpmf;
> +    bool ext_smaia;
> +    bool ext_ssaia;
>      bool rvv_ta_all_1s;
>      bool rvv_ma_all_1s;
>
> @@ -472,7 +473,6 @@ struct RISCVCPUConfig {
>      bool mmu;
>      bool pmp;
>      bool epmp;
> -    bool aia;
>      bool debug;
>      uint64_t resetvec;
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 81948b37dd..67e4c0efd2 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -309,6 +309,7 @@ static int riscv_cpu_pending_to_irq(CPURISCVState *env,
>                                      int extirq, unsigned int extirq_def_prio,
>                                      uint64_t pending, uint8_t *iprio)
>  {
> +    RISCVCPU *cpu = env_archcpu(env);
>      int irq, best_irq = RISCV_EXCP_NONE;
>      unsigned int prio, best_prio = UINT_MAX;
>
> @@ -317,7 +318,7 @@ static int riscv_cpu_pending_to_irq(CPURISCVState *env,
>      }
>
>      irq = ctz64(pending);
> -    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +    if (!((extirq == IRQ_M_EXT) ? cpu->cfg.ext_smaia : cpu->cfg.ext_ssaia)) {
>          return irq;
>      }
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 2dcd4e5b2d..b96db1b62b 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -181,7 +181,9 @@ static RISCVException any32(CPURISCVState *env, int csrno)
>
>  static int aia_any(CPURISCVState *env, int csrno)
>  {
> -    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    if (!cpu->cfg.ext_smaia) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> @@ -190,7 +192,9 @@ static int aia_any(CPURISCVState *env, int csrno)
>
>  static int aia_any32(CPURISCVState *env, int csrno)
>  {
> -    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    if (!cpu->cfg.ext_smaia) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> @@ -217,7 +221,9 @@ static int smode32(CPURISCVState *env, int csrno)
>
>  static int aia_smode(CPURISCVState *env, int csrno)
>  {
> -    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    if (!cpu->cfg.ext_ssaia) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> @@ -226,7 +232,9 @@ static int aia_smode(CPURISCVState *env, int csrno)
>
>  static int aia_smode32(CPURISCVState *env, int csrno)
>  {
> -    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    if (!cpu->cfg.ext_ssaia) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> @@ -282,7 +290,9 @@ static RISCVException pointer_masking(CPURISCVState *env, int csrno)
>
>  static int aia_hmode(CPURISCVState *env, int csrno)
>  {
> -    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    if (!cpu->cfg.ext_ssaia) {
>          return RISCV_EXCP_ILLEGAL_INST;
>       }
>
> @@ -291,7 +301,9 @@ static int aia_hmode(CPURISCVState *env, int csrno)
>
>  static int aia_hmode32(CPURISCVState *env, int csrno)
>  {
> -    if (!riscv_feature(env, RISCV_FEATURE_AIA)) {
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    if (!cpu->cfg.ext_ssaia) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> --
> 2.34.1
>
>

