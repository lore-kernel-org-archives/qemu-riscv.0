Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE02CDB465
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 04:36:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsFL1-00060J-96; Mon, 16 Oct 2023 00:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsFKy-0005w9-Bs; Mon, 16 Oct 2023 00:36:17 -0400
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsFKs-0004th-UM; Mon, 16 Oct 2023 00:36:12 -0400
Received: by mail-vk1-xa30.google.com with SMTP id
 71dfb90a1353d-4a403fdebedso1583053e0c.1; 
 Sun, 15 Oct 2023 21:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697430967; x=1698035767; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NoJllfX+JWMLlIRbccJH0ZunhvWBkdis4tRa+2tXub4=;
 b=Houam4VCuodCacETIANn0SM+8r2IHBFOfBwKxDqpvkCGJG+M0C/zJyvwdff8jT9oBY
 D4G+34SnG7Kpo5t6RYbn7YdU/X+yIhzEODw9ymtfbBdQRp/QUBYwlJMJAFWZwXh3XwMD
 L+Ujxh/G8z9+7XNkqa5TdOIgrYbCwaalIwiu0kT+2wobKgMvwszahGhuZd/CGJZ1RtFT
 RqLYnuSq7AvT/rzNQqXmgZlhyu9zFKXhR5sC3S4bnM4LMBgJ+7M62ZfB5aDx17MEwwX2
 LDkqkbaZ06HKf7Wr3YTS579rOcC3E6Y//hel01MRVrN65rLMRzOI90c/tXzdgN1CgLQn
 JXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697430967; x=1698035767;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NoJllfX+JWMLlIRbccJH0ZunhvWBkdis4tRa+2tXub4=;
 b=nb1qSG93SayeHv8suJAvLOpEjoESRBfENuMxmQ+nTUgiFghIr1t1mM3W8zSwooD6fE
 PIbzm4Qo92YLBQMRIEdUUlUJyUteLoVC3CoI26hbh5pFJHaeM/t9xxHM+oPEazClQwfQ
 pmN7P4ZYmLYL4WUegT9S5xi8kn4WKbWeSz9Ep/z3I2/u7gcKcIMDUE/XkBtRVN5znLIr
 Xap2mBclHbINxaHsa1KnY42D5N15B59cSXcNv6ewtJ0MJYCQlNd9hkPnSKzlh1dWoAqw
 1KC5XF5DI0YIe2YjDRzk0clGwjtk7XbYfgt+VlSjB0g2stcJghoFj44YE3EzOZVyujDP
 xZ+Q==
X-Gm-Message-State: AOJu0YzL0n1l3anHPc58UntFxVWcE0MNgRlDRnKNOxgqSfIeKH9A+YAh
 BKe77iFwBxayB5cRT8N5c19/alT3k2WxsN7xwGs=
X-Google-Smtp-Source: AGHT+IEQaPex1AjX3BrPqgjk86VYuaf+Uy3h53P2JB98gYJaTJ5AUYkbvrxK/Wm3oiZtVpOnaL2TzZex7kxt3jI4QyA=
X-Received: by 2002:a1f:ddc2:0:b0:49a:36e4:5565 with SMTP id
 u185-20020a1fddc2000000b0049a36e45565mr25545751vkg.16.1697430966943; Sun, 15
 Oct 2023 21:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20231012164604.398496-1-dbarboza@ventanamicro.com>
 <20231012164604.398496-3-dbarboza@ventanamicro.com>
