Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jZdpP-00007L-0Q
	for mharc-qemu-riscv@gnu.org; Fri, 15 May 2020 13:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZdpM-0008Sn-Rn
 for qemu-riscv@nongnu.org; Fri, 15 May 2020 13:08:52 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59162
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZdpM-00031Z-2Z
 for qemu-riscv@nongnu.org; Fri, 15 May 2020 13:08:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589562531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=67oKUwzJF/EYz6sathwG2YKI0GXJwcGpGF25DTlLRL8=;
 b=F5kg76p/rvFoQ0qQ/ZR/H0dLiOHbccM0HY2BR71V0eiyviBBys0hGos4B1cU3jP+z7mw1Z
 88UjE3vZAMwj63+xLVGLu3SomeeJJFvfQFK6YSjPnwyowzeyoBoSC1pFwiXw/ZotI1Uq1o
 K0dkfksEQeUrrewoPBstT+hoAtTbc3E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-nM2fQIOPMZ-qAlZLd-OlDg-1; Fri, 15 May 2020 13:08:50 -0400
X-MC-Unique: nM2fQIOPMZ-qAlZLd-OlDg-1
Received: by mail-wm1-f72.google.com with SMTP id 23so1459103wma.8
 for <qemu-riscv@nongnu.org>; Fri, 15 May 2020 10:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=67oKUwzJF/EYz6sathwG2YKI0GXJwcGpGF25DTlLRL8=;
 b=Wsgf56BI7FiQY+MpRWtcCDTu+hicrreuZdR3sxOKNdVbWQHHzT+LvsBAWgQN1BWvdV
 9FuvYavZZ5kYv0FVIXWi+arDiPOGAJMVikVYn4NvRPsqBAGXLgc7GMzsTXSACGKMZLpQ
 Hgn534hgtTKeH3pImR7sIQFHDMgsf5XueeDr76ayC5B84n6l+3tJld1YNcsSp7VQuMmJ
 fAepJCysdDTK2kIQVlCLkYFGDX0UG8/sI56ZzEPAhy0eNvIP4iKzMjSwnzYMK6hPMWcR
 0qCFEU96EOnjWR2Pnt/b/S236KDEMKYU5iEjAHb3HCKNgjuse2ebIojMypepWAZQ2/Hi
 0nfQ==
X-Gm-Message-State: AOAM530hCSWvBfTZWmG1GBiJ3qq/iUKlTr2pnLkHpC4q9F2TXtWgL1v7
 YNDPDo43ssTpf19OPmUGSHLpbE0u1hesF9FMbvMNoVnyR+6EZ6WhbUrdsM0phWbszNgceg3RPib
 8WcGYrqbGeXAOzFk=
X-Received: by 2002:a7b:cfc9:: with SMTP id f9mr4995624wmm.107.1589562526809; 
 Fri, 15 May 2020 10:08:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxALqTonffMmY4SMz5hcxTzEJkSJcZbhyA/Xbjh285rKOAFKWxrLXerQw5g8+eKLzHIKqcMAA==
X-Received: by 2002:a7b:cfc9:: with SMTP id f9mr4995590wmm.107.1589562526574; 
 Fri, 15 May 2020 10:08:46 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id q2sm3795634wmq.23.2020.05.15.10.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 10:08:46 -0700 (PDT)
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
Subject: [PATCH v2 07/10] accel/Kconfig: Extract accel selectors into their
 own config
Date: Fri, 15 May 2020 19:08:01 +0200
Message-Id: <20200515170804.5707-8-philmd@redhat.com>
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
X-List-Received-Date: Fri, 15 May 2020 17:08:53 -0000

Move the accel selectors from the global Kconfig.host to their
own Kconfig file.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 Makefile      | 1 +
 Kconfig.host  | 7 -------
 accel/Kconfig | 6 ++++++
 3 files changed, 7 insertions(+), 7 deletions(-)
 create mode 100644 accel/Kconfig

diff --git a/Makefile b/Makefile
index 665900d5c8..06826273c1 100644
--- a/Makefile
+++ b/Makefile
@@ -419,6 +419,7 @@ MINIKCONF_ARGS = \
     CONFIG_PVRDMA=$(CONFIG_PVRDMA)
 
 MINIKCONF_INPUTS = $(SRC_PATH)/Kconfig.host \
+                   $(SRC_PATH)/accel/Kconfig \
                    $(SRC_PATH)/hw/Kconfig
 MINIKCONF_DEPS = $(MINIKCONF_INPUTS) \
                  $(wildcard $(SRC_PATH)/hw/*/Kconfig)
diff --git a/Kconfig.host b/Kconfig.host
index 55136e037d..a6d871c399 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -2,9 +2,6 @@
 # down to Kconfig.  See also MINIKCONF_ARGS in the Makefile:
 # these two need to be kept in sync.
 
-config KVM
-    bool
-
 config LINUX
     bool
 
@@ -31,10 +28,6 @@ config VHOST_KERNEL
     bool
     select VHOST
 
-config XEN
-    bool
-    select FSDEV_9P if VIRTFS
-
 config VIRTFS
     bool
 
diff --git a/accel/Kconfig b/accel/Kconfig
new file mode 100644
index 0000000000..c21802bb49
--- /dev/null
+++ b/accel/Kconfig
@@ -0,0 +1,6 @@
+config KVM
+    bool
+
+config XEN
+    bool
+    select FSDEV_9P if VIRTFS
-- 
2.21.3


