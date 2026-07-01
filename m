Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C44C43458
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 04:15:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wemLU-0001vA-SK; Wed, 01 Jul 2026 00:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wemLS-0001uH-Ps
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 00:14:42 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wemLR-0007oB-5B
 for qemu-riscv@nongnu.org; Wed, 01 Jul 2026 00:14:42 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-698562f10e7so335094a12.0
 for <qemu-riscv@nongnu.org>; Tue, 30 Jun 2026 21:14:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782879280; cv=none;
 d=google.com; s=arc-20260327;
 b=bsMfdfRaPUBe6hmAw/lk5JfbD4iPrfOqTM5sUFZAlt/vwcXWDU6b2HkbK3SmIy4TD/
 Kk9hcSWRvBBq18RyNfxrCWu2JQaAQw4l2zqY1JaJK/UZUlKBnQ4OTZ3xHcGCChln9gnq
 zQPWHme67p37nXQjsaktaBy1bI/9Tk1+WPqN5kDw8Fao4DG0GsjmADkfrAH+OtTLXMY6
 C20zCyvXssM4dgMstPfJDNUdMqcQ49haMWTc/nVQKrMMPYpfI3Hur5VMftdqf3g6uGP6
 RrXpFrpc0CDOoAmoE/Gn81/11/LWxNT5LXv3B0t9Ddz9X/ibgb/49imnHcfdVBWqxubk
 +AHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=7+9sRjRXYDFcrkBxnSLybCqsBXTjkR7NSKgdE34tPL4=;
 fh=MNtn73kwtBV971zzhH8eSPDLsgwJDZ8tduoCUO6ScGU=;
 b=cBgW4yQeIuHp14A/l/rzkox7tp1sON/NxNlJGw2CfJ6O4oQtF0PB0Prph6bQhet4vf
 +aK4G1THNZcuQrvhK3TPjuzyoF9BD7yt3Gvx26vxCaxXkmyrc2QYR/dcYIJPoD4j3KQE
 NuV5kp2ip0t+Yayb1hvpuTBX/HbZz2i+EBz/s7kek46I+zF3gL0qGCUGrV8pi7qD+Gjy
 juG2xwXIAV0pjCbKQv5W47hXQfkYCQ2nywfJX+OAL6a0jRj4u1GO5X7bOek0W6lvGFcZ
 Ul4heAMfIMWd3YiE9qqqgllDPYTMseyO21/LPV4T+SV7Z/0nM2KLOzLOiT68p+jf7AgN
 GRGg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782879280; x=1783484080; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7+9sRjRXYDFcrkBxnSLybCqsBXTjkR7NSKgdE34tPL4=;
 b=fCi1H2VFnZzs7QS0OkgdGiPPeWOqrO6jX4NOvY+csqJrXvghdHh0PnwK/Tm6yRp2Lw
 NrmEjOIDqF5izZw0x8fAONm9rn3l+fIK44SBrUtN7YBsEhaX7ADst7BScxGpJWYjWmDE
 DblfxFXu107h0vv+cj9KPH0a7w+m/cPtRrUsHlAszY+AyQ8uYMV8NO3ISOuLwklSTZwI
 v1t7LZYpRFs+nmzNZLuB7o9afbFK8+DnDXV49bhr4Lc/nuro2mZo5kDMZ+eDkX9svDC/
 t78oXeIcPOC830W1oEwMadGdwWe05ltZg5qaMff6408N5ToYx46VPnDRdnS7NVUHZsTi
 xyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782879280; x=1783484080;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7+9sRjRXYDFcrkBxnSLybCqsBXTjkR7NSKgdE34tPL4=;
 b=spoWDHHT52NKkAuBw/krYkEHwAKIvH3eCKvks1iW2C2qZU5oOQ9/4lRHIPo1PuaG3T
 ZRIVW/ISAVMim6GHOttuk1cUZTrEWSdgsizFw45DBXrY7LX2vyCUJ7PGYtZXpZbBq88Z
 ExmjRgnd2LKdoccyIHHi81Uylg6o62T8QUOUL2KBDoeHbCMdQV9/QOuitfNDSyNqE5jy
 k1n3j49NJJjKtwopCp6YI8SkA7DtH6204viVr6aUEBbfhwsCOJW42NubImm4aw4racsm
 Jx17RLZVjuFO2P87A8Ebu/Y1t/z+UCP/iZCQwYAUc9ZoU/MqyTS6w4OjihPOZ2rEKxtC
 MBzg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpNGUflTFRrkx4Oro/RXrV7Z7d74EbM8YSHDIDV0VmXrYlNDAULye/z0JWRDLhhhRIYjhPxjHL4sWV1@nongnu.org
