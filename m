Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFB9C43458
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 03:09:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgZhR-00079a-9g; Sun, 05 Jul 2026 23:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgZhP-00079C-LT
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 23:08:47 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgZhO-0005Et-0r
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 23:08:47 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-69a50189d25so1212399a12.3
 for <qemu-riscv@nongnu.org>; Sun, 05 Jul 2026 20:08:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783307324; cv=none;
 d=google.com; s=arc-20260327;
 b=SpTeZRKYdOCi8tyJXANATYXC4fzOLELUhzUskya8TiyAy+SqeCBrZaxRffjpnhe+b0
 Lpj4+1ho0TuUMzV8h+uYqOyTzaXZ7eYG7Me0WJUvuyhCg5Mb5OpwWLcQuPyA0KA9WrXM
 icCZSqvXE2c3WF6fTnAcclwT2WsNVm8/aHVNpn6agDQgvCX6InKAuoI3t5Q4D90W/h2k
 HCfNGrEe8jFHAZygXuD5QB2dlIhDOdy8/Md2hgjFOnWluVTCokx56xOvGiU6vVFC9O9r
 5/dwStbA9B95z3fGij3y5glN/OVpj48TYJohrXYyZn+xreYHhcdFqdhN9tdIMnKXc1VC
 ttPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=+fEU8KCl5H6eCgChunSpz0tlr6WLAYy/RfoYgPqJ93U=;
 fh=LmvUbs7VmhZiQNzUlbO0J/4mCZT0Tz8yhP/mJP4K744=;
 b=eJ4KKevrPRRsiUgwBSg7QlqDa6a5mjbc4ApvxnAaPbl8E5SSgkKWb/glq8sa5umLW+
 wRECrnCSDOQO4LlhwULXT8isU2JSphjTdEBuFc3sT7YPtUxxuw76jyGD8wrQ9zZjXd4n
 9cq7hJJCWrIznHUX/tMiUGXvEn8pKfXmYXEqfvsy1Z8bX6ZS/vDp2ewc4EAZCyYJr0kU
 kvilp2Aa5pjwfowzd6XJlZCuB+Ou64VbU/JiHJL6EhKjF9HyYa13uSa3K35cQIeOy0Rg
 ryJNETBy7ODqKrucQlIsbax0z84dy3EXFvLr96XGr53tc5MeGHLqcq6qYiQSo6/6UU4Y
 EvBw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783307324; x=1783912124; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=+fEU8KCl5H6eCgChunSpz0tlr6WLAYy/RfoYgPqJ93U=;
 b=B/9cJx4ltGuI50ppsSMqAq4rwoIszSxwaWDMV6ta5jlJwbDHnrJWVei3UV1/ByqQzl
 L2FpkzUp1Sv6x32HCXagQipCGxEBURtEQQmKmaHbO/e423ZMVJvljXFHvZEs3XsreVyk
 Uf7gnI9B95JXr0Q2dnSxy+MYAGyU7P5C7BYuPb2K+JIO92TOKtTFHYZMl6B1ssyMbnss
 l3TOWoeuA3wOwnW3Sm6oui87reD/d2Ry4IoC47COTZf6ep/h6O+xx+R0Cw6zB/UK0N0h
 GSjDvb+R+odnSNpOSR0pnXkdi+pTNXmwt/gsdP2Li4mc35YWBe8VxPSK9e1NlCxd6tz8
 ++NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783307324; x=1783912124;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+fEU8KCl5H6eCgChunSpz0tlr6WLAYy/RfoYgPqJ93U=;
 b=N/yvi+WkUX4GQrumsVOID6fyC/CNyzOEgXQ7GsB3vDVKVmB76v24OxoxFkaB3Vft/J
 t/HTOil9JL47OjBD5P8ErVmPO2mBXRBbM+/XKXxG/xrJS6whM83bBRvx4kZ0+z9nW1J+
 e6e+9EgB0DBrR2v0L4+mSZwQKilsoHFbgUlkB+EWHHklXexu/SP/vG582hRWqmcwAZSy
 w5cjn5EaHPKWFDNJlIf0jDAfZbM045dbRdbssHgQu/Ta5jesS4HcZjc/sauuNFw8vtgs
 yZDiJXMNG1aMFUPu4XVAK5IyIG1R2jUCS0EvAf6kKoSvLRt5KtgVKfp7y88s1RPYtysi
 scoA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoKwzN/3xjMJZqQiKSyj/pW/mouh5gSeQTr7YXIKbA9I/drxB4pxtqu9XJXl4n/QS6RKkpmjN0FWGev@nongnu.org
