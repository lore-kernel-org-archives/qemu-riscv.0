Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82137C7EE2E
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 04:59:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8ZeP-0004eM-0Y; Mon, 12 Jun 2023 00:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8ZeL-0004bh-7Y; Mon, 12 Jun 2023 00:59:30 -0400
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8ZeJ-0002e3-El; Mon, 12 Jun 2023 00:59:28 -0400
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-46288dcacb5so1150365e0c.3; 
 Sun, 11 Jun 2023 21:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686545965; x=1689137965;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z9sNA9OJGqc1Ib1amtQG4m3ZKe9U2YZZkJOFPx3Sj3Q=;
 b=mAV1Tk+6on5XppjIft6Jy+7P8dcOl50G/CiLKezJVDlybmo0q6CgEftcXV4RHl2uOO
 HWhaGi4wkfIWmW4JcAZDIxussq5ok4v0MQr6p27352iPPt/bnzxahRznGuGS1lbgOuc8
 /f5BLXcheIjx3Jp3eDoWBxNGDQpamFFIDZZUrQRO6ZtkWDbdeGXfGvNnX/IvRisieAmx
 JvCkJMX2me0q4FxK/CXD4ZjyeoA2eZsMooVNzwpUUIsmB7agIh0wBcOZtMCN6A6OAfri
 lJsGShJ9ICyG9Dsx4wJ0H4SO5TTEdoKUhDA2+gWkI7DBDxC+9MZwSvpSYdorTNG1q5sr
 iP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686545965; x=1689137965;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z9sNA9OJGqc1Ib1amtQG4m3ZKe9U2YZZkJOFPx3Sj3Q=;
 b=gs4t7xgWcI9YoJ8KBC7pK5KCuuEQEIRegz3seN1wO+gVmXsOoplO4mG34MceGW7MXQ
 xcJeWGRlg+rqtxrjIHjQBEFmHLA0aRP8yLGu2aX1DoTOQMQcmt0HHMyk3F3nEmICBW8v
 jlCFlyCpZVYzStNTKYoSVMKbWmLY7MxC56DYxenS3Unz3cRrcOW4BozxIMX6+0sbJnCt
 ddN7n4QxHjUJhZXY294lUU0+Ag66deOH3nVwqV1Znm2VTblIrRDZSsskarednlCZW1cf
 wjpDFn/m4RX2BQBS2vrq79p5fwjGu/3TpuVRphOuK+OLN3fw5tkcPrMkaRG7OGsVE/sH
 rERQ==
X-Gm-Message-State: AC+VfDzHntTvOkD7WXquUunga5k7aG1Q4jrwT5kxTdN1yAPJSyFc+QA2
 hVsSyTXp9X/uWTxBRVI9iq2peputLXxPtccbcfY=
X-Google-Smtp-Source: ACHHUZ7qRypLXyrob/OaCipR+xkdCFcUxDadEfUtfPKzfYunJr1qvmHbUqPT5V9nXn3GQpWWQkCKxvp43/5GQIaFzWs=
X-Received: by 2002:a05:6102:2741:b0:43b:2507:4419 with SMTP id
 p1-20020a056102274100b0043b25074419mr3000637vsu.32.1686545965605; Sun, 11 Jun
 2023 21:59:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230608072314.3561109-1-tommy.wu@sifive.com>
 <20230608072314.3561109-3-tommy.wu@sifive.com>
In-Reply-To: <20230608072314.3561109-3-tommy.wu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jun 2023 14:58:59 +1000
Message-ID: <CAKmqyKO9kcK=FB+gy534dmy9DmKMJF-+Mdm1dOs-WmNxjpOaxQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] target/riscv: Add Smrnmi CSRs.
To: Tommy Wu <tommy.wu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, frank.chang@sifive.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
 richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2e.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Jun 8, 2023 at 5:25=E2=80=AFPM Tommy Wu <tommy.wu@sifive.com> wrote=
