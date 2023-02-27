Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWdZT-00089M-T5
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 08:29:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pWdZS-00087z-7h
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 08:29:38 -0500
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pWdZQ-0006PN-AM
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 08:29:37 -0500
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-172b0ba97b0so7363550fac.4
 for <qemu-riscv@nongnu.org>; Mon, 27 Feb 2023 05:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bFKX7uAB4jLCTeGxTHbDBMKYV0vmzbPvTCN9e12gQT0=;
 b=e7Pkq+daKZyFunxnLPbDCCoY6Ew9Pb7ZKHY/FZH9eqMofkZ4JtuEo4wKZMZsjA5nlG
 dHGxsVfmux18Xy5uIo+Yy6yQecvWWrnaNyRUiTEEod1sGLL4Qb2YrCglD+PEN9m9vs2J
 R5itxQCviQQYKV7hwvPSWYvfpx5IzEkR06Ogxo4D4BEe11NXc+ZZVEXNuKiv0TqPPL61
 1LmOe8W32Ri3izf8WYk3vBFobcS0OqG3zsiWB2z42roY1Lp3IHS/5ig48cINrlzFzDRn
 y3BAQknVEPjjdIL0GRzE9gE+UT2TuhDMIe2yPSBja7Ed8hlYzGR58HNU7yzBhPNYf2ZZ
 RLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bFKX7uAB4jLCTeGxTHbDBMKYV0vmzbPvTCN9e12gQT0=;
 b=X0M1u++cHadEJtFRNbP9JDVg2XMgdMot12fFc+JIJfxAImgG9J4ZOSfyBc7ltvu2D2
 ppnxPFaFWTh+CaEG900XmnGDnDWw/QfIkdkY2XDl4v7lb926yf81yhUZWqEruf0fTuix
 ZpzFSNYWmv+ZUJY26Zj4KIyGoEHZg/CdX5zHtgZlcMANRdc/GAQvFUcbCD7uIKi07ONt
 S1c3xaY3MIeawHc/DbUK3gSMtqV5e4OzAM6n2/71tMwUlWchBYSzXUl0/vmYF8a8Jq7f
 wE932VZmnkZOA7LXatD1Vv1OGjx1zHvxNF17CUM0EF3UntXzGL/7ig0S/bvdUZQ/7ViW
 f5Cw==
X-Gm-Message-State: AO0yUKVKc6oLpM7GI6lFJ1qqJrX3Qj3cJ55N1MwNceHD1u5MwCVwaZi3
 BCAxeLyHMIpjdisbPFE42prTYQ==
X-Google-Smtp-Source: AK7set8O+uaBdPivtA7Bi9OsRBLohr3uYXOOfh0EjDxXw/LjfXE/81uvX9Vj07btYJkQQB6o0lg41w==
X-Received: by 2002:a05:6871:b25:b0:16e:11f0:79e9 with SMTP id
 fq37-20020a0568710b2500b0016e11f079e9mr19006689oab.18.1677504574861; 
 Mon, 27 Feb 2023 05:29:34 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a4ac4cc000000b005250c840e64sm2640459ooq.3.2023.02.27.05.29.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 05:29:34 -0800 (PST)
Message-ID: <9450e987-13ee-449a-0726-f99662372268@ventanamicro.com>
Date: Mon, 27 Feb 2023 10:29:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] hw/riscv: Fix the bug of maximum size limit when put
 initrd to RAM
Content-Language: en-US
To: Hang Xu <xuhang@eswincomputing.com>, qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bmeng@tinylab.org, philmd@linaro.org
References: <20230227023916.7374-1-xuhang@eswincomputing.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230227023916.7374-1-xuhang@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
X-List-Received-Date: Mon, 27 Feb 2023 13:29:38 -0000

Hi,

On 2/26/23 23:39, Hang Xu wrote:
> The space available for initrd is "ram_size + ram_base - start"
> instead of "ram_size - start"
> 
> Signed-off-by: Hang Xu <xuhang@eswincomputing.com>
> ---
>   hw/riscv/boot.c            | 8 +++++---
>   hw/riscv/microchip_pfsoc.c | 2 +-
>   hw/riscv/sifive_u.c        | 2 +-
>   hw/riscv/spike.c           | 2 +-
>   hw/riscv/virt.c            | 2 +-
>   include/hw/riscv/boot.h    | 3 ++-
>   6 files changed, 11 insertions(+), 8 deletions(-)

