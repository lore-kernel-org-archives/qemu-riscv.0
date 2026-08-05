Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C2FC561E6
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 18:26:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wrgJH-00007Z-DH; Wed, 05 Aug 2026 14:25:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wrgIu-0008VP-SP
 for qemu-riscv@nongnu.org; Wed, 05 Aug 2026 14:25:28 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wrgIt-0007fO-09
 for qemu-riscv@nongnu.org; Wed, 05 Aug 2026 14:25:24 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 675HS6Eb3888513
 for <qemu-riscv@nongnu.org>; Wed, 5 Aug 2026 18:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Fo9WcDAG0XW
 YO36L1JlqsbMEVdpKaz9zVMY7ExGggkc=; b=ao8eh9FgDGFGYs/9DW2QV5Ajvpd
 EovEcxvfFB4m9ZWfMaWLx1BmohsJVRgWFT6w3L6YqqNEJ+/5+NYEdNed/NdZLq6D
 chPAjmjv5uGbZJRmKsQRMNyt5MmyE+oQpIXjnS+5STF5LyzcqQXufZ0oJS7tTSB9
 PK4iXMoVAxQp8eSYhCmTKAT4euqTFAYCJZDi16CTr8zBWPN7x1m9XyCxjXYTCQhP
 WwZ6Y/10dUG5Gol1Yq5ku1Qu88lGRnPzH5Fm71U5O3yTQnyw7b702hBiTr5Kb8h4
 +Czf+14uugOW5ILCkdDXukfhbjNzgFcoHbWoaqDPyvSTxWdM2gLS8JfvHsw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5sh62-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 05 Aug 2026 18:25:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-930f5da3467so136014785a.2
 for <qemu-riscv@nongnu.org>; Wed, 05 Aug 2026 11:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785954321; x=1786559121; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Fo9WcDAG0XWYO36L1JlqsbMEVdpKaz9zVMY7ExGggkc=;
 b=kuJ8gVZT/9xNcBIywXyFmM7CjgMejWH4w7WeO703X3MHBpEAdOkJ9kGnL+hPZ846Rk
 DX14MiZsBxPpYLSZxBWGM4ROYNTwNBlOEDf5IxGi5h195KPw7ZQKX62qZJHYkRoQvjAP
 Bi0YE9gUvSjig6fYYj2eXUY3BsiQ/rxJsF594pmcCI7iOBqA5YoghkTxuJu5hdcPiSg+
 sCMY4bazMZ4ozVsbjtG+WRD8A0qmwyB4YYUa4EfBlzSwxGU0znOcT9BcVj6XZaqSB1yu
 LqB+/QBc/Tx2agC3bIKFps/J3oluPFhf1aNg2/dlGj/J9YkcjT5US5jXkRXRtyPKNPhP
 g/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785954321; x=1786559121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Fo9WcDAG0XWYO36L1JlqsbMEVdpKaz9zVMY7ExGggkc=;
 b=jACotdG19DUXhd3libfeA1zlJG32jbb6o4yuYRNvfq02Ic4/o6EatfnAx6ey9DsJb4
 bUohj+V6zxOhQzbkkKCWszbrJwF2pTrUebPvc4E+kOzXrE5OIsayZ9Y3fPQ1EgUrD664
 ZUCGq9VXC3SHUSok06Hx1TmxxsZsqje5fscmkbAwhki2KHcBdqaDfirixYLExz64IP8n
 DtcfhcE7eHoyvVpr2attD/k2ARd/dCkZU2jIGyPnITjtrBf3K/LLdZS12NgnMFrxf/+Z
 eBDEWg74CJvDydJ0GRhIKltTfm1TeApHKgGxLTIzLSEXgg1AH/jCVqJhIk3XUdjot0gx
 JrfA==
X-Gm-Message-State: AOJu0YzENzpSSa7ZiQQnMSk/oTnpR5a8nHRkpC6EHArU/g0CIYkvyOzx
 3xl+4siLyOsqQcem0QMWcAufQMjf19ksLiXnu93OqA+uPpyH261oYTqURMpWznaOBhozdNv6XwC
 DYWF9gk7i9VDK9byb4wCLh1KPVKgnKSVxbA39iyVPMG1FU5bkt5h0uUqTNg==
X-Gm-Gg: AR+sD13yynbZc4d408iIN/Vv20YSuhVB3zymrVZd5d0v6leT/hiaGEn1FFIRFYiLjXg
 jANkMRVMpFb8nnQnhwMmSihFaxUBpS0aJU6W5j39epujJ8UtClgLiWXqk+iyBX52pkZFueqlbGz
 YkQbAUNZERys3l0k79+Lx3bmtsHyasO8PPA083c4th7yOP8PjK7ei/HnoRpQC+5fbfASO6qQcIv
 PLFDNh9BKtXFXKxnZOtX1EkjJXFWt1Wy++NFVkdjE1t8u5IWHMRUC3AzuVcydwIDXm1Z8egYuiK
 MnAjHjQtHsqqNln7DhqSecXkH8yv2sXzEVxBOExEM5IiSGVeyUO3pw/oieovTtWmEjhowxlOJ5W
 O4+KquJuLTTfaDL8zjgyLlYO0kB4Z214ELU6G1Q==
