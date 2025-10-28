Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDF1CCF9E0
	for <qemu-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 09:10:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vDfiN-0002qi-7P; Tue, 28 Oct 2025 05:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1vDfiH-0002qT-KL
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 05:09:57 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1vDfi9-0000pa-L3
 for qemu-riscv@nongnu.org; Tue, 28 Oct 2025 05:09:57 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6399328ff1fso9700954a12.0
 for <qemu-riscv@nongnu.org>; Tue, 28 Oct 2025 02:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1761642585; x=1762247385; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6+ioTo/kftZYIHGeZIzymdf7bNMKH6pnXAtV38BIoRc=;
 b=ZhrHV+tBQ97axHxwQlEI/hggdZdYNqoawPBdQ+MffF7q6Bvh6xRkPc/prszDUhuXIb
 1RYE6Aye7O/y4XnwVCZGyv5F0R+TF8B/r9sZ80LCCva9qTbgJf+PjvnjzpbWe1jiJ0yX
 Ur8aiw41Ers32OJZvjNbumcYwm1kSTN+yMUMJg5rK/i4RzlMF6XRBAKX1FGrWJ8B4GOH
 lI4xVwrxS5ueAcGj9AJbMxV8iPdkCS1JAuFpGiL1bgPDVThsZJxAsAoCuAcQHoAJgQNk
 Yb3CdH15WR7AEfhjnbT91nrwRl1fElKWh5ItK84uKD+wb+uzBYCub4vW0NbFwoFg9qSn
 LcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761642585; x=1762247385;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6+ioTo/kftZYIHGeZIzymdf7bNMKH6pnXAtV38BIoRc=;
 b=s1A5gaNJvxfP9X067P2zOTdOc2dIM4OGybxNRZOyeIY+K/zY55j70LLX4inshrifXS
 WBMaO00ocUG+Vjkqm+n+O2DugD/MIBtGwCnDRGp0+rUQmpRkGKUmeOQbdy50HuTIoD01
 0qZCCLnRk/AYJEFLNY6+qETyozq74mwrWhZBXqQBG793i+XSRvQPnmHLy/0lGml9yx4R
 n13ZItluMCZPPy9RWgxXAtJtxe3mQ5+cSDMY2Zt3QbkiXlnoByiQachh+e4QxttZXV5v
 8EvTISN6luO7SptE5RLRpqLJe1Z4IAxBAFo/MjaKi1iASz3tcbVXL3j/EvL13xzZvTK6
 FIvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCULWtnOZhoMnaIJLWCecG2TbYZqGqG4Y+O0DySbK4DBhKyCflbmRPW9TeqziEjJjZKIZ8iN0u9qINuq@nongnu.org
X-Gm-Message-State: AOJu0YzNiAp1eplXnhEQuRo1si5yOdBDxCSS/YxBJ4DIf5YRaK44i30+
 MUTY3Js4DE0IdfsqIkXI47lYnSbyuipor74p2regK2OUoMhvYBLlNWVHRDZy7C6zN/pLscAEKrw
 CSEwlIOlj8V1ZdmhNGgne0ujRRUQ4GfKin7FcMjApww==
X-Gm-Gg: ASbGnctde/FlcU5LEV4WvK/9XMqXCU+/KhDZj7Yw8cUdjKcFXXfY2Fy47gfATVB7I23
 ziXNOqHdRBgoGKIML3cJJA+LQdCxfueNGDEW+sl6YoozcShh0CZwEmj0zepvnG/svrzxJAOUPBH
 tV3E0dkhj10UpYhhxvz05DlAuh1vIja5Dl/sdI7tujjlIciFW0gP7ieerm/+w4Yyk4+FipBTdYf
 reUXQWIjTkEJfgwHTaanGPKr5qJqIZEQ1O93IKRzAbpWfH50ONC6CdWydq6EOA=
X-Google-Smtp-Source: AGHT+IF/EHt6NK2xPRT3uKc8+ON41QLe6lZuxFUUwKT/ZCrzOpZc16h2mXjv9Z+tImIenwNRfihkp87E5QKixBwu4IM=
X-Received: by 2002:a05:6402:5193:b0:63c:4537:75a7 with SMTP id
 4fb4d7f45d1cf-63ed8260199mr2324290a12.28.1761642585082; Tue, 28 Oct 2025
 02:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251028085032.2053569-1-frank.chang@sifive.com>
In-Reply-To: <20251028085032.2053569-1-frank.chang@sifive.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Tue, 28 Oct 2025 17:09:34 +0800
X-Gm-Features: AWmQ_blFUtxeAx73CGEjglFh7vGE9P3eAO-2_7oSUhBtC7X2W1TfCixD1EwriGk
Message-ID: <CALw707qcytHujijUg=QmK7Tf3L26_0gzjs-uyGc_-_G6CSHUYw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: riscv-iommu: Don't look up DDT cache in Off and
 Bare modes
To: frank.chang@sifive.com
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=jim.shu@sifive.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Reviewed-by: Jim Shu <jim.shu@sifive.com>

- Jim



On Tue, Oct 28, 2025 at 4:51=E2=80=AFPM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> According to the RISC-V IOMMU specification:
>
> * When ddtp.iommu_mode is set to Off, there is no DDT look-up, and an "Al=
l
>   inbound transactions disallowed" fault (cause =3D 256) is reported for =
any
>   inbound transaction.
>
> * When ddtp.iommu_mode is set to Bare, there is no DDT look-up, and the
>   translated address is the same as the IOVA, unless the transaction type
>   is disallowed (cause =3D 260).
>
> In the current implementation, the DDT cache is incorrectly looked up
> even when ddtp.iommu_mode is set to Off or Bare. This may result in
> unintended cache hits.
>
> Therefore, the DDT cache must not be looked up when ddtp.iommu_mode is
> set to Off or Bare. For other modes, software is required to issue cache
> invalidation commands before any inbound transactions.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  hw/riscv/riscv-iommu.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index b33c7fe3259..95db811f125 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -1290,13 +1290,18 @@ static RISCVIOMMUContext *riscv_iommu_ctx(RISCVIO=
MMUState *s,
>          .devid =3D devid,
>          .process_id =3D process_id,
>      };
> +    unsigned mode =3D get_field(s->ddtp, RISCV_IOMMU_DDTP_MODE);
>
>      ctx_cache =3D g_hash_table_ref(s->ctx_cache);
> -    ctx =3D g_hash_table_lookup(ctx_cache, &key);
>
> -    if (ctx && (ctx->tc & RISCV_IOMMU_DC_TC_V)) {
> -        *ref =3D ctx_cache;
> -        return ctx;
> +    if (mode !=3D RISCV_IOMMU_DDTP_MODE_OFF &&
> +        mode !=3D RISCV_IOMMU_DDTP_MODE_BARE) {
> +        ctx =3D g_hash_table_lookup(ctx_cache, &key);
> +
> +        if (ctx && (ctx->tc & RISCV_IOMMU_DC_TC_V)) {
> +            *ref =3D ctx_cache;
> +            return ctx;
> +        }
>      }
>
>      ctx =3D g_new0(RISCVIOMMUContext, 1);
> --
> 2.43.0
>
>

