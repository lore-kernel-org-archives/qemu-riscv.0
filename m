Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A146EB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 23:22:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qDvWt-0007XE-Ub; Mon, 26 Jun 2023 19:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qDvWs-0007LN-Ho
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 19:21:54 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qDvWq-0000Lq-OO
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 19:21:54 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-98de21518fbso360417166b.0
 for <qemu-riscv@nongnu.org>; Mon, 26 Jun 2023 16:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687821711; x=1690413711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VxVrz8p5o31xt6Yxv58riTEL3xKqDEOgIygHH7bVYSY=;
 b=m7PMxgOsmssfOK7t8kTnNDai/QpDt3NdPap7WcqMRJOLBldpBSsrE6FP7vv0xYvg6+
 xcrPAtgLwPRFj00skvqgJfTqcC6dUn5mccnsXSO/pRvRNwRMgoe10OqhqOpCCx2jTjx/
 l4bcEFq39b0Hw7DP+iGG22iKbIksJc8XptHxAjuU5LIFtWjhw3UuFoVEaNFvYvizqhZb
 tq0SzfBqbYUaSfurJF9zdLYKdoV8Vskr6FQe+tc+vzOxk8V+/O7NmqEY2N8qxqEBobMV
 PqGSDnufyYChdcdfpQisASxq2iciqxzvZg+vNYmxNySnGlsh7fKQ9ZLuzXqvn+DLsLcs
 pFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687821711; x=1690413711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VxVrz8p5o31xt6Yxv58riTEL3xKqDEOgIygHH7bVYSY=;
 b=Kco0rGCf/HU3nNKofFmmYVG/N5lGLYzRY7X47iSUfJYMRwRo2UON2ljk9ruVWO7cif
 Pd5L9kNY6Idv8al9wO6ZVrVDII6oK2ZKEH/0L0Lr3vSn8tI+fr9xAazOpA7ziA+YwawI
 +fJ+QQLwjzYCFBC9NwvqgcMv7m+kRtEwI2gXm+J+7UGuzFzm6bfxvkg8/Bmh5QZquQ7F
 Bky+Mb71gdgE9Nf5B/qiuY0SziBQeqLJGgWmBAKpLlUmUgcUw2DNG1p/DC41bwdgpM77
 JovboVhjW/lXzMIakWFkxsAZG61pH1+0OmRBUaiCLf4Vboku+3RqZ0Z6Yg+++KotRPe+
 xJjg==
X-Gm-Message-State: AC+VfDxxYJJR0Tv4eeSjBIaufRm1HZzXDLTEXks6rBOdfgUqP7jOB1wb
 3cqtbv8rIUHvWTeXZx5CB4tyRw==
X-Google-Smtp-Source: ACHHUZ4EaElgZML1hLHKYA8CswyRRmQJwYRoHGyWpgDYyy9aiFgM/jZSaH202xLJm0T04dBh/7CnwQ==
X-Received: by 2002:a17:906:6a07:b0:989:a806:d197 with SMTP id
 qw7-20020a1709066a0700b00989a806d197mr15375737ejc.3.1687821711418; 
 Mon, 26 Jun 2023 16:21:51 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.226])
 by smtp.gmail.com with ESMTPSA id
 pg9-20020a170907204900b00988aff89806sm3889316ejb.14.2023.06.26.16.21.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 26 Jun 2023 16:21:51 -0700 (PDT)
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
Subject: [PATCH 16/16] gitlab-ci.d/crossbuilds: Add KVM riscv64 cross-build
 jobs
Date: Tue, 27 Jun 2023 01:20:07 +0200
Message-Id: <20230626232007.8933-17-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230626232007.8933-1-philmd@linaro.org>
References: <20230626232007.8933-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add a new job to cross-build the riscv64 target without
the TCG accelerator (IOW: only KVM accelerator enabled).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 .gitlab-ci.d/crossbuilds.yml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 1e0e6c7f2c..5b72df4090 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -129,6 +129,14 @@ cross-riscv64-user:
   variables:
     IMAGE: debian-riscv64-cross
 
+cross-riscv64-kvm-only:
+  extends: .cross_accel_build_job
+  needs:
+    job: riscv64-debian-cross-container
+  variables:
+    IMAGE: debian-riscv64-cross
+    EXTRA_CONFIGURE_OPTS: --disable-tcg --without-default-features
+
 cross-s390x-system:
   extends: .cross_system_build_job
   needs:
-- 
2.38.1


