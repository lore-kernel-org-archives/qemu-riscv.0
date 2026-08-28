Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BC1C61DD9
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 11:29:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzum2-00021i-DV; Fri, 28 Aug 2026 07:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wzum0-00021D-Pq
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 07:29:28 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wzuly-0007ns-F0
 for qemu-riscv@nongnu.org; Fri, 28 Aug 2026 07:29:28 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67SA7RMl2061316
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 11:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=4Nb5E7CCFnn
 ZkPSxaijw5EbGep/SSJCizp89xj20cXs=; b=NC5nBESnaaY9lmQMjqvPwM0u2v4
 s17FxOJT6GLogNHFYf9xel1lLrwvJ31j2l4PvKnPe7b6dSt+NLMbo+kxKn1MTrPp
 1jkmOdzAJPgrC8ZA/InUOa0BdJPuclqy2Fdi28pdzSTUsejp1doHbpoBj63YZz+t
 MrSj3m8NQ0Cs8yfRl8MmaJNLnC1PbyyBlqOKalsvqIXZ6tjK9joAu/GLkArR5HMS
 tmXoUmGW9cQRgZkH96KXhky/zkP++2YG94HEJUi4FYOuqbizn4N1zSQxqEoT8Uol
 jJ1//fJGNQIp+j7iGmYtpSS4Joqeqmq4fS93+FVji3/PS/rxiuWhCG309ig==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mu9fxp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 11:29:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3811d5ecf66so303468a91.1
 for <qemu-riscv@nongnu.org>; Fri, 28 Aug 2026 04:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787916564; x=1788521364; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4Nb5E7CCFnnZkPSxaijw5EbGep/SSJCizp89xj20cXs=;
 b=jHmqToRaeZ/Y3gPsYcNn0aSDwJOPWsgNOneIIEhagTp8RoABRZ8Qckjqck1lp2As59
 lSZLiPYpeQE8WCqz7/JJbRGe8i30v0aRoND5RMH29lvQxAKax22388xfsbuwuL5yhFpK
 G4JSYcDLcBYFSd38OUHnHL9c0JvxpikCmFdPWblupix3GJzyPfDV3nTTt2LCW+zVyqmG
 4HwU51dtLXmPCWrhmM7swQjQeBfiMkY/OQ6buXpy6sxYzQkxxLlhFvns9xYA8CoD99rn
 6PlMNxYORQnOjSQXnd/2eMtPRd5dHwT2JaYOrIAiYM1WbEuqIIK6w680G67hr6dtK23e
 wYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787916564; x=1788521364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4Nb5E7CCFnnZkPSxaijw5EbGep/SSJCizp89xj20cXs=;
 b=sziTlVgC/SkyrublnSH+yTVGlejY4a+SUn9kdOG8Q7JjlHPpcrlhqTo7XldnM3pSP2
 OniEEZi1IqEYuUGdFyRp7etkWNxJNE/OiCV4GKSHzwlHKMA0nRe4sMRRUmyjVZeGvaJg
 ZF9ZE6wsKH9eiIenXgyb+ixwWDSQyh3jFJIDzYuRCf1azoPdPdiM3vWeSqp2bMGT5H0I
 5ETBzCzLr5tDMsW+qPs5T/JpWNX8gSUhKCe/84vOoQKYtZe/KeMwj5BUrkq5pHVB23aI
 Kg5Sd21l6VIXBd7+Vh6aJ6ZHK18wmBVQm1LKCeG32hC/tjODKAU/84l31GmlNuU7IMbN
 wWSg==
X-Gm-Message-State: AFuF++ntE7dBWiQaU/3IbAVpiEi7Mr2cLuyeY5zNC1VHGnSRKVB5o56l
 BYHN0N5TF4IYy+56NoQ8bV/wriR0MSpX74e/TrkLu91LgkgwEGLKygaDIhxFY65zx1bW4lAkvfY
 4BLk+dMxOvMOc17Zsb7zFGUfbtMijDLInwq0bbgq6AnGUQzXcf5iDoXh2FE82Y6h1vw==
