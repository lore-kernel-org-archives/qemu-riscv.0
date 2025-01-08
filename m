Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4D5E77188
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 12:14:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tVUvZ-0001X1-W4; Wed, 08 Jan 2025 07:12:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVUu7-0000bk-N3
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:11:20 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tVUu0-0007IY-1d
 for qemu-riscv@nongnu.org; Wed, 08 Jan 2025 07:11:17 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d3f65844deso28276894a12.0
 for <qemu-riscv@nongnu.org>; Wed, 08 Jan 2025 04:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736338267; x=1736943067; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5U9Od47PCiWI45o7WJdMxF/b5gdEZ4yrNLzNgilwbJs=;
 b=M6sZBbZ6mieJp3rsDpo2OJfk5a29UFQFD4aF3SxPeHp1QwI6OEaA8Yi8APcqs526Da
 Ug4Ix3lAJRe16u/B29GR6uwVwsUDDS+vDuIkW+0Y12oP7lphjq7jy4945ed8AGlYSZN3
 owUVtIKUZCcm+7uRhl5cfMXAjuLvS7c2CUc7PofJHqe1rK0xnOCyNlS8tcFqtd1Mib/7
 se8uyj5NfWYe2fLb/SdshxnYteiPcyPEz2Cu9o98d8BuBxH07w42PX8Nb2jdv0rHNhKW
 kvH+8oKVhPrznfNtL784NGaKdH/0pTmiRwbhulc5Afkqq2YdE9f677UGqniFuHThk92v
 I19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736338267; x=1736943067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5U9Od47PCiWI45o7WJdMxF/b5gdEZ4yrNLzNgilwbJs=;
 b=fNHx1QnTK+oi9/E3RqEx2eY6BmYtbHnC9P0ujiYde2zyONMBRIdYi6rl8QZzxglObL
 ahuAldAiBgxXkvIWRqKN+6ncxl/fFcBXYgeMO3h8sBL8KHwPkuAlbFcUtqTh+TVC61g7
 Nlv2eOENmS5xzYE+XXVx1G+CShy78j/qAftY9CPC8RbOjg/KgbbGTUY6edpuB/c0D4Ny
 ldKmQ0MKRKQ9T6rBH/aQ4pRumihCxv0ybRBGyMoSZbDwLCJYzSjzmpM5jKbDGLp0rZFk
 xBDCH8jine2w2azShH1t19qBAmgdQ8aMcjrlwqZFAsrmmuz5C+ZQa5eObKjL4Mc5JKFV
 zdpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk9kqk1LWXW91zuxVeD/XfNO0myq8WPQ0LQsOcjxUWW+ZeAxy9BTUXV2so2NorNaRZsvpFuiL0Gj38@nongnu.org
X-Gm-Message-State: AOJu0Yxo3jfWfPudCR2KniHQCl+DFbNHMuKHJ7+pGHAtIOirujTg6psH
 TcBfbU/yMKr26ky/OSyzVGAdil+7lyi4J/EOl/R9GSZx1MfWxvTQ5dAfIbF9hk8=
X-Gm-Gg: ASbGncvIf4l7AppBwtBjXh899UgBWNYjk25jT2GtjXRjAwUZ2+ih+MvYkdXEX4rX0yB
 ZoaC3g8FjHdId84Rw/abspkktq+VO5515Mqy6Nc80aN3lZw1yvKD8BFbL9LyyxW+v9ipbqMvMjP
 JKOm3ng775srJlIta4shkPZRqT/cAB2qSsf/9bLEMy/8j3Yc1XpMFIJiC7gGDIcf6VAWxfSt+l9
 wTHJ3d6bnrJbzCAJgirTP5oac+UPs5XNIjhkucSu7BoDURTY6WdNyM=
X-Google-Smtp-Source: AGHT+IE4/7HfEr1rKZyUBxcjVIcFjh+v0jCyBOLGAm/OgQeBMB1/NZ8naf83bJeHe1mWVEy7fuyp1g==
X-Received: by 2002:a05:6402:27cd:b0:5d3:cfd0:8d4b with SMTP id
 4fb4d7f45d1cf-5d972e6e3e4mr2214001a12.33.1736338264827; 
 Wed, 08 Jan 2025 04:11:04 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f013900sm2499453766b.144.2025.01.08.04.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 04:11:02 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id CE2635FA6C;
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
Subject: [PATCH v4 13/32] tests/functional: update the sparc64 tuxrun tests
Date: Wed,  8 Jan 2025 12:10:35 +0000
Message-Id: <20250108121054.1126164-14-alex.bennee@linaro.org>
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
Message-Id: <20241121165806.476008-34-alex.bennee@linaro.org>
---
 tests/functional/test_sparc64_tuxrun.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_sparc64_tuxrun.py b/tests/functional/test_sparc64_tuxrun.py
index 1c2c005630..3be08d6102 100755
--- a/tests/functional/test_sparc64_tuxrun.py
+++ b/tests/functional/test_sparc64_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunSparc64Test(TuxRunBaselineTest):
 
     ASSET_SPARC64_KERNEL = Asset(
-        'https://storage.tuxboot.com/20230331/sparc64/vmlinux',
-        'e34313e4325ff21deaa3d38a502aa09a373ef62b9bd4d7f8f29388b688225c55')
+        'https://storage.tuxboot.com/buildroot/20241119/sparc64/vmlinux',
+        'a04cfb2e70a264051d161fdd93aabf4b2a9472f2e435c14ed18c5848c5fed261')
     ASSET_SPARC64_ROOTFS = Asset(
-        'https://storage.tuxboot.com/20230331/sparc64/rootfs.ext4.zst',
-        'ad2f1dc436ab51583543d25d2c210cab478645d47078d30d129a66ab0e281d76')
+        'https://storage.tuxboot.com/buildroot/20241119/sparc64/rootfs.ext4.zst',
+        '479c3dc104c82b68be55e2c0c5c38cd473d0b37ad4badccde4775bb88ce34611')
 
     def test_sparc64(self):
         self.root='sda'
-- 
2.39.5


