Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pDtPl-00008l-7h
	for mharc-qemu-riscv@gnu.org; Fri, 06 Jan 2023 15:34:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pDtPj-00007t-73
 for qemu-riscv@nongnu.org; Fri, 06 Jan 2023 15:34:07 -0500
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pDtPe-0006mj-1Y
 for qemu-riscv@nongnu.org; Fri, 06 Jan 2023 15:34:04 -0500
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-15085b8a2f7so2823595fac.2
 for <qemu-riscv@nongnu.org>; Fri, 06 Jan 2023 12:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XuXZcy6N667ycFLluxXP+pMYomBRgoHWk5jqhZH4j6I=;
 b=BGMo9YkHOzYyEhUupbVzhpz4A4yXpn2PBGWA//Wc4lifEEIOSNMuM7Xg38k1R5d3Ue
 mbhCCATsoyXabRTRK6OeIHhERDBQ33gjLWA3QCWU/vJVFjkiXYqKlTLRHRAqmXEqop26
 7qzI/L4cFg1fiNC4jjjrlR+jJLB/fhCaACQaqmz7jHNwbhwX9lbfOMIa4yS10wj+1jID
 7SxsLL5IYcVvV0CsZQa+zdw8EoZF2fGWD2AQZR3CyZ2/9KNQHlOuyX564g/vepvSnqQp
 SPL1hNxyG+k/WyGhOtX95PbvQH951qOnR3CILQ9Gvd8/McCzgnWh+eob9O/oVC8eXaqQ
 j54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XuXZcy6N667ycFLluxXP+pMYomBRgoHWk5jqhZH4j6I=;
 b=aFgOIKmjAE2zUB1QxUcovgSFzughr1r/EOQOzNPW+RY4mXx3jwWgU2f6jmSFs5cdip
 MTdqLPRkmmkaw3myEVju87kYhePl+PcET9m+Ajny5RcNZXHEf/7qttZxv6xm6moreql3
 6mFTFkigisaoXyMpD6zsUIVmUaCScXFIuFPxTBm+K5iI2y5YtTcymxBmkrCc89zLlY8D
 4Wj3I/w5RTE/c5CHkr4q+ljUsJNNEL3m850tQNF9+248oI15gcN6Wj8v5+48fCLXe8q0
 JXqUcaEG9PQIys4rCDZX/2nvyDgZyWNOmGvnVLsro4omCy057h/NhTmeuG+N7W4MBo9R
 0qhw==
X-Gm-Message-State: AFqh2krMbKPzNvgLSZQwxlIYSpRWwmdyO8PIJw9nJZKMoLEFg7KB8qfb
 7O3/Y4JnK5PP9qgrV0H70OImVg==
X-Google-Smtp-Source: AMrXdXuXJ4BFcxkjuZXL4d+g03vH7mz9t0RhD4mWsmM3XPz74eyy7wEH+7xD0AQAjJHyxGbvWSkKdw==
X-Received: by 2002:a05:6870:4689:b0:148:2257:50cf with SMTP id
 a9-20020a056870468900b00148225750cfmr30786124oap.2.1673037239396; 
 Fri, 06 Jan 2023 12:33:59 -0800 (PST)
Received: from [192.168.68.107] ([152.250.93.24])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a056870344800b0013b92b3ac64sm1006586oah.3.2023.01.06.12.33.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 12:33:58 -0800 (PST)
Message-ID: <a7b6da2a-ab0d-6a10-1966-83d68b0ad2f7@ventanamicro.com>
Date: Fri, 6 Jan 2023 17:33:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 06/20] hw/riscv: Use generic DeviceState instead of
 PFlashCFI01
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost
 <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>, Kevin Wolf <kwolf@redhat.com>
References: <20230104220449.41337-1-philmd@linaro.org>
 <20230104220449.41337-7-philmd@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230104220449.41337-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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
X-List-Received-Date: Fri, 06 Jan 2023 20:34:07 -0000



On 1/4/23 19:04, Philippe Mathieu-Daudé wrote:
> Nothing here requires access to PFlashCFI01 internal fields:
> use the inherited generic DeviceState.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   hw/riscv/virt.c         | 9 +++++----
>   include/hw/riscv/virt.h | 3 +--
>   2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 400bd9329f..b421a9dc12 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -46,6 +46,7 @@
>   #include "sysemu/sysemu.h"
>   #include "sysemu/kvm.h"
>   #include "sysemu/tpm.h"
> +#include "hw/block/flash.h"
>   #include "hw/pci/pci.h"
>   #include "hw/pci-host/gpex.h"
>   #include "hw/display/ramfb.h"
> @@ -106,7 +107,7 @@ static MemMapEntry virt_high_pcie_memmap;
>   
>   #define VIRT_FLASH_SECTOR_SIZE (256 * KiB)
>   
> -static PFlashCFI01 *virt_flash_create1(RISCVVirtState *s,
> +static DeviceState *virt_flash_create1(RISCVVirtState *s,
>                                          const char *name,
>                                          const char *alias_prop_name)
>   {
> @@ -130,7 +131,7 @@ static PFlashCFI01 *virt_flash_create1(RISCVVirtState *s,
>       object_property_add_alias(OBJECT(s), alias_prop_name,
>                                 OBJECT(dev), "drive");
>   
> -    return PFLASH_CFI01(dev);
> +    return dev;
>   }
>   
>   static void virt_flash_create(RISCVVirtState *s)
> @@ -139,7 +140,7 @@ static void virt_flash_create(RISCVVirtState *s)
>       s->flash[1] = virt_flash_create1(s, "virt.flash1", "pflash1");
>   }
>   
> -static void virt_flash_map1(PFlashCFI01 *flash,
> +static void virt_flash_map1(DeviceState *flash,
>                               hwaddr base, hwaddr size,
>                               MemoryRegion *sysmem)
>   {
> @@ -1517,7 +1518,7 @@ static void virt_machine_init(MachineState *machine)
>   
>       for (i = 0; i < ARRAY_SIZE(s->flash); i++) {
>           /* Map legacy -drive if=pflash to machine properties */
> -        pflash_cfi01_legacy_drive(DEVICE(s->flash[i]),
> +        pflash_cfi01_legacy_drive(s->flash[i],
>                                     drive_get(IF_PFLASH, 0, i));
>       }
>       virt_flash_map(s, system_memory);
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index be4ab8fe7f..b700a46763 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -21,7 +21,6 @@
>   
>   #include "hw/riscv/riscv_hart.h"
>   #include "hw/sysbus.h"
> -#include "hw/block/flash.h"
>   #include "qom/object.h"
>   
>   #define VIRT_CPUS_MAX_BITS             9
> @@ -49,7 +48,7 @@ struct RISCVVirtState {
>       DeviceState *platform_bus_dev;
>       RISCVHartArrayState soc[VIRT_SOCKETS_MAX];
>       DeviceState *irqchip[VIRT_SOCKETS_MAX];
> -    PFlashCFI01 *flash[2];
> +    DeviceState *flash[2];
>       FWCfgState *fw_cfg;
>   
>       int fdt_size;


