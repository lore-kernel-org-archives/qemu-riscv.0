Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABF4C43458
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 00:21:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wdzkZ-000581-Dj; Sun, 28 Jun 2026 20:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wdzkW-00057j-W2
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 20:21:21 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wdzkV-00015V-CP
 for qemu-riscv@nongnu.org; Sun, 28 Jun 2026 20:21:20 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6983f5c1c52so2496063a12.1
 for <qemu-riscv@nongnu.org>; Sun, 28 Jun 2026 17:21:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782692478; cv=none;
 d=google.com; s=arc-20260327;
 b=ciFj1Gkau3OH8ESvCMIw/dvo16QvCnTh1xr14NPaW3ZgFANYequHdngoII8LwjvidT
 jOhGrT7AqIGJRXWEwcrMDb6d91Z9fyx1oQ3VHZOFo2oFaZ9VB6cnqiMIg2VIN2e6jPPm
 AcHCjRh1dIkgPryCJxBuahgCPkj0oiQXy2U52L965wDaLfLMunzV2dxLNyJHQ6PyujyL
 32zFR8d2EP6/iE9nAf0YLq72EPcZG97J8oCJMF2rwU34/4qMU08xynvrzi3RapKqHT4Y
 1bFjRASE81HMhB+kQalzdrmuqUt2P2ksqGP9gN37gBk7hCV6MefSq8oAD0TSkOKjSBSz
 39Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=qFC1ISKzTT56hm33utME5mbmIaNnqQUMoJvtsmsg8sg=;
 fh=upvT3EZ02i4QxWIb+ZQ2d4pYYke2kDC6zLUvAKXkr/4=;
 b=OpjJ721CR77eupIXzoLUlJyXK+90xC6fsGygv/PhAOvoPdGBiiQUVY6vHf+RoC8LxI
 Q3DOelFXdnPSPxHB5MzJwpIIDpdPhwvZuxNRP5iSlTis72l/fjNZV3W2UCuNPoUg/Vk5
 h93vwQfZOsMznx0No0FUc05jhId+52VhHyp/MhNUF9BXp3LMvnWvU+HnvaslaqilQgX2
 y3wa1Htq8g135BxnoILajZsD11MAxQalL/atfPTPc1uJo+pTHDU9FhPJMgNgoa4Uos7j
 M+AYkLeFzDgI612t2GGpNtUND30ND/uZsJBCH3RNuNUelgSel1NuCgSOfgmRk3r/o8ga
 esog==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782692478; x=1783297278; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qFC1ISKzTT56hm33utME5mbmIaNnqQUMoJvtsmsg8sg=;
 b=Prujzd3ikbJT/TNUoodqc7ThrNqcpumZjb1zijaAppswVc/BllmNmgKl8QY98FGt0O
 Vi9Vy4jlNPtC4Ehf3TImwfTj875c4QdOC+xwyt+/JrvbT04FJRIBZD5BWPgVjlHR0Hwc
 dPRH1Oz/mGM7fQ4O/gCcUgt6FF5V9+CJDZSYLehP713Gr5D+KCODJubHQU/+keEwQcvj
 L2C/+tPJgNzOvrr0KnPEkjYc0wkKGde8U+R0LeLidlqsweVLIVDMoUvHqoakjKcTcgSH
 LG6iNyIeTl60vI3+hbb8LB8L/QX0lw5Rmg7pzLLXGNT9CWdJNgbGwqOKBnVeVRXvGdxN
 tkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782692478; x=1783297278;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qFC1ISKzTT56hm33utME5mbmIaNnqQUMoJvtsmsg8sg=;
 b=ZS42GC0QlHTDbyCftBjmrscpmWSEqfkqN/GU6n6AowZK9CdGx7KLSCKTna0go2iLvL
 T2DeJgcVjwwsk23F9Um4NZG++c9EW8gyuWaRJW2osmAlPPlcA7DR+xJSh7APzdEO8wx5
 u6mK5FlTVzPZiyWS94yjz7ADO3OCtPasa5PU/Xk1R0Ws4n7Fk7jHqMSo0IzUdLaSSyDk
 4ygaI4WfIRHCBS1QidgAnPPnZQSnZoBUGAHv8qCrpvErEpq4cwuhl0orgbbKsXd4Jw8b
 7Wz345zxsVbkerMKY/t0+a5d4KKTIblDHMwf0vJ8u/5VF3P2WV0FJm8iWlLyP0OvW09f
 mpsQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Ropd/XKio6js60/ZCe5LILviR2ZawbgRT6GnnaVebYyrcHLjFdl9o/dBZwtBgAggOQRtahCJ2Ns1fEm@nongnu.org
