Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mEBzB-0004yt-Is
	for mharc-qemu-riscv@gnu.org; Thu, 12 Aug 2021 10:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEByy-0004w2-5X
 for qemu-riscv@nongnu.org; Thu, 12 Aug 2021 10:46:57 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEByt-00022j-24
 for qemu-riscv@nongnu.org; Thu, 12 Aug 2021 10:46:55 -0400
Received: by mail-wr1-x431.google.com with SMTP id l18so8691250wrv.5
 for <qemu-riscv@nongnu.org>; Thu, 12 Aug 2021 07:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sj4uVflX1NeCVTG26nV2lT0SOJXdbcHLGHftdv8eQIE=;
 b=PWfLUZSS0OjuHcoW5vem97oU7wd+R5a990bQGFw2fuNwAoYx5QZ8t+069W5O9KaN/6
 447LwTW7do50J+W1O88mclztksJUgbQ5zOvtMzxs+63hRpcrecH403jozxdwru96qBun
 vTzhrMwbMCBuw8s85fvt6GnlZyYQmn2AdBujHGUg6Jd9XdFcMrwup5omx9hbd60PTRPA
 G6M8aC3CfVf3vx/ihJKlsEqCjsHVEY+y8smH0KDoxcc0QQSxFX7+wWM1pxmB6o3r+r80
 SiyRLwluMO5lvqFS8jBS6en0Twv4WIlKZNawQDfS/B2Q/iZMJtPE1UUfh0hjqNBAjxkg
 QBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sj4uVflX1NeCVTG26nV2lT0SOJXdbcHLGHftdv8eQIE=;
 b=qua8Gnlhraphw82F6kwvyABAG+YfV89Eqt+wwF66d/mvgViLdItxTmzxMZKVFhfXM/
 IYSvIchrkM9rahMywbnGvpYZIyJ2Njik8v/c8WYvkc8csEYDNm/gVjFSNBGCmACoMFA8
 CLTaWvRHBzGdvZh4LLwxfm4rtZ0d1WqeExARZPc0a6spi9hvlBWliib1hDesH52trMyu
 Rm1l9f/2qxP+QGdQRxRY4K2MxUWn5ov2m/UO2gbuWS43pdHASLPfWvXkhN2jBZA+siLN
 Drs/D+jsDiMV2Bnacre6sOXGsnp+iuwNaa9y1NSsEKybgHD+X27oo3ZPsYMw4a1eivzY
 pH7Q==
X-Gm-Message-State: AOAM53185iskabztVkL4dCsreSg1Gr1AReQKJgOKd46Vq1BPBRsHshLL
 3kwPfqiJjx/HnZH2EKd5xM0d/+kyKsXqzg==
X-Google-Smtp-Source: ABdhPJwLiJfeuUd+ryXJ3Jj4JkQvW2Zal/dujGDFAuLtPhUSIBon5fin/gkXJrzES8jfye4rg5jqkw==
X-Received: by 2002:adf:d0ce:: with SMTP id z14mr4444786wrh.418.1628779609109; 
 Thu, 12 Aug 2021 07:46:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id k12sm3307760wrd.75.2021.08.12.07.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 07:46:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] hw/riscv/virt.c: Assemble plic_hart_config string with
 g_strjoinv()
Date: Thu, 12 Aug 2021 15:46:47 +0100
Message-Id: <20210812144647.10516-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 12 Aug 2021 14:46:57 -0000

In the riscv virt machine init function, We assemble a string
plic_hart_config which is a comma-separated list of N copies of the
VIRT_PLIC_HART_CONFIG string.  The code that does this has a
misunderstanding of the strncat() length argument.  If the source
string is too large strncat() will write a maximum of length+1 bytes
(length bytes from the source string plus a trailing NUL), but the
code here assumes that it will write only length bytes at most.

This isn't an actual bug because the code has correctly precalculated
the amount of memory it needs to allocate so that it will never be
too small (i.e.  we could have used plain old strcat()), but it does
mean that the code looks like it has a guard against accidental
overrun when it doesn't.

Rewrite the string handling here to use the glib g_strjoinv()
function, which means we don't need to do careful accountancy of
string lengths, and makes it clearer that what we're doing is
"create a comma-separated string".

Fixes: Coverity 1460752
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/riscv/virt.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 4a3cd2599a5..26bc8d289ba 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -541,6 +541,24 @@ static FWCfgState *create_fw_cfg(const MachineState *mc)
     return fw_cfg;
 }
 
+/*
+ * Return the per-socket PLIC hart topology configuration string
+ * (caller must free with g_free())
+ */
+static char *plic_hart_config_string(int hart_count)
+{
+    g_autofree const char **vals = g_new(const char *, hart_count + 1);
+    int i;
+
+    for (i = 0; i < hart_count; i++) {
+        vals[i] = VIRT_PLIC_HART_CONFIG;
+    }
+    vals[i] = NULL;
+
+    /* g_strjoinv() obliges us to cast away const here */
+    return g_strjoinv(",", (char **)vals);
+}
+
 static void virt_machine_init(MachineState *machine)
 {
     const MemMapEntry *memmap = virt_memmap;
@@ -549,13 +567,12 @@ static void virt_machine_init(MachineState *machine)
     MemoryRegion *main_mem = g_new(MemoryRegion, 1);
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
     char *plic_hart_config, *soc_name;
-    size_t plic_hart_config_len;
     target_ulong start_addr = memmap[VIRT_DRAM].base;
     target_ulong firmware_end_addr, kernel_start_addr;
     uint32_t fdt_load_addr;
     uint64_t kernel_entry;
     DeviceState *mmio_plic, *virtio_plic, *pcie_plic;
-    int i, j, base_hartid, hart_count;
+    int i, base_hartid, hart_count;
 
     /* Check socket count limit */
     if (VIRT_SOCKETS_MAX < riscv_socket_count(machine)) {
@@ -604,17 +621,7 @@ static void virt_machine_init(MachineState *machine)
             SIFIVE_CLINT_TIMEBASE_FREQ, true);
 
         /* Per-socket PLIC hart topology configuration string */
-        plic_hart_config_len =
-            (strlen(VIRT_PLIC_HART_CONFIG) + 1) * hart_count;
-        plic_hart_config = g_malloc0(plic_hart_config_len);
-        for (j = 0; j < hart_count; j++) {
-            if (j != 0) {
-                strncat(plic_hart_config, ",", plic_hart_config_len);
-            }
-            strncat(plic_hart_config, VIRT_PLIC_HART_CONFIG,
-                plic_hart_config_len);
-            plic_hart_config_len -= (strlen(VIRT_PLIC_HART_CONFIG) + 1);
-        }
+        plic_hart_config = plic_hart_config_string(hart_count);
 
         /* Per-socket PLIC */
         s->plic[i] = sifive_plic_create(
-- 
2.20.1


