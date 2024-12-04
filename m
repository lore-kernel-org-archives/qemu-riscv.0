Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0244AE7716D
	for <qemu-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 20:30:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tIvyx-0002wB-WD; Wed, 04 Dec 2024 15:28:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvyq-0002QP-Eu
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 15:28:17 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvyn-0002bP-Jk
 for qemu-riscv@nongnu.org; Wed, 04 Dec 2024 15:28:16 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4349e1467fbso1393655e9.1
 for <qemu-riscv@nongnu.org>; Wed, 04 Dec 2024 12:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733344089; x=1733948889; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GX0z7ED1fpqqEX0e3FNGIrRnTBaZqIcam5D8KFO/APw=;
 b=TRTYqHQEIK04Y6ULZP4l0E5gbUgQjjF3PfhBSTltnjGYwpC/JHV4jAcApQSmXyCJCA
 W2zIRLb4VCipt856iw/ACgg71gUSPRwWnHC1+Tx4zFDQduIl98eO4zTbUOeazaEXemCW
 4GSC/z5Sb46hTUkXyFbux52R0A9C4G8gk3Us45PaI4kpvQGIw8QJ1aK0m2PL9AYBj1pL
 J4MnDOsCtfS+GEk+m9/D0yx8wMazQlltqJfRMXxiFxFKKczrhCbvqAUu+XsLsTrHVWRL
 V6J4tFj9LWGNYLslLXxIvGiyHk9cJDPzKJ/kQgCnJh0EJhP/Tfgn4X97F0/fpA1eGWi7
 SEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733344089; x=1733948889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GX0z7ED1fpqqEX0e3FNGIrRnTBaZqIcam5D8KFO/APw=;
 b=wAviPc8IsG8J/3R30e75Fyk/kWl107clyinWF99UZkDT1P5w2ZSOWhtM2jkw/OSk7y
 DbL17Yo7LE3RLen9Xqb+HlvZ3SJaIdSm2z+6xok1D0P+k09wTURebFBzMY0CI/mh/UWm
 u581owSbRU0a1ijEj5aZA2mhGjgmXWlWoBMfCv6uk8oA7YyFqzFqsU1TOFzafn4y8YSI
 LuUrh3RUpkngH6AIdI+k6EKZmjIpYd9rYIpkAnNJmRskoDca6KNNZzG8vWc8nToHmCiP
 t67zhJXrs+Yqpe1qX2EvsA/hcIjn+sBiJTcSQZyzJMZD9t4Eg0Gla6TDPM4NK+M1uF+Q
 C5MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrGushLDJs09yT6HP8Yb8mQM47sJ7B6vNqYoIeD7MvLvdNHQA1Y3eOBKMNIKejH1Gf2i5ubykvLcXB@nongnu.org
X-Gm-Message-State: AOJu0Yzya5tK3QlkIt1PuMEv0rpTc8yEyomVajZ3I2rp0q327NtYm1pY
 puqLMiuhnCK2vIFDiingf5IppixsQXYYeZyHZm/nt9rFieXOIRijJN280OlRPNY=
X-Gm-Gg: ASbGncuWx5YQ7wdMl3Yszl4TkkT/Yo7yRN0tnwlSznIKrzynX1iEzdNBH5lZSnSgkLB
 5GBRalUbPUAXBONz7Rvefj+SZw8Cit6NJcM6sFkvT3NcXPcTQaTP9YjBaWuah0uWTdFoohYCutp
 MyMs283gU3hTOAWrmDaAnSVbooRCEKnylC4+RbCRtoA/+N1Jj7wQYTpG0C4ipA/P73mOMvqR6s2
 5CbjZVfaZi2H0sGGNJG9xzhBxsGSs6YrnHUrfNa/uNjLJXoyq9Gaw7WPDC1e5kGzzbTmzYU8FtR
 mJHdJrMxdaMwjk4EoIa9WD/A
X-Google-Smtp-Source: AGHT+IFQVlgKgXzi+WHSeKykqO09/qxwXPFKjgqPF3MN1t0t3YAGqhk0OGIb3lGnnbvtjy1rKap/lg==
X-Received: by 2002:a05:600c:19d1:b0:434:a4a9:5d54 with SMTP id
 5b1f17b1804b1-434d09bf794mr77784015e9.10.1733344089220; 
 Wed, 04 Dec 2024 12:28:09 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d52c0cfdsm36598115e9.33.2024.12.04.12.28.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Dec 2024 12:28:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>, Anton Johansson <anjo@rev.ng>,
 Zhao Liu <zhao1.liu@intel.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 16/20] hw/core/cpu: Expose cpu_datapath_is_big_endian() method
Date: Wed,  4 Dec 2024 21:25:58 +0100
Message-ID: <20241204202602.58083-17-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204202602.58083-1-philmd@linaro.org>
References: <20241204202602.58083-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

All target implement their CPUClass::datapath_is_big_endian()
helper, we can expose the generic cpu_datapath_is_big_endian()
method.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 8 ++++++++
 hw/core/cpu-common.c  | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 91c6581f814..5c75fe3a842 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -611,6 +611,14 @@ extern __thread CPUState *current_cpu;
 extern bool mttcg_enabled;
 #define qemu_tcg_mttcg_enabled() (mttcg_enabled)
 
+/**
+ * cpu_datapath_is_big_endian:
+ * @cpu: The CPU whose state is to be inspected.
+ *
+ * Returns: %true if the CPU access data in big endian order, %false otherwise.
+ */
+bool cpu_datapath_is_big_endian(CPUState *cpu);
+
 /**
  * cpu_paging_enabled:
  * @cpu: The CPU whose state is to be inspected.
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 09c79035949..92c0c4c6125 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -66,6 +66,13 @@ CPUState *cpu_create(const char *typename)
     return cpu;
 }
 
+bool cpu_datapath_is_big_endian(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    return cc->datapath_is_big_endian(cpu);
+}
+
 /* Resetting the IRQ comes from across the code base so we take the
  * BQL here if we need to.  cpu_interrupt assumes it is held.*/
 void cpu_reset_interrupt(CPUState *cpu, int mask)
-- 
2.45.2


