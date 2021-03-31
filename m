Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRclT-0006PL-8i
	for mharc-qemu-riscv@gnu.org; Wed, 31 Mar 2021 11:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRclR-0006Ot-T9; Wed, 31 Mar 2021 11:28:13 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:42568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRclQ-000844-BG; Wed, 31 Mar 2021 11:28:13 -0400
Received: by mail-io1-xd31.google.com with SMTP id r193so20513082ior.9;
 Wed, 31 Mar 2021 08:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kkK2GLp2HKsXMr2OmTYBZkfJTRgJPVnAFEzUC8TtwyI=;
 b=koK8abhflNJBolr9yz7HrZ8DH7FRu+G/EsvGjv1m8Dw+bZko+bJGn/VfpRBmsg26BM
 A2xffNuz9fHI0e9AKx4xUxEOB9tMJns6aN9MwDl9PLVhPSdUfO14txqpsfprOzKDX0ez
 gL9Ai8ri8iBK5/gY1fjVNAenWAJXI/njI3Yfh60XaawXaPmeTBcJJ8YgOBb9bvWqvIHC
 7exdO0gjLin3Dq859k1L3vYAfIYegj0oMaebNT4dkIoBrKNdMk+B/3ZWBWDgjxixbHeK
 qTTMLEyn6iarJkVR2fZ1s6N75fMClIUpuZJrsNhpaMNVWokAng7EbLe5w6KHRgrujzDM
 oxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kkK2GLp2HKsXMr2OmTYBZkfJTRgJPVnAFEzUC8TtwyI=;
 b=pbZ2TJ+louaSdt2ekxcPTddgKc9PBpV+EtIm7HAOnrmzli+dtcADRoAEzd0ZgYVDoQ
 oE/oLQb+ESyUj1anq3OsufnzIWWCGBxfjIhxOxW3kjVFCc+2yw+mOugN9CuAz9KtsufB
 ZsTSrBJJg9hFCMIAgeHeH4xDpmCUWeMHeLSFbSNF3fqYDMnxXlpEmmL1vCbRCo7tFz1r
 Ic9q9zLPPQjDUL7IxQ4p1kO8irkm/6QmWnIkpOrntorJsLL0TAIErflxveyyw2Feri7G
 3w1GAyH3dwadLnu0q6UquGYUvyTr1bB5uLT3OCmO20PDMlzkbWGn2uQ2arWXwKZuyeEj
 OPKQ==
X-Gm-Message-State: AOAM530FQfrG4krzqPdIF9JlAXxU9Yw3OxIfaKhFntpIl3adweoFjmgo
 95714l4JE54cz7AwoCSLLq5K8063y4fPnc5zaQw=
X-Google-Smtp-Source: ABdhPJwXQF1/PGypYTTrF//ANtsNLYH9VKekMEklhQq3yPSzX22vDxZXO2w/ngJ9XX3bwrUDmZ3Oe0BeKXFVlGRr7o0=
X-Received: by 2002:a6b:d60c:: with SMTP id w12mr2699391ioa.105.1617204490851; 
 Wed, 31 Mar 2021 08:28:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210331103612.654261-1-bmeng.cn@gmail.com>
In-Reply-To: <20210331103612.654261-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 31 Mar 2021 11:26:01 -0400
Message-ID: <CAKmqyKNrWQnFQ9czZOgV8EYSddEN1dH71LVgTCt9j0Nw+KECbw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: sifive_e: Add 'const' to sifive_e_memmap[]
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Emmanuel Blot <eblot.ml@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
X-List-Received-Date: Wed, 31 Mar 2021 15:28:14 -0000

On Wed, Mar 31, 2021 at 6:36 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> This was accidentally dropped before. Add it back.
>
> Reported-by: Emmanuel Blot <eblot.ml@gmail.com>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Thanks!

Applied to riscv-to-apply.next

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

