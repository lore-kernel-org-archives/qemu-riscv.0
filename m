Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLqj6-000619-7w
	for mharc-qemu-riscv@gnu.org; Wed, 10 Aug 2022 14:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oLqik-0005v1-Hr
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 14:46:22 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oLqih-0007Gx-Qg
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 14:46:22 -0400
Received: by mail-wr1-x434.google.com with SMTP id h13so18749491wrf.6
 for <qemu-riscv@nongnu.org>; Wed, 10 Aug 2022 11:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Ojga+9p3SQfxSYMJSQhI2VTXIlpadm2PoIsQ+roVjwc=;
 b=MSfjm0YokPiaDmHPuaROaUDsZ8/pUXA831Er++GvzGGxnCIqEJOn6huU50l20IVB7y
 KDdDZEYvddfyEURgxkW13YIlSBRLXztdKfkHj2rM2ei9HuD82EDKcbaKcfwTsR3/Msce
 +sLfW4SRSgi+Ys0qanx+nQB/mb7kSQI22B9oG9bWhwJriwGv7rwO4M2QkF/uAKkeKFl4
 2OqWSv3yOBdvgIl5pP7I4Fq9eH+nUrtU5lOAdkivbG0P7di/+SXRojEOLrF4SIg6OHOx
 WnPPPK30FKq0rmP87iqw2i7Hk9+yptClFFzVMG7NWSeHIAVutG1aSYQ6yE8isfrzYB2W
 TIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Ojga+9p3SQfxSYMJSQhI2VTXIlpadm2PoIsQ+roVjwc=;
 b=xlywVV+BgAXkMeWGRwvUbQidIKPpmtWzTIe2vYXYZHERrUZ+fXidBk/FnTX9X4qnYm
 CiH/JbLhpO4NDrv3Md3VEsXwDYmHmorxRePieFs8a6D3kkocoNlBQBitrMk1rAJcSfRB
 fdlqhxMlL2xjowoX6kUVEQAcWgK6JvhZL3vvaiAKg5LnK7XJ55IQrMx9QV0KRtcUKmpy
 NXiLDRFnzA74iXfVF+EoeWubRBw7f4fJ7emgjpGfy6XYkZMnG5XVgTxjsLdcsa015h4z
 FXlvCOZ+ynaKwyAKvCurfw32uCB3pfXTAHy5I/afM8rZOkJsMDz5WtLHUduh2V6Io7Z5
 MzHA==
X-Gm-Message-State: ACgBeo2VcSbIPzNWr23Ha3Ycp86ErU7BCZuMAqiEIDCH9FsibWfvJKzY
 XCL9aHVjD7UAKJjqZRwmkx9yYA==
X-Google-Smtp-Source: AA6agR71WL7BgpoL3L1/xyAz8IdT4PwLSy4E4iNNtOayTtRuJyqphjx/a+4BmrBYBtsJ6UBt+HxBOg==
X-Received: by 2002:a5d:61c4:0:b0:21e:e00c:f8b4 with SMTP id
 q4-20020a5d61c4000000b0021ee00cf8b4mr17221628wrv.145.1660157178461; 
 Wed, 10 Aug 2022 11:46:18 -0700 (PDT)
Received: from henark71.. ([109.76.58.63]) by smtp.gmail.com with ESMTPSA id
 y13-20020adfdf0d000000b0021f0ff1bc6csm16944743wrl.41.2022.08.10.11.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 11:46:18 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, linux-riscv@lists.infradead.org
Subject: [PATCH v3 3/4] hw/riscv: virt: fix syscon subnode paths
Date: Wed, 10 Aug 2022 19:46:11 +0100
Message-Id: <20220810184612.157317-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810184612.157317-1-mail@conchuod.ie>
References: <20220810184612.157317-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=mail@conchuod.ie; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 10 Aug 2022 18:46:22 -0000

From: Conor Dooley <conor.dooley@microchip.com>

The reset and poweroff features of the syscon were originally added to
top level, which is a valid path for a syscon subnode. Subsequently a
reorganisation was carried out while implementing NUMA in which the
subnodes were moved into the /soc node. As /soc is a "simple-bus", this
path is invalid, and so dt-validate produces the following warnings:

/stuff/qemu/qemu.dtb: soc: poweroff: {'value': [[21845]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-poweroff']} should not be valid under {'type': 'object'}
        From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
/stuff/qemu/qemu.dtb: soc: reboot: {'value': [[30583]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-reboot']} should not be valid under {'type': 'object'}
        From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml

Move the syscon subnodes back to the top level and silence the warnings.

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Fixes: 18df0b4695 ("hw/riscv: virt: Allow creating multiple NUMA sockets")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I dropped your R-b Alistair intentionally.
Tested both Linux and FreeBSD:
[    0.073406] device: 'poweroff': device_add
[    0.073441] bus: 'platform': add device poweroff
[    0.502347] bus: 'platform': add driver syscon-poweroff
[    0.502379] bus: 'platform': __driver_probe_device: matched device poweroff with driver syscon-poweroff
[    0.502397] bus: 'platform': really_probe: probing driver syscon-poweroff with device poweroff
[    0.502423] syscon-poweroff poweroff: no pinctrl handle
[    0.502681] syscon-poweroff poweroff: pm_power_off already claimed for sbi_srst_power_off
[    0.503333] syscon-poweroff: probe of poweroff failed with error -16
[    0.073629] device: 'reboot': device_add
[    0.073664] bus: 'platform': add device reboot
[    0.500640] bus: 'platform': add driver syscon-reboot
[    0.500673] bus: 'platform': __driver_probe_device: matched device reboot with driver syscon-reboot
[    0.500694] bus: 'platform': really_probe: probing driver syscon-reboot with device reboot
[    0.500725] syscon-reboot reboot: no pinctrl handle
[    0.502168] driver: 'syscon-reboot': driver_bound: bound to device 'reboot'
[    0.502242] bus: 'platform': really_probe: bound device reboot to driver syscon-reboot

syscon_power0: <Syscon poweroff> on ofwbus0
syscon_power1: <Syscon reboot> on ofwbus0
---
 hw/riscv/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 8b2978076e..6f0fd1541b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -896,7 +896,7 @@ static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
     test_phandle = qemu_fdt_get_phandle(mc->fdt, name);
     g_free(name);
 
-    name = g_strdup_printf("/soc/reboot");
+    name = g_strdup_printf("/reboot");
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-reboot");
     qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
@@ -904,7 +904,7 @@ static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(mc->fdt, name, "value", FINISHER_RESET);
     g_free(name);
 
-    name = g_strdup_printf("/soc/poweroff");
+    name = g_strdup_printf("/poweroff");
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-poweroff");
     qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
-- 
2.37.1


