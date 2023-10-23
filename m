Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8E7C001E0
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 03:40:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qulmr-0001wK-7t; Sun, 22 Oct 2023 23:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qulmp-0001vl-7z; Sun, 22 Oct 2023 23:39:27 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qulmn-0005ie-Eb; Sun, 22 Oct 2023 23:39:26 -0400
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-457c19ebb3aso944793137.1; 
 Sun, 22 Oct 2023 20:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698032364; x=1698637164; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pd4M4jeBSlwGnaucIZMAZ7srKFTpI6SD0/NmRSqY7u8=;
 b=Rf4gRNN7rChccdiB+fFlLukKgB2487D62ieLJzI25TgKomEWUeP8JZEryM4s2PdbX1
 6m/R+X7+fYBgzgsHMEfno7dm6+GiJScLzuLZi2AH0jvEy94U3TkGMWTIH3UEw9eWfQA7
 sx593DT5K73GLu8Z0xNb1aNnEj+k7wNWZ/1/2XJVjEfdje8sj+HqPdEIM3aJ+WdJfPwS
 ZHGZyvlv5CrLrZQVjEU4zwdd1DF77r2CtgcDz+9ZuXj20bxcmGYmJZED9kQx5qaubVKq
 kVh6mCmsLKkxdrrDsFBQSEzw2f5HK5X+7YsCD7ZpkQ6KOc52uE0wRpcm93AaUomNcmw8
 7yNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698032364; x=1698637164;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pd4M4jeBSlwGnaucIZMAZ7srKFTpI6SD0/NmRSqY7u8=;
 b=c2FeLf5h0JEv8thj/qdj4mTRD/1elTwsjK5/SqyDmJgTlNTFAQqGzeu/9g4V4a70JH
 AImBagduaQGLBuYi6j0aVc2Y1zPXIXNt0acC2kXwrerkJLWGsc6nRJ24hS7snUJeN9Zj
 XGQB1M32OFEpPRgkdQ+A9qg6g+5A+o4ImseiR/xjTPhLjkszUy2Z51BuTPhl8roPPaSj
 kv/EQYGpNwYG3Qs1c040eoOunfeu+JcKd3PZRp+Eg59AkRnoHrPOBFhvS1m792i7IopM
 b2lipZrttVkQ+WYxf2GCRt6qaafaZ6OAIDb6dAo851I+cuuya3+iRC0ENPvvx2+9180t
 hydw==
X-Gm-Message-State: AOJu0YzZq94ETJbm5a5/NOppa12M3PFXidYqPzkqUefhE79ffll0halr
 erNtVOC4Ady3PdWIycSl5UIEkf/zlV626PWhEmE=
X-Google-Smtp-Source: AGHT+IFUPlcFF9sQa4e2+Tt0Lr4LeKf4wI9FwNyMV2LXn/isC7vjVZvolNiYupV2qx4pmfc4m9aB90anV9hk1qEkqhc=
X-Received: by 2002:a67:c012:0:b0:457:bc6c:937b with SMTP id
 v18-20020a67c012000000b00457bc6c937bmr4390444vsi.18.1698032363964; Sun, 22
 Oct 2023 20:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <20231017221226.136764-1-dbarboza@ventanamicro.com>
 <20231017221226.136764-7-dbarboza@ventanamicro.com>
In-Reply-To: <20231017221226.136764-7-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Oct 2023 13:38:57 +1000
Message-ID: <CAKmqyKMbFUL3r9OaFawKStsqKB1p+ziibBGj160gYYZExudD=g@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] target/riscv/kvm: add zihpm reg
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe33.google.com
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

On Wed, Oct 18, 2023 at 8:14=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Add zihpm support in the KVM driver now that QEMU supports it.
>
> This reg was added in Linux 6.6.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/kvm/kvm-cpu.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 6c2a92d171..5246fc2bdc 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -217,6 +217,7 @@ static KVMCPUConfig kvm_multi_ext_cfgs[] =3D {
>      KVM_EXT_CFG("zicboz", ext_zicboz, KVM_RISCV_ISA_EXT_ZICBOZ),
>      KVM_EXT_CFG("zicntr", ext_zicntr, KVM_RISCV_ISA_EXT_ZICNTR),
>      KVM_EXT_CFG("zihintpause", ext_zihintpause, KVM_RISCV_ISA_EXT_ZIHINT=
PAUSE),
> +    KVM_EXT_CFG("zihpm", ext_zihpm, KVM_RISCV_ISA_EXT_ZIHPM),
>      KVM_EXT_CFG("zbb", ext_zbb, KVM_RISCV_ISA_EXT_ZBB),
>      KVM_EXT_CFG("ssaia", ext_ssaia, KVM_RISCV_ISA_EXT_SSAIA),
>      KVM_EXT_CFG("sstc", ext_sstc, KVM_RISCV_ISA_EXT_SSTC),
> --
> 2.41.0
>
>

