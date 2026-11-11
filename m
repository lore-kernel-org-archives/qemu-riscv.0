Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EA8606A33F
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 06:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ER+kXkYY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T9iqtvmo
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xR1SL-0008P0-Cz; Wed, 11 Nov 2026 01:05:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xR1SJ-0008Lx-Ai
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 01:05:11 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xR1SG-0000mP-GQ
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 01:05:11 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AB5Kgf1300708
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 06:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=eE7oBwq5uEN
 w9EuuIa7TP19EaTHOAlOcgjZhsFx3Pb8=; b=ER+kXkYYLWk/PM7GMehUDjxGOlT
 qWxSrsT5qjpBI7EserPn3UXlAB9u1xO12+MhwH+J4gOYsSQKeZDkGeSBztZU/37v
 YfIMuLM2QUC/0FgmqxVIULpvbWzE97HEzwSwx1AVIOGbvNR/bekWaglef40Q+bS6
 XpsAeaosoO6yzL19APAG1duUcVBH2r/xbqy1ItKHuRE0gCo0iVBxYzE4b3b0XFNS
 /JACjsQ1jywVSVxbKk3XCyK0zBBdTjaRvewU/BSDDv6/I3qsknLcxsSvfCbqiDaO
 VpDLBVGwjc6fAckoKdVK8wwIWKzDmkGszAPTSEU6+kr/Yh+fFzZeKX51zgg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv7c5jqxb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 06:05:07 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-7d3747ef323so9851137.2
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 22:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794377107; x=1794981907; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eE7oBwq5uENw9EuuIa7TP19EaTHOAlOcgjZhsFx3Pb8=;
 b=T9iqtvmoXc23UA1ZFV7DBv+dOcaeZhPaG5Toty4uXWZTCpAKljtF3M1qVJiVfeW35L
 Xaht9ZUDDQn6bA2C6OgUnnFcCT6iaWLtnhh4k5kyPGXAjcpToMVpITAsYkfZcVAsNiSQ
 LtVvWi+nVHuBsGmDb4AkYbeC6J/0zk+5r3gru9UC5/3m7S9wcyJl6ws0xOzw9ab+oAYc
 EYXuU569JyF05lh01/+I33/egesk8dYnacWk8YPSj3ehaK1WrQ69yBgrfbAYWwEmvyJb
 P4q7YjH4vuPcjUIFpoSpgkTe0IHAdlu5Dbku8fU9kE9zTmkdWIDwK5HzDgqfxbxLnFq8
 2J2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794377107; x=1794981907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=eE7oBwq5uENw9EuuIa7TP19EaTHOAlOcgjZhsFx3Pb8=;
 b=R+uIXTuTMXYOFq+d3jor8z0d/0xUYIgryMQ40VMtNYYJyimUdfYIOpTFmdKIawTWo4
 bg9GBI8AYGnpxE0jz//UX7Wyc4mp4oOotzExa5qQIJTdFoTkpBBVZgh0wkRPaa6N9+KC
 Hj1LzfnuS1aCGLhHJfZAayuIoWjdTpT03oSiYlPbAzlpEwyr7wfuNEVcqB2u9cvtrY9H
 aMIRCMHphYkzuAmJcyl4klyl7jACWdsNF21mWl0wBn2r50hD+o2DR5ipjnWyyGE6zEO5
 wnZIjKH6cqCbHa9A5bmKW2Q8J2Yoq97XXKd50B7E8dtedfIlRvTAJso+kipusj8m4vLU
 rwxg==
X-Gm-Message-State: APuU4Z8Po6xnq96mzPTI3HmEmbADckQKUWQKpR6IULDXqlqOgjrRVxlQ
 Waq/qmXvLDEjtIHkhzYseddpAs42LctVrXunLrANNS1kD1ET/IWRmkVQvKNo0nU3naEhSe8cfqM
 kMjRqc8N4uLlB5luoxIUTEyhky5lOY84JksthgTNvuFlTfass8peKsw+OOg==
