Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A81CCDB466
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 19:35:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbkOM-0001AC-Pf; Mon, 22 Jun 2026 15:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkO9-00011X-3o
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:57 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wbkO7-0001tc-I9
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 15:32:56 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65MFVoJo3842519
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ZW1AS6UbO/D
 iXQEGb3FbTJGYHWMXWvoOX//tpmsFM7E=; b=Fhs1cV4OiLUUWTnEYWo9pSoq9C4
 xz8rj/nxlCjiCraRCMgH1iWT4lRPvmtkXKEIv2QJ4nDBnTyBHobOO5b7lP56DKcW
 mI8FQsbTqRDzo0pG3DS8ZjgzRVljRgNPQ0tMArgLHSdYm3wCEFcw3em7eLLOuHCC
 6s+is6wDRna7MnTnTRhLP5+uiDTp45C/FtUYE8z6i1A55hl4Vb5yosHYOimid5o7
 kXrkZwCcrpyrgsWF20O4kn167RvBhv+E6PDCZLvEr8jRuYo2dW14AyjZAYSVtMSH
 Iv1e5z+nMSsdmPO8WKGzbaRSoYyofPnU1+Io2N0HD8+Jcga3pE4dAbYtnMA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yht19n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 19:32:44 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8de3b53cba9so73169056d6.2
 for <qemu-riscv@nongnu.org>; Mon, 22 Jun 2026 12:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782156763; x=1782761563; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZW1AS6UbO/DiXQEGb3FbTJGYHWMXWvoOX//tpmsFM7E=;
 b=bm1Q7MnLh3RtjbJnZjA7gLA2LoKV1W/DBuDSXZFmZA7hVFw9E5KiQYm1vytWphKOF4
 FC3ljlLfgUluzE1Tr305RRXMrPnHv5JcyKaL4G7cHAOm9zr+UiW3LlgbP4OJmAxQ/NyA
 amTKzciRy7WHxBjiwHafvOmHWQVsKCgwVQAGJ1KrTkdEQhPPIsIMf2ClM8tdT5Ksz74x
 SussbQGwGmbEkyONdqjdstagFDzepOG7CAGDpX+N2uWI/imBbg70IpEyiRLeRCJU7697
 yADgcBHkNp4HkWKGELLblWwWIrC76l2Ih8hVUaI5ApEikO4V7fGpNxxnF5pBNpTN+QdS
 V2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782156763; x=1782761563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZW1AS6UbO/DiXQEGb3FbTJGYHWMXWvoOX//tpmsFM7E=;
 b=pTLiVbiCFT3qketWWiY4B2z98XL6jOuy8/EVM31vfJyyr2YoHis01J+Srh5PDfG5Kr
 ghOrvvY2y4aPCWyQCCIOYvyFcyzv7c0kNnoZfAvLDnFxtgC3GCAJtNltp2s0344No/NC
 uwMEGfaYq+bEQfU2b/gcTHFqd5kumnPcVor4lMfMuo/ehevNz1Qb8OoZdk0Cbu1dhYPs
 lh9PXjU0yv3xVhbHzXyWwcOW4ltxQZsA4PFsfy1E8x7JKMx4gGxt83tujSMqeMTENzRI
 U+9u39moDD7nenlJXWcgbMl0UHFrh/8CK9cNtUCxDexjvVL9OXo9z6DcskCLUOuoLcGk
 2vXQ==
X-Gm-Message-State: AOJu0Yz6EZ+k7jJGLte9TqP6gI4yOe7uKeYjmof5dBquPR8aq7baT3tT
 UhrLJgg+OxpgXIvahHqLUSeMYdRsCD8OOUf6KU9TU3YBKB4gTSQbIUCxvNGYhZfFduBBxFhE839
 JAi1kFOKwX4mSh0o3F9Qn6dDWNRFnSiRNZtzO9hQ3ZGGwPdFyCvkOA+ZKzw==
