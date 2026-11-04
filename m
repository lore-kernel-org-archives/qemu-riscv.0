Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630906086BB9
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 19:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=bboZDR7l
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xOgsO-0002B8-0w; Wed, 04 Nov 2026 14:42:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgsM-0002Af-Is
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:42:26 -0500
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1xOgsI-0002Ij-TU
 for qemu-riscv@nongnu.org; Wed, 04 Nov 2026 14:42:26 -0500
Received: by mail-dy1-x132e.google.com with SMTP id
 5a478bee46e88-36a18fc7a38so309385eec.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Nov 2026 11:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1793821341; x=1794426141; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MpyIuCg0VMdLOy5cL/nzw0/NviSe0pDX/l8xpeB/uWE=;
 b=bboZDR7lUeUQarXLR/aw0k48KejKUeNP2mATYcbAT7tSkAH5BZpHVxwTAm5yPDfY/X
 4fQrw84BNtVo0/84ljmQa07gfqPjLS2hqTHl9sB8QvmMtEf5F2jxEbdMpJyErd6lTaU/
 0PaX20oORQlNKDyW5DKPI6fNRlmMFF4Z2/XZPxoIYnlSVlmbnkuJRt5ZNcaobTJ9H+rn
 OEIH9dLc5kdhsazW4Mu2H7Bi+Tr0TVlhwmOmzc5uYnF8JAjOFwb8pA4dCF0/ToaIbJ22
 c4rg54EZGLqVWuUmkujiny+ccKDMCE+d5Ehh1r0CEVoepxYRUhjCH+OsWlHgCEPr15XZ
 Sklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793821341; x=1794426141;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=MpyIuCg0VMdLOy5cL/nzw0/NviSe0pDX/l8xpeB/uWE=;
 b=ht4DhuwZJZKZSP4meDcDNfmtkHndjaaAjJ7mfB//ZChbnR/sxnqQmvm1Z5PT8jbtdF
 6cTVz94P/LRRlGn6ykglyia+QIgkK75NVRyg6AGauMV/BoliLXH24qZyxGw/PWnSmNB+
 adPnvCtikz3yRq0Sp/I9vQ9u5peIbeGf2+XgU3KUrBe7JODb2UsX/iH8xQt2z0ktKBdO
 2u468ivXelw4xF8+gJ8MgTCE5IFpGbP/h7FDuNuLdkvzIGy8jHE7wVJGgD2ioJCvf9mg
 CoF97tLIwUZn+CPEW8rs/DvWaOMttBWOzP31nQ4BtsjEXRLQhJl1WuDXfR2vNePi4H6e
 rpTg==
X-Forwarded-Encrypted: i=1;
 AKwUvBy8ut5U6e43SODbNO/mMRQrsdiav5qHbqns2ItFryVH+9OysnJS5SYSKTCM49LcxwdfKAj1ZsHbFN2h@nongnu.org
X-Gm-Message-State: APuU4Z842eCCwxZ9zAoC5OEQkR4d+m2vuS7k7a3wFeFgTFMs8fEQ2dT4
 0K5lwFxQyR+oXpU9G2RXM3w3Bn9pYHGRuNuYDG5Pnun/W/HOmxPAEPYBX9fOnENQL3g=
