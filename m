Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EF6C001DE
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 17:32:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU9W2-0006oR-3n; Thu, 10 Aug 2023 13:32:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU9Vt-0006j6-LS; Thu, 10 Aug 2023 13:32:02 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU9Vr-0002jc-Q7; Thu, 10 Aug 2023 13:31:57 -0400
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-447c7607b72so471028137.1; 
 Thu, 10 Aug 2023 10:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691688714; x=1692293514;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1J0vTa7mHuDVkqX8mKVlHvir8t3IpF57p9K7tWmKFW4=;
 b=I8iraKwITYY2DbdAtZZDA5FGtZuSVtWJNl2JC4Pn69OM6LYetb5gjTd7qMBI73LlyL
 bumSnkZ+wpoteIETI+vLBd7NstTxH74L9qmbJWtjFrzfOCQlz3NyWjK3h1gJeuHhAgbD
 knf+OWg7IVszQvXdxHVwG7Wc1LAIMS4Cb9cruZ/RyaMoBm/gtlCHlAyImrQVY5qWG9/j
 yf2yddIImq7ZpILLUxMwvF59ioIJaUH5pM7g9qOh0/O4vP9pnf2+xrQCwepH0n7chVmW
 vWmBMzWBp1l76PdjtwuhTdpjiX1W9uZVDg47FCRy1XJwRZ/UtsK4PVuOT7SHamxt2Hr7
 QL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691688714; x=1692293514;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1J0vTa7mHuDVkqX8mKVlHvir8t3IpF57p9K7tWmKFW4=;
 b=F7pwMAUX//YCO5ZBwyLR91M66Mc/2IJn6gGMq3pe8jY5/kBKSZT61wCBLQmA31XljW
 KTYFo8V63gw4S0ESDKBuou73LmXBRl7vFJbuSvJb8xON7gS1QW8fX0yGHbeDGeLOvXxz
 Rv6i3FpQFwJDpi2XOj1pc8Fkj+NEDYBgE0TC7+YcTPcGcJ2zIE+gp9JcxDBE+GCUdQKD
 CgsAw+DqJ360MHDitnY1rVkvFzEyJBCJ/5gtBImxz9EBlc2HoeMawKUS2AbkQInd/x2T
 p8d2tCQJzHGgOSR4IbxKMDoc+DrTn27z9xeOhjiMBxGabaRvVXJ4fTayf4TSj5VAC/Jw
 cc7g==
X-Gm-Message-State: AOJu0Yy8PfdhOczLoKmbg8rp2uS+Zwg8t6G7wCggOOTXlKF95amnvzPO
 4eEDW2TDNYa++27rAzXNMW0cIBEqunZoZLyZUC0=
X-Google-Smtp-Source: AGHT+IFoAPatA0tIrSI4vW1yPB0dWeXaKiNCBmjm1qxs6qYbimADXKeW1+iwvcyGKnOEpWGOwdnwnpnH1jNhJEvOAwg=
X-Received: by 2002:a05:6102:24d:b0:443:7c69:4743 with SMTP id
 a13-20020a056102024d00b004437c694743mr2410949vsq.16.1691688713936; Thu, 10
 Aug 2023 10:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230728131520.110394-1-dbarboza@ventanamicro.com>
 <20230728131520.110394-3-dbarboza@ventanamicro.com>
In-Reply-To: <20230728131520.110394-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Aug 2023 13:31:28 -0400
Message-ID: <CAKmqyKMw2=Qbcvr-osegDxiodg+EDYaCJ-_QSeSaS8g6Mbp7Qw@mail.gmail.com>
Subject: Re: [PATCH 2/8] target/riscv: make CPUCFG() macro public
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
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

On Fri, Jul 28, 2023 at 9:20=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The RISC-V KVM driver uses a CPUCFG() macro that calculates the offset
> of a certain field in the struct RISCVCPUConfig. We're going to use this
> macro in target/riscv/cpu.c as well in the next patches. Make it public.
>
> Rename it to CPU_CFG_OFFSET() for more clarity while we're at it.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 2 +-
>  target/riscv/cpu.h | 2 ++
>  target/riscv/kvm.c | 8 +++-----
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 644ce7a018..3e62881d85 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -48,7 +48,7 @@ struct isa_ext_data {
>  };
>
>  #define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
> -    {#_name, _min_ver, offsetof(struct RISCVCPUConfig, _prop)}
> +    {#_name, _min_ver, CPU_CFG_OFFSET(_prop)}
>
>  /*
>   * From vector_helper.c
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 6ea22e0eea..577abcd724 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -62,6 +62,8 @@
>  const char *riscv_get_misa_ext_name(uint32_t bit);
>  const char *riscv_get_misa_ext_description(uint32_t bit);
>
> +#define CPU_CFG_OFFSET(_prop) offsetof(struct RISCVCPUConfig, _prop)
> +
>  /* Privileged specification version */
>  enum {
>      PRIV_VERSION_1_10_0 =3D 0,
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 9d8a8982f9..9b8565d809 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -198,10 +198,8 @@ static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *=
cpu, CPUState *cs)
>      }
>  }
>
> -#define CPUCFG(_prop) offsetof(struct RISCVCPUConfig, _prop)
> -
>  #define KVM_EXT_CFG(_name, _prop, _reg_id) \
> -    {.name =3D _name, .offset =3D CPUCFG(_prop), \
> +    {.name =3D _name, .offset =3D CPU_CFG_OFFSET(_prop), \
>       .kvm_reg_id =3D _reg_id}
>
>  static KVMCPUConfig kvm_multi_ext_cfgs[] =3D {
> @@ -278,13 +276,13 @@ static void kvm_cpu_set_multi_ext_cfg(Object *obj, =
Visitor *v,
>
>  static KVMCPUConfig kvm_cbom_blocksize =3D {
>      .name =3D "cbom_blocksize",
> -    .offset =3D CPUCFG(cbom_blocksize),
> +    .offset =3D CPU_CFG_OFFSET(cbom_blocksize),
>      .kvm_reg_id =3D KVM_REG_RISCV_CONFIG_REG(zicbom_block_size)
>  };
>
>  static KVMCPUConfig kvm_cboz_blocksize =3D {
>      .name =3D "cboz_blocksize",
> -    .offset =3D CPUCFG(cboz_blocksize),
> +    .offset =3D CPU_CFG_OFFSET(cboz_blocksize),
>      .kvm_reg_id =3D KVM_REG_RISCV_CONFIG_REG(zicboz_block_size)
>  };
>
> --
> 2.41.0
>
>

