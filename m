Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF17CD98E4
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 03:07:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbUzz-00060Z-0I; Sun, 21 Jun 2026 23:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbUzx-0005zY-AD
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 23:06:57 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wbUzv-00075L-Na
 for qemu-riscv@nongnu.org; Sun, 21 Jun 2026 23:06:56 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-69532288224so7402459a12.0
 for <qemu-riscv@nongnu.org>; Sun, 21 Jun 2026 20:06:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782097614; cv=none;
 d=google.com; s=arc-20240605;
 b=GhXTgnY5fqKEImNWg7Y4j1PLFidxgtDqxUYy+titNLJDx3JqHyI/Ao0y9Ea5bYx1h1
 E5mudGzKWjzv3zV9aGzxZ02akbJMTV7ZV6c41XLkmbqvbL1rFCcz4p5i+g9mblKDg5YG
 OxvA3ywTp+L+YTQNxfOSBdQzVUGFqez+KSnTRjgD0a+zR2iYeR7fGiv45tXXDnIWQy17
 UeATfjMyGlqcPVlD4oyu9zwWAvs1tc9uzvvKbCBv1Tu+JHd+UAm7wDT16u14pWndvq1r
 X0OlTEB7P+bUq0SxKoI+DA2lA/n4mnSIZR0MR7KX5+0OrAX1prYrheBBc2/ttVtBuNSi
 ahtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=9lBpFvQgke2vv5Ml8b+qHrO31bIE4gs/UA33vAzhX5c=;
 fh=EH6D2KBL32dBzSmVogs94lVaov+0/3k4CWhU5D+23cY=;
 b=ltY7ZhM+Yf6hPyNh/Arz/a8LZOGBkqyrG0LE1zR6QgG5buQwZwALdsev1H0OXVd5CO
 GJb2lXOzM9Q9u4RSnLjEjdTb3O2WP7c1dOaaiC3pojGg3uCu/hx2OOAo2pKh61XxR/0h
 phx5iiIf8LtJ3HVpaxzzE+VAy4TD2nZYtJOtCJyoNrb8tjP7Ln0kD9lJXzlTWStT6ezV
 XYXBvApP/vL465OcprV4rWBaV3g7hbH1kXMEdZ4FXMqQIISXj6Cx+DDM39fPY9tAUUwp
 Ah0Bh/BVjZ7rTyskn/9nDS+kn6SZVO1Ju0UnET143PomrPNSVzeSaSEV9ZNXgQNdmENU
 wyvQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782097614; x=1782702414; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9lBpFvQgke2vv5Ml8b+qHrO31bIE4gs/UA33vAzhX5c=;
 b=UvRib+XvpH8YMTDRnnZInZu1GmB+4k5zCMidAk5BwMhpaXC+9dnII/khZMG3ZZPmvr
 PPsKA2Ui0HQw2mu7AOKL47dp34/Y1rNmWTRTql6IPFYp45H8UVfExV1L419WZx52kE+3
 RDmxfJzLp2eFd7lXACoFH8lX0rR/WwIHomBYasGpKRkk8M7OICRvQSL4UqxI4AYysfgJ
 MSEaOOg+npmkHdfR9lHrM2ZV4IoYlNj49b51GH0Wsg3VGf/ATwsJbn09bu2RKcC5fd/9
 a9x+K9TBTLhBCJLsHuZNSzheINQZDbmRqzwEpV6NtNazrgKpHG+q8uebnIVcTFxls8VF
 l3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782097614; x=1782702414;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9lBpFvQgke2vv5Ml8b+qHrO31bIE4gs/UA33vAzhX5c=;
 b=boCkRTP2ldiY/Bbp4L/mGAmt07zvvJ2Ra6E8ggXQBbj6uqRmRye06RowLN05Taoxbb
 dpUbkRtoxOytOMrNvRq8xZc/BmM4s0Gl+jn5E8mE7/00JEX8YZk2epLSV804PPmWdeyH
 JVwCwb+/HcIoHUJ8OwIMXPytrLYlwxEwLuQ8nszK8WFMcCNleDP+ryKFeSgPmXaDrBcI
 U0polfAmlHpAgcSHXhlcF1EOlyWuH1XHx/ciZ2y1PZg0IkNG/lP8QiTPi/pPFyzxCrfu
 4MNF8lDcu9K01q+7z2nZw6hr1X1qPth6AIvKN2lgRUOwkGYzpPlkaexILy3cGPSjIggf
 iDpg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8dZv0lHjucFJoLxKOlWodYRETnhRuJSBiyWhpl7hEGPzFtQVgH6LpuUWX7/o9BNyYIjNQMfVD10ZIH@nongnu.org