X-Gm-Gg: AYBFou1Qdxyv2EO5ysxCyjDHBWzoIXMUWQD12RODc8nAdpie900bGrEBt3qRuvVfGhb
 pC2LKdTgz1xbckXK67obTFv+EFbZWJSEzAmsTHGPbgR0MDD4LqirabMkRxA9yaQRnOl8fdT1//1
 gM0JNPyJ8OYXPp7jUiYcW59soFCv0wz3/qw9eahF9/rWnrXTuvF1oFLt/RvHjfOwdrXDbLqg27j
 RVejpW6VBDDp+iaelItnTX8GZaBpMYnOltYV7V1eP19SEReepwuanSm2+Jj7EJgVgcqDUlZ+fX2
 aCjcAMsCcw6cr8Mlljdd82+cj6YybLH3JE3eeykuRZ02+edDCOoLt5nzBXonmHARZLjrdHaKxBF
 Vz0rMj5hJUFLyybEDsgANIX2yLNGL98Jbd8SAXqrjWeVPHn3d4Rhql8O6BsUNHHgAVLqfHqsZe0
 PQfvxxsJIH+vRXyOpkAMadRrzRNeA/1NZKgu9fJ4T+r8Y3ZhPXkVUWJU9FLjP8boD6XyxuVVufp
 RqgJfU=
X-Received: by 2002:a05:6102:324b:10b0:7c3:83a9:eddd with SMTP id
 ada2fe7eead31-7d4f9dd6f6fmr437325137.1.1794377106544; 
 Tue, 10 Nov 2026 22:05:06 -0800 (PST)
X-Received: by 2002:a05:6102:324b:10b0:7c3:83a9:eddd with SMTP id
 ada2fe7eead31-7d4f9dd6f6fmr435856137.1.1794377077476; 
 Tue, 10 Nov 2026 22:04:37 -0800 (PST)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b3b5b2ff3bsm15067990c88.11.2026.11.10.22.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 22:04:37 -0800 (PST)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH v15 06/10] riscv: add RPMI HSM service
Date: Wed, 11 Nov 2026 11:33:58 +0530
Message-ID: <20261111060403.3777501-7-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111060403.3777501-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20261111060403.3777501-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyNCBTYWx0ZWRfXzpojuRr/Vs/m
 6V7uEjVjzJU8ket5T2WI6ZMzSxLQdFnofj5jn+Czl2idHOljDQXTheBcKa/H4D/Vjo1r4pd4mdZ
 QJXy16q5ILqxCdu4aISNP8ZSKjdsVvMWXsG8WcK7m5pqMm/5GKtW+oTyM2uau39Misc5jEyNjld
 tyv/YPeGAeWvL2z4dcK/VyLY1jGQE5hA7oOfgWQnMixjyxOyZu8A9vTdFJUtBddBy1oEXx6/NKZ
 7cB4+2a2kiEgnSyLmTY3m0SSpO7xeThHCeRXqKad3UGiQyzpq+hcoLOgHyhCKJHriVQHTvF5onv
 x5F6aJI6BOXLRNbhiyVxax/vTJAf75nQDyASy+3klJZpNrgVrs8FehN3k0fdQAs82fFGlLCkzi0
 FBjHrQMoDXWRNBVgrmWSqb0l3kPrOTfxWywVTwGKjUo992Yy6ivZxK4F58rtSSPkZOMWIX0k6sT
 o3Fx5AudhDVYvQub9ow==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyNCBTYWx0ZWRfX/j6iMjtdN/P8
 k2jsPnxo3eQ3sQ9W/loD2Cgy2VmRGk6kcDIQOeL04hHFI0m0TcMR53hy62KwamShF5ZQQNPnXFf
 tQ8L8F69nwgMPahEimfxC8R71fMgfrU=
X-Proofpoint-ORIG-GUID: 4k3wXWFDaJyE3WkGwJl3D4WsMuh6DZLf
X-Authority-Analysis: v=2.4 cv=eq9KXYpX c=1 sm=1 tr=0 ts=6af40593 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=quq8RQvC8PMJxjtlgMUA:9 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 4k3wXWFDaJyE3WkGwJl3D4WsMuh6DZLf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110024
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the RPMI Hart State Management service group for RISC-V virt.

The service exposes configured hart IDs to librpmi and keeps stable
per-hart state in the RPMI device. A persistent observer on each target CPU
makes actual WFI entry authoritative for stop and suspend completion, while
CPU work handles starts and requests received after a hart has already
entered WFI.

