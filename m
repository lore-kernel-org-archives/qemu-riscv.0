Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC56C5AD2C
	for <qemu-riscv@archiver.kernel.org>; Sun,  9 Aug 2026 01:36:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wssQI-0000QB-Mt; Sat, 08 Aug 2026 21:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wssQH-0000PD-Rs
 for qemu-riscv@nongnu.org; Sat, 08 Aug 2026 21:33:57 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wssQE-0002Nd-Vd
 for qemu-riscv@nongnu.org; Sat, 08 Aug 2026 21:33:57 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-38125cebfdaso947093a91.1
 for <qemu-riscv@nongnu.org>; Sat, 08 Aug 2026 18:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786239233; x=1786844033; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GU/L2JcroJNHA+KY28DNLnCmO+j8k/C0lmalv2aUq0M=;
 b=DT2l6yERyOrTZ/+fGv+Iy2ylNBIMJaSNtK0ssXIxGQnog2i5klal0JClkItTj5XNz/
 SMYr3ZNIwaIyBauOJ+9bCgbKxOW4aP84lCcCCcngo62r9/JpmqV6LQmKkeXU/sokI6JL
 NB1Amt7/mQhfHWcRw8pm1HEk5twftWy+FX3NjgpY3xRxuH542BHBzVCzflqki6J96KWE
 Cu8X9Z8/5urZOJy4HGGozKPZ733s/NXQdp0Ik1V3R1Ngv+28r3Z4aYYiuJbYwNn3f4TC
 qjO/sAWyyn/Oi6FNTE55/F6eHHa8IZZMpssUvy0LTorJCOkEvYshEYwshDhASnxMvIIa
 bUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786239233; x=1786844033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GU/L2JcroJNHA+KY28DNLnCmO+j8k/C0lmalv2aUq0M=;
 b=Fm8o6MFn8mrhC3vCMmTJHVJqbjFs2cKAb5fPf/abChrm7nb4MhM8hfxvow7nbyyIG3
 FjVeyWbQI23QQMMFegto1tOWKcq/0rbYHqGNLbcjOkw04OLgXh0ZtmcWQysdvPXy7KH9
 8y/L4GFJ+hZMycDZjRdMsaueH8u1l5QBov0lAyeZjLMJ+5xUbhZh36Z6I+PpNye6iMBr
 cOSSxUqDPDnC24cjmOHqCbOn8RwTTZVJAujczdQ7PQR3/r8yohnp+TYjSzx7Bd89Waqm
 ka9ilFCxiyRbOE8n/iJXwmnh/MjDJ9k7itYRwmXDrJWpDDb/IQC+LstijL2zknQq9Po2
 jDcg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrrr0ivKKQf8f9q5iJ65hD2N3Had9HX0U2aa8d7IaXyAb6wdf1SI1l3YtHoPqbvYaXZw4WMV70/f5M2@nongnu.org
X-Gm-Message-State: AOJu0Yz6vTAqVLslmEL3wDLBLbEiuFF5EYV2QrOdhshmk0OBlZhcu3qp
 qgzE9juXT3dRGf/lA3qyc6m3wyqXvA23mpYmWdAmuNFQWQ9yaZ/NMsY+wUssgKYw6lM=
X-Gm-Gg: AR+sD10o20qlnY7ip2bzZOe8/XQfbqK5gsKBOdH3qaey1RNLobVyAVrtSMWKlqcXQiE
 75tcYqHMqQHo0/hCsPuLC35fLeYSnLFuP3U9ruC5IBzRMckkAzH7SrUktB+ioDrypPQmS6nyAyV
 ACole7fcBqZKDOD82qG00rpj7g/UrtJQRtxmiZg1sw3GzPxxrI1gF4x3xsYGvk16Q99sxym3qq4
 RNlNEG30QoaETgkIfOp6zUd4Jw4yarVonfKzsJ031LIG5EDWKGTaiK7xpxxowvGoTAwa+AQ38rb
 y/vYw3dutgjRWIWR7iYU4oV+WPmUod88uF5koLJsHGl+eIpoweVjd3lVJNraY8OMruKCshZNB6K
 iDSMtljoMLCbhwzKDix3S9mnG4bjE0lrm55/R6WpH7kab8g3OKLnRZV4mkOGjILhvriHVDtUr5P
 G7QT+3dlVGYyfaEjnpsTajKRhSzlGRrHnD73/wp3hBxuLXU1jHZhkV77RlUhp7e9IQmIF3Flu4q
 F0eRwdE/DZn558colf7
