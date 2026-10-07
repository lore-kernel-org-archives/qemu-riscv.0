Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0EACA5FF1
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 09:53:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEOJw-000565-FU; Wed, 07 Oct 2026 05:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEOFC-0000DN-5E
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 05:47:35 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEOFA-0000oH-Cr
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 05:47:25 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6977jhHW1873625
 for <qemu-riscv@nongnu.org>; Wed, 7 Oct 2026 09:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PzzrRY0HRT6VQ6lW6Iw1LMMguX9BxNcGHzzlRRSbAWg=; b=hJD+DbzfpHi7Y5SU
 VTtx4vrsPduNwXUEjSIrsbdVaklEticzSt9Nj+WpfdOy/rVzuAACeyLzk3vFcuO8
 67gRYYsLREfeTmrMBD+GDGVVHaoOcpdCdwh5hlYDtrNKXpsSE55+lBRh2fCanSaS
 Aq/+/wT6I6whc4LgSJ6QVviFaHWfUJKbqP4NxDQ7IGOeLvESYISPvg2RZjD9u5Nx
 mffNFfrnqDpFZvg8Y0GI5UzbqGk+jCR3DP0kzNosrSHW1Eytkw2VAjh8Fk7e0poj
 usPJIyFky1Ne2Q2dV6hnxl7tWXZ5syU3RM0vHJ73JJFv8OrTiUAhBxy9nrOsrTHm
 WQHgNA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fw8rtmj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 09:47:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-532dc3793easo65903221cf.0
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 02:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791366442; x=1791971242; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=PzzrRY0HRT6VQ6lW6Iw1LMMguX9BxNcGHzzlRRSbAWg=;
 b=R7403YbSVVSvsFVxp5q33fsfuSIXCctp2QNgsT1zB7R4zKahS2YQByjZ0eaUFOWudX
 y63E79HsXtK8gXs7Tclxa9rRDkcdUROk22ChOmGPeSB1dkfD5L5pNp1wFLXqZOzbv2S6
 emIdm7dQjcX7g5sc6zuElcymFmWW4kFIvo1Xu85XlPiuJifKM8tuk+c6yeGs1jggfVBC
 9AwxF1KS4xmlCvynkSAYvHncwgdfKQ5jibDuOH5YlV4QR1LaVleOqgaCDPA0DgFaMn2O
 +6LOIx9J9XV4fXf98M2AzB5Kkc2mW6kN72Uv30bCJovrpccs1SU1dGAgY9Z9d1s40B4g
 pUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791366442; x=1791971242;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PzzrRY0HRT6VQ6lW6Iw1LMMguX9BxNcGHzzlRRSbAWg=;
 b=NbiYs/GETsjwYdZqRIQ3r/kiqZRbWIridyl8z5wA1ikB/880Ya95qis4xS9rizZuJT
 Hc3BA32ftd02J2i/fpkUfsdzVowYHRhZutLHRKlpK19detKR6RpVBhUwelU7MX7JiMGd
 /920S8hTqPMEwuQvUWGzm1XLC9eIQBbiGSi5083OWAGhYPrOmZM3WVKEvNdYCHhkLJJk
 LHDTzYCxGG+ogCwfm3kmxSA5E2Gi1MXd0L61PmNn45S5wBCzl3NzS6Rh+oePX+ADW6Kg
 OsXV0NV81GLdxuRiwW8enpFIZjLyzVWQaa76IhlKJljGmPaIum8fDi9UlT0IdMkaxHuE
 KTKA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzlctp1/AE5iSvR5JU71PlKqkwtYKp3lcLlUyujYGhYdyySHjq+EY/0qp7Ob7+c5QV96dmvYe5adZL3@nongnu.org
