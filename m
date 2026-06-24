Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771CDCDB47C
	for <qemu-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 00:09:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcB9h-0007rO-5x; Tue, 23 Jun 2026 20:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB9Z-0007cF-UJ
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:07:45 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wcB9W-0003KN-Qk
 for qemu-riscv@nongnu.org; Tue, 23 Jun 2026 20:07:41 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65NJwlXF706687
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=smrgu7dCfi0
 trFw7Vp+kVKVNvhdzaDa2myQuk8ZtXAw=; b=pHSue+xyCeblrL+HwkixVy4y0y7
 BaD7qZhTTbVhh/4n0PkwSETcmp6tAIQMS18Ni6dJCFGrkNu5Hnj/MMxkifyntK0I
 uHbMLQFAUvTBCDMEZRs2sh8DZZJfolZS9iw6p9eLetstF9b/kX3xFXWh+5l8X3zV
 BkqFWedhciJXaib8mGLiGd8SbgSBJH1Jddm61sF09Cwszp6D1FooL4oUSb4R6GlN
 IM8aeLKfk2Os4156eH01b2YbjW4xnktAkzTzi01fUM5w+y9L5op5NtFCU5PXx7Rs
 AzJXygIFep7ZeqbCB7577VNLzNSe6Grg4UGzqfu0FP2ul9FUnR2HBaLmqjQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp29ktb9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 24 Jun 2026 00:07:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8dba00e17b5so7493936d6.3
 for <qemu-riscv@nongnu.org>; Tue, 23 Jun 2026 17:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782259654; x=1782864454; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=smrgu7dCfi0trFw7Vp+kVKVNvhdzaDa2myQuk8ZtXAw=;
 b=Anq5oyllJS3z2CtkRNX6eTIkb6i17d7xi+QlhVUsBEkTWWf4g2YuyU13SrjavREmPR
 aUKP2Z/DXOCsjspHFyFkA+qH+No9EwceOOA0u8yFiINcrIR8i03psNh/H/KupKF8Tcw8
 GqoHN4XYpDNJNdS0hzO+LuUerZwwaU7g9jgwm5q9C38u0fTRIppzXf0jvhAv2TwwmjWH
 RDRfbagSUXZlR8CNRWsFBMNiUwPcVBACVpY6kHwY1eVSDeUgZ4w8iYILmTWSOXD8kNFe
 CKSW64ACEp7VtLcAPndBabIbFZVBEBXz57uSTGiTBLtf4nwFD1M720b4e2Nfhek0hGiJ
 HMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782259654; x=1782864454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=smrgu7dCfi0trFw7Vp+kVKVNvhdzaDa2myQuk8ZtXAw=;
 b=tP7MnGD53b81KsU/BiBMmv3k3m1MmPgZfyxrqmMbmpsoXPiluLUrzaohaXd2/LaI2q
 6WUtvhu648dCfx+KwWK0yhuJUiXibaW3WyJyaPGx2+Fa7EtYzxRZfFHywnHXBQrbzKUV
 GQbNwAD0xm83tWJs0ydGY7yyfWwOlct/chWWOB3R8nsjdNMr2kd56drRFtiz7hfJKY8X
 0MhlWCtWPzwmStW820CD1vrXMlJnKUaqnardDhQGAsnbtKoQL5ak9uja0WgSm3TdyG5E
 nJMuLvWkO7NL4SKM44hQFLRjFtJIJudtdLd1v+3jFJWZDEGKqIjgB5Q/UQ/q2GERZv9X
 CskA==
X-Gm-Message-State: AOJu0YzCHmpckiaXn07vRcYTQKrx/zRnLrRkvkjWw8VE2jVqqikLKWY2
 ufAUihyzIZ44JF7ZpFWPwOur6hfoj+uZ4vX5OgKHRHyMOJCTEOzk9TVIVIZSUG8af95UQKDI7PT
 lKE9Yyu24ioTORSgu3YXQ9dMaozN4OcUPvWSEtcbae6CA9IKByqcUkdsvDg==
