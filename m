Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D88FC46CD4
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 10:48:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGGar-0004va-TQ; Thu, 21 Dec 2023 05:47:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rGGak-0004h9-J9
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 05:47:50 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rGGa9-0007P1-74
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 05:47:50 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40d41555f9dso975225e9.2
 for <qemu-riscv@nongnu.org>; Thu, 21 Dec 2023 02:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703155630; x=1703760430; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bAHZvQIZNHRqbyqy5ojwPgGxK/S007kBQEH3xZgSzNs=;
 b=N9lNkzTKa71MLPLU0WtuwymC81DXMwN/EEcqK7hTSyOv2b60HhiZC64OMvnxA0Dolo
 DeC8jqdRCZB6jsrE+IzDNCmB6QuC8+PmHKU+HXa6odWUzbMps7S914sEeztgbgcW3gVL
 175kwUWZzIqsNOG22GGiIvKRKRkASpkbzQfBH6xj/e0VnpzHQXoZwdhtnkih6ygpB78L
 y5VC5dlbGHA88bOQvlTZSb6VAkGCq+mW0MHexaj7TcjCY+uzlsm8yWswc2XNrpIfq5BP
 JfAuVixGbReXC1Jn9qyAmWAyZ5Yp9dc1t33vslGBORvf5bKJcnckL/273U0yjxxSrIJr
 G+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703155630; x=1703760430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bAHZvQIZNHRqbyqy5ojwPgGxK/S007kBQEH3xZgSzNs=;
 b=MSIt1nJWY0pEXJG9+BaTM0JOlYFcsI3sGK/5cY5a+CngDMfdClnA1fZuJZpADF+C6g
 eBGwm0YvVkVa7BWr94qxUEOgbilkwhyP5rY1HemGTKhhX3m48vd9F4zj+r1a7HEbnXmd
 LsVjN93KIc/HfaLtt9+NnWAbB/quVszXa2ZTihC0Tm7GnX3lDtz0Q7l97N7zR159+5Xq
 S3C5c7pYB05O/yxPxXDtyBjQ6lCt78heo3RrjTd9w03LtEySazr4AINn5NJrDrzvMOHc
 tva4CRHGNmzVdig5XS9JF8jPUlmtetja2Tn/n4NCZJLHsGZP8ui3BtjncQC6suh2CJXl
 1tgw==
X-Gm-Message-State: AOJu0YyWL2kE/VxyQCvfHEOn0KGSi/c1U/jgK3bU/MFohK93B8dJe2tx
 hdVUYzTj8JxyESF2wOiU2GcnNw==
X-Google-Smtp-Source: AGHT+IHWVKcW/3lIO1yl3PKbYQv6K0jEOTRtlo7Lrm9/XrBT9Bt11VkxGIhfLJqDHy6ViSnC7IyCOA==
X-Received: by 2002:a05:600c:4216:b0:40d:4156:a59f with SMTP id
 x22-20020a05600c421600b0040d4156a59fmr105180wmh.165.1703155629776; 
 Thu, 21 Dec 2023 02:47:09 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 m34-20020a05600c3b2200b004042dbb8925sm10649583wms.38.2023.12.21.02.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 02:47:06 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A0C0E5F8DF;
 Thu, 21 Dec 2023 10:38:20 +0000 (GMT)
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
 Mahmoud Mandour <ma.mandourr@gmail.com>, Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 18/40] tests/unit: Bump test-crypto-block test timeout to 5
 minutes
Date: Thu, 21 Dec 2023 10:37:56 +0000
Message-Id: <20231221103818.1633766-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231221103818.1633766-1-alex.bennee@linaro.org>
References: <20231221103818.1633766-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

From: Thomas Huth <thuth@redhat.com>

When running the tests in slow mode on a very loaded system and with
--enable-debug, the test-crypto-block can take longer than 4 minutes.
Bump the timeout to 5 minutes to make sure that it also passes in
such situations.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231215070357.10888-15-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/unit/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 0b0c7c14115..a99dec43120 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -173,6 +173,7 @@ test_env.set('G_TEST_BUILDDIR', meson.current_build_dir())
 
 slow_tests = {
   'test-aio-multithread' : 120,
+  'test-crypto-block' : 300,
   'test-crypto-tlscredsx509': 45,
   'test-crypto-tlssession': 45
 }
-- 
2.39.2


