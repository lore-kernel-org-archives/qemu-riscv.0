Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79814C4332F
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 00:18:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qxywA-0000c2-0i; Tue, 31 Oct 2023 20:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxyw8-0000bR-1l; Tue, 31 Oct 2023 20:18:20 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qxyw6-0002CY-E3; Tue, 31 Oct 2023 20:18:19 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-457c82cd87bso2427266137.0; 
 Tue, 31 Oct 2023 17:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698797897; x=1699402697; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8fL9XykDf10uUILG01Bk75GIVVvt28Xl5B1rpTePyYM=;
 b=JwFH9mJk5qYGtweM2qbKDjdWAMXga9uYzj+9i/RGSGP8BrqjfE5PZD467cs2vqx+4V
 AijvJ+BKc5yP3wPeifWrHxHmsaJH5biVrJMO5ejzTWLwpAW7xvnncklYWEdPY2FYUFwe
 lh2ERN5UccZTmUYn//gUsZYZcpDFcMI73eMxuozrxtQB8TWshX+2taOsocdz93NobzsO
 pZ88hhZiquVeUJ3Ze6Ubzg3eWjziZLyiYVZRQJ6UzXdGMqfDpm+dStWzXKHuzCO0ccU0
 DnST63FBGClWKpEn0zt2ZQVxwFBwcQ0MZrGb0J6A8xGiQqFugqf0xN8BGvL7PEwf2elX
 X0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698797897; x=1699402697;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8fL9XykDf10uUILG01Bk75GIVVvt28Xl5B1rpTePyYM=;
 b=vXuisyPQrnRapbgGHLCl0b2UW9cQhUappXvC7XS7H95EkxOAZqV9oPD+t9xWHuzeOV
 Whu1mbIpodEaCpHPdKI56qkoVT6nCoVCbL6BOas9ihNJKNGetEn7qvI827L6ZMH3Jnej
 gAk31phPiaSfpqRvegAqA1KL17OeoeLHg9pZDXTCYDn7vbjttp4ooHWJ8KNmcPvTpI4g
 qZYI2hg4vVGbVrcxTk9L206TqO5MdsmmUF/1hJOVEMr9R0Bd+kVpmcvMlUTIIhVAuv34
 aQl54WTruI42hGkYM/3W8E1pcXQQSwPaMRON2qSYrLcxwol37ZY1SMp1N/c4ARymFG9L
 MTPA==
X-Gm-Message-State: AOJu0YxjhYwWA965FCN60qCS3dmynz8Xod5Ce38bIY6mL7FUtPz0YLlk
 5dhy3pIXneLCOI83Jp4TJfqxP6YjK2qeL/BzFMc=
X-Google-Smtp-Source: AGHT+IGmBkMPRZaewTj5udLoB3kgYS0uWVwgjNoeQolZkDokKhp8rnDL9rgb2clHt/GoG93HDUGkuGpNYKh3i74C1mw=
X-Received: by 2002:a67:c218:0:b0:44e:99a2:a42 with SMTP id
 i24-20020a67c218000000b0044e99a20a42mr10113194vsj.11.1698797896809; Tue, 31
 Oct 2023 17:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <20231031205150.208405-1-dbarboza@ventanamicro.com>
In-Reply-To: <20231031205150.208405-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 1 Nov 2023 10:17:49 +1000
Message-ID: <CAKmqyKP3NvjNTLKfPFNxjC_vFu6=C50tDGyrgHw9sPFsY0JmBg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/kvm: add zicsr, zifencei, zba, zbs, svnapot
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2e.google.com
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

Thanks!

Applied to riscv-to-apply.next

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

