Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2039EE14C3
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 00:36:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qe30l-0002Iv-UP; Wed, 06 Sep 2023 20:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe30k-0002E6-J3
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 20:36:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qe30g-0000bq-3J
 for qemu-riscv@nongnu.org; Wed, 06 Sep 2023 20:36:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694046997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bkLRxUCM4LiaWE+O0yoFhEV1USIHt+mGWPVf3kWLKPI=;
 b=CEIUD26Jq0qscXyEIBkPg51rk47Ki41UfSG1/ZjnNd3Dlj6cZtwsIiPsNbdNb5gUgj1x1L
 xrm0d4YaWjQ7EU9s80jyzZRO1mkDrTw+BfBjOoIkXCOX+6o25AMV50SUYznLfZFl0Ipwk9
 C1XQ3oTs2wWsTGq4lsGX1KouJ/ztPwQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-guadNpvFNFGXm9-1qNJkow-1; Wed, 06 Sep 2023 20:36:33 -0400
X-MC-Unique: guadNpvFNFGXm9-1qNJkow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB210800C78;
 Thu,  7 Sep 2023 00:36:30 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A93BC03295;
 Thu,  7 Sep 2023 00:36:10 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, imp@bsdimp.com, kevans@freebsd.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, mrolnik@gmail.com, edgar.iglesias@gmail.com,
 bcain@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com, chenhuacai@kernel.org, crwulff@gmail.com,
 marex@denx.de, shorne@gmail.com, clg@kaod.org, david@gibson.dropbear.id.au,
 groug@kaod.org, npiggin@gmail.com, ysato@users.sourceforge.jp,
 david@redhat.com, thuth@redhat.com, iii@linux.ibm.com,
 mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com,
 kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v3 00/32] Unified CPU type check
Date: Thu,  7 Sep 2023 10:35:21 +1000
Message-ID: <20230907003553.1636896-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

There are two places where the user specified CPU type is checked to see
if it's supported or allowed by the board: machine_run_board_init() and
mc->init(). We don't have to maintain two duplicate sets of logic. This
series intends to move the check to machine_run_board_init().

PATCH[01]    Adds a generic helper cpu_model_from_type() to convert CPU
             type name to CPU model name.
PATCH[02-19] Uses cpu_model_from_type() in the individual targets
PATCH[20-23] Implements cpu_list() for the missed targets
PATCH[24-27] Improves the CPU type validation in machine_run_board_init()
PATCH[28-32] Validate the CPU type in machine_run_board_init() for the
             individual boards

v1: https://lists.nongnu.org/archive/html/qemu-arm/2023-07/msg00302.html
v2: https://lists.nongnu.org/archive/html/qemu-arm/2023-07/msg00528.html

Testing
=======

With the following command lines, the output messages are varied before
and after the series is applied.

  ./build/qemu-system-aarch64            \
  -accel tcg -machine virt,gic-version=3 \
  -cpu cortex-a8 -smp maxcpus=2,cpus=1   \
    :

Before the series is applied:

  qemu-system-aarch64: mach-virt: CPU type cortex-a8-arm-cpu not supported

After the series is applied:

  qemu-system-aarch64: Invalid CPU type: cortex-a8-arm-cpu
  The valid models are: cortex-a7, cortex-a15, cortex-a35, cortex-a55,
                        cortex-a72, cortex-a76, a64fx, neoverse-n1,
                        neoverse-v1, cortex-a53, cortex-a57, max

Changelog
=========
v3:
  * Generic helper cpu_model_from_type()                        (Igor)
  * Apply cpu_model_from_type() to the individual targets       (Igor)
  * Implement cpu_list() for the missed targets                 (Gavin)
  * Remove mc->valid_cpu_models                                 (Richard)
  * Separate patch to constify mc->validate_cpu_types           (Gavin)
v2:
  * Constify mc->valid_cpu_types                                (Richard)
  * Print the supported CPU models, instead of typenames        (Peter)
  * Misc improvements for the hleper to do the check            (Igor)
  * More patches to move the check                              (Marcin)

