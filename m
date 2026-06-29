Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFEEC43458
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 00:01:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wdzQx-0001h8-EY; Sun, 28 Jun 2026 20:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wdzQv-0001gk-K0
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 20:01:05 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wdzQt-0008WB-Tg
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 20:01:05 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-69857dc1d5eso1363218a12.3
 for <qemu-riscv@nongnu.org>; Sun, 28 Jun 2026 17:01:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782691262; cv=none;
 d=google.com; s=arc-20260327;
 b=hnjOzDdNyje+lu1IIxcCzwJqOEXobL1aNMrd7XlYpGLj7HGk9yOWlchA5FhX33o7ax
 0r1L8TdZbz4LwB7wQRRkJc/3HWzwAoywtQYayzORRV18wGTctgb3ODnLbs7KceMohf+4
 QE8/+PwCY+ohHNwd49sf5OOr3Th7RJeFhB2CutszMEfjgI3GbzyqEa1IaDENLI3thR55
 1Fma6mjpsfBm2Go/rjik9xJ2xXdnLUFmqSmQCgVw96+GU4rbiiS5rmfPr62is9i3cuXw
 b1e99/6z3rtkqv2Br1HpvaiFM793b3Khshq7NDCkYXOscJcnhJ1pxNFlJobKF02G9bR5
 f0vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=2aarkSTCtP1tNWtsc+x4BsJLyqTOaYD/qR94YreBArI=;
 fh=+s3Bmvxkc1kkAyUb8gepyD6UJs89t8vyY198h4dR82Q=;
 b=M4buWvFUNAmE3B8WIuDOaiv3sigwkxET02FDSxou1LlUGNOENbcYgnVwkXPSCskwUX
 CD8T7adyImEGGHaZmRF83Wbv5+QO2A4t60olvjmwiX5u4twv5HuKOmAy9t7mD6Gb792q
 gUx71zVxqLMVwIW7BBKbwb2H30xbxh7P+sVNivVF4vkntbXOUU60nuxhzpD7dvwLihbK
 UHULhBS2Kt0BL+mKgHGAoa1ttp7AkseFsZs6cPYEcKdFXjq69jFUBfz50PyHsFaikR6o
 rvTjiBT2X+/2IzDHyjrxz0L4Q7gFGiUTFZQ2G/2UFs5TdsmnGlG/7cK8BMgEzf5qcUFn
 AKPg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782691262; x=1783296062; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2aarkSTCtP1tNWtsc+x4BsJLyqTOaYD/qR94YreBArI=;
 b=T85dfvJ8yC10Fh6dCKfjU4iCIrsuQ3+JdhmIqBNBk8QmzVfiEDOdLrtZraCNOmlIdA
 4q9S23bLcZFsHqcvQv5e77TC6H0Q9V+ii1OjAx7tcN7NKZ0sdR65OOTmX18lHOul0+mf
 XY4358RHlaE4q8fb/NJ4Zz95fNwWzwZM7Q9YKj9/Lo5bFEn8lhES+ebheBOSvVb5qvru
 pBBcqUaqX/ql4WQQPFoBVtU7zi/Cw+KaB4hBsgKIrf6iCHNZ+DL1PjMsxnqfcSA++qkN
 VjDK9u3W5bvq/1sN2KCqI1/l9wz4bG75iaWs4UEWP8St8wikYwNOjKScH0Da75Kn6mEI
 ptzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782691262; x=1783296062;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2aarkSTCtP1tNWtsc+x4BsJLyqTOaYD/qR94YreBArI=;
 b=lqCUHiZnQ0/eb12pfhlz1cFTbnD9fWlfdMtKcmx+OcebAD5gcxnxDlB2e/8J2hDbPQ
 QjB7jW0I3gVIvz2ixGdoWfGbzxkLZ5vXyhPlywE5bud+lRADFrW+NPtZ0BPD6/fHR5wo
 HxCQPADq7QNPBh0F5Yh37+ZsZZuoth+pdvE9T8dUJcbl7uJqo3jPF+tdSKM1Di2d+YR7
 z31S8SQCwlrFAMcBfY++v6ZuDgO2OosSqG8oVqNFZGS5UAHqVfEE3Jq9x7hFXOuJMIbI
 G+5nbVDDgWFQzlxwy4JPCOFJHfhbcJG0J5GDObeGsLp+pnlYiq9gwg7BZZfJ9SDLmqRW
 4h+Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RpvTjliEzNqdq1l6k63UjcZvU3Csksj21mj3RvU3jLISRAK2Fan5UsIBUF1FHPznXUh5PWBAnGMr/YN@nongnu.org
