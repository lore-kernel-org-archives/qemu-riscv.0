Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F768606A32A
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 14:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vx4dg4Ef;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OLfjWCAO
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xM4kI-0005Um-78; Wed, 28 Oct 2026 10:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xM4j7-000525-7B
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 10:34:10 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xM4j4-0004TO-6N
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 10:34:04 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SBeAid1606932
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 14:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Pu830gYy8Ds+PNBWkxWcCVyGsAlz+zZD8vp+WSahDtY=; b=Vx4dg4EfQSfXXq0g
 /HxCv2An9cY1cGFFKCWf6rF5pDeau5H+feJtWbQ9YL5raTfCSYuZk29SUJiqIocK
 T7rdfcKe0J+3DXjsWDquTin4Uz5JGe0m6tzJ3btfb5/POkWVpl4zTvGTzQy+nAC4
 E64B4jszqdWLfSomrqhE1ZxkydghPpfL4MohLvVmmX3wi2DTkfRKCe9sRlZ+KOXC
 BLuuryc4wix4zjepDPcSiHXos5hEmdlNj8yf7yVQxGOorvGbBONCqeF3XdBNA5Kv
 s2+ncgcq2uuvV4KNGA7hXx/tm6Q+MGL3LwpDf1oQrG8sTFnaYZ6Nliv474GOlL8I
 8Hvp2Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7jn9v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 14:33:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93ecdc701a2so120733785a.3
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 07:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793198037; x=1793802837; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Pu830gYy8Ds+PNBWkxWcCVyGsAlz+zZD8vp+WSahDtY=;
 b=OLfjWCAOclBYRuHQM7Sccr+fGiTDihkCIjYL0g7JbsXg8lIyJ0qKV4mMgCTFhn+r+c
 hzHUTo+axJqByv4RnfSqYFHZY1hq4Rh89/BgaoNpNUceBZ1XeJmSOt91pb9FhvSAc2WV
 kTRB6zHcXNvpLBgcmzzsfWtFibyxqiHYteHJX0v9fFZx7P4sVil0T91nzsIykrEzyMXi
 kQ+iCw8MqL5cnlOEVZNV2y9psAh5jZ/skVA4Aa7sE7r8I2joJ/8W0uErnAbPCQBAy8ql
 JxTRhbO9f9rduliZWHRfrDSQPTdDq+Qh8h02EdT6eT3IDeO14fbTqCK6z/Xl7yZB948O
 v5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793198037; x=1793802837;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Pu830gYy8Ds+PNBWkxWcCVyGsAlz+zZD8vp+WSahDtY=;
 b=shQPvhbSqOHfM09fr6WNe9FZ85FPHZCTA7NgAM1nw0+jSktWoWAeqcA/SqDpeBFCs+
 YVmjiFevLRoYR+8G7AuUQ4esdl8IkL4swH31rJzkZp+m4QchufILMImbq3r2e3vJZHCd
 O08UYoYVrD4o1dJ75l7tevEkXEcZFks9NIlHh7ft/ftQKAilxdrVwznjthte6pj8ZPlT
 3yHE4THg4TaRth/hR3ce9W3EBWtvPVPFoeMMZkOsWeH3X6q9HiQ91aaOTtGjqRblfZzP
 dfCaphubpNEO/XtL8K9ZOjZiNe19rbx7AaoDuvUhMGz52P8hsP/U5sPgvAFXOL6ztb27
 NrTw==
X-Gm-Message-State: AFq9FYL8di93R9sVyyaod/tWoXwECDCIGc3xWCW3k29FLISfXm2T+W1U
 gEZNGV6DQv9TXbFZ84oR85O299WP1Tf5mJGx65sd0AYwPTpjqCyDBCvlQMBqivR5wivzdkja++Z
 5w+/3XLvoa6JdaCHoyXajyCHJGBTBtV9Wi8hGvrp7zzt6VJl+9aDuuEdPoQ==
