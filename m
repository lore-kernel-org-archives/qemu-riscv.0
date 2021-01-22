Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l33tx-0003jn-6n
	for mharc-qemu-riscv@gnu.org; Fri, 22 Jan 2021 16:23:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l33tu-0003iP-8w; Fri, 22 Jan 2021 16:23:26 -0500
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:45892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l33ts-0002az-M6; Fri, 22 Jan 2021 16:23:26 -0500
Received: by mail-io1-xd35.google.com with SMTP id p72so14055447iod.12;
 Fri, 22 Jan 2021 13:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qgNwJwfcg3OEAnF8uUu7GFzzYY6fkaKwmAll0Ov8Evg=;
 b=fH69M5IBXaFgHFrGh2ixRPO1oTxOL4IWnyh7RZ321CzJdZykEDunHdG2X8IxH+W+qy
 2BBZSAm4x6pWuPVriGyOqHU45Q+c8psH1SzB6ct97tAtgYiK7G1u45yn0LHH/4SXzgrC
 clClL9rGZ5nZvn1BG7P7OjRVbzEPKYhWuPIEv9lPcrXAyJykaeXIxONynEjsoRLPEIHW
 NMYYe7+oDlUYOOJfcFqs6vr37YKQjvQhpC7/jFl9juK2jGS9gx+SL/d9LJUF+K9Xhk+W
 /r9gkZEeAcEmk0v+bpSmbAZn+RIrNoy5CH83dSEDnp2/dGPV4jYCVRA1eLZEBRk4JfDk
 JD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qgNwJwfcg3OEAnF8uUu7GFzzYY6fkaKwmAll0Ov8Evg=;
 b=JvmiSEMCDgYpYck6VoG56NMY+DyiJ7cz59c5ZI/i3XarAuUhvfjzqwOKoyixVBYwa8
 wee9mua4RYeI/hir6o/59SyTKb17R5em3Hh3GFMBSk/PwUDKMr59OBL6LGeZhg70X6qC
 A4sdQfSN9IQQCI0oY91kmVxOFP2OQ+8w9toplEXmM7Nhl+3uRaUg3tRdBv8S0ajpGgnt
 fi1qiaJyAJdhHE83Z2EIsb9Fnndm+F6obURU7ZoWTx6J4ZE0CrnDGhokT/tDXQPL+h2a
 bAXhEypfcuvAvcSGs9KAHDtjB8aNeaGmeAr2N8Kju+D5FegOVcy2b1Mx4DJIAK3a1P5R
 1Jiw==
X-Gm-Message-State: AOAM531PrBpc/3GJR7zDjM1W/lYBIzGm3n0Cu6yXm+Ww6gZAdrtVJC+F
 mRbICvwBQyauSy0oPVu8IDnw6rKVnP4yoOVFE8I=
X-Google-Smtp-Source: ABdhPJzckLpYnrDpBM0s00IUA/eqpKX+QYOcWUOPwNffhAX4iO/w6kM437vzZ1eU+82scC2NHjfjfdB9bqiZksP5bys=
X-Received: by 2002:a6b:7d42:: with SMTP id d2mr4852532ioq.176.1611350603482; 
 Fri, 22 Jan 2021 13:23:23 -0800 (PST)
MIME-Version: 1.0
References: <20210122122958.12311-1-bmeng.cn@gmail.com>
 <20210122122958.12311-3-bmeng.cn@gmail.com>
In-Reply-To: <20210122122958.12311-3-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Jan 2021 13:22:56 -0800
Message-ID: <CAKmqyKM=FfKdQs7zQrW=a_3iA=euB0Z5JiH0h00dvZ7AQDKnPg@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/riscv: virt: Drop the 'link_up' parameter of
 gpex_pcie_init()
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Fri, 22 Jan 2021 21:23:26 -0000

On Fri, Jan 22, 2021 at 4:32 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> `link_up` is never used in gpex_pcie_init(). Drop it.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/riscv/virt.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index cfd52bc59b..1d05bb3ef9 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -449,7 +449,7 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
>                                            hwaddr ecam_base, hwaddr ecam_size,
>                                            hwaddr mmio_base, hwaddr mmio_size,
>                                            hwaddr pio_base,
> -                                          DeviceState *plic, bool link_up)
> +                                          DeviceState *plic)
>  {
>      DeviceState *dev;
>      MemoryRegion *ecam_alias, *ecam_reg;
> @@ -669,12 +669,12 @@ static void virt_machine_init(MachineState *machine)
>      }
>
>      gpex_pcie_init(system_memory,
> -                         memmap[VIRT_PCIE_ECAM].base,
> -                         memmap[VIRT_PCIE_ECAM].size,
> -                         memmap[VIRT_PCIE_MMIO].base,
> -                         memmap[VIRT_PCIE_MMIO].size,
> -                         memmap[VIRT_PCIE_PIO].base,
> -                         DEVICE(pcie_plic), true);
> +                   memmap[VIRT_PCIE_ECAM].base,
> +                   memmap[VIRT_PCIE_ECAM].size,
> +                   memmap[VIRT_PCIE_MMIO].base,
> +                   memmap[VIRT_PCIE_MMIO].size,
> +                   memmap[VIRT_PCIE_PIO].base,
> +                   DEVICE(pcie_plic));
>
>      serial_mm_init(system_memory, memmap[VIRT_UART0].base,
>          0, qdev_get_gpio_in(DEVICE(mmio_plic), UART0_IRQ), 399193,
> --
> 2.25.1
>
>

