Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0090C43458
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:53:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfHpx-0002Wt-Bs; Thu, 02 Jul 2026 09:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHpv-0002QS-BG
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:15 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHps-000879-CL
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:14 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 662DcfOi564799
 for <qemu-riscv@nongnu.org>; Thu, 2 Jul 2026 13:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9lGD5GeHecb2OOSvUk0owk6VDTYeqc3BhhTyXlyS+eU=; b=Jxd7PI7AwguO/bAF
 QezDu0PFjcGpElkG/jHqMd58sFuc5GP1KSMOmrc3mnSP5/ZvHDjnTyb3B7ln9CO5
 jHdQLy4yBT82gsM4PLx7dzEgR7jBQZu6ll8A136UYTG/WapBws/JduHqSo2rW40e
 vGQadOo4Tg3e9u+hgq9LSYEnw5zXcBYjFsR1E+LReyeTDJObdQMSdQoSCV7g3spX
 /KlxvFKxx7ABEqxtTC29HLMZPjt6zCU2sEfsHkDRQmtgcvtqbRO09v/yaICyqs9I
 nsobq4iJbEZfh2CLkSFEOuBPwAKpv9+x/ceJIN01kelZhvuw6Axo7n7PRg7X9BP6
 iCDBzw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s2501v7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 13:52:01 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-738ffe90415so456672137.3
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 06:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783000320; x=1783605120; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9lGD5GeHecb2OOSvUk0owk6VDTYeqc3BhhTyXlyS+eU=;
 b=bSMTooK7iSHoB8bhOWl+/keTp+QRyeNqZUfL01crExo8d4JuLaFWC6mybh0st0h6t6
 9zk8GTeOLSFKu5XQkTyYRh0v72tlNdSpiM8/B+tT8wk2SMLe7ZdjjuErdbcULOby4mzE
 DWaGIz4KTKDcBLvRzJcaCLCsw+MMH6roOmLyxsaROl2Xe1kNjIkdA0MYx7XRdr1t8hT4
 b7VJiiZHjHBnJs8cAow4a5horhSxiRNDkvFnlsVJ33w3p101sZQDnwYk8+m+7hEBjUCq
 6/h/Tm4dIFKipHBgJv2pZmTRtPEWnQgjWv3J7HTffEI17Dj8+NCJfreXaI/oaxpbvNS9
 g60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783000320; x=1783605120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9lGD5GeHecb2OOSvUk0owk6VDTYeqc3BhhTyXlyS+eU=;
 b=RU+egipydzpgB1sGcj9Fj7Lp6Xh2/G4uCMBkdwN/1U0PXp39TrZSRIRR7QYFeHayEM
 KSU+U2rvDROu6P7o654S9BlbabUW19ZV3k1QM7uLj6EiLfbmYGoe6qT8CG6iLgFwkZsr
 HBmej4HNfIZWt2Q+DV53CB7Tg32pckUkD3x62YBzUzYInmJLogaxfdTXGVAksYDCKpN7
 Z/Waz2cWP+922U1t4fkwpRWIrhzoIsOxFwX72+H41xL+Hfq0v824tO2r+PaG4WadVhAy
 LdtSBGIPeY8UpJpxwk0kaljhcsnnd5mfrrnd+gVjxFEXw5j9ta1S/S2X8WESMWl1LxQs
 ByHg==
X-Gm-Message-State: AOJu0YwFcAtxLu637F9pHdXk/JwRFt4cEYXRYlo8nBX5ByuiWmFvLGQI
 zckh0ptsACBv9q7fNbvwoDSNa/gSITCVE4c77fM5LxVi9DWOwxRDiqtltot4OVy2GE5ZUWN9tmI
 WiYpoJV0pkwHiZmgcNef9FLe63LT8nNOp6u4PwkHC5POTbMEjYL2JiV5BCg==
