Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poEbn-0002Zp-KA
	for mharc-qemu-riscv@gnu.org; Sun, 16 Apr 2023 22:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poEbm-0002ZV-3V; Sun, 16 Apr 2023 22:28:46 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poEbh-0006y1-A4; Sun, 16 Apr 2023 22:28:45 -0400
Received: by mail-vs1-xe35.google.com with SMTP id v10so21839862vsf.6;
 Sun, 16 Apr 2023 19:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681698520; x=1684290520;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O1pJGQ02wK/fn9Sf5fpdcZhYocjWN03jsL4FK8a+g4Q=;
 b=gEoOpCAu3ND9fCh5Y1UJ87boMFp+sgxl6uEeFiXtNi1rXyf2Dw3+6sVseue5MyRz7M
 WqEqSrMm+VLLgmHJLaljcLaY4BxX4jB0Dm+13VSaWQbO9agBASUDOOqx5uAjM+amQS1n
 jaT2uWpFR8gdeKAoSGbHpaRpK+nK6KtyPbF7FZFqC3fT15m9IUWs5ngcj07b7ufRpAYN
 aKGCHW66BQ8X15Xuf8Mwup/a6IGpskQkmrq6rD3krElaUHXqh1SnpvgFWP7Sr/mfxtYU
 HRafbn4e7vgykBzi6/w4lnkmzy6zquvWPRaTfxqJLJ7IO/TgGfa5q/aNFZ4NEXI/IHCM
 JgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681698520; x=1684290520;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O1pJGQ02wK/fn9Sf5fpdcZhYocjWN03jsL4FK8a+g4Q=;
 b=J1VPFjS+yd9hHLSRR9YxP9k1bLLgXnZxM+IEAsqluSfMgdubqQ5Hrlcyr4zJwB2147
 o2/khE+GmrNaEHo7ZHC/TYvrgUOf1s1V4GyluippnFQDI0tMlvvbDEfChtyM5J7eJcqN
 PrybKMDyp1iuPVuTQ85sIE6mEIeYC0H5oon184EeqvOUDh2TwEmvc0vl1kiCzL+e9iMJ
 0LWC2CBY5Wt3oETj4fhJ6Go41dDl2bMxw1Abr8UbN22YlklfJ0VE8HbcwOT8eOVP/kQa
 OFuOz3UlKbP2JzPFu7TExSHZEtt1aoLS7smWRaRN3POd82ImgDGI4ce0P4mOT/2KEPkB
 uPZQ==
X-Gm-Message-State: AAQBX9ebnl1+BjAz0wfLp0nU2nlGygtOqxISH0TmrXsudARnbDkTa/GD
 urvoQQoqDh1dkFwqz4IYwm89mNZFZJUYw1dKnvQ=
X-Google-Smtp-Source: AKy350Y98dG5o7rskkMQu6+dAeEIVkQQzg1LUtoAeTA40PGhhHYU0XtNakjl5yzzFJsFgcYuvw6xXdYciqR/xdP4HIw=
X-Received: by 2002:a67:e004:0:b0:425:8e57:7bfd with SMTP id
 c4-20020a67e004000000b004258e577bfdmr7768560vsl.3.1681698519672; Sun, 16 Apr
 2023 19:28:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230413133432.53771-1-ivan.klokov@syntacore.com>
In-Reply-To: <20230413133432.53771-1-ivan.klokov@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 Apr 2023 12:28:13 +1000
Message-ID: <CAKmqyKO76-D68kk7jys4LPBBVxbEfrtL-066DEh+N6Uw0vdWAA@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/riscv_aplic: Zero init APLIC internal state
To: Ivan Klokov <ivan.klokov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 anup@brainfault.org, anup.patel@wdc.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 17 Apr 2023 02:28:46 -0000

On Thu, Apr 13, 2023 at 11:35=E2=80=AFPM Ivan Klokov <ivan.klokov@syntacore=
.com> wrote:
>
> Since g_new is used to initialize the RISCVAPLICState->state structure,
> in some case we get behavior that is not as expected. This patch
> changes this to g_new0, which allows to initialize the APLIC in the corre=
ct state.
>
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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
>

