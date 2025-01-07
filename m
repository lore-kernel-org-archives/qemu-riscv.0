Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A531E77197
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 16:54:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVCp0-0004L9-7x; Tue, 07 Jan 2025 11:52:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVCou-0004E3-DK
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2025 11:52:45 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVCoR-0005qY-1C
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2025 11:52:43 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-38632b8ae71so11046558f8f.0
 for <qemu-riscv@nongnu.org>; Tue, 07 Jan 2025 08:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736268733; x=1736873533; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pqqTepJSvigFJNtOuIXqMUPxmyV0Odh55cVF5+vDAVM=;
 b=g0foVjdYTw++MT/GPLIU4H52hVLikDCWPd3aMKRM3+uQ0jIih2dVEVS5Tsv4N5jdok
 UGU5jAaqQAB8IspSyXFUZ91s176r+PDdGm+azmtjJUR4bA6JoIEM2PpeCuOX4ypBysud
 6tHGRTDWvjGPQWztVfJ09nSymaanc9VfXkq3xfMpxE4R0PbAyHRMqsbMgu6+F6jzSPRc
 +nrB0q8sHfL6yjz2vVNlleRtRGrOSfpMc4fY/lPBUkyR9lCPjnGhMXrLhoCe1bVruE90
 DYeTxC7zCcRkKEm7SyvdRWF3B+PIno7I3S05asGYq4XOXCGnlGPUdOKzbK2ndZ3qyG+a
 pyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736268733; x=1736873533;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pqqTepJSvigFJNtOuIXqMUPxmyV0Odh55cVF5+vDAVM=;
 b=Uh6jfDlXggOsBNOgj1F5V9DS0BVqeEuGxgJvRWTmi/H5kYFfmhHKMNSD930iBxe+T7
 OrpHBA6T6o2wYOqApE5QTw7y4ra7tUb9i4rJRz9GQwKxjCLCAnwDzGSMyREcY+4hhlIe
 906QzjTrqjRPY5zbw+0SdHE+VkdG0xNTr6G/Bd1Xp2CDTlsKZQEp43tUCjnWazWikukL
 9iE1tDBMH6lkBzdqpgKjTDTWdNMBx9DkyVQVfLvz8GrXvWZc+yTyf/XoTtlJ8OyLEE3H
 0l+7dODyeDIyEZXYZOrknrYjYNtG3xGGVx0QCUdsLsvVr8NIWB5BkP/L+2IWoP24uG+I
 cTig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnwoGnsez1JMwqPfxCj4bSxs/ijkzWFMeoDGkRaMCWzxv9WAoQAvN2DfTt4hPXmMfSq+wl4sUaczbI@nongnu.org
X-Gm-Message-State: AOJu0YzXxHazPVnTfZ+m7ljR9tnadgH+A9xnu9tkYrjFJ5dYiep6JhOf
 yzABevR9KHWz72JVYlF82PE1ZmgNhi5xHEKv2dWfSdegN3J0ps6W/AoTUnkjda4=
X-Gm-Gg: ASbGnctEjFomFzRzKzU2fpNQIj71mBByaEfYAzR6hMAr8QxENkN5Lo9v9vNtvzrogXr
 UWTrlktp4MxyRQlE+tgh+RPlCgW2nig/9n2QJ1vuQqL/hpAfcCqa1li8psfgnpaU/AbDNCdNutj
 vDRXUdlS6SXKoGJrZ9W1l7JZVJwtrwVOoaa4dGK1XeUEUJCkPRcTkNmt2i0gO/5IZB2kiBcyH6g
 4bwFsHHvvd78NmQE35Tq/YDvvwbYlp6flVzWc5GCdn3ghmRyFz+LPU=
X-Google-Smtp-Source: AGHT+IHC7rIXLOmwAkSbpdtxsd0O5WgbUn3UBAZ3SE5eYi51ZqGijX6iGHdPq2YiZXRqZOr7Tp801A==
X-Received: by 2002:a5d:598d:0:b0:385:fa3d:1988 with SMTP id
 ffacd0b85a97d-38a221e2f07mr53233479f8f.8.1736268733455; 
 Tue, 07 Jan 2025 08:52:13 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436dd14dfcasm19814475e9.1.2025.01.07.08.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 08:52:11 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C1CD85F959;
 Tue,  7 Jan 2025 16:52:08 +0000 (GMT)
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
 Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH v3 08/29] tests/functional: update the ppc32 tuxrun tests
Date: Tue,  7 Jan 2025 16:51:46 +0000
Message-Id: <20250107165208.743958-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107165208.743958-1-alex.bennee@linaro.org>
References: <20250107165208.743958-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Message-Id: <20241121165806.476008-29-alex.bennee@linaro.org>
---
 tests/functional/test_ppc_tuxrun.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_ppc_tuxrun.py b/tests/functional/test_ppc_tuxrun.py
index 50b76946c4..5458a7fb71 100755
--- a/tests/functional/test_ppc_tuxrun.py
+++ b/tests/functional/test_ppc_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunPPC32Test(TuxRunBaselineTest):
 
     ASSET_PPC32_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/ppc32/uImage',
-        '1a68f74b860fda022fb12e03c5efece8c2b8b590d96cca37a8481a3ae0b3f81f')
+        'https://storage.tuxboot.com/buildroot/20241119/ppc32/uImage',
+        'aa5d81deabdb255a318c4bc5ffd6fdd2b5da1ef39f1955dcc35b671d258b68e9')
     ASSET_PPC32_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/ppc32/rootfs.ext4.zst',
-        '8885b9d999cc24d679542a02e9b6aaf48f718f2050ece6b8347074b6ee41dd09')
+        'https://storage.tuxboot.com/buildroot/20241119/ppc32/rootfs.ext4.zst',
+        '67554f830269d6bf53b67c7dd206bcc821e463993d526b1644066fea8117019b')
 
     def test_ppc32(self):
         self.set_machine('ppce500')
-- 
2.39.5


