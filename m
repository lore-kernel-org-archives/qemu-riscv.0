Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ohhXB-0004Pg-2A
	for mharc-qemu-riscv@gnu.org; Sun, 09 Oct 2022 21:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ohhX9-0004P8-Bn; Sun, 09 Oct 2022 21:24:43 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:33697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ohhX7-0006yr-HU; Sun, 09 Oct 2022 21:24:43 -0400
Received: by mail-pf1-x431.google.com with SMTP id w2so9604412pfb.0;
 Sun, 09 Oct 2022 18:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3g5g6jGUkpuTr7ifn4UAprGEQT/8nQOf+1wUo1onaCc=;
 b=gAA6Rh+3sjfixQV53ioL3+rJ+a1Y9t0Y+mUv46up/lIXouT+Z1GeT1CKlt9L+aZa6r
 U4BeJR4dpFTAjefBKKLV5k5AUSG9Ar/AeRQOPCIwOjOMYaX8IKfzxAoqoI8xw/J3VkIM
 x1TCQ+a9LmOT7gJftVNXMO5gHOp/TQ0T/HfOGJhzKdgMNIabV26lWOhaPzmEurlnVWmq
 KzhjwQgdj5FKgOPvt4S+VVW66VK1wDcW22wlaJg5UprsFDx20hITmbLZQBlVnEIyHcoS
 TsEnkxsPJuGAnmEd7WHC3K7NQAHRwWXpv0Pbdm38gYklYvidmTGY8AcAyJ0J2hTCUxVA
 oEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3g5g6jGUkpuTr7ifn4UAprGEQT/8nQOf+1wUo1onaCc=;
 b=OF16hyOPDNGtxO+cVnrHphJ9wR2r+UeZHzW//9J6A5ZPsOsAijJ6K07NIqN6N4sFzv
 6KRlxf+Dzn56qjl58vGd9OzmW3//ieBx0yNZMJWsd4FuC687TJXvuKBWWHxLKBgW6/ph
 WLLA8PxF3OB9h9AYim67+lEH1WgHjIG4U6JUFr/qrmY4CW7I7SonfKlVwyvGyfex3xEX
 5mXo+Q0ZQZE1a4uO7t4jINxtQEMMn++GPYmLYIrfIJxa9FkN+Hzh8n0OcHUoFqvyP/j8
 PQcp9bqVSr7lm1m0Ar+n7N+kLkco7hLT5ogl0l1rjos1tyGwxRT0MQdQ25nvaDkR6arv
 PVfw==
X-Gm-Message-State: ACrzQf1qi9zzN8wahn2FIqGlBiYU1SgiUj0O8bemWfNhZGfuZ8x43y95
 zKftdJ/Pi6i5mQhVis0WjJt51b4DUIB265bWIEQ=
X-Google-Smtp-Source: AMsMyM5sFRmlmuhQIJsTVRdR9zyrIxDueaearHVE+2wR/faSpWu37By81bFqCDNYrk7t6uu7gvIoUVC1pbPBDgO8UHg=
X-Received: by 2002:a63:ce43:0:b0:45b:d6ed:6c2 with SMTP id
 r3-20020a63ce43000000b0045bd6ed06c2mr14491765pgi.406.1665365079358; Sun, 09
 Oct 2022 18:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221004092351.18209-1-sunilvl@ventanamicro.com>
 <20221004092351.18209-4-sunilvl@ventanamicro.com>
In-Reply-To: <20221004092351.18209-4-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Oct 2022 11:24:13 +1000
Message-ID: <CAKmqyKMtqAoo2s_UOdT=WeMHxXxgHBHqP_TFVbFdfSH=_jrarQ@mail.gmail.com>
Subject: Re: [PATCH V5 3/3] hw/riscv: virt: Enable booting S-mode firmware
 from pflash
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x431.google.com
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
X-List-Received-Date: Mon, 10 Oct 2022 01:24:44 -0000

