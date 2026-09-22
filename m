Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C49C98302
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 16:55:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x93kT-000846-DX; Tue, 22 Sep 2026 12:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93hx-0004RJ-PK
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 12:51:11 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x93hv-0002ZQ-VZ
 for qemu-riscv@nongnu.org; Tue, 22 Sep 2026 12:51:05 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68MEixTU3924421
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 16:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TmpLRtcALdGvnoiA64jtGQ7kzwpnFEecY1PS7YhgtmQ=; b=cOF5E3ijO9WQ4RVq
 1kWMO1hQDpt9X5D53SrLpfzR5pBS+Fupgn2MxGjcVa2DRfcr4bOUo/JIaVakaWDg
 QQLxweSl/KIOO6XO8OTew/iBA/yZdMXJwwvspSfZsj9ntDvRPDMQfRXaGBFX25PD
 D4QPfMscBarXx53DaYnBqSKOA8gdgxM6EKmR2k3vU7ipnBllaAXYdygJM9sp562U
 TPwWy+4hqCwZ5an8leAebwvM5WwdyaMTLSl63rH+Ev9NvZU5NvbyA6F6fiClm/N4
 paWR/unWVWS+DXMOkTWzV7VlWwxRktNntos1riDnhMm0QgEM+POraMgKgynjHPsm
 vkKY6g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec0rst-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 16:51:02 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id
 a1e0cc1a2514c-97cb8d1b032so18312241.0
 for <qemu-riscv@nongnu.org>; Tue, 22 Sep 2026 09:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790095862; x=1790700662; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=TmpLRtcALdGvnoiA64jtGQ7kzwpnFEecY1PS7YhgtmQ=;
 b=YUdYLscLtwr/cs7a7C1MbpRD85p4UldrdqacTFM3i7i2oD8swhjLq1VSmhIburAEM5
 BvNkqhLU0dpHLyaIjYSqCQw+B3/9tsI8avhsgswLbNKRbHsdFBv/VCfI4iK9F2dsCqo/
 lHr5a5K1FOuZP7rtkuoXP7I7XyGMcy3UpnNDM3lF0DvEi1zGGXKkOARK504CNOGsXHDV
 7k/FtZWj3WqEFfXOG9NDCKl7QC2Wg5U+3YjYfxlfc9vkkgSmiJaFszovPmZV11ijVDJD
 4DRyXIfVIE32vvUcSzQF4cECn4lUYJIdpAxo5K9brH7TAUhcbV2L9uTdyRMRFZbLxFy8
 ypZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790095862; x=1790700662;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=TmpLRtcALdGvnoiA64jtGQ7kzwpnFEecY1PS7YhgtmQ=;
 b=QZzKu8bSNFGbwwaosZSu7W9EhJgzqzqMjhwVA6r7pMUW+3hgAWPdCiwUSdsskbd5JB
 1lQ8RWyfv7DaLXReHIoDDZFZAFlqTZKr94cmvd+DWy8F/uXpe39RvL3M/8o47m2W3Fuo
 E/goRkyZA6jyAx3g4GmjXVS+1dQq20jC5wvuFuCe8Ale815VxkEjN/WwnOOwyLWfEyXD
 gHqQkBY4wBJ3As9wX0+YdlrlNOYUnqQONuTlkrrOrjzifCIfgTvc1PtplDEzecaeyI0j
 Mr3e4RoFjAYsKwWccxxiur8WXk7mM6S9hnfKrH/0GJGcEVwfwnNrO7mnPcFgP3rSh2aH
 D3eQ==
X-Gm-Message-State: AFuF++mL88adloYu1uTc0PDzPDnT3J9lwagAHvCHVuLdjW2FOfSRQo2e
 M8ES4oTZL1XjFh8HQJ3FFtV/wuxfekNkDCACELX3W8BnFWo5ZsA4VztFrmWqI4diQig8vqPOD1k
 5V60dGkqvE4tRo6y04jP1oc9x3u2jgDehasvkuptFn3SuGGYpaQ3LDLKGoA==
