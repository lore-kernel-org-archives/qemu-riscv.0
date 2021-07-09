Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m1iKu-0003mz-CH
	for mharc-qemu-riscv@gnu.org; Fri, 09 Jul 2021 00:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m1iKo-0003k3-Eo; Fri, 09 Jul 2021 00:41:55 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:40520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m1iKm-00013v-S6; Fri, 09 Jul 2021 00:41:54 -0400
Received: by mail-il1-x12f.google.com with SMTP id g3so8985308ilj.7;
 Thu, 08 Jul 2021 21:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=krTryoSyT66RTMkeZeD5wOuwdaEU7P+yqEXE2VfaUA0=;
 b=T9xhmw5m3S7RwacxnYB9r4KMgEDxSMqgVJ80wG4yemwf3lPjydevlwOYueacYsEwEO
 WLhE022gwsGkzE1ncIg0aHV+5x2lPtJc5K3guIEbm+kTpBiJefyLsQyFH2zaJZ8retsT
 SePE3HpgSBsf79BI7h26OodxtOvPwThA7DUK+q1Y+VmYqQ5yLxwIcd7mTTVzegHRAqFI
 I8DmE8asn+auvDrBMuZxCbXqKQ5msCU9s6SBYYLJFr9/GKyOLoZgoQpbWr7cFO5N/bhp
 HCbBp3LovEWmMkjLLYnW9vMnN1YuI/B2PVNBhTKU3hCwnuWX5oDPh95CRLNEi0Hwelo4
 O8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=krTryoSyT66RTMkeZeD5wOuwdaEU7P+yqEXE2VfaUA0=;
 b=Vv/m+kR9Adcy9lcG9sOr3HVd8VDo/KbZX1nBZpopSouX1gmjYylIthUT3pMjBSlupH
 hQQp5nE10PhZUm5onmQUHSqRKoPaDO6+kmZ1j4JSo9zQgizZRBbJ5h/+fFefQD24Gvr0
 NLYh3jfiSU97fe8F+zc3MSCO+Ok59pMPxNuNo8IbNYxjppIdcfma8uC80vSGUPKAvqjj
 QesezJ2tKLIZeVZWBdU61mGitPJSbgXhhmWmXSOAQ86qeTVsAfH+dStZfX3CxEDhZ55P
 Sb0Om2KnjMTViWek0k+b8J0QxlU2SG7N7k6Nl9qOBmnxOx8a0YyJ4n8xEPU3jNJfoVbQ
 z0pw==
X-Gm-Message-State: AOAM530mk0jzuqYRu5rQ+DDaKDoB/ajIkFti0qpU+xs6RbOAIJuceuPO
 ewZk6oAap4+Qk73BgIo4mUfNIMmA3fc98kOiw9M=
X-Google-Smtp-Source: ABdhPJzlxTGl+3KvSStJj7R9eiWuHAjZUI5MzgkAEa8wIDnxU0OgDhRGZ2d0r0peLgiZpRB8ex/+OrLChMKtQZNR1P0=
X-Received: by 2002:a05:6e02:1ba9:: with SMTP id
 n9mr25344003ili.267.1625805711400; 
 Thu, 08 Jul 2021 21:41:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210708143319.10441-1-bmeng.cn@gmail.com>
In-Reply-To: <20210708143319.10441-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 9 Jul 2021 14:41:25 +1000
Message-ID: <CAKmqyKOLKOtiY4asmvHx0bepDw7OUZHkD+HM6Yoqs__EXHVxDw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: sifive_u: Make sure firmware info is 8-byte
 aligned
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12f.google.com
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
X-List-Received-Date: Fri, 09 Jul 2021 04:41:59 -0000

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

Thanks!

Applied to riscv-to-apply.next

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

