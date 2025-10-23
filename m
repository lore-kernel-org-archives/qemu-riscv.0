Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD4FCCD1AB
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 00:04:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1vBiox-0006qM-PJ; Wed, 22 Oct 2025 20:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vBiow-0006pw-5h
 for qemu-riscv@nongnu.org; Wed, 22 Oct 2025 20:04:46 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1vBiot-00049X-SZ
 for qemu-riscv@nongnu.org; Wed, 22 Oct 2025 20:04:45 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-63d97bcb898so372102d50.0
 for <qemu-riscv@nongnu.org>; Wed, 22 Oct 2025 17:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761177882; x=1761782682; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v3lR9sMSFDpLohM1NRfUYThbm1KIdahbEV8+1dDKJEk=;
 b=DS8ezjreyMPve+UCBURNGx5woF9hCqhmvqzmJbFAaA9adVgCUv66jDWo+wHNIqEcaA
 cBu98vqvwAVsD1E35eXslRphK7ZQf36V5PpTbVIoTMkl4fuxLNCK4LRKq7+ApKytwmE3
 V8oiIeUNbVfurwgykZYrdFTPrgrCzVoM03ZljOrycUgLKqblbPOO/7aP/lIHFYYBxEvc
 tCT3FirXPCDtnpyMjc7sKJ/sVDAmBB2IgCN2li/ABXsTyaj509cODXnObwbeH08iYwyF
 ssoCTuR9+DZh0atI5+OEfgEDsMtpOOZesVv+BkdWlbgHHgMr5bmPcD116Z5aE6RDLrNX
 9vdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761177882; x=1761782682;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v3lR9sMSFDpLohM1NRfUYThbm1KIdahbEV8+1dDKJEk=;
 b=bBEtx1szfJIDQyR8TJS9S//OPkA8gpvlHU52eWxMqqc1a5hLFoSO7AfYh8JO+iHnz2
 T0ORqfeE3fU2etxiESHafUhXI4HyDHLxSLnubKSXthE6PcmlLx/Gy7vCe5eB1+x+Edii
 RKvTfTe5zT9FN8NqK6MB8TlV4i8y7tNz26m/Ns1D+zL1Xye05mIFcxePVRWgWj9Shi56
 qFCuFre4V5Ro+2RA4WoTnqewEWsIug3OrDec9I5t7dYaahklzrqwwrV/swcdzLs63/T2
 M9yAgrCjrVOGYY/RFwYvJ/3B4MaTItIPRnYxs46fIAcLvfX1Nr5MKtRXHmjMvt7FQiHH
 0/pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuKId5Tom2awcKqOcF5vhxz+4YhHidWgZ/4yqDlfCAPvIDYFFO3pqORYBvCZQmbVuGnlJp9Oghg1wR@nongnu.org
X-Gm-Message-State: AOJu0Yy7yFpCxtaOO0eIqDVCzmyVoc1cK6fd3E3Ub3TF3210M5AZOmnx
 dMjoFWLu5jgKJen/GB1xRWHlqo6+3p3JqA6AlI90zSadB+qv8sip+Gefs77HlhlSm0+lDwCiBOB
 gbnzd7XN7x3nQHWVtp3c2r0arZy6neQLnwavN
X-Gm-Gg: ASbGnctS9pshe68E6tukKWO8c2VRfLhijq1RzmdJEQ7vrQefTZJey/mtJMwiKPR37Ec
 60///yqAwppIqSDnlhJmQ/uPCV34Q9iXA9/w/FQey9QTP7MZFrTjPKD8n3Zm5ClzxK970DSHPeE
 o2ZjwC3dYLuoc6baYe0yCFHCcNVbqWnmFiRqtbJeKHP5EhUdZzgNHilHl8XS5r52gdyUzU6V6Nn
 8Gew8mBOyALuQPd1RiNULFT/0y/AaGnFj4svrqiXaPkld0cCp7pw/CzIRS0H8Jk9PQAtb+7bbKr
 TrHTz/seszgerzLJA59zoqK0dA==
X-Google-Smtp-Source: AGHT+IErUTS/nV1QChoPDp98BeuQyV1QzXOJfS3L0p0tmKpbiurI/cSVCMAuyxGCrSGdC+jpmiIkz2h1E/xD0g/Zyg8=
X-Received: by 2002:a05:690e:84a:b0:63d:24f9:5327 with SMTP id
 956f58d0204a3-63f2f692596mr2274449d50.28.1761177882200; Wed, 22 Oct 2025
 17:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20251021-vlen-v2-1-1fb581d4c6bf@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20251021-vlen-v2-1-1fb581d4c6bf@rsg.ci.i.u-tokyo.ac.jp>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 23 Oct 2025 10:04:14 +1000
X-Gm-Features: AS18NWAQ2H5GQeyhb8oTJx_B0fsPqhEI49OdxgEXzjECtRSk_X2bWBAJHmZoAYo
Message-ID: <CAKmqyKPO2Dj8Fw_xOxpFJYLGZNc2MwpAW7BmDmNJp1BHc-FshQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Fix a uninitialized variable warning
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=alistair23@gmail.com; helo=mail-yx1-xb12d.google.com
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

On Tue, Oct 21, 2025 at 3:09=E2=80=AFPM Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> riscv_cpu_validate_v() left its variable, min_vlen, uninitialized if
> no vector extension is available, causing a compiler warning.
>
> Re-define riscv_cpu_validate_v() as no-op when no vector extension is
> available to prevent the scenario that will read the unintialized
> variable by construction. It also simplifies its caller as a bonus.
>
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> Changes in v2:
> - De-duplicated zve32f checks as suggested by Daniel Henrique Barboza.
> - Link to v1: https://lore.kernel.org/qemu-devel/20251019-vlen-v1-1-f7352=
a402f06@rsg.ci.i.u-tokyo.ac.jp
> ---
>  target/riscv/tcg/tcg-cpu.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 1150bd14697c..d3968251fad5 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -426,6 +426,8 @@ static void riscv_cpu_validate_v(CPURISCVState *env, =
RISCVCPUConfig *cfg,
>          min_vlen =3D 64;
>      } else if (cfg->ext_zve32x) {
>          min_vlen =3D 32;
> +    } else {
> +        return;
>      }
>
>      if (vlen > RV_VLEN_MAX || vlen < min_vlen) {
> @@ -676,12 +678,10 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cp=
u, Error **errp)
>          return;
>      }
>
> -    if (cpu->cfg.ext_zve32x) {
> -        riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
> -        if (local_err !=3D NULL) {
> -            error_propagate(errp, local_err);
> -            return;
> -        }
> +    riscv_cpu_validate_v(env, &cpu->cfg, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
>      }
>
>      /* The Zve64d extension depends on the Zve64f extension */
>
> ---
> base-commit: c85ba2d7a4056595166689890285105579db446a
> change-id: 20251019-vlen-30a57c03bd93
>
> Best regards,
> --
> Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
>
>

