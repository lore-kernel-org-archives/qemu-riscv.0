Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lRd3m-0001hF-VT
	for mharc-qemu-riscv@gnu.org; Wed, 31 Mar 2021 11:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRd3k-0001dF-VR; Wed, 31 Mar 2021 11:47:08 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:40509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lRd3j-0002kY-9p; Wed, 31 Mar 2021 11:47:08 -0400
Received: by mail-io1-xd2a.google.com with SMTP id e186so3052337iof.7;
 Wed, 31 Mar 2021 08:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cbf1ZPo9ScFisp+Gu2lhLLE9w6VQBrjHMovqTbo/WCM=;
 b=Z/8dQKEMScC5T3KHaZcrpR/lLKZ+KeqUwGrHz7/jPD31KEJ0nwuJfQr1XcclXm14s7
 B5cm2ALrzaWQ/Jxb2gIsf2kePPjj9OPN0Q1qseLgY/o3QlThlzCvxR4sL2MNnI2FIw+E
 FLgR2hH1400jBMFh/cDdJURncsXso0krBXynNXhO73h3r8EOF7lIcU41dxgeSH6v1DsJ
 qjaaL0M/J11/9yi0+k8hdYEH0LICgmg3JIFL3QmwMEB9HqqZsvps8vQNht5OQVpY4Q53
 pmsuWGHdGayoe+tdFJRzGtUOGGRNdiTe5elw6nYOgvZ8H6zRCfIK+iOhQQe60Oc1mgVo
 UWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cbf1ZPo9ScFisp+Gu2lhLLE9w6VQBrjHMovqTbo/WCM=;
 b=D8087dnys0H/EW2NwhKQaxUVJvvK7JpvgcF5IEH5R4gdd/Jo5M2uXnOX7cvm4t/PVa
 xRj16hZIpCMN9F/xW0VQkycwMr9rJW9uMffn4DHJiFBtXvybPK8C9zSwGG0UXnQkIv8k
 DKu4461CARcMlM+fifhAGyubBbr/mAgcr+0NuExo4rRCjgf+e6/ogr+czmQ4i8/QxtFc
 vG6d/Zvj9DMt7dzQ8yCcoOXw86JhqFPzPxq7BMBwH9POv+Y+R0LEENmQh6exHVEssuTP
 hT/6CUAr1OvY6ku2EW36k7Nl6Qi9sVTe7hftBlQM+l6XbksWoWl97glScKdUmqLeS8xP
 GNIw==
X-Gm-Message-State: AOAM531zgeZnWo2IJIwoTKd98fAGZNIMPeZEvGe6HQMyaMV3ReLAqVo6
 BbB5Uwx0uVxt0Ho6I+ReZNes8hNiQ3mHu6cgRDA=
X-Google-Smtp-Source: ABdhPJzgzQC9KLqgNCYWrIQikuPr6R81Tm+Tjzet3O+Lke+eAhuK9+ML5p59ib/3XCK4g5OijTcP/MggFoSDCnYMoJY=
X-Received: by 2002:a6b:7808:: with SMTP id j8mr2818118iom.118.1617205625755; 
 Wed, 31 Mar 2021 08:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210329170818.23139-1-bmeng.cn@gmail.com>
 <20210329170818.23139-7-bmeng.cn@gmail.com>
In-Reply-To: <20210329170818.23139-7-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 31 Mar 2021 11:44:57 -0400
Message-ID: <CAKmqyKP_P8C8dqUsWN=ynaC4nK2T_Ejqf+STMaNQunrAPuy7RA@mail.gmail.com>
Subject: Re: [PATCH 7/8] hw/riscv: Use macros for BIOS image names
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
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
X-List-Received-Date: Wed, 31 Mar 2021 15:47:09 -0000

On Mon, Mar 29, 2021 at 1:20 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> The OpenSBI BIOS image names are used by many RISC-V machines.
> Let's define macros for them.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  include/hw/riscv/boot.h | 5 +++++
>  hw/riscv/sifive_u.c     | 6 ++----
>  hw/riscv/spike.c        | 6 ++----
>  hw/riscv/virt.c         | 6 ++----
>  4 files changed, 11 insertions(+), 12 deletions(-)
>
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index 11a21dd584..0e89400b09 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -24,6 +24,11 @@
>  #include "hw/loader.h"
>  #include "hw/riscv/riscv_hart.h"
>
> +#define RISCV32_BIOS_BIN    "opensbi-riscv32-generic-fw_dynamic.bin"
> +#define RISCV32_BIOS_ELF    "opensbi-riscv32-generic-fw_dynamic.elf"
> +#define RISCV64_BIOS_BIN    "opensbi-riscv64-generic-fw_dynamic.bin"
> +#define RISCV64_BIOS_ELF    "opensbi-riscv64-generic-fw_dynamic.elf"
> +
>  bool riscv_is_32bit(RISCVHartArrayState *harts);
>
>  target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState *harts,
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 651a439528..d484ec3483 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -557,12 +557,10 @@ static void sifive_u_machine_init(MachineState *machine)
>
>      if (riscv_is_32bit(&s->soc.u_cpus)) {
>          firmware_end_addr = riscv_find_and_load_firmware(machine,
> -                                    "opensbi-riscv32-generic-fw_dynamic.bin",
> -                                    start_addr, NULL);
> +                                    RISCV32_BIOS_BIN, start_addr, NULL);
>      } else {
>          firmware_end_addr = riscv_find_and_load_firmware(machine,
> -                                    "opensbi-riscv64-generic-fw_dynamic.bin",
> -                                    start_addr, NULL);
> +                                    RISCV64_BIOS_BIN, start_addr, NULL);
>      }
>
>      if (machine->kernel_filename) {
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index cc33061f23..4f19c8acba 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -257,13 +257,11 @@ static void spike_board_init(MachineState *machine)
>       */
>      if (riscv_is_32bit(&s->soc[0])) {
>          firmware_end_addr = riscv_find_and_load_firmware(machine,
> -                                    "opensbi-riscv32-generic-fw_dynamic.elf",
> -                                    memmap[SPIKE_DRAM].base,
> +                                    RISCV32_BIOS_ELF, memmap[SPIKE_DRAM].base,
>                                      htif_symbol_callback);
>      } else {
>          firmware_end_addr = riscv_find_and_load_firmware(machine,
> -                                    "opensbi-riscv64-generic-fw_dynamic.elf",
> -                                    memmap[SPIKE_DRAM].base,
> +                                    RISCV64_BIOS_ELF, memmap[SPIKE_DRAM].base,
>                                      htif_symbol_callback);
>      }
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index d04733d97c..25e845fc78 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -676,12 +676,10 @@ static void virt_machine_init(MachineState *machine)
>
>      if (riscv_is_32bit(&s->soc[0])) {
>          firmware_end_addr = riscv_find_and_load_firmware(machine,
> -                                    "opensbi-riscv32-generic-fw_dynamic.bin",
> -                                    start_addr, NULL);
> +                                    RISCV32_BIOS_BIN, start_addr, NULL);
>      } else {
>          firmware_end_addr = riscv_find_and_load_firmware(machine,
> -                                    "opensbi-riscv64-generic-fw_dynamic.bin",
> -                                    start_addr, NULL);
> +                                    RISCV64_BIOS_BIN, start_addr, NULL);
>      }
>
>      if (machine->kernel_filename) {
> --
> 2.25.1
>
>

