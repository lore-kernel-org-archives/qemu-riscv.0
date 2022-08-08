Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oL9zO-0008Q4-UW
	for mharc-qemu-riscv@gnu.org; Mon, 08 Aug 2022 17:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oL9z7-0008EV-Kx
 for qemu-riscv@nongnu.org; Mon, 08 Aug 2022 17:08:25 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oL9z5-0006Kk-P8
 for qemu-riscv@nongnu.org; Mon, 08 Aug 2022 17:08:25 -0400
Received: by mail-wr1-x42f.google.com with SMTP id v3so12287006wrp.0
 for <qemu-riscv@nongnu.org>; Mon, 08 Aug 2022 14:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=dLryJLbtmt3A1NXYGrZiCtyybRqEmFe4aX4c5ZR/V+k=;
 b=XaYbCDvok/GvxFa0f5R6nAc+lfRixiYd9G7yozDXN/kSc7eZH9qvkEGMaxHGlYAnyF
 Dkp8ApN+dMiEubPdhMLBOAH/sZZX/7kq1lqi6+4BVy0AsLt5H62S7NvF/s+inzuYAz48
 uE+NTLBwmcDmvjPCNz+VqkzXreiVpewG1s1gbmJvp05B6Y2ZUBIFWeOcQO7irHyvh6Ui
 UniFy+OX97ziDqcSI0loms89zlnCRIMA4QdeVlcmh9tlXwrL1Qu4SEPA/Esu/5h8dany
 CzOBksHoYoIr5g4mygXSVF5FJ4ACFNWAcRLN2B3CaPGHiy/lm5nwnvq4y3mYIR3XBJ2a
 rdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=dLryJLbtmt3A1NXYGrZiCtyybRqEmFe4aX4c5ZR/V+k=;
 b=ixKE92iYOU+ZmgOLaFY3VtnGO+oPPzHC/ZvYPI5tBaWrmrm76NK3IpmowM8GtSkvu+
 5BKLBrPlzWzYjuUFcX+WAar9FjAXxQerLWIXY7JYzJwNSRnHLNYCYEadi/DHh0FpWnSC
 fX5eBH8EskvCSK2Zm36oLM1gWrWw2BWtuVyL3RNtL28h7ETOCfJs51DkFdkTfQlKpLYu
 0p5KxT5pMT0QslkdgpF4DPrbVW1bGhBQxvwHCwnVQLjDAuAQTi7mnzJlBXaD01dW8zOE
 L0iCFuBEu7TNO0fmtoK9NDD+lAXT7A3h5pdFKYB0D4VnDEbQALXz7A/xpbAo33kdbLwm
 T/+g==
X-Gm-Message-State: ACgBeo3nfZ3UAJCHD+ofYSMIDlm3NDbpNYUgXHR+/gs1A9E9epiEk+ts
 2FcVmHyNTHfOgUjj0teOgZ8OrA==
X-Google-Smtp-Source: AA6agR7pnInZsNd3ZsPBnPPgDBz/r5knM7XTF8qQgzFc4K+jCnSOxE+F5iQ58xcJVE5RYKbsiUkpzw==
X-Received: by 2002:a05:6000:156b:b0:222:c789:cb2d with SMTP id
 11-20020a056000156b00b00222c789cb2dmr5262920wrz.197.1659992902355; 
 Mon, 08 Aug 2022 14:08:22 -0700 (PDT)
Received: from henark71.. ([109.76.58.63]) by smtp.gmail.com with ESMTPSA id
 i17-20020a05600c355100b003a2e92edeccsm19811955wmq.46.2022.08.08.14.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 14:08:21 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/4] hw/riscv: virt: Fix the plic's address cells
Date: Mon,  8 Aug 2022 22:06:42 +0100
Message-Id: <20220808210643.2192602-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808210643.2192602-1-mail@conchuod.ie>
References: <20220808210643.2192602-1-mail@conchuod.ie>
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
X-List-Received-Date: Mon, 08 Aug 2022 21:08:26 -0000

From: Conor Dooley <conor.dooley@microchip.com>

When optional AIA PLIC support was added the to the virt machine, the
address cells property was removed leading the issues with dt-validate
on a dump from the virt machine:
/stuff/qemu/qemu.dtb: plic@c000000: '#address-cells' is a required property
        From schema: /stuff/linux/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
Add back the property to suppress the warning.

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Fixes: e6faee6585 ("hw/riscv: virt: Add optional AIA APLIC support to virt machine")
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 hw/riscv/virt.c         | 2 ++
 include/hw/riscv/virt.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 6c61a406c4..8b2978076e 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -465,6 +465,8 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     qemu_fdt_add_subnode(mc->fdt, plic_name);
     qemu_fdt_setprop_cell(mc->fdt, plic_name,
         "#interrupt-cells", FDT_PLIC_INT_CELLS);
+    qemu_fdt_setprop_cell(mc->fdt, plic_name,
+        "#address-cells", FDT_PLIC_ADDR_CELLS);
     qemu_fdt_setprop_string_array(mc->fdt, plic_name, "compatible",
                                   (char **)&plic_compat,
                                   ARRAY_SIZE(plic_compat));
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 984e55c77f..be4ab8fe7f 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -111,6 +111,7 @@ enum {
 
 #define FDT_PCI_ADDR_CELLS    3
 #define FDT_PCI_INT_CELLS     1
+#define FDT_PLIC_ADDR_CELLS   0
 #define FDT_PLIC_INT_CELLS    1
 #define FDT_APLIC_INT_CELLS   2
 #define FDT_IMSIC_INT_CELLS   0
-- 
2.37.1


