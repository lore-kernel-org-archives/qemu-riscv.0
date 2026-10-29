Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8096C606A322
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 13:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pCO0r8xV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=El14ttkW
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xMPuB-0005rD-6u; Thu, 29 Oct 2026 09:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1xMPu1-0005k3-DI
 for qemu-riscv@nongnu.org; Thu, 29 Oct 2026 09:10:46 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1xMPtt-0005yR-8W
 for qemu-riscv@nongnu.org; Thu, 29 Oct 2026 09:10:45 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69TCe6mq068192
 for <qemu-riscv@nongnu.org>; Thu, 29 Oct 2026 13:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=esHdKrq7euq
 7Uz1AGGdkCsmBxnJpvZApJYL8W6uA8/U=; b=pCO0r8xVVD2dMI0RbcdTLcgLAaF
 lgQ4YCvD4eP71vlbC81knoztY3s1E2s0w4r6gipFRUWz5lrMF32DN6LkmI3H78Ns
 KApJjdljc5nut41aOGu2CJMPHFQGB406bEXA0toxw2OF14ZvIBUDXQTYBGV3ti59
 QFW0OlSq0y1OHROWRdZyg8NNl1we8nsh1ClyQm57Y79BNNdtnKdJL5JodnKJc0OR
 bovuxw71p1ltR5JLsrLrZJzA1Jo1bLftikTxF3Gh+1ygRGrDGpBRqh0F/Voo+V8G
 hDt4gUPHuFWekmOQO1Oyt+9nAxEFglMMYiwv6JX3kSfvS4IlolN3cSmiBCw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshsvgm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 29 Oct 2026 13:10:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2e8ad8c5f80so30316335ad.0
 for <qemu-riscv@nongnu.org>; Thu, 29 Oct 2026 06:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793279435; x=1793884235; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=esHdKrq7euq7Uz1AGGdkCsmBxnJpvZApJYL8W6uA8/U=;
 b=El14ttkWM9ZCljvH9luockv0YTBT4OxvayxlXs4WbD+/eDc//ksd1sra0l35lRq/lV
 95JsMMThlfVcMUVEmkxmR/0w16SNwwoferl/OlWt7nzebvzEe0NCt6r+kvZD4avmcpLL
 kYSUpYDVZrrdm+7OmR2bSI+WLoLZHaitzYiunigsAKqcUTX1usuEoVkFFdqwAhwNUcSp
 YPQIGrRDQXE2jb6GqKiv7SK3MEabxpbbbZfjwgGIoFAZPXPlkZyRNPLg6XVL6ERjaGLn
 F2/mFgKLATASi7p6NmpAYtIXtSb5lMB0Rau7MXwQ+XIbvxpS1LeNKCcn3xo1Y8CcNt+p
 bW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793279435; x=1793884235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=esHdKrq7euq7Uz1AGGdkCsmBxnJpvZApJYL8W6uA8/U=;
 b=YCW2w624yS9PHMkjADJh4eTEsy//qMmDiwzDjdQX+eLsaeumRFerB2R8ew3I5OZDS3
 GI8eVbViG4+UEqJwMeIhdXwXTlKf9msg3VVbVS9yF5n9CQ5cjveZTeKOwBIKlqWRuWc5
 CGONQddxn6oad8d30kUOT2DCTmlt0EeAIDRrvkv0GVW87haXyodVrPibVDPrQfsbreMx
 58kfjKrLkfsE5VqdEFPZqDtnVIEekbJebNTZnukDS+ZK2Bcpf2KMY4VO46NeCdbLaNpS
 0AMtIu6tBqBBjDqC2D+AfCONfYlPUE4HtZzrqiuzKP2N/x3iomgpyuLtn8xqsFriwC1a
 N48A==
X-Gm-Message-State: AFq9FYLqd/jqrGpM/QCQceN4uM8PTJ/oYqvvOHVG87nsHfLZbWeoosYo
 003o4kJor2eCHczjw3gTa6dY/1QtUjYjksZCrElwfhemS3ToCY9I4k4fx4PYHMu3L1mSIdiuduq
 KZE0YsS8RYxWLxvCUip6Bd2sw0mZt2Q533+LvSJYTK3tSJBMwobOWLDnL6dwPeZ3u4w==
