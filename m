Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FF3606BED6
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 03:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NBnfWMJI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gYPeypDS
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJMph-0005j3-QV; Tue, 20 Oct 2026 23:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMo5-0003rR-SS
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:16:02 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMo1-0002nU-V8
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:16:01 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2F3uI3256728
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SU/IMfYsvHyCND/D0agwHYqz/dXznICB+LmBjN4T+h8=; b=NBnfWMJINd+IyML8
 ZWJvmtVkKTmVKHcfO/uV1CV0tHGv7DCFEXTAXulx9s5pjTtRZ9Lv6ffFisX30YS/
 93Cw/DBqNBoGpRa1fGeCDg5vEPBsHcN/1RlP58VNYho0Obi3YQ4WAK93PNIDfh5a
 Lfpul6aVNVrHIYRh3SY/mTJxWgbSh+lBmAqu41XdqkZ5vjF4BDeNqmdQHsn20op7
 4GxatXzqYrPHDIIOE1XvFJU+6G7vwuHknPxlyrobTOU2606xBpODFxba9/Yew2EC
 XaxvevYYThqKqws5SwExW+5PVVkcEI+KCOfRXxcSkZkfemG0XIN9fErs/sR0O09H
 q6bbAg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v1rq0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:15:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f37c94ceeso255628485a.1
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 20:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552554; x=1793157354; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=SU/IMfYsvHyCND/D0agwHYqz/dXznICB+LmBjN4T+h8=;
 b=gYPeypDSfaf0gkgaz7pKergcMxWXiiAVUPCLnUtm1ODN76/x/anHG9Nt8JSM8v2Zn/
 NhEcHMU5UqHkwETLXE8vcMSBEcgXLQj5oZa4lPbs1G+a2Gr2Jy8/hvi4qJ7PXP+9y5Nq
 HJsxFbgalm61/aEvqqbCwGVXjetQhqGVyzktqAfYDOkI3dj9g8phyD3f9ZdR2huRGwoa
 EzJWx3oMhihm4MuJWqRzJOm/gNDAskv/TxJcAHnvCoHWLjdZvXu85tS4jXzrysQTw27A
 zqZdtSCgKcQdIOAd0HjJj9HdD8+HS4YvcMWGQcD2n822S3xOxiyyQcvgaLNgPUHfpVXn
 gwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552554; x=1793157354;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=SU/IMfYsvHyCND/D0agwHYqz/dXznICB+LmBjN4T+h8=;
 b=IZVuGGFxkfRuHc1fNK4Vau+qG5Hfs+3s7j+nIY8yWTZZqp1n7Nmz3o50Qt3TwqP8kO
 DA1O7cwLxStuqsh1+qnVSZT5x5w4cs7A1j0B71a4sL8+aHXmQ+JqsXkKuTF1utPsI28n
 lKuqZAP3j9+LqduX5NYOCvL5uuQISP+DrG0WvUNYcAJeeFRDuQQklPWkHvZ1iWlVewps
 erTSjZzQxyOUVsgMS9fqywPE1RpuFqcEX0HbcGYLAwJTU5WARxmr8ltjnHqiuF3MvIuN
 3I38Ui81vPg0q8YNugPWEMdF9M2Ljno4VWSFtnRfTWXxAc8nxVxksXNSCJc5doKD2NQJ
 fWpw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxUYCXsaQFPh4E3qhwQnUuP418zVdTKqDvj7ZHagExyWXjqTZ4z1FC/9AfGNeZQXhUUss9edkakuSPf@nongnu.org
X-Gm-Message-State: AFq9FYKUXaekEezCjW7d0Xxkj42vjy0QhdJV8n31gkCxwzAoDPjoB6aq
 oQIl8UaGHkIh/JzAjC5Xj0v62JDfimMfVn8yyhNT3ynxD+Mqg+otwueySkuOd6m2IBEguXsUrE1
 a4jM+ndzqGeVucWBC9lVifvUpKD5ewBu2gZ7hKNd9UdRWx4Q18rwE+4n/8pzY/9t+iYQ4
X-Gm-Gg: AYBFou2jdeCY5RHwkDxClQJhR+ovW3pIg12ijdO+l6IfjWdO00SdDdXkU9NKAKGAGsG
 qwSFWHpArUeon4czm9Kkn20JPMOfO6yTtdcjKLzAGKG7ztmL9h450g+qLAQVokdo6gxJcn5eGHQ
 Nn1w1ZIBVuUgVdbL6qR8JudDJ6fAembqfwPbSNyiyRhy10HCKECr6MZQk6XP2Fl5tV5hSJFirmp
 d4XE/CySlAAsLkJ9UO1uyWufIgth8rykvqIcjCXiztaaVAThP6eyG94BegxHujMUcnC4dB2GmpC
 ibWzoCNxIsDbT0RImLuwYObU0irR5qzHeaMPyLrsX0PZs4KZcnmJVa+dddm9hwU6CXD80OQ6IW+
 W6HxLgLfPqJ7N7iJYoiQNRlsNWvt8JrijIrn5Qg2+
