Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCF0EB64D7
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 23:21:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qDvWc-0006Dw-Lh; Mon, 26 Jun 2023 19:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qDvWT-0005xF-Ay
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 19:21:29 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qDvWR-0000Ic-J0
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 19:21:29 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so470108166b.2
 for <qemu-riscv@nongnu.org>; Mon, 26 Jun 2023 16:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687821686; x=1690413686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MXYhaIZBHUVBklzxiy2U6yni3nv37QkQ/GRKywmL6dk=;
 b=gijdK+asWeJ/04igZsyMwWoIHZoS5DY99sJ8BnYk73mT+/gJJRP7ZhW1BbW6T2uPIw
 U0vtjNHt7W/ogdrifnNYiV561i+VsGs1BJY5XXrmJru/xzUaBdXu2exOGIEa3mk7rZy1
 CUSbmccTka1nFZGAYXnbgVGt8maE81p7IwbKkanpbwDZcUDutd4VP1L+akaq+lC9To5l
 gvgRrGbKh84K69zFqM8wzzIdl8oz7p21hCPU9SnlwV7qdrWk21MZ9YHbu0X9D0jqrfSv
 ickXaQge8yTHBTHeY9t2WFsOO6Jx3BPaEplpY0kFX06FkxAmm8/vCzEt2W+cGAJYrRZA
 em7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687821686; x=1690413686;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MXYhaIZBHUVBklzxiy2U6yni3nv37QkQ/GRKywmL6dk=;
 b=Ab/VJcusj4M5pQCrMOjVDEc9w+4e4Mm6Kbln002VX4xPiBGSpLg8K8mKG9PKQDzaac
 rOVOKYnRvjM2UUNuHigh8ysazSx5lhN8LXvrbQErHP/mA3edhJdDjJllWzqBRWBKypG2
 nfMXFiyu8pgLAYqUr0gONhVMdXUa1oI8ZpYaR0ZAFyN8sAZ+SN8/lNEGDaWHKyR54I1z
 4ZiTXxrc+NpdyXFnJ84dJwJCx6Coq4x6wpyDK2QJW+fp0ueNFaRfYHgYjKKPaYU3c+Ce
 8jKAIomIlwq3XawWDpE0U0ki/Mwj/t6/981CSf4tCwfcA3KkgtCslE9rQu2Rqj72qRlL
 BPfw==
X-Gm-Message-State: AC+VfDzJL5yHntVM6CNze8Oz635IuHwfUNbGyVNt50b5al3mZBIv8tHL
 ojgVQIksWXlEgHXQwDgtKwQ6yA==
X-Google-Smtp-Source: ACHHUZ5ffD8jlGpKLFdWgjODqMGScJyqy4DCWH/6dE5+cRnzn63KCDVNQDHnjYDZWeGbfgug2II0NQ==
X-Received: by 2002:a17:907:3f87:b0:982:84c9:96c4 with SMTP id
 hr7-20020a1709073f8700b0098284c996c4mr26100247ejc.10.1687821685837; 
 Mon, 26 Jun 2023 16:21:25 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.226])
 by smtp.gmail.com with ESMTPSA id
 ci8-20020a170906c34800b00982d0563b11sm3806526ejb.197.2023.06.26.16.21.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 26 Jun 2023 16:21:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org
Subject: [PATCH 12/16] target/riscv: Expose riscv_cpu_pending_to_irq() from
 cpu_helper.c
Date: Tue, 27 Jun 2023 01:20:03 +0200
Message-Id: <20230626232007.8933-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230626232007.8933-1-philmd@linaro.org>
References: <20230626232007.8933-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
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
index 88760248c0..5620e5d7ba 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -252,9 +252,9 @@ uint8_t riscv_cpu_default_priority(int irq)
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


