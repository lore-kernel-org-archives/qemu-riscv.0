Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA290606A31A
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 03:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C3NvxhqN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b8kmINLq
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJMnF-0002qo-Ts; Tue, 20 Oct 2026 23:15:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMn1-0002mO-Oj
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:14:58 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMn0-0002Qu-2R
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:14:55 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2EuWS3469271
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 POX/WJTfRTtj1QzagZdqMLjkjh6Nnt7ofKB6ovVu0AM=; b=C3NvxhqNFEPpSP59
 mPIo7kpDhTVHp68q46OvB2S72eK1hYMNKDBanL7C6bxDpgr/zpKd/sqaOXPYu9jG
 7HOa85LuK2LYVs/Qx5MMrT8QzoFajkdxz9cCPHVaT/w267GawgM9LvGyIykVpuGo
 RcoHZDwN8akAiQ3vZY7TZdm34sAkqMefhg2P0wno89Zbr/phEk0gYkaDxoF5xZrz
 4FfICWvVqfNulQc8fALg6lEPdTrAhNOkWuoJ41uTLdo4+k30wmyCbltsLeyb+ol8
 JHImfURkK05+NDOaF8DVcWovNpXnrpm9BkrD7P9PEOlB8NeEIAW2RuU7o5bWXP/I
 hdjZJw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2ba4d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:14:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93f559420f3so33624985a.0
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 20:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552482; x=1793157282; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=POX/WJTfRTtj1QzagZdqMLjkjh6Nnt7ofKB6ovVu0AM=;
 b=b8kmINLq1mggIux/Rw0hyh21+2lUgIrkPziiDeDvuez7DZtMi0KFtx+dKWy+ymOcqY
 1RDrpuW+UnO5vVs/eUI932CnqHS4Ak/1DS7Yncl7cvL1a4zZAYGWoviwL9mYkZXPiVgh
 r1/AUaOV0hk8Rvvi1/kaLUhS4vJR9X0ZDEKXetgqiMJhdZi5BKVw6wF+C+jBIOaKxpbL
 MZ+3PxecuTOjcrH+WAwoaf9zDIIIEoyDBVFV7FVxX0xdwxav5q2zF4By3PRIT8ARtyzs
 PWiBvusNHvSPiGipvN6N4cdSnxbsktOuOoze4lvWUtmYRThTMPNG3hwOcWs2cCgWXSTJ
 ju4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552482; x=1793157282;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=POX/WJTfRTtj1QzagZdqMLjkjh6Nnt7ofKB6ovVu0AM=;
 b=MoEX04PIo1Kz6OgdHsGvdlycy3AQi1rlZBvHog1/Xb34ZQePuxDsmagDqfhak41nQ9
 /vBSu+tu4SzVfhd+WC3OHLdlU4kqsffcpjUkWnURLxTM8XAaGV6Plz++5AFNWK/sPGAr
 /dNNgj0UfNLNxftRXLXC+pUcEUP9Skk+rbESgmIq/Du4u1WPjiVUsFTW2IJBlKJlrkgz
 lL6+XuBboNV3Pd+WvCNSKok43JQ7SE4u5O3+izq6TCT3QsFwa7MbySqW0W9keTi103ig
 txPThcKqQ7gGuXVjHEFyC/gUKA7/cx38seQFTWg4b4WBc2nhZ/ghcjK/PWHIbqO2uZVC
 L2ww==
X-Forwarded-Encrypted: i=1;
 AKwUvBxjfcOLczEikPEi9SabYILKHbTmtY28JI+gbxrPQE9jY0uNvr+tp0SwambM7RXITW59qInu4UKWTsRm@nongnu.org
X-Gm-Message-State: AFq9FYJpiHM20bcTnVsNWmkbjwugHIhlLlhMpp6Y6NIqix10ip6JuJJE
 7UXwAz0KSFeB9/rSi4x6zIk/ShBHs1x67Emhz3/1WyedQszoGSlmA7Rhdo4O/mkZPHzadGIb6Zk
 45tCUwhm0eHPnewH/RGgRXwAtyqTF9EUFTGVZJ8LrRmsFW9jAyUoa0qOjig==
