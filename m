Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34B1C35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 10:42:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGGS6-0004GK-Am; Thu, 21 Dec 2023 05:38:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rGGS2-00045v-N4
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 05:38:50 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rGGRp-0004Ad-P4
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 05:38:50 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40c6e2a47f6so6672845e9.0
 for <qemu-riscv@nongnu.org>; Thu, 21 Dec 2023 02:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703155114; x=1703759914; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NG0GNTBkS5OA4bLgzcXFuNl7bQt30v5WL9SIW527gOo=;
 b=iznHfq9a0du0cRV3HC677htFFZse4B2PBC8BNXAjB/AVraKF/H6oDwRDPyXXJYVvZi
 koQsfB1gb2ur9YufS8qdX2zfHf0WrknL/fVKk46u7t640L2xEFLPhYhenvUuHkvkbE/X
 JW9X1NBGY2fyp5+E+a+wKqu9tXakwwOwJ/air9YOoYteGG5T8yeZUFbqcDFnldvrbIJG
 YeshZjcR3TFVjHFUzZnzkoqhQqYqPlLJIGNa98FjtAgwo3AoK1FJIqhvhJquluUjdd8t
 kDhZeoKMjryHc2ai0eL0wg9qIlJ+/I4vbyDXNgsIQqbTqdFTPtwNbwEoEFKy9VBX1M69
 PbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703155114; x=1703759914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NG0GNTBkS5OA4bLgzcXFuNl7bQt30v5WL9SIW527gOo=;
 b=dUxb0zSGDqN1900PkykqSP3b2wSbb3rVI/9f1+8a41BHw8iwrfWk8bQUrXoR9Ow79K
 oYY02MfoMPGyhth2ox4ey2t6/ie/fas7ULiOsXM9bPnyAlOyVEmxGg2Cm8heec4XwZWh
 towCrCZQBOan74E4ayJEFgp5gcDymiAfwxNwUZut0R2p48a4Hh3acaseWGEUmBUXhUo3
 5vX4hmAxJngjAAFwCS9RelmyZauwnV5knPEYhAVsgPe4JsSBfuiFNgKdlYfo+nlcA89O
 7jtOs1scqeRO+ENz1WZ3ob/6QbsmNwgVp1vYPxCq9nlLZiOSFlQi91iafLRKd+E2mTrz
 pP3w==
X-Gm-Message-State: AOJu0YxBiReBzMRnbxU4WCmf3xpAaon4F2qQ5fB831ExUaLxLg89CuME
 YF605Pn4IhXjMvyicr14GJkL4g==
X-Google-Smtp-Source: AGHT+IHtw299z4GcZk4ReQAPdhRPfcJ81XOj4Zsroy61A+dimT3sxJq+bziNhd0DzLsBRbi1nCt9BQ==
X-Received: by 2002:a05:600c:4583:b0:40d:2e2a:18df with SMTP id
 r3-20020a05600c458300b0040d2e2a18dfmr324147wmo.213.1703155113719; 
 Thu, 21 Dec 2023 02:38:33 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 r19-20020a05600c459300b0040d128e9c62sm10647702wmo.18.2023.12.21.02.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 02:38:29 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5ECEB5F8D8;
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
 Mahmoud Mandour <ma.mandourr@gmail.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 15/40] qtest: bump bios-table-test timeout to 9 minutes
Date: Thu, 21 Dec 2023 10:37:53 +0000
Message-Id: <20231221103818.1633766-16-alex.bennee@linaro.org>
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

From: Daniel P. Berrangé <berrange@redhat.com>

This is reliably hitting the current 2 minute timeout in GitLab CI,
and for the TCI job, it even hits a 6 minute timeout.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-ID: <20230717182859.707658-12-berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231215070357.10888-12-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index da53dd66c97..6e8d00d53cb 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -1,6 +1,6 @@
 slow_qtests = {
   'aspeed_smc-test': 360,
-  'bios-tables-test' : 120,
+  'bios-tables-test' : 540,
   'migration-test' : 480,
   'npcm7xx_pwm-test': 300,
   'qom-test' : 900,
-- 
2.39.2


