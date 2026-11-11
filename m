Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6498606A321
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 06:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f1BQlFBb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fxo233Lo
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xR1SI-0008LY-T1; Wed, 11 Nov 2026 01:05:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xR1SH-0008Gt-AL
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 01:05:09 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1xR1SD-0000lh-6G
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 01:05:09 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AB5KJD82350811
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 06:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=qF2EeNk9VqJ
 9/cd2mmxxCU1YhPyZgJdWd31R12OE3w0=; b=f1BQlFBbLBT5hgdzdrLre5yZ/t4
 qtJ/aO+1Ev16wF1fTdE2GpvMZUj+yFg/c6DmZxPaJdHYfmHtJ8ovtNO6mcpW79KU
 8MBrI8HlP+oSYo2mH5luHsDrlqXvsr9+E/f0xem2XeXo8hGARxIWMMqYGExx5TlZ
 RZmuxrwHN2O6HVd7L++j33XHRoM/I6xGvR0yDaT2Y5TS1AOq8b2RdRQF7io1VYt0
 faa+hKCw9o9+9tRKr46ZimLTgabSR/6/3fu32KwNQ1De2YP0vTtgts6Zro4XIekh
 /35t6p5QIBfmzhlg7Hj8cOdnpaJ73vO3QRs1Aa5zYb3+7YgXT9Whts1we3A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnp13e6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 06:05:03 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-77f133855b9so7806137.1
 for <qemu-riscv@nongnu.org>; Tue, 10 Nov 2026 22:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794377102; x=1794981902; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qF2EeNk9VqJ9/cd2mmxxCU1YhPyZgJdWd31R12OE3w0=;
 b=Fxo233LoLom8HLqCbnwfACYGbZ65brGq80PS7ycTOIXs7WfoWlrRvAs+9eK7M5ROBv
 gwVSecTwWXgIBaW9BGZMcIWT17kIdVMdHjmFgGe7ERGD8iNSLUO7ytl+eGqJ5YSsEeaU
 0UrdCEHcWkqeD0IqBRafQQyAScwmGaj3klBM1hHJEUvDtee6SK5HXexlmiMas/tVkm0M
 XSmyONU987TnMRib8oz2TZ88wuE/rc453k7C8oOomymwot5Adop+Cef9Tfb7thm/NHi1
 CU9XgRjchxhalxTXpYJQd+gk+nh6Nzp76Hve+S/OQuMVInSlEZ76ReVNXCt10SjWT88G
 s2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794377102; x=1794981902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qF2EeNk9VqJ9/cd2mmxxCU1YhPyZgJdWd31R12OE3w0=;
 b=HhtCIy7JzTeOSBJ+YUljxxg2ML7O9yMvXOL+D4orKZR8OynmwTPaag8vNCjH+JX8Bl
 uVxwlSNA2/RqD2rAHWoJMAr69LjDsbRE6OFphcT+AvnivcJ+38+Qeakt65L70gh8BLuR
 4RSz7A957ct8DdRQ42nyp2IdqXXTQ+qET1ynaNdisBhw1QEk+75XP95be3SBs9Gd3JJY
 2eLX8vN/xXtpituxdooM2eyHYqlTGOyRQNpWPBGue86C7ojgi/fsPzDRqFIygJqNKxGi
 N+nVJa9obh5/KjufSoaDnUtuRjR4Cwy/0A6n9R4bQHXxYIUbr/8e9bLxzXSl0/VgX45c
 eFRA==
X-Gm-Message-State: APuU4Z/b5+3DIKcCO/Y3frR5HaR3nkW8h4bEPvViq2JnLOzz9b9FOU6y
 LJ3dqLUkHY4FgG4pVidvW5JiekXVDTcogRncZlUDvAxczyd39PAf+CM1Z9A4qMJj6/lNfUEkuTv
 H2KvHJIfXmddGImU4FEIjWfeU5cstJU/jxah+eoHfxkdG2KIBdfQ9JSdhSA==
X-Gm-Gg: AYBFou1nCipOVDzcejFg/Gt9YoLuDztVN22kBU3Uyp7dpeSaLpqAJbkQzWIgAbkqZVT
 0pukqLKwVvKZr8xMbXmQM13xLSaecUGtHdvbcMzKrEux0SmdFPVy79s0JQuyDR7uVHEqwAvTdRL
 OGbqUKKG3VKpoBrpAv4j/eJFQ5yPQOdK2BB42kR/AWd51FUDf+8mTIyC0SEtyU06jDLAVo/GLVJ
 Lz/rakIoqHga75CshI45B59shwcFH2aELL4CbY07FkpKpXWgfYUUdoILMKSe3XTlZyCU2n4bqZD
 ePXSLxacCRxA3xTzb/Deviw1XcnNNWjeSYn523zbUL4Bd/n7jx8X5D02TR2N4l800BhSxER5k79
 98B0ut1m4x+xZd9SXOge7O5sFK6xhva2lJcpk7yFPpTiYNDrtMzioPF3ffI8KT1Hdl20OEz0fhr
 wlbXAQD88DtRxDhF9etJgae6uMuRZDfamU2RNJCGaxs2jIwUU7f6Y3nOH+Mu1CfY7Ax+q5PCKOQ
 sWfoM8=
