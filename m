Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mEDO5-0005YP-CG
	for mharc-qemu-riscv@gnu.org; Thu, 12 Aug 2021 12:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mEDO3-0005Uf-EZ; Thu, 12 Aug 2021 12:16:55 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:45803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mEDO1-0003qd-MM; Thu, 12 Aug 2021 12:16:55 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 203-20020a1c00d40000b02902e6a4e244e4so4986661wma.4; 
 Thu, 12 Aug 2021 09:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DhHERgBWbMWgzlIycPd3GUrmPEPlf/kFPbipJpYXkhk=;
 b=l16zt6JFhSG/zxh1iL/subS7rU063B1B77rBXWGoB/Yfyerfc+5FZZSv8yrp+2352L
 IAvsgBWq+3inkTfCBPg/S8WVDe7FJo9/kp2gzmIEpZBqmB38AjnxT6hc3jnXLgO7/PcI
 93J9bYd8SGjBMteKkcLY4t2+F1ermQ+qt3ew0e6J6O/FRsjsEBK5sIwtRynbWx2V1dIP
 pFAu+VUL6OQoIVZ497zvo1De/h7oJLkyOEivQPweQTHWaJPkd3jbLLlxA0HNlsKityQt
 P07U2DTpBaN8hTbKfeRr+QxQDq0sdLl7QEl8n+5lMka5yNlOVVYKO7ZnpM7MR1GjlC5F
 ixLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DhHERgBWbMWgzlIycPd3GUrmPEPlf/kFPbipJpYXkhk=;
 b=K+or/fYpRqACnWNzVmbSM7dkLHyu/OrRKZOVVsrNrZkxnBZpibWVmr713KyQ1wUhwo
 YTMIq4nsed9ovyjl6c3dEpThbb8sMT3V8O2zHDygCPyhufo7tJYoepkcLUmwc134OyV/
 8e56yFf245YGNlsWBDB4vbtH+Z5RKBkE+hSIJpHkYWdIvMMYGZoiAvxUgciurM5qx7ZE
 jvgKBnKAtdN9YaUW1cLtsJKaqfMw4HZjvzIBZNT/x/0c1gPCBVppMo0anMXA98Q38aDX
 rZm9ok11LjwJao0awqTvN93VG88HH2omU2zaQCVMYpr+M0xUBV0UsA5tQTy0mQ17Nq64
 0C1A==
X-Gm-Message-State: AOAM5302SOeTTRn/VY6B5k5hVpgejUdxUEcM6NfHK2qFiqsqnrsfkost
 I4Mprm4lNTr/We+fe1YCeMvjNwHLUik=
X-Google-Smtp-Source: ABdhPJw9MLzkuoPyREHyeAyMa3Sv8SYo1djtUjeVRUXEAeIJ2q+PJpEG969BbORxWWMvtiAJm+BQHw==
X-Received: by 2002:a7b:c7d1:: with SMTP id z17mr16396810wmk.50.1628784589781; 
 Thu, 12 Aug 2021 09:09:49 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id q203sm3355714wme.18.2021.08.12.09.09.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 09:09:49 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH] hw/riscv/virt.c: Assemble plic_hart_config string with
 g_strjoinv()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org
References: <20210812144647.10516-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2465bcc8-7e8b-8b5c-71ed-d696f69e0f78@amsat.org>
Date: Thu, 12 Aug 2021 18:09:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210812144647.10516-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 12 Aug 2021 16:16:55 -0000

Hi Peter,

