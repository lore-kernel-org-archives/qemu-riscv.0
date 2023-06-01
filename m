Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172CDC77B7A
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 05:33:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4awX-0005su-Vg; Thu, 01 Jun 2023 01:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4awX-0005qN-Cd; Thu, 01 Jun 2023 01:33:49 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4awV-0004ku-MJ; Thu, 01 Jun 2023 01:33:49 -0400
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-7870821d9a1so333918241.1; 
 Wed, 31 May 2023 22:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685597626; x=1688189626;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vf9/IWhl1VqR1vKrXkE+XAXQuFFGQir0Ky/D/SQu0m4=;
 b=sZVph9+pWwohT+Bl7KGehDb7EvviPgyYarpRV/tJkDc2YfyEOMCQ22HSb6Pt2Iactu
 PCMJalWMU0tLSR7tKXEg/5exGFR40nmbxbDlokXr8WPk51nRf6ous+/9YmvVo2JLXylk
 XHGkFeVg8i2Z2RJEe3c2gXg6oZz9S3PiqId/KzZMOEBZ3nXHdY+KL3DecE+EAeOeHg4A
 d1r0nupKfMPiC3XATwZoFBWz0bgVqT3pdBiIcsoRpDpCls0PuWeyqA3xzoV8qwq5SWBR
 3D22hrvx+RYQceUx8BV3dmGpwQ7wPPyFxBVZCz/U6mnq5lmLEcPMcC3DYzA2XH3fPIoy
 QBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685597626; x=1688189626;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vf9/IWhl1VqR1vKrXkE+XAXQuFFGQir0Ky/D/SQu0m4=;
 b=UcNtuNNMwawKYDj5gDKmYDRXCFZwRidwCVL4nRbR761nDCFtEKA6IcccQVyhOjU6zc
 PGvRQTCS1Yvo4rShCgLtSGsfCPqIdLNJmPmmZyOXQcOdj8+XhKxlJV9GF1E1B++ISxPn
 K9yZ+VRvhRGXUXZniQ3g+D+2Dd2MLhkVkaOLN7c9bQs+l4PKoKhxXzlb/o0UK4GdOtGU
 YGCxxdlqA8BnNEOFZBarV/lRPzx7LCJkEM+h2MlG1ySdA0PREYpG+8hNAy4eI37wMZ46
 ZXXor00HIYp/4jKjP5G685EUlFJfDkQNDKIuNJ8y2U4nrQCOIU6nvVMoWNegUG3RMxVm
 SoBg==
X-Gm-Message-State: AC+VfDz5sKwK2gRcpz3ooxWNUhW9n1etvWkYkw99Ii906DD0XfjFIsxS
 7c3Y/t7hU0BRC2dtMKKPjwOluiQuCgMNLD5aImg=
X-Google-Smtp-Source: ACHHUZ6LkTtLDQb8Y8sdmI+ELqLCGTqto8156GGQ8QtTLRw3W0x8FjEn3rIiewmXu1rIZAMb28CxMdVJb+hhZZcIezA=
X-Received: by 2002:a05:6102:558e:b0:434:8540:377 with SMTP id
 dc14-20020a056102558e00b0043485400377mr260945vsb.17.1685597626224; Wed, 31
 May 2023 22:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230601045910.18646-1-sunilvl@ventanamicro.com>
 <20230601045910.18646-4-sunilvl@ventanamicro.com>
In-Reply-To: <20230601045910.18646-4-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 1 Jun 2023 15:33:19 +1000
Message-ID: <CAKmqyKO6QcJd=aXEZQxY1dLRvDa3YfKjrykyZ6x9SpLGsO6cAA@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] docs/system: riscv: Add pflash usage details
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92b.google.com
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

On Thu, Jun 1, 2023 at 3:01=E2=80=AFPM Sunil V L <sunilvl@ventanamicro.com>=
 wrote:
>
> pflash devices can be used in virt machine for different
> purposes like for ROM code or S-mode FW payload. Add a
> section in the documentation on how to use pflash devices
> for different purposes.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  docs/system/riscv/virt.rst | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
> index 4b16e41d7f..b33f45e5b3 100644
> --- a/docs/system/riscv/virt.rst
> +++ b/docs/system/riscv/virt.rst
> @@ -53,6 +53,37 @@ with the default OpenSBI firmware image as the -bios. =
It also supports
>  the recommended RISC-V bootflow: U-Boot SPL (M-mode) loads OpenSBI fw_dy=
namic
>  firmware and U-Boot proper (S-mode), using the standard -bios functional=
ity.
>
> +Using flash devices
> +-------------------
> +
> +By default, the first flash device (pflash0) is expected to contain
> +S-mode firmware code. It can be configured as read-only, with the
> +second flash device (pflash1) available to store configuration data.
> +
> +For example, booting edk2 looks like
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 \
> +     -blockdev node-name=3Dpflash0,driver=3Dfile,read-only=3Don,filename=
=3D<edk2_code> \
> +     -blockdev node-name=3Dpflash1,driver=3Dfile,filename=3D<edk2_vars> =
\
> +     -M virt,pflash0=3Dpflash0,pflash1=3Dpflash1 \
> +     ... other args ....
> +
> +For TCG guests only, it is also possible to boot M-mode firmware from
> +the first flash device (pflash0) by additionally passing ``-bios
> +none``, as in
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 \
> +     -bios none \
> +     -blockdev node-name=3Dpflash0,driver=3Dfile,read-only=3Don,filename=
=3D<m_mode_code> \
> +     -M virt,pflash0=3Dpflash0 \
> +     ... other args ....
> +
> +Firmware images used for pflash must be exactly 32 MiB in size.
> +
>  Machine-specific options
>  ------------------------
>
> --
> 2.34.1
>
>

