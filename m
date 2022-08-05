Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJzea-0007bw-RZ
	for mharc-qemu-riscv@gnu.org; Fri, 05 Aug 2022 11:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oJzeZ-0007Yt-Pk
 for qemu-riscv@nongnu.org; Fri, 05 Aug 2022 11:54:23 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oJzeV-0004mw-Vy
 for qemu-riscv@nongnu.org; Fri, 05 Aug 2022 11:54:23 -0400
Received: by mail-wr1-x430.google.com with SMTP id l4so3669135wrm.13
 for <qemu-riscv@nongnu.org>; Fri, 05 Aug 2022 08:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Oh6dm/6O3Dvyl0Eg7I+pxcL/xv9k+9dvQbu4oYzTsCM=;
 b=Ae0oAEXkVYED9VuonJLUUDST+CEXSzWteDmRMtes0Qri+D1vqZUBn8ZtShZMBRbPEO
 ixuMl4x4pr3P4pgLbGagBFjl3rouF+CLLbhFiwyf+T2k+QAiHYdPkWhPpYLsy67D/IyP
 mCxjqUqxCwGIplkzWboM7khvjE18NyApn5hSSChH4A+C/sddlAKwDoOelcL/WVAx+Ltr
 M5m+tMtxvZRvkcdC/1tNvCl1UASPi0pz6tFKT+X9zuYg1O3yfkyDerRzrrUQcXLOAdnN
 gmhMGQWWK1SyLvB/CILQxrMMhcaJrvwjX6PJ+ilRYR7qwjZizhePOflcgXTRI05FNUBY
 p7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Oh6dm/6O3Dvyl0Eg7I+pxcL/xv9k+9dvQbu4oYzTsCM=;
 b=USsKHgUnnARqrBe3LItVT4d5v6hN5DIBSReSCg9mol3RnkA/RHHg4G7lzMby632NCD
 i4h8hVuQY/VgoAEXg2AkK+ZYTtrjoMRkqWRYj9SXM2Te3YjtCPCMp8u4tbU8e//jmJLm
 TDXJ9ltc/6UGHK7KhvOttZTaHnXapxi2GUyMYwk0ptsSb1t89Ro0pJVq3B2ykV2RWsEe
 JRRKl0Cl99GVDxukIn1tR0ZdSpRfquXME86In58T7r00iyjOTs76BBF8DGeI2YDelylh
 TFSWrgbKskEq9gkW1XPJJGilPoiJKaDGOFpO+qTneHCs+kDz7jtfmrwS/0XefIvC4Pt2
 FnLw==
X-Gm-Message-State: ACgBeo0Jz7uPx09oLZYvr6OBwji0O410rQQw9jrGm4WTlbmo7YyGeW5F
 eTFvhE9XgVJ/62jE+vy1zB3sCg==
X-Google-Smtp-Source: AA6agR5kJBunV0x+i6qOrg5xPhytUuJZAw8O/LeDbbx0DL8bRSa6qQTVWnnI+mVilWhlvy3wGBD+oQ==
X-Received: by 2002:a5d:518d:0:b0:220:688d:4443 with SMTP id
 k13-20020a5d518d000000b00220688d4443mr4577769wrv.677.1659714859293; 
 Fri, 05 Aug 2022 08:54:19 -0700 (PDT)
Received: from henark71.. ([93.107.66.220]) by smtp.gmail.com with ESMTPSA id
 t10-20020a5d49ca000000b0021d6dad334bsm4133543wrs.4.2022.08.05.08.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 08:54:18 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 2/5] hw/riscv: virt: fix uart node name
Date: Fri,  5 Aug 2022 16:54:02 +0100
Message-Id: <20220805155405.1504081-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805155405.1504081-1-mail@conchuod.ie>
References: <20220805155405.1504081-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=mail@conchuod.ie; helo=mail-wr1-x430.google.com
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

"uart" is not a node name that complies with the dt-schema.
Change the node name to "serial" to ix warnings seen during
dt-validate on a dtbdump of the virt machine such as:
/stuff/qemu/qemu.dtb: uart@10000000: $nodename:0: 'uart@10000000' does not match '^serial(@.*)?$'
        From schema: /stuff/linux/Documentation/devicetree/bindings/serial/8250.yaml

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Fixes: 04331d0b56 ("RISC-V VirtIO Machine")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 hw/riscv/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index bc424dd2f5..6c61a406c4 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -917,7 +917,7 @@ static void create_fdt_uart(RISCVVirtState *s, const MemMapEntry *memmap,
     char *name;
     MachineState *mc = MACHINE(s);
 
-    name = g_strdup_printf("/soc/uart@%lx", (long)memmap[VIRT_UART0].base);
+    name = g_strdup_printf("/soc/serial@%lx", (long)memmap[VIRT_UART0].base);
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible", "ns16550a");
     qemu_fdt_setprop_cells(mc->fdt, name, "reg",
-- 
2.37.1


