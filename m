Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C527BCDB46B
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 04:58:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbWje-0003eT-6D; Mon, 22 Jun 2026 00:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbWjc-0003e6-VW
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 00:58:12 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbWjb-0007nH-Fn
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 00:58:12 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c07fd4dc2c8so399967566b.1
 for <qemu-riscv@nongnu.org>; Sun, 21 Jun 2026 21:58:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782104290; cv=none;
 d=google.com; s=arc-20240605;
 b=ASYA3ASyHdf7NKtWpjnzvJHbau42DRpLtiFQwx+K8YCD0iR83XNSqdW25rw0xYWZLH
 6TJ/tya3OnNRh1RGkz0Iw2Isb+6idYRKhOsXUz68G7JX5pYMJjFs4K4hb/oT0YIBrY6W
 zpyklovMtRBglluBV6Ewka0tzMMwFGBR3HKqxxQ9ktcIwbng6nLCQge66Ino+gCg12VD
 AjFQw0YbH1RrvXgoqdj7RHwmNFbK6CGPRgeW2KpWZeFOyTG0V7JBkKIKDu6Bta9/thrp
 1/PxUqFnzyolvGr+7ZJ0RVHUrl5s8qAnGlDlkVyhRGmyHn0HmQmghZdWzXaRBWnyIDNX
 Ix1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=+rD8PZlTieOsJ6M0PjZbHuh4t2iX6CqsGlrKs8H6rcE=;
 fh=ChaY53diwBTlPGIX7antBvKusLCHTbRx8JHfSq88LhE=;
 b=TZTUzem6iAzzFaA+QCRZ9SFF3DENQsies1XGOx2NVGV+J2ss17rCyXl6G946ggtOGw
 mGqcMIuB2Hwgs2vgn0o+XG3mPKa5FacSUwN4w3kopG/vHyCztqXejj8lshMd9yVKI8rv
 4jxPTex9KYU4xR6pvX47H/X4E0QMATedL4F0VyODh05sJ6MYcYGSwoyLmpaHDpgaSor2
 u59/xCtOt+Lir+IOz9mehXED0wWEklBcB9T1NZif/+kBg0BgZmSq9szUbn0dJPn55ShH
 +Di+jEcp2nP1ijdInSNwf7+3lfQS7Wnmy1yAGRyPOSbNhpjgL3Dra1m/y61Ul7baSlnP
 JFIQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782104290; x=1782709090; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+rD8PZlTieOsJ6M0PjZbHuh4t2iX6CqsGlrKs8H6rcE=;
 b=goC1xwdu0CuLpUFWQzLxYmBzU3p06+fBHrT7nNggpC0wARS5NmZX/UYZe5E19SPIXh
 7Dh+OWyAu87SZHwzQw4z/AsuBvULQ/uiOz+pxnI1q/12mLQ+jNapSmyBoKUm18IsSJFw
 mhSRYUzp80P4V/Sxyx/iRbJ8GK3EJbrvccIYcK0Y9rwhOCrtk6v8yfT+gii+JInTP0sU
 VjyNlIngSKZy6AeSIZHWjhzUA/XIudhRPRVz87e3eD+6Oyzi0ZLaBHBsVuowxmHxPpbO
 eHBh7koNoRQEwG584qxNDVO0BN5RUnQn+5zn4VSQBAoyXNB1yNfnhCvdzWz+LLnRzl4g
 P3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782104290; x=1782709090;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+rD8PZlTieOsJ6M0PjZbHuh4t2iX6CqsGlrKs8H6rcE=;
 b=swlbMPzowxvFJK6ESxYFQTFzZmsCVpnrNHVCzkFDgp4H4+GLUONJsjUYNL+elEEb69
 foB2s+C3JGnmU4qTg1rH76t5pkOj59lSVpVPwOG/DA9GklUv5rlBXkEV/xxmIAL/4KYk
 DeBRBCwoKfCcJcP+sjeCvrumuJAKJw/DUSBBxXFVugE3+ncS0UQhMz275K87hF3JnPcv
 ccUbvSWX2dqx3o0cp3nn2yoicNgBUI8J6G5FlotW9e/NSUOiIVyVmgbHZgfxF+hWJ/Zc
 /GiY5LJFLN5fQjpn8eBkJnjZPgVYclYEdIqd+o+skFOfiJ+5IgSHBoFoSg3MRWt+R7yA
 GR9w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/O5fG8PBJdc4YeXmIXYyivsKAeAcbrpiDEcLTm28X9c7KICg3wWdgtvj6sZViGrspqutziN3aN0YCY@nongnu.org