Keep RPMI-stopped harts off despite pending interrupts, timer events,
kicks, or generic resume attempts. HART_START is the normal path that
restores the hart power state and execution address.

Serialize librpmi state publication under the BQL, drain target-CPU work
during teardown, and reconstruct the external librpmi HSM object during
machine reset so pending operations return to the STARTED baseline.

Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
---
 hw/misc/meson.build           |   1 +
 hw/misc/riscv_rpmi.c          |   7 +
 hw/misc/riscv_rpmi_hsm.c      | 344 ++++++++++++++++++++++++++++++++++
 hw/misc/riscv_rpmi_internal.h |   5 +-
 hw/riscv/virt.c               |   5 +
 include/hw/misc/riscv_rpmi.h  |   5 +
 target/riscv/cpu-qom.h        |  16 ++
 target/riscv/cpu.c            |  61 ++++++
 target/riscv/cpu.h            |   7 +
 target/riscv/tcg/op_helper.c  |   4 +
 target/riscv/tcg/tcg-cpu.c    |   1 +
 11 files changed, 455 insertions(+), 1 deletion(-)
 create mode 100644 hw/misc/riscv_rpmi_hsm.c

diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index a091d393a3..6d93cd4ab0 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -186,4 +186,5 @@ system_ss.add(when: 'CONFIG_QCOM_QDSP6SS_CLK', if_true: files('qcom-qdsp6ss-clk.
 system_ss.add(when: 'CONFIG_RISCV_RPMI', if_true: [files(
   'riscv_rpmi.c',
   'riscv_rpmi_sysreset.c',
+  'riscv_rpmi_hsm.c',
 ), librpmi], if_false: files('riscv_rpmi-stub.c'))
diff --git a/hw/misc/riscv_rpmi.c b/hw/misc/riscv_rpmi.c
index 82a457241c..1bf9d77b04 100644
--- a/hw/misc/riscv_rpmi.c
+++ b/hw/misc/riscv_rpmi.c
@@ -210,6 +210,10 @@ static const RiscvRpmiServiceOps riscv_rpmi_service_ops[] = {
         .service_group = RPMI_SRVGRP_SYSTEM_RESET,
         .add = riscv_rpmi_sysreset_add,
         .remove = riscv_rpmi_sysreset_remove,
+    }, {
+        .service_group = RPMI_SRVGRP_HSM,
+        .add = riscv_rpmi_hsm_add,
+        .remove = riscv_rpmi_hsm_remove,
     },
 };
 
@@ -259,6 +263,9 @@ static void riscv_rpmi_reset_hold(Object *obj, ResetType type)
         memset(memory_region_get_ram_ptr(&s->shmem), 0, s->shmem_size);
         memory_region_set_dirty(&s->shmem, 0, s->shmem_size);
     }
+    if (!riscv_rpmi_hsm_reset(s, &error_abort)) {
+        return;
+    }
 }
 
 static void riscv_rpmi_cleanup(RiscvRpmiState *s)
