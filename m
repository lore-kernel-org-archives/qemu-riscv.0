Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A325C61CE2
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 11:19:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wySiM-0006Gf-JD; Mon, 24 Aug 2026 07:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySiK-00066p-Ic
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:19:40 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySiH-00065P-6B
 for qemu-riscv@nongnu.org; Mon, 24 Aug 2026 07:19:40 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O99Awl2547842
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ujtZfmyEeRuspxcgfhS3V2xIrt3RbrmKuzrHykBSXQI=; b=AHxmfqXpB7AjiZDx
 0DUn0ESZzsAcRKKe6Rc+FhEpEBAIjjS9U0xNHbWN1igOfB//1P3NAhOUsXfK5408
 9qEi1fqx+QmrzEcAhfdj/am2mkttgQUlrm9gjXGBC4zFlR8DnSUS0bXXyOkKHn1w
 rs3njST4jSo+ZYzklKEXygDlOTdYAnvqMN3igy1Gz1vHu3mOFMiFjJ1qUrPE2j4O
 DhqT0uoPwUJ5UwNJ9fxwvdTC57UspkJBs09nwZxM36b+WpqbLrSyfXQexukE2V/v
 D44Fkb9yQQrAJd0C55ZlKJtiEUuoXfwK+UtfMI3zJFvr2Icj4nXC0pTvqb1pLT8e
 B3StUQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7jd0e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 11:19:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-52d7b3b6aa2so42442851cf.1
 for <qemu-riscv@nongnu.org>; Mon, 24 Aug 2026 04:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787570365; x=1788175165; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ujtZfmyEeRuspxcgfhS3V2xIrt3RbrmKuzrHykBSXQI=;
 b=iGJsll09OQf2b+bqhV1Ev3CwJQ81xb3dUb6sK5zaDKyZmBjpW641QN8vKy6fRazfLU
 AuG1K1kPXm9NPfEBi9ETjKX1abtGwDRzrfvSwFeUBBpsi8497TWIACh5VKHypDKM4iLf
 82gx1PGvP2xxOtPDYXHHIDGV1m9OIdn5tYMK3Cauc/fWtpjLb9juAJtZ4AOaL1pt+S9P
 nGUdp6qDgtgxqcOol6JdCTytA2G1vN/QtJATgCZd4PawqiYCVKrXzzJh5k0wunR/lkAF
 bS2XdVKS3/eEDhgxS+J86SqgaXqB2a+vQvSq0aMsn+wO8d1EhFRKK6IFybFqQz9CydM8
 XpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787570365; x=1788175165;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ujtZfmyEeRuspxcgfhS3V2xIrt3RbrmKuzrHykBSXQI=;
 b=VGyYnr5FgYah7HPUfQdn1aV7hcoAl9luYEO9A+UBtuA6pnKFya7GiRTu+qGE/4IIoc
 0eX27BorNfNO5sPw2t6UPYdIs+r54QYosDFFhjbIP2SnhEWTj9HPR40cnazjH2q96BM6
 maqPR2AM5ECAi+bXhd5psRpLzoa5GtuVs3hHDSEsOV9TSi6uipNOhJyPCnz1GA20Veuf
 r0bd9Y5nq4HDwkwpnGCmZIMX4kbU1BeQs4qmPQ+hlgF5FKt4sFxeY3XtCbBc6C2Kew+z
 eDvL/qIFZg7wbslM728P5xkjlKcNnBkTaCgAfaZEiG4I6i+i7CzRWuqiUBMCU/rQJCnR
 6Ojg==
X-Gm-Message-State: AFuF++mJ8YQugyQqRPTjVDei/RvJAVlHAKYoLRVLD7+WIZbDdtmGA5N3
 r8CVmbALGs1Zb75jzX1vW9xwOCObslpG7FYQSO1iezXUcJMEfb9R2Ykb0R+Y+oyQe+67aiVZCis
 B1g+iEjNejudYWAR1bemGtKF46UFaXozpKiVcRiID6d+qel+G8u/+jbyI97NGJhPXAQ==
X-Gm-Gg: AR+sD119ZgGTpebPy+sCXLvRRj/RG1c1bW33RLAOHVQDkBXOL1vVXX6EwZeCEeWGnmg
 C513ZFK460VJ/+ac1PZqGiLA+zCRu3jAj4FXUJ1TqgsrIbUrt3E5Z1s4zWlfcvGme0HybSu7+xa
 Vt0MycAFj9eyHRAbi2VAn6P7dB+qNe07NRyS3nBPAMIO3qLKHTpYRz+Ja6XNNHQLN0lnHnbsoEQ
 hzfeDuIiC8qQIjjVlXputucf0n+dr6zCmQUxn7ffhzkXATOZSe4F7XoszQ7XSHWpBI/tuNUHpFe
 mrTSVO+0m0QNErSpRO7LIRpMGEDAqrBqWqltZJPHfv84zjxoq8vN6+0fD8FXzr9og7MiLpeRqgb
 VFKWiCtQ76dAIic0UGB1am/WSVG/cxudLAmTcjVgp1ksKw+daYQ==
X-Received: by 2002:a05:622a:5816:b0:51f:20e1:137f with SMTP id
 d75a77b69052e-52df5766f0cmr266544231cf.19.1787570364549; 
 Mon, 24 Aug 2026 04:19:24 -0700 (PDT)
X-Received: by 2002:a05:622a:5816:b0:51f:20e1:137f with SMTP id
 d75a77b69052e-52df5766f0cmr266543841cf.19.1787570364172; 
 Mon, 24 Aug 2026 04:19:24 -0700 (PDT)
