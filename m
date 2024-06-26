Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1A2C27C4F
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 03:24:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sMJGy-0003Xc-Kl; Tue, 25 Jun 2024 23:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1sMJGx-0003XG-I7
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 23:24:39 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1sMJGv-0000Ds-GY
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2024 23:24:39 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-6c5bcb8e8edso4489978a12.2
 for <qemu-riscv@nongnu.org>; Tue, 25 Jun 2024 20:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719372276; x=1719977076; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ulOsqEBoRq4wsE5vBZVR3s8sA5wvMKN2EKSzXkPW/w=;
 b=fxSgLdvcg1tvlrNWMo2y6Fh8vxYoUmqt/80NT6ki2E35dkKnTzIN/8Z2w3hEoIvDp7
 lIv4X4vLgOAkzgmi4aOYjjmiCX/bZQ2vp8WWb6f9EeIkYhttm2mHfvXjQ2xWsPO2oX8z
 cqJUXcyPhWrn+8F2EqOQBzGR9EMnlVHg7z/G39gs7Bwr11wUgIOk8gm3tBusnG71728R
 F+c9Ef94q9F5b43GSGzBauR8XOEAJO8aPSupV7kv08rezOHCX+HWlyxNDOpDvlZ+fBNv
 D/HFg+/b+oYTXpPIq4u6HsZaqnT5HU9+7xW0dCHQZj9c46sbBUcG+1g5uDGeetQkSRm+
 7Sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719372276; x=1719977076;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ulOsqEBoRq4wsE5vBZVR3s8sA5wvMKN2EKSzXkPW/w=;
 b=VEMHfzeiyJn8yd3/6Jlj3WLTLLxr0mbmepdR15jz2xyWtqk45Ah92tcQB2lxwzJ9gR
 Y/t7VkVGvaI8QpwJtcpF34u3ji2CuY41hs3eBAbTx4QT72xjI4Be+B8QELkJDZc9U6DU
 tZvgwK2oTWFQ94udE0XQoLA3agEg02EDFsiv4trGzztE8A+G4ztBu68gY3mg2XLAR1F2
 1lY/gG/iaaZROXiwJ5fuv8EeLYiLpwhUNJOjdQYUrnntI2I/+/0e1z+3rRv7M4ZonvdM
 YCMyKQKaYNaGgT3MhRgF16Nq7+ZobNHV3noD8NsqjhLLZUiKWmn1+noe7kFq4CdaezRG
 paHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5jVOW3ay8Zr4kg8eSMAmJlnHE2VKORgIhyWU28B6WK8UOuPORqe4DOOF8LVxv0lOLD/a03KfW/uCwBD0ItcfcYX0XklM=
X-Gm-Message-State: AOJu0YyhFAIGz+kRvU858sywRpZsRebPoaAQyXykTBlCZtyC4QY0DOJa
 EDfFkAaJVtXXuHLah9Dq+nMDPHdlcnftV92YIGeJYXuSSbw6LSaJhnoFupbWYOxo6TrJWarAYXT
 wiDIBJdmoVY2lnIfrg6AZrfC4Dj7m7w==
X-Google-Smtp-Source: AGHT+IEImWBt8rsBXSb38G1jYPsmNlEfHzgwSKekjTWAACAsg83/OjrFlczP0JoSXohsvGMNA+XWvhyH5gmINsDBhr0=
X-Received: by 2002:a67:f401:0:b0:48f:4261:2d4a with SMTP id
 ada2fe7eead31-48f52c3d62amr9288428137.34.1719364726719; Tue, 25 Jun 2024
 18:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240624201825.1054980-1-dbarboza@ventanamicro.com>
 <20240624201825.1054980-15-dbarboza@ventanamicro.com>
In-Reply-To: <20240624201825.1054980-15-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 26 Jun 2024 11:18:20 +1000
Message-ID: <CAKmqyKM6g46UHZq=FxRrMeEw=rj-So9Q0zmvyHMfC9XFxR53fg@mail.gmail.com>
Subject: Re: [PATCH v4 14/14] docs/specs: add riscv-iommu
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com, tjeznach@rivosinc.com, 
 frank.chang@sifive.com, jason.chien@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Jun 25, 2024 at 6:20=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Add a simple guideline to use the existing RISC-V IOMMU support we just
