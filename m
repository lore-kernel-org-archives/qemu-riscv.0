Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7ADC5DF66
	for <qemu-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 16:04:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wvzoW-00028p-ME; Mon, 17 Aug 2026 12:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1wvzoK-0001uS-Kq
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 12:03:46 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1wvzoH-0006vy-Lf
 for qemu-riscv@nongnu.org; Mon, 17 Aug 2026 12:03:39 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67HFYwew1530656
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 16:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=CO6UUvArqVV
 pB3RPGVUC2RY4fhE/XnNoBsv7zWprGTg=; b=aBixKE0I6mbF7k1ZbvFDd8zF4Qr
 3VucTDtidqZ97LaxcDmIgWg5j1TntZ4iAVKvtK7CoH/AOWq+dW7QTkPmcIhZmC8W
 0MiuFVGE2vzLs+dikBUSCyAD256f3jOiaakSPSogb2VGASpbF7VqvlFFRQxE5DQb
 rp7SDlYaMcQLbfEjrfqxCSoPhdKD8kpdmOh8J/gw27almes+p8WoszQ80cdGrJJ0
 1n/UndHJUg1scUVMjxLBJd3v4g1CKsT4rpeBGQiMIqxJzIruc3SwvANz+KD4EOLp
 3ujkMCDhSzv/5lAdCGb6CRjP3g+iDZB+Tt2HBV0JVWFStdeftMsOJLT1eBw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wke2587-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 16:03:35 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-8487ed7f7beso3548011b3a.0
 for <qemu-riscv@nongnu.org>; Mon, 17 Aug 2026 09:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786982615; x=1787587415; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CO6UUvArqVVpB3RPGVUC2RY4fhE/XnNoBsv7zWprGTg=;
 b=jJvh/brnp2Ksl112ThERt/B3K96xuWXf9FqrvOrrpXkP141/Uc751qbou/3IN/jbua
 y4jlqyt3X7L3qEZrze5BSchN0MxCEVLkL58nXqsz77WhgI4ql8mu+u+h50l51DfTxDcl
 B33AZcxZXqlC2mMEPFpoiVeBJUtsgaqO3Pgw/NbiDMiw1JP9Y8VOLYtKX/ySZzv/Jzjw
 7C2gBCFSuPGCSeOVFB+PBgI5HUWARZeVGmQevDNSXZIvK0ggvVdXmd2wM5635XBYYLFk
 teg5kCSrM5Lt+3AsVCBrkfzUIMBzZLaO99Ro0w8T9INPqfjj8ItV1vyqAsq0/XO4+eU8
 VEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786982615; x=1787587415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=CO6UUvArqVVpB3RPGVUC2RY4fhE/XnNoBsv7zWprGTg=;
 b=qNezkhnxwNdZTRnuxTUkBeBCjvgsW76x1z/uCbJ0wGEmrtycAFIxNzRNaA5HOQ/uUi
 Gql7jYo95thw45uRlAX2tnntiOrPcO2t1tzL5ijiMBQkNM83/RJybBmtpLzxKZzT0+WW
 dBlRyIVJBgPMCf5cNSsHPCaYC6ByaEdNlbbzZOq/5Om2hhNm8B5k/azAtswVfmNqOL2f
 lOUr8URsjK97Ou+Jn1chZWL5YkLbhrhz9QS8OjCdW60I5gF139hfR7oo0xTfw5R3ByFJ
 sBtDN8TfrnHc5RCdOnqa1amAKiZzXWmU3aPnS0XnoBpLeWbM1cioB3fHu/bnB8WwdK/k
 y9Dg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpSi/iNT6l74htTlJeFb/7UUcQfqb12NvX7AvMlp4h/5Mzz3t6ufMF9x1SwcIsW8otE9PP0iSPLwlec@nongnu.org
X-Gm-Message-State: AOJu0YyAPAljoDjrc6qKcIPNvmo0FwnEJeS2hVnFcw40K+3+XEJ4CHnv
 dINuZbQ/1YomCkOI/tqB3i73rsEl5P0zvT6C9HM50n0EPgaDVS4M1bG4TeRiCRi3e9jzjuLdHE8
 j4tzEECbISqqHt8F2wv9XkyOIlZ87ntJibAFKhvdH4+5npjd/zqXIb8uPog==
X-Gm-Gg: AR+sD119ypwnngbvhwMfL82LUrE4LgJBnXenoF6xaZk9vZrMVyUIGKsK8Co4l5JkNld
 8zRouKhyidYztjdN41DgSFyB3PpWosvZtp6equ0eDr6v9Tcbp2tFNS7SBrWqMZhDaIqCPHzAHZM
 gITC0dyCibFGRwgI0v/APLGAQEXQdw0uuSJ7dWEjLg9WQ1h/+StYW5FQuD+MHvLIsN+uJ8TkXMv
 BK8SKKkPYrgb6uvD0p+xZZL6i4AhUN3Do+hRNKztrvIHkswwd+Clwb7Qq3JnPx1Xz/NL69a6cY6
 2kAPSm01mkDaBxWFWGxDLRsMDlMTe02GiJzG+oxLxN3Mfppn7+MMot1Z331ECU4p2Ar1vtw9aOM
 NkIncDe/7wGyz+JDVmLtPbp60Go3kBCeoj2vdDseaiShEcLciqgxfgAORZlDG73pGHlQrYmJJ7I
 IgF3fmijhlc6q8Vt9/cDf2pX4OwQ==