X-Gm-Message-State: AOJu0YzV2X6F5PirHZ+QrORRcNP4eXtIevvOlBxZbglAE323W8lCa0GY
 QHzzrcb7jv1EfyJciQySYq61agwQ/8kY3A2PNRrkQKFpaWHuMSGn1/xggv1aqU2Wnk7yG2P3GaK
 EUuSNykmb7h34GbYJFYlOYwZRoVb/sNk=
X-Gm-Gg: AfdE7clwBmSXRHmdF2uu3fCj+fl3jAtLrvv97Fk9f2tRCykfBVBGdDSQNaPcBMwrtIE
 bwjJriLoZ8eVeDVGgxbqgrWoQqgcYUz/+TcOaJ3zrvHaa1xZJvKSS9xxACK4KN3gnG8YzJt1N4O
 ee+V9MdXKCWak5aXzmnbm3h9mrAaWGzBuRlDG0pFuuJc3ucsYCKM/G+LcivrvupNzsPbGsNRJ0Z
 4afRShGMpx4YVM8YGRYu8L3OqiDe0vKEEjjDV+z5YyXkzb/mmVtWexz0ZwWSxFapdhqFSNMUM9P
 TTTONN7S4IFL2sEsbOf9mJ0t+6s=
X-Received: by 2002:a17:907:199a:b0:c12:6b39:2211 with SMTP id
 a640c23a62f3a-c12e6bacc2amr292762066b.43.1783307323952; Sun, 05 Jul 2026
 20:08:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260630172110.1866951-1-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260630172110.1866951-1-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2026 13:08:17 +1000
X-Gm-Features: AVVi8Ccdi79T6SUC83q1XLITGdUO1uVOoYJimnQlmR7mht-O6CxrqPbB0WU5uU4
Message-ID: <CAKmqyKNRq+jhcXN8yn5U+iWXeio6Qh612dZSDJAWZHjtafMxpw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/riscv-iommu: forbid GATE/SADE if caps.AMO_HWADD
 is zero
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

On Wed, Jul 1, 2026 at 3:22=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> When capabilities.AMO_HWADD isn't set, DC.tc.GADE and DC.tc.SADE are
> reserved bits and setting them throws a DDT_MISCONFIGURED error.
>
> Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3549
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/riscv-iommu-bits.h | 1 +
>  hw/riscv/riscv-iommu.c      | 5 +++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/hw/riscv/riscv-iommu-bits.h b/hw/riscv/riscv-iommu-bits.h
> index a938fd3eb4..2e8bc19dca 100644
> --- a/hw/riscv/riscv-iommu-bits.h
> +++ b/hw/riscv/riscv-iommu-bits.h
> @@ -86,6 +86,7 @@ struct riscv_iommu_pq_record {
>  #define RISCV_IOMMU_CAP_SV57X4          BIT_ULL(19)
>  #define RISCV_IOMMU_CAP_MSI_FLAT        BIT_ULL(22)
>  #define RISCV_IOMMU_CAP_MSI_MRIF        BIT_ULL(23)
> +#define RISCV_IOMMU_CAP_AMO_HWAD        BIT_ULL(24)
>  #define RISCV_IOMMU_CAP_ATS             BIT_ULL(25)
>  #define RISCV_IOMMU_CAP_T2GPA           BIT_ULL(26)
>  #define RISCV_IOMMU_CAP_IGS             GENMASK_ULL(29, 28)
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index c9687e01a8..891a56e731 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -416,6 +416,11 @@ static int riscv_iommu_spa_fetch(RISCVIOMMUState *s,=
 RISCVIOMMUContext *ctx,
>          const bool ade =3D
>              ctx->tc & (pass ? RISCV_IOMMU_DC_TC_GADE : RISCV_IOMMU_DC_TC=
_SADE);
>
> +        if (ade && !(s->cap & RISCV_IOMMU_CAP_AMO_HWAD)) {
> +            /* GADE/SADE are reserved bits if AMO_HWAD is cleared.  */
> +            return RISCV_IOMMU_FQ_CAUSE_DDT_MISCONFIGURED;
> +        }
> +
>          /* Address range check before first level lookup */
>          if (!sc[pass].step) {
>              const uint64_t va_len =3D va_skip + va_bits;
> --
> 2.43.0
>
>

