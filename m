Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7223CAC592
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 09:40:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v0d0v-0004oQ-6c; Mon, 22 Sep 2025 05:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czq-0002VD-0Z
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 05:38:14 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czC-0000fd-Mt
 for qemu-riscv@nongnu.org; Mon, 22 Sep 2025 05:38:06 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45df7dc1b98so24426795e9.1
 for <qemu-riscv@nongnu.org>; Mon, 22 Sep 2025 02:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758533844; x=1759138644; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1iOqbIE2K4YSn24nejTWVSAedyV/jyzH66EOGDnjiAU=;
 b=C6RdRDhhZjUh8/0q/UifG+yJmpMyFxPToMKDssfXrAcXBu4qzMVaGr7xqNAwuQ1L57
 6iBBcD3xluqjxxgyr1uGFa5OyNd48yNCYpNRNUZezseNELGVCRknGpPt8Re3KChzpIfa
 81VCqpkt5dIyTDKB0/APHBpmKyh+kIw9ccfav4PNpETa/MvOWcBHl18t5H05SYi2Hgv7
 LED7dY+Q094d74kG8vdccHJk+JiMpPlhfkv4gBGwlACDvoEEvpeOcVkw2E33NDcbBbGO
 /w2Kz+rkTQ+g8XdNKBuBC0t6HVtpSi5Ee4ll7CvRCZeKAhCh/S7GipQSmRjnL7Jffh7p
 mBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758533844; x=1759138644;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1iOqbIE2K4YSn24nejTWVSAedyV/jyzH66EOGDnjiAU=;
 b=u3VA04XejFICJF/KpLFBsH5t2ZtH8EOtlIfjhNEQYkQuuOjEd7Ubz7Hxia3Tvxum/i
 /5G4jeonNQ/PC9zqlRHcaq94qRC1ojYg4CW9hAj9njrAWafi47iOKWwTTVp2zFbpP/qa
 XFFmoJrCTmajUzCZ17c013zc2NXKm/j8knBlqQrzd95gURP36C+NtGqO0fwtt+8uikxi
 47KpVwrvAkWMH/lbK2NEJVhaMm/81e5kBc3Rsh8pvUVm3Za6jVn4vHb75v6KJ1ScVHej
 +k0acj1Ls3VfcPK5l+D9XyQSsrCMqT+5e+HRN3uIiZ3DYGxpIIaZlHPHbv6ldv9wnzA3
 2eUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnego9m/nF6b64Gr3DU3APguEVCZpzRy0KdvJnycW6h7c7l/yiKIslBa8lyussKTSPs3woHYhDePjF@nongnu.org
X-Gm-Message-State: AOJu0Yy5hEg0azp6IKUEJK1AVX6zI7L1Qj8noXh8kFp1Cl8I3yNmuruz
 DJ07YbZWTLNI2WTcl0+e0+BueIdaDcHZVzpW7qR1s9AE2HhvEFG+RoByeMl7dbMpHws=
X-Gm-Gg: ASbGncuF2a6+YMjRAGR6OBY0GvomyYqeqfXRDeomeAnP3D3uaYVjo7B+8c/0FVHRM4e
 olI0UBx1H8S6quyGLt0j5g3puXtfHOQ6xv0AnvZyXpyqxGsi6bzNLZK/aRyE1wdSvONyFp/TVf1
 TJlEVBV1TXEegWwJVpJbKTNVany0V3wknF6BaRI2rg3ZLFlqT+vKXtcqzizG8B7gwXT0/sOeFTZ
 3Jj9D91nmMBcEeQCJhHfc9oLso6lQGEEt/pPMJI87xm3INCoIUMWu9Sn67MZVLcEFSpa+OYPCV6
 HBXWZH5PONkZa6McDjPF/JeUhM0KNvqVgQan9H1gUzxNMptxKWrmip5OqJVgQoXrTmKzrixGdgQ
 2US8f0FI1yPaK5x3KwEEXsmQ=
X-Google-Smtp-Source: AGHT+IFkZwvxSmVDmxgSasMbzlLFLbhVkG8wbrFW9ZSpxWsVrcMe5RBVXVH9Wp5gPkJf08/UW7+0Xw==
X-Received: by 2002:a05:600c:3b11:b0:45d:d5fb:185b with SMTP id
 5b1f17b1804b1-467eaf51178mr99398715e9.20.1758533844252; 
 Mon, 22 Sep 2025 02:37:24 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613d42bee6sm241384845e9.15.2025.09.22.02.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:37:17 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3896B5F9F7;
 Mon, 22 Sep 2025 10:37:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 07/25] semihosting/arm-compat-semi: change
 common_semi_sys_exit_extended
Date: Mon, 22 Sep 2025 10:36:52 +0100
Message-ID: <20250922093711.2768983-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922093711.2768983-1-alex.bennee@linaro.org>
References: <20250922093711.2768983-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

We now check only is sys_exit is extended.
This allows to break dependency to TARGET_SYS_EXIT_EXTENDED which will
not be available anymore from this code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <20250822150058.18692-5-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/common-semi-target.h   | 4 ++--
 target/riscv/common-semi-target.h | 4 ++--
 semihosting/arm-compat-semi.c     | 3 ++-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/arm/common-semi-target.h b/target/arm/common-semi-target.h
index da51f2d7f54..7bb442f24ca 100644
--- a/target/arm/common-semi-target.h
+++ b/target/arm/common-semi-target.h
@@ -34,9 +34,9 @@ static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
     }
 }
 
-static inline bool common_semi_sys_exit_extended(CPUState *cs, int nr)
+static inline bool common_semi_sys_exit_is_extended(CPUState *cs)
 {
-    return nr == TARGET_SYS_EXIT_EXTENDED || is_a64(cpu_env(cs));
+    return is_a64(cpu_env(cs));
 }
 
 static inline bool is_64bit_semihosting(CPUArchState *env)
diff --git a/target/riscv/common-semi-target.h b/target/riscv/common-semi-target.h
index 7c8a59e0cc3..ba40e794dcc 100644
--- a/target/riscv/common-semi-target.h
+++ b/target/riscv/common-semi-target.h
@@ -25,9 +25,9 @@ static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
     env->gpr[xA0] = ret;
 }
 
-static inline bool common_semi_sys_exit_extended(CPUState *cs, int nr)
+static inline bool common_semi_sys_exit_is_extended(CPUState *cs)
 {
-    return (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 8);
+    return sizeof(target_ulong) == 8;
 }
 
 static inline bool is_64bit_semihosting(CPUArchState *env)
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index a239cfc5a9d..26263a06b7a 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -755,7 +755,8 @@ void do_common_semihosting(CPUState *cs)
     {
         uint32_t ret;
 
-        if (common_semi_sys_exit_extended(cs, nr)) {
+        if (nr == TARGET_SYS_EXIT_EXTENDED ||
+            common_semi_sys_exit_is_extended(cs)) {
             /*
              * The A64 version of SYS_EXIT takes a parameter block,
              * so the application-exit type can return a subcode which
-- 
2.47.3


