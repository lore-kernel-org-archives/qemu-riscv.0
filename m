Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4c2s-0000Yb-WE
	for mharc-qemu-riscv@gnu.org; Mon, 12 Dec 2022 01:12:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p4c2q-0000Y8-Vm; Mon, 12 Dec 2022 01:12:09 -0500
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p4c2p-0005I9-Ap; Mon, 12 Dec 2022 01:12:08 -0500
Received: by mail-vk1-xa31.google.com with SMTP id f68so5003333vkc.8;
 Sun, 11 Dec 2022 22:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rchOpqelyiDC+hFlq8o4W1DSxH1mwbC+KTYPlKqHtkE=;
 b=I/0a1dUVwCZXFxGIR27JuKx/F4etj2v1LZiXraHtL/doCcZIsAojk3NjGMVJ8VwWU6
 PggTvfjlS4EJk07XtB8KF7/bGOrJzxWOZI9QHEN6HtcwZNlrDCSV2mcCIE+iBxwnBcqk
 8vrNpJLB1bEWO87Q1/M0w87yAr4R7xfsVGXssJ8iEvthspUBfwGi63/pAVsiP0KhWFzL
 eQ8fLq0y7bysEbsVXlbEiwtf8r31weEbHrh0uhH5PEOCEFbtRTncYZRxHc6dEhYUIU2P
 k8yduQwNJhHYr2RzvlBngI00zhNQuUKhYko/0TALmK2VnvCKBRo/FhXhqnc/bVPERm4R
 NyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rchOpqelyiDC+hFlq8o4W1DSxH1mwbC+KTYPlKqHtkE=;
 b=CP7QfOgANVraAMCBcPK59V1x0j5DDqAMTY41a8O5I82KS+/dZ+kevPh/jJdXkjpQto
 ruTHEVeGA41pBsWC72jiCB8mElHOuaU0rEZ27eBfYATH9vy/xvgCGeRI0NgO6MXYtZ7z
 CMAA/T9ehkJ8UIt3uMcd7kNJEmWMZRl6i/rnpf7jVjwctOgKEE1WZnfOJ9gU6z1VFcIN
 45woYhpnEkF/OR4HSyf6S31jWbv3jQPX01bpiXoFNBQFZ5m9aTh+Ah3MA6lK+uFYge7S
 kBCGAzb1B6bgJzBCvUYpzWf/yNgJra/Aun5kFa+zL8nHU1WkI0WsC3W15GQP8sW3hAFY
 tvmQ==
X-Gm-Message-State: ANoB5plUIp1hheP4ccCO0E1fJwxsq0MFCvUmHYtYglzf+HujECwL0KgA
 HHujymEo0o67EphVYufXYedQZJ+GXmcCfgGGyA0=
X-Google-Smtp-Source: AA0mqf6MMlwT04gZ2COAcq88GpUq241OnEFvcXlCFYlTR1xgHao6zJSaOi0DHmGmwzp11MlJ+xvImqogZkXqG4KHG/w=
X-Received: by 2002:a1f:1409:0:b0:3c1:2fa:82e1 with SMTP id
 9-20020a1f1409000000b003c102fa82e1mr149233vku.7.1670825525940; Sun, 11 Dec
 2022 22:12:05 -0800 (PST)
MIME-Version: 1.0
References: <20221211030829.802437-1-bmeng@tinylab.org>
 <20221211030829.802437-16-bmeng@tinylab.org>
In-Reply-To: <20221211030829.802437-16-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Dec 2022 16:11:39 +1000
Message-ID: <CAKmqyKOwHaQCuohCdr5WfL4uDzCeq2W64ECAKequAqKpdni-cg@mail.gmail.com>
Subject: Re: [PATCH v3 16/16] hw/intc: sifive_plic: Fix the pending register
 range check
To: Bin Meng <bmeng@tinylab.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa31.google.com
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
X-List-Received-Date: Mon, 12 Dec 2022 06:12:09 -0000

On Sun, Dec 11, 2022 at 1:21 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> The pending register upper limit is currently set to
> plic->num_sources >> 3, which is wrong, e.g.: considering
> plic->num_sources is 7, the upper limit becomes 0 which fails
> the range check if reading the pending register at pending_base.
>
> Fixes: 1e24429e40df ("SiFive RISC-V PLIC Block")
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> ---
>
> (no changes since v1)
>
>  hw/intc/sifive_plic.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index 1a792cc3f5..5522ede2cf 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -143,7 +143,8 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr addr, unsigned size)
>          uint32_t irq = (addr - plic->priority_base) >> 2;
>
>          return plic->source_priority[irq];
> -    } else if (addr_between(addr, plic->pending_base, plic->num_sources >> 3)) {
> +    } else if (addr_between(addr, plic->pending_base,
> +                            (plic->num_sources + 31) >> 3)) {
>          uint32_t word = (addr - plic->pending_base) >> 2;
>
>          return plic->pending[word];
> @@ -202,7 +203,7 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
>              sifive_plic_update(plic);
>          }
>      } else if (addr_between(addr, plic->pending_base,
> -                            plic->num_sources >> 3)) {
> +                            (plic->num_sources + 31) >> 3)) {
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "%s: invalid pending write: 0x%" HWADDR_PRIx "",
>                        __func__, addr);
> --
> 2.34.1
>
>

