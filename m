Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1poEcD-0002cY-J7
	for mharc-qemu-riscv@gnu.org; Sun, 16 Apr 2023 22:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poEc9-0002c8-Mj; Sun, 16 Apr 2023 22:29:12 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1poEc8-00071L-Bd; Sun, 16 Apr 2023 22:29:09 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id d21so1455772vsv.9;
 Sun, 16 Apr 2023 19:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681698547; x=1684290547;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bQVRgkU3dxQp44UtoBqSOm+2gclmkMx4fstJ+zaskM0=;
 b=rUNtBx56pYFqQPHLdncoyYm2yrgfjCq5EZijT64FdZ9OziROWLyyiCgw4xUn+WyBFF
 /FyYBsZ789yp7NJfbBT388FmAsvURY+0+Eu0ziSKAOiOov+HunHnO/UpRQ3ehEIOi6A6
 5cci9wcdFX7bNzSPsOd/O91ceQtQR0+2i6ztvmMfbnkJolhAOwQla/AOUv/2JWsqB9Is
 eReMC7bi8+GjSNB+PHfH1hSJDNWANERcWCgXRdO2Z62RCDOtT6TJ2COC3RO2DO7kMCmr
 fsbqz5NCyr7tx7hiJCw1OXLBjCCF4KRxM3LvEdRHSsQXNVh8HO6gfVVCCe09+KryVXxj
 gVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681698547; x=1684290547;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bQVRgkU3dxQp44UtoBqSOm+2gclmkMx4fstJ+zaskM0=;
 b=GGFeJuZgFkPpSnJdupUPexl+ECGwvY0tH/Kzqpvogd2ueHPxu4qMpQcYl5tR8DvKSz
 jztfWtT9KdcP2LnhtWZexHAhRJIDJDzN+JksKGm7FdrLNLwfWzRUgZZGXHL3csj979O0
 65XINEJJM4C2DQfikUPJ0Xn364hOZEyiuFOoFoWNL9+gsLf6uyFhJzy4Ns474t5EWOf0
 NOSkiX/RhUmYsjESEBxxEw8HoU2zF61d07bHYmUy8I+JSpUP3OUjk5BJNsXKWy1ZnHZq
 ELm4eAdiY7uczqJiIarKzD3TG9DipX9Hkfa8zl1Gofvfqr3Uluw39NZd64vc6XUf6ayK
 /jMg==
X-Gm-Message-State: AAQBX9d1IkkVJykSODOP0kyz3paIlkbHOPj++5UJkA10xCV5BAJvFZE4
 8EMJrpYO+jFoOnodDeb74DyimMQk8jbNvhHOOS0=
X-Google-Smtp-Source: AKy350bvWUto8NmSD+8cRBX23Um+J85VZYMKVmBaEAsoFBrxWjDEFgDS3W15PfJ9nwuAH6W9FiYW+JOqPTQvTQge2B0=
X-Received: by 2002:a05:6102:c0d:b0:42c:a087:a943 with SMTP id
 x13-20020a0561020c0d00b0042ca087a943mr10169010vss.0.1681698546872; Sun, 16
 Apr 2023 19:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230413133432.53771-1-ivan.klokov@syntacore.com>
In-Reply-To: <20230413133432.53771-1-ivan.klokov@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 Apr 2023 12:28:40 +1000
Message-ID: <CAKmqyKO1ccb2MvHGr+oeJ27yCkCSTreP1A8MvUUGyRGa=jAVWw@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/riscv_aplic: Zero init APLIC internal state
To: Ivan Klokov <ivan.klokov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 anup@brainfault.org, anup.patel@wdc.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 17 Apr 2023 02:29:13 -0000

On Thu, Apr 13, 2023 at 11:35=E2=80=AFPM Ivan Klokov <ivan.klokov@syntacore=
.com> wrote:
>
> Since g_new is used to initialize the RISCVAPLICState->state structure,
> in some case we get behavior that is not as expected. This patch
> changes this to g_new0, which allows to initialize the APLIC in the corre=
ct state.
>
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>

Thanks!

Applied to riscv-to-apply.next

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

