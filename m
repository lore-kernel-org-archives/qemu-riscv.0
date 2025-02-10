Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE2EC02198
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 13:32:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1thTty-00005M-B5; Mon, 10 Feb 2025 08:32:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thTtL-0008L5-Ng
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 08:32:04 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thTtG-00068T-FV
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2025 08:32:01 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4394c192285so759665e9.0
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2025 05:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739194316; x=1739799116; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OZ1fgmbr6UR57aQyXOIyNIPPA+qrJvYb0dDxQG0PMFQ=;
 b=EMVr36D3uR/gZOncTnt0i9zIPCR9YgrYsHedhcxkmKR+yrsmIfjVGeunhhk+gfqwrW
 d307qHBuyk5xMickJHqxz2ohrC2xdn2hTaQMdcLKjHHOQWW56DDIsTfncoyZchA1/E9b
 Bl/2knsoBUoHqMNR5d8uY8OeHx92sb6bOZfRuBf4RlAz8hofbQ5a50NWCPKtAmUAOROX
 SBd37jrC4sgmAIRCKAlWvPH5ju6cAYfa0s2v+6gifVtgWyJHTBqifgF4f2jtpD81Hm4m
 8mEU7UqLZDdSQPa2vRKpE5qoM2KaS2FmEom5s4eoPZC7Y8tYW6F8zOdukNKdZ1KOcydS
 U8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739194316; x=1739799116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OZ1fgmbr6UR57aQyXOIyNIPPA+qrJvYb0dDxQG0PMFQ=;
 b=I919/g2Uma0fCvSkAuWh2LVmyi4+X33pK1as281Mv1cV7wa+6rOhwksVU17IuTYDrc
 WdEse5O56aXtaBXHV9w2mxZuFf3bfdjJTDFJfZTTNpAf5j3L8Uzt3dMdRa18u82VR0G2
 6/vYvzWLWVK1i66DnZ9x87LVfKocwiPKn3IL/FSWVhyNeUsCINtpDumMEOmI2LiRiNDL
 TfHb6zawfF47AYg4a9ukpYULTGk0g+h1l4LXOkWNvMZALGf+csc8ChjIMiIlXnEAD6kA
 B6ztKVF89yphFeXUhdy/XNkPOqg0TPObHy6yt34aMZJWjUXBJja6sgtGCPl3umNe6+3n
 ogGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZ1bQi4lf5KmbF/4ReLUUhxM7C6uydxaLOBT2Uy1Ex2q+aNDEAjXK6PdyWynpOMWABVHbmKkrMqYGF@nongnu.org
X-Gm-Message-State: AOJu0YxOgOCZ1x3F4a9rL2xhA/UrECzT1+jH2D3u7pSXuFBEspQCVpeM
 5Bh7/sCmqchlQttxKsA7bjypdqXebVHLHpzXTLXaLHaKEEanlkZsOsgXzv+So/A=
X-Gm-Gg: ASbGncucinUAlIu6h2vihD0djx6lu1k3dVxF/a8lJgIUFQgize2gBbQN2u72uyUecZ+
 9huUO+RYiyU+eWXr1GmQ9ZPohNZv8t+Ms8CsG8f6FcO2c08Lw0DXdUohcKq+13k10kyvnEcI2k6
 2ZB6OAON/e8uwMPcM6/ktJcmK19RgZ0F6P6tu/qjtKyL+qoIWlR3DM+mU9w8YMw/KpAG+K5DHsI
 r/2iC88CaEvtcWol4K5N0xOSyRsK2nlxA5y4RpujAGHdR6s+reBn5X7ZtYV/OaLgfx+Z2pTjp7n
 gw6/wzpuzJfjU16fi/ra1DpsVpidkn/aytbZAoM5qvGj/XeEBnuffBG5tmYYaoj1fqQSAw8=
X-Google-Smtp-Source: AGHT+IEweqWJGL+JaO7TrOk1f3wx8k+hCAUgrY1Yr1bWjMkztgiJPPp3HCmks3rMw26vxQfSd25enw==
X-Received: by 2002:a05:600c:1c9f:b0:436:1c0c:bfb6 with SMTP id
 5b1f17b1804b1-439249c0324mr101976465e9.27.1739194316059; 
 Mon, 10 Feb 2025 05:31:56 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43907f19247sm132652225e9.1.2025.02.10.05.31.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 10 Feb 2025 05:31:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 04/11] target/riscv: Declare RISCVCPUClass::misa_mxl_max as
 RISCVMXL
Date: Mon, 10 Feb 2025 14:31:27 +0100
Message-ID: <20250210133134.90879-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250210133134.90879-1-philmd@linaro.org>
References: <20250210133134.90879-1-philmd@linaro.org>
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Cc: qemu-riscv@nongnu.org
---
 target/riscv/cpu.h | 2 +-
 target/riscv/cpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 97713681cbe..fbe5548cf5a 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -529,7 +529,7 @@ struct RISCVCPUClass {
 
     DeviceRealize parent_realize;
     ResettablePhases parent_phases;
-    uint32_t misa_mxl_max;  /* max mxl for this cpu */
+    RISCVMXL misa_mxl_max;  /* max mxl for this cpu */
 };
 
 static inline int riscv_has_ext(CPURISCVState *env, target_ulong ext)
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 3d4bd157d2c..f3ad7f88f0e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -2955,7 +2955,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
 {
     RISCVCPUClass *mcc = RISCV_CPU_CLASS(c);
 
-    mcc->misa_mxl_max = (uint32_t)(uintptr_t)data;
+    mcc->misa_mxl_max = (RISCVMXL)(uintptr_t)data;
     riscv_cpu_validate_misa_mxl(mcc);
 }
 
-- 
2.47.1