X-Received: by 2002:a17:90b:3b45:b0:38e:4f41:83df with SMTP id
 98e67ed59e1d1-392621444f0mr13898722a91.15.1786239233399; 
 Sat, 08 Aug 2026 18:33:53 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39085de8ddcsm10067927a91.6.2026.08.08.18.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2026 18:33:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: 17746591750@163.com, laurent@vivier.eu, philmd@mailo.com,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH 7/9] target/s390x: Update capstone disassembly to v6
Date: Sat,  8 Aug 2026 18:33:41 -0700
Message-ID: <20260809013343.664966-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809013343.664966-1-richard.henderson@linaro.org>
References: <20260809013343.664966-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

In particular, this enables many more vector insns.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/disas/capstone.h | 11 +++++++++--
 disas/capstone.c         |  2 +-
 target/s390x/cpu.c       |  4 +++-
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/include/disas/capstone.h b/include/disas/capstone.h
index a922f7627f..87f8f6181f 100644
--- a/include/disas/capstone.h
+++ b/include/disas/capstone.h
@@ -4,7 +4,6 @@
 #ifdef CONFIG_CAPSTONE
 
 #define CAPSTONE_AARCH64_COMPAT_HEADER
-#define CAPSTONE_SYSTEMZ_COMPAT_HEADER
 #include <capstone.h>
 
 #else
@@ -19,7 +18,6 @@
 #define CS_ARCH_X86     -1
 #define CS_ARCH_PPC     -1
 #define CS_ARCH_SPARC   -1
-#define CS_ARCH_SYSZ    -1
 
 #define CS_MODE_LITTLE_ENDIAN    0
 #define CS_MODE_BIG_ENDIAN       0
@@ -84,6 +82,15 @@
 #define CS_MODE_SH4A             0
 #endif
 
+#if CS_API_MAJOR == 0
+#define CS_ARCH_SYSTEMZ         -1
+#elif CS_API_MAJOR < 6
+#define CS_ARCH_SYSTEMZ          CS_ARCH_SYSZ
+#endif
+#if CS_API_MAJOR < 6
+#define CS_MODE_SYSTEMZ_ARCH14   0
+#endif
+
 #if CS_API_MAJOR < 5
 #define CS_ARCH_TRICORE         -1
 #define CS_MODE_TRICORE_110      0
diff --git a/disas/capstone.c b/disas/capstone.c
index 78062339d0..a5bd91890b 100644
--- a/disas/capstone.c
+++ b/disas/capstone.c
@@ -95,7 +95,7 @@ static cs_err cap_disas_start(disassemble_info *info, csh *handle)
                   (uintptr_t)&cap_skipdata_riscv);
         break;
 
-    case CS_ARCH_SYSZ:
+    case CS_ARCH_SYSTEMZ:
         cs_option(*handle, CS_OPT_SKIPDATA_SETUP,
                   (uintptr_t)&cap_skipdata_s390x);
         break;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index c074e12ba2..e81cf16ac3 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -225,10 +225,12 @@ static void s390_cpu_reset_hold(Object *obj, ResetType type)
 static void s390_cpu_disas_set_info(const CPUState *cpu, disassemble_info *info)
 {
     info->mach = bfd_mach_s390_64;
-    info->cap_arch = CS_ARCH_SYSZ;
+    info->cap_arch = CS_ARCH_SYSTEMZ;
     info->endian = BFD_ENDIAN_BIG;
     info->cap_insn_unit = 2;
     info->cap_insn_split = 6;
+    /* Disassemble everything, even if the cpu would trap on the insn. */
+    info->cap_mode = CS_MODE_SYSTEMZ_ARCH14;
 }
 
 static void s390_cpu_realizefn(DeviceState *dev, Error **errp)
-- 
2.43.0


