Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E40CDB465
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 04:43:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsFRx-0007vo-Bf; Mon, 16 Oct 2023 00:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsFRw-0007sP-3C; Mon, 16 Oct 2023 00:43:28 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsFRu-0005aI-BI; Mon, 16 Oct 2023 00:43:27 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-49d6bd3610cso1686953e0c.1; 
 Sun, 15 Oct 2023 21:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697431405; x=1698036205; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=13k7pIPS4GdAJ4KcnxSDjVGi0wLxorQLB7O5oWpemek=;
 b=f9Ruv0YR7mh98lynQmfVkYKQEVlljv6au2n+3ek24nrvzieC+UePXmDMIwUB6Y/EVe
 aERXOV97SpjCSaAX1RTcseTgQZrcD6AQtbPcCOAcRf3+LZwkSMIkEStrAQxaeu5xCWEE
 Flcf72MON5XO4VquK6sl4jeJ2INgLFvM6kuPI4Fnt1Pwt0hncle7LqniiNpTz+j1MOM3
 FyPPO6k08GwrTfRbjvMSTQuTmLFrxwP4MuW69zivlqM7S48SdW/jWY3p8V26Xp6eWTHH
 GRC5/mH78XK5JT0HmFg5swP1A3MuSHMbDxgbd9M0v+L2VqCwfH+dpM8VvHdWQG73wsGL
 1mUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697431405; x=1698036205;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=13k7pIPS4GdAJ4KcnxSDjVGi0wLxorQLB7O5oWpemek=;
 b=DMQFGTyMepma0R3z/vwnKTkkby3Rr+omBFfERwea33dTvHdHhEdCRTI0U7M0QKhloR
 jP0vV3G4iMC4db60QgWoo+oUw686Mnrf58pKFvNAMAFFd9bv+37HEfnljHRBwcjYknqw
 aFboBIPOQHgwCkPFK8tVGsbodCfWkYO/TsZM1sC9F2OLf5uayxaSl8cFPFn94NGpFpQl
 W/10gnS208hfgAHM1qWXGTHfgGjhRGKDI1eM+oq2P9K5gRWjRmDNTaGLf5XQ+41jtpSv
 lUP3dfNZl/AUMBIZGAzv41WdF9kTJ6NQmMVsdbvcTzVMg+CbWgDojPC5HSZ7acuXzsF8
 Vnow==
X-Gm-Message-State: AOJu0Yxd5Z8hUemnGfk+dre7tG/t3lRu71Pbk9hAMUzTOtVB7BiPsmkm
 0KXUUwLIMZyBBJ5RwNj2ucF0Lomzc15d+QIhneY=
X-Google-Smtp-Source: AGHT+IEe5xVKh0xI0grz0DTkwRKw8BP1RR89CEWceUSQtJ350PcW/vJTxXbRWOt+74spCtgq562fNPmAlJRVrep/D+A=
X-Received: by 2002:a1f:ed02:0:b0:4a0:6fd4:4333 with SMTP id
 l2-20020a1fed02000000b004a06fd44333mr18108096vkh.13.1697431405064; Sun, 15
 Oct 2023 21:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231012164604.398496-1-dbarboza@ventanamicro.com>
 <20231012164604.398496-5-dbarboza@ventanamicro.com>
In-Reply-To: <20231012164604.398496-5-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Oct 2023 14:42:58 +1000
Message-ID: <CAKmqyKO-kXuest00hUGJ3KAF=j-Pqo6B8Ni0rjwGTBxAwBd7SA@mail.gmail.com>
Subject: Re: [PATCH 4/4] target/riscv: rename ext_icboz to ext_zicboz
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
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

On Fri, Oct 13, 2023 at 4:07=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Add a leading 'z' to improve grepping. When one wants to search for uses
> of zicboz they're more likely to do 'grep -i zicboz' than 'grep -i
> icboz'.
>
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c                             | 2 +-
>  target/riscv/cpu.c                          | 6 +++---
>  target/riscv/cpu_cfg.h                      | 2 +-
>  target/riscv/insn_trans/trans_rvzicbo.c.inc | 8 ++++----
>  target/riscv/kvm/kvm-cpu.c                  | 6 +++---
>  5 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 54e0fe8ecc..1732c42915 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -268,7 +268,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s,=
 int socket,