In-Reply-To: <20231012164604.398496-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Oct 2023 14:35:40 +1000
Message-ID: <CAKmqyKO_UnVfyrHR7soa=KzyzBadUGRvMpActrLLW_N-LfiYsg@mail.gmail.com>
Subject: Re: [PATCH 2/4] target/riscv: rename ext_icsr to ext_zicsr
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa30.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Oct 13, 2023 at 4:27=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Add a leading 'z' to improve grepping. When one wants to search for uses
> of zicsr they're more likely to do 'grep -i zicsr' than 'grep -i icsr'.
>
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/boot.c            |  2 +-
>  target/riscv/cpu.c         | 22 +++++++++++-----------
>  target/riscv/cpu_cfg.h     |  2 +-
>  target/riscv/csr.c         |  2 +-
>  target/riscv/gdbstub.c     |  2 +-
>  target/riscv/tcg/tcg-cpu.c | 14 +++++++-------
>  6 files changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 52bf8e67de..0ffca05189 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -414,7 +414,7 @@ void riscv_setup_rom_reset_vec(MachineState *machine,=
 RISCVHartArrayState *harts
>          reset_vec[4] =3D 0x0182b283;   /*     ld     t0, 24(t0) */
>      }
>
> -    if (!harts->harts[0].cfg.ext_icsr) {
> +    if (!harts->harts[0].cfg.ext_zicsr) {
>          /*
>           * The Zicsr extension has been disabled, so let's ensure we don=
't
>           * run the CSR instruction. Let's fill the address with a non
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index caf42ce68d..fdbbafe7b3 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -79,7 +79,7 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zicbom, PRIV_VERSION_1_12_0, ext_icbom),
>      ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_icboz),
>      ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
> -    ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_icsr),
> +    ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_zicsr),
>      ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_zifencei),
>      ISA_EXT_DATA_ENTRY(zihintntl, PRIV_VERSION_1_10_0, ext_zihintntl),
>      ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause=
),
> @@ -383,7 +383,7 @@ static void riscv_any_cpu_init(Object *obj)
>
>      /* inherited from parent obj via riscv_cpu_init() */
>      cpu->cfg.ext_zifencei =3D true;
> -    cpu->cfg.ext_icsr =3D true;
> +    cpu->cfg.ext_zicsr =3D true;
>      cpu->cfg.mmu =3D true;
>      cpu->cfg.pmp =3D true;
>  }
> @@ -431,7 +431,7 @@ static void rv64_sifive_u_cpu_init(Object *obj)
>
>      /* inherited from parent obj via riscv_cpu_init() */
>      cpu->cfg.ext_zifencei =3D true;
> -    cpu->cfg.ext_icsr =3D true;
> +    cpu->cfg.ext_zicsr =3D true;
>      cpu->cfg.mmu =3D true;
>      cpu->cfg.pmp =3D true;
>  }
> @@ -449,7 +449,7 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>
>      /* inherited from parent obj via riscv_cpu_init() */
>      cpu->cfg.ext_zifencei =3D true;
> -    cpu->cfg.ext_icsr =3D true;
> +    cpu->cfg.ext_zicsr =3D true;
>      cpu->cfg.pmp =3D true;
>  }
>
> @@ -495,7 +495,7 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
>      /* Enable ISA extensions */
>      cpu->cfg.mmu =3D true;
>      cpu->cfg.ext_zifencei =3D true;
> -    cpu->cfg.ext_icsr =3D true;
> +    cpu->cfg.ext_zicsr =3D true;
>      cpu->cfg.pmp =3D true;
>      cpu->cfg.ext_icbom =3D true;
>      cpu->cfg.cbom_blocksize =3D 64;
> @@ -567,7 +567,7 @@ static void rv32_sifive_u_cpu_init(Object *obj)
>
>      /* inherited from parent obj via riscv_cpu_init() */
>      cpu->cfg.ext_zifencei =3D true;
> -    cpu->cfg.ext_icsr =3D true;
> +    cpu->cfg.ext_zicsr =3D true;
>      cpu->cfg.mmu =3D true;
>      cpu->cfg.pmp =3D true;
>  }
> @@ -585,7 +585,7 @@ static void rv32_sifive_e_cpu_init(Object *obj)
>
>      /* inherited from parent obj via riscv_cpu_init() */
>      cpu->cfg.ext_zifencei =3D true;
> -    cpu->cfg.ext_icsr =3D true;
> +    cpu->cfg.ext_zicsr =3D true;
>      cpu->cfg.pmp =3D true;
>  }
>
> @@ -603,7 +603,7 @@ static void rv32_ibex_cpu_init(Object *obj)
>
>      /* inherited from parent obj via riscv_cpu_init() */
>      cpu->cfg.ext_zifencei =3D true;
> -    cpu->cfg.ext_icsr =3D true;
> +    cpu->cfg.ext_zicsr =3D true;
>      cpu->cfg.pmp =3D true;
>  }
>
> @@ -620,7 +620,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>
>      /* inherited from parent obj via riscv_cpu_init() */
>      cpu->cfg.ext_zifencei =3D true;
> -    cpu->cfg.ext_icsr =3D true;
> +    cpu->cfg.ext_zicsr =3D true;
>      cpu->cfg.pmp =3D true;
>  }
>  #endif
> @@ -1243,7 +1243,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[]=
 =3D {
>      /* Defaults for standard extensions */
>      MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
>      MULTI_EXT_CFG_BOOL("zifencei", ext_zifencei, true),
> -    MULTI_EXT_CFG_BOOL("zicsr", ext_icsr, true),
> +    MULTI_EXT_CFG_BOOL("zicsr", ext_zicsr, true),
>      MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
>      MULTI_EXT_CFG_BOOL("zihintpause", ext_zihintpause, true),
>      MULTI_EXT_CFG_BOOL("zawrs", ext_zawrs, true),
> @@ -1348,7 +1348,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental=
_exts[] =3D {
>  /* Deprecated entries marked for future removal */
>  const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[] =3D {
>      MULTI_EXT_CFG_BOOL("Zifencei", ext_zifencei, true),
> -    MULTI_EXT_CFG_BOOL("Zicsr", ext_icsr, true),
> +    MULTI_EXT_CFG_BOOL("Zicsr", ext_zicsr, true),
>      MULTI_EXT_CFG_BOOL("Zihintntl", ext_zihintntl, true),
>      MULTI_EXT_CFG_BOOL("Zihintpause", ext_zihintpause, true),
>      MULTI_EXT_CFG_BOOL("Zawrs", ext_zawrs, true),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index a3f96eb878..9ea30da7e0 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -62,7 +62,7 @@ struct RISCVCPUConfig {
>      bool ext_zksh;
>      bool ext_zkt;
>      bool ext_zifencei;
> -    bool ext_icsr;
> +    bool ext_zicsr;
>      bool ext_icbom;
>      bool ext_icboz;
>      bool ext_zicond;
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 4b4ab56c40..30cc21e979 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3858,7 +3858,7 @@ static inline RISCVException riscv_csrrw_check(CPUR=
ISCVState *env,
>      int csr_min_priv =3D csr_ops[csrno].min_priv_ver;
>
>      /* ensure the CSR extension is enabled */
> -    if (!riscv_cpu_cfg(env)->ext_icsr) {
> +    if (!riscv_cpu_cfg(env)->ext_zicsr) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 524bede865..58b3ace0fe 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -342,7 +342,7 @@ void riscv_cpu_register_gdb_regs_for_features(CPUStat=
e *cs)
>          g_assert_not_reached();
>      }
>
> -    if (cpu->cfg.ext_icsr) {
> +    if (cpu->cfg.ext_zicsr) {
>          int base_reg =3D cs->gdb_num_regs;
>          gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_cs=
r,
>                                   riscv_gen_dynamic_csr_xml(cs, base_reg)=
,
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 9b8f3f54a7..418b040d6d 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -278,10 +278,10 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cp=
u, Error **errp)
>          !(riscv_has_ext(env, RVI) && riscv_has_ext(env, RVM) &&
>            riscv_has_ext(env, RVA) && riscv_has_ext(env, RVF) &&
>            riscv_has_ext(env, RVD) &&
> -          cpu->cfg.ext_icsr && cpu->cfg.ext_zifencei)) {
> +          cpu->cfg.ext_zicsr && cpu->cfg.ext_zifencei)) {
>
> -        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_icsr)) &&
> -            !cpu->cfg.ext_icsr) {
> +        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zicsr)) &&
> +            !cpu->cfg.ext_zicsr) {
>              error_setg(errp, "RVG requires Zicsr but user set Zicsr to f=
alse");
>              return;
>          }
> @@ -293,7 +293,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu,=
 Error **errp)
