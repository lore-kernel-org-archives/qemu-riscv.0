Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188DDC77B7A
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 May 2023 04:50:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzVb5-0005VI-Mg; Thu, 18 May 2023 00:50:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pzVap-0005OP-NJ; Thu, 18 May 2023 00:50:25 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pzVac-0000Qd-El; Thu, 18 May 2023 00:50:22 -0400
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-77d05b9c4a6so535392241.0; 
 Wed, 17 May 2023 21:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684385409; x=1686977409;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MlbIocDfKe5EPets2g2roOmTKbjCXqv+3dsD8PLiGr4=;
 b=HC280H+iIVQuENqdbBq0mHQ/W3hPW7m9ys+d3X4YvA/sn/sDqpcPFZ/NTM17DfN/z5
 xUyn2bkyQV697hz5zqu20wS4qUHwk6Fmad2h3vpTIBb2ymQi82LoypeELOVTdLvFvJAP
 6jqt/51VX1yZGQK6CWBtIlgGnFYSOPlucQdu+eju6EfTXkhLGUttPeHlQ0E9BJMJrlvi
 e4NCzSmMJSgopW5NHqP/vchWdLlRA9FSXOoiiMFXhsJlepqvWrKzYNT8rAbaD6FSsXLp
 KWZFXxVkxsAku/VOsF4CyHSqQMAxk7q54TCiu8hAali5TYPffpyTSxSfVJ70LP0JZ+6+
 tOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684385409; x=1686977409;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MlbIocDfKe5EPets2g2roOmTKbjCXqv+3dsD8PLiGr4=;
 b=HpK7+7nZ/zl1YXOWqnMGvNLccExsN3tVhNnE4Z0PUSZnfqM9p+rUToqJoTGnefm+Cy
 GCSDJpE5eSWP13iFrcC4Gdje+cXMNAuoLBVTOEzZG9eJc3dy/v/iLjlCNpBJOOpo3JmT
 5gD1oAZeaux2/eKEiPb86cHsHxtKUABw777I2RLR6Sats5394xFQo+RgFltassrvpZ1K
 SMpiZI6YfC0GLjZCemPUzIDP203CSIN6iTlY12fdZ16e+g+0X67weZ/JIdXU999qXuAn
 aiabk+oB4+l56cKO6xx7GcuxZ+FCMOqevbJENAPIlGwhCMU+7HwKOYoDbhhHVTkGmvJM
 Be2A==
X-Gm-Message-State: AC+VfDwYQAE3W63qa/fLuGYhfBZUU+0okocOZb4kYjuplm4f+IoFIfxe
 8QsrMoc9KZTK+4UPPHG/MaFIESmwIrZZWJAy0js=
X-Google-Smtp-Source: ACHHUZ6nwLuiGv4KQm4T/QLg85u0pE16IfpZNwcbO7AY9VG3q2iHggvd6XSVkMKXqo6Yvmvf6tMAsHa5PJ9n/sUBV08=
X-Received: by 2002:a1f:410b:0:b0:44f:d211:2e01 with SMTP id
 o11-20020a1f410b000000b0044fd2112e01mr260881vka.14.1684385407322; Wed, 17 May
 2023 21:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230517135714.211809-1-dbarboza@ventanamicro.com>
 <20230517135714.211809-12-dbarboza@ventanamicro.com>
