Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC7B60A381C
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 03:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Es1xt8k1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c4AlUyqa
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJMne-0002zZ-Ax; Tue, 20 Oct 2026 23:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMnA-0002rV-Sq
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:15:08 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMn9-0002SS-9G
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:15:04 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2FPOU2566068
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 U3DpMGeowCythJkDTUUiIMfi9/HZiEN+pyCuaLt1qk4=; b=Es1xt8k1MR2Gkpbu
 zSVDIOv4PfVYq8jiCEH/qUAllZs/ZZfBZDbwTJqTFtRA6VCgpfiwodnajlz4n/kF
 BknLgXUzjPRaablG7bjwzDZYB4w86HRvqBu99Y4yD40A7MDadm/raOgQAUum7nB2
 owyhkqmvYLSA0wdQMi6VS9K0QEka1s17Qe69CjJa/rtHc+VTwAWps0GU3rC4/0CD
 tAlzCFtSqlms3Ro86bxpf7JQ9UxnPqasMxR69l+9zTFnzqqEAErVL8Rvztmku+rH
 AL+F+FCKM6P0rQ7gnnuwmG/G59FviFe5F+colQl3EHol/kmW0wPCxJBnzZsGpVF4
 C3HdRA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd23nh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:14:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f33438950so69026785a.1
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 20:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552490; x=1793157290; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=U3DpMGeowCythJkDTUUiIMfi9/HZiEN+pyCuaLt1qk4=;
 b=c4AlUyqaiiRq3NMJ2jo6teNf/x1TSeznw5DwwW2mNjV88fyMs9DhoLKmTjeE/Gb6uc
 OHEug3W8iqpRKhHJDU2n3X+4IWzF1sQW7ftznO8S+tFkA69NiChfxcXZLs/ZwF1MU6MK
 9RJpkE3KGNEb9nEimkAe+OX2RCmKbDXehnxpPs2AQjqGL3oKGtEhJ2tA2hV5qcbeiuWy
 bXVHjecTP5dQHzNVzBvf8+janxLmCpJ4gWIq8ljCrwInp0CUAO5q29osEbR342SCSqdU
 mfqfe4BFRXnxx9ZVVl/0ModkS6u+L8myKoRZEY01hSDZ0xI1R749MJ6TkKqpyNl+hTXZ
 dIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552490; x=1793157290;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=U3DpMGeowCythJkDTUUiIMfi9/HZiEN+pyCuaLt1qk4=;
 b=a/eSh88ZCCIOOeQ26PzloCuNNNYvn4KTFSPmna5XZ32lg5sqeXCtMlBSGuM5q8nuya
 Lxs7glOL6sARa5DYoWXNv8gz8KuSIVS4oX1vTjVXIWNWr0akzUBok0FwHI/bhkc9zC3q
 CDpFL0h7zgBP7cKUO0hFI0trgk5ok+yb9/2vvn5UbkhMRMmTYBldjHKycrOgXV7xeeIU
 PyBNzhY0/1526lzpki+rxmizBibG/lb/A8IeGD2798uUjQKSCgE4hgiqGuGEJ4zTsUnK
 zKS9u6NmcmYzeIv8dSj5pXKJE1vTPQyS0YlM0f66BSD6KLUhT+x7kqTIS4+6TS4Yz4zL
 o9tQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzlthcCQhU/DhTLqmxN948pB/LVXUGU5rw+Mjs38rk3jxQNZZq5YO367YgH23IcbcQV5tiVL/XE23Tf@nongnu.org
X-Gm-Message-State: AFq9FYLn/EemDiAXI7fSp89x674uHhgHZT7WD72tsWJ/FJ+rAyN1b6gq
 /gHEIGLpbGOrAojBttJ6tw29s1lUiw8aWvsAOC0Aol+0gFHg86+cN7cz5wRKKbclQAqvnV1DCe5
 hVUYOhWMuGU6bd++E1m1rEJDhpEHLKYeCDS2IBW9O0i0+lMfjQS9f7fff5g==
X-Gm-Gg: AYBFou1ALg/dnVSftMyLuArNzNYCAc8fGqdd4Vhv56/ctBn1x2HWiO71I9ozAcstm8A
 ZHRbMubgkD3hVsGV3MxfCB7OqWbFOUpnj0qbQmwxfbEt3Wu2TF9xRo2cS1hp56JJOpBTTeP69ir
 /fqAmAzs8nOVG26o3gjokGGyUutyUVDNweEM+UoHEYPY6ij7SP4ex/89SfLfonvKxquyzdyuDI4
 q+LTPM5PFFXHNahW1XuQOiT5anXu1s1KLuzCDKjoR3bkFZbz7XVJg94c48Y6rU6lRpE5Q+az/0B
 nOjjrMK/2xD26b+YKJqox6FFqudk+nTl5KxH+aL6grsZ0SpvGsyd0W8d+8y5TdtBI0KbNic6hW5
 e0BUs520wN9nKX1zpUziDpLLSEKnG1CX2J2rq2wEK
