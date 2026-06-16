Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BF7CD98DA
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 01:10:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZIJE-0005yY-Op; Mon, 15 Jun 2026 21:09:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZIJD-0005xl-1p
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 21:09:43 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZIJB-0003O6-Aw
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 21:09:42 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6919f40a0c8so7327675a12.0
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 18:09:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781572180; cv=none;
 d=google.com; s=arc-20240605;
 b=IxQcalCUyuMnLlGxVwdzbuKqPmejVgd+Ybty8DfOROm+3VFJ9U6/cNdQvagelEEVXg
 1kHDE9TuA1H7fwjzrD0R2cxjuRjNK0r2a0KV7GSMI/XtwdnF1Zw15Fh36kXk4eGo2DRR
 EkNt1du9w2+b8fmWr6FA4zTcQoGC7XA8R6HeJgsMcP8zDLcDmGgU/43Tw4uKkMIqmO/F
 iwr2T88Gz/1knnVoePkgnL5ijPGNqndV8T2fdW8GfLbTiii12/BBjQpuQqVhdAlyzUiT
 c+4pveh7ocCdiLekPRAfz7p1BrQCVoP7WgHjmRV5fhwoWSnjKgiWJssuAz7MShe+LFjX
 gvpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=RCPOVzvRR5DNt0ckBX2nXoTFq2dvVGmki0oy+Njmz5M=;
 fh=TKwNSe2cacuQCGAyOGLEppEBtfBRF8yElcsYaVArq2o=;
 b=gSBSg3autwGzQpOnRNBxcBrJTZxVsacj6hmB2lWsJBvPPli5Zdllzm8xwkUffx/FYr
 fxVetTbKhGzQz2ynVQZ89fOoXbOYtKRy8uP3aGQcG65CwSUv/AgbA7b0bpDuo8y9OlFv
 vRZ9jE2GD5irCE4pPJgCfXR1GmJ9KIYxeqwUzDGTj2Spy5r3UmKnCTnG/MveuhQPX0PW
 LKfxHrgweJ0uPl4u78AzPHPTN754CO+ZRDwrMTtsLtwJqhXdNE/lIcsZR0CmlIoJORSN
 +YTHS8qyj1ki091PgP+AoXOtTu23YLP6leK+as3XQX21f/QacZlTvf502080Q9CMfB3j
 XllQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781572180; x=1782176980; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RCPOVzvRR5DNt0ckBX2nXoTFq2dvVGmki0oy+Njmz5M=;
 b=JS1LBwwT+os35Y2ruIu20dK7WtF/V09BMWlg1bmtkKJhCNHVN3zhxvIYTpmYh6u+QO
 qNz7QNy3lwWuvhoWY9xMkxNXkA/2m94x6UNup5RVX58ZOedMc3ZaveVBdqmB37wRnnfd
 9bx1tz5pLV4HIxr6aSpZZDDlhjYkqDfptspHhHIikI13T1V2JBRRkcGHi2iUqk0fDjBr
 jtVnI5JesEn2yN14u9Dql+MBAdOCKlZv82T6LWJ46EYX74TsM4CXj32UdG35er51ua52
 d5PSER0Mte2zXDLpiRq6BC57rTfSEtOyw/Kc7LuptUWVzqzyn5q2meziarybZca1z6xt
 z5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781572180; x=1782176980;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RCPOVzvRR5DNt0ckBX2nXoTFq2dvVGmki0oy+Njmz5M=;
 b=Dw+l784w8Bhs+DyKzlextYDAel8o2vq6HxXdU1kUj06siFHxw9U2OyjSvBDStWHLhc
 3jciBhgrn92FMKcVrfk4roZ7YwfMdnFQRAUsAeBI2N5GSkhAcJjvuITA4xorjLNyJ3NE
 LkvH6MbNaTmpbsPPU7TcZhBvHwVy9g0+WMlJZHxX9VnoWfp9hGrlENlrovHVxWeCwLwb
 8K7uhXUC/X/Ut1YR+5lLkyzWgq658aJCz7b5/LFbOi2UzKusKdIJYCtQHlVGhOuH1JCJ
 +Co1LDk+jodwyHMbBE5kJ1Vw5lGfptmFWayXewGfDvYSFBqapL/LjpznqcDJ20uHKsNf
 8WLw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/T+9xpktFA3s43P7LjZcBUSX87eDKXXlv32ktV+4T1LF1gCr4nkImqN2HSGLiNAxTpsm4tlFX77qH+@nongnu.org
X-Gm-Message-State: AOJu0YyHcdfK+bZihAFgQhYK3M264cY5W8uXi35IPRKn6Tkw3aVH3mWa
 QRAdP7ECyzSSEKcmOPsgvnVijhjPVdCQATXVYyYWPOwjFlpTS2TcZ4pq5WbiTIdvWfKz7gPMvdu
 R3aFQEiKRUht0j7YOLNEv1oGG2UfAN04=
X-Gm-Gg: Acq92OF2AB3+RPdbqXmArvH/LLxOGGWUmRkRep2CO1JV/cuI8vyj40U3rxqr9UuavhU
 ZcYRZIv23YYWWce5XMO1z60GcP0iwiwbdraE1x1iD6PEG7L9xhtmrzSjRr0lL6PFYfG/Qf4ScGX
 gxbqukfzk7AXM7hHasNCQd9lIOcWo4D81RbQQQhmXNoF5qB/xNSqDqhnvjN7ngB1Y+IM1y3ZMx6
 jTfTvXqA0VGiYJFhQOFfgwu2cAXZbZob37h29HDTGexdjw95m1VZUPBZa8fux7+ymbZa3FC3Onp
 B8Zw2aGIS/9VBgzTowATscG8iKF6afZO7asphQ==