X-Received: by 2002:a05:6102:6218:20b0:7b4:f1cd:80dd with SMTP id
 ada2fe7eead31-7d4ede113d2mr459447137.1.1794377102203; 
 Tue, 10 Nov 2026 22:05:02 -0800 (PST)
X-Received: by 2002:a05:6102:6218:20b0:7b4:f1cd:80dd with SMTP id
 ada2fe7eead31-7d4ede113d2mr459395137.1.1794377101577; 
 Tue, 10 Nov 2026 22:05:01 -0800 (PST)
Received: from hu-slingapp-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b3b5b2ff3bsm15067990c88.11.2026.11.10.22.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 22:05:01 -0800 (PST)
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
Subject: [PATCH v15 07/10] riscv: add RPMI system suspend service
Date: Wed, 11 Nov 2026 11:33:59 +0530
Message-ID: <20261111060403.3777501-8-subrahmanya.lingappa@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111060403.3777501-1-subrahmanya.lingappa@oss.qualcomm.com>
References: <20261111060403.3777501-1-subrahmanya.lingappa@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyNCBTYWx0ZWRfX6wuqJx7m6qjz
 0GwoGUTAI3SIyI47y3q7ORCilwbT3aniJY+HfWF1+Xam6C3pnMKbzIKNAapHuPM+eDZfItQLEHB
 XGXV+YMC92qAjNQEBW7cNNik+TP6QWQ7903YpU5yzxhaBNACjCCIISaGhAT4j66NsRHRmGEW24u
 I+KU6uC4/e6i56zPKsRSwHycalJsvSNiI6CZuIwCw0kQrjmEdUG90F4RP0NFga4fZDF4gCSlWI1
 u5sZvVvjqAoEVtCofe5d0vGNXNlSy67u6lFKj7jlRanIFMlHLZKQjOEqTAwpYZuELl2fSdK9pqb
 1aisb8SbfJ6JqVj/94sBrE4nPkP9SCvlq2wFzXr3iC/ONqarQ9o/nPFXvZiv3TrOdES8Ns3FFpJ
 i4LWs1JQeLvGekY/dWZGoGr2ENdXcHgjLtf7olFxf6FUNVjUyNKNahFdzK/k0DcmXZfrKohkI5q
 b00rzhLyag0gS1waP3A==
X-Proofpoint-GUID: AJrLCUAGZr2dNPrUzjOk6jYZj1P7oyrT
X-Proofpoint-ORIG-GUID: AJrLCUAGZr2dNPrUzjOk6jYZj1P7oyrT
X-Authority-Analysis: v=2.4 cv=NK1AaE6g c=1 sm=1 tr=0 ts=6af4058f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Mh6PCMENURz3S0C0lcMA:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyNCBTYWx0ZWRfX6qg6loGQJnlS
 lDrI50EDc93TKKOzNQsGcQnhdFvPn2ms326injNd7VWh6N41bPPUX8Fj+Eu+w2fwoXc7xunVb11
 U9Kt7cUxpMOGqWbUItvEeeAW8sgEDPg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110024
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

The service advertises suspend-to-RAM support through librpmi, registers
QEMU wakeup support, and routes the finalize callback to the generic system
suspend path. Process only the accepted System Suspend event instead of
polling every RPMI service group from an unrelated doorbell request.

On wakeup, publish the suspend event under the BQL and defer the HSM hart
resume until vCPUs are ready to run. Cancel stale wakeup work during
teardown. Machine reset removes and recreates System Suspend around HSM
reconstruction so the service always references the current HSM object.

Reject malformed resume addresses before accepting suspend. Require the
target hart's configured instruction alignment and address width, and
verify that the resume PC is backed by RAM in the active system-memory map.

Validate the librpmi hart index and target CPU before accessing hart state.

Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
---
 hw/misc/meson.build           |   2 +
 hw/misc/riscv_rpmi.c          |  30 +++--
 hw/misc/riscv_rpmi_hsm.c      |  15 +++
 hw/misc/riscv_rpmi_internal.h |   8 +-
 hw/misc/riscv_rpmi_syssusp.c  | 210 ++++++++++++++++++++++++++++++++++
 hw/riscv/virt.c               |   5 +
 include/hw/misc/riscv_rpmi.h  |   9 ++
 7 files changed, 271 insertions(+), 8 deletions(-)
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
index 0000000000..0754f4b570
--- /dev/null
+++ b/hw/misc/riscv_rpmi_syssusp.c
@@ -0,0 +1,210 @@
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
+    CPUState *target_cpu;
+    RISCVCPU *cpu;
+    unsigned int alignment;
+    MemoryRegionSection section;
+
+    if (!s->hart_ids || hart_index >= s->hart_count) {
+        return RPMI_ERR_INVALID_PARAM;
+    }
+
+    target_cpu = cpu_by_arch_id(s->hart_ids[hart_index]);
+    if (!target_cpu) {
+        return RPMI_ERR_INVALID_PARAM;
+    }
+    cpu = RISCV_CPU(target_cpu);
+    alignment = ((cpu->env.misa_ext_mask & RVC) ||
+                 cpu->cfg.ext_zca) ? 2 : 4;
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

