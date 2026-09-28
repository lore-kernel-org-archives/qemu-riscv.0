Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB9AC98328
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 05:25:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xB3q0-0005Tj-5Y; Mon, 28 Sep 2026 01:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3p3-0004Ji-7v
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 01:22:42 -0400
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3p1-0007y2-0X
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2026 01:22:40 -0400
Received: by mail-dl1-x1232.google.com with SMTP id
 a92af1059eb24-144f79153f5so1389298c88.0
 for <qemu-riscv@nongnu.org>; Sun, 27 Sep 2026 22:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790572957; x=1791177757; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=V7+TSeCs1OkWi/fweWHWaqMKw8c/A0ZiNHA+KMl1mwg=;
 b=Vn0NeLPBMnSS52QqrhG38ARaNza6N1yPkj1WMQHKQTb9dQDAotGMCOW+iYv6Utq+al
 ebmdFjKPZ5vtZpEhm50fHFUF5wH9fLrqBi5cRiIkLhjA2m2V3owLvI6lzvjLqNHKMSDy
 XiteJ/NAHUQyhhLgVk1cPIHTEvr54LyJDpTu3U2elDfQDtyO7hmFhKc4AXhOCp/y6NA0
 5rwb+niHzcrfQMvvsrwhUhPu43XYqfkT1lAjZrM+f/otkaWffmnk9uA5xv7fZrVIscZM
 O7eUbVS+PKlMLisk0M5q12D12+GN8r3jkXhw6kaQchCSrmk1g25Rdi8LnsyOmHthBCoO
 Gb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790572957; x=1791177757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=V7+TSeCs1OkWi/fweWHWaqMKw8c/A0ZiNHA+KMl1mwg=;
 b=XHCRMBXQVyZDH8l4zzTQ/5e8IWZn/DpmKgkJVNl9dj0ttz50oMx8jGJfpHIVTG+QPJ
 G2RN2cYtbOJxICNzRIiOY1VRgi/Y/Vt/EOy9VDg5sA4lQy/KYZr9Jm+MQNx6By6aDZEv
 uiT9goGx1tJHh06UUazO8giqETkHYvT7X94JTBF5wYph28m4DVNQr2/cQ796V5bhPsva
 3OYMya5oFRkGlIQzydJdBmvdQXHe3cXvyVO94yZ5gAfIPxdjj2ONYJWwoVske9kx8SKq
 osqW2TYh3KN79xKQzsAp+1/o0P6OfkQrXq9wnjDY8ihP30ODpuyAgQYz+GT87nwI59JJ
 c6LA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwxWuXUZCB7bUjC8i81dYjgSHPrbHgDpMMxlyTKL8KQoYe9naeKVvQtNt7UsDTXEEg0UMCvweBIf5tN@nongnu.org
X-Gm-Message-State: AFuF++nOxylLl8Qe1Irsa/oaJKjQYD280MLUs1zyjw1ztanIqqiqLAIA
 C8o+uXJV97Qz9HgAvSq7Y2b/4gvqN3NcRdFxjU/hZs6fD8B08TREDop9
X-Gm-Gg: AYBFou0HhH4pf6PcepnhvqK1FWrn8W/Oq98eoQRx8zqaT1vHuajEIluVnVpuW7uLbAB
 gU9gxQMAcDUBsJovwyiexE7X9WVNgXTwTtuFAsT88Ycnir/XWYECNvbvoXUyz0k/lo3ktj2lggU
 Dmzh9nQxbxpN5QF2c8NP51AmxCl+0Cxyn1fhjDvqNyV7BSb7D1p+ds0cV9I+edsw45KR2fODkLY
 CmZUVk5AAaejgDTf1PuOFwlKBieLTCnoiod2myaJn/Gdgi1dJ9caPhNPj/xPIAo9D6EfIv6WO6e
 bdeSnk1yGxloz0rshPmC0UIGWPco07k+G050dmLd8pVQzqGP8fx7H8fZz3J/LwpF29lxJ2oSgMl
 vTMQRrB8G6A6y1frUPYQFGYnEHxYErLC7PXH2XtF01ZMW6iGz9h1oG68m7nOFM06eucigWGtSzm
 d7oLKKNNC19bQn7WuZzA/LdPNYSFltGPEBtmnlbIGz6w6KysZjvkGYqcMyAiYUR8G37Ge0GaLO8
 wWvCVyVa6xhBCfD4G0OSnAv/GYJhXY=
