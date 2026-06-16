Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFDACD8CA8
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 03:23:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZKOb-0004Sm-Hu; Mon, 15 Jun 2026 23:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZKOY-0004SB-GW
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 23:23:22 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZKOW-0004Bu-T0
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 23:23:22 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-68e5f7c1131so6893984a12.2
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:23:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781580199; cv=none;
 d=google.com; s=arc-20240605;
 b=YyjQtM0DP4f/510t24UYEnRHi9V/YKHVl9IiKlU7cqQsKRdytwJkCChMeGhWzG7aiI
 M7X7cPZqmqFSM6Ojj8b7Gpbbd4B3a/lSgzjqjnCyyY8uvBt1NeOOLIax+hMHQQnVCplo
 g3Wtc0smCN3vLqAp0sNJmG1SePDfxWf1+FPDnq8O1WqO8S/mb023j0JF5lUrLI9Fwg1K
 OS8Nkol7WTfgKyjU8FvOU0fyMTzUFmLAvo1SOoU5q4Lpl8MszDLJAq1jNtVtk9U5scHR
 NTnwyxyCEFWL/P0+OJEOZAhixm38q3ufWmjZAG8omXNdZWnc/tgh7953KWapSHAf7MDN
 wCwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=o2Z2xEWOBlSFmesIitEHCJ1aKsohbF3cWDR5xCgzxuc=;
 fh=eo3B9FlUE94sOYxb7ZECSrUf7+xn9iUKigxeO3is64s=;
 b=Wl7m/VQkFS/mT4wVPqVU7BancYa7gz1XVUhqFYRbycVR+A6xSJJ6sRELXACEejZf0Y
 GCPcSMPnFVdOU0hbwbw33TypvyOp0wQYhflYGiWbHfrTWs4carST/yHRmgw0ul3J685h
 xrumc5j8kHX8UQBXkb/xYFD4CW6kxsqeJAa15mPuDGRpnnlNb9Dx/EzTsoVFgwYstLTG
 wbNSpZQJzlbiTcaCKv/ZMW17I021JD5YZx/0AYlsc/MqbqjCGp1PJlV357xhTHqkihiH
 inifsnyUFHvKhbcUM6/4D/FB/zRr2Mg7wEo3DqkS/yZ8FL+cDNGOCNdMbfmi87i9S2KE
 ak6g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781580199; x=1782184999; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o2Z2xEWOBlSFmesIitEHCJ1aKsohbF3cWDR5xCgzxuc=;
 b=Erj0hI7JHjfLSJzAajA3n2YmeCaH+RO8V/loOjRdbR7+EgssYsb5cX0x9BepXe5RA0
 aol3Dn8ijhj0nFngzHxb/+P/lzy7Fjgn/iu7ixnS3ykk18oJiCih3VUcHsK/yAXUOBCD
 Z5z1pPPffSUSr6EzkKc4Z8FZ34cFL24OsqYdsNDlJRy6eG/K3xv+VTUae+0oNKNdzJfD
 f3mStvr+PE7JPnhQzA+2RpHGxaRLzOiUjkpTn7QcmrkHYYgRjyGJI6K/RbDBY/L5Ykz7
 AoG3BevAE+LiUooJG4wkyhc7folf2EmUqm+yrg5T1d4urunVFC5A4E5jX2IrDb7Ua4Dp
 LfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781580199; x=1782184999;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=o2Z2xEWOBlSFmesIitEHCJ1aKsohbF3cWDR5xCgzxuc=;
 b=JoJcT7QfjB0ivYfw6c1mCncvRiKFDimcNMGsckStlbNGmc/k92oY7RiPRRn4gN9hyd
 pqShfcdEW6Dpe/nUMIoG+ZunamB79X1eJdoYbnVtHQSnG2V3gcF7bNc5gC/rK1sgyH2d
 7zP1taPxTcomVK+G3Gk97NZhy5GnT/+gTyf0EfZfbY7kH32FGTsy4TXlqQgn5+Jll1Ur
 v/nHACOAvQsfm85BKII72eCgWbHMgxZQnyolv2e9x/3h4uS7TioxvcyPcaEn5p+cJoYv
 KvIe0UxXrDNyupuU6gsYnNQGApc6YiekIhqsfIE7Ny2FXHuBdLXVfP3OKbtyxA+9ERC6
 Qpvw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9pUeQHZaBMuJ810bxkwdrLvOM9mZgghyrk8K8FWnrCo8X1IoTyu5rSu4Joe6A3ytA+wxj4VZqIrwx6@nongnu.org
X-Gm-Message-State: AOJu0YyQLSPWPW2wM2Z1xpkL4C5xWBomwc4SVZEESkHe3g9/QOva2t2F
 ZJeROqeS0xNW/tbASB4l5yZz0Fd/AT+PkVPRxnqfq8b27MUbjkaOBV3o0JeRQAmaqJtSD/A7o/a
 TCDPn5rkeZQk97edb8VNgeZ3MLx/jTuY=
X-Gm-Gg: Acq92OFipcCD1puS0qSpRzLpWdP3fO2qHO1KtgNpBhY6bDt87CyZlHFVPO/8prPt2Wb
 8cf3mMx171icBSeQs+DidPYnA0cbMBNQR+7ac1CxMR9UvihI0XRw2w6/hZDLVGfS+CIuzgrUyGe
 JAZ/bNWFg03rT19dDtShJY1dFhbPr4GH+LU3bwuHwCn9qz/RWWveTd0Egiy0CAueUe6Qb8jEYaO
 vYtbCggLRp7xuQn8wVbE+6QL5LC5TS3WOjJamU0bzVaDHazpYfCuwCusznU0cgaG/M0DuaN4s8B
 dbhugI1dY9wTSwCHUoqFYfL6f69WD+ymCNpXH007MP+KWsOa
