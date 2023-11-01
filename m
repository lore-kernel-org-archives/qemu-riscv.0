Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945E8C4332F
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 00:15:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxysr-00086A-FJ; Tue, 31 Oct 2023 20:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxysq-00085o-1i; Tue, 31 Oct 2023 20:14:56 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxyso-0001Qb-FE; Tue, 31 Oct 2023 20:14:55 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-4a4021adbc7so2410725e0c.2; 
 Tue, 31 Oct 2023 17:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698797692; x=1699402492; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q6yHnGmQZYl1nKZrR2H5xNy9BTToWnEGTTx/awaLIuA=;
 b=MBWEMCYpFH5qQTByk2ehOVmM4jHBHVO2/uS+R43sOBx4Acs+bEQVNcEdYRbw76WRpB
 X1omZJepuRXqtcAZ64RYKDCF//2Ubd1Lr1kZGxMbb3dwIEO1e2FB2z7P+TIBLRwi8uCJ
 Vav4MmUofbzm8gJSZV3k9Np0Ci0DfyapTZYnXm8s8Ws47xWXB1r3zPfeljz2Oryrj2rb
 SeT7u4ajMUMKQhiFNWzzkaofBmZB356/pTU8RR+q12JNZBvhCjIJ2wrp+pL73vMgW6Z2
 a8kJexy6NAJgM8WZHuK3GXe6qnMgoJ+HycWDFdYs++4BQn6iJ28fePvFtmmw5IbNm9gd
 K3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698797692; x=1699402492;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q6yHnGmQZYl1nKZrR2H5xNy9BTToWnEGTTx/awaLIuA=;
 b=aO36BgwfF9OY7SuzBapRAuv7cRzSCPgMTb3eGBxTB+Vyoh4p45BHX0kLdKLQElLtJF
 cj0m6GXQk8y2fV4DruNqvULpcLQdixuf6wEEG11bSLgWekTq3Y1V7wgEro7PrQHeiX3I
 7RKm1HisDel1yZr/y05cggK4+JUaMJaX4PHj+OP4evMtPwEw5TP1Hom9uLDTB7fj/Nse
 rEMMWCkcsTwGB/1OfDrfwL337SrcqUWXyPqa6OYlgzG53WFGin0p+zCvQmlxijN/HuCu
 ZZACy4/HieGI4ZvpDi2LKz+23/IzcG30DuwF8Z5TPFMg1GBmDQEqz/0QvC2n1IOM3She
 PO9g==
X-Gm-Message-State: AOJu0YwX+w93zFN2GBYt05didB75qCrjYFa0FF71JM8JuWf1YOOTF3ho
 XvuOcXEbSh/9gL/4scPHRw8U4PnYwVBIIRUX0x0=
X-Google-Smtp-Source: AGHT+IGpcKYV1eGTYbohkJGiKpMoMSC/pNDFrSM82pAsLabjlGVvgiR2clfNxTrHrQ7LbrnPV5jnO1RbRZrqMb+fk18=
X-Received: by 2002:a67:c21b:0:b0:457:bc6c:937c with SMTP id
 i27-20020a67c21b000000b00457bc6c937cmr14868350vsj.4.1698797692485; Tue, 31
 Oct 2023 17:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20231031205150.208405-1-dbarboza@ventanamicro.com>
In-Reply-To: <20231031205150.208405-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 1 Nov 2023 10:14:25 +1000
Message-ID: <CAKmqyKO-mMiygfsA-Gp424kCDf8eZ7ssX-gRWzCEO7hJnyr-Eg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/kvm: add zicsr, zifencei, zba, zbs, svnapot
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
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

On Wed, Nov 1, 2023 at 6:53=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> These regs were added in Linux 6.6.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/kvm/kvm-cpu.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index a11c0e4a99..78fa1fa162 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -229,12 +229,17 @@ static KVMCPUConfig kvm_multi_ext_cfgs[] =3D {
>      KVM_EXT_CFG("zicbom", ext_zicbom, KVM_RISCV_ISA_EXT_ZICBOM),
>      KVM_EXT_CFG("zicboz", ext_zicboz, KVM_RISCV_ISA_EXT_ZICBOZ),
>      KVM_EXT_CFG("zicntr", ext_zicntr, KVM_RISCV_ISA_EXT_ZICNTR),
> +    KVM_EXT_CFG("zicsr", ext_zicsr, KVM_RISCV_ISA_EXT_ZICSR),
> +    KVM_EXT_CFG("zifencei", ext_zifencei, KVM_RISCV_ISA_EXT_ZIFENCEI),
>      KVM_EXT_CFG("zihintpause", ext_zihintpause, KVM_RISCV_ISA_EXT_ZIHINT=
PAUSE),
>      KVM_EXT_CFG("zihpm", ext_zihpm, KVM_RISCV_ISA_EXT_ZIHPM),
> +    KVM_EXT_CFG("zba", ext_zba, KVM_RISCV_ISA_EXT_ZBA),
>      KVM_EXT_CFG("zbb", ext_zbb, KVM_RISCV_ISA_EXT_ZBB),
> +    KVM_EXT_CFG("zbs", ext_zbs, KVM_RISCV_ISA_EXT_ZBS),
>      KVM_EXT_CFG("ssaia", ext_ssaia, KVM_RISCV_ISA_EXT_SSAIA),
>      KVM_EXT_CFG("sstc", ext_sstc, KVM_RISCV_ISA_EXT_SSTC),
>      KVM_EXT_CFG("svinval", ext_svinval, KVM_RISCV_ISA_EXT_SVINVAL),
> +    KVM_EXT_CFG("svnapot", ext_svnapot, KVM_RISCV_ISA_EXT_SVNAPOT),
>      KVM_EXT_CFG("svpbmt", ext_svpbmt, KVM_RISCV_ISA_EXT_SVPBMT),
>  };
>
> --
> 2.41.0
>
>

