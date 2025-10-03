Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F539CAC5B0
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Oct 2025 01:29:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v4UbZ-0005gS-4u; Thu, 02 Oct 2025 21:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v4UbW-0005fm-Ox
 for qemu-riscv@nongnu.org; Thu, 02 Oct 2025 21:29:02 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v4UbM-0008P4-8o
 for qemu-riscv@nongnu.org; Thu, 02 Oct 2025 21:29:02 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afcb78ead12so321069766b.1
 for <qemu-riscv@nongnu.org>; Thu, 02 Oct 2025 18:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759454926; x=1760059726; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nkwxz28O1WoLA/n8Tk4LlI3+YubAg4S2P97U8JEbWqw=;
 b=azvhH71YGpRjPKKHIuXETsmqgk6Bk8uSS42knAg8ZO5+chykffjFk3SBfhTzYkd7V3
 PbaoHFOqqKm9Qbhvnh+8ZIjrnhLuj9oPkpTDxjUwac1x64X6kImwzffzLA9PPHDKGVUq
 P/NqHfIH5He+fqs+RMMAig5YBwZ87nwpNKvanoXv7U6zVizkdDFqoOXUhapfkVhzW3Tb
 F27rXUNGWakEO29HI8gB5vvBSw7+3NLYBA43lT3PWgrYk+P0KQp/78ulQ4y/d4CZfkoy
 gTZlXq7nfKnABoS+U7V92aJO+aR5gRvvaDeL5/nyOne2ZZiBVE217TfvCP7FMo9rG5ng
 4bYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759454926; x=1760059726;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nkwxz28O1WoLA/n8Tk4LlI3+YubAg4S2P97U8JEbWqw=;
 b=WfUbSL3xXBhN31lb/beC3DeCy/0T4xeBHHUOIBOz+L1flPrgl+qU+fGA19H+jTptQn
 YaO2lFnZsaEucz7apyVGvHIR7ZKGT5nPX9yeGWQN/riMuzk5uML0Sw+8j7CU8vjFnXKM
 502RQXEUzaqPmm9oSEVDMbCN2YdACuIBDG5YbU54sC7bPXm/icSJIOPE/QbsTOHKiHdb
 l5JDyhpTzb8M7JsJJqpSmvE1hiAU70LHPQE4MdEUljpVWm5mrSwTQK8hb+V22VYR0VQW
 CbUpM0z7dBkq3v/8FvCDYxmerV9It8Ld9eq8tkcp8SLgIJHWc27aR/NBCOdYUORuvOLq
 qpgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHoIxbmDoUss4UjkY9qA7xCLKEJsmndRNHTH29EpG17Qtc8ZFfmhzPgQAVom4AzvqZfgxGK7aJfBVo@nongnu.org
X-Gm-Message-State: AOJu0YwLtw6VmxRCEYn1WPAowYJyLJjeU8WUUNIvmCV6TXxlwa47Lj8l
 z0LoVjXDj9NekUVour9pV5fRZGcPFqnMpfG1ofTIGdACUIHZP+lbPd8d6fcmyvq70wUauZJVHls
 dEt7um4DRZgparHdjhxa67cVL7MbJahE=
X-Gm-Gg: ASbGncv0rpci/y/ABMddiUNwpv6Hd3+4i0V888Xz14cl/j+s3zkIV6yzSvoyU1Px4Jl
 kqnoB7X3XUPeg0UH5MFAEiOODWbA2x6Omye4fUqUX0/OQaIYvBaULpD9KrgfQEdxVjb/GHtmOZi
 bIcSTRi8SSeW9fONizwzCBBr6m9tCh0ZIPBqXA/R5lLNCW0XV2UJYks08Kv8xuX7OJBRWw6plJC
 J2Pp0ALRLDZuHCzi7QQe/69a+3s05IfVaVh5HwB3YHtP84YZX7PuSQyZ9LFpQ==
X-Google-Smtp-Source: AGHT+IGg9QskivYnj/vKYs4JtAuMFr8PkvI830CY8Uh1aznK4pRvAviuVUWCw7HHeWRb23kxlefeFQP3M2TsCwxF6EU=
X-Received: by 2002:a17:907:7fa9:b0:b3f:9eaa:2bba with SMTP id
 a640c23a62f3a-b49c48a84f5mr160321766b.63.1759454925668; Thu, 02 Oct 2025
 18:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250814001452.504510-1-joel@jms.id.au>
In-Reply-To: <20250814001452.504510-1-joel@jms.id.au>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 3 Oct 2025 11:28:19 +1000
X-Gm-Features: AS18NWCnJsH_fRBc_8QP834pXh-RuKN2m8f7KQcAQopPhHIxmmAjyuZD1huwS9Y
Message-ID: <CAKmqyKPTXP5jipsMt7Dcs5kH2gWrjzart_ZhjUOcGCHBRAsVNg@mail.gmail.com>
Subject: Re: [PATCH v2] docs: riscv-iommu: Update status of kernel support
To: Joel Stanley <joel@jms.id.au>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Thu, Aug 14, 2025 at 10:17=E2=80=AFAM Joel Stanley <joel@jms.id.au> wrot=
e:
>
> The iommu Linux kernel support is now upstream. VFIO is still
> downstream at this stage.
>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> v2:
>  - Fix VFIO link
>  - Fix qemu spelling
> ---
>  docs/specs/riscv-iommu.rst | 35 +++++++++++++----------------------
>  1 file changed, 13 insertions(+), 22 deletions(-)
>
> diff --git a/docs/specs/riscv-iommu.rst b/docs/specs/riscv-iommu.rst
> index 991d376fdc24..571a6a6cc963 100644
> --- a/docs/specs/riscv-iommu.rst
> +++ b/docs/specs/riscv-iommu.rst
> @@ -30,15 +30,15 @@ This will add a RISC-V IOMMU PCI device in the board =
following any additional
>  PCI parameters (like PCI bus address).  The behavior of the RISC-V IOMMU=
 is
