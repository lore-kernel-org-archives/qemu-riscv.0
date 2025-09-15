Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083B9CA101F
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 03:28:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uxzt9-0001Aw-Sy; Sun, 14 Sep 2025 23:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uxzt6-0001AO-Ft
 for qemu-riscv@nongnu.org; Sun, 14 Sep 2025 23:28:20 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1uxzsy-0007Ge-QX
 for qemu-riscv@nongnu.org; Sun, 14 Sep 2025 23:28:20 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b079c13240eso588803366b.1
 for <qemu-riscv@nongnu.org>; Sun, 14 Sep 2025 20:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757906886; x=1758511686; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AoA/jqUKIY0v6dxNbyWGOocOt8tElA1wb0Q++UnjMe8=;
 b=eDJNhy+/MdTSnP6IqHbk/T5sabEPNu4xnvi5TUanHPXWyhoNh00bvUk8xWS/uGhzfi
 CEjK6bnNze6wI3n2mhUmZR6Gy+PPZtmLuyhF1WmuRsfD8PquLkJsk/aPdpjPeaqC932q
 2bO90DVK9JiAv9nttL6qWj7rsNPlfTp9ru0yhsRJIYxfOVuqJlTlB+uhJ7p8Bev5VhQZ
 y0qHXIK+gdwh1VC9xyzzOSm3iudCjR/UT4wkcPaKx00Ul+Dr2Kj+Dx2eKe6ei0cCl3q0
 h0J3lKxteu1Qkaut+jx9J+7VJ4glWRQZqMc2Fd1W9Qrs1p7rzoNqTv5PPlwWQexXOJYB
 xsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757906886; x=1758511686;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AoA/jqUKIY0v6dxNbyWGOocOt8tElA1wb0Q++UnjMe8=;
 b=Dd6bo+TY8v+5AXW9X/xNeaJlNMS0OyIq2KUt+MNO4f68MtmWmZSoXquR7mu0WmO7UU
 /x9RJwIqIfHTVmzULybzweIi3vRDgnDqx+XyxdDMTrGEu0/nUrZkq1H/P/tMucRmdKVg
 yA9yrPDQ0JU1egsUlNXM+IzXqn6bG3JiI3PxLGwFXAWaLDCLGJ0d0Gfdx81BLo6Fx2PJ
 S46FNEz84mf0NQVYwI6Vd0M0WrsAhsPwWhyK64cKX+T55S51H2vbP+ieykORwepDLrx9
 /2hM2Vp3UYOngmmdUVsxunKW/E8BhGYSlbyFuImczJRrbmCQ6WfY+xUzqlYZQ01mBLYX
 cwNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCfWtWj2pJ5ws+uot1r3Yvfybw/TXqR648t9tn5VkOx7vN8tCmZ81/BHXe1dXgU3AyTjAfXdFNZBM8@nongnu.org
X-Gm-Message-State: AOJu0Yz1ZFf/XYhferz1DuJuuNjwKI/JZFhgg0hXvsWNDIHzycRjv3Ey
 P25OgvZg1x7xutOH6Uw+7AXXwqaYl21RQyl2zk2YSlAFhC8hzDSwnMtXh9+K8DJD9OPnv1/EfpG
 1IPTL3C/PpRepp1xmx9yG3Z4wZYV+U4E=
X-Gm-Gg: ASbGnctvvTsCJ68FuEoldOo9UMfFxWR/FqMUP6zKvvmo35ZkJE1B8zaY9V57YA6uwek
 kUaDDz6JLTQJv1BQzLHTCQXQWuGG+ylD0aC0qyu5tJD/Z2txbKX8CLSGc9rxv0mp3xNd3Qx4kmq
 C6do2iAU2swSMtZMBnUf7inooXF4do3WqoR4w60YvxtJgwpRvyi9dB+M/WmTvx+pUmkVpjvIEhL
 yIlyuWwQ/ET9b8xFL5d+jo4B8GVZjZ9nAR6Lw==
X-Google-Smtp-Source: AGHT+IE6syJhHOmX/rZPDFWS0oUKiq+DJVsDRq4rijkXJvHZUla7t7I5VrgQ99zeDUtExKtKqsTTinX6Yet8oOgGC+0=
X-Received: by 2002:a17:907:9710:b0:b0c:6cae:51f5 with SMTP id
 a640c23a62f3a-b0c6cae68b5mr560805966b.43.1757906885662; Sun, 14 Sep 2025
 20:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250723094213.2975268-1-dbarboza@ventanamicro.com>
 <20250723094213.2975268-2-dbarboza@ventanamicro.com>
In-Reply-To: <20250723094213.2975268-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Sep 2025 13:27:39 +1000
X-Gm-Features: Ac12FXwOg9Tu0NhrKXwqZSOwfzdumhheic31N4SS9IPCYyiPsC3Uj3etjjqXF0M
Message-ID: <CAKmqyKPirO4wLus3kWeHk_ir6kOTru6U745AVUW1jNzYXbzr2Q@mail.gmail.com>
Subject: Re: [PATCH for-10.1 1/1] roms/opensbi: Update to v1.7
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com
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
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Wed, Jul 23, 2025 at 7:43=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Update OpenSBI and the pre-built opensbi32 and opensbi64 images to
> version 1.7.
>
> It has been almost an year since we last updated OpenSBI (at the time,
> up to v1.5.1) and we're missing a lot of good stuff from both v1.6 and
> v1.7, including SBI 3.0 and RPMI 1.0.
>
> The changelog is too large and tedious to post in the commit msg so I
> encourage referring to [1] and [2] to see the new features we're adding
> into the QEMU roms.
>
> [1] https://github.com/riscv-software-src/opensbi/releases/tag/v1.6
> [2] https://github.com/riscv-software-src/opensbi/releases/tag/v1.7
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  .../opensbi-riscv32-generic-fw_dynamic.bin    | Bin 268312 -> 268752 byt=
es
>  .../opensbi-riscv64-generic-fw_dynamic.bin    | Bin 272504 -> 273048 byt=
es
>  roms/opensbi                                  |   2 +-
>  3 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin b/pc-bios/ope=
nsbi-riscv32-generic-fw_dynamic.bin
> index b2e740010b..02be3a72a8 100644
> Binary files a/pc-bios/opensbi-riscv32-generic-fw_dynamic.bin and b/pc-bi=
os/opensbi-riscv32-generic-fw_dynamic.bin differ
> diff --git a/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin b/pc-bios/ope=
nsbi-riscv64-generic-fw_dynamic.bin
> index 018b4731a7..cce35c65c2 100644
> Binary files a/pc-bios/opensbi-riscv64-generic-fw_dynamic.bin and b/pc-bi=
os/opensbi-riscv64-generic-fw_dynamic.bin differ
> diff --git a/roms/opensbi b/roms/opensbi
> index 43cace6c36..a32a910691 160000
> --- a/roms/opensbi
> +++ b/roms/opensbi
> @@ -1 +1 @@
> -Subproject commit 43cace6c3671e5172d0df0a8963e552bb04b7b20
> +Subproject commit a32a91069119e7a5aa31e6bc51d5e00860be3d80

https://gitlab.com/qemu-project/opensbi needs to be updated, but I
don't know how to do that...

Alistair

> --
> 2.50.1
>
>

