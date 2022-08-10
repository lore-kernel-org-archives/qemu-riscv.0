Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLqil-0005wd-0m
	for mharc-qemu-riscv@gnu.org; Wed, 10 Aug 2022 14:46:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oLqii-0005r0-U4
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 14:46:20 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oLqig-0007GI-3Z
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 14:46:20 -0400
Received: by mail-wr1-x42f.google.com with SMTP id q30so18701670wra.11
 for <qemu-riscv@nongnu.org>; Wed, 10 Aug 2022 11:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=maIqyDhug0EL/mXAyR5nYeGttmLcfb6O/BjdQzpTa5E=;
 b=LxSeMItdX80JUjkCqXJgBhLVTwmp50MmNGKVChYDIkyimBCZggvVswojH2xaylxdrl
 GqF64fQ3rYkS8TgZapgQSQ1ChYk+cpE5OMLLYfHahXpuypIqzE5Ozrj51yCqRstntxCR
 XBwYtD/FhG+6iAAP4Gp12XgbPvkBiblJXb3IQf+Zpb2WcllJxn6cxa5likf6q9upV1Hh
 bbMFgMLxfjkk4lvnviYPyDt1chW4aK6QfinXZYmYrbSWwLmznOVfWMcUFc6LttE+8P9I
 VqHauCCK7uKPdbhguExtlE9NNoH6ReIcZ6+EN33AG/9K0zSdzrvwCgmMmUqOlHl5Gqz5
 CUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=maIqyDhug0EL/mXAyR5nYeGttmLcfb6O/BjdQzpTa5E=;
 b=YYDueecCs3NZ48C5PfM1biiRtWQ7pqMEDWGrSXxvH55tvlzYDwuh4feY57c7IB3qL8
 hd8XrUHjgxAe4Erdpk4RAd78KC3jrEelS3sV8Rzk1KvCg/k4H46Xv8k3vpPCdJ1XGce2
 8sNZdRpXVyMM2awRKHsuHfLBbb7CfucbF18ds5C3skVThA7wWwaGMBwv1oMvSXyTXqsv
 aNMqTYLlDVdubHfnLNHw/whasdDDAuHV/BMpE5ZAREkqabPi4S4+0KJ4nl+LKYPYu09D
 6vjRGAeu6+hfe4gha8AoqJ0qLtyrt9KypFBDMjmivbnPOkYruDk28oAl889ELKrIhnnX
 ROjA==
X-Gm-Message-State: ACgBeo2Zq0msGE+7v/XzM7h7wOLJXkgF5q9hoS/hHOOCuw4GqPeERHBm
 sggZfQz8wqMiTDaQcI5WpKjwsw==
X-Google-Smtp-Source: AA6agR5cEsZTkeIM60/maHEsT+mjTmhiJMFDBRHpKpDsKgto5han/ZWpbkiQUCdEYeIR/fPfWekWiA==
X-Received: by 2002:a5d:5887:0:b0:220:81c9:8ab7 with SMTP id
 n7-20020a5d5887000000b0022081c98ab7mr17748783wrf.702.1660157176721; 
 Wed, 10 Aug 2022 11:46:16 -0700 (PDT)
Received: from henark71.. ([109.76.58.63]) by smtp.gmail.com with ESMTPSA id
 y13-20020adfdf0d000000b0021f0ff1bc6csm16944743wrl.41.2022.08.10.11.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 11:46:16 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, linux-riscv@lists.infradead.org
Subject: [PATCH v3 1/4] hw/riscv: virt: fix uart node name
Date: Wed, 10 Aug 2022 19:46:09 +0100
Message-Id: <20220810184612.157317-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810184612.157317-1-mail@conchuod.ie>
References: <20220810184612.157317-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=mail@conchuod.ie; helo=mail-wr1-x42f.google.com
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
X-List-Received-Date: Wed, 10 Aug 2022 18:46:21 -0000

From: Conor Dooley <conor.dooley@microchip.com>

"uart" is not a node name that complies with the dt-schema.
Change the node name to "serial" to ix warnings seen during
dt-validate on a dtbdump of the virt machine such as:
/stuff/qemu/qemu.dtb: uart@10000000: $nodename:0: 'uart@10000000' does not match '^serial(@.*)?$'
        From schema: /stuff/linux/Documentation/devicetree/bindings/serial/8250.yaml

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Fixes: 04331d0b56 ("RISC-V VirtIO Machine")
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


