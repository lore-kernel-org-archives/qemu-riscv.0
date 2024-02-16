Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20470C48BC4
	for <qemu-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 16:37:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rb1Db-0001DF-3K; Fri, 16 Feb 2024 11:37:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rb1DW-0001B8-N5
 for qemu-riscv@nongnu.org; Fri, 16 Feb 2024 11:37:38 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rb1DT-00042e-6o
 for qemu-riscv@nongnu.org; Fri, 16 Feb 2024 11:37:38 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41211097adcso15992015e9.3
 for <qemu-riscv@nongnu.org>; Fri, 16 Feb 2024 08:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708101453; x=1708706253; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c62pHsDpP+3tvJg69QO5ZTVqtvkEN32UvVvL0uQMeec=;
 b=sI54+OGXLGomRlWCKNQ1jaHg1vgB+LrnOuEmZFiG084V01ddh8knyWXYMWcdS3WqUt
 IwhH1nVnA3Y3l8itPUFuB3u1jo0x7dcoMUAsA4Gxxr3fGc/nixbOhpeUqe0c5oSDSDPm
 /ePY2jJ9vucpH/TOPW2TF/ry0Eca57tdPnwNh3+xqkaiFpwbyetkUcU7L31xYXKmNER4
 aEAqpINjscYvsj3+wmHCKx3kNWdnkRwkRfe2BsBRKXKrr0eYX6c8g3REx71Gr3bpUw/f
 fnzw+I5i0VvT85bkaVzfpmJDmGHG9rJ7Fi0f915fpShO9YW2o6s0YXk21q7jKGp2hi5+
 q3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708101453; x=1708706253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c62pHsDpP+3tvJg69QO5ZTVqtvkEN32UvVvL0uQMeec=;
 b=PaRhSZYOiJfX6SYE2tKv4Xhi7YgrIPhIxwqo4kXVIF4+Yr+eG0Pv4Xxd0EGnQwA9mr
 gq3GBi1RrPMqVMyi9hMCwuxYGv7XxIouWlVnAIYumbtBgM3r4UcwID0FshFsKvwrDyd6
 d975kw0i3mYxfPVsnb/W3Ee0/SJU6SmSttwGxmGepgReB85F7XUgPJ0m8B2mRAQ4PJAU
 f0vx/t/mRWTfnInD1GvND6aGRuylI7ufHZj09OcQSwPW8po7LOQm+etr1wFJcIrbC6Jl
 3P3P5Tc9IBPrMGwTCZO10hPoVOwkl9vP36IeCEoZCHX8a9oAiaT6sUlhdkPQj/O1ROBf
 e9Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgYpYfqLRrMd0toZrXwlcp38UwzSIyamVbtNJ7N81ejN9UZh5lhFllIvI7Q3ZiEPUcZyFKK/eSrJr0pIAR/jzarSkDf8Y=
X-Gm-Message-State: AOJu0Yw3yBE4c7XvuyjZxIE7DwsTeUDmshiHx7YY+pmOgkrXBkWuFE9M
 eOzx+WDYekgWF8yz0k8TaqSmW2noHZCq6M+JnEGofYGYb5Q3hS2h9jkskEZZYfc=
X-Google-Smtp-Source: AGHT+IFlcfo0qrzMl8NRGryNzT+j6nsqzsHloSTXHMDNwXwMy3CU01Zcln3BV9m3NajySpGZYx3Yzg==
X-Received: by 2002:a05:600c:5189:b0:412:488a:5922 with SMTP id
 fa9-20020a05600c518900b00412488a5922mr1734829wmb.21.1708101452928; 
 Fri, 16 Feb 2024 08:37:32 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 je11-20020a05600c1f8b00b0040fdf5e6d40sm2846145wmb.20.2024.02.16.08.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 08:37:32 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9D8B15F9EC;
 Fri, 16 Feb 2024 16:30:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Song Gao <gaosong@loongson.cn>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-s390x@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Yanan Wang <wangyanan55@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 23/23] docs/devel: plugins can trigger a tb flush
Date: Fri, 16 Feb 2024 16:30:25 +0000
Message-Id: <20240216163025.424857-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240216163025.424857-1-alex.bennee@linaro.org>
References: <20240216163025.424857-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

When scoreboards need to be reallocated.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240213094009.150349-8-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/multi-thread-tcg.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/devel/multi-thread-tcg.rst b/docs/devel/multi-thread-tcg.rst
index 7302c3bf534..1420789fff3 100644
--- a/docs/devel/multi-thread-tcg.rst
+++ b/docs/devel/multi-thread-tcg.rst
@@ -109,6 +109,7 @@ including:
   - debugging operations (breakpoint insertion/removal)
   - some CPU helper functions
   - linux-user spawning its first thread
+  - operations related to TCG Plugins
 
 This is done with the async_safe_run_on_cpu() mechanism to ensure all
 vCPUs are quiescent when changes are being made to shared global
-- 
2.39.2


