Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D689A606E847
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 03:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WhO41krX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SZpm4ImB
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJMsI-0002ZJ-WA; Tue, 20 Oct 2026 23:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMqi-0000ji-RL
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:18:46 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMqh-0003FW-6d
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:18:44 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2F5VX3256736
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 D6JPPbP2ID1neE5DTExklpLS1x7Fwl4KCF0KFVVUP3Y=; b=WhO41krXCyhNUqb/
 J5DWeUeW0gvAdbukW4/VYQ2EZGMM9nCqXDMs82We8GQPrlLYmTZR1f8i4UGnAmEo
 mU56DPIky4CBDM6aozjtgDDB6Gz772YTZrPqLhSXEJ+TplbfbvuLUhJfZWxDnWTI
 rQ33U9/kOUj0I0CJapQ8y206Of8WGsDUYehvfkiNQgbRbo2UDZGt6fAbQU1GtZYc
 7dQRPuPsm/JZgIwtnFhHOXL8MWm8RkQRdOiIoqgdjf7X4iP6dWiJuel075E9Gqz/
 PHGaFNl7yhGHvAqMyjOCrzlUzrndy4JOd+ZBwlNSqonZC/ZA//FpFYgexh9TM48v
 W0WG0w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9v1s1s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:18:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f26dd2165so97038085a.3
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 20:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552712; x=1793157512; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=D6JPPbP2ID1neE5DTExklpLS1x7Fwl4KCF0KFVVUP3Y=;
 b=SZpm4ImBY0ef0temCaxt+rL4S/BqObbdHm+5G0cOmqRYvsFuebgEPqsbyg2KKpQj4G
 UxcRTNF+9eNva8Y4G054/MOeDsvfV9zEZ08+DbMfSFgdYFWeK4yNgIr2GdZmoGH5WqTp
 wnwFwiXinevkLqXbGp5B55q/da30poMr+Cp3BENT0qEaLsewsg/QdYHD+yWFPMQkgI+2
 +LaNxo8OFNOfVAjB5ydJuFl5gBBx0zjJx6WA4uo60pngVuGwPK/UOi0MEZK53WRlsmGU
 wnLgPN64Vra7vpf4irEmdDqlEfjsrxtPtySKtsAY3hTlz4fx+QTJ26ywd82xznMj43qz
 u9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552712; x=1793157512;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=D6JPPbP2ID1neE5DTExklpLS1x7Fwl4KCF0KFVVUP3Y=;
 b=mt2oEWRXVNV1atqPrWhvbZsS2eI7RQi/V/jsJvAqU3STr7+hyMHinmgjHQi5U60/Qo
 SrIikoefEWxAJFiWJQ+1oOfg1fEk5lyJpT1vTuXdruTBM0smZmEeA1pd1q8rjTwH+ABe
 c+3W2giQ/SEerw+qXZy20JZ9ibgTF2zEI46CCp3hrRc7T2sIc3SQE056WSC0eCDr4zoJ
 OuzH6BMEp78O0O6r6NiWTyZA4ywJO5NYdSJQEno2nhyTEIYjQQOdQW37wUXhxyPgfW18
 sRM3y69MGgPa4AG51tnM8QCFwP/DaRDK+H8QkvMbxh3piNespe1qsuneVjshhKpesUoQ
 qzAQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzQiOpJIBRlQe/VpZMF5Hf0vEC/JSAk9wkaxt+6WaXcdxSagpFZ1Qk6ap1NU8D9iqe9tHzjhs99KLDN@nongnu.org
X-Gm-Message-State: AFq9FYJJCW1BTXXP1F/8gCnN2IcH8SMFcq21k5d4HXSnzUHpuZx1kZhS
 0Cf1zTm5cayoldoL1qmt210tc3q8R1gQOj89VNKNhRukic/lA/tTiVW4FWGJOLr0yHMfxami9XL
 Mwdmpu18Dc8Q3sgA8Lwm302ArTyhyksPa9c6CP3EfT/gmOXYroIlpZOdad0BwolMjVAgp
X-Gm-Gg: AYBFou2Qz+m64XQGn1a28vVd280oKcSQHEeZ54b+qTG25ID5a6wOfD5RS+5RlA/3+ej
 Qrjp5MaUBR79R99hHJBaKapwR8zbXQLZnqXmpLq/um6J9zkHw4/vfhU3Twk9OnYzEbHNrwNFRlI
 DMAnc5TZIy/8rf72CawUw4YPRqg4JbUgiQcOydLvByNsqZmZmXO1PUACCTil6/60vUQIKWI2ixu
 WhUBtObF0OKr98veqmpNsBeqc+UV09kcB1iIr0iZI4saShluInFEr5UypzuYqeJqURq1OGGVa0Y
 mbftrQsyPGlHgUIdtVHWMxrIwIApvSbYf6SIyv3PyevOX/p+/CJ6yML3ZWzH/Yrqul49PVwkMP5
 IHeotvMvQvvGzuGxyGPrBohm2cI+8rBeqKYVx8hm9
X-Received: by 2002:a05:620a:2913:b0:93e:53fd:4137 with SMTP id
 af79cd13be357-93f57f1f09emr220446885a.20.1792552711619; 
 Tue, 20 Oct 2026 20:18:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2913:b0:93e:53fd:4137 with SMTP id
 af79cd13be357-93f57f1f09emr220444485a.20.1792552711090; 
 Tue, 20 Oct 2026 20:18:31 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e25b04883sm2363770f8f.0.2026.10.20.20.18.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:18:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 33/33] target/xtensa: Implement and register
 CPUClass::exception_name()