On Tue, Oct 4, 2022 at 7:28 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> To boot S-mode firmware payload like EDK2 from persistent
> flash storage, qemu needs to pass the flash address as the
> next_addr in fw_dynamic_info to the opensbi.
>
> When both -kernel and -pflash options are provided in command line,
> the kernel (and initrd if -initrd) will be copied to fw_cfg table.
> The S-mode FW will load the kernel/initrd from fw_cfg table.
>
> If only pflash is given but not -kernel, then it is the job of
> of the S-mode firmware to locate and load the kernel.
>
> In either case, update the kernel_entry with the flash address
> so that the opensbi can jump to the entry point of the S-mode
> firmware.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/boot.c         | 29 +++++++++++++++++++++++++++++
>  hw/riscv/virt.c         | 18 +++++++++++++++++-
>  include/hw/riscv/boot.h |  1 +
>  3 files changed, 47 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 1ae7596873..fa8ad27da2 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -338,3 +338,32 @@ void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr)
>          riscv_cpu->env.fdt_addr = fdt_addr;
>      }
>  }
> +
> +void riscv_setup_firmware_boot(MachineState *machine)
> +{
> +    if (machine->kernel_filename) {
> +        FWCfgState *fw_cfg;
> +        fw_cfg = fw_cfg_find();
> +
> +        assert(fw_cfg);
> +        /*
> +         * Expose the kernel, the command line, and the initrd in fw_cfg.
> +         * We don't process them here at all, it's all left to the
> +         * firmware.
> +         */
> +        load_image_to_fw_cfg(fw_cfg,
> +                             FW_CFG_KERNEL_SIZE, FW_CFG_KERNEL_DATA,
> +                             machine->kernel_filename,
> +                             true);
> +        load_image_to_fw_cfg(fw_cfg,
> +                             FW_CFG_INITRD_SIZE, FW_CFG_INITRD_DATA,
> +                             machine->initrd_filename, false);
> +
> +        if (machine->kernel_cmdline) {
> +            fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE,
> +                           strlen(machine->kernel_cmdline) + 1);
> +            fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA,
> +                              machine->kernel_cmdline);
> +        }
> +    }
> +}
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index de2efccebf..a5bc7353b4 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1274,7 +1274,23 @@ static void virt_machine_done(Notifier *notifier, void *data)
>      s->fw_cfg = create_fw_cfg(machine);
>      rom_set_fw(s->fw_cfg);
>
> -    if (machine->kernel_filename) {
> +    if (drive_get(IF_PFLASH, 0, 1)) {
> +        /*
> +         * S-mode FW like EDK2 will be kept in second plash (unit 1).
> +         * When both kernel, initrd and pflash options are provided in the
> +         * command line, the kernel and initrd will be copied to the fw_cfg
> +         * table and opensbi will jump to the flash address which is the
> +         * entry point of S-mode FW. It is the job of the S-mode FW to load
> +         * the kernel and initrd using fw_cfg table.
> +         *
> +         * If only pflash is given but not -kernel, then it is the job of
> +         * of the S-mode firmware to locate and load the kernel.
> +         * In either case, the next_addr for opensbi will be the flash address.
> +         */
> +        riscv_setup_firmware_boot(machine);
> +        kernel_entry = virt_memmap[VIRT_FLASH].base +
> +                       virt_memmap[VIRT_FLASH].size / 2;
> +    } else if (machine->kernel_filename) {
>          kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
>                                                           firmware_end_addr);
>
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index a36f7618f5..93e5f8760d 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -57,5 +57,6 @@ void riscv_rom_copy_firmware_info(MachineState *machine, hwaddr rom_base,
>                                    uint32_t reset_vec_size,
>                                    uint64_t kernel_entry);
>  void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr);
> +void riscv_setup_firmware_boot(MachineState *machine);
>
>  #endif /* RISCV_BOOT_H */
> --
> 2.25.1
>
>

