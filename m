Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADABCDB47C
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 00:09:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcB8v-0007P5-Ik; Tue, 23 Jun 2026 20:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB8u-0007OZ-33
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:07:00 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB8r-0003BU-Va
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:06:59 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65NK0x9u1177943
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gxdHg8ThLg3IWBFqDHiyuv+moEUD77xWG/b/9Q74awg=; b=gvJGCQYWEk7YinOu
 D7LII4oTIboIyi4RJkX+133lQaw7jPUnw5Gut4eV2EmJ/ytfdsu8k0D+ckUoDGMc
 QROKT49p5/DjuPDAnau57GB6sxsJd7aoTSijrz57N/Z0G7/7rzHtiV3xkUtHiClL
 or0mzU/yV9HVt0tIUkC20gnm5NpWLbP0r9e86Vlu0ANZ3N1wbjHT7Vx/ktx3m84Y
 HJaLu48d8z9vjKJ0/xAJCSZD71qqTJMuWsG9+qUkQswG6Se8SPUsUKIUpmv5cZJg
 M340+cqg5ZPZE+r24gUDXm3kkN6zyMv2SdEyHSwWpvZTJP7knO5KVNMTLFSVXMCs
 qGviPw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe6bd8h-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:06:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8e3ae05d649so8743206d6.0
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 17:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782259616; x=1782864416; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gxdHg8ThLg3IWBFqDHiyuv+moEUD77xWG/b/9Q74awg=;
 b=IG1DrLJiBdT3xMlNYI0KX73tuZ3QVFnSP/j+qjoelyerK1EYJXxlBJMvHW5JDh0hPO
 vQ5YPEH1HUFgxeywC/QJV/E3kwJNXFIgnq66579/8oZlyZwA5aBCERdD/wWPtYpOlkxZ
 DWGV0htFDO9bSmu67Lun0fUOzzUcOqx/ZXAAkMDea94SC/z5q3Hn9CwXDnSdaWFdKC6c
 SKpJtV9e/cETgM3f4kuRBKlohFgqff1/EyytoPrTNxkEMgmp4dujPfFK5ljmkOEZoRFi
 9Q8d+EDTwN6YgxEnpe3mPcvb3a9EvhFeAq6ea7EXTnR8J7QC8NX/EX2A2kL0Y7XTmXdb
 VLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782259616; x=1782864416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gxdHg8ThLg3IWBFqDHiyuv+moEUD77xWG/b/9Q74awg=;
 b=c1dTQiHH8QaToH/4hPgcpu/XmnsTIGB4CUjbx8APDBJ74ZSaiLeiuuXAY8qIr4ZaJO
 BfptQD7sWpgW9QbSt8msLqMvd3ziMuwPVy4c9m5O7lONk/iKEjFgLxSiS8aKVpbXPZMv
 Rp4OjTousfLuX0cz+LiApwgKJHUA9pTqWazFIbOOXn6IYUxPS3cj+7nFkp6ZDqT9l+NZ
 KvoJYZAIqGtU5R2Z5lMgrGyzpsOFCpN9BwCXgyXKrNjD3MEEiLi1Wd8W+Oj0wbI7rKZM
 TF/vE1u9xNgkwnugLNiqSSaVJWzLv61CIlF2KY5cy1thndsv7Wf/7B9zyBNo73AOOt9O
 p8Og==
X-Gm-Message-State: AOJu0Yw2G0OEpFeJZ+A+DHiryghDvFafmbsf1FPm3QXWYY0M0qDMle0s
 nAA0Vw9kl5AyW4t3a2Bak02U+LFYbWrpRTjTZ7yfHO9iOnSKrOCyCks4WgXfgmClDtKnSs+6E8U
 5fUpZYxFTQ/1TLI9PGzzfg+WaJ1KuXLIc6W2jK4VI2ru4T9sA081WDYCrDg==
