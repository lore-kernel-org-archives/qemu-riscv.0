Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6Afk-0001uB-TJ
	for mharc-qemu-riscv@gnu.org; Sun, 31 Jan 2021 06:13:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Afi-0001p2-QB; Sun, 31 Jan 2021 06:13:38 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Afh-0006Lr-8o; Sun, 31 Jan 2021 06:13:38 -0500
Received: by mail-wr1-x42e.google.com with SMTP id s7so10458145wru.5;
 Sun, 31 Jan 2021 03:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5db0rN0b61TISoVih9RU0w7I/BYMbyVo0fCfumLvBJU=;
 b=Aww7BaJVjb3/wyQ8XZfjMO3ZwTQmiv8Fb0Bvp3LixGTGjtGCxZa8bbnvvzcOA1n9bv
 O/nqUBYrOzk4y9L79PIff8LUUhy3qEA3laziY0kpTAqPTFT1C4h+5WhtihDidiL+CnGz
 2IXrZ7q1dAll+C430eQgDJmqDeHmAiu4YExvjtLYbcBM2dXLPS07mDKX0/lTKCNa2koN
 bTFKf7PsO8nNuotwcZyJRxUtl+g4GvQXsiMvpfXw2kfKw4+j9nl8xvSxzNUPvTnW6Pkj
 d7+bqu2BwHuKMywtKMYRhPo93RTuFW569BMmNm/eGUNrkGCMmPFeIvyGnpaQ/2XhTVIG
 0ltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5db0rN0b61TISoVih9RU0w7I/BYMbyVo0fCfumLvBJU=;
 b=ndYm5z+tNcQAbg7UaNZAm9F3k7z0omeaGgXAIjSpHSH36JTv+XqKnTE7a7xAjt418z
 IpuqL/O0vaeTssVVIpXD+JqsIlh+miRzTXTNp0WQUL16bdn+NYIyo2OTvLru/YRyUkcr
 I7zbizDW7xN/UpgGTLTjLRtu+AVdftzrox+CNQs4XfIAdRScDlkhMMkdW59KAoyEyoC0
 GPUK2xbrtQR+NKnni2pcUrKWfkgANCfeOIkmcwxN7genoLAhNbtt/vzx5Q05Yymo3oZ4
 BFA/Z4fW19xgKAvKHGVwbIXA4uelHIw2ELKGCINUrCATWGVgf8dWUP2ssNdnhZOmdd/P
 +BTA==
X-Gm-Message-State: AOAM532FMFu4ijm1Sm5iewXwIynAxRWiZqdj8XVggo4yeyAOQ8vtaVjj
 Ep0nTeEXnF076fEwHSloD4obH48TdrQ=
X-Google-Smtp-Source: ABdhPJxW502J2p3wHoVx/d3AqodhoKgPwvsaUlx4hMLKseNtd9yxDGw+BCbNjHqPUg3olzHpsoB/sQ==
X-Received: by 2002:a5d:6a85:: with SMTP id s5mr12728710wru.283.1612091614116; 
 Sun, 31 Jan 2021 03:13:34 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id s19sm25233016wrf.72.2021.01.31.03.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 03:13:33 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Anthony Green <green@moxielogic.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Walle <michael@walle.cc>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Marek Vasut <marex@denx.de>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Rolnik <mrolnik@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH 02/10] hw/lm32/Kconfig: Introduce CONFIG_LM32_EVR for
 lm32-evr/uclinux boards
Date: Sun, 31 Jan 2021 12:13:08 +0100
Message-Id: <20210131111316.232778-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131111316.232778-1-f4bug@amsat.org>
References: <20210131111316.232778-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 31 Jan 2021 11:13:39 -0000

We want to be able to use the 'LM32' config for architecture
specific features. Introduce CONFIG_LM32_EVR to select the
lm32-evr / lm32-uclinux boards.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 default-configs/devices/lm32-softmmu.mak | 2 +-
 hw/lm32/Kconfig                          | 6 +++++-
 hw/lm32/meson.build                      | 2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/default-configs/devices/lm32-softmmu.mak b/default-configs/devices/lm32-softmmu.mak
index 115b3e34c98..1bce3f6e8b6 100644
--- a/default-configs/devices/lm32-softmmu.mak
+++ b/default-configs/devices/lm32-softmmu.mak
@@ -8,5 +8,5 @@ CONFIG_SEMIHOSTING=y
 
 # Boards:
 #
-CONFIG_LM32=y
+CONFIG_LM32_EVR=y
 CONFIG_MILKYMIST=y
diff --git a/hw/lm32/Kconfig b/hw/lm32/Kconfig
index ed2e3060b04..20c36edc402 100644
--- a/hw/lm32/Kconfig
+++ b/hw/lm32/Kconfig
@@ -1,7 +1,6 @@
 config LM32
     bool
     select PTIMER
-    select PFLASH_CFI02
 
 config MILKYMIST
     bool
@@ -12,3 +11,8 @@ config MILKYMIST
     select FRAMEBUFFER
     select SD
     select USB_OHCI
+
+config LM32_EVR
+    bool
+    select LM32
+    select PFLASH_CFI02
diff --git a/hw/lm32/meson.build b/hw/lm32/meson.build
index 8caf0a727ff..42d6f8db3d9 100644
--- a/hw/lm32/meson.build
+++ b/hw/lm32/meson.build
@@ -1,6 +1,6 @@
 lm32_ss = ss.source_set()
 # LM32 boards
-lm32_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_boards.c'))
+lm32_ss.add(when: 'CONFIG_LM32_EVR', if_true: files('lm32_boards.c'))
 lm32_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist.c'))
 
 hw_arch += {'lm32': lm32_ss}
-- 
2.26.2


