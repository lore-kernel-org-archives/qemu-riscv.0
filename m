Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJzeb-0007eH-Hg
	for mharc-qemu-riscv@gnu.org; Fri, 05 Aug 2022 11:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oJzeZ-0007Z3-Rh
 for qemu-riscv@nongnu.org; Fri, 05 Aug 2022 11:54:23 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oJzeY-0004o4-4g
 for qemu-riscv@nongnu.org; Fri, 05 Aug 2022 11:54:23 -0400
Received: by mail-wr1-x436.google.com with SMTP id p10so3691226wru.8
 for <qemu-riscv@nongnu.org>; Fri, 05 Aug 2022 08:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=O6y0NlSqnXVJ4lrjU7vrgT2qdp78DF3F9tEIqiy3GoU=;
 b=RnJNQynZy/A06iwT22HM4tecWfO4iuM7Nhctff7HuBsLlnR8ZCg8REs8I5nrGuvWzd
 +87NlGx21/Dud8dJCt8z2gUgZvj/3nPueCStmbL1pdu0tnO6s2V73f7lvtnVghRyfrki
 0sa+3AEpjYfgT/ZPknm5dmy2WXvmprpgowCRtSo9Olw4fY4T9xoXXYhAG26AeYsgQDlj
 wNFarxk9iq4vb2BkAQ61sSwpGfGouPFBjhteD4GatJQKX29e1BspvbjJPpfDD1YK67mQ
 9UL5nUKbJbGX+W8xEh0D/fo3BzV0Qu3b9mzg6+Zb9K1dsTbk3oG9MiWq+yyZT8y2fOlq
 DfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=O6y0NlSqnXVJ4lrjU7vrgT2qdp78DF3F9tEIqiy3GoU=;
 b=jqxPf4tTOKQaP85pMMolkG8Z7yASA984HZuIsxMyKxK27vDQSEqj1ZKyWvSuMEoUAi
 MV/0pKJQpocq2quM690izZdthBXmATFxoRWuSK4qM1saOiX+Dex30v/XTL3EwXvhCyWO
 WYKTq4FJYJAuwjas349KsnKiTFu+N4ZjaFbpwnr9KYoiriUgnWnpaPsZa/KlbRxyYYKh
 jm7djdjvDgienoRl1g7/+PWvT3KAnkrE7ajmna7QrU8kCV+KoRqFIR/3kxOjr106SNFl
 uPu3xj1+ZvTkz1Te5DC/TtdQmTGL6QnZsuPElCYPnlUy8gpHIBrRG6J0N+0rhAaPYerl
 Or/A==
X-Gm-Message-State: ACgBeo25tOXZjGDTUdrfPAgK2vMjcyNAye8hVc3DNn9hWihUwpZKcnO9
 M8xg5Md5xKuP9kTME10oudy8LA==
X-Google-Smtp-Source: AA6agR5rYULNQ86qE7XGB5LfgnZor9j132PHMA9QXxeVKpnEoAwIGilzQFeArkbVp3gWr/p8Hqes4A==
X-Received: by 2002:a05:6000:144f:b0:21d:a3cc:a6fa with SMTP id
 v15-20020a056000144f00b0021da3cca6famr4684061wrx.191.1659714860908; 
 Fri, 05 Aug 2022 08:54:20 -0700 (PDT)
Received: from henark71.. ([93.107.66.220]) by smtp.gmail.com with ESMTPSA id
 t10-20020a5d49ca000000b0021d6dad334bsm4133543wrs.4.2022.08.05.08.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 08:54:20 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 4/5] hw/riscv: virt: fix syscon subnode paths
Date: Fri,  5 Aug 2022 16:54:04 +0100
Message-Id: <20220805155405.1504081-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805155405.1504081-1-mail@conchuod.ie>
References: <20220805155405.1504081-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=mail@conchuod.ie; helo=mail-wr1-x436.google.com
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
X-List-Received-Date: Fri, 05 Aug 2022 15:54:24 -0000

From: Conor Dooley <conor.dooley@microchip.com>

The subnodes of the syscon have been added to the incorrect paths.
Rather than add them as subnodes, they were originally added to "/foo"
and a later patch moved them to "/soc/foo". Both are incorrect & they
should have been added as "/soc/test@###/foo" as "/soc/test" is the
syscon node. Fix both the reboot and poweroff subnodes to avoid errors
such as:

/stuff/qemu/qemu.dtb: soc: poweroff: {'value': [[21845]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-poweroff']} should not be valid under {'type': 'object'}
        From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
/stuff/qemu/qemu.dtb: soc: reboot: {'value': [[30583]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-reboot']} should not be valid under {'type': 'object'}
        From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Fixes: 18df0b4695 ("hw/riscv: virt: Allow creating multiple NUMA sockets")
Fixes: 0e404da007 ("riscv/virt: Add syscon reboot and poweroff DT nodes")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 hw/riscv/virt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 8b2978076e..a98b054545 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -896,7 +896,8 @@ static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
     test_phandle = qemu_fdt_get_phandle(mc->fdt, name);
     g_free(name);
 
-    name = g_strdup_printf("/soc/reboot");
+    name = g_strdup_printf("/soc/test@%lx/reboot",
+        (long)memmap[VIRT_TEST].base);
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-reboot");
     qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
@@ -904,7 +905,8 @@ static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(mc->fdt, name, "value", FINISHER_RESET);
     g_free(name);
 
-    name = g_strdup_printf("/soc/poweroff");
+    name = g_strdup_printf("/soc/test@%lx/poweroff",
+        (long)memmap[VIRT_TEST].base);
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-poweroff");
     qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
-- 
2.37.1