diff --git a/hw/misc/riscv_rpmi_hsm.c b/hw/misc/riscv_rpmi_hsm.c
new file mode 100644
index 0000000000..42a4f3b096
--- /dev/null
+++ b/hw/misc/riscv_rpmi_hsm.c
@@ -0,0 +1,344 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * RISC-V RPMI HSM service.
+ *
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ * Author:
+ *  Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
+ */
+
+#include "qemu/osdep.h"
+#include "riscv_rpmi_internal.h"
+#include "hw/core/cpu.h"
+#include "qemu/main-loop.h"
+#include "system/cpus.h"
+#include "target/riscv/cpu-qom.h"
+#include "librpmi_env.h"
+
+static const struct rpmi_hsm_suspend_type riscv_rpmi_hsm_suspend_types[] = {
+    { .type = 0 },
+};
+
+struct RiscvRpmiHsmHart {
+    RiscvRpmiState *rpmi;
+    CPUState *cpu;
+    enum rpmi_hart_hw_state state;
+    enum rpmi_hart_hw_state wfi_state;
+    uint64_t start_addr;
+};
+
+/*
+ * RPMI requests and queued CPU work hold BQL. Natural WFI transitions use an
+ * atomic armed-state check and take BQL only when a transition is pending.
+ */
+static RiscvRpmiHsmHart *riscv_rpmi_hsm_hart(RiscvRpmiState *s,
+                                              uint32_t hart_index)
+{
+    if (!s->hsm_harts || hart_index >= s->hart_count ||
+        !s->hsm_harts[hart_index].cpu) {
+        return NULL;
+    }
+
+    return &s->hsm_harts[hart_index];
+}
+static void riscv_rpmi_hsm_wfi(CPUState *cpu, bool entering, void *opaque)
+{
+    RiscvRpmiHsmHart *hart = opaque;
+    enum rpmi_hart_hw_state wfi_state;
+    bool need_bql = !bql_locked();
+    bool changed = false;
+
+    wfi_state = qatomic_read(&hart->wfi_state);
+    if (wfi_state == RPMI_HART_HW_STATE_MAX) {
+        return;
+    }
+    if (need_bql) {
+        bql_lock();
+    }
+
+    wfi_state = qatomic_read(&hart->wfi_state);
+    if (entering && wfi_state == RPMI_HART_HW_STATE_STOPPED) {
+        qatomic_set(&hart->wfi_state, RPMI_HART_HW_STATE_MAX);
+        riscv_cpu_set_powered_off(cpu, true);
+        hart->state = RPMI_HART_HW_STATE_STOPPED;
+        changed = true;
+    } else if (wfi_state == RPMI_HART_HW_STATE_SUSPENDED) {
+        hart->state = entering ? RPMI_HART_HW_STATE_SUSPENDED :
+                                 RPMI_HART_HW_STATE_STARTED;
+        if (!entering) {
+            qatomic_set(&hart->wfi_state, RPMI_HART_HW_STATE_MAX);
+        }
+        changed = true;
+    }
+
+    if (changed) {
+        rpmi_hsm_process_state_changes(hart->rpmi->hsm);
+    }
+    if (need_bql) {
+        bql_unlock();
+    }
+}
+
+static void riscv_rpmi_hsm_set_observer(CPUState *cpu, run_on_cpu_data data)
+{
+    riscv_cpu_set_wfi_observer(cpu, riscv_rpmi_hsm_wfi, data.host_ptr);
+}
+
+static void riscv_rpmi_hsm_clear_observer(CPUState *cpu, run_on_cpu_data data)
+{
+    riscv_cpu_set_wfi_observer(cpu, NULL, NULL);
+    riscv_cpu_set_powered_off(cpu, false);
+    cpu->halted = false;
+    cpu_resume(cpu);
+}
+
+static void riscv_rpmi_hsm_start_cpu(CPUState *cpu, run_on_cpu_data data)
+{
+    RiscvRpmiHsmHart *hart = data.host_ptr;
+
+    g_assert(bql_locked());
+    riscv_cpu_handle_wfi_resume(cpu);
+    cpu_set_pc(cpu, hart->start_addr);
+    riscv_cpu_set_powered_off(cpu, false);
+    cpu->halted = false;
+    cpu_resume(cpu);
+    hart->state = RPMI_HART_HW_STATE_STARTED;
+    rpmi_hsm_process_state_changes(hart->rpmi->hsm);
+}
+
+static void riscv_rpmi_hsm_replay_wfi(CPUState *cpu, run_on_cpu_data data)
+{
+    riscv_cpu_replay_wfi_observer(cpu);
+}
+
+static enum rpmi_error riscv_rpmi_hsm_start_prepare(
+    void *priv, rpmi_uint32_t hart_index, rpmi_uint64_t start_addr)
+{
+    RiscvRpmiHsmHart *hart = riscv_rpmi_hsm_hart(priv, hart_index);
+
+    g_assert(bql_locked());
+    if (!hart) {
+        return RPMI_ERR_INVALID_PARAM;
+    }
+
+    hart->start_addr = start_addr;
+    async_run_on_cpu(hart->cpu, riscv_rpmi_hsm_start_cpu,
+                     RUN_ON_CPU_HOST_PTR(hart));
+    return RPMI_SUCCESS;
+}
+
+/* librpmi requires finalize hooks even when QEMU has no second phase. */
+static void riscv_rpmi_hsm_start_finalize(void *priv,
+                                          rpmi_uint32_t hart_index,
+                                          rpmi_uint64_t start_addr)
+{
+}
+
+static enum rpmi_error riscv_rpmi_hsm_arm_wfi(
+    RiscvRpmiState *s, uint32_t hart_index, enum rpmi_hart_hw_state state)
+{
+    RiscvRpmiHsmHart *hart = riscv_rpmi_hsm_hart(s, hart_index);
+
+    g_assert(bql_locked());
+    if (!hart) {
+        return RPMI_ERR_INVALID_PARAM;
+    }
+
+    qatomic_set(&hart->wfi_state, state);
+    async_run_on_cpu(hart->cpu, riscv_rpmi_hsm_replay_wfi,
+                     RUN_ON_CPU_NULL);
+    return RPMI_SUCCESS;
+}
+
+static enum rpmi_error riscv_rpmi_hsm_stop_prepare(void *priv,
+                                                    rpmi_uint32_t hart_index)
+{
+    return riscv_rpmi_hsm_arm_wfi(priv, hart_index,
+                                  RPMI_HART_HW_STATE_STOPPED);
+}
+
+static void riscv_rpmi_hsm_stop_finalize(void *priv,
+                                         rpmi_uint32_t hart_index)
+{
+}
+
+static enum rpmi_error riscv_rpmi_hsm_suspend_prepare(
+    void *priv, rpmi_uint32_t hart_index,
+    const struct rpmi_hsm_suspend_type *suspend_type,
+    rpmi_uint64_t resume_addr)
+{
+    if (!suspend_type) {
+        return RPMI_ERR_INVALID_PARAM;
+    }
+
+    return riscv_rpmi_hsm_arm_wfi(priv, hart_index,
+                                  RPMI_HART_HW_STATE_SUSPENDED);
+}
+
+static void riscv_rpmi_hsm_suspend_finalize(
+    void *priv, rpmi_uint32_t hart_index,
+    const struct rpmi_hsm_suspend_type *suspend_type,
+    rpmi_uint64_t resume_addr)
+{
+}
+
+static enum rpmi_hart_hw_state riscv_rpmi_hsm_get_hw_state(
+    void *priv, rpmi_uint32_t hart_index)
+{
+    RiscvRpmiHsmHart *hart = riscv_rpmi_hsm_hart(priv, hart_index);
+
+    g_assert(bql_locked());
+    return hart ? hart->state : RPMI_HART_HW_STATE_STOPPED;
+}
+
+static const struct rpmi_hsm_platform_ops riscv_rpmi_hsm_ops = {
+    .hart_get_hw_state = riscv_rpmi_hsm_get_hw_state,
+    .hart_start_prepare = riscv_rpmi_hsm_start_prepare,
+    .hart_start_finalize = riscv_rpmi_hsm_start_finalize,
+    .hart_stop_prepare = riscv_rpmi_hsm_stop_prepare,
+    .hart_stop_finalize = riscv_rpmi_hsm_stop_finalize,
+    .hart_suspend_prepare = riscv_rpmi_hsm_suspend_prepare,
+    .hart_suspend_finalize = riscv_rpmi_hsm_suspend_finalize,
+};
+
+static bool riscv_rpmi_hsm_create_external(
+    RiscvRpmiState *s, struct rpmi_service_group **group, Error **errp)
+{
+    s->hsm = rpmi_hsm_create(s->hart_count, s->hart_ids,
+                             ARRAY_SIZE(riscv_rpmi_hsm_suspend_types),
+                             riscv_rpmi_hsm_suspend_types,
+                             &riscv_rpmi_hsm_ops, s);
+    if (!s->hsm) {
+        error_setg(errp, "failed to create RPMI HSM context");
+        return false;
+    }
+
+    *group = rpmi_service_group_hsm_create(s->hsm);
+    if (!*group) {
+        rpmi_hsm_destroy(s->hsm);
+        s->hsm = NULL;
+        error_setg(errp, "failed to create RPMI HSM service group");
+        return false;
+    }
+
+    return true;
+}
+
+static void riscv_rpmi_hsm_destroy_external(RiscvRpmiState *s)
+{
+    if (s->hsm_group) {
+        rpmi_env_free_lock(s->hsm_group->lock);
+        s->hsm_group->lock = NULL;
+        rpmi_service_group_hsm_destroy(s->hsm_group);
+        s->hsm_group = NULL;
+    }
+    if (s->hsm) {
+        rpmi_hsm_destroy(s->hsm);
+        s->hsm = NULL;
+    }
+}
+
+static void riscv_rpmi_hsm_reset_cpu(CPUState *cpu, run_on_cpu_data data)
+{
+    riscv_cpu_handle_wfi_resume(cpu);
+    riscv_cpu_set_powered_off(cpu, false);
+    cpu->halted = false;
+}
+
+bool riscv_rpmi_hsm_add(RiscvRpmiState *s, Error **errp)
+{
+    struct rpmi_service_group *group;
+
+    if (s->hsm_group) {
+        error_setg(errp, "duplicate RPMI HSM service descriptor");
+        return false;
+    }
+    if (!s->hart_count || !s->hart_ids) {
+        error_setg(errp, "RPMI HSM service requires hart IDs");
+        return false;
+    }
+
+    s->hsm_harts = g_new0(RiscvRpmiHsmHart, s->hart_count);
+    for (uint32_t i = 0; i < s->hart_count; i++) {
+        RiscvRpmiHsmHart *hart = &s->hsm_harts[i];
+
+        hart->rpmi = s;
+        hart->cpu = cpu_by_arch_id(s->hart_ids[i]);
+        hart->state = RPMI_HART_HW_STATE_STARTED;
+        qatomic_set(&hart->wfi_state, RPMI_HART_HW_STATE_MAX);
+    }
+
+    if (!riscv_rpmi_hsm_create_external(s, &group, errp)) {
+        g_clear_pointer(&s->hsm_harts, g_free);
+        return false;
+    }
+    if (!riscv_rpmi_context_add_group(s, group, "HSM", errp)) {
+        s->hsm_group = group;
+        riscv_rpmi_hsm_destroy_external(s);
+        g_clear_pointer(&s->hsm_harts, g_free);
+        return false;
+    }
+
+    s->hsm_group = group;
+    for (uint32_t i = 0; i < s->hart_count; i++) {
+        RiscvRpmiHsmHart *hart = &s->hsm_harts[i];
+
+        if (hart->cpu) {
+            run_on_cpu(hart->cpu, riscv_rpmi_hsm_set_observer,
+                       RUN_ON_CPU_HOST_PTR(hart));
+        }
+    }
+    return true;
+}
+
+void riscv_rpmi_hsm_remove(RiscvRpmiState *s)
+{
+    if (!s->hsm_harts) {
+        return;
+    }
+
+    for (uint32_t i = 0; i < s->hart_count; i++) {
+        CPUState *cpu = s->hsm_harts[i].cpu;
+
+        if (cpu) {
+            run_on_cpu(cpu, riscv_rpmi_hsm_clear_observer, RUN_ON_CPU_NULL);
+        }
+    }
+    riscv_rpmi_context_remove_group(s, s->hsm_group);
+    riscv_rpmi_hsm_destroy_external(s);
+    g_clear_pointer(&s->hsm_harts, g_free);
+}
+
+bool riscv_rpmi_hsm_reset(RiscvRpmiState *s, Error **errp)
+{
+    struct rpmi_service_group *group = NULL;
+
+    if (!s->hsm_harts) {
+        return true;
+    }
+
+    for (uint32_t i = 0; i < s->hart_count; i++) {
+        RiscvRpmiHsmHart *hart = &s->hsm_harts[i];
+
+        if (hart->cpu) {
+            run_on_cpu(hart->cpu, riscv_rpmi_hsm_reset_cpu,
+                       RUN_ON_CPU_NULL);
+        }
+        hart->state = RPMI_HART_HW_STATE_STARTED;
+        qatomic_set(&hart->wfi_state, RPMI_HART_HW_STATE_MAX);
+    }
+
+    riscv_rpmi_context_remove_group(s, s->hsm_group);
+    riscv_rpmi_hsm_destroy_external(s);
+    if (!riscv_rpmi_hsm_create_external(s, &group, errp)) {
+        return false;
+    }
+    if (!riscv_rpmi_context_add_group(s, group, "HSM", errp)) {
+        s->hsm_group = group;
+        riscv_rpmi_hsm_destroy_external(s);
+        return false;
+    }
+    s->hsm_group = group;
+    return true;
+}
diff --git a/hw/misc/riscv_rpmi_internal.h b/hw/misc/riscv_rpmi_internal.h
index e5880aebe2..e56dba5b1a 100644
--- a/hw/misc/riscv_rpmi_internal.h
+++ b/hw/misc/riscv_rpmi_internal.h
@@ -27,8 +27,11 @@ bool riscv_rpmi_context_add_group(RiscvRpmiState *s,
                                   Error **errp);
 void riscv_rpmi_context_remove_group(RiscvRpmiState *s,
                                      struct rpmi_service_group *group);
