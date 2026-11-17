Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FD3606A31C
	for <qemu-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 18:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=asDtRVp1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=joTvNjQk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xTO8h-0006oL-MG; Tue, 17 Nov 2026 13:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xTO8f-0006nt-0a
 for qemu-riscv@nongnu.org; Tue, 17 Nov 2026 13:42:41 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xTO8d-0001Ox-5I
 for qemu-riscv@nongnu.org; Tue, 17 Nov 2026 13:42:40 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AHIEVvK1033158
 for <qemu-riscv@nongnu.org>; Tue, 17 Nov 2026 18:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=ZwkE+cqsbCIol09eC1DsbCRbF/8CiHnv2+h
 p5yjBm5U=; b=asDtRVp1KD/SVFMLYjuj5DP0USanr9qUhCqGFpzJXcX0YC9v0yJ
 edSXq+xlI+pAE08uoxAc5xW0y3zX2fxbm2iYq6SaGpBczESBxrUJMK4vYCIw+Nyr
 19Kp50g5SB8Lm58K7eF0+sMC9FcG4mn8a0LOSTO46ZvWygkDVxNVkEkc1KNMgTLL
 /klEZZV59B4weKj0hCEDtFC3p1ZJ7UbJ1r4i1aLolAvPs2BykGmgpBvSiRJnTcgM
 JLXPauxG63yKIeLF4g7D1aTB/QrXzq3ga7jBv/todkYDsCH87tJbEDdgGpjnvcL7
 2v2JJ4ZQYknuxwmn7sDwTJ/QucGRqqQepQg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0v1fg3tw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 17 Nov 2026 18:42:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-55bb7f70b06so21560591cf.0
 for <qemu-riscv@nongnu.org>; Tue, 17 Nov 2026 10:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794940956; x=1795545756; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZwkE+cqsbCIol09eC1DsbCRbF/8CiHnv2+hp5yjBm5U=;
 b=joTvNjQkcn1+K3ZDivT0Tb1omYKS4YNNVkFCygpnjjUStMDL/afrp4JYrozX1LeTq8
 NTqFBKUdHaX5i1q32MepYPVcOcx6YzDKeBNO5dUUzd+q+AcX+4o85y3dqz5cvrKYg8Mr
 9Zga1pTYCGVJBBIihwWN8eDCZT32mRC/8U/h+AdY2IaU2vJYo4rtM7LiZdSRxxcnFJJl
 z7iYicXx6Du8eB44VW+5aUdlU8fqPTd9jtJoD9OUNdzLUzlnioBEXiiGANlkfFNcj9cg
 NLzbR/jVvyRgUKlbsDZsEmCY6Il6tWjYRqivycyRlTFcX0kfgv71uU2p+qZk2XVVs+Xw
 cetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794940956; x=1795545756;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZwkE+cqsbCIol09eC1DsbCRbF/8CiHnv2+hp5yjBm5U=;
 b=HNPlWTx61BCM752FeO/Ui9fBXa80oAQZiXzuewGWOKS/UF7+0mvxaQ2Xkn6WvpGGJJ
 V20yCs+2f0yDh8dTOIldrf+QS2fQkYmAe/gVuchT7UjDrGw9OErk2eXD0jXllXg2TdGB
 UbS78dtp6q+xw6njyNQ3uX8/LKv5JkT3OqsPKZgIlx0xtVT6vjgrBysMJP6vidG2pJId
 KX8qtSTUZPMGj9Y3i2VLx8qANgjolnHWNFYGVCUklVLH7zoLL+m+ukZQqqUiMnoyghLG
 765lf1tdHsLoiH6IOzYCNTBZQYaZqPRiCH1eDvjvoyCP1ftWzVwh6RVqwn0CfotEk2ND
 wNUA==
X-Gm-Message-State: APuU4Z91Ux2tu2wHvUr3svAb+PYzBU7zp4niWJMskzEVVG+Ku0zGk5sD
 dzFtsAZtX01y24yqViibVXJK6r55aWqbRORjkluzY/UkvYxrMna4GCHD+4hgRbGVqnXQr6FcdO1
 //fIGAMNyyHXAUrIbOsXIxDrXxFlhVmfIMhR9VQ9+ih4+K4OmKNb2pTsLSg==
