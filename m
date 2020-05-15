Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jZdpZ-0000cB-5A
	for mharc-qemu-riscv@gnu.org; Fri, 15 May 2020 13:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZdpW-0000WQ-QS
 for qemu-riscv@nongnu.org; Fri, 15 May 2020 13:09:02 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:37377
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZdpW-00032W-52
 for qemu-riscv@nongnu.org; Fri, 15 May 2020 13:09:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589562541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CgUPsSauJHPAfqEtx3F/6v2O6U+cLNjTuefN7n8Nwkw=;
 b=C6XfeTC0ujbGZ9gw6KX6nPyG8GeEJ3aOM9wREojxxGcV2xpaFkbNaUBMppphEPgmSF/+/3
 mQ6V1wqHHeWT3lTqXtXC8BaBL6TIg7usNmvoncogb7dhExE1MmThjLvVPd8QiqJUiW45J0
 N7rCuhi1b6c9ihROE/dTZnyyYOJiNNA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-3eNOciPNPzSPGKdAYshWaw-1; Fri, 15 May 2020 13:08:59 -0400
X-MC-Unique: 3eNOciPNPzSPGKdAYshWaw-1
Received: by mail-wr1-f70.google.com with SMTP id p13so315560wrt.1
 for <qemu-riscv@nongnu.org>; Fri, 15 May 2020 10:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CgUPsSauJHPAfqEtx3F/6v2O6U+cLNjTuefN7n8Nwkw=;
 b=oPraCjUgfPyvTCnCI+L7YByYFc6zC/Y+0ADMpNQVa+/Wr5nW+PzWuQFY+AIPAUBS9A
 jLM8cLr2WvSs7WUGizYRAYykiex7winQHmoWJvkdKrTkkfKwJmMpT8G9mGNOddskOThp
 fu8OHeyDwrPmL/iXvFpSHlOJ9FjnFRUcc8yXSoT411vkZdNokhmxacL7E38/tg8YXB2Y
 qXRYvIwyquy3Xnp9yF2Wk8jTvMZcx2z999t4LE8VmHZj+xoGS5jitJMD5g6paVNKXWxG
 xjUuRzbPi+dQRnkL5GcwX13odORhpmUHFE/B8IN62f6jBaqUcPpz2gtajk1kl31xsWJ4
 5HUw==
X-Gm-Message-State: AOAM5320IL1G6YZNbewsi+TO3LR4f2MDn4a5qJt/xYJRtwbz9Y0OBjvA
 D/735G0dmKL21XAa6NBBAK3Q96OLWmzZ6p9JoVLJHaHPcjikAxf1ry+42Q/Lp/Z+DquOWXLa5pV
 UO6AGT9iRpI2gs24=
X-Received: by 2002:a1c:e2c5:: with SMTP id z188mr5022581wmg.35.1589562538396; 
 Fri, 15 May 2020 10:08:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJJOiiUiXarfUTi9eHtH6/U/9GLQ3jYfatS4wmFNE1+6AEO5VZwL6RE9VQse4OAM+Qh57d8A==
X-Received: by 2002:a1c:e2c5:: with SMTP id z188mr5022566wmg.35.1589562538245; 
 Fri, 15 May 2020 10:08:58 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id z12sm1931109wmc.6.2020.05.15.10.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 10:08:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Richard Henderson <rth@twiddle.net>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, qemu-riscv@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Marek Vasut <marex@denx.de>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 09/10] Makefile: Allow target-specific optional Kconfig
Date: Fri, 15 May 2020 19:08:03 +0200
Message-Id: <20200515170804.5707-10-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200515170804.5707-1-philmd@redhat.com>
References: <20200515170804.5707-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 00:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 15 May 2020 17:09:03 -0000

Allow use of target-specific Kconfig file.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index b4c0830b26..5fce168fcb 100644
--- a/Makefile
+++ b/Makefile
@@ -423,11 +423,13 @@ MINIKCONF_INPUTS = $(SRC_PATH)/Kconfig.host \
                    $(SRC_PATH)/accel/Kconfig \
                    $(SRC_PATH)/hw/Kconfig
 MINIKCONF_DEPS = $(MINIKCONF_INPUTS) \
-                 $(wildcard $(SRC_PATH)/hw/*/Kconfig)
+                 $(wildcard $(SRC_PATH)/hw/*/Kconfig) \
+                 $(wildcard $(SRC_PATH)/target/*/Kconfig)
 MINIKCONF = $(PYTHON) $(SRC_PATH)/scripts/minikconf.py
 
 $(SUBDIR_DEVICES_MAK): %/config-devices.mak: default-configs/%.mak $(MINIKCONF_DEPS) $(BUILD_DIR)/config-host.mak
 	$(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) \
+		$(wildcard $(SRC_PATH)/target/$(firstword $(subst -, ,$@))/Kconfig) \
 		> $@.tmp, "GEN", "$@.tmp")
 	$(call quiet-command, if test -f $@; then \
 	  if cmp -s $@.old $@; then \
-- 
2.21.3


