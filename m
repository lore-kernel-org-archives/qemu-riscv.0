Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFs62-0008Vk-TC
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 02:33:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFs5y-0008TL-Bv
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 02:33:54 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFs5w-0001b0-OS
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 02:33:54 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so11089949wma.1
 for <qemu-riscv@nongnu.org>; Wed, 11 Jan 2023 23:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lJIVXQsqtCORMFroj2LJU4b9JMSpOaz77oKCaADU35o=;
 b=v1jNhS/0i0Im0ur3tcHarN60pF8wut2xGgpFnt3RLlSSiuZTeFcLSwlcKqqavL2glI
 5s4ernBJORM2dGztuJPEkGQden8CwcqJd5p1x+FfDywpHfJhv3Am9RhiBJHXpZsUuLbK
 X2G+xdTiYjGeSwuNBBzXj+/qioU5NpdvpK4t8c7LGcZiYhe8Ovb+BL0T2w3//azv0Xtv
 2NzqbcTltO/aXqgumBgbLJyKXf89DB2A4Bne6PLb8zEvPpFJTEIqPmcvSDbSfjA+akDh
 /51sFDBNr6x7QyCDYG59+n8B7pKCQixxDuzxUbKX14OUgkd01DNVbU2bubcag8isneBH
 pEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lJIVXQsqtCORMFroj2LJU4b9JMSpOaz77oKCaADU35o=;
 b=SJqI2mfZjIVME+QHRKeYsfkEWXW3tL2ccDloY1cLAkJqdET7eCq70wulP7jz0JyH8P
 zrZ1ytoFTWcbPPSmqVNB7clLIATLZvmW21Da4euv/z4XKz37/e7878K5F4gwWwhgxQwZ
 MdDMoZNuevt/P6yK3/cmACTLSwa5et7qE+EU8EVaL1lau1IC7KKAS4xx9NDCYB8SDt+S
 j9AyD+rnmmt+9mbGqjVqk7EXej5dINL0PeMqfThX/XKEw5qEkIRgZGwHVtu2Z7cfUqTv
 TAbWyAMh+Vxue7BW3MDasoYeu31RumefkhAlnAtcSbjTPVvxuYf6ggaG9zmfR0E9YSk/
 AUEQ==
X-Gm-Message-State: AFqh2kpssD/hn59zb/VCQWlRDi5C4SL12tQKypWlK98sWdgosicHD/F+
 l5j4BINIHMuMWs/Fm/DT1QigSA==
X-Google-Smtp-Source: AMrXdXsbUJXmJYY3X2dGHcTldVCAC9JCNtX+M+CWS03FaW2mx3c2uCwmwpuaqDj8nLhjrCeCp3TXOA==
X-Received: by 2002:a05:600c:3509:b0:3d3:4f99:bb32 with SMTP id
 h9-20020a05600c350900b003d34f99bb32mr55206031wmq.36.1673508830818; 
 Wed, 11 Jan 2023 23:33:50 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b003c6b70a4d69sm23588459wmq.42.2023.01.11.23.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 23:33:50 -0800 (PST)
Message-ID: <f979f94f-2cd0-ac3a-0eaa-330568b05e70@linaro.org>
Date: Thu, 12 Jan 2023 08:33:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 07/10] hw/riscv: simplify riscv_load_fdt()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20230111170948.316276-1-dbarboza@ventanamicro.com>
 <20230111170948.316276-8-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230111170948.316276-8-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 12 Jan 2023 07:33:54 -0000

On 11/1/23 18:09, Daniel Henrique Barboza wrote:
> All callers of riscv_load_fdt() are using machine->ram_size as
> 'mem_size' and the fdt is always retrievable via machine->fdt.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hw/riscv/boot.c            | 4 +++-
>   hw/riscv/microchip_pfsoc.c | 4 ++--
>   hw/riscv/sifive_u.c        | 3 +--
>   hw/riscv/spike.c           | 3 +--
>   hw/riscv/virt.c            | 3 +--
>   include/hw/riscv/boot.h    | 2 +-
>   6 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index e868fb6ade..21dea7eac2 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -265,10 +265,12 @@ out:
>       return kernel_entry;
>   }
>   
> -uint64_t riscv_load_fdt(hwaddr dram_base, uint64_t mem_size, void *fdt)
> +uint64_t riscv_load_fdt(MachineState *ms, hwaddr dram_base)
>   {
>       uint64_t temp, fdt_addr;
> +    uint64_t mem_size = ms->ram_size;
>       hwaddr dram_end = dram_base + mem_size;

What about sparse memory ...?

>       if (fdtsize <= 0) {
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index c45023a2b1..6bb08f66bd 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -633,8 +633,8 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
>                                            true, NULL);
>   
>           /* Compute the fdt load address in dram */
> -        fdt_load_addr = riscv_load_fdt(memmap[MICROCHIP_PFSOC_DRAM_LO].base,
> -                                       machine->ram_size, machine->fdt);
> +        fdt_load_addr = riscv_load_fdt(machine,
> +                                       memmap[MICROCHIP_PFSOC_DRAM_LO].base);

... i.e:

hw/riscv/microchip_pfsoc.c:    [MICROCHIP_PFSOC_DRAM_LO] =         { 
0x80000000,   0x40000000 },
hw/riscv/microchip_pfsoc.c:    [MICROCHIP_PFSOC_DRAM_HI] =       { 
0x1000000000,          0x0 },

IIUC FDT is always loaded into a contiguous region, so maybe simply
'dram_base' is a bad name for '[fdt_]load_address'?

'mem_size' is used to calculate 'dram_end'... This function seems buggy.

We should pass either start_addr/end_addr or base/size, but the range
passed must be contiguous.

