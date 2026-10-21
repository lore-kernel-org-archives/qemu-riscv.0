Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689D260A381E
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 03:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A56libe7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GRiL7KkF
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJMoA-00043E-Sl; Tue, 20 Oct 2026 23:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMno-0003Dh-5N
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:15:47 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMnd-0002fi-Ov
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:15:42 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2EtDJ299870
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Cf9Hw2+gVq1VRQ9Z2X/nBW/OhfF9R6c39gpwv9fH/lo=; b=A56libe77Orql3Aw
 mwpY/ja7kudyvJtBurNMlkACiERG9wd5CksHScDNFcsbCl+Ho988SHV0/jIgiF2N
 96KgN7dmmqWgfyMDZ6lEcexOVkYmScgeatrzwriZ1GzUAYEgcrV8YW2oGpI7+d23
 NIvfcVIOUl38KjZp18eDprrS9l8wszaML849B4/xeld6VczHSccZ6yfAeR9SlyKj
 nGLZqz4J4yy6yfcM//YnE+7EsddAHcnmkDqRIb0N8IpNRY8ASz1xFCuhbQX3OlR/
 VkBUkwKKsBnEhJCAMPmf++gDmKCGUq5Uf2psmUFGEDi6+zWgNS/ih+7zOutYmoJG
 M/BS6A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4sptx-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:15:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5339739b343so6290961cf.2
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 20:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552513; x=1793157313; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Cf9Hw2+gVq1VRQ9Z2X/nBW/OhfF9R6c39gpwv9fH/lo=;
 b=GRiL7KkFDepcPvpTNyQFpIN8wGyBcV/lrF9eCFVu+3iMXz32jJ00Z7bl7w4AfksioX
 9KqfU8Twgo6wEXwFAO5xuGcgyLE4RkklDTbll5W+V7mAsRudxTRXVC5xlB97S9gakJj+
 kVD+gtvRmDWaO+DD3wTV8aGwKi8JwzXNJf+r35UDiJe5gatSb65X8I3D+DGM5z6pcx3Q
 H/PbYoRgmua+DTZtVcUV/0XKSAIvKAWEZojFQRa1gaXQptoEhk/mEzuM0JgWSxB9UIOH
 55gR7c7LZenkozY/KxFaBkxKLRjsJvHDSOAPifMvkeQnxbmVrlAJ+GHtWcMTbCj5nQwF
 LhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552513; x=1793157313;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Cf9Hw2+gVq1VRQ9Z2X/nBW/OhfF9R6c39gpwv9fH/lo=;
 b=xKiW/wZebCK/9/9NcF3OzCf5KDrmvwBs+40bAL1SkPe2Q3LEfBFbDWmpvj19PfaSyq
 VRSMTfX8nZwX1wq3tZ1rghPlGUb2i31tZfAFLlJFxSJQO3A7AG6XPLA/Pnd4TmBUFFVr
 9OSwGCVRTHtQU+2P1ExcyDSxxO52U5jdkb6+dTRm/x/GcJ5k9lX/hVGOFyNk9sMnCJIb
 c1GghIbmtpJrk/+9grLoBxcwxRn8NBl+qZQ4KdMumqy7mlSGzmL9a81omgQh1reRaEAV
 Ewy+Kt2jr6n81O5BYCs+EbxhQbkZe472KQQFRqlohd5KiexJKPpdw9yR1fLq7n+l63cI
 ivHg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxztqWXZ93sj5PO5cl9kkVSUOZdfV37zI2owri8pkki0cyNJDyzyWZtDfHCE3P/V8HwZ3EsFwwyq2tg@nongnu.org
X-Gm-Message-State: AFq9FYL0XfiYtcGvdDL4ceXDIvtb3JgP19Njj3jox5lyIRWXennR3KBB
 ooqiHAuWC6Az/dbIh5ARcykK8TN8cZg5Eme7KPr5kiB7eA7ovYTCpnm8kvarmMTWWhUL0yghKn3
 dY4yEXDSMTwuT+tmsXOucaIGKR5aW0t+1fhzask69Sl8NLe8viWc8xwphow==
X-Gm-Gg: AYBFou2Y1BWRryjjp4XAczWZIE+T7roIEgN9Wj9VCknOh5Y4JHfPmWuajHtxbCAtST2
 VMN5JigQ9s+B9c0geXY2zOAlsPBjREaCZf3lsPPkyu3Bs0szisQAdW0I/B9yGAnVUGI/0OaD2df
 sP+Y6rRMmlTlQrat5HQ7frNb/oLpKUnBvL4R9Mx0sX8mmuJuTo8cZuAkPou3FztgNaYw7/YM2kV
 WJ0syTkrzOIfCPnHtLkFuibXbefZSwM3N0up2TP7J0pfrKMg/vJwd4Dgs7Ed2BVzjvWcfYDEHYK
 Ks8M9q67o9kzXwsvkBjo6B5PUy8OHswgcjiQZ3zNe4/K86qRTMJoqqf/CZcyb5VtL3HgbYobrrl
 CpG9ikb9MzMiZiOE8sLlnl/SzgrvSRiy5A4J6PU7V