X-Gm-Gg: AYBFou3VWukZGAI+xG/nWoC8NEYwy7CFNXCHX9AgSko96fRi+tcDd9Ble+zD2+lo+rI
 ml46mnWdCBUfNHVHYunQpRlMgfepSmXMsB1tSl2PKiIpYWdkOGm9/jFBzORodHTLtBa5w2lqNHm
 lh+XmsxjdmX+uiq2yV/b7szAhhtTKBe6S6paSVpb2Wz22XJFHVZp5QX7MyJlphVwHBQ/gsOdt3e
 POtno7c2JP+vtQ0fuj9sbjoAhgNebb60GbwJ8+csiUVh4Brr7Gkci4bhPbBs5rQ+1fDT5rkN4RU
 7m6gikGUvnOg/hXnLoqIqREg+6H0VdKMRH8G9Si4GUgAff5Mwo/2eNQJiOP35uRmkMKc0eC+SkV
 zKaK6mrDWoZd63H01evqF4ARWPsrGyqg5lUaSuZVdTmpLVR0vD0TOMGc88Z9Tq637P5GkO6LaPj
 HnsCS5gxLs1+8=
X-Received: by 2002:a05:622a:1f93:b0:536:18c0:ab9c with SMTP id
 d75a77b69052e-55d495bc917mr51399051cf.43.1794940955483; 
 Tue, 17 Nov 2026 10:42:35 -0800 (PST)
X-Received: by 2002:a05:622a:1f93:b0:536:18c0:ab9c with SMTP id
 d75a77b69052e-55d495bc917mr51398611cf.43.1794940954906; 
 Tue, 17 Nov 2026 10:42:34 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.227.223])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-92114a00ad2sm1035816d6.3.2026.11.17.10.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 10:42:33 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] target/riscv: filter out reserved (m|h)envcfg.CBIE value
 [GL4216]
Date: Tue, 17 Nov 2026 15:42:28 -0300
Message-ID: <20261117184228.1047755-1-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2TQ1LvC7-8HYhEyhjTbK2BUZSPELUYfK
X-Proofpoint-GUID: 2TQ1LvC7-8HYhEyhjTbK2BUZSPELUYfK
X-Authority-Analysis: v=2.4 cv=IbgSymqa c=1 sm=1 tr=0 ts=6afca01c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=WERq1Tg1Nl5IKGfG0e6imA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=ZgkQZYNTZRhgL34ysRAA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3NCBTYWx0ZWRfX5I79WT8OCAaq
 iegP+RgcnDSZOHiy/KLXVYXTRZ3zl3cPelGFHWQ0nGDJdn9ykAmcfxfKzTbWz679iMBqbECLOlZ
 rpjUc3HFvOaaRmFsmc5LHhLzF5yBikO52RAWqkFmK+wEKoYmuyxfB0o4dQ797rZTl/Y3TSuvkNH
 qFaH5Al78plXNyotFz1+J8LuuJIxqKv4Rp6sYoHOmmxplu5V6ZH5mzQox4CImN/ou7M5mn/v8Mn
 6IU8LSPg1pXvwqFJ69yHxOH9rDsq6Fu8Hdwi2L+kExH1VUjGtF9owrxl2T+5VvlUS/MBjw1qRMr
 CChB2vwe6ysgd6HpdlMRfdfPn0aHt3DKjqnivPfhW1W+z2IsWzZG+xG75t1chMJQNgyKjEjc/hM
 hFDO/I96CJg6jkTrQtp7P9H/VKpsbf30BWmvWB2GxrGcjQ2sWgiDj4MuXVmptOOn5XvUmXOZQL1
 tcLevstHXRK0j3+NfzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3NCBTYWx0ZWRfXxZgQOwaazG6j
 VaADhobM2f6wE62nShOJY41BlLdcjrMdneMxy6r8Nonj+FebEiDLm2A6yxAUVPEpIf4AbHbiR8e
 /xU4KYh3SqcLdAUmO51GxEw0C1ZjYtM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170074
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