X-Received: by 2002:a05:6402:5208:b0:691:956a:cf72 with SMTP id
 4fb4d7f45d1cf-6950874c0a7mr769622a12.17.1781580198588; Mon, 15 Jun 2026
 20:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260615203734.954428-1-daniel.barboza@oss.qualcomm.com>
 <20260615203734.954428-14-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260615203734.954428-14-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Jun 2026 13:22:51 +1000
X-Gm-Features: AVVi8Cf4z7TQoLZ5xaj2sgMUkciOAJ9xCSVN_OuR-tVoy8rifVTJX0ueZaykFDA
Message-ID: <CAKmqyKPzA5gEq3U_rzY9KNML=Mj15kLcYw26AhDzxFAEVM7_Nw@mail.gmail.com>
Subject: Re: [PATCH 13/13] hw/riscv: add create_fdt_socket_cpu_sifive()
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x534.google.com
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

On Tue, Jun 16, 2026 at 6:39=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> This sifive_u only helper shares DT code with other boards.  The idea is
> to reduce code repetition while keeping sifive_u characteristics in
> place.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/fdt-common.c         | 11 +++++++++++
>  hw/riscv/sifive_u.c           | 24 +++---------------------
>  include/hw/riscv/fdt-common.h |  4 ++++
>  3 files changed, 18 insertions(+), 21 deletions(-)
>
> diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
> index 70168ad657..b27ff13bca 100644
> --- a/hw/riscv/fdt-common.c
> +++ b/hw/riscv/fdt-common.c
> @@ -189,3 +189,14 @@ void create_fdt_socket_cpus(void *fdt, RISCVCPU *soc=
ket_harts,
>                                         is_32_bit);
>      }
>  }
> +
> +void
> +create_fdt_socket_cpu_sifive(void *fdt, char *clust_name,
> +                             int cpu_id, int socket_id,
> +                             int socket_hartid_base, uint32_t *phandle,
> +                             uint32_t *intc_phandles)
> +{
> +    create_fdt_socket_cpu_internal(fdt, clust_name, NULL, cpu_id,
> +                                   socket_id, socket_hartid_base,
> +                                   phandle, intc_phandles, false, false)=
;
> +}
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 27c1a74d99..0c6e4204cb 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -145,12 +145,9 @@ static void create_fdt(SiFiveUState *s, const MemMap=
Entry *memmap,
>      qemu_fdt_add_subnode(fdt, clust_name);
>
>      for (cpu =3D ms->smp.cpus - 1; cpu >=3D 0; cpu--) {
> -        int cpu_phandle =3D phandle++;
>          nodename =3D g_strdup_printf("/cpus/cpu@%d", cpu);
> -        char *intc =3D g_strdup_printf("/cpus/cpu@%d/interrupt-controlle=
r", cpu);
> -        g_autofree char *core_name =3D NULL;
> -
>          qemu_fdt_add_subnode(fdt, nodename);
> +
>          /* cpu 0 is the management hart that does not have mmu */
>          if (cpu !=3D 0) {
>              if (is_32_bit) {
> @@ -162,25 +159,10 @@ static void create_fdt(SiFiveUState *s, const MemMa=
pEntry *memmap,
>          } else {
>              riscv_isa_write_fdt(&s->soc.e_cpus.harts[0], fdt, nodename);
>          }
> -        qemu_fdt_setprop_string(fdt, nodename, "compatible", "riscv");
> -        qemu_fdt_setprop_string(fdt, nodename, "status", "okay");
> -        qemu_fdt_setprop_cell(fdt, nodename, "reg", cpu);
> -        qemu_fdt_setprop_string(fdt, nodename, "device_type", "cpu");
> -        qemu_fdt_setprop_cell(fdt, nodename, "phandle", cpu_phandle);
> -
> -        intc_phandles[cpu] =3D phandle++;
> -
> -        qemu_fdt_add_subnode(fdt, intc);
> -        qemu_fdt_setprop_cell(fdt, intc, "phandle", intc_phandles[cpu]);
> -        qemu_fdt_setprop_string(fdt, intc, "compatible", "riscv,cpu-intc=
");
> -        qemu_fdt_setprop(fdt, intc, "interrupt-controller", NULL, 0);
> -        qemu_fdt_setprop_cell(fdt, intc, "#interrupt-cells", 1);
>
> -        core_name =3D g_strdup_printf("%s/core%d", clust_name, cpu);
> -        qemu_fdt_add_subnode(fdt, core_name);
> -        qemu_fdt_setprop_cell(fdt, core_name, "cpu", cpu_phandle);
> +        create_fdt_socket_cpu_sifive(fdt, clust_name, cpu, 0, 0,
> +                                     &phandle, intc_phandles);
>
> -        g_free(intc);
>          g_free(nodename);
>      }
>
> diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.=
h
> index 3af9d5c3fd..2d6b9a5d03 100644
> --- a/include/hw/riscv/fdt-common.h
> +++ b/include/hw/riscv/fdt-common.h
> @@ -26,4 +26,8 @@ void create_fdt_socket_cpus(void *fdt, RISCVCPU *socket=
_harts,
>                              int socket_hartid_base, uint32_t *phandle,
>                              uint32_t *intc_phandles, bool numa_enabled,
>                              bool is_32_bit);
> +void create_fdt_socket_cpu_sifive(void *fdt, char *clust_name,
> +                                  int cpu_id, int socket_id,
> +                                  int socket_hartid_base, uint32_t *phan=
dle,
> +                                  uint32_t *intc_phandles);
>  #endif
> --
> 2.43.0
>
>

