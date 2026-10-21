Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B022D606A31A
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 03:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dLqzpZYF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OvImmWoz
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJMq1-0006no-BC; Tue, 20 Oct 2026 23:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMog-0004YN-V7
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:16:46 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMoe-0002uG-K1
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:16:38 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2J0uD3996354
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3uc/a/K1r0yU+DutArZzUhtCa5KlYLTfF7Yb5mQUvjc=; b=dLqzpZYFkFx7/N4s
 aOuds2Oh2Apnv9MAAQw+bZ/7uQuS/y/zxTkp06Mj+p5e5i7Fksx0De9+w7u0WP+i
 1ISR1LpmxntYB6iLpB6589WlF7pd4gfrFBoTtl1m3zmfPpqJtkMA4slesyBQNn2b
 838AyxXmY6Ej1w4QMUtXKE+8p8eUohByWxoMyTs7fhgsNwcwLZDa62NqwMfo1y2X
 b1Mi62llJtfxuiKqZVoz/uhLsOJa9opcJe6sMP8E/xEOaOALxeVks3S2Mq1RxZn6
 s717dIGjBZwhH1+hoFvjB/C+FWRmtNRq08At3WX+K+WymlArpkgghJVPFN9zJtrb
 nIUvJQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajhrbb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:16:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93f568dee56so65454785a.0
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 20:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552584; x=1793157384; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=3uc/a/K1r0yU+DutArZzUhtCa5KlYLTfF7Yb5mQUvjc=;
 b=OvImmWozky9WE0rKMm2e5YvqWC4gl4F5rdNhqTXDgQBtLKod1r/Z7PFutzWg6LcICt
 67gZo4MVIuKrxzGsEHYUOrU1vFb1QyQQncFRR6SKXk7mBfAi1kJpTy9B70DmoWiT4mKc
 fsf+Xa24BoaPYMo9B4LfHSZxTlwuZbEmYSiY4KXTxgQyrsFbZ14JT9e7c0Q9doZeW4Bg
 cyHrI++NheG7BbdqurGTkuhwebal+37HK/h0NkFKC+EOXesSfMyCFYt5ZQENBbFgoWFv
 fa6mynJikTmShxeB/KFvwUA7r3elv7iErOKlavgnk8EzdBL7+nq31sPXlO2fQFe/Kkzz
 8kRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552584; x=1793157384;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3uc/a/K1r0yU+DutArZzUhtCa5KlYLTfF7Yb5mQUvjc=;
 b=cd09wVhnIE8HmmWFJHGGwqJfV5JhkD5wH21M8qoIYga1GVO/jy0rJdXf5UplEAM3i7
 Wr+Vjy9p1Qgniyd8gZ+hRcQ2ZqnPrHm+Shd052Ac0hBI9YrLyGM9p8I+ScZ1p1a6tfdj
 nh1YjcE+Z1pSqYTYvFFQG02GdFow4GYJYyGobDJz5KoZSKUfSm7WiQluLj2EMPXCMrZj
 kbWnhO5pzPoSgYLconLhyBQHfYcn5UHBgZAt5N5V1g9Ec4PVDOmImHWRAVr9gvRyVwTF
 222Qehna+JvUeUaEUUAEGrHYTqa4CzZV9B5TWaE+wgpmHqSsoGkkrTKpeWaDIlpz5EM2
 tVcw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxrbCIcA/eCpOWOoBfyW1lt9DacnpByDPDzW7ljL1lY7VDIHhdiQrWQpd42h65JYDWtQhrTxcMH41B2@nongnu.org
X-Gm-Message-State: AFq9FYKs0HwPrWiKJf3dRUmIlrbbEFHtkljWkQA0oMw2A0QUODp5Onff
 kHKAJQGyXEMyber6uMgTSNPXeWSaZcTcI8FFU+ZoD1hgYJZeHp4TH39ykL+xSOoefwWJxsZsJX6
 bxprXE/xl/TACHnQMhv56j3PWaOYtpWfQuutwt7mkYdsafVKFy8iT0R2l1A==
X-Gm-Gg: AYBFou1ED7RohQjTIYIs1wKTvGTaHgHtmXAJObK8ub/tBudJ8y4kpmuaIeTXPTyI+5i
 9JA0Iohdv3v/2xim3d1NfEr0JKrP7WDEvK7Tq27Rn5zWlw9Ip7sP7u5FHdPmg/tDWOwPbry9W4g
 Xz06jeZ02d78fQnlEJvlMbfzlCxMCTwPrXoXVYHNUe3x8AfpTYTjWPdltskcjvTFNeWiozgThuw
 /NzV22vNPfq6Ip4EPGJjZu5DcuG3KiHaUVGto4/yCtQYDZoQB4+/8SPOUTvcrhOhFHUT2lk2EcR
 F5cp4OBrcMEDtcONDQZpL0uOBO3g9tGj3mwYZ9b0PM013CbMKszD81LzIBDx0HctwWZuMNELY4c
 NKniQ/QtdlDf1rhYc18ZavN9Hu6klvlMgfWu6qapr
X-Received: by 2002:a05:620a:6087:b0:93f:1af1:7951 with SMTP id
 af79cd13be357-93f57f8ad29mr216489385a.66.1792552583540; 
 Tue, 20 Oct 2026 20:16:23 -0700 (PDT)
