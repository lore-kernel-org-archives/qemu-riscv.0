Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2keo-0001pg-C9
	for mharc-qemu-riscv@gnu.org; Tue, 06 Dec 2022 21:59:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2kek-0001pA-J2; Tue, 06 Dec 2022 21:59:34 -0500
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2kei-00053t-NW; Tue, 06 Dec 2022 21:59:34 -0500
Received: by mail-vs1-xe2a.google.com with SMTP id k185so16065433vsc.2;
 Tue, 06 Dec 2022 18:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q/0N2oN4PJdypTQv4uAHblAqUp/HDR2yVblJlWHyO+0=;
 b=N/Tp7e8r3GXnlQne86fBVLuI2txl3ugo8P3Rb6KGO2oYHE92mxoR1xiB/DbNlmZqz/
 1jMip0whtWItp1IIpWcBfug1DQqyV6oc24023xC99alLRlDvVXcXzcp4aD0kh231RC1j
 FHMtR9DNx7OPAANFeA1GqADkU6ou8yEMs0d5+zK2Xa36Wc+ZG31stpFkbyjOyRaoa8ea
 FnaPJuXJ8KbqyBIitbHu6jLtisrF4QznZoSceaIPVSLfggit6VuB4dr92frZYOTjXOfT
 CcKLfnB7F8PENdQugDBeqM9kG9OdCRcLz8BUijLLrCzmIdDjZ09Mxej5qQ7wz0zFPHJP
 N1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q/0N2oN4PJdypTQv4uAHblAqUp/HDR2yVblJlWHyO+0=;
 b=HS2XdSgA2bjBGNTKGLz0ySW37gqm/XzD9JjAYP8HMupaLjmEdpqrZZXvrYZchZ4b4/
 /PgYZGgNZPnyrZ1eWiFW53odzZ+uu9sS1EGQbt+1C0Yy85XsZvePLKC0V/I+5gFe0PHE
 uNLxPG8zP68DUVclAsIjJ8kb6WLFVywrAK8Uqayc3n+aZDOhTQI+YehFyi3emT82bsx5
 0xOLUxWA+cub8ZJk+w/zFI1tsDMDRPPuTtzRlCPy56XyiadmNRdVozGpiuD9NfTN5eCZ
 pmuXwqz8onaMMkPw2XEU0Mjexgk2YGiNaAlEHwMM07XKz5yc/MRCMXnz8IFkku5WMUG7
 8kjQ==
X-Gm-Message-State: ANoB5plZUUd59oqQeAk3qfNoRcHU8yN0RFWUEQkWCzco51nvggkKW2mQ
 vgxBBR2mPMoRMlAGx6Ex0EFgz1J2e0TrzVG604o=
X-Google-Smtp-Source: AA0mqf5M2PfgPfQ9Qu0O9fFhtN2/CyGyux6Zduu90aZGZ8LAAGfS01oMEyAZdT0O6BIQc5mb7xPqmdi/FI8ri8k/Hhs=
X-Received: by 2002:a05:6102:3bc1:b0:3a7:9b8c:2e4c with SMTP id
 a1-20020a0561023bc100b003a79b8c2e4cmr36824665vsv.72.1670381970530; Tue, 06
 Dec 2022 18:59:30 -0800 (PST)
MIME-Version: 1.0
References: <20221127165753.30533-1-jim.shu@sifive.com>
In-Reply-To: <20221127165753.30533-1-jim.shu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Dec 2022 12:59:04 +1000
Message-ID: <CAKmqyKPhd4a0FSuvFfW_a4AfBFOENM-1xZ-2TorxbF-05APkuw@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: sifive_plic: fix out-of-bound access of
 source_priority array
To: Jim Shu <jim.shu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2a.google.com
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
X-List-Received-Date: Wed, 07 Dec 2022 02:59:36 -0000

On Mon, Nov 28, 2022 at 2:59 AM Jim Shu <jim.shu@sifive.com> wrote:
>
> If the number of interrupt is not multiple of 32, PLIC will have
> out-of-bound access to source_priority array. Compute the number of
> interrupt in the last word to avoid this out-of-bound access of array.
>
> Signed-off-by: Jim Shu <jim.shu@sifive.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/intc/sifive_plic.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index c2dfacf028..1cf156cf85 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -78,6 +78,7 @@ static uint32_t sifive_plic_claimed(SiFivePLICState *plic, uint32_t addrid)
>      uint32_t max_irq = 0;
>      uint32_t max_prio = plic->target_priority[addrid];
>      int i, j;
> +    int num_irq_in_word = 32;
>
>      for (i = 0; i < plic->bitfield_words; i++) {
>          uint32_t pending_enabled_not_claimed =
> @@ -88,7 +89,16 @@ static uint32_t sifive_plic_claimed(SiFivePLICState *plic, uint32_t addrid)
>              continue;
>          }
>
> -        for (j = 0; j < 32; j++) {
> +        if (i == (plic->bitfield_words - 1)) {
> +            /*
> +             * If plic->num_sources is not multiple of 32, num-of-irq in last
> +             * word is not 32. Compute the num-of-irq of last word to avoid
> +             * out-of-bound access of source_priority array.
> +             */
> +            num_irq_in_word = plic->num_sources - ((plic->bitfield_words - 1) << 5);
> +        }
> +
> +        for (j = 0; j < num_irq_in_word; j++) {
>              int irq = (i << 5) + j;
>              uint32_t prio = plic->source_priority[irq];
>              int enabled = pending_enabled_not_claimed & (1 << j);
> --
> 2.17.1
>
>

