Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F58EC25B67
	for <qemu-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 00:31:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qv5KJ-0008PN-By; Mon, 23 Oct 2023 20:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1qv5KG-0008NP-AF
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 20:31:17 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1qv5KD-0004r6-8o
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 20:31:14 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-507c5249d55so5613431e87.3
 for <qemu-riscv@nongnu.org>; Mon, 23 Oct 2023 17:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698107472; x=1698712272;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I8cwUldC3bme8dPYdN543sonc9TeDdprmmwyGTlggHM=;
 b=Z3bVGOKM0a3HhiESjT6wD93FdZ1hJy1IghC6U3HacCZM2dYWBPA3ozixCym82U+KBk
 QEbC9LVcxzIz5WpFknmyWeRNrLviSjUdFUlpBVz2FCSExiSAnZYDUvTvGMC+jOzEksbi
 mJ+aGMvie5lBd5iGkuSPbuQH/Aog3eM9qN22qIIY9jICkTnRAXN8y8lBMo3QlnbY2K26
 8gkwCqV8OeaV7axCzQ22K0vVS6U/3emMcVRslEkWdERDL2Y/KCO56s0Wrgukr9U9rKRZ
 E1HpzmBiUCWpnkkIlygbNFtUadQJ+LOM0vRuRIndKmmNB78t58Qtjb8rBSuPL7CUP8d9
 i7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698107472; x=1698712272;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I8cwUldC3bme8dPYdN543sonc9TeDdprmmwyGTlggHM=;
 b=A9y3A7eJGxOPHboQ93LkHZHK01OjYckDpSUq8TEX5VXZLE5Lv03QVnAKa9fcXbPp05
 lnexRTvp1ewr3m1fnnQacbrcowgT1ABANKPn4nxkOogRKQsA9FeL71ZAUQadzdeZKPqY
 nWzFiJVc06WSFTC0fB09Iw1tZF/uvgZxQ0SteqvMtzUYB7JxAvze5AXXIS3jZJ1KBhxM
 OMD/usCJ3bQPlCbxAvteixIjp5lUfsaNxYG+YdQdcHLu/lLGyaQ2KWydlvzv2kkSrSsG
 r358Z2jsUneqKqS2CiHduB+5nRcYcO5aSU4TCMJt3Lqte+/5B7m08oQnIPmlBf4eV7D6
 M24g==
X-Gm-Message-State: AOJu0YwRXY0VWUlN1DSiW+2aO4KQftqXwiT0kX25MMrOZ/Z+xM/kWz9h
 pwSIyQdFPYKZ/1ewmvCBUi9kltFh1S9NzeoKftvkgQ==
X-Google-Smtp-Source: AGHT+IGoW9mFgdV1mv/z5vhzR1yq3EfmNEuHBBOJdHrOqm5BXktDXJfrxx0/G1x/PCDZN4Xb5blRww6fGALx0n+necs=
X-Received: by 2002:ac2:518b:0:b0:503:55c:7999 with SMTP id
 u11-20020ac2518b000000b00503055c7999mr6944563lfi.34.1698107471131; Mon, 23
 Oct 2023 17:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231018154434.17367-1-rbradford@rivosinc.com>
 <20231018154434.17367-7-rbradford@rivosinc.com>
In-Reply-To: <20231018154434.17367-7-rbradford@rivosinc.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 23 Oct 2023 17:31:00 -0700
Message-ID: <CAHBxVyHZhkZy0aGimuMbwM0+igbeQQC+UtvZQhmrPiyDfyM5zQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] target/riscv: Use MAKE_64BIT_MASK instead of
 custom macro
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=atishp@rivosinc.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Wed, Oct 18, 2023 at 8:44=E2=80=AFAM Rob Bradford <rbradford@rivosinc.co=
m> wrote:
>
> A 32-bit mask can be trivially created using the 64-bit macro so make
> use of that instead.
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/pmu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index 5e89354bb9..81b25ec11a 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -25,8 +25,6 @@
>  #include "sysemu/device_tree.h"
>
>  #define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */
> -#define MAKE_32BIT_MASK(shift, length) \
> -        (((uint32_t)(~0UL) >> (32 - (length))) << (shift))
>
>  /*
>   * To keep it simple, any event can be mapped to any programmable counte=
rs in
> @@ -455,7 +453,7 @@ void riscv_pmu_init(RISCVCPU *cpu, Error **errp)
>      if (pmu_num =3D=3D 0) {
>          cpu->cfg.pmu_mask =3D 0;
>      } else if (pmu_num !=3D 16) {
> -        cpu->cfg.pmu_mask =3D MAKE_32BIT_MASK(3, pmu_num);
> +        cpu->cfg.pmu_mask =3D MAKE_64BIT_MASK(3, pmu_num);
>      }
>
>      cpu->pmu_avail_ctrs =3D cpu->cfg.pmu_mask;
> --
> 2.41.0
>


Reviewed-by: Atish Patra <atishp@rivosinc.com>

