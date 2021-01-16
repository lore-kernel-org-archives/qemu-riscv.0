Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l0u7p-0007yV-8u
	for mharc-qemu-riscv@gnu.org; Sat, 16 Jan 2021 17:32:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0u7n-0007xF-Bn; Sat, 16 Jan 2021 17:32:51 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0u7l-0005cO-Nk; Sat, 16 Jan 2021 17:32:51 -0500
Received: by mail-wr1-x434.google.com with SMTP id l12so7651374wry.2;
 Sat, 16 Jan 2021 14:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5/eGqY/Dx1vesoIn289juJjUNZjcYf0VDhhKyELqPU8=;
 b=CINbyn2JSdeWWlz3q5qnqH+ZiI4w64PQuibTuofkUQEkAsZZSdsBouSCk6fIR0Hu4D
 DXfNc6WMOkSuJ6X4t51Klw1gqbm/2sZ3U5GQEgDNiOiP/BcwkS2NtXOVGwPixB3efGJh
 IgMAxB0BvxJ2MZ/dBelmDkUY/0m2ad/yEsCzKUzYrrzXGaxqLt7KsuaGMYmRjPnKHv5C
 eW8P5I4jTspAnBga3D319psGgmXtjCXCl+cBDd9NVSMCL2WNeecyV8Am4eqQFIzzbPIh
 GzCFcypTWO/Xk+Xyx+7EpBr1p2sfxmmfVQzoQnZzQxEUNnBoVSkBznUM2PKXHejI+/7P
 sM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5/eGqY/Dx1vesoIn289juJjUNZjcYf0VDhhKyELqPU8=;
 b=KLnFroge2lLJi9YD4O4A5KeisBA9fZyM2qzc39M+zbKEoJWD6tQnYbtgk8dO2dtNmR
 fyvhY/HkChcK4WNeWJ+p8DWdCiX4AEGitpn5iGEBeqGRTJOMJZ1To6XaXE3GhKpHbiEi
 ywi/40x909a4T6kvI02CYd1vL26fWRWHee50E3DFz6jzzxxNFgSiFA2eDAaAjGR5SrUB
 qMqs1DCtm6pquvuPuDbZP2OYur64xXW8pOrUR5PFDluuuBNlRKOExQgc+YZ+v84QUdxH
 2Sl4b6mqcSJL/ZDcdsVdIzILZXV6qjZGuHoeMKCO+9yIszubO4y3k1+x/WUZ1dhMKoMj
 4JKg==
X-Gm-Message-State: AOAM5318wFui4gpteGGZWaMf/PvsyBvSuN3ikm9IddLrIKMw121KtmdN
 Sof1fBNGDoDaJ4OYsRG/aOM=
X-Google-Smtp-Source: ABdhPJy7QpuWd+46/NcDXMFARIpGnLffI0VroWZP9SExq4D2kdyjqYvL0QgOCEA9ONm3Tutl9nT39g==
X-Received: by 2002:adf:dd90:: with SMTP id x16mr19005569wrl.85.1610836367566; 
 Sat, 16 Jan 2021 14:32:47 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id c20sm16659831wmb.38.2021.01.16.14.32.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jan 2021 14:32:46 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v1 1/1] riscv: Pass RISCVHartArrayState by pointer
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <f3e04424723e0e222769991896cc82308fd23f76.1610751609.git.alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a566580a-ef30-0d2f-116e-1e3666f1187d@amsat.org>
Date: Sat, 16 Jan 2021 23:32:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f3e04424723e0e222769991896cc82308fd23f76.1610751609.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.039,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 16 Jan 2021 22:32:51 -0000

On 1/16/21 12:00 AM, Alistair Francis wrote:
> We were accidently passing RISCVHartArrayState by value instead of
> pointer. The type is 824 bytes long so let's correct that and pass it by
> pointer instead.
> 
> Fixes: Coverity CID 1438099
> Fixes: Coverity CID 1438100
> Fixes: Coverity CID 1438101
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/riscv/boot.h |  6 +++---
>  hw/riscv/boot.c         |  8 ++++----
>  hw/riscv/sifive_u.c     | 10 +++++-----
>  hw/riscv/spike.c        |  8 ++++----
>  hw/riscv/virt.c         |  8 ++++----
>  5 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
> index 20ff5fe5e5..11a21dd584 100644
> --- a/include/hw/riscv/boot.h
> +++ b/include/hw/riscv/boot.h
> @@ -24,9 +24,9 @@
>  #include "hw/loader.h"
>  #include "hw/riscv/riscv_hart.h"
>  
> -bool riscv_is_32bit(RISCVHartArrayState harts);
> +bool riscv_is_32bit(RISCVHartArrayState *harts);
>  
> -target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState harts,
> +target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState *harts,
>                                            target_ulong firmware_end_addr);
>  target_ulong riscv_find_and_load_firmware(MachineState *machine,
>                                            const char *default_machine_firmware,
> @@ -42,7 +42,7 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
>  hwaddr riscv_load_initrd(const char *filename, uint64_t mem_size,
>                           uint64_t kernel_entry, hwaddr *start);
>  uint32_t riscv_load_fdt(hwaddr dram_start, uint64_t dram_size, void *fdt);
> -void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState harts,
> +void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts,
>                                 hwaddr saddr,
>                                 hwaddr rom_base, hwaddr rom_size,
>                                 uint64_t kernel_entry,
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 83586aef41..acf77675b2 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -33,14 +33,14 @@
>  
>  #include <libfdt.h>
>  
> -bool riscv_is_32bit(RISCVHartArrayState harts)
> +bool riscv_is_32bit(RISCVHartArrayState *harts)
>  {
> -    RISCVCPU hart = harts.harts[0];
> +    RISCVCPU hart = harts->harts[0];

This doesn't look improved. Maybe you want:

       return riscv_cpu_is_32bit(&harts->harts[0].env);

>  
>      return riscv_cpu_is_32bit(&hart.env);
>  }

