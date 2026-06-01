Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC6FCD5BD1
	for <qemu-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 03:07:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wTsze-0006rV-Vb; Sun, 31 May 2026 23:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTszb-0006qY-Kc
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 23:07:08 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wTszZ-00038v-V1
 for qemu-riscv@nongnu.org; Sun, 31 May 2026 23:07:07 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-bec441e4018so89401066b.2
 for <qemu-riscv@nongnu.org>; Sun, 31 May 2026 20:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780283223; cv=none;
 d=google.com; s=arc-20240605;
 b=PKzzHJ/0pEcGKFohiER1ScEH3S+5lL7u03e0CZXAaZbR/6e77M8ifJ1d2eukTQttJN
 KLbV2wCTMEMtNCo5bjkekVZM0UUFjGIizNPPpZ9Q2BBX1Rj0GEBwrjeAv6cqFjmtOfUN
 Nb8sQLVAlzOx/cWPXRo+tsZZ5HViPbtHO2j6zDR0XJVDXHC0UM7pmvMG4+ePxfe+ax+6
 Z/u69DRleel92BoRknWeO3OpBhXoes3YVX8VPVlnnBpgooSqdr4uhEtsgLEv7lrirD+W
 Qiy+IEDzltd1cNK4WniD+h0tKKbBsxk6Ou54ZdLe7eoeAomXxhWym2l8RLw1rhgEsfF3
 2dWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=2bG2vXcHgdOad+pyBwpMkeEMzF2PgRDTgnOaa8Co4Yc=;
 fh=W0hm1+Qc0mS3hk3zAhGNF8fUc8cqGx9K7Vi0PhW77Ls=;
 b=I9HoeBlKJe9GIiY7UG7I7aJ2lN0tUgKbOvFzUAy10QtjA+Hqy44aA2boDe5XMEW5dT
 m7RlX2c2RkxM0KTk+4YR4sqv8dM0k0MiIw8pOj7uLlWTkLiko096dmQ+eq+0P5gXvTSM
 7j43PnzenhlWaM/IPbvvKBYYxqg12kXeLRdKyMX9s8GezRSnZsyTnaugEX/wI8uaRn9R
 RiKY7Ups//5SbjciD0AbVGV2otqtZjZPLQRFf5n3F8tAKy3U1F6dvoGqHruQE5pQmJAj
 vKYhPKS1zDTQbP4TATkRJKTGvBJmWxC2ei+VYKb6kHGEL+gTCquwyN9Kx86rWCi0Sf3m
 +BJQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780283223; x=1780888023; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2bG2vXcHgdOad+pyBwpMkeEMzF2PgRDTgnOaa8Co4Yc=;
 b=GP+IdZ/vCVJXHy37E9uVIsZVNKio2S/SC3eONsJNtQDDYCpbVg9AYHIXB/IYhhSeKs
 ITXoW8LM3SZ/ySo3ay9qNIS3xd7FpXsxE1JH/rw7zeu1LjKzKnDy3avsJZMZZ1AUJ1ml
 ToCXhbJ0wOOmpVsjyYJ2hqkmrCrv+tQiKQswc/sEsMBmGEzBxP2MoB/i1t5fcJ006k8S
 OeVuIJDwzNF6k7sv4vSBm5RrqaUX2xMoj0fWsvWtHP0iZRrrURJn6KZlmLbfH0v72uzB
 uyKwNkMX5tmDbCy/DExHPJATRXStVT47bWSvsG4aw4C7gJzdugEUzB0nnNNFj3ysoOzP
 sB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780283223; x=1780888023;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2bG2vXcHgdOad+pyBwpMkeEMzF2PgRDTgnOaa8Co4Yc=;
 b=AG2neTGCchIeOwOrjpz5myOqWSP0RtJJj/wA8JpJZgsfu6XkqKAfcmkjDuI5mmzr9R
 8fZwAQi3vkAPXFn2wZGwO9rK7T+3pZ04Vdyxwx2yEmcKTmEI8OrekGmtjRScrcRdHD3E
 uSoZ5vJ7TYxlxdBFYJupJkjzFwov2CgF2SdEq/nm/E6FWBt4zVFNYl0wwOxm/vvYdEcr
 P/P0kJqRlhTE8h55L/tsesAVwwDMcc3Q7PFcKDaGkX4ro6+1Y1XxlsPAqdrhu5tNJpk9
 1Ps7tKaQBrWIMygkDKRbB/dLQDoHWW9Rsi/lIy9+/4Q7wsaFMgPdHbYB9rRl89BhL5L/
 l5xw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8OE+rk36LQNvYpTbYFLMNp1/7/CEn9KDlNPgZ/u7eqeg8+eJ7v+mj4YJoBL61oBil9sPTUeTR0eXXP@nongnu.org
