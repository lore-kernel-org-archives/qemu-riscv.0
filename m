Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97ADCDB474
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 16:37:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtsUe-000282-Su; Fri, 20 Oct 2023 12:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsUb-00021w-U3
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:36:58 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtsUU-0002Kd-9n
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 12:36:57 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-507a55302e0so1302714e87.0
 for <qemu-riscv@nongnu.org>; Fri, 20 Oct 2023 09:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697819808; x=1698424608; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pI/ALohNTygjWYZJ4KNy3EfaYpASbA7YyWD5BbOrL9M=;
 b=j4JYzmVS3e9D3QS/gZO/ZVhca/wFwswI8ebdmZ+UN8Y2LQoY2ezKdnZX5l+FC/rDzb
 ejBC60bK4O++xdhisLElenm7GtVlCF4f9Wgt/Cke2PPl0RKdVJpMkqev7Qa4CAXXiBBD
 JhZoV4HAd5JC7pEEpH+RBzLNRy9MdMiYB0MfIW9oPV6HJX7BqFY/dEdfg0X8xJibQOgc
 7l1aLE5Mz6cKnpA4koeu8fAa4zBb0CyypduamPOjsWQ2rCc9WWAEjmhtcxDhlseUyo/9
 dFJTw7b73j+U2QgJVn+IouG222mox1mLHKEvYcK6X48eZPXabHoAskfe/Hfiz7EjeHA2
 5CMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697819808; x=1698424608;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pI/ALohNTygjWYZJ4KNy3EfaYpASbA7YyWD5BbOrL9M=;
 b=Gz/y33WREsTqlgUpxYE/AJOZrKePyNyObtMEb/rWpxbpl4q+ry0RWejGxaj3eVatdJ
 3ItfJYK1oh9lcBucxS6sBWVF2NGW/22AT0KLMW1E2fnTB2b5+66Fgq74UCv+pz57HUy3
 GX7HK8VQH06WrYwOJoMfu+Bay9208uObQYCwuZeHfj0ql/3OUsHifvnQaD/noj+u6jSC
 TNQhcwk410pSwlW8A8hPzLW3heYW4Kn3FhT2dFbdCPEkxk4PcTzfrnBq4xTOXNxbQRBS
 2PK51kGUBYq1yg+dQ9hkvHEnuUlY+vaxN8+s3/VLIiDlUNr5h4M4R/+CsngIkDolegkl
 A+Hg==
X-Gm-Message-State: AOJu0YzeZUloYIGFDdFPb8p/Y1G0iswsyTFV9hrgpOAGVdrxhEMe22W0
 Jgt2WLmJMCGqw/12qjSDfMZXQg==
X-Google-Smtp-Source: AGHT+IH0HRtoxlheJWXcmfBy89wfyR4Dsk5kkRuvmKyASg/Ju/Aq5DB8mWvv9dxFiHpTNX0LSxHRnw==
X-Received: by 2002:a05:6512:78f:b0:507:bb8e:b644 with SMTP id
 x15-20020a056512078f00b00507bb8eb644mr1603987lfr.12.1697819808219; 
 Fri, 20 Oct 2023 09:36:48 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 p14-20020ac24ece000000b004fdde1db756sm429709lfr.26.2023.10.20.09.36.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 09:36:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/19] cpus: Step toward removing global 'first_cpu'
Date: Fri, 20 Oct 2023 18:36:22 +0200
Message-ID: <20231020163643.86105-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Heterogeneous machines have different type of CPU.
In that context, both 'first_cpu' and qemu_get_cpu(index)
don't make much sense.

This series first add a 'filter CPU type' argument to
qemu_get_cpu(), so the behavior respects what we currently
expect, then replace 'first_cpu' by a qemu_get_cpu(0) call.

Testing pass, but I'm still unsure about performance impact.

With this series applied, what is left is:

