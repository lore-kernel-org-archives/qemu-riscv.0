Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pGEG2-0001uU-AG
	for mharc-qemu-riscv@gnu.org; Fri, 13 Jan 2023 02:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGEG0-0001tY-Dx
 for qemu-riscv@nongnu.org; Fri, 13 Jan 2023 02:13:44 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGEFy-00008e-3Z
 for qemu-riscv@nongnu.org; Fri, 13 Jan 2023 02:13:44 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r2so20182302wrv.7
 for <qemu-riscv@nongnu.org>; Thu, 12 Jan 2023 23:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hd5wX4mhBiOqr2EsJItmpSvHE6MDIX5pIKPGQitnuL4=;
 b=MGQ7EXL7j+DMWVtATEkizi3CLfQOxVV3S79osvy7FxtGM+UFqVuLNZPa5vRDY4Kp/c
 GEvalByOMW+pcRTYx10c41gnS800wFmiSjGiR9hY1IVriQqqXsYuwl9TitqcvhgIQOW9
 o15LFq3hGgK++DAVdpcJIrxF8RRB1n2imJckq6ZtYUc8k8IE0d1XymrbXRJvs20CEWW1
 v1BqHFncxagzpHx/pElk/KgOVztRnqeMCLu516+P4KnqiNQTxkE9g8mk3e8wV6b5Mabw
 ZJHUURuV4LS1tObpnKLsGa4sDNOw9kTYJWFbnjaiqkU2VgucDGA8wndb0s67QNjNaMhR
 /wMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hd5wX4mhBiOqr2EsJItmpSvHE6MDIX5pIKPGQitnuL4=;
 b=R4ncZ73g+tzT+t/dt8J9LDezXquxchv6Z+pNLgyQL49BWJUlz4YvD74rbTdQnUK9XH
 aUf+z/VEwugSAOYyDBgF5z/m352QD8KzhubTtlWJumLySlwOTRv2CDpy5gO/J4VfIi+k
 Sl8ADP5CBC++z498WKgw+Yvhj/7R9TQ8+7KnfgV9OHyxGsaWAYD8LNKjV57upqqq8Ofq
 4e3A64R0tTiYfatwwFabYHCWgYt7RPbgKRJRXuxNbgp/74FaHCXNnEkbncbVq6bwgynu
 G5FtMLyK9NQyJsjPQoLOC268M8hQd4ZeDVZK7aq9RnyrqUDQ7Bd4Nu+yBbHHZRgHNJ6w
 sH0A==
X-Gm-Message-State: AFqh2koaQ94EPo5VcMGCPeTV8kgj8aPPiiNZa5thr6WfkaLBvMfQHZK+
 Ihiz3EfoDL57uQMu1JqH7Qm89A==
X-Google-Smtp-Source: AMrXdXtF8eE4F8PMAgc9XyMHqvggyvSWUbD+cfVLEjMvZf9li7c02pZEC98WKoM09gfr0tRuABqpkA==
X-Received: by 2002:a5d:5685:0:b0:2bb:4b40:2d18 with SMTP id
 f5-20020a5d5685000000b002bb4b402d18mr15573749wrv.62.1673594019392; 
 Thu, 12 Jan 2023 23:13:39 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s1-20020a5d4ec1000000b002882600e8a0sm18222921wrv.12.2023.01.12.23.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 23:13:38 -0800 (PST)
Message-ID: <9bc6b28f-2f12-e774-3bb2-73d835540ecb@linaro.org>
Date: Fri, 13 Jan 2023 08:13:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 1/2] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20230112223444.484879-1-dbarboza@ventanamicro.com>
 <20230112223444.484879-2-dbarboza@ventanamicro.com>
 <CAEUhbmVDcPnbMQYKnJ0BH+UNH9_htGTBEypcduR2_eiFd7ExXA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAEUhbmVDcPnbMQYKnJ0BH+UNH9_htGTBEypcduR2_eiFd7ExXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
X-List-Received-Date: Fri, 13 Jan 2023 07:13:44 -0000