We can't allow CBIE = 10b to be written since it's marked as Reserved.

Fixes: e979f6a15552 ("target/riscv: gate envcfg CBO fields on extensions")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4216
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/csr.c                | 14 ++++-
 tests/tcg/riscv64/system/meson.build  |  7 +++
 tests/tcg/riscv64/test-menvcfg-cbie.S | 82 +++++++++++++++++++++++++++
 3 files changed, 101 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/riscv64/test-menvcfg-cbie.S

diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index af444e3e6f..1ba5835e1b 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -3396,7 +3396,12 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
 
     /* CBIE/CBCFE are read-only zero when Zicbom is not implemented. */
     if (cfg->ext_zicbom) {
-        mask |= MENVCFG_CBIE | MENVCFG_CBCFE;
+        mask |= MENVCFG_CBCFE;
+
+        /* CBIE = 0b10 is marked as Reserved.  */
+        if (get_field(val, MENVCFG_CBIE) != 0b10) {
+            mask |= MENVCFG_CBIE;
+        }
     }
 
     /* CBZE is read-only zero when Zicboz is not implemented. */
@@ -3578,7 +3583,12 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
 
     /* CBIE/CBCFE are read-only zero when Zicbom is not implemented. */
     if (cfg->ext_zicbom) {
-        mask |= HENVCFG_CBIE | HENVCFG_CBCFE;
+        mask |= HENVCFG_CBCFE;
+
+        /* CBIE = 0b10 is marked as Reserved.  */
+        if (get_field(val, HENVCFG_CBIE) != 0b10) {
+            mask |= HENVCFG_CBIE;
+        }
     }
 
     /* CBZE is read-only zero when Zicboz is not implemented. */
diff --git a/tests/tcg/riscv64/system/meson.build b/tests/tcg/riscv64/system/meson.build
index 3c8b018d9e..3e82fc83a0 100644
--- a/tests/tcg/riscv64/system/meson.build
+++ b/tests/tcg/riscv64/system/meson.build
@@ -89,6 +89,13 @@ tests += {
   }
 }
 
+tests += {
+  'test-menvcfg-cbie.S': {
+    'cflags': cflags,
+    'qemu_args': ['-cpu', 'max', qemu_args],
+  }
+}
+
 if 'qemu-system-riscv64' in emulators
   tcg_tests += {
     'riscv64-softmmu': {
diff --git a/tests/tcg/riscv64/test-menvcfg-cbie.S b/tests/tcg/riscv64/test-menvcfg-cbie.S
new file mode 100644
index 0000000000..324993d214
--- /dev/null
+++ b/tests/tcg/riscv64/test-menvcfg-cbie.S
@@ -0,0 +1,82 @@
+/*
+ * Test if menvcfg.CBIE/henvcfg.CBIE reserved value 10b isn't written.
+ * See Gitlab 4216 for more info.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+.option norvc
+	.text
+	.global _start
+
+_start:
+	lla	t0, trap
+	csrw	mtvec, t0
+
+	/* Set menvcfg.CBIE [5:4] to 0b00.  */
+	li	t0, 3
+	slli	t0, t0, 4
+	csrc	menvcfg, t0
+
+	/* Now set it to 0b10.  */
+	li	t1, 1
+	slli	t1, t1, 5
+	csrs	menvcfg, t1
+
+	/* Read it back, rshift it, check if it's 00.  */
+	csrr	s0, menvcfg
+	srli	s0, s0, 4
+	andi	s0, s0, 3
+	bnez	s0, _fail
+
+	/*
+	 * The same constraints apply to henvcfg.CBIE, thus we're
+	 * testing it like above: set it to 00b, then 10b, then
+	 * see if it's zero.
+	 */
+	li	t0, 3
+	slli	t0, t0, 4
+	csrc	henvcfg, t0
+
+	/* Now set it to 0b10.  */
+	li	t1, 1
+	slli	t1, t1, 5
+	csrs	henvcfg, t1
+
+	/* Read it back, rshift it, check if it's 00.  */
+	csrr	s0, henvcfg
+	srli	s0, s0, 4
+	andi	s0, s0, 3
+	bnez	s0, _fail
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


