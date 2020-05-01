Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jUUeX-0004ai-Ip
	for mharc-qemu-riscv@gnu.org; Fri, 01 May 2020 08:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56330)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1jUUeV-0004YX-7a
 for qemu-riscv@nongnu.org; Fri, 01 May 2020 08:20:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1jUUeU-0005iI-P1
 for qemu-riscv@nongnu.org; Fri, 01 May 2020 08:20:23 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:43048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jUUeS-0005Uj-RF; Fri, 01 May 2020 08:20:20 -0400
Received: by mail-pf1-x441.google.com with SMTP id v63so1518192pfb.10;
 Fri, 01 May 2020 05:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=SmQffLB8/33ss0YiOCv7YSMbnw292P10yBb4MnsFb7c=;
 b=FcYA/4jBj4Q24UUuZ3Zo+eN00s5grtlPNnQf9O9qmmG9a9sm5Af2EnrG0YxNPO9Bhd
 89/7YchHWmK0+X8RxmmNKiy6UBmCgdWa9OpouiErxYPOad0KnvjRUzjMGceCc4ZGtkZW
 kDHeSYdbDVEoGHpBixj//lmFTkf/F8vvkdmqxs3qbB7s46E/9A1Uv60P085h1i0dvACb
 KsjJdUYEH429/A5vAd8dfF+ehKRmfL7pzzVSlh6lQlrHO/MzyPZjKd5kWs40kZIOzoVC
 oHL9UHm6zPMeYH/b773Ozp54534qEMU1lkVPMM+u/1S+m/Dv93ESbMF4S1k8TBYN1+ZT
 Fgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=SmQffLB8/33ss0YiOCv7YSMbnw292P10yBb4MnsFb7c=;
 b=LqtRzZesEDY3OHt8WGvQ+biPFvCrYciW/+ylrss+UqHyaFVtZyLKHnB9i76D7pb3t0
 W2aZmtOFJRMV5mlidnXCyfO+eklNi+726Y4qBKnOIdYc8O11O/0E3ILUDtfMOnxprykA
 kCocqDlCjFef4u/JnLXnv7Inh4rZIfDX5uBPkuF7zVAFfMRmSjikyOqpFCi/AKmFh/Ym
 osu0gl5ERnJGPq1nYndYAwCH3eubwWzZZ31SlrUMuPQc7QEnorrIz2uYsNemCTyc7IQM
 HtO+JI+cNUygY0/g7qB0uq3s4eK/ySaHYOHBfxSBYJsQOhWNS8ZbpZXnd+YJ56MFwnlz
 Kk7g==
X-Gm-Message-State: AGi0PubT0eLUOS563sRNIwVn+0w+uBIMw8lSsTyKXEwyxztJKJxVYTs9
 4dnbnuoXDYjJss1UPqoJwzQ=
X-Google-Smtp-Source: APiQypIwTIkOCZxBP69yBfsXEThpZSa6rroh6Tyf1ofHcPapy+XsbXKRPRLX5RjDp8m78DYFJZ4+FA==
X-Received: by 2002:a62:e70b:: with SMTP id s11mr3865616pfh.32.1588335617787; 
 Fri, 01 May 2020 05:20:17 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id v1sm1993479pjs.36.2020.05.01.05.20.16
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 01 May 2020 05:20:17 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] riscv: Change the default behavior if no -bios option is
 specified
Date: Fri,  1 May 2020 05:19:05 -0700
Message-Id: <1588335545-649-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::441
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
X-List-Received-Date: Fri, 01 May 2020 12:20:23 -0000

From: Bin Meng <bin.meng@windriver.com>

Per QEMU deprecated doc, QEMU 4.1 introduced support for the -bios
option in QEMU for RISC-V for the virt machine and sifive_u machine.
The default behavior has been that QEMU does not automatically load
any firmware if no -bios option is included.

Now 2 releases passed, it's time to change the default behavior to
load the default OpenSBI firmware automatically. The firmware is
included with the QEMU release and no user interaction is required.
All a user needs to do is specify the kernel they want to boot with
the -kernel option.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/riscv/boot.c | 31 ++++---------------------------
 1 file changed, 4 insertions(+), 27 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 726300a..b76b2f3 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -41,34 +41,11 @@ void riscv_find_and_load_firmware(MachineState *machine,
 {
     char *firmware_filename = NULL;
 
-    if (!machine->firmware) {
+    if ((!machine->firmware) || (!strcmp(machine->firmware, "default"))) {
         /*
-         * The user didn't specify -bios.
-         * At the moment we default to loading nothing when this hapens.
-         * In the future this defaul will change to loading the prebuilt
-         * OpenSBI firmware. Let's warn the user and then continue.
-        */
-        if (!qtest_enabled()) {
-            warn_report("No -bios option specified. Not loading a firmware.");
-            warn_report("This default will change in a future QEMU release. " \
-                        "Please use the -bios option to avoid breakages when "\
-                        "this happens.");
-            warn_report("See QEMU's deprecation documentation for details.");
-        }
-        return;
-    }
-
-    if (!strcmp(machine->firmware, "default")) {
-        /*
-         * The user has specified "-bios default". That means we are going to
-         * load the OpenSBI binary included in the QEMU source.
-         *
-         * We can't load the binary by default as it will break existing users
-         * as users are already loading their own firmware.
-         *
-         * Let's try to get everyone to specify the -bios option at all times,
-         * so then in the future we can make "-bios default" the default option
-         * if no -bios option is set without breaking anything.
+         * The user didn't specify -bios, or has specified "-bios default".
+         * That means we are going to load the OpenSBI binary included in
+         * the QEMU source.
          */
         firmware_filename = riscv_find_firmware(default_machine_firmware);
     } else if (strcmp(machine->firmware, "none")) {
-- 
2.7.4


