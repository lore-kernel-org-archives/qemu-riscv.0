Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B69AC43458
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 13:53:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wfHpr-0002Jv-Sm; Thu, 02 Jul 2026 09:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHpp-0001zv-J2
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:09 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wfHpn-00089E-KH
 for qemu-riscv@nongnu.org; Thu, 02 Jul 2026 09:52:09 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 662D0Xj4527909
 for <qemu-riscv@nongnu.org>; Thu, 2 Jul 2026 13:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=p7+r6ZA/ADu
 9UETUQG2EwKtMxRHHJT1XtPTNVf5Hoso=; b=pL/L52n48oBJT+K5FRsMXv6Q/Oe
 40fXZtkNhUEcBc2TPYBE5m7AQcCPBYRtJcg+tAhRJa84AEUfI3gauED6p67Z6pjA
 MW3a6xUMlFk5wnWDt7s8uh4BXtwNRhXfAk+RuaAxnGLigm+yV9jVvW5FhV9LSyav
 JTWhT7ID9O+i1fw6IsqSKsLWjyhNPNibo8DY9m49qefmrazvs+9unkC3XD4hhygl
 lPzcYptawDQW8WanyMWzXfKk1Zj/ZrvRjIwwVzPPlfKVCuaWfYoi+X6kxMGKkhGx
 zIT4Q/1FlaImFZHavT4KC/VqMWErovjhGxm4GEA6V4CmEf0d0/g738PxVTQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7na19f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 13:52:06 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-73883529f3eso1737263137.3
 for <qemu-riscv@nongnu.org>; Thu, 02 Jul 2026 06:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783000325; x=1783605125; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p7+r6ZA/ADu9UETUQG2EwKtMxRHHJT1XtPTNVf5Hoso=;
 b=Sx7NvknspzuI7CE8JoN33VsZ1CsRrn2kJXfEiXxDUg7c5TCmcKS+rfXXWwCI/idolg
 kIneNvVtvo/QeKJ7r3YSacV3K0gAimGBUu0wIDkzHGO6zYyPPfZ7o95oW/OFeNjnz7lp
 SwBAmf2/1Z3SkD0v573GyHue9D7/7ydFeinEJDGwSSr0ken16jIxAbdx3VRRwkXYDYXI
 uWhcjsiEQovwDmUUSiSGE50GVwwaE329YGiLK2fDqV7DXXYndvRyPtAQejir4+ce/AIA
 Sqtgjjz/kVytLxxrJstsJYYxHhJtOa8i9PGQEpnyR852QxwFyYNOhMZDmNEtX1suaU3b
 aoTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783000325; x=1783605125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p7+r6ZA/ADu9UETUQG2EwKtMxRHHJT1XtPTNVf5Hoso=;
 b=LgaV+2z9qbpUAfk9/k+DB+YTXtbijoOyuYChhHCd4DL0FzKHH5VnKo6e15u2IeH7yp
 e3VG4cw67GiY5A6lA+FeLlF2U3WNociNIqTYvU5H05vCVQH3ZcKZKaiejM74jNyL8PEt
 vxBX+KeTJ7wA42xhuv7jCvhaiJhl94oxEnMG6E0Z8fRJfIX+AI59U2L2SXY/a6wGekaG
 7kqzwl8lWI3FDcFV2+EKALjSoyBDrLkHX7Ps0ujQ/1bntviKstgASW4KvdXKyO4zqr5T
 BSNQG/cwStU4s6AOK5YuOu9CxUkljfRoNSRqVwtkUNddvpX3KMN/iLfbAs06W6QcbPug
 i9gw==
X-Gm-Message-State: AOJu0YxUtJZUe604Q3uTJ4hgPeXDZ4d6sqAF1Pad2e2IhroukiJw5DUq
 OcFOC/sStWYGPWa9yxhBnVFYsRaCIiy4+siTTdqDFsu+bOj4K8sBZPuo7LDLJWojUMWrosCKys/
 4x7c+eWsSt9JhPPIeUsF6SP4OiL7vfhCNVYnbcOczOgq39JnMivYbbc9kSw==
X-Gm-Gg: AfdE7ck6Nf3Hyg4k4MvovhYRTygHtx32p3h2VVvj/kLSNeBD7IrysckZUOsM6zaEpH8
 CHG8RhvJKO/ZUu3cjvpBQZKMFT6kSvbvjEReb7OE4g3Lh+CosCduwNWSZiHbIBbn9m3RAccj1mk
 E8nkCxd+Pg1AJfC4pA0M2oXRixOzkkB3eCp3j5KjCPjw9VlwioNyjslIiTQZbcpH8YTYuY8DIEd
 oVoo/BRk0NIpu4CX7r4c0u2x5hA440Z2po9/F8SXcJMEReYaZEGHdgPNSiU7XNJwjjG9cq/AjMS
 QCGt2Tsj0K1WNnV5yNrTyI6fuRiqOI4EdVnB+v3yVWX9kUZlRxt8pP4qLwT7IU+0hUyZLkacvLY
 RLN/LBk48mi3Nj1zTIbl8jOqQyeYRlsns9t/A4dT7dw0tcQ==
X-Received: by 2002:a05:6102:c93:b0:739:86da:776d with SMTP id
 ada2fe7eead31-73daacbb442mr3511800137.25.1783000325081; 
 Thu, 02 Jul 2026 06:52:05 -0700 (PDT)
