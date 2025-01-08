Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991D3E7719C
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 12:13:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVUvg-0001ja-OE; Wed, 08 Jan 2025 07:12:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVUu8-0000cC-H9
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:11:21 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVUu3-0007JQ-RC
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:11:19 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d3cf094768so4755758a12.0
 for <qemu-riscv@nongnu.org>; Wed, 08 Jan 2025 04:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736338268; x=1736943068; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kYtPKP+K5TFg3ROfXNJmvA24TJ2xerIjRSKiAVxUUqc=;
 b=B1cxel3Tp6/Tj3R1VGnQLwurf5BtFl9Bs62N/xIg4PP18CPpW6z48Chg3iwrI+u91M
 ajiPd0xmGbxnDveCIpiFfE2s7l31T9PVjHFNiJjdVSFj/pVbjTjNVubp3VZKxCwrde+3
 oXVgsWwywwZ7Dj1hlpc+0rC2nzzKP609mTnv6Idv8ZHjFM/nrHabKHNrabdak/v6/Vp4
 lD/d6qjFfZgphCAr9WE0piUQHX7NA4DYvS/KWI5qHrngpu3a1llKQd/rlyVbWbY41Ugd
 TAbn+covz4ugvosX8pFpCQ7Is3xDzjXe5k78CMtyYb4E4PIE7+OL12M6f9Pc7y330rre
 UTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736338268; x=1736943068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kYtPKP+K5TFg3ROfXNJmvA24TJ2xerIjRSKiAVxUUqc=;
 b=FYClWuoaMR2kT9Zq81E5U7kqB7RJOA4SKJjXUrhFBG34uy6j2cieH3s/+2XYQ2OMLz
 l9DZH5Ldd9H3zyW/zftkVsxq3KJgXsoQcLG3sSApqZedPssGBVmMlPPSPP4cumCjljfT
 WZ3LK/yDv9XPyAu6lYnu9ufctR26ilRXF9G0kJC70X8MfwzkVhv1tByoOwztPjyxglMu
 vvR/Vo0n8SZegG+ugNoHyAXER84D4fflG9wMpIvFl+urzjeEzNzDg8PGaPKsFy+2t0yR
 KbNJOZzKQRsUbeF9PbBsdaNb2yc+Zi5JGbXjdXIWfOIUAUNsA7B4tZOsLO6yDzR34usq
 ld1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlyz45fcu/53sTVf7EYoGMcb3UDWmHFTzo0wQ6+wOu6VvrxpE+ik6dk+tUplfcrlnWTiH8fYCyWh0Z@nongnu.org
X-Gm-Message-State: AOJu0Yy1r8c2uepiD2TCcfV26csT2qapprEiu/ybnoGWGLA8383HoCMi
 TAEVaw69uwZMoYO3d1XwrSxqOVpoQQtVCfjnZLRXQU97EVre6J7PjeFDChPG8uY=
X-Gm-Gg: ASbGncumfPYfY/00c7js3JgSKPgQj/FblLAtvzyVjIUzxZbvOSuqoZTyGquQK96nVL+
 u8+wToagPns3SP3OtJjeE5kpLPF71eI3/E8Z5xtWcn/UgzKDwQ203jP16JGM9QrLRQGxiJFwczu
 mcjDTmQmsccd0H0IDKaWhzR3CFIe42D12HucGuYAdkPAwfRggdgJlNMAgZwIC0tuXWEBWeZ0kSr
 pJH8Zl/pMNrXeU7NT89sEvjnMs9GJ8iLbszgLsaynmqNX8tUwKN0vM=
X-Google-Smtp-Source: AGHT+IEeeFWH3FxWBjTqAy7V6qyfMjWBuT5AYUGlci7O2EH18QZCfNHjDBcsgyApZlQc9XGaTRsV3A==
X-Received: by 2002:a05:6402:3203:b0:5d1:f009:925e with SMTP id
 4fb4d7f45d1cf-5d972e1701cmr2042662a12.16.1736338268338; 
 Wed, 08 Jan 2025 04:11:08 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80675a49fsm25065611a12.15.2025.01.08.04.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 04:11:02 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E79FA5FB20;
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
Subject: [PATCH v4 14/32] tests/functional: update the x86_64 tuxrun tests
Date: Wed,  8 Jan 2025 12:10:36 +0000
Message-Id: <20250108121054.1126164-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108121054.1126164-1-alex.bennee@linaro.org>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Message-Id: <20241121165806.476008-35-alex.bennee@linaro.org>
---
 tests/functional/test_x86_64_tuxrun.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_x86_64_tuxrun.py b/tests/functional/test_x86_64_tuxrun.py
index 4f96139871..fcbc62b1b0 100755
--- a/tests/functional/test_x86_64_tuxrun.py
+++ b/tests/functional/test_x86_64_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunX86Test(TuxRunBaselineTest):
 
     ASSET_X86_64_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/x86_64/bzImage',
-        '2bc7480a669ee9b6b82500a236aba0c54233debe98cb968268fa230f52f03461')
+        'https://storage.tuxboot.com/buildroot/20241119/x86_64/bzImage',
+        'f57bfc6553bcd6e0a54aab86095bf642b33b5571d14e3af1731b18c87ed5aef8')
     ASSET_X86_64_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/x86_64/rootfs.ext4.zst',
-        'b72ac729769b8f51c6dffb221113c9a063c774dbe1d66af30eb593c4e9999b4b')
+        'https://storage.tuxboot.com/buildroot/20241119/x86_64/rootfs.ext4.zst',
+        '4b8b2a99117519c5290e1202cb36eb6c7aaba92b357b5160f5970cf5fb78a751')
 
     def test_x86_64(self):
         self.set_machine('q35')
-- 
2.39.5


