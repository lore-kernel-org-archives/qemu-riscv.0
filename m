Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB540606A320
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 19:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JA8C5BNE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NhHPmBJx
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xTlgZ-0003BX-S6; Wed, 18 Nov 2026 14:51:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xTlgM-0003B2-Qs
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2026 14:51:04 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xTlgK-0007TF-Mu
 for qemu-riscv@nongnu.org; Wed, 18 Nov 2026 14:51:02 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AIJM40o686673
 for <qemu-riscv@nongnu.org>; Wed, 18 Nov 2026 19:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=nb1JaOdMmXwfB98bD7Afx5kBWM5xGXkFH9g
 MCoPGzxE=; b=JA8C5BNE1DgzsF5weaMoNDHqCAVrk1DIuWXxaZrRzujjF7Ut05x
 6l0nmnSIsk7WyLT0YUOrS5HLSjMKFHnD5MKxfChaYZ5rZFtRKwGIbupdr8WEWIWv
 uEmA3E7BRKyWyKSWn77iwTK4TtLI32w7q/woCQo2AhVLRF8JMnp/Ok26Z3wGZRYC
 tEid89faWiz4gQKQGkKM24JnwYD6D1A7CWPPPdUJGlNAv6yqj7h6M+GY1B/CO6Ar
 T3KVgUAcH0Q/4pjUQ1zgT4+6tWZThK9W/BlrNxgVcZwJNpre+AEXq2h7k5NOoPmE
 OaElXw+HP7zU+aYe3YDYAt7xiG7LLIAY+Ag==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1e5qsbd9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 18 Nov 2026 19:50:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-94607500fb0so215697885a.2
 for <qemu-riscv@nongnu.org>; Wed, 18 Nov 2026 11:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795031455; x=1795636255; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=nb1JaOdMmXwfB98bD7Afx5kBWM5xGXkFH9gMCoPGzxE=;
 b=NhHPmBJx8txLqrmvZV9TFiwbIzYsKKG4FfI71Z1ov6ZXUvYjmVkyjJV9fksmsk7oGa
 6l2axokAXz0FbCUfdO/ttbKbYaEJNlrBKT8uyDPwRrZKEnfFtwJYfo7/Qhao+F0bjQAT
 /AxvRfm4oOPiAfuGaORzKt0qIb1Qc8rm8iw/zkJfV98vMLex741yGaTay/76LMc40pHo
 KlDt7BK24qvnjk2IQ4TKAgsiPXvH7roKp0EARhSnLyE1tNGZhigQ4m1PZ5kjnYREWxBv
 tB80ncV+xSf5dq2RS08Tsgv8eOtTlpjnmC8gG5hPFFQUEyWLKtvk4s8FEkYc+OVH2V28
 Yfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795031455; x=1795636255;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nb1JaOdMmXwfB98bD7Afx5kBWM5xGXkFH9gMCoPGzxE=;
 b=hn9zau1of+qYpGY9qsiSFdRl9swQYFLi89jSd/33bFYOyGL69ikuW5vJiiqadktB6g
 m+hXVzND0L5vls0/4sxPaVeU9W46deiiTtadsALVaVzFnpthI29vOpl5EAQhvXUlAkkR
 qVGQ6yOeul3Yk2P6bYayAgQczAoPy8P5Cyvi6Qh/VLblXmDZbNGLn/IXoCBNI2zHQn1B
 8AB29DttqQNlfLSd873EmWDQpLJqbKqPA0WJfPCvWb6TvdxSPSJKIuZrVHyr5d2wAB7A
 wJJ7S0i9bn3yhQigD9Kcin8kMjPza88zHACM2D/q1LvUNaZbIdDJSbbTEaEL/ccm7JhN
 V3pw==
X-Gm-Message-State: APuU4Z8bAyC9hwqZkdPxxHdO/kaiR3n8K2qKeP5r82pn7RVZWvN/efhP
 3CSVA2FV8i+/JsYlWHNeECAYNJiIodvgmvjC47SbpB0F+aMK6SWA893FThp8o3sttp8QLiTdrmt
 fWeVjhGThXQUdnEJH3rVObi0/Z6h4fqtDdN3ePu7DSu7wan1e4v2suVDlsg==
