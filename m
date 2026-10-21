Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E858606A321
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 03:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lLCZ8DCO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jGrMHKgK
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJMqz-0000x8-8w; Tue, 20 Oct 2026 23:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMq6-0006wr-O0
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:18:08 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMq3-00038O-Hc
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:18:05 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2me904061147
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 p7RQ7yiqg1Ox1Ti9CPFcdqZ1SQNOTHd0iyzgVVE7fmg=; b=lLCZ8DCOxUTygjmo
 1Yyc5WEPSY7jMdIe+SQLWmIBncvPiTrZAHGqVOg7uG0qwM6FXZYOL7OPefKRpjZu
 z0veRimutgoRMP7CVOEm6kzwrVWpFKcRgZ4ESOfcFNeq3Rl+oVv9nQjO8N2hO6is
 +fCG8vcMMc1qZtOAUUhF6zIIMhszruFbR6YjhiU6S80P7lgAX4eYvjE2uR/iZeS2
 2xSPL1uEc1BFbBvMnipCrkolisOV4Z1JFqyto95GluQF8mBo0Xm98HfEXaeU+vkZ
 SI/Qdg113V1Ei5AeSTzVKI6+eSo8uyfAZjakZM7N8Nm0A5jelDmda6VJnrpAIPcW
 GXRHSQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajhrhn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:17:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-917a7c17166so7465636d6.1
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 20:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552671; x=1793157471; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=p7RQ7yiqg1Ox1Ti9CPFcdqZ1SQNOTHd0iyzgVVE7fmg=;
 b=jGrMHKgKIpu2WPptTNkqBAYf5DZY+6PYYju1Nn0BaSk39bmOLfRecD8bpC4qrNzOL0
 TReQ0Ok2LPcrAJ8VHWylJNx/1kVS9tPyzJjO+Nc94drod4jYPBspHyJ8+dzVLRB6BOF/
 5N50DAaXstbb3+runYDD5ZZ82RrdiJ1e5N1gwoV6DibKHDN4AN3WTtLhHeHvxL3kje/E
 Qp2yGfpQnNM4y1u8F9nAi2YoEy2tYFCB4kOEsPIp3mMW3y+4brQW7PqcW52cxGlapftb
 SO8cb8T/Ywdcwh52aiFgP7OGWZ6E4ReMWX+49oEFuwprNVOx+tcgcyQCTBJCNhfy6kEl
 KwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552671; x=1793157471;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=p7RQ7yiqg1Ox1Ti9CPFcdqZ1SQNOTHd0iyzgVVE7fmg=;
 b=y8oZ9UhxytVkRe6jEDflUoAODAdu3R1zDVFEwRtDBYEjp1jRkerheGC1/5gdvTCjIb
 4euQ28UhBT0yLk36WfjHZRMjc/vK+8qqcMoz3TgKGsweKUmE/B7lUzpHqcyLd//sWobA
 CBepL85Xd7xU9kQafeTzCHtUus1w6yZCIihrIo3hvHcuJZs0hDGcXUkb7NVOffCsbciu
 ezUSsmcARS5N5r9o2AmMkh29kSnSkywrx9aQBfshybJwBDqkmwNwPhcu7RT0f1NXwtMj
 OEuYxoQtRweMUV1EIwxI4tOj0hYGWPrZ+Ka0SRInpPg5dR9IjiSsItcBGKrJmazKWmbE
 fHyw==
X-Forwarded-Encrypted: i=1;
 AKwUvBw9DUZGryeHYQKid6ytzobFAYjpJPDdk4uOSIgE4WnU1aI2mC/ugXk7Kz0vFUneRewLmWtRMsj8ZlgX@nongnu.org
X-Gm-Message-State: AFq9FYJABgeZIT9n5Th39QqxwE3y9cCMly77LMjxzUjCy/khbCf4KScd
 dvvh3epGnSJtSPAm0Zlh/EcIb4YMG/6RxdSOyWIXoee4vm9I1XH+cW9S7fQnzlfPx/yhFEJ22Jp
 u2ALImV+Czn8+f9ek68nGrx/SxSWFnrO1ACYhULUvCOzFWGmDQ2t6vM2kBQ==
