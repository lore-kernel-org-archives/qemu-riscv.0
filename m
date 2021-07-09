Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1hZ0-0003hx-Ki
	for mharc-qemu-riscv@gnu.org; Thu, 08 Jul 2021 23:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m1hYz-0003fz-GM; Thu, 08 Jul 2021 23:52:29 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:40640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m1hYx-0001OM-W9; Thu, 08 Jul 2021 23:52:29 -0400
Received: by mail-io1-xd36.google.com with SMTP id l5so10891791iok.7;
 Thu, 08 Jul 2021 20:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FW1yrI4pHTh1eq2Z1nXQViayvoWE6bFysOqUtsjOJkk=;
 b=SdpqbR0kase9UbGPlKOiltBNYREtNzBJHf9t2RA7OD53eIjT/AbhkXJXWQRDSnddRX
 mfEHst/SNziUt3Fdz8UNqKv0+wLiYjaWxEiUEmQL8Tu2jV58knva7Ly/mHwJuLaUNCFv
 KTmPfBRVNSxaH2Q4KKs/U47t8Upp5EzCiFsod/EB56OESeDMvOgtHB3ZLcktoQoN/YSt
 vpq3YHiMErBTSzu1jv3XNDFYvIiLX6wI5axTobGSKjjfVks5fulA5cyM2IWQg8Iv/iAT
 apT37LmtOHCOywJFN2MH2NxMfR6l+cjweQcmbA3WThYthO1MReo9Ft5Ext1NEfUfSEc5
 Aujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FW1yrI4pHTh1eq2Z1nXQViayvoWE6bFysOqUtsjOJkk=;
 b=p6wKMu7OIIp3zAAfrgZ/JkOCvbln6gHx7hNq0pBAqoFinJuUKgQa/+GYI3/f9L2/Jc
 v8j9VXQygNIrsMl5qBPYtRsTPz9V62mzvWBbBXmsnNQV41Mo6ltIpCaVaEr4gjRcbYRF
 JJsAXS2gy0cL8L6h0qdtfVeKcORb1I40mTlaGvlayraZbFQRcCj7TeX2r8ldgYojddo9
 ax6SXlNyxju69RZpFQf/b2fM20ODEjqfYA8jEqIMDgTzkpGq7Lf3shn0Wous9+dCgMaU
 T154qB0oONxuTHg0wiAba58mWwyJrkIw77QJv7jncdxl1ef+Y1o+5zUxZBnwhZ6kgo5A
 fAWg==
X-Gm-Message-State: AOAM5317ippvrAOaCWhBI3zj43jL4QHdgFbaCRTFuhWf2fN5aRxVoMD9
 tkBOapnS6BgvrlxHGDAJYW3R0Q366yn76l0J1uk=
X-Google-Smtp-Source: ABdhPJyLLxeu+FeCNe0GdE5vEjtf3gcaD2eZw9QOt5zRvudEa8fqFnSeS2lOSChY0Y+M7rNv1SoT+G05bBjkIGV100s=
X-Received: by 2002:a6b:7905:: with SMTP id i5mr27220888iop.175.1625802746345; 
 Thu, 08 Jul 2021 20:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210708143319.10441-1-bmeng.cn@gmail.com>
In-Reply-To: <20210708143319.10441-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 9 Jul 2021 13:52:00 +1000
Message-ID: <CAKmqyKNTuOB=7UV9GsO5exvbcgqv7Wo0iGum1oz+zLfph1x7kA@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: sifive_u: Make sure firmware info is 8-byte
 aligned
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
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
X-List-Received-Date: Fri, 09 Jul 2021 03:52:29 -0000

On Fri, Jul 9, 2021 at 12:33 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Currently the firmware dynamic info (fw_dyn) is put right after
> the reset vector, which is not 8-byte aligned on RV64. OpenSBI
> fw_dynamic uses ld to read contents from 'struct fw_dynamic_info',
> which expects fw_dyn to be on the 8-byte boundary, otherwise the
> misaligned load exception may happen. Fortunately this does not
> cause any issue on QEMU, as QEMU does support misaligned load.
>
> RV32 does not have any issue as it is 4-byte aligned already.
> Change to make sure it is 8-byte aligned which works for both
> RV32 and RV64.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/sifive_u.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 273c86418c..4d99566e62 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -599,10 +599,10 @@ static void sifive_u_machine_init(MachineState *machine)
>      }
>
>      /* reset vector */
> -    uint32_t reset_vec[11] = {
> +    uint32_t reset_vec[12] = {
>          s->msel,                       /* MSEL pin state */
>          0x00000297,                    /* 1:  auipc  t0, %pcrel_hi(fw_dyn) */
> -        0x02828613,                    /*     addi   a2, t0, %pcrel_lo(1b) */
> +        0x02c28613,                    /*     addi   a2, t0, %pcrel_lo(1b) */
>          0xf1402573,                    /*     csrr   a0, mhartid  */
>          0,
>          0,
> @@ -610,6 +610,7 @@ static void sifive_u_machine_init(MachineState *machine)
>          start_addr,                    /* start: .dword */
>          start_addr_hi32,
>          fdt_load_addr,                 /* fdt_laddr: .dword */
> +        0x00000000,
>          0x00000000,
>                                         /* fw_dyn: */
>      };
> --
> 2.25.1
>
>

