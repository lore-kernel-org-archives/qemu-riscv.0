Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1939DC35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 10:41:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGGS7-0004Jq-M8; Thu, 21 Dec 2023 05:38:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rGGRy-0003tI-KG
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 05:38:48 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rGGRn-000482-OM
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 05:38:46 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3368b1e056eso246098f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 21 Dec 2023 02:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703155109; x=1703759909; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c7IelmqBfCUiQPJ1PO4YXHkz0msSivdOvYJRQon3tbw=;
 b=JXuNSnm+iKENOAmHHkGu66L6YQN0D3rPB2A4b4+k+rQra2SwnYpbfFIajuVS5xhNpX
 r3pwqKi/zGhrEtXinj+c+Hsh1aV/T9e2sMB7jNoSo1R/ouJTW2zMp1DbkQ169bje/pgy
 CKyFFEjrEzO7Pv/Z7Oh9cEJJrD3X7FkIayD2EfFtP6sVAIjlmLNHZgMmI4kybwHpnR5q
 EDkVaOwVvVsCB/YtiSZrpy3LKOK8zwP3HzJ2scq768FFOi4PFZa5qO1rAZZ0qG+zulND
 g3RHVMzvXP4xORTW5gUPxTVuXXk93rUQasWXFG9LkQmws1rc1bEddGkENrzaZR006LE7
 bILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703155109; x=1703759909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c7IelmqBfCUiQPJ1PO4YXHkz0msSivdOvYJRQon3tbw=;
 b=PH4aDwC24OAACjCwR3ov0S+FateICJJPnH1M9I2p/RUfGZvcne83mv4Jb7ofYDiuIg
 PJpfLlOiWx7KAMfOITGGavEm57wEW67AXGOhqz1AJaRAMfj3w1kIP0xo00IAP2csdfm3
 aXxH1JFzhO3i2cpoq94eqcVeyrNTCoJErTorx1mi2wPiiffEvGE81Bs7ltB9b01BVurO
 gf6O+dxQmPTPN0ZTmcIk764nrFrdSxOzKFFO2g2js0MeMrQHUPgUqtZ6rfLr4LjrxKzA
 diXIqM5NmM9HCWIslbszOwj3GLXMNtP70nH596w5noQ4b2YLUtx91p9ZSO/NUx5BjlT7
 iDGA==
X-Gm-Message-State: AOJu0Yz3rEamd1UpntP4GkAbWksV5YFuwSTUv61LXA3wn6RNuLxYE8zu
 DkIr9mgRovozpU3MqMSHNyNu1g==
X-Google-Smtp-Source: AGHT+IE2SX8Gf4CKFnC2WUs5pcquLgLIHQPwc6U2p/RhTTIcQNnHMhIsqb2Kkf5Fuml6Vm8L0QiRYA==
X-Received: by 2002:a5d:44c2:0:b0:336:6bf1:9707 with SMTP id
 z2-20020a5d44c2000000b003366bf19707mr643477wrr.124.1703155109425; 
 Thu, 21 Dec 2023 02:38:29 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i2-20020adffc02000000b003364aa5cc13sm1744942wrr.1.2023.12.21.02.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 02:38:22 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C70F85F7D4;
 Thu, 21 Dec 2023 10:38:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Brian Cain <bcain@quicinc.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Cleber Rosa <crosa@redhat.com>,
 David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paul Durrant <paul@xen.org>, qemu-s390x@nongnu.org,
 David Woodhouse <dwmw2@infradead.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 09/40] qtest: bump test-hmp timeout to 4 minutes
Date: Thu, 21 Dec 2023 10:37:47 +0000
Message-Id: <20231221103818.1633766-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231221103818.1633766-1-alex.bennee@linaro.org>
References: <20231221103818.1633766-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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

The hmp test takes just under 3 minutes in a --enable-debug
build. Bumping to 4 minutes will give more headroom.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20230717182859.707658-6-berrange@redhat.com>
[thuth: fix copy-n-paste error in the description]
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231215070357.10888-6-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 84cec0a847d..7a4160df046 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -3,7 +3,7 @@ slow_qtests = {
   'migration-test' : 480,
   'npcm7xx_pwm-test': 300,
   'qom-test' : 900,
-  'test-hmp' : 120,
+  'test-hmp' : 240,
 }
 
 qtests_generic = [
-- 
2.39.2


