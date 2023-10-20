Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D4BC001DF
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 16:54:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtslK-0007Na-Mw; Fri, 20 Oct 2023 12:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=+bN6=GC=kaod.org=clg@ozlabs.org>)
 id 1qtskg-00073A-Mx; Fri, 20 Oct 2023 12:53:34 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=+bN6=GC=kaod.org=clg@ozlabs.org>)
 id 1qtskd-0005RL-1u; Fri, 20 Oct 2023 12:53:34 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4SBrJ46Mgsz4xcb;
 Sat, 21 Oct 2023 03:53:24 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SBrHr3PzDz4xcS;
 Sat, 21 Oct 2023 03:53:12 +1100 (AEDT)
Message-ID: <859bfc3e-bb3f-4f81-9a84-639e827a05a0@kaod.org>
Date: Fri, 20 Oct 2023 18:53:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/19] cpus: Replace first_cpu by qemu_get_cpu(0,
 TYPE_ARM_CPU)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Rob Herring <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Felipe Balbi <balbi@kernel.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>
References: <20231020163643.86105-1-philmd@linaro.org>
 <20231020163643.86105-11-philmd@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231020163643.86105-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=+bN6=GC=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 10/20/23 18:36, Philippe Mathieu-Daudé wrote:
> Mechanical change using the following coccinelle script:
> 
>    @@ @@
>    -   first_cpu
>    +   qemu_get_cpu(0, TYPE_ARM_CPU)
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

