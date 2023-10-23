Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC4AC0032E
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 02:55:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qul5P-0001eo-D5; Sun, 22 Oct 2023 22:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qul5N-0001dy-6O; Sun, 22 Oct 2023 22:54:33 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qul5L-00075N-G0; Sun, 22 Oct 2023 22:54:32 -0400
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-49d14708479so1240401e0c.2; 
 Sun, 22 Oct 2023 19:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698029670; x=1698634470; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=897cKE31Z8E/zEM4wL2dQxHdaLDF/9RmuPVmbFB0ciw=;
 b=kYq7s9dRxOrjYK387QybYfq+KtBAywit8WJXyOoNpgUod9MrU0BNQULwPJmhcNcX8G
 uaBZkGCrvv/GcRO2VjB3CoRqzoGAU58ytRHXadmACcLOPVSS2rFlAp2fM6Tu5QQya3do
 m72jTkO42RPrq28F322AS4gh/T7O55mFxnlY3gTIQGkK6iSPMHS3BZZlrSPB6RZa8hdx
 GVGbbDCR0fUawp2j8CXXNPm9uwElULz8OzW63eLZnTFiTLfBUqaXl6wuEcpsBkDXNzLN
 wp33zuplzGR3qQNC7D93Fx+BPd5mGL8S93wpedafT6X8K5SlldWZi/3fCVjhedAsxjgk
 HjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698029670; x=1698634470;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=897cKE31Z8E/zEM4wL2dQxHdaLDF/9RmuPVmbFB0ciw=;
 b=TnPn1XHWKHOQT5G8NTBm16/LtnHr5/CIhizpg0FQVSq/gJdMMR+JV9ptNoPAv8dMzD
 rh99tRnWkzE/R1BHZyFkli8zdyUbCwocTpdOwJdGwXmgrF27KxxgHv9UZf/pfWQccuTd
 0ETHuvD7031GggpUcw8yADGX/PfgN51NFdvAObRNqWsVj+u3ZCAXyKdW5i9HcSEqjxJ1
 vO8Au4JLNZq6KBACJS4w+A1ZMm+BdDduxdZmAL4CwF+oerp7vJJToyu/4wucMbgLCIdk
 z8oIicXuYvOxL/JYyBJhHKbQgZ8XkrAXT5ZUn3ovplS3Q8snDzVPk8mwJp3lVCXTYqdM
 xp4w==
X-Gm-Message-State: AOJu0Yyj32b1ILUrewaVKvmPufzHbNgroEmx4BXn8NM+0Ln4YJTM1aIY
 7Tn2QSb46GvmjcQ8OFknC3/ml4zgwDfQoZYZ87g=
X-Google-Smtp-Source: AGHT+IHS0QyvW8+/KrVKVQHMziUMVZd0C2l2o3F5ennbToiUXXpzxq0/WXdBVij97lkrJxeMKkc2eKCl6TktZYmuz8o=
X-Received: by 2002:a1f:1fd1:0:b0:49d:d73e:5d07 with SMTP id
 f200-20020a1f1fd1000000b0049dd73e5d07mr5736126vkf.16.1698029670041; Sun, 22
 Oct 2023 19:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <20231017221226.136764-1-dbarboza@ventanamicro.com>
 <20231017221226.136764-3-dbarboza@ventanamicro.com>
In-Reply-To: <20231017221226.136764-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Oct 2023 12:54:03 +1000
Message-ID: <CAKmqyKPn+t0WH+mztkMfT73Efoch-=21QcV782q8h7S-aaTm4g@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] target/riscv/tcg: add ext_zicntr disable support
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa31.google.com
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

On Wed, Oct 18, 2023 at 8:13=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Support for the zicntr counters are already in place. We need a way to
> disable them if the user wants to. This is done by restricting access to
> the CYCLE, TIME, and INSTRET counters via the 'ctr()' predicate when
> we're about to access them.
>
> Disabling zicntr happens via the command line or if its dependency,
> zicsr, happens to be disabled. We'll check for zicsr during realize() and=
,
> in case it's absent, disable zicntr. However, if the user was explicit
> about having zicntr support, error out instead of disabling it.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

This should come before we expose the property to users though

Alistair

> ---
>  target/riscv/csr.c         | 4 ++++
>  target/riscv/tcg/tcg-cpu.c | 8 ++++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index a5be1c202c..05c6a69123 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -122,6 +122,10 @@ static RISCVException ctr(CPURISCVState *env, int cs=
rno)
>
>      if ((csrno >=3D CSR_CYCLE && csrno <=3D CSR_INSTRET) ||
>          (csrno >=3D CSR_CYCLEH && csrno <=3D CSR_INSTRETH)) {
> +        if (!riscv_cpu_cfg(env)->ext_zicntr) {
> +            return RISCV_EXCP_ILLEGAL_INST;
> +        }
> +
>          goto skip_ext_pmu_check;
>      }
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index bbce254ee1..a01b876621 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -541,6 +541,14 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu=
, Error **errp)
>          cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zksh), true);
>      }
>
> +    if (cpu->cfg.ext_zicntr && !cpu->cfg.ext_zicsr) {
> +        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zicntr))) {
> +            error_setg(errp, "zicntr requires zicsr");
> +            return;
> +        }
> +        cpu->cfg.ext_zicntr =3D false;
> +    }
> +
>      /*
>       * Disable isa extensions based on priv spec after we
>       * validated and set everything we need.
> --
> 2.41.0
>
>

