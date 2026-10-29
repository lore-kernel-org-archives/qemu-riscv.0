Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B052606A322
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 13:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ErBQS7i8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ekaM6wfp
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xMPuA-0005r5-W2; Thu, 29 Oct 2026 09:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1xMPu0-0005jl-5s
 for qemu-riscv@nongnu.org; Thu, 29 Oct 2026 09:10:45 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mayuresh.chitale@oss.qualcomm.com>)
 id 1xMPtw-0005z1-S0
 for qemu-riscv@nongnu.org; Thu, 29 Oct 2026 09:10:43 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69TCdwWT3943681
 for <qemu-riscv@nongnu.org>; Thu, 29 Oct 2026 13:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=wyFvk13p+/Z
 utgVEglmYltqIL0MqbewRcZ6dSTY/KAg=; b=ErBQS7i84rAIpBV+It2Stw5IRqY
 bw7+6+N1rIeGLTsD/gYxK1tsQGbxQVTZkrndvqD4XPfxpzzzy4iprpKdg4uSV6H8
 NSaymWwxEkZ8QzLgTASvrWqN1dlI4+KAG+/72cI5MLtjXTPe3ZvK+ZS1DezzeluC
 xtlppia1lEih17zh1JKAjyp9P8InMUhxlma9XcSFSN3CdPIbnt7M59vnYWURHglO
 6YXJnblgeJsn+wqLJzmUC/g1+s/93mmbnhvQVsYUaBmReCP2nfQDy/1UU7TWx3hZ
 wiQLjDG6I+RyLKe2QTQADO4YRdWmpA+QpiSIVPjvqKG7IdTQo2rs4OYMJjQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm42fgmaw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 29 Oct 2026 13:10:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2eac6e96bd4so31073965ad.2
 for <qemu-riscv@nongnu.org>; Thu, 29 Oct 2026 06:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793279439; x=1793884239; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wyFvk13p+/ZutgVEglmYltqIL0MqbewRcZ6dSTY/KAg=;
 b=ekaM6wfpCkiqSQDz+/kTuqT9yWEUzV4bBOfJTFoC4eKVI9FSj0cGKyJUzQ7Ca02Xkh
 qiBEjaypYc7SulvaPX0Hev3uWfvr3NgFjzKvw3A+Ee5MlDhk2Pr/MTA59wreQp1nLoar
 IMZuFdos7TxZ3H7sgxG3tbTBWSSCdAXWDV+Og4dBdDXlx/vEORqohJyfIYKr+IUfJIvv
 aRB/+EK976bm4vVmWi4UwLx4G0hlKONwZu4T/FJO8BaFOo8ccDqrjK/279+uf2KNjVpp
 595N8K5gYkSa8nWUMl7sF9GNiT5qzpYkSIo+a4ZYA2ILpM7zZAUIaImP06+zXxzQCQp1
 Ajbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793279439; x=1793884239;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=wyFvk13p+/ZutgVEglmYltqIL0MqbewRcZ6dSTY/KAg=;
 b=kDqz8LniYG4tvc0zAl+vAsiunbmtwnMPVxWxDfTs07M58oXBp8gCO8gPD2huL8NDQy
 jvsb9sUa3aJaIG9y/YjbBFAcCEf0BnCBjpeLAUFNDa/aOeUGED5jnpwKl9j2WxSU+nIW
 ySHZ58YNaR1BFWSC8C3S8FJBS1r4K9vVp8iQj80DqoZpST48ThURrsYzZNOCCPMBYeec
 js4uId3Xg7UZiCaXFH+uIoKIovW8p8mQie6yn7YHkcpXcHqzIpjAecrCXzmux1nyTFIJ
 Srzao8+7x2bIXyL9bSwoYa1iBlzgZLp1GKNKhhbtsXeRtiGSXpjf9Q60CFedq/4cfSeR
 KuVw==
X-Gm-Message-State: AFq9FYJi520IYvecupwTFCn0dVRiyKq6DaiApRMENcpeaJzrOYJ3okjL
 DsusH+d26S5Yee5HUe03E+h7+Ls0mI8vgMi91q60TU3we4kwPWb7aVUlQcZsP5aR3BON+r8kMSF
 9NdI1cze+oIWmyGbrrQdUtOFYDLu0N1mWcLGGKknceC/UDExHTMSe2O7YYM3BFHAwiw==
