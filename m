Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3BACCA470
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 01:33:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v48BG-00052I-Un; Wed, 01 Oct 2025 21:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v48BC-00050a-I4
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 21:32:23 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v48Az-0003fC-NP
 for qemu-riscv@nongnu.org; Wed, 01 Oct 2025 21:32:21 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6364eb32535so919697a12.1
 for <qemu-riscv@nongnu.org>; Wed, 01 Oct 2025 18:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759368719; x=1759973519; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sKMEKrqO1YJj+shF70GCJJYLhU8aHK7WLJNQcLbKw4s=;
 b=lUsl9BXoxWeQzX/91QiAdmEYX2IVB/NgzQoxzX7VRCdB5kzLmRDyfWnNyPZJ4U7Dzw
 VLQhDDOaz3yoD4tIkQRWrBBVRxSCSz1bbxd9HLaoUz+M0zseD7uakKdr8ahDY24ynTzD
 5dMg07fpKjmYwztWFUDQTy41cRvPJos2Bvvb10zBkNzC5XwAwa7dAWZHH609B/V850L2
 jleLWQGhxG/MR2FerFdKOqDA0NEzOfPUBwlqUG1usMyIn1OkZXBJzQeJtYudz1MjYQpN
 N7X8Cx1ZrLfGJ0SbR/sEqrTKyZWJboxlnq/LNlvf25OZSPZRegUJRroq+0RV+1y5HXt0
 PrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759368719; x=1759973519;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sKMEKrqO1YJj+shF70GCJJYLhU8aHK7WLJNQcLbKw4s=;
 b=lJnSIXnp5YM+WgnLedTe/O6ftubxheq473gdZSEhTSjhgSiyThzp3JiFzCzjMvinlZ
 8MauLaXgFs33xHcE9u8qtsokSCBWgtWgSmIcLyK84WIw4KTJEXG+Y+Wl2JLc0aerZ/n8
 tyCPxksK9jXMjsGMKUslmRf59I5Qehzi7GdK6v6wod8adoSU5VZJebBfftDSQxsRF5W7
 /WgO4CmE+pZZ/4XvtHcnA9RkA8GECIyi8JSGP/+ndctYU1omarJAnGYHPu3f3oWr7QEQ
 OydAb1suTx6iQXQjZrMtIepav7p6V07prXEuy3o/t86gAdywuypZHzj+UbsBxtGHO3fw
 2aZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqrWp7KJf2ZqYuSi7/EN5N1Qvf+dzVS6efm6JJYEdRc7B/qfkB+wjdpNddfw+guUKuFepjeH2os7O1@nongnu.org
X-Gm-Message-State: AOJu0YxxGbyZAGETiPYbZYUNd2CfWsAyATt6v5xkDqw+Qg3HyJHkInsC
 97cKDo7w7/cWVwvitzwltMCauGbR6eBm/jKMI8npjT9jbwcs8OvwUUBvfWfRintJStyjP0d3k/i
 SevqkDLMcg2mm6v7AktHBtWTjpiuGdQQ=
X-Gm-Gg: ASbGncsCvAIuwDBGB2g0n47SUPnkzq8+XZ4g3/kE8jdkTkS9TqiZokIOURrnopAaexr
 Z6TAi/muc4xDvZuHwiD0W4Pf4BPwkaLkEnsr2Drc0EKYztIk1eCYWUQTKe8VbzKt3ZswXZenxJH
 77vRGvlBdJcMdJUSvQlOYlCj2x7G5g/0f/B4i7qDEkAiYeS14Y8cOBaYF4LCIqYWQcX3zHOnQKS
 gi9vKfLZl1F2wYMnkdJSgMJPea3Rq6xvcxMlqhfLghJpc5gbKYmRh51pFBx3g==
X-Google-Smtp-Source: AGHT+IHM5hqUkWweqPMLG/HbsvcPKqZEhyH67XjCRKTWCqL+c59jAP0aWDHuuohTdFBlmHbjPZw27DsWLh69WNJI52c=
X-Received: by 2002:a17:907:2d8d:b0:b3e:aef0:8e36 with SMTP id
 a640c23a62f3a-b46e700b982mr682768766b.51.1759368719030; Wed, 01 Oct 2025
 18:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <20251001094859.2030290-1-djordje.todorovic@htecgroup.com>
 <20251001094859.2030290-7-djordje.todorovic@htecgroup.com>
