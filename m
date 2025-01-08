Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E1BE77188
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 12:17:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVUwl-0002dv-Tl; Wed, 08 Jan 2025 07:14:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVUuD-0000fX-RZ
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:11:29 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVUu7-0007En-3Q
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:11:22 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d7e3f1fc01so5737814a12.2
 for <qemu-riscv@nongnu.org>; Wed, 08 Jan 2025 04:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736338259; x=1736943059; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9FzFnlzkuRqAIG729x/b7511sIkBqkjnI6qfjXVG1TA=;
 b=Uz/VqdF3l9ZIITHCMeXwS6eS18FAxoaObgZcSkGiZp+SRwo+KJZ6p9Jusw+UeUxE58
 U+yUl/lL/SspG2+4SiANddwgyhn6iRXwPrLmH3qV/r12yPVAmCXUrrmtvYpB7Xg0Knej
 7yUnedTcJ6p1gM+ly8KAjVSB66dnuwbXtvOVP1ZczEnyA5K1G4vZGg/BAcIi8FDFLWQs
 qn8z2AbIs+9sjDAPi2DLYzNW+Q7l50bjLdm4N4uss8JyDKtn2Xog2ZFLN27qVSJwyBqC
 CoQvGIJu7FSm4dS01jrzjvbQm8A1t2ZuObGYNKvAk4rbL6q2gV7a4wwFNooZdCkmO6CT
 XliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736338259; x=1736943059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9FzFnlzkuRqAIG729x/b7511sIkBqkjnI6qfjXVG1TA=;
 b=DqEX/bA2ZmrklrDG+zJZO8Cw6scNTgDFRRh6dETKUy6j1QcXsY/SKKIgffcTvFjnY+
 M7uG4BAM1Uo7ACOwz3F433QH6rVgoC/YOIZE4Md4ifDAhUVmiuK+vg7KaA9xv245t0z3
 sCEDKcpNuFy1UuDKPN+3Imu0mYnzML/ygXrP2B+rZ2lEi105bCFGxN23udfvH88f2xsp
 n7PZb34+x3wigMj4pLcR21I3mHcXcI71h/cJQmblZGhjiM83bwVOSPLBrbJvBhh46z1N
 seZSLCn7kr3yQsqLIp4tyL2qCZdiQwKaxG75Q+GfOU+gaAdomxp7tqD6V58v8c3sI0uR
 bihw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxOsGHDoew/cjOLQnfmaKpk8jpeCinTtRmsxA5rQ33TzflF0GrrOLEaLmW3i29Q4zvT4MY5ZMCFOKy@nongnu.org
X-Gm-Message-State: AOJu0YwAYoYEXsXhQBXW84UOqAuqw7wpyJG1bLCpgJgAqVWl2u3mvl6Q
 GJFSB162ua2AwYHfUjs0+DhwXuFy0W/hqFSitiLb9gAWlaaoCpC4eOOf2y7O1ec=
X-Gm-Gg: ASbGnctCtIfMTGFJl919UbEaaZFTyX4bsgpj5hJ4tN8rz/7UqGtyhFRjncI0YpsUla0
 bxLMZK+OOx+0aUEvLD/I86pJ14GSBEOA+6AoJgSiu5edeDv7e6R+X8wS7wmEHyNg6Z+qZ0Ju9jR
 VV/39DphTcm41tMmwzbqmvCbw2B+ZzwSDEeK8EIBcVuJBDXUxqWr9jaMdkSGzBF/Fr6JmuH+c1m
 lptz4BgOSLoBHt0Y1XOZHsWlWUS9wpmxxaFBPRKAVoHoicP8jVNbdU=
X-Google-Smtp-Source: AGHT+IFFw8wK117zL9VY7uzxo0iTFddD3/yDIlS3wKTDFnrJ+I8CgaLROBxO7E6EB2QtP5j5wT8pYg==
X-Received: by 2002:a05:6402:5241:b0:5d0:f904:c23d with SMTP id
 4fb4d7f45d1cf-5d972e6e094mr2355688a12.28.1736338258968; 
 Wed, 08 Jan 2025 04:10:58 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80675a535sm25346850a12.6.2025.01.08.04.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 04:10:57 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 262415F935;
 Wed,  8 Jan 2025 12:10:55 +0000 (GMT)
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
 Peter Maydell <peter.maydell@linaro.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH v4 06/32] tests/functional: update the mips64 tuxrun tests
Date: Wed,  8 Jan 2025 12:10:28 +0000
Message-Id: <20250108121054.1126164-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108121054.1126164-1-alex.bennee@linaro.org>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
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

Now there are new up to date images available we should update to them.

Cc: Anders Roxell <anders.roxell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20241121165806.476008-27-alex.bennee@linaro.org>
---
 tests/functional/test_mips64_tuxrun.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_mips64_tuxrun.py b/tests/functional/test_mips64_tuxrun.py
index 54af1ae794..0e4c65961d 100755
--- a/tests/functional/test_mips64_tuxrun.py
+++ b/tests/functional/test_mips64_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunMips64Test(TuxRunBaselineTest):
 
     ASSET_MIPS64_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/mips64/vmlinux',
-        '09010e51e4b8bcbbd2494786ffb48eca78f228e96e5c5438344b0eac4029dc61')
+        'https://storage.tuxboot.com/buildroot/20241119/mips64/vmlinux',
+        'fe2882d216898ba2c56b49ba59f46ad392f36871f7fe325373cd926848b9dbdc')
     ASSET_MIPS64_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/mips64/rootfs.ext4.zst',
-        '69d91eeb04df3d8d172922c6993bb37d4deeb6496def75d8580f6f9de3e431da')
+        'https://storage.tuxboot.com/buildroot/20241119/mips64/rootfs.ext4.zst',
+        'b8c98400216b6d4fb3b3ff05e9929aa015948b596cf0b82234813c84a4f7f4d5')
 
     def test_mips64(self):
         self.set_machine('malta')
-- 
2.39.5