On 13/1/23 03:47, Bin Meng wrote:
> On Fri, Jan 13, 2023 at 6:37 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
>>
>> The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
>> the same steps when '-kernel' is used:
>>
>> - execute load_kernel()
>> - load init_rd()
>> - write kernel_cmdline
>>
>> Let's fold everything inside riscv_load_kernel() to avoid code
>> repetition. To not change the behavior of boards that aren't calling
>> riscv_load_initrd(), add an 'load_initrd' flag to riscv_load_kernel()
>> and allow these boards to opt out from initrd loading.
>>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   hw/riscv/boot.c            | 30 +++++++++++++++++++++++++++---
>>   hw/riscv/microchip_pfsoc.c | 12 ++----------
>>   hw/riscv/opentitan.c       |  3 ++-
>>   hw/riscv/sifive_e.c        |  4 +++-
>>   hw/riscv/sifive_u.c        | 13 +++----------
>>   hw/riscv/spike.c           | 10 +---------
>>   hw/riscv/virt.c            | 13 +++----------
>>   include/hw/riscv/boot.h    |  2 ++
>>   8 files changed, 43 insertions(+), 44 deletions(-)
>>
>> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
>> index 2594276223..e8e8b8517c 100644
>> --- a/hw/riscv/boot.c
>> +++ b/hw/riscv/boot.c
>> @@ -175,10 +175,12 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
>>
>>   target_ulong riscv_load_kernel(MachineState *machine,
>>                                  target_ulong kernel_start_addr,
>> +                               bool load_initrd, bool is_32bits,
>>                                  symbol_fn_t sym_cb)
>>   {
>>       const char *kernel_filename = machine->kernel_filename;
>>       uint64_t kernel_load_base, kernel_entry;
>> +    void *fdt = machine->fdt;
>>
>>       g_assert(kernel_filename != NULL);
>>
>> @@ -192,21 +194,43 @@ target_ulong riscv_load_kernel(MachineState *machine,
>>       if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
>>                            NULL, &kernel_load_base, NULL, NULL, 0,
>>                            EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
>> -        return kernel_load_base;
>> +        kernel_entry = kernel_load_base;
>> +        /*
>> +         * kernel_load_base is sign-extended for 32 bits and can
>> +         * be padded with '1's. Do an uint32_t cast to avoid the
>> +         * padding if we're running a 32 bit CPU.
>> +         */
> 
> I see both kernel_load_base and kernel_entry are declared as a
> uint64_t, and load_elf_ram_sym() accepts a uint64_t parameter. Where
> does the sign-extension happen?

Likely load_elf_ram_sym()'s translate_fn() argument is missing?

  * @translate_fn: optional function to translate load addresses
  * @translate_opaque: opaque data passed to @translate_fn

Others archs provide:

$ git grep -F '(void *opaque, uint64_t'
hw/alpha/dp264.c:23:static uint64_t cpu_alpha_superpage_to_phys(void 
*opaque, uint64_t addr)
hw/cris/boot.c:62:static uint64_t translate_kernel_address(void *opaque, 
uint64_t addr)
hw/hppa/machine.c:107:static uint64_t cpu_hppa_to_phys(void *opaque, 
uint64_t addr)
hw/intc/openpic.c:857:static uint64_t openpic_src_read(void *opaque, 
uint64_t addr, unsigned len)
hw/loongarch/virt.c:390:static uint64_t cpu_loongarch_virt_to_phys(void 
*opaque, uint64_t addr)
hw/microblaze/boot.c:112:static uint64_t translate_kernel_address(void 
*opaque, uint64_t addr)
hw/nios2/boot.c:78:static uint64_t translate_kernel_address(void 
*opaque, uint64_t addr)
hw/ppc/mac_newworld.c:117:static uint64_t translate_kernel_address(void 
*opaque, uint64_t addr)
hw/ppc/mac_oldworld.c:75:static uint64_t translate_kernel_address(void 
*opaque, uint64_t addr)
hw/ppc/spapr.c:1263:static uint64_t translate_kernel_address(void 
*opaque, uint64_t addr)
hw/s390x/ipl.c:106:static uint64_t bios_translate_addr(void *opaque, 
uint64_t srcaddr)
hw/sparc/sun4m.c:217:static uint64_t translate_kernel_address(void 
*opaque, uint64_t addr)
hw/sparc/sun4m.c:673:static uint64_t translate_prom_address(void 
*opaque, uint64_t addr)
hw/sparc64/sun4u.c:412:static uint64_t translate_prom_address(void 
*opaque, uint64_t addr)
hw/ssi/xlnx-versal-ospi.c:1613:static void ospi_indac_write(void 
*opaque, uint64_t value, unsigned int size)
hw/timer/pxa2xx_timer.c:117:static void pxa2xx_timer_update(void 
*opaque, uint64_t now_qemu)
hw/timer/pxa2xx_timer.c:134:static void pxa2xx_timer_update4(void 
*opaque, uint64_t now_qemu, int n)
hw/xtensa/sim.c:40:static uint64_t translate_phys_addr(void *opaque, 
uint64_t addr)
hw/xtensa/xtfpga.c:189:static uint64_t translate_phys_addr(void *opaque, 
uint64_t addr)

>> +        if (is_32bits) {
>> +            kernel_entry = (uint32_t)kernel_load_base;
>> +        }
>> +        goto out;
>>       }


