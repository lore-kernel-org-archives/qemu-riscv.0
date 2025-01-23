Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEA7C02182
	for <qemu-riscv@archiver.kernel.org>; Thu, 23 Jan 2025 23:49:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tb6sU-0006IL-Hu; Thu, 23 Jan 2025 18:44:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tb6sS-0006Gg-G4
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2025 18:44:48 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tb6sQ-0003wd-E2
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2025 18:44:48 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3862d16b4f5so936154f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 23 Jan 2025 15:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737675884; x=1738280684; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=89WHzW+ji4rB+60gFYzeRD9ADgUNDHjcXvYSPMINgc0=;
 b=IUCLje6AsykLpWFfkO2DPFz3e1nLIYD10d6w/vMvcWhKSLSKROfqvYPg4W3ifaK0sO
 z/txwjr0lY1M/oRcf3nk3Zf68DhZsZC4FOlCc8l4WzYUiHnsbEmGelRF1/wDm8mWzcZd
 51wDyPdo0FDgTVMpxcnYN2eST92TE1eZUWCTUUe+dnJ0MGZNxkpraRCea5+aXUqyzlQ2
 beA3qEuSULdpeCWrvqHc1gZ61g7zGXbMzkjFTehA1EpkND/LdO1ar5zyv6UzTUtUaGei
 K+wIJwN4i0k9ObTh2nqLB4MbtuMuUHz862nE+4aRjrFOGg+TGWDjWhhKRcCsKgo0U+nG
 XAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737675884; x=1738280684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=89WHzW+ji4rB+60gFYzeRD9ADgUNDHjcXvYSPMINgc0=;
 b=vF26Upqp3We0ruklUa9noTYfUOFdA37FvGpoEUG6r/IlhvmCU3/qRKAspCEi9TatDS
 aMw4q679phsupKpSpO8EUx5xakBSYGz3OBxE/XFeAZzAzFhT7P9peRrysl7Q4OqmWA4H
 5dNIYgE72SNMf4ZPQnpBnNoW6uqC6OZF4GwKBzmUK1bc8mxXlMU081qPpWpnoGTfaUaD
 elu5/ldn35x4Iut385fgTacLsILN5O9rQJguBf2EClpDnXTVXfg0j/Zpp+yrDkxJeUX7
 uIdLBegL8gxq0N4XQ55onEKE1ADJhvs0i3aUTxzJyzu+8TajwXdUtxOEMGVFa1i3UF1q
 knEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtC2cewBzxFR0ZBzH8EgkaMu+rCBiAWMYJhGkRMyAUvDerYxPoX/uwqdANjns4fnj5lTFmx0wW3Hyr@nongnu.org
X-Gm-Message-State: AOJu0YwtIoL1U8mn5KQQ71PIRM+TKZ9UFBOYfdc5h6rV0gbabH+lj/rb
 iGds9So1BZlcARvvWmNjIJqs/qb9LuKcLa8HxHdHn//5QUHJ3253moLVAAmB4nw=
X-Gm-Gg: ASbGncva7AQ7jCjEFSaOrQ4IwEdEkjmNbxxWqAA4fD4K4YAH9Is113hiLmYtMajvv1x
 QGj0rv7Zz03rS8mqFU0WEnt9sloqX/A8luWiYLRQonTv/chp4lrpAaQOL4Q/trC1AQavaKmqnYV
 7ags4RFP+vUuRo1RFPYfJvsdxfw6VBl0QjrBkCL3IJQvq4hveNQIfcFR6iHq+eNGiK8+7Tyvc3C
 496WTp+qKZTeEjLjv0tiX4DprzHId6nd4fJa/KXFWa05nTMuLULbQTSsHBNjPNo6G4eGxcoFJAb
 9wo4Qksf4U+r5hftOt44fQuGgcq0Jgn9K34nCTJu+gOAwVNjaqVJ1Vo=
X-Google-Smtp-Source: AGHT+IHfcp2D5aSm8Sn0VT4IidLdBYhD/KSzWcZHka724j1qpNfMP/dVIsxPCprx8nPoBb5TgAtEpw==
X-Received: by 2002:a05:6000:1fa9:b0:38b:f4dc:44ad with SMTP id
 ffacd0b85a97d-38c2b65ebf8mr997845f8f.5.1737675884076; 
 Thu, 23 Jan 2025 15:44:44 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4d29cesm6991745e9.35.2025.01.23.15.44.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:44:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 05/20] cpus: Keep default fields initialization in
 cpu_common_initfn()
Date: Fri, 24 Jan 2025 00:43:59 +0100
Message-ID: <20250123234415.59850-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

cpu_common_initfn() is our target agnostic initializer,
while cpu_exec_initfn() is the target specific one.

The %as and %num_ases fields are not target specific,
so initialize them in the common helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 cpu-target.c         | 3 ---
 hw/core/cpu-common.c | 2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/cpu-target.c b/cpu-target.c
index 89874496a41..75501a909df 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -234,9 +234,6 @@ void cpu_class_init_props(DeviceClass *dc)
 
 void cpu_exec_initfn(CPUState *cpu)
 {
-    cpu->as = NULL;
-    cpu->num_ases = 0;
-
 #ifndef CONFIG_USER_ONLY
     cpu->memory = get_system_memory();
     object_ref(OBJECT(cpu->memory));
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index ff605059c15..71425cb7422 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -244,6 +244,8 @@ static void cpu_common_initfn(Object *obj)
     gdb_init_cpu(cpu);
     cpu->cpu_index = UNASSIGNED_CPU_INDEX;
     cpu->cluster_index = UNASSIGNED_CLUSTER_INDEX;
+    cpu->as = NULL;
+    cpu->num_ases = 0;
     /* user-mode doesn't have configurable SMP topology */
     /* the default value is changed by qemu_init_vcpu() for system-mode */
     cpu->nr_threads = 1;
-- 
2.47.1


