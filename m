Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5ED4CD610A
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 16:44:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qptKY-0006gM-38; Mon, 09 Oct 2023 12:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptJs-0005Cf-PV
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:41:32 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qptJd-0001UC-O6
 for qemu-riscv@nongnu.org; Mon, 09 Oct 2023 12:41:23 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3296b3f03e5so2909263f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 09 Oct 2023 09:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696869668; x=1697474468; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xV3BG4Srg5Y6VlVNbacPBEYIMzi3RrER9K0pSz3VkxM=;
 b=eF3apVqq8Ng5x3HHsV4PHv31k7V0oFlnnjQFxUAxIQik1J+YJ+QKNCIGpYN9NRKrD5
 fQ33QxIeCAp63MS0uRFn3YFrSCbu6vCFmg2oF+8qjhAdXzPKEVrR0DifEJd0eygmdbCT
 ObHB7xvmeAn9nhDwnTU0Jg3Ujzjv3rnIcZOkJ83oXkIPPpgRhxaR+4MR2fD3b716nflr
 tkkJHz+OYpMzotjh77ufiEiG+XT9Z2NDExNMzRjZ6Flpo1REwdevtPmA/JgagtU5GuVG
 tZUpdVxjFcvb0dnXAKoO01ewqdVz/Gxsh/CYf5rtV4xnqt3ieJj1XWqmgQLEF0rXgcY5
 Mhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696869668; x=1697474468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xV3BG4Srg5Y6VlVNbacPBEYIMzi3RrER9K0pSz3VkxM=;
 b=rNczPcdAkvInnU3x84Oxfufe56XrGkivF85HdZWY4MA7GbHRNWDzL2NLCcdu0JHBlU
 efj/Its1ym540b5TffEOdSUZL0hmFQBPaK1/WZnyfiaXpv7X75BLzzs/XArYi9BOvht1
 FpUzB6Li7utplSVffmLo0UQ5rZKza3g488O4c7aJ0DdzH9ekoHlJJw5zvf74889FXkKN
 LtjbXT2QqtZ35PF1h9nQ4DEtit5n+7M7GuaJBp3WTKVXX2uh98BichhrbeN7TN0LxUO2
 4N6bMz1q/8FfkcQwQ9cxWRqG6A04nlAfApvEb+i4mX+clz+GyDnA95dLv0Sj20+ZdRav
 QAxA==
X-Gm-Message-State: AOJu0YzRi5nStMQfekCeBB/KzAa/RcAnkKbrxHztyvRab7/Xa7E+Iyes
 6WyWle/a3L5R71NfQ7Hyl0UCqA==
X-Google-Smtp-Source: AGHT+IFC51Vu8VXrrK/+1vJLgLMr+v+quykmAChEzmAYsCctp7+nGso2awQsaSJ968wZLfjo2BzydQ==
X-Received: by 2002:adf:a19d:0:b0:329:6b8e:c16 with SMTP id
 u29-20020adfa19d000000b003296b8e0c16mr7005776wru.35.1696869667711; 
 Mon, 09 Oct 2023 09:41:07 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q14-20020adfcb8e000000b003296b488961sm9530042wrh.31.2023.10.09.09.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 09:41:06 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4707B1FFBD;
 Mon,  9 Oct 2023 17:41:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Brad Smith <brad@comstyle.com>, Radoslaw Biernacki <rad@semihalf.com>,
 David Hildenbrand <david@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Nicholas Piggin <npiggin@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beraldo Leal <bleal@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 02/25] tests/avocado: remove flaky test marking for
 test_sbsaref_edk2_firmware
Date: Mon,  9 Oct 2023 17:40:41 +0100
Message-Id: <20231009164104.369749-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009164104.369749-1-alex.bennee@linaro.org>
References: <20231009164104.369749-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

After testing locally I decided to revert a5754847e0 (tests/avocado: Disable the
test_sbsaref_edk2_firmware by default) as the test seems pretty
stable:

   env QEMU_TEST_FLAKY_TESTS=1 retry.py -n 50 -c -- \
     ./tests/venv/bin/avocado run \
     ./tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_edk2_firmware

yields:

  Results summary:
  0: 50 times (100.00%), avg time 2.064 (0.04 varience/0.19 deviation)
  Ran command 50 times, 50 passes

Maybe f0ec14c78c (tests/avocado: Fix console data loss) has made it
more reliable?

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/machine_aarch64_sbsaref.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index b272053eaf..bdd1efc768 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -75,7 +75,6 @@ def fetch_firmware(self):
             "sbsa-ref",
         )
 
-    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is not reliable')
     def test_sbsaref_edk2_firmware(self):
         """
         :avocado: tags=cpu:cortex-a57
-- 
2.39.2


