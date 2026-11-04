Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274C2606A31B
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 05:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WX7rQBy/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H21Ar6cq
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOTD3-0005SD-NJ; Wed, 04 Nov 2026 00:06:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xOTCq-0005HG-Tg
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 00:06:40 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xOTCn-0002Dx-PQ
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 00:06:40 -0500
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A40RqZw3868016
 for <qemu-riscv@nongnu.org>; Wed, 4 Nov 2026 05:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=d+pDUawxAXt
 CoCyAp3yiWcSw5cwf6H6rCMMVnTzmx6E=; b=WX7rQBy/W+I47wReU4etZU3KMGl
 bAPExMvnrQYyMoUcevs/P38kBW4JkxA73jN0TKQQp/nkuT8NzK9oOPbbM6ANmC8D
 g5eeEGAm1NB08GxbnCeI4bVo93rdT0QZ9uDjPvYkQY6lAG8QKgNOsh3ZUveAaiwa
 Q6BuXPxJd5Qm6/6+UxZQncWKV1Bkwl1lnxZMf3UaH2aMCVmEKt8zV/BKHAaA/8xd
 9HE8RxqqH+V7pHVPWMdMi1CXQmgjkqMr0tfOVChZyFO4cdzQy9JHI5FP+sIj+n0k
 wkuE+O9JT92ijwTi6dpbN8bqhZ3gF/OZJqHs790Z3nvbsiq4YgcDFO0ph8A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8y205v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 05:06:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-36c98e5ad40so49505eec.0
 for <qemu-riscv@nongnu.org>; Tue, 03 Nov 2026 21:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793768785; x=1794373585; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=d+pDUawxAXtCoCyAp3yiWcSw5cwf6H6rCMMVnTzmx6E=;
 b=H21Ar6cqCaoPad257JiaWrsfwUC500M67I126HWjxXGPhGWRRnVtquqqR4firT9dL/
 1EgCRgtFy72+HZhQnFlZi9MEOpzj136NsCB75UEkt3JJ8kXbs49i93UPt7H789WVfoMs
 7CsfzuGCNQMzvOUC50JcOxOEUCLTShzw5RMMV/46XfdpxP2WQVZCcX+n6eTMbsXrkULK
 1Wz9e2yLd0vPW1V/WiSvX84PcekMajeUsWw+mEWsBQtpdXdTKwZlbgCwh/d368cNzWj4
 5cMk7GcfXeXDk0GXM2LUtp0AnNzeGiRpMc0cx+AXQzmaEx7jynvWzzZ5oClZtY6H+Ala
 /iCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793768785; x=1794373585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=d+pDUawxAXtCoCyAp3yiWcSw5cwf6H6rCMMVnTzmx6E=;
 b=FI15unN1IZBgKgRzhjEeB+rxcDFmnPCcKZezxFkLjywpm3PQVFCjNyseduTukBlvD+
 7/CFEKpKSB+5dDR3koy7ovrtqO7CjsxnbjKfIDjnOsofLAR7UU/6Bmo2PejUEaF4CG0n
 VFoi0kbDMH1tcx5B2MSxaWGdtYwwYSjWYynZ9QbG7kif/joykN1GMRc/f2cLmG+V6JVi
 9rhT2YPKhrU2Pv1xuy1WxoDoz5Wc9Rfkh5evetSaF9g+1FWqfUyzUg1DY2Ugj73XCzHg
 XysHiv65GWeRTRsGfand4XlO6ZOay5fLAKIdcdeBV1lT70T1hDSOZ6xGxGv9FjLGM9fk
 7AVg==
X-Gm-Message-State: APuU4Z+VgDjw0GgWqjR2AWtcKAt9TFDRHXZF5PEk6Zo/n2k6embIBsVJ
 qm5YvBtTs9jrnPPV8qo+jB0hN1XCafpRbUF758eciDz8i7h0D/g8A9Y9iAPHVf5jZf0WiGuaTNr
 16KApiJwZS5DtcuqswwYaLoZbyZoZpBl6mC3usKGqOVoAPTSoa/RZFUwppg==
