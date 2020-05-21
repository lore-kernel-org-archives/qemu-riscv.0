Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbrM9-0005RX-14
	for mharc-qemu-riscv@gnu.org; Thu, 21 May 2020 15:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrM7-0005MX-LW
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 15:59:51 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33645
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrM6-0008Mo-S0
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 15:59:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590091190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GPfSgBN6V2tVMS8P3LJc7AXq2ATI7aQPyqGZHft5RHs=;
 b=TB/Re3O7xAnpelHUB91gzuFOdAEmmZYJoJBYqsMIFi/ii4iuRjIfho9+1QCBbIkc28jFfE
 p667Dl/SLtxfQIKT9Nzr8inqEH3yYItdnphBM/hn8xJsOu0X0JSCXN9a3qYcoEXUcwLLaO
 9N7ibF5+xtxMFjuaCoG3sdcdNqqDOMQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-dF2ygPG3PQOp9qKdEEhS8Q-1; Thu, 21 May 2020 15:59:48 -0400
X-MC-Unique: dF2ygPG3PQOp9qKdEEhS8Q-1
Received: by mail-wr1-f69.google.com with SMTP id z8so3344255wrp.7
 for <qemu-riscv@nongnu.org>; Thu, 21 May 2020 12:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GPfSgBN6V2tVMS8P3LJc7AXq2ATI7aQPyqGZHft5RHs=;
 b=rnYElldpEv425tL2R+bQbsPQJGynTRAZ9S3HnARc3UI2PLibYGssynjGps+mM9Mieo
 aqoPto1GqcdKGJyp3O4B7Jm9EBMxJnkLO5bwuqwzPGK4SbH8z0JTxHGoeVG+Q5DX52T/
 ngBmSElJ751N41H7iq9DFzTW6tsnfjzYXzEMmUlRSjM02SXJrRizZtgaoZgDfq+qLeGB
 zkI6HQJZdahAUzDc2XLJbHrqrIztfoUT4Z1OBR0BSegVx7lOvabIsRMf1csG19Py1u22
 R7ZQXYMU981zsiy/hBGAsxig/J/XL6dypVh6qNwQgwMeJElUVU4DzTebglZVOW+q8SPA
 2Jeg==
X-Gm-Message-State: AOAM531Xz0PCML+tCkyx+P5o+5TIFhwPQR68ohat3mifoge2Vun6+IoJ
 4H3hdi+o0GZgghrTHSfdpo9ivITCm1t2TfMxssGpiLOHn5C9/OFKcGG4cWw6iT1unUd0cLVKg4x
 gKxjLqtXc9+khnVQ=
X-Received: by 2002:a7b:c1d2:: with SMTP id a18mr10054063wmj.176.1590091187088; 
 Thu, 21 May 2020 12:59:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjZ/S3jGknoIdp45jf+F28heqmGYmWTQiFWjpn32tfASHwwq+r3kJugCXtOLIEjzXuVa/5cA==
X-Received: by 2002:a7b:c1d2:: with SMTP id a18mr10054054wmj.176.1590091186867; 
 Thu, 21 May 2020 12:59:46 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id q5sm7928308wra.36.2020.05.21.12.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 12:59:46 -0700 (PDT)
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
Subject: [PATCH v3 06/11] Makefile: Write MINIKCONF variables as one entry per
 line
Date: Thu, 21 May 2020 21:59:06 +0200
Message-Id: <20200521195911.19685-7-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200521195911.19685-1-philmd@redhat.com>
References: <20200521195911.19685-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 04:44:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 21 May 2020 19:59:52 -0000

Having one entry per line helps reviews/refactors. As we are
going to modify the MINIKCONF variables, split them now to
ease further review.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Makefile | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 6c9d718b2c..7666f81e8a 100644
--- a/Makefile
+++ b/Makefile
@@ -418,12 +418,15 @@ MINIKCONF_ARGS = \
     CONFIG_LINUX=$(CONFIG_LINUX) \
     CONFIG_PVRDMA=$(CONFIG_PVRDMA)
 
-MINIKCONF_INPUTS = $(SRC_PATH)/Kconfig.host $(SRC_PATH)/hw/Kconfig
-MINIKCONF_DEPS = $(MINIKCONF_INPUTS) $(wildcard $(SRC_PATH)/hw/*/Kconfig)
+MINIKCONF_INPUTS = $(SRC_PATH)/Kconfig.host \
+                   $(SRC_PATH)/hw/Kconfig
+MINIKCONF_DEPS = $(MINIKCONF_INPUTS) \
+                 $(wildcard $(SRC_PATH)/hw/*/Kconfig)
 MINIKCONF = $(PYTHON) $(SRC_PATH)/scripts/minikconf.py
 
 $(SUBDIR_DEVICES_MAK): %/config-devices.mak: default-configs/%.mak $(MINIKCONF_DEPS) $(BUILD_DIR)/config-host.mak
-	$(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) > $@.tmp, "GEN", "$@.tmp")
+	$(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) \
+		> $@.tmp, "GEN", "$@.tmp")
 	$(call quiet-command, if test -f $@; then \
 	  if cmp -s $@.old $@; then \
 	    mv $@.tmp $@; \
-- 
2.21.3