X-Gm-Gg: AfdE7cnQ6+FD4v9B2J7rxh4T3elnwwuKkLDsP+dt/ANMiYdII4DecN3/S6CYbTp7h4Q
 i7v0PDj7rCmmV4dsCbF1Qya7niAqhGIa6evvt0u+fXQkicClXoPbPO+bItmmaD4rmKqL4p8FSQt
 afeT1uUQD0hipth0uUPgWien0xrqnmOtlGhzo0GAA9wc7sb1zyRPdHWVhDh/s+wqR9FNJTtM7sR
 KUcn3UT0ECvMxf4MQRU3GpBKy//4R5szY6HhRHMHZQpF9zi+0REx6PunTLjbkgVhk0fnyihCFRJ
 hGQDHJHLw5+SKScHaQG69lUvErSXdMcsLqeaKaHTnd0sAY35iwkCJcHwot9M/vZGroChF4AE++D
 njxD0h0/srJWUHaxwOMfJYVR42/AbPWpnjgdNtkVmOXAIEg==
X-Received: by 2002:a05:6102:374d:b0:73a:128b:ea07 with SMTP id
 ada2fe7eead31-73dab0e668bmr2476551137.14.1783000320363; 
 Thu, 02 Jul 2026 06:52:00 -0700 (PDT)
X-Received: by 2002:a05:6102:374d:b0:73a:128b:ea07 with SMTP id
 ada2fe7eead31-73dab0e668bmr2476540137.14.1783000319881; 
 Thu, 02 Jul 2026 06:51:59 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-73e1c4e64a3sm1276462137.9.2026.07.02.06.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 06:51:59 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 10/24] target/riscv: move custom_csrs logic to tcg-cpu.c
Date: Thu,  2 Jul 2026 10:51:12 -0300
Message-ID: <20260702135128.1188021-11-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a466d01 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JF9118EUAAAA:8 a=pNhwjiGmTFK0dS8zIOEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-ORIG-GUID: c_GTNOMGXYdPfnS-9CF-QKjjH4piyT1u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX6F7uESzo0NfK
 T0Czdcst8QpbsxqtHLcNOFnxH6KPx5VkEor06yBj2kQ+nRlfRfy9pzcfJvT8a5lUL8Ig6meX6wO
 5hiGR180/lVn0zdtBBa9etN//qRtTsHwZfbQb/l8gJ8+H48Z5zp9hVHPSoxPBYPvq4rZTH4GTs6
 UKTFW3vH6ZeVEfAsiMtbY3b98wxdQe2YXzKzPz4YIxGXrioBo2NhvEUOEFanF6WLOJY0agYEVfY
 1Tcj9CbYtuEL7HvnTPkvm2OVLyMBqa9dcofI87r84DtXRc2IJzdfwm9OqfE3mvkZp8P+WiKUR/X
 R5ANOX34TfrVzjKlHxzpGTTL0deUF1IsHCzFEnF4S1KQs9B0Q+iVfqAs7ljtF+n2gJdH38yOw4j
 19NOOHR+W/eY1er0E7lMV8JtL647hmbN+29si0cCCKAsZZhOmTIhTWeV8K79hz26kAT8biLHnzL
 /qu/6jYH1zUl7/9dcgg==
X-Proofpoint-GUID: c_GTNOMGXYdPfnS-9CF-QKjjH4piyT1u
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX0Xs9i788AwP0
 4zpbqIREVeaBWEc+bxoD42yxMzHkv0ZP7UVnKIs8AY8XVefKsEM0czsuaXgfGa0XjyB7aRwJnIg
 9OdxQ4mFbVWj1aWP7DZ0bQeIUt10x7s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020144
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

We have a couple of CPUs that has a set of custom CSRs that uses TCG
specific APIs.  Move the related code to tcg-cpu.c and do not set
.custom_csrs if we're not in a TCG build.

What we'll end up doing, sooner or later, is punting all these CPUs to
tcg-cpu.c since they're all TCG specific and KVM has nothing to do with
them.  Another time.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c         | 26 +++++---------------------
 target/riscv/cpu.h         |  2 ++
 target/riscv/tcg/tcg-cpu.c | 21 +++++++++++++++++++++
 3 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cc739e3f38..feff7e62e9 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -531,19 +531,6 @@ static void set_satp_mode_default_map(RISCVCPU *cpu)
 }
 #endif
 
-#ifndef CONFIG_USER_ONLY
-static void riscv_register_custom_csrs(RISCVCPU *cpu, const RISCVCSR *csr_list)
-{
-    for (size_t i = 0; csr_list[i].csr_ops.name; i++) {
-        int csrno = csr_list[i].csrno;
-        const riscv_csr_operations *csr_ops = &csr_list[i].csr_ops;
-        if (!csr_list[i].insertion_test || csr_list[i].insertion_test(cpu)) {
-            riscv_set_csr_ops(csrno, csr_ops);
-        }
-    }
-}
-#endif
-
 /* Used by csr.c and the KVM driver */
 target_ulong riscv_new_csr_seed(target_ulong new_value,
                                 target_ulong write_mask)