X-Gm-Gg: AYBFou16Lpkf8KtQ2IulV2hhmVzhC0kIF6u8UHVniwMcmdxY8WhR0Ngb9D22t64tKW4
 oqOjOmX0cuMFvKItAMZY59gjHg6+bQSSCpvbBx+gWQvA3F1OLIhQOv2nKmVsEASegPc7wwQgRk3
 /vSmRTI6gszGmxR0FGH+bohnYysuC6IaGzzzjm0EDq3W1vW1Jt5aXnSY8GSzqrPHurui55c5Ldy
 GjkwhON1XXMQm1qeGJaLQmxU96s7utdvUjrVu9bcHzAVuj71VZCkvzCVo1l6wJjDYuR5SVkuFhn
 sEeOGUQRad7NGA44vl7+Liq/aF8utA2wePYuQWK3z6EpytFP43LN+PqwcKPiQQ+lfbyb11qrokQ
 T/c7mlgVPT8XJO/csT8rU6vPTiwzvtfw6r3xsHEEdn1VArkoD3WMCc+1Pocco5qkRaM8uWnrwEU
 K3fls+bhFxWiS5QEzFZLiz5zvvXDUFEK54rzZuzyL+hEPk/jfSGJ8+yF+KONObawcJOIW76mnxO
 X8L5Pe8
X-Received: by 2002:a05:7301:fa6:b0:369:f195:a5ff with SMTP id
 5a478bee46e88-36a4231f8e3mr34526482eec.1.1793768785187; 
 Tue, 03 Nov 2026 21:06:25 -0800 (PST)
X-Received: by 2002:a05:7301:fa6:b0:369:f195:a5ff with SMTP id
 5a478bee46e88-36a4231f8e3mr34526445eec.1.1793768784515; 
 Tue, 03 Nov 2026 21:06:24 -0800 (PST)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca390df28sm3925036eec.18.2026.11.03.21.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 21:06:24 -0800 (PST)
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
Subject: [PATCH v14 07/10] riscv: add RPMI system suspend service
Date: Wed,  4 Nov 2026 10:33:20 +0530
Message-ID: <20261104050324.733555-8-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104050324.733555-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20261104050324.733555-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: enUC6BBQCf266zwzd1q1xgqG05rfPkfn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX3QAisMpfGbgt
 zgoY5jOZ5mOTMJf+3nG02Lr2ADOVDf0cftI5k7fdsvf1Tswsll0uhIKlbAIWmoh0STre1WSpWN5
 8p/l+6rPCJ3rGXFT9Mnp9Gg+ZdL7QZKNflfPitOk8pgs7qzfqVeVzgzWl9jbUyr05/EWRxbPpbo
 8MFcnd6VOKYKODXSe1xhexeYB7BX7SG5TbBkAp/7I3YgqyfxkSgMc9aWkTYa74T5woc7j89e3d4
 EoFZBinqZ74+8WhmBvtW2dP9JEsVhxguQIm2f6WlBWOfxHHzMIon3+BVMmSwF70WAOFRWR9myoj
 i/ixnw59Pk1YbJSSx/Xu+KjAzjVQ4VA9tISay+ywelbilFQQ4nItaCKFezVaW+qLqFDy68NuWdm
 2wt3hntUehsZhJfWU5Vss7XPJ9tkkkZmhWqlhGBZzbIC2/o9jfTC9AdoR0rwGYQmzG5f3Vwa3gD
 1ZWYwnUT8kftdmQTWrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfXzt62/gaPnkBx
 bHMHnUkdezbwO8kUb8dw4Ne77nZKamTpyhjHSb6WMsWsRCtlUwCEhQJKON+Dw0OHf+le4/OcqUz
 iyDVTZfJj+e7aaIRsxyQ3M0KC5mziWE=
X-Proofpoint-ORIG-GUID: enUC6BBQCf266zwzd1q1xgqG05rfPkfn
X-Authority-Analysis: v=2.4 cv=NP5AaE6g c=1 sm=1 tr=0 ts=6aeabd52 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Mh6PCMENURz3S0C0lcMA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040020
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

Add the RPMI System Suspend service group for RISC-V virt.

The service advertises suspend-to-RAM support through librpmi, registers QEMU wakeup support, and routes the finalize callback to the generic system suspend path. Process only the accepted System Suspend event instead of polling every RPMI service group from an unrelated doorbell request.

On wakeup, publish the suspend event under the BQL and defer the HSM hart resume until vCPUs are ready to run. Cancel stale wakeup work during teardown. Machine reset removes and recreates System Suspend around HSM reconstruction so the service always references the current HSM object.

