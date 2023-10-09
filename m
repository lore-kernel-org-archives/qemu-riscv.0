Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82235CD610A
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 16:47:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qptPP-0004Cs-7i; Mon, 09 Oct 2023 12:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptOw-0003Bq-Ab
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:46:52 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptOk-0003Wv-3O
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:46:36 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-323168869daso4697378f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 09 Oct 2023 09:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696869974; x=1697474774; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2rjltn9M+XXAIv6I9KIZqs861Zafbf86k+j+c8/sLis=;
 b=PmwVZoChq7YroltJUmKbcaVmPxkvnXuGyo85zP/J+kGJCzu5Z05kuYogSwpG7h7C7A
 1lN/Q4lu6rtDGcktzEIHh4AyoLau6XRVNBGqX34XjTUjqbiTUm44SnOO6Zg+k3xRMpoJ
 k0YwGMWeQiFfy+fiNrzhUol+qN5gF0eBk2p5fkypOCn24//CPDps7E5YjOgCGyABhrwy
 9fUjDyGdILq3N7txhCMQrMWIuTABNXlr5+YkYuX9r/YQQwqzOilBgbbtL6KirULDUNlf
 6wSRPLytlJlPS/6jJLhXXpYd+q5w8K1HOlr/Yf5Gydr3lrO7iyCgSbtwofVQ28xz2Sim
 eJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696869974; x=1697474774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2rjltn9M+XXAIv6I9KIZqs861Zafbf86k+j+c8/sLis=;
 b=uCeHe+c75x9QJwsYvEauOd6gpR0JIqqo3IJ7hgKYNqBYmtcPTr2+Yp3UN0LbKit+Dl
 //RR3k0KGQ3lI2EhN8gpkPt7zMtFkGmrdk6Vu3l1GYwn4l5GJglOLr2tQu9h3bhEqvEd
 2kyvGMBm1RKBJ0Ug+kdGT3pEHxuNlZdUjKznfbr6debuNaC6OgNQBMka3WE6Kj1iMRGa
 77QVJbXYL/6SnVZYUlthQWrjesr1Vzqqn+0sGQ843Z1sMM/FEmxYjsgStzDMQdry+Mli
 WNqelfBy7IUSatfciInLy8sZRc9m1OfXMg26+Z5hNhVcNaExZcmBi1gfzO0VRIWm6KdO
 dwOw==
X-Gm-Message-State: AOJu0YxaTSXXjLDz/+Rs+OMkq4Fdb/eZ585gztT3DMkWORW1024bFxfy
 nICGEIFA4FzbUF5ns9EaOdnS9g==
X-Google-Smtp-Source: AGHT+IHvYVP6ggxyRMNblubV/NESfR3QHoZbN7ZpRFlI2XVeB1yP0VZX12OJv0X4ALSUED/ED8S/0Q==
X-Received: by 2002:adf:e892:0:b0:31f:a503:c05c with SMTP id
 d18-20020adfe892000000b0031fa503c05cmr14688817wrm.38.1696869973891; 
 Mon, 09 Oct 2023 09:46:13 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a056000000b00b00325a59b2080sm10147151wrx.97.2023.10.09.09.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 09:46:13 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BC80A1FFCE;
 Mon,  9 Oct 2023 17:41:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Brad Smith <brad@comstyle.com>, Radoslaw Biernacki <rad@semihalf.com>,
 David Hildenbrand <david@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Nicholas Piggin <npiggin@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beraldo Leal <bleal@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Matt Borgerson <contact@mborgerson.com>
Subject: [PATCH 22/25] plugins: Set final instruction count in
 plugin_gen_tb_end
Date: Mon,  9 Oct 2023 17:41:01 +0100
Message-Id: <20231009164104.369749-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009164104.369749-1-alex.bennee@linaro.org>
References: <20231009164104.369749-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

From: Matt Borgerson <contact@mborgerson.com>

Translation logic may partially decode an instruction, then abort and
remove the instruction from the TB. This can happen for example when an
instruction spans two pages. In this case, plugins may get an incorrect
result when calling qemu_plugin_tb_n_insns to query for the number of
instructions in the TB. This patch updates plugin_gen_tb_end to set the
final instruction count.

Signed-off-by: Matt Borgerson <contact@mborgerson.com>
[AJB: added g_assert to defed API]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <CADc=-s5RwGViNTR-h5cq3np673W3RRFfhr4vCGJp0EoDUxvhog@mail.gmail.com>
---
 include/exec/plugin-gen.h | 4 ++--
 accel/tcg/plugin-gen.c    | 6 +++++-
 accel/tcg/translator.c    | 2 +-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/exec/plugin-gen.h b/include/exec/plugin-gen.h
index 52828781bc..c4552b5061 100644
--- a/include/exec/plugin-gen.h
+++ b/include/exec/plugin-gen.h
@@ -20,7 +20,7 @@ struct DisasContextBase;
 
 bool plugin_gen_tb_start(CPUState *cpu, const struct DisasContextBase *db,
                          bool supress);
-void plugin_gen_tb_end(CPUState *cpu);
+void plugin_gen_tb_end(CPUState *cpu, size_t num_insns);
 void plugin_gen_insn_start(CPUState *cpu, const struct DisasContextBase *db);
 void plugin_gen_insn_end(void);
 
@@ -42,7 +42,7 @@ void plugin_gen_insn_start(CPUState *cpu, const struct DisasContextBase *db)
 static inline void plugin_gen_insn_end(void)
 { }
 
-static inline void plugin_gen_tb_end(CPUState *cpu)
+static inline void plugin_gen_tb_end(CPUState *cpu, size_t num_insns)
 { }
 
 static inline void plugin_gen_disable_mem_helpers(void)
diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index d31c9993ea..39b3c9351f 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -866,10 +866,14 @@ void plugin_gen_insn_end(void)
  * do any clean-up here and make sure things are reset in
  * plugin_gen_tb_start.
  */
-void plugin_gen_tb_end(CPUState *cpu)
+void plugin_gen_tb_end(CPUState *cpu, size_t num_insns)
 {
     struct qemu_plugin_tb *ptb = tcg_ctx->plugin_tb;
 
+    /* translator may have removed instructions, update final count */
+    g_assert(num_insns <= ptb->n);
+    ptb->n = num_insns;
+
     /* collect instrumentation requests */
     qemu_plugin_tb_trans_cb(cpu, ptb);
 
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index c5da7b32a5..575b9812ad 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -210,7 +210,7 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
     gen_tb_end(tb, cflags, icount_start_insn, db->num_insns);
 
     if (plugin_enabled) {
-        plugin_gen_tb_end(cpu);
+        plugin_gen_tb_end(cpu, db->num_insns);
     }
 
     /* The disas_log hook may use these values rather than recompute.  */
-- 
2.39.2


