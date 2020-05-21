Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbrMK-00061j-Qt
	for mharc-qemu-riscv@gnu.org; Thu, 21 May 2020 16:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrMJ-0005yo-P1
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 16:00:03 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:55778
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrMI-0008ON-LA
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 16:00:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590091201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=az8pj3ArsVB5H8vNRsyPhpcnKHlQHKIjS7ekh/fQInY=;
 b=jS+Eh0pnE75S7nUvi6JFk/K8uXKWy0lSvf73AzrwV12IM1PXIU+bwx6v+v2Hoci5zbSViU
 mYBsspuhQJwCMIYA0z6SS2U5jNkRoeV3ndHeu8qDEez7361f8wzl91u+m0aYRnBqBT5pnP
 v8eF8fTWZv4OIFfanX5Ro+XSrX01kFM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-ocGgD-pcN-uxzwkyMuj5lQ-1; Thu, 21 May 2020 15:59:58 -0400
X-MC-Unique: ocGgD-pcN-uxzwkyMuj5lQ-1
Received: by mail-wr1-f69.google.com with SMTP id n9so3337594wru.20
 for <qemu-riscv@nongnu.org>; Thu, 21 May 2020 12:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=az8pj3ArsVB5H8vNRsyPhpcnKHlQHKIjS7ekh/fQInY=;
 b=HRDAB7kf+PfIuD8bUlMq+g4IcGfe05L2ur/xOb1OyVL4C8hSYgi0WkeByAgGuAPlZF
 r3DNxCrM0+JP9qjqbHUpmpoj5YDPyhFC/DFfCZwiAUZSMzExvJwGlUiytQUlZGttz1qm
 nWPwLNy8dsUClm+dUKVwJ8PBZMvHozBEJ6HpsR9Ov7yWxygODoSOEP9TyI+UHvO28dfU
 p8YzP8NpzuT668mLbhyZMtTpYBwMxdrVYIwL/HlwdX9JmLFzt/bN7kw9qvraB0MYAC7r
 FKYgXUIygL+su1K9V/2VCaYbF+glyb+m1LboWiN0hjMEuxMAkeEAu9CDlIYyJ6BenfC7
 4X6Q==
X-Gm-Message-State: AOAM533zuS8zoVu3qpsiIy/uSiWxhpaxksb9jHg2sXNhENZavqK+UsO1
 aluEPjjDAkUevNMcFu7PPmKjphBiL35Nz2YxVmfxbMowDMBDoXvjYoot1m23BMJrOJ9IdLIqny7
 5+CmVpkTO9xFhidI=
X-Received: by 2002:a7b:c948:: with SMTP id i8mr9806689wml.138.1590091197743; 
 Thu, 21 May 2020 12:59:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIC1YF9vnbb0d7UYHowIyhFcsZQORMAU/marIVyBPLifjaU9X27ZyMlmA7A7A9XhdHMCFCUQ==
X-Received: by 2002:a7b:c948:: with SMTP id i8mr9806677wml.138.1590091197523; 
 Thu, 21 May 2020 12:59:57 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id u65sm7476303wmg.8.2020.05.21.12.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 12:59:57 -0700 (PDT)
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
Subject: [PATCH v3 08/11] accel/Kconfig: Add the TCG selector
Date: Thu, 21 May 2020 21:59:08 +0200
Message-Id: <20200521195911.19685-9-philmd@redhat.com>
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
X-List-Received-Date: Thu, 21 May 2020 20:00:04 -0000

Expose the CONFIG_TCG selector to let minikconf.py uses it.

When building with --disable-tcg build, this helps to deselect
devices that are TCG-dependent.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Makefile      | 1 +
 accel/Kconfig | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 648757f79a..f8a45e1379 100644
--- a/Makefile
+++ b/Makefile
@@ -405,6 +405,7 @@ endif
 MINIKCONF_ARGS = \
     $(CONFIG_MINIKCONF_MODE) \
     $@ $*/config-devices.mak.d $< $(MINIKCONF_INPUTS) \
+    CONFIG_TCG=$(CONFIG_TCG) \
     CONFIG_KVM=$(CONFIG_KVM) \
     CONFIG_SPICE=$(CONFIG_SPICE) \
     CONFIG_IVSHMEM=$(CONFIG_IVSHMEM) \
diff --git a/accel/Kconfig b/accel/Kconfig
index c21802bb49..2ad94a3839 100644
--- a/accel/Kconfig
+++ b/accel/Kconfig
@@ -1,3 +1,6 @@
+config TCG
+    bool
+
 config KVM
     bool
 
-- 
2.21.3