For aspeed,

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/aspeed.c            |  5 +++--
>   hw/arm/bananapi_m2u.c      |  3 ++-
>   hw/arm/boot.c              | 12 ++++++------
>   hw/arm/exynos4_boards.c    |  6 ++++--
>   hw/arm/highbank.c          |  3 ++-
>   hw/arm/microbit.c          |  3 ++-
>   hw/arm/mps2-tz.c           |  3 ++-
>   hw/arm/mps2.c              |  3 ++-
>   hw/arm/msf2-som.c          |  3 ++-
>   hw/arm/musca.c             |  3 ++-
>   hw/arm/netduino2.c         |  3 ++-
>   hw/arm/netduinoplus2.c     |  2 +-
>   hw/arm/olimex-stm32-h405.c |  2 +-
>   hw/arm/orangepi.c          |  3 ++-
>   hw/arm/realview.c          |  5 +++--
>   hw/arm/sbsa-ref.c          |  3 ++-
>   hw/arm/stellaris.c         |  3 ++-
>   hw/arm/stm32vldiscovery.c  |  2 +-
>   hw/arm/vexpress.c          |  3 ++-
>   hw/arm/virt.c              | 17 ++++++++++-------
>   hw/arm/xilinx_zynq.c       |  3 ++-
>   target/arm/arch_dump.c     |  6 +++---
>   22 files changed, 58 insertions(+), 38 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index f8ba67531a..6a4d87bfe2 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -446,7 +446,8 @@ static void aspeed_machine_init(MachineState *machine)
>           }
>       }
>   
> -    arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo);
> +    arm_load_kernel(ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU)), machine,
> +                    &aspeed_board_binfo);
>   }
>   
>   static void palmetto_bmc_i2c_init(AspeedMachineState *bmc)
> @@ -1553,7 +1554,7 @@ static void aspeed_minibmc_machine_init(MachineState *machine)
>           amc->i2c_init(bmc);
>       }
>   
> -    armv7m_load_kernel(ARM_CPU(first_cpu),
> +    armv7m_load_kernel(ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU)),
>                          machine->kernel_filename,
>                          0,
>                          AST1030_INTERNAL_FLASH_SIZE);
> diff --git a/hw/arm/bananapi_m2u.c b/hw/arm/bananapi_m2u.c
> index 74121d8966..431b1c9bf9 100644
> --- a/hw/arm/bananapi_m2u.c
> +++ b/hw/arm/bananapi_m2u.c
> @@ -127,7 +127,8 @@ static void bpim2u_init(MachineState *machine)
>       bpim2u_binfo.loader_start = r40->memmap[AW_R40_DEV_SDRAM];
>       bpim2u_binfo.ram_size = machine->ram_size;
>       bpim2u_binfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
> -    arm_load_kernel(ARM_CPU(first_cpu), machine, &bpim2u_binfo);
> +    arm_load_kernel(ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU)), machine,
> +                    &bpim2u_binfo);
>   }
>   
>   static void bpim2u_machine_init(MachineClass *mc)
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index f7def3a60c..71c0775984 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -781,7 +781,7 @@ static void do_cpu_reset(void *opaque)
>   
>                   /* Set to non-secure if not a secure boot */
>                   if (!info->secure_boot &&
> -                    (cs != first_cpu || !info->secure_board_setup)) {
> +                    (cs != qemu_get_cpu(0, TYPE_ARM_CPU) || !info->secure_board_setup)) {
>                       /* Linux expects non-secure state */
>                       env->cp15.scr_el3 |= SCR_NS;
>                       /* Set NSACR.{CP11,CP10} so NS can access the FPU */
> @@ -800,7 +800,7 @@ static void do_cpu_reset(void *opaque)
>                   cpsr_write(env, ARM_CPU_MODE_HYP, CPSR_M, CPSRWriteRaw);
>               }
>   
> -            if (cs == first_cpu) {
> +            if (cs == qemu_get_cpu(0, TYPE_ARM_CPU)) {
>                   AddressSpace *as = arm_boot_address_space(cpu, info);
>   
>                   cpu_set_pc(cs, info->loader_start);
> @@ -1187,7 +1187,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
>       }
>       info->is_linux = is_linux;
>   
> -    for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
> +    for (cs = qemu_get_cpu(0, TYPE_ARM_CPU); cs; cs = CPU_NEXT(cs)) {
>           ARM_CPU(cs)->env.boot_info = info;
>       }
>   }
> @@ -1264,7 +1264,7 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
>        * actually loading a kernel, the handler is also responsible for
>        * arranging that we start it correctly.
>        */
> -    for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
> +    for (cs = qemu_get_cpu(0, TYPE_ARM_CPU); cs; cs = CPU_NEXT(cs)) {
>           qemu_register_reset(do_cpu_reset, ARM_CPU(cs));
>           nb_cpus++;
>       }
> @@ -1325,7 +1325,7 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
>       }
>   
>       if (info->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED) {
> -        for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
> +        for (cs = qemu_get_cpu(0, TYPE_ARM_CPU); cs; cs = CPU_NEXT(cs)) {
>               Object *cpuobj = OBJECT(cs);
>   
>               object_property_set_int(cpuobj, "psci-conduit", info->psci_conduit,
> @@ -1335,7 +1335,7 @@ void arm_load_kernel(ARMCPU *cpu, MachineState *ms, struct arm_boot_info *info)
>                * code in do_cpu_reset(), we assume first_cpu is the primary
>                * CPU.
>                */
> -            if (cs != first_cpu) {
> +            if (cs != qemu_get_cpu(0, TYPE_ARM_CPU)) {
>                   object_property_set_bool(cpuobj, "start-powered-off", true,
>                                            &error_abort);
>               }
> diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
> index ef5bcbc212..f8cf0588b4 100644
> --- a/hw/arm/exynos4_boards.c
> +++ b/hw/arm/exynos4_boards.c
> @@ -136,7 +136,8 @@ static void nuri_init(MachineState *machine)
>   {
>       exynos4_boards_init_common(machine, EXYNOS4_BOARD_NURI);
>   
> -    arm_load_kernel(ARM_CPU(first_cpu), machine, &exynos4_board_binfo);
> +    arm_load_kernel(ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU)), machine,
> +                    &exynos4_board_binfo);
>   }
>   
>   static void smdkc210_init(MachineState *machine)
> @@ -146,7 +147,8 @@ static void smdkc210_init(MachineState *machine)
>   
>       lan9215_init(SMDK_LAN9118_BASE_ADDR,
>               qemu_irq_invert(s->soc.irq_table[exynos4210_get_irq(37, 1)]));
> -    arm_load_kernel(ARM_CPU(first_cpu), machine, &exynos4_board_binfo);
> +    arm_load_kernel(ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU)), machine,
> +                    &exynos4_board_binfo);
>   }
>   
>   static void nuri_class_init(ObjectClass *oc, void *data)
> diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
> index f12aacea6b..393fa8a468 100644
> --- a/hw/arm/highbank.c
> +++ b/hw/arm/highbank.c
> @@ -328,7 +328,8 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
>       highbank_binfo.board_setup_addr = BOARD_SETUP_ADDR;
>       highbank_binfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
>   
> -    arm_load_kernel(ARM_CPU(first_cpu), machine, &highbank_binfo);
> +    arm_load_kernel(ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU)), machine,
> +                    &highbank_binfo);
>   }
>   
>   static void highbank_init(MachineState *machine)
> diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
> index 50df362088..19c2fc3b8e 100644
> --- a/hw/arm/microbit.c
> +++ b/hw/arm/microbit.c
> @@ -56,7 +56,8 @@ static void microbit_init(MachineState *machine)
>       memory_region_add_subregion_overlap(&s->nrf51.container, NRF51_TWI_BASE,
>                                           mr, -1);
>   
> -    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> +    armv7m_load_kernel(ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU)),
> +                       machine->kernel_filename,
>                          0, s->nrf51.flash_size);
>   }
>   
> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index eae3639da2..0b26eab45d 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -1217,7 +1217,8 @@ static void mps2tz_common_init(MachineState *machine)
>                                       mms->remap_irq);
>       }
>   
> -    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> +    armv7m_load_kernel(ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU)),
> +                       machine->kernel_filename,
>                          0, boot_ram_size(mms));
>   }
>   
> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> index d92fd60684..86e5ca0ce6 100644
> --- a/hw/arm/mps2.c
> +++ b/hw/arm/mps2.c
> @@ -462,7 +462,8 @@ static void mps2_common_init(MachineState *machine)
>                    qdev_get_gpio_in(armv7m,
>                                     mmc->fpga_type == FPGA_AN511 ? 47 : 13));
>   
> -    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> +    armv7m_load_kernel(ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU)),
> +                       machine->kernel_filename,
>                          0, 0x400000);
>   }
>   
> diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
> index 7b3106c790..42a3eb4905 100644
> --- a/hw/arm/msf2-som.c
> +++ b/hw/arm/msf2-som.c
> @@ -100,7 +100,8 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
>       cs_line = qdev_get_gpio_in_named(spi_flash, SSI_GPIO_CS, 0);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&soc->spi[0]), 1, cs_line);
>   
> -    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> +    armv7m_load_kernel(ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU)),
> +                       machine->kernel_filename,
>                          0, soc->envm_size);
>   }
>   
> diff --git a/hw/arm/musca.c b/hw/arm/musca.c
> index 6eeee57c9d..8d9b93d931 100644
> --- a/hw/arm/musca.c
> +++ b/hw/arm/musca.c
> @@ -597,7 +597,8 @@ static void musca_init(MachineState *machine)
>                                                        "cfg_sec_resp", 0));
>       }
>   
> -    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> +    armv7m_load_kernel(ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU)),
> +                       machine->kernel_filename,
>                          0, 0x2000000);
>   }
>   
> diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
> index 83753d53a3..61fe0346fe 100644
> --- a/hw/arm/netduino2.c
> +++ b/hw/arm/netduino2.c
> @@ -48,7 +48,8 @@ static void netduino2_init(MachineState *machine)
>       qdev_connect_clock_in(dev, "sysclk", sysclk);
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>   
> -    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> +    armv7m_load_kernel(ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU)),
> +                       machine->kernel_filename,
>                          0, FLASH_SIZE);
>   }
>   
> diff --git a/hw/arm/netduinoplus2.c b/hw/arm/netduinoplus2.c
> index 515c081605..ad68421b97 100644
> --- a/hw/arm/netduinoplus2.c
> +++ b/hw/arm/netduinoplus2.c
> @@ -48,7 +48,7 @@ static void netduinoplus2_init(MachineState *machine)
>       qdev_connect_clock_in(dev, "sysclk", sysclk);
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>   
> -    armv7m_load_kernel(ARM_CPU(first_cpu),
> +    armv7m_load_kernel(ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU)),
>                          machine->kernel_filename,
>                          0, FLASH_SIZE);
>   }
> diff --git a/hw/arm/olimex-stm32-h405.c b/hw/arm/olimex-stm32-h405.c
> index 3aa61c91b7..a44c6188c4 100644
> --- a/hw/arm/olimex-stm32-h405.c
> +++ b/hw/arm/olimex-stm32-h405.c
> @@ -51,7 +51,7 @@ static void olimex_stm32_h405_init(MachineState *machine)
>       qdev_connect_clock_in(dev, "sysclk", sysclk);
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>   
> -    armv7m_load_kernel(ARM_CPU(first_cpu),
> +    armv7m_load_kernel(ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU)),
>                          machine->kernel_filename,
>                          0, FLASH_SIZE);
>   }
> diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
> index 10653361ed..7d44715111 100644
> --- a/hw/arm/orangepi.c
> +++ b/hw/arm/orangepi.c
> @@ -105,7 +105,8 @@ static void orangepi_init(MachineState *machine)
>       orangepi_binfo.loader_start = h3->memmap[AW_H3_DEV_SDRAM];
>       orangepi_binfo.ram_size = machine->ram_size;
>       orangepi_binfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
> -    arm_load_kernel(ARM_CPU(first_cpu), machine, &orangepi_binfo);
> +    arm_load_kernel(ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU)), machine,
> +                    &orangepi_binfo);
>   }
>   
>   static void orangepi_machine_init(MachineClass *mc)
> diff --git a/hw/arm/realview.c b/hw/arm/realview.c
> index 8f89526596..be709146c8 100644
> --- a/hw/arm/realview.c
> +++ b/hw/arm/realview.c
> @@ -136,7 +136,7 @@ static void realview_init(MachineState *machine,
>   
>           cpu_irq[n] = qdev_get_gpio_in(DEVICE(cpuobj), ARM_CPU_IRQ);
>       }
> -    cpu = ARM_CPU(first_cpu);
> +    cpu = ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU));
>       env = &cpu->env;
>       if (arm_feature(env, ARM_FEATURE_V7)) {
>           if (is_mpcore) {
> @@ -384,7 +384,8 @@ static void realview_init(MachineState *machine,
>       realview_binfo.ram_size = ram_size;
>       realview_binfo.board_id = realview_board_id[board_type];
>       realview_binfo.loader_start = (board_type == BOARD_PB_A8 ? 0x70000000 : 0);
> -    arm_load_kernel(ARM_CPU(first_cpu), machine, &realview_binfo);
> +    arm_load_kernel(ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU)), machine,
> +                    &realview_binfo);
>   }
>   
>   static void realview_eb_init(MachineState *machine)
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index a85004809f..01c948725c 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -844,7 +844,8 @@ static void sbsa_ref_init(MachineState *machine)
>       sms->bootinfo.loader_start = sbsa_ref_memmap[SBSA_MEM].base;
>       sms->bootinfo.get_dtb = sbsa_ref_dtb;
>       sms->bootinfo.firmware_loaded = firmware_loaded;
> -    arm_load_kernel(ARM_CPU(first_cpu), machine, &sms->bootinfo);
> +    arm_load_kernel(ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU)), machine,
> +                    &sms->bootinfo);
>   }
>   
>   static const CPUArchIdList *sbsa_ref_possible_cpu_arch_ids(MachineState *ms)
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index aa5b0ddfaa..0920b9cb86 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -1307,7 +1307,8 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>       create_unimplemented_device("hibernation", 0x400fc000, 0x1000);
>       create_unimplemented_device("flash-control", 0x400fd000, 0x1000);
>   
> -    armv7m_load_kernel(ARM_CPU(first_cpu), ms->kernel_filename, 0, flash_size);
> +    armv7m_load_kernel(ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU)),
> +                       ms->kernel_filename, 0, flash_size);
>   }
>   
>   /* FIXME: Figure out how to generate these from stellaris_boards.  */
> diff --git a/hw/arm/stm32vldiscovery.c b/hw/arm/stm32vldiscovery.c
> index 67675e952f..2df943295b 100644
> --- a/hw/arm/stm32vldiscovery.c
> +++ b/hw/arm/stm32vldiscovery.c
> @@ -51,7 +51,7 @@ static void stm32vldiscovery_init(MachineState *machine)
>       qdev_connect_clock_in(dev, "sysclk", sysclk);
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>   
> -    armv7m_load_kernel(ARM_CPU(first_cpu),
> +    armv7m_load_kernel(ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU)),
>                          machine->kernel_filename,
>                          0, FLASH_SIZE);
>   }
> diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
> index e20d865d5a..8107a7057a 100644
> --- a/hw/arm/vexpress.c
> +++ b/hw/arm/vexpress.c
> @@ -712,7 +712,8 @@ static void vexpress_common_init(MachineState *machine)
>       daughterboard->bootinfo.modify_dtb = vexpress_modify_dtb;
>       /* When booting Linux we should be in secure state if the CPU has one. */
>       daughterboard->bootinfo.secure_boot = vms->secure;
> -    arm_load_kernel(ARM_CPU(first_cpu), machine, &daughterboard->bootinfo);
> +    arm_load_kernel(ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU)), machine,
> +                    &daughterboard->bootinfo);
>   }
>   
>   static bool vexpress_get_secure(Object *obj, Error **errp)
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index da5b738f0a..9f69be85ce 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -605,7 +605,7 @@ static void fdt_add_gic_node(VirtMachineState *vms)
>   
>   static void fdt_add_pmu_nodes(const VirtMachineState *vms)
>   {
> -    ARMCPU *armcpu = ARM_CPU(first_cpu);
> +    ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU));
>       uint32_t irqflags = GIC_FDT_IRQ_FLAGS_LEVEL_HI;
>       MachineState *ms = MACHINE(vms);
>   
> @@ -1652,7 +1652,7 @@ void virt_machine_done(Notifier *notifier, void *data)
>       VirtMachineState *vms = container_of(notifier, VirtMachineState,
>                                            machine_done);
>       MachineState *ms = MACHINE(vms);
> -    ARMCPU *cpu = ARM_CPU(first_cpu);
> +    ARMCPU *cpu = ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU));
>       struct arm_boot_info *info = &vms->bootinfo;
>       AddressSpace *as = arm_boot_address_space(cpu, info);
>   
> @@ -1957,9 +1957,11 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
>       bool aarch64, pmu, steal_time;
>       CPUState *cpu;
>   
> -    aarch64 = object_property_get_bool(OBJECT(first_cpu), "aarch64", NULL);
> -    pmu = object_property_get_bool(OBJECT(first_cpu), "pmu", NULL);
> -    steal_time = object_property_get_bool(OBJECT(first_cpu),
> +    aarch64 = object_property_get_bool(OBJECT(qemu_get_cpu(0, TYPE_ARM_CPU)),
> +                                       "aarch64", NULL);
> +    pmu = object_property_get_bool(OBJECT(qemu_get_cpu(0, TYPE_ARM_CPU)),
> +                                   "pmu", NULL);
> +    steal_time = object_property_get_bool(OBJECT(qemu_get_cpu(0, TYPE_ARM_CPU)),
>                                             "kvm-steal-time", NULL);
>   
>       if (kvm_enabled()) {
> @@ -2001,7 +2003,7 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
>       } else {
>           if (aarch64 && vms->highmem) {
>               int requested_pa_size = 64 - clz64(vms->highest_gpa);
> -            int pamax = arm_pamax(ARM_CPU(first_cpu));
> +            int pamax = arm_pamax(ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU)));
>   
>               if (pamax < requested_pa_size) {
>                   error_report("VCPU supports less PA bits (%d) than "
> @@ -2324,7 +2326,8 @@ static void machvirt_init(MachineState *machine)
>       vms->bootinfo.skip_dtb_autoload = true;
>       vms->bootinfo.firmware_loaded = firmware_loaded;
>       vms->bootinfo.psci_conduit = vms->psci_conduit;
> -    arm_load_kernel(ARM_CPU(first_cpu), machine, &vms->bootinfo);
> +    arm_load_kernel(ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU)), machine,
> +                    &vms->bootinfo);
>   
>       vms->machine_done.notify = virt_machine_done;
>       qemu_add_machine_init_done_notifier(&vms->machine_done);
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 8dc2ea83a9..90a052b841 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -349,7 +349,8 @@ static void zynq_init(MachineState *machine)
>       zynq_binfo.board_setup_addr = BOARD_SETUP_ADDR;
>       zynq_binfo.write_board_setup = zynq_write_board_setup;
>   
> -    arm_load_kernel(ARM_CPU(first_cpu), machine, &zynq_binfo);
> +    arm_load_kernel(ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU)), machine,
> +                    &zynq_binfo);
>   }
>   
>   static void zynq_machine_class_init(ObjectClass *oc, void *data)
> diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
> index 2d8e41ab8a..25dffccb99 100644
> --- a/target/arm/arch_dump.c
> +++ b/target/arm/arch_dump.c
> @@ -395,11 +395,11 @@ int cpu_get_dump_info(ArchDumpInfo *info,
>       GuestPhysBlock *block;
>       hwaddr lowest_addr = ULLONG_MAX;
>   
> -    if (first_cpu == NULL) {
> +    if (qemu_get_cpu(0, TYPE_ARM_CPU) == NULL) {
>           return -1;
>       }
>   
> -    cpu = ARM_CPU(first_cpu);
> +    cpu = ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU));
>       env = &cpu->env;
>   
>       /* Take a best guess at the phys_base. If we get it wrong then crash
> @@ -443,7 +443,7 @@ int cpu_get_dump_info(ArchDumpInfo *info,
>   
>   ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
>   {
> -    ARMCPU *cpu = ARM_CPU(first_cpu);
> +    ARMCPU *cpu = ARM_CPU(qemu_get_cpu(0, TYPE_ARM_CPU));
>       size_t note_size;
>   
>       if (class == ELFCLASS64) {


