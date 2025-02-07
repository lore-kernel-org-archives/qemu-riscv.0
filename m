Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C8BC0219C
	for <qemu-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 15:34:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tgQLM-0000Zl-Tu; Fri, 07 Feb 2025 10:32:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tgQKB-00083C-5X
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2025 10:31:24 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tgQK6-0003xO-7L
 for qemu-riscv@nongnu.org; Fri, 07 Feb 2025 10:31:22 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5dcea56d6e2so4058657a12.1
 for <qemu-riscv@nongnu.org>; Fri, 07 Feb 2025 07:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738942276; x=1739547076; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=og+RgYrNsp8w4PSolTa+WXjkMXBk+YlMNJEeZ+a/6KM=;
 b=LW2owGCptWB0QHH7Z4jBmqbpVe9Dku+G1eo/tIsqnRNao3/4ZtxbWOH+ZG6/O1W+5e
 h2JNFpzDcndMgG4pNbWBmTN6+2JgIBzRQ2bYNKzkKY0gqvbZs1MzRJPaBXNwHixvX54/
 5ylpnbBltstsaVNSqEo2FlQ5KFpufas7kxKLaqBSF9c4wylWa+LK0JrZNjtRGDZrFgmE
 WPvyrgyCD3uAjLBfaG8vBSfGZKIxeem557/mw6O/d1W8sQIihlUzQsFcdo7QX0tImAo8
 u6clb2DST5/gTFhbEcjWej/dgf03SrhmjbzyJxbfAXS8qXXCkCJ2eee+5fuR96Ej+Kva
 zNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738942276; x=1739547076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=og+RgYrNsp8w4PSolTa+WXjkMXBk+YlMNJEeZ+a/6KM=;
 b=XMSfwFiqxIEdgJj1b0PN0fAK4YlwoJkjOPhyeWfhUq6vBW/ZbIdMrDf4G5aiLTrkkE
 AOE7Ci/3n/JIOUYjw+Afm5Vi6CxRJdnoEyrGtMxWY/I9Wl3d5aUXXfyMwC/DJSt9xONJ
 qmaQ8H3RsdBCf0gwolwSQkM+8kna6G9oxEwzuns18whdf4dMkkX197vk8xALA4m5eFXw
 2bEmXRt3ebmsEyTqrR2f4D7V0rjUZvSxASCEytBTMqVKYyCFnEDAg6wRYOJ+/QW8YLNo
 5OjunOf8yI5Y2XGrgUlXsNXXHzBhf+znr2CTiHB5esPSc5+d1vVWdSwwteNT4aTSl372
 I6dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURxV1bkkcdrkLkkhaGh1j9oDqNzb9+lBNaKAzlEkYe0JggbWmPAmA+HHdtroqLOGCbybL19JNi14aB@nongnu.org
X-Gm-Message-State: AOJu0Yzf/VmrU1lPlICoZS/jaQHvwtTjiyzbyQqicvq8Z4EgnSR152ox
 VQpLbofnSFeITB1B5TT0ocf8x+o2yVr045fBCaWWzM0BBkUrgwng3kGCL/sBuME=
X-Gm-Gg: ASbGncsX1sxBYdtockhsgqA0X48xZ2vCwupq4QjEdUEB0IbeVXSkzC6XWhVNo1lSE00
 zfaDI+4Wt0KEy2KZbL9vq0djeI6zDdvRjCOFoo/rf+f/JyAgelkKFnMQDE8mXVfjx4LLNRLOzfH
 IiCxfrTYWU0HpI+okmeuqZz5MtZJF4ymcrK6pklD5R07METgycByFo4+35C+2FYt+WodLzdw6RG
 vAjnr8dugfp6GeFu2KNEW+By+9QiyFjKupFM3TJ+iQ0Qmq6/vKILIVtYXQuy9wmGxa9Hw8ZrFJm
 dP7vNCqMCoA6p9lGTw==
X-Google-Smtp-Source: AGHT+IEFengz12wMmX5bL7dGhLinmhQYyJLidRsR1fp5Fjv9Zz0gylWjYVzoHZBTiwha1zjg3xLfLA==
X-Received: by 2002:a05:6402:e8a:b0:5dc:d34f:a315 with SMTP id
 4fb4d7f45d1cf-5de450236a2mr4556163a12.15.1738942275728; 
 Fri, 07 Feb 2025 07:31:15 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de379cedc6sm2044986a12.44.2025.02.07.07.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 07:31:14 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7D6705F92A;
 Fri,  7 Feb 2025 15:31:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Bin Meng <bmeng.cn@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Kyle Evans <kevans@freebsd.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Riku Voipio <riku.voipio@iki.fi>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Fabiano Rosas <farosas@suse.de>, Alexandre Iooss <erdnaxe@crans.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Warner Losh <imp@bsdimp.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-rust@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v2 01/17] tests/docker: replicate the check-rust-tools-nightly
 CI job
Date: Fri,  7 Feb 2025 15:30:56 +0000
Message-Id: <20250207153112.3939799-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250207153112.3939799-1-alex.bennee@linaro.org>
References: <20250207153112.3939799-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
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

This allows people to run the test locally:

  make docker-test-rust@fedora-rust-nightly

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - update MAINTAINERS
---
 MAINTAINERS                   |  1 +
 tests/docker/Makefile.include |  3 +++
 tests/docker/test-rust        | 21 +++++++++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100755 tests/docker/test-rust

diff --git a/MAINTAINERS b/MAINTAINERS
index 0cf37fce7b..efb7d09dea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3386,6 +3386,7 @@ F: rust/rustfmt.toml
 
 Rust-related patches CC here
 L: qemu-rust@nongnu.org
+F: tests/docker/test-rust
 F: rust/
 
 SLIRP
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index fead7d3abe..fa1cbb6726 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -236,3 +236,6 @@ docker-image: ${DOCKER_IMAGES:%=docker-image-%}
 
 docker-clean:
 	$(call quiet-command, $(DOCKER_SCRIPT) clean)
+
+# Overrides
+docker-test-rust%: NETWORK=1
diff --git a/tests/docker/test-rust b/tests/docker/test-rust
new file mode 100755
index 0000000000..e7e3e94a55
--- /dev/null
+++ b/tests/docker/test-rust
@@ -0,0 +1,21 @@
+#!/bin/bash -e
+#
+# Run the rust code checks (a.k.a. check-rust-tools-nightly)
+#
+# Copyright (c) 2025 Linaro Ltd
+#
+# Authors:
+#  Alex Bennée <alex.bennee@linaro.org>
+#
+# This work is licensed under the terms of the GNU GPL, version 2
+# or (at your option) any later version. See the COPYING file in
+# the top-level directory.
+
+. common.rc
+
+cd "$BUILD_DIR"
+
+configure_qemu --disable-user --disable-docs --enable-rust
+pyvenv/bin/meson devenv -w $QEMU_SRC/rust ${CARGO-cargo} fmt --check
+make clippy
+make rustdoc
-- 
2.39.5


