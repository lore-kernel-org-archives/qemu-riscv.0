Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944E8606A320
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 13:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jDz2KbSf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D/sDStuZ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xLKgC-0001Yz-Qd; Mon, 26 Oct 2026 09:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xLKg6-0001Xr-HV
 for qemu-riscv@nongnu.org; Mon, 26 Oct 2026 09:23:54 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xLKg3-0005Ge-9p
 for qemu-riscv@nongnu.org; Mon, 26 Oct 2026 09:23:54 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69QAt0dq3561920
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2026 13:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=hmunNE+goje
 s745y3xLjTV9YHlCeEzKNm7XlWICxDoY=; b=jDz2KbSfFcNZVrHp0zIkED4+SpK
 xqFx4vOJsiD0AjlOSGljZzqKHDrR20MKZFpv989OHbSdQn3RZxyXbeCJOCNcrcmA
 OKPo2F0rAUgIQSVAdAeivMTpWeXKrXGgT+EA6tuQqMr+k/Pu8A5k4xhyd+A9aLhf
 CQjS1LZghNnC5ZKZHZK+2PNbFgrENBISEAHC3+3tAdSVIplGwgBvTd6T7ZAp+Q0a
 pDwRUMR67joSUUKTipGre37zk4qqYYHlnciFhpcGAbMSUR1hfh7MQdGS6MteABqQ
 8hLjwV1WJrBNxNxU6sKMgSM8Zq+/CyXaiX8ckSB4AtvibqgHKfPG7Xm2Pqg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s90s2v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2026 13:23:50 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-36660d874a1so387458eec.3
 for <qemu-riscv@nongnu.org>; Mon, 26 Oct 2026 06:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793021029; x=1793625829; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hmunNE+gojes745y3xLjTV9YHlCeEzKNm7XlWICxDoY=;
 b=D/sDStuZl8npAxUwRJiW5hTHiLx9lVsNGTp1gapaDFgZS/qoPUuQ8xc8kEdM+Rubvy
 ilaG3Ixwpsdd8WRD0VlRtFwUC9FAHeLhGvYTLb8ZNm7MJ8+Vr0qcN98g1fa41ObjB9ha
 gQLr5T50aIzPEo2yQGIK9rzsABgLZKQj/YmU3ml9xTuMsikQbQnOam/jD4vItS6ByyuZ
 M7bQ5m/9428r9kcCNEMM4aX7l2VhtmKG4LeV/AAy1PMFO0ovqzY1ae4YwKiewqqybjNB
 dmlZfUCocXdA5sR2ZQ9x/Lfz85Imo8tusS+EPuHr4MLw0foDrnM7jg/lWHHpRSOM4NeY
 kXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793021029; x=1793625829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hmunNE+gojes745y3xLjTV9YHlCeEzKNm7XlWICxDoY=;
 b=GfFXCifuZyj7pn15NDdswvCYga5whSJekZ4Grol03aYTOvczKcvewOkjofDfkibdIE
 W5HHtqxLzeQsjL1vWSlPfpdctdN64mqZ826GUPJy1dnaV7PuR2pTVZxkw6q3V29/YUsY
 WZ18ubiUkHU92smVTmISlnIxTwvS9XBA7o2yfrc4LLQrlvCjza8RopsSQGuNp6cKiFK+
 PPZbBnEjozZSniy9cV7iPW1xGHkQMOpJxfdWWBKAeZs+K3X/10xObm5OevDpxdU9feVv
 i1S6exzkuDkW4QcS3On3kHq4prMgPJuIEEJmqqiBpCDLmiLCIf3zBzc1ROjweYV+RdnQ
 Jxgg==
X-Gm-Message-State: AFq9FYLvZ1vTmfT0Kzm1AGXqULpYZS4ltPihLcIq2bd0ATZyuptcHHyg
 PJ1Zv8uUHJxs1GYlzYTCFrmhLx+YR8FmDY32sXXYov7i2yljWJf5wrxqr4y0Wz9Z09IuOiJ+5h1
 /a6k/+t1Df+3lxeIa4oYVTlpQbs94Gggjk7RquY0LXi1lwJpExrjdU95Yiw==
X-Gm-Gg: AYBFou0QaI6YSub7xrBmyi6eQ9vM5V5fzged8qTaz10aC+75Oyo8zPel5Gs2Dn/K16B
 QpE4DlEvd/h9Z8p1nYj6upp9moDxiN0VoMO6Eu2LiORaz65HVu8NPLRsK5ku0QDdYnRXmvHxj8l
 MyKGC/vEOJxMOV+BBx+tgfXuojRQZ2i0gfHf8/2I2J+Bj5lYTx659KfDSrHxr9xVzy5xlhnKtkg
 bn4N5gjrqumc3YqXzup/GCni28MkqM2uhdYR6kok0rieXlK8THFKKrlxvbJkMRUPBAG0MyB6utZ
 L6aRArPyuwrOhDUi+uOQEtw+fnpo9P13ty6TiWEa2vDeW1YUUC7YWbvCdjlALJxB4Cf/8W3GziG
 IJXu9A9/+GfzZ2xNhvxZkD6AFeKobecaiFYcQkU9SDFOp/4kHoOMeZeDN2O7OhFByW7a3a/Ww+2
 ae+cs/n+2vZLZbMpiiVxmLjrKRDzP6lN4=
