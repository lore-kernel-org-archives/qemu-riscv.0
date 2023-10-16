Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC32CDB465
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 05:29:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsGA0-0004GH-ET; Mon, 16 Oct 2023 01:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsG9x-0004Fv-Jw; Mon, 16 Oct 2023 01:28:57 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsG9v-00048f-Tl; Mon, 16 Oct 2023 01:28:57 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id
 ada2fe7eead31-457bac7c3f5so1545998137.2; 
 Sun, 15 Oct 2023 22:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697434134; x=1698038934; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=38cVfCjgtPkohZyzBawYN/bYALWZn0zv6tdMmOMVwFQ=;
 b=cnQZi6OiCkBBSaTgkTVHlgpmrE/wQQNq6L1udRmyvRjEj0rU/Qw3vKn9xG/fw3FU91
 MK0HIEb/vHn8f7Rbs+3P8j9uwHqXSk3dwf8hNvT4QcplYQXZb7612jiFtZdlTOhpGVFd
 opOC7vzDaqWq66/l7C4SoZqZ6eEz4AO73olT002j5JBIHASqqQhYm1Ug4G1DllLOnkGp
 QEio/TKO7YpbEd/ZNMo0yM570vYvCQYu9ASxUkAwmkNQWW9vnW40eta9ch03KG+GBcc9
 5kS2DpgGrcTwfsq80f/+VQ3q5zZ7hegx8z8ZYZ1sj/MAFNb+MwZg8cbjWUuOIXIJTsKT
 PYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697434134; x=1698038934;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=38cVfCjgtPkohZyzBawYN/bYALWZn0zv6tdMmOMVwFQ=;
 b=eOmDRYJwDZTAxh3WMK0u3o8ZRaBjlso/1bkh9m7k2wnh8XbTsBy70DTpOb8eaTjv9W
 T1wZ2huHvp4Yo50E6M1NflfNxwLL6Ug7zm9nzUwfXdDCAgUzeLLlBzUszpYWlmyaBq0P
 B//qG9vvtNLbFm1eSTqwGCscbKINiiT+5JDiABIEcnjdMBNesuS2AtqY4JU/LpSPF0oE
 OWw+cOQFtnfDLhmEEy8Du73psmwxtQtzTWUWR2jPv+Jix8OTXy2ZraoCxUXSovKnazsx
 i3XtTiiZbBjBaXQLtG5P7q+NNQHLzZ6+w4lVPQIphezuwuD7HdPCXaDnqXAsp/V5h/nN
 6XMA==
X-Gm-Message-State: AOJu0Ywa41w/H9WG+0x17o1/6xxhw8ndFwJpq1YifZQA/uSteTNpYxn3
 oGR2TdMvVKc5II6Hzm3/QVGzsaQfq3xtd4M/k/c=
X-Google-Smtp-Source: AGHT+IEKx3eNhoPT5vmpDx6dsXefALzTDkH5zjjZJZJhoBHrSh7fj7LLeeT5q1TyoXChIKL5/LkLZCtKXvwTsfZkN0c=
X-Received: by 2002:a67:e114:0:b0:457:e828:3747 with SMTP id
 d20-20020a67e114000000b00457e8283747mr1406523vsl.5.1697434134272; Sun, 15 Oct
 2023 22:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230926184019.166352-1-dbarboza@ventanamicro.com>
 <20230926184019.166352-6-dbarboza@ventanamicro.com>
In-Reply-To: <20230926184019.166352-6-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Oct 2023 15:28:27 +1000
Message-ID: <CAKmqyKMV_O83YETxcC4ha7CiZfWs7+aY7CHg7Ei9dHimjN28kw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] target/riscv: add
 riscv_cpu_accelerator_compatible()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2c.google.com
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

On Wed, Sep 27, 2023 at 4:42=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Add an API to check if a given CPU is compatible with the current
> accelerator.
>
> This will allow query-cpu-model-expansion to work properly in conditions
> where QEMU supports both accelerators (TCG and KVM), QEMU is then
> launched using TCG, and the API requests information about a KVM only
> CPU (e.g. 'host' CPU).
>
> KVM doesn't have such restrictions and, at least in theory, all CPUs
> models should work with KVM. We will revisit this API in case we decide
> to restrict the amount of KVM CPUs we support.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c         | 9 +++++++++
>  target/riscv/cpu.h         | 1 +
>  target/riscv/tcg/tcg-cpu.c | 7 ++++++-
>  target/riscv/tcg/tcg-cpu.h | 1 +
>  4 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 272baaf6c7..8bdf6dbd5d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1061,6 +1061,15 @@ static void riscv_cpu_realize(DeviceState *dev, Er=
ror **errp)
>      mcc->parent_realize(dev, errp);
>  }
>
> +bool riscv_cpu_accelerator_compatible(RISCVCPU *cpu)
> +{
> +    if (tcg_enabled()) {
> +        return riscv_cpu_tcg_compatible(cpu);
> +    }
> +
> +    return true;
> +}
> +
>  #ifndef CONFIG_USER_ONLY
>  static void cpu_riscv_get_satp(Object *obj, Visitor *v, const char *name=
,
>                                 void *opaque, Error **errp)
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 1bfa3da55b..00b0507b17 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -734,6 +734,7 @@ char *riscv_cpu_get_name(RISCVCPU *cpu);
>
>  void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
>  void riscv_add_satp_mode_properties(Object *obj);
> +bool riscv_cpu_accelerator_compatible(RISCVCPU *cpu);
>
>  /* CSR function table */
>  extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 52cd87db0c..071a744a43 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -582,6 +582,11 @@ void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, =
Error **errp)
>      }
>  }
>
> +bool riscv_cpu_tcg_compatible(RISCVCPU *cpu)
> +{
> +    return object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST) =3D=3D =
NULL;
> +}
> +
>  static bool riscv_cpu_is_generic(Object *cpu_obj)
>  {
>      return object_dynamic_cast(cpu_obj, TYPE_RISCV_DYNAMIC_CPU) !=3D NUL=
L;
> @@ -599,7 +604,7 @@ static bool tcg_cpu_realizefn(CPUState *cs, Error **e=
rrp)
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      Error *local_err =3D NULL;
>
> -    if (object_dynamic_cast(OBJECT(cpu), TYPE_RISCV_CPU_HOST)) {
> +    if (!riscv_cpu_tcg_compatible(cpu)) {
>          g_autofree char *name =3D riscv_cpu_get_name(cpu);
>          error_setg(errp, "'%s' CPU is not compatible with TCG accelerati=
on",
>                     name);
> diff --git a/target/riscv/tcg/tcg-cpu.h b/target/riscv/tcg/tcg-cpu.h
> index aa00fbc253..f7b32417f8 100644
> --- a/target/riscv/tcg/tcg-cpu.h
> +++ b/target/riscv/tcg/tcg-cpu.h
> @@ -24,5 +24,6 @@
>
>  void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp);
>  void riscv_tcg_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
> +bool riscv_cpu_tcg_compatible(RISCVCPU *cpu);
>
>  #endif
> --
> 2.41.0
>
>