X-Received: by 2002:a05:6402:280f:b0:68e:2605:9417 with SMTP id
 4fb4d7f45d1cf-693c6a724d6mr5727225a12.16.1781572179343; Mon, 15 Jun 2026
 18:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260610214133.1882563-1-daniel.barboza@oss.qualcomm.com>
 <20260610214133.1882563-8-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260610214133.1882563-8-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Jun 2026 11:09:13 +1000
X-Gm-Features: AVVi8CcB62W_-vZPbsWZ7eUtLY7EQR9T-viJr4vMgMVO58BZBpq0hBpD83LZ0xg
Message-ID: <CAKmqyKMzGBR1LXbQ4758LjCtJtv3EsAOQJ2B9k-2H251Rs4qxA@mail.gmail.com>
Subject: Re: [PATCH v8 7/7] docs: add riscv-server-ref.rst
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 andrew.jones@oss.qualcomm.com, leif.lindholm@oss.qualcomm.com, uwu@icenowy.me, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52c.google.com
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

On Thu, Jun 11, 2026 at 7:44=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Add documentation for the new riscv-server-ref board.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  docs/system/riscv/riscv-server-ref.rst | 62 ++++++++++++++++++++++++++
>  docs/system/target-riscv.rst           |  1 +
>  2 files changed, 63 insertions(+)
>  create mode 100644 docs/system/riscv/riscv-server-ref.rst
>
> diff --git a/docs/system/riscv/riscv-server-ref.rst b/docs/system/riscv/r=
iscv-server-ref.rst
> new file mode 100644
> index 0000000000..0573b4e07c
> --- /dev/null
> +++ b/docs/system/riscv/riscv-server-ref.rst
> @@ -0,0 +1,62 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +RISC-V Server Platform Reference board (``riscv-server-ref``)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The RISC-V Server Platform specification `spec`_ defines a standardized
> +set of hardware and software capabilities that portable system software,
> +such as OS and hypervisors, can rely on being present in a RISC-V server
> +platform.  This machine aims to emulate this specification, providing
> +an environment for firmware/OS development and testing.
> +
> +`spec`_ is version 1.0 at the introduction of this board.  New spec vers=
ions
> +might trigger a revision of the emulation itself, which will strive to a=
lways
> +match the latest version available.  In case the emulation changes aren'=
t
> +backwards compatible we'll introduce a versioning scheme, probably via
> +a machine property, to allow older SW to run with older spec versions.
> +
> +The main features included in the riscv-server-ref board are:
> +
> +* IOMMU platform device (riscv-iommu-sys)
> +* AIA
> +* PCIe AHCI
> +* PCIe NIC
> +* No virtio mmio bus
> +* No fw_cfg device
> +* No ACPI table
> +* Minimal device tree nodes
> +
> +There are multiple ways of using this reference board.  The spec complia=
nt way
> +is using an EDK2 image and a TPM device.  The board was tested with the =
TPM
> +device ``tpm-tis`` that uses the external ``swtpm`` emulator.  More info=
 on how
> +to use this device can be found in `tpm`_.
> +
> +To use this board coupled with the tpm-tis device, first start the ``swt=
pm``
> +process in a shell (the ``log`` parameter is optional):
> +
> +.. code-block:: bash
> +
> +    $ mkdir /tmp/mytpm1
> +    $ swtpm socket --tpmstate dir=3D/tmp/mytpm1 \
> +            --ctrl type=3Dunixio,path=3D/tmp/mytpm1/swtpm-sock \
> +            --tpm2 \
> +            --log level=3D20
> +
> +And then start QEMU with:
> +
> +.. code-block:: bash
> +
> + qemu-system-riscv64 -M riscv-server-ref \
> +     -bios fw_dynamic.bin \
> +     -kernel EDK2.fd \
> +     -drive file=3Dnvme_disk.ext2,format=3Draw,id=3Dhd0,if=3Dnone \
> +     -device ahci,id=3Dahci \
> +     -device ide-hd,drive=3Dhd0,bus=3Dahci.0 \
> +     -chardev socket,id=3Dchrtpm,path=3D/tmp/mytpm1/swtpm-sock \
> +     -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \
> +     -device tpm-tis-device,tpmdev=3Dtpm0 \
> +     -nographic
> +
> +
> +.. _spec: https://github.com/riscv-non-isa/riscv-server-platform
> +.. _tpm: https://qemu-project.gitlab.io/qemu/specs/tpm.html
> diff --git a/docs/system/target-riscv.rst b/docs/system/target-riscv.rst
> index afd86ca2ba..b2aeb39a8e 100644
> --- a/docs/system/target-riscv.rst
> +++ b/docs/system/target-riscv.rst
> @@ -73,6 +73,7 @@ undocumented; you can get a complete list by running
>     riscv/sifive_u
>     riscv/virt
>     riscv/xiangshan-kunminghu
> +   riscv/riscv-server-ref
>
>  RISC-V CPU firmware
>  -------------------
> --
> 2.43.0
>
>