X-Gm-Gg: AYBFou0eEHnXd289V4cYq935gpSz1leVTLmzxX3yX8ZfbPg2yqE6JoOnrKJFYzzhQIr
 zA9eq3uNwInOyiky5JEYjVW7QGVHiNSJKI3NkAx+o4Gwx/Z5IoOvuOwlVbZtznqJRgB058V4GRv
 P86MJjDaKRhXipKhVMx8lzchq0dnQGdCRwIMAOrNOgH+NczTKhw0MK9PbQgZXE9XCtpipCa6hV+
 9an9dYNzB0FaV+x9gUbOZN0aaDRDii3E/T1GpedwzK2fgiFVm1K3wP50dSoYSO/arRp0M4D2msD
 hhyaQ+TqQbNhwUeY/I8sav8omVXLnO7bElpIAipUD5x0/T7afxRHODljTCJiBeMHSinZWf8uWQQ
 1mDO+bu92iKvC6FR4pAqbmhgp4No3ENBTrViBJEENgezGabLrOhhXUHX0U5vdn2wmfYk5ZXF7cw
 XxKut8O0XaLbWlYxHdI8llvvWtruRG42keFHgxl4Ew6RcRZWBotSTAf6UGYdL3qwBj+g+6hLZvo
 gw=
X-Received: by 2002:a17:903:fa4:b0:2e5:41dc:9ac2 with SMTP id
 d9443c01a7336-2eb0033faa3mr53604605ad.9.1793279434736; 
 Thu, 29 Oct 2026 06:10:34 -0700 (PDT)
X-Received: by 2002:a17:903:fa4:b0:2e5:41dc:9ac2 with SMTP id
 d9443c01a7336-2eb0033faa3mr53604075ad.9.1793279434042; 
 Thu, 29 Oct 2026 06:10:34 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2eae6bd60desm34467845ad.29.2026.10.29.06.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 06:10:33 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
 qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [RFC PATCH v2 1/2] target/riscv: Add Sspesa extension and sample CSRs
Date: Thu, 29 Oct 2026 18:40:08 +0530
Message-ID: <20261029131011.3715081-2-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029131011.3715081-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261029131011.3715081-1-mayuresh.chitale@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: km0rgd-Xm2MAfyUyvuJl-ZRqQE79i7el
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae345cb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=SVZ1A0C5Q_L7GUzBcyQA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX4Cj4gBjOGsDn
 GQOhzQtjCpGWMqnL7yFcU9bmDlj4JGf4806hX+zOnykGN20HlJtGoyezrnB+A15UgCwPYIG00nY
 q53WIZV5zB6y6LyZjt7jgZ+Mleprgok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfXxryTsXEnx8ly
 xW8WnEGk23gWwErHhc4vlKzHMSiFN/HivFb9y3elawb5MUYtD01zKeUKXAGDfTDc0OPlIQD3B2C
 YhOB7wQA4SNdD5ruWumrLPYBqHPoBrX3V3K0DDEdUKQWKrXL1FOSAUtzDwtla/5Qd5mIY0+2u/8
 Z4brALGxVP2Qrb7DyZQ2Sx/CYszPDf2disPV7t3vLOtrQ0qrQo36mCSfmwaJzBJV5M/poJY0Fnu
 qVAbmxOi6soDGoo2N+UzYtKWUXtSWTImPTe3Rd8+GubLm+U6QYJ4a4w97/DSceA52RhBJe4B3PH
 MNDrT+1vi7m1/lecZlMuRe6mKFBKRLXccQbMiSNBrwwIEQ8UmUdHBuJyrAz075DBZu/nQmOHM5K
 kah/n3ZhCAbPkPX7dKqjurRxd6g6NiBaweDW0G6pyks3SH+X7WbrCpCGPytf08XcsPir19vaIS5
 Vzu0RTwE0e5DeFd3EEQ==
X-Proofpoint-ORIG-GUID: km0rgd-Xm2MAfyUyvuJl-ZRqQE79i7el
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290051
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mayuresh.chitale@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
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

Add initial support for the Sspesa (Precise Event Sample Attribution)
extension from the RISC-V Performance Event Sampling specification.

