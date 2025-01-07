Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73421E7719A
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 16:55:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVCqP-0006uF-Vh; Tue, 07 Jan 2025 11:54:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVCpX-00057X-Td
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2025 11:53:25 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVCoZ-0005w2-RG
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2025 11:53:23 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43635796b48so95547445e9.0
 for <qemu-riscv@nongnu.org>; Tue, 07 Jan 2025 08:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736268742; x=1736873542; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PdsXyF3OC+6k01wdvpRGDBTvPRZa71R2EiA5i0mTRfY=;
 b=nMYn7GTQCb9bdsHUmcrWHZcORIqdTlR7MrKlA3FdvPPhlTGfhkzusPTXXiQ1ib0hCf
 s1N/ENcIHoLTs1gS8b/YUB6ZVU8aCmzGGtOCLmyYXcavpyT9NOBf8Erq9HP60XIweqqI
 QNnqwTuN1d9VTzcexgLvCRLlEF52iOazvsqntbwJ7m2aWGkrBwO+FicyINSV8BTeQbnu
 IWD1uQ/3JazO2LbrXYO/SjBwxvQMDHglARzfpXwrTzX+gWnff8/6ksyJ9pp34D78IDjB
 gpF5n8oHrazy3lE0UXq33QkobVZY/2MJj3r7Y0DTQcN+KyPIEYJJiMfg9uZ8HE2nRJ1s
 bpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736268742; x=1736873542;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PdsXyF3OC+6k01wdvpRGDBTvPRZa71R2EiA5i0mTRfY=;
 b=tC6a2r/sLKZwJeNiKAdlMYchnlTQ4q+yqbGSsAIqc/+7MKhP+tJIvcIXrkymb0Cqhd
 bxyloOFJPBwTTal1QwNCfX2EHkJkF7C79nGMTiUE99AgRdoJgG5JSb0ZeOOuArrKuRM+
 3aFYUGboJOYFoQQ0Xb1SZPLNhEubQti9rSo+WRnoXLMmmxhP2x68NUMuuAqKWe5J2Uu0
 DFhIuoiG1Qnj7TglIxOdRTCsfIbu0BanEWWF6GkH5rCkJr5eFBU9ocTYpEqggrpbYd36
 5xYAKT9Khl/rdNDR08Q6nqXEbiQ0gHV2i8k+sv+n2qKmMozYStQn5K1TwDzsQesK/zWD
 Bbvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyURS5o+4ExAFNd/x66WxlxgGoKCgChogb5TZijs49M6OXO1WTjP9CpdGNudvpzH7PBim01qQHQIcJ@nongnu.org
X-Gm-Message-State: AOJu0Yz8ijmRpCeDGN/zv0xrC8qqNXEvTGZDKBcFQCl6gqWfdHTNu2t5
 TzWUSrSEkIOZ2X9WKqtxmypxtj845f+jE88qvCZhFNkKwhABbC8hP21u5M0Mk8U=
X-Gm-Gg: ASbGnct8oiPC/llTgFbm9pQSHEWJt4ZVxaURGqlv6rr4ly24JjLx82HktfDSZ3mkPLy
 F2kU+GvLWCZzw7wzrh0rVFhdNF9+Db1idPFSQI5XDVyQcv1kToZvMDy9nDwfcq2iWvLiQP0Fiih
 zJlVW6zBmp1ZtyLFm0muTmFSWVeLriLmvAEgv5fQv1zs2hmPaD2Ix1Vnw3GycM1AttverK+bG0a
 wM397WUwov84fRArXnwBeEqeGaXyWYmMuJCFhR0ri22TzrcVaABU7c=
X-Google-Smtp-Source: AGHT+IEN/9AzSBRjuak9xErtOMyiDoVA1EbvFTKgsWZtKXTJnq6bdiMW0XiLttaVQc0w9IFA24s0Pw==
X-Received: by 2002:a05:600c:3550:b0:435:1a2:262a with SMTP id
 5b1f17b1804b1-436dc1c20b8mr33295065e9.3.1736268742341; 
 Tue, 07 Jan 2025 08:52:22 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b417afsm643187885e9.36.2025.01.07.08.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 08:52:20 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7A69B6030B;
 Tue,  7 Jan 2025 16:52:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Nicholas Piggin <npiggin@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-riscv@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-s390x@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Fabiano Rosas <farosas@suse.de>,
 Weiwei Li <liwei1518@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-arm@nongnu.org,
 Li-Wen Hsu <lwhsu@freebsd.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Eric Farman <farman@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v3 27/29] pc-bios: ensure keymaps dependencies set vnc tests
Date: Tue,  7 Jan 2025 16:52:05 +0000
Message-Id: <20250107165208.743958-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107165208.743958-1-alex.bennee@linaro.org>
References: <20250107165208.743958-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

I was seeing failures on vnc-display-test on FreeBSD:

  make vm-build-freebsd V=1 TARGET_LIST=aarch64-softmmu BUILD_TARGET=check-qtest QEMU_LOCAL=1 DEBUG=1

Leads to:

  qemu-system-aarch64: -vnc none: could not read keymap file: 'en-us'
  Broken pipe
  ../src/tests/qtest/libqtest.c:196: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)

which was as far as I could tell because we don't populate the
$BLD/pc-bios/keymaps (although something attempts to symlink
qemu-bundle/usr/local/share/qemu/keymaps/ to that dir).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/keymaps/meson.build | 17 ++++++++---------
 tests/qtest/meson.build     |  2 +-
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
index 0bd8ce0077..a79a09b276 100644
--- a/pc-bios/keymaps/meson.build
+++ b/pc-bios/keymaps/meson.build
@@ -39,19 +39,18 @@ else
   native_qemu_keymap = qemu_keymap
 endif
 
+keymap_targets = []
 if native_qemu_keymap.found()
-  t = []
   foreach km, args: keymaps
     # generate with qemu-kvm
-    t += custom_target(km,
-                       build_by_default: true,
-                       output: km,
-                       command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
-                       install: have_system,
-                       install_dir: qemu_datadir / 'keymaps')
+    keymap_targets += custom_target(km,
+                                    build_by_default: true,
+                                    output: km,
+                                    command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
+                                    install: have_system,
+                                    install_dir: qemu_datadir / 'keymaps')
   endforeach
-
-  alias_target('update-keymaps', t)
+  alias_target('update-keymaps', keymap_targets)
 else
   install_data(keymaps.keys(), install_dir: qemu_datadir / 'keymaps')
 endif
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index c5a70021c5..f75c1057a4 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -383,7 +383,7 @@ qtests = {
 if vnc.found()
   gvnc = dependency('gvnc-1.0', method: 'pkg-config', required: false)
   if gvnc.found()
-    qtests += {'vnc-display-test': [gvnc]}
+    qtests += {'vnc-display-test': [gvnc, keymap_targets]}
     qtests_generic += [ 'vnc-display-test' ]
   endif
 endif
-- 
2.39.5


