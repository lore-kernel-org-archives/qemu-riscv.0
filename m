Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3508606A31C
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 17:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QNKIBG+c;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YMZKWbED
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xT0Xt-00011V-Om; Mon, 16 Nov 2026 12:31:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xT0Xq-00010U-Aj
 for qemu-riscv@nongnu.org; Mon, 16 Nov 2026 12:31:06 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xT0Xn-0005eZ-88
 for qemu-riscv@nongnu.org; Mon, 16 Nov 2026 12:31:06 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AGGIZbq2791035
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 17:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=rnDjRUpV946
 o5StxaET/HJ7SafmpRbN/19UItFmMXjY=; b=QNKIBG+c97uD5HmxmrbEhu4eyg2
 xudQV1EIDHM8ye9Z/h2VemRjv6EZI+m3RBfvDAlyXZwYDKJqtYLbRM37GZDKPrcC
 M+DSplBk93wc/XfK95lWpFY1OlR2d3pizszh+dumPwxe8WOBg4pmZNIb8/kWv2d+
 GYqcq+v5ij4jYIQQeeSrl+2RwWoVN5XSfuOqdaUyVeHWN/RJqtr5gCPGGbb+tbIF
 usGA/pNNkAnNie29WK//utZfgS9mhpT/qiHdCngTGxDgYEkiL5WOPx6/T61Ur6yB
 S1GLV6inaURTnMG9vpvsT4MnuFthBvcNoEL5bagJz36Q4xDAH/oJxQ+pCxA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfhh2j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 17:31:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93e92aad34aso745031485a.0
 for <qemu-riscv@nongnu.org>; Mon, 16 Nov 2026 09:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794850261; x=1795455061; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rnDjRUpV946o5StxaET/HJ7SafmpRbN/19UItFmMXjY=;
 b=YMZKWbEDLl1sDblZNg+YtmSWtwN/GnOb6yAZXm23TnwK4P4b7+ZbxVFrFiRewOYNCM
 h8/L+Cn4CiUnGPu27rwt6G+Y6MilLZz+881H4IE3eRvu6HAuX6ecQQjbYB0ooJeeF9V4
 RvZ1Gry4qTB3Sz/x0wD5bryv+RXcej4y+V2nEUpZ6Ulea1sHuy3bmzciJ8oz9CG9g33k
 AUA55HA4Z5gHmRIej9+F6gCoDwKrl0GMZStoU5e0wC6mPW3gKyvEGrPSSIwvjENYY+J/
 SntWGXYthe4bHni7VWM/mSwxyZlcYEVhnOJ0BmLoXUmSwDryd2oM8wgY2IuVdlZAjyba
 2YbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794850261; x=1795455061;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rnDjRUpV946o5StxaET/HJ7SafmpRbN/19UItFmMXjY=;
 b=aEzV7nOBhh70Q32mD34EgIjQA866txaNGV9za6DPZgwVbfUifP5W4w2HiU+dT2P1Zh
 rsLYqXuGXjIYkUdwp5jOE88qZMMUDO2gQQ21vstOcehfGexLPhdhulKzHlMapP2FFrJ/
 Ooal9OanbdGQcf1KbyG82M47P7i+/Q0s5YNRrtgIIVgB47geP/1oGQXZyznX50Xuqq5j
 mUjhjysufHEJcfZw1pyeI2PwPA4sBM791eLHObpACHOXhhumaBKtMYpmjIdeRMQWY5gP
 E7+PnpCHh8NRS3yRjmVh+ZNYLMs5YpLLF2o2CWt0s1ukJ9xWJbLJ/jVNpa8/Cq24MYeQ
 Tq4A==
X-Gm-Message-State: APuU4Z+8+9v8GcSq3vwEeYxPPJfSuH8p/GMUURNEIfe2MbnkmV8tGNe6
 rldI9TNzWcajtLczU0AZFnf1zE8SBr0CbaSdVRXI5Q+PFt0ujSPoskrmvEMe/Nq0gn8JmxNjdB9
 v3ZnzjDnzdQm9rHdX2Q0xAG9msOKvSiM4nSYRfWTDW4mZE+IBahQpz5LEfw==
