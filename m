Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kwth6-0007aW-TP
	for mharc-qemu-riscv@gnu.org; Tue, 05 Jan 2021 16:16:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kwth1-0007ZC-Fm; Tue, 05 Jan 2021 16:16:39 -0500
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:37356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kwtgx-0007Jw-VC; Tue, 05 Jan 2021 16:16:39 -0500
Received: by mail-il1-x12e.google.com with SMTP id k8so1080169ilr.4;
 Tue, 05 Jan 2021 13:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=csEBbhBhX6UIvSyn616Cipmm4dpWl99fBRUKJFSbIOk=;
 b=b456C9wKzmQeWAyzo3BIxy/S8ClNSqoVX/NsdyrsCjAXir4W1hF3NzIic5FFWuIfHT
 LmB7oUjgwMhRDg50SpPiDSWkSq9kF4JF8C4bjsjGf+otm3m6qULD2NzBem9Sdz6wntng
 kCRH/tVYFpdt1GBWkvVTLExVMPDDC7M+RRcUwKsuI6FZMNLlQqMXv3VZp3yckAcGAamq
 4b+aDEt99IUDSGJHycVfOCTwx2ocQRKzf0mGJ0yCHYC28rtFoE5mg7trZnMRp9FACCDB
 0NcGqQVnw3fHSLgBccLEbfSQN3DjhXLKwuLuQL/U2Pz5BwzqKco+dT4AtZGGMeXb6r2l
 cgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=csEBbhBhX6UIvSyn616Cipmm4dpWl99fBRUKJFSbIOk=;
 b=frPyv56zYrtH2BX2qjkxRJND9gR1kU6ZCqXv0Ga4zuvg9S8N/KIRqwlcomqcjdqulg
 5418h13Tq4xR+tgi9LcvherlZtYE+BrEKe3OkvUFT+GNBc4mlrhMDESZVKA4glj8LUKS
 G6Pue9LEoaGpnvVz2mcJgIurt3/Z3AK05ScQ9NVW6sWjhZ+ZXeUowygbwfhS2haqlE7x
 iUMwZrd9KCBIwWxT+1jPbzQIwKigapHlPU3tqLcLR3LdE9PovIJOAzpSAOmANEIn/uEw
 wbRhqoiLzuB/RXQ4kOJd4TGIn18LBxcdmM8rCeXV1/APUGsLDSEimJGBAodys4MmIP9K
 9sxQ==
X-Gm-Message-State: AOAM530e768USo/AImu9CeBQHl6ORPp/aQHUVPQwcvSkWqJ7pUyTYruZ
 UNAOBRx+PZwOjNk9xuFrm+KMc2XjDvGF27S4WiE=
X-Google-Smtp-Source: ABdhPJySByWnFUTpHzD3pQPKNIA9XoU7iDuKbFZFIaUb5Q0H8dnUJJPjBAo9NI6JjA6Xy6DlZRsAvhe3OiOWFeEaF3Y=
X-Received: by 2002:a92:cb44:: with SMTP id f4mr1415843ilq.131.1609881394383; 
 Tue, 05 Jan 2021 13:16:34 -0800 (PST)
MIME-Version: 1.0
References: <20201231113010.27108-1-bmeng.cn@gmail.com>
 <20201231113010.27108-3-bmeng.cn@gmail.com>
In-Reply-To: <20201231113010.27108-3-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 5 Jan 2021 13:16:08 -0800
Message-ID: <CAKmqyKPkumt2b-EWfLbAYGDO2295HjBibkBMZ+WPbkTtNozxOQ@mail.gmail.com>
Subject: Re: [PATCH 02/22] hw/block: m25p80: Add various ISSI flash information
To: Bin Meng <bmeng.cn@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <alistair.francis@wdc.com>, Qemu-block <qemu-block@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jan 2021 21:16:40 -0000

On Thu, Dec 31, 2020 at 3:32 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This updates the flash information table to include various ISSI
> flashes that are supported by upstream U-Boot and Linux kernel.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/block/m25p80.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 8a62bc4bc4..e82deb41c6 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -209,6 +209,19 @@ static const FlashPartInfo known_devices[] = {
>      { INFO("640s33b",     0x898913,      0,  64 << 10, 128, 0) },
>      { INFO("n25q064",     0x20ba17,      0,  64 << 10, 128, 0) },
>
> +    /* ISSI */
> +    { INFO("is25lq040b",  0x9d4013,      0,  64 << 10,   8, ER_4K) },
> +    { INFO("is25lp080d",  0x9d6014,      0,  64 << 10,  16, ER_4K) },
> +    { INFO("is25lp016d",  0x9d6015,      0,  64 << 10,  32, ER_4K) },
> +    { INFO("is25lp032",   0x9d6016,      0,  64 << 10,  64, ER_4K) },
> +    { INFO("is25lp064",   0x9d6017,      0,  64 << 10, 128, ER_4K) },
> +    { INFO("is25lp128",   0x9d6018,      0,  64 << 10, 256, ER_4K) },
> +    { INFO("is25lp256",   0x9d6019,      0,  64 << 10, 512, ER_4K) },
> +    { INFO("is25wp032",   0x9d7016,      0,  64 << 10,  64, ER_4K) },
> +    { INFO("is25wp064",   0x9d7017,      0,  64 << 10, 128, ER_4K) },
> +    { INFO("is25wp128",   0x9d7018,      0,  64 << 10, 256, ER_4K) },
> +    { INFO("is25wp256",   0x9d7019,      0,  64 << 10, 512, ER_4K) },
> +
>      /* Macronix */
>      { INFO("mx25l2005a",  0xc22012,      0,  64 << 10,   4, ER_4K) },
>      { INFO("mx25l4005a",  0xc22013,      0,  64 << 10,   8, ER_4K) },
> --
> 2.25.1
>
>