X-Received: by 2002:a05:620a:6087:b0:93f:1af1:7951 with SMTP id
 af79cd13be357-93f57f8ad29mr216487085a.66.1792552583114; 
 Tue, 20 Oct 2026 20:16:23 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1f2c242dcsm111146565e9.0.2026.10.20.20.16.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:16:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 17/33] target/mips: Register CPUClass::exception_name()
 handler
Date: Wed, 21 Oct 2026 05:13:50 +0200
Message-ID: <20261021031407.24862-18-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfXw9nxiRcS2TTn
 M88/dXgz7AOpzuk+DeSUpvnPXsVZgeesAsyWg3zmlU1tm6x133kF5qh47mws5Gb9pImvpHz2VNw
 L4KJR9xaU3rB3zZN5Y74kjpDGYNLn3l29rMrpo5/d265xnTbay/L9pV4Vk8dqNU0tAMJpiFPasz
 pFYF9ZWU/yaG5Lc6qR1T6rj6gs5Dt/0GBl5WX4QHi+JQoLos7QH/NcsGFwqXmuUP6vsa8V5/iFj
 SKVItJ8BFka+lqShaVu2ERKmtZVEJRgqxZ0U94YgosH1ZO2G70mYZTgs6DQ+RalvcFbK1VwiU0B
 LqjAKq/S28VUS4PV0d6w1A8CGgd5s7tbzAz101CbVhgRrBXkDGusKi6rPtKmKWwl4+apQPHjAyc
 VV55iz58T4WX7p4EWPSpty4ctvL977YNiayWm1QxvB3iuwpC85RhPNJ3cC7MWRIhPKSy9hVRf0P
 RTXk+TO1Rf3nk8ER+Cg==
X-Proofpoint-GUID: PpE7XI-4n3VRVrWNu9oGVfzIzCv5RgC4
X-Proofpoint-ORIG-GUID: PpE7XI-4n3VRVrWNu9oGVfzIzCv5RgC4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX8/wiUDISh1VO
 plAb1Gfy+Z1rBAsLVOGJ3YEjDMbk0FaSNUKt45DTMxWekepYfgzwRhvrDe1LVJq8W/xUZeUUBMG
 nDOUscnWQpSW8Tdi0y89mEh3ggRV1og=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad82e88 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LEehXKFoqEHZ457G_xcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
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

Register mips_exception_name() as the CPUClass::exception_name()
handler, so the common exception logging can resolve MIPS exception
codes to names. Return "unknown" for missing array entries.
Remove the qemu_log_mask() call in do_raise_exception_err()
because it would duplicate the one in log_raise_exception().

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/mips/cpu.h              |  2 ++
 target/mips/tcg/tcg-internal.h |  2 --
 target/mips/cpu.c              |  1 +
 target/mips/tcg/exception.c    | 11 ++---------
 4 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 5d8b78a70b8..b080c5de4de 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1349,6 +1349,8 @@ enum {
     EXCP_SEMIHOST,
 };
 
+const char *mips_exception_name(int excp);
+
 /*
  * This is an internally generated WAKE request line.
  * It is driven by the CPU itself. Raised when the MT
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index 950e6afc3f2..9f230e757d6 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -27,8 +27,6 @@ void mips_restore_state_to_opc(CPUState *cs,
                                const TranslationBlock *tb,
                                const uint64_t *data);
 
-const char *mips_exception_name(int32_t exception);
-
 G_NORETURN void do_raise_exception_err(CPUMIPSState *env, uint32_t exception,
                                        int error_code, uintptr_t pc);
 
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 0fead20d651..528d926d16c 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -742,6 +742,7 @@ static void mips_cpu_class_init(ObjectClass *c, const void *data)
                                        &mcc->parent_phases);
 
     cc->class_by_name = mips_cpu_class_by_name;
+    cc->exception_name = mips_exception_name;
     cc->dump_state = mips_cpu_dump_state;
     cc->set_pc = mips_cpu_set_pc;
     cc->get_pc = mips_cpu_get_pc;
diff --git a/target/mips/tcg/exception.c b/target/mips/tcg/exception.c
index 2f02f9be877..d2cd118518e 100644
--- a/target/mips/tcg/exception.c
+++ b/target/mips/tcg/exception.c
@@ -19,7 +19,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/log.h"
 #include "cpu.h"
 #include "internal.h"
 #include "exec/helper-proto.h"
@@ -129,12 +128,9 @@ static const char * const excp_names[] = {
     [EXCP_SEMIHOST] = "Semihosting",
 };
 
-const char *mips_exception_name(int32_t exception)
+const char *mips_exception_name(int excp)
 {
-    if (exception < 0 || exception >= ARRAY_SIZE(excp_names)) {
-        return "unknown";
-    }
-    return excp_names[exception];
+    return ARRAY_ELEM_OR_NULL(excp_names, excp) ?: "unknown";
 }
 
 void do_raise_exception_err(CPUMIPSState *env, uint32_t exception,
@@ -142,9 +138,6 @@ void do_raise_exception_err(CPUMIPSState *env, uint32_t exception,
 {
     CPUState *cs = env_cpu(env);
 
-    qemu_log_mask(CPU_LOG_INT, "%s: %d (%s) %d\n",
-                  __func__, exception, mips_exception_name(exception),
-                  error_code);
     cs->exception_index = exception;
     env->error_code = error_code;
 
-- 
2.55.0


