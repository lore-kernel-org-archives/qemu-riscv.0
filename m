Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51F0E95A8E
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 11:04:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qpo2o-0006aj-FD; Mon, 09 Oct 2023 07:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qpo2d-0006OP-7J
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 07:03:16 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qpo2b-0003PM-3n
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 07:03:14 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9b9a494cc59so743214766b.3
 for <qemu-riscv@nongnu.org>; Mon, 09 Oct 2023 04:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696849389; x=1697454189; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V78g9jhuJwuu3XH3up4N6OXq/ULujlSA7fdJ/xZ8gEw=;
 b=RQ+OULPH/jae5EyalmRTnYY2y1PiomgrGPnqS9QRDVRwhNGbHHVNLNO9zXYjqKi+JU
 iGgzNmxuB1AzEgVTORIrJEpi1nrp4xBbETy+ayZ86ps1ahUpBsAOOPtniDcy6i7Gqk7F
 xUZkOw74yUFLOZ5CGiwccuQFKzBSs9r6dnn/r5a8T2wpk9zD5c4xVuIZaCQiU/r3tm2/
 J1ODZVBudu3nkq0um1gBtN8CeCEskWBpxpoCqsOsFgnTAeQkNKJy7ZtpivrT9rIEe1Of
 aK6/gU62yuNeRWOGX+KQnVlsdcBt1YDgK4InnM3f0FRSh4akkBK0NqVZCMMr7drPjomD
 /tYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696849389; x=1697454189;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V78g9jhuJwuu3XH3up4N6OXq/ULujlSA7fdJ/xZ8gEw=;
 b=rD6LdrOOeE9JJ++mDum4lCASigGmL1owUwrEkxVb5K49XsdaN+6VPE8zZy2TzCHXy6
 a4bhlT2nb87GygBzytnMI2nPyGWZhDuGgqlomPbFKIVdopQlmEm/X2BPlwIK+CYL/AJo
 gAW5gWUvfVn5jlLIelFK8xNrMpweKnwJmCJZhIziE/N6CXzo15jjR33k6V9l8psOrO9i
 D39otqQgogAZskayJzzyFHvNf34yo2NIP+vbvJr4HnqBHLhtiC4nZsTTgwTy9uyBpPMO
 mNFJgfKyujgnE+hIRUNZvzHS59Mlp8ENOrAnbxKw+sJtkXI9GF+ocK6E0qbz3WuX0urI
 +dUw==
X-Gm-Message-State: AOJu0YwSsyxmbjVqudtTYnqvwEidIxOLh21I+wfyzVgKaI0CNyO8+as4
 rXkEfoLSVBgY2CaZtr82lPj+qA==
X-Google-Smtp-Source: AGHT+IEcNwxVZqRuOS5msdhnG1M0Nje61e749+OicUXZAaRVWxzCHpr70xl3BdSEcOOgS8SbhCgXWA==
X-Received: by 2002:a17:907:763b:b0:9ad:c132:b93b with SMTP id
 jy27-20020a170907763b00b009adc132b93bmr12534458ejc.5.1696849388833; 
 Mon, 09 Oct 2023 04:03:08 -0700 (PDT)
Received: from m1x-phil.lan (thr44-h01-176-170-217-185.dsl.sta.abo.bbox.fr.
 [176.170.217.185]) by smtp.gmail.com with ESMTPSA id
 u16-20020a1709064ad000b009ae54585aebsm6489905ejt.89.2023.10.09.04.03.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Oct 2023 04:03:08 -0700 (PDT)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/6] target/xtensa: Use env_archcpu() in
 update_c[compare|count]()
Date: Mon,  9 Oct 2023 13:02:37 +0200
Message-ID: <20231009110239.66778-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009110239.66778-1-philmd@linaro.org>
References: <20231009110239.66778-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

When CPUArchState* is available (here CPUXtensaState*), we
can use the fast env_archcpu() macro to get ArchCPU* (here
XtensaCPU*). The QOM cast XTENSA_CPU() macro will be slower
when building with --enable-qom-cast-debug.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/xtensa/op_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/xtensa/op_helper.c b/target/xtensa/op_helper.c
index 7bb8cd6726..496754ba57 100644
--- a/target/xtensa/op_helper.c
+++ b/target/xtensa/op_helper.c
@@ -37,7 +37,7 @@
 
 void HELPER(update_ccount)(CPUXtensaState *env)
 {
-    XtensaCPU *cpu = XTENSA_CPU(env_cpu(env));
+    XtensaCPU *cpu = env_archcpu(env);
     uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
 
     env->ccount_time = now;
@@ -58,7 +58,7 @@ void HELPER(wsr_ccount)(CPUXtensaState *env, uint32_t v)
 
 void HELPER(update_ccompare)(CPUXtensaState *env, uint32_t i)
 {
-    XtensaCPU *cpu = XTENSA_CPU(env_cpu(env));
+    XtensaCPU *cpu = env_archcpu(env);
     uint64_t dcc;
 
     qatomic_and(&env->sregs[INTSET],
-- 
2.41.0


