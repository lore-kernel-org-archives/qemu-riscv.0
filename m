Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p38NE-0008FV-47
	for mharc-qemu-riscv@gnu.org; Wed, 07 Dec 2022 23:19:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p38NB-0008EF-L9; Wed, 07 Dec 2022 23:19:01 -0500
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p38NA-0007sK-0P; Wed, 07 Dec 2022 23:19:01 -0500
Received: by mail-ua1-x92e.google.com with SMTP id 97so95877uam.0;
 Wed, 07 Dec 2022 20:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qGQ5vD/30nSBWbrHatJS+Fz1po/tqH5JcWp3EKWbla8=;
 b=NHC7pEUI24zipqic0Rjzthw8yC8GgckoTK74e7vUwy7ojmVktASdPq4gNxeRtPwfK1
 gmJiyTRLNXdPYTRpFcBLSOBuRauG7+/nLH6IlhEbjm6e2n+x8DbfBUtx3jqdDdiZk7J7
 kVathrXz2Keunzj+yKxMOH3DcZSZj+rvgo3sqXO1NYgD5zQ9WCxG3p1PC1aaX03WjuK9
 K7QPEgmbhvNbvFzqJMFb8pOjHCB7ZxarOdwdkJdAHbN38419R7jks2AfAM3D9XL/eOpm
 WVzn0q8qCO5PDCG5+WnrFfMTt6RHbYtIWJtpoDsg5szuQm/zyuSrHdgFpExWs5Qx1R60
 WkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qGQ5vD/30nSBWbrHatJS+Fz1po/tqH5JcWp3EKWbla8=;
 b=zuvr4Omzu24aiXlfycjAt4imDEWHiOnG6t7klgSyQv62WkeV+ZO/iVliiB0g77ywGG
 xEs22+gMmhUt1kwkgOu4TpiD8CuPjyQ+Q1tuMFgYsKBj4sx1ErHj+seMIYFWXkHfPEge
 8/ewq54rDj5nP1UtIVs5o+2Lg4Sel4spz2KFa7rKvo0bUbzOWWQP1u57fVtSiLXF/Vx+
 Sr4zLTxr78muM+MV2QUCWpti3oxuMFficnCircBalSTPePcpznD4V36XsX1iLt8kt3AC
 ApFm8Enc68MtEJWKif0Evn5XSM5UBf4YjnFNdhh+rjewv/UJV786YDmx51lTBxzCwnmx
 cbjw==
X-Gm-Message-State: ANoB5pnelwquaa2s9Rx42198+YI9eyXTSacw1l4Kvl/eA6tahZnBlAKV
 DstGniz0b5CjLsmuInV2px4JFxHHSw5nnLQXeMGwiPoryPY=
X-Google-Smtp-Source: AA0mqf5D0VXa1Sv+COlPxpHeOtI/sgJKR5NwYFJ8g6j0rbODRQ8DOij3hmee6/UCdtucYSDAVJ8DmAp2L3sLRS/b2ow=
X-Received: by 2002:ab0:6f52:0:b0:419:1fa3:9618 with SMTP id
 r18-20020ab06f52000000b004191fa39618mr28390098uat.11.1670473138445; Wed, 07
 Dec 2022 20:18:58 -0800 (PST)
MIME-Version: 1.0
References: <20221207100335.290481-1-bmeng@tinylab.org>
 <20221207100335.290481-8-bmeng@tinylab.org>
In-Reply-To: <20221207100335.290481-8-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Dec 2022 14:18:32 +1000
Message-ID: <CAKmqyKPu=MMh6n2oLq8ZfHmaKXN+piTtvbnGBkH9xHjOeU2-kA@mail.gmail.com>
Subject: Re: [PATCH v2 08/16] hw/intc: sifive_plic: Use error_setg() to
 propagate the error up via errp in sifive_plic_realize()
To: Bin Meng <bmeng@tinylab.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92e.google.com
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
X-List-Received-Date: Thu, 08 Dec 2022 04:19:02 -0000

On Wed, Dec 7, 2022 at 8:06 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> The realize() callback has an errp for us to propagate the error up.
> While we are here, corret the wrong multi-line comment format.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> Changes in v2:
> - new patch: "hw/intc: sifive_plic: Use error_setg() to propagate the error up via errp in sifive_plic_realize()"
>
>  hw/intc/sifive_plic.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index c9af94a888..9cb4c6d6d4 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -379,7 +379,8 @@ static void sifive_plic_realize(DeviceState *dev, Error **errp)
>      s->m_external_irqs = g_malloc(sizeof(qemu_irq) * s->num_harts);
>      qdev_init_gpio_out(dev, s->m_external_irqs, s->num_harts);
>
> -    /* We can't allow the supervisor to control SEIP as this would allow the
> +    /*
> +     * We can't allow the supervisor to control SEIP as this would allow the
>       * supervisor to clear a pending external interrupt which will result in
>       * lost a interrupt in the case a PLIC is attached. The SEIP bit must be
>       * hardware controlled when a PLIC is attached.
> @@ -387,8 +388,8 @@ static void sifive_plic_realize(DeviceState *dev, Error **errp)
>      for (i = 0; i < s->num_harts; i++) {
>          RISCVCPU *cpu = RISCV_CPU(qemu_get_cpu(s->hartid_base + i));
>          if (riscv_cpu_claim_interrupts(cpu, MIP_SEIP) < 0) {
> -            error_report("SEIP already claimed");
> -            exit(1);
> +            error_setg(errp, "SEIP already claimed");
> +            return;
>          }
>      }
>
> --
> 2.34.1
>
>