X-Gm-Gg: AYBFou0GQH2KzVwuMAGw5HfP38qltZMEQ7Byuxh0htjGmqd9z/vijeyuCRgXQKQV51h
 Q/DWZP7UzAIW7AWLlfE8YxzUmU3S561AkxIvwBvwVvjEGUVQeqDn9kgcG4drp1txP67fo1jvmIF
 PCFNM5+FeLLkSfb43okh3wKLyQDvpRsTxJS7rzh8x05iT5vbmC4LgXwSzcgafZVFbVwn/DcOTZh
 hwuUhfiMzSBTOLBdWdF01eIkaKuF2RYM84vV9oav0SDQJX9HGZuFm0HIEzkUFkMvtBLZp+VxHKX
 JPTUFy9Ll93EpW5hZNp46Ovgdjn3kmofg3uq9LgT3l1Y4h5QkU6HJtyy0S8jc4yTEEJ+OhfTn0U
 nzQpkNifmGnz2yTzFKOQPy1AudENssfgK24GDLvvHbIAPkFEWwy+INI24paauKIFOBxk+TtstxD
 LNtRUx8+5qgsY=
X-Received: by 2002:a05:620a:31aa:b0:949:6d4d:2396 with SMTP id
 af79cd13be357-9496d4d2504mr1042147685a.27.1794850260999; 
 Mon, 16 Nov 2026 09:31:00 -0800 (PST)
X-Received: by 2002:a05:620a:31aa:b0:949:6d4d:2396 with SMTP id
 af79cd13be357-9496d4d2504mr1042143385a.27.1794850260516; 
 Mon, 16 Nov 2026 09:31:00 -0800 (PST)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([177.170.227.223])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9494c8b5c1dsm898530385a.33.2026.11.16.09.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 09:30:59 -0800 (PST)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 3/3] target/riscv/tcg/csr.c: add mseccfgh CSR [GL4680]
Date: Mon, 16 Nov 2026 14:30:47 -0300
Message-ID: <20261116173047.812886-4-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116173047.812886-1-daniel.barboza@oss.qualcomm.com>
References: <20261116173047.812886-1-daniel.barboza@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afb3dd5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WERq1Tg1Nl5IKGfG0e6imA==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=p0WdMEafAAAA:8
 a=EUspDBNiAAAA:8 a=8OGCS-QHHjKBapB54hwA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2OSBTYWx0ZWRfXyte15KktSLhM
 +C/JrxvNN5eNTkYvfOBGnBhc7H6J9KnIbwn2eSDT9/o4FOGCKwcCOXJNWiea0MXxzgMSoz7kWM0
 egtGvPsWYMTpd3PH/0PesrKvgJkOMOk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2OSBTYWx0ZWRfX376377DJYHM+
 r0AGrRiJfDlOM2IzyANdBTEPYY7jwG7qf5r5xgW8DDQAIYVoAq6HBEQzOuFZsvoG+kQ5CnWzQyd
 i+DooUI0bP18fFIHFW0uveyMotn6KWQmNynAP4CwU/kEZKBCPPiQ8jazUqBNthphQxNwYohDRc8
 XMX+ZlDs5VCXTYlhWxvCiGVmVQWT9/yrX1YXs9Gmu/p8N5n0/g1DoCvXWftEhZ0XGmTnL8oLU83
 fkWWjgWXU3eVgILXY6mLyXR3czqhY5pRx+4ZNI0n1W3ny6PAAOrpfry+Sa1V3fE1wlOTo/EI+g1
 ax3NQxWxQBLb11tnZ1D0gQOrgNDxAP0CJTq3oZ/it4FTNxLJanMvRusA2uk6bgsh9NDvCXp9wLB
 dTDp9bxvls/T0NulHQ+7D3uvCMSjmd35o7qkrwvdusLJYLso6FUGGpz0NFa7mH5JllpqpXe+5J9
 O3VGosr8JdnFKqSknxA==
X-Proofpoint-ORIG-GUID: y00ZDi4kNDKiOOc3sT3QUf7S6A8MBpup
X-Proofpoint-GUID: y00ZDi4kNDKiOOc3sT3QUf7S6A8MBpup
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160069
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
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Even though the mseccfgh CSR is a read-only zero the spec requires its
existence for RV32.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4680
Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/csr.c                  | 32 +++++++++++++++++++++++++
 tests/tcg/riscv32/test-mseccfg-bits-1.S | 15 +++++++++++-
 2 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
