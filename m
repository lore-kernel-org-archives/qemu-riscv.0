Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iP7Py-00061y-Cp
	for mharc-qemu-riscv@gnu.org; Mon, 28 Oct 2019 11:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34970)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iP7Ps-0005oh-EA
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iP7Pr-00045w-7u
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:48 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37833)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iP7Pr-00045O-1w
 for qemu-riscv@nongnu.org; Mon, 28 Oct 2019 11:58:47 -0400
Received: by mail-pg1-x541.google.com with SMTP id p1so7165019pgi.4
 for <qemu-riscv@nongnu.org>; Mon, 28 Oct 2019 08:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=B4DzWJmRClZnGWtF1qIJV4FygyaOxQSP++ywZKquvFY=;
 b=REX1WUoNliqFnVDLbWcSAI0HkPLKE7LIwfHXecIbHCYQfPUoGR5mTG1K7ylgS14BWH
 IsDj/4rjWozlR7PYQL6O+kXEEbo2bLEYXI2geYiJV2XD8gyEBRlgn72aQTEORi9R5Xxm
 ei67dasHslcUMaAtBd4m+Of77M3iq3iNjVPnEdccmIyrQ0kVfhzyyGuzrMXlDEClJ4+z
 4ckEvJtdMKRIQEeiBwdg7PMz6YqyynpGjK/o9xe/UEeX2za5Nixv5dPr7bitLHYmJKGx
 UrXcOAQVTLeVeL61gvNHnlNGeh/Xnzt2jRyfALT9OtLyAQZF9SWSuELjfTu/lY01h5zi
 eJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=B4DzWJmRClZnGWtF1qIJV4FygyaOxQSP++ywZKquvFY=;
 b=GYM17Uma2U7TTSRXAmPkbX+wvZXdSNPLgKm06TkWdczNpMgHkfapDWQjpf7xfm1iG8
 vfi6InfssHFMlBYeYlfJHQSrKgPOwmnwfAAbcxCO93NWTlFrD4LDca93cGjS+ROote2F
 0a4ABEdsrgbmhcQDPecwYweljJn0UjF3glnUjNddk6c0iL+Xj6RFD1nGaNxJeZtu8i8Q
 7TEmTtVn1VTv6r2zfXq/34WEqJtbRyispDUBZLdTYiLhI6pkX/I4tmflSWFZK+mv6XtI
 jub3rGRfToizkBT/8KKjiwulMDUhH8sg0mSo7dKoyjDSevxUhk1FFtqNc6FCm3MIcdIy
 kH5Q==
X-Gm-Message-State: APjAAAVc9MxDZdQfzBvBsJKQgzj91R1ddn1bkSuZ5RHO+cQmk7BCVGSL
 ejnXptAmm+GoCFLucjJVFuUKwpPcRhvjRA==
X-Google-Smtp-Source: APXvYqxFFSQWgC+jiM/JRB7o4WqgnTYD7vT75XHmBLnW1lZwqNYX4kdzSjSLnk7gUf2Vo+H1h3qC0Q==
X-Received: by 2002:a62:1e06:: with SMTP id e6mr20552435pfe.181.1572278326126; 
 Mon, 28 Oct 2019 08:58:46 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 66sm3855725pgi.49.2019.10.28.08.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 08:58:45 -0700 (PDT)
Subject: [PULL 17/18] riscv/boot: Fix possible memory leak
Date: Mon, 28 Oct 2019 08:49:01 -0700
Message-Id: <20191028154902.32491-18-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191028154902.32491-1-palmer@sifive.com>
References: <20191028154902.32491-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bmeng.cn@gmail.com>,
 ilippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, 
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
X-List-Received-Date: Mon, 28 Oct 2019 15:58:50 -0000

From: Alistair Francis <alistair.francis@wdc.com>

Coverity (CID 1405786) thinks that there is a possible memory leak as
we don't guarantee that the memory allocated from riscv_find_firmware()
is freed. This is a false positive, but let's tidy up the code to fix
the warning.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/boot.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 2e92fb0680..7fee98d2f8 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -38,7 +38,7 @@ void riscv_find_and_load_firmware(MachineState *machine,
                                   const char *default_machine_firmware,
                                   hwaddr firmware_load_addr)
 {
-    char *firmware_filename;
+    char *firmware_filename = NULL;
 
     if (!machine->firmware) {
         /*
@@ -70,14 +70,11 @@ void riscv_find_and_load_firmware(MachineState *machine,
          * if no -bios option is set without breaking anything.
          */
         firmware_filename = riscv_find_firmware(default_machine_firmware);
-    } else {
-        firmware_filename = machine->firmware;
-        if (strcmp(firmware_filename, "none")) {
-            firmware_filename = riscv_find_firmware(firmware_filename);
-        }
+    } else if (strcmp(machine->firmware, "none")) {
+        firmware_filename = riscv_find_firmware(machine->firmware);
     }
 
-    if (strcmp(firmware_filename, "none")) {
+    if (firmware_filename) {
         /* If not "none" load the firmware */
         riscv_load_firmware(firmware_filename, firmware_load_addr);
         g_free(firmware_filename);
-- 
2.21.0


