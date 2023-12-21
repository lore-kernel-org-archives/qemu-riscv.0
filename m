Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE03C35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 10:39:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGGRu-0003oy-7A; Thu, 21 Dec 2023 05:38:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rGGRo-0003jz-H0
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 05:38:37 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rGGRe-0003yD-9i
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 05:38:35 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40c6ea99429so6889475e9.3
 for <qemu-riscv@nongnu.org>; Thu, 21 Dec 2023 02:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703155105; x=1703759905; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W+Zw2YkajEPYChe7VczIaT3yCibcEp4TlrDptH8Gvrw=;
 b=AGfrUYWETD4eVd2YFPAa6PJIA3OfEFB/pFLw7QZEFpdsPt690LcKgAWBi1AMnFVhiM
 2ZsRImUPmxCYO29FeqPu1XFoKdyxvUL4nHSykx9kL95PHc0Fsxt0451vaYlb+4eFbfmp
 Df/2MN/Y7Ggem1E2PNQ7HH4sssAsXYUteHWlLIL65uUd6wDCZMAaYit6L6y99bnVjU/R
 cIz1y49/AJq39oue4Umrtt4K4IpIzCEKM4ydbwi436vnmVYsPBm0ESi6I7lFvygkygG1
 YbOekM0qfwd85mIorgBzT71Cd15Qnwv9YQUuII03J1/Q/uV0aBTVx4zW+kuhLOhkOqGI
 Efcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703155105; x=1703759905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W+Zw2YkajEPYChe7VczIaT3yCibcEp4TlrDptH8Gvrw=;
 b=Kw3XV+a+zTHKozAkxKy+cuowkZ6Znth2R6SQmnuAmz3n6dgiqD5o/sMUaYDM/GDWKB
 GtKVAnC5J57xy7VGxePvjJiyFt2ygmvoEBOfDb3nBcJiZo1d+wunx8BEEBhTy8n0RujH
 oUZ92aKbulv1u0d5ncIDLC9G53nwU6TiU0lCOl+Tlb5z1V4N6NQMdymSuPAHZrL6w16w
 w89RBIGT0qwTX+zFnHC68X5MFOQ/g3A6zt7RaJ8I3f/MdvM2zEFkIY8xTZvACZSpCYjx
 86iLrFJSUkYZhjd1N7QzMNaqgEuNcLDbWWz5nWmZxEmztbpK2BQmcFXJxYdhqrlaoMKG
 NB3A==
X-Gm-Message-State: AOJu0Yx4Vv43F8tcXfnyD2N3go/zOL5vgiEOD5r5WsJo4suRiGb7VLga
 rcERYGKZgrkXZyN4IN5dj6Ps5g==
X-Google-Smtp-Source: AGHT+IHEemnxDaCmAIZT4QWVJgpaGR0bY8/ZS9ytXYTgtiLLrMK5C6h0ngFirdX2Hv8S2N/SuvErxg==
X-Received: by 2002:a7b:cb85:0:b0:40c:f28:4548 with SMTP id
 m5-20020a7bcb85000000b0040c0f284548mr465271wmi.271.1703155104924; 
 Thu, 21 Dec 2023 02:38:24 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c510b00b0040b43da0bbasm2807635wms.30.2023.12.21.02.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 02:38:22 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 83CF25F8CC;
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
Subject: [PATCH 06/40] qtest: bump migration-test timeout to 8 minutes
Date: Thu, 21 Dec 2023 10:37:44 +0000
Message-Id: <20231221103818.1633766-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231221103818.1633766-1-alex.bennee@linaro.org>
References: <20231221103818.1633766-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

From: Daniel P. Berrangé <berrange@redhat.com>

The migration test should take between 1 min 30 and 2 mins on reasonably
modern hardware. The test is not especially compute bound, rather its
running time is dominated by the guest RAM size relative to the
bandwidth cap, which forces each iteration to take at least 30 seconds.
None the less under high load conditions with multiple QEMU processes
spawned and competing with other parallel tests, the worst case running
time might be somewhat extended. Bumping the timeout to 8 minutes gives
us good headroom, while still catching stuck tests relatively quickly.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-ID: <20230717182859.707658-3-berrange@redhat.com>
[thuth: Bump timeout to 8 minutes to make it work on very loaded systems, too]
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231215070357.10888-3-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 366872ed57b..f184d051cfe 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -1,6 +1,6 @@
 slow_qtests = {
   'bios-tables-test' : 120,
-  'migration-test' : 150,
+  'migration-test' : 480,
   'npcm7xx_pwm-test': 150,
   'qom-test' : 300,
   'test-hmp' : 120,
-- 
2.39.2


