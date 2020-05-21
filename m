Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbrME-0005mZ-L6
	for mharc-qemu-riscv@gnu.org; Thu, 21 May 2020 15:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrMD-0005hu-AO
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 15:59:57 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:24947
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbrMB-0008Nc-TI
 for qemu-riscv@nongnu.org; Thu, 21 May 2020 15:59:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590091195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TyEDe8wylZalxNMNSz6RpL3nleNnTxzk4iV0Jrd1pvo=;
 b=eo/mVZSkBENfxgkra5eqampOomQDyv/VyHFJKaaWvpZvtVs1u/6Qc9JXutCqEM3KvkbfqF
 +s05X5LOiifoUw1Y1PmBqX0bimNjrDnV+RHJ+Fl4EoorvP4hd6CFX2kx94wH1+V3sZ/AjY
 mE0N+YMza+Qwc/oLF68I8ie+QxEIO/Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-d8S8K7tUPnKRkkBy9yLoCw-1; Thu, 21 May 2020 15:59:53 -0400
X-MC-Unique: d8S8K7tUPnKRkkBy9yLoCw-1
Received: by mail-wm1-f71.google.com with SMTP id u11so2138211wmc.7
 for <qemu-riscv@nongnu.org>; Thu, 21 May 2020 12:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TyEDe8wylZalxNMNSz6RpL3nleNnTxzk4iV0Jrd1pvo=;
 b=k9vRs7qUqMnYXaoPH5vvm2LGDrHusHMXAOXnWAxoGWmYmPcUfqnwdLRqWSZ6i+1bGl
 KQn8L7MgsfMFhQlUWSOyINq0kEISSr8dmiLeA4y08WkxyCWfU1WNZoV1FSLHerNRd2UA
 0SvBEXX0dwH13my5j9QMlkxrj0Dayw1vq1ayWeKmDtIoJvRAaGLHeNoBloMF4RDE7LaD
 c35rqcrRpA6+SOIABy1TlBGmNREWMPz8Xk4zG3BOq76Z64G6VZEv7gYVKyMQsPYZOMGz
 hreGWHuoEUyX0SfTVYyDTotyC/YLhSEOEPmOoqz4FevmthZFKIhv2yrJnfrzT0bogtvt
 jOIw==
X-Gm-Message-State: AOAM5318mUEgTaKA33kWzOdYHIvjbHpiXVLHDDhkH/2Tu7Ia846SrJHm
 Utruhp2Vt0LSH2aFJXcOy+i92vFo3mAypI3+PU1mBfEZQ9YDsPnuS9ARoyG1C43SnbeXluLw0CY
 syaj5luNg/BQ3etM=
X-Received: by 2002:a05:6000:1107:: with SMTP id
 z7mr202687wrw.93.1590091192443; 
 Thu, 21 May 2020 12:59:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwi56RHX9v+G21jJAOnCw3fEeIRJZTLhwA8U+0eI4Lqjqd8JiM2+5TLbbdNev45iZ0PlCgIuA==
X-Received: by 2002:a05:6000:1107:: with SMTP id
 z7mr202668wrw.93.1590091192251; 
 Thu, 21 May 2020 12:59:52 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id p9sm7364946wrj.29.2020.05.21.12.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 12:59:51 -0700 (PDT)
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
Subject: [PATCH v3 07/11] accel/Kconfig: Extract accel selectors into their
 own config
Date: Thu, 21 May 2020 21:59:07 +0200
Message-Id: <20200521195911.19685-8-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200521195911.19685-1-philmd@redhat.com>
References: <20200521195911.19685-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 01:47:40
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
X-List-Received-Date: Thu, 21 May 2020 19:59:57 -0000

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
index 7666f81e8a..648757f79a 100644
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


