Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2mfg-0004OZ-W0
	for mharc-qemu-riscv@gnu.org; Wed, 07 Dec 2022 00:08:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2mff-0004OJ-VQ; Wed, 07 Dec 2022 00:08:39 -0500
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p2mfe-0004JQ-CT; Wed, 07 Dec 2022 00:08:39 -0500
Received: by mail-vk1-xa36.google.com with SMTP id s125so5908004vkg.2;
 Tue, 06 Dec 2022 21:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=axiK9ZBnBiHxwbnohN6cuyfQqPGARtbrFzuPWF1X7dI=;
 b=lwuZXviAEPeGQlXa82R8Eh84LmYWNBH4L8BXSAPJalQVROwvFW4nkjCjvz4TByH15F
 id8FCbVd9lBMN3QjonRFPlRx+jUBBWxh2x9AwzlBXcKtfsIcVXmsilG2pFv4C9SCd3gm
 oNFEfsW7YrKDXVt99JD/9fgXaQ7vlMWy8wyQgSiGqMK7jDp2rZc5AeSsH6COG4N61Rbb
 njgKUJ3otfZ8Gm0S4SP077rAMD0Zl0x+9MPZzJAZAgtAf2H9qIe5W3JNwAisDvw1RFJ/
 5LSH3BmpnqUUOmrjKuvYsJfAAOGKC6Pp41t6cB89aKbU9ISp4tCkWQTiZAOQGEb7BaaB
 BNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=axiK9ZBnBiHxwbnohN6cuyfQqPGARtbrFzuPWF1X7dI=;
 b=EBb//qEPTPG3/APNTrAqTHCaRCiMc23VhD9Jf2sFXb9AB3LL3YpO4dAQXNwtok5/9l
 gLBHZB9AO//utgHyi/ffpAA3UDzUHWxvUFrcpHgiWb5i5rV1ZBstRZkzjd/J/4vMhA1l
 hH11dsbHDCg6w12nnrzkYHRydDAgHHkj06iZCn4lpVlzPOz+XfJgtk9CZ30AX7A+F62m
 ebwYl3uRcKIAD1LXRJ8l8areLIZwPVu5eY6nrlfjfbt8t3voV1cqtGGKjUPm0JpuCodS
 30QOtVSOjAmQ1vGG4ssNSMdFTDqjdPsqBdjWQ4IE/Fs9u1NdpRx6S2AWnSVEQ33igvtS
 /GDA==
X-Gm-Message-State: ANoB5pmgWx371vYOTRCEcq0yvH9U56WQZYTSwDr7HWOHtLBjDyV7EO5b
 L8aT/EDFcBR0y4VxdjlL0UM0+PT2PqJ5l1uQNbU=
X-Google-Smtp-Source: AA0mqf7PQSnPatve6Y8mAssKT+Wx7LLOSotaFYGKbVecDDUIsiMiQX/Vi63s0T/eOjI17rkzEmkOLDRL+qTnZc+Wvlc=
X-Received: by 2002:a1f:3846:0:b0:3bc:c843:c7b5 with SMTP id
 f67-20020a1f3846000000b003bcc843c7b5mr26278556vka.30.1670389717013; Tue, 06
 Dec 2022 21:08:37 -0800 (PST)
MIME-Version: 1.0
References: <20221201140811.142123-1-bmeng@tinylab.org>
 <20221201140811.142123-15-bmeng@tinylab.org>
In-Reply-To: <20221201140811.142123-15-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 7 Dec 2022 15:08:10 +1000
Message-ID: <CAKmqyKNkwG4Y7F3JKahv-9QNmorh4Kbj5yKKQiroyQYF4zA4rQ@mail.gmail.com>
Subject: Re: [PATCH 15/15] hw/intc: sifive_plic: Fix the pending register
 range check
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa36.google.com
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
X-List-Received-Date: Wed, 07 Dec 2022 05:08:40 -0000

On Fri, Dec 2, 2022 at 12:10 AM Bin Meng <bmeng@tinylab.org> wrote:
>
> The pending register upper limit is currently set to
> plic->num_sources >> 3, which is wrong, e.g.: considering
> plic->num_sources is 7, the upper limit becomes 0 which fails
> the range check if reading the pending register at pending_base.
>
> Fixes: 1e24429e40df ("SiFive RISC-V PLIC Block")
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
>  hw/intc/sifive_plic.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index 7a6a358c57..a3fc8222c7 100644
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