>  defined by the spec but its operation is OS dependent.
>
> -As of this writing the existing Linux kernel support `linux-v8`_, not ye=
t merged,
> -does not have support for features like VFIO passthrough.  The IOMMU emu=
lation
> -was tested using a public Ventana Micro Systems kernel repository in
> -`ventana-linux`_.  This kernel is based on `linux-v8`_ with additional p=
atches that
> -enable features like KVM VFIO passthrough with irqbypass.  Until the ker=
nel support
> -is feature complete feel free to use the kernel available in the Ventana=
 Micro Systems
> -mirror.
> -
> -The current Linux kernel support will use the IOMMU device to create IOM=
MU groups
> +Linux kernel iommu support was merged in v6.13. QEMU IOMMU emulation can=
 be
> +used with mainline kernels for simple IOMMU PCIe support.
> +
> +As of v6.17, it does not have support for features like VFIO passthrough=
.
> +There is a `VFIO`_ RFC series that is not yet merged. The public Ventana=
 Micro
> +Systems kernel repository in `ventana-linux`_ can be used for testing th=
e VFIO
> +functions.
> +
> +The v6.13+ Linux kernel support uses the IOMMU device to create IOMMU gr=
oups
>  with any eligible cards available in the system, regardless of factors s=
uch as the
>  order in which the devices are added in the command line.
>
> @@ -49,7 +49,7 @@ IOMMU kernel driver behaves:
>
>    $ qemu-system-riscv64 \
>          -M virt,aia=3Daplic-imsic,aia-guests=3D5 \
> -        -device riscv-iommu-pci,addr=3D1.0,vendor-id=3D0x1efd,device-id=
=3D0xedf1 \
> +        -device riscv-iommu-pci,addr=3D1.0 \
>          -device e1000e,netdev=3Dnet1 -netdev user,id=3Dnet1,net=3D192.16=
8.0.0/24 \
>          -device e1000e,netdev=3Dnet2 -netdev user,id=3Dnet2,net=3D192.16=
8.200.0/24 \
>          (...)
> @@ -58,21 +58,11 @@ IOMMU kernel driver behaves:
>          -M virt,aia=3Daplic-imsic,aia-guests=3D5 \
>          -device e1000e,netdev=3Dnet1 -netdev user,id=3Dnet1,net=3D192.16=
8.0.0/24 \
>          -device e1000e,netdev=3Dnet2 -netdev user,id=3Dnet2,net=3D192.16=
8.200.0/24 \
> -        -device riscv-iommu-pci,addr=3D1.0,vendor-id=3D0x1efd,device-id=
=3D0xedf1 \
> +        -device riscv-iommu-pci,addr=3D3.0 \
>          (...)
>
>  Both will create iommu groups for the two e1000e cards.
>
> -Another thing to notice on `linux-v8`_ and `ventana-linux`_ is that the =
kernel driver
> -considers an IOMMU identified as a Rivos device, i.e. it uses Rivos vend=
or ID.  To
> -use the riscv-iommu-pci device with the existing kernel support we need =
to emulate
> -a Rivos PCI IOMMU by setting 'vendor-id' and 'device-id':
> -
> -.. code-block:: bash
> -
> -  $ qemu-system-riscv64 -M virt        \
> -     -device riscv-iommu-pci,vendor-id=3D0x1efd,device-id=3D0xedf1 (...)
> -
>  Several options are available to control the capabilities of the device,=
 namely:
>
>  - "bus": the bus that the IOMMU device uses
> @@ -84,6 +74,7 @@ Several options are available to control the capabiliti=
es of the device, namely:
>  - "g-stage": enable g-stage support
>  - "hpm-counters": number of hardware performance counters available. Max=
imum value is 31.
>    Default value is 31. Use 0 (zero) to disable HPM support
> +- "vendor-id"/"device-id": pci device ID. Defaults to 1b36:0014 (Redhat)
>
>  riscv-iommu-sys device
>  ----------------------
> @@ -111,6 +102,6 @@ riscv-iommu options:
>
>  .. _iommu1.0.0: https://github.com/riscv-non-isa/riscv-iommu/releases/do=
wnload/v1.0.0/riscv-iommu.pdf
>
> -.. _linux-v8: https://lore.kernel.org/linux-riscv/cover.1718388908.git.t=
jeznach@rivosinc.com/
> +.. _VFIO: https://lore.kernel.org/linux-riscv/20241114161845.502027-17-a=
jones@ventanamicro.com/
>
>  .. _ventana-linux: https://github.com/ventanamicro/linux/tree/dev-upstre=
am
> --
> 2.47.2
>
>

