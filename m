Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lQvNX-0005x8-Tb
	for mharc-qemu-riscv@gnu.org; Mon, 29 Mar 2021 13:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lQvNR-0005uY-SX; Mon, 29 Mar 2021 13:08:33 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:34338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lQvNP-0004Ru-Mw; Mon, 29 Mar 2021 13:08:33 -0400
Received: by mail-qt1-x82e.google.com with SMTP id c6so9859316qtc.1;
 Mon, 29 Mar 2021 10:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BOBJj4Vg0E/HMoaDJ7ga/GYXXHYXn4c4V9yyzSn/7ws=;
 b=jNaSdyoHycBBXLougSAJIbp/fDevu7Dw6C5e2G3dUe1kjVEnrRylQzTKcoEumzYJXL
 FErrVEZrRLlWNrS5703An+lI7nbyJsduF6K85a5dKlCLgDfNIXtSXgmQECTO/sc5QY4n
 USBYui7+0lWVzXA0ittu8FMjjNt0EGrDt1WkzkI+g2eaAL6MLQku5G6jmaxEJha1/cW7
 +61BvZrnAe1/yvD246RSinIbyDqswDCXRCtk5M6ooqnXVCakBEGsRp4EbUp+snfH2C0M
 EtLS7EmiJU0r9OObdC5dQoVFcoNPEcW0kyOX+bQL7JNM0V9Ew1uVSELByOH1LfCQVjVD
 ImVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BOBJj4Vg0E/HMoaDJ7ga/GYXXHYXn4c4V9yyzSn/7ws=;
 b=cT3PDGLU9eF3tlI4Ff+y7RtzPoSJO8/uKRYSEfUjNBndwq1uLUyjvLHMjvDy+91KZ7
 XEyLnO9NlZYNJ9zPvXbJBlsEOmBau5CEG2rmgoguCppMd6E24uK6ROssbyTwCaDCOFtQ
 29PCcCup7aUsIWchInZykefQZ75R47zu8OLhtU6B4b23/acJ3BlwrN6V1nbwOsrgW/Ut
 ZbCua0Yy4O0Mp5XnF7sC05+HaN3FCXjCxFDOBTX1+uk7OsI2TsA96wnTLQ72tHsTA+Zn
 z4IbTbdOjKez/Rn2sVnS/ho0Z9RwzA8l2792l5y9kVOJ4745ngCyUMxJnCr8kVcyhBO3
 ywPQ==
X-Gm-Message-State: AOAM531T/VpkX9fZ60t2O4HaipAw6+R2SJpQPBIHDD0ieGGo99EChnaz
 9n0WXFCm3WX2KShxHXKLyNk=
X-Google-Smtp-Source: ABdhPJyNJR4RdoWJega5GwmjfcEu/M2qAV8qwyQ6eN7yA1LrkyA7viq1JrkD8ptnG/fyffY4JBhKbg==
X-Received: by 2002:ac8:5e07:: with SMTP id h7mr23690978qtx.225.1617037710416; 
 Mon, 29 Mar 2021 10:08:30 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id i6sm13553981qkf.96.2021.03.29.10.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 10:08:30 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 2/8] hw/riscv: virt: Switch to use
 qemu_fdt_setprop_string_array() helper
Date: Tue, 30 Mar 2021 01:08:12 +0800
Message-Id: <20210329170818.23139-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210329170818.23139-1-bmeng.cn@gmail.com>
References: <20210329170818.23139-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82e.google.com
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
X-List-Received-Date: Mon, 29 Mar 2021 17:08:35 -0000

From: Bin Meng <bin.meng@windriver.com>

Since commit 78da6a1bca22 ("device_tree: add qemu_fdt_setprop_string_array helper"),
we can use the new helper to set the compatible strings for the
SiFive test device node.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/riscv/virt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index c0dc69ff33..5d0c1e5903 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -395,8 +395,9 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
         (long)memmap[VIRT_TEST].base);
     qemu_fdt_add_subnode(fdt, name);
     {
-        const char compat[] = "sifive,test1\0sifive,test0\0syscon";
-        qemu_fdt_setprop(fdt, name, "compatible", compat, sizeof(compat));
+        const char *compat[3] = { "sifive,test1", "sifive,test0", "syscon" };
+        qemu_fdt_setprop_string_array(fdt, name, "compatible", (char **)&compat,
+                                      ARRAY_SIZE(compat));
     }
     qemu_fdt_setprop_cells(fdt, name, "reg",
         0x0, memmap[VIRT_TEST].base,
-- 
2.25.1