In-Reply-To: <20230517135714.211809-12-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 18 May 2023 14:49:41 +1000
Message-ID: <CAKmqyKPqw7Le11tDsguJFRK_FDHcjktxHPJo-VuTZAQ7ZK_8-A@mail.gmail.com>
Subject: Re: [PATCH v9 11/11] target/riscv: rework write_misa()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x931.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, May 17, 2023 at 11:58=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> write_misa() must use as much common logic as possible. We want to open
> code just the bits that are exclusive to the CSR write operation and TCG
> internals.
>
> Our validation is done with riscv_cpu_validate_set_extensions(), but we
> need a small tweak first. When enabling RVG we're doing:
>
>         env->misa_ext |=3D RVI | RVM | RVA | RVF | RVD;
>         env->misa_ext_mask =3D env->misa_ext;
>
> This works fine for realize() time but this can potentially overwrite
> env->misa_ext_mask if we reutilize the function for write_misa().
>
> Instead of doing misa_ext_mask =3D misa_ext, sum up the RVG extensions in
> misa_ext_mask as well. This won't change realize() time behavior
> (misa_ext_mask will be =3D=3D misa_ext) and will ensure that write_misa()
> won't change misa_ext_mask by accident.
>
> After that, rewrite write_misa() to work as follows:
>
> - mask the write using misa_ext_mask to avoid enabling unsupported
>   extensions;
>
> - suppress RVC if the next insn isn't aligned;
>
> - disable RVG if any of RVG dependencies are being disabled by the user;
>
> - assign env->misa_ext and run riscv_cpu_validate_set_extensions(). On
>   error, rollback env->misa_ext to its original value, logging a
>   GUEST_ERROR to inform the user about the failed write;
>
> - handle RVF and MSTATUS_FS and continue as usual.
>
> Let's keep write_misa() as experimental for now until this logic gains
> enough mileage.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c |  4 ++--
>  target/riscv/cpu.h |  1 +
>  target/riscv/csr.c | 51 ++++++++++++++++++++++------------------------
>  3 files changed, 27 insertions(+), 29 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 52f91ff8cf..6d4748bf24 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -981,7 +981,7 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu=
, Error **errp)
>   * Check consistency between chosen extensions while setting
>   * cpu->cfg accordingly.
>   */
> -static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **err=
p)
> +void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>  {
>      CPURISCVState *env =3D &cpu->env;
>      Error *local_err =3D NULL;
> @@ -997,7 +997,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCP=
U *cpu, Error **errp)
>          cpu->cfg.ext_ifencei =3D true;
>
>          env->misa_ext |=3D RVI | RVM | RVA | RVF | RVD;
> -        env->misa_ext_mask =3D env->misa_ext;
> +        env->misa_ext_mask |=3D RVI | RVM | RVA | RVF | RVD;
>      }
>
>      if (riscv_has_ext(env, RVI) && riscv_has_ext(env, RVE)) {
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 15423585d0..1f39edc687 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -548,6 +548,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, =
int size,
>                          bool probe, uintptr_t retaddr);
>  char *riscv_isa_string(RISCVCPU *cpu);
>  void riscv_cpu_list(void);
> +void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp);
>
>  #define cpu_list riscv_cpu_list
>  #define cpu_mmu_index riscv_cpu_mmu_index
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 4451bd1263..cf7da4f87f 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1387,39 +1387,18 @@ static RISCVException read_misa(CPURISCVState *en=
v, int csrno,
>  static RISCVException write_misa(CPURISCVState *env, int csrno,
>                                   target_ulong val)
>  {
> +    RISCVCPU *cpu =3D env_archcpu(env);
> +    uint32_t orig_misa_ext =3D env->misa_ext;
> +    Error *local_err =3D NULL;
> +
>      if (!riscv_cpu_cfg(env)->misa_w) {
>          /* drop write to misa */
>          return RISCV_EXCP_NONE;
>      }
>
> -    /* 'I' or 'E' must be present */
> -    if (!(val & (RVI | RVE))) {
> -        /* It is not, drop write to misa */
> -        return RISCV_EXCP_NONE;
> -    }
> -
> -    /* 'E' excludes all other extensions */
> -    if (val & RVE) {
> -        /*
> -         * when we support 'E' we can do "val =3D RVE;" however
> -         * for now we just drop writes if 'E' is present.
> -         */
> -        return RISCV_EXCP_NONE;
> -    }
> -
> -    /*
> -     * misa.MXL writes are not supported by QEMU.
> -     * Drop writes to those bits.
> -     */
> -
>      /* Mask extensions that are not supported by this hart */
>      val &=3D env->misa_ext_mask;
>
> -    /* 'D' depends on 'F', so clear 'D' if 'F' is not present */
> -    if ((val & RVD) && !(val & RVF)) {
> -        val &=3D ~RVD;
> -    }
> -
>      /*
>       * Suppress 'C' if next instruction is not aligned
>       * TODO: this should check next_pc
> @@ -1428,18 +1407,36 @@ static RISCVException write_misa(CPURISCVState *e=
nv, int csrno,
>          val &=3D ~RVC;
>      }
>
> +    /* Disable RVG if any of its dependencies are disabled */
> +    if (!(val & RVI && val & RVM && val & RVA &&
> +          val & RVF && val & RVD)) {
> +        val &=3D ~RVG;
> +    }
> +
>      /* If nothing changed, do nothing. */
>      if (val =3D=3D env->misa_ext) {
>          return RISCV_EXCP_NONE;
>      }
>
> -    if (!(val & RVF)) {
> +    env->misa_ext =3D val;
> +    riscv_cpu_validate_set_extensions(cpu, &local_err);
> +    if (local_err !=3D NULL) {
> +        /* Rollback on validation error */
> +        qemu_log_mask(LOG_GUEST_ERROR, "Unable to write MISA ext value "
> +                      "0x%x, keeping existing MISA ext 0x%x\n",
> +                      env->misa_ext, orig_misa_ext);
> +
> +        env->misa_ext =3D orig_misa_ext;
> +
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    if (!(env->misa_ext & RVF)) {
>          env->mstatus &=3D ~MSTATUS_FS;
>      }
>
>      /* flush translation cache */
>      tb_flush(env_cpu(env));
> -    env->misa_ext =3D val;
>      env->xl =3D riscv_cpu_mxl(env);
>      return RISCV_EXCP_NONE;
>  }
> --
> 2.40.1
>
>

