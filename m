Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B342606A326
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 14:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LaVxI+lJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ibFC7lHt
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xM4kK-0005dD-N1; Wed, 28 Oct 2026 10:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xM4j1-00051M-Qn
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 10:34:03 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xM4iu-0004Sh-PZ
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 10:33:54 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SBe4wT1538987
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 14:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kDWTymZYQGoacUv9TB5H54Z88VJQmmNX1/Q34guwBF4=; b=LaVxI+lJZ2G+FK/X
 y0OI437UW3zu3X2cyXrM6kBdKFxssqNreHuPhAmg9ElKOYVo2mkE+z/pi2HnowkU
 WrhrCzXRnBZ7RZDb9qOqqfpQP6Qyi2Uth1o1m625rKFh1ObZ4ZrZmcAw4AbBbn+D
 CuR++rJfpuAWbdM+O8dwlNynHl/rx618taxVdrIQ76z7UiAtDrSKq1LRFkXvWvWi
 tkNUT/xX83V5FvTZuXbFKS33Bb0ue+8HekJvqCHw9YtS5YXVzz+/oAuLeO06K9TX
 0dKuVjKbgEBwRJcOeh1u57p97+68G5CzF5VlejDzLQEXcF/9mBsvjlGZDn2+FTRw
 l0Oyng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7sd36-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 14:33:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93f5844e383so152636585a.1
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 07:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793198029; x=1793802829; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=kDWTymZYQGoacUv9TB5H54Z88VJQmmNX1/Q34guwBF4=;
 b=ibFC7lHt6EhZ56biJQG/oKr40X80tXBkNLGHSH//621eFAj0nkd+P86EV/lAbQaQXc
 xotX4dJbTM9jVZrVB/oLTdzS0PbHXR8O4cx6rMlFnHSAc0w+1d4PRFCwR5xKi4bG4pto
 lmB++0uRUnwIPRzmm0gzUN8yNKZmfVGyxwP1VmjjktoVOM9fAuNJzLzCor1ixKPYILqO
 26GCMnlQmgoA8wxj/exUsmKwJh1EcV+tRkLZcaZkLtItscHsl54TiEppcDxF0hz98GsE
 94JMcfYNIBvDnK+VHFiPj9ZvnKz8kdO7cq5dzR0navnExJFW190zzG/xdcPS7UC3kug/
 +cXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793198029; x=1793802829;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kDWTymZYQGoacUv9TB5H54Z88VJQmmNX1/Q34guwBF4=;
 b=tKd2dMO/nJPfQ4igBFFI96rn05ZIkKQ+juZEk6gZjQrzxCqGWVnNTlE1p29lYbDouc
 w9MWFWX39dJvixxeEvWYVWN1aS9JufSfHQZ7T5MFzVb5BosVvyjp7WStMcCEqtGoWHkf
 y37Ubk2jRSo74UGeARKsnsihXtmDY1v1pCNAhP1niKAZiqHf8WgQ4uiAGMXfKF3M0O7I
 nIK5TtRzxIjFQQzepsrMZJKI6tCm1jyufULMciI4K+je/SxKtJwrJCbxPsRiWiRJBSpO
 7YzEUSVk/U/uOYIGP2019Vyca3N+StT+b9j8eYnze8fpGPzpFx5Yxo8u2MyF4E4Accy1
 rcCQ==
X-Gm-Message-State: AFq9FYK1g7ZL3fc4qQ41ADeCH6N3HA2UQOA2dC/IrV6URwrdorJO9Pph
 srrP5raoIgl/5N0dqOmMZ1bALSeZf+CrRIMFuYfAgyd1XRrntgPS1WfsLKRyaN3fkSO9vZz0fIG
 OL1AX3c8RrBOJlrx0GI3d2BWn6jDRAms2K9KYmzAt8KFi9sEs3pVXPO1X7w==
X-Gm-Gg: AYBFou3L+++nesQTl9/to5mYkHm/FOjk/GAjAcCERMkfwsKPqq7uCZJLd52e97RAczO
 QaCN9Hcdzq2pfSAkKorwY4OwQdZmZkUrym6r6zCyeQlKokB9jrOwcWoGUFSMtYFS1LKFnnJ8sCJ
 jFKkCiPYyFt6JLxhr/0U9VjzoYv8GeF8I3/6wN7sYMvPUhB1LaftRgkN/QBBbkrfalR7hWCM7UP
 20kwuJcwrBG/Ri/TfCkeFAfvc0D+pEpPvSQzKOrDLtiaLDNqj3JsMvGrop/zN1u1Q9R7SvvPWI9
 X1BNK63mhV8TszhL/a1QLmMWYMuVTa736H7qQMF8VyTMIZyVHEsbZUp7GU5m5H7OmU4CJHV6elh
 jI1GuBasjHXAVroG1KIIJcaIVVgwsnf0g7rdGqQczHcYYxYyHuHpQG8ZVT394GHBj5r1VVM0sxi
 3H/lUj8lkj275QVR4s1b/uMCnaNFqNjw==
X-Received: by 2002:a05:620a:8015:b0:93f:3bb5:545d with SMTP id
 af79cd13be357-94408a26979mr349025085a.27.1793198028976; 
 Wed, 28 Oct 2026 07:33:48 -0700 (PDT)
X-Received: by 2002:a05:620a:8015:b0:93f:3bb5:545d with SMTP id
 af79cd13be357-94408a26979mr349019385a.27.1793198028497; 
 Wed, 28 Oct 2026 07:33:48 -0700 (PDT)