X-Received: by 2002:a05:620a:260a:b0:934:9a26:eae9 with SMTP id
 af79cd13be357-9364910ad88mr902661585a.17.1785954321269; 
 Wed, 05 Aug 2026 11:25:21 -0700 (PDT)
X-Received: by 2002:a05:620a:260a:b0:934:9a26:eae9 with SMTP id
 af79cd13be357-9364910ad88mr902657285a.17.1785954320860; 
 Wed, 05 Aug 2026 11:25:20 -0700 (PDT)
Received: from QCOM-UWl2o8bcGT.qualcomm.com ([187.11.154.152])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9364a3fc901sm209387885a.6.2026.08.05.11.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 11:25:20 -0700 (PDT)
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 3/5] target/riscv/tcg/debug: adjust 'timing' bit for Debug 1.0
Date: Wed,  5 Aug 2026 15:25:04 -0300
Message-ID: <20260805182506.2943757-4-daniel.barboza@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805182506.2943757-1-daniel.barboza@oss.qualcomm.com>
References: <20260805182506.2943757-1-daniel.barboza@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Xea5Co55 c=1 sm=1 tr=0 ts=6a738012 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=iMfxv9gflPUPBcmW7/Gq5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=hcgX7uFSkN2IqaP9zZIA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: PHSfGDytXnyD9UXmkBtGHvxZ-9NHaqkX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE1MSBTYWx0ZWRfX0BTc1Njr5D2j
 GkH8CRkKazsHiIQTfBLGAjKNGZwaqlHTWNOgxAFlaRWrQj8ibTQKZGntkTjPph4ALmI8NvFFp2l
 ii/VGyqWQYzP29UkkTaRfr1T/47jvLP2lej6QYdC6a0e1bXiDQI+LraFme3FjJKk4Xk0oqZCwfs
 K0TIk3z/Da3aFp9aiC3S2j6jVb8+TjS9+a1anmWtmXErXcNA4dqciEP+WeVJj0mEJ4WOFCQx6R+
 YMd60AjXHGOJdEICiC+zZt/GDpLOXNvaNAIh7yFPKe2h9wH9HKrtPNuDTJajxtLGyEdrsmcDLkX
 /qCJgwqqSXOSPmck6/c+oLGruM4B0HPxk6Ig8x+u+QT61KUc8LrVMI0Hc3sKrr6G6zLiHiW24Ep
 XCv244IScfdTkqWVkAiDXYGSr1JRrm32vdMxk3/vWFJvEoAlO/J0XvQR9NNY+i/tE4c4uLkpjY6
 nbIY7lXNaZ12cbenh7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE1MSBTYWx0ZWRfX/VSVSkev+rqr
 293gxg0UoNkK5PZ8ugDRItyNPwzUwb6d+02o4aUDqBfv2tNCT+C2GDyxBwhwg7HVelYU5PJsRbN
 YBonMo+ZxTowhkKVk6r4VLZlcD+Iy6M=
X-Proofpoint-ORIG-GUID: PHSfGDytXnyD9UXmkBtGHvxZ-9NHaqkX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050151
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Version 1.0 changed the 'timing' bit.  It is now bit 18.

Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
---
 target/riscv/tcg/debug.c | 7 ++++++-
 target/riscv/tcg/debug.h | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/riscv/tcg/debug.c b/target/riscv/tcg/debug.c
index 2191928761..8b23c8d045 100644
--- a/target/riscv/tcg/debug.c
+++ b/target/riscv/tcg/debug.c
@@ -584,10 +584,15 @@ static target_ulong type6_mcontrol6_validate(CPURISCVState *env,
     warn_always_zero_bit(ctrl, TYPE6_MATCH, "match");
     warn_always_zero_bit(ctrl, TYPE6_CHAIN, "chain");
     warn_always_zero_bit(ctrl, TYPE6_ACTION, "action");
-    warn_always_zero_bit(ctrl, TYPE6_TIMING, "timing");
     warn_always_zero_bit(ctrl, TYPE6_SELECT, "select");
     warn_always_zero_bit(ctrl, TYPE6_HIT, "hit");
 
+    if (debug_trigger_version_1_0(env)) {
+        warn_always_zero_bit(ctrl, TYPE6_TIMING, "timing");
+    } else {
+        warn_always_zero_bit(ctrl, TYPE6_TIMING_0_13, "timing");
+    }
+
     /* validate size encoding */
     size = extract32(ctrl, 16, 4);
     if (access_size[size] == -1) {
diff --git a/target/riscv/tcg/debug.h b/target/riscv/tcg/debug.h
index a25d099b37..eb635bc277 100644
--- a/target/riscv/tcg/debug.h
+++ b/target/riscv/tcg/debug.h
@@ -98,7 +98,8 @@ typedef enum {
 #define TYPE6_CHAIN     BIT(11)
 #define TYPE6_ACTION    (0xf << 12)
 #define TYPE6_SIZE      (0xf << 16)
-#define TYPE6_TIMING    BIT(20)
+#define TYPE6_TIMING       BIT(18)
+#define TYPE6_TIMING_0_13  BIT(20)
 #define TYPE6_SELECT    BIT(21)
 #define TYPE6_HIT       BIT(22)
 #define TYPE6_VU        BIT(23)
-- 
2.43.0