:
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Signed-off-by: Tommy Wu <tommy.wu@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c      |  5 +++
>  target/riscv/cpu.h      |  4 ++
>  target/riscv/cpu_bits.h | 11 ++++++
>  target/riscv/csr.c      | 82 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 102 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c8dc0eaa87..ee0a4bf33f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -810,6 +810,11 @@ static void riscv_cpu_reset_hold(Object *obj)
>          riscv_trigger_init(env);
>      }
>
> +    if (cpu->cfg.ext_smrnmi) {
> +        env->rnmip =3D 0;
> +        env->mnstatus =3D set_field(env->mnstatus, MNSTATUS_NMIE, false)=
;
> +    }
> +
>      if (kvm_enabled()) {
>          kvm_riscv_reset_vcpu(cpu);
>      }
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 6c14b93cb5..f44fd95f16 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -368,6 +368,10 @@ struct CPUArchState {
>      uint64_t kvm_timer_frequency;
>
>      /* RNMI */
> +    target_ulong mnscratch;
> +    target_ulong mnepc;
> +    target_ulong mncause; /* mncause without bit XLEN-1 set to 1 */
> +    target_ulong mnstatus;
>      target_ulong rnmip;
>      uint64_t rnmi_irqvec;
>      uint64_t rnmi_excpvec;
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 7cb43b88f3..d7bd4538ab 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -355,6 +355,12 @@
>  #define CSR_PMPADDR14       0x3be
>  #define CSR_PMPADDR15       0x3bf
>
> +/* RNMI */
> +#define CSR_MNSCRATCH       0x740
> +#define CSR_MNEPC           0x741
> +#define CSR_MNCAUSE         0x742
> +#define CSR_MNSTATUS        0x744
> +
>  /* Debug/Trace Registers (shared with Debug Mode) */
>  #define CSR_TSELECT         0x7a0
>  #define CSR_TDATA1          0x7a1
> @@ -624,6 +630,11 @@ typedef enum {
>  #define SATP64_ASID         0x0FFFF00000000000ULL
>  #define SATP64_PPN          0x00000FFFFFFFFFFFULL
>
> +/* RNMI mnstatus CSR mask */
> +#define MNSTATUS_NMIE       0x00000008
> +#define MNSTATUS_MNPV       0x00000080
> +#define MNSTATUS_MNPP       0x00001800
> +
>  /* VM modes (satp.mode) privileged ISA 1.10 */
>  #define VM_1_10_MBARE       0
>  #define VM_1_10_SV32        1
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 4451bd1263..a1d39fc116 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -536,6 +536,18 @@ static RISCVException debug(CPURISCVState *env, int =
csrno)
>
>      return RISCV_EXCP_ILLEGAL_INST;
>  }
> +
> +static RISCVException rnmi(CPURISCVState *env, int csrno)
> +{
> +    RISCVCPU *cpu =3D env_archcpu(env);
> +
> +    if (cpu->cfg.ext_smrnmi) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    return RISCV_EXCP_ILLEGAL_INST;
> +}
> +
>  #endif
>
>  static RISCVException seed(CPURISCVState *env, int csrno)
> @@ -2336,6 +2348,66 @@ static RISCVException rmw_miph(CPURISCVState *env,=
 int csrno,
>      return ret;
>  }
>
> +static int read_mnscratch(CPURISCVState *env, int csrno, target_ulong *v=
al)
> +{
> +    *val =3D env->mnscratch;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_mnscratch(CPURISCVState *env, int csrno, target_ulong v=
al)
> +{
> +    env->mnscratch =3D val;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int read_mnepc(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val =3D env->mnepc;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_mnepc(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->mnepc =3D val;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int read_mncause(CPURISCVState *env, int csrno, target_ulong *val=
)
> +{
> +    *val =3D env->mncause;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_mncause(CPURISCVState *env, int csrno, target_ulong val=
)
> +{
> +    env->mncause =3D val;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int read_mnstatus(CPURISCVState *env, int csrno, target_ulong *va=
l)
> +{
> +    *val =3D env->mnstatus;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_mnstatus(CPURISCVState *env, int csrno, target_ulong va=
l)
> +{
> +    target_ulong mask =3D (MNSTATUS_NMIE | MNSTATUS_MNPP);
> +
> +    if (riscv_has_ext(env, RVH)) {
> +        /* Flush tlb on mnstatus fields that affect VM. */
> +        if ((val ^ env->mnstatus) & MNSTATUS_MNPV) {
> +            tlb_flush(env_cpu(env));
> +        }
> +
> +        mask |=3D MNSTATUS_MNPV;
> +    }
> +
> +    /* mnstatus.mnie can only be cleared by hardware. */
> +    env->mnstatus =3D (env->mnstatus & MNSTATUS_NMIE) | (val & mask);
> +    return RISCV_EXCP_NONE;
> +}
> +
>  /* Supervisor Trap Setup */
>  static RISCVException read_sstatus_i128(CPURISCVState *env, int csrno,
>                                          Int128 *val)
> @@ -4204,6 +4276,16 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
>                          write_sstateen_1_3,
>                          .min_priv_ver =3D PRIV_VERSION_1_12_0 },
>
> +    /* RNMI */
> +    [CSR_MNSCRATCH] =3D { "mnscratch", rnmi, read_mnscratch, write_mnscr=
atch,
> +                        .min_priv_ver =3D PRIV_VERSION_1_12_0           =
    },
> +    [CSR_MNEPC]     =3D { "mnepc",     rnmi, read_mnepc,     write_mnepc=
,
> +                        .min_priv_ver =3D PRIV_VERSION_1_12_0           =
    },
> +    [CSR_MNCAUSE]   =3D { "mncause",   rnmi, read_mncause,   write_mncau=
se,
> +                        .min_priv_ver =3D PRIV_VERSION_1_12_0           =
    },
> +    [CSR_MNSTATUS]  =3D { "mnstatus",  rnmi, read_mnstatus,  write_mnsta=
tus,
> +                        .min_priv_ver =3D PRIV_VERSION_1_12_0           =
    },
> +
>      /* Supervisor Trap Setup */
>      [CSR_SSTATUS]    =3D { "sstatus",    smode, read_sstatus,    write_s=
status,
>                           NULL,                read_sstatus_i128         =
     },
> --
> 2.31.1
>
>

