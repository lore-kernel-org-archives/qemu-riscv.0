Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D04CDE00C
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 02:43:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcwWm-00080L-Kp; Thu, 25 Jun 2026 22:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcwWk-0007zY-1N
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 22:42:46 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcwWi-0006kT-7m
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 22:42:45 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-693c51a8a19so830301a12.3
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 19:42:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782441763; cv=none;
 d=google.com; s=arc-20260327;
 b=n7VFFggUkBpKLXUdeM/KsL6GolwMBZYZIiJNdIZWTs1SRYMV2OfI4VOk7RXg1KPkkA
 xwBkaTQAzymXYaJVjvUCqW11f5fDnisJqEjrpS/B7l0sv8LyU9T3o7hgYG5HYbpI8KQM
 UMFy7ItA1vlOfc0yjWVAPyFKBB+ssygBzFGo0raT9rgnpOSkQa3SYRFW1dy8lps/KsCY
 6aCDSVYYqMi/PZjI+qcEWl2GiWl3PTD+1vfBg0zudOYCwsn81k4o44j4XeX83JD2/yPO
 0pugfmVWyQuWZVeSnHJdsho59H0mvpSL2lS5FcLLQ3zc55siKgz/cUGXeR9ALIbuQgol
 v9GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=T2a8zslxJMFNeMrLeiKpQGxtzsvDdS7R2yRapoOAFJo=;
 fh=ykMWHfNvdpyMIbBGJM3c9xJ4BSHfr+YUoGgjZo+Ox74=;
 b=VClmyXeQML2vmp88v2dW/0y6Yy3CHVBEPw5Ya51UxQaD9kIesaCTtuXRnbda0ShDEn
 Abbx2ZRl9tlFtOLddh8EhgBKItJkTj2cUQUVVKLUaPd4M+VjaUfPdulO4/DQm6Litz/o
 86ocRHVdL4oHknNHP2G6b8oZK/DWFSqFETjinbTcd/QjfI+8rhgROcbO3BLu2SlKxo36
 AS5BjI1/KmI6Wuen3QZo+vR0mqleLyLtEYHbvLTH/u/IlZNJ1d2fODYB+wdMhBsnpsAW
 s8Q2llf5TnH9/620n5/vjgfNnq0mKyI3Jxsz3v+2r/ZpTJgVTV+1ixzCVnoUJ/FJ/RBQ
 CHGg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782441763; x=1783046563; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T2a8zslxJMFNeMrLeiKpQGxtzsvDdS7R2yRapoOAFJo=;
 b=b5rO8ndyQMpUNZdWQtsmOZGVBwF5vAgvrwHIurfq/Sf2yPo6CX8Pse6rP6QGNDzMvW
 Cj93dnQxoNBsnGbzNtYlBiDVZukVIPuXKPtusuJUNWrYYTgFAHlbIBwDfTAZW2vTfbnh
 IBDKfb4C39Xg2MCTYd/uObZIyhQnDoWvdztIys34b80Z9NbCzqNa0INZXBsWMiyZAONh
 NO62mM12HmqzpG31cUbUtpgbMRFxoJJL3y//afefhMCJQHnVPSYdGgWBERg/NNG+c/wQ
 slTwfgoE2H/yQR9CDZZhsG5qA+uvIDTJDDo8cQaJCGrVKm57NGBQa2oO+xpenKON2b34
 oyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782441763; x=1783046563;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=T2a8zslxJMFNeMrLeiKpQGxtzsvDdS7R2yRapoOAFJo=;
 b=OxGfNLLCKcQYWvDERRotXFv+EOnrySsChous+OuAUb8OszIW9qQPaPpp1cDkoRuVW3
 ACisg89VDpVqM0h0KnMyLPpb3K8PpFdX2AGhr60P6sSQxado7nRwbSeIWPfmwS9kN86S
 R9RTR3bqUZ7/rBw78juvgRoRd4ujfArKdizjSpvwMWmW8RV3JS3L88tsrgJ1w7cBf95T
 TEqKe3VUzOKY+0DXoLyiI/CLES7hjRTuqlHQcVnU0qcHly2M4CeMdEZdCxF4OGZMKeFA
 stcJKnQWe6S9mPUKy88ghHOhco7+qHb5JYgd0HB3BE2GrsBrpCiJPh+oc9PyQ88+LiBL
 44DA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr4foC0HV/G5COkDpvPQsWSzL9ivfv4C/qfhGAduOZhBA7aTlE1gRQHyi29ESPbrw0znvsZtwsZX8ex@nongnu.org