X-Gm-Message-State: AFuF++k/BSBzyLmJyjJMTgTjNOc0JBorM4fRaRb4XCSyhnWP9cb8rIcS
 ZJVtNxuurfs5cxSYXgkRabFdcKMST4/xTlv7S+1P7JwcTFkak8xcoKrzOEyL/W4FD2jo7+I/iYD
 SImCuY1CW7rBFm3mfaU2YhNkzxFikI0adx+Ei3HQRPWGZK1tFBIikci/0Uw==
X-Gm-Gg: AYBFou1TksSupkVz0Piz3vIP5OQ1Jd7Owj3NwQjw5ULbqnignvx7paw36tKBq1j61xP
 +fyjO+iuXQ1KOfCYiCT6yFW+AsLQwPxcr0D0X0I3co4CqvpYR7Oo74UDKHJb0fN1ISlyOF9rQbb
 wSQJKiuASEMWHndPKq82nsC8UpEFbUS3idCadyiJGO2apdRpZIav49OmFg4MYsMd1bbfqxe4s6A
 GuSc+yvMWz5nh7sC2lIvkXjFnw1etRX7Hby8M0IDfZ5d40T18FCnRvN0B4YF4JxBuRZ/DMniBjc
 00ZaSREkfzQaAJ/PZc1t/6X2dfF0v5scwW3fgx4YByJsuuY70Oavxfb3qzRSn3T3/3hp0YfaPC0
 5tkpkJ4ZJ/nxN+bRpc6keBNWLZz1ANaQCnUvzNbHy
X-Received: by 2002:a05:622a:4204:b0:532:b087:7335 with SMTP id
 d75a77b69052e-5353f41828amr98722131cf.17.1791366441999; 
 Wed, 07 Oct 2026 02:47:21 -0700 (PDT)
X-Received: by 2002:a05:622a:4204:b0:532:b087:7335 with SMTP id
 d75a77b69052e-5353f41828amr98721871cf.17.1791366441560; 
 Wed, 07 Oct 2026 02:47:21 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a17f51ba67sm49755585e9.1.2026.10.07.02.47.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 07 Oct 2026 02:47:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org
Subject: [PATCH 17/27] target/riscv: Register CPUClass::exception_name()
 handler
Date: Wed,  7 Oct 2026 11:45:05 +0200
Message-ID: <20261007094516.75732-18-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007094516.75732-1-philmd@oss.qualcomm.com>
References: <20261007094516.75732-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzOCBTYWx0ZWRfXy4cNApFO7Ecl
 AnqSvxoFQ0WtmtBDiw1xwnq0xYHeBuqvaYI4cNfQNrvmAMXlyjUb7u5574H2nSws7glh7femrJj
 wiWJOqls++lBQZxepZCnotzontiwSaE=
X-Proofpoint-ORIG-GUID: qiy_sU7zjC4onMPUZO26DeDuL8Tirlq5
X-Proofpoint-GUID: qiy_sU7zjC4onMPUZO26DeDuL8Tirlq5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzOCBTYWx0ZWRfX2FeEcJ5+i19W
 cNNn+6veI716ih4vLnFYzawxKZWXQ3uib33dzum7gq3WRg+zVm/+xTC9+5GbfhY5ZXBNCWXQYVg
 wIRwxLC0Nvwj2XYKUXkyCBNXqel5OTzuUpfPpJPd51Wuo08X0fwl4j9TMqBkoh5pP/yT0k2fiyS
 BBiQSPS4H99IZd/mSm5ElDlSvPHAk72BXqUrJEjSpu1Mc3jq8xFj9rSQI2j07Y+nM8I+ufEvvGF
 4o3addIHEkQFIc9o5EBP+MRN1ME7pHGAeFj1Q2Jw3Aq1S5mEILTvjTz7A1WqOmr9sYDpjIvpeVz
 Q3LEdT4gArzjv7wAIaBp1ZuL/ZpmiHA7DoztQgOoLmbzqw4quBKf3jPf65laxbecTXXJhwnope/
 RtJ3u0njT5lNHjVT4O2VVySq1/EmvMhgUNFi4Ny5t9V63ayH4VtrVVaKbQVPIHA61a3+WSmafT0
 P319SdpOKawehgNNRrA==
