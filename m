Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9x0S-0001W0-2v
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 17:31:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9x0L-0001RN-Ag; Tue, 18 Jan 2022 17:31:05 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=39626
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9x0J-0003q0-QK; Tue, 18 Jan 2022 17:31:04 -0500
Received: by mail-io1-xd2f.google.com with SMTP id v6so488009iom.6;
 Tue, 18 Jan 2022 14:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+JKTk3YOjYz+VEDbbEfuQUHuhMtlZtKiIW41PV7p8nw=;
 b=ftkhMbIIy/KuBPUYdh2hlaXgs0IxMuxiYhBOFlMNHn/lLnzUreVYUW4xJqDYwY3OAa
 c7ERHRoZoJWVXnstX1klfpk2F+5Y0o/u78ZyRYQRnikxVdUJ7Igy1bIfRlnilKCTX6M9
 ljx8OQfrvvfPSrZazBlx0d9ysgHIQnULDsFWnmg3XLtdXzByPJqCzpfDxc5dBQYo6TAP
 mYDZZdsjt8qMRLp0EXkU4DGHiXi5BcWdI9Ku40M/tv+gtVIUw+AwvpPL0n1aj0dUtXXE
 QIPIbsTyVMaXOU81ghzMwm4MekH3Dpps3KZ0ZtnvuXutpvtjfkuajBQ5xjT22B6w9JO0
 m5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+JKTk3YOjYz+VEDbbEfuQUHuhMtlZtKiIW41PV7p8nw=;
 b=NaQ9gY9kgTatBm16xoN3LQtjyrWsthi/WUc9H0Uh5AyGL2a52h9bJ/HpGyOTlU6C39
 l1bSQr2Da9PwxPXWQGT048oRoTEMFjzLj4ZMlhr1XYMqNoEtaaFirSdlpicTIYrvDpqg
 bM7HPnfUaE0CIKaG8EsasdRmgnI0rzc8o81/L5vcvT3Sz+oUVw7r4b33dLF7oc4iQP1G
 Ofvc8AQNYy3M0kMdDHXhltbwuBRTXfJoCDLW2BVr4eqCsOwmI/Yc+lzT8nmr/BupbE3f
 4kK8VLi0Q54Ql3b7jsPkhfbxwiw6TH3b1PRd06ushqgEEpc6hriB0rwCTf1BWTLbAtO1
 tiEw==
X-Gm-Message-State: AOAM532Im1ufPuWnF0rRNqaYCWEU1yqrXYZEPeCIvooxHC9tnlrG/pHK
 /dvhgJqp3+8SuRvh4muxJ1BRwVD8O1t+XEJVNO4=
X-Google-Smtp-Source: ABdhPJwDDsMQ3f3imJaIW/edngQ1Tu6cg8ra8RhbDAR3s34KGs+r8oJ3NCjyrbzI5ddl5XqJdM2xEsRfP0SYxNZK09M=
X-Received: by 2002:a02:7702:: with SMTP id g2mr13681248jac.206.1642545060883; 
 Tue, 18 Jan 2022 14:31:00 -0800 (PST)
MIME-Version: 1.0
References: <20220118111736.454150-1-apatel@ventanamicro.com>
 <20220118111736.454150-3-apatel@ventanamicro.com>
In-Reply-To: <20220118111736.454150-3-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 19 Jan 2022 08:30:35 +1000
Message-ID: <CAKmqyKMw43TpSdjB4OdSAEbs8X6yYD7dQp8n3N4uV7Pi1zbjjw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/riscv: Remove macros for ELF BIOS image names
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Anup Patel <anup@brainfault.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 18 Jan 2022 22:31:05 -0000

On Tue, Jan 18, 2022 at 9:18 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Now that RISC-V Spike machine can use BIN BIOS images, we remove
> the macros used for ELF BIOS image names.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/spike.c        | 4 ++--
>  include/hw/riscv/boot.h | 2 --
>  2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index 597df4c288..d059a67f9b 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -260,11 +260,11 @@ static void spike_board_init(MachineState *machine)
>       */
>      if (riscv_is_32bit(&s->soc[0])) {
>          firmware_end_addr = riscv_find_and_load_firmware(machine,
> -                                    RISCV32_BIOS_ELF, memmap[SPIKE_DRAM].base,
> +                                    RISCV32_BIOS_BIN, memmap[SPIKE_DRAM].base,
>                                      htif_symbol_callback);
>      } else {
>          firmware_end_addr = riscv_find_and_load_firmware(machine,
> -                                    RISCV64_BIOS_ELF, memmap[SPIKE_DRAM].base,
> +                                    RISCV64_BIOS_BIN, memmap[SPIKE_DRAM].base,
>                                      htif_symbol_callback);
>      }
>
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index baff11dd8a..d486392cd0 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -25,9 +25,7 @@
>  #include "hw/riscv/riscv_hart.h"
>
>  #define RISCV32_BIOS_BIN    "opensbi-riscv32-generic-fw_dynamic.bin"
> -#define RISCV32_BIOS_ELF    "opensbi-riscv32-generic-fw_dynamic.elf"
>  #define RISCV64_BIOS_BIN    "opensbi-riscv64-generic-fw_dynamic.bin"
> -#define RISCV64_BIOS_ELF    "opensbi-riscv64-generic-fw_dynamic.elf"
>
>  bool riscv_is_32bit(RISCVHartArrayState *harts);
>
> --
> 2.25.1
>
>