X-Gm-Message-State: AOJu0Yw0L+THg+OkbyzPvH+Tb/KrMBLer1Jh7wASwICyB/kL1MD0db8Z
 H0IUakEiwSublQezOKUFY3Ko9e+TlOaJsV7ANEJhkccA7VoNC8PHSUrXx+Hm8amv/+GgTGlmSK9
 JqegfDsoOon9es7FRBPxEu+YVqHs/XpA=
X-Gm-Gg: Acq92OEIkf4VZvZcK7uuuG0NCLghliv4WAFw7fQKG1SI3vFewpbULxzwN8oLlOsW+VF
 nVY0ttjXdql0NCje1R5ynDloW7q857VxIoAGmCp1H5bPsIPuU88lnUaMllJbea/gqU+mMNN1/4F
 iJg7nxjuCpwc49NUaxk5qBiQWmJU+ZH1i0O4LwDrNJKjA3OK8oB4LaktZOKB3yuBjL0NQp+34ys
 Sx6V9SZcJwiFxGSCalc74X32txVDKdTAUZUko142SXBV4tQT2zIyAayR8U+W72nvePcBhMRh6ak
 T7I+2rGoF9VX1bynMjJC1m64XhwDtefuEcKEiUjXxx9s5MRn5kguXmiqA9w=
X-Received: by 2002:a17:907:a2c5:b0:bed:9a7:5ed1 with SMTP id
 a640c23a62f3a-bed09a768a4mr156000866b.5.1780283223014; Sun, 31 May 2026
 20:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260514204640.2540054-1-daniel.barboza@oss.qualcomm.com>
 <20260514204640.2540054-5-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260514204640.2540054-5-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Jun 2026 13:06:35 +1000
X-Gm-Features: AVHnY4KhQnxn9iTub1d8SKP7MGJHvKYAqWRB6Q9ZO2yHUoNl56ONKi4qeLoPUUw
Message-ID: <CAKmqyKNNHh70cxDXEwncFk0Hngje2HbiBdmwc8KxOP8m47+HRw@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] docs: add riscv-server-ref.rst
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 leif.lindholm@oss.qualcomm.com, andrew.jones@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x636.google.com
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

On Fri, May 15, 2026 at 6:48=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> Add documentation for the new riscv-server-ref board.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> ---
>  docs/system/riscv/riscv-server-ref.rst | 37 ++++++++++++++++++++++++++
>  docs/system/target-riscv.rst           |  1 +
>  2 files changed, 38 insertions(+)
>  create mode 100644 docs/system/riscv/riscv-server-ref.rst
>
> diff --git a/docs/system/riscv/riscv-server-ref.rst b/docs/system/riscv/r=
iscv-server-ref.rst
> new file mode 100644
> index 0000000000..7803133b77
> --- /dev/null
> +++ b/docs/system/riscv/riscv-server-ref.rst
> @@ -0,0 +1,37 @@
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
> +There are multiple ways of using this reference board, some of them bein=
g:
> +
> +* BIOS: u-boot-spl.bin; SD-CARD: <disk_containing_FIT>; NVME: <distro_di=
sk>
> +* BIOS: fw_dynamic.bin; KERNEL: u-boot.bin; NVME: <distro_disk>
> +* BIOS: fw_dynamic.bin; KERNEL: EDK2.fd; NVME: <distro_disk>
> +* BIOS: fw_dynamic.bin; KERNEL: <linux_image>; INITRD: <busybox_initrd>

Can we add a test case that boots something?

Alistair

