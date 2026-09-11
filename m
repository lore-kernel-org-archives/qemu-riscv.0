Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D3EC88E4D
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 12:29:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x50M6-0007CY-KS; Fri, 11 Sep 2026 08:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1x50M5-0007Bk-4F
 for qemu-riscv@nongnu.org; Fri, 11 Sep 2026 08:27:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1x50M3-0006vr-4q
 for qemu-riscv@nongnu.org; Fri, 11 Sep 2026 08:27:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1789129661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XlcARgbn1CiQcB0o0fK9M5BER6hULT+d1L0vclP963s=;
 b=eWy7ZGK52KHOERfsjsovaiqWK+FKT2BPM6tSGkzuS3N1SKad9yzcnfSMbyt2sdeLJK9Lc/
 i4hQwXsLGJpNzULgrF6a1Nm33MnCXhcioAmIceoAqYZ/mFyhl4RmksaKuxXncAe44vAi9x
 U7VDgAkbOzMdPIEpCTYBx0jIy+RgkAI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-612-4N8g1GnDMfSfJmkRMA1i1Q-1; Fri,
 11 Sep 2026 08:27:37 -0400
X-MC-Unique: 4N8g1GnDMfSfJmkRMA1i1Q-1
X-Mimecast-MFC-AGG-ID: 4N8g1GnDMfSfJmkRMA1i1Q_1789129654
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BAB3C180135D; Fri, 11 Sep 2026 12:27:32 +0000 (UTC)
Received: from localhost (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 43D0C1800351; Fri, 11 Sep 2026 12:27:29 +0000 (UTC)
From: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 00/10] monitor/hmp: replace MonitorDef with GDB registers
Date: Fri, 11 Sep 2026 16:27:23 +0400
Message-Id: <20260911-query-reg-v1-0-0c04f0c02cf3@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSQ5AQBBA0atIrXVSxHwVsaAVysJQrYWIu2ssX
 /LzLzAkTAYK7wKhnQ3Pk0Pge6CHeupJcesMIYYJ5gGq1ZKcSqhXGeo2znUXpZiC6xehjo/vVVa
 /jW1G0ts7gPt+AN9B1yRtAAAA
X-Change-ID: 20260910-query-reg-80cd59cf4707
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Chinmay Rath <rathc@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Glenn Miles <milesg@linux.ibm.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu@processmission.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3574;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=qZ1dqLcShsISlQD6dN9cGrh8hDoFhe6+5Lj9o/mxndc=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqo/OuSy80S0Y21xiCfmuEtTgG8xJteL7Fkvzyj
 XDvO6gA9WuJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCaqPzrgAKCRDa6OEJdZac
 5SziD/4vfwHftLDD/YED8meT5f9DLnXNcgw6YvDfWPuEJQPPJPgMAaZ8UfrDIIgbbp1PEo1u7K3
 pr+RRBWYRviAmH+jCMbR/tGT8R7B/6X7irM5p7nsgOeYQrdHo64X6NMnkgM5/morjtrJO0RbuMS
 9JyvCL0lt5jHVdvCzb1VtbGMoxbMscr2DjNOPuixoCMimcou/qSoS3IyBL40gCxLgFpuN59YJso
 eiHegUzMyZwhyZulJUQRY2yxIHtbglZF6hUzvYOZ+GMyDlQNCmFJST0yblwymoVabK5cvTzLcV5
 8aepoKb+k4zmGMr9Bm/tCWmnH2f5Zuunt0n0VqmT/av4HHaKe7YsoNBHCJZ2dLbtYNHjghPfulO
 e46o7qgXbH3MbnYlG9/0SGtpLefjtBAnOPUsPhiWt8DEDV+jECOCPPbfoKpk3f3nEynaQ8iW7Ux
 lhh9/SZtMpCQV/M9ykdJ+5EGyo+Tcg2JqSrdWjUZQWy1REgBYKyOszrda1yvxr8Szr/ZCedTUBD
 GgNacrp203vnxhTKJqNNCh0W/6UHvuod34f9z0VEfC/JnGpvdDVWnF5fqrmILv5pXqMMxfkop02
 vlcQqAT0A9fxTGh8gtXDMp/RAae86Udf+0UTS1OasuN0BLEWTM+4wBHzi9hGWuJcR5E1sSJMbSc
 kf8W976wJwLZO1A==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: AXx-jzCsdrQDqePTZn2Y-wjd7xvQ4_VGnSyerFanbE0_1789129654
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hi,

