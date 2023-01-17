Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHm0Z-0004xQ-3W
	for mharc-qemu-riscv@gnu.org; Tue, 17 Jan 2023 08:28:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHm0X-0004wh-6N
 for qemu-riscv@nongnu.org; Tue, 17 Jan 2023 08:28:09 -0500
Received: from mail-oa1-x43.google.com ([2001:4860:4864:20::43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pHm0V-0001TR-7g
 for qemu-riscv@nongnu.org; Tue, 17 Jan 2023 08:28:08 -0500
Received: by mail-oa1-x43.google.com with SMTP id
 586e51a60fabf-1322d768ba7so31907371fac.5
 for <qemu-riscv@nongnu.org>; Tue, 17 Jan 2023 05:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wjDJws69/b2lYY2Ofw7BKsKud7AlxZ3crKbm2ST0OU4=;
 b=aR3tSfMsvJ+SmHFzbT/w+DElJ7g9fi31QtuEa6rM94lWQ2a4eIt9nC1DmHdSVDLLd1
 VsMUpKqTDwzduyubmt3feJBwOBLDhyEuJby0nmGO9NHCn9SXmEyb1GujCywp4lHqs9us
 4HCFCqK0rm37Tze0rmxVFs0ZBhsH88bVEy1IcZ2zedTPKdqmA0PEXUaeA5CwDxGUsWZG
 WtyeDXJk913imfQJBSCvl70c/pbeRz8i5KXKsV+ummo9+CKXts0w+YFw6lLn7vpfWERx
 L6/4mMfs1Ba+olDQtT9qS34pOnkbeVQRrXB4bUpnWtdWLEQbfHplGFbvLFoG20GxXP1P
 scig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wjDJws69/b2lYY2Ofw7BKsKud7AlxZ3crKbm2ST0OU4=;
 b=0aXecKXHmFP1XEYbMtvhLeLQtT1kWHwYCcsZM8R61V3vVBc9fVjI7dFMo5v+gVQ4/K
 fpeMKq9JCLmZQIxIQwuHkv3up0ZcfbKw9hMQASUtszgLJA6ZGSNo4GPe2YxHAU0SCeHA
 kxcFiMNEep01CJwIPKXOVIvijQTEEV9S5JUcqVUCXL5/lE6WXZJUDBt3Aqwe0LR0w6+s
 ApNVIiIK4YuFyjBL+Q8DSX2uDtnuISr2G/ll7KKY06AmpScc4nV8LTAuLsFXMQvHkqyP
 uygRt8VAO5517a9aQ85WVWmWqXpNKohHOoDK4chBhG07Y1lyTY8DeBeSduU/XxQokoEK
 PwTQ==
X-Gm-Message-State: AFqh2kr0GnfpSvDDt3ooRGUT+DByNlpBgZSkrlqIZ3vbA0vhynOEOuND
 2rSeP+l0/TANVMCdeghz+y6jbQ==
X-Google-Smtp-Source: AMrXdXuF7p4oLukFB/Lfsv/eQe9Rs9KexoHqHaeBwnHzi4gN34CSglv0AWY07Q9TMJupm9Nlg9RGgA==
X-Received: by 2002:a05:6870:8999:b0:13c:2539:216 with SMTP id
 f25-20020a056870899900b0013c25390216mr1769389oaq.10.1673962085978; 
 Tue, 17 Jan 2023 05:28:05 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 v12-20020a056870b50c00b0014fc049fc0asm16538270oap.57.2023.01.17.05.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 05:28:05 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng.cn@gmail.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 1/1] hw/riscv/virt.c: move create_fw_cfg() back to
 virt_machine_init()
Date: Tue, 17 Jan 2023 10:27:51 -0300
Message-Id: <20230117132751.229738-2-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117132751.229738-1-dbarboza@ventanamicro.com>
References: <20230117132751.229738-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::43;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x43.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jan 2023 13:28:09 -0000

Commit 1c20d3ff6004 ("hw/riscv: virt: Add a machine done notifier")
moved the initialization of fw_cfg to the virt_machine_done() callback.

Problem is that the validation of fw_cfg by devices such as ramfb is
done before the machine done notifier is called. Moving create_fw_cfg()
to machine_done() results in QEMU failing to boot when using a ramfb
device:

./qemu-system-riscv64 -machine virt -device ramfb -serial stdio
qemu-system-riscv64: -device ramfb: ramfb device requires fw_cfg with DMA

The fix is simple: move create_fw_cfg() config back to
virt_machine_init(). This happens to be the same way the ARM 'virt'
machine deals with fw_cfg (see machvirt_init() and virt_machine_done()
in hw/arm/virt.c), so we're keeping consistency with how other machines
handle this device.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1343
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index e6d4f06e8d..4a11b4b010 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1254,13 +1254,6 @@ static void virt_machine_done(Notifier *notifier, void *data)
     firmware_end_addr = riscv_find_and_load_firmware(machine, firmware_name,
                                                      start_addr, NULL);
 
-    /*
-     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
-     * tree cannot be altered and we get FDT_ERR_NOSPACE.
-     */
-    s->fw_cfg = create_fw_cfg(machine);
-    rom_set_fw(s->fw_cfg);
-
     if (drive_get(IF_PFLASH, 0, 1)) {
         /*
          * S-mode FW like EDK2 will be kept in second plash (unit 1).
@@ -1468,6 +1461,13 @@ static void virt_machine_init(MachineState *machine)
     memory_region_add_subregion(system_memory, memmap[VIRT_MROM].base,
                                 mask_rom);
 
+    /*
+     * Init fw_cfg. Must be done before riscv_load_fdt, otherwise the
+     * device tree cannot be altered and we get FDT_ERR_NOSPACE.
+     */
+    s->fw_cfg = create_fw_cfg(machine);
+    rom_set_fw(s->fw_cfg);
+
     /* SiFive Test MMIO device */
     sifive_test_create(memmap[VIRT_TEST].base);
 
-- 
2.39.0