> added.
>
> This doc will be updated once we add the riscv-iommu-sys device.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  docs/specs/index.rst       |  1 +
>  docs/specs/riscv-iommu.rst | 55 ++++++++++++++++++++++++++++++++++++++
>  docs/system/riscv/virt.rst | 13 +++++++++
>  3 files changed, 69 insertions(+)
>  create mode 100644 docs/specs/riscv-iommu.rst
>
> diff --git a/docs/specs/index.rst b/docs/specs/index.rst
> index 1484e3e760..c68cd9ae6c 100644
> --- a/docs/specs/index.rst
> +++ b/docs/specs/index.rst
> @@ -33,3 +33,4 @@ guest hardware that is specific to QEMU.
>     virt-ctlr
>     vmcoreinfo
>     vmgenid
> +   riscv-iommu
> diff --git a/docs/specs/riscv-iommu.rst b/docs/specs/riscv-iommu.rst
> new file mode 100644
> index 0000000000..fa38ff7667
> --- /dev/null
> +++ b/docs/specs/riscv-iommu.rst
> @@ -0,0 +1,55 @@
> +.. _riscv-iommu:
> +
> +RISC-V IOMMU support for RISC-V machines
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +QEMU implements a RISC-V IOMMU emulation based on the RISC-V IOMMU spec
> +version 1.0 [1].
> +
> +The emulation includes a PCI reference device, riscv-iommu-pci, that QEM=
U
> +RISC-V boards can use.  The 'virt' RISC-V machine is compatible with thi=
s
> +device.
> +
> +A platform device that implements the RISC-V IOMMU will be added in the
> +future.
> +
> +
> +riscv-iommu-pci reference device
> +--------------------------------
> +
> +This device implements the RISC-V IOMMU emulation as recommended by the =
section
> +"Integrating an IOMMU as a PCIe device" of [1]: a PCI device with base c=
lass 08h,
> +sub-class 06h and programming interface 00h.
> +
> +As a reference device it doesn't implement anything outside of the speci=
fication,
> +so it uses a generic default PCI ID given by QEMU: 1b36:0014.
> +
> +To include the device in the 'virt' machine:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 -M virt -device riscv-iommu-pci (...)
> +
> +As of this writing the existing Linux kernel support [2], not yet merged=
, is being
> +created as a Rivos device, i.e. it uses Rivos vendor ID.  To use the ris=
cv-iommu-pci
> +device with the existing kernel support we need to emulate a Rivos PCI I=
OMMU by
> +setting 'vendor-id' and 'device-id':
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 -M virt        \
> +     -device riscv-iommu-pci,vendor-id=3D0x1efd,device-id=3D0xedf1 (...)
> +
> +Several options are available to control the capabilities of the device,=
 namely:
> +
> +- "bus"
> +- "ioatc-limit"
> +- "intremap"
> +- "ats"
> +- "off" (Out-of-reset translation mode: 'on' for DMA disabled, 'off' for=
 'BARE' (passthrough))
> +- "s-stage"
> +- "g-stage"

These names don't jump out of the spec, so we probably want to at
least provide a sentence on what they mean/do.

Alistair

> +
> +
> +[1] https://github.com/riscv-non-isa/riscv-iommu/releases/download/v1.0/=
riscv-iommu.pdf
> +[2] https://lore.kernel.org/linux-riscv/cover.1718388908.git.tjeznach@ri=
vosinc.com/
> diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
> index 9a06f95a34..8e9a2e4dda 100644
> --- a/docs/system/riscv/virt.rst
> +++ b/docs/system/riscv/virt.rst
> @@ -84,6 +84,19 @@ none``, as in
>
>  Firmware images used for pflash must be exactly 32 MiB in size.
>
> +riscv-iommu support
> +-------------------
> +
> +The board has support for the riscv-iommu-pci device by using the follow=
ing
> +command line:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-riscv64 -M virt -device riscv-iommu-pci (...)
> +
> +Refer to :ref:`riscv-iommu` for more information on how the RISC-V IOMMU=
 support
> +works.
> +
>  Machine-specific options
>  ------------------------
>
> --
> 2.45.2
>
>

