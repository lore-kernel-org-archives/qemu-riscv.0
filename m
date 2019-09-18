Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iAbsD-0006iR-Ul
	for mharc-qemu-riscv@gnu.org; Wed, 18 Sep 2019 11:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49178)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbs9-0006c3-Mc
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbs8-0006bz-Gk
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:01 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37981)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbs8-0006bb-CG
 for qemu-riscv@nongnu.org; Wed, 18 Sep 2019 11:28:00 -0400
Received: by mail-pg1-f195.google.com with SMTP id x10so47782pgi.5
 for <qemu-riscv@nongnu.org>; Wed, 18 Sep 2019 08:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=JhWZs3kYQOWNeKlb2pNkOyfw/b4rNeIZqwng3Q4zhcI=;
 b=YQIAEXmki2iJhJknwcnB0tcrsPloZgD8udm5f6th9IMnzETXZIhUgLWRgfZXwYcUR+
 i/n5gkB0elmTepJLKzh5fBS8NtmFFBQEkIBjIDmzk9nhmb3sUDmc5bl1DsPfRG4fC0cb
 l6S3TJlCThAKodGZDcqKvOdpPo3rrpYtkUc/2B1hkGN0zGV4E1FV9m5oO1+Zf/wfJVvx
 csEgOUyLeFzfttlYb33jH6WEF0hucMvi+BqYg97fyjjR5MYSZkXVeh9qFUGBy7xh8Fdo
 PAt8eeRrWUm56OXZnWRXUXHQj/j715tvAPprMb9x6n8uu3VXta4GoQ3l61KXc5JrozUo
 SCSQ==
X-Gm-Message-State: APjAAAXYcpi+H+Z6op4RELjD74I/LhFC1cCBXNx8/xk+gJJGLFKxH/pL
 UuD2hQP16ngP8GI2p/002Mbv8fN1Fa4=
X-Google-Smtp-Source: APXvYqzqHelCSqlljqByqBbSQ64IyZY/gtKz4+pYFTcK/H7Xc57YaL3meCdOUH47gbb4MRqn7TuopA==
X-Received: by 2002:aa7:9a48:: with SMTP id x8mr4645432pfj.201.1568820479005; 
 Wed, 18 Sep 2019 08:27:59 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id a4sm6595516pfn.110.2019.09.18.08.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:27:58 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:03 -0700
Message-Id: <20190918145640.17349-12-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,       qemu-devel@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.195
Subject: [Qemu-riscv] [PULL 11/48] riscv: Resolve full path of the given
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
X-List-Received-Date: Wed, 18 Sep 2019 15:28:04 -0000

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


