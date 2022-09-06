Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oVStG-0004fY-CQ
	for mharc-qemu-riscv@gnu.org; Tue, 06 Sep 2022 03:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oVSt4-0004di-Ud
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 03:20:48 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:40935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oVSt2-0001Gj-1b
 for qemu-riscv@nongnu.org; Tue, 06 Sep 2022 03:20:45 -0400
Received: by mail-ed1-x52e.google.com with SMTP id m1so13915208edb.7
 for <qemu-riscv@nongnu.org>; Tue, 06 Sep 2022 00:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=2Jpfz+WIB/we4TX6mXR/DxZWXuNK5/543RdUPIpixbs=;
 b=hFiM7uC3hO+t7hVUOF+IjdMhxZ4D4EPrM6folZtHmGRYzNbdWr5S6qEulK5jFkJpVs
 LXYMPFyDQt+S0oshkc6E941IInHjn27zQ7upOXxbVIJ4J94g669yO1c0QBhd4GX9khLQ
 4cxpgu4EGm+ZHUTr6+Smgvv3NqaRWOVqQrs+bjLb3/ULVK0mz8XvX0hJHmXI/gCD3VJr
 SKT8KZ+R9JQpNTnRMkmCufY8aLgQOtCZ9dv51oYNzvUjpe705K0eNGW8e+XfYxdEU0p3
 mPQR9DHGCeEpp8AaIVxTzlDdU8lu8G2leES2lXQV3Eu2cOi+kJnYoIf7O93295yYU9Wx
 UTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=2Jpfz+WIB/we4TX6mXR/DxZWXuNK5/543RdUPIpixbs=;
 b=jP9AVsa1yEIN4PgERFBnzwyQE8zqCKhcyub9wxZnGmOuSogryeO9pmAME1RKPIR22b
 wxsMjLGUNVWDIA5e/xS5t2NeAzXPeNVULTVvl0BFTTcPlE/Wnim9m1wBUVhnHVg/Xmeh
 J0yEP1MhyzGzd3O8SM34qvqZsMEylL82eY4z5XUn6SOLScX9Lq7OoJ1HlQIa3KM8gfOW
 zuQrhegs2i0ueEklFqINt0OfIQvyuKbVocQbul+26QIV2iJkvz3ranrGRhu4USRUmYyJ
 Su1rBcnn7U/RvIXbvkxrLZB5/DPWD3dhWwr8IVH17MuRmDGLU2ryRXhy9+w9M0+MrMax
 5KAQ==
X-Gm-Message-State: ACgBeo0kxuIp5aCR2pHCtzkxgXVuWD/H0NY2+IrbbGRXoIzGpKhS/Fsr
 BH8zixp/iGxhgFbdTpdLBj6dOQ==
X-Google-Smtp-Source: AA6agR4Ooeell1Rr4HyL/3AjrD2P1LSIG5SXpFEcPbDXYKQkreVTBGC/ioTnWWQYuCYjCArtAbSKqQ==
X-Received: by 2002:a05:6402:b6c:b0:44e:2faf:1ba4 with SMTP id
 cb12-20020a0564020b6c00b0044e2faf1ba4mr9720993edb.191.1662448842370; 
 Tue, 06 Sep 2022 00:20:42 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
 by smtp.gmail.com with ESMTPSA id
 dc4-20020a170906c7c400b0073bf84be798sm6110735ejb.142.2022.09.06.00.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 00:20:41 -0700 (PDT)
Date: Tue, 6 Sep 2022 09:20:40 +0200
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
Subject: Re: [PATCH V3 2/3] hw/riscv: virt: Move create_fw_cfg() prior to
 loading kernel
Message-ID: <20220906072040.rycwn7qxnhoc7sro@kamzik>
References: <20220906042451.379611-1-sunilvl@ventanamicro.com>
 <20220906042451.379611-3-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906042451.379611-3-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x52e.google.com
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
X-List-Received-Date: Tue, 06 Sep 2022 07:20:51 -0000

On Tue, Sep 06, 2022 at 09:54:50AM +0530, Sunil V L wrote:
> To enable both -kernel and -pflash options, the fw_cfg needs to be
> created prior to loading the kernel.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/riscv/virt.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index ff8c0df5cd..b6bbf03f61 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1251,6 +1251,13 @@ static void virt_machine_done(Notifier *notifier, void *data)
>                                      RISCV64_BIOS_BIN, start_addr, NULL);
>      }
>  
> +    /*
> +     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
> +     * tree cannot be altered and we get FDT_ERR_NOSPACE.
> +     */
> +    s->fw_cfg = create_fw_cfg(machine);
> +    rom_set_fw(s->fw_cfg);
> +
>      if (machine->kernel_filename) {
>          kernel_start_addr = riscv_calc_kernel_start_addr(&s->soc[0],
>                                                           firmware_end_addr);
> @@ -1284,13 +1291,6 @@ static void virt_machine_done(Notifier *notifier, void *data)
>          start_addr = virt_memmap[VIRT_FLASH].base;
>      }
>  
> -    /*
> -     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
> -     * tree cannot be altered and we get FDT_ERR_NOSPACE.
> -     */
> -    s->fw_cfg = create_fw_cfg(machine);
> -    rom_set_fw(s->fw_cfg);
> -
>      /* Compute the fdt load address in dram */
>      fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
>                                     machine->ram_size, machine->fdt);
> -- 
> 2.25.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

