Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E6AC47077
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 17:37:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL58G-0003jH-Au; Wed, 03 Jan 2024 12:34:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rL58B-0003f4-Ky
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:34:16 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rL57t-0002Qq-Uk
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:34:15 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40d4a222818so4368015e9.0
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 09:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704303236; x=1704908036; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CaH8a0Z2sktOk6HhcvLcaTrwfzviKqp7ItoU8rNpnow=;
 b=jA6Y2TnkLacMTixdvYD46K8ZXXE4RdI2s1dBOfpWJhP+MxzvKS77b2DCFVllxqJrj1
 wYbQU5ZUxJvb8+utuMoPR3zw9He2rcAOcnvzIXO3U9oHOqyFKMu0s1fsZijw5GKYR4BS
 3wY/n/3WJTymVL8hQ27Yjyc+elZNKVEBdX2Giyu1eRbI+LqtV9wpS8mkAbhFpwVXgK4F
 YiwkDNeNgmOjdzl0FBpoTo5TgcGA4Fd2rgmbvbeXHFBBDOUTphhqU+cmFkpy9LFb/Koo
 4UZUolD1Niyz3yHgAmlXqjUqgOcP5owoTv2YDb6UdbwwEXDU03/RYwTsCunVEeLl0fSt
 pNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303236; x=1704908036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CaH8a0Z2sktOk6HhcvLcaTrwfzviKqp7ItoU8rNpnow=;
 b=BKnTGxqUKJE1c3OmcAudoFf8LAtLz9aGmBmBcX0wLP4PTWiZalqXC8oPw4FVpdjR7E
 E8mUaWaM8KyWNcjTpnOoK0bKzS1uCCtxXcjW/TXPEBV/4bYr0YW5taIyCiOLrMqp6hsW
 Omsq/1H+GZnZiUSz2p18YD56Zj77OISopUgyK3v9oQFjwpNwbo1qG6sXGvZ5b9HFek+P
 PG4+/9B+ZgZ0HUNR/HBBA7XQmG4zMlPfBHAx2nyQGiSFiKLHCJPhU5VkLZc8xhYRXbI+
 /MU7gprgIb77zOZq3CTr9CSP/ghNIdF+NT66t2yOS91qS4I6YRqo3u3bUtvVfJ/0SY21
 TNDA==
X-Gm-Message-State: AOJu0Yw8qgESvSDMDQ7pP0OEbJr3/s51BOn5Asd6T1gX5obqgOPTf9/b
 HHxp2dX6mftqgUM0oBuNMYEFQJDXsPx44Q==
X-Google-Smtp-Source: AGHT+IFPEa4trSH1ULMWjrm1Nbo4OaNZJ4jxlMnYzVLmqTz4UW2OpRVflauqqVvOixkorfcQpuqmAQ==
X-Received: by 2002:a7b:c406:0:b0:40d:77d3:8db8 with SMTP id
 k6-20020a7bc406000000b0040d77d38db8mr778947wmi.44.1704303236439; 
 Wed, 03 Jan 2024 09:33:56 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 bg35-20020a05600c3ca300b0040d6ffae526sm2963001wmb.39.2024.01.03.09.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:33:53 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 1199A5F93E;
 Wed,  3 Jan 2024 17:33:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Bin Meng <bin.meng@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, David Woodhouse <dwmw2@infradead.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Paul Durrant <paul@xen.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 08/43] qtest: bump npcm7xx_pwn-test timeout to 5 minutes
Date: Wed,  3 Jan 2024 17:33:14 +0000
Message-Id: <20240103173349.398526-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240103173349.398526-1-alex.bennee@linaro.org>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

From: Daniel P. Berrangé <berrange@redhat.com>

The npcm7xx_pwn-test takes 3 & 1/2 minutes in a --enable-debug build.
Bumping to 5 minutes will give more headroom.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20230717182859.707658-5-berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231215070357.10888-5-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 000ac54b7d6..84cec0a847d 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -1,7 +1,7 @@
 slow_qtests = {
   'bios-tables-test' : 120,
   'migration-test' : 480,
-  'npcm7xx_pwm-test': 150,
+  'npcm7xx_pwm-test': 300,
   'qom-test' : 900,
   'test-hmp' : 120,
 }
-- 
2.39.2


