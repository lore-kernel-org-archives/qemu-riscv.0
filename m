Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAVyv-0006r1-Qy
	for mharc-qemu-riscv@gnu.org; Wed, 28 Dec 2022 07:56:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAVyu-0006p7-9k
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 07:56:28 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAVys-0007zP-JI
 for qemu-riscv@nongnu.org; Wed, 28 Dec 2022 07:56:28 -0500
Received: by mail-wm1-x32f.google.com with SMTP id l26so9609474wme.5
 for <qemu-riscv@nongnu.org>; Wed, 28 Dec 2022 04:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3WdzzZycU+vR+d9eO9QQfdyeu4bWjnJ5VcHJO1cmyl0=;
 b=kVdycoyBDukfo8XpCsw6EfBOGbu18x2LebbYQr/PtbDyUHEju6hXyJlVj8uAM3X26j
 lDT3KKRbLero/UdZonhqtDPPnrZmDzUCUyu2/I5PNwx3M/cf9l+QcN0C6jx94ooRGXZ4
 j9T2px+gzf5GaE7ZC2AfGC0akY2rksrred0Wxc+hC3kVn9XuoVTpyWMh18b1buZbNg8a
 oPfobjvMMizPPwl6OMY/gfvsy54DAwMLyu4kvyBQ7JK8wKvfRfHjmOTGJs+IerUHB1ZW
 H5GnC5RNgbKIQL95yfnFWO1UKPJUTYReyk15LPHmPkYveo0C1qnCBgc3GmjMQgudvDVv
 sqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3WdzzZycU+vR+d9eO9QQfdyeu4bWjnJ5VcHJO1cmyl0=;
 b=bZITiZfZatqa9ZmkAsDc7WfkkqgnFPhp8N4NGl0KNK3V4AxftTxNU5bAzHMSzootbZ
 oM28m8eXHJ3MyR6bNWZVgkzxwMBfHre+E/7nDqxINVINucqsGaQkyc2bDrk2hqc53iIx
 tsFCpJWClPkp5Awz/kInxEwZSSccdxrYzvxJ3YrjeJAfml/qUyuVJkIOGqm0euNJN8Ye
 5vkyGjxeepEYzn+U1uVhgez+plWKTaL5MMsPEINYSX2EPVo/gI5woCTKZXRM6WLMSpQy
 z7MjAyp5WOJWpbWAWZ/6dc9wasdR6CP+viRiCo41Vr6/pj/Ug5XX4T8X6fZOnywyW4lT
 wP9w==
X-Gm-Message-State: AFqh2kokfHmAOSCmZrg3yy2RKOvdX2Ifq8JBI1qhgwkfDTvZEWq/qa4o
 8eNl/ia1t7bvy80cBlmjlOFLpQ==
X-Google-Smtp-Source: AMrXdXuN9xUnDcP1uMb5d4/9CHja2/ZsBdXSTeY82kSxuURVJgTPtfVittmcqVmei8cUfHbp9lElEw==
X-Received: by 2002:a05:600c:3d0e:b0:3d3:4aa6:4fd0 with SMTP id
 bh14-20020a05600c3d0e00b003d34aa64fd0mr17775434wmb.6.1672232171423; 
 Wed, 28 Dec 2022 04:56:11 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t15-20020a5d534f000000b002365254ea42sm15543180wrv.1.2022.12.28.04.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 04:56:11 -0800 (PST)
Message-ID: <77a6f2da-e56e-a099-e0a1-6a99c4a9f7c9@linaro.org>
Date: Wed, 28 Dec 2022 13:56:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 09/10] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bmeng@tinylab.org>
References: <20221228124242.184784-1-dbarboza@ventanamicro.com>
 <20221228124242.184784-10-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221228124242.184784-10-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
X-List-Received-Date: Wed, 28 Dec 2022 12:56:28 -0000

On 28/12/22 13:42, Daniel Henrique Barboza wrote:
> The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
> the same steps when '-kernel' is used:
> 
> - execute load_kernel()
> - load init_rd()
> - write kernel_cmdline
> 
> Let's fold everything inside riscv_load_kernel() to avoid code
> repetition. Every other board that uses riscv_load_kernel() will have
> this same behavior, including boards that doesn't have a valid FDT, so
> we need to take care to not do FDT operations without checking it first.
> 
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> ---
>   hw/riscv/boot.c            | 21 ++++++++++++++++++---
>   hw/riscv/microchip_pfsoc.c |  9 ---------
>   hw/riscv/sifive_u.c        |  9 ---------
>   hw/riscv/spike.c           |  9 ---------
>   hw/riscv/virt.c            |  9 ---------
>   5 files changed, 18 insertions(+), 39 deletions(-)
> 
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index cd9c989edb..95f780a228 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -177,6 +177,7 @@ target_ulong riscv_load_kernel(MachineState *machine,
>   {
>       const char *kernel_filename = machine->kernel_filename;
>       uint64_t kernel_load_base, kernel_entry;
> +    void *fdt = machine->fdt;
>   
>       /*
>        * NB: Use low address not ELF entry point to ensure that the fw_dynamic
> @@ -188,21 +189,35 @@ target_ulong riscv_load_kernel(MachineState *machine,
>       if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
>                            NULL, &kernel_load_base, NULL, NULL, 0,
>                            EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
> -        return kernel_load_base;
> +        kernel_entry = kernel_load_base;
> +        goto out;
>       }
>   
>       if (load_uimage_as(kernel_filename, &kernel_entry, NULL, NULL,
>                          NULL, NULL, NULL) > 0) {
> -        return kernel_entry;
> +        goto out;
>       }
>   
>       if (load_image_targphys_as(kernel_filename, kernel_start_addr,
>                                  current_machine->ram_size, NULL) > 0) {
> -        return kernel_start_addr;
> +        kernel_entry = kernel_start_addr;
> +        goto out;
>       }
>   
>       error_report("could not load kernel '%s'", kernel_filename);
>       exit(1);
> +
> +out:
> +    if (machine->initrd_filename) {
> +        riscv_load_initrd(machine, kernel_entry);
> +    }
> +
> +    if (fdt && machine->kernel_cmdline && *machine->kernel_cmdline) {
> +        qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
> +                                machine->kernel_cmdline);
> +    }
> +
> +    return kernel_entry;
>   }

Worth renaming as riscv_load_kernel_and_initrd()?

