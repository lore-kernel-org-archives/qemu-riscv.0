Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70283606E87D
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 03:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b5DoMiOD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Li+4PJul
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJMqa-00008N-62; Tue, 20 Oct 2026 23:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMpQ-00054h-7R
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:17:26 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xJMpN-000317-LV
 for qemu-riscv@nongnu.org; Tue, 20 Oct 2026 23:17:23 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69L2ExqQ3904813
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WS9GBvpAE5aOkQ0P64201/OvgyT38KpzzMk50TKNYI0=; b=b5DoMiODxmxm9uQe
 ONadLcqD1GmpbDrhyq3hbgc+ctanKgmoyhNMnZ0TXmJr/thVGdOhJNnq9MwqT5gJ
 gJYR5CUlgqKvEU0tnMBxR2cRgc1H9fCUZyjrLVgy1AfVaE/JSNXxkQekENrqFvFE
 YYbvSMkFqz7xLYPwPJJVME6hscX7iHrio7JFM3nF7EYpY8Te++L44pFop033F/MT
 hBetCBROvBHxNLV9aeZz6xt2PSHnHRkrKpXRUl+9OKz+XKck8kUwk1f42jS9/SI8
 pnZhO4MKdRdl2x+Mng6C+iovverqwftZbzPWdMBGSfTJ1+rrKQc9IeAYuP417KIX
 7FOqWg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs00xe4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 03:17:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93ecdc701a2so38113685a.3
 for <qemu-riscv@nongnu.org>; Tue, 20 Oct 2026 20:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792552630; x=1793157430; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=WS9GBvpAE5aOkQ0P64201/OvgyT38KpzzMk50TKNYI0=;
 b=Li+4PJulEQLRt9NdDOqqSn6q5nlBnoq6n+NORSsdGp9xGjIQdJv8zbOyDYpqL3DVGv
 eaVZu/EhDudzGj3Kbbe8EQqicj8nOoIJsb2rvHK527SXW0LEgRcBs05Bf3z4CdwyHK48
 5eauObFdcgtANGO1RaxbH/iZ9xNrSoY2+WKIBiv3CdzRI27pQabrdpKTuIUO+EEV3+6a
 kn2rtTi7AzR4d3D34qZ3Ni0lcajJ2H7dZyApIg0achjd7btSUAw2O2llxST9oyLK46Xw
 H7csQxGHobw6tjj9GJbx3Hx8SSR+GAg8zoRbMJ571iBrvecrN63Krnvu0Yunq8UymgHt
 alsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792552630; x=1793157430;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=WS9GBvpAE5aOkQ0P64201/OvgyT38KpzzMk50TKNYI0=;
 b=EJQkg+NGR/xm94cGshILPZb3BNtS5cCbmPV59VPv+VHG2bVOKUY3d1ITht/b7IY4ej
 hUNe/6A/yy2aZqZyMNtU6BrNmUIEw20wGTOZvP+dbWSxv1bEHBmMR4VavpZJ7ne0ijrr
 NjrX2lnbYNbvKoicXCeQh++l9w7ZHEbSOjT7TjToWrIT5gZSjf5nZ7jHVKjhxOqE9mVP
 2MmXdja1YFWTKeZpgTWA/1pc6gGYQdVDGo/RvNAkxjJeKiWhZtf5cK5BsTStNvaA7ruv
 1+9NSPHKHB/6vFbR5QCaAHAeBd0HwTkK6iO6Yj/wOwY3j7E1ZklRQxHybjHyi/Zw4fZa
 jqJg==
X-Forwarded-Encrypted: i=1;
 AKwUvBx/JCsP5GDfss9oMTyjgwkeevOWxiJwBKTIUjlMpJ8fuIJPSy5/GuemKuHx7UauIJ7/+toeoXXxsFjo@nongnu.org
X-Gm-Message-State: AFq9FYJoqO4QnSXD5edDzE4dt/l80DS8CRJWwRsLzw78GH9DTEtrC6OT
 iOPOkyVuSDY6iWAIoIPcrZXGikaW7Iq3WTP89OIxK8QEjCar4SwmqWLRjUFFQa25UUhB1dmAGcS
 7IbaeDyQLUeaIYG83/JMkQaOwH9oPe3cCJMlkha7vVD0hRXl0GjiE2tpHNiU6RwmMpmWu
X-Gm-Gg: AYBFou0LfWGgED1ulfg6mhSnmxIA98V6C8AGHL78WirTdAaFeGUkZMvBG/f4GfTfrf7
 KZmvrip9XBuIbZUWt+zrDWJK1QP8w/zKNO0qST/S0/AEjgim+0EDne52I4lBINl4/O/nH3D/e+n
 6t9hunj2naJwJujCWRIkcdP6P+nPSPEMHgzNtPmyllZub5KyKc5pZpKm1v0D/1aieKq51OMv4PF
 gYLQ/4w9Gm5ChLptxVyUg5JyQ1cTYNUIvfKYFT7Zf+K+4o4FEKyoRnF/EYrB9Yw8IQtlFwi6Rlw
 FItLImA4vsftjXJPYgRA8porADV8W+SeKxo5/Q0v/OBzusK3JpiHeQYh7TlPMCZLLbTSQwzWEy3
 grSNidH7pdC7b4zMvUmp7FDEoYogdlVNNJAaecBHq
X-Received: by 2002:a05:620a:370d:b0:93e:78b7:fa4e with SMTP id
 af79cd13be357-93f57f7ce26mr230157085a.37.1792552629791; 
 Tue, 20 Oct 2026 20:17:09 -0700 (PDT)