X-Gm-Message-State: AOJu0YzfJxR8kBss6WGhgY3Qg7eG8QeLn0AHbpToCTbuBPzEK2GdbKru
 69YBVt2ZDvlYezD4VwFWMWKzSvVCqRB9ypYxGUqJnUXj7QDRtuBYBDr6GSlnFFp+apsYMX8wkKW
 5PrKhS9AH4H6Mut4Ezb63vJpV3S7zHZo=
X-Gm-Gg: AfdE7ckFgQienaDz4Ud3x8eN9iz2i+1U7kRqoGRfDZr2oXpW2G97A2OQ6xG0/QV86qz
 FD2MWYO3beh8FeL0LsBiHNvJJichnCWYWbb/YSIyMl1Sofl0t6MlXGwEH5Saohj42nsMLpRf0cW
 1Boyj8Dxqdz5xFCbdTlOMZknrVGSVp8kwfNgCk4QSpUwVYIr4u+KxmKgf8HOWkELvtGQVG+SCs/
 sP2N3H3vpwdPA2hjz+ri2lwDFB+P2WbNrA3ISa5Gvh7OSBUslrwvLjJXOXUtiGd9ogMvh9kj+KM
 J45EBIsf0taLLlMhVjFkO3LTr6E=
X-Received: by 2002:a05:6402:a295:10b0:697:6415:1186 with SMTP id
 4fb4d7f45d1cf-697641513cfmr3035622a12.26.1782097613573; Sun, 21 Jun 2026
 20:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260604120017.398890-1-qingwei.hu@bytedance.com>
In-Reply-To: <20260604120017.398890-1-qingwei.hu@bytedance.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jun 2026 13:06:26 +1000
X-Gm-Features: AVVi8CdBPOQoFr1d7XH5ICUzI2Z-aKswEjlDkpU5HQho1LJgM9hOzLdk6MdWgLU
Message-ID: <CAKmqyKNpHNmrPOJqS_1Mzaf=evvxvuO_kosFHnLN6=bP55ZFyw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/virt-acpi-build: Fix RINTC PLIC context ID for
 KVM
To: Qingwei Hu <qingwei.hu@bytedance.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, sunilvl@ventanamicro.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu.zevorn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x536.google.com
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

On Thu, Jun 4, 2026 at 10:44=E2=80=AFPM Qingwei Hu <qingwei.hu@bytedance.co=
m> wrote:
>
> Each RISC-V MADT RINTC entry contains an External Interrupt Controller
> ID field. On the virt machine without AIA, this field identifies the
> S-mode PLIC context associated with the hart.
>
> TCG virt has both M-mode and S-mode PLIC contexts, so the S-mode context
> ID is odd and 2 * local_cpu_id + 1 is correct. KVM virt exposes only
> S-mode PLIC contexts, and those contexts are numbered contiguously from
> 0. Reporting the TCG context ID for KVM makes the guest enable a
> different PLIC context from the one used by QEMU.
>
> With ACPI enabled, this can leave PCI INTx interrupts pending in QEMU
> while the guest-programmed PLIC context remains disabled. A virtio-blk
> root disk can then stall during boot because its first interrupt is never
> delivered.
>
> Use local_cpu_id for KVM and keep the existing odd S-mode context ID for
> TCG.
>
> Fixes: d641da6ed43 ("hw/riscv/virt-acpi-build.c: Add PLIC in MADT")
> Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/virt-acpi-build.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 413d47d70e..6b06d9aa87 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -100,6 +100,8 @@ static void riscv_acpi_madt_add_rintc(uint32_t uid,
>          build_append_int_noprefix(entry,
>                                    ACPI_BUILD_INTC_ID(
>                                        arch_ids->cpus[uid].props.node_id,
> +                                      kvm_enabled() ?
> +                                      local_cpu_id :
>                                        2 * local_cpu_id + 1),
>                                    4);
>      } else {
> --
> 2.39.5
>
>

