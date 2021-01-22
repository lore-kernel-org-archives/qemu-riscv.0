Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l2va8-0005C7-Vx
	for mharc-qemu-riscv@gnu.org; Fri, 22 Jan 2021 07:30:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2va0-00059V-Op; Fri, 22 Jan 2021 07:30:20 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:45177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2vZz-0003WA-1v; Fri, 22 Jan 2021 07:30:20 -0500
Received: by mail-pl1-x633.google.com with SMTP id b8so3073649plh.12;
 Fri, 22 Jan 2021 04:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U9+lbgMBY6BCQud13DBiM81bSRTsvraRi/V9uV1p9kE=;
 b=eResxwt7VnodV79bxTTahc44SObHbNnn68Xc6LFuvE6qpNBaWYzDy/o3Ew/NAGHMMd
 QvcIE4sYqfyaj4/KgDlBKdyNlZKqvDgPyIqXlxk1/Lbpd0MYDT+odAdWhm7Y3f9Z7u/k
 MYf3f73suy+WR5MdMH8EGYv4tnuqG/2cnjR51JOjHGei2inniw7P1059BBqql7PzjFKk
 SccR7xeHZchxM6fURVv4iCfxpCkLWstXdKENi6y3YnqpZtM4aGlAYtbOjrKnVFPdrHQn
 EFq5llPhLhk5PtvFRVnUdDKZ1it4BhMf0wA9tRZO8tSn/KY0BqvVb98ZUQgigk+En9nr
 hy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U9+lbgMBY6BCQud13DBiM81bSRTsvraRi/V9uV1p9kE=;
 b=fuu6DP5I9Ln0ZfY5DGOQClFdrWJBw+1rO/M5yGXqD309JOq7FON9N+AT1hOUr5uy1U
 Y2cyVEi27oeGGJozX9lJCxTmGR3DbutP8CYIeRT/La5ismY/3o7T5wYrp2jD7DhnszW+
 L95a5wXyar025c3yrjnBqsl04iGu1mG1tnH9pSJl092K8Gv3duFu1JMxBVTeX5sgfuXZ
 Wev0VCDNXNhwpnfdJ/wFT2DjknNGFaPITzuB2A8FIw05F/dqent73fLKpDr2MNn4nHsZ
 0ue27iln6TD9fOtvR+MVH0v6lOCnNefEkxbnf3lYmSGKBUNi/fP7bglCTdFjq2R9KNzV
 pjCw==
X-Gm-Message-State: AOAM532OY5wKcXJN4MaAGbOaiAQeewuxM+JlSYIuTPfEL9n6BOCL6cZU
 2AGYvr7HjmjbH/SmtdcYYNI=
X-Google-Smtp-Source: ABdhPJyrsUopfzE6sNGnhvvHo+tFIfh2v7sA7krXflGQjV4RAqMKN5hpyvIIfAt/x6SXHNUlOaDD+w==
X-Received: by 2002:a17:902:7b96:b029:de:7ae6:b8db with SMTP id
 w22-20020a1709027b96b02900de7ae6b8dbmr4757660pll.0.1611318617325; 
 Fri, 22 Jan 2021 04:30:17 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id 6sm7894996pfd.212.2021.01.22.04.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 04:30:16 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 3/4] hw/riscv: virt: Limit RAM size in a 32-bit system
Date: Fri, 22 Jan 2021 20:29:57 +0800
Message-Id: <20210122122958.12311-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210122122958.12311-1-bmeng.cn@gmail.com>
References: <20210122122958.12311-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 22 Jan 2021 12:30:26 -0000

From: Bin Meng <bin.meng@windriver.com>

RV32 supports 34-bit physical address hence the maximum RAM size
should be limitted. Limit the RAM size to 10 GiB, which leaves
some room for PCIe high mmio space.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/riscv/virt.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 1d05bb3ef9..4f44509360 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -590,6 +590,19 @@ static void virt_machine_init(MachineState *machine)
         }
     }
 
+    /* limit RAM size in a 32-bit system */
+    if (riscv_is_32bit(&s->soc[0])) {
+        /*
+         * Cast machine->ram_size to 64-bit for 32-bit host,
+         * to make the build on 32-bit host happy.
+         */
+        if ((uint64_t)(machine->ram_size) > 10 * GiB) {
+            /* 32-bit host won't have a chance to execute here */
+            machine->ram_size = 10 * GiB;
+            error_report("Limitting RAM size to 10 GiB");
+        }
+    }
+
     /* register system main memory (actual RAM) */
     memory_region_init_ram(main_mem, NULL, "riscv_virt_board.ram",
                            machine->ram_size, &error_fatal);
-- 
2.25.1


