Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11765C43602
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 18:06:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfiHD-0001L4-8q; Fri, 03 Jul 2026 14:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiHB-0001Kr-Ln
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:06:09 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfiH9-0002Ap-Lt
 for qemu-riscv@nongnu.org; Fri, 03 Jul 2026 14:06:09 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 663Hj2YM677126
 for <qemu-riscv@nongnu.org>; Fri, 3 Jul 2026 18:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lwpVwBDDDxbZlL85oChz1dGE8ep3DnXhx+lsrvnx0ss=; b=G2GFHcdfjcL9HKVo
 sJp1X61yewpXjeWUsPkNAAalRun/J/yG/RQPbC+8+l964/s3PAes636ONveLj+Py
 CyYM3mKccAIaDScMo0b/zDCRYb349E7oUi21a+BPljqQZmATIsSMicrKE8XzR4bh
 IYFzZu9Z4UcJQ9zTfpXSN8FXPS31RiN7s9vqcprHW3cxrGaTtCryU5weocT71X6Q
 o0IeNjDsJfRBh21wvSUoWABIL7CsPKOVn9aTZiANt/2SwaneEdeZ9n6b3OuS8/RS
 FDYEhwzt1A2aHtcTcEiRVRKGee8IlAqjtf5WRHm9Tivbz5JRloH5dIrsK4KcPXkG
 mo/vPA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6dkkh02a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 18:06:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8ee40bceb55so9270776d6.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Jul 2026 11:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783101965; x=1783706765; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lwpVwBDDDxbZlL85oChz1dGE8ep3DnXhx+lsrvnx0ss=;
 b=AXzxHU01u4GFETjIi6/rKjS1ABqV5QpTl7uybGAAYDxJ053WjNwgUgpS7FmsFp9UNk
 kgzFmePLvrKE8GgsfwwRR2IHZ4oAHKsS519JWQ3Sk4cFc7jfsKZUXMqlBAd2gfHenmSu
 weAXW/AZY1+4mRqxmRsjJz1LszSUBRBNPjn+QuaYj/79cTHWcDKV0KN1gYovpzDvlHCB
 AkZBfXa7haU+HcFqkcBrOMmIWC50tMJDmXfbvzi0Bk0g5CnDQ9yD+NO1wpujFQPQ6CDK
 1J35axlvYBg0KBFhRscm2DBkRj0OctuIatYHJl06/tMNNrrbmh+Nvbas/bMQ2n15eTOG
 Szbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783101965; x=1783706765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lwpVwBDDDxbZlL85oChz1dGE8ep3DnXhx+lsrvnx0ss=;
 b=ID64+c+mpe4KufwCvrw8xCzrb8xjMbk4ej/uCT8PwGRyEBM9HbeNyhXLVFl6A9W5oo
 INHNOl9/XBQfdqTcCmRxVZAreHLVx9luWpOO3aCPv5NjwlRYpbY/B6IhXTciSm3f5Zdg
 EGYQ1h7Hh5L/godn0OQACURtlkCkWsK7lYfE2J85i9RdtYzvsLBSbt6ptbU074GBASs7
 Q30BCY4glOI0+5Sk+iyO2IYIhgYKsoIZyp/6N2z6sBnVDYoG7WZUxdLXv6/6qAqccO4T
 Q0ptTwkx9rSBEcz+IQVnkO90wnByhQTr9mnUkXErNfjHC0rA5cut5m3OIh8PkpeTZrXQ
 kj4A==
X-Gm-Message-State: AOJu0YwvqIC/ZoVYKj9o75f9GL+syF1tHgIP1pYhk2uJoBmnsT9Ze1s7
 OKJU81awtxpdlgh21W9hYIut1Yki4Pfbzfa0zidU7sh/v8Fsl76rqrQg8jnT16Gbj9XXilwAbYS
 MNUPnX6bjgs2fToF1698tfnlaC73+ragGmWPGqkB+sBfBXZ8z/QeqDMO1SA==
X-Gm-Gg: AfdE7cm2VVvx4FdoZTvQSBZJlRAqKVq2Jo+NGJZXcrOvdoOmjVYI0jo1RikxffmOItg
 6OnPmlO0Mt33X9jNlQNtYyO18CeNJ42cIonJqRRndtQ4XJZc3eEdarBGXQCaGRVLs6JrgkYmUq0
 dGBInBl894rmaAZsJxCOVhLL1KysgkvsY6oU8KGPjmul6728ardX5qVdQsgLq57ENVsDasU2Y78
 P+ALZ1V1FHBkHuCRxqirWmva95r+oNJ/oljejFcUCetz0ZRZUjaztqqw2OgY9Z1s/MCOfKwEAXy
 AlNzGlAecbNhaE60R/AuJfbkRm7t7b9tNBr1o4fovM/hoHLAAeQnh5z3xMtLJhAVvvFx2j/2GlY
 FnupseRRfZEfbcvjoZKxz8wLVjYeUflG7DpeslOs0quXY5w==