[OK]

 -  hw/core/generic-loader.c:127:        s->cpu = qemu_get_cpu(s->cpu_num, NULL);
 -  linux-user/syscall.c:8990:        if (CPU_NEXT(first_cpu)) {
 -  monitor/hmp-cmds-target.c:106:        cs = vcpu >= 0 ? qemu_get_cpu(vcpu, NULL) : mon_get_cpu(mon);
 -  stats/stats-hmp-cmds.c:150:        CPUState *cpu = qemu_get_cpu(cpu_index, NULL);
 -  system/cpus.c:754:    cpu = qemu_get_cpu(cpu_index, NULL);

[likely OK, we don't support heterogeneous accelerators]

 -  accel/kvm/kvm-all.c:3581:    kvm_arch_on_sigbus_vcpu(first_cpu, code, addr);
 -  accel/kvm/kvm-all.c:4255:    if (first_cpu) {
 -  accel/kvm/kvm-all.c:4258:        query_stats_schema_vcpu(first_cpu, &stats_args);

[need some toughts...]

 -  accel/tcg/tcg-accel-ops-rr.c:114:        qemu_cond_wait_iothread(first_cpu->halt_cond);
 -  accel/tcg/tcg-accel-ops-rr.c:200:    while (first_cpu->stopped) {
 -  accel/tcg/tcg-accel-ops-rr.c:201:        qemu_cond_wait_iothread(first_cpu->halt_cond);
 -  accel/tcg/tcg-accel-ops-rr.c:212:    cpu = first_cpu;
 -  accel/tcg/tcg-accel-ops-rr.c:242:            cpu = first_cpu;
 -  accel/tcg/tcg-accel-ops-rr.c:336:        cpu->thread_id = first_cpu->thread_id;
 -  accel/tcg/tcg-accel-ops-rr.c:92:    if (!rr_kick_vcpu_timer && CPU_NEXT(first_cpu)) {
 -  dump/win_dump.c:115:    if (cpu_memory_rw_debug(first_cpu,
 -  dump/win_dump.c:128:    if (cpu_read_ptr(x64, first_cpu,
 -  dump/win_dump.c:135:    if (cpu_memory_rw_debug(first_cpu, KiBugcheckData,
 -  dump/win_dump.c:210:    if (cpu_memory_rw_debug(first_cpu,
 -  dump/win_dump.c:258:    if (cpu_read_ptr(x64, first_cpu,
 -  dump/win_dump.c:265:    if (cpu_memory_rw_debug(first_cpu,
 -  dump/win_dump.c:286:        if (cpu_read_ptr(x64, first_cpu,
 -  dump/win_dump.c:294:        if (cpu_read_ptr(x64, first_cpu,
 -  dump/win_dump.c:378:        if (cpu_memory_rw_debug(first_cpu, Context,
 -  dump/win_dump.c:384:        if (cpu_memory_rw_debug(first_cpu, Context,
 -  dump/win_dump.c:400:        if (cpu_memory_rw_debug(first_cpu, saved_ctx[i].addr,
 -  dump/win_dump.c:410:    X86CPU *first_x86_cpu = X86_CPU(first_cpu);
 -  gdbstub/gdbstub.c:1521:    cc = CPU_GET_CLASS(first_cpu);
 -  gdbstub/gdbstub.c:298:    CPUState *cpu = first_cpu;
 -  gdbstub/system.c:338:    if (!first_cpu) {
 -  hw/acpi/cpu.c:138:            if (!cdev->cpu || cdev->cpu == first_cpu) {
 -  hw/acpi/cpu.c:150:            if (!cdev->cpu || cdev->cpu == first_cpu) {
 -  hw/acpi/cpu.c:671:            if (CPU(arch_ids->cpus[i].cpu) != first_cpu) {
 -  hw/core/generic-loader.c:134:        s->cpu = first_cpu;
 -  monitor/hmp-cmds-target.c:39:    cpu = qemu_get_cpu(cpu_index, NULL);
 -  monitor/hmp-cmds-target.c:62:        if (!first_cpu) {
 -  monitor/hmp-cmds-target.c:65:        monitor_set_cpu(mon, first_cpu->cpu_index);
 -  monitor/hmp-cmds-target.c:66:        cpu = first_cpu;
 -  replay/replay-events.c:130:    qemu_cpu_kick(first_cpu);
 -  system/cpu-timers.c:254:    } else if (first_cpu) {
 -  system/cpu-timers.c:263:        async_run_on_cpu(first_cpu, do_nothing, RUN_ON_CPU_NULL);
 -  system/memory_mapping.c:315:    first_paging_enabled_cpu = find_paging_enabled_cpu(first_cpu);
 -  system/qtest.c:548:            address_space_write(first_cpu->as, ...
 -  system/qtest.c:553:            address_space_write(first_cpu->as, ...
 -  system/qtest.c:558:            address_space_write(first_cpu->as, ...
 -  system/qtest.c:563:            address_space_write(first_cpu->as, ...
 -  system/qtest.c:582:            address_space_read(first_cpu->as, ...
 -  system/qtest.c:587:            address_space_read(first_cpu->as, ...
 -  system/qtest.c:592:            address_space_read(first_cpu->as, ...
 -  system/qtest.c:596:            address_space_read(first_cpu->as, ...
 -  system/qtest.c:617:        address_space_read(first_cpu->as, ...
 -  system/qtest.c:643:        address_space_read(first_cpu->as, ...
 -  system/qtest.c:678:        address_space_write(first_cpu->as, ...
 -  system/qtest.c:701:            address_space_write(first_cpu->as, ...
 -  system/qtest.c:735:        address_space_write(first_cpu->as, ...
 -  tests/qtest/fuzz/generic_fuzz.c:241:        mr1 = address_space_translate(first_cpu->as,
 -  tests/qtest/fuzz/qtest_wrappers.c:110:        address_space_read(first_cpu->as, ...
 -  tests/qtest/fuzz/qtest_wrappers.c:122:        address_space_read(first_cpu->as, ...
 -  tests/qtest/fuzz/qtest_wrappers.c:134:        address_space_read(first_cpu->as, ...
 -  tests/qtest/fuzz/qtest_wrappers.c:146:        address_space_read(first_cpu->as, ...
 -  tests/qtest/fuzz/qtest_wrappers.c:157:        address_space_write(first_cpu->as, ...
 -  tests/qtest/fuzz/qtest_wrappers.c:167:        address_space_write(first_cpu->as, ...
 -  tests/qtest/fuzz/qtest_wrappers.c:177:        address_space_write(first_cpu->as, ...
 -  tests/qtest/fuzz/qtest_wrappers.c:187:        address_space_write(first_cpu->as, ...
 -  tests/qtest/fuzz/qtest_wrappers.c:197:        address_space_read(first_cpu->as, ...
 -  tests/qtest/fuzz/qtest_wrappers.c:207:        address_space_read(first_cpu->as, ...
 -  tests/qtest/fuzz/qtest_wrappers.c:218:        address_space_write(first_cpu->as, ...
 -  tests/qtest/fuzz/qtest_wrappers.c:229:        address_space_write(first_cpu->as, ...
 -  tests/qtest/fuzz/qtest_wrappers.c:242:        address_space_write(first_cpu->as, ...

Regards,

Phil.

Based-on: <20231013140116.255-1-philmd@linaro.org>
          "target: Make 'cpu-qom.h' really target agnostic" v2

Philippe Mathieu-Daudé (19):
  cpus: Add argument to qemu_get_cpu() to filter CPUs by QOM type
  cpus: Filter for target specific CPU (generic)
  cpus: Filter for target specific CPU (arm)
  cpus: Filter for target specific CPU (loongarch)
  cpus: Filter for target specific CPU (mips)
  cpus: Filter for target specific CPU (s390x)
  cpus: Filter for target specific CPU (riscv)
  cpus: Filter for target specific CPU (ppc)
  cpus: Filter for target specific CPU (x86)
  cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_ARM_CPU)
  cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_POWERPC_CPU)
  cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_MIPS_CPU)
  cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_M68K_CPU)
  cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_S390X_CPU)
  cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_RISCV_CPU)
  cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_TRICORE_CPU)
  cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_SUPERH_CPU)
  cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_RX_CPU)
  cpus: Replace first_cpu by qemu_get_cpu(0, TYPE_X86_CPU)

 include/hw/core/cpu.h               |  3 ++-
 target/mips/internal.h              |  2 +-
 cpu-common.c                        |  5 ++++-
 hw/arm/aspeed.c                     |  5 +++--
 hw/arm/bananapi_m2u.c               |  3 ++-
 hw/arm/boot.c                       | 14 +++++++-------
 hw/arm/exynos4_boards.c             |  6 ++++--
 hw/arm/fsl-imx7.c                   |  2 +-
 hw/arm/highbank.c                   |  3 ++-
 hw/arm/microbit.c                   |  3 ++-
 hw/arm/mps2-tz.c                    |  3 ++-
 hw/arm/mps2.c                       |  3 ++-
 hw/arm/msf2-som.c                   |  3 ++-
 hw/arm/musca.c                      |  3 ++-
 hw/arm/netduino2.c                  |  3 ++-
 hw/arm/netduinoplus2.c              |  2 +-
 hw/arm/olimex-stm32-h405.c          |  2 +-
 hw/arm/orangepi.c                   |  3 ++-
 hw/arm/pxa2xx_gpio.c                |  2 +-
 hw/arm/realview.c                   |  5 +++--
 hw/arm/sbsa-ref.c                   |  7 ++++---
 hw/arm/stellaris.c                  |  3 ++-
 hw/arm/stm32vldiscovery.c           |  2 +-
 hw/arm/vexpress.c                   |  5 +++--
 hw/arm/virt-acpi-build.c            |  2 +-
 hw/arm/virt.c                       | 25 ++++++++++++++-----------
 hw/arm/xilinx_zynq.c                |  3 ++-
 hw/arm/xlnx-versal-virt.c           |  2 +-
 hw/core/generic-loader.c            |  2 +-
 hw/cpu/a15mpcore.c                  |  4 ++--
 hw/cpu/a9mpcore.c                   |  2 +-
 hw/hyperv/hyperv.c                  |  2 +-
 hw/i386/kvm/clock.c                 |  4 ++--
 hw/i386/kvm/xen_evtchn.c            |  8 ++++----
 hw/i386/kvmvapic.c                  |  3 ++-
 hw/i386/microvm.c                   |  2 +-
 hw/i386/pc.c                        |  7 ++++---
 hw/i386/pc_piix.c                   |  3 ++-
 hw/i386/x86.c                       |  2 +-
 hw/intc/arm_gicv3_common.c          |  3 ++-
 hw/intc/arm_gicv3_cpuif.c           |  2 +-
 hw/intc/arm_gicv3_kvm.c             |  2 +-
 hw/intc/m68k_irqc.c                 |  2 +-
 hw/intc/mips_gic.c                  |  2 +-
 hw/intc/riscv_aclint.c              |  2 +-
 hw/intc/sh_intc.c                   |  6 ++++--
 hw/intc/sifive_plic.c               |  4 ++--
 hw/isa/lpc_ich9.c                   |  2 +-
 hw/loongarch/virt.c                 | 10 +++++-----
 hw/m68k/mcf5206.c                   |  2 +-
 hw/mips/bootloader.c                |  3 ++-
 hw/mips/cps.c                       |  5 +++--
 hw/mips/loongson3_bootp.c           |  2 +-
 hw/mips/loongson3_virt.c            |  7 ++++---
 hw/mips/malta.c                     |  2 +-
 hw/misc/mips_cpc.c                  |  4 ++--
 hw/ppc/e500.c                       |  4 ++--
 hw/ppc/ppc.c                        |  4 ++--
 hw/ppc/ppce500_spin.c               |  2 +-
 hw/ppc/prep_systemio.c              |  2 +-
 hw/ppc/spapr.c                      | 11 ++++++-----
 hw/ppc/spapr_caps.c                 | 10 +++++-----
 hw/ppc/spapr_rtas.c                 |  2 +-
 hw/ppc/spapr_vof.c                  |  2 +-
 hw/ppc/vof.c                        |  3 ++-
 hw/riscv/boot.c                     |  4 ++--
 hw/riscv/opentitan.c                |  4 ++--
 hw/rx/rx-gdbsim.c                   |  4 ++--
 hw/s390x/ipl.c                      |  4 ++--
 hw/s390x/s390-virtio-ccw.c          |  2 +-
 hw/tricore/triboard.c               |  2 +-
 monitor/hmp-cmds-target.c           |  4 ++--
 stats/stats-hmp-cmds.c              |  2 +-
 system/cpus.c                       |  2 +-
 target/arm/arch_dump.c              |  6 +++---
 target/i386/arch_dump.c             |  6 +++---
 target/i386/kvm/kvm.c               |  6 +++---
 target/i386/kvm/xen-emu.c           | 15 ++++++++-------
 target/i386/monitor.c               |  2 +-
 target/i386/tcg/sysemu/fpu_helper.c |  4 ++--
 target/mips/cpu.c                   |  2 +-
 target/mips/tcg/sysemu/cp0_helper.c | 10 +++++-----
 target/mips/tcg/sysemu/tlb_helper.c |  2 +-
 target/ppc/arch_dump.c              |  4 ++--
 target/riscv/arch_dump.c            |  4 ++--
 target/s390x/cpu_models.c           | 10 +++++-----
 86 files changed, 199 insertions(+), 163 deletions(-)

-- 
2.41.0