X-Gm-Gg: AYBFou1f/NTuGD2sq0nGXB2QxU7tvkTJhwGkXtjJaUrcMselFAlAuZzwbHraSQJMNAS
 QP9X18IYiK5FRCRXk+3Uj6iEFFFPzXg8FdfMNnjf/ZuL3TmhCwPN70yukl/lE2wfu1e5RN3gEcY
 cnomgAPYg2mIcBC0nKH9O9Gyn4aWMdodhY+T0qh8vI4dSl6qp5BmtmbQ6Bn0fmXRdm5Jsal9es1
 pCrjTy5eq4cjbPxG768fICQb5ckvC5EaC/qXhJZGyrSopOxr9Zh9Gx4v2qEJunExmJ6Dmhg4n4D
 21lzvF1tiApJxrQYkxBFJ5hOHRzG/kTLSXscRolsP+30aMF8XCCOC5mz/vqvdYOrYN36qWjNV4l
 lr2qiMisf1K0G5Cin2hvyi99D3J/11FqBth9w611w
X-Received: by 2002:a05:620a:17ac:b0:93f:2cf4:e6dd with SMTP id
 af79cd13be357-93f57f935abmr222677185a.51.1792552481549; 
 Tue, 20 Oct 2026 20:14:41 -0700 (PDT)
X-Received: by 2002:a05:620a:17ac:b0:93f:2cf4:e6dd with SMTP id
 af79cd13be357-93f57f935abmr222674885a.51.1792552481017; 
 Tue, 20 Oct 2026 20:14:41 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e25834086sm2450046f8f.34.2026.10.20.20.14.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:14:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 04/33] target/alpha: Register CPUClass::exception_name()
 handler
Date: Wed, 21 Oct 2026 05:13:37 +0200
Message-ID: <20261021031407.24862-5-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uYYKuNIjgAo8-4BGcx3cGw1XRdJX_PTd
X-Proofpoint-ORIG-GUID: uYYKuNIjgAo8-4BGcx3cGw1XRdJX_PTd
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad82e22 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=kVf6GzFcR4OVXmdlW0QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX1Gtv0ns0JwwD
 0u23b6momtT+ZqgNz6jf9Dpo4eCKr8nVaB2ee3yRu+LHAYKej4c1DcfFFHDcMQg1eQrVabOgxka
 jTO+C5hvcayW8CJKhuH6ys1FlGkqm98=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX/9cOEOibmQha
 dLY1Y/trXWRc8+4SFvJoZOnFOYp2c/7GtoI7fXHVVwpRi6FUJJpdX+pDk3+oC2mov7Sa78R6au1
 OB7SH5L57U2uDYoj6dP0DwB1nDeT25Iw/y3vSg3jAAJxW3vkqQPNvbW2yBqLqlBBG8pSZHYGEi+
 SpT0oOwqQK5WXppEG6HSzZvuOXn+XZfZCZCEfLz9LDoIBBXGdHULBQpczwWUEH+XZt+iutSLAWU
 O3L6xlfEewOZ5rWJXyCpBzAByNbg2TqU8mjRUAuXUXdj+d6E1c5mnnISJNnlKm0zoE3HMOtMVx+
 brrgRhUh2zcRzm4pVDO/HICV4GCJPlYlFoMCRTGZdq2chhyW8CD4fb1NuKxGjun7jYK2I7bFxBg
 U5fdMuBliOEa/pj99fH6m2qjx/RaBXPCMZk+SixnkFL20op89hDZO5tCrBOyqjbTO4kmjFnimCK
 pAUTuJOymQVSnZFXNDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210012
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Factor alpha_exception_name() out of alpha_cpu_do_interrupt()
and register it as the CPUClass::exception_name() handler, so
the common exception logging can resolve Alpha exception codes
to names.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/alpha/cpu.h    |  1 +
 target/alpha/cpu.c    |  1 +
 target/alpha/helper.c | 82 ++++++++++++++++++++++++-------------------
 3 files changed, 48 insertions(+), 36 deletions(-)

diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 378bd96d941..8f780502476 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -284,6 +284,7 @@ void alpha_cpu_do_interrupt(CPUState *cpu);
 bool alpha_cpu_exec_interrupt(CPUState *cpu, int int_req);
 hwaddr alpha_cpu_get_phys_addr_debug(CPUState *cpu, vaddr addr);
 #endif /* !CONFIG_USER_ONLY */
+const char *alpha_exception_name(int exception);
 void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags);
 int alpha_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 12e86021663..f9936315fa2 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -283,6 +283,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, const void *data)
                                     &acc->parent_realize);
 
     cc->class_by_name = alpha_cpu_class_by_name;
+    cc->exception_name = alpha_exception_name;
     cc->dump_state = alpha_cpu_dump_state;
     cc->set_pc = alpha_cpu_set_pc;
     cc->get_pc = alpha_cpu_get_pc;
diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index c3614ecafda..cedb0006892 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -35,6 +35,51 @@
 #define CONVERT_BIT(X, SRC, DST) \
     (SRC > DST ? (X) / (SRC / DST) & (DST) : ((X) & SRC) * (DST / SRC))
 
+const char *alpha_exception_name(int excp)
+{
+    const char *name;
+
+    switch (excp) {
+    case EXCP_RESET:
+        name = "reset";
+        break;
+    case EXCP_MCHK:
+        name = "mchk";
+        break;
+    case EXCP_SMP_INTERRUPT:
+        name = "smp_interrupt";
+        break;
+    case EXCP_CLK_INTERRUPT:
+        name = "clk_interrupt";
+        break;
+    case EXCP_DEV_INTERRUPT:
+        name = "dev_interrupt";
+        break;
+    case EXCP_MMFAULT:
+        name = "mmfault";
+        break;
+    case EXCP_UNALIGN:
+        name = "unalign";
+        break;
+    case EXCP_OPCDEC:
+        name = "opcdec";
+        break;
+    case EXCP_ARITH:
+        name = "arith";
+        break;
+    case EXCP_FEN:
+        name = "fen";
+        break;
+    case EXCP_CALL_PAL:
+        name = "call_pal";
+        break;
+    default:
+        name = "<unknown>";
+        break;
+    }
+    return name;
+}
+
 uint64_t cpu_alpha_load_fpcr(CPUAlphaState *env)
 {
     return (uint64_t)env->fpcr << 32;
@@ -343,43 +388,8 @@ void alpha_cpu_do_interrupt(CPUState *cs)
 
     if (qemu_loglevel_mask(CPU_LOG_INT)) {
         static int count;
-        const char *name = "<unknown>";
+        const char *name = alpha_exception_name(i);
 
-        switch (i) {
-        case EXCP_RESET:
-            name = "reset";
-            break;
-        case EXCP_MCHK:
-            name = "mchk";
-            break;
-        case EXCP_SMP_INTERRUPT:
-            name = "smp_interrupt";
-            break;
-        case EXCP_CLK_INTERRUPT:
-            name = "clk_interrupt";
-            break;
-        case EXCP_DEV_INTERRUPT:
-            name = "dev_interrupt";
-            break;
-        case EXCP_MMFAULT:
-            name = "mmfault";
-            break;
-        case EXCP_UNALIGN:
-            name = "unalign";
-            break;
-        case EXCP_OPCDEC:
-            name = "opcdec";
-            break;
-        case EXCP_ARITH:
-            name = "arith";
-            break;
-        case EXCP_FEN:
-            name = "fen";
-            break;
-        case EXCP_CALL_PAL:
-            name = "call_pal";
-            break;
-        }
         qemu_log("INT %6d: %s(%#x) cpu=%d pc=%016"
                  PRIx64 " sp=%016" PRIx64 "\n",
                  ++count, name, env->error_code, cs->cpu_index,
-- 
2.55.0


