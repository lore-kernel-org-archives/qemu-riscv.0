Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAgZj-0004a5-Ji
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 17:06:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAgZg-0004TL-6R; Fri, 12 Feb 2021 17:06:04 -0500
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:44182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lAgZb-00084Y-Sr; Fri, 12 Feb 2021 17:06:03 -0500
Received: by mail-il1-x12d.google.com with SMTP id y15so548423ilj.11;
 Fri, 12 Feb 2021 14:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FngmoyvQJ2rNynjbh1OxbPLU6h1gs0EfFKu5i/ft/Gg=;
 b=S4o0Omn2+AGjC7tCvFiXC4xGsyAQBRYRdpvsjbVyUd4Iq+ozdzJGHaUyP5mqSp9zgf
 7O2lD3jwGNRh5zs1KMG9tT+F/BncWNStuOIqtSd4NDrg02kA05FDNflkrwvfs8KJolOq
 jEyhIbgWVo7Qjd+zaL/Ufmn4nnRtzGbjRtsIcnPKn+pERNFADUDbSpDVJKmjzcQPF7Oo
 UTDDzQOlnGL2YsCTdQWsMNGuxYMYzHKw0IZ3QD88xQtV+98R1+N/apHvYvmSsJXHiUUb
 +MfJZNnIQOkzHIiIou7tLN3L+NrPydDx/84DVCTTEnW2OqA/S/xfxhWqXZNy50Z7TGEg
 g2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FngmoyvQJ2rNynjbh1OxbPLU6h1gs0EfFKu5i/ft/Gg=;
 b=OsT/4Z2+pMtly0Z/WiU/h9OKtLWv8drRd7CC7jKFSJshRmF8bz8rmdcWmcYfbPr7nR
 +lvvChWaNXLxIbeP0cOXjm1iaBLJWZDI2vlfb3jsK1t1WoYfAiICYIALatSf7RPfOpzO
 LymOyoo1TIv0P/JogSGZFJxURM1JS8wJYy7UiyhGBQcD6PzHPiPpxeEqvjRa2dt2u8xP
 GjiJnnhl+lIynm0XivvFj5Hoq8E7F7FbHbTwPKJASEfyobg4joOU0UEHQLKx/Sa/Brte
 RowYZwIg7FNaTelpzSweG4+l8eHMD//GWYT6HhIgZim+5rEbwOQEC5y2ofs5w3HnRAc7
 6dLQ==
X-Gm-Message-State: AOAM530aHbegs91WQjZ431glKX6b1l5NDTEwmVwHRgteXYnL3K4TxamK
 QKjgaGfyOx328vetttsrGrG/eOnR9+4ZT4RK3YQ=
X-Google-Smtp-Source: ABdhPJzwA0NcuUTorXfDXJwftQAcpQoUikt15zlHIMvPJsOtB6G9BzwjOPU7FiEEbM7b3w08r3ces3s76odsBD8SPeE=
X-Received: by 2002:a05:6e02:20e5:: with SMTP id
 q5mr3952258ilv.131.1613167557788; 
 Fri, 12 Feb 2021 14:05:57 -0800 (PST)
MIME-Version: 1.0
References: <20210122122958.12311-1-bmeng.cn@gmail.com>
In-Reply-To: <20210122122958.12311-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Feb 2021 14:05:17 -0800
Message-ID: <CAKmqyKPV4GxSe-0SijrkRXLxnJ8Ev-9_u8ML3Bk4R2d+6n598A@mail.gmail.com>
Subject: Re: [PATCH 0/4] hw/riscv: Clean-ups and map high mmio for PCIe of
 'virt' machine
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
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
X-List-Received-Date: Fri, 12 Feb 2021 22:06:04 -0000

On Fri, Jan 22, 2021 at 4:32 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This series does the following clean-ups:
> - Drop 'struct MemmapEntry'
> - virt: Drop the 'link_up' parameter of gpex_pcie_init()
>
> It also adds the following small enhancement to 'virt' machine:
> - Limit RAM size in a 32-bit system
> - Map high mmio for PCIe
>
>
> Bin Meng (4):
>   hw/riscv: Drop 'struct MemmapEntry'
>   hw/riscv: virt: Drop the 'link_up' parameter of gpex_pcie_init()
>   hw/riscv: virt: Limit RAM size in a 32-bit system
>   hw/riscv: virt: Map high mmio for PCIe

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/riscv/microchip_pfsoc.c |  9 ++---
>  hw/riscv/opentitan.c       |  9 ++---
>  hw/riscv/sifive_e.c        |  9 ++---
>  hw/riscv/sifive_u.c        | 11 +++---
>  hw/riscv/spike.c           |  9 ++---
>  hw/riscv/virt.c            | 72 ++++++++++++++++++++++++++++++--------
>  6 files changed, 73 insertions(+), 46 deletions(-)
>
> --
> 2.25.1
>
>