Gavin Shan (32):
  cpu: Add helper cpu_model_from_type()
  target/alpha: Use generic helper to show CPU model names
  target/arm: Use generic helper to show CPU model names
  target/avr: Use generic helper to show CPU model names
  target/cris: Use generic helper to show CPU model names
  target/hexagon: Use generic helper to show CPU model names
  target/i386: Use generic helper to show CPU model names
  target/loongarch: Use generic helper to show CPU model names
  target/m68k: Use generic helper to show CPU model names
  target/mips: Use generic helper to show CPU model names
  target/openrisc: Use generic helper to show CPU model names
  target/ppc: Use generic helper to show CPU model names
  target/riscv: Use generic helper to show CPU model names
  target/rx: Use generic helper to show CPU model names
  target/s390x: Use generic helper to show CPU model names
  target/sh4: Use generic helper to show CPU model names
  target/tricore: Use generic helper to show CPU model names
  target/sparc: Improve sparc_cpu_class_by_name()
  target/xtensa: Improve xtensa_cpu_class_by_name()
  target/hppa: Implement hppa_cpu_list()
  target/microblaze: Implement microblaze_cpu_list()
  target/nios2: Implement nios2_cpu_list()
  Mark cpu_list() supported on all targets
  machine: Constify MachineClass::valid_cpu_types[i]
  machine: Use error handling when CPU type is checked
  machine: Introduce helper is_cpu_type_supported()
  machine: Print CPU model name instead of CPU type name
  hw/arm/virt: Check CPU type in machine_run_board_init()
  hw/arm/virt: Hide host CPU model for tcg
  hw/arm/sbsa-ref: Check CPU type in machine_run_board_init()
  hw/arm: Check CPU type in machine_run_board_init()
  hw/riscv/shakti_c: Check CPU type in machine_run_board_init()

 bsd-user/main.c                       |  3 -
 cpu.c                                 | 19 +++++-
 hw/arm/bananapi_m2u.c                 | 12 ++--
 hw/arm/cubieboard.c                   | 12 ++--
 hw/arm/mps2-tz.c                      | 20 ++++--
 hw/arm/mps2.c                         | 25 ++++++--
 hw/arm/msf2-som.c                     | 12 ++--
 hw/arm/musca.c                        | 13 ++--
 hw/arm/npcm7xx_boards.c               | 13 ++--
 hw/arm/orangepi.c                     | 12 ++--
 hw/arm/sbsa-ref.c                     | 21 +------
 hw/arm/virt.c                         | 23 ++-----
 hw/core/machine.c                     | 90 ++++++++++++++++-----------
 hw/m68k/q800.c                        |  2 +-
 hw/riscv/shakti_c.c                   | 11 ++--
 include/hw/boards.h                   |  2 +-
 include/hw/core/cpu.h                 | 12 ++++
 target/alpha/cpu.c                    |  6 +-
 target/arm/arm-qmp-cmds.c             |  6 +-
 target/arm/helper.c                   | 12 ++--
 target/avr/cpu.c                      | 23 +++++--
 target/cris/cpu.c                     |  7 +--
 target/hexagon/cpu.c                  | 12 ++--
 target/hppa/cpu.c                     | 19 ++++++
 target/hppa/cpu.h                     |  3 +
 target/i386/cpu.c                     |  7 +--
 target/loongarch/cpu.c                |  5 +-
 target/loongarch/loongarch-qmp-cmds.c |  3 +-
 target/m68k/helper.c                  | 14 ++---
 target/microblaze/cpu.c               | 20 ++++++
 target/microblaze/cpu.h               |  3 +
 target/mips/cpu-defs.c.inc            |  9 ---
 target/mips/cpu.c                     | 25 +++++++-
 target/mips/sysemu/mips-qmp-cmds.c    |  3 +-
 target/nios2/cpu.c                    | 20 ++++++
 target/nios2/cpu.h                    |  3 +
 target/openrisc/cpu.c                 | 23 +++----
 target/ppc/cpu_init.c                 | 11 ++--
 target/riscv/cpu.c                    | 23 ++++---
 target/riscv/riscv-qmp-cmds.c         |  3 +-
 target/rx/cpu.c                       | 16 +++--
 target/s390x/cpu_models.c             | 18 +++---
 target/s390x/cpu_models_sysemu.c      |  9 ++-
 target/sh4/cpu.c                      | 24 +++----
 target/sparc/cpu.c                    |  7 ++-
 target/tricore/cpu.c                  |  9 +--
 target/tricore/helper.c               | 13 ++--
 target/xtensa/cpu.c                   |  9 +--
 48 files changed, 397 insertions(+), 270 deletions(-)

-- 
2.41.0