On 8/12/21 4:46 PM, Peter Maydell wrote:
> In the riscv virt machine init function, We assemble a string
> plic_hart_config which is a comma-separated list of N copies of the
> VIRT_PLIC_HART_CONFIG string.  The code that does this has a
> misunderstanding of the strncat() length argument.  If the source
> string is too large strncat() will write a maximum of length+1 bytes
> (length bytes from the source string plus a trailing NUL), but the
> code here assumes that it will write only length bytes at most.
> 
> This isn't an actual bug because the code has correctly precalculated
> the amount of memory it needs to allocate so that it will never be
> too small (i.e.  we could have used plain old strcat()), but it does
> mean that the code looks like it has a guard against accidental
> overrun when it doesn't.
> 
> Rewrite the string handling here to use the glib g_strjoinv()
> function, which means we don't need to do careful accountancy of
> string lengths, and makes it clearer that what we're doing is
> "create a comma-separated string".
> 
> Fixes: Coverity 1460752
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/riscv/virt.c | 33 ++++++++++++++++++++-------------
>  1 file changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 4a3cd2599a5..26bc8d289ba 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -541,6 +541,24 @@ static FWCfgState *create_fw_cfg(const MachineState *mc)
>      return fw_cfg;
>  }
>  
> +/*
> + * Return the per-socket PLIC hart topology configuration string
> + * (caller must free with g_free())
> + */
> +static char *plic_hart_config_string(int hart_count)
> +{
> +    g_autofree const char **vals = g_new(const char *, hart_count + 1);
> +    int i;
> +
> +    for (i = 0; i < hart_count; i++) {
> +        vals[i] = VIRT_PLIC_HART_CONFIG;

Have you considered adding plic_hart_config_string() an extra
'const char *plic_config' argument (declaring it in a new
include/hw/riscv/plic_hart.h)?
We could use it in the other boards:

hw/riscv/microchip_pfsoc.c:267:            strncat(plic_hart_config, ","
MICROCHIP_PFSOC_PLIC_HART_CONFIG,
hw/riscv/microchip_pfsoc.c:268:                    plic_hart_config_len);
hw/riscv/microchip_pfsoc.c:270:            strncat(plic_hart_config,
"M", plic_hart_config_len);

hw/riscv/sifive_u.c:826:            strncat(plic_hart_config, ","
SIFIVE_U_PLIC_HART_CONFIG,
hw/riscv/sifive_u.c:827:                    plic_hart_config_len);
hw/riscv/sifive_u.c:829:            strncat(plic_hart_config, "M",
plic_hart_config_len);

hw/riscv/virt.c:612:                strncat(plic_hart_config, ",",
plic_hart_config_len);
hw/riscv/virt.c:614:            strncat(plic_hart_config,
VIRT_PLIC_HART_CONFIG,
hw/riscv/virt.c:615:                plic_hart_config_len);

include/hw/riscv/microchip_pfsoc.h:141:#define
MICROCHIP_PFSOC_PLIC_HART_CONFIG        "MS"
include/hw/riscv/shakti_c.h:63:#define SHAKTI_C_PLIC_HART_CONFIG "MS"
include/hw/riscv/sifive_e.h:83:#define SIFIVE_E_PLIC_HART_CONFIG "M"
include/hw/riscv/sifive_u.h:147:#define SIFIVE_U_PLIC_HART_CONFIG "MS"
include/hw/riscv/virt.h:74:#define VIRT_PLIC_HART_CONFIG "MS"

Obviously someone else could do that as bytetask, so meanwhile
for Coverity 1460752:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +    }
> +    vals[i] = NULL;
> +
> +    /* g_strjoinv() obliges us to cast away const here */
> +    return g_strjoinv(",", (char **)vals);
> +}
> +
>  static void virt_machine_init(MachineState *machine)
>  {
>      const MemMapEntry *memmap = virt_memmap;
> @@ -549,13 +567,12 @@ static void virt_machine_init(MachineState *machine)
>      MemoryRegion *main_mem = g_new(MemoryRegion, 1);
>      MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
>      char *plic_hart_config, *soc_name;
> -    size_t plic_hart_config_len;
>      target_ulong start_addr = memmap[VIRT_DRAM].base;
>      target_ulong firmware_end_addr, kernel_start_addr;
>      uint32_t fdt_load_addr;
>      uint64_t kernel_entry;
>      DeviceState *mmio_plic, *virtio_plic, *pcie_plic;
> -    int i, j, base_hartid, hart_count;
> +    int i, base_hartid, hart_count;
>  
>      /* Check socket count limit */
>      if (VIRT_SOCKETS_MAX < riscv_socket_count(machine)) {
> @@ -604,17 +621,7 @@ static void virt_machine_init(MachineState *machine)
>              SIFIVE_CLINT_TIMEBASE_FREQ, true);
>  
>          /* Per-socket PLIC hart topology configuration string */
> -        plic_hart_config_len =
> -            (strlen(VIRT_PLIC_HART_CONFIG) + 1) * hart_count;
> -        plic_hart_config = g_malloc0(plic_hart_config_len);
> -        for (j = 0; j < hart_count; j++) {
> -            if (j != 0) {
> -                strncat(plic_hart_config, ",", plic_hart_config_len);
> -            }
> -            strncat(plic_hart_config, VIRT_PLIC_HART_CONFIG,
> -                plic_hart_config_len);
> -            plic_hart_config_len -= (strlen(VIRT_PLIC_HART_CONFIG) + 1);
> -        }
> +        plic_hart_config = plic_hart_config_string(hart_count);
>  
>          /* Per-socket PLIC */
>          s->plic[i] = sifive_plic_create(
> 