Received: from localhost.localdomain (82-67-153-177.subs.proxad.net.
 [82.67.153.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a97c42ca77sm46733795e9.8.2026.10.28.07.33.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 28 Oct 2026 07:33:47 -0700 (PDT)
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
Subject: [PATCH v3 2/6] tcg/riscv64: Use a uimm5 encoder for vector shift
 immediates
Date: Wed, 28 Oct 2026 15:33:26 +0100
Message-ID: <20261028143330.6518-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028143330.6518-1-philmd@oss.qualcomm.com>
References: <20261028143330.6518-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae207cd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=vwcle1UgPbd9zKqFLQ8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ITafA7AIOL5loy99jkPSeL0pOFcGNapL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfXyLHBK8wKQaLd
 /6SAEkKEaqk/CW6WtV7/TKS4BJczGVAGLfR2eJCYt7lzHSgHOhIOdqoMlN6NmermEYdJ/TVu4Ue
 Qh1bAVaEdJVxZeGSU7STOh1HhV8Sfk0=
X-Proofpoint-ORIG-GUID: ITafA7AIOL5loy99jkPSeL0pOFcGNapL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfXx+KGu2rqXGH2
 Y5mOCBp3qAwVuj0VmS1vBGDaUF3tFjQfZYfOG7FPjSJxns1fBGeBKhAoW//feKMt5OlvslUAbJJ
 5WyS7xyCJGarao3K1vpyw7Im9hfNnPgK7IH5QheiuatNFe3zVUB0YS6J300JAe/66JKbxL2/VW1
 1NmP/gWaP6VPJRmZFELbD41o0cyhERdcTLpa7ZniNK7omdXaacOrq6Ay7T8S3bxVtsGMrmMCj7c
 Tzm5vWor0FBVl8sKePJJL2ZjhG/CXhNQg0jfRMsEQGXYxtuRrrqYjR7myQEIeMG/8IcIyUkaOO1
 KvE9QVz7hC5teBHawVo+oBeOGyRcEfrFnyjdLDGP+OFkjuDJJfpyUgScrJr7DVhsaCXIZ+oIeOm
 C/2rPMual9ZSbhNjxVJk8jTN6Gd0UnBV2qkaaHslT9hsXJMSO+HGG+pGoS/vH8/QzcT/Okex40c
 vNZZ/dtg5S5O/B41xBQ==
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RVV shift .vi forms take an unsigned 5-bit immediate, but
encode_vi() checks for simm5, so shift counts 16..31 trip
the debug assertion (and are undefined behaviour in release
builds).

Add encode_vi_u() and use it in tcg_out_vshifti().

Fixes: 006352d69f14 ("tcg/riscv64: Assert immediate in range ...")
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 tcg/riscv64/tcg-target.c.inc | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/tcg/riscv64/tcg-target.c.inc b/tcg/riscv64/tcg-target.c.inc
index 712170c1203e..0e749ae296b8 100644
--- a/tcg/riscv64/tcg-target.c.inc
+++ b/tcg/riscv64/tcg-target.c.inc
@@ -541,6 +541,7 @@ static tcg_insn_unit encode_vi_raw(RISCVInsn opc, TCGReg rd, unsigned imm5,
            (vs2 & 0x1f) << 20 | (vm << 25);
 }
 
+/* OPIVI with a signed immediate (simm5). */
 static tcg_insn_unit encode_vi(RISCVInsn opc, TCGReg rd, tcg_target_long imm,
                                TCGReg vs2, bool vm)
 {
@@ -548,6 +549,14 @@ static tcg_insn_unit encode_vi(RISCVInsn opc, TCGReg rd, tcg_target_long imm,
     return encode_vi_raw(opc, rd, imm, vs2, vm);
 }
 
+/* OPIVI with an unsigned immediate (uimm5) */
+static tcg_insn_unit encode_vi_u(RISCVInsn opc, TCGReg rd, unsigned imm,
+                                 TCGReg vs2, bool vm)
+{
+    tcg_debug_assert(imm == extract32(imm, 0, 5));
+    return encode_vi_raw(opc, rd, imm, vs2, vm);
+}
+
 /* Type-OPIVV/OPMVV/OPIVX/OPMVX, Vector load and store */
 
 static tcg_insn_unit encode_v(RISCVInsn opc, TCGReg d, TCGReg s1,
@@ -720,6 +729,12 @@ static void tcg_out_opc_vi(TCGContext *s, RISCVInsn opc,
     tcg_out32(s, encode_vi(opc, vd, imm, vs2, true));
 }
 
+static void tcg_out_opc_vi_u(TCGContext *s, RISCVInsn opc,
+                             TCGReg vd, TCGReg vs2, unsigned imm)
+{
+    tcg_out32(s, encode_vi_u(opc, vd, imm, vs2, true));
+}
+
 static void tcg_out_opc_vv_vi(TCGContext *s, RISCVInsn o_vv, RISCVInsn o_vi,
                               TCGReg vd, TCGReg vs2, TCGArg vi1, int c_vi1)
 {
@@ -1578,7 +1593,7 @@ static void tcg_out_vshifti(TCGContext *s, RISCVInsn opc_vi, RISCVInsn opc_vx,
                              TCGReg dst, TCGReg src, unsigned imm)
 {
     if (imm < 32) {
-        tcg_out_opc_vi(s, opc_vi, dst, src, imm);
+        tcg_out_opc_vi_u(s, opc_vi, dst, src, imm);
     } else {
         tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_TMP0, imm);
         tcg_out_opc_vx(s, opc_vx, dst, src, TCG_REG_TMP0);
-- 
2.55.0