Received: from localhost.localdomain (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249606a8fasm1348981266b.8.2026.08.24.04.19.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Aug 2026 04:19:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>
Subject: [PATCH v4 12/20] target/mips: Constify CPUMIPSState for various
 cpu_*() getters
Date: Mon, 24 Aug 2026 13:17:01 +0200
Message-ID: <20260824111711.26297-13-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824111711.26297-1-philmd@oss.qualcomm.com>
References: <20260824111711.26297-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8c28bd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=h4i2fRRWLofFFTjKLt8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfXyHfU+Nl/Rtju
 QcWLhCp2ryHdOAARzG06PTcG5wp5oHZ3gfrK+6ID6Q1apUWgKKadrpn/d/TBaDQ+dry4CMkl0NN
 BYPbyoY3pvd7j6LbjiEtyPE7DrOeaao=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfXzgsyKBgcQTTc
 mM9N5KnopqSLkmOYIKK9Q2p5Gj9hWC4wTcC4ishLp6hXIYv6katzb2DAbNUYEg2R3KxyEWPE54V
 G105ZkHLKIP0fwphtx86qEO/o4/FR0d/9j62NKzhwcYdwoI5NvhfrGq+DqAiu/7sNdGIOcbHkG5
 gAZgKLNIR1PfjGe1c4q3ZC2CZRMrTSEPZ+LWN0qQycFngxrSGT/dfoDYPwEsLd5hP9NKRiqMbMq
 9jouQmQDAR7qPiT2SnElGzFG9foMC1TJIM92EX7CSOQYX0NA/ZSptwUNEpHrqcgAl7ws+XLM8hW
 cYEONny1ei5cHnFPN5A+Ks6F4YC7hhQqdrD2OGQ4ewMlOYvt7dXOPOOQUBeDQX9e5HObBx95/ih
 src/eQpVKan9mM0KF3+56z1BMSzsOP2+U/IabfM+CtficusrTAReIYil+8TkgyaCPlMr+OzyZhG
 afBq8WcuctUb2gDTL9A==
X-Proofpoint-ORIG-GUID: yZLaw3rxfC-5KW7teHpmXBDv9g1BLu6b
X-Proofpoint-GUID: yZLaw3rxfC-5KW7teHpmXBDv9g1BLu6b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240094
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Add the const qualifier to CPUMIPSState when
the argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 target/mips/cpu.h      |  8 ++++----
 target/mips/internal.h | 10 +++++-----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 319147a948c..32549791a18 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1300,7 +1300,7 @@ static inline int hflags_mmu_index(uint32_t hflags)
     }
 }
 
-static inline int mips_env_mmu_index(CPUMIPSState *env)
+static inline int mips_env_mmu_index(const CPUMIPSState *env)
 {
     return hflags_mmu_index(env->hflags);
 }
@@ -1372,19 +1372,19 @@ static inline bool ase_3d_available(const CPUMIPSState *env)
 }
 
 /* Check presence of MSA implementation */
-static inline bool ase_msa_available(CPUMIPSState *env)
+static inline bool ase_msa_available(const CPUMIPSState *env)
 {
     return env->CP0_Config3 & (1 << CP0C3_MSAP);
 }
 
 /* Check presence of Loongson CSR instructions */
-static inline bool ase_lcsr_available(CPUMIPSState *env)
+static inline bool ase_lcsr_available(const CPUMIPSState *env)
 {
     return env->lcsr_cpucfg2 & (1 << CPUCFG2_LCSRP);
 }
 
 /* Check presence of multi-threading ASE implementation */
-static inline bool ase_mt_available(CPUMIPSState *env)
+static inline bool ase_mt_available(const CPUMIPSState *env)
 {
     return env->CP0_Config3 & (1 << CP0C3_MT);
 }
diff --git a/target/mips/internal.h b/target/mips/internal.h
index c5c286872eb..7dba22300b1 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -165,7 +165,7 @@ void cpu_mips_store_cause(CPUMIPSState *env, target_ulong val);
 
 extern const VMStateDescription vmstate_mips_cpu;
 
-static inline bool cpu_mips_hw_interrupts_enabled(CPUMIPSState *env)
+static inline bool cpu_mips_hw_interrupts_enabled(const CPUMIPSState *env)
 {
     return (env->CP0_Status & (1 << CP0St_IE)) &&
         !(env->CP0_Status & (1 << CP0St_EXL)) &&
@@ -180,7 +180,7 @@ static inline bool cpu_mips_hw_interrupts_enabled(CPUMIPSState *env)
 }
 
 /* Check if there is pending and not masked out interrupt */
-static inline bool cpu_mips_hw_interrupts_pending(CPUMIPSState *env)
+static inline bool cpu_mips_hw_interrupts_pending(const CPUMIPSState *env)
 {
     int32_t pending;
     int32_t status;
@@ -247,9 +247,9 @@ static inline void restore_pamask(CPUMIPSState *env)
     }
 }
 
-static inline int mips_vpe_active(CPUMIPSState *env)
+static inline int mips_vpe_active(const CPUMIPSState *env)
 {
-    MIPSCPU *cpu = env_archcpu(env);
+    const MIPSCPU *cpu = env_archcpu(env);
     int active = 1;
 
     /* Check that the VPE is enabled.  */
@@ -281,7 +281,7 @@ static inline int mips_vpe_active(CPUMIPSState *env)
     return active;
 }
 
-static inline int mips_vp_active(CPUMIPSState *env)
+static inline int mips_vp_active(const CPUMIPSState *env)
 {
     CPUState *cs;
 
-- 
2.53.0


