Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5899CCDB46F
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 11:04:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbytu-0006is-6x; Tue, 23 Jun 2026 07:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wbytg-0006eM-7R
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 07:02:30 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wbyte-00067C-Eb
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 07:02:27 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65NAsK2V042113
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 11:02:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 e7ujTj25beCliYcHaN6vgRmeikjh8fOvjTThSDgD3Oo=; b=T6XdZVd3Cle+j51j
 fEehUceP4dVQ+gWSB/2E5H9I5r0VOWG7Qs1Faa5SZP5Ski0vcY7UekiIbtyjyMPZ
 6xYixoI999MRwv2Opldx2AaYtAlwQhNjC3s4clQvwFsAtJdd05pDG1mVlg+kmOD3
 9MZL8eqTd5ecc1iVoiChSARgPLsMb3VqBRo/nPQWmQbZ294BOxzEBNUO6FjP7jak
 yuAn1CwZWRe6AG6bZbiB1cPBpTdNs7KmqCMVhRCIat2oaGeu7IxsfvR9bIDidpP6
 L+1R+tqRJ8XGgVvzkkWtIIcVpCfzuDuNuL9iUAazxRdZARbHsrTiH+0jFBKqbhC0
 fYCVjg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr32077y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 11:02:24 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-489677a16bbso6298475b6e.0
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 04:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782212544; x=1782817344; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e7ujTj25beCliYcHaN6vgRmeikjh8fOvjTThSDgD3Oo=;
 b=ZtG5Mfn05GDMiv9NgXoq1g+UuscKp6TXnQMpak8NY4ui60578tPp+KoD8fcQsxu9Q0
 qx+gmEj6xu/bGwN89+3BZ2sPRbZ02OPScQOlc2rSMc7HjJiHgLiwH0LLxvMGjejU9Msi
 ckbBbva9yKvfa70Zx9D2bke7MbSJSkEBaYiGcFaj7hmu8gLDbKK1Ki9HpDZPgHFIpTM8
 l41IOWuPPXeOWZbh5yV0y0sigHrZMOhjeToD020i64m2yGkPTpSgNpFlL/4F9mcusPW1
 rjsT81Cil9iHXKvhrQwnsXwZO16SgATy0qXUcmrYGSwrWh+4lCA10FbOKZxc2md5eZdY
 9C+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782212544; x=1782817344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=e7ujTj25beCliYcHaN6vgRmeikjh8fOvjTThSDgD3Oo=;
 b=aE0zZd3/8X5911a/mVuUmJYmt7ywGWzsXhLp3NtbAiFFpzkBJiFaaQch6p6ieKAkCW
 pNWCS9gBIMf2bdStvx12dB0+1Hv4kcLtbMq01l0cYwrieLcFDK1ivo2qwl1ZmVYpjyXR
 stD/p2oZAy5Ya19vJ9Ly7Pdn6t4Zo765eaFPeS1LmtXmSg4d0yY80lEySrGqtOaGzUST
 AEBKsbgyS/ZkfcAsGeBvCIPbRv2gxs/ENqcSd2kp85zT+VhnT5eMUTigbJ4rxgBsz3as
 BvZDhqtwTLHDH6MmF9/xVpejjoE4R9eKYKhL6iKky8MQApWEAQ97GwoyqnQ72us4Y6O2
 g0RQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/9zuDbxrVTakFpVuSyjXCiy7Olnt6PyTBin1WH8KfN0V75t4kvpw3D5K8pxlEcHvgKHdctchA0AQok@nongnu.org
X-Gm-Message-State: AOJu0Ywgfp9HCTzquwdSd+KYiuKOejBpyliTegfagSL70Vzlzz5F56/9
 1nqSTb4MYOsIXb0Oy6DbQifPXtPajcjCagUite8EPpLIe4WrIBnb0xW0g8NDBeSmlHhzNeqVFG5
 uP755ZIwmXRaWVxCQkUuP1hNghZDqys0+fgYD6axjULd4RSHF0q/vn8EZqg==