X-Received: by 2002:a05:620a:6087:b0:93f:567b:6157 with SMTP id
 af79cd13be357-93f57f63035mr220285585a.46.1792552513513; 
 Tue, 20 Oct 2026 20:15:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6087:b0:93f:567b:6157 with SMTP id
 af79cd13be357-93f57f63035mr220283985a.46.1792552513088; 
 Tue, 20 Oct 2026 20:15:13 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e258358c1sm2461142f8f.43.2026.10.20.20.15.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:15:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 08/33] target/hexagon: Register CPUClass::exception_name()
 handler
Date: Wed, 21 Oct 2026 05:13:41 +0200
Message-ID: <20261021031407.24862-9-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: cdIwtNQD7n03bUQ8MRgVtl3yJOnvfBVY
X-Proofpoint-GUID: cdIwtNQD7n03bUQ8MRgVtl3yJOnvfBVY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX9ifBqhxt8DB5
 cIxK9du1gELXbyL9uWjA4Y+CQLqzqymFf6/6NGZYwsPcj2OhNx7Il+S9Da+wyow6IYsbS2vpeHr
 IMxN8k8tzQEISY4iw+zCBp4IIlYlbfQ=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad82e43 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=L0AECS4D--PbZBcdiJkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfXw9KlfvINcWxw
 A3Y/aXhynNfZHQacElUatEQ7pLeMaXKQCwcMkR7OCsxiWs4OOdyreodYcLV6rkPFo8QjI1UziVE
 Sjb0DG/XXx7cCx9yvthyz8ED6BY+13uBK9BpWUSB4jTi2t0Rb4FzbO8KkwyYO9gqiAS/Dpx7RH9
 uOVjQmObtZ5s7BaVIIxzx0ZjXICJTWk7/HPKhayeiDT38YHr44Xukco8iNeZouVcD1ppI6Shb6f
 6DwVqS4fY6qIQPkRr7LbGttv/jb3ZiElrGdrESf/EXuFgfmvd3w0L7w89kXTp40RZlvsdmCpNCl
 Drns7LP5xAS9w+G2d1vePC13n7Fjpq2dlAy1x3y+jY/EfUS3VPIrCONfLj8LjZuOjyQ9sAlBiQQ
 ypmCNBcY2DCm2X13ivtdlO+rH82pdi3bDKStk+UjnwdBOaGliyMjXrMl9s3EmXsT7wh1IzqJdVQ
 QEMXkv5vZSG8N/VPfdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210012
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Expose the hexagon event_name[] array via a hexagon_event_name()
helper and register it as the CPUClass::exception_name() handler,
so the common exception logging can resolve Hexagon exception
codes to names.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>
---
 target/hexagon/cpu_bits.h |  2 ++
 target/hexagon/cpu.c      | 34 ++++++++++++++++++++++++++++++++++
 target/hexagon/hexswi.c   | 30 +-----------------------------
 3 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/target/hexagon/cpu_bits.h b/target/hexagon/cpu_bits.h
index a8fba4aa188..7d1bdfcbc71 100644
--- a/target/hexagon/cpu_bits.h
+++ b/target/hexagon/cpu_bits.h
@@ -61,6 +61,8 @@ enum hex_event {
     HEX_EVENT_INTF = 0x1f,
 };
 
+const char *hexagon_event_name(int event);
+
 enum hex_cause {
     HEX_CAUSE_NONE = -1,
     HEX_CAUSE_RESET = 0x000,
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index f20d6de6f63..962f00bc36c 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -318,6 +318,39 @@ void hexagon_debug(CPUHexagonState *env)
     hexagon_dump(env, stdout, CPU_DUMP_FPU);
 }
 
