Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76C8C001B0
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 14:51:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUTTe-0005rw-Rs; Fri, 11 Aug 2023 10:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUTTd-0005rC-2V; Fri, 11 Aug 2023 10:50:57 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUTTb-0001zY-CJ; Fri, 11 Aug 2023 10:50:56 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-447a3d97d77so846938137.1; 
 Fri, 11 Aug 2023 07:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691765454; x=1692370254;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YZhnLwn/8GLsrVm+YjBC8U9XhBzLq6uEQ0uLpzplokM=;
 b=ocMVQr2P1NKP93OnmJH7I5F4u9l5ezDClbbGyej9YgiwaK2wUQGq8OSOjsqlvoYz9c
 G7iNIXUJK1pm4WwNXCsJHbNAnyRlyzBCnvEWYqYff77DuRoDTwfdKvtdOxCPwqMZcXKY
 xHYbaHu6lfP39p0Yd685mp/EBQI+qnaDh2hDFAio/qgMZpTOwZ9T7NazgOHafZ835ccb
 /OeRw20VPYHApZUUVTSdR75n73ujY9jfSW7x4eTCgZoCS8M/dB1m0SUibsRwdpugx/mo
 sOwSz+KDtTJW1LJOu5FNt0OIa8P6bkCjKAv/DeFzzseHAt29ak79XZpmCtLqQhEEUcbX
 AVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691765454; x=1692370254;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YZhnLwn/8GLsrVm+YjBC8U9XhBzLq6uEQ0uLpzplokM=;
 b=PeAkJoG60VI7/Ugzc861E7wfd1qbhGP+CrlTYvBk6pLnZQeHttb5CuzJb223z/RGJQ
 NbENFaxN6dLocAj97nbEuA4FeSvx4/Gk8nxRJ6PJrNznB4K8PPefY1HqruU2aAsxhzCN
 uvOCoSWl1NXh/YXCOs9GISVULN68IysyzAV8kHNLmX/+wGsBHyUD1f+PXd0Jfa9ds182
 f+y937HHjSOs3D3iEhkpcqHTMW1u7rprV5ME0oQPYrxe73N6Qpf96vH+JOHQrf9kG8Zg
 0iEbJm1FOqoiEUn5TQvUx139G9xlAXlHn853YBnNthCuarH64VYtMFyPxnjsF5iUC0w1
 ypEg==
X-Gm-Message-State: AOJu0YxXdGjoq8f8iaIX/uIxi/Wc5AzLGDPbQhk6vR++4W4o/+LdixpD
 py+h3aykM2ob0d/ZEMNa5w2d39VlI8PyrOWtpx8=
X-Google-Smtp-Source: AGHT+IHTkCoq5layrMhI8gxl0Lqu61Wfwv1wuVn9Fg7SSLssyV+TvJILj12z2pvjJOIiBeZuPo2gHyvjUu+IsCA8tic=
X-Received: by 2002:a05:6102:2854:b0:443:5943:4f7b with SMTP id
 az20-20020a056102285400b0044359434f7bmr1789109vsb.13.1691765453988; Fri, 11
 Aug 2023 07:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230728131520.110394-1-dbarboza@ventanamicro.com>
 <20230728131520.110394-4-dbarboza@ventanamicro.com>
In-Reply-To: <20230728131520.110394-4-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Aug 2023 10:50:27 -0400
Message-ID: <CAKmqyKOU+N7JCo85zGcYDDd7=ya9aZ+UDFLLY90BxHV31VsiJA@mail.gmail.com>
Subject: Re: [PATCH 3/8] target/riscv/cpu.c: introduce
 cpu_cfg_ext_auto_update()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
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

On Fri, Jul 28, 2023 at 9:22=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> During realize() time we're activating a lot of extensions based on some
> criteria, e.g.:
>
>     if (cpu->cfg.ext_zk) {
>         cpu->cfg.ext_zkn =3D true;
>         cpu->cfg.ext_zkr =3D true;
>         cpu->cfg.ext_zkt =3D true;
>     }
>
> This practice resulted in at least one case where we ended up enabling
> something we shouldn't: RVC enabling zca/zcd/zcf when using a CPU that
> has priv_spec older than 1.12.0.
>
> We're also not considering user choice. There's no way of doing it now
> but this is about to change in the next few patches.
>
> cpu_cfg_ext_auto_update() will check for priv version mismatches before
> enabling extensions. If we have a mismatch between the current priv
> version and the extension we want to enable, do not enable it. In the
> near future, this same function will also consider user choice when
> deciding if we're going to enable/disable an extension or not.
>
> For now let's use it to handle zca/zcd/zcf enablement if RVC is enabled.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 44 +++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 41 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 3e62881d85..75dc83407e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -168,6 +168,44 @@ static void isa_ext_update_enabled(RISCVCPU *cpu, ui=
nt32_t ext_offset,
>      *ext_enabled =3D en;
>  }
>
> +static int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
> +{
> +    int i;
> +
> +    for (i =3D 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> +        if (isa_edata_arr[i].ext_enable_offset !=3D ext_offset) {
> +            continue;
> +        }
> +
> +        return isa_edata_arr[i].min_version;
> +    }
> +
> +    /* Default to oldest priv spec if no match found */
> +    return PRIV_VERSION_1_10_0;
> +}
> +
> +static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
> +                                    bool value)
> +{
> +    CPURISCVState *env =3D &cpu->env;
> +    bool prev_val =3D isa_ext_is_enabled(cpu, ext_offset);
> +    int min_version;
> +
> +    if (prev_val =3D=3D value) {
> +        return;
> +    }
> +
> +    if (value && env->priv_ver !=3D PRIV_VERSION_LATEST) {
> +        /* Do not enable it if priv_ver is older than min_version */
> +        min_version =3D cpu_cfg_ext_get_min_version(ext_offset);
> +        if (env->priv_ver < min_version) {
> +            return;
> +        }
> +    }
> +
> +    isa_ext_update_enabled(cpu, ext_offset, value);
> +}
> +
>  const char * const riscv_int_regnames[] =3D {
>      "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1=
",
>      "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a=
3",
> @@ -1248,12 +1286,12 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *=
cpu, Error **errp)
>
>      /* zca, zcd and zcf has a PRIV 1.12.0 restriction */
>      if (riscv_has_ext(env, RVC) && env->priv_ver >=3D PRIV_VERSION_1_12_=
0) {
> -        cpu->cfg.ext_zca =3D true;
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zca), true);
>          if (riscv_has_ext(env, RVF) && env->misa_mxl_max =3D=3D MXL_RV32=
) {
> -            cpu->cfg.ext_zcf =3D true;
> +            cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcf), true);
>          }
>          if (riscv_has_ext(env, RVD)) {
> -            cpu->cfg.ext_zcd =3D true;
> +            cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcd), true);
>          }
>      }
>
> --
> 2.41.0
>
>

