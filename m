Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77287E77188
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 16:24:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tNwok-0000gT-Ql; Wed, 18 Dec 2024 11:22:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tNwo6-00089N-Bt
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:21:54 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tNwnk-0006sk-Q9
 for qemu-riscv@nongnu.org; Wed, 18 Dec 2024 11:21:53 -0500
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a9a68480164so1087743166b.3
 for <qemu-riscv@nongnu.org>; Wed, 18 Dec 2024 08:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734538879; x=1735143679; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nxAQFaJXoc/P8ebO9Xx4HWpXX3GuRaIneijbgyMKrCk=;
 b=ee3bgqhDE3PhuMQIN+V7YsLhtLCdcXQs5x/wDDGp18LHKaja9+ySJmKST23aP8v7A0
 BmDu1OZ1bvX4xIu3njulVEWVW8Lxe+jsSnH/7gh9pzyzy0VJlMDctXpRX5NQD7aq7S4n
 ZzdP57jai4OwfKBQ+gI0PD/O6TFOHQQygCar2Z9MxdX1dc5+oEab72s476bWYXFwp8WL
 0ODeFO8j8jLyQsaGF2iPpy/DnTeUdJ4Y/Jea2MKL8l0HQO9rVXNaCeT/G9ImLn4LSfnn
 elNjVzu+0QlCUXEmOkl6NPuP+ThbZ5DqquqtmRAJgiUCQgoytAOWq2AY9qE0blVBTboC
 6zUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734538879; x=1735143679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nxAQFaJXoc/P8ebO9Xx4HWpXX3GuRaIneijbgyMKrCk=;
 b=kNY0X85ikEOafQTaSBJP/sVs7lSa8jy8nFuQN5Ugwg6P9LCrQ9oDWT0T8T8wZQmgMa
 72jtG/wfIbyWp4KeP8ctubVoR44cRwHRl7SeRRI3mgBQZaU7IVY06UIb66xvHGjZ6XwW
 A7xVhZaDt9lApSbKi4aNpYXtabo9AmNlpDD6hGx8/zOLfFgGsCQeg/Sybsf3LvaksMGJ
 Qu2teoQFRWkJHJuKYEovvNKOL+REIFmXSKyJCE1Lmz9YYdXGpqYbuGcb0e/B3WzyQVyA
 qQQ5z9qF+n5ZpnIWsf9wP6hdy2gaaBK/RmvUedPgeCODtI2JeGhJLRU62ICgI+vkxrNm
 SF9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU9iei7tQ0J+ofoz6Z3xK7tsR5/bXTnKrgBhwSi9dscaYy/mitjbTyJ2mJ7uvm/C3dHYyRDQJPIKx1@nongnu.org
X-Gm-Message-State: AOJu0Yw86/UoQqkXk6qI7QvRQYto2HHViqNngs798DiCxv1dDFjGqkc4
 geAYMimLKro5ATWnG1iKxGJNgk1ndTY4lcfLd5uNE9WOUHp7V5fCVZO7m42KHLE=
X-Gm-Gg: ASbGnctyfSeUMBnxlWqzCs8NajoxfYOYiyPE9E2zdfUgQGcxYXV/HOSI/hD9oL+1y8d
 N6pDBFjBJW5qIO8UZbhip1HJpQ9MH5K4wsMMnAkgkyF/kNIhJZ41L+CIhpN/+8oAzYg0E2YMQDc
 MgmPRvkRXHNB/FyikOlOTBP63xc5WLE4n5PCcU7pJWnCFk6im2dWhVWclLoyJHcjbsSqbGAmaeY
 9vQjuNmjf5lJnKAJD5QrMUdHrL8zHBsK4jLKAL4kWHn7Jj8tIGrN4s=
X-Google-Smtp-Source: AGHT+IGgaTwJUux9q8sBUuMnle1GDRzn+BhwZEPamzK9w1wgelKWNlxScrWnl/3I7O4LbI6gD+7jrw==
X-Received: by 2002:a17:906:d552:b0:aa5:43c4:da78 with SMTP id
 a640c23a62f3a-aabf4904571mr291370566b.51.1734538879017; 
 Wed, 18 Dec 2024 08:21:19 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab9600611csm574999266b.34.2024.12.18.08.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 08:21:15 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 317A660B9F;
 Wed, 18 Dec 2024 16:21:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Fabiano Rosas <farosas@suse.de>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Weiwei Li <liwei1518@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-arm@nongnu.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 21/27] tests/lcitool: bump to latest version of libvirt-ci
Date: Wed, 18 Dec 2024 16:20:57 +0000
Message-Id: <20241218162104.3493551-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241218162104.3493551-1-alex.bennee@linaro.org>
References: <20241218162104.3493551-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
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

We will shortly need this to build our riscv64 cross container.
However to keep the delta down just do the bump first. As ccache4 is
now preferred for FreeBSD to get the latest version there is a little
update in the FreeBSD metadata.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/cirrus/freebsd-14.vars | 2 +-
 tests/lcitool/libvirt-ci            | 2 +-
 tests/vm/generated/freebsd.json     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/cirrus/freebsd-14.vars b/.gitlab-ci.d/cirrus/freebsd-14.vars
index 0a7ac5e0e1..0997c47af5 100644
--- a/.gitlab-ci.d/cirrus/freebsd-14.vars
+++ b/.gitlab-ci.d/cirrus/freebsd-14.vars
@@ -11,6 +11,6 @@ MAKE='/usr/local/bin/gmake'
 NINJA='/usr/local/bin/ninja'
 PACKAGING_COMMAND='pkg'
 PIP3='/usr/local/bin/pip'
-PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk-vnc gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson mtools ncurses nettle ninja opencv pixman pkgconf png py311-numpy py311-pillow py311-pip py311-pyyaml py311-sphinx py311-sphinx_rtd_theme py311-tomli python3 rpm2cpio rust rust-bindgen-cli sdl2 sdl2_image snappy sndio socat spice-protocol tesseract usbredir virglrenderer vte3 xorriso zstd'
+PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache4 cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk-vnc gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson mtools ncurses nettle ninja opencv pixman pkgconf png py311-numpy py311-pillow py311-pip py311-pyyaml py311-sphinx py311-sphinx_rtd_theme py311-tomli python3 rpm2cpio rust rust-bindgen-cli sdl2 sdl2_image snappy sndio socat spice-protocol tesseract usbredir virglrenderer vte3 xorriso zstd'
 PYPI_PKGS=''
 PYTHON='/usr/local/bin/python3'
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index 9ad3f70bde..b6a65806bc 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit 9ad3f70bde9865d5ad18f36d256d472e72b5cbf3
+Subproject commit b6a65806bc9b2b56985f5e97c936b77c7e7a99fc
diff --git a/tests/vm/generated/freebsd.json b/tests/vm/generated/freebsd.json
index 3cb7fb7060..81fc38d798 100644
--- a/tests/vm/generated/freebsd.json
+++ b/tests/vm/generated/freebsd.json
@@ -13,7 +13,7 @@
     "bzip2",
     "ca_root_nss",
     "capstone4",
-    "ccache",
+    "ccache4",
     "cmocka",
     "ctags",
     "curl",
-- 
2.39.5


