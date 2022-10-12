Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oiTvW-0005tw-EM
	for mharc-qemu-riscv@gnu.org; Wed, 12 Oct 2022 01:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oiTvT-0005qB-KU; Wed, 12 Oct 2022 01:05:03 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:37815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oiTvQ-0007QA-Tw; Wed, 12 Oct 2022 01:05:03 -0400
Received: by mail-pf1-x42a.google.com with SMTP id 3so13929444pfw.4;
 Tue, 11 Oct 2022 22:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IgqjnJM3hucQ5z5R5Tux/MUljENLke8o3wZRLJ7zrnk=;
 b=JfCAsm/hE59u7/fMceJaFJ//rSrSLjJRh2vGqvv4ZmF41VqkYSxtz6NNa/wWbneqiE
 kB3EbYLhl0P1qpOm3P6qCOD+SSDx+x+o1isHiRIv3FR2VpO+VOyyE5mwQiGUIZ53m6/k
 u++nWSWusIweIZsOybliD9BH8nva0L3lDwpH91i5WQYLiee8sLkJUmx93lzREPbE//cq
 nzxA2alOZ8d7QKXURiu1rwkTxEClichxF211guRNsvRqZ5DptzBdQehnl0e0EtNu49Gh
 7uMS7Dqxsh0nn9nB+rpgKumSBvr54YvwfkUY5Otio0msT3qJvSKp0nXbDINiomB38F1b
 fIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IgqjnJM3hucQ5z5R5Tux/MUljENLke8o3wZRLJ7zrnk=;
 b=rn1tUEl+PVFRnDGRULJEbzTWSa+4KkNp5iqNyev64J0JiqYnypnEsOIwqmIrDZOz8R
 uGAYFLA1nGYA2V2ArNakhoPG8BC9kWeBvbnoFr6nETwJyFKkv6sLYU2CaH79fV3wYQeR
 X/jEY2Gl79MHpfwzOCXTM82WLS5f4q8N0ohCp47KL53qMdqjvPMtYlOC1TaY9slcmEXP
 p9zzd/lgBvcl+/MYdz+5B9+OX5pCtNLyoxWhp37U7BBtGOTnqWXPDHDhQr2K9LH4cBnk
 zexYD/o7RB+5MlPCDDy9XFatK5t87vAe+ywPXXMaJBX2MHibw5m9TGUpduj70wQP0dAX
 939g==
X-Gm-Message-State: ACrzQf1ATLd3A2hM10WXFIJ4d1iDtpIiRLaH1VbuzfDo8bZNIEd9lkB+
 E4BQAQUGYz2/FtAGmDbjw5OHx1moumnFkbTmFINSV5+3Prk=
X-Google-Smtp-Source: AMsMyM5vsIlRKAhck8/9NOQvZ+Kv5LTQJT9vskSSTP29A66Q64z4TXnZO2C7peCZA5pVzWkTp12IOPzLD38gyFaZvc8=
X-Received: by 2002:a63:ce43:0:b0:45b:d6ed:6c2 with SMTP id
 r3-20020a63ce43000000b0045bd6ed06c2mr23789884pgi.406.1665551099406; Tue, 11
 Oct 2022 22:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221011204645.1160916-1-Jason@zx2c4.com>
 <20221011204645.1160916-4-Jason@zx2c4.com>
In-Reply-To: <20221011204645.1160916-4-Jason@zx2c4.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 12 Oct 2022 15:04:33 +1000
Message-ID: <CAKmqyKMYPcf+T4BtGGnUHXoUWBptwuMzUH5-Lwe1XmS5c+QgZw@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] riscv: re-randomize rng-seed on reboot
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42a.google.com
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
X-List-Received-Date: Wed, 12 Oct 2022 05:05:04 -0000

On Wed, Oct 12, 2022 at 6:55 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> When the system reboots, the rng-seed that the FDT has should be
> re-randomized, so that the new boot gets a new seed. Since the FDT is in
> the ROM region at this point, we add a hook right after the ROM has been
> added, so that we have a pointer to that copy of the FDT.
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: qemu-riscv@nongnu.org
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/boot.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 1ae7596873..aaecf21543 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -30,6 +30,7 @@
>  #include "sysemu/device_tree.h"
>  #include "sysemu/qtest.h"
>  #include "sysemu/kvm.h"
> +#include "sysemu/reset.h"
>
>  #include <libfdt.h>
>
> @@ -241,6 +242,8 @@ uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
>
>      rom_add_blob_fixed_as("fdt", fdt, fdtsize, fdt_addr,
>                            &address_space_memory);
> +    qemu_register_reset(qemu_fdt_randomize_seeds,
> +                        rom_ptr_for_as(&address_space_memory, fdt_addr, fdtsize));
>
>      return fdt_addr;
>  }
> --
> 2.37.3
>
>