X-Gm-Message-State: AOJu0Yw2m9BElYD7JWwh2Hq1g+bEtSfYfo9dIXjNqf9IA6j8UBbuaCL1
 N8Bh3z33GcFe0p02ebXD0G335tSweIF+Gk96tO1p7LpNOwqMhp8HTnKcldM1ilu5NZs6294Grc4
 9LfVmrCFJQwOtbaFHEPYPy7gMLjDFAnY=
X-Gm-Gg: AfdE7cnuQEXWsc4Yw3y4g1ER2CdRwbIulL5hfkSqOpquAX01OuQ79wpuqN85qyccc/t
 CKvW9/Pg6k7ue07IGT7f4b/OgkuJVyxqJIwai9mNGoItkKF/rSj1rXz1Vcpfk0Upz9ajP36eyPm
 BdaJiTsGO2T7SsP298KK3mFKiKrnFhIaKkAT206mJUfZ7QjZ+iQlNJv9/fQdzQdHKhmBvxLJwJO
 h7lM8L6fIcZ2VZw9bGRKeXA89PWMd95jCwAHoO05rKrmelY/bO72nbHvAeeimWsKd9p27jlAl7g
 zRok2/8Cn6j3yMUk9KG1LcVt9HQ=
X-Received: by 2002:a17:907:720a:b0:bb7:eb68:514e with SMTP id
 a640c23a62f3a-c097c5bafcbmr587833466b.36.1782104289554; Sun, 21 Jun 2026
 21:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260616235939.1358663-1-daniel.barboza@oss.qualcomm.com>
 <20260616235939.1358663-3-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260616235939.1358663-3-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jun 2026 14:57:42 +1000
X-Gm-Features: AVVi8Cdq425k-q15zk7DLzxZFbZFt2XupHICSBakgtXTinvUdckC8c3k-C32EqQ
Message-ID: <CAKmqyKNZ-EJNP1f=uxjFj39M38MhukphL8mvUH2w53Ou41aqtA@mail.gmail.com>
Subject: Re: [PATCH 2/5] hw/riscv/sifive_u.c: use intc_phandle in plic creation
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x629.google.com
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

On Wed, Jun 17, 2026 at 10:01=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> The info about intc_phandles for each CPU is already stored in the
> intc_phandles array.  We don't need to fetch them again using
> qemu_fdt_get_phandle().
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/sifive_u.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index fda9a09f06..b3468254f5 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -199,20 +199,16 @@ static void create_fdt(SiFiveUState *s, const MemMa=
pEntry *memmap,
>      plic_phandle =3D phandle++;
>      cells =3D  g_new0(uint32_t, ms->smp.cpus * 4 - 2);
>      for (cpu =3D 0; cpu < ms->smp.cpus; cpu++) {
> -        nodename =3D
> -            g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
> -        uint32_t intc_phandle =3D qemu_fdt_get_phandle(fdt, nodename);
>          /* cpu 0 is the management hart that does not have S-mode */
>          if (cpu =3D=3D 0) {
> -            cells[0] =3D cpu_to_be32(intc_phandle);
> +            cells[0] =3D cpu_to_be32(intc_phandles[cpu]);
>              cells[1] =3D cpu_to_be32(IRQ_M_EXT);
>          } else {
> -            cells[cpu * 4 - 2] =3D cpu_to_be32(intc_phandle);
> +            cells[cpu * 4 - 2] =3D cpu_to_be32(intc_phandles[cpu]);
>              cells[cpu * 4 - 1] =3D cpu_to_be32(IRQ_M_EXT);
> -            cells[cpu * 4 + 0] =3D cpu_to_be32(intc_phandle);
> +            cells[cpu * 4 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
>              cells[cpu * 4 + 1] =3D cpu_to_be32(IRQ_S_EXT);
>          }
> -        g_free(nodename);
>      }
>      nodename =3D g_strdup_printf("/soc/interrupt-controller@%lx",
>          (long)memmap[SIFIVE_U_DEV_PLIC].base);
> --
> 2.43.0
>
>