X-Gm-Gg: AR+sD13GeTivU51XfO93zyM1xnhczwW9jnaYmoVtmUjgJe6vXygQIC9+qzlFZ6VNl/W
 sjJbGSt/iufxdHH2ntLV3Y83t7druBTOz/3DLv7xcNE/kQYu4pIbdprDPEsSOY3Cr1pRYDT3gWE
 x4xmFcAfS4GL04WluYWRu4S3Xj/Z5oEuP8l6JwsnEtL7cELu9AKJR/dWsEcBb5C+Oapl2ob/6Gh
 JyiBBM3P7Sn8lHDAmnrMHh6Up33WuwFGprJT9KTIv0NSUldjLIuxdDbd+tLMoRLAtdc4AJSPWNf
 nIOw8qZl6lpLdSiCedWhaDgj1cZ+FBii2PZBVEaDMyONzUT7AFVAeL4RXiArvvoVbQ8eO1lsERn
 XXGei4xpOH+mzsivGmr4rSGzJAmWe8yy97kDwuR+nlqW2TEE8CSbeift3HJr8mV8ilyosUqVwYl
 7IPJtBoIS5rb4p2IFgfFZSqhra0JD9/dU=
X-Received: by 2002:a17:90b:4d88:b0:38e:480b:99a5 with SMTP id
 98e67ed59e1d1-396d0f7d73bmr5690648a91.2.1787916561296; 
 Fri, 28 Aug 2026 04:29:21 -0700 (PDT)
X-Received: by 2002:a17:90b:4d88:b0:38e:480b:99a5 with SMTP id
 98e67ed59e1d1-396d0f7d73bmr5690275a91.2.1787916557542; 
 Fri, 28 Aug 2026 04:29:17 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-142e0de4d92sm4997320c88.13.2026.08.28.04.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 04:29:17 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH v10 06/10] riscv: add RPMI HSM service
Date: Fri, 28 Aug 2026 16:57:58 +0530
Message-ID: <20260828112803.86636-7-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828112803.86636-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20260828112803.86636-1-subrahmanya.lingappa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZbMt8MVA c=1 sm=1 tr=0 ts=6a917115 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=itn9ZVZVmevHaGIKV1oA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: rnC-CpoNooxVq-ErA5ALZwcGOKMCvAq6
X-Proofpoint-GUID: rnC-CpoNooxVq-ErA5ALZwcGOKMCvAq6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA5OCBTYWx0ZWRfX4fslgmDozg6I
 1cnhE0a6zx+iZz+BL6AN3QqXTW0+PTQK9PnFWil26zADgR+Fkk6Z9qGjFmRXUrivHzy/xTWfdpv
 FOdY3QxHk/q/7R1wB/zlpO9bHTlaZmc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA5OCBTYWx0ZWRfX9Td5W6X8mSfo
 ghik+3AO1/iIVSmDbl1YswKqqOUYszUyfGZAHEaveJP6rPsqk9JmVHhgru+zEX5LtYP0JthrF5H
 OWjhfzgyaiH7kH6TCqWExZZYIbWparPyVllpOBc3bgFS4CuXJbN698NtXNHYqo7jNfnR0OomD8m
 x5Dzse1ftRAs/pLbtHDRjr7OhHo63NXfJdc7XlNw/XNI5D1PWvff7d4z9Len+xd59sDSGpsYydA
 1fmrE5cvxbJCefejTWo54D9C1n0dqaYAmrV1LnkxNnMq09Hu029uUaHatfO1NvIyWVbNLhmGprA
 U6H1JxGmzgfVFVQS21dIuuKXnbPH1rkyeQFY/fOj63M9BK4/IQFJis1ajqng6UBelGUWg7Bovd8
 YBL4qRrKecW2gv9y2h7ZrXUtQfvnGeXVEJJbpbdDpe081BstJej3uZSnFId5qFZOFBFnlWbMAXC
 3tQ9Irm2nkBgeV80WcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280098
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Add the RPMI Hart State Management service group for RISC-V virt.

The service exposes the configured virt hart IDs to librpmi and keeps
per-hart RPMI hardware state in the RPMI device. Start, stop, and
suspend requests update QEMU CPU halted state and resume/kick vCPUs as
needed so firmware can exercise RPMI HSM operations against the emulated
topology.

Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/misc/meson.build           |   1 +
 hw/misc/riscv_rpmi.c          |   5 +
 hw/misc/riscv_rpmi_hsm.c      | 281 ++++++++++++++++++++++++++++++++++
 hw/misc/riscv_rpmi_internal.h |   4 +
 hw/riscv/virt.c               |   5 +
 include/hw/misc/riscv_rpmi.h  |   4 +
 6 files changed, 300 insertions(+)
 create mode 100644 hw/misc/riscv_rpmi_hsm.c

diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 25916c93ed..3f2caaf06f 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -179,4 +179,5 @@ system_ss.add(when: 'CONFIG_AXIADO_CLK', if_true: files('axiado_clk.c'))
 system_ss.add(when: 'CONFIG_RISCV_RPMI', if_true: [files(
   'riscv_rpmi.c',
   'riscv_rpmi_sysreset.c',
+  'riscv_rpmi_hsm.c',
 ), librpmi], if_false: files('riscv_rpmi-stub.c'))
diff --git a/hw/misc/riscv_rpmi.c b/hw/misc/riscv_rpmi.c
index 8f2b524138..d93bb70fca 100644
--- a/hw/misc/riscv_rpmi.c
+++ b/hw/misc/riscv_rpmi.c
@@ -195,6 +195,10 @@ static const RiscvRpmiServiceOps riscv_rpmi_service_ops[] = {
         .service_group = RPMI_SRVGRP_SYSTEM_RESET,
         .add = riscv_rpmi_sysreset_add,
         .remove = riscv_rpmi_sysreset_remove,
+    }, {
+        .service_group = RPMI_SRVGRP_HSM,
+        .add = riscv_rpmi_hsm_add,
+        .remove = riscv_rpmi_hsm_remove,
     },
 };
 
@@ -247,6 +251,7 @@ static void riscv_rpmi_reset_hold(Object *obj, ResetType type)
         memory_region_set_dirty(&s->shmem, 0, s->shmem_size);
     }
 
+    riscv_rpmi_hsm_reset(s);
 }
 
 static void riscv_rpmi_cleanup(RiscvRpmiState *s)