Reject malformed resume addresses before accepting suspend. Require the
target hart's configured instruction alignment and address width, and verify
that the resume PC is backed by RAM in the active system-memory map.

Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
---
 hw/misc/meson.build           |   2 +
 hw/misc/riscv_rpmi.c          |  30 ++++--
 hw/misc/riscv_rpmi_hsm.c      |  15 +++
 hw/misc/riscv_rpmi_internal.h |   8 +-
 hw/misc/riscv_rpmi_syssusp.c  | 198 ++++++++++++++++++++++++++++++++++
 hw/riscv/virt.c               |   5 +
 include/hw/misc/riscv_rpmi.h  |   9 ++
 7 files changed, 259 insertions(+), 8 deletions(-)
 create mode 100644 hw/misc/riscv_rpmi_syssusp.c

diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 6d93cd4ab0..1dc7aa7c67 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -188,3 +188,5 @@ system_ss.add(when: 'CONFIG_RISCV_RPMI', if_true: [files(
   'riscv_rpmi_sysreset.c',
   'riscv_rpmi_hsm.c',
 ), librpmi], if_false: files('riscv_rpmi-stub.c'))
+specific_ss.add(when: 'CONFIG_RISCV_RPMI',
+                if_true: [files('riscv_rpmi_syssusp.c'), librpmi])
diff --git a/hw/misc/riscv_rpmi.c b/hw/misc/riscv_rpmi.c
index 1bf9d77b04..56a092e49e 100644
--- a/hw/misc/riscv_rpmi.c
+++ b/hw/misc/riscv_rpmi.c
@@ -214,6 +214,10 @@ static const RiscvRpmiServiceOps riscv_rpmi_service_ops[] = {
         .service_group = RPMI_SRVGRP_HSM,
         .add = riscv_rpmi_hsm_add,
         .remove = riscv_rpmi_hsm_remove,
+    }, {
+        .service_group = RPMI_SRVGRP_SYSTEM_SUSPEND,
+        .add = riscv_rpmi_syssusp_add,
+        .remove = riscv_rpmi_syssusp_remove,
     },
 };
 
@@ -256,6 +260,7 @@ static void riscv_rpmi_init(Object *obj)
 static void riscv_rpmi_reset_hold(Object *obj, ResetType type)
 {
     RiscvRpmiState *s = RISCV_RPMI(obj);
+    bool reset_syssusp = s->syssusp_group != NULL;
 
     s->doorbell = 0;
 
@@ -263,9 +268,15 @@ static void riscv_rpmi_reset_hold(Object *obj, ResetType type)
         memset(memory_region_get_ram_ptr(&s->shmem), 0, s->shmem_size);
         memory_region_set_dirty(&s->shmem, 0, s->shmem_size);
     }
+    if (reset_syssusp) {
+        riscv_rpmi_syssusp_remove(s);
+    }
     if (!riscv_rpmi_hsm_reset(s, &error_abort)) {
         return;
     }
+    if (reset_syssusp && !riscv_rpmi_syssusp_add(s, &error_abort)) {
+        return;
+    }
 }
 
 static void riscv_rpmi_cleanup(RiscvRpmiState *s)
@@ -309,13 +320,6 @@ bool riscv_rpmi_service_enabled(RiscvRpmiState *s,
     return false;
 }
 
-void riscv_rpmi_context_process_a2p_request(RiscvRpmiState *s)
-{
-    if (s->context) {
-        rpmi_context_process_a2p_request(s->context);
-    }
-}
-
 bool riscv_rpmi_context_add_group(RiscvRpmiState *s,
                                   struct rpmi_service_group *group,
                                   const char *name,
@@ -340,6 +344,18 @@ void riscv_rpmi_context_remove_group(RiscvRpmiState *s,
     }
 }
 