X-Gm-Gg: AYBFou1MM0cG2I7PN5qHz80rXlELBTMUDxOUqUzS6kXbmzZXrkMCREafkD7W8/N0km6
 eGCO237j4J/rPjKu1ImuuvzU4PtbF/39uL72G5hMNoevG5hsk+deXQk9T0bPtX8Fkxwn4j2qhWO
 kXQnuUYDFH5Vyki9Fnk+3AhMX8VlZnxoVQUhMmAWn6O+rvaVnbc7BoeWCaSvJnpEjnhTvPP2sA/
 PJsfDWwv6pZPjBJlp6xe7aVkQpIdJ3e8V3sPTPNQJRCfVtAlKc8m/V3kNbp8qboLHoll+3UaNKh
 98ySFrSW6VvpQ4M3UH81BxO47By/FR6FspoRac8AOQs3vBUocSwWfzximq/H5yAEdD/CG12RaWg
 HP0wwPZuj51Tdp5S1pSBG6NyoFmuSRHZQ0pGQIkTaBPkL8Gq4AzEw9+axGhHMC6GpSAoGfOQsNh
 A7bF3eeOVr+G4b1Zl0Y4kAZMQccNo4xkdcZILRpYOmWFULQZEAcSejzj7CfhKJAx+W0tXPMax/c
 RM=
X-Received: by 2002:a17:903:b50:b0:2e2:d77b:e587 with SMTP id
 d9443c01a7336-2eb0051d151mr47903265ad.18.1793279438852; 
 Thu, 29 Oct 2026 06:10:38 -0700 (PDT)
X-Received: by 2002:a17:903:b50:b0:2e2:d77b:e587 with SMTP id
 d9443c01a7336-2eb0051d151mr47902955ad.18.1793279438264; 
 Thu, 29 Oct 2026 06:10:38 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2eae6bd60desm34467845ad.29.2026.10.29.06.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 06:10:37 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
 qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
Subject: [RFC PATCH v2 2/2] target/riscv: Capture Sspesa sample PC and counter
 ID on overflow
Date: Thu, 29 Oct 2026 18:40:09 +0530
Message-ID: <20261029131011.3715081-3-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029131011.3715081-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261029131011.3715081-1-mayuresh.chitale@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX1+JotB6gyzhj
 vdt7319MfFzOXEtrywpE7IbQOgt4JFo07w2x2fE53LNMxvugJvZoMGsfmv7xrSM0LmPVwa17Qew
 EDthRMYnwWcam+bW4igCLCkWVi6Wts1y0wtXhbLnmB6bZTOcpyQi14qt7kzDg1CS2AsFCKtTxSS
 KlWMk3GRduqg0+7JfJYeKuXrjoVbOetTh53routCWxJH6so7UKG02Hu+yiMMJ/cgVliTgUqEX5q
 j7F0PCsG8+WOJAnRTJHIeFGNdfvLj5d8742yc4QBZ7RVp+St6dYd2yKt8VR0cstOl6erhZ76EWR
 DyB1DqCFnuaPI2xGnK4tVG4DbikYRKfSFh7zn6EaTxQKIxv3FtJmN8Bcdcux93M58veaIsgkXoE
 cj+GRPydXOKLAxlWdZFR0QI1rEcEG6OEfWcZD/LWPpiGdZK7NI6SQ0WChYoTwxTcP8JxYqEbVpV
 7/Q8VyHdA7mRce5AFAQ==
X-Proofpoint-GUID: ArCbUkHKefg9LkmebRC2Lz9QcdOenc_P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA1MSBTYWx0ZWRfX4nhcrPtJib4j
 bQ5VXni34jyI1q5q6T2M39doc1zHuF43rahVF1gCk73+Gv4+yPer7nItvqD64rD5l9Ocj+Y3cZU
 deoXM9g6gN5Bs0ikMwz8rBwrQ5qj0bo=