index af444e3e6f..f0b59f5f94 100644
--- a/target/riscv/tcg/csr.c
+++ b/target/riscv/tcg/csr.c
@@ -805,6 +805,15 @@ static RISCVException have_mseccfg(CPURISCVState *env, int csrno)
     return RISCV_EXCP_ILLEGAL_INST;
 }
 
+static RISCVException have_mseccfgh(CPURISCVState *env, int csrno)
+{
+    if (riscv_cpu_mxl(env) != MXL_RV32) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
+    return have_mseccfg(env, csrno);
+}
+
 static RISCVException debug(CPURISCVState *env, int csrno)
 {
     if (riscv_cpu_cfg(env)->debug || riscv_cpu_cfg(env)->ext_sdtrig) {
@@ -5612,6 +5621,26 @@ static RISCVException write_mseccfg(CPURISCVState *env, int csrno,
     return RISCV_EXCP_NONE;
 }
 
+static RISCVException read_mseccfgh(CPURISCVState *env, int csrno,
+                                    target_ulong *val)
+{
+    /*
+     * The higher half of mseccfg has only PMM.  The spec says:
+     *  "The PMM field is read-only zero for RV32".
+     * Ergo mseccfgh is always 0.
+     */
+    *val = 0;
+
+    return RISCV_EXCP_NONE;
+}
+
+static RISCVException write_mseccfgh(CPURISCVState *env, int csrno,
+                                     target_ulong val, uintptr_t ra)
+{
+    /* See read_mseccfgh().  */
+    return RISCV_EXCP_NONE;
+}
+
 static RISCVException read_pmpcfg(CPURISCVState *env, int csrno,
                                   target_ulong *val)
 {
@@ -6508,6 +6537,9 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     /* Physical Memory Protection */
     [CSR_MSECCFG]    = { "mseccfg",   have_mseccfg, read_mseccfg, write_mseccfg,
                          .min_priv_ver = PRIV_VERSION_1_11_0           },
+    [CSR_MSECCFGH]    = { "mseccfgh", have_mseccfgh,
+                          read_mseccfgh, write_mseccfgh,
+                          .min_priv_ver = PRIV_VERSION_1_11_0           },
     [CSR_PMPCFG0]    = { "pmpcfg0",   pmp, read_pmpcfg,  write_pmpcfg  },
     [CSR_PMPCFG1]    = { "pmpcfg1",   pmp, read_pmpcfg,  write_pmpcfg  },
     [CSR_PMPCFG2]    = { "pmpcfg2",   pmp, read_pmpcfg,  write_pmpcfg  },
diff --git a/tests/tcg/riscv32/test-mseccfg-bits-1.S b/tests/tcg/riscv32/test-mseccfg-bits-1.S
index ffa88f5f2f..01c29577e1 100644
--- a/tests/tcg/riscv32/test-mseccfg-bits-1.S
+++ b/tests/tcg/riscv32/test-mseccfg-bits-1.S
@@ -1,5 +1,6 @@
 /*
- * Verify mseccfg bits USEED, SSEED, MLPE and WPRI.
+ * Verify mseccfg bits USEED, SSEED, MLPE and WPRI.  Also verifies
+ * if mseccfgh exists and it's read-only zero.
  *
  * With "rv32,u=off,h=off,s=off,zkr=on,zicfilp=off" we expect no
  * bits being written in mseccfg.
@@ -11,6 +12,7 @@
  */
 
 #define CSR_MSECCFG 0x747
+#define CSR_MSECCFGH 0x757
 
 .option norvc
 	.text
@@ -38,6 +40,17 @@ _start:
 	andi	t3, t3, 7	// USEED, SSEED, MLPE -> bits 1, 2, 3
 	bnez	t3, _fail
 
+	/*
+	 * mseccfgh reads the higher half of mseccfg, which contains
+	 * only mseccfg.PMM.  This bit is read-only zero in RV32,
+	 * thus mseccfgh must be always zeroed.  Write a full 1s
+	 * mask in it and verify.
+	 */
+	li	t0, -1
+	csrw	CSR_MSECCFGH, t0
+	csrr	t0, CSR_MSECCFGH
+	bnez	t0, _fail
+
 	j	_pass
 
 trap:
-- 
2.43.0