X-Gm-Message-State: AOJu0Yy90iOsR2X16erwG+7kkxRAtl4LFreRpwhwy6mknvNEAeAQHljr
 cPAdjQw76TYBo2EqMFzUxsq97OKewlflddEyd2519X8VSyRjSzoidw/qIvnoAetk1g95i53UmyB
 ODmeLdYneOu1VifxJFj+QQtEYdLabHaU=
X-Gm-Gg: AfdE7cm37YefqxgQfb6DLH294My+gUp8wztpUx0VV9+m2E3CTckCqlXtFLvwPmlFNyA
 XqkMQgRF+2OdP4D6EcfU4K2Yq8zrYKP6RyOKMtMIKH6LpZnZsSqqHR93Z6oEsOFVoR7FXrvffh2
 cfCXawHjRRxXnbmZkidsNKwXYkzb0brhwH9/5WivEj5IYyLqJ8+agcOPepF7D35rvmmbEjC0map
 mEM8LmSklVVlRsMbQjoebiNX9US1EMRnPQbXWu0Wy8RPRnyqExFv6oByJD15Rc2B/I/HBQl9M7K
 cjLlUXAqOcAVY7XdgvT7dafE5Mc=
X-Received: by 2002:a05:6402:3591:b0:698:4831:f9aa with SMTP id
 4fb4d7f45d1cf-6984831fc61mr2083584a12.12.1782692477779; Sun, 28 Jun 2026
 17:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260626170533.3562484-1-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260626170533.3562484-1-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Jun 2026 10:20:51 +1000
X-Gm-Features: AVVi8Cf8T5RundNRfe2uvFPbYxXYQwT1N_H_tg_bWj8ALzpV1dBf2ae1uBkodK8
Message-ID: <CAKmqyKMjCHpPgOTBekGmk3axY2ROVX6K5oam6b4EG3zvdVJjdw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/riscv-iommu: set cmd_ill IOFENCE.C rsvp bits are
 set
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 andrew.jones@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x535.google.com
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

On Sat, Jun 27, 2026 at 3:06=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> We're not setting RISCV_IOMMU_CQCSR_CMD_ILL if a reserved bit happens to
> be set in an IOFENCE.C command.
>
> Fixes: 0c54acb8243d ("hw/riscv: add RISC-V IOMMU base emulation")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3575
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/riscv-iommu-bits.h | 1 +
>  hw/riscv/riscv-iommu.c      | 4 ++++
>  2 files changed, 5 insertions(+)
>
> diff --git a/hw/riscv/riscv-iommu-bits.h b/hw/riscv/riscv-iommu-bits.h
> index a938fd3eb4..60256ad9b8 100644
> --- a/hw/riscv/riscv-iommu-bits.h
> +++ b/hw/riscv/riscv-iommu-bits.h
> @@ -344,6 +344,7 @@ struct riscv_iommu_command {
>  #define RISCV_IOMMU_CMD_IOFENCE_OPCODE          2
>  #define RISCV_IOMMU_CMD_IOFENCE_FUNC_C          0
>  #define RISCV_IOMMU_CMD_IOFENCE_AV      BIT_ULL(10)
> +#define RISCV_IOMMU_CMD_IOFENCE_RESERVED GENMASK_ULL(31, 14)
>  #define RISCV_IOMMU_CMD_IOFENCE_DATA    GENMASK_ULL(63, 32)
>
>  #define RISCV_IOMMU_CMD_IODIR_OPCODE            3
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index c9687e01a8..d47abf9eb3 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -1876,6 +1876,10 @@ static void riscv_iommu_process_cq_tail(RISCVIOMMU=
State *s)
>          switch (cmd_opcode) {
>          case RISCV_IOMMU_CMD(RISCV_IOMMU_CMD_IOFENCE_FUNC_C,
>                               RISCV_IOMMU_CMD_IOFENCE_OPCODE):
> +            if (cmd.dword0 & RISCV_IOMMU_CMD_IOFENCE_RESERVED) {
> +                goto cmd_ill;
> +            }
> +
>              res =3D riscv_iommu_iofence(s,
>                  cmd.dword0 & RISCV_IOMMU_CMD_IOFENCE_AV, cmd.dword1 << 2=
,
>                  get_field(cmd.dword0, RISCV_IOMMU_CMD_IOFENCE_DATA));
> --
> 2.43.0
>
>