-
 bool riscv_rpmi_sysreset_add(RiscvRpmiState *s, Error **errp);
 void riscv_rpmi_sysreset_remove(RiscvRpmiState *s);
 
+bool riscv_rpmi_hsm_add(RiscvRpmiState *s, Error **errp);
+void riscv_rpmi_hsm_remove(RiscvRpmiState *s);
+bool riscv_rpmi_hsm_reset(RiscvRpmiState *s, Error **errp);
+
 #endif
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 1e313e078e..32aa13325e 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -485,6 +485,11 @@ static const RiscvRpmiServiceConfig virt_rpmi_services[] = {
         .compatible = "riscv,rpmi-system-reset",
         .service_group = RPMI_SRVGRP_SYSTEM_RESET,
     },
+    {
+        .node_name = "hsm",
+        .compatible = "riscv,rpmi-hsm",
+        .service_group = RPMI_SRVGRP_HSM,
+    },
 };
 
 static uint32_t virt_rpmi_service_count(void)
diff --git a/include/hw/misc/riscv_rpmi.h b/include/hw/misc/riscv_rpmi.h
index 1ab648359d..3a240941cd 100644
--- a/include/hw/misc/riscv_rpmi.h
+++ b/include/hw/misc/riscv_rpmi.h
@@ -42,6 +42,8 @@ struct rpmi_context;
 struct rpmi_service_group;
 struct rpmi_shmem;
 struct rpmi_transport;
