Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E714EC5CFC2
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 00:00:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r33HP-0007yf-4i; Tue, 14 Nov 2023 18:57:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33HM-0007wR-Ck
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 18:57:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r33HH-0006k9-GW
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 18:57:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700006224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8Ke/SSehHX8zHsgvtpbmPqDGZ0u7jii8Iz7ud5hiNZ8=;
 b=aiN1/NMTNYzTYqewnEdezIcnnqFmBS2vkxZGnfOXtbJ3kpxDrim1oWCvU8VYY3Ma3liDRH
 RWPR4fiSgAVRC7l7dOIwir/1NnLhs/CT5LGgrTMgoqn2RuUAkUJROpHXDZQTC4UvYYqxQL
 9j9nQzajRjy4NBE0qG37BUiPtoH/OV8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-YSBwxAPGOJeYRAIQuBr_LQ-1; Tue, 14 Nov 2023 18:57:01 -0500
X-MC-Unique: YSBwxAPGOJeYRAIQuBr_LQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3888101A529;
 Tue, 14 Nov 2023 23:56:59 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1321DC15885;
 Tue, 14 Nov 2023 23:56:44 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 philmd@linaro.org, b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, laurent@vivier.eu,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com, edgar.iglesias@gmail.com,
 bcain@quicinc.com, gaosong@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
Subject: [PATCH v5 00/31] Unified CPU type check
Date: Wed, 15 Nov 2023 09:55:57 +1000
Message-ID: <20231114235628.534334-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
series intends to move the check to machine_run_board_init() so that we
have unified CPU type check.

PATCH[01-04] consolidate CPUClass::class_by_name() so that the returned
             CPU class is checked for once in cpu_class_by_name()
PATCH[05]    add generic helper cpu_model_from_type() to extract the CPU
             model name from the CPU type name
PATCH[06]    add generic cpu_list(), to be reused by most of the targets
PATCH[07-21] switch to generic cpu_list() for most of the targets
PATCH[22]    use generic helper cpu_model_from_type() for several targets
PATCH[23-31] validate the CPU type in machine_run_board_init() for the
             individual board

v1: https://lists.nongnu.org/archive/html/qemu-arm/2023-07/msg00302.html
v2: https://lists.nongnu.org/archive/html/qemu-arm/2023-07/msg00528.html
v3: https://lists.nongnu.org/archive/html/qemu-arm/2023-09/msg00157.html
v4: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg00005.html

Testing
=======

With the following command lines, the output messages are varied before
and after the series is applied.

  ./build/qemu-system-aarch64            \
  -accel tcg -machine virt,gic-version=3 \
  -cpu cortex-a8 -smp maxcpus=2,cpus=1

Before the series is applied:

  qemu-system-aarch64: mach-virt: CPU type cortex-a8-arm-cpu not supported

After the series is applied:

  qemu-system-aarch64: Invalid CPU type: cortex-a8-arm-cpu
  The valid models are: cortex-a7, cortex-a15, cortex-a35, cortex-a55,
                        cortex-a72, cortex-a76, a64fx, neoverse-n1,
                        neoverse-v1, cortex-a53, cortex-a57, max

Changelog
=========
v5:
  * PATCH[v5 01] to remove CPU class 'ev67' for alpha            (Ricard/Igor)
  * PATCH[v5 02] to remove object_class_is_abstract() for hppa   (Gavin)
  * Don't move cpu_class_by_name()                               (Richard)
  * PATCH[v5 04] to remove 'oc == NULL' since the check has
    been covered in object_class_dynamic_cast()                  (Igor)
  * Introduce generic cpu_list(), shared by most of the targets  (Richard)
  * Use g_str_has_suffix and g_auto_free                         (Richard)
  * Collect r-bs from Igor and Richard                           (Gavin)
v4:
  * Integrate Philippe's patches where cpu_class_by_name()
    is consolidated and my duplicate code is dropped            (Philippe)
  * Simplified changelog and improvements                       (Thomas)
  * g_assert() on the return value from cpu_model_from_type()
    in is_cpu_type_supported()                                  (Philippe)
  * Collected r-bs from Philippe Mathieu-Daudé, Leif Lindholm,
    Bastian Koppelmann, Daniel Henrique Barboza, Cédric Le Goater,
    Gavin Shan                                                  (Gavin)
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

