Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357E0CDB479
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 00:10:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcB9f-0007kY-8H; Tue, 23 Jun 2026 20:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB9P-0007Xb-JU
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:07:33 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB9N-0003FW-5D
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:07:30 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65NK0IUx973558
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=tPKgOZLimsk
 fFqkC0kyNvo6B2QfFFcxZ49dpgDAdxuo=; b=Ip1QgaWTwjSnAuuNIzJU6Q9poyR
 rNhnQvvoWxSbrKf1A/EV7F6uv4mIx7R6k9FdJbvti3ifWtLndenVcVOnOz5/KKJm
 UKW47SHssonqpbK8wv7hcdlcPm2gfICUkJEa/kD31TqB0H6xn41CQ5CKbgLvWkCk
 GC1bclMvNPWcP88Hvsjn2/ZxMdAFZ0j3Do++QzM2ze12e4eT2ZrqzAgQcckROSY8
 R1rnIAYHinN1mZ4Ud8Awi2zlWFTP6Rf7YSYuOZAxm4gKpecAwdCVAKKZbk5dngKt
 UT3oYYWsxhM3uYQh9fvYTbVey/Qw5dX05Kkuq+1x4wfrlQmqFzZi/q9VOZg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f004p0sk4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:07:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8e0df2461fdso15068236d6.0
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 17:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782259637; x=1782864437; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tPKgOZLimskfFqkC0kyNvo6B2QfFFcxZ49dpgDAdxuo=;
 b=PeAL+pDuMC5sEN/ZzmfH9he9aKLAwXbcKiqM9exc0fAuPGl5OKU9k95zQeuCKcq2j8
 fWNoB/+buHDUbpTJ5ayGHC7voWbv0wIdYXGF7MX/73Nw+irsKxIk2gifdOSWjJiVHbG+
 eUqRgRALUSFgLX+zb1za9F4f7APyVhQt1pGFzEUVFXzwA1mokf0NnbI/pmoAYrf/ECdh
 bKk0xZJXiWatLvxw4XRyMZWUjcMkV7Fy5EH0uDRe8WsKytQyeIhKoefXZP4xxfG+iY8z
 RnWIB+LqBj/nLfx66hnKhxqTrjPglL3jF6JxzcEfEd0TwVgIaEZgSqrWa1vO+cwB/b+s
 Zbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782259637; x=1782864437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tPKgOZLimskfFqkC0kyNvo6B2QfFFcxZ49dpgDAdxuo=;
 b=ggO//2XLCJKlY8GfiIxD8Q+eUHPLR/Uf/uKbPj1cFjIxw4dhRGAAl7PJMI6uInO8eb
 qQtmyi0KmGRyHrAPEEYZyzY25WQffINIOxu1Xi4pCKcLVzlRUr9dUhYZF9kxx6LB+iln
 L2P+WVIv9eYOUrZFNtvEiCt+EXDwi0JMMIez7PQ/7oxMKy0Hq5aB78YYP7xRst6HzJ63
 sA1iNchrxFH+T54jClftrajWimR1vEs1L2lnl251ojTyUuw+MH3qiaUh6Ruh0ASv0tpc
 0l5cphoHi2DO3FNuw7/k20Ams2WdukEkmsj2s7Vq20UQqUmH+I1GyT9scDnSTRQr+oJk
 y6Pw==
X-Gm-Message-State: AOJu0Yx3S6oBdAd1+/fIOgnMK3LRM10ahpOJebRfxJCNkDqeoY2Fu11D
 MgKp9mpgDnYX9+201OO2SYSjtfLFx6HbyBsyD363DeB9OGlsxZDEByeRJyGZqHtAQPutSQncsbQ
 PwMLqw8bOcKSr6c60ga5m3uIri8SwQrLRTgH1V/tMvN6jHIBrX49ogsFu7g==