Added the 'sspesa' and ssplcofi CPU properties, and the shpmspc and
shpmsdata CSRs.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 target/riscv/cpu.c                | 24 ++++++++++++++
 target/riscv/cpu.h                |  4 +++
 target/riscv/cpu_bits.h           | 12 +++++++
 target/riscv/cpu_cfg_fields.h.inc |  2 ++
 target/riscv/machine.c            | 20 +++++++++++
 target/riscv/tcg/csr.c            | 55 +++++++++++++++++++++++++++++++
 6 files changed, 117 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ae750f85c6..99a01ac412 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -282,6 +282,8 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(ssctr, PRIV_VERSION_1_12_0, ext_ssctr),
     ISA_EXT_DATA_ENTRY(ssdbltrp, PRIV_VERSION_1_13_0, ext_ssdbltrp),
     ISA_EXT_DATA_ENTRY(ssnpm, PRIV_VERSION_1_13_0, ext_ssnpm),
+    ISA_EXT_DATA_ENTRY(sspesa, PRIV_VERSION_1_13_0, ext_sspesa),
+    ISA_EXT_DATA_ENTRY(ssplcofi, PRIV_VERSION_1_13_0, ext_ssplcofi),
     ISA_EXT_DATA_ENTRY(sspm, PRIV_VERSION_1_13_0, ext_sspm),
     ISA_INTERNAL_EXT_DATA_ENTRY(ssstateen, PRIV_VERSION_1_12_0, ext_ssstateen),
     ISA_INTERNAL_EXT_DATA_ENTRY(ssstrict, PRIV_VERSION_1_12_0, has_priv_1_12),
@@ -1070,6 +1072,8 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
     }
 
     pmp_unlock_entries(env);
+    env->shpmspc = 0;
+    env->shpmsdata = 0;
 #endif /* ifdef CONFIG_TCG */
 #else
     env->priv = PRV_U;
@@ -2933,6 +2937,24 @@ static RISCVCPUImpliedExtsRule SSSTATEEN_IMPLIED = {
     },
 };
 