X-Gm-Gg: AYBFou3QJjIiypq8RB+gGeBeVZpjCFR802eJIAfD8OH22pB7rNuDzRNtr3qvYO3kcRX
 WR4bf1Ro5yQ5EVXhnMsdbIIRsCbldmcMJNzTou8FZwaezt/xPrKQshn5+LCz7uE4moYiUxXb9c2
 GBazX167MxIJNjdjnh8eGDvDkizJ85djvloTYQ/yi8unzMu2sVGLdOeRk0CxLgY5BVqxZcT0xrm
 UxJyXVLV9wKlf85ThqbiIO6xjv7ECgm4YwB8otKFfwPmqvTpTSuB3PAN/AoIb6qgE/QejB3fl9R
 CN5d6L7wsP3BWfH0DSRaDM2JaoKUg3Qrz6lS5vy0pz/lvBlU6ua1qCiKUT38yetc3VRid0vONcJ
 h/eoBxT7pKMn9TsgoSuLG+c3pu5ajp2iZ27DusenoLvWELXWZzXZtKAvnqCXD2hqk7nDEbfxQzu
 rm1Zonqp+I
X-Received: by 2002:a05:620a:4506:b0:949:6841:2ba2 with SMTP id
 af79cd13be357-9499957e2c2mr737145285a.22.1795031454980; 
 Wed, 18 Nov 2026 11:50:54 -0800 (PST)
X-Received: by 2002:a05:620a:4506:b0:949:6841:2ba2 with SMTP id
 af79cd13be357-9499957e2c2mr737140385a.22.1795031454400; 
 Wed, 18 Nov 2026 11:50:54 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([179.193.8.137])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9499b81d4a0sm256444785a.43.2026.11.18.11.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2026 11:50:53 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] target/riscv: sanitize mnstatus.MNPP field [GL4826]
Date: Wed, 18 Nov 2026 16:50:49 -0300
Message-ID: <20261118195049.1256735-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dJvY60sr_yPq08oHJbrElhAfYykRsyw8
X-Authority-Analysis: v=2.4 cv=c5Q+0h9l c=1 sm=1 tr=0 ts=6afe01a0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=a6tGUzlCxnQfwxx7nGpYxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=UnszTeD0MEx6vb_Bg3UA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX88gJfmtXjJpc
 YWOUpaRcajLAB7tzKxkB2dZBIqa+CA/Ki6Qhv8pKeaRujS63v+j+ZzXo6c+uAasUHa0t02a0wyz
 YsIWiijhRoGtMVCO5dZoA8WEMOs3W8U=
X-Proofpoint-GUID: dJvY60sr_yPq08oHJbrElhAfYykRsyw8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfXx+W4cCpGlVPQ
 x5awWFJ5xjGqocszee++9NPTo6qgPyd5xwtfD2j4HKZYVJmjsmR8xAFsDywKaLfvBX52qQ3Gg6K
 /S8ALhvX+HYJLNMFBp799XsBiDue9wtdXpkjwRoqzw2hyEVzfIf2TU6xUN4PqjsNEqAr/fJmEx4
 hcqWCvgT/ZfPHw5OR3aX1kjO/lYDdH2vEAiPDUm+nfMdxaChwXCT2N9VQHrEkEbf8uek7zKKEIo
 qi98xOtfeGI1G09GW9pduKCcCnGEIp+st0GO0TXwokaFC0KCG5FliWkIQ+N6AawcdGJDOgxwHVG
 h3Lo4ntY92KLDLPdrUMG22dyMl5TL4JG/3lh8siYN1fbEkVp4y+IT5TgiwJzUS6AO4eOuE2jehC
 KdR10tR3t1eTyPuhRGaPLddTehf5tcH+ToGOp9IPqod9n85QWQ7tRRXwkH5SjsfAESW4+5UjyYz
 ISHMZ5EW0EdB0O5NK4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180077
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We need to handle mnstatus.MNPP the same way we already do with
mstatus.MPP - do not allow the reserved value 10b to be written.

Fixes: 5db557f82bff ("target/riscv: Add Smrnmi CSRs")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4826
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/csr.c                        | 11 +++
 tests/tcg/riscv64/system/meson.build          |  7 ++
 tests/tcg/riscv64/test-mstatus-mnstatus-mpp.S | 75 +++++++++++++++++++
 3 files changed, 93 insertions(+)
 create mode 100644 tests/tcg/riscv64/test-mstatus-mnstatus-mpp.S

diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index af444e3e6f..eff5aec586 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -2023,6 +2023,10 @@ static target_ulong legalize_xatp(CPURISCVState *env, target_ulong old_xatp,
     return old_xatp;
 }
 
