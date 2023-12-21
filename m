Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B75BC35274
	for <qemu-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 10:52:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rGGav-0004zg-Tl; Thu, 21 Dec 2023 05:48:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rGGal-0004io-BO
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 05:47:51 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rGGa9-0007NH-7H
 for qemu-riscv@nongnu.org; Thu, 21 Dec 2023 05:47:51 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3368b1e056eso254266f8f.3
 for <qemu-riscv@nongnu.org>; Thu, 21 Dec 2023 02:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703155627; x=1703760427; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0sLk9Y6V09YT5mxoKGySQqDe7AUl7PrL/RJQ+Y1wnbw=;
 b=l/GHXLTi5BaMXE3URvo3WSFhVISs5dabLukqHCPcjioGnzOBC3N1x87ivjLk1ovitt
 H8MKDBz8GnqOIttYAvS79cOyo1gY8ccQ52SxwyHUde7JvjG/Rf8mgdXY4KD0gV8BgC0O
 4RIObDBZ0OztL9ecfwdk6KY9rJpf32zk866BquXZX3GIh/LIwzG3/G1fDzFGbymvv3rI
 7DJeo43/ptSLTOn7SL8X9APgIHzgp9SIkQx+XeIq8eTwIf2G0bPtz+MIOmKAb1VHn48s
 PYa4RShlbJ0ph72XKiABAbdSfSOsAqvtaAj5un3UVL07Qn9WJFL5XvuPmgngpKSjMZqp
 mrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703155627; x=1703760427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0sLk9Y6V09YT5mxoKGySQqDe7AUl7PrL/RJQ+Y1wnbw=;
 b=bb+/mFr/7lYFueoZ9HPckFDkagdX+lTxe/aNwVa99DpasXsaXoydE76rvko05IFQx7
 QwLF4dpJbwdKrquBscsefI5IOC0vAzgWvM2X7MFYywoDMlDeta2PYSNnWBh5tFuP8eOe
 P5/YBbHjmtsVWoWpxvpKs4A22sk3gDio0hCNpFPjo01b3u+oiUO0UJ0yyd8yOoCu65I7
 rqAwV96bW0g0B0vOr/IGjwkttubchxqWbnHlg4YNXVq6jsIICaF5LgKHkS72VCPupjYF
 Syd2ZAOBbBHFWCOaycTO0qSK76mO8HD5vFfCEFjWpNdjK92KTA62kvkqwZc8OorIdIv0
 pfcw==
X-Gm-Message-State: AOJu0Yw2yn/QLCOsyrVICIi79kg2twse3RzmdQFQECuX5ryyZWjDkqhY
 qgPVdAfYTQMAg0q0YgAmKAwoOQ==
X-Google-Smtp-Source: AGHT+IEh4A/ofvHjjDxGae4dNp01ycAbrgSKgNLymJ1Ha3Ry/GdnF3Tf0BsMFDRp8ivuX9KZRRwyWg==
X-Received: by 2002:a05:600c:1682:b0:40c:3984:4977 with SMTP id
 k2-20020a05600c168200b0040c39844977mr650705wmn.174.1703155627469; 
 Thu, 21 Dec 2023 02:47:07 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 b2-20020a05600c4e0200b0040c440f9393sm3526519wmq.42.2023.12.21.02.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 02:47:06 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id CEF355F8E3;
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
Subject: [PATCH 20/40] mtest2make: stop disabling meson test timeouts
Date: Thu, 21 Dec 2023 10:37:58 +0000
Message-Id: <20231221103818.1633766-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231221103818.1633766-1-alex.bennee@linaro.org>
References: <20231221103818.1633766-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

The mtest2make.py script passes the arg '-t 0' to 'meson test' which
disables all test timeouts. This is a major source of pain when running
in GitLab CI and a test gets stuck. It will stall until GitLab kills the
CI job. This leaves us with little easily consumable information about
the stalled test. The TAP format doesn't show the test name until it is
completed, and TAP output from multiple tests it interleaved. So we
have to analyse the log to figure out what tests had un-finished TAP
output present and thus infer which test case caused the hang. This is
very time consuming and error prone.

By allowing meson to kill stalled tests, we get a direct display of what
test program got stuck, which lets us more directly focus in on what
specific test case within the test program hung.

The other issue with disabling meson test timeouts by default is that it
makes it more likely that maintainers inadvertantly introduce slowdowns.
For example the recent-ish change that accidentally made migrate-test
take 15-20 minutes instead of around 1 minute.

The main risk of this change is that the individual test timeouts might
be too short to allow completion in high load scenarios. Thus, there is
likely to be some short term pain where we have to bump the timeouts for
certain tests to make them reliable enough. The preceeding few patches
raised the timeouts for all failures that were immediately apparent
in GitLab CI.

Even with the possible short term instability, this should still be a
net win for debuggability of failed CI pipelines over the long term.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20230717182859.707658-13-berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231215070357.10888-17-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/mtest2make.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
index 179dd548718..eb01a05ddbd 100644
--- a/scripts/mtest2make.py
+++ b/scripts/mtest2make.py
@@ -27,7 +27,8 @@ def names(self, base):
 .speed.slow = $(foreach s,$(sort $(filter-out %-thorough, $1)), --suite $s)
 .speed.thorough = $(foreach s,$(sort $1), --suite $s)
 
-.mtestargs = --no-rebuild -t 0
+TIMEOUT_MULTIPLIER = 1
+.mtestargs = --no-rebuild -t $(TIMEOUT_MULTIPLIER)
 ifneq ($(SPEED), quick)
 .mtestargs += --setup $(SPEED)
 endif
-- 
2.39.2


