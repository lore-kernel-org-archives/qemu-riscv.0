Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9392BCDB474
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 13:49:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1quvIH-0004g8-4g; Mon, 23 Oct 2023 09:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1quvI0-0004dI-JY; Mon, 23 Oct 2023 09:48:17 -0400
Received: from mgamail.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1quvHw-00006J-Rc; Mon, 23 Oct 2023 09:48:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698068892; x=1729604892;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+gCEJuL8BOrhmc3PlOunDBDDz/6AkMm392ljDivKGoQ=;
 b=HYFvmeCShRU/L0PHl52QvsIcNI++eVxWcFRTFLFjUCRbLELGIKNkQ7k9
 wNNsujZqDDtjFnSNoqw+5BE2mRj48YG+ncRN7ym9TtymkvYuXNmg3D2es
 m/qGhSdyvLlF2Z6/QuFtHq0IMKvvl/Kvs94BU1g6hR1YBUemnoCcFi6bT
 UTYilEXIPFvUqQ+gN1KlKQu86dj1HGUkJGGEv64Uy3nL1bD45XXDbdhoW
 WDYOmuTjE/sCig20TTN36tkSfmUzP5d2oJ1hJWVLhiQb9WVxZLyfwMVi4
 NTpQixjv525ZcYZVWS2UBvZI6CVez81CVwb6ClRel+SeNxKT1PZbIKe99 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="366188201"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="366188201"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 06:48:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="881765645"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="881765645"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.36])
 by orsmga004.jf.intel.com with ESMTP; 23 Oct 2023 06:48:01 -0700
Date: Mon, 23 Oct 2023 21:59:40 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH 00/19] cpus: Step toward removing global 'first_cpu'
Message-ID: <ZTZ8TEGmc4WXGRnp@intel.com>
References: <20231020163643.86105-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231020163643.86105-1-philmd@linaro.org>
Received-SPF: pass client-ip=192.55.52.136; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi Philippe,

On Fri, Oct 20, 2023 at 06:36:22PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Fri, 20 Oct 2023 18:36:22 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH 00/19] cpus: Step toward removing global 'first_cpu'
> X-Mailer: git-send-email 2.41.0
> 
> Heterogeneous machines have different type of CPU.
> In that context, both 'first_cpu' and qemu_get_cpu(index)
> don't make much sense.

Could you talk more about what the issue that heterogeneous machines
will meet on these 2 things?

This question relates to when one should need to pay attention to CPU
type.

> 
> This series first add a 'filter CPU type' argument to
> qemu_get_cpu(), so the behavior respects what we currently
> expect, then replace 'first_cpu' by a qemu_get_cpu(0) call.

Considering that the current uses of first_cpu and qemu_get_cpu(index)
are CPU type-agnostic, would it be more straightforward to convert most
of the current uses to qemu_get_cpu(index, NULL)?

Regards,
Zhao