X-Gm-Gg: AYBFou1/ed69w7wJLBO/o2EjHlW29YZ5ELQXhqHlB242v8EyOYbdgRgRcPilDoO9Eno
 tCkWIMJqyOiLjS+3JRzScV8wTW0jScP3CsIDpn4Hm8eyILuHTKentM/Scf9uO+90mISp/zPb6RP
 6+asCrm27kaYjYf9z3lQ2GttWRrv4Ec+Bn+n0G44Zy6KjRjZbeDdatSsohkRnAGkZ5IEZLSR134
 D32vXSok1Sh4R6IisR7UIk2WnQ75IKNbKim8YwYnt4JRZyf99OFjuyRVvpZDoAAf/2r6egJdUTX
 G+4vKsFhjKvgC2hzZ0IOlh9PhagarLbpe5g0ns0FxqFNF08bOvD0Hgi0L6kRCw81bE4l2fsC1UM
 VyZbObPvQTDosu49UPeFPk1wO9SVMCU5dNjop0WN+
X-Received: by 2002:a05:620a:2788:b0:93a:13aa:1b9 with SMTP id
 af79cd13be357-93f57f1c945mr220871285a.30.1792552671525; 
 Tue, 20 Oct 2026 20:17:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2788:b0:93a:13aa:1b9 with SMTP id
 af79cd13be357-93f57f1c945mr220869485a.30.1792552671048; 
 Tue, 20 Oct 2026 20:17:51 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e254f0bc2sm2442908f8f.1.2026.10.20.20.17.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:17:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 28/33] target/sh4: Register CPUClass::exception_name()
 handler
Date: Wed, 21 Oct 2026 05:14:01 +0200
Message-ID: <20261021031407.24862-29-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfXwZajrHPbDFLV
 8cBdE7o62QQBNJHOZuwr2oav63U5cq8lKZCUAjeTPf/jieGRqexsQzjkBt2HJ5gjsh/nBlUBAu2
 HXSCQ1+njhov+vjWhO4IzfiJ/pNbvF/HbgBPM0RJAGtM5KQh06hkjGxRF8U8LegduYHFetH0rLf
 E2AsIIiDz+LClPE7LuKw7PvQy0bBgf1sMVqU1g4CS/oeFowXdGq2zWL2Ug50YiLPeCkk4jNOb3Y
 zoPMmodyH1auFobwVokIj/VkOHzQTAmFptzpXCbjZPz6h1oESc8LByucM7gUUPpKQfPP49bC3+4
 ev49ggFKWtNk5ccynfvY2wp1AoDUkiOGGnquq1EqSIzU6hIzWaP2GlwT1eWVvuyW6By29xc1XD3
 e/RecUbdD9Yc1Gprnb/KQcf+FrmD2vFfEeNV91eHOg4jmCH/L/9nFncs5DUXOoZ/qAIpo1od62j
 TguAaCWJTH8zGHhgrkA==
X-Proofpoint-GUID: j3DEXM53cCkaEb3EbQzX384-YrvlVZkA
X-Proofpoint-ORIG-GUID: j3DEXM53cCkaEb3EbQzX384-YrvlVZkA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX+aju6/qFOSFe
 NfKtheFQoK2qkWIuWELYlmWwQJD0SODS/OEtfaQQS2q/wn+sLB2ZFpuq5JiiaTMFh4kTWwzikeq
 e83uuVN2Jihk8frgjMRjNSMcbYv8LQQ=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad82ee0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1bLhyRm5UWLPkFMrcSkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210012
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Factor sh4_exception_name() out of superh_cpu_do_interrupt()
and register it as the CPUClass::exception_name() handler,
so the common exception logging can resolve SH-4 exception
codes to names.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/sh4/cpu.h    |   1 +
 target/sh4/cpu.c    |   1 +
 target/sh4/helper.c | 101 +++++++++++++++++++++++---------------------
 3 files changed, 56 insertions(+), 47 deletions(-)

diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index a1e9049b7be..94f2f1278b9 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -258,6 +258,7 @@ struct SuperHCPUClass {
     uint32_t cvr;
 };
 
+const char *sh4_exception_name(int excp);
 void superh_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 int superh_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int superh_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 3bbdee301d5..97a718c3911 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -334,6 +334,7 @@ static void superh_cpu_class_init(ObjectClass *oc, const void *data)
                                        &scc->parent_phases);
 
     cc->class_by_name = superh_cpu_class_by_name;
