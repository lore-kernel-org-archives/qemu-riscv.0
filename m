Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F1C606A31C
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 14:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YDC6DrSD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jr0h1l+W
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xM4kM-0005fm-UK; Wed, 28 Oct 2026 10:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xM4jE-00053F-K9
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 10:34:18 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xM4jA-0004UU-Oy
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 10:34:11 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SBe4sj1538984
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 14:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oUJHPAl/sq7ko9Rjo0DfTrXkuYys9d/lMIlf8pyggp0=; b=YDC6DrSD+O6rOP7d
 F5dmpVwrb2UIzKwmYOFPhxtFXG/H7kc/DpUHOTMZYRkqOKxTmnNv25PVUWKyq+j+
 mce9NG9mN1Cit9wzKoMPLUL9w9phkV3pqmfGyCVWhMryQPW1LZbb1U6bsA285Dok
 qylhgLoOirhw3XJlVCs9dlea3IdrwvK7XkS4jtTtEKs/Jd+Tk47j4ogpEeHVwBUo
 RgsRgh6EHxH0TpcxBG+O7MSqXDHy5TM8yyX5MTgAhXBoFph9GNA1dQmBjEuJIG0N
 Q/h4U03umUMk5tzyG9r6bW1abCy4wiozk7b2695fS65dkKEoWoaQhAaiACwkBHUb
 mdKYgg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7sd4k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 14:34:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93f32050e72so195712685a.1
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 07:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793198044; x=1793802844; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=oUJHPAl/sq7ko9Rjo0DfTrXkuYys9d/lMIlf8pyggp0=;
 b=Jr0h1l+Wrh0E0GhI0sHNQosNWz0sE6BFdMTEQNELgAHKfwVTkb2fx6yuj8uEQMqzey
 /sEOIwbhh3uApeulpz0C40p/6WPFw5vVL61qVwT9fZA+4udeVFN57nUtz6hpRvJHCBvA
 Hb5bzASI5ZzZovei21zE486u5uLm7Yo0QcKSy8fsYCJ2WY/g8VxrPPvnz9dXZSL5Zyf6
 KxKxdvf+psHge+GX7Vps1fDbmp5fca5prPXvtdiEE0dKPbgbJcaogBYf6JndmG3A7ybT
 ytOhpNE2WXRZUK1zZp2UWpw+AciquQc521tXQ90fzfESHhDZ2wvA8DFAzGNCwn+iVYWZ
 6GRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793198044; x=1793802844;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=oUJHPAl/sq7ko9Rjo0DfTrXkuYys9d/lMIlf8pyggp0=;
 b=bxYSHkacONTDj1Xy3aJyCRjyKqx0h6N6a+MUJdwxbf4MjiwitUHre4My27EYAOrXNr
 waUT67llCUEwEHpGhX11smcZsYHqVOF1c9cQR6dOqDro+2Rtn04WsrYzN9x2EO+m8OGO
 O9+xdQ1UaKR0y02odumBrNpdaoEeErooU6lIfaf5j7gTL0mFH50MnbbFFMoGyLz5g6ar
 TMwj98i9pY49RgWLgZgiRGf3YNQSmK1gB947ACcfop4IinxiPd2Kt+ZWR/zqkJC13XDC
 RmVVjg86oec6xfmY+2whX0/MG974XKUc+X7Y5o0Rgahb3Bn8ew+2zl+WBbrsbr80UBcf
 yKMg==
X-Gm-Message-State: AFq9FYL+x0YiUEfGkC0PM+ryy8HnzKBQ58RtP4xHXloTe9WXQKGoIZSn
 2QUMmu7/sveVzCEVtfCyeWQa2XrWv67e9D9zpOLhbBj7Lo5gwm9iq0PWcUA9d4IhpBWXAdEO0WI
 qoRXpTisSJ9NrI8fx66vx/4XH4Ic28LO/resMK1tJcFxWrR5vT8CNBThu5+5Eat5t4Yr+
X-Gm-Gg: AYBFou07hDRzKO+SRgK3eq06OMSG+D0AHg0GHqyA6Gff7o1uBTVuSTNL/INkReM4SoM
 yEknAYnWC++c4iVZrnQj2Xa+lDaHdh+gU87wWBhNGvBOupZuDpC/9BhaCytFhOCwx1jfirZCr5n
 IBQ3aoVYfRpPQw/0LpKWFK2hEN3pBTZKrzWYwx12qXv/0xgxZRga7dZ6CG/BJLk78rZ0U/wy9Ou
 3GGNgJE+QosUVpmC5vuCtFMDfOdEdoM6ZVDsYEpmJjSfsOf7RUECAUYSZrNjWLYX0ktjVrUWEc7
 BXUG6mE9VgYCyLmQEEECpK/QsvPI6tqziDLvSd7TJPBRbZZrBG6hbOUI0N61l5XEuGXpdZN19Wh
 I0ivG7xlU/9ZJ/DTITtcIUnYEBuL9k+Qc5p6IhTYrSNnrA9dpWULjAUvltPAqKXFf9fbqzjjqyd
 r0vd6ynVStQeB3rGmUPueBR7QfgRVgag==
X-Received: by 2002:a05:620a:2720:b0:93f:26f6:6bab with SMTP id
 af79cd13be357-94408a80789mr339268385a.18.1793198043698; 
 Wed, 28 Oct 2026 07:34:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2720:b0:93f:26f6:6bab with SMTP id
 af79cd13be357-94408a80789mr339263785a.18.1793198043208; 
 Wed, 28 Oct 2026 07:34:03 -0700 (PDT)
