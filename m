Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1DDE95A8E
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 11:05:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qpo2n-0006WF-8W; Mon, 09 Oct 2023 07:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qpo2S-0006IL-FB
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 07:03:06 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qpo2M-0003N1-PD
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 07:03:01 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-522bd411679so7164676a12.0
 for <qemu-riscv@nongnu.org>; Mon, 09 Oct 2023 04:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696849376; x=1697454176; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y/GrMBIMGrTYySZAmzh8zKw+DxTy0unUed7WlZuT/J4=;
 b=INvojKDd9QmyIFhMnCKSaTj9DMmu6US/JLwSPhix28eesJzzWNjkIn7qwuhhkdXXyX
 Ob6jpY7ZgBjZa3bi9nZm5K7gDQVP5nD12ICTszBcSmNXQvZh5k9Gm5IWfyP+ZUoqftvf
 D66xReS5plsakXH5RP7QQPJVqfWNRBzFAT6qPsnj3K1dp2eSs6IeG/6QZtJJ6wn8rabZ
 i+OcfQwgvY5NNm+2p4jCM/N1NUKREWBqdEX02hgrR9gTct5GbKR7SUikKzSQ/NPLPLGM
 pkJbn1TV1aB4GeGk4u5K42ObbYMD90V2spFT0CgNa2xNTlWNpuA8Ib6u9FFyd83ZafWM
 CChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696849376; x=1697454176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y/GrMBIMGrTYySZAmzh8zKw+DxTy0unUed7WlZuT/J4=;
 b=qGTlKyGsbk5nXlxpK/C8X+ycPPpGsfmOMfTy4rMWNg38N0UUdh67I3XmY5a+DVq9/R
 hfFknDYpPvYDxfyhFZQ99wwe+p61b5MmqYfdNZHnz9+IniM2NFap7eEI/fCV37Pm5gQ7
 O+EV5Wjsx6Ye62S9f551+0NMRyyPk5LFL5qEd8qOmAqcmYwKMe796PtmkCTYDmDJfotg
 usnGR1V3hZdh3ldTuy7hzMykaIyCt8zkocRURyhyx39SkvQcDaDl7SOKvawcQs/I3Obo
 9B7ke9u7z1VygY/p2PHhZm6L/5+Kkx7BKRNUf5scfq0f6OZCPZ4Wyu01053NhaTXVNsj
 z4oA==
X-Gm-Message-State: AOJu0Yxuxrrcsp6WxMI+GBmIcv8TjyYIAedZ1JGGvkut8WPSirT8oAFR
 PBUZKdzjgC+79EXl+Cpx/OkN/g==
X-Google-Smtp-Source: AGHT+IGnINi+5cyo8pytak7nK9KzZnXI8RvYmk+G5v7/14aCQY1lgL7JuC76CZ9aUHM4aRNzwjspoQ==
X-Received: by 2002:a17:906:845c:b0:9b8:f17a:fbc3 with SMTP id
 e28-20020a170906845c00b009b8f17afbc3mr11624536ejy.64.1696849375915; 
 Mon, 09 Oct 2023 04:02:55 -0700 (PDT)
Received: from m1x-phil.lan (thr44-h01-176-170-217-185.dsl.sta.abo.bbox.fr.
 [176.170.217.185]) by smtp.gmail.com with ESMTPSA id
 y18-20020a170906559200b009ad75d318ffsm6699191ejp.17.2023.10.09.04.02.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Oct 2023 04:02:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Cameron Esfahani <dirty@apple.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Richard W . M . Jones" <rjones@redhat.com>
Subject: [PATCH 2/6] target/riscv: Use env_archcpu() in [check_]nanbox()
Date: Mon,  9 Oct 2023 13:02:35 +0200
Message-ID: <20231009110239.66778-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009110239.66778-1-philmd@linaro.org>
References: <20231009110239.66778-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52e.google.com
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

When CPUArchState* is available (here CPURISCVState*), we
can use the fast env_archcpu() macro to get ArchCPU* (here
RISCVCPU*). The QOM cast RISCV_CPU() macro will be slower
when building with --enable-qom-cast-debug.

Inspired-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/internals.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index b5f823c7ec..8239ae83cc 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -87,7 +87,7 @@ enum {
 static inline uint64_t nanbox_s(CPURISCVState *env, float32 f)
 {
     /* the value is sign-extended instead of NaN-boxing for zfinx */
-    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
+    if (env_archcpu(env)->cfg.ext_zfinx) {
         return (int32_t)f;
     } else {
         return f | MAKE_64BIT_MASK(32, 32);
@@ -97,7 +97,7 @@ static inline uint64_t nanbox_s(CPURISCVState *env, float32 f)
 static inline float32 check_nanbox_s(CPURISCVState *env, uint64_t f)
 {
     /* Disable NaN-boxing check when enable zfinx */
-    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
+    if (env_archcpu(env)->cfg.ext_zfinx) {
         return (uint32_t)f;
     }
 
@@ -113,7 +113,7 @@ static inline float32 check_nanbox_s(CPURISCVState *env, uint64_t f)
 static inline uint64_t nanbox_h(CPURISCVState *env, float16 f)
 {
     /* the value is sign-extended instead of NaN-boxing for zfinx */
-    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
+    if (env_archcpu(env)->cfg.ext_zfinx) {
         return (int16_t)f;
     } else {
         return f | MAKE_64BIT_MASK(16, 48);
@@ -123,7 +123,7 @@ static inline uint64_t nanbox_h(CPURISCVState *env, float16 f)
 static inline float16 check_nanbox_h(CPURISCVState *env, uint64_t f)
 {
     /* Disable nanbox check when enable zfinx */
-    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
+    if (env_archcpu(env)->cfg.ext_zfinx) {
         return (uint16_t)f;
     }
 
-- 
2.41.0