You'll need to rebase this patch with current master. riscv_load_initrd() is a static
function inside target/riscv/boot.c since 8b64475bd529, which landed upstream today.

One more thing:

> 
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index c7e0e50bd8..749dba5360 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -209,7 +209,8 @@ target_ulong riscv_load_kernel(MachineState *machine,
>       exit(1);
>   }
>   
> -void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
> +void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry,
> +                       uint64_t mem_base)
>   {
>       const char *filename = machine->initrd_filename;
>       uint64_t mem_size = machine->ram_size;
> @@ -231,10 +232,11 @@ void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry)
>        * the initrd at 128MB.
>        */
>       start = kernel_entry + MIN(mem_size / 2, 128 * MiB);
> +    uint64_t max_size = mem_size + mem_base - start;
>   
> -    size = load_ramdisk(filename, start, mem_size - start);
> +    size = load_ramdisk(filename, start, max_size);


I don't understand this logic. If we want initrd to be loaded at 'start', and we have a
total amount of RAM of mem_size (since it's == machine->ram_size), then the initrd can't
really be bigger than mem_size - start.

It would help if you can clarify a bit more on what's the initrd maximum size limit bug
you're seeing. There is a chance that the problem is with how we're calculating 'start'.


Thanks,

Daniel




>       if (size == -1) {
> -        size = load_image_targphys(filename, start, mem_size - start);
> +        size = load_image_targphys(filename, start, max_size);
>           if (size == -1) {
>               error_report("could not load ramdisk '%s'", filename);
>               exit(1);
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index 2b91e49561..965d155fd3 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -632,7 +632,7 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>           kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
>   
>           if (machine->initrd_filename) {
> -            riscv_load_initrd(machine, kernel_entry);
> +            riscv_load_initrd(machine, kernel_entry, memmap[MICROCHIP_PFSOC_DRAM_LO].base);
>           }
>   
>           if (machine->kernel_cmdline && *machine->kernel_cmdline) {
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index d3ab7a9cda..aa5d5bc610 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -601,7 +601,7 @@ static void sifive_u_machine_init(MachineState *machine)
>           kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
>   
>           if (machine->initrd_filename) {
> -            riscv_load_initrd(machine, kernel_entry);
> +            riscv_load_initrd(machine, kernel_entry, memmap[SIFIVE_U_DEV_DRAM].base);
>           }
>   
>           if (machine->kernel_cmdline && *machine->kernel_cmdline) {
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
> index cc3f6dac17..729f6f91fd 100644
> --- a/hw/riscv/spike.c
> +++ b/hw/riscv/spike.c
> @@ -309,7 +309,7 @@ static void spike_board_init(MachineState *machine)
>                                            htif_symbol_callback);
>   
>           if (machine->initrd_filename) {
> -            riscv_load_initrd(machine, kernel_entry);
> +            riscv_load_initrd(machine, kernel_entry, memmap[SPIKE_DRAM].base);
>           }
>   
>           if (machine->kernel_cmdline && *machine->kernel_cmdline) {
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index b81081c70b..2342de646e 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1280,7 +1280,7 @@ static void virt_machine_done(Notifier *notifier, void *data)
>           kernel_entry = riscv_load_kernel(machine, kernel_start_addr, NULL);
>   
>           if (machine->initrd_filename) {
> -            riscv_load_initrd(machine, kernel_entry);
> +            riscv_load_initrd(machine, kernel_entry, memmap[VIRT_DRAM].base);
>           }
>   
>           if (machine->kernel_cmdline && *machine->kernel_cmdline) {
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index 511390f60e..14db53ef13 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -46,7 +46,8 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
>   target_ulong riscv_load_kernel(MachineState *machine,
>                                  target_ulong firmware_end_addr,
>                                  symbol_fn_t sym_cb);
> -void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry);
> +void riscv_load_initrd(MachineState *machine, uint64_t kernel_entry,
> +                       uint64_t mem_base);
>   uint64_t riscv_compute_fdt_addr(hwaddr dram_start, uint64_t dram_size,
>                                   MachineState *ms);
>   void riscv_load_fdt(hwaddr fdt_addr, void *fdt);

