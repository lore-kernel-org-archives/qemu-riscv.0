Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CFAC98318
	for <qemu-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 11:11:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xAQGr-00082a-Hu; Sat, 26 Sep 2026 07:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAQGq-00081u-DZ
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 07:08:44 -0400
Received: from mail-dl2-x10.google.com ([2607:f8b0:4864:38::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAQGo-0002k9-7K
 for qemu-riscv@nongnu.org; Sat, 26 Sep 2026 07:08:44 -0400
Received: by mail-dl2-x10.google.com with SMTP id
 a92af1059eb24-142dd04be84so2042585c88.3
 for <qemu-riscv@nongnu.org>; Sat, 26 Sep 2026 04:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790420919; x=1791025719; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/jLASucLyba2qelSD7n1s06CsRjfE29IQw8Hf32tRFs=;
 b=beibw3UIT/aLNf/tOpFUFTmnY9NnctmCZ4ETHhGqdDiGmg+JVdzYKTAkD56pmTY7+/
 iNnJU8VuesIQPXyHWc3FGg20jc8YpdpZVVO83FfwCPWLAFUR98VumsP0ZjfdICvJwNbp
 rZXoBcy4qnW1oOqB8hGyPs6sTi9oZ2esQD1gXj66Fzcr3hJa11kjdS4E8E+5WiRMCRdf
 +7ObdWk37Q96kkqxuGP3TsBrI3XtjpVWGgiSwI+Ywh75YDzyUvRLfvBohILYaG/sb6br
 OVr8RnANRjg97R3lgxEbvT7yd7nZgdtD6DRxl/3MJhcThghkuNKdPaQYrN8AZ2wxY/jk
 SKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790420919; x=1791025719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/jLASucLyba2qelSD7n1s06CsRjfE29IQw8Hf32tRFs=;
 b=hQ0q2cSC2AWQk1LP/HSohm7X1SsL/mzfBj1girnznHJ4DqJY2EwxJw6tNo4nnlZM2m
 vHbrJrkNT8Mqp/+ghuUJkwUJ5ncMMuP7PZq6BxZL1NLUmRSmh45077Uo1l+PU0fM/dqa
 1bDvr4VRrC4Lwr1Gqvd9qaWiCIlodsyZsCMBiyQTXiPyBWWaNJqkAvz0GYdK48qFp6Mp
 PUICrpTuUaSpZK//cNPAFteqqwmPtSWnMfeLLKSzyMmMuNgYBh/tE2Fl3AtDDqd0pU75
 3kWoKBLwUhdedjKdF3zgYT/fxw8tWsayBuqzsd3CGc8zYelvIa4LbKICLnVIj2kwfGJX
 XaQg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzMa1dBZgSBrvZ1X6r0bEMjFcSsz8rncWd4N3TtvFQWoghVf6M7bhH86Qoup+I5aGvACsJvYcg1r0hd@nongnu.org
X-Gm-Message-State: AFuF++lqExlACwOIoIOqW0Jz4TDpzvW1EVnSxT5eECOZ5bCSPZGrOyb6
 IL7KZZYHvnr8ayuxpRCmMz6woED0OmOMGAo2UDP2PMk5w9BVGiy+de89
X-Gm-Gg: AYBFou1JltH+nwVFw4GQv+GPwgd3SztJnrAMccZTM4VJOwutxey7xhnUClJddKhsC9C
 0XK/YmC8izmJczvkbY+0T4yh+M+xZZBcEsIE1Jel0dXvt87hm/G5/fNQJRiTHiAAobjn/rIqMJT
 2y0ilIndlctmiDzrTcP0BmOlLRdGdTBbm/S6Mm/SQG4ObFv1QS0NCkjCK3R9lYVDOqS8yeKwGEo
 GRhniM5PUU3dDpT9aE7gepIPXBCIL8IQ61BQ+mk0zd7gKK1UUjxI4nQGAxub6K8txK3adFTbBl9
 ZjA+PhoNtJwyIzeCcBZ6ntxS86Y+3T02k/PofWyrjBjz6aEFXBU6PqHZ9lwC043tK5pIGXNcR20
 RSlCUe83143HAFQ38hhg+YthAQNhuqp4xk27Sz3f0nUfLUTtjJ7sXrHpyuASo7lunxzXKYNgCqd
 v3pIuQxz4+kp6uQeW0GCoZli04NawarRdg2ScOQ/UuGvlXnhgnS6ULs63brTQHF/alNFZFpiQyT
 /aITI9NqrgojbclhVnCIe+oM2mxRomXhUWyq8+XAg==
X-Received: by 2002:a05:701b:20de:20b0:145:5c7:71bc with SMTP id
 a92af1059eb24-146cddbcfddmr2949754c88.5.1790420919456; 
 Sat, 26 Sep 2026 04:08:39 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-145a7318afcsm11414045c88.0.2026.09.26.04.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 04:08:38 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Brian Cain <brian.cain@oss.qualcomm.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Song Gao <17746591750@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>, Ani Sinha <anisinha@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chao Liu <chao.liu@processmission.com>, Weiwei Li <liwei1518@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH 2/9] target/rx: rename helper_wait to helper_rx_wait
Date: Sat, 26 Sep 2026 19:08:10 +0800
Message-ID: <20260926110818.1912-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926110818.1912-1-luoyonggang@gmail.com>
References: <20260926110818.1912-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

helper_wait is a global C symbol. Prefix it so one binary can keep
that short name free for another target.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/rx/helper.h    | 2 +-
 target/rx/op_helper.c | 2 +-
 target/rx/translate.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/rx/helper.h b/target/rx/helper.h
index 8cc38b0cb71..e88782cf227 100644
--- a/target/rx/helper.h
+++ b/target/rx/helper.h
@@ -1,7 +1,7 @@
 DEF_HELPER_1(raise_illegal_instruction, noreturn, env)
 DEF_HELPER_1(raise_access_fault, noreturn, env)
 DEF_HELPER_1(raise_privilege_violation, noreturn, env)
-DEF_HELPER_1(wait, noreturn, env)
+DEF_HELPER_1(rx_wait, noreturn, env)
 DEF_HELPER_2(rxint, noreturn, env, i32)
 DEF_HELPER_1(rxbrk, noreturn, env)
 DEF_HELPER_3(fadd, f32, env, f32, f32)
diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index 36df7d377e5..4bd25bb7d00 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -445,7 +445,7 @@ G_NORETURN void helper_raise_illegal_instruction(CPURXState *env)
     raise_exception(env, 23, GETPC());
 }
 
-G_NORETURN void helper_wait(CPURXState *env)
+G_NORETURN void helper_rx_wait(CPURXState *env)
 {
     CPUState *cs = env_cpu(env);
 
diff --git a/target/rx/translate.c b/target/rx/translate.c
index 132d495710c..b2e3d346147 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -2197,7 +2197,7 @@ static bool trans_WAIT(DisasContext *ctx, arg_WAIT *a)
 {
     if (is_privileged(ctx, 1)) {
         tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
-        gen_helper_wait(tcg_env);
+        gen_helper_rx_wait(tcg_env);
     }
     return true;
 }
-- 
2.52.0.windows.1