+    cc->exception_name = sh4_exception_name;
     cc->dump_state = superh_cpu_dump_state;
     cc->set_pc = superh_cpu_set_pc;
     cc->get_pc = superh_cpu_get_pc;
diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index 0fbd613f333..5856bab6983 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -47,6 +47,58 @@
 #define MMU_DADDR_ERROR_READ     (-12)
 #define MMU_DADDR_ERROR_WRITE    (-13)
 
+const char *sh4_exception_name(int excp)
+{
+    const char *name;
+
+    switch (excp) {
+    case SH4_EXCP_ADDR_ERROR:
+        name = "addr_error";
+        break;
+    case SH4_EXCP_TLB_MISS:
+        name = "tlb_miss";
+        break;
+    case SH4_EXCP_TLB_VIOLATION:
+        name = "tlb_violation";
+        break;
+    case SH4_EXCP_ILLEGAL_INSTRUCTION:
+        name = "illegal_instruction";
+        break;
+    case SH4_EXCP_SLOT_ILLEGAL_INSTRUCTION:
+        name = "slot_illegal_instruction";
+        break;
+    case SH4_EXCP_FPU_DISABLE:
+        name = "fpu_disable";
+        break;
+    case SH4_EXCP_SLOT_FPU_DISABLE:
+        name = "slot_fpu";
+        break;
+    case SH4_EXCP_DATA_WRITE:
+        name = "data_write";
+        break;
+    case SH4_EXCP_DTLB_MISS_WRITE:
+        name = "dtlb_miss_write";
+        break;
+    case SH4_EXCP_DTLB_VIOLATION_WRITE:
+        name = "dtlb_violation_write";
+        break;
+    case SH4_EXCP_FPU:
+        name = "fpu_exception";
+        break;
+    case SH4_EXCP_INITIAL_PAGE_WRITE:
+        name = "initial_page_write";
+        break;
+    case SH4_EXCP_TRAPA:
+        name = "trapa";
+        break;
+    default:
+        name = "???";
+        break;
+    }
+
+    return name;
+}
+
 #if defined(CONFIG_USER_ONLY)
 
 int cpu_sh4_is_cached(CPUSH4State *env, uint32_t addr)
@@ -95,53 +147,8 @@ void superh_cpu_do_interrupt(CPUState *cs)
     }
 
     if (qemu_loglevel_mask(CPU_LOG_INT)) {
-        const char *expname;
-        switch (cs->exception_index) {
-        case SH4_EXCP_ADDR_ERROR:
-            expname = "addr_error";
-            break;
-        case SH4_EXCP_TLB_MISS:
-            expname = "tlb_miss";
-            break;
-        case SH4_EXCP_TLB_VIOLATION:
-            expname = "tlb_violation";
-            break;
-        case SH4_EXCP_ILLEGAL_INSTRUCTION:
-            expname = "illegal_instruction";
-            break;
-        case SH4_EXCP_SLOT_ILLEGAL_INSTRUCTION:
-            expname = "slot_illegal_instruction";
-            break;
-        case SH4_EXCP_FPU_DISABLE:
-            expname = "fpu_disable";
-            break;
-        case SH4_EXCP_SLOT_FPU_DISABLE:
-            expname = "slot_fpu";
-            break;
-        case SH4_EXCP_DATA_WRITE:
-            expname = "data_write";
-            break;
-        case SH4_EXCP_DTLB_MISS_WRITE:
-            expname = "dtlb_miss_write";
-            break;
-        case SH4_EXCP_DTLB_VIOLATION_WRITE:
-            expname = "dtlb_violation_write";
-            break;
-        case SH4_EXCP_FPU:
-            expname = "fpu_exception";
-            break;
-        case SH4_EXCP_INITIAL_PAGE_WRITE:
-            expname = "initial_page_write";
-            break;
-        case SH4_EXCP_TRAPA:
-            expname = "trapa";
-            break;
-        default:
-            expname = do_irq ? "interrupt" : "???";
-            break;
-        }
-        qemu_log("exception 0x%03x [%s] raised\n",
-                  irq_vector, expname);
+        qemu_log("exception 0x%03x [%s] raised\n", irq_vector,
+                 do_irq ? "interrupt" : sh4_exception_name(cs->exception_index));
         log_cpu_state(cs, 0);
     }
 
-- 
2.55.0


