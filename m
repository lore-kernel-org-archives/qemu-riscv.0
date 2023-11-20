Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9380C5ACB3
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 00:30:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r4s9D-0005Gr-9y; Sun, 19 Nov 2023 19:28:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r4s9B-0005GB-Tc
 for qemu-riscv@nongnu.org; Sun, 19 Nov 2023 19:28:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r4s99-00017b-EI
 for qemu-riscv@nongnu.org; Sun, 19 Nov 2023 19:28:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700440093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:mime-version: content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ud3E7EFU5H08t1sSizpb96vwBieiiHBL1mJ7zSLYqqc=;
 b=J7F7+Cv/ap315ivnvpSp6ZsitOtAD22kJzu2Y1TJsfadLhLySJQIQvNTMkL4rIzR4DG+GH
 hxYm1oU/uBQdcZej0HxAIC85fLcQ0Bx82aWPHyHa6Zzh8nCRefmG3Rz03Ui+UzMQGLSXcE
 6nSgdOmb+YcHHcVi/jSRPSCdwj1kik0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-551GABkEMH6bZBx-orTXWw-1; Sun, 19 Nov 2023 19:28:08 -0500
X-MC-Unique: 551GABkEMH6bZBx-orTXWw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9CA885A58A;
 Mon, 20 Nov 2023 00:28:07 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 026DE40C6EB9;
 Mon, 20 Nov 2023 00:27:58 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
Subject: [PATCH v6 0/8] Unified CPU type check
Date: Mon, 20 Nov 2023 10:27:16 +1000
Message-ID: <20231120002724.986326-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

This series bases on Phil's repository because the prepatory commits
have been queued to the branch.

  https://gitlab.com/philmd/qemu.git (branch: cpus-next)

There are two places where the user specified CPU type is checked to see
if it's supported or allowed by the board: machine_run_board_init() and
mc->init(). We don't have to maintain two duplicate sets of logic. This
series intends to move the check to machine_run_board_init() so that we
have unified CPU type check.

PATCH[1-3] refactors the logic to validate CPU type in machine_run_board_init()
PATCH[4-8] validates the CPU type in machine_run_board_init() for the
           individual boards

v1: https://lists.nongnu.org/archive/html/qemu-arm/2023-07/msg00302.html
v2: https://lists.nongnu.org/archive/html/qemu-arm/2023-07/msg00528.html
v3: https://lists.nongnu.org/archive/html/qemu-arm/2023-09/msg00157.html
v4: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg00005.html
v5: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg00611.html

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
v6:
  * Drop PATCH[v5 01-23], queued by Phil                         (Phil)
  * Clearer hint if only one CPU type is supported and have
    'const MachineState *' in is_cpu_type_supported()            (Phil)
  * Move valid_cpu_types[] to board's class_init() function      (Phil)
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

Gavin Shan (8):
  machine: Use error handling when CPU type is checked
  machine: Introduce helper is_cpu_type_supported()
  machine: Print CPU model name instead of CPU type
  hw/arm/virt: Hide host CPU model for tcg
  hw/arm/virt: Check CPU type in machine_run_board_init()
  hw/arm/sbsa-ref: Check CPU type in machine_run_board_init()
  hw/arm: Check CPU type in machine_run_board_init()
  hw/riscv/shakti_c: Check CPU type in machine_run_board_init()

 hw/arm/bananapi_m2u.c   | 12 ++---
 hw/arm/cubieboard.c     | 12 ++---
 hw/arm/mps2-tz.c        | 26 ++++++++---
 hw/arm/mps2.c           | 26 ++++++++---
 hw/arm/msf2-som.c       | 12 ++---
 hw/arm/musca.c          | 12 +++--
 hw/arm/npcm7xx_boards.c | 12 +++--
 hw/arm/orangepi.c       | 12 ++---
 hw/arm/sbsa-ref.c       | 36 +++++----------
 hw/arm/virt.c           | 60 ++++++++++---------------
 hw/core/machine.c       | 97 +++++++++++++++++++++++++----------------
 hw/riscv/shakti_c.c     | 13 +++---
 12 files changed, 173 insertions(+), 157 deletions(-)

-- 
2.41.0


