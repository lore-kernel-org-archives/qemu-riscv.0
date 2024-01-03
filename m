Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFFDC3DA6E
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 17:38:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL58I-0003nw-Uo; Wed, 03 Jan 2024 12:34:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rL58D-0003gE-7u
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:34:17 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rL57u-0002SB-T0
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:34:16 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d5b89e2bfso67170405e9.0
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 09:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704303237; x=1704908037; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c7IelmqBfCUiQPJ1PO4YXHkz0msSivdOvYJRQon3tbw=;
 b=t4Y4nIOG4CT6X5md/eVUBpLUW4iRQq8yZYS3P2LnXVv79rByvLf4Inc4gNPIczvyf7
 GwP265SuaTRrB+N5MZ+Fav7H2l+IxbDtcTXJpG4XRjssy/dpWWX/8Lod/6s2BYvy5Z3q
 3lYE7mYDjpVTqLbAxNyZtSxYzTBHFttDQ625sndS5LLORMBGedIZxL1KMusV0HEwmnAw
 elQkZEm8VxBFjXWPEjWAyNouz7NDDPlPWMXeC3CSrkA3yZPySdCOi0B3GmJY6EYNqcJp
 ZL/4AyoPsjM6/zUQgL4ynrWdUbAbLGXAWTByZkjzf9wg88Q/4eQVEyIsL/tFzJ14iV4u
 TVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303237; x=1704908037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c7IelmqBfCUiQPJ1PO4YXHkz0msSivdOvYJRQon3tbw=;
 b=NJqbAMpvSPi1Pj398v53Tu1MJPNliyDxC0mN1B+aMXDO4MZy8cyg40ssfwHa4eDuhs
 csa6mLHupgbXouhuxyy4T/VaB1W/4iqdnx7kP74Qzna8eGrPPL15y0gxBVxtoNvBfK+x
 qGdrzQp3R7WFkY8d1elCl9gO1RCmkOORb553TGCI4a3boBspm4BdZ8r0J9NK4mniOPbq
 G0ESfbUY8hR4o/49PTkb0smA+UWRevXglOh4HQn51R2OVIsklwLWx1kYgm+PYGspGDdq
 rcKNtxFHsFUmUxOEn3YubJVXYxZdAdLtHkTHDVL6awBxWbHYUa2k8drgUS/nJGTaZVXb
 qaCw==
X-Gm-Message-State: AOJu0YyCySHI339imtiB7kEBdbmpVBqC+HzvSF3cxxIFmO+KlesciPfU
 rsHOT5ONWM7aJW0TWoCK47cYeWx3VeN3HA==
X-Google-Smtp-Source: AGHT+IESFF9+b5o3/ublAo/jcBFbD7HOqmfsD+g0Mklv3iiREEvayIPCsKKh6n9Wfcqv3HzjL9ElUA==
X-Received: by 2002:adf:e8c2:0:b0:337:5131:4d71 with SMTP id
 k2-20020adfe8c2000000b0033751314d71mr1857wrn.40.1704303237615; 
 Wed, 03 Jan 2024 09:33:57 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 t18-20020a5d4612000000b003367bb8898dsm31262714wrq.66.2024.01.03.09.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:33:54 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 26B495F93F;
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
Subject: [PATCH v2 09/43] qtest: bump test-hmp timeout to 4 minutes
Date: Wed,  3 Jan 2024 17:33:15 +0000
Message-Id: <20240103173349.398526-10-alex.bennee@linaro.org>
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