X-Received: by 2002:a05:7022:f508:b0:143:3769:c680 with SMTP id
 a92af1059eb24-146d0d46e43mr6412033c88.25.1790572956658; 
 Sun, 27 Sep 2026 22:22:36 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-146bb6551d9sm14726248c88.9.2026.09.27.22.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 22:22:35 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Chao Liu <chao.liu@processmission.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Stafford Horne <shorne@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>, Glenn Miles <milesg@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Song Gao <17746591750@163.com>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org
Subject: [PATCH v2 12/24] target/loongarch: convert raise_exception to
 raise_excp
Date: Mon, 28 Sep 2026 13:20:38 +0800
Message-ID: <20260928052051.251-13-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260928052051.251-1-luoyonggang@gmail.com>
References: <20260928052051.251-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1232;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Translate through raise_excp_restore after storing PC. Drop TCG
raise_exception. Keep C do_raise_exception and use
cpu_loop_exit_excp.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/loongarch/tcg/helper.h    | 2 --
 target/loongarch/tcg/op_helper.c | 6 ------
 target/loongarch/tcg/tcg_cpu.c   | 4 +---
 target/loongarch/tcg/translate.c | 2 +-
 4 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/target/loongarch/tcg/helper.h b/target/loongarch/tcg/helper.h
index e76c73c7755..e3a7bc9e9da 100644
--- a/target/loongarch/tcg/helper.h
+++ b/target/loongarch/tcg/helper.h
@@ -3,8 +3,6 @@
  * Copyright (c) 2021 Loongson Technology Corporation Limited
  */
 
-DEF_HELPER_2(raise_exception, noreturn, env, i32)
-
 DEF_HELPER_FLAGS_3(asrtle_d, TCG_CALL_NO_WG, void, env, tl, tl)
 DEF_HELPER_FLAGS_3(asrtgt_d, TCG_CALL_NO_WG, void, env, tl, tl)
 
diff --git a/target/loongarch/tcg/op_helper.c b/target/loongarch/tcg/op_helper.c
index f98fe4d4a16..109417b7503 100644
--- a/target/loongarch/tcg/op_helper.c
+++ b/target/loongarch/tcg/op_helper.c
@@ -16,12 +16,6 @@
 #include <zlib.h> /* for crc32 */
 #include "cpu-csr.h"
 
-/* Exceptions helpers */
-void helper_raise_exception(CPULoongArchState *env, uint32_t exception)
-{
-    do_raise_exception(env, exception, GETPC());
-}
-
 /* loongarch assert op */
 void helper_asrtle_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
 {
diff --git a/target/loongarch/tcg/tcg_cpu.c b/target/loongarch/tcg/tcg_cpu.c
index 4b1d44a1644..56ef0d912cc 100644
--- a/target/loongarch/tcg/tcg_cpu.c
+++ b/target/loongarch/tcg/tcg_cpu.c
@@ -69,9 +69,7 @@ void G_NORETURN do_raise_exception(CPULoongArchState *env,
                   __func__,
                   exception,
                   loongarch_exception_name(exception));
-    cs->exception_index = exception;
-
-    cpu_loop_exit_restore(cs, pc);
+    cpu_loop_exit_excp(cs, exception, pc);
 }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/loongarch/tcg/translate.c b/target/loongarch/tcg/translate.c
index 124dce62695..b7e8ce8a653 100644
--- a/target/loongarch/tcg/translate.c
+++ b/target/loongarch/tcg/translate.c
@@ -95,7 +95,7 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
 void generate_exception(DisasContext *ctx, int excp)
 {
     tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
-    gen_helper_raise_exception(tcg_env, tcg_constant_i32(excp));
+    gen_helper_raise_excp_restore(tcg_env, tcg_constant_i32(excp));
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.52.0.windows.1