> 
> Testing pass, but I'm still unsure about performance impact.
> 
> With this series applied, what is left is:
> 
> [OK]
> 
>  -  hw/core/generic-loader.c:127:        s->cpu = qemu_get_cpu(s->cpu_num, NULL);
>  -  linux-user/syscall.c:8990:        if (CPU_NEXT(first_cpu)) {
>  -  monitor/hmp-cmds-target.c:106:        cs = vcpu >= 0 ? qemu_get_cpu(vcpu, NULL) : mon_get_cpu(mon);
>  -  stats/stats-hmp-cmds.c:150:        CPUState *cpu = qemu_get_cpu(cpu_index, NULL);
>  -  system/cpus.c:754:    cpu = qemu_get_cpu(cpu_index, NULL);
> 
> [likely OK, we don't support heterogeneous accelerators]
> 
>  -  accel/kvm/kvm-all.c:3581:    kvm_arch_on_sigbus_vcpu(first_cpu, code, addr);
>  -  accel/kvm/kvm-all.c:4255:    if (first_cpu) {
>  -  accel/kvm/kvm-all.c:4258:        query_stats_schema_vcpu(first_cpu, &stats_args);
> 
> [need some toughts...]
> 
>  -  accel/tcg/tcg-accel-ops-rr.c:114:        qemu_cond_wait_iothread(first_cpu->halt_cond);
>  -  accel/tcg/tcg-accel-ops-rr.c:200:    while (first_cpu->stopped) {
>  -  accel/tcg/tcg-accel-ops-rr.c:201:        qemu_cond_wait_iothread(first_cpu->halt_cond);
>  -  accel/tcg/tcg-accel-ops-rr.c:212:    cpu = first_cpu;
>  -  accel/tcg/tcg-accel-ops-rr.c:242:            cpu = first_cpu;
>  -  accel/tcg/tcg-accel-ops-rr.c:336:        cpu->thread_id = first_cpu->thread_id;
>  -  accel/tcg/tcg-accel-ops-rr.c:92:    if (!rr_kick_vcpu_timer && CPU_NEXT(first_cpu)) {
>  -  dump/win_dump.c:115:    if (cpu_memory_rw_debug(first_cpu,
>  -  dump/win_dump.c:128:    if (cpu_read_ptr(x64, first_cpu,
>  -  dump/win_dump.c:135:    if (cpu_memory_rw_debug(first_cpu, KiBugcheckData,
>  -  dump/win_dump.c:210:    if (cpu_memory_rw_debug(first_cpu,
>  -  dump/win_dump.c:258:    if (cpu_read_ptr(x64, first_cpu,
>  -  dump/win_dump.c:265:    if (cpu_memory_rw_debug(first_cpu,
>  -  dump/win_dump.c:286:        if (cpu_read_ptr(x64, first_cpu,
>  -  dump/win_dump.c:294:        if (cpu_read_ptr(x64, first_cpu,
>  -  dump/win_dump.c:378:        if (cpu_memory_rw_debug(first_cpu, Context,
>  -  dump/win_dump.c:384:        if (cpu_memory_rw_debug(first_cpu, Context,
>  -  dump/win_dump.c:400:        if (cpu_memory_rw_debug(first_cpu, saved_ctx[i].addr,
>  -  dump/win_dump.c:410:    X86CPU *first_x86_cpu = X86_CPU(first_cpu);
>  -  gdbstub/gdbstub.c:1521:    cc = CPU_GET_CLASS(first_cpu);
>  -  gdbstub/gdbstub.c:298:    CPUState *cpu = first_cpu;
>  -  gdbstub/system.c:338:    if (!first_cpu) {
>  -  hw/acpi/cpu.c:138:            if (!cdev->cpu || cdev->cpu == first_cpu) {
>  -  hw/acpi/cpu.c:150:            if (!cdev->cpu || cdev->cpu == first_cpu) {
>  -  hw/acpi/cpu.c:671:            if (CPU(arch_ids->cpus[i].cpu) != first_cpu) {
>  -  hw/core/generic-loader.c:134:        s->cpu = first_cpu;
>  -  monitor/hmp-cmds-target.c:39:    cpu = qemu_get_cpu(cpu_index, NULL);
>  -  monitor/hmp-cmds-target.c:62:        if (!first_cpu) {
>  -  monitor/hmp-cmds-target.c:65:        monitor_set_cpu(mon, first_cpu->cpu_index);
>  -  monitor/hmp-cmds-target.c:66:        cpu = first_cpu;
>  -  replay/replay-events.c:130:    qemu_cpu_kick(first_cpu);
>  -  system/cpu-timers.c:254:    } else if (first_cpu) {
>  -  system/cpu-timers.c:263:        async_run_on_cpu(first_cpu, do_nothing, RUN_ON_CPU_NULL);
>  -  system/memory_mapping.c:315:    first_paging_enabled_cpu = find_paging_enabled_cpu(first_cpu);
>  -  system/qtest.c:548:            address_space_write(first_cpu->as, ...
>  -  system/qtest.c:553:            address_space_write(first_cpu->as, ...
>  -  system/qtest.c:558:            address_space_write(first_cpu->as, ...
>  -  system/qtest.c:563:            address_space_write(first_cpu->as, ...
>  -  system/qtest.c:582:            address_space_read(first_cpu->as, ...
>  -  system/qtest.c:587:            address_space_read(first_cpu->as, ...
>  -  system/qtest.c:592:            address_space_read(first_cpu->as, ...
>  -  system/qtest.c:596:            address_space_read(first_cpu->as, ...
>  -  system/qtest.c:617:        address_space_read(first_cpu->as, ...
>  -  system/qtest.c:643:        address_space_read(first_cpu->as, ...
>  -  system/qtest.c:678:        address_space_write(first_cpu->as, ...
>  -  system/qtest.c:701:            address_space_write(first_cpu->as, ...
>  -  system/qtest.c:735:        address_space_write(first_cpu->as, ...
>  -  tests/qtest/fuzz/generic_fuzz.c:241:        mr1 = address_space_translate(first_cpu->as,
>  -  tests/qtest/fuzz/qtest_wrappers.c:110:        address_space_read(first_cpu->as, ...
>  -  tests/qtest/fuzz/qtest_wrappers.c:122:        address_space_read(first_cpu->as, ...
>  -  tests/qtest/fuzz/qtest_wrappers.c:134:        address_space_read(first_cpu->as, ...
>  -  tests/qtest/fuzz/qtest_wrappers.c:146:        address_space_read(first_cpu->as, ...
>  -  tests/qtest/fuzz/qtest_wrappers.c:157:        address_space_write(first_cpu->as, ...
>  -  tests/qtest/fuzz/qtest_wrappers.c:167:        address_space_write(first_cpu->as, ...
>  -  tests/qtest/fuzz/qtest_wrappers.c:177:        address_space_write(first_cpu->as, ...
>  -  tests/qtest/fuzz/qtest_wrappers.c:187:        address_space_write(first_cpu->as, ...
>  -  tests/qtest/fuzz/qtest_wrappers.c:197:        address_space_read(first_cpu->as, ...
>  -  tests/qtest/fuzz/qtest_wrappers.c:207:        address_space_read(first_cpu->as, ...
>  -  tests/qtest/fuzz/qtest_wrappers.c:218:        address_space_write(first_cpu->as, ...
>  -  tests/qtest/fuzz/qtest_wrappers.c:229:        address_space_write(first_cpu->as, ...
>  -  tests/qtest/fuzz/qtest_wrappers.c:242:        address_space_write(first_cpu->as, ...
> 
> Regards,
> 
> Phil.
> 
> Based-on: <20231013140116.255-1-philmd@linaro.org>
>           "target: Make 'cpu-qom.h' really target agnostic" v2
> 
> Philippe Mathieu-Daudé (19):
>   cpus: Add argument to qemu_get_cpu() to filter CPUs by QOM type
>   cpus: Filter for target specific CPU (generic)
>   cpus: Filter for target specific CPU (arm)
>   cpus: Filter for target specific CPU (loongarch)
>   cpus: Filter for target specific CPU (mips)
>   cpus: Filter for target specific CPU (s390x)
>   cpus: Filter for target specific CPU (riscv)
>   cpus: Filter for target specific CPU (ppc)
>   cpus: Filter for target specific CPU (x86)
>   cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_ARM_CPU)
>   cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_POWERPC_CPU)
>   cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_MIPS_CPU)
>   cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_M68K_CPU)
>   cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_S390X_CPU)
>   cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_RISCV_CPU)
>   cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_TRICORE_CPU)
>   cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_SUPERH_CPU)
>   cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_RX_CPU)
>   cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_X86_CPU)
> 
>  include/hw/core/cpu.h               |  3 ++-
>  target/mips/internal.h              |  2 +-
>  cpu-common.c                        |  5 ++++-
>  hw/arm/aspeed.c                     |  5 +++--
>  hw/arm/bananapi_m2u.c               |  3 ++-
>  hw/arm/boot.c                       | 14 +++++++-------
>  hw/arm/exynos4_boards.c             |  6 ++++--
>  hw/arm/fsl-imx7.c                   |  2 +-
>  hw/arm/highbank.c                   |  3 ++-
>  hw/arm/microbit.c                   |  3 ++-
>  hw/arm/mps2-tz.c                    |  3 ++-
>  hw/arm/mps2.c                       |  3 ++-
>  hw/arm/msf2-som.c                   |  3 ++-
>  hw/arm/musca.c                      |  3 ++-
>  hw/arm/netduino2.c                  |  3 ++-
>  hw/arm/netduinoplus2.c              |  2 +-
>  hw/arm/olimex-stm32-h405.c          |  2 +-
>  hw/arm/orangepi.c                   |  3 ++-
>  hw/arm/pxa2xx_gpio.c                |  2 +-
>  hw/arm/realview.c                   |  5 +++--
>  hw/arm/sbsa-ref.c                   |  7 ++++---
>  hw/arm/stellaris.c                  |  3 ++-
>  hw/arm/stm32vldiscovery.c           |  2 +-
>  hw/arm/vexpress.c                   |  5 +++--
>  hw/arm/virt-acpi-build.c            |  2 +-
>  hw/arm/virt.c                       | 25 ++++++++++++++-----------
>  hw/arm/xilinx_zynq.c                |  3 ++-
>  hw/arm/xlnx-versal-virt.c           |  2 +-
>  hw/core/generic-loader.c            |  2 +-
>  hw/cpu/a15mpcore.c                  |  4 ++--
>  hw/cpu/a9mpcore.c                   |  2 +-
>  hw/hyperv/hyperv.c                  |  2 +-
>  hw/i386/kvm/clock.c                 |  4 ++--
>  hw/i386/kvm/xen_evtchn.c            |  8 ++++----
>  hw/i386/kvmvapic.c                  |  3 ++-
>  hw/i386/microvm.c                   |  2 +-
>  hw/i386/pc.c                        |  7 ++++---
>  hw/i386/pc_piix.c                   |  3 ++-
>  hw/i386/x86.c                       |  2 +-
>  hw/intc/arm_gicv3_common.c          |  3 ++-
>  hw/intc/arm_gicv3_cpuif.c           |  2 +-
>  hw/intc/arm_gicv3_kvm.c             |  2 +-
>  hw/intc/m68k_irqc.c                 |  2 +-
>  hw/intc/mips_gic.c                  |  2 +-
>  hw/intc/riscv_aclint.c              |  2 +-
>  hw/intc/sh_intc.c                   |  6 ++++--
>  hw/intc/sifive_plic.c               |  4 ++--
>  hw/isa/lpc_ich9.c                   |  2 +-
>  hw/loongarch/virt.c                 | 10 +++++-----
>  hw/m68k/mcf5206.c                   |  2 +-
>  hw/mips/bootloader.c                |  3 ++-
>  hw/mips/cps.c                       |  5 +++--
>  hw/mips/loongson3_bootp.c           |  2 +-
>  hw/mips/loongson3_virt.c            |  7 ++++---
>  hw/mips/malta.c                     |  2 +-
>  hw/misc/mips_cpc.c                  |  4 ++--
>  hw/ppc/e500.c                       |  4 ++--
>  hw/ppc/ppc.c                        |  4 ++--
>  hw/ppc/ppce500_spin.c               |  2 +-
>  hw/ppc/prep_systemio.c              |  2 +-
>  hw/ppc/spapr.c                      | 11 ++++++-----
>  hw/ppc/spapr_caps.c                 | 10 +++++-----
>  hw/ppc/spapr_rtas.c                 |  2 +-
>  hw/ppc/spapr_vof.c                  |  2 +-
>  hw/ppc/vof.c                        |  3 ++-
>  hw/riscv/boot.c                     |  4 ++--
>  hw/riscv/opentitan.c                |  4 ++--
>  hw/rx/rx-gdbsim.c                   |  4 ++--
>  hw/s390x/ipl.c                      |  4 ++--
>  hw/s390x/s390-virtio-ccw.c          |  2 +-
>  hw/tricore/triboard.c               |  2 +-
>  monitor/hmp-cmds-target.c           |  4 ++--
>  stats/stats-hmp-cmds.c              |  2 +-
>  system/cpus.c                       |  2 +-
>  target/arm/arch_dump.c              |  6 +++---
>  target/i386/arch_dump.c             |  6 +++---
>  target/i386/kvm/kvm.c               |  6 +++---
>  target/i386/kvm/xen-emu.c           | 15 ++++++++-------
>  target/i386/monitor.c               |  2 +-
>  target/i386/tcg/sysemu/fpu_helper.c |  4 ++--
>  target/mips/cpu.c                   |  2 +-
>  target/mips/tcg/sysemu/cp0_helper.c | 10 +++++-----
>  target/mips/tcg/sysemu/tlb_helper.c |  2 +-
>  target/ppc/arch_dump.c              |  4 ++--
>  target/riscv/arch_dump.c            |  4 ++--
>  target/s390x/cpu_models.c           | 10 +++++-----
>  86 files changed, 199 insertions(+), 163 deletions(-)
> 
> -- 
> 2.41.0
> 

