Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jZdpI-0008FF-Ee
	for mharc-qemu-riscv@gnu.org; Fri, 15 May 2020 13:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZdpH-0008C0-9g
 for qemu-riscv@nongnu.org; Fri, 15 May 2020 13:08:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35145
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZdpG-00030j-Hr
 for qemu-riscv@nongnu.org; Fri, 15 May 2020 13:08:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589562525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ITVoQ1ZbyJY3869Qz0QJKhcD0XsDNN4PZcYvj6FH84=;
 b=IJ69THbAnNIFgjPae06T0tyCYOfPTAa/8OwYx3b1MYYXxtxS0/7JhZRxHl5aaAAVm5i5jr
 POfJyfUmXRggzdR9zP8aNA2T7Rf4NifGTPG+JknwKAbfJg57v2DfHeWt4oln8VONiEfBQN
 YZCG1y3HJI60VpzivafSMCVVQ/Y4hEs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-S_nEHJU0PCq31nzG_FTOvg-1; Fri, 15 May 2020 13:08:44 -0400
X-MC-Unique: S_nEHJU0PCq31nzG_FTOvg-1
Received: by mail-wr1-f71.google.com with SMTP id p8so1481664wrj.5
 for <qemu-riscv@nongnu.org>; Fri, 15 May 2020 10:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ITVoQ1ZbyJY3869Qz0QJKhcD0XsDNN4PZcYvj6FH84=;
 b=NUZcvqNezI0e9WQ4dibi7nLcZWdqp6F1XqJ2qLOSgVjzNA5HYFS+qRUPmZF6uQUiHC
 KPsoEXi93faKxIWtdX3H/DrbfnJ9DQJJB0v1ZXScqD1IDasDgLJwBbwUTaHSNDEhyytl
 oJ3yb9JaHJnyW2m8omOmHyn8Fug+F7J6CUnv3p14WP22VLlnm1byGrpewCN4xmMvJfq7
 WquoYSouiLjF65BbwvI7oxn6HUzPxbAl9Cq/zJJUzLJZnXNy6SRDL8xf1GDmcE2YcAKN
 T4Ry2N9NxSO67FGDKqFGDZpqfSppxBPNxQ4OvUqFncQxqNOXi9Pw7WC+oGeKJUJ0xMgn
 JvBg==
X-Gm-Message-State: AOAM533ceuoOVfFoeImfDjB52EBZeZPxxKrCngVeD04RPeD0WgcG5wm5
 r7gEjo/VPRCsGbEtdQktOC7po2Av0Q2E7jQPcMsQNsWzMgY2GozJGEonf9oNdM1MB5g+Y0RdLMC
 BqDEx5qCn0nA3VEw=
X-Received: by 2002:a1c:b354:: with SMTP id c81mr4963854wmf.136.1589562521306; 
 Fri, 15 May 2020 10:08:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmx+ZO2tfR2y8eEMofGp0DBekFYHDX4bY/GfboFJ/NDQMoQkIi+Tv5ej2TCEVaoDExRhm5BA==
X-Received: by 2002:a1c:b354:: with SMTP id c81mr4963827wmf.136.1589562520987; 
 Fri, 15 May 2020 10:08:40 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id h20sm4351735wma.6.2020.05.15.10.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 10:08:40 -0700 (PDT)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 06/10] Makefile: Write MINIKCONF variables as one entry per
 line
Date: Fri, 15 May 2020 19:08:00 +0200
Message-Id: <20200515170804.5707-7-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200515170804.5707-1-philmd@redhat.com>
References: <20200515170804.5707-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 22:56:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
X-List-Received-Date: Fri, 15 May 2020 17:08:47 -0000

Having one entry per line helps reviews/refactors. As we are
going to modify the MINIKCONF variables, split them now to
ease further review.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Makefile | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 84453789f9..665900d5c8 100644
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


