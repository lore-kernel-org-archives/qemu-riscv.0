Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CF2CDB474
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 02:56:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qul76-0002Oe-Kx; Sun, 22 Oct 2023 22:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qul74-0002Nu-SY; Sun, 22 Oct 2023 22:56:18 -0400
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qul73-0007Tb-Et; Sun, 22 Oct 2023 22:56:18 -0400
Received: by mail-ua1-x932.google.com with SMTP id
 a1e0cc1a2514c-7b5f7f4e733so1044961241.3; 
 Sun, 22 Oct 2023 19:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698029776; x=1698634576; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hSfqs7usZf/qfi0a3As12jXLjtv2Z8EFuTolCKyJcsk=;
 b=GZbO8gU32h/akgYnz3T1DhFsTIVRND7nLYXZLNa8Y7Jbhq3OUsFzNd/AbiUKRb/o3D
 R5uIpfxsyqm1v5k90/grN4Gpj9D0XVAUa4Y1USV6V6Agx161A0vyixbNQcqGpj3d0RSS
 YOoRnSDHFkX5QU7TqnZdNSCjHglbhIu4lR2TKkVJAUAnKspAMUVM/quREpgHKeB0eeis
 lNAV9SZcN4bsnELifXnSMtMjpPs548I53NhWYNY7bKvYI47tqqP4Z8IuULxT0weEU4KZ
 OLZzbMe33U4l4WdYH3HRjwDUPqTToXAaM6iOr/4FoWbuvpreDeobTG8XISFCieEX3/JV
 GH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698029776; x=1698634576;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hSfqs7usZf/qfi0a3As12jXLjtv2Z8EFuTolCKyJcsk=;
 b=XQmhuflFd6RFVyag2WwB4Lj7tBVkkRCVw8O1yzGvBiQD5a21/fyIsBvwkt8nbEuith
 JI2d2vEy2QyV6/7fAsWklidK29CPsJe9wChB22Xz23DVmRA1c2Gu3wzP0X4ZtPS4LRZd
 uLJbjqjvg2WHW0KWVRGhuFXuxr8gxxM2EgFkfX67eK0heysNrGZvpjk/VLr0FONGxGUD
 dUHdyDfPUHjAXGxvl6ECSaF/6kTkg7HOvCmiEPWXE2V/bunnadrsclzhaFTFHhb0ESFQ
 RQMvGb+Ku7ZWXNL7O4YnkDBmOGyHgBHx7KeURDUvDRWFxagqywgR59X2w803MIXPLH+C
 +cvQ==
X-Gm-Message-State: AOJu0YwzOYSzVjqPRLv9hEonEl2dfhC9ADTWNvd6RVfDxnSarUIB3+CY
 Yka8dL3a+6Pd3dbdxQ2HMfdUZQg288IrXuENZO0=
X-Google-Smtp-Source: AGHT+IEEy/Lx4fJre1+JNPBhpm8MjvmYcTv6di2LDnTqGu/Ue7WL1OeTx8b3jQ+fwCrqMypV/+C5TlRhVdegu/XqcuA=
X-Received: by 2002:a05:6102:23ce:b0:458:119:2d93 with SMTP id
 x14-20020a05610223ce00b0045801192d93mr8845384vsr.33.1698029775770; Sun, 22
 Oct 2023 19:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20231017221226.136764-1-dbarboza@ventanamicro.com>
 <20231017221226.136764-4-dbarboza@ventanamicro.com>
In-Reply-To: <20231017221226.136764-4-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Oct 2023 12:55:49 +1000
Message-ID: <CAKmqyKOTnLWP71Ly5UCY2AjL3+mWTSbHSjxcD9C2oQX1kthKkg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] target/riscv/kvm: add zicntr reg
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x932.google.com
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
> Add zicntr support in the KVM driver now that QEMU supports it.
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
> index 5695f2face..6c2a92d171 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -215,6 +215,7 @@ static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *c=
pu, CPUState *cs)
>  static KVMCPUConfig kvm_multi_ext_cfgs[] =3D {
>      KVM_EXT_CFG("zicbom", ext_zicbom, KVM_RISCV_ISA_EXT_ZICBOM),
>      KVM_EXT_CFG("zicboz", ext_zicboz, KVM_RISCV_ISA_EXT_ZICBOZ),
> +    KVM_EXT_CFG("zicntr", ext_zicntr, KVM_RISCV_ISA_EXT_ZICNTR),
>      KVM_EXT_CFG("zihintpause", ext_zihintpause, KVM_RISCV_ISA_EXT_ZIHINT=
PAUSE),
>      KVM_EXT_CFG("zbb", ext_zbb, KVM_RISCV_ISA_EXT_ZBB),
>      KVM_EXT_CFG("ssaia", ext_ssaia, KVM_RISCV_ISA_EXT_SSAIA),
> --
> 2.41.0
>
>