X-Received: by 2002:a05:6102:c93:b0:739:86da:776d with SMTP id
 ada2fe7eead31-73daacbb442mr3511781137.25.1783000324660; 
 Thu, 02 Jul 2026 06:52:04 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-73e1c4e64a3sm1276462137.9.2026.07.02.06.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2026 06:52:04 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 12/24] target/riscv: move valid_vm_* satp arrays to cpu.c
Date: Thu,  2 Jul 2026 10:51:14 -0300
Message-ID: <20260702135128.1188021-13-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX60sRxFkf58yQ
 EMu9X8HZ+SIGxAy0bkW8GDqtRZkuXe4KUDZMownXbWCIEBLldXrmPaLC9AH8d/wkzpgwiYcWOxO
 vatyRh6BEvwe+fBaLFfGY50A484LJehDof292eixQAENshmNMFMV3qAP/XvBub9MIP2qK3TthT3
 2oJKKNk/uXJhzbRx3nXaqby/XBPvKnFx6RYwgShq+s7rf4J3T+Bo0NZ935Mx+2b2dFjgj4m/CyM
 A7DSJEU4CaZHbGm7MFLeQpR+8GAyH5d6USUYd7k4a+n+E0iS2nGHXxAlHnaBULWyJeYLD+gFFrt
 8lkkCBHoaPyvcKLBNKY0/PrFSIB5rvxgJ924368NidxpgYpYflUpvM6u0p/hAwYRpmNM45fe3G4
 sILsBvwJy+/R/7TYCGMEfwXwnZtSRQnFfQSvb5ToeI1wZFUE0MnlqqIp5sQsN2ooJ72zai7U3CC
 r3t7yk8bwYCE5Mh1G3w==
X-Proofpoint-ORIG-GUID: F5ATfb3OUsv6VTSmNEhoj_9Kr_P9oMf_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0NCBTYWx0ZWRfX5GIaCHjQ//Sg
 T4AocsWDvpbsOkG+2wUi2KpltloQMIFbNx8FkW7C3yEdozbUIkGXN8pJu3DmXdMc++rAwMWIbvG
 /CE2XbmEJszv2UJpwPXqAclIg0LLjHs=
X-Proofpoint-GUID: F5ATfb3OUsv6VTSmNEhoj_9Kr_P9oMf_
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a466d06 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=JF9118EUAAAA:8 a=5rzsFUvyi4LdqLJPsjwA:9 a=-aSRE8QhW-JAV6biHavz:22
 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020144
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

These arrays are used internally in tcg/csr.c and in cpu.c in the satp
options logic, which is common for both KVM and TCG.

Move it to cpu.c to allow KVM to keep using it in --disable-tcg builds.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c     | 13 +++++++++++++
 target/riscv/cpu.h     |  2 --
 target/riscv/tcg/csr.c | 12 ------------
 target/riscv/tcg/csr.h |  3 +++
 4 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 69c2827e31..508e8dc03e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -66,6 +66,19 @@ const uint32_t misa_bits[] = {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
 #define BYTE(x)   (x)
 #endif
 
+/* SATP bits that are shared between TCG and KVM */
+const bool valid_vm_1_10_32[16] = {
+    [VM_1_10_MBARE] = true,
+    [VM_1_10_SV32] = true
+};
+
+const bool valid_vm_1_10_64[16] = {
+    [VM_1_10_MBARE] = true,
+    [VM_1_10_SV39] = true,
+    [VM_1_10_SV48] = true,
+    [VM_1_10_SV57] = true
+};
+
 bool riscv_cpu_is_32bit(RISCVCPU *cpu)
 {
     return riscv_cpu_mxl(&cpu->env) == MXL_RV32;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 34c63a3628..82430ecec6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -971,8 +971,6 @@ void riscv_cpu_finalize_features(RISCVCPU *cpu, Error **errp);
 void riscv_add_satp_mode_properties(Object *obj);
 bool riscv_cpu_accelerator_compatible(RISCVCPU *cpu);
 
-extern const bool valid_vm_1_10_32[], valid_vm_1_10_64[];
-
 void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
 target_ulong riscv_new_csr_seed(target_ulong new_value,
                                 target_ulong write_mask);
diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index 4657b17e2d..36f2004bc5 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -1874,18 +1874,6 @@ static const uint64_t hvien_writable_mask = LOCAL_INTERRUPTS;
 
 static const uint64_t vsip_writable_mask = MIP_VSSIP | LOCAL_INTERRUPTS;
 
-const bool valid_vm_1_10_32[16] = {
-    [VM_1_10_MBARE] = true,
-    [VM_1_10_SV32] = true
-};
-
-const bool valid_vm_1_10_64[16] = {
-    [VM_1_10_MBARE] = true,
-    [VM_1_10_SV39] = true,
-    [VM_1_10_SV48] = true,
-    [VM_1_10_SV57] = true
-};
-
 /* Machine Information Registers */
 static RISCVException read_zero(CPURISCVState *env, int csrno,
                                 target_ulong *val)
diff --git a/target/riscv/tcg/csr.h b/target/riscv/tcg/csr.h
index 73d874ee98..53ba3b4a4d 100644
--- a/target/riscv/tcg/csr.h
+++ b/target/riscv/tcg/csr.h
@@ -69,6 +69,9 @@ enum {
     CSR_TABLE_SIZE = 0x1000
 };
 
+/* valid_vm_* arrays are shared with KVM via cpu.c */
+extern const bool valid_vm_1_10_32[], valid_vm_1_10_64[];
+
 /* CSR function table */
 extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
 
-- 
2.43.0