Date: Wed, 21 Oct 2026 05:14:06 +0200
Message-ID: <20261021031407.24862-34-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX+/ge9INI4C1D
 UdBouvzlsCl9sCMoxTfQ30a32PEM7PMA8Qnfc2bYqbciSk/0Ms6Qrb0hIOhGRjGWrRv2T4If1A3
 9ILpG6poS3oHiR9/1V+sQajavIP+LHQ=
X-Proofpoint-ORIG-GUID: cp8K-z9skmlgzyE1qxLhJmPerMQyBlWP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX0Z+Ken8i407a
 TamyQFspkvfp92wiGDQVpJg2bJKvGqU+Ab+nQ62TzwI9Xo2gjU5uomEv4/0JLRxmFOiXYh/rJ5A
 NliYA26Uc39drmpqoTVp2Hylk1vBhbQ9IFFPPwHA2xM7mr92mII1dgrdfBf/eWH+oZDaFALVeUl
 5pnVQsXM4OeRttxK4yGqpRuMit7lF7KSzaYtwH3l1OprXhnYarDo4oPPwIpOZrFLUQSSA/7TCXi
 oOcvqZzncGe+jn3B8PlMOW0y+AZiHHpNiGC2KY+kDw0dJFUg93MVIlzmmguV8aGNktG87L1YUbQ
 L982DvAFcGPsKSrLoBYHXC5msNYAalQKbglYDYCRZkBlDaDAJ6M4NYZNJbkFMjSHajR6HykTqpv
 gH/y1i9KlQNUo5UrkJ/QnxmCXwXS2EYJsU+sDKNiFP+7bzXrWfQv21387/WLn2FgJYj9htkeEXb
 vfbuTQKinVYbvVrpRYw==
X-Authority-Analysis: v=2.4 cv=I6zw19gg c=1 sm=1 tr=0 ts=6ad82f08 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-R6i_BgWeFa1qxdD66wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: cp8K-z9skmlgzyE1qxLhJmPerMQyBlWP
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Implement xtensa_exception_name() and register it as the
CPUClass::exception_name() handler, so the common exception
logging can resolve Xtensa exception codes to names.

Use the new helper in xtensa_cpu_do_interrupt().

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/xtensa/cpu.h        |  2 ++
 target/xtensa/cpu.c        | 23 +++++++++++++++++++++++
 target/xtensa/exc_helper.c |  3 ++-
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 49d6ad9083d..3440c27862b 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -262,6 +262,8 @@ enum {
     EXC_MAX
 };
 
+const char *xtensa_exception_name(int excp);
+
 enum {
     ILLEGAL_INSTRUCTION_CAUSE = 0,
     SYSCALL_CAUSE,
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 7c25b9ab707..1f9cb7156be 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -239,6 +239,28 @@ static void xtensa_cpu_disas_set_info(const CPUState *cs,
                                      : BFD_ENDIAN_LITTLE;
 }
 
+const char *xtensa_exception_name(int excp)
+{
+    static const char * const excp_names[] = {
+        [EXC_RESET0]                = "reset",
+        [EXC_RESET1]                = "reset",
+        [EXC_MEMORY_ERROR]          = "memory error",
+        [EXC_WINDOW_OVERFLOW4]      = "window overflow",
+        [EXC_WINDOW_UNDERFLOW4]     = "window underflow",
+        [EXC_WINDOW_OVERFLOW8]      = "window overflow",
+        [EXC_WINDOW_UNDERFLOW8]     = "window underflow",
+        [EXC_WINDOW_OVERFLOW12]     = "window overflow",
+        [EXC_WINDOW_UNDERFLOW12]    = "window underflow",
+        [EXC_IRQ]                   = "interrupt",
+        [EXC_KERNEL]                = "kernel",
+        [EXC_USER]                  = "user",
+        [EXC_DOUBLE]                = "double",
+        [EXC_DEBUG]                 = "debug",
+    };
+
+    return ARRAY_ELEM_OR_NULL(excp_names, excp) ?: "unknown";
+}
+
 static void xtensa_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
@@ -348,6 +370,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, const void *data)
                                        &xcc->parent_phases);
 
     cc->class_by_name = xtensa_cpu_class_by_name;
+    cc->exception_name = xtensa_exception_name;
     cc->dump_state = xtensa_cpu_dump_state;
     cc->set_pc = xtensa_cpu_set_pc;
     cc->get_pc = xtensa_cpu_get_pc;
diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c
index 7cb67d179a8..ff71e5d6462 100644
--- a/target/xtensa/exc_helper.c
+++ b/target/xtensa/exc_helper.c
@@ -236,9 +236,10 @@ void xtensa_cpu_do_interrupt(CPUState *cs)
     case EXC_USER:
     case EXC_DOUBLE:
     case EXC_DEBUG:
-        qemu_log_mask(CPU_LOG_INT, "%s(%d) "
+        qemu_log_mask(CPU_LOG_INT, "%s(%d:%s) "
                       "pc = %08x, a0 = %08x, ps = %08x, ccount = %08x\n",
                       __func__, cs->exception_index,
+                      xtensa_exception_name(cs->exception_index),
                       env->pc, env->regs[0], env->sregs[PS],
                       env->sregs[CCOUNT]);
         if (env->config->exception_vector[cs->exception_index]) {
-- 
2.55.0