X-Gm-Message-State: AOJu0Yyc3CoQXNvw0sFnxHivgUeVtZnLxg+Rp2eSQh56Wj8E7w0wpIvI
 0/SdmZ9tJefao9X5CHMtWUriSDIKzj4aZRXsFDsAmVgQJM6vMOsHS5jYOvshLsY2//hXXuVRu3+
 PBFb3hYkqx60e6TjGO8/0UJQEWZ7cQ4s=
X-Gm-Gg: AfdE7cliFYvaBIE1Ccqw254zk/gd3TPbycGEEDYF+nVqZL7MXiRBfQXBeX7PTykO/YQ
 QEjC83JV/eLQKN93OwvWfPx+UTmlLfM7x8IzY3QFC21N+tNlIbTBJV+z0sRc1+3gpUFEcE+UV+A
 LRNxjeEBea7uOw9+brR8aPKN4T5F22bfzk2R5XIorv/vfGmyzIcMuHQojwa/093l7XkNcmETtME
 nnncS1PVfoH2bGL0aeSWKkcfnuUOPQzIkLyxeEoLHqD1JICftcbj30W16tGkgg/abKfuoMduI5h
 sIVnjUrg9Tld5tVOSAS4EcIShwg=
X-Received: by 2002:a05:6402:5408:b0:697:decc:7f89 with SMTP id
 4fb4d7f45d1cf-69810a47dc5mr948463a12.10.1782441762596; Thu, 25 Jun 2026
 19:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260625210833.3294437-1-daniel.barboza@oss.qualcomm.com>
 <20260625210833.3294437-3-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260625210833.3294437-3-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 Jun 2026 12:42:14 +1000
X-Gm-Features: AVVi8CfHEigQZqs5IlhjS-tFT9qsNUIyzG3zG3RXNRB0I0u6k2UwpNOaAWrn720
Message-ID: <CAKmqyKPk1g=Owq1mm8t0H+XXUO3Wfrg239saE99RU=ky0WNbMw@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/riscv/riscv-iommu.c: make FCTL.BE read only 0
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 andrew.jones@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x529.google.com
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

On Fri, Jun 26, 2026 at 7:09=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> We do not support FCTL.BE equal to 1 hence do not allow this bit to be
> set by software.
>
> While we're at it: the riscv-iommu spec allows FCTL.GXL to be set freely
> and we do not have hardcoded restrictions on it, so make it writable.
>
> Fixes: 0c54acb824 ("hw/riscv: add RISC-V IOMMU base emulation")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3576
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/riscv-iommu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index 30f16b999c..c9687e01a8 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -2609,9 +2609,11 @@ static void riscv_iommu_realize(DeviceState *dev, =
Error **errp)
>
>      /* Set power-on register state */
>      stq_le_p(&s->regs[RISCV_IOMMU_REG_CAP], s->cap);
> +
>      stq_le_p(&s->regs[RISCV_IOMMU_REG_FCTL], 0);
>      stq_le_p(&s->regs_ro[RISCV_IOMMU_REG_FCTL],
> -             ~(RISCV_IOMMU_FCTL_BE | RISCV_IOMMU_FCTL_WSI));
> +             ~(RISCV_IOMMU_FCTL_GXL | RISCV_IOMMU_FCTL_WSI));
> +
>      stq_le_p(&s->regs_ro[RISCV_IOMMU_REG_DDTP],
>          ~(RISCV_IOMMU_DDTP_PPN | RISCV_IOMMU_DDTP_MODE));
>      stq_le_p(&s->regs_ro[RISCV_IOMMU_REG_CQB],
> --
> 2.43.0
>
>

