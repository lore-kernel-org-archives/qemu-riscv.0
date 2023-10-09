Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA65BCD610D
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 16:49:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qptPZ-0005Qa-PI; Mon, 09 Oct 2023 12:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptP4-0003EA-NS
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:46:55 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptOl-0003YS-DN
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:46:46 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-406618d0992so46441535e9.0
 for <qemu-riscv@nongnu.org>; Mon, 09 Oct 2023 09:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696869976; x=1697474776; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w3ROVyIhpC0GPMfeuVN5EYglrfPgYOoqOKnIvGWt/mA=;
 b=DqEG4XIETsVSEoWV4aQGkHkbPIXUkAXiQawn3mP4nQvqz5J1GTjE/IE09ac83Nrb5N
 u9+P6b5Tcavf1BWspx30L+6ndLFhvgRIWQorDA41tFOgdVOME6tGzL4qIg5sMwsOTgFq
 B1Ublj0yrB6xcvIhebJYyFSh4jpGAqW/qavMOFWYaACN6nhtuMYbf7fW1qRV/ZpLci5H
 6F4cbMSlYyk9W6A7T+/r0l6R4d1CFvA0TARQ4KmTJ4y649o+BOJm5JOiJfocqVYAuF7l
 WaHQumwdAEy1ly9YDRgHA0pCRS94XOtwJbzKkCy7RxpuVAuMxl607OFG9y5dtcpA7T4a
 sCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696869976; x=1697474776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w3ROVyIhpC0GPMfeuVN5EYglrfPgYOoqOKnIvGWt/mA=;
 b=u529FRF+//9huc3NOiK7KanNaK8QgUiJE5un540kjrC5uiJKX2na/yLHSVusmYu8oV
 BXL7d/pYBe37Y9DJFpZX5jk7veJZVC00dEJT4lwLorJmmIPY6fdhwohyoeWJ6lZ6Waxe
 AJS7nSzkt5QE/icu+ZHiLw4i8bzFAmB1OXrVoy26gdswGF+Rf1SnDG9YhnBG9HhoprIh
 3mQCo/3mhHBbM29Mq3l7PuMisGwDnRokl8kLgzzDkfZRb9kjOep8HakPd6yiGlOClYib
 JzC+/5mird/TnGKghsHX1WHTTlGnVZ8MzbA1FTlxY17c8G3ndtG0voo1YvkjNP5a1d5I
 cjzQ==
X-Gm-Message-State: AOJu0YyhhH1apWUzNd5hkzSYXHARNenbuGM/zrx+jQm2ct2n3Jl26bKC
 vTPWpf+SeeI0gHCKZJqwHzL9Ag==
X-Google-Smtp-Source: AGHT+IH1/87Qy/bZG9g8wfs69vJT7EMeM0AosuHs/VDPfrf9GXJF5P+RbaMV7HWiKRuQKdw9oWg4ZQ==
X-Received: by 2002:a05:600c:c9:b0:406:4d8f:9fee with SMTP id
 u9-20020a05600c00c900b004064d8f9feemr14580820wmm.24.1696869975868; 
 Mon, 09 Oct 2023 09:46:15 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 x11-20020a05600c21cb00b00405bbfd5d16sm11774930wmj.7.2023.10.09.09.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 09:46:13 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 82E6B1FFCC;
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 20/25] accel/tcg: Add plugin_enabled to DisasContextBase
Date: Mon,  9 Oct 2023 17:40:59 +0100
Message-Id: <20231009164104.369749-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009164104.369749-1-alex.bennee@linaro.org>
References: <20231009164104.369749-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230824181233.1568795-2-richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/translator.h | 2 ++
 accel/tcg/translator.c    | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index 9d9e980819..6d3f59d095 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -73,6 +73,7 @@ typedef enum DisasJumpType {
  * @max_insns: Maximum number of instructions to be translated in this TB.
  * @singlestep_enabled: "Hardware" single stepping enabled.
  * @saved_can_do_io: Known value of cpu->neg.can_do_io, or -1 for unknown.
+ * @plugin_enabled: TCG plugin enabled in this TB.
  *
  * Architecture-agnostic disassembly context.
  */
@@ -85,6 +86,7 @@ typedef struct DisasContextBase {
     int max_insns;
     bool singlestep_enabled;
     int8_t saved_can_do_io;
+    bool plugin_enabled;
     void *host_addr[2];
 } DisasContextBase;
 
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index e7abcd86c1..c5da7b32a5 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -158,6 +158,7 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
     } else {
         plugin_enabled = plugin_gen_tb_start(cpu, db, false);
     }
+    db->plugin_enabled = plugin_enabled;
 
     while (true) {
         *max_insns = ++db->num_insns;
-- 
2.39.2


