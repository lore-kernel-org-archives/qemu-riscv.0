Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C2BC35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 10:43:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGGS0-0003ze-VA; Thu, 21 Dec 2023 05:38:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rGGRo-0003k3-HD
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 05:38:37 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rGGRc-0003ti-Tt
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 05:38:31 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40d22d3e751so10233565e9.1
 for <qemu-riscv@nongnu.org>; Thu, 21 Dec 2023 02:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703155103; x=1703759903; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1cgT7e6lhcwn0WzM/v6sP8+3M2uDQNBjem+V+EXl+Sc=;
 b=qa7mlUXQQO8cJ6fWU25+gtPN8/NE9gHVbWXEpJk1/QAXerYhdDll1K2mPozhqX0G37
 WaHr1rU32JuGf5c5itoU74ENvC9UuA+AOVc9YlT6FjT7kMfgAJClX7i3D8OFJvgtYtgz
 siTew2i9BppUBu+A96YzUiDV2A9fzrS4P8oLeXjHv15Emy5oG8A5KFQvdZJXWxmXbkke
 mU9okPO68AgLnMOtjojZxOOJZcVlY1rJd6rlzRwsG+ZUZxKySOQmIH/iGIsVt+f/HOi9
 oVuZwP1/Yx28cIsIPc6KHDu39fPaipsLTpjy0NHaeKSRjKfDpNA6a9e1IHIadu8EGrsv
 P9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703155103; x=1703759903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1cgT7e6lhcwn0WzM/v6sP8+3M2uDQNBjem+V+EXl+Sc=;
 b=p2IvNofKv7U3oeZOTU89kBNA+L0zf5S8xi6JbKiOmFItkFMYl36GMM9PgIqm/mVPD3
 u1Z/+1obi32l6VyVOwaSy63r8JDvBZSAN3M6sms+yMSUrYwxUuBL/5CNDwbm2nEOTvnb
 c25VVPpn+YqjYFxpls4Pr+qHv0v/xmjVyQdL7frJfIB+tcq8w0HkClIPn0MZX/CVOVy4
 PZmHew+2vZj8BKmOjQJznkfAuZJQaSbSu2SQLcbK3NWqXoNcLnci/Ztkv2IwTKOlcSlG
 k3KbfyJ9dDxkNhkKnyWJn46PgxxbVMFAQVwXZSo3I9XgvsvShTEA/JfY09hjpHNhwhl8
 DXqQ==
X-Gm-Message-State: AOJu0YxbM3jfhgCNWd3iFUVYYM6e4B5zVbIeKXP4jUCaGEJdKbKbA4OV
 uZdlyc/bdPIt5Vg4w7zZK1ML2w==
X-Google-Smtp-Source: AGHT+IHt6DJEYKfpQux8XnX/Pae/m4+RIj/y0UWX6dLA6GOiTEpo8qd26PDVFX83nnqjF6bFCABiTA==
X-Received: by 2002:a05:600c:a3a0:b0:40d:2dd9:dac5 with SMTP id
 hn32-20020a05600ca3a000b0040d2dd9dac5mr323472wmb.97.1703155103125; 
 Thu, 21 Dec 2023 02:38:23 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 fj8-20020a05600c0c8800b004094e565e71sm2824144wmb.23.2023.12.21.02.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 02:38:22 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6C97E5F8CA;
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
Subject: [PATCH 05/40] qtest: bump min meson timeout to 60 seconds
Date: Thu, 21 Dec 2023 10:37:43 +0000
Message-Id: <20231221103818.1633766-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231221103818.1633766-1-alex.bennee@linaro.org>
References: <20231221103818.1633766-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

Even some of the relatively fast qtests can sometimes hit the 30 second
timeout in GitLab CI under high parallelism/load conditions. Bump the
min to 60 seconds to give a higher margin for reliability.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-ID: <20230717182859.707658-2-berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231215070357.10888-2-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/meson.build | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 47dabf91d04..366872ed57b 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -1,12 +1,7 @@
 slow_qtests = {
-  'ahci-test' : 60,
   'bios-tables-test' : 120,
-  'boot-serial-test' : 60,
   'migration-test' : 150,
   'npcm7xx_pwm-test': 150,
-  'prom-env-test' : 60,
-  'pxe-test' : 60,
-  'qos-test' : 60,
   'qom-test' : 300,
   'test-hmp' : 120,
 }
@@ -383,8 +378,8 @@ foreach dir : target_dirs
          env: qtest_env,
          args: ['--tap', '-k'],
          protocol: 'tap',
-         timeout: slow_qtests.get(test, 30),
-         priority: slow_qtests.get(test, 30),
+         timeout: slow_qtests.get(test, 60),
+         priority: slow_qtests.get(test, 60),
          suite: ['qtest', 'qtest-' + target_base])
   endforeach
 endforeach
-- 
2.39.2


