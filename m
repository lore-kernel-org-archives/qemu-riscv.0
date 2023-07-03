Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11170C001B3
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 18:34:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qGOLy-0007vy-Rm; Mon, 03 Jul 2023 14:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGOLx-0007uq-Oh
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 14:32:49 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGOLw-0000Mv-8Z
 for qemu-riscv@nongnu.org; Mon, 03 Jul 2023 14:32:49 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fbc5d5746cso51206865e9.2
 for <qemu-riscv@nongnu.org>; Mon, 03 Jul 2023 11:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688409166; x=1691001166;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y5G3GZnisObOugerwvl7UVGEu2t0avWriP2R6IveebM=;
 b=gArLSy6UVnwhbUvId2CPKgLMDrnRG+LSn8P3Y9zKm3qKRdS8QwkfZVJZ2207HtTRgB
 iihho0KTaU6KcfKiFae/vh7wpkYSQt//pGXBnvf0O3XxYtaIO13Gl3kuKEB12IG4tmw6
 SyDE6qCSpfhIa0+vXELSpH82eB9hXBIAVopshElO1yZ6x2CGPD5+ZRr1Q+VXJh5QESdE
 x3YL3CGEkwkhaCjWiHE+1qNv/RKN4E3iw1hgRI1WPJiw70KP9TGRGRWXj7rYFpHcCmGt
 DOYtf2FbPXTocF4UFbURftbvhe2tNEvJ4PKx/kPER44ur8W2yajlLHWWu7so/JZMzRee
 CnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688409166; x=1691001166;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y5G3GZnisObOugerwvl7UVGEu2t0avWriP2R6IveebM=;
 b=KF/mZiylhacBRIbc0rF64l/4O8XlFTj56zsUSqVG0UFkxb/0uiF9F5F25sviMXQo5p
 qsV3HgqVU4hRfnjZrdC+rPcXSKi8edAUBVS/Czuz5PHZ6xTRgpdTa5RhAyKNmnw87s6i
 BheiRsAwxxwJkvAytunj4pJmx3kDy3uizwel+By98QUsI8hyMtZ+pknsjAVjc1ISo1vh
 qCFT2nJNJD5qfPJzuz5WTsh4YNQxkFvA4ksMDkX8UZ+KWJ0jk1ze+hlvKCZqEpm33L7Y
 oFDjb1gju3Xz1Mno8yeVq9H7rZqF1HOOIZOnxOwW62QOrTmUV03+GkX9tU3/Ra+3O3Sa
 /X7Q==
X-Gm-Message-State: AC+VfDwQKZuQnV7bJ+MPABY8QPph3jnTmWtpX9CdGUavTawhvS/FgnWX
 r19+2aapDzQ7tkeLrK72feuNnA==
X-Google-Smtp-Source: ACHHUZ7h8rLAhEb2ZvzJiN8tqunRElre+99fEUHX6oHEQbMkqj/bM3Myyd2PKQNyWBN1KrL64zWX3Q==
X-Received: by 2002:a7b:c858:0:b0:3fa:98f8:225f with SMTP id
 c24-20020a7bc858000000b003fa98f8225fmr10164667wml.26.1688409166721; 
 Mon, 03 Jul 2023 11:32:46 -0700 (PDT)
Received: from localhost.localdomain ([176.176.178.91])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a7bcb95000000b003faabd8fcb8sm21628765wmi.46.2023.07.03.11.32.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Jul 2023 11:32:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, kvm@vger.kernel.org,
 qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH v2 09/16] target/riscv: Expose some 'trigger' prototypes from
 debug.c
Date: Mon,  3 Jul 2023 20:31:38 +0200
Message-Id: <20230703183145.24779-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230703183145.24779-1-philmd@linaro.org>
References: <20230703183145.24779-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We want to extract TCG-specific code from debug.c, but some
functions call get_trigger_type() / do_trigger_action().
Expose these prototypes in "debug.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/debug.h | 4 ++++
 target/riscv/debug.c | 5 ++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index c471748d5a..65cd45b8f3 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -147,4 +147,8 @@ void riscv_trigger_init(CPURISCVState *env);
 
 bool riscv_itrigger_enabled(CPURISCVState *env);
 void riscv_itrigger_update_priv(CPURISCVState *env);
+
+target_ulong get_trigger_type(CPURISCVState *env, target_ulong trigger_index);
+void do_trigger_action(CPURISCVState *env, target_ulong trigger_index);
+
 #endif /* RISCV_DEBUG_H */
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 75ee1c4971..5676f2c57e 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -88,8 +88,7 @@ static inline target_ulong extract_trigger_type(CPURISCVState *env,
     }
 }
 
-static inline target_ulong get_trigger_type(CPURISCVState *env,
-                                            target_ulong trigger_index)
+target_ulong get_trigger_type(CPURISCVState *env, target_ulong trigger_index)
 {
     return extract_trigger_type(env, env->tdata1[trigger_index]);
 }
@@ -217,7 +216,7 @@ static inline void warn_always_zero_bit(target_ulong val, target_ulong mask,
     }
 }
 
-static void do_trigger_action(CPURISCVState *env, target_ulong trigger_index)
+void do_trigger_action(CPURISCVState *env, target_ulong trigger_index)
 {
     trigger_action_t action = get_trigger_action(env, trigger_index);
 
-- 
2.38.1


