Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11586070975
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 03:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XJ0SyRc7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jmk23Fl/
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJMn0-0002lZ-8P; Tue, 20 Oct 2026 23:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMmu-0002gu-Ll
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:14:49 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMms-0002Q4-3p
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:14:48 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2FVH81957111
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HJHtdVy5wVxjfhiD2204eyvZWcyoZdZQUrEb1ToGTMw=; b=XJ0SyRc75PL9B26I
 9DRVFMCLNzNkigtjSeuveIqW0wrfhRZqXRy2EI0WU/QQpeNgAus/4Y0gT+S1Bk9d
 2NfoX35MJdBet1wnvkuvrJ1dLn4eMyf+vbqtlHCUY+XxS7++hZ2UpFQSo618uowN
 FDjb4aT/q9JPJVqHOrXkMHbz85U5/sJOlMBw9SPUpmwUtmmqUrvgJJE+u5Y6Nwef
 Iqd+vnr9L5K7M0dvq/9YcW1qkOvNedl67xjQ0Kt8VHWZkxjnqYneho0SaZR5RZkV
 i1wJPtdCorKeIWS6/hkwcrrelvrDKUUhu4+FHDbFoCWXP9iS9vZpobuGzJOQi8Db
 xoj76Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hvb6jf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:14:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93f2373e9b4so34369785a.1
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 20:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552473; x=1793157273; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=HJHtdVy5wVxjfhiD2204eyvZWcyoZdZQUrEb1ToGTMw=;
 b=Jmk23Fl/cpG14cVideIl7m5Xu0FGzcAvzYPCZBt785Qgyz8BPYwBEZ3rGXmF/MuEiT
 VdujIQwqpDvHsVmsh6k8JS9qK7Fotv7lJqZParPQSna6e0baOjzSg/2a69hP31FODJRM
 YSwJSf7pSXkC2NYEFzpnDEXFPyWZRVl9rvBHBWihFN3n+O+X2KS3ekRqYLJJRS3AxDyr
 XjtXgRFfE2opHf0t7M4VT6pjDEWHdoBAcHDRWa08S1nul56r6R6nRFC6Hv8vIEKbfuSV
 HeKUb9CtVXywPnHVD/XmIOGTtP9w/5/8x6eSQW3rVMWpuxzxly0fm9WT+wjwQz7F/j9S
 tvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552473; x=1793157273;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=HJHtdVy5wVxjfhiD2204eyvZWcyoZdZQUrEb1ToGTMw=;
 b=VCmUax371TBJHbgwWCw9UYygogrKGf+lLLF1SC4A61PtV9Q6oB9TYRDzCmz03MK8qA
 4L20kGgQDP8uoQzrxPvT1OIpvgI4wSjjce6usfVCwQdx5Mmo5Rnp4w/YbaKYdbY5Yxxh
 6edYe7FID3kDtz6WLOvBmJE1jBsPh1ly8uwmrVvQhzQmtp1rLVjijNtWq1m2q7urWK+C
 iQFNPkVCQIRQG2izzWjz+0r3ULwUkvk1oaor3drBWhjJsgHjmTgo2WwS8GOUHxuYnVbt
 mY98F9Wt/be9WoqsPVzNq1TkR+vrSNTUIiJtjJj82nXuS/UGT8iVdKf8ZnDAMWSsOEj7
 31Aw==
X-Forwarded-Encrypted: i=1;
 AKwUvBy7huvONiQyX7L5ADntS2RBHRaPqf+m73aNZAGMSHm3zY/NRy76eGd+3ECbMc/sKY3okXAl6/KBOOTV@nongnu.org
X-Gm-Message-State: AFq9FYJBiHV//8sgQO05ouPCGjamgh2MzQNNi+qnHkXZSZw5AZxI1qTJ
 9xxKLGRvpJmXM+cdckjf8O3bIfNTt+o12oCSRfxwCRRJUKOSpeuE6phmGAOBPxEMsNTWZR8XCY9
 7mCdS3GZnAlefZ3ShH95Z1h599aKdLDbzw4h50F7OeZR/x5OJZaiN40VOVHPW6PagemCU
X-Gm-Gg: AYBFou0ttDPD4LIdk25LhJJVBK2YVDOE8Vzza7swJrUzpmupgb/0IsuR3IzH+zBGwpJ
 3W58K33tm/vU8MBLpK4fqRvsKhmqPLhv88axcLNPMU0c6Yo0bLQD7ia0LVb+4ePIPMJTsFKoz8Y
 AVl3zGcJWdotEWhz/km9fnrYJPQ8BSbgXnagxvs8hpmfV/RqmOSRusZxZ+fFwIVqSbEvuC0Km1P
 noqmHd4ujHG8b2WOumY0DGrxjDBNS9wpFE4/yIgiOsF3/OeeN34d5sCSyXvSF3P1AWLhE0KQrAj
 2O26bD7IWehQcmGukDCTItfs7ZcRtnEv8xdOrU4pDJseIss38gSTtgQJdo9V3bgdG/mMAjqJxJr
 O3M0WeDcBGpgXdln+86Yv75XxpPZ7kFEt9bGktfuu