X-Gm-Message-State: AOJu0Yw08+BepeDTT2o27zpWaAAdmJ+F/nYsOgiKrmoQaEO1yzVb7E7j
 nXyAbV+IF9HAMgsP8eq0V2F8LByBYDn8GaYHf0p0AVdRzf2Co1O3DNwfWAqi9XmQaq0482fRsk1
 b75OPYUsffpNM0XPdonWqSkqtCC0R1M0=
X-Gm-Gg: AfdE7cloxF/DjdqGFkGlIgUD17rBPKNAOOYLj1z0cHvA1grC/gzkIjpvcDi0q0tj125
 cgTce6VA6sGZ9jvkx3GW/Hv3pYxUcpYhXKGQl4q6hYPjtyhl/ZydiFe76+0SH0pILCLaAMP+eTf
 0QYQ+6Sr5iwIZBOItHoI9ITeuYRdkYC3JdspUQruxl+qJ9Q2p4cUUud6WtS6up+IisHE4mXccui
 jgD8Q0EQWgGyiQW080d/0ETumuE+R7jYqJ6WGtMG18wjbEP/mjxtIh6eJBpxZQU69r7pRZtQkQO
 roxLJiCy7ZaB4PPBTzSdgfg3pG22/dEmfQ6RMg==
X-Received: by 2002:a05:6402:3585:b0:695:9b77:7c3a with SMTP id
 4fb4d7f45d1cf-69810ae8134mr4907717a12.24.1782691261869; Sun, 28 Jun 2026
 17:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260627194640.4130073-1-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260627194640.4130073-1-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Jun 2026 10:00:34 +1000
X-Gm-Features: AVVi8CeJ8Xxlmepx-apf0OTHzeJ9GpVbonRgxYAI_VBmVHwalzaYy376RFL-gec
Message-ID: <CAKmqyKMT5ig-g0cny038UnYSAHfw4fP83YygEb-w-ekp_omnXg@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/riscv-iommu: check DC.TC reserved bits
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

On Sun, Jun 28, 2026 at 5:48=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> We are not checking for reserved TC bits being set during device context
> validation.
>
> Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3548
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/riscv-iommu-bits.h | 3 +++
>  hw/riscv/riscv-iommu.c      | 4 ++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/hw/riscv/riscv-iommu-bits.h b/hw/riscv/riscv-iommu-bits.h
> index a938fd3eb4..f9b6f35170 100644
> --- a/hw/riscv/riscv-iommu-bits.h
> +++ b/hw/riscv/riscv-iommu-bits.h
> @@ -308,6 +308,9 @@ struct riscv_iommu_dc {
>  #define RISCV_IOMMU_DC_IOHGATP_GSCID    GENMASK_ULL(59, 44)
>  #define RISCV_IOMMU_DC_IOHGATP_MODE     RISCV_IOMMU_ATP_MODE_FIELD
>
> +#define RISCV_IOMMU_DC_TC_RESERVED      (GENMASK_ULL(23, 12) \
> +                                         | GENMASK_ULL(63, 32))
> +
>  enum riscv_iommu_dc_iohgatp_modes {
>      RISCV_IOMMU_DC_IOHGATP_MODE_BARE =3D 0,
>      RISCV_IOMMU_DC_IOHGATP_MODE_SV32X4 =3D 8,
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index c9687e01a8..c2c470b5df 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -752,6 +752,10 @@ static bool riscv_iommu_validate_device_ctx(RISCVIOM=
MUState *s,
>      uint32_t fsc_mode, msi_mode;
>      uint64_t gatp;
>
> +    if (ctx->tc & RISCV_IOMMU_DC_TC_RESERVED) {
> +        return false;
> +    }
> +
>      if (!(s->cap & RISCV_IOMMU_CAP_ATS) &&
>          (ctx->tc & RISCV_IOMMU_DC_TC_EN_ATS ||
>           ctx->tc & RISCV_IOMMU_DC_TC_EN_PRI ||
> --
> 2.43.0
>
>