X-Gm-Gg: AYBFou3kFY1wcZXamRimhUYHt50rr1HnahwT2zkzqz/8avcPL0pyxnstsnV+Esige/y
 3kLnx+gWyYkw5+e3nKgXPv2ps1SzhchcjPlMR/Sc9hY8wlc5kgdPOxc3JWfyw0pPrGXxgDxkn59
 qK6DpnumFx+Jne/jx3qAErbJ899BrC+CPWP5xkd3hwX1kp6Nr/g4KrhlnSQR1VL7KTyV0j3/wYG
 VpnWW6jJ8rJR+UW51ggI/Jvxfd5qxlolIAbsyiA9Qv4NoJgGFpFvuprjH/ZjIjRtyzxz9+HnYc8
 gNS5k9vRzQK0sNdkoxrdhVH/9aWgNSIL75YqiKIXp+shmjzNsYB3OkBNDnQIj0HDXsKrbwLeLCU
 ai/BeehXLif2xZXb8u0RDVUNH4hiIrjElCUfCoRMXzZK7h6/Qpegky0vf3L5wJz0ZxCle86M7IA
 mLzP4WRFi21PgJwjWKFv9yDClQo5o5QV5+NACzCKziUVyStds6KkiT0AbyYN0CHQZ14vaLgtt7n
 g/f2oUe5luBrlA3JX+lfL2QZB/ympHxH/RfjRXDicGO2zWgwB7j4CWTjX44ktjzxl1OpdAvhUqE
 R49SmxM98yCSWjF1meONeACnhbD7jXzwYeB4eWOu/B5nfYnM5hIhVwT2FforP2GJAaSE5KX6FIS
 wExSGczUu28/vidrMwX0UP4QWOWCKwWDB07piWIa+d8VlMJMjTQ==
X-Received: by 2002:a05:7300:6016:b0:35d:f7f4:bc1c with SMTP id
 5a478bee46e88-36a4235facemr22647048eec.6.1793821340562; 
 Wed, 04 Nov 2026 11:42:20 -0800 (PST)
Received: from duncan.localdomain (114-35-142-126.hinet-ip.hinet.net.
 [114.35.142.126]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36ca38d36a1sm11299527eec.12.2026.11.04.11.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 11:42:20 -0800 (PST)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Max Chou <max.chou@sifive.com>
Subject: [RFC PATCH 01/38] fpu/softfloat: Support OCP(Open Compute Project)
 OFP8 checking functions
Date: Thu,  5 Nov 2026 03:41:16 +0800
Message-ID: <20261104194155.679241-2-max.chou@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104194155.679241-1-max.chou@sifive.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132e;
 envelope-from=max.chou@sifive.com; helo=mail-dy1-x132e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Include following checking functions liked other fp types:
- *_nan_is_snan
- *_is_quiet_nan
- *_is_signaling_nan
- *_is_any_nan
- *_is_neg
- *_is_infinity
- *_is_zero
- *_is_zero_or_denormal
- *_is_normal

Signed-off-by: Max Chou <max.chou@sifive.com>
---
 fpu/softfloat-specialize.c.inc | 55 ++++++++++++++++++++++++++
 include/fpu/softfloat.h        | 70 ++++++++++++++++++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 8b765ef623f..22a3188f99b 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -255,6 +255,61 @@ floatx80 floatx80_default_inf(bool zSign, float_status *status)
     return packFloatx80(zSign, 0x7fff, z ? 0 : (1ULL << 63));
 }
 