X-Authority-Analysis: v=2.4 cv=Af0kjHXG c=1 sm=1 tr=0 ts=6ac6152b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=y9j7XMdMAJhvWi9Kj2cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070038
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

Factor riscv_excp_name() and riscv_intr_name() out of
riscv_cpu_get_trap_name(). Register riscv_excp_name()
as the CPUClass::exception_name() handler, so the common
exception logging can resolve RISCV exception codes to names.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/riscv/cpu.h           |  1 +
 target/riscv/cpu.c           | 29 ++++++++++++++++++-----------
 target/riscv/tcg/op_helper.c |  2 +-
 3 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8c8ffe94cd8..61bd0299dde 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -670,6 +670,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 char *riscv_isa_string(RISCVCPU *cpu);
 int riscv_cpu_max_xlen(RISCVCPUClass *mcc);
 bool riscv_cpu_option_set(RISCVCPU *cpu, const char *optname);
+const char *riscv_excp_name(int excp);
 
 #ifndef CONFIG_USER_ONLY
 void riscv_cpu_do_interrupt(CPUState *cpu);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index da4c1a090b9..0f236b0f4b2 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -394,6 +394,14 @@ static const char * const riscv_excp_names[] = {
     [RISCV_EXCP_SEMIHOST] = "semihost",
 };
 
+const char *riscv_excp_name(int excp)
+{
+    if ((excp < ARRAY_SIZE(riscv_excp_names)) && riscv_excp_names[excp]) {
+        return riscv_excp_names[excp];
+    }
+    return "(unknown)";
+}
+
 static const char * const riscv_intr_names[] = {
     [IRQ_U_SOFT] = "u_software",
     [IRQ_S_SOFT] = "s_software",
@@ -411,19 +419,17 @@ static const char * const riscv_intr_names[] = {
     [IRQ_PMU_OVF] = "counter_overflow",
 };
 
+static const char *riscv_intr_name(int intr)
+{
+    if ((intr < ARRAY_SIZE(riscv_intr_names)) && riscv_intr_names[intr]) {
+        return riscv_intr_names[intr];
+    }
+    return "(unknown)";
+}
+
 const char *riscv_cpu_get_trap_name(uint64_t cause, bool async)
 {
-    if (async) {
-        if ((cause < ARRAY_SIZE(riscv_intr_names)) && riscv_intr_names[cause]) {
-            return riscv_intr_names[cause];
-        }
-    } else {
-        if ((cause < ARRAY_SIZE(riscv_excp_names)) && riscv_excp_names[cause]) {
-            return riscv_excp_names[cause];
-        }
-    }
-
-    return "(unknown)";
+    return async ? riscv_intr_name(cause) : riscv_excp_name(cause);
 }
 
 void riscv_cpu_set_misa_ext(CPURISCVState *env, uint32_t ext)
@@ -3039,6 +3045,7 @@ static void riscv_cpu_common_class_init(ObjectClass *c, const void *data)
                                        &mcc->parent_phases);
 
     cc->class_by_name = riscv_cpu_class_by_name;
+    cc->exception_name = riscv_excp_name;
     cc->dump_state = riscv_cpu_dump_state;
     cc->set_pc = riscv_cpu_set_pc;
     cc->get_pc = riscv_cpu_get_pc;
diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index b67c7718db4..ddc603759f2 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -44,7 +44,7 @@ G_NORETURN void riscv_raise_exception(CPURISCVState *env,
     CPUState *cs = env_cpu(env);
 
     trace_riscv_exception(exception,
-                          riscv_cpu_get_trap_name(exception, false),
+                          riscv_excp_name(exception),
                           env->pc);
 
     cs->exception_index = exception;
-- 
2.55.0