>                                    cpu_ptr->cfg.cbom_blocksize);
>          }
>
> -        if (cpu_ptr->cfg.ext_icboz) {
> +        if (cpu_ptr->cfg.ext_zicboz) {
>              qemu_fdt_setprop_cell(ms->fdt, cpu_name, "riscv,cboz-block-s=
ize",
>                                    cpu_ptr->cfg.cboz_blocksize);
>          }
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c9020653cd..46a256fccc 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -77,7 +77,7 @@ const uint32_t misa_bits[] =3D {RVI, RVE, RVM, RVA, RVF=
, RVD, RVV,
>   */
>  const RISCVIsaExtData isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zicbom, PRIV_VERSION_1_12_0, ext_zicbom),
> -    ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_icboz),
> +    ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_zicboz),
>      ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
>      ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_zicsr),
>      ISA_EXT_DATA_ENTRY(zifencei, PRIV_VERSION_1_10_0, ext_zifencei),
> @@ -500,7 +500,7 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
>      cpu->cfg.ext_zicbom =3D true;
>      cpu->cfg.cbom_blocksize =3D 64;
>      cpu->cfg.cboz_blocksize =3D 64;
> -    cpu->cfg.ext_icboz =3D true;
> +    cpu->cfg.ext_zicboz =3D true;
>      cpu->cfg.ext_smaia =3D true;
>      cpu->cfg.ext_ssaia =3D true;
>      cpu->cfg.ext_sscofpmf =3D true;
> @@ -1285,7 +1285,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[]=
 =3D {
>      MULTI_EXT_CFG_BOOL("zhinxmin", ext_zhinxmin, false),
>
>      MULTI_EXT_CFG_BOOL("zicbom", ext_zicbom, true),
> -    MULTI_EXT_CFG_BOOL("zicboz", ext_icboz, true),
> +    MULTI_EXT_CFG_BOOL("zicboz", ext_zicboz, true),
>
>      MULTI_EXT_CFG_BOOL("zmmul", ext_zmmul, false),
>
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index e6bef0070f..208cac1c7c 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -64,7 +64,7 @@ struct RISCVCPUConfig {
>      bool ext_zifencei;
>      bool ext_zicsr;
>      bool ext_zicbom;
> -    bool ext_icboz;
> +    bool ext_zicboz;
>      bool ext_zicond;
>      bool ext_zihintntl;
>      bool ext_zihintpause;
> diff --git a/target/riscv/insn_trans/trans_rvzicbo.c.inc b/target/riscv/i=
nsn_trans/trans_rvzicbo.c.inc
> index e6ed548376..d5d7095903 100644
> --- a/target/riscv/insn_trans/trans_rvzicbo.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzicbo.c.inc
> @@ -22,10 +22,10 @@
>      }                                \
>  } while (0)
>
> -#define REQUIRE_ZICBOZ(ctx) do {    \
> -    if (!ctx->cfg_ptr->ext_icboz) { \
> -        return false;               \
> -    }                               \
> +#define REQUIRE_ZICBOZ(ctx) do {     \
> +    if (!ctx->cfg_ptr->ext_zicboz) { \
> +        return false;                \
> +    }                                \
>  } while (0)
>
>  static bool trans_cbo_clean(DisasContext *ctx, arg_cbo_clean *a)
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index ad48c9bf30..5695f2face 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -214,7 +214,7 @@ static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *c=
pu, CPUState *cs)
>
>  static KVMCPUConfig kvm_multi_ext_cfgs[] =3D {
>      KVM_EXT_CFG("zicbom", ext_zicbom, KVM_RISCV_ISA_EXT_ZICBOM),
> -    KVM_EXT_CFG("zicboz", ext_icboz, KVM_RISCV_ISA_EXT_ZICBOZ),
> +    KVM_EXT_CFG("zicboz", ext_zicboz, KVM_RISCV_ISA_EXT_ZICBOZ),
>      KVM_EXT_CFG("zihintpause", ext_zihintpause, KVM_RISCV_ISA_EXT_ZIHINT=
PAUSE),
>      KVM_EXT_CFG("zbb", ext_zbb, KVM_RISCV_ISA_EXT_ZBB),
>      KVM_EXT_CFG("ssaia", ext_ssaia, KVM_RISCV_ISA_EXT_SSAIA),
> @@ -808,7 +808,7 @@ static void kvm_riscv_read_multiext_legacy(RISCVCPU *=
cpu,
>          kvm_riscv_read_cbomz_blksize(cpu, kvmcpu, &kvm_cbom_blocksize);
>      }
>
> -    if (cpu->cfg.ext_icboz) {
> +    if (cpu->cfg.ext_zicboz) {
>          kvm_riscv_read_cbomz_blksize(cpu, kvmcpu, &kvm_cboz_blocksize);
>      }
>  }
> @@ -901,7 +901,7 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu=
, KVMScratchCPU *kvmcpu)
>          kvm_riscv_read_cbomz_blksize(cpu, kvmcpu, &kvm_cbom_blocksize);
>      }
>
> -    if (cpu->cfg.ext_icboz) {
> +    if (cpu->cfg.ext_zicboz) {
>          kvm_riscv_read_cbomz_blksize(cpu, kvmcpu, &kvm_cboz_blocksize);
>      }
>  }
> --
> 2.41.0
>
>