+/*----------------------------------------------------------------------------
+| Determine if a OCP FP8 E4M3 NaN is signaling NaN.
+| E4M3 has only one NaN encoding, so classification is policy-based.
+*----------------------------------------------------------------------------*/
+
+static bool float8_e4m3_nan_is_snan(float8_e4m3 a, float_status *status)
+{
+    return get_float_e4m3_nan_is_snan(status);
+}
+
+/*----------------------------------------------------------------------------
+| Returns 1 if the OCP FP8 E4M3 value `a' is a quiet NaN; otherwise returns 0.
+*----------------------------------------------------------------------------*/
+
+bool float8_e4m3_is_quiet_nan(float8_e4m3 a_, float_status *status)
+{
+    return float8_e4m3_is_any_nan(a_) && !float8_e4m3_nan_is_snan(a_, status);
+}
+
+/*----------------------------------------------------------------------------
+| Returns 1 if the OCP FP8 E4M3 value `a' is a signaling NaN; otherwise 0.
+*----------------------------------------------------------------------------*/
+
+bool float8_e4m3_is_signaling_nan(float8_e4m3 a_, float_status *status)
+{
+    return float8_e4m3_is_any_nan(a_) && float8_e4m3_nan_is_snan(a_, status);
+}
+
+/*----------------------------------------------------------------------------
+| Determine if a OCP FP8 E5M2 NaN is signaling NaN.
+*----------------------------------------------------------------------------*/
+
+static bool float8_e5m2_nan_is_snan(float8_e5m2 a, float_status *status)
+{
+    return frac_msb_is_snan((a >> 1) & 1, status);
+}
+
+/*----------------------------------------------------------------------------
+| Returns 1 if the OCP FP8 E5M2 value `a' is a quiet NaN; otherwise returns 0.
+*----------------------------------------------------------------------------*/
+
+bool float8_e5m2_is_quiet_nan(float8_e5m2 a_, float_status *status)
+{
+    return float8_e5m2_is_any_nan(a_) && !float8_e5m2_nan_is_snan(a_, status);
+}
+
+/*----------------------------------------------------------------------------
+| Returns 1 if the OCP FP8 E5M2 value `a' is a signaling NaN; otherwise 0.
+*----------------------------------------------------------------------------*/
+
+bool float8_e5m2_is_signaling_nan(float8_e5m2 a_, float_status *status)
+{
+    return float8_e5m2_is_any_nan(a_) && float8_e5m2_nan_is_snan(a_, status);
+}
+
 /*----------------------------------------------------------------------------
 | Determine if a float16 NaN is signaling NaN.
 *----------------------------------------------------------------------------*/
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index d48fc6b0437..4d91599e25d 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -222,6 +222,76 @@ bfloat16 float8_e5m2_to_bfloat16(float8_e5m2, float_status *status);
 float8_e5m2 bfloat16_to_float8_e5m2(bfloat16, bool sat, float_status *status);
 float8_e5m2 float32_to_float8_e5m2(float32, bool sat, float_status *status);
 
+/*----------------------------------------------------------------------------
+| OCP FP{4,8} classify operations.
+*----------------------------------------------------------------------------*/
+
+bool float8_e4m3_is_quiet_nan(float8_e4m3, float_status *status);
+bool float8_e4m3_is_signaling_nan(float8_e4m3, float_status *status);
+bool float8_e5m2_is_quiet_nan(float8_e5m2, float_status *status);
+bool float8_e5m2_is_signaling_nan(float8_e5m2, float_status *status);
+
+static inline bool float8_e4m3_is_any_nan(float8_e4m3 a)
+{
+    return ((a & ~0x80) == 0x7f);
+}
+
+static inline bool float8_e5m2_is_any_nan(float8_e5m2 a)
+{
+    return ((a & ~0x80) > 0x7c);
+}
+
+static inline bool float8_e4m3_is_neg(float8_e4m3 a)
+{
+    return a >> 7;
+}
+
+static inline bool float8_e5m2_is_neg(float8_e5m2 a)
+{
+    return a >> 7;
+}
+
+static inline bool float8_e4m3_is_infinity(float8_e4m3 a)
+{
+    return false;
+}
+
+static inline bool float8_e5m2_is_infinity(float8_e5m2 a)
+{
+    return (a & 0x7f) == 0x7c;
+}
+
+static inline bool float8_e4m3_is_zero(float8_e4m3 a)
+{
+    return (a & 0x7f) == 0;
+}
+
+static inline bool float8_e5m2_is_zero(float8_e5m2 a)
+{
+    return (a & 0x7f) == 0;
+}
+
+static inline bool float8_e4m3_is_zero_or_denormal(float8_e4m3 a)
+{
+    return (a & 0x78) == 0;
+}
+
+static inline bool float8_e5m2_is_zero_or_denormal(float8_e5m2 a)
+{
+    return (a & 0x7c) == 0;
+}
+
+static inline bool float8_e4m3_is_normal(float8_e4m3 a)
+{
+    uint8_t em = a & 0x7f;
+    return em >= 0x8 && em <= 0x7e;
+}
+
+static inline bool float8_e5m2_is_normal(float8_e5m2 a)
+{
+    return (((a >> 2) + 1) & 0x1f) >= 2;
+}
+
 /*----------------------------------------------------------------------------
 | Software half-precision conversion routines.
 *----------------------------------------------------------------------------*/
-- 
2.56.0