X-Received: by 2002:a05:620a:45a1:b0:93f:32c5:69b0 with SMTP id
 af79cd13be357-93f57fa3df6mr187622485a.60.1792552473444; 
 Tue, 20 Oct 2026 20:14:33 -0700 (PDT)
X-Received: by 2002:a05:620a:45a1:b0:93f:32c5:69b0 with SMTP id
 af79cd13be357-93f57fa3df6mr187620785a.60.1792552472925; 
 Tue, 20 Oct 2026 20:14:32 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e2581eedesm2246455f8f.14.2026.10.20.20.14.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:14:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 03/33] cpus: Introduce CPUClass::exception_name() handler
Date: Wed, 21 Oct 2026 05:13:36 +0200
Message-ID: <20261021031407.24862-4-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX1MQ5e8qrRTG7
 Pf5ayx7bbgzkHxiIuFjbnT580MO7NoZYoZrMzYEfCtwsT9KOqjuGy55UfO1n+0HiauG+A0JpqzQ
 SALW3A3D5JDL0XbOcfneEuUHGjP1Z5LlarKYPTnUj96E+2bBRV4X6oUDxAm2P68eSCcL/6sXTwR
 LI7bmVyJpzOH4dqggsYTcZOoW39MD4EDBOisDMKtn39IyuxWhCqmWUZ3KqgcgwZL0OP6OxTPBie
 9y8pdVkrvHoaEnWrJtoRhQoxt6lFsvI+uPdlcnyY3wElBsO/Gm9+MlHWJ2Ys0dZUo5A+NU0Lo71
 kvZuZOZnU2+mYrIF0HvgfDrULyqHhtT5zyZpjN5iLAx/htC2+yQMsukpQgRm5fKrtK6APLGqsP8
 6H2M0wq+mwdBucsMWEJZwEmNXjMX3Ji7MMBBB/xma8QCFaK/YPl6Bb2d0WT6/hPHv1XAmUyr9Mc
 3S31lDgY3o+f0jUmaDQ==
X-Proofpoint-ORIG-GUID: pSTJbk9JDAGhTeYTEtrnoXNazkOyxq-J
X-Proofpoint-GUID: pSTJbk9JDAGhTeYTEtrnoXNazkOyxq-J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX2EJrC8ImSgIZ
 8xHFYuzkJ950rPq2nj0iPwRLQ6Z0fZdsn6GY4bSdO73ZWfoejC86O2nmGyJCT/R/9rw++Q6V4WE
 IdprNU2gOvf99gNMj6DQyD2/WTEZGk8=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad82e1a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nqYS7Cp7_YcMA-VLD7UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
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

Have targets register a helper to resolve their exceptions.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 include/hw/core/cpu.h       | 2 ++
 accel/tcg/cpu-exec-common.c | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 456154df6f6..9d71db16d2f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -108,6 +108,7 @@ struct SemihostingCPUOps;
  * @list_cpus: list available CPU models and flags.
  * @parse_features: Callback to parse command line arguments.
  * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
+ * @exception_name: Callback for getting architecture exception name.
  * @memory_rw_debug: Callback for GDB memory access.
  * @dump_state: Callback for dumping state.
  * @query_cpu_fast:
@@ -178,6 +179,7 @@ struct CPUClass {
     const char * (*gdb_arch_name)(CPUState *cpu);
     const char * (*gdb_get_core_xml_file)(CPUState *cpu);
 
+    const char *(*exception_name)(int exception);
     void (*disas_set_info)(const CPUState *cpu, disassemble_info *info);
 
     const char *deprecation_note;
diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index 2ac8380d0bb..a347dc244d8 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -106,7 +106,7 @@ static const char *qemu_excp_name(int excp)
     if ((excp < ARRAY_SIZE(excp_name)) && excp_name[excp]) {
         return excp_name[excp];
     }
-    return "undocumented";
+    return "unknown";
 }
 
 static void log_raise_exception(const CPUState *cpu, int excp)
@@ -117,6 +117,12 @@ static void log_raise_exception(const CPUState *cpu, int excp)
     if (excp >= EXCP_QEMU_INTERNAL) {
         qemu_log_mask(CPU_LOG_INT, "raise exception: 0x%x (internal: %s)\n",
                                    excp, qemu_excp_name(excp));
+    } else {
+        const CPUClass *cc = cpu->cc;
+        const char *name = cc->exception_name ? cc->exception_name(excp)
+                                              : "unknown";
+
+        qemu_log_mask(CPU_LOG_INT, "raise exception: %d (%s)\n", excp, name);
     }
 }
 
-- 
2.55.0