X-Received: by 2002:a05:620a:4547:b0:93b:d7a0:d9db with SMTP id
 af79cd13be357-93f57ff06e0mr202367185a.53.1792552490194; 
 Tue, 20 Oct 2026 20:14:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4547:b0:93b:d7a0:d9db with SMTP id
 af79cd13be357-93f57ff06e0mr202365585a.53.1792552489696; 
 Tue, 20 Oct 2026 20:14:49 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e2584c374sm2209623f8f.58.2026.10.20.20.14.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:14:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 05/33] target/alpha: Use a static table in
 alpha_exception_name()
Date: Wed, 21 Oct 2026 05:13:38 +0200
Message-ID: <20261021031407.24862-6-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX6VfBlLSkClbr
 aRbkDsKSuOTYI3r5995QkoI0LttnZeCxpmK1GjqHErd7NCwYRD0gHICg8IDKIfFe+FnsO+C4Tlm
 GOLpU6Ry14G3sBMMH2G0IabjaGGp1Zs0Dx1B4jkNLT9e8QPE9aUnQRo5KmHNqWIAegwqt3nODAy
 NYnDW3csmDx3bUsJamD3+khBXFH0UG49VDxt+O4Wg5KIHJAkbQ5meNOw2C56ZrWZ8YBXAzplF0Z
 DJEcfsKJKTMLa0ztWr8Xfl/lfLFQXNZkgXeyQL2yDhimz4exHRXVIMV6818pj42V4I2uwmfOxXS
 SVTf8Hik4IbkuSnseAWP2n+rQxpay93oARpBzZjYly4E7YL/X9wG1297ygfffQMn4adSGHBK9Zf
 RU4rqiwKhqbHJbKQrkn6bXY1hD1p5Wuhk4c3OnUkK43cKcBxfqUT1cjHASNtnSEf9Kpxp4IWkRW
 QIM+O+LLxSZ/1vnrj0A==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad82e2b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-Zoeorw8py2zlXck_4IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: XE9b-OBp3HOKLkvv6WO8BvhUpx5DINjI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX6/dfek92g1tg
 dKCt2t4jhxrWNKCxe9etTzF6N52pipvcS5U+/oUmGY4fuavI9iR5fXXUtFkNdlKx/mTk4xDqU9g
 ap3PmyuJlNbzeG+oZ7i4Vh30ZijBnSc=
X-Proofpoint-GUID: XE9b-OBp3HOKLkvv6WO8BvhUpx5DINjI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210012
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace the switch statement with a static lookup table.

Suggested-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/alpha/helper.c | 54 +++++++++++--------------------------------
 1 file changed, 14 insertions(+), 40 deletions(-)

diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index cedb0006892..0fdb73074ad 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -37,47 +37,21 @@
 
 const char *alpha_exception_name(int excp)
 {
-    const char *name;
+    static const char * const excp_names[] = {
+        [EXCP_RESET]            = "reset",
+        [EXCP_MCHK]             = "mchk",
+        [EXCP_SMP_INTERRUPT]    = "smp_interrupt",
+        [EXCP_CLK_INTERRUPT]    = "clk_interrupt",
+        [EXCP_DEV_INTERRUPT]    = "dev_interrupt",
+        [EXCP_MMFAULT]          = "mmfault",
+        [EXCP_UNALIGN]          = "unalign",
+        [EXCP_OPCDEC]           = "opcdec",
+        [EXCP_ARITH]            = "arith",
+        [EXCP_FEN]              = "fen",
+        [EXCP_CALL_PAL]         = "call_pal",
+    };
 
-    switch (excp) {
-    case EXCP_RESET:
-        name = "reset";
-        break;
-    case EXCP_MCHK:
-        name = "mchk";
-        break;
-    case EXCP_SMP_INTERRUPT:
-        name = "smp_interrupt";
-        break;
-    case EXCP_CLK_INTERRUPT:
-        name = "clk_interrupt";
-        break;
-    case EXCP_DEV_INTERRUPT:
-        name = "dev_interrupt";
-        break;
-    case EXCP_MMFAULT:
-        name = "mmfault";
-        break;
-    case EXCP_UNALIGN:
-        name = "unalign";
-        break;
-    case EXCP_OPCDEC:
-        name = "opcdec";
-        break;
-    case EXCP_ARITH:
-        name = "arith";
-        break;
-    case EXCP_FEN:
-        name = "fen";
-        break;
-    case EXCP_CALL_PAL:
-        name = "call_pal";
-        break;
-    default:
-        name = "<unknown>";
-        break;
-    }
-    return name;
+    return ARRAY_ELEM_OR_NULL(excp_names, excp) ?: "unknown";
 }
 
 uint64_t cpu_alpha_load_fpcr(CPUAlphaState *env)
-- 
2.55.0


