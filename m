Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmzQ6-0001t5-LP
	for mharc-qemu-riscv@gnu.org; Thu, 13 Apr 2023 12:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1pmzPz-0001qX-1x
 for qemu-riscv@nongnu.org; Thu, 13 Apr 2023 12:03:28 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1pmzPh-0008TX-9G
 for qemu-riscv@nongnu.org; Thu, 13 Apr 2023 12:03:26 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-94a34a0baf9so356900166b.1
 for <qemu-riscv@nongnu.org>; Thu, 13 Apr 2023 09:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1681401785; x=1683993785;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9jlVDfhHoysTNDNrwCw51YGNtSFoN2LyI2tRzaXDWWY=;
 b=QFJ2sP2Rni5PiJtvOkO3YpXM0a500EQ6cciUtVkiDWaKTJcQDLBwKAoCFw16cGxygq
 a7Zy1hLauj3OpBOs0TvR7LxwufP+DCw998oJ5dR+UgA2khdgXuYEJ+JwcspAhATSKeSV
 8vJEY6xJpS9bH/AOzrujMqEqMahrfYxq6HmClXQXme0h4rLaUpVS2ZfFyyG3OcXb7vFP
 DTCTdkV6vXiQG9ttu2t8TWh0DOQY9rcmbpvgwqqL+AuxXbNPniVL1XGciUzi9OAA9FhN
 nN/RECuecEB471mr74RMdhW5G2vSzrVz6KU2ZYLPHsZhj4xhyk2J+pNWHX0+Bnr5Mf3H
 fBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681401785; x=1683993785;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9jlVDfhHoysTNDNrwCw51YGNtSFoN2LyI2tRzaXDWWY=;
 b=EzFNAeoPve+5F0M3MOHR/hcTT37uKc0AEV2rnIZRBNH4GhtCdELVf700764+2rASdo
 +8bOOv3gvkfa03QrlFqUjLK4c4Ic/Yct4I/g5+2algIXZ025TwbHQAFR+b3YdUshZU2i
 8Py7MyBhny+jVJd80vypg+uQbApIsTs/shKjvbp+z2KAsc9Qnf8DNRL5zyfxDHtvhi2a
 MEcnZiEvQCwDT/AGF01z4UZz7vOql1Oh+d0bW8DxuwlmVgCgyWMR6uRBpeyG5AEfR7kT
 0gdZBstiHfz6jSEFkQ8/vLuBRtsldNJeKkfjAsiNIUiSr+93bl/X6crHi9TlQBZFPBOV
 kabg==
X-Gm-Message-State: AAQBX9d+qHC5h2Mr9XYX2by8gu4wSAYlJRTGGyyCp1hNkFZlN42RF4xy
 XxBX0433EzZvJiN5z/cHCQQfxKsDw7NxXWGqbYrO4g==
X-Google-Smtp-Source: AKy350b/VbzvQAK0KvIKXae+1yleidrMBjVo9A64yzXV51lFtnq17uyloGvrVTyoGt4lnDAgibzv6vy7nvHzh/zOysM=
X-Received: by 2002:a50:aa9c:0:b0:504:9200:8c88 with SMTP id
 q28-20020a50aa9c000000b0050492008c88mr1551777edc.1.1681401785151; Thu, 13 Apr
 2023 09:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230413133432.53771-1-ivan.klokov@syntacore.com>
In-Reply-To: <20230413133432.53771-1-ivan.klokov@syntacore.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Apr 2023 21:32:54 +0530
Message-ID: <CAAhSdy1hhz9wYX8EwCkN0z2YF0y70q0OfFCE2T+fXUdGGApu9w@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/riscv_aplic: Zero init APLIC internal state
To: Ivan Klokov <ivan.klokov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 anup.patel@wdc.com, palmer@dabbelt.com, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::635;
 envelope-from=anup@brainfault.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 13 Apr 2023 16:03:31 -0000

On Thu, Apr 13, 2023 at 7:04=E2=80=AFPM Ivan Klokov <ivan.klokov@syntacore.=
com> wrote:
>
> Since g_new is used to initialize the RISCVAPLICState->state structure,
> in some case we get behavior that is not as expected. This patch
> changes this to g_new0, which allows to initialize the APLIC in the corre=
ct state.
>
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  hw/intc/riscv_aplic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> index cfd007e629..71591d44bf 100644
> --- a/hw/intc/riscv_aplic.c
> +++ b/hw/intc/riscv_aplic.c
> @@ -803,7 +803,7 @@ static void riscv_aplic_realize(DeviceState *dev, Err=
or **errp)
>
>      aplic->bitfield_words =3D (aplic->num_irqs + 31) >> 5;
>      aplic->sourcecfg =3D g_new0(uint32_t, aplic->num_irqs);
> -    aplic->state =3D g_new(uint32_t, aplic->num_irqs);
> +    aplic->state =3D g_new0(uint32_t, aplic->num_irqs);
>      aplic->target =3D g_new0(uint32_t, aplic->num_irqs);
>      if (!aplic->msimode) {
>          for (i =3D 0; i < aplic->num_irqs; i++) {
> --
> 2.34.1
>

