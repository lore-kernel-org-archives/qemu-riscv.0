Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B86DC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 15:46:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLmM5-0004MZ-6I; Fri, 05 Jan 2024 10:43:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmLv-0004Du-7x
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:43:19 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmLt-0002x1-ID
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 10:43:18 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d4a222818so4021815e9.0
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 07:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469396; x=1705074196; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dyYYg5j1yzG/KRM3hwRmq5l0B0UfdF1Z3FJP8e3OduU=;
 b=cOTdFLzkEqK4Mqv8v7cggaUEx+hZJ2bidv4Rq5SR6kOu9ghWEGUBjDtQ1pnvK3yCsQ
 amWMvG7ZOSoCs0BD/m2VvYwi4eMHrQcQ6i/VSLuBKwelJH/0SPLN7z2xLpz+mWHmZ/ZQ
 uUdDdMaGHxNW0ZvqOJJb8YObL8l2Kw4PtazcOG5iMDa7onFCagajUqZOt+7g7qJglorN
 kNh/b29oShwcIjjJl+9s2PQsXXN5yDynHC/mZAM7or3QYv+r+x9eWHvQFx4thYwYOBql
 cvv1p1bR6ftkdOiV4qocHo1Pfyd5dU/Odt4RBl5xmuk+XB4YS+BosOj+guX1mUb6XY+4
 iL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469396; x=1705074196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dyYYg5j1yzG/KRM3hwRmq5l0B0UfdF1Z3FJP8e3OduU=;
 b=Ny9haoUyll9PjZUDU9ias3BbS2Ps68HazZrvjYADT5+N+Fhrv5NSCiUrBHdh56o3M9
 WgyMa0c7jyGDX1Uls7G1jFjl35iiUM6W6aSJhvcXDNeSc85io7gTJmXhIeQ9OaGxfy6r
 KcgBjr4GWIjqs53tovEOjrPLUCAeJkSlH/JTcqFt7B24iL0L2tQoKWktx/M+iGTJdaAH
 osYsoRrE7jUraIwKMT4zLj4EdORhG92hukuPfFIx9CTzUWVkmqXyjysIsyDBhDotC9B1
 O8ewsC10RyFWfAgdV1jo6Yh+dBmCJRx6ZeYgGcPAPxAWptp8ro7p7F6b40ZN0uWEKN4R
 CMog==
X-Gm-Message-State: AOJu0Yx9yMp6gaoiWzxAsUTVJdS8OcYm+FdCrNCnJ+4PMhAHPGyZ0g2N
 IpGutOR2Vh2t/rvlFIDMo+FxIYjWj2LYcQ4Pf0umDRcjnco=
X-Google-Smtp-Source: AGHT+IGEXDELUnfWjSH8cEyldisUN18wGhsk2Nh0xeSqB84muNDIOcvJYfd8ElDl5RA5raRsCrlfqw==
X-Received: by 2002:a05:600c:3846:b0:40e:364d:d526 with SMTP id
 s6-20020a05600c384600b0040e364dd526mr821960wmr.87.1704469395811; 
 Fri, 05 Jan 2024 07:43:15 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 m3-20020a05600c3b0300b0040d91ab1d54sm1936603wms.6.2024.01.05.07.43.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:43:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PULL 01/71] meson: Allow building binary with no target-specific
 files in hw/
Date: Fri,  5 Jan 2024 16:41:54 +0100
Message-ID: <20240105154307.21385-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Allow  building a qemu-system-foo binary with target-agnostic
only HW models.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20231121203129.67999-1-philmd@linaro.org>
---
 meson.build | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 5a2582776c..371edafae6 100644
--- a/meson.build
+++ b/meson.build
@@ -3771,9 +3771,11 @@ foreach target : target_dirs
     arch_deps += t.dependencies()
 
     hw_dir = target_name == 'sparc64' ? 'sparc64' : target_base_arch
-    hw = hw_arch[hw_dir].apply(config_target, strict: false)
-    arch_srcs += hw.sources()
-    arch_deps += hw.dependencies()
+    if hw_arch.has_key(hw_dir)
+      hw = hw_arch[hw_dir].apply(config_target, strict: false)
+      arch_srcs += hw.sources()
+      arch_deps += hw.dependencies()
+    endif
 
     arch_srcs += config_devices_h[target]
     link_args += ['@block.syms', '@qemu.syms']
-- 
2.41.0


