Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2m3V-0001x0-VL
	for mharc-qemu-riscv@gnu.org; Tue, 06 Dec 2022 23:29:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2m3U-0001wZ-4w; Tue, 06 Dec 2022 23:29:12 -0500
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2m3S-0004VI-EL; Tue, 06 Dec 2022 23:29:11 -0500
Received: by mail-vs1-xe2d.google.com with SMTP id b189so10286243vsc.10;
 Tue, 06 Dec 2022 20:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DX5QydEXpFl8NsjPUgSKdk5+6AddU2PbuLqRwmFUfpY=;
 b=NIZYowv5B1L8TlFnwx15dXURvNYbGVhi5R36wkObKwUILNsTOS4ulDAMDvtvDhj7Vk
 d8mx7NlqKezTatB4qYRkY9OEYbC+5yoXUSQqiHgMseXLm/61TRhydsD1esxxUEHkEDvM
 WDcQkOsaHZL8bf4TsET3UkgGccSb0hg5sL0nBwEPjlIKxHMLvRt5cLXZwYoGS7P+UBOc
 g1Jl4OYcdeFfkTE12QhpRx4LoHaPd4JOeKYzX3EPtp0OyU/zC+TzCgVqyB0G35ls/OFB
 7D8+2cR8jS9BplIaAUxjhJAhQYKAwrFcVSB5fBFQ6MWNhjTw32qa+e08GQ2G5ETu9t8p
 WjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DX5QydEXpFl8NsjPUgSKdk5+6AddU2PbuLqRwmFUfpY=;
 b=REyWN0hYJ3ytLImpNWPSvUSGGWmWaOd/SyE03DTBwx/PzmGNQ9eXeroE0H7b4prRNP
 sJFfrkWUx5o81LK6aPyo2hC69c+LYb2b6pAxKNIYdLnTWsbR/fAtPt12PftH/ksvx0JI
 0CEo0FMSE2cC7cuQ1vHpbjdXFntHA6k4crcwexKMSkhnPeoqadIpBvEzUGSlz4F4+tYZ
 oh1N7PAjyWvfBuY+sTEuVmi1UBdzQfWCjfOx5QjRFphaEVPocBvOSXZlsNarIDVo1UfB
 NwLwChR7sSIOpw+B+9TkyiQQ/pPJHp9UjFz8r0RcnRUxxgwqydEg5ZZ0W4noWt31fRJ9
 DroA==
X-Gm-Message-State: ANoB5plCGBo7mKR2R1tOmGQsmshPpRlGOVVnnWlidgKDflWOHvXcmcEB
 8TAjQHwQVtKiiSfH7DgUX3TVeVQs6ml00kPb0o0=
X-Google-Smtp-Source: AA0mqf5u8dKB7K7VGLbvB8x39EOHtxcw2L5fU6LGCjm9n9+JXmgfFYDgueA3R04AmvpM5tADWzCaS9MhJx59rWDOqfA=
X-Received: by 2002:a05:6102:3bc1:b0:3a7:9b8c:2e4c with SMTP id
 a1-20020a0561023bc100b003a79b8c2e4cmr36903418vsv.72.1670387348455; Tue, 06
 Dec 2022 20:29:08 -0800 (PST)
MIME-Version: 1.0
References: <20221201140811.142123-1-bmeng@tinylab.org>
 <20221201140811.142123-8-bmeng@tinylab.org>
In-Reply-To: <20221201140811.142123-8-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Dec 2022 14:28:42 +1000
Message-ID: <CAKmqyKNrFL19uEhPWYwnmH82d-2ZBdpcBounU2Eo2xz9dbjvqQ@mail.gmail.com>
Subject: Re: [PATCH 08/15] hw/intc: sifive_plic: Update "num-sources" property
 default value
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
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
X-List-Received-Date: Wed, 07 Dec 2022 04:29:12 -0000

On Fri, Dec 2, 2022 at 12:12 AM Bin Meng <bmeng@tinylab.org> wrote:
>
> At present the default value of "num-sources" property is zero,
> which does not make a lot of sense, as in sifive_plic_realize()
> we see s->bitfield_words is calculated by:
>
>   s->bitfield_words = (s->num_sources + 31) >> 5;
>
> if the we don't configure "num-sources" property its default value
> zero makes s->bitfield_words zero too, which isn't true because
> interrupt source 0 still occupies one word.
>
> Let's change the default value to 1 meaning that only interrupt
> source 0 is supported by default and a sanity check in realize().
>
> While we are here, add a comment to describe the exact meaning of
> this property that the number should include interrupt source 0.
> A wrong multi-line comment format is corrected too.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
>
>  hw/intc/sifive_plic.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index 5fd9a53569..2bd292410d 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -363,6 +363,11 @@ static void sifive_plic_realize(DeviceState *dev, Error **errp)
>
>      parse_hart_config(s);
>
> +    if (!s->num_sources) {
> +        error_report("plic: invalid number of interrupt sources");

We should propagate the error up via errp instead

Otherwise:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> +        exit(1);
> +    }
> +
>      s->bitfield_words = (s->num_sources + 31) >> 5;
>      s->num_enables = s->bitfield_words * s->num_addrs;
>      s->source_priority = g_new0(uint32_t, s->num_sources);
> @@ -379,7 +384,8 @@ static void sifive_plic_realize(DeviceState *dev, Error **errp)
>      s->m_external_irqs = g_malloc(sizeof(qemu_irq) * s->num_harts);
>      qdev_init_gpio_out(dev, s->m_external_irqs, s->num_harts);
>
> -    /* We can't allow the supervisor to control SEIP as this would allow the
> +    /*
> +     * We can't allow the supervisor to control SEIP as this would allow the
>       * supervisor to clear a pending external interrupt which will result in
>       * lost a interrupt in the case a PLIC is attached. The SEIP bit must be
>       * hardware controlled when a PLIC is attached.
> @@ -419,7 +425,8 @@ static const VMStateDescription vmstate_sifive_plic = {
>  static Property sifive_plic_properties[] = {
>      DEFINE_PROP_STRING("hart-config", SiFivePLICState, hart_config),
>      DEFINE_PROP_UINT32("hartid-base", SiFivePLICState, hartid_base, 0),
> -    DEFINE_PROP_UINT32("num-sources", SiFivePLICState, num_sources, 0),
> +    /* number of interrupt sources including interrupt source 0 */
> +    DEFINE_PROP_UINT32("num-sources", SiFivePLICState, num_sources, 1),
>      DEFINE_PROP_UINT32("num-priorities", SiFivePLICState, num_priorities, 0),
>      DEFINE_PROP_UINT32("priority-base", SiFivePLICState, priority_base, 0),
>      DEFINE_PROP_UINT32("pending-base", SiFivePLICState, pending_base, 0),
> --
> 2.34.1
>
>

