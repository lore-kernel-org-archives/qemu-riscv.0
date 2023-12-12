Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBD0C4332F
	for <qemu-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 12:36:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rD1zk-00027r-Kl; Tue, 12 Dec 2023 07:36:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD1zQ-0001a2-FT
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:35:58 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rD1zH-0007nq-5C
 for qemu-riscv@nongnu.org; Tue, 12 Dec 2023 07:35:56 -0500
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a1f0616a15bso632034966b.2
 for <qemu-riscv@nongnu.org>; Tue, 12 Dec 2023 04:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702384544; x=1702989344; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OWfYjgvijR4Yk7OOcPMVJ3eTtKOWWmhjXW8fnIT+sQQ=;
 b=NVzlCuX96NZIBhEtiKScpwa8c2gqhzzP5HWnJL/FLlGiax/IQ9kcNJosOUVvnFhDjm
 OJlpd38Mfafl+YG4Gg7lyXw0bw1n/XjsvydhNKgNs5mq/PXPbOxHNRGo5kWjET/iZuy7
 hNxTs0A45Y9GEQ4II5yg6tA4HWIocDyaDzgxr0cVHW/ogxRusktKxqskZb1RUND5iJzA
 BjlwnbieKqEM8HyxnfF411nnm6PA7zKSUpdA53Di6dx91KCN0xZzA3Rt5ubelW351dGi
 MCYlB3k56VIJd/wRWKfd6ftrQAFQcBsuoXNMygoNNr8QMggF7R0E1kbDr2/ZEIESfK7t
 nfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702384544; x=1702989344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OWfYjgvijR4Yk7OOcPMVJ3eTtKOWWmhjXW8fnIT+sQQ=;
 b=JO+avw7hyVOUY5gnLh45OGP3Zt40ab24GOv4eg5iP7s9EHbXTSBZC6gNCWkw7t9tY9
 FhHGG3pRi3Fj3O4QIHC17AUkRBr+OfwebFEJTOrf5As4Rn3NvnZ9ODvg9UJJ3KV7D2mT
 D/of6ZCbAFklvZfvh94gIFzXKbV2TwTa7mrTgt06KSYziktsyO9gM7AN3wHerYYZ+c5V
 t/UQXadYbwWFBbyIotcNImQPookHb0RuWLAksGjZrK8KGQg7BUBbjfEKbLHMPNIwg3fb
 1t8BAQsUQuLtl5D6DmnQzBShJsN6DoeFjl7IftiiSN6kEDt+DyYIQ4ourkfX+SEk4LNW
 4gCA==
X-Gm-Message-State: AOJu0Yx+t5ksRkr5eSa+a3J6VWcaaIWIKHnS7bgDsFxY26sG7WQKstkS
 1JjlKAfneUUlaYeGj1XCFFgxWw==
X-Google-Smtp-Source: AGHT+IH1E3N7303frpNQQ0fjFHz7zCU463Hgb3lbpYe56T7u2mDKOAfzHYFdaUHchwFP9G5x2G56+w==
X-Received: by 2002:a17:906:fada:b0:a04:9608:3c89 with SMTP id
 lu26-20020a170906fada00b00a0496083c89mr3373488ejb.75.1702384544671; 
 Tue, 12 Dec 2023 04:35:44 -0800 (PST)
Received: from m1x-phil.lan ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 uv6-20020a170907cf4600b00a1e443bc037sm6276535ejc.147.2023.12.12.04.35.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Dec 2023 04:35:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, Brian Cain <bcain@quicinc.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 14/23] exec/cpu-all: Remove unused tswapls() definitions
Date: Tue, 12 Dec 2023 13:33:50 +0100
Message-ID: <20231212123401.37493-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
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

Last use of tswapls() was removed 2 years ago in commit
aee14c77f4 ("linux-user: Rewrite do_getdents, do_getdents64").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu-all.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 5b5379b94c..b042d94892 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -38,11 +38,9 @@
 
 #if TARGET_LONG_SIZE == 4
 #define tswapl(s) tswap32(s)
-#define tswapls(s) tswap32s((uint32_t *)(s))
 #define bswaptls(s) bswap32s(s)
 #else
 #define tswapl(s) tswap64(s)
-#define tswapls(s) tswap64s((uint64_t *)(s))
 #define bswaptls(s) bswap64s(s)
 #endif
 
-- 
2.41.0


