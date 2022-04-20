Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nh50U-0008Ml-Pq
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 03:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nh50S-0008KB-LJ; Wed, 20 Apr 2022 03:44:08 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:33521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nh50Q-0005oV-T9; Wed, 20 Apr 2022 03:44:08 -0400
Received: by mail-il1-x136.google.com with SMTP id b5so505499ile.0;
 Wed, 20 Apr 2022 00:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r7gPAn3nwSujQ1bqlAnU7MqJO3ByaVkNzaWBa4XIPIs=;
 b=mMUWj+PkD+yLe1Apv/DEzBKxhIwF3brLxMlg1pjy7ViqvhiOBEUpi3Ydgrg77WC6fl
 L1Xp+fLx7SB5Juuwn6X9ZQP3HwfSQ2N2LA3Sb17a07quEp2YCT6mzrarABYubrAgLIzz
 v5KiHlXKadeWkZoZaFEshADztXnfZMn0fChAifIsiuAMFcySgzemOfmG04E8wYuXHbBe
 C5ijxxpeUFSwgj1AUPmeg3rbZQ0GBqOnDuccdt+RBjQh+xd98ECnkVhF8GMQcD3WuB+Q
 LIBx81RJxy31ZAHjO6jo9ZijYdBGbUNwriZK/DxJOYaBDuDUPbiixh8PKQ0zIRAaOQtI
 jf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r7gPAn3nwSujQ1bqlAnU7MqJO3ByaVkNzaWBa4XIPIs=;
 b=gV6WIm6WJTPsKNVJFgX8WiJ3nB5x6q0XBOQiEvs4Cqclkr5hRAHuj1/fuCA/87VPd+
 JRP81RloaPFbc0kSrSgaUwBOGTeVDj7AfSdFFTyKAY3ZV7vrJZq2v2KfGNH/TFo3PQta
 LEAjkjBlCBvYI7OwjDmIs/Tc2h4BgRNPbpEzZxDwpnJVxy2oZ9WUcT3/hB2O3MlWxaz0
 9CY9L4caQc3OWaNcVgEdDtkczCiRSQQSWp5MCLq7Y9x4qHWcyoNUZcS0kefCqhTDcLmB
 mwVV4AEuKnnDNxBFpn+91T3Kgg/Z7kqDw3WuP96GbaE/4lOb6Y/Jy4VHyiwKQE6Pr/4I
 Fa3g==
X-Gm-Message-State: AOAM530jdkqO8h/PlrzeGXNZnz+ufKMmPdqhOFpg7TeQuHQJS0Ph0vcq
 sTHpdAauce2VW9j5oUJvu5X7LviMPun3wv0dUjM=
X-Google-Smtp-Source: ABdhPJw4memRFE+EwAgWq0kibBWHPYG77dxmhJlVkjWDdk/GF/fzRody6apRyJWM7IlW4HNcz5P+Ep5xRJyyt83Yix4=
X-Received: by 2002:a92:c6ce:0:b0:2cb:ed10:83e6 with SMTP id
 v14-20020a92c6ce000000b002cbed1083e6mr8602151ilm.310.1650440645467; Wed, 20
 Apr 2022 00:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220419090848.9018-1-frank.chang@sifive.com>
 <20220419090848.9018-5-frank.chang@sifive.com>
In-Reply-To: <20220419090848.9018-5-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 20 Apr 2022 17:43:39 +1000
Message-ID: <CAKmqyKO7CHg_MGppcU6WoexWfuB_5XsigYezNzdkWGk4RiNLHQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] hw/intc: riscv_aclint: Add reset function of
 ACLINT devices
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Anup Patel <anup.patel@wdc.com>, Jim Shu <jim.shu@sifive.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
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
X-List-Received-Date: Wed, 20 Apr 2022 07:44:09 -0000

On Tue, Apr 19, 2022 at 7:29 PM <frank.chang@sifive.com> wrote:
>
> From: Jim Shu <jim.shu@sifive.com>
>
> This commit implements reset function of all ACLINT devices.
> ACLINT device reset will clear MTIME and MSIP register to 0.
>
> Depend on RISC-V ACLINT spec v1.0-rc4:
> https://github.com/riscv/riscv-aclint/blob/v1.0-rc4/riscv-aclint.adoc
>
> Signed-off-by: Jim Shu <jim.shu@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/intc/riscv_aclint.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> index ad7ccf96cd..67a07bb5b9 100644
> --- a/hw/intc/riscv_aclint.c
> +++ b/hw/intc/riscv_aclint.c
> @@ -293,11 +293,29 @@ static void riscv_aclint_mtimer_realize(DeviceState *dev, Error **errp)
>      }
>  }
>
> +static void riscv_aclint_mtimer_reset_enter(Object *obj, ResetType type)
> +{
> +    /*
> +     * According to RISC-V ACLINT spec:
> +     *   - On MTIMER device reset, the MTIME register is cleared to zero.
> +     *   - On MTIMER device reset, the MTIMECMP registers are in unknown state.
> +     */
> +    RISCVAclintMTimerState *mtimer = RISCV_ACLINT_MTIMER(obj);
> +
> +    /*
> +     * Clear mtime register by writing to 0 it.
> +     * Pending mtime interrupts will also be cleared at the same time.
> +     */
> +    riscv_aclint_mtimer_write(mtimer, mtimer->time_base, 0, 8);
> +}
> +
>  static void riscv_aclint_mtimer_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      dc->realize = riscv_aclint_mtimer_realize;
>      device_class_set_props(dc, riscv_aclint_mtimer_properties);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +    rc->phases.enter = riscv_aclint_mtimer_reset_enter;
>  }
>
>  static const TypeInfo riscv_aclint_mtimer_info = {
> @@ -452,11 +470,32 @@ static void riscv_aclint_swi_realize(DeviceState *dev, Error **errp)
>      }
>  }
>
> +static void riscv_aclint_swi_reset_enter(Object *obj, ResetType type)
> +{
> +    /*
> +     * According to RISC-V ACLINT spec:
> +     *   - On MSWI device reset, each MSIP register is cleared to zero.
> +     *
> +     * p.s. SSWI device reset does nothing since SETSIP register always reads 0.
> +     */
> +    RISCVAclintSwiState *swi = RISCV_ACLINT_SWI(obj);
> +    int i;
> +
> +    if (!swi->sswi) {
> +        for (i = 0; i < swi->num_harts; i++) {
> +            /* Clear MSIP registers by lowering software interrupts. */
> +            qemu_irq_lower(swi->soft_irqs[i]);
> +        }
> +    }
> +}
> +
>  static void riscv_aclint_swi_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      dc->realize = riscv_aclint_swi_realize;
>      device_class_set_props(dc, riscv_aclint_swi_properties);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +    rc->phases.enter = riscv_aclint_swi_reset_enter;
>  }
>
>  static const TypeInfo riscv_aclint_swi_info = {
> --
> 2.35.1
>
>

