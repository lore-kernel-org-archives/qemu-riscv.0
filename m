Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17A5C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 17:44:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL5Cz-00061r-0o; Wed, 03 Jan 2024 12:39:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rL5Cv-0005pm-QW
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:39:09 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1rL5Ct-0000c3-OY
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 12:39:09 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40d2e56f3a6so4405655e9.1
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 09:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704303546; x=1704908346; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0sLk9Y6V09YT5mxoKGySQqDe7AUl7PrL/RJQ+Y1wnbw=;
 b=gxIsOFzWh6zn0hez+uEbsJ5bUiUqIo6ErnyzmnBKsBWFd4K9p1Azi4Lr2Qru3tc7C5
 u5RvlrXh3WukJLnbTTUORACUx4ZsZ9zKjiB4BBT6AEVLmb4g7bOz8+COgSmLAMO0ZhYg
 7zrpCmH75KpJlyU0rbKP9s15GXsPJmCVlrEXjO1f6d6YXc0nxTlrmIeFnjDkNWOUgTQD
 ybkNmgu9LvLFEjHTub642lxMvOREptjiC0wkDBSalCaDSQxxnSdS99Ui8AUi9uwkQ3kD
 eH1HB/n4sapgFGrgNXItj6By6ZyLsY8rgnwYvNRap+Nciq8PRbD/INszUj2ejGsGnVYf
 /6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704303546; x=1704908346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0sLk9Y6V09YT5mxoKGySQqDe7AUl7PrL/RJQ+Y1wnbw=;
 b=loerjJoSkVNqTrZxeVwNhvfYR9upkQneCkYAkTRicpfsgVn35y0W9ZXXtzAYKcl2xS
 KawGxNYmcI89pNlOPWF5O1oIDfKA6ZtTLdjae1aAqHdlsVBPUICbjezLuQ+MKgSh/v9s
 ww/0uUrlPcqnHYTu0W36TgdTbs1jSZTV+Bqj+h8vVLB2InSngH9IUBOzCR7ei0V9uhSt
 OIWVyf+2tql9MFFPQ+3topeTkHXu1Hx6ERWRiLUMGsIcPT1tuoJjkDygq5uwo3+tcQXl
 GJmzwy49n7av+XgH6BFqurJbKusBgOn2vrbrzKbnzzwcoSr8BkDmP3nQVdL40yhWvqu/
 3Hxw==
X-Gm-Message-State: AOJu0YzD55TAiRZTKkVMncrhJ6MVCpsmWOhBtPXO+ztW3bQtPHP5Zatu
 LnTb82TNjtxnm4wKX7Fu9IKpJj0lpP5QFA==
X-Google-Smtp-Source: AGHT+IGR8Qb9ZKRyeNjw27aD8Jf1B/xnmHbcoluCD13YEs3zMnsmdYYJyBx3xpWJIG1auhT+vGCdLA==
X-Received: by 2002:a05:600c:4fc7:b0:40d:3f30:a09e with SMTP id
 o7-20020a05600c4fc700b0040d3f30a09emr804540wmq.84.1704303546006; 
 Wed, 03 Jan 2024 09:39:06 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 dr16-20020a5d5f90000000b003373ef060d5sm8567186wrb.113.2024.01.03.09.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:39:05 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 298A25F950;
 Wed,  3 Jan 2024 17:33:51 +0000 (GMT)
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
Subject: [PATCH v2 20/43] mtest2make: stop disabling meson test timeouts
Date: Wed,  3 Jan 2024 17:33:26 +0000
Message-Id: <20240103173349.398526-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240103173349.398526-1-alex.bennee@linaro.org>
References: <20240103173349.398526-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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