X-Received: by 2002:ac8:7c49:0:b0:51c:1005:d096 with SMTP id
 d75a77b69052e-51c4c20a94amr10077171cf.24.1783101964592; 
 Fri, 03 Jul 2026 11:06:04 -0700 (PDT)
X-Received: by 2002:ac8:7c49:0:b0:51c:1005:d096 with SMTP id
 d75a77b69052e-51c4c20a94amr10076411cf.24.1783101963986; 
 Fri, 03 Jul 2026 11:06:03 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51c41d2d688sm22560081cf.17.2026.07.03.11.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 11:06:03 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 07/24] target/riscv: tidy up riscv_sysemu_ops
Date: Fri,  3 Jul 2026 15:05:19 -0300
Message-ID: <20260703180538.3346781-8-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
References: <20260703180538.3346781-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfXwZwHVNNuecvt
 M4XWo9Qk9teT4w8dH/3pd1iy14+O4tQYUCZGoOcOH1T2wikXfjAXth+R3C0aM/nmMTzU8PL3kjj
 GWqNsI82dABBaWzh5ERz0vjklGk0Ec7nrGUh+pkjlzSJw/M6q8ut4up4o1W0vKszvW/UNX+ONsk
 6xKN9d/UzFpoCOAwCSAHvCovXChNgXPaEurRSsX+YmuavEPoeg2pJnG+JKi2B4Wmf3oVpZX69Mw
 StkTcwvElC/MtXA2e4/AycQhFkqBr4lVpH8cnwc40F7jFyjKsLvH3cLds3sbrnrpm4AzyNdyG1X
 cNUkszOgAkivbjIqndxzGcFnEdsJ8qK2mO6wrXxZr3J5IkTtOC5XC3qVGdYlX0w6MZIpJ/+qT56
 hbRLhHEy+cXP2zFdsSMgmfmYEdWEeQdYR72bVkN1adWc6H7dLBXwvMuj/I/t10C5KjWFskvho/M
 VmEjUh2tASzHzq+odug==
X-Authority-Analysis: v=2.4 cv=LeUMLDfi c=1 sm=1 tr=0 ts=6a47fa0d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=QY3w21f5PuwKoA3dFekA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-ORIG-GUID: kmY5Z_6WcsDaJKeP69bEBWJ95ZNYJrFj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE4MSBTYWx0ZWRfX6CD5471sBCLd
 HDNhN3IOWB5RuT++YMMbAzZPJtzrzjy/YnDcPUS6DRkVzk0RnEuFp5QSIIxSUTxW4C2RtjfMZBT
 HCLT+rdU/kNfQaFlW5QZbhvAPzYnTVU=
X-Proofpoint-GUID: kmY5Z_6WcsDaJKeP69bEBWJ95ZNYJrFj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030181
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
in cpu.c.

Same goes for get_phys_addr_debug - it has a TCG only implementation and
KVM can't use it for now.  It would also need to be filtered out, but
since we're at it, let's convert it to the newer 'translate_for_debug'
API too.  Same restrictions apply.

Suggested-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/riscv/cpu.c            |  6 ++++--
 target/riscv/cpu.h            |  3 ++-
 target/riscv/monitor.c        |  2 ++
 target/riscv/tcg/cpu_helper.c | 14 ++++++++++----
 4 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cae4e96232..d17ba0474a 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2693,11 +2693,13 @@ static int64_t riscv_get_arch_id(CPUState *cs)
 
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
index ecf2913d42..18fbd4edb6 100644
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
index 2db07f5dfb..885b4172c0 100644
--- a/target/riscv/tcg/cpu_helper.c
+++ b/target/riscv/tcg/cpu_helper.c
@@ -1779,7 +1779,8 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
     env->two_stage_indirect_lookup = two_stage_indirect;
 }
 
-hwaddr riscv_cpu_get_phys_addr_debug(CPUState *cs, vaddr addr)
+bool riscv_cpu_translate_for_debug(CPUState *cs, vaddr addr,
+                                   TranslateForDebugResult *result)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     CPURISCVState *env = &cpu->env;
@@ -1789,17 +1790,22 @@ hwaddr riscv_cpu_get_phys_addr_debug(CPUState *cs, vaddr addr)
 
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