X-Gm-Gg: AYBFou0dnKzTHm0InQPjv+swRP9STlQsaWgowtFEcIlvaNIDKSBslussWX40l6WbD+f
 ALGW9So2O4DTw81Y5VqACFqO8bQeA+UdeqRvtUWJyzavIZWEXzxtUtOjeDn3dJXeMfANlb2fcPY
 IVJD1nM3o0CrIh7Z6e0UG9dkv8ZBBnGx6dmZ/wt1Bjo3bme4bFT8rsN+AqZ8tI4tIjpt7RDz9xt
 LkTek/2ZFuqo5C9/E9RMxFpJhgxbbdl58s/90yIgE3D0dH9qWnvfVAgNOuMewg6ba+9tUqPbpAK
 /VcKurDAJqTgbTp9zI3JbrZicQK9Dd3uKFySjF3fQU/vByvzNlf4wxStc6RLsb7dAr3I9MzFrSa
 cyJOQcAKshqT9LZDCkxbOne/ZeNcPlMig8CkYddXR
X-Received: by 2002:a05:6102:6a85:b0:7a7:fbfb:aa03 with SMTP id
 ada2fe7eead31-7a7fbfbaa9amr6088055137.21.1790095861178; 
 Tue, 22 Sep 2026 09:51:01 -0700 (PDT)
X-Received: by 2002:a05:6102:6a85:b0:7a7:fbfb:aa03 with SMTP id
 ada2fe7eead31-7a7fbfbaa9amr6087990137.21.1790095860642; 
 Tue, 22 Sep 2026 09:51:00 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fde1a3b46sm3415365e9.11.2026.09.22.09.50.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Sep 2026 09:50:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2 11/17] accel/tcg: Introduce poll_during_halt() and
 leaving_halt()
Date: Tue, 22 Sep 2026 18:49:29 +0200
Message-ID: <20260922164936.15189-12-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922164936.15189-1-philmd@oss.qualcomm.com>
References: <20260922164936.15189-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfX+UDZPJJ81mRi
 JcuxLsDs6dFP6/bVPpIqnkIq+7mksb00JsOzMytSR8nCdhN+ZMB/NjcOX4/CSGy49yxKTTFCnOD
 NLgt58v1+p7ttCF+W4LmaFf/Cx9dqrsERMH3AlqlstpVL2tn7DdJOsSm3QznSMxcu19lcTiBULO
 WUGg1sfuakCxj7VdX3R1fAcYPIruKEH6dhToj0e6vYPxq3dK/3g72eB0cgfpQtq4h7Azjzdi36y
 s2pqRHMaqBUzh+6DfmHMiszlytLERDYhI3FF7HolcvmSfFHCM62j7tiO4qGpNZKt4/gtFp9FML2
 1n1bG+N+a/XwF51KVgfeVCgkaTJjJ2K8/NlkeNa95gGBdW/RnZKdyDJ3L2gRZ+xaO6C6pRicSpG
 U5ADtbHB41CN7oij/4nFGSrWoUHRMOTdwtnkJXUWTNx5HLonGZ7ZCTFHui6CzE4F7ke60N6lonB
 myoKZVvEE+RCsaTsBqg==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab2b1f6 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=DbqnPDNGgojIjNu1nyEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 9h5Wk8eKKGJQnMS7eQ3yjQLgw7v-2QEa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfX3us7JtWgcwC9
 laW8PYaIw32nP1rpAC3Y3+EHm1LeVfKn5/U+icBz7NnntG6TR0URPGcc9v8z0ygvv29kOydvTfy
 +XsNaErB8kAVAFfvcZdeOZVLRfz41HQ=
X-Proofpoint-ORIG-GUID: 9h5Wk8eKKGJQnMS7eQ3yjQLgw7v-2QEa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220246
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Split target-specific halt handling into an optional
poll_during_halt() callback before cpu_has_work() and a
leaving_halt() callback after work is found.

