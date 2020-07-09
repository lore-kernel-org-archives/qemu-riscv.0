Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtTRD-00031Z-5I
	for mharc-qemu-riscv@gnu.org; Thu, 09 Jul 2020 06:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jtTRB-0002zk-FI; Thu, 09 Jul 2020 06:05:53 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:34922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jtTR9-0005Jr-VH; Thu, 09 Jul 2020 06:05:53 -0400
Received: by mail-pl1-x643.google.com with SMTP id x9so652141plr.2;
 Thu, 09 Jul 2020 03:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mm+f7F/Pdu5zigQk44EA/Ex1Vg2tqyqtOfNiVV6EHYA=;
 b=r2PBewpqJTFDfFdFds1X2/yFvJT64aXWjBaTQlcIrmIYJCwfAhc3s24fDQCU9q1pcw
 gzuU88ye67HoLpJrA2P+pNB7HWxc95TggaMRbQQ63Umfd2J/OIe23CB7I0+eAkPt2DuK
 2asrtujfTW27ShQ3pfu3UQcjpIjTOlTJDYvWhQ4+3b3tLAqNpS1aqfiFMmt9AmAKs4Xe
 JbFgXU7kR6PmOt3rcYP9pyzAcEvJcXXHRouZIrJ+1d+biRyF53hSi7B9MemcxZIDgq8F
 v3KKPEUmzn2ERsqXqC90TvWtT4ojb+rEzk9xlrAqRRHBlIxOPhD8rcnxjTNtcyj5R2wB
 YHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mm+f7F/Pdu5zigQk44EA/Ex1Vg2tqyqtOfNiVV6EHYA=;
 b=pZwUGMWbwNjyCA7TT8z64/lSW0EhgbW0UsfYWIj8HxHWUTZHwt7OoeaVz8Bn2TQuiz
 ecduJOSXJpaD69T3FFQsyz+j66vNVAmpSb5Rht4NaLFU1ia7hjLBhMUjavgmg0lXsh6l
 tf+xZIi/J7wYdB3meMtveaQtXuwaDZTJIY0oTAe5iH/oFqxW+Xm4mWIlMOvOJQ3BOO+j
 LSR4RJ5B7003V8vlbHmcxoA2k38/ieee3rbKLzDvjbD6trccd8Y2Tr29Sax0HEnU4Je9
 13LU1Errmee4cHTC6kFU8PRpfuA4+vcgp/Z3nkbBiY7mWpBQTzfK24ryEPEafhjOjRlx
 w6QA==
X-Gm-Message-State: AOAM530vN+rQ8W6TxAJwLnSRMTk6nIAXW3rMKPaFFGEsLbWuEnAqhu/X
 735A2GXfpG3HpBM9tFrPp3g=
X-Google-Smtp-Source: ABdhPJyIGAu+BOVUWelra4LrtVxE5f5UcZfBtGsvxfPcDcgyt1H7orDdzGDowMC914vpqZy26m5tJw==
X-Received: by 2002:a17:902:ff0c:: with SMTP id
 f12mr54612815plj.254.1594289150049; 
 Thu, 09 Jul 2020 03:05:50 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id cv7sm2093972pjb.9.2020.07.09.03.05.49
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Thu, 09 Jul 2020 03:05:49 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 2/2] hw/riscv: sifive_u: Provide a reliable way for
 bootloader to detect whether it is running in QEMU
Date: Thu,  9 Jul 2020 03:05:44 -0700
Message-Id: <1594289144-24723-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1594289144-24723-1-git-send-email-bmeng.cn@gmail.com>
References: <1594289144-24723-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Thu, 09 Jul 2020 10:05:53 -0000

From: Bin Meng <bin.meng@windriver.com>

The reset vector codes are subject to change, e.g.: with recent
fw_dynamic type image support, it breaks oreboot again.

Add a subregion in the MROM, with the size of machine RAM stored,
so that we can provide a reliable way for bootloader to detect
whether it is running in QEMU.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v2:
- correctly populate the value in little-endian

 hw/riscv/sifive_u.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 3413369..79519d4 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -88,6 +88,7 @@ static const struct MemmapEntry {
 
 #define OTP_SERIAL          1
 #define GEM_REVISION        0x10070109
+#define MROM_RAMSIZE_OFFSET 0xf8
 
 static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     uint64_t mem_size, const char *cmdline)
@@ -496,6 +497,26 @@ static void sifive_u_machine_init(MachineState *machine)
     riscv_rom_copy_firmware_info(memmap[SIFIVE_U_MROM].base,
                                  memmap[SIFIVE_U_MROM].size,
                                  sizeof(reset_vec), kernel_entry);
+
+    /*
+     * Tell guest the machine ram size at MROM_RAMSIZE_OFFSET.
+     * On real hardware, the 64-bit value from MROM_RAMSIZE_OFFSET is zero.
+     * QEMU aware bootloader (e.g.: oreboot, U-Boot) can check value stored
+     * here to determine whether it is running in QEMU.
+     */
+
+    uint32_t ram_size[2] = {
+        machine->ram_size,
+        ((uint64_t)(machine->ram_size)) >> 32
+    };
+
+    /* copy in the ram size in little_endian byte order */
+    for (i = 0; i < ARRAY_SIZE(ram_size); i++) {
+        ram_size[i] = cpu_to_le32(ram_size[i]);
+    }
+    rom_add_blob_fixed_as("mrom.ram_size", ram_size, sizeof(ram_size),
+                          memmap[SIFIVE_U_MROM].base + MROM_RAMSIZE_OFFSET,
+                          &address_space_memory);
 }
 
 static bool sifive_u_machine_get_start_in_flash(Object *obj, Error **errp)
-- 
2.7.4


