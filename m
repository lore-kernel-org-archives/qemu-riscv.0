Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD09BC3DA4B
	for <qemu-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 10:59:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sU2MG-0004Hs-La; Wed, 17 Jul 2024 06:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU2ME-00048J-E2
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2024 06:58:02 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU2MC-0005ff-JS
 for qemu-riscv@nongnu.org; Wed, 17 Jul 2024 06:58:02 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42793fc0a6dso45273975e9.0
 for <qemu-riscv@nongnu.org>; Wed, 17 Jul 2024 03:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721213878; x=1721818678; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YQ5kcnCOObbjA6/Or2TYLNPevY5gyQfg0ztfeo6rNcw=;
 b=awDkfBAQ35vvxlBLC5tWQMTYjibDAsKNdyPaMK885LEoBDQWqsiCZBl/rStaePO+MP
 PHdMHF3MoOAqvXVXTyc2qggcFNCkbKZktQuEThoukzAzSR0pEs4YIMiZvA2Coiuatbs4
 00/hB7DJed7DV3kcf73IX8enbVE3uw0tGSYUo/5h5Vj5ZRZUZMKRrVdJhyW3/zKqflsZ
 eWftatCqla2Lleyr8tGqecPEA6LfelPdMz+GWeJ4+CmSaGyjb3qc5A3j4dE9Uo/3OpaH
 un7Y/IF8zNHPhUZDHdpqjz9ZuZmf8lwnAnznWVebr+vCuOKL8Mrqxt0R4E/Wn0q81VL8
 92dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721213878; x=1721818678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YQ5kcnCOObbjA6/Or2TYLNPevY5gyQfg0ztfeo6rNcw=;
 b=kdJiFwmAQY168VGXvid3plH80cBqzzmCBLz5/wwblrvddqaYGFjMKB7XJPcfZ9ZOSY
 a9BI3iBiz6ID9ern7R1+FfmamduvXeCxNaCOZFC7AXfbutRJ6Dz+Gdnd0hm8YHGj5j5P
 8MN1r7yMVpzH1Je0LPg+bYyMG5q8kX1yC92hpm2LoFabx59Jgd398/ZFJ6VzAZWI18Ep
 1ewe4bZhP4k90jy+as3x9yDTnEEdzUjARB/giK1usDQNEfm/M5QkWhJSnO6TmdzPTY50
 lShqBwjBbSE+jnW2D58TGKOOZcCz6i3p2ZePsfy0Dp6YveabJhqZmwCAJgtCVhat6XCq
 NkRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXG/EI/JaTHepnHFoGWMAqug4J2nKzrHRho7/CjnjDsmwlh5E2hBDjc1hbfi438wtUBBpW/9EeCsNEHQbRH6HNz+R6Bu2k=
X-Gm-Message-State: AOJu0Yyzczflbjy0zHcKBqK9YpFzBPObN9Vv96RvijMwl12mnmiChNnj
 5XLwclBKXNgfNVHp0H/0s0QcKm/vGOduNLrqLgljYMA1ogKv/1ggC/1LesjVsbk=
X-Google-Smtp-Source: AGHT+IEBQtuQmFSGg1imDLHD/Xw3NQLIn8z4odfK/LV9hKI5DQW6WxvJCZYkj6qpurG05qKXWUdjPA==
X-Received: by 2002:a5d:5cc3:0:b0:368:d0d:a5cf with SMTP id
 ffacd0b85a97d-368316f8093mr740735f8f.45.1721213878365; 
 Wed, 17 Jul 2024 03:57:58 -0700 (PDT)
Received: from localhost.localdomain ([176.187.208.21])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dafba03sm11370123f8f.76.2024.07.17.03.57.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 17 Jul 2024 03:57:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 6/8] target/riscv: Restrict semihosting to TCG
Date: Wed, 17 Jul 2024 12:57:21 +0200
Message-ID: <20240717105723.58965-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240717105723.58965-1-philmd@linaro.org>
References: <20240717105723.58965-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Semihosting currently uses the TCG probe_access API. To prepare for
encoding the TCG dependency in Kconfig, do not enable it unless TCG
is available.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
---
 target/riscv/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/Kconfig b/target/riscv/Kconfig
index 5f30df22f2..c332616d36 100644
--- a/target/riscv/Kconfig
+++ b/target/riscv/Kconfig
@@ -1,9 +1,9 @@
 config RISCV32
     bool
-    select ARM_COMPATIBLE_SEMIHOSTING # for do_common_semihosting()
+    imply ARM_COMPATIBLE_SEMIHOSTING if TCG
     select DEVICE_TREE # needed by boot.c
 
 config RISCV64
     bool
-    select ARM_COMPATIBLE_SEMIHOSTING # for do_common_semihosting()
+    imply ARM_COMPATIBLE_SEMIHOSTING if TCG
     select DEVICE_TREE # needed by boot.c
-- 
2.41.0