Received: from localhost.localdomain (82-67-153-177.subs.proxad.net.
 [82.67.153.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a978795f42sm53938835e9.8.2026.10.28.07.34.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 28 Oct 2026 07:34:02 -0700 (PDT)
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
Subject: [PATCH v3 4/6] tcg/riscv64: Fix constant handling in vector
 comparisons and selects
Date: Wed, 28 Oct 2026 15:33:28 +0100
Message-ID: <20261028143330.6518-5-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028143330.6518-1-philmd@oss.qualcomm.com>
References: <20261028143330.6518-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae207dc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=NyIpxno2YUF8kvApL20A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: W0xPGUN0cBqI8ZA44TwH2oAjftFkWVWS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfXxcO11hOOtF72
 YSAq3d+UL2tqV0wHV4gDAqu5VH7rkOOe8hJrgmhieWyU+XqbPw1pYv1d3oGml2WWVDDeZSmOSAF
 TmA/44dZi9H7YFros+CSFVcgW+BGseY=
X-Proofpoint-ORIG-GUID: W0xPGUN0cBqI8ZA44TwH2oAjftFkWVWS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfXwxti1xRv/7Gt
 sYfYcB7zSnHt7r6pIrJ6mEl6ZmM0Qn8On5DQ/XrNZ0vQsfoXjzAQo4y4Y5suJyTXIcR9vxW5HPD
 7lIYLCo5rFrLAKdWhSUBzMISSg8DCHwm/JeVT7rDroKRAgGJTzz4NH6GAOU1/cBc01vpfc+P67n
 JkzRy11LCKqJtYvuN45aNaTR+RHzLJQTi8Zs6EbkwrRNLyn4paxFGgDoQdpz2CZqxBz8w3q6BHs
 0IjgqIzRzYI/kbqJlQdFgDdWgfecLg8P7TrlT7VUvgx7M7bT/Va03C3GWfC4jFCbJgoOOkp29N+
 A8cOsaXnkzEO+f4JgX4Lf5fcrpdNqVkSk61vZhQaPlF9ryemQ7yZXZT+TH7YTAZxkjZkB5F5Vmu
 AjikDiZpqwGcpsjooBVpT5yAuSpbZm/isRe69zNYBemePzNjCcA4YXzdii/am3oI8uNqsNJeFYD
 dBfqDdzZ2SZ0y0z+TEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

tcg_out_cmpsel() takes constants as TCGReg and passes them to the
encoders unextracted. In a release build, "cmlt v0.8h, #0" emitted
the illegal instruction 0xffffb057.

Use TCGArg for these operands and extract the element with
vec_imm() before encoding, including before the LT/GE adjustment.

Fixes: 006352d69f14 ("tcg/riscv64: Assert immediate in range ...")
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 tcg/riscv64/tcg-target.c.inc | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tcg/riscv64/tcg-target.c.inc b/tcg/riscv64/tcg-target.c.inc
index a3d995e290b7..168932711796 100644
--- a/tcg/riscv64/tcg-target.c.inc
+++ b/tcg/riscv64/tcg-target.c.inc
@@ -1555,9 +1555,9 @@ static void tcg_out_cltz(TCGContext *s, TCGType type, RISCVInsn insn,
 
 static void tcg_out_cmpsel(TCGContext *s, TCGType type, unsigned vece,
                            TCGCond cond, TCGReg ret,
-                           TCGReg cmp1, TCGReg cmp2, bool c_cmp2,
-                           TCGReg val1, bool c_val1,
-                           TCGReg val2, bool c_val2)
+                           TCGReg cmp1, TCGArg cmp2, bool c_cmp2,
+                           TCGArg val1, bool c_val1,
+                           TCGArg val2, bool c_val2)
 {
     set_vtype_len_sew(s, type, vece);
 
@@ -1574,7 +1574,7 @@ static void tcg_out_cmpsel(TCGContext *s, TCGType type, unsigned vece,
     /* Perform the comparison into V0 mask. */
     if (c_cmp2) {
         tcg_out_opc_vi(s, tcg_cmpcond_to_rvv_vi[cond].op, TCG_REG_V0, cmp1,
-                       cmp2 - tcg_cmpcond_to_rvv_vi[cond].adjust);
+                       vec_imm(cmp2, vece) - tcg_cmpcond_to_rvv_vi[cond].adjust);
     } else if (tcg_cmpcond_to_rvv_vv[cond].swap) {
         tcg_out_opc_vv(s, tcg_cmpcond_to_rvv_vv[cond].op,
                        TCG_REG_V0, cmp2, cmp1);
@@ -1584,11 +1584,12 @@ static void tcg_out_cmpsel(TCGContext *s, TCGType type, unsigned vece,
     }
     if (c_val1) {
         if (c_val2) {
-            tcg_out_opc_vi(s, OPC_VMV_V_I, ret, 0, val2);
+            tcg_out_opc_vi(s, OPC_VMV_V_I, ret, 0, vec_imm(val2, vece));
             val2 = ret;
         }
         /* vd[i] == v0.mask[i] ? imm : vs2[i] */
-        tcg_out_opc_vim_mask(s, OPC_VMERGE_VIM, ret, val2, val1);
+        tcg_out_opc_vim_mask(s, OPC_VMERGE_VIM, ret, val2,
+                             vec_imm(val1, vece));
     } else {
         /* vd[i] == v0.mask[i] ? vs1[i] : vs2[i] */
         tcg_out_opc_vvm_mask(s, OPC_VMERGE_VVM, ret, val2, val1);
-- 
2.55.0


