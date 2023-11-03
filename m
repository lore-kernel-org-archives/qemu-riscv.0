Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BDEC4167D
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 20:09:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qz0R7-0004R8-DM; Fri, 03 Nov 2023 16:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qz0R2-00048A-B7
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 16:06:28 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1qz0Qm-0006yO-Ip
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 16:06:28 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4094301d505so18922885e9.2
 for <qemu-riscv@nongnu.org>; Fri, 03 Nov 2023 13:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699041970; x=1699646770; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BM/WoalBWQwPuHSNHPl39Pw79pHu/OHGkHed2Wz/1M0=;
 b=EssZ6ximDOKaQznSwK77KU4i1/W2FxhR7atYhepvmg6+mf/SPMb2pQ6L5ijTC70dyO
 0cRMmaMEaSCwG9U2tZTUkX47dbJUNSQ9qb8JiR7rgb65IUwMZzpP5P+kpWf8meT941qm
 J+vIwa7Gxpgwhg7ueFYqOpswfGSLSacM9bQkaFtSZwUscX/qgXaIpkgLV8+9fGM6NPq+
 HHTokn9nH1J/zkDwceUk+A+0zBmpztcjB7KxQaZ+P1ZOU97AoIQKjbh+XQWLNtdnUf5I
 Myuwi85nh5rb/X09qxEeavPN1yYRP4EpR3emLa2KseKEMqhRtVz2C3HRPdYOX+ZPyEYR
 fmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699041970; x=1699646770;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BM/WoalBWQwPuHSNHPl39Pw79pHu/OHGkHed2Wz/1M0=;
 b=BPPPSNDL83E+KwdW6Mwo1HLYBD/D760r1e0PAqMwDd1gaisSESQDCmBbrKRBRxnCIN
 0yQcx+hQIgrLmdF+OmM/Zw7o6jZHyGFcFzQEmq+4CNbuE0Qd7EQqJAdorYnLKAH7v5hz
 tXhovKkbEk0+YgxLQOnGmCc6PPchLKSGtNwsngeBYCjXNNLDv8G1Y+YXdi+HnDhcpRYX
 yiE5SGtfh9IDEYr1ps3Qn5x1k9WodB2POfrR3TUah6ThoOg6lq3kNGqixz0ejgFwGn/T
 wUGSNJpAxeMbsfXlFMC96m/pYAKT+6vISR0VMQ9E8agCrs22ym5NfF3qfPt8CxfmDAtt
 aq1A==
X-Gm-Message-State: AOJu0YyJx3jDh9nnMr19MeK1L6P1QSR1vSDBYMwss+jTZBJrCnSGlp+x
 IdDqHBM55mm066ZCdYDoln8TLQ==
X-Google-Smtp-Source: AGHT+IEliE94OTH7Hncq1cvTOUk5H9lDwSF4rkmthVXPnQPEm7fpphVN3i9I/dzUeHyWDmu5jyJSQg==
X-Received: by 2002:a05:600c:4f92:b0:401:a0b1:aef6 with SMTP id
 n18-20020a05600c4f9200b00401a0b1aef6mr19860363wmq.2.1699041970242; 
 Fri, 03 Nov 2023 13:06:10 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c1d0700b00405bbfd5d16sm3567011wms.7.2023.11.03.13.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 13:06:08 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D4D4D65759;
 Fri,  3 Nov 2023 19:59:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Song Gao <gaosong@loongson.cn>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Brian Cain <bcain@quicinc.com>, qemu-ppc@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Greg Manning <gmanning@rapitasystems.com>
Subject: [PATCH 29/29] plugins: allow plugins to be enabled on windows
Date: Fri,  3 Nov 2023 19:59:56 +0000
Message-Id: <20231103195956.1998255-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103195956.1998255-1-alex.bennee@linaro.org>
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

From: Greg Manning <gmanning@rapitasystems.com>

allow plugins to be enabled in the configure script on windows. Also,
add the qemu_plugin_api.lib to the installer.

Signed-off-by: Greg Manning <gmanning@rapitasystems.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231102172053.17692-5-gmanning@rapitasystems.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure   | 6 ------
 meson.build | 5 +++++
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/configure b/configure
index 04f2cdd166..1129e6dd94 100755
--- a/configure
+++ b/configure
@@ -1010,12 +1010,6 @@ if test "$targetos" = "bogus"; then
 fi
 
 # test for any invalid configuration combinations
-if test "$targetos" = "windows"; then
-  if test "$plugins" = "yes"; then
-    error_exit "TCG plugins not currently supported on Windows platforms"
-  fi
-  plugins="no"
-fi
 if test "$tcg" = "disabled" ; then
   if test "$plugins" = "yes"; then
     error_exit "Can't enable plugins on non-TCG builds"
diff --git a/meson.build b/meson.build
index dcef8b1e79..b855224acc 100644
--- a/meson.build
+++ b/meson.build
@@ -3904,6 +3904,11 @@ endforeach
 
 if get_option('plugins')
   install_headers('include/qemu/qemu-plugin.h')
+  if targetos == 'windows'
+    # On windows, we want to deliver the qemu_plugin_api.lib file in the qemu installer,
+    # so that plugin authors can compile against it.
+    install_data(win32_qemu_plugin_api_lib, install_dir: 'lib')
+  endif
 endif
 
 subdir('qga')
-- 
2.39.2


