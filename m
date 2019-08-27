Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i2cwj-0003qO-Lo
	for mharc-qemu-riscv@gnu.org; Tue, 27 Aug 2019 10:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47238)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1i2cwd-0003i8-Uw
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 10:59:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1i2cwb-0003xP-AI
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 10:59:39 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:40976)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1i2cwS-0003n5-Ds; Tue, 27 Aug 2019 10:59:29 -0400
Received: by mail-pg1-x543.google.com with SMTP id x15so12850907pgg.8;
 Tue, 27 Aug 2019 07:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=pn67UZsnC0fBABeEhbb7qsEbngTloit0lPBfCFb080c=;
 b=Qz5x9RVY0f6zy1sxv15jZFQgu4BTKyctPMGPG+Fhn+abLOZa3KMUSIc0vaaMHXaGtm
 y0l1aWpHn6VU2mBOH+Tt+PsASTQSFfDJ59u90OAs7wNTH0VAVFiASqKDOafK+BQn318B
 AM3eDU6E87R7jFUZlfYPUbIzsKxfAnZlxc4bxQGLxT0fR5X3Tkb4pknyyHrrNXOiC/wl
 7q+U+Rdf31sWa/tVHNVIDrsAyqXSwy5EJwSdgN6I/G3wsM/CxjpUTrGdF+MqT4ZF3LO3
 AKCnBdczHIR8OubncjYfyFE9NsfVQfsHH3I6g9Jz+KeuA5wklpA9mQI6aHGD79R415ut
 YkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=pn67UZsnC0fBABeEhbb7qsEbngTloit0lPBfCFb080c=;
 b=NS2nS4xSXFH2/DXbnXwylV1eJtMD96KNxg+WeN6s3vDrSmbIAAvvhFfl+HXw+duaWb
 sD1q13e9gjH4x9p9yZ2On91uGO/tLFd7vVIaSLtBq6yMqgYiYS0FcgaHvgSQKnBsI/37
 mTWrCeUBexveAvafAhm3X2OS7UeOaY5SWyiOgq1IsHVsDnEKEnnEYsrZxctHgeWQrU4X
 XDBd2R1SNDOekC0CA3Nj6O7tqw6lnSEkNfDgnQPPfNNLbILVylGUK5qPKd1/x804zL2O
 2rpEaNu8qXSIlVJNnYGlmZ9r78DlrcsenEL5ek2zObjo6rwLSFOmaAKvIOrQOOsW+BvQ
 K9cw==
X-Gm-Message-State: APjAAAUEjWSqddj1I4h7nwxJECs1JQKwLHP4d09VFUUYNXYVddbAEE7V
 8IkuWnfrbAVlSYO0Zn2a0X4=
X-Google-Smtp-Source: APXvYqwyBZSKgsxtQBF/ZMY0B9UtRW65m9H5AhDbJqRcx34mYlvhBBgfWfRL4GC26g1L+e2+PQaClw==
X-Received: by 2002:a63:eb06:: with SMTP id t6mr21544689pgh.107.1566917959504; 
 Tue, 27 Aug 2019 07:59:19 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id j15sm14839344pfr.146.2019.08.27.07.59.18
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 27 Aug 2019 07:59:18 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Date: Tue, 27 Aug 2019 07:58:39 -0700
Message-Id: <1566917919-25381-31-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1566917919-25381-1-git-send-email-bmeng.cn@gmail.com>
References: <1566917919-25381-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-riscv] [PATCH v6 30/30] riscv: sifive_u: Update model and
 compatible strings in device tree
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
X-List-Received-Date: Tue, 27 Aug 2019 14:59:44 -0000

This updates model and compatible strings to use the same strings
as used in the Linux kernel device tree (hifive-unleashed-a00.dts).

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 hw/riscv/sifive_u.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index f14217c..c7f7c2c 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -96,8 +96,9 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
         exit(1);
     }
 
-    qemu_fdt_setprop_string(fdt, "/", "model", "ucbbar,spike-bare,qemu");
-    qemu_fdt_setprop_string(fdt, "/", "compatible", "ucbbar,spike-bare-dev");
+    qemu_fdt_setprop_string(fdt, "/", "model", "SiFive HiFive Unleashed A00");
+    qemu_fdt_setprop_string(fdt, "/", "compatible",
+                            "sifive,hifive-unleashed-a00");
     qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
     qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
 
-- 
2.7.4