X-Gm-Gg: AfdE7cm40OuBqMQg9lU0Qx/iDJOYmoFXeNQb2FmSfl5McO/6nZNwUVNLs1TuXtryHDq
 WxoHzXRvwKVZce2UxB+byPDb0QvPedI8ltgCvbXvYgnqAjFfIQ+cx+i4v4BMCp2OncDSabl4YD3
 n0DKhn9ctTX0h9PqO9Ky3v0FLGO+t+U7W406lNbIvez89ls/AbGU2ekzpSbfaoeNAQUIfZFhOVc
 JuNV6v4tFJsDvaU5/9vU32ZJqaxBoQ1OTEgYtQaOhC0x+GsvfQ8S8Bgc16qKvL+i95fDm7oqq3D
 73yT1nC4GJbDTlUkNB2rOhAOUfIVAhfvi7OTxHkuj8Ngxp+9r/2zZkAKWITZAYUkdrY5RrfGlxW
 MgxSG87ykDPmubmuhYcRYzITCPShRPxqY1TdLrMoGa+MCig==
X-Received: by 2002:a05:620a:40cc:b0:91d:6ac3:567c with SMTP id
 af79cd13be357-9209119c552mr2633428785a.31.1782156763006; 
 Mon, 22 Jun 2026 12:32:43 -0700 (PDT)
X-Received: by 2002:a05:620a:40cc:b0:91d:6ac3:567c with SMTP id
 af79cd13be357-9209119c552mr2633424085a.31.1782156762587; 
 Mon, 22 Jun 2026 12:32:42 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-926004ab49csm61489585a.34.2026.06.22.12.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 12:32:41 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 philmd@oss.qualcomm.com, pierrick.bouvier@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 18/24] hw/riscv/riscv_hart.c isolate tcg only bits
Date: Mon, 22 Jun 2026 16:31:34 -0300
Message-ID: <20260622193141.1449724-19-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX/zrOqDvwXJj0
 uTA17gBinghI3ml2k1Zr49jlAySDgEsUVnhaoNFzs5tEl5WG+lmSaoJK/EjMYxTSPBk1dy4KqoH
 HK59rnBeylUVrMgJDSaovnKh0lmj3UY=
X-Proofpoint-ORIG-GUID: sYnKOFvxf4n8EJQqAulJoyYTnVi4dTfW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE4OSBTYWx0ZWRfX4lpmu5XArqxe
 vsUDkFcV+PMwsfR4cqH9t7IeN5U1JZHRshe4vlss3C3zDnyd1Uc27JxkBPKijnOn03tlMcGcMqm
 yNdgadtl/cg38Pz4AW/YYVw/7yR1d+NMupQ+XtJ8lRGCA6u4CX0FlCXC/1EG3mLLwpzvZVpYYEO
 KKLFkL3ERiGKk7f9LOusuVdtJz8rlcE0ho28yF56i2DW4e2rgVPUMWWnuqkJCcPpI7Cxb5ZagoN
 z7V+kdfy138dwZW695Ef0eCkBR/G27Zs4P7Qx7+wASsq4QQwh71xYJ0BoCIVM2rpWNvyFcwqMkt
 HV5Ydq9mkNTX1hHOok0O7l0LrWYCeO1/00FaSapHn+/awFbbXhfLZz1+cp4OabDrME2tcXpoT0L
 I0E/ZmshX6W+qel204lEveto63yhW4JcDrPxcQd17crX7phlUB4QT7EKw4+jo0zv9fLAEyxkLQX
 QzdSSr2hT4aNbtznZQA==
X-Proofpoint-GUID: sYnKOFvxf4n8EJQqAulJoyYTnVi4dTfW
X-Authority-Analysis: v=2.4 cv=cKbQdFeN c=1 sm=1 tr=0 ts=6a398ddc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=0nQI16K_ZF54athspwIA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220189
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

riscv_cpu_register_csr_qtest_callback(), vcsr_call() and
csr_qtest_callback() are all TCG only and are not available in
--disable-tcg builds.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/riscv_hart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index d1c7188369..28925aee59 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -61,7 +61,7 @@ static void riscv_harts_cpu_reset(void *opaque)
     cpu_reset(CPU(cpu));
 }
 
-#ifndef CONFIG_USER_ONLY
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 static void csr_call(char *cmd, uint64_t cpu_num, int csrno, uint64_t *val)
 {
     RISCVCPU *cpu = RISCV_CPU(cpu_by_arch_id(cpu_num));
@@ -151,7 +151,7 @@ static void riscv_harts_realize(DeviceState *dev, Error **errp)
 
     s->harts = g_new0(RISCVCPU, s->num_harts);
 
-#ifndef CONFIG_USER_ONLY
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     riscv_cpu_register_csr_qtest_callback();
 #endif
 
-- 
2.43.0