X-Gm-Gg: AfdE7clRuGa77uRyPNxpMeRUkWxkZ2g1v153H8e7ERPT1JE5wl9qYMPg2pgCPruXDBK
 643ZZWC+9O+EMSLwTfyDhfewSwRbT9g9fIdP2t2Qz//OsN51hQvYftZg77D2RlDhddFLxPFP4Rp
 yT7V+eV2ljQo7qFCxvpJxE9OB6BmBqPr60Q2S+mmEXzd8a9I3GZA8iZED9NDe8L9tbWv0t9qR5R
 b49qWr5tGWDs4eI24zEQn8h4T8AkuP1HSgbeDp1slc2ktKwy4+gr8oCPD9XdBICFi/rIHJ4ukRa
 odW0bt2EKJJjycDz+gfByxVFxg5F7IDXYv8Ts5gvyLsTteqc7W9SnCyNKbyI51qqxoYP1DT4GDo
 B+KgyYU8Y9noHQCYtLS4DMgaZKHLP72OZ2jj/0war+CfoUaKAGhjGluPuVVGxnRWPXMiP
X-Received: by 2002:a05:6808:4f25:b0:489:6c24:9d26 with SMTP id
 5614622812f47-48f6210a3b3mr1058397b6e.27.1782212543964; 
 Tue, 23 Jun 2026 04:02:23 -0700 (PDT)
X-Received: by 2002:a05:6808:4f25:b0:489:6c24:9d26 with SMTP id
 5614622812f47-48f6210a3b3mr1058344b6e.27.1782212543522; 
 Tue, 23 Jun 2026 04:02:23 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fd1f886sm344100705e9.4.2026.06.23.04.02.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 23 Jun 2026 04:02:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>
Subject: [RFC PATCH v2 1/4] target/tcg: Rename bitswap() helpers
Date: Tue, 23 Jun 2026 13:02:05 +0200
Message-ID: <20260623110209.26861-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623110209.26861-1-philmd@oss.qualcomm.com>
References: <20260623110209.26861-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfXy3UUSjpXhCiI
 lgMgggA9eie0os6hfrtJe5z4YfzxQ2yvN4GBgJoCbgZTMoB97rUOGafeQC8/JsakHqmf5vB/sRr
 y6dmZlHxRJc+XRVIEUpiawZ+Xm0cXRc=
X-Proofpoint-ORIG-GUID: Fr7FmREHf9XldH0uFh1qbqw_DFTqlZum
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3a67c0 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Vq8-Eo_8D2-Y-oFXv_MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfXwQHZ1coW5z8E
 MRxHV2Pv1DO9u5tuv6jb7b7dGCCZf0shZOGxuBh+jMWazaCOzE1olVM055IP9BHkkdgXvo6ndEl
 liYTg70pKEGWAqVgZbJj15t09/7MSlqrJJl/BMbEz7oVUn4yTP4XW01hAm5hzww32lRFPO7Dnr+
 rogMBcmEGFDWtk6ACb9nsXZprE4gapGIXyoZmgjVY3UaoLLlJM4ICQF9jNmzUAVovm7ta9O00u8
 tHZ8BsdKI9sJJ9SSL5oX9G8pvDPnNHNRGelsya1YH0nmquAbiM+hjXS1dHCWBahHGAGjJVHy8WG
 e8Ilyz+YfZDqvtE7ogrsv9Os+kDw2b2jBYiaCIPvpvNKoIX0pZHbueDFauZMUGID/b/SRFpJoKq
 RwYTdjr8KMLPtuo6UPuo7lnUtBha6Wq/uZX5IzbJ4WNlOk9LrniT6y4cjFHlYmkggye+zM/bHZY
 l+OnZJp2QZoMn/m96QA==
X-Proofpoint-GUID: Fr7FmREHf9XldH0uFh1qbqw_DFTqlZum
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230089
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

