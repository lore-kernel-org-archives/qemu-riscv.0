Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRcOH-0003V4-JY
	for mharc-qemu-riscv@gnu.org; Wed, 31 Mar 2021 11:04:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRcOD-0003So-28; Wed, 31 Mar 2021 11:04:13 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:38416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRcOA-00024F-LI; Wed, 31 Mar 2021 11:04:12 -0400
Received: by mail-io1-xd36.google.com with SMTP id e8so20435568iok.5;
 Wed, 31 Mar 2021 08:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9p+g8WUPALCJeA1iNezXA04eJTFY0ED/yaX5BNzMwCg=;
 b=AWFgT9QwIDjEy3DTCx8UsRi08NU/OPL3Ywa7dUdO+9tuKg7QRdQTkC6FXmnPYcp69L
 Jgg8ygr8Hfv1mQm2KR9FnG4crtcE8nxpfzBgqp8AhCVuoyTZTCmR+ILdu8MqCuB2DjcE
 kLrKJ6AT+JGTb/hZMNW5ySigE8R4xp1WvxvYBMrbGhbNT7qoCHLEAGPANzGn6crTqAmC
 +TgMmOX7t39RdhW6eZYAg8XVwL3eZZwgatE3A0WIxXckbTG363M+umt1KFFWzO9Pn6MV
 BD8gP8yaBvORch1H3j1zZDlgAtdXnlBRHW0XovyrtQx2RURM1gJHyA+UMZPER/+2p7Qx
 xB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9p+g8WUPALCJeA1iNezXA04eJTFY0ED/yaX5BNzMwCg=;
 b=IbqK5OhBtppF23nhRasY2zZMK4Wo1hdtB/jKL9BZIIo8N9kHmR/PYS8w2TzY53kAkk
 NMGihCV61JB4ZSmhACiXLFG+k9aG8nMOr0+JhY/cEQVTp70iLc7VaN/UgJoXsEds+mdH
 8a+rKcIgNl6zy/u6qrnpTSwzKwRO3Pv3HxXQOLfVIGwdLOvFiKYWHhYPXLmOshPX2Z1D
 ze41PvQmmbH1Y4NUgsuHwS6EZVhJ3MoymIX1pGBVJtyCNOr61NziwUQVYZvJFzpiKRy+
 2IOB3jV0Npdj/dSoyVc2RlllGafElKVQhih9q8s4cAN10Imyn16T6Mgn44rDYLMPk1bB
 gusg==
X-Gm-Message-State: AOAM531ncW3dy6dYcQbPF9u8sZ89alS4HGp0Wamzat+3zbWXMTBawsS7
 XUp5pozgQBrBT4nck8XyUJ7mjb/X8R+iZIJDlJ0=
X-Google-Smtp-Source: ABdhPJwAHcYQhGCrba4cmaTadxX8aULhzyBk5BjtcPjNXfSH7ndiBcfDi6V4qqXs/ayITQqXupiQo05n+pnkcq53S7M=
X-Received: by 2002:a6b:d60c:: with SMTP id w12mr2608286ioa.105.1617203048921; 
 Wed, 31 Mar 2021 08:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210331103612.654261-1-bmeng.cn@gmail.com>
In-Reply-To: <20210331103612.654261-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 31 Mar 2021 11:02:00 -0400
Message-ID: <CAKmqyKMMqAzfYjEXPdwJLv_M=-6PULBJJSbjrFbigvfJ5efH4A@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: sifive_e: Add 'const' to sifive_e_memmap[]
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Emmanuel Blot <eblot.ml@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
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
X-List-Received-Date: Wed, 31 Mar 2021 15:04:14 -0000

On Wed, Mar 31, 2021 at 6:36 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> This was accidentally dropped before. Add it back.
>
> Reported-by: Emmanuel Blot <eblot.ml@gmail.com>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/sifive_e.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index f939bcf9ea..82096b3e5a 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -50,7 +50,7 @@
>  #include "sysemu/sysemu.h"
>  #include "exec/address-spaces.h"
>
> -static MemMapEntry sifive_e_memmap[] = {
> +static const MemMapEntry sifive_e_memmap[] = {
>      [SIFIVE_E_DEV_DEBUG] =    {        0x0,     0x1000 },
>      [SIFIVE_E_DEV_MROM] =     {     0x1000,     0x2000 },
>      [SIFIVE_E_DEV_OTP] =      {    0x20000,     0x2000 },
> --
> 2.25.1
>
>