Gavin Shan (30):
  target/alpha: Remove 'ev67' CPU class
  target/hppa: Remove object_class_is_abstract()
  target: Remove 'oc == NULL' check
  cpu: Add helper cpu_model_from_type()
  cpu: Add generic cpu_list()
  target/alpha: Use generic cpu_list()
  target/arm: Use generic cpu_list()
  target/avr: Use generic cpu_list()
  target/cris: Use generic cpu_list()
  target/hexagon: Use generic cpu_list()
  target/hppa: Use generic cpu_list()
  target/loongarch: Use generic cpu_list()
  target/m68k: Use generic cpu_list()
  target/mips: Use generic cpu_list()
  target/openrisc: Use generic cpu_list()
  target/riscv: Use generic cpu_list()
  target/rx: Use generic cpu_list()
  target/sh4: Use generic cpu_list()
  target/tricore: Use generic cpu_list()
  target/xtensa: Use generic cpu_list()
  target: Use generic cpu_model_from_type()
  machine: Constify MachineClass::valid_cpu_types[i]
  machine: Use error handling when CPU type is checked
  machine: Introduce helper is_cpu_type_supported()
  machine: Print CPU model name instead of CPU type name
  hw/arm/virt: Hide host CPU model for tcg
  hw/arm/virt: Check CPU type in machine_run_board_init()
  hw/arm/sbsa-ref: Check CPU type in machine_run_board_init()
  hw/arm: Check CPU type in machine_run_board_init()
  hw/riscv/shakti_c: Check CPU type in machine_run_board_init()

Philippe Mathieu-Daudé (1):
  cpu: Call object_class_dynamic_cast() once in cpu_class_by_name()

 bsd-user/main.c                       |  5 +-
 cpu-target.c                          | 44 ++++++++++++-
 hw/arm/bananapi_m2u.c                 | 12 ++--
 hw/arm/cubieboard.c                   | 12 ++--
 hw/arm/mps2-tz.c                      | 20 ++++--
 hw/arm/mps2.c                         | 25 +++++--
 hw/arm/msf2-som.c                     | 12 ++--
 hw/arm/musca.c                        | 13 ++--
 hw/arm/npcm7xx_boards.c               | 13 ++--
 hw/arm/orangepi.c                     | 12 ++--
 hw/arm/sbsa-ref.c                     | 21 +-----
 hw/arm/virt.c                         | 23 ++-----
 hw/core/cpu-common.c                  |  8 ++-
 hw/core/machine.c                     | 93 ++++++++++++++++-----------
 hw/m68k/q800.c                        |  2 +-
 hw/riscv/shakti_c.c                   | 11 ++--
 include/hw/boards.h                   |  2 +-
 include/hw/core/cpu.h                 | 12 ++++
 target/alpha/cpu.c                    | 26 +-------
 target/alpha/cpu.h                    |  3 -
 target/arm/arm-qmp-cmds.c             |  3 +-
 target/arm/cpu.c                      |  4 +-
 target/arm/cpu.h                      |  3 -
 target/arm/helper.c                   | 46 -------------
 target/avr/cpu.c                      | 23 +------
 target/avr/cpu.h                      |  2 -
 target/cris/cpu.c                     | 42 +-----------
 target/cris/cpu.h                     |  3 -
 target/hexagon/cpu.c                  | 24 +------
 target/hexagon/cpu.h                  |  3 -
 target/hppa/cpu.c                     | 32 +--------
 target/hppa/cpu.h                     |  3 -
 target/i386/cpu.c                     |  3 +-
 target/loongarch/cpu.c                | 23 +------
 target/loongarch/cpu.h                |  4 --
 target/loongarch/loongarch-qmp-cmds.c |  3 +-
 target/m68k/cpu.c                     |  4 +-
 target/m68k/cpu.h                     |  4 --
 target/m68k/helper.c                  | 40 ------------
 target/mips/cpu-defs.c.inc            |  9 ---
 target/mips/cpu.h                     |  4 --
 target/mips/sysemu/mips-qmp-cmds.c    |  3 +-
 target/openrisc/cpu.c                 | 46 +------------
 target/openrisc/cpu.h                 |  3 -
 target/ppc/cpu_init.c                 |  3 +-
 target/ppc/ppc-qmp-cmds.c             |  3 +-
 target/riscv/cpu.c                    | 36 +----------
 target/riscv/cpu.h                    |  2 -
 target/riscv/riscv-qmp-cmds.c         |  3 +-
 target/rx/cpu.c                       | 20 +-----
 target/rx/cpu.h                       |  3 -
 target/sh4/cpu.c                      | 17 -----
 target/sh4/cpu.h                      |  3 -
 target/tricore/cpu.c                  |  4 +-
 target/tricore/cpu.h                  |  4 --
 target/tricore/helper.c               | 22 -------
 target/xtensa/cpu.c                   |  4 +-
 target/xtensa/cpu.h                   | 10 +--
 target/xtensa/helper.c                | 19 +-----
 target/xtensa/overlay_tool.h          |  7 +-
 60 files changed, 229 insertions(+), 634 deletions(-)

-- 
2.41.0