diff --git a/hw/misc/riscv_rpmi_hsm.c b/hw/misc/riscv_rpmi_hsm.c
new file mode 100644
index 0000000000..08a985cb30
--- /dev/null
+++ b/hw/misc/riscv_rpmi_hsm.c
@@ -0,0 +1,281 @@
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
+#include "librpmi_env.h"
+
+static const struct rpmi_hsm_suspend_type riscv_rpmi_hsm_suspend_types[] = {
+    {
+        .type = 0,
+        .info = {
+            .flags = 0,
+            .entry_latency_us = 0,
+            .exit_latency_us = 0,
+            .wakeup_latency_us = 0,
+            .min_residency_us = 0,
+        },
+    },
+};
+
+typedef struct RiscvRpmiHsmStateTransition {
+    enum rpmi_hart_hw_state state;
+    bool halted;
+    bool resume;
+} RiscvRpmiHsmStateTransition;
+
+static const RiscvRpmiHsmStateTransition riscv_rpmi_hsm_state_transitions[] = {
+    {
+        .state = RPMI_HART_HW_STATE_STARTED,
+        .halted = false,
+        .resume = true,
+    }, {
+        .state = RPMI_HART_HW_STATE_STOPPED,
+        .halted = true,
+        .resume = false,
+    }, {
+        .state = RPMI_HART_HW_STATE_SUSPENDED,
+        .halted = true,
+        .resume = false,
+    },
+};
+
+static const RiscvRpmiHsmStateTransition *riscv_rpmi_hsm_state_transition(
+    enum rpmi_hart_hw_state state)
+{
+    for (uint32_t index = 0;
+         index < ARRAY_SIZE(riscv_rpmi_hsm_state_transitions); index++) {
+        if (riscv_rpmi_hsm_state_transitions[index].state == state) {
+            return &riscv_rpmi_hsm_state_transitions[index];
+        }
+    }
+
+    return NULL;
+}
+
+static CPUState *riscv_rpmi_hart_cpu(RiscvRpmiState *s, uint32_t hart_index)
+{
+    if (hart_index >= s->hart_count || !s->hart_ids) {
+        return NULL;
+    }
+
+    return cpu_by_arch_id(s->hart_ids[hart_index]);
+}
+
+static void riscv_rpmi_hsm_set_hw_state(RiscvRpmiState *s,
+                                        uint32_t hart_index,
+                                        enum rpmi_hart_hw_state state)
+{
+    CPUState *cpu = riscv_rpmi_hart_cpu(s, hart_index);
+    const RiscvRpmiHsmStateTransition *transition;
+
+    if (hart_index >= s->hart_count || !s->hsm_hw_states) {
+        return;
+    }
+
+    s->hsm_hw_states[hart_index] = state;
+    if (!cpu) {
+        return;
+    }
+
+    transition = riscv_rpmi_hsm_state_transition(state);
+    if (!transition) {
+        return;
+    }
+
+    cpu->halted = transition->halted;
+    if (transition->resume) {
+        cpu_resume(cpu);
+    } else {
+        qemu_cpu_kick(cpu);
+    }
+}
+
+static enum rpmi_error riscv_rpmi_hsm_start_prepare(
+    void *priv, rpmi_uint32_t hart_index, rpmi_uint64_t start_addr)
+{
+    RiscvRpmiState *s = priv;
+    CPUState *cpu = riscv_rpmi_hart_cpu(s, hart_index);
+
+    if (!cpu) {
+        return RPMI_ERR_INVALID_PARAM;
+    }
+
+    cpu_set_pc(cpu, start_addr);
+    riscv_rpmi_hsm_set_hw_state(s, hart_index, RPMI_HART_HW_STATE_STARTED);
+    return RPMI_SUCCESS;
+}
+
+static void riscv_rpmi_hsm_start_finalize(void *priv,
+                                          rpmi_uint32_t hart_index,
+                                          rpmi_uint64_t start_addr)
+{
+}
+
+static enum rpmi_error riscv_rpmi_hsm_stop_prepare(void *priv,
+                                                   rpmi_uint32_t hart_index)
+{
+    RiscvRpmiState *s = priv;
+
+    if (!riscv_rpmi_hart_cpu(s, hart_index)) {
+        return RPMI_ERR_INVALID_PARAM;
+    }
+
+    riscv_rpmi_hsm_set_hw_state(s, hart_index, RPMI_HART_HW_STATE_STOPPED);
+    return RPMI_SUCCESS;
+}
+
+static void riscv_rpmi_hsm_stop_finalize(void *priv, rpmi_uint32_t hart_index)
+{
+}
+
+static enum rpmi_error riscv_rpmi_hsm_suspend_prepare(
+    void *priv, rpmi_uint32_t hart_index,
+    const struct rpmi_hsm_suspend_type *suspend_type,
+    rpmi_uint64_t resume_addr)
+{
+    RiscvRpmiState *s = priv;
+
+    if (!suspend_type || !riscv_rpmi_hart_cpu(s, hart_index)) {
+        return RPMI_ERR_INVALID_PARAM;
+    }
+
+    riscv_rpmi_hsm_set_hw_state(s, hart_index, RPMI_HART_HW_STATE_SUSPENDED);
+    return RPMI_SUCCESS;
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
+    RiscvRpmiState *s = priv;
+
+    if (hart_index >= s->hart_count || !s->hsm_hw_states) {
+        return RPMI_HART_HW_STATE_STOPPED;
+    }
+
+    return s->hsm_hw_states[hart_index];
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
+static bool riscv_rpmi_hsm_create(RiscvRpmiState *s,
+                                  struct rpmi_service_group **group,
+                                  Error **errp)
+{
+    struct rpmi_hsm *hsm;
+
+    if (!s->hart_count || !s->hart_ids) {
+        error_setg(errp, "RPMI HSM service requires hart IDs");
+        return false;
+    }
+
+    s->hsm_hw_states = g_new0(uint32_t, s->hart_count);
+    for (uint32_t i = 0; i < s->hart_count; i++) {
+        s->hsm_hw_states[i] = RPMI_HART_HW_STATE_STARTED;
+    }
+
+    hsm = rpmi_hsm_create(s->hart_count, s->hart_ids,
+                          ARRAY_SIZE(riscv_rpmi_hsm_suspend_types),
+                          riscv_rpmi_hsm_suspend_types,
+                          &riscv_rpmi_hsm_ops, s);
+    if (!hsm) {
+        g_clear_pointer(&s->hsm_hw_states, g_free);
+        error_setg(errp, "failed to create RPMI HSM context");
+        return false;
+    }
+
+    *group = rpmi_service_group_hsm_create(hsm);
+    if (!*group) {
+        rpmi_hsm_destroy(hsm);
+        g_clear_pointer(&s->hsm_hw_states, g_free);
+        error_setg(errp, "failed to create RPMI HSM service group");
+        return false;
+    }
+
+    s->hsm = hsm;
+    return true;
+}
+
+static void riscv_rpmi_hsm_destroy(RiscvRpmiState *s)
+{
+    if (s->hsm_group) {
+        rpmi_env_free_lock(s->hsm_group->lock);
+        s->hsm_group->lock = NULL;
+        rpmi_service_group_hsm_destroy(s->hsm_group);
+        s->hsm_group = NULL;
+    }
+
+    if (s->hsm) {
+        rpmi_hsm_destroy(s->hsm);
+        s->hsm = NULL;
+    }
+
+    g_clear_pointer(&s->hsm_hw_states, g_free);
+}
+
+
+bool riscv_rpmi_hsm_add(RiscvRpmiState *s, Error **errp)
+{
+    struct rpmi_service_group *group;
+
+    if (s->hsm_group) {
+        error_setg(errp, "duplicate RPMI HSM service descriptor");
+        return false;
+    }
+
+    if (!riscv_rpmi_hsm_create(s, &group, errp)) {
+        return false;
+    }
+
+    if (!riscv_rpmi_context_add_group(s, group, "HSM", errp)) {
+        s->hsm_group = group;
+        riscv_rpmi_hsm_destroy(s);
+        return false;
+    }
+
+    s->hsm_group = group;
+    return true;
+}
+
+void riscv_rpmi_hsm_remove(RiscvRpmiState *s)
+{
+    riscv_rpmi_context_remove_group(s, s->hsm_group);
+    riscv_rpmi_hsm_destroy(s);
+}
+
+void riscv_rpmi_hsm_reset(RiscvRpmiState *s)
+{
+    if (!s->hsm_hw_states) {
+        return;
+    }
+
+    for (uint32_t i = 0; i < s->hart_count; i++) {
+        s->hsm_hw_states[i] = RPMI_HART_HW_STATE_STARTED;
+    }
+    if (s->hsm) {
+        rpmi_hsm_process_state_changes(s->hsm);
+    }
+}
diff --git a/hw/misc/riscv_rpmi_internal.h b/hw/misc/riscv_rpmi_internal.h
index 1d7445b2d1..7f9d110776 100644
--- a/hw/misc/riscv_rpmi_internal.h
+++ b/hw/misc/riscv_rpmi_internal.h
@@ -30,4 +30,8 @@ void riscv_rpmi_context_remove_group(RiscvRpmiState *s,
 bool riscv_rpmi_sysreset_add(RiscvRpmiState *s, Error **errp);
 void riscv_rpmi_sysreset_remove(RiscvRpmiState *s);
 
+bool riscv_rpmi_hsm_add(RiscvRpmiState *s, Error **errp);
+void riscv_rpmi_hsm_remove(RiscvRpmiState *s);
+void riscv_rpmi_hsm_reset(RiscvRpmiState *s);
+
 #endif
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 7a97dfcf89..7c29e3634c 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1008,6 +1008,11 @@ static const RiscvRpmiServiceConfig virt_rpmi_services[] = {
         .compatible = "riscv,rpmi-system-reset",
         .service_group = RPMI_SRVGRP_SYSTEM_RESET,
     },
+    {
+        .node_name = "hsm",
+        .compatible = "riscv,rpmi-hsm",
+        .service_group = RPMI_SRVGRP_HSM,
+    },
 };
 
 static uint32_t virt_rpmi_service_count(RISCVVirtState *s)
diff --git a/include/hw/misc/riscv_rpmi.h b/include/hw/misc/riscv_rpmi.h
index 1500ff1b8b..9f7aa9f6ef 100644
--- a/include/hw/misc/riscv_rpmi.h
+++ b/include/hw/misc/riscv_rpmi.h
@@ -44,6 +44,7 @@ struct rpmi_context;
 struct rpmi_service_group;
 struct rpmi_shmem;
 struct rpmi_transport;
+struct rpmi_hsm;
 
 typedef struct RiscvRpmiMachineOps {
     void (*system_reset)(void);
@@ -84,6 +85,9 @@ struct RiscvRpmiState {
     char *platform_info;
     const RiscvRpmiMachineOps *machine_ops;
     struct rpmi_service_group *sysreset_group;
+    struct rpmi_hsm *hsm;
+    struct rpmi_service_group *hsm_group;
+    uint32_t *hsm_hw_states;
     uint32_t *hart_ids;
     uint32_t hart_count;
     const RiscvRpmiServiceConfig *services;
-- 
2.43.0


