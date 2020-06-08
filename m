Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jiIbb-0001E5-Jn
	for mharc-qemu-riscv@gnu.org; Mon, 08 Jun 2020 10:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jiIbX-00016U-Pi; Mon, 08 Jun 2020 10:18:23 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:42233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jiIbW-0004UL-UI; Mon, 08 Jun 2020 10:18:23 -0400
Received: by mail-pg1-x544.google.com with SMTP id e9so8787371pgo.9;
 Mon, 08 Jun 2020 07:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=z350dIqBZZ4Mub4LWJOXzllmsg8jdX8vqSMFR8YlXdk=;
 b=g5L3myCeSa2JAUigwR+O+2eqN/NO6eze8IGWXailqX3h4LevxjBwd7BpDuKjd5htBW
 zpmizb/YW7OK8D129WxN4pTyivRWeZfwbscQ+DL9VrbkKqkGyW9R40o7W9M6ymkihk61
 aG/3cBc2LFyGYEjBaLT92U3YzdwttRDp57Hh6M1n43yyy5kIU6zB0GZa0e8b7qQjAwkR
 LAJxiskXsmOumISPMewDHPhj3l/Ug2pqM/oV9Vcghdd/kCTdI+W7FafcWP4HHZhnTTDu
 riguo5omROCdDE5LdgLdrq2sEi3ZU5WmEZVEDz/1TuvfYl5eQfMmMiFZPBmIzrMbapQ4
 cEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=z350dIqBZZ4Mub4LWJOXzllmsg8jdX8vqSMFR8YlXdk=;
 b=D1By3tJ0Gz6nwnlYmffh08cngTBdR+Uuz5H3Y0etAczz+3HG1A8N8CZkS3279Vsz3G
 k8MXgxHzoNCPuLgMuoeOfzxJT2YsaNF8D8l2zz7Bu++H54GW8zAaEF1COVbA3ywfEmO+
 EFMQX+um8b9FzrPYTyAMYvzDdA4AblA6pBgwKDRsZtNtW1kot2zhr5dMyh/RImGUJDN0
 WIZ6cMQDSln387+vRxPSKFIgcYhwPA2YlAVumS6UMlAoFyI3eV7L4yMSZP1HNrEzeOkD
 gz2/JONig+FKG63zac0bOcUVYFomiszIKeYI311UX77hfMMrPTdZoA8IMNGTNvGFVxCe
 UbTw==
X-Gm-Message-State: AOAM532cA2i093YKDE1KUCFyDc7sM5h98FJbb9cdRx3DYEsyl3N+x/QP
 /khFaUOJFQuDpyt/3D6ZgVs=
X-Google-Smtp-Source: ABdhPJyAEnA7feVIy0rajM++SC/yVhf5TkPY5B7XM/9DFzektQm2azUXo9s0NQEkjGndSjSmpm3P5g==
X-Received: by 2002:a63:534d:: with SMTP id t13mr20955553pgl.32.1591625901183; 
 Mon, 08 Jun 2020 07:18:21 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id b19sm7292575pft.74.2020.06.08.07.18.20
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Mon, 08 Jun 2020 07:18:20 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 04/15] hw/riscv: sifive_u: Generate device tree node for OTP
Date: Mon,  8 Jun 2020 07:17:33 -0700
Message-Id: <1591625864-31494-5-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1591625864-31494-1-git-send-email-bmeng.cn@gmail.com>
References: <1591625864-31494-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 08 Jun 2020 14:18:24 -0000

From: Bin Meng <bin.meng@windriver.com>

Upstream U-Boot v2020.07 codes switch to access SiFive FU540 OTP
based on device tree information. Let's generate the device tree
node for OTP.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/riscv/sifive_u.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index cf7f833..8dc6842 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -207,6 +207,17 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     g_free(cells);
     g_free(nodename);
 
+    nodename = g_strdup_printf("/soc/otp@%lx",
+        (long)memmap[SIFIVE_U_OTP].base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_cell(fdt, nodename, "fuse-count", SIFIVE_U_OTP_REG_SIZE);
+    qemu_fdt_setprop_cells(fdt, nodename, "reg",
+        0x0, memmap[SIFIVE_U_OTP].base,
+        0x0, memmap[SIFIVE_U_OTP].size);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible",
+        "sifive,fu540-c000-otp");
+    g_free(nodename);
+
     prci_phandle = phandle++;
     nodename = g_strdup_printf("/soc/clock-controller@%lx",
         (long)memmap[SIFIVE_U_PRCI].base);
-- 
2.7.4