+struct rpmi_hsm;
+typedef struct RiscvRpmiHsmHart RiscvRpmiHsmHart;
 
 typedef struct RiscvRpmiMachineOps {
     void (*system_reset)(void);
@@ -82,6 +84,9 @@ struct RiscvRpmiState {
     char *platform_info;
     const RiscvRpmiMachineOps *machine_ops;
     struct rpmi_service_group *sysreset_group;
+    struct rpmi_hsm *hsm;
+    struct rpmi_service_group *hsm_group;
+    RiscvRpmiHsmHart *hsm_harts;
     uint32_t *hart_ids;
     uint32_t hart_count;
     const RiscvRpmiServiceConfig *services;
diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index 61234842e3..f6b6023835 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -64,4 +64,20 @@
 
 OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
 
+#ifndef CONFIG_USER_ONLY
+/*
+ * WFI observers persist across entries and exits. Access observers and WFI
+ * state only on the target CPU thread; use run_on_cpu() to register or remove
+ * an observer and drain earlier CPU work before freeing its opaque state.
+ */
+void riscv_cpu_set_wfi_observer(
+    CPUState *cpu,
+    void (*observer)(CPUState *cpu, bool entering, void *opaque),
+    void *opaque);
+void riscv_cpu_handle_wfi(CPUState *cpu);
+void riscv_cpu_handle_wfi_resume(CPUState *cpu);
+void riscv_cpu_replay_wfi_observer(CPUState *cpu);
+void riscv_cpu_set_powered_off(CPUState *cpu, bool powered_off);
+#endif
+
 #endif /* RISCV_CPU_QOM_H */
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5a0529fbda..e516a6b98f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -58,6 +58,61 @@ const uint32_t misa_bits[] = {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
  */
 #define RISCV_CPU_MARCHID 42
 
+#ifndef CONFIG_USER_ONLY
+void riscv_cpu_set_wfi_observer(CPUState *cpu,
+                                void (*observer)(CPUState *, bool, void *),
+                                void *opaque)
+{
+    RISCVCPU *rcpu = RISCV_CPU(cpu);
+
+    g_assert(qemu_cpu_is_self(cpu));
+    rcpu->wfi_observer = observer;
+    rcpu->wfi_observer_opaque = opaque;
+}
+
+void riscv_cpu_handle_wfi(CPUState *cpu)
+{
+    RISCVCPU *rcpu = RISCV_CPU(cpu);
+
+    g_assert(qemu_cpu_is_self(cpu));
+    rcpu->wfi_active = true;
+    if (rcpu->wfi_observer) {
+        rcpu->wfi_observer(cpu, true, rcpu->wfi_observer_opaque);
+    }
+}
+
+void riscv_cpu_handle_wfi_resume(CPUState *cpu)
+{
+    RISCVCPU *rcpu = RISCV_CPU(cpu);
+
+    g_assert(qemu_cpu_is_self(cpu));
+    if (!rcpu->wfi_active) {
+        return;
+    }
+    rcpu->wfi_active = false;
+    if (rcpu->wfi_observer) {
+        rcpu->wfi_observer(cpu, false, rcpu->wfi_observer_opaque);
+    }
+}
+
+void riscv_cpu_replay_wfi_observer(CPUState *cpu)
+{
+    RISCVCPU *rcpu = RISCV_CPU(cpu);
+
+    g_assert(qemu_cpu_is_self(cpu));
+    if (rcpu->wfi_active && rcpu->wfi_observer) {
+        rcpu->wfi_observer(cpu, true, rcpu->wfi_observer_opaque);
+    }
+}
+
+void riscv_cpu_set_powered_off(CPUState *cpu, bool powered_off)
+{
+    RISCVCPU *rcpu = RISCV_CPU(cpu);
+
+    qatomic_set(&rcpu->powered_off, powered_off);
+}
+#endif
+
 /*
  * From vector_helper.c
  * Note that vector data is stored in host-endian 64-bit chunks,
@@ -967,6 +1022,10 @@ static bool riscv_cpu_has_work(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
+
+    if (qatomic_read(&cpu->powered_off)) {
+        return false;
+    }
     /*
      * Definition of the WFI instruction requires it to ignore the privilege
      * mode and delegation registers, but respect individual enables
@@ -988,6 +1047,8 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
         mcc->parent_phases.hold(obj, type);
     }
 #ifndef CONFIG_USER_ONLY
+    riscv_cpu_set_powered_off(cs, false);
+    cpu->wfi_active = false;
     env->misa_mxl = mcc->def->misa_mxl_max;
     env->priv = PRV_M;
     env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 49a1186bdb..ac79397858 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -577,6 +577,13 @@ struct ArchCPU {
 
     CPURISCVState env;
 
+#ifndef CONFIG_USER_ONLY
+    void (*wfi_observer)(CPUState *, bool, void *);
+    void *wfi_observer_opaque;
+    bool wfi_active;
+    bool powered_off;
+#endif
+
     GDBFeature dyn_csr_feature;
     GDBFeature dyn_vreg_feature;
 
diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index f9c79fe6b9..b0fb3c2cf8 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -644,6 +644,10 @@ void HELPER(wfi)(CPURISCVState *env)
             return;
         }
         cs->halted = 1;
+#ifndef CONFIG_USER_ONLY
+        /* Publish WFI only after QEMU has entered the halted state. */
+        riscv_cpu_handle_wfi(cs);
+#endif
         cs->exception_index = EXCP_HLT;
         cpu_loop_exit(cs);
     }
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 2a7796c382..2bd198c016 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -305,6 +305,7 @@ const TCGCPUOps riscv_tcg_ops = {
     .tlb_fill = riscv_cpu_tlb_fill,
     .pointer_wrap = riscv_pointer_wrap,
     .cpu_exec_enter = riscv_cpu_exec_enter,
+    .leaving_halt = riscv_cpu_handle_wfi_resume,
     .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
     .cpu_exec_reset = cpu_reset,
     .do_interrupt = riscv_cpu_do_interrupt,

