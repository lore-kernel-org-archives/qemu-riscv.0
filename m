Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7xvt-0007eG-Kp
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 04:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57118)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvo-0007XL-Kv
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvn-0006TE-CV
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:52 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35169)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xvn-0006Sm-7V
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 04:24:51 -0400
Received: by mail-wr1-f68.google.com with SMTP id g7so23512696wrx.2
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 01:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=JhWZs3kYQOWNeKlb2pNkOyfw/b4rNeIZqwng3Q4zhcI=;
 b=AUnEooomi8yKrsHLMcog2xeex5UQJuKAbT+AAW/ABHKNUyoakZrCax//jnkzacResg
 LdQ6/7JrpT0JM3i4DhCqtjy0asp5R3Sv6bIdDofPtvOCyCevK1fWrHf2nZ2XxqfQY6pb
 nhny+NsF8CyR20KFVh4bf3D9Q/wW/Gsb42sFFMWF1EUooP3q4PcrvmDqfw+w8K+9rTfn
 6DpJTEa09yRWyMYkS2vKD9RD4pO0d6EiV8xzwaKxmVt6lgoOJuTw+YPc33ql4fgORIyu
 EMKyAQdF8Y3Re+z1xFG3XHVzcIIjUd6/qOIP0rAqI3/jk6MuHVH1NapjtUGevaQqnCog
 PIHg==
X-Gm-Message-State: APjAAAVW1HHfiQIKQoBKuhamiDs5u5S7Whfn7e2cwrVcfpp8x/24pLOI
 +My7FREqG9zhNGjl4zk7JyzHJDNWzNnZ8A==
X-Google-Smtp-Source: APXvYqzlnc+gSSy/GNPrH+PSb/iYULk/PXbNQ8Mk70Oaj5xbwlAvH3mZ73UihGSr+hbyQCqSsvlh2w==
X-Received: by 2002:adf:dfc5:: with SMTP id q5mr31265090wrn.142.1568190289848; 
 Wed, 11 Sep 2019 01:24:49 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id 17sm14025065wrl.15.2019.09.11.01.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:24:49 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:37 -0700
Message-Id: <20190910190513.21160-12-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: [Qemu-riscv] [PULL 11/47] riscv: Resolve full path of the given
 bios image
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
X-List-Received-Date: Wed, 11 Sep 2019 08:24:55 -0000

From: Bin Meng <bmeng.cn@gmail.com>

At present when "-bios image" is supplied, we just use the straight
path without searching for the configured data directories. Like
"-bios default", we add the same logic so that "-L" actually works.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/boot.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 10f7991490..2e92fb0680 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -72,14 +72,14 @@ void riscv_find_and_load_firmware(MachineState *machine,
         firmware_filename = riscv_find_firmware(default_machine_firmware);
     } else {
         firmware_filename = machine->firmware;
+        if (strcmp(firmware_filename, "none")) {
+            firmware_filename = riscv_find_firmware(firmware_filename);
+        }
     }
 
     if (strcmp(firmware_filename, "none")) {
         /* If not "none" load the firmware */
         riscv_load_firmware(firmware_filename, firmware_load_addr);
-    }
-
-    if (!strcmp(machine->firmware, "default")) {
         g_free(firmware_filename);
     }
 }
-- 
2.21.0