X-Received: by 2002:a05:620a:370d:b0:93e:78b7:fa4e with SMTP id
 af79cd13be357-93f57f7ce26mr230154685a.37.1792552629250; 
 Tue, 20 Oct 2026 20:17:09 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e254ef1casm1941038f8f.7.2026.10.20.20.17.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Oct 2026 20:17:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 23/33] target/rx: Unify BRK and INT trap handling
Date: Wed, 21 Oct 2026 05:13:56 +0200
Message-ID: <20261021031407.24862-24-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021031407.24862-1-philmd@oss.qualcomm.com>
References: <20261021031407.24862-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad82eb6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=YEB5RgzmAAAA:8 a=jDMzgGwzCE0q-kHIl9cA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX6UMBqH+tUdm6
 0cUfP4R1mjzDlp9CEKDyd9qAHhoBa3Cdp9Bb4brYiPGCQLxQqluky9Obg2yxMdRpnHFgd0XmfCm
 dzt1T3bIKiXx5V5zlIUveKt2y9I6Dng7sa4EdEkzCvCmZhGuh4lehknqCphEq7H2MpV6WTEF8Fb
 kO9lql0x4RXx5BN/hMnzZ7V51wXIjoLaGE+YpU19efLwV0CZ2OfUnC+/SE1wFuSinb7rVKXjQYY
 lC2HWGfQ31o8X+I6OBuCtwZzv0xQtQAMdzuVhTFRyReVZPTRHW3q0lyUhS2oaF0xHpuUORHhoSa
 PiqiyHbRJhJHZ8Weo9cvg6S0BtzrQxtQmg5NTXO6VglQWtZKLHBybJTayPSzYYuSFCZguVlKHtU
 n4Hde58rp4yr2W8f7eJWnOO8x1DN220H0Q7QVsFk4TXLbQlkm55LGQW4LkXPFTx0gspvJx+AMfa
 bna+4cMnhDp6QXmXW0A==
X-Proofpoint-ORIG-GUID: tQVWHhePS09JSy65LsQUcD-k5vaji_3a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAxMiBTYWx0ZWRfX5OHwfPnMf8lU
 gua6NLkkob1xFy2UnAQK3cjecahEOoxhdMYoUWxG6d0lACOOscxGwzsj4VTlMsXZO3ZqxxVOJqC
 W0khGw1TDpfq2SQMv+4p+sqJwgv6uhg=
X-Proofpoint-GUID: tQVWHhePS09JSy65LsQUcD-k5vaji_3a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
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

BRK is equivalent to INT #0, so route both instructions
through the same trap helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Yoshinori Sato <yoshinori.sato@nifty.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/rx/helper.h    |  3 +--
 target/rx/op_helper.c |  7 +------
 target/rx/translate.c | 21 ++++++++++-----------
 3 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/target/rx/helper.h b/target/rx/helper.h
index b1ef843be1e..13f019ff81a 100644
--- a/target/rx/helper.h
+++ b/target/rx/helper.h
@@ -2,8 +2,7 @@ DEF_HELPER_1(raise_illegal_instruction, noreturn, env)
 DEF_HELPER_1(raise_access_fault, noreturn, env)
 DEF_HELPER_1(raise_privilege_violation, noreturn, env)
 DEF_HELPER_1(wait, noreturn, env)
-DEF_HELPER_2(rxint, noreturn, env, i32)
-DEF_HELPER_1(rxbrk, noreturn, env)
+DEF_HELPER_2(trap, noreturn, env, i32)
 DEF_HELPER_3(rx_fadd, f32, env, f32, f32)
 DEF_HELPER_3(rx_fsub, f32, env, f32, f32)
 DEF_HELPER_3(rx_fmul, f32, env, f32, f32)
diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index 5a7a87943fe..fb1fa4ffa69 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -455,12 +455,7 @@ G_NORETURN void helper_wait(CPURXState *env)
     raise_exception(env, EXCP_HLT, 0);
 }
 
-G_NORETURN void helper_rxint(CPURXState *env, uint32_t vec)
+G_NORETURN void helper_trap(CPURXState *env, uint32_t vec)
 {
     raise_exception(env, 0x100 + vec, 0);
 }
-
-G_NORETURN void helper_rxbrk(CPURXState *env)
-{
-    raise_exception(env, 0x100, 0);
-}
diff --git a/target/rx/translate.c b/target/rx/translate.c
index bd445bc0634..0672c5c5653 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -2170,26 +2170,25 @@ static bool trans_RTE(DisasContext *ctx, arg_RTE *a)
     return true;
 }
 
+static bool do_trap(DisasContext *ctx, uint8_t vec)
+{
+    tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
+    gen_helper_trap(tcg_env, tcg_constant_i32(vec));
+    ctx->base.is_jmp = DISAS_NORETURN;
+    return true;
+}
+
 /* brk */
 static bool trans_BRK(DisasContext *ctx, arg_BRK *a)
 {
-    tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
-    gen_helper_rxbrk(tcg_env);
-    ctx->base.is_jmp = DISAS_NORETURN;
-    return true;
+    return do_trap(ctx, 0);
 }
 
 /* int #imm */
 static bool trans_INT(DisasContext *ctx, arg_INT *a)
 {
-    TCGv_i32 vec;
-
     tcg_debug_assert(a->imm < 0x100);
-    vec = tcg_constant_i32(a->imm);
-    tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
-    gen_helper_rxint(tcg_env, vec);
-    ctx->base.is_jmp = DISAS_NORETURN;
-    return true;
+    return do_trap(ctx, a->imm);
 }
 
 /* wait */
-- 
2.55.0