HMP monitor supports printing $register expression. The lookup
was done via GDB stub registers, and supplementary MonitorDef
HMP-specific tables.

Migrate HMP registers to use the GDB infrastructure and remove the
legacy HMP MonitorDef. Use a "qemu-debug" register group, as they are
aliases or synthetic registers, but gdb doesn't seem to care.

Known behavioural changes on RISC-V: CSR lookup is now case-sensitive
and vector registers now report "unkown register" instead of a
target-specific message ("Unable to print the value of vector vreg 'v0'
from this API")

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
Marc-André Lureau (10):
      hmp: don't crash on invalid register
      gdbstub: fix next register base after register gaps
      gdbstub: set feature->base_reg for dynamic features
      target/i386: expose segment limits via GDB
      monitor/hmp: add CPUClass::get_pc fallback for HMP $pc
      target/m68k: expose system registers via GDB
      target/sparc64: expose system registers via GDB
      target/riscv: bypass smstateen check in debugger mode
      target/riscv: expose register aliases via GDB
      monitor/hmp: remove legacy MonitorDef infrastructure

 configs/targets/i386-softmmu.mak          |   2 +-
 configs/targets/m68k-softmmu.mak          |   2 +-
 configs/targets/riscv32-linux-user.mak    |   2 +-
 configs/targets/riscv32-softmmu.mak       |   2 +-
 configs/targets/riscv64-bsd-user.mak      |   2 +-
 configs/targets/riscv64-linux-user.mak    |   2 +-
 configs/targets/riscv64-softmmu.mak       |   2 +-
 configs/targets/sparc64-softmmu.mak       |   2 +-
 configs/targets/x86_64-softmmu.mak        |   2 +-
 gdbstub/gdb-xml/i386-segments.xml         |  14 +++
 gdbstub/gdb-xml/m68k-system.xml           |  32 +++++++
 gdbstub/gdb-xml/riscv-32bit-alias.xml     | 105 ++++++++++++++++++++++
 gdbstub/gdb-xml/riscv-32bit-fpu-alias.xml |  40 +++++++++
 gdbstub/gdb-xml/riscv-64bit-alias.xml     | 105 ++++++++++++++++++++++
 gdbstub/gdb-xml/riscv-64bit-fpu-alias.xml |  46 ++++++++++
 gdbstub/gdb-xml/sparc64-system.xml        |  22 +++++
 gdbstub/gdbstub.c                         |  14 +--
 include/hw/core/cpu.h                     |   2 +-
 include/hw/core/sysemu-cpu-ops.h          |  16 ----
 include/monitor/hmp.h                     |   6 --
 include/qemu/typedefs.h                   |   1 -
 monitor/hmp.c                             |  52 ++---------
 target/arm/gdbstub.c                      |   8 +-
 target/arm/gdbstub64.c                    |  10 ++-
 target/i386/cpu.c                         |  32 -------
 target/i386/gdbstub.c                     |  24 +++++
 target/m68k/cpu.c                         |  22 -----
 target/m68k/helper.c                      |  47 ++++++++++
 target/ppc/gdbstub.c                      |   2 +-
 target/riscv/cpu.c                        |   1 -
 target/riscv/gdbstub.c                    |  52 ++++++++++-
 target/riscv/internals.h                  |   3 -
 target/riscv/monitor.c                    | 140 ------------------------------
 target/riscv/tcg/csr.c                    |   3 +-
 target/sparc/cpu.c                        |  19 ----
 target/sparc/gdbstub.c                    |  38 ++++++++
 target/xtensa/cpu.c                       |   2 +-
 37 files changed, 562 insertions(+), 314 deletions(-)
---
base-commit: 209b2afaface001c7d4d981e38f186afe7b24a50
change-id: 20260910-query-reg-80cd59cf4707

Best regards,
--  
Marc-André Lureau <marcandre.lureau@redhat.com>


