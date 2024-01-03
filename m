Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B20BC4707C
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 17:36:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL58F-0003iF-Hk; Wed, 03 Jan 2024 12:34:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rL584-0003Wx-Fe
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:34:09 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rL57r-0002PV-Ig
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:34:07 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40d894764e7so25059355e9.1
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 09:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704303234; x=1704908034; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W+Zw2YkajEPYChe7VczIaT3yCibcEp4TlrDptH8Gvrw=;
 b=OFH4IgoAjq1Akam95na2SHI3Py5H7YvNiL7C4E+d0vlv+nPiWU6WVjZAli1XkcxW1L
 IdEHbsvF6VSZRqcukvhoLZUILrfXSJMfFwnJIDHWklrItG6o2TuNxYX+3H97qWDnky5O
 DjOoKhu2GNbKzObhAcyC2gHf7JCcDohhDGnuPkre/nZyMj2IQd88Oj3kOG33/mICbmIO
 t0MY6xXRm6Ksj7UIqWv4BTuKna5S9Lo23XIuDR8qn0o6Pj8ibc0JjtfnjRMeYkPdKIUP
 ifbjOi05F5eArD7UVT7V8YVRLtONVGrYAi/4dluUrbq8dbNzxTjay5SeaTpK6W6NssGc
 SDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303234; x=1704908034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W+Zw2YkajEPYChe7VczIaT3yCibcEp4TlrDptH8Gvrw=;
 b=wiHOul349Edh30sBADs9P2KZC/9gTjh+fbopmEy0bkp6zfn9wVwofAMMLHhsj2YOWt
 WKLmKKDsco4SNhcVWk1Na1niixhOq6g/q8zTb11iLp6iiubQw0aY071J27HS+y1GPbqj
 fqKNqoGQX/hVUSElbYd4wp1au8Vt5/vDyJmuPfRenkwoQliSLTGXB/0DR840lrxOfls4
 PyLdZPQI63jEyEOl23mvu4Ui0FuzCUHoXpDOY7JWFGzZV8HJ/ODAN+0UUzQJujlmiH0z
 uVaXCJfArcmuypzeOJDD30Ksb+5+cVYeCMB6CsKwp4+mOLtfp6yFwpqCAbbwOCRjNIya
 mpGw==
X-Gm-Message-State: AOJu0YxZBfXOG1WE4hV3PjZVzroeP6cIb5NNdySBOXjJYMgASuSuRLUT
 E4xeoco9L7BYu7uT+eLNMHgTAF1/C0X1mQ==
X-Google-Smtp-Source: AGHT+IHJAM/Ysaat03yPO0/Jg6Y5f2vvi2xxZpKY9OBoQnPldlvT9O3mxmIliH0RHJ++gB0qw/aiPw==
X-Received: by 2002:a05:600c:511e:b0:40b:3e23:f0a0 with SMTP id
 o30-20020a05600c511e00b0040b3e23f0a0mr6942090wms.4.1704303234129; 
 Wed, 03 Jan 2024 09:33:54 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c350f00b0040d8810efc9sm2942787wmq.17.2024.01.03.09.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:33:53 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D8B9B5F93B;
 Wed,  3 Jan 2024 17:33:49 +0000 (GMT)
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
Subject: [PATCH v2 06/43] qtest: bump migration-test timeout to 8 minutes
Date: Wed,  3 Jan 2024 17:33:12 +0000
Message-Id: <20240103173349.398526-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240103173349.398526-1-alex.bennee@linaro.org>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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


