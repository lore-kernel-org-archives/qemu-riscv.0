Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC99AC83F12
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:17:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbhLR-0008B0-8X; Thu, 31 Aug 2023 09:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhHz-00081J-TF
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:00:48 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhHw-0006og-V8
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:00:47 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31dcf18f9e2so638580f8f.0
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 06:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486843; x=1694091643; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7hmpcKbPMiCB1lRYiTD63IbOGzz5WRqg6JB5CP58x9E=;
 b=Ei5+GZYK8/+CY0aIOgA2fVUBPVljAjgdxJcdBubH6rGLe9ByOEBsiPYDYCvJ2QVZ0e
 1lE7Tm1oWylsWX6+v5B5oP7XPo701MD2Tl0OfxQ4OE9MDerWhcc6bmLkI/cL8fvSg7W3
 TQBJIDFMcwpFxbZkx2mwaMXR3NUIrM+OJJqXRXVtVyaDQ/fBqmDXOZL2QEs3b20f2H+b
 gloOzkZ6t/fcHeJEvLuSTLBdJG5jgC//C7ZIyvohXmj1n5YN0mYQSX/aofNEToF0jMka
 wWIeT2HTK8xDqMyjpkH/Z+VK3eDrNy0L21pdymlTGn1ZnJY5FHjupl+MFzRgcPWaQePz
 yzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486843; x=1694091643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7hmpcKbPMiCB1lRYiTD63IbOGzz5WRqg6JB5CP58x9E=;
 b=b2/e5n1V9RxWcuEMACZ+igVJRF66ztqgCoNqZGVZVU6MT8Zu7BKudxOOb8E9iX0xv/
 nFjf9wcjHAo5b91jgEvF7HN4E2joAJHEmMBOjl39gmTW7I/fII6Xx5z92YsdXA3Iep0z
 i6hIGEH1Fg3UPRmvM4XgnTHoDqC/10n5mCD8vWtCZKuoUuh51FVfIGIvIUL41wPZCwcE
 fb4NhLez3wnd65Ii9Fr+FY5esxyEr1iJHeVBTQ6kCUL5DrwQh/eTvBhlN6Mbx1uRQhHM
 iWjeKtJPW8bhS90Od8zwUgdL+E/UaPoof/c8ek5I88CI1WW/UkE//8grobcfRANjySAi
 G7hg==
X-Gm-Message-State: AOJu0YxGcucV8hRa1XN0hbDumgutJLcxHsjmprnoFX5j4trUACA4sViH
 LaAJZFwHxa4YqZw5Op0baEdfMvB+wS1EbYrWOYI=
X-Google-Smtp-Source: AGHT+IHonzwgbGKHVktYaGinY4yu5VcOLRqqaXIktb/m1aXBdIyR95+05v0nNooDeF7CJ+gIguTprQ==
X-Received: by 2002:a5d:5487:0:b0:317:6310:a616 with SMTP id
 h7-20020a5d5487000000b003176310a616mr3810958wrv.36.1693486843054; 
 Thu, 31 Aug 2023 06:00:43 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a5d6351000000b0030fd03e3d25sm2183922wrw.75.2023.08.31.06.00.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 06:00:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PULL 39/41] meson: Fix MESONINTROSPECT parsing
Date: Thu, 31 Aug 2023 14:56:41 +0200
Message-ID: <20230831125646.67855-40-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

The arguments in MESONINTROSPECT are quoted with shlex.quote() so it
must be parsed with shlex.split().

Fixes: cf60ccc330 ("cutils: Introduce bundle mechanism")
Reported-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
Tested-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20230812061540.5398-1-akihiko.odaki@daynix.com>
---
 scripts/symlink-install-tree.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/symlink-install-tree.py b/scripts/symlink-install-tree.py
index 8ed97e3c94..b72563895c 100644
--- a/scripts/symlink-install-tree.py
+++ b/scripts/symlink-install-tree.py
@@ -4,6 +4,7 @@
 import errno
 import json
 import os
+import shlex
 import subprocess
 import sys
 
@@ -14,7 +15,7 @@ def destdir_join(d1: str, d2: str) -> str:
     return str(PurePath(d1, *PurePath(d2).parts[1:]))
 
 introspect = os.environ.get('MESONINTROSPECT')
-out = subprocess.run([*introspect.split(' '), '--installed'],
+out = subprocess.run([*shlex.split(introspect), '--installed'],
                      stdout=subprocess.PIPE, check=True).stdout
 for source, dest in json.loads(out).items():
     bundle_dest = destdir_join('qemu-bundle', dest)
-- 
2.41.0