X-Received: by 2002:a05:6a00:4193:b0:847:9315:fb8b with SMTP id
 d2e1a72fcca58-84fde1500e7mr27302332b3a.6.1786982614611; 
 Mon, 17 Aug 2026 09:03:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:4193:b0:847:9315:fb8b with SMTP id
 d2e1a72fcca58-84fde1500e7mr27302232b3a.6.1786982613965; 
 Mon, 17 Aug 2026 09:03:33 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-851b6f8c0f6sm545923b3a.39.2026.08.17.09.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 09:03:33 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: [RFC PATCH 1/2] target/riscv: Add Sspesa extension and sample CSRs
Date: Mon, 17 Aug 2026 21:33:16 +0530
Message-ID: <20260817160321.3313698-2-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817160321.3313698-1-mayuresh.chitale@oss.qualcomm.com>
References: <20260817160321.3313698-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEyMyBTYWx0ZWRfXyULj9KdHvUvA
 O2GTSeFk4UjYfhcSbl5mvoI+clUU925HBPjq2bg1qizM+edHVoTR08Sx8/5SbFgYpHNdzO/sKtn
 jhHJ6KpRbhHZPl/Lbp8njs2+HtBIbUg8Jv185bJWBoUGv/m4vkQAQUeoh1V04GS8QA56J8wizPU
 IV6lVjSS0faB6JEu5H3Ko11UVkPkYCS08CC9Q6JBGemznFyiNloK1msR9AweW8NhiHML/jfaidC
 ieNUPbdJBl6ia93yWbrwqXA7BxtjGea37HmVTilkleut2Ln4hHsgcI55HZG/DMspJKwOUY1/bbo
 0EcIettTseoGjr8HNJvrwWCD2P0BlAo4O2s20aDzRDFONV6V6Im0MwCprN/gJCnPYxzurSDuzen
 j4iVdMSf9xkjn6UUbvAAuKdfO0XIkRdbsnAa3RsI+Rl9iJr8BS0uGqETeKniU6L7DoBMHkjNtn1
 AInmjnIvsBsarH0yacQ==
X-Authority-Analysis: v=2.4 cv=QetWeMbv c=1 sm=1 tr=0 ts=6a8330d7 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=l_Sd8zgwI-MehHJ8ahkA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: tTGC1YXV4cqnS69IIRD5qDZM2bQDPlzs
X-Proofpoint-GUID: tTGC1YXV4cqnS69IIRD5qDZM2bQDPlzs
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEyMyBTYWx0ZWRfXzhcruXibs42q
 J9sY72rd6NpBkExPsydCPmVpgN9K6U4zL/cs7VFDtkwd4qK7e1gtwRV/ozzlHhINRcrKX+u4P2g
 vBlTJFM244RUDN8cP6n0Eaqkjqbc52M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170123
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mayuresh.chitale@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

Add initial support for the Sspesa (Precise Event Sample Attribution)
extension from the RISC-V Performance Event Sampling specification.

Added the 'sspesa' and ssplcofi CPU properties, and the shpmspc and
shpmsdata CSRs.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 target/riscv/cpu.c                | 13 ++++++-
 target/riscv/cpu.h                |  4 +++
 target/riscv/cpu_bits.h           |  7 ++++
 target/riscv/cpu_cfg_fields.h.inc |  2 ++
 target/riscv/tcg/csr.c            | 59 +++++++++++++++++++++++++++++--
 5 files changed, 82 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5a82e6563b..f936cdeb68 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -278,6 +278,8 @@ const RISCVIsaExtData isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(ssctr, PRIV_VERSION_1_12_0, ext_ssctr),
     ISA_EXT_DATA_ENTRY(ssdbltrp, PRIV_VERSION_1_13_0, ext_ssdbltrp),
     ISA_EXT_DATA_ENTRY(ssnpm, PRIV_VERSION_1_13_0, ext_ssnpm),
+    ISA_EXT_DATA_ENTRY(sspesa, PRIV_VERSION_1_12_0, ext_sspesa),
+    ISA_EXT_DATA_ENTRY(ssplcofi, PRIV_VERSION_1_12_0, ext_ssplcofi),
     ISA_EXT_DATA_ENTRY(sspm, PRIV_VERSION_1_13_0, ext_sspm),
     ISA_INTERNAL_EXT_DATA_ENTRY(ssstateen, PRIV_VERSION_1_12_0, ext_ssstateen),
     ISA_INTERNAL_EXT_DATA_ENTRY(ssstrict, PRIV_VERSION_1_12_0, has_priv_1_12),
@@ -2800,6 +2802,15 @@ static RISCVCPUImpliedExtsRule SSSTATEEN_IMPLIED = {
     },
 };
 