+static RISCVCPUImpliedExtsRule SSPLCOFI_IMPLIED = {
+    .ext = CPU_CFG_OFFSET(ext_ssplcofi),
+    .implied_multi_exts = {
+        CPU_CFG_OFFSET(ext_sspesa),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
+static RISCVCPUImpliedExtsRule SSPESA_IMPLIED = {
+    .ext = CPU_CFG_OFFSET(ext_sspesa),
+    .implied_multi_exts = {
+        CPU_CFG_OFFSET(ext_sscofpmf),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
 static RISCVCPUImpliedExtsRule ZVFBFA_IMPLIED = {
     .ext = CPU_CFG_OFFSET(ext_zvfbfa),
     .implied_multi_exts = {
@@ -3013,6 +3035,8 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
     &SSSTATEEN_IMPLIED,
     &XSFVQMACCDOD_IMPLIED,
     &XSFVQMACCQOQ_IMPLIED,
+    &SSPESA_IMPLIED,
+    &SSPLCOFI_IMPLIED,
     NULL
 };
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 49a1186bdb..afd893e3a8 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -470,6 +470,10 @@ struct CPUArchState {
     uint64_t sscratch;
     uint64_t mscratch;
 
+    /* Sspesa CSRs */
+    target_ulong shpmspc;
+    target_ulong shpmsdata;
+
     /* Sstc CSRs */
     uint64_t stimecmp;
 
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 3579789a1f..61258ce6e1 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -634,6 +634,18 @@
 
 #define CSR_SCOUNTOVF       0xda0
 
+ /* Temporary addresses for Sspesa (Precise Event Sample Attribution) CSRs. */
+#define CSR_SHPMSPC         0x5d0
+#define CSR_SHPMSDATA       0x5d1
+
+/* shpmsdata fields */
+#define SHPMSDATA_CNTRID    0x1f
+#define SHPMSDATA_MODE      0x60
+#define SHPMSDATA_V         0x80
+#define SHPMSDATA_MODE_U    0x00
+#define SHPMSDATA_MODE_S    0x20
+#define SHPMSDATA_VALID_MASK (SHPMSDATA_CNTRID | SHPMSDATA_MODE | SHPMSDATA_V)
+
 /* Crypto Extension */
 #define CSR_SEED            0x015
 
diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
index bcff8f55f1..6e67c6f739 100644
--- a/target/riscv/cpu_cfg_fields.h.inc
+++ b/target/riscv/cpu_cfg_fields.h.inc
@@ -112,6 +112,8 @@ BOOL_FIELD(ext_ssaia)
 BOOL_FIELD(ext_smctr)
 BOOL_FIELD(ext_ssctr)
 BOOL_FIELD(ext_sscofpmf)
+BOOL_FIELD(ext_sspesa)
+BOOL_FIELD(ext_ssplcofi)
 BOOL_FIELD(ext_smepmp)
 BOOL_FIELD(ext_smrnmi)
 BOOL_FIELD(ext_ssnpm)
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 0de06e9588..6e20ad0591 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -475,6 +475,25 @@ static const VMStateDescription vmstate_pmu_ctr_state = {
     }
 };
 
+static bool sspesa_needed(void *opaque)
+{
+    RISCVCPU *cpu = opaque;
+
+    return cpu->cfg.ext_sspesa;
+}
+
+static const VMStateDescription vmstate_sspesa = {
+    .name = "cpu/sspesa",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = sspesa_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINTTL(env.shpmspc, RISCVCPU),
+        VMSTATE_UINTTL(env.shpmsdata, RISCVCPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static bool jvt_needed(void *opaque)
 {
     RISCVCPU *cpu = opaque;
@@ -653,6 +672,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         &vmstate_elp,
         &vmstate_ssp,
         &vmstate_ctr,
+        &vmstate_sspesa,
         &vmstate_sstc,
         &vmstate_mseccfg,
         &vmstate_sdext,
diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index 063590f56a..c9b5b54c97 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -279,6 +279,28 @@ static RISCVException smcntrpmf(CPURISCVState *env, int csrno)
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException sspesa(CPURISCVState *env, int csrno)
+{
+    bool menvcfg_cde;
+
+    if (!riscv_cpu_cfg(env)->ext_sspesa) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    if (env->priv == PRV_M) {
+        return RISCV_EXCP_NONE;
+    }
+
+    menvcfg_cde = get_field(env->menvcfg, MENVCFG_CDE);
+    /* Access to shpmspc/shpmsdata from VS-mode always causes a fault */
+    if (env->virt_enabled) {
+        return menvcfg_cde ? RISCV_EXCP_VIRT_INSTRUCTION_FAULT :
+                             RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return menvcfg_cde ? RISCV_EXCP_NONE : RISCV_EXCP_ILLEGAL_INST;
+}
+
 static RISCVException smcntrpmf_32(CPURISCVState *env, int csrno)
 {
     if (riscv_cpu_mxl(env) != MXL_RV32) {
@@ -1677,6 +1699,34 @@ static RISCVException read_scountovf(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException read_shpmspc(CPURISCVState *env, int csrno,
+                                   target_ulong *val)
+{
+    *val = env->shpmspc;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_shpmspc(CPURISCVState *env, int csrno,
+                                    target_ulong val, uintptr_t ra)
+{
+    env->shpmspc = val;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException read_shpmsdata(CPURISCVState *env, int csrno,
+                                     target_ulong *val)
+{
+    *val = env->shpmsdata;
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_shpmsdata(CPURISCVState *env, int csrno,
+                                      target_ulong val, uintptr_t ra)
+{
+    env->shpmsdata = val & SHPMSDATA_VALID_MASK;
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_time(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
@@ -6978,6 +7028,11 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                              write_mhpmcounterh                         },
     [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf,
                              .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_SHPMSPC]        = { "shpmspc",   sspesa, read_shpmspc, write_shpmspc,
+                             .min_priv_ver = PRIV_VERSION_1_13_0 },
+    [CSR_SHPMSDATA]      = { "shpmsdata", sspesa, read_shpmsdata,
+                             write_shpmsdata,
+                             .min_priv_ver = PRIV_VERSION_1_13_0 },
 
 #endif /* !CONFIG_USER_ONLY */
 };
-- 
2.43.0