+void riscv_rpmi_context_process_a2p_request(RiscvRpmiState *s)
+{
+    if (s->context) {
+        rpmi_context_process_a2p_request(s->context);
+        if (s->syssusp_event_pending && s->syssusp_group) {
+            s->syssusp_event_pending = false;
+            rpmi_context_process_group_events(s->context,
+                                              RPMI_SRVGRP_SYSTEM_SUSPEND);
+        }
+    }
+}
+
 static bool riscv_rpmi_validate_config(RiscvRpmiState *s, Error **errp)
 {
     uint64_t queue_bytes;
diff --git a/hw/misc/riscv_rpmi_hsm.c b/hw/misc/riscv_rpmi_hsm.c
index 42a4f3b096..08e78e1ee7 100644
--- a/hw/misc/riscv_rpmi_hsm.c
+++ b/hw/misc/riscv_rpmi_hsm.c
@@ -42,6 +42,7 @@ static RiscvRpmiHsmHart *riscv_rpmi_hsm_hart(RiscvRpmiState *s,
 
     return &s->hsm_harts[hart_index];
 }
+
 static void riscv_rpmi_hsm_wfi(CPUState *cpu, bool entering, void *opaque)
 {
     RiscvRpmiHsmHart *hart = opaque;
@@ -342,3 +343,17 @@ bool riscv_rpmi_hsm_reset(RiscvRpmiState *s, Error **errp)
     s->hsm_group = group;
     return true;
 }
+
+void riscv_rpmi_hsm_resume(RiscvRpmiState *s, uint32_t hart_index,
+                           uint64_t resume_addr)
+{
+    RiscvRpmiHsmHart *hart = riscv_rpmi_hsm_hart(s, hart_index);
+
+    if (!hart) {
+        return;
+    }
+
+    hart->start_addr = resume_addr;
+    run_on_cpu(hart->cpu, riscv_rpmi_hsm_start_cpu,
+               RUN_ON_CPU_HOST_PTR(hart));
+}
diff --git a/hw/misc/riscv_rpmi_internal.h b/hw/misc/riscv_rpmi_internal.h
index e56dba5b1a..8739c3f041 100644
--- a/hw/misc/riscv_rpmi_internal.h
+++ b/hw/misc/riscv_rpmi_internal.h
@@ -20,18 +20,24 @@
 extern const struct rpmi_shmem_platform_ops rpmi_shmem_qemu_ops;
 bool riscv_rpmi_service_enabled(RiscvRpmiState *s,
                                 enum rpmi_servicegroup_id service_group);
-void riscv_rpmi_context_process_a2p_request(RiscvRpmiState *s);
 bool riscv_rpmi_context_add_group(RiscvRpmiState *s,
                                   struct rpmi_service_group *group,
                                   const char *name,
                                   Error **errp);
 void riscv_rpmi_context_remove_group(RiscvRpmiState *s,
                                      struct rpmi_service_group *group);
+void riscv_rpmi_context_process_a2p_request(RiscvRpmiState *s);
+
 bool riscv_rpmi_sysreset_add(RiscvRpmiState *s, Error **errp);
 void riscv_rpmi_sysreset_remove(RiscvRpmiState *s);
 
 bool riscv_rpmi_hsm_add(RiscvRpmiState *s, Error **errp);
 void riscv_rpmi_hsm_remove(RiscvRpmiState *s);
 bool riscv_rpmi_hsm_reset(RiscvRpmiState *s, Error **errp);
+void riscv_rpmi_hsm_resume(RiscvRpmiState *s, uint32_t hart_index,
+                           uint64_t resume_addr);
+
+bool riscv_rpmi_syssusp_add(RiscvRpmiState *s, Error **errp);
+void riscv_rpmi_syssusp_remove(RiscvRpmiState *s);
 
 #endif
diff --git a/hw/misc/riscv_rpmi_syssusp.c b/hw/misc/riscv_rpmi_syssusp.c
new file mode 100644
index 0000000000..d70536a27a
--- /dev/null
+++ b/hw/misc/riscv_rpmi_syssusp.c
@@ -0,0 +1,198 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * RISC-V RPMI System Suspend service.
+ *
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ * Author:
+ *  Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
+ */
+
+#include "qemu/osdep.h"
+#include "riscv_rpmi_internal.h"
+#include "system/address-spaces.h"
+#include "system/memory.h"
+#include "qemu/timer.h"
+#include "system/cpus.h"
+#include "system/runstate.h"
+#include "target/riscv/cpu.h"
+
+static const struct rpmi_system_suspend_type riscv_rpmi_syssusp_types[] = {
+    {
+        .type = RPMI_SYSSUSP_TYPE_SUSPEND_TO_RAM,
+        .attr = RPMI_SYSSUSP_ATTRS_FLAGS_RESUMEADDR,
+    },
+};
+
+static enum rpmi_error riscv_rpmi_syssusp_prepare(
+    void *priv, rpmi_uint32_t hart_index,
+    const struct rpmi_system_suspend_type *syssusp_type,
+    rpmi_uint64_t resume_addr)
+{
+    RiscvRpmiState *s = priv;
+    RISCVCPU *cpu = RISCV_CPU(cpu_by_arch_id(s->hart_ids[hart_index]));
+    unsigned int alignment = ((cpu->env.misa_ext_mask & RVC) ||
+                              cpu->cfg.ext_zca) ? 2 : 4;
+    MemoryRegionSection section;
+
+    if ((resume_addr & (alignment - 1)) ||
+        (cpu->env.misa_mxl == MXL_RV32 && resume_addr > UINT32_MAX)) {
+        return RPMI_ERR_INVALID_ADDR;
+    }
+
+    section = memory_region_find(get_system_memory(), resume_addr, 1);
+    if (!section.mr || !memory_region_is_ram(section.mr) ||
+        memory_region_is_rom(section.mr)) {
+        if (section.mr) {
+            memory_region_unref(section.mr);
+        }
+        return RPMI_ERR_INVALID_ADDR;
+    }
+    memory_region_unref(section.mr);
+
+    /* The accepted request needs one targeted event pass to finalize it. */
+    s->syssusp_event_pending = true;
+    return RPMI_SUCCESS;
+}
+
+static rpmi_bool_t riscv_rpmi_syssusp_ready(void *priv,
+                                            rpmi_uint32_t hart_index)
+{
+    return true;
+}
+
+static void riscv_rpmi_syssusp_finalize(
+    void *priv, rpmi_uint32_t hart_index,
+    const struct rpmi_system_suspend_type *syssusp_type,
+    rpmi_uint64_t resume_addr)
+{
+    qemu_system_suspend_request();
+}
+
+static rpmi_bool_t riscv_rpmi_syssusp_can_resume(void *priv,
+                                                 rpmi_uint32_t hart_index)
+{
+    return runstate_check(RUN_STATE_RUNNING);
+}
+
+static enum rpmi_error riscv_rpmi_syssusp_resume(
+    void *priv, rpmi_uint32_t hart_index,
+    const struct rpmi_system_suspend_type *syssusp_type,
+    rpmi_uint64_t resume_addr)
+{
+    RiscvRpmiState *s = priv;
+
+    s->syssusp_resume_hart_index = hart_index;
+    s->syssusp_resume_addr = resume_addr;
+    s->syssusp_resume_pending = true;
+    return RPMI_SUCCESS;
+}
+
+static const struct rpmi_syssusp_platform_ops riscv_rpmi_syssusp_ops = {
+    .system_suspend_prepare = riscv_rpmi_syssusp_prepare,
+    .system_suspend_ready = riscv_rpmi_syssusp_ready,
+    .system_suspend_finalize = riscv_rpmi_syssusp_finalize,
+    .system_suspend_can_resume = riscv_rpmi_syssusp_can_resume,
+    .system_suspend_resume = riscv_rpmi_syssusp_resume,
+};
+
+static void riscv_rpmi_wakeup_timer(void *opaque)
+{
+    RiscvRpmiState *s = opaque;
+
+    if (s->syssusp_resume_pending) {
+        riscv_rpmi_hsm_resume(s, s->syssusp_resume_hart_index,
+                              s->syssusp_resume_addr);
+        s->syssusp_resume_pending = false;
+        s->syssusp_resume_addr = 0;
+    }
+}
+
+static void riscv_rpmi_wakeup_notify(Notifier *notifier, void *data)
+{
+    RiscvRpmiState *s = container_of(notifier, RiscvRpmiState,
+                                     wakeup_notifier);
+
+    rpmi_context_process_group_events(s->context,
+                                      RPMI_SRVGRP_SYSTEM_SUSPEND);
+    /*
+     * Wakeup notifiers run before vCPUs resume. Defer the HSM kick so
+     * OpenSBI can leave WFI after QEMU restarts execution.
+     */
+    timer_mod(s->wakeup_timer, qemu_clock_get_ms(QEMU_CLOCK_REALTIME) + 10);
+}
+
+static bool riscv_rpmi_syssusp_create(RiscvRpmiState *s,
+                                      struct rpmi_service_group **group,
+                                      Error **errp)
+{
+    if (!s->hsm) {
+        error_setg(errp, "RPMI system suspend service requires HSM service");
+        return false;
+    }
+
+    *group = rpmi_service_group_syssusp_create(
+        s->hsm, ARRAY_SIZE(riscv_rpmi_syssusp_types),
+        riscv_rpmi_syssusp_types, &riscv_rpmi_syssusp_ops, s);
+    if (!*group) {
+        error_setg(errp, "failed to create RPMI system suspend service group");
+        return false;
+    }
+
+    qemu_register_wakeup_support();
+    s->wakeup_timer = timer_new_ms(QEMU_CLOCK_REALTIME,
+                                   riscv_rpmi_wakeup_timer, s);
+    s->wakeup_notifier.notify = riscv_rpmi_wakeup_notify;
+    qemu_register_wakeup_notifier(&s->wakeup_notifier);
+    return true;
+}
+
+static void riscv_rpmi_syssusp_destroy(RiscvRpmiState *s)
+{
+    notifier_remove(&s->wakeup_notifier);
+    timer_free(s->wakeup_timer);
+    s->wakeup_timer = NULL;
+
+    s->syssusp_event_pending = false;
+    s->syssusp_resume_pending = false;
+    s->syssusp_resume_hart_index = 0;
+    s->syssusp_resume_addr = 0;
+
+    if (s->syssusp_group) {
+        rpmi_service_group_syssusp_destroy(s->syssusp_group);
+        s->syssusp_group = NULL;
+    }
+}
+
+bool riscv_rpmi_syssusp_add(RiscvRpmiState *s, Error **errp)
+{
+    struct rpmi_service_group *group;
+
+    if (s->syssusp_group) {
+        error_setg(errp, "duplicate RPMI system suspend descriptor");
+        return false;
+    }
+
+    if (!riscv_rpmi_syssusp_create(s, &group, errp)) {
+        return false;
+    }
+
+    if (!riscv_rpmi_context_add_group(s, group, "system suspend", errp)) {
+        s->syssusp_group = group;
+        riscv_rpmi_syssusp_destroy(s);
+        return false;
+    }
+
+    s->syssusp_group = group;
+    return true;
+}
+
+void riscv_rpmi_syssusp_remove(RiscvRpmiState *s)
+{
+    if (!s->syssusp_group) {
+        return;
+    }
+
+    riscv_rpmi_context_remove_group(s, s->syssusp_group);
+    riscv_rpmi_syssusp_destroy(s);
+}
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 32aa13325e..53a31d1abd 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -490,6 +490,11 @@ static const RiscvRpmiServiceConfig virt_rpmi_services[] = {
         .compatible = "riscv,rpmi-hsm",
         .service_group = RPMI_SRVGRP_HSM,
     },
+    {
+        .node_name = "suspend",
+        .compatible = "riscv,rpmi-system-suspend",
+        .service_group = RPMI_SRVGRP_SYSTEM_SUSPEND,
+    },
 };
 
 static uint32_t virt_rpmi_service_count(void)