>              return;
>          }
>
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_icsr), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zicsr), true);
>          cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zifencei), true)=
;
>
>          env->misa_ext |=3D RVI | RVM | RVA | RVF | RVD;
> @@ -329,7 +329,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu,=
 Error **errp)
>          return;
>      }
>
> -    if (riscv_has_ext(env, RVF) && !cpu->cfg.ext_icsr) {
> +    if (riscv_has_ext(env, RVF) && !cpu->cfg.ext_zicsr) {
>          error_setg(errp, "F extension requires Zicsr");
>          return;
>      }
> @@ -434,7 +434,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu,=
 Error **errp)
>      }
>
>      if (cpu->cfg.ext_zfinx) {
> -        if (!cpu->cfg.ext_icsr) {
> +        if (!cpu->cfg.ext_zicsr) {
>              error_setg(errp, "Zfinx extension requires Zicsr");
>              return;
>          }
> @@ -494,7 +494,7 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu,=
 Error **errp)
>          return;
>      }
>
> -    if (cpu->cfg.ext_zcmt && !cpu->cfg.ext_icsr) {
> +    if (cpu->cfg.ext_zcmt && !cpu->cfg.ext_zicsr) {
>          error_setg(errp, "Zcmt extension requires Zicsr extension");
>          return;
>      }
> --
> 2.41.0
>
>