X-Authority-Analysis: v=2.4 cv=UN9Ijyfy c=1 sm=1 tr=0 ts=6ae345cf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=fAx3W4zVqjXaToMRdlAA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: ArCbUkHKefg9LkmebRC2Lz9QcdOenc_P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
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

Capture shpmspc and shpmsdata just before updating mip.LCOFIP.
As required by the spec, record the current PC, counter ID and effective
privilege mode. When supervisor counter delegation is enabled,
only overflows of delegated counters update the sample CSRs.

Preserve shpmspc and shpmsdata while LCOFIP remains pending so later
overflows do not replace the pending sample. Currently, cntrid is not
updated if two counters overflow simultaneously.

The captured PC is QEMU's current env->pc, so it provides best-effort
attribution rather than guaranteed precise attribution.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 target/riscv/cpu_bits.h |  3 +--
 target/riscv/tcg/pmu.c  | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 61258ce6e1..e99da434d5 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -642,9 +642,8 @@
 #define SHPMSDATA_CNTRID    0x1f
 #define SHPMSDATA_MODE      0x60
 #define SHPMSDATA_V         0x80
-#define SHPMSDATA_MODE_U    0x00
-#define SHPMSDATA_MODE_S    0x20
 #define SHPMSDATA_VALID_MASK (SHPMSDATA_CNTRID | SHPMSDATA_MODE | SHPMSDATA_V)
+#define SHPMSDATA_MODE_SHIFT 5
 
 /* Crypto Extension */
 #define CSR_SEED            0x015
diff --git a/target/riscv/tcg/pmu.c b/target/riscv/tcg/pmu.c
index 1a4658319b..31edd31117 100644
--- a/target/riscv/tcg/pmu.c
+++ b/target/riscv/tcg/pmu.c
@@ -178,6 +178,43 @@ void riscv_pmu_decr_instret(CPURISCVState *env)
     env->pmu_ctrs[2].mhpmcounter_prev++;
 }
 
+static void riscv_pmu_sspesa_capture(CPURISCVState *env, uint32_t ctr_idx)
+{
+    RISCVCPU *cpu = env_archcpu(env);
+    target_ulong sdata;
+    bool cde, ctr_enabled;
+
+    if (!cpu->cfg.ext_sspesa) {
+        return;
+    }
+
+    /*
+     * When supervisor counter delegation is enabled only overflows of
+     * delegated counters update the sample CSRs.
+     */
+    cde = get_field(env->menvcfg, MENVCFG_CDE);
+    ctr_enabled = get_field(env->mcounteren, BIT(ctr_idx));
+    if (cde && !ctr_enabled) {
+        return;
+    }
+
+    sdata = ctr_idx;
+    sdata |= env->priv << SHPMSDATA_MODE_SHIFT;
+    if (env->virt_enabled) {
+        sdata |= SHPMSDATA_V;
+    }
+
+    /*
+     * Only the first overflow that raises LCOFIP updates the sample PC and
+     * metadata.  Currently updating CNTRID on simultaneous overflows is
+     * not supported.
+     */
+    if (!(env->mip & MIP_LCOFIP)) {
+        env->shpmspc = env->pc;
+        env->shpmsdata = sdata;
+    }
+}
+
 int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx)
 {
     uint32_t ctr_idx;
@@ -211,6 +248,7 @@ int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx)
         /* Generate interrupt only if OF bit is clear */
         if (!(env->mhpmevent_val[ctr_idx] & MHPMEVENT_BIT_OF)) {
             env->mhpmevent_val[ctr_idx] |= MHPMEVENT_BIT_OF;
+            riscv_pmu_sspesa_capture(env, ctr_idx);
             riscv_cpu_update_mip(env, MIP_LCOFIP, BOOL_TO_MASK(1));
         }
     } else {
@@ -403,6 +441,7 @@ static void pmu_timer_trigger_irq(RISCVCPU *cpu,
 
     if (cpu->pmu_avail_ctrs & BIT(ctr_idx)) {
         if (pmu_hpmevent_set_of_if_clear(env, ctr_idx)) {
+            riscv_pmu_sspesa_capture(env, ctr_idx);
             riscv_cpu_update_mip(env, MIP_LCOFIP, BOOL_TO_MASK(1));
         }
     }
-- 
2.43.0


