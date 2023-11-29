Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423B7C07E98
	for <qemu-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 04:21:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r8C45-0001Jg-Hf; Tue, 28 Nov 2023 23:20:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r8C43-0001J0-PX
 for qemu-riscv@nongnu.org; Tue, 28 Nov 2023 23:20:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r8C41-0007Iz-Un
 for qemu-riscv@nongnu.org; Tue, 28 Nov 2023 23:20:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701231641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NLW1LRZ3HC0mLPGeg2ehIhu4KoKpYkCrJ1Q++RvtGLM=;
 b=iHP9kuRy8jWgforcyKAh2cKUEotVA32cHHPuCtTs8dxIC7HzLAx59P9uRO+RQ+rPH4CJsD
 FM7GPKTDspYYkAapeY9VCNrzQ6EXGVIh8gGmOGy6/tjef9D9+4HRV3RgMCvcIB+Dy3n6fD
 XQsr0DPhzqLsL9Ll60ELgtqJJMqPTaY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-2O7ynqm5NsqaooHEb5juLQ-1; Tue, 28 Nov 2023 23:20:37 -0500
X-MC-Unique: 2O7ynqm5NsqaooHEb5juLQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC394101A52D;
 Wed, 29 Nov 2023 04:20:35 +0000 (UTC)
Received: from gshan.redhat.com (unknown [10.64.136.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EFC3492BE0;
 Wed, 29 Nov 2023 04:20:25 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
Subject: [PATCH v8 0/9] Unified CPU type check
Date: Wed, 29 Nov 2023 14:20:03 +1000
Message-ID: <20231129042012.277831-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This series can be checked out from:

  git@github.com:gwshan/qemu.git (branch: kvm/cpu-type)

PATCH[1-4] refactors and improves the logic to validate CPU type in
           machine_run_board_init()
PATCH[5-9] validates the CPU type in machine_run_board_init() for the
           individual boards

v1: https://lists.nongnu.org/archive/html/qemu-arm/2023-07/msg00302.html
v2: https://lists.nongnu.org/archive/html/qemu-arm/2023-07/msg00528.html
v3: https://lists.nongnu.org/archive/html/qemu-arm/2023-09/msg00157.html
v4: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg00005.html
v5: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg00611.html
v6: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg00768.html
v7: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg01045.html

Testing
=======

Before the series is applied:

  [gshan@gshan q]$ ./build/qemu-system-aarch64 -M virt -cpu cortex-a8
  qemu-system-aarch64: mach-virt: CPU type cortex-a8-arm-cpu not supported
  [gshan@gshan q]$ ./build/qemu-system-aarch64 -M sbsa-ref -cpu cortex-a53
  qemu-system-aarch64: sbsa-ref: CPU type cortex-a53-arm-cpu not supported
  [gshan@gshan q]$ ./build/qemu-system-aarch64 -M sbsa-ref -cpu sa1100
  qemu-system-aarch64: sbsa-ref: CPU type sa1100-arm-cpu not supported
  [gshan@gshan q]$ ./build/qemu-system-aarch64 -M sbsa-ref -cpu host
  qemu-system-aarch64: unable to find CPU model 'host'

After the series is applied:

  [gshan@gshan q]$ ./build/qemu-system-aarch64 -M virt -cpu cortex-a8
  qemu-system-aarch64: Invalid CPU model: cortex-a8
  The valid models are: cortex-a7, cortex-a15, cortex-a35, cortex-a55,     \
                        cortex-a72, cortex-a76, cortex-a710, a64fx,        \
                        neoverse-n1, neoverse-v1, neoverse-n2, cortex-a53, \
                        cortex-a57, max
  [gshan@gshan q]$ ./build/qemu-system-aarch64 -M sbsa-ref -cpu cortex-a53
  qemu-system-aarch64: Invalid CPU model: cortex-a53
  The valid models are: cortex-a57, cortex-a72, neoverse-n1, neoverse-v1,  \
                        neoverse-n2, max
  [gshan@gshan q]$ ./build/qemu-system-aarch64 -M sbsa-ref -cpu sa1100
  qemu-system-aarch64: Invalid CPU model: sa1100
  The valid models are: cortex-a57, cortex-a72, neoverse-n1, neoverse-v1,  \
                        neoverse-n2, max
  [gshan@gshan q]$ ./build/qemu-system-aarch64 -M sbsa-ref -cpu host
  qemu-system-aarch64: unable to find CPU model 'host'

Changelog
=========
v8:
  * Pick r-bs from Phil                                          (Gavin)
  * Drop @local_err and use @errp in machine_run_board_init()    (Phil)
  * Add PATCH[v8 3/9] to improve is_cpu_type_supported()         (Phil)
  * Use g_autofree and replace 'type' with 'model' for the
    error messages in is_cpu_type_supported()                    (Phil)
v7:
  * Add 'return' after error_propagate() in machine_run_board_init()
    to avoid calling mc->init() in the failing case              (Marcin)
v6:
  * Drop PATCH[v5 01-23], queued by Phil                         (Phil)
  * Clearer hint if only one CPU type is supported and have
    'const MachineState *' in is_cpu_type_supported()            (Phil)
  * Move valid_cpu_types[] to board's class_init() function      (Phil)

Gavin Shan (9):
  machine: Use error handling when CPU type is checked
  machine: Introduce helper is_cpu_type_supported()
  machine: Improve is_cpu_type_supported()
  machine: Print CPU model name instead of CPU type
  hw/arm/virt: Hide host CPU model for tcg
  hw/arm/virt: Check CPU type in machine_run_board_init()
  hw/arm/sbsa-ref: Check CPU type in machine_run_board_init()
  hw/arm: Check CPU type in machine_run_board_init()
  hw/riscv/shakti_c: Check CPU type in machine_run_board_init()

 hw/arm/bananapi_m2u.c   | 12 +++---
 hw/arm/cubieboard.c     | 12 +++---
 hw/arm/mps2-tz.c        | 26 +++++++++---
 hw/arm/mps2.c           | 26 +++++++++---
 hw/arm/msf2-som.c       | 12 +++---
 hw/arm/musca.c          | 12 +++---
 hw/arm/npcm7xx_boards.c | 12 +++---
 hw/arm/orangepi.c       | 12 +++---
 hw/arm/sbsa-ref.c       | 36 +++++-----------
 hw/arm/virt.c           | 60 +++++++++++----------------
 hw/core/machine.c       | 92 ++++++++++++++++++++++++-----------------
 hw/riscv/shakti_c.c     | 13 +++---
 12 files changed, 168 insertions(+), 157 deletions(-)

-- 
2.42.0