X-Gm-Gg: AfdE7cldcAVq8mUhbOFwNaLkj/5CXMhHfopMvLTHQjyjIG+0UDqT/SC5GbzwoX3REwO
 ewxSyILPExEA7EVKD7PlAvQKjL5pyAeHv2wz5SF/hNL3giBd5tMsbiRJk4Z0jrdg2qwfSIMDzlk
 +JrAfMBeROhTGbvqfQtCgYZ4EJu28qMNic+tDZ6J35FHMn5txdtLtu+tv8h1SuaJYedBz/2Z3Ur
 sG8HTktDA+rZL9KMuW615vfxyBCqLJaMdp1eyr5WNuAYl3v73s77dmDh0ZufRVC7cEKCOduMKym
 Y0QTRLLnqRH3cmgebG5MKbWlqz5IKxOimHytkhHihCznasuCAFSuBrIvhQnzDMTtQQUM8yXxsfc
 74OCw/xZkYozw+A2/OEmuW/O8nBdH2bKGYX+KrYlUacBf5A==
X-Received: by 2002:ad4:5bcf:0:b0:8ae:60c4:857 with SMTP id
 6a1803df08f44-8e4012ea890mr92170516d6.18.1782259616379; 
 Tue, 23 Jun 2026 17:06:56 -0700 (PDT)
X-Received: by 2002:ad4:5bcf:0:b0:8ae:60c4:857 with SMTP id
 6a1803df08f44-8e4012ea890mr92169726d6.18.1782259615800; 
 Tue, 23 Jun 2026 17:06:55 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8df81cdec56sm142422976d6.32.2026.06.23.17.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 17:06:54 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com,
 fritchleybohrer@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 05/24] target/riscv: tidy up riscv_sysemu_ops
Date: Tue, 23 Jun 2026 21:06:12 -0300
Message-ID: <20260624000632.2149359-6-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6Fms7snweGf0RbrCnZYh7UzMbfxWn4pP
X-Proofpoint-ORIG-GUID: 6Fms7snweGf0RbrCnZYh7UzMbfxWn4pP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfX4HLbZ12ByQ6t
 n39A8XosoBn5Hl6eDk+114/4CnbBRrMMalpoc1qUWVi3wDFaf8JG9LEbSnwupOGsLI/vQP5s4vH
 Snkl4XNL5ktE9Tbzz5foOX3sgcKTfN4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfX+A9QhBZfIU/A
 2f0wn5DQl9hz//ozE/hF/S6838pPHux8wKm351UpZGmfEKHaFq5Qo1i9XQyqZxyHIhC0P/ejr21
 ScESE2wkUR1DP2XdPPCNPMsx9XbUi3WU2EmuJ1+6hZbeEBpseYmTgxxgSbsGcztMz51AHDo/N/A
 GfMUu6yXG4okC0Fcms8iUfhwqIwt8YnGMyeR6V2os0mY2wvApDkmB4v/SXbtTbiIkAAPxygTFCX
 s0Etb7PVAHGSzBkaclPxTmpP5Umma+DJZ++jViqJssGQvgalTrUkS8VVR8sjsrA/rTSyQm2wke0
 HFHP+XmJuWLD2tNm2K+p/X+RdXKOYyeCgVKmRkU1t78oT74qCrihELLyvjAzua+xiUpk+dpGc4v
 vTA2KGatgLtoJ6Rbg2Sf4JL2+8dL9GZi9z8FHqp4R2rCbZvXv682M2CqiyxHYSUBtfLxkXkeF88
 hRgh+XVuy6pmK4+mCUA==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3b1fa0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=t0TUB-rRe_9fwXOx4ZEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_04,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230199
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

monitor_get_register at this moment has a TCG exclusive implementation
for RISC-V, even though the callback is supposed to be arch independent.
Until we address how KVM is going to implement it we need to filter it out
in cpu.c.v