+const char *hexagon_event_name(int event)
+{
+    static const char *event_name[] = {
+        [HEX_EVENT_RESET] = "HEX_EVENT_RESET",
+        [HEX_EVENT_IMPRECISE] = "HEX_EVENT_IMPRECISE",
+        [HEX_EVENT_PRECISE] = "HEX_EVENT_PRECISE",
+        [HEX_EVENT_TLB_MISS_X] = "HEX_EVENT_TLB_MISS_X",
+        [HEX_EVENT_TLB_MISS_RW] = "HEX_EVENT_TLB_MISS_RW",
+        [HEX_EVENT_TRAP0] = "HEX_EVENT_TRAP0",
+        [HEX_EVENT_TRAP1] = "HEX_EVENT_TRAP1",
+        [HEX_EVENT_FPTRAP] = "HEX_EVENT_FPTRAP",
+        [HEX_EVENT_DEBUG] = "HEX_EVENT_DEBUG",
+        [HEX_EVENT_INT0] = "HEX_EVENT_INT0",
+        [HEX_EVENT_INT1] = "HEX_EVENT_INT1",
+        [HEX_EVENT_INT2] = "HEX_EVENT_INT2",
+        [HEX_EVENT_INT3] = "HEX_EVENT_INT3",
+        [HEX_EVENT_INT4] = "HEX_EVENT_INT4",
+        [HEX_EVENT_INT5] = "HEX_EVENT_INT5",
+        [HEX_EVENT_INT6] = "HEX_EVENT_INT6",
+        [HEX_EVENT_INT7] = "HEX_EVENT_INT7",
+        [HEX_EVENT_INT8] = "HEX_EVENT_INT8",
+        [HEX_EVENT_INT9] = "HEX_EVENT_INT9",
+        [HEX_EVENT_INTA] = "HEX_EVENT_INTA",
+        [HEX_EVENT_INTB] = "HEX_EVENT_INTB",
+        [HEX_EVENT_INTC] = "HEX_EVENT_INTC",
+        [HEX_EVENT_INTD] = "HEX_EVENT_INTD",
+        [HEX_EVENT_INTE] = "HEX_EVENT_INTE",
+        [HEX_EVENT_INTF] = "HEX_EVENT_INTF",
+    };
+
+    return ARRAY_ELEM_OR_NULL(event_name, event) ?: "unknown";
+}
+
 static void hexagon_cpu_set_pc(CPUState *cs, vaddr value)
 {
     cpu_env(cs)->gpr[HEX_REG_PC] = value;
@@ -841,6 +874,7 @@ static void hexagon_cpu_class_init(ObjectClass *c, const void *data)
                                        &mcc->parent_phases);
 
     cc->class_by_name = hexagon_cpu_class_by_name;
+    cc->exception_name = hexagon_event_name;
     cc->dump_state = hexagon_dump_state;
     cc->set_pc = hexagon_cpu_set_pc;
     cc->get_pc = hexagon_cpu_get_pc;
diff --git a/target/hexagon/hexswi.c b/target/hexagon/hexswi.c
index e7362b56650..19439658392 100644
--- a/target/hexagon/hexswi.c
+++ b/target/hexagon/hexswi.c
@@ -735,34 +735,6 @@ static void set_addresses(CPUHexagonState *env, uint32_t pc_offset,
     env->gpr[HEX_REG_PC] = evb | (exception_index << 2);
 }
 
-static const char *event_name[] = {
-    [HEX_EVENT_RESET] = "HEX_EVENT_RESET",
-    [HEX_EVENT_IMPRECISE] = "HEX_EVENT_IMPRECISE",
-    [HEX_EVENT_PRECISE] = "HEX_EVENT_PRECISE",
-    [HEX_EVENT_TLB_MISS_X] = "HEX_EVENT_TLB_MISS_X",
-    [HEX_EVENT_TLB_MISS_RW] = "HEX_EVENT_TLB_MISS_RW",
-    [HEX_EVENT_TRAP0] = "HEX_EVENT_TRAP0",
-    [HEX_EVENT_TRAP1] = "HEX_EVENT_TRAP1",
-    [HEX_EVENT_FPTRAP] = "HEX_EVENT_FPTRAP",
-    [HEX_EVENT_DEBUG] = "HEX_EVENT_DEBUG",
-    [HEX_EVENT_INT0] = "HEX_EVENT_INT0",
-    [HEX_EVENT_INT1] = "HEX_EVENT_INT1",
-    [HEX_EVENT_INT2] = "HEX_EVENT_INT2",
-    [HEX_EVENT_INT3] = "HEX_EVENT_INT3",
-    [HEX_EVENT_INT4] = "HEX_EVENT_INT4",
-    [HEX_EVENT_INT5] = "HEX_EVENT_INT5",
-    [HEX_EVENT_INT6] = "HEX_EVENT_INT6",
-    [HEX_EVENT_INT7] = "HEX_EVENT_INT7",
-    [HEX_EVENT_INT8] = "HEX_EVENT_INT8",
-    [HEX_EVENT_INT9] = "HEX_EVENT_INT9",
-    [HEX_EVENT_INTA] = "HEX_EVENT_INTA",
-    [HEX_EVENT_INTB] = "HEX_EVENT_INTB",
-    [HEX_EVENT_INTC] = "HEX_EVENT_INTC",
-    [HEX_EVENT_INTD] = "HEX_EVENT_INTD",
-    [HEX_EVENT_INTE] = "HEX_EVENT_INTE",
-    [HEX_EVENT_INTF] = "HEX_EVENT_INTF"
-};
-
 void hexagon_cpu_do_interrupt(CPUState *cs)
 
 {
@@ -775,7 +747,7 @@ void hexagon_cpu_do_interrupt(CPUState *cs)
     qemu_log_mask(CPU_LOG_INT,
                   "\t%s: event 0x%02x:%s, cause 0x%" PRIx32 "(%" PRIu32 ")\n",
                   __func__, (unsigned)cs->exception_index,
-                  event_name[cs->exception_index], env->cause_code,
+                  hexagon_event_name(cs->exception_index), env->cause_code,
                   env->cause_code);
 
     env->llsc_addr = ~0;
-- 
2.55.0