In order to avoid symbol name clash when building
a single binary, rename TCG helpers prefixing with
the target name.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/loongarch/tcg/helper.h                   | 2 +-
 target/mips/helper.h                            | 2 +-
 target/loongarch/tcg/op_helper.c                | 2 +-
 target/mips/tcg/op_helper.c                     | 2 +-
 target/mips/tcg/translate.c                     | 2 +-
 target/loongarch/tcg/insn_trans/trans_bit.c.inc | 4 ++--
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/loongarch/tcg/helper.h b/target/loongarch/tcg/helper.h
index 8a6c62f1161..e36dd2f5de3 100644
--- a/target/loongarch/tcg/helper.h
+++ b/target/loongarch/tcg/helper.h
@@ -7,7 +7,7 @@ DEF_HELPER_2(raise_exception, noreturn, env, i32)
 
 DEF_HELPER_FLAGS_1(bitrev_w, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(bitrev_d, TCG_CALL_NO_RWG_SE, tl, tl)
-DEF_HELPER_FLAGS_1(bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(loongarch_bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
 
 DEF_HELPER_FLAGS_3(asrtle_d, TCG_CALL_NO_WG, void, env, tl, tl)
 DEF_HELPER_FLAGS_3(asrtgt_d, TCG_CALL_NO_WG, void, env, tl, tl)
diff --git a/target/mips/helper.h b/target/mips/helper.h
index e2b83a1d19d..f3d459982cf 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -16,7 +16,7 @@ DEF_HELPER_3(lld, tl, env, tl, i32)
 #endif
 #endif
 
-DEF_HELPER_FLAGS_1(bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
+DEF_HELPER_FLAGS_1(mips_bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
 #ifdef TARGET_MIPS64
 DEF_HELPER_FLAGS_1(dbitswap, TCG_CALL_NO_RWG_SE, tl, tl)
 #endif
diff --git a/target/loongarch/tcg/op_helper.c b/target/loongarch/tcg/op_helper.c
index e63ac66daae..35f331ca52c 100644
--- a/target/loongarch/tcg/op_helper.c
+++ b/target/loongarch/tcg/op_helper.c
@@ -32,7 +32,7 @@ target_ulong helper_bitrev_d(target_ulong rj)
     return revbit64(rj);
 }
 
-target_ulong helper_bitswap(target_ulong v)
+target_ulong helper_loongarch_bitswap(target_ulong v)
 {
     v = ((v >> 1) & (target_ulong)0x5555555555555555ULL) |
         ((v & (target_ulong)0x5555555555555555ULL) << 1);
diff --git a/target/mips/tcg/op_helper.c b/target/mips/tcg/op_helper.c
index 4502ae2b5be..83c340e38e0 100644
--- a/target/mips/tcg/op_helper.c
+++ b/target/mips/tcg/op_helper.c
@@ -45,7 +45,7 @@ target_ulong helper_dbitswap(target_ulong rt)
 }
 #endif
 
-target_ulong helper_bitswap(target_ulong rt)
+target_ulong helper_mips_bitswap(target_ulong rt)
 {
     return (int32_t)bitswap(rt);
 }
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 123d2c89c3d..811492364a3 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -4842,7 +4842,7 @@ static void gen_bitswap(DisasContext *ctx, int opc, int rd, int rt)
     gen_load_gpr(t0, rt);
     switch (opc) {
     case OPC_BITSWAP:
-        gen_helper_bitswap(cpu_gpr[rd], t0);
+        gen_helper_mips_bitswap(cpu_gpr[rd], t0);
         break;
 #if defined(TARGET_MIPS64)
     case OPC_DBITSWAP:
diff --git a/target/loongarch/tcg/insn_trans/trans_bit.c.inc b/target/loongarch/tcg/insn_trans/trans_bit.c.inc
index ee5fa003ce0..76d6ba742d5 100644
--- a/target/loongarch/tcg/insn_trans/trans_bit.c.inc
+++ b/target/loongarch/tcg/insn_trans/trans_bit.c.inc
@@ -194,8 +194,8 @@ TRANS(revb_2w, 64, gen_rr, EXT_NONE, EXT_NONE, gen_revb_2w)
 TRANS(revb_d, 64, gen_rr, EXT_NONE, EXT_NONE, tcg_gen_bswap64_i64)
 TRANS(revh_2w, 64, gen_rr, EXT_NONE, EXT_NONE, gen_revh_2w)
 TRANS(revh_d, 64, gen_rr, EXT_NONE, EXT_NONE, gen_revh_d)
-TRANS(bitrev_4b, ALL, gen_rr, EXT_ZERO, EXT_SIGN, gen_helper_bitswap)
-TRANS(bitrev_8b, 64, gen_rr, EXT_NONE, EXT_NONE, gen_helper_bitswap)
+TRANS(bitrev_4b, ALL, gen_rr, EXT_ZERO, EXT_SIGN, gen_helper_loongarch_bitswap)
+TRANS(bitrev_8b, 64, gen_rr, EXT_NONE, EXT_NONE, gen_helper_loongarch_bitswap)
 TRANS(bitrev_w, ALL, gen_rr, EXT_NONE, EXT_SIGN, gen_helper_bitrev_w)
 TRANS(bitrev_d, 64, gen_rr, EXT_NONE, EXT_NONE, gen_helper_bitrev_d)
 TRANS(maskeqz, ALL, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_maskeqz)
-- 
2.53.0