X-Gm-Gg: AYBFou3BUaHgxzAJSxAn0U8RpBDt5eO0o1hw1OFKPewSlRGedAQruxpaqcP35rNq4T9
 IpxNiGzbziDEerBExL6/Q9W4bmERgQGcwKU04b/xNKHA3CancH8BsGw7vuJxnHyqINPnt7/TlZ7
 RqxO+eYIfHJ8jkFy0mgX89MT+1WaXRim1B2uHXtV/BmMch8gTu4F+VzFEjrrx9z4btRpbPA0+nq
 2QVHpkl5C/uD90MY3jP5q6l8pMYiweoQElQkK20fspH23u+zAQVTQmkpwjsZVoxTo83NdD3ABQQ
 wLoRjT8XxgQOKsW6jmC4uTnD09WnbNBGvi0vWb7hHgNK4e8cevx29d31JcyqCvGxGBWKREx+8fg
 l9LV7wGuvnzUYIpTTtovZtz5mtm7frk3Ks06HDTkaLblFoHrDjFONgihKqE/v93ZcOfStz2Z17O
 NaemaEKeuVE7dUtc8MUZecX/ChpzL2fg==
X-Received: by 2002:a05:620a:458a:b0:93b:bce3:5499 with SMTP id
 af79cd13be357-944089393e4mr364658785a.6.1793198036450; 
 Wed, 28 Oct 2026 07:33:56 -0700 (PDT)
X-Received: by 2002:a05:620a:458a:b0:93b:bce3:5499 with SMTP id
 af79cd13be357-944089393e4mr364654285a.6.1793198035981; 
 Wed, 28 Oct 2026 07:33:55 -0700 (PDT)