X-Gm-Gg: AfdE7clNVrwmCSxcdaLMh14KoLhKR2ZwNumtkuf9OFi7j9GMuUqbdRKlNhUje2dSc4h
 wzvGlzTjvaoSHbYGumM4f4HCNESUdfmuDnrD8tp/5vEFjtUZd26Q83NFuuGCsUe4RebVUgrAfeU
 tKAvGNRnzxyRrrQht+soP4ccltz8SfWOHPi2lV6XUiYtSUZVTMvQttxIwGyTp9BSAAtNt+uVCdz
 CSjMEDKXupFvPLjN07W3bEXUmg/U15Vl3RdckyvA/AgGjYeB52mg/aXXg7FRnepC87mAobQ62sH
 NIWrgz+KMJnDXgFEeSsj5Puo7aHmix6iX++A8uRYCY0Mc7irQ7WijKNdUEfWGFKF2xbEjW/p/5j
 j8WPy0gjyUePqdg29AvTs5QVN84Z3X2DP4M7e1PL53vUDbQ==
X-Received: by 2002:a05:6214:5f08:b0:8ca:f47:25ea with SMTP id
 6a1803df08f44-8e52ac2bf0dmr25074206d6.0.1782259637249; 
 Tue, 23 Jun 2026 17:07:17 -0700 (PDT)
X-Received: by 2002:a05:6214:5f08:b0:8ca:f47:25ea with SMTP id
 6a1803df08f44-8e52ac2bf0dmr25073486d6.0.1782259636761; 
 Tue, 23 Jun 2026 17:07:16 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8df81cdec56sm142422976d6.32.2026.06.23.17.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 17:07:16 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com,
 fritchleybohrer@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 12/24] target/riscv: move valid_vm_* satp arrays to cpu.c
Date: Tue, 23 Jun 2026 21:06:19 -0300
Message-ID: <20260624000632.2149359-13-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfX9lAq7DXDUnqJ
 L2d/BMbN5BZWrTLFDuoGQbG63BMe7BNF3Ci3FiG+HTFp3Ih6M2F/+FBFLeXgRAKmaVOX3CTIniB
 2Zrls9sNpJI5ZDr3AXarFmx9GwE/ayA=
X-Proofpoint-ORIG-GUID: Z7pi_xlEZYVc1Sllcsaht_ZEjyW2-hXa
X-Proofpoint-GUID: Z7pi_xlEZYVc1Sllcsaht_ZEjyW2-hXa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfX9bZqouq5fUBJ
 cXCG/g6P/GJ3aTYCsWHMkOSZR/nhu/iSG11iTxEegceowUOM2DHKRI2wuplVBMP211GypllGbRC
 7k5jWSyMb0ibzoNFhUPJB6FPqVBC0N7Yj6r4B5NwOgIHFdGBv/PY77eNCORn2I4C6Arrc/b7b1f
 yuOBH7kT434ykX6ImsqFQpBGH/spbVk+47z0ApGYDpm64SUW6R7Rpdpn5xGrP9AJH+n4obFubQC
 gMd/6C8pCDggvt8FWt7ISuF3qcZB9HGWudr6zKIf/10RY86xBxHcxUxJB8qZDs7GdUol6NrOkby
 x3dU+eGCMN94adsCxfD0ELZ5JRoIEyULhan3hYrRFFTlby2bP3AXcxv2BTFf9S5Amx+dp/o43rX
 qGPtmFWzCKAYqwB1xVLGZdvtR4ox53IZeNVKy7pWm6/nu+4iZh3l5ZpKhVW8PxGFDhF+2gf1beE
 HQxq9i10xz8qKEGLQ0g==
X-Authority-Analysis: v=2.4 cv=Q9TiJY2a c=1 sm=1 tr=0 ts=6a3b1fb5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=5rzsFUvyi4LdqLJPsjwA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_04,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230199
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

These arrays are used internally in tcg/csr.c and in cpu.c in the satp
options logic, which is common for both KVM and TCG.

Move it to cpu.c to allow KVM to keep using it in --disable-tcg builds.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/cpu.c     | 13 +++++++++++++
 target/riscv/cpu.h     |  2 --
 target/riscv/tcg/csr.c | 12 ------------
 target/riscv/tcg/csr.h |  3 +++
 4 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index cba7d2502e..29af0f2be8 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -59,6 +59,19 @@ const uint32_t misa_bits[] = {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
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
index 572a39d660..b17be35e56 100644
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


