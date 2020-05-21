Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbrMU-0006R7-L8
	for mharc-qemu-riscv@gnu.org; Thu, 21 May 2020 16:00:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrMS-0006Nm-Md
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 16:00:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47170
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrMR-0008RH-Ms
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 16:00:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590091211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KqNAKdeyZY4N/WN8/VheKglAqudMynHtJmA2N/wtx2U=;
 b=S1Obcw32/03+rU+2owm3Gdo0cWs5afHvEHwE+TK/lsCFvu4ingKl1uYhfoGzeeI5HOAlSu
 O6G+7tfSKyVtHG/ple3sYyfNweWmpCTIhSr6sRtomPrmvD59zXpGMAt0unlPal2pZirltp
 ZZJRPRCEQyp+aT+nYVCL+pjOhx+PvPk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-1Zrjd8LTMKCaJdyCP1nG5w-1; Thu, 21 May 2020 16:00:09 -0400
X-MC-Unique: 1Zrjd8LTMKCaJdyCP1nG5w-1
Received: by mail-wm1-f72.google.com with SMTP id v23so2151868wmj.0
 for <qemu-riscv@nongnu.org>; Thu, 21 May 2020 13:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KqNAKdeyZY4N/WN8/VheKglAqudMynHtJmA2N/wtx2U=;
 b=Tq8KrARhofyN31z8IibFEMFzIJy5iak651HkisZ8f+9PQrZUPR3aslFarn2/nUYOEj
 yd9Dgcq0U8ikNsPkYE5zRwORNpmPipudnq4UfWUS4AY0F8xjZyWQtiK/GdKiCPYvEWVm
 TmUDKDL8N5RJjL7tqhk+lmSX+3a3tLQ7fygrNg9hnOy/iib9CjvGKCQO7uwcTK/pGDHh
 7fxksUTObrGRN8cs94EPNok380483iFssIwOtNp7Ih4oBUK8MY1+CURC+9CN+t/saSiN
 Jyx2GN4fQRe3k0KGYoblQatiOZnskbrZwJn2Kj9p+9sOj65GA3vhP+87kHqNRQwvQeIJ
 fnDQ==
X-Gm-Message-State: AOAM531zeAzts4n2Bmg2t0oOp2ZP9noaCjzwuuGVml+WJm7zfAlTVE7p
 YjZ5RFXquvZeyROX9pxwaq15FUzNfvcOf+Zc/k4ROgQgZ16Fj1k6vfTZiGt5XFE8RD+9PGqnnoq
 qfd2Kl6XlaOPzKaQ=
X-Received: by 2002:a05:6000:8:: with SMTP id h8mr235571wrx.372.1590091208461; 
 Thu, 21 May 2020 13:00:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFiASs60kuKf7BHaBAyYehIKPHjS2uDg/uQRBajStXclZHOmXYaH79bLCSVBU3344As7Vczg==
X-Received: by 2002:a05:6000:8:: with SMTP id h8mr235543wrx.372.1590091208262; 
 Thu, 21 May 2020 13:00:08 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id j4sm5672973wrx.24.2020.05.21.13.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 13:00:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Michael Walle <michael@walle.cc>, Marek Vasut <marex@denx.de>,
 qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 10/11] Makefile: Allow target-specific optional Kconfig
Date: Thu, 21 May 2020 21:59:10 +0200
Message-Id: <20200521195911.19685-11-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200521195911.19685-1-philmd@redhat.com>
References: <20200521195911.19685-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 01:44:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 21 May 2020 20:00:13 -0000

Allow use of target-specific Kconfig file.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v3: Use base-arch() to include TARGET_BASE_ARCH/Kconfig
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f8a45e1379..d5009cd304 100644
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
+		$(wildcard $(SRC_PATH)/target/$(call base-arch, $(firstword $(subst -, ,$@)))/Kconfig) \
 		> $@.tmp, "GEN", "$@.tmp")
 	$(call quiet-command, if test -f $@; then \
 	  if cmp -s $@.old $@; then \
-- 
2.21.3