+static RISCVCPUImpliedExtsRule SSPESA_IMPLIED = {
+    .ext = CPU_CFG_OFFSET(ext_sspesa),
+    .implied_multi_exts = {
+        CPU_CFG_OFFSET(ext_ssplcofi),
+
+        RISCV_IMPLIED_EXTS_RULE_END
+    },
+};
+
 static RISCVCPUImpliedExtsRule ZVFBFA_IMPLIED = {
     .ext = CPU_CFG_OFFSET(ext_zvfbfa),
     .implied_multi_exts = {
@@ -2829,7 +2840,7 @@ RISCVCPUImpliedExtsRule *riscv_multi_ext_implied_rules[] = {
     &ZVKNC_IMPLIED, &ZVKNG_IMPLIED, &ZVKNHB_IMPLIED,
     &ZVKS_IMPLIED,  &ZVKSC_IMPLIED, &ZVKSG_IMPLIED, &SHA_IMPLIED,
     &SSCFG_IMPLIED, &SUPM_IMPLIED, &SSPM_IMPLIED, &SMCTR_IMPLIED,
-    &SSCTR_IMPLIED, &SSSTATEEN_IMPLIED,
+    &SSCTR_IMPLIED, &SSSTATEEN_IMPLIED, &SSPESA_IMPLIED,
     NULL
 };
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c9dfa7daff..fe56a6afd1 100644
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
index 3f146a43fe..d3afc9cada 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -601,6 +601,13 @@
 
 #define CSR_SCOUNTOVF       0xda0
 
+ /* Temporary addresses for Sspesa (Precise Event Sample Attribution) CSRs. */
+#define CSR_SHPMSPC         0x5d0
+#define CSR_SHPMSDATA       0x5d1
+
+/* shpmsdata fields */
+#define SHPMSDATA_CNTRID    0x1f
+
 /* Crypto Extension */
 #define CSR_SEED            0x015
 
diff --git a/target/riscv/cpu_cfg_fields.h.inc b/target/riscv/cpu_cfg_fields.h.inc
index 9eb47af0a7..05e0162b76 100644
--- a/target/riscv/cpu_cfg_fields.h.inc
+++ b/target/riscv/cpu_cfg_fields.h.inc
@@ -110,6 +110,8 @@ BOOL_FIELD(ext_ssaia)
 BOOL_FIELD(ext_smctr)
 BOOL_FIELD(ext_ssctr)
 BOOL_FIELD(ext_sscofpmf)
+BOOL_FIELD(ext_sspesa)
+BOOL_FIELD(ext_ssplcofi)
 BOOL_FIELD(ext_smepmp)
 BOOL_FIELD(ext_smrnmi)
 BOOL_FIELD(ext_ssnpm)
diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index eb823b16b5..ea49d28aae 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -276,6 +276,28 @@ static RISCVException smcntrpmf(CPURISCVState *env, int csrno)
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
@@ -1672,6 +1694,34 @@ static RISCVException read_scountovf(CPURISCVState *env, int csrno,
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
+    env->shpmsdata = val;
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_time(CPURISCVState *env, int csrno,
                                 target_ulong *val)
 {
@@ -3220,7 +3270,7 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
     if (riscv_cpu_mxl(env) == MXL_RV64) {
         mask |= (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
                 (cfg->ext_sstc ? MENVCFG_STCE : 0) |
-                (cfg->ext_smcdeleg ? MENVCFG_CDE : 0) |
+                ((cfg->ext_smcdeleg || cfg->ext_sspesa) ? MENVCFG_CDE : 0) |
                 (cfg->ext_svadu ? MENVCFG_ADUE : 0) |
                 (cfg->ext_ssdbltrp ? MENVCFG_DTE : 0);
 
@@ -3272,7 +3322,7 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
     uint64_t mask = (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
                     (cfg->ext_sstc ? MENVCFG_STCE : 0) |
                     (cfg->ext_svadu ? MENVCFG_ADUE : 0) |
-                    (cfg->ext_smcdeleg ? MENVCFG_CDE : 0) |
+                    ((cfg->ext_smcdeleg || cfg->ext_sspesa) ? MENVCFG_CDE : 0) |
                     (cfg->ext_ssdbltrp ? MENVCFG_DTE : 0);
     uint64_t valh = (uint64_t)val << 32;
     bool stce_changed = false;
@@ -6771,6 +6821,11 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
                              write_mhpmcounterh                         },
     [CSR_SCOUNTOVF]      = { "scountovf", sscofpmf,  read_scountovf,
                              .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_SHPMSPC]        = { "shpmspc",   sspesa, read_shpmspc, write_shpmspc,
+                             .min_priv_ver = PRIV_VERSION_1_12_0 },
+    [CSR_SHPMSDATA]      = { "shpmsdata", sspesa, read_shpmsdata,
+                             write_shpmsdata,
+                             .min_priv_ver = PRIV_VERSION_1_12_0 },
 
 #endif /* !CONFIG_USER_ONLY */
 };
-- 
2.43.0


