Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5C0E77198
	for <qemu-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 16:54:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVCqD-0005wU-R6; Tue, 07 Jan 2025 11:54:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVCpH-0004gS-5x
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2025 11:53:08 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVCoV-0005sm-1X
 for qemu-riscv@nongnu.org; Tue, 07 Jan 2025 11:53:06 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4361b6f9faeso95455155e9.1
 for <qemu-riscv@nongnu.org>; Tue, 07 Jan 2025 08:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736268737; x=1736873537; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/WD+OCh9xieXyi8aUL7na7hMYPj/U0GHInutd7eRNwQ=;
 b=Fe6k71WkDyNRu0QMhKy9KaJnnFseJJPpZBg6dVDvyLxwc3OHm/bIMYBBejd7UvS9Tx
 notWbyoxAZFGhI4iDFLgBTunn3ZFygNx1UWCjelZ+adGQfVkvoatOw1q+yXQR7u+mCW2
 pUxZ4aVhIhFu54pjXIDf2iVD6fvYS9FFqetvqwlfBJZLjI8FAVc4icDgquXR5bQUEQWc
 c16dWj+Na/7T9X93Lc/3Rb1JeMdNgBxH3CQ1zw9RFgTmngzl4zJcsSkPGo5EObcBx/Ol
 ju9U0FgDVvCI+WMgnvnKhavDRZVmSq0YK2QxgCIImaq1cHI+CnLhFB4wJY+LVwbmEjJT
 7tDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736268737; x=1736873537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/WD+OCh9xieXyi8aUL7na7hMYPj/U0GHInutd7eRNwQ=;
 b=Q06Mw5r/vLI+54Pi7Ua6ONbAb68Q83kK3RbLS+Xq2sajX8LArSxF5VQoCamuiXa3Zf
 NEuoLVF6mYpSUku8eRrpNKW6lZJpPNWM8fcrJU+pCX0HlRlHjm72ItGjAqsAXHyJgDnc
 NPP6jEfnXHgQyJY34P6O7X+2K6B23JSqTY8YyKzdB9xiyYGRFbgGMLPvp0KYZmuyV3af
 v+i1JyHwExisTt1UyDqgBNR43nD+pvrCsIP3WWtcptyg290zDi4lKTq+a4AEXfT49ev1
 34ngfDYDTETW7uvQqgWVb3degtXLNU8zEM4OzttUGSM9+RHwHdUjY+1INo0uw/RKQukF
 KLzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPKnyf9G2URD36i1dTbwfS6Y+KwNmauPQpWkoVHKrsP+ln0e1SSayC6S1wCXSyOe4OLNTJtIDMReWW@nongnu.org
X-Gm-Message-State: AOJu0Yw2v5xQCUieAgrSU7UIQA1yXU4xHW3R7Ey7xQ7kKF6oLGI8yiod
 hoDt+IGrgYu3YGTxjp840UdP5wGqubMYYwt1WxWY7afca33fQGJXFFqmFWlRdcE=
X-Gm-Gg: ASbGncvAwjZHPNhm9x/j0xkn7I/GUp3U5C+yJdFNOtjKxrjOI5gDbfOwi86lAgA8jbk
 ifvI61ftdn7UvO9udj5dXfUvN87rlX0JA0/hKi2FFtvMp37nKJmT0waxHCQ3XfDaMdtHeGsJenH
 Yfx88rq4SS+4cPq6s2O/CzOiX0pzrbwztPJMjVblvsbGhJo651LKAgX7KfEeJEOZxkUdFzM96Pg
 ABpKFP7v+v41RoGiArGoSRr4r6bEfVAG6OxGKd7mpuBS0wVoJW0TJw=
X-Google-Smtp-Source: AGHT+IFXvI6rFfondE7GIVPsJyPWklmkUkPGqMMRXQ6JySgcu/GKBF0aHPbjicCjBYBJSlt2h9eb0Q==
X-Received: by 2002:a05:600c:6010:b0:436:17a6:32ee with SMTP id
 5b1f17b1804b1-436dc257cc3mr31916845e9.10.1736268737218; 
 Tue, 07 Jan 2025 08:52:17 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c828f5fsm51434253f8f.8.2025.01.07.08.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 08:52:15 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 242185FB20;
 Tue,  7 Jan 2025 16:52:09 +0000 (GMT)
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
Subject: [PATCH v3 12/29] tests/functional: update the s390x tuxrun tests
Date: Tue,  7 Jan 2025 16:51:50 +0000
Message-Id: <20250107165208.743958-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107165208.743958-1-alex.bennee@linaro.org>
References: <20250107165208.743958-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Message-Id: <20241121165806.476008-33-alex.bennee@linaro.org>
---
 tests/functional/test_s390x_tuxrun.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_s390x_tuxrun.py b/tests/functional/test_s390x_tuxrun.py
index dcab17c68b..a7db4bfd84 100755
--- a/tests/functional/test_s390x_tuxrun.py
+++ b/tests/functional/test_s390x_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunS390xTest(TuxRunBaselineTest):
 
     ASSET_S390X_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/s390/bzImage',
-        '0414e98dd1c3dafff8496c9cd9c28a5f8d04553bb5ba37e906a812b48d442ef0')
+        'https://storage.tuxboot.com/buildroot/20241119/s390/bzImage',
+        'ee67e91db52a2aed104a7c72b2a08987c678f8179c029626789c35d6dd0fedf1')
     ASSET_S390X_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/s390/rootfs.ext4.zst',
-        '88c37c32276677f873a25ab9ec6247895b8e3e6f8259134de2a616080b8ab3fc')
+        'https://storage.tuxboot.com/buildroot/20241119/s390/rootfs.ext4.zst',
+        'bff7971fc2fef56372d98afe4557b82fd0a785a241e44c29b058e577ad1bbb44')
 
     def test_s390(self):
         self.wait_for_shutdown=False
-- 
2.39.5