X-Received: by 2002:a05:620a:444b:b0:93c:d209:4ea1 with SMTP id
 af79cd13be357-93f4c67fe3cmr603050885a.24.1792552553958; 
 Tue, 20 Oct 2026 20:15:53 -0700 (PDT)
X-Received: by 2002:a05:620a:444b:b0:93c:d209:4ea1 with SMTP id
 af79cd13be357-93f4c67fe3cmr603049285a.24.1792552553544; 
 Tue, 20 Oct 2026 20:15:53 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e25840115sm2344008f8f.48.2026.10.20.20.15.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:15:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 13/33] target/m68k: Register CPUClass::exception_name()
 handler
Date: Wed, 21 Oct 2026 05:13:46 +0200
Message-ID: <20261021031407.24862-14-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX6/l8kq2X2wQ9
 LGb9SPRSoQaJRcFhOm9MPOAzUnI7rQq0xOdcQDnZJqySltQkQ5hWx15AwQQ4PGdOSjlWfXL1oUf
 Tu7CPMCYZhcAxcFJWlxHpogK3eUsgDw=
X-Proofpoint-ORIG-GUID: oTRgO2dm4r1f3XaW8GVmMT4hgSrMxOyM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX+KMMIqFq+3S5
 VbPBlOOsxwmRlbPNuKg6UftAiw+q+R4lPbcCsjnxASpvMUedTSJxd5Z+mQ5zSMw2tq7xVy6IV6l
 rMfRbLu8F68Yxn/z42YRqF3DNYOAn6TzCC5qrY5xRj5HgPBCOgWQADHKtVYUt2dCUZln3vgTo5k
 z03nHJPG4fyjCnA+CJbDd+c+X7TmCZr6R8SY5cRheLMkjhd2V5CDk+XO1kJTlcuAe6DoFGKurb8
 cCp1ynAE05yAPiUmo/0GUPDoIKR6UdVRU5qcpJvm7i5I7I95UXyLaw+SPPbOsxzkWysE6VNKn2a
 SkTpqJq0LkYTWADIAbUziZzY1tfQZJbokQMUxvMyFynlHxx7O4W2yNCLWhQ/uLcI1PZJIaLL95g
 O9NFJH5ohqIEbplvxl0W+OaVc8l/C6RdsTrFAHEF6vUnku8xz5wf1wh2lENiZvuGvUE8MPShTqS
 yg8+Cc1QQOm8/Bmq66w==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad82e6a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KgwFk9o9-AijF0zHnMMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: oTRgO2dm4r1f3XaW8GVmMT4hgSrMxOyM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expose m68k_exception_name() prototype and register it
as the CPUClass::exception_name() handler, so the common
exception logging can resolve M68k exception codes to names.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/m68k/cpu.h       | 2 ++
 target/m68k/cpu.c       | 1 +
 target/m68k/op_helper.c | 8 ++++++--
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 7cf3791108c..44b4afc41c6 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -69,6 +69,8 @@
 #define EXCP_RTE            0x100
 #define EXCP_SEMIHOSTING    0x101
 
+const char *m68k_exception_name(int excp);
+
 #define M68K_DTTR0   0
 #define M68K_DTTR1   1
 #define M68K_ITTR0   2
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 9b52ad5fc23..7d5dfd8e529 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -730,6 +730,7 @@ static void m68k_cpu_class_init(ObjectClass *c, const void *data)
                                        &mcc->parent_phases);
 
     cc->class_by_name = m68k_cpu_class_by_name;
+    cc->exception_name = m68k_exception_name;
     cc->dump_state = m68k_cpu_dump_state;
     cc->set_pc = m68k_cpu_set_pc;
     cc->get_pc = m68k_cpu_get_pc;
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 38f7a689814..c600f83ddbf 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -80,9 +80,11 @@ throwaway:
     cpu_m68k_set_sr(env, sr);
 }
 
-static const char *m68k_exception_name(int index)
+#endif /* !CONFIG_USER_ONLY */
+
+const char *m68k_exception_name(int excp)
 {
-    switch (index) {
+    switch (excp) {
     case EXCP_ACCESS:
         return "Access Fault";
     case EXCP_ADDRESS:
@@ -185,6 +187,8 @@ static const char *m68k_exception_name(int index)
     return "Unassigned";
 }
 
+#ifndef CONFIG_USER_ONLY
+
 static void do_plugin_vcpu_interrupt_cb(CPUState *cs, uint64_t from)
 {
     switch (cs->exception_index) {
-- 
2.55.0