diff --git a/include/hw/misc/riscv_rpmi.h b/include/hw/misc/riscv_rpmi.h
index 3a240941cd..3aaaaf68ae 100644
--- a/include/hw/misc/riscv_rpmi.h
+++ b/include/hw/misc/riscv_rpmi.h
@@ -13,6 +13,8 @@
 
 #include "exec/hwaddr.h"
 #include "hw/core/sysbus.h"
+#include "qemu/notify.h"
+#include "qemu/timer.h"
 #include "qom/object.h"
 
 #ifdef CONFIG_LIBRPMI
@@ -84,9 +86,16 @@ struct RiscvRpmiState {
     char *platform_info;
     const RiscvRpmiMachineOps *machine_ops;
     struct rpmi_service_group *sysreset_group;
+    struct rpmi_service_group *syssusp_group;
     struct rpmi_hsm *hsm;
     struct rpmi_service_group *hsm_group;
     RiscvRpmiHsmHart *hsm_harts;
+    bool syssusp_event_pending;
+    Notifier wakeup_notifier;
+    QEMUTimer *wakeup_timer;
+    bool syssusp_resume_pending;
+    uint32_t syssusp_resume_hart_index;
+    uint64_t syssusp_resume_addr;
     uint32_t *hart_ids;
     uint32_t hart_count;
     const RiscvRpmiServiceConfig *services;