In-Reply-To: <20251001094859.2030290-7-djordje.todorovic@htecgroup.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Oct 2025 11:31:32 +1000
X-Gm-Features: AS18NWCCzMM65wE8Xvk_9Z1LDwxxmM4mpHou2jAP3B0Yie--o5JUBVEl21yhk2o
Message-ID: <CAKmqyKMJ6ufgSgmbcreVTw-O9v+P08MjiGFuFOtnS06jAsboSg@mail.gmail.com>
Subject: Re: [PATCH v9 06/13] target/riscv: Add mips.pref instruction
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
 "cfu@mips.com" <cfu@mips.com>, "mst@redhat.com" <mst@redhat.com>, 
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>, 
 "dbarboza@ventanamicro.com" <dbarboza@ventanamicro.com>,
 "philmd@linaro.org" <philmd@linaro.org>
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
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Wed, Oct 1, 2025 at 7:49=E2=80=AFPM Djordje Todorovic
<Djordje.Todorovic@htecgroup.com> wrote:
>
> Add MIPS P8700 prefetch instruction defined by Xmipscbop.
>
> Signed-off-by: Chao-ying Fu <cfu@mips.com>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c                        |  3 +++
>  target/riscv/cpu_cfg.h                    |  2 +-
>  target/riscv/cpu_cfg_fields.h.inc         |  1 +
>  target/riscv/insn_trans/trans_xmips.c.inc | 15 +++++++++++++++
>  target/riscv/xmips.decode                 |  1 +
>  5 files changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 77fbf67776..87f9eb7ac4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -247,6 +247,7 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(svrsw60t59b, PRIV_VERSION_1_13_0, ext_svrsw60t59b=
),
>      ISA_EXT_DATA_ENTRY(svukte, PRIV_VERSION_1_13_0, ext_svukte),
>      ISA_EXT_DATA_ENTRY(svvptc, PRIV_VERSION_1_13_0, ext_svvptc),
> +    ISA_EXT_DATA_ENTRY(xmipscbop, PRIV_VERSION_1_12_0, ext_xmipscbop),
>      ISA_EXT_DATA_ENTRY(xmipscmov, PRIV_VERSION_1_12_0, ext_xmipscmov),
>      ISA_EXT_DATA_ENTRY(xtheadba, PRIV_VERSION_1_11_0, ext_xtheadba),
>      ISA_EXT_DATA_ENTRY(xtheadbb, PRIV_VERSION_1_11_0, ext_xtheadbb),
> @@ -1380,6 +1381,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[=
] =3D {
>      MULTI_EXT_CFG_BOOL("xtheadmempair", ext_xtheadmempair, false),
>      MULTI_EXT_CFG_BOOL("xtheadsync", ext_xtheadsync, false),
>      MULTI_EXT_CFG_BOOL("xventanacondops", ext_XVentanaCondOps, false),
> +    MULTI_EXT_CFG_BOOL("xmipscbop", ext_xmipscbop, false),
>      MULTI_EXT_CFG_BOOL("xmipscmov", ext_xmipscmov, false),
>
>      { },
> @@ -3295,6 +3297,7 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
>          .cfg.pmp =3D true,
>          .cfg.ext_zba =3D true,
>          .cfg.ext_zbb =3D true,
> +        .cfg.ext_xmipscbop =3D true,
>          .cfg.ext_xmipscmov =3D true,
>          .cfg.marchid =3D 0x8000000000000201,
>          .cfg.mvendorid =3D MIPS_VENDOR_ID,
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 2db471ad17..e4d5039c49 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -38,7 +38,7 @@ static inline bool always_true_p(const RISCVCPUConfig *=
cfg __attribute__((__unus
>
>  static inline bool has_xmips_p(const RISCVCPUConfig *cfg)
>  {
> -    return cfg->ext_xmipscmov;
> +    return cfg->ext_xmipscbop || cfg->ext_xmipscmov;
>  }
>
>  static inline bool has_xthead_p(const RISCVCPUConfig *cfg)
> diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fie=
lds.h.inc
> index a290303ee7..dd3ee7ba2b 100644
> --- a/target/riscv/cpu_cfg_fields.h.inc
> +++ b/target/riscv/cpu_cfg_fields.h.inc
> @@ -147,6 +147,7 @@ BOOL_FIELD(ext_xtheadmemidx)
>  BOOL_FIELD(ext_xtheadmempair)
>  BOOL_FIELD(ext_xtheadsync)
>  BOOL_FIELD(ext_XVentanaCondOps)
> +BOOL_FIELD(ext_xmipscbop)
>  BOOL_FIELD(ext_xmipscmov)
>
>  BOOL_FIELD(mmu)
> diff --git a/target/riscv/insn_trans/trans_xmips.c.inc b/target/riscv/ins=
n_trans/trans_xmips.c.inc
> index 3202fd9cc0..bfe9046153 100644
> --- a/target/riscv/insn_trans/trans_xmips.c.inc
> +++ b/target/riscv/insn_trans/trans_xmips.c.inc
> @@ -9,6 +9,12 @@
>   *            (https://mips.com/products/hardware/p8700/)
>   */
>
> +#define REQUIRE_XMIPSCBOP(ctx) do {              \
> +    if (!ctx->cfg_ptr->ext_xmipscbop) {          \
> +        return false;                            \
> +    }                                            \
> +} while (0)
> +
>  #define REQUIRE_XMIPSCMOV(ctx) do {              \
>      if (!ctx->cfg_ptr->ext_xmipscmov) {          \
>          return false;                            \
> @@ -31,3 +37,12 @@ static bool trans_ccmov(DisasContext *ctx, arg_ccmov *=
a)
>
>      return true;
>  }
> +
> +/* Move data from memory into cache. */
> +static bool trans_pref(DisasContext *ctx, arg_pref *a)
> +{
> +    REQUIRE_XMIPSCBOP(ctx);
> +
> +    /* Nop */
> +    return true;
> +}
> diff --git a/target/riscv/xmips.decode b/target/riscv/xmips.decode
> index fadcb78470..4215813b32 100644
> --- a/target/riscv/xmips.decode
> +++ b/target/riscv/xmips.decode
> @@ -9,3 +9,4 @@
>  #            (https://mips.com/products/hardware/p8700/)
>
>  ccmov          rs3:5 11 rs2:5 rs1:5 011 rd:5 0001011
> +pref        000 imm_9:9 rs1:5 000 imm_hint:5 0001011
> --
> 2.34.1

