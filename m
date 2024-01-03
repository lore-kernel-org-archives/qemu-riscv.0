Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEC0C47073
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 17:37:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL58L-0003rR-BK; Wed, 03 Jan 2024 12:34:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rL58K-0003pJ-9b
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:34:24 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rL580-0002UH-6a
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:34:23 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d87ecf579so29155725e9.3
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 09:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704303240; x=1704908040; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wRw1//+81PB5ZNvZJSTSQFwoG2tqKVRM/U60AtyQst4=;
 b=QZ+7Y21xMfAIht4B7MqplZRfvNXqyfHg+WvYMbuWeFMRLevmNMfKmGrhVVf+j/n+qz
 crxFZx3nCViKVNWeh+qzeLGagi0zYye6su5KHGI91b+9tzPEqiOR+hoey+T5q43ih8vn
 KWZOgTh7NlLQ04N7BhxfFx7I6T2tJJ90OXGKGUY93IcH46stEpyq95vKn8SBGUrTZfSF
 +SZw6ZYWiFgxK20imDxetcA81Bj4MBTYbsl1CW1W668YAz7NTeEVuksLmtHW8Kt64Cp7
 owwxDEPG1p1o6AGhFNuAGOGTA8CcoaD2BFXekODKM9aqmYUFe9W7imzePPk7iqhWaQjs
 M3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303240; x=1704908040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wRw1//+81PB5ZNvZJSTSQFwoG2tqKVRM/U60AtyQst4=;
 b=wx8S07uLeTXR1BGFe/V9LGGSnEXqSQzIvzQIrVv+OzcCT4Vw+dkXDi+CT6cX2wgYQm
 t+cPL1dlKw189x9b7xk8wnccNVRbSlkSkOKb9EW+RvnNAyJGqkqU7jrnXWlpCspjYV6S
 RkF9KHkDR7GtIvVnn7fj7vIOYct5SzD4rewOXTUYo0xeV/+nP8Eh8uAORGXlxVJM5HZu
 7r286TEb1Xxgjb1QXI8lSURV9c0GwTzISbq5mugr8kF7vR8mt89IiCM51SnbgiTCfTdT
 ZA/3fFq0WuMQtpCfQUrXmEBCfb5GQeqIKuL3zSW6jR7HvKQdJdTgrocj0GqhhXy5vZiV
 nveQ==
X-Gm-Message-State: AOJu0Yzf+2P3c4qqI/OE9q3q94rwS6zMWgfOFfCb8c+zX9WrafG/DXBl
 XL62otEj2FZu3ik/Bu4ntho80FAmifAG3w==
X-Google-Smtp-Source: AGHT+IGRb1EG4rLPK4TuLkqwgONu+gLuVa4+cTzeg08wRExh/Gqtzz92MgVmvdmmy9ZrPufi06pGTw==
X-Received: by 2002:a05:600c:354e:b0:40d:4d95:f82f with SMTP id
 i14-20020a05600c354e00b0040d4d95f82fmr6578918wmq.68.1704303240439; 
 Wed, 03 Jan 2024 09:34:00 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 c1-20020a05600c0a4100b0040d81c3343bsm2942425wmq.42.2024.01.03.09.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:33:56 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6B1A25F942;
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
Subject: [PATCH v2 12/43] qtest: bump boot-serial-test timeout to 3 minutes
Date: Wed,  3 Jan 2024 17:33:18 +0000
Message-Id: <20240103173349.398526-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240103173349.398526-1-alex.bennee@linaro.org>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

The boot-serial-test takes about 1 + 1/2 minutes in a --enable-debug
build. Bumping to 3 minutes will give more headroom.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20230717182859.707658-9-berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231215070357.10888-9-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c7944e8dbe9..dc1e6da5c7b 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -6,6 +6,7 @@ slow_qtests = {
   'test-hmp' : 240,
   'pxe-test': 600,
   'prom-env-test': 360,
+  'boot-serial-test': 180,
 }
 
 qtests_generic = [
-- 
2.39.2