Same goes for get_phys_addr_debug - it has a TCG only implementation and
KVM can't use it for now.  It would also need to be filtered out, but
since we're at it, let's convert it to the newer 'translate_for_debug'
API too.  Same restrictions apply.

Suggested-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/cpu.c            |  6 ++++--
 target/riscv/cpu.h            |  3 ++-
 target/riscv/monitor.c        |  2 ++
 target/riscv/tcg/cpu_helper.c | 14 ++++++++++----
 4 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4e96bbeb60..319825882a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2669,11 +2669,13 @@ static int64_t riscv_get_arch_id(CPUState *cs)
 
 static const struct SysemuCPUOps riscv_sysemu_ops = {
     .has_work = riscv_cpu_has_work,
-    .get_phys_addr_debug = riscv_cpu_get_phys_addr_debug,
     .write_elf64_note = riscv_cpu_write_elf64_note,
     .write_elf32_note = riscv_cpu_write_elf32_note,
-    .monitor_get_register = riscv_monitor_get_register_legacy,
     .legacy_vmsd = &vmstate_riscv_cpu,
+#ifdef CONFIG_TCG
+    .translate_for_debug = riscv_cpu_translate_for_debug,
+    .monitor_get_register = riscv_monitor_get_register_legacy,
+#endif
 };
 #endif
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f0c78c1474..70b8729bd7 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -665,7 +665,8 @@ void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                      MMUAccessType access_type,
                                      int mmu_idx, MemTxAttrs attrs,
                                      MemTxResult response, uintptr_t retaddr);
-hwaddr riscv_cpu_get_phys_addr_debug(CPUState *cpu, vaddr addr);
+bool riscv_cpu_translate_for_debug(CPUState *cs, vaddr addr,
+                                   TranslateForDebugResult *result);
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
 void riscv_cpu_swap_hypervisor_regs(CPURISCVState *env);
 int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts);
diff --git a/target/riscv/monitor.c b/target/riscv/monitor.c
index 3e89dcaf7c..7aacd1d89c 100644
--- a/target/riscv/monitor.c
+++ b/target/riscv/monitor.c
@@ -245,6 +245,7 @@ void hmp_info_mem(Monitor *mon, const QDict *qdict)
     mem_info_svxx(mon, env);
 }
 
+#ifdef CONFIG_TCG
 static bool reg_is_ulong_integer(CPURISCVState *env, const char *name,
                                  target_ulong *val, bool is_gprh)
 {
@@ -379,3 +380,4 @@ int riscv_monitor_get_register_legacy(CPUState *cs, const char *name,
 
     return -EINVAL;
 }
+#endif
diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
index 59edcdd370..a893472c4e 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -1771,7 +1771,8 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
     env->two_stage_indirect_lookup = two_stage_indirect;
 }
 
-hwaddr riscv_cpu_get_phys_addr_debug(CPUState *cs, vaddr addr)
+bool riscv_cpu_translate_for_debug(CPUState *cs, vaddr addr,
+                                   TranslateForDebugResult *result)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
@@ -1781,17 +1782,22 @@ hwaddr riscv_cpu_get_phys_addr_debug(CPUState *cs, vaddr addr)
 
     if (get_physical_address(env, &phys_addr, &prot, addr, NULL, 0, mmu_idx,
                              true, env->virt_enabled, true, false)) {
-        return -1;
+        return false;
     }
 
     if (env->virt_enabled) {
         if (get_physical_address(env, &phys_addr, &prot, phys_addr, NULL,
                                  0, MMUIdx_U, false, true, true, false)) {
-            return -1;
+            return false;
         }
     }
 
-    return phys_addr;
+    *result = (TranslateForDebugResult) {
+        .physaddr = phys_addr,
+        .lg_page_size = TARGET_PAGE_BITS,
+        .attrs.debug = 1,
+    };
+    return true;
 }
 
 void riscv_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
-- 
2.43.0


