Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2665CEB64DC
	for <qemu-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 12:21:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qJCIH-0002m8-BB; Tue, 11 Jul 2023 08:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qJCHq-00023K-FI
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 08:16:14 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qJCHj-0005U2-A3
 for qemu-riscv@nongnu.org; Tue, 11 Jul 2023 08:16:09 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3143b88faebso6398483f8f.3
 for <qemu-riscv@nongnu.org>; Tue, 11 Jul 2023 05:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689077761; x=1691669761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YxoVzJhi2n2dGTE2zLar6uJBuHBuoJDv5oC7y/6cp9w=;
 b=Bq2YjeDIJADrVDqP0oxj+Lvkqq3O7bjCFSEB9yN7k1lrlhVky5kjGWJfiTZKmlFpqj
 Q+CbwQdNdfdJ11uc25w3WfN0bOh4bmAeNUmZrIZ/jJ3wT4UfEitFle2JFoRh+iSkAvhW
 64gxx1qG/GBtqE2guS7hos3p8GakpqBB1FvzP+ZMrzKzsH7L9Q1LiScQC6UijeWYAAVE
 itnh+4QN4aFqqVeUmDjh3ZJPQ636CA0GIwgXt6TtwtyH9JmtvUWCLAZxn9Qce7LAMgHs
 76CAFI/iPJT0BbU8d67hHN9rAuSLE0cEG4jCCrqb0AJP1E+fzMXJ4w0RrpJU5BkZoS6Q
 lMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689077761; x=1691669761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YxoVzJhi2n2dGTE2zLar6uJBuHBuoJDv5oC7y/6cp9w=;
 b=ioKWIg5n4TYz5jA8iea09OQy89YN5VpFsbZVk9AAdb8A9aPYYan8QS9BaOS0GnkNli
 g+sI7eXWoxNmlBgJQVvF3URIHhyveBmR1U6V1Kphwq6I653xZmpHhtDnjAYrMXWfAsCp
 hcAKIzWQmasDeW5CIxtFjsiPXYuZtTz47vf3gaPQNr0EhtLh2YeuoYz024kKoDXfrMzF
 /5wxC9rO08NkhGqDdxTdpCtfsswdfwcGu0mE/ZOIJiz4tfS7GYZO86a9jdr/8aw7DgNi
 hk4c2Y1w2FXv6nFNropLTpSv5dclh7eRDRZYueQ17qV0r65uNswwTiRCmwBb6Tc5jF77
 VMjA==
X-Gm-Message-State: ABy/qLa/ZbfektuQlp+c2ewnTBQF3N4GtV5UNysWVQF9IwZo8PNB8rIM
 MqaOiFfuCVVzzH6PP9Nm6iic9OwCP9nGedpH8/k=
X-Google-Smtp-Source: APBJJlENi6aV8Jjoxn5+KD7p08VCJtGdN1iUfk/LLWNqi3jdWQKHov3Uzf5aika0FJxZRYxkWChSIA==
X-Received: by 2002:a5d:43c2:0:b0:30e:3f55:ebc9 with SMTP id
 v2-20020a5d43c2000000b0030e3f55ebc9mr14919113wrr.13.1689077761503; 
 Tue, 11 Jul 2023 05:16:01 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.194.156])
 by smtp.gmail.com with ESMTPSA id
 z8-20020adff1c8000000b003141e86e751sm2155605wro.5.2023.07.11.05.16.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 11 Jul 2023 05:16:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 12/16] target/riscv: Expose riscv_cpu_pending_to_irq() from
 cpu_helper.c
Date: Tue, 11 Jul 2023 14:14:49 +0200
Message-Id: <20230711121453.59138-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230711121453.59138-1-philmd@linaro.org>
References: <20230711121453.59138-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

We want to extract TCG/sysemu-specific code from cpu_helper.c,
but some functions call riscv_cpu_pending_to_irq(). Expose the
prototype in "internals.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/riscv/internals.h  | 4 ++++
 target/riscv/cpu_helper.c | 6 +++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index b5f823c7ec..b6881b4815 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -72,6 +72,10 @@ target_ulong fclass_d(uint64_t frs1);
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_riscv_cpu;
+
+int riscv_cpu_pending_to_irq(CPURISCVState *env,
+                             int extirq, unsigned int extirq_def_prio,
+                             uint64_t pending, uint8_t *iprio);
 #endif
 
 enum {
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 6c773000a5..e73cf56e5c 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -256,9 +256,9 @@ uint8_t riscv_cpu_default_priority(int irq)
     return default_iprio[irq] ? default_iprio[irq] : IPRIO_MMAXIPRIO;
 };
 
-static int riscv_cpu_pending_to_irq(CPURISCVState *env,
-                                    int extirq, unsigned int extirq_def_prio,
-                                    uint64_t pending, uint8_t *iprio)
+int riscv_cpu_pending_to_irq(CPURISCVState *env,
+                             int extirq, unsigned int extirq_def_prio,
+                             uint64_t pending, uint8_t *iprio)
 {
     int irq, best_irq = RISCV_EXCP_NONE;
     unsigned int prio, best_prio = UINT_MAX;
-- 
2.38.1