X-Gm-Gg: AfdE7cnzf/OkDrcRHlHxX4lfe34a1qlTJ4LfEzQSOSl7juif/SnP71Cur6cBEE6dzi2
 AlP2Ooegsk1Yzfg1fyTADEHdHZVw2Obf4ziCLWvDgBn3DAM5bQUKf8JpXJvrgFMi2O7m12iKUGe
 /6UngkAbtVY0uG6pQlDkHd8i5VzGsH95wS6QZHYiMMYsiq2b7hGL+D1gT5j/Y6SisuBYGku5H4c
 DNcp7nVeLzF/xsCyyWt678X8BDNH9bHAeu4UEGy+fe+i4n4YvELCXldrz+wb1bA345XWew7N9r6
 NNimZG0IkbreP3giT9aQ/z8hoRoH03ADLd5frBZWhUYD3L8tO4UxuCMbvupX7p1fTs4bBOweDq0
 Lt/4nLQYPJX+v9h1TKoq98xl8tLK9aBrlgyuXMe6nksBk3w==
X-Received: by 2002:a05:6214:4019:b0:8ca:256b:8741 with SMTP id
 6a1803df08f44-8e53543c244mr24782716d6.27.1782259654081; 
 Tue, 23 Jun 2026 17:07:34 -0700 (PDT)
X-Received: by 2002:a05:6214:4019:b0:8ca:256b:8741 with SMTP id
 6a1803df08f44-8e53543c244mr24782096d6.27.1782259653651; 
 Tue, 23 Jun 2026 17:07:33 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([189.79.21.40])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8df81cdec56sm142422976d6.32.2026.06.23.17.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 17:07:33 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com,
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com,
 fritchleybohrer@gmail.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2 18/24] hw/riscv/riscv_hart.c isolate tcg only bits
Date: Tue, 23 Jun 2026 21:06:25 -0300
Message-ID: <20260624000632.2149359-19-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LdAMLDfi c=1 sm=1 tr=0 ts=6a3b1fc7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=sHJf4AwOIoU3qjeHFPlg6Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=0nQI16K_ZF54athspwIA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: qgNbgpbKdYMw2gDJfApHWRO_PzDriD8J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfX2UyeGi6NeX79
 /SBE7HWJwezmRG86t4lGVV3kSdWIpLOJ+Ln6T73vGPy4fP5jmt+EcFL5wAbA0o01+KwzFrmy8bp
 Q3GwaPtu4FGm5HVLpa11LPUimc3MvLU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE5OSBTYWx0ZWRfX4gpOfPgn02bi
 HCWhP4Kw1BcVHE/+MamDN4Nw8ntMV//kQVLwdkGE6TYK8PRKiFCoL3O/1EdRnmcFWibYTXkNn/w
 Wr+cQVDxziOk45gLizugUw5smq7DjRAcIOYgK/PtSY53Yc5OPy/ZN2Xmk54bI974qEMIe0msDrD
 vRo5FTnL7CDyjD+F9jJWulvLIWSQj6Kz2xsbpuFgUCFJBrki3jfJJRgRTvC7JpShvI87Tmjs0EB
 3ZT9A5+T7gtIXrgwIxpvWBy+XHdiwcF2gsDSe1WeqHPJHHhSwdF6IBMQVtBU7DamEGk4T+c7WRG
 WAh/Ag6AzaRBc5ah1bwOq2z8wLVt45iHIPZhGd8xsoVCBvmIowCUTtQcZDabmlE5ugcGCdU5vhq
 Klnj5R8ZwbjBbJo4hxZ35uCgIX9SKQ==
X-Proofpoint-ORIG-GUID: qgNbgpbKdYMw2gDJfApHWRO_PzDriD8J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_04,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230199
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

riscv_cpu_register_csr_qtest_callback(), vcsr_call() and
csr_qtest_callback() are all TCG only and are not available in
--disable-tcg builds.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 hw/riscv/riscv_hart.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index d1c7188369..747754be61 100644
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
@@ -151,8 +151,10 @@ static void riscv_harts_realize(DeviceState *dev, Error **errp)
 
     s->harts = g_new0(RISCVCPU, s->num_harts);
 
-#ifndef CONFIG_USER_ONLY
-    riscv_cpu_register_csr_qtest_callback();
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
+    if (qtest_enabled()) {
+        riscv_cpu_register_csr_qtest_callback();
+    }
 #endif
 
     for (n = 0; n < s->num_harts; n++) {
-- 
2.43.0