+/*
+ * This function is also used to legalize mnstatus.MNPP since both
+ * fields are located in 0x1800 and uses the same encoding.
+ */
 static target_ulong legalize_mpp(CPURISCVState *env, target_ulong old_mpp,
                                  target_ulong val)
 {
@@ -5789,6 +5793,13 @@ static RISCVException write_mnstatus(CPURISCVState *env, int csrno,
 {
     target_ulong mask = (MNSTATUS_NMIE | MNSTATUS_MNPP);
 
+    /*
+     * MNPP uses the same encoding as mstatus.MPP, ergo we need to
+     * 'legalize' it the same way.  Since they map to the same bit
+     * field (0x1800) we'll just the same helper.
+     */
+    val = legalize_mpp(env, get_field(env->mnstatus, MNSTATUS_MNPP), val);
+
     if (riscv_has_ext(env, RVH)) {
         /* Flush tlb on mnstatus fields that affect VM. */
         if ((val ^ env->mnstatus) & MNSTATUS_MNPV) {
diff --git a/tests/tcg/riscv64/system/meson.build b/tests/tcg/riscv64/system/meson.build
index 9edab1fd7a..a16ef84104 100644
--- a/tests/tcg/riscv64/system/meson.build
+++ b/tests/tcg/riscv64/system/meson.build
@@ -81,6 +81,13 @@ tests += {
   }
 }
 
+tests += {
+  'test-mstatus-mnstatus-mpp.S': {
+    'cflags': cflags,
+    'qemu_args': ['-cpu', 'max,smpmpmt=false,smdbltrp=true,ssdbltrp=true,smrnmi=true', qemu_args],
+  }
+}
+
 tests += {
   'test-xsfvqmacc.S': {
     'cflags': cflags,
diff --git a/tests/tcg/riscv64/test-mstatus-mnstatus-mpp.S b/tests/tcg/riscv64/test-mstatus-mnstatus-mpp.S
new file mode 100644
index 0000000000..b3a734ccf3
--- /dev/null
+++ b/tests/tcg/riscv64/test-mstatus-mnstatus-mpp.S
@@ -0,0 +1,75 @@
+/*
+ * Test if mstatus.MPP and mnstatus.MNPP will write reserved values.
+ * See Gitlab 4826 for more info.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#define CSR_MNSTATUS 0x744
+
+.option norvc
+	.text
+	.global _start
+
+_start:
+	lla	t0, trap
+	csrw	mtvec, t0
+
+	/* Set mstatus.MPP [12:11] and mnstatus.MNPP to 11b  */
+	li	t0, 0b11
+	slli	t0, t0, 11
+	csrs	mstatus, t0
+	csrs	CSR_MNSTATUS, t0
+
+	/* Set mstatus.MPP to reserved value 10b by clearing bit 11. */
+	li	t1, 1
+	slli	t1, t1, 11
+	csrs	mstatus, t1
+
+	/* mstatus.MPP must be equal to 11b (ignoring the last write).  */
+	csrr	s0, mstatus
+	srli	s0, s0, 11
+	li	t2, 3
+	and	s0, s0, t2
+	bne	s0, t2, _fail
+
+	/* Set mnstatus.MNPP to reserved value 10b by clearing bit 11. */
+	csrs	CSR_MNSTATUS, t1
+
+	/* mnstatus.MNPP must be equal to 11b (ignoring the last write).  */
+	csrr	s0, CSR_MNSTATUS
+	srli	s0, s0, 11
+	and	s0, s0, t2
+	bne	s0, t2, _fail
+
+	li	a0, 0
+	j	_exit
+
+_fail:
+	li	a0, 1
+	j	_exit
+
+trap:
+	# Any trap is a fail code 1
+	li	a0, 1
+
+# Exit code in a0
+_exit:
+	lla	a1, semiargs
+	li	t0, 0x20026	# ADP_Stopped_ApplicationExit
+	sd	t0, 0(a1)
+	sd	a0, 8(a1)
+	li	a0, 0x20	# TARGET_SYS_EXIT_EXTENDED
+
+	# Semihosting call sequence
+.balign	16
+	slli	zero, zero, 0x1f
+	ebreak
+	srai	zero, zero, 0x7
+	j	.
+
+	.data
+	.balign	16
+semiargs:
+	.space	16
-- 
2.43.0