Received: from localhost.localdomain (82-67-153-177.subs.proxad.net.
 [82.67.153.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a97c9f1403sm54169865e9.9.2026.10.28.07.33.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 28 Oct 2026 07:33:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 3/6] tcg/riscv64: Extract elements for vector arithmetic
 immediates
Date: Wed, 28 Oct 2026 15:33:27 +0100
Message-ID: <20261028143330.6518-4-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028143330.6518-1-philmd@oss.qualcomm.com>
References: <20261028143330.6518-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfXzhOUe4929Ve3
 UiFtmTu35GXXenkOROTDCxboxdk/fhyDwvwd28d/Zu5kHx4aRVbWmtj7JZXvV7lOCMYsQdj9/Gh
 4XcKOGKxnZz+P3ESeQ5YLSAjZ7Z3Nx4=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae207d5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=njo3DiN-QtZAaPIEphkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: WbigyLugyNqe77jsW5sIYcaQN5fdGnkF
X-Proofpoint-ORIG-GUID: WbigyLugyNqe77jsW5sIYcaQN5fdGnkF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfXw8I8/YyesZZI
 YDiVcYaq+gh5m37tw/zWdL2Cw6sBgvb8OWELyDwWHlXw+3oXYcw13cbKSosNGoWwc1eCv6RIX2h
 vw0aXu+r9+plT+YRevTpPl8WP4l+svJRvDsI2pmXNSWID7m2xrur5eZjnxA3dvxpj1Ruy4bieTB
 mZlZZ/hVoyYa9Xmxi6M9P0sbOejZ9khnT3VIKzRFn+1oC958PlKhCpnZs9/Y4e140DWorSCvURB
 q0//zoyRaztFg/hhGU2XtyEq1MdjeoltvGALLEEbVRphB9Q3FXH321G7ddCDcaKEoFPihRiCz7P
 oNWe2OORY5YepNIolJ3fG/BR14z/+8Jdi6YJzwPyTSsZ1p6WwhvM/7EXbzcujhDO0UkoWwTvSA1
 D7XbFURaYAX5RhChj2DM4e9Ne84UXbdkfEGhaDr/4DHqMy30s8CWBULKNcCSe+pqoCnzO49dW1D
 NI9S1t8Wgs8mElZbfKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280057
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The .vi emitters for add, reverse sub and saturating ops pass the
whole replicated constant (e.g. 0x0505050505050505) to encode_vi()
instead of a single element. This aborts debug builds on common
vectorized guest code and is undefined behaviour in release builds.

Add vec_imm() to extract the VECE element, and use it.

Fixes: 006352d69f14 ("tcg/riscv64: Assert immediate in range ...")
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 tcg/riscv64/tcg-target.c.inc | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/tcg/riscv64/tcg-target.c.inc b/tcg/riscv64/tcg-target.c.inc
index 0e749ae296b8..a3d995e290b7 100644
--- a/tcg/riscv64/tcg-target.c.inc
+++ b/tcg/riscv64/tcg-target.c.inc
@@ -735,6 +735,12 @@ static void tcg_out_opc_vi_u(TCGContext *s, RISCVInsn opc,
     tcg_out32(s, encode_vi_u(opc, vd, imm, vs2, true));
 }
 
+/* Constants are replicated by VECE; extract one element for .vi forms. */
+static int64_t vec_imm(TCGArg arg, unsigned vece)
+{
+    return sextract64(arg, 0, 8 << vece);
+}
+
 static void tcg_out_opc_vv_vi(TCGContext *s, RISCVInsn o_vv, RISCVInsn o_vi,
                               TCGReg vd, TCGReg vs2, TCGArg vi1, int c_vi1)
 {
@@ -2788,12 +2794,13 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_add_vec:
         set_vtype_len_sew(s, type, vece);
-        tcg_out_opc_vv_vi(s, OPC_VADD_VV, OPC_VADD_VI, a0, a1, a2, c2);
+        tcg_out_opc_vv_vi(s, OPC_VADD_VV, OPC_VADD_VI, a0, a1,
+                          c2 ? vec_imm(a2, vece) : a2, c2);
         break;
     case INDEX_op_sub_vec:
         set_vtype_len_sew(s, type, vece);
         if (const_args[1]) {
-            tcg_out_opc_vi(s, OPC_VRSUB_VI, a0, a2, a1);
+            tcg_out_opc_vi(s, OPC_VRSUB_VI, a0, a2, vec_imm(a1, vece));
         } else {
             tcg_out_opc_vv(s, OPC_VSUB_VV, a0, a1, a2);
         }
@@ -2824,19 +2831,23 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         break;
     case INDEX_op_ssadd_vec:
         set_vtype_len_sew(s, type, vece);
-        tcg_out_opc_vv_vi(s, OPC_VSADD_VV, OPC_VSADD_VI, a0, a1, a2, c2);
+        tcg_out_opc_vv_vi(s, OPC_VSADD_VV, OPC_VSADD_VI, a0, a1,
+                          c2 ? vec_imm(a2, vece) : a2, c2);
         break;
     case INDEX_op_sssub_vec:
         set_vtype_len_sew(s, type, vece);
-        tcg_out_opc_vv_vi(s, OPC_VSSUB_VV, OPC_VSSUB_VI, a0, a1, a2, c2);
+        tcg_out_opc_vv_vi(s, OPC_VSSUB_VV, OPC_VSSUB_VI, a0, a1,
+                          c2 ? vec_imm(a2, vece) : a2, c2);
         break;
     case INDEX_op_usadd_vec:
         set_vtype_len_sew(s, type, vece);
-        tcg_out_opc_vv_vi(s, OPC_VSADDU_VV, OPC_VSADDU_VI, a0, a1, a2, c2);
+        tcg_out_opc_vv_vi(s, OPC_VSADDU_VV, OPC_VSADDU_VI, a0, a1,
+                          c2 ? vec_imm(a2, vece) : a2, c2);
         break;
     case INDEX_op_ussub_vec:
         set_vtype_len_sew(s, type, vece);
-        tcg_out_opc_vv_vi(s, OPC_VSSUBU_VV, OPC_VSSUBU_VI, a0, a1, a2, c2);
+        tcg_out_opc_vv_vi(s, OPC_VSSUBU_VV, OPC_VSSUBU_VI, a0, a1,
+                          c2 ? vec_imm(a2, vece) : a2, c2);
         break;
     case INDEX_op_smax_vec:
         set_vtype_len_sew(s, type, vece);
-- 
2.55.0