X-Received: by 2002:a05:701b:454d:20b0:147:d430:7322 with SMTP id
 a92af1059eb24-1993329074bmr14561311c88.1.1793021028952; 
 Mon, 26 Oct 2026 06:23:48 -0700 (PDT)
X-Received: by 2002:a05:701b:454d:20b0:147:d430:7322 with SMTP id
 a92af1059eb24-1993329074bmr14561240c88.1.1793021028269; 
 Mon, 26 Oct 2026 06:23:48 -0700 (PDT)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-198a21bc6cbsm24360931c88.16.2026.10.26.06.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 06:23:41 -0700 (PDT)
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [PATCH v12 06/10] riscv: add RPMI HSM service
Date: Mon, 26 Oct 2026 18:52:49 +0530
Message-ID: <20261026132254.2652399-7-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026132254.2652399-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20261026132254.2652399-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MyBTYWx0ZWRfXxaOrPVsc164p
 WDkIHwvYpPDqPeA6s/c5OdOQBPRkYNU9+4RiKQl5gvT3U+J5qOnlvvwfamQWABiVqgnMw5s+zkP
 YM1VJyAbcCcHiahxhG55xbE2YwCEfUwnB67N8uc7r1wb4wCigi15s+QbXTybb6fyLVAg0j4tDrE
 e6/SJuBLrEvzAOahsmwn+orYqgxmapnRsLGNm7xaAB7XYbvmbgo7yUdWsQplEWCG4YLo8VH7zw4
 utzSo68MFO9X+oOq140GVAwj1bfjsXnOoV2DiJ8P4mTffqCdCMEEQgSMdBenQI9i656RuKbROp5
 gZ0gsLSi+TEKHZru5Gnf8sXLBQj9EvL2guI9m4a3YZsq2KnuTurfsROBTVfgEaQF1iNt3LNeD4t
 hLPCoyAqF1iGh8RHHhd24My+kI3kKA3DKe4M8wP6zvzkxlSLqHj9MFvR+Ze1fQSECOXgKDipKvC
 TbFOcBS3kV/x81ffpAg==
X-Proofpoint-ORIG-GUID: cUTrgDWK8Byam5XjSe20t7Uwmg7u0IWb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MyBTYWx0ZWRfXxYcuon/QB48Z
 5SeUQ9mOgXuQ5GrVIc8/tqeAx1lTVfyqBt2ZXFgsS3GKg81l5oWUxeQWsrUM9z4GoGTsGQSeOyW
 rHa0/Kk5vsjgRa1HjunAwQOtG/zRAjw=
X-Proofpoint-GUID: cUTrgDWK8Byam5XjSe20t7Uwmg7u0IWb
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf5466 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=itn9ZVZVmevHaGIKV1oA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260053
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index 87ea363199..00ae6f1b41 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -184,4 +184,5 @@ system_ss.add(when: 'CONFIG_AXIADO_CLK', if_true: files('axiado_clk.c'))
 system_ss.add(when: 'CONFIG_RISCV_RPMI', if_true: [files(
   'riscv_rpmi.c',
   'riscv_rpmi_sysreset.c',
+  'riscv_rpmi_hsm.c',
 ), librpmi], if_false: files('riscv_rpmi-stub.c'))
diff --git a/hw/misc/riscv_rpmi.c b/hw/misc/riscv_rpmi.c
index 7d55215fa0..b3b9a202a5 100644
--- a/hw/misc/riscv_rpmi.c
+++ b/hw/misc/riscv_rpmi.c
@@ -211,6 +211,10 @@ static const RiscvRpmiServiceOps riscv_rpmi_service_ops[] = {
         .service_group = RPMI_SRVGRP_SYSTEM_RESET,
         .add = riscv_rpmi_sysreset_add,
         .remove = riscv_rpmi_sysreset_remove,
+    }, {
+        .service_group = RPMI_SRVGRP_HSM,
+        .add = riscv_rpmi_hsm_add,
+        .remove = riscv_rpmi_hsm_remove,
     },
 };
 
@@ -263,6 +267,7 @@ static void riscv_rpmi_reset_hold(Object *obj, ResetType type)
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
index 6e3d143a0b..ef81ba761e 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -475,6 +475,11 @@ static const RiscvRpmiServiceConfig virt_rpmi_services[] = {
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