@@ -1255,11 +1242,6 @@ static void riscv_cpu_init(Object *obj)
     if (mcc->def->vext_spec != RISCV_PROFILE_ATTR_UNUSED) {
         cpu->env.vext_ver = mcc->def->vext_spec;
     }
-#ifndef CONFIG_USER_ONLY
-    if (mcc->def->custom_csrs) {
-        riscv_register_custom_csrs(cpu, mcc->def->custom_csrs);
-    }
-#endif
 
     accel_cpu_instance_init(CPU(obj));
 }
@@ -2833,10 +2815,12 @@ static void riscv_cpu_class_base_init(ObjectClass *c, const void *data)
 
         riscv_cpu_cfg_merge(&mcc->def->cfg, &def->cfg);
 
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
         if (def->custom_csrs) {
             assert(!mcc->def->custom_csrs);
             mcc->def->custom_csrs = def->custom_csrs;
         }
+#endif
     }
 
     if (!object_class_is_abstract(c)) {
@@ -3189,7 +3173,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.mvendorid = THEAD_VENDOR_ID,
 
         .cfg.max_satp_mode = VM_1_10_SV39,
-#ifndef CONFIG_USER_ONLY
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
         .custom_csrs = th_csr_list,
 #endif
     ),
@@ -3235,7 +3219,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
 
         .cfg.marchid = 0x8d143000,
         .cfg.mvendorid = THEAD_VENDOR_ID,
-#ifndef CONFIG_USER_ONLY
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
         .custom_csrs = th_csr_list,
 #endif
     ),
@@ -3441,7 +3425,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .cfg.ext_xmipscmov = true,
         .cfg.marchid = 0x8000000000000201,
         .cfg.mvendorid = MIPS_VENDOR_ID,
-#ifndef CONFIG_USER_ONLY
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
         .custom_csrs = mips_csr_list,
 #endif
     ),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c0e9098728..34c63a3628 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -591,7 +591,9 @@ typedef struct RISCVCPUDef {
     int32_t vext_spec;
     RISCVCPUConfig cfg;
     bool bare;
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     const RISCVCSR *custom_csrs;
+#endif
     /* This is just a setter for env->num_triggers.  */
     uint32_t num_triggers;
 } RISCVCPUDef;
diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index fe6350f497..fef66557c2 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -38,6 +38,7 @@
 #include "system/tcg.h"
 #include "exec/icount.h"
 #include "target/riscv/tcg/debug.h"
+#include "target/riscv/tcg/csr.h"
 #endif
 
 /* Hash that stores user set extensions */
@@ -1650,10 +1651,30 @@ static bool riscv_cpu_has_max_extensions(Object *cpu_obj)
     return object_dynamic_cast(cpu_obj, TYPE_RISCV_CPU_MAX) != NULL;
 }
 
+#ifndef CONFIG_USER_ONLY
+static void riscv_register_custom_csrs(RISCVCPU *cpu, const RISCVCSR *csr_list)
+{
+    for (size_t i = 0; csr_list[i].csr_ops.name; i++) {
+        int csrno = csr_list[i].csrno;
+        const riscv_csr_operations *csr_ops = &csr_list[i].csr_ops;
+        if (!csr_list[i].insertion_test || csr_list[i].insertion_test(cpu)) {
+            riscv_set_csr_ops(csrno, csr_ops);
+        }
+    }
+}
+#endif
+
 static void riscv_tcg_cpu_instance_init(CPUState *cs)
 {
     RISCVCPU *cpu = RISCV_CPU(cs);
     Object *obj = OBJECT(cpu);
+#ifndef CONFIG_USER_ONLY
+    RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(obj);
+
+    if (mcc->def->custom_csrs) {
+        riscv_register_custom_csrs(cpu, mcc->def->custom_csrs);
+    }
+#endif
 
     misa_ext_user_opts = g_hash_table_new(NULL, g_direct_equal);
     multi_ext_user_opts = g_hash_table_new(NULL, g_direct_equal);
-- 
2.43.0