Keep cpu_exec_halt() as a legacy alternative for targets
that have not migrated. Require each target to provide either
cpu_exec_halt() or leaving_halt(), but not both.

Inspired-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/accel/tcg/cpu-ops.h | 24 +++++++++++++++++++++++-
 accel/tcg/cpu-exec.c        | 21 +++++++++++++++++----
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/include/accel/tcg/cpu-ops.h b/include/accel/tcg/cpu-ops.h
index 3ff6e6810e0..1ee5d3d8bdb 100644
--- a/include/accel/tcg/cpu-ops.h
+++ b/include/accel/tcg/cpu-ops.h
@@ -169,6 +169,27 @@ struct TCGCPUOps {
      */
     vaddr (*untagged_addr)(CPUState *cs, vaddr addr);
 #else
+    /**
+     * @poll_during_halt: Poll target-specific events while the CPU is halted.
+     * @cpu: vCPU context
+     *
+     * Called when the CPU is halted to handle target-specific asynchronous
+     * event processing before instruction execution begins.
+     * The caller does not hold the BQL.
+     */
+    void (*poll_during_halt)(CPUState *cpu);
+    /**
+     * @leaving_halt: Perform target-specific cleanup before resuming
+     *                execution.
+     * @cpu: vCPU context
+     *
+     * Called after a halted CPU has detected pending work and is about to
+     * resume execution from the halted state. This callback performs any
+     * necessary target-specific state transitions or synchronization before
+     * instruction execution resumes. The caller does not hold the BQL.
+     * Either this callback or @cpu_exec_halt must be provided (but not both).
+     */
+    void (*leaving_halt)(CPUState *cpu);
     /** @do_interrupt: Callback for interrupt handling.  */
     void (*do_interrupt)(CPUState *cpu);
     /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
@@ -185,7 +206,8 @@ struct TCGCPUOps {
      * if it should remain in the halted state. (This should generally
      * be the same value that cpu_has_work() would return.)
      *
-     * This method must be provided. If the target does not need to
+     * Either @leaving_halt or this method must be provided, but not both.
+     * If the target does not need to
      * do anything special for halt, the same function used for its
      * SysemuCPUOps::has_work method can be used here, as they have the
      * same function signature.
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 76182803592..edb719b0d10 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -48,6 +48,7 @@
 #include "internal-common.h"
 #if !defined(CONFIG_USER_ONLY)
 #include "accel/tcg/iommu.h"
+#include "hw/core/sysemu-cpu-ops.h"
 #endif
 
 /* -icount align implementation. */
@@ -657,10 +658,22 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
 static bool cpu_poll_while_halted(CPUState *cpu)
 {
     const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
-    bool leave_halt = tcg_ops->cpu_exec_halt(cpu);
 
-    if (!leave_halt) {
-        return false;
+    if (tcg_ops->leaving_halt) {
+        assert(!tcg_ops->cpu_exec_halt);
+        if (tcg_ops->poll_during_halt) {
+            tcg_ops->poll_during_halt(cpu);
+        }
+        if (!cpu_has_work(cpu)) {
+            return false;
+        }
+        tcg_ops->leaving_halt(cpu);
+    } else {
+        assert(!tcg_ops->poll_during_halt);
+        assert(cpu->cc->sysemu_ops->has_work == tcg_ops->cpu_exec_halt);
+        if (!tcg_ops->cpu_exec_halt(cpu)) {
+            return false;
+        }
     }
 
     cpu->halted = 0; /* allow execution */
@@ -1059,7 +1072,7 @@ bool tcg_exec_realizefn(CPUState *cpu, Error **errp)
         /* Check mandatory TCGCPUOps handlers */
         const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
 #ifndef CONFIG_USER_ONLY
-        assert(tcg_ops->cpu_exec_halt);
+        assert(tcg_ops->cpu_exec_halt || tcg_ops->leaving_halt);
         assert(tcg_ops->cpu_exec_interrupt);
         assert(tcg_ops->cpu_exec_reset);
         assert(tcg_ops->pointer_wrap);
-- 
2.53.0


