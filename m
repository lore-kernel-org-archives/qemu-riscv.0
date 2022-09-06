Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVSsi-0004DY-V7
	for mharc-qemu-riscv@gnu.org; Tue, 06 Sep 2022 03:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oVSsW-0004Ab-1J
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 03:20:13 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:34632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oVSsS-0000uR-Ia
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 03:20:11 -0400
Received: by mail-ed1-x534.google.com with SMTP id z21so3880560edi.1
 for <qemu-riscv@nongnu.org>; Tue, 06 Sep 2022 00:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=uU5yxb2ZcfvP1uB8VXcw5BlORKFuwNRzwiM9VJJMGZc=;
 b=R7d/sPCcQRs6fMPyVQjKRKqxOVTtNzH1sH0RHEr9VEwmKDGlSrVnGKxcYkHXR+dF1z
 KosAUHQw+CpmYqupmfPyjxz4qr3ANXXh0x2HRAs5b3oKwe5jAplpPLiw6UtCETfTeuiE
 wW53Q42mk5r3R5RzLdOkvtCoyc3EiLoDc490nRzIF5KdVJ7qyKykhbcSOu73VMvXviwz
 cd3s8u8uQ/q7Llmq7MQ2q1SkhWy31RRRuXvLVxlEQ6SAApkjnlcwn/8tWDyDPJC+sxn9
 lO6wqD9syCNGJsl3kXO7cahYMPK7sxzAaDqwDhcRHQRg65c+R/baG4uJ5w6dneLbuqPy
 R+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=uU5yxb2ZcfvP1uB8VXcw5BlORKFuwNRzwiM9VJJMGZc=;
 b=QlipfzM8LapC9hK9DYmZCLnxK7KO5xDj3iVwOSii6kDDSaplSx/Q36at/shEgPwjaA
 w139Ihx+SCo/X6L+D3BquJqt+ZA0CsbihiLqlFSAmKr1uFprcqFBFSueOqMvkS2/FFvm
 /dJEVqpjO/fv6TUfj1GQYCczc4BFbCtpFxTk3iEgqvYeS3t3/+9zutatpGEaSnLflKQ8
 fhdI+DraEqyEABssZa2uK/GGRKOa624wPUxB8Rwl3cdQlRXxlSlWYi0GvShDf2Eb6jsR
 MwZsRss0DEKtrdEu822loRLLXkWBCojD+V+Mwy56KSfcg56uUHToKPsY9H8McKk9tBwK
 cA0Q==
X-Gm-Message-State: ACgBeo2rln0+H1TMUipPNohdq0EBpOXBj1HXYdbXcDt9RneP0/ZjfNQh
 Wd98Kg9wkBBVxirwulFcJGq+XQ==
X-Google-Smtp-Source: AA6agR6r/WqLW4TZWWYjhzcTfJv+A/2uyItILI2UeeINDierik05S1gkNiJhBMBBBkZACoBsf44WaQ==
X-Received: by 2002:a05:6402:3506:b0:43e:954b:bc8a with SMTP id
 b6-20020a056402350600b0043e954bbc8amr47369697edd.266.1662448800925; 
 Tue, 06 Sep 2022 00:20:00 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a1709066bcd00b0073d5a8a2bfcsm6077560ejs.221.2022.09.06.00.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 00:20:00 -0700 (PDT)
Date: Tue, 6 Sep 2022 09:19:58 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Song Gao <gaosong@loongson.cn>, Gerd Hoffmann <kraxel@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH V3 3/3] hw/riscv: virt: Enable booting S-mode firmware
 from pflash
Message-ID: <20220906071958.fiwqbwnkofk4kqye@kamzik>
References: <20220906042451.379611-1-sunilvl@ventanamicro.com>
 <20220906042451.379611-4-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906042451.379611-4-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 06 Sep 2022 07:20:15 -0000

On Tue, Sep 06, 2022 at 09:54:51AM +0530, Sunil V L wrote:
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
> ---
>  hw/riscv/boot.c         | 28 ++++++++++++++++++++++++++++
>  hw/riscv/virt.c         | 17 ++++++++++++++++-
>  include/hw/riscv/boot.h |  1 +
>  3 files changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 1ae7596873..39436b8d56 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -338,3 +338,31 @@ void riscv_setup_direct_kernel(hwaddr kernel_addr, hwaddr fdt_addr)
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

blank line

> +        if (machine->kernel_cmdline) {
> +            fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE,
> +                           strlen(machine->kernel_cmdline) + 1);
> +            fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA,
> +                              machine->kernel_cmdline);
> +        }
> +    }
> +}
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index b6bbf03f61..b985df9b16 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1258,7 +1258,22 @@ static void virt_machine_done(Notifier *notifier, void *data)
>      s->fw_cfg = create_fw_cfg(machine);
>      rom_set_fw(s->fw_cfg);
>  
> -    if (machine->kernel_filename) {
> +    if (drive_get(IF_PFLASH, 0, 1)) {
> +        /*
> +         * S-mode FW like EDk2 will be kept in second plash (unit 1). When

edk2 or EDK2

> +         * both -kernel and -pflash options are provided in command line,
                                                              ^ the
> +         * the kernel, initrd will be copied to fw_cfg table and opensbi
                        ^                         ^ the
                        ^ replace, with ' and'
                       
> +         * will jump to flash address which is the entry point of S-mode FW.
                          ^ the
> +         * It is the job of the S-mode FW to load the kernel/initrd and launch.
> +         *
> +         * If only pflash is given but not -kernel, then it is the job of
> +         * of the S-mode firmware to locate and load the kernel.
> +         * In either case, the next_addr for opensbi will be the flash address.
> +         */
> +        riscv_setup_firmware_boot(machine);
> +        kernel_entry = virt_memmap[VIRT_FLASH].base +
> +                         virt_memmap[VIRT_FLASH].size / 2;
                          ^
                          Please line up the lower virt_memmap[] with the upper

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

Besides the whitespace and comment edits

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