X-Gm-Message-State: AOJu0YxrX6W3665PJOOvlk6VUmJPtatPl/gT6CsBhKwTR+jOwrs/HplQ
 2qs2+TKcCT4X6E8xt5CE5MuQ5wiuhc8Jx3JZVfl1IT0UK7uaWd2nfUCO/Qp/DIFk1XQN2+WESHl
 9ZdiynL+VUG2nSJ0gZi4l0f99Qnp1c0A=
X-Gm-Gg: AfdE7ckWpPBsQjxZsoJsIsLwoz42U3v/+kxYzThkQgfscIAVaS8kYb8X+SLO44P6x3R
 tHGwH6cEHLQXYG2P8nvxptiPZeoBXhiTypXfyMQKAOlhH435cZxJIHa03Wqo4BiSJUYim7sjnTQ
 DoId10/MpXEgZ4K188xKOA/nPoWtHENqUGprV95CFV0BY+bhPMerBYKkxJHhTYX3ZkH6texlndX
 QjjLHEnEf9UnThyMXyLe3R9sGlu9io/4t1IxRa3HTF229w5etJocAH61hfPJ+XFT35PKzcakMq/
 U8EPyZrQsLSaHHRzBX30zjq2c/g=
X-Received: by 2002:a05:6402:4307:b0:698:3b7c:7e4c with SMTP id
 4fb4d7f45d1cf-69879e0c993mr3141926a12.34.1782879279431; Tue, 30 Jun 2026
 21:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260630211044.82894-1-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260630211044.82894-1-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 1 Jul 2026 14:14:12 +1000
X-Gm-Features: AVVi8CeQSCmgrhRiDUQiOTdIXTeZQjc5vS9pCvh_yvPp0J9DvJ2wsdQDrKVzr70
Message-ID: <CAKmqyKNMYoxcjNN+zH4cv=r+RfmjvHpO7s8Np0Wg+fr8hSmynQ@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/riscv-iommu.c: always fault with SADE=0 and A=0
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 andrew.jones@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
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

On Wed, Jul 1, 2026 at 7:11=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> riscv-iommu spec: "If SADE is 1, the IOMMU updates A and D bits in
> first-stage PTEs atomically. If SADE is 0, the IOMMU causes a
> page-fault corresponding to the original access type if the
> A bit is 0 or if the memory access is a store and the D bit is 0.".
>
> Note that SADE=3D0 and A=3D0 will always cause a fault regardless of the
> original access type.  Right now we're faulting in this case just for
> reads.
>
> Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3551
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/riscv-iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index c9687e01a8..70eede3f14 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -480,7 +480,7 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s, =
RISCVIOMMUContext *ctx,
>              break;                /* Read access check failed */
>          } else if ((iotlb->perm & IOMMU_WO) && !(pte & PTE_W)) {
>              break;                /* Write access check failed */
> -        } else if ((iotlb->perm & IOMMU_RO) && !ade && !(pte & PTE_A)) {
> +        } else if (!ade && !(pte & PTE_A)) {
>              break;                /* Access bit not set */
>          } else if ((iotlb->perm & IOMMU_WO) && !ade && !(pte & PTE_D)) {
>              break;                /* Dirty bit not set */
> --
> 2.43.0
>
>

