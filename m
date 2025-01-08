Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F44E77199
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 12:28:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVV5G-00010a-1l; Wed, 08 Jan 2025 07:22:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVV0x-00021i-Vx
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:18:25 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVV0j-0002TV-Ey
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:18:21 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3862d161947so7917786f8f.3
 for <qemu-riscv@nongnu.org>; Wed, 08 Jan 2025 04:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736338687; x=1736943487; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R2nl2q/jhmEGUG+F/0rLUrlSD8XWQpV+qDK7U0WrjiI=;
 b=Zt8VsKM39Eyz+4ncWrs0mlcpHTdqdO7jR2UNtw8yr0LYsaaRqK4g5XyrWzaa2j9C7x
 FjkCyDQ0TvBN/uBRJJl07LsCpvl5+or1aaoecYfVkNkndNjTo4D+8pc7wsEmj8H/PvBo
 vfBJ8Os0ccM5om3c+G5+W3QpQMGN2rp5V1+GAucMwqNidjue1jKrYoaMpb6P/x4ltStZ
 Q4pDtuhgMkvwmHPACnuimj3NroEF5ir4Uti2z6nGPrCxJFHu937lqwFoo011I3/Tporb
 IsXjvhZxgDz4E9o7sDsQb4vyjLx6mEvX6+RDIx19yIrGRg2EYyTBFToG7CaOblrz6p04
 VhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736338687; x=1736943487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R2nl2q/jhmEGUG+F/0rLUrlSD8XWQpV+qDK7U0WrjiI=;
 b=dp8LWNfXhlz1nO+9QXQ0Oy+ReghK1ccbuJHRo+iiOwdatGX2JKOkCu3hFwKYiUWF7T
 gk9h/p+oXODbgukBdKlP84t598hd9Dqszr1CliVyzQ/jycohI6KfYgxS5+b3TLohZUtU
 Bka3S+Z7FQmnKjCWBTM2n0b8eciKQoNPIzPkGQIWb23/n9ewel2SUEkcWMt98LlLv0xo
 VX2H/JLLRHISotCHVBWXKbDYqYZmMRT5fRdcwL8m/iLrEiP61tZ99Yc0X05L1+FiqqA2
 ezqXCzk6e2rhKmbT4dWB808p1ZkeL34NotYQ6fVDfXC1qvotgzEjqQIUPG7HZQCTDCJV
 CzJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCTNFGXIpUxcFdRbYu6D0ejKJof9zQa26x2g0nag637hgvH0ANqPPwBqepNBw6AdC7tJdl2/pZ+Ss8@nongnu.org
X-Gm-Message-State: AOJu0YwLuRX+b4rx8Pv6csvJx7Yu6F9dAgkNhGsU7F3ft0OOG7AAiUuB
 9YSrBMJ5+G2SPk++UqJzEWtsEjQ77nGONlQEsg6lJiH16HGzmZMt9VJE0jsr38A=
X-Gm-Gg: ASbGncvtcGjQ6i3iEscHOueySIIIzqe9jMBaUMdeTcKn+bj1HhYr+rymFPySeg3vNRL
 TEMIK4JWTsVMSD09fpS2Esv1QuL+COEXH5o1jXpgbO2j4xe1bAyN/XE3zVGadUoNJ+tjxCXLMEk
 WiQviyd+pABprf0x7f9wVKVWJBaj81JEjTY9x1ypyxACUwC/sXmDOuUuYJr8NtBd8VsqcNrcA9M
 /vIUwQC4peh6t0TmgfwNblD+GM89C1sy1fpJra1i45/uvyhtTuky+c=
X-Google-Smtp-Source: AGHT+IGqQsl2GPhaWoitdCIdyZtsoCpzPTjAvkULnI/gMkWCOcFqBO0gjgVi8JEbisOorHhN+M0Rvg==
X-Received: by 2002:a5d:59af:0:b0:385:f677:859b with SMTP id
 ffacd0b85a97d-38a872f7fbdmr2210583f8f.10.1736338687424; 
 Wed, 08 Jan 2025 04:18:07 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da6336sm19067545e9.8.2025.01.08.04.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 04:18:05 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E3FBB5FC6C;
 Wed,  8 Jan 2025 12:10:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <lvivier@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Eric Farman <farman@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Maydell <peter.maydell@linaro.org>, Li-Wen Hsu <lwhsu@freebsd.org>
Subject: [PATCH v4 24/32] tests/lcitool: bump to latest version of libvirt-ci
Date: Wed,  8 Jan 2025 12:10:46 +0000
Message-Id: <20250108121054.1126164-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108121054.1126164-1-alex.bennee@linaro.org>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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


