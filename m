Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLqir-0005xY-36
	for mharc-qemu-riscv@gnu.org; Wed, 10 Aug 2022 14:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oLqij-0005rR-59
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 14:46:21 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oLqig-0007GW-Uo
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 14:46:20 -0400
Received: by mail-wr1-x42e.google.com with SMTP id z12so18728211wrs.9
 for <qemu-riscv@nongnu.org>; Wed, 10 Aug 2022 11:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=dLryJLbtmt3A1NXYGrZiCtyybRqEmFe4aX4c5ZR/V+k=;
 b=LwclNXS3OtdfnUYY7/XEqH3QMGEwOBmCk6j07Dg0+DMwWWbXp3sKMPR2hwRy+2uMBN
 uTTmpntQzMQvdLbNKmKIGUhGzMKKLvTciuz5i9GRmyrrz6Vcxgk+PrPUwhYbwBr6v2i4
 Z9UE6iAP1d0HtWb/LiFRv7mnOpYo6yd2u02vGeI0swrc2govs7Y58h++JzA8Lpn8F9No
 ZwAzk726aO8mqASESvtVlzc/vtZFV1Nbt6ZH137UcEIHGKQVVypCUy0LNsbvyf+vyjAv
 LCtoobHRROjjEeecGveyUy0DB9218HTinfL9EXrzmrjJzfqmCF9KC0TciZSoeO0hOaNU
 LZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=dLryJLbtmt3A1NXYGrZiCtyybRqEmFe4aX4c5ZR/V+k=;
 b=Ofn8yuSt2W2PO7cfAcmbe3/7CFD8BA0WHyGZF0r9enn7SzQjIgFsyj5KZfjvdz50+1
 BadgLWGKY3nBQ7WSAqnjQVUL1QEoZaPRguEJwA5tM/Kosz877uvXQD6zygdJHM7R25rP
 ZywiLyngYjrh2z1LRB3m7nGDzoSgC2VrScJGNgMlhvgM7bt0jn6z75DS1PgZi6R3i8/A
 lqdiCnR1cUfBL2vpSKuLpLLQBNUos+A3FRCHIaqSct7ABqisQrkZnyd9zRQ10NykOpR2
 LAMBANhNgWu3Tnc+mGw8NKFMOtOaKyHXSsf2HjBrTjXqVPOyEXug372CHR4tBmBCPNU2
 LYVw==
X-Gm-Message-State: ACgBeo1YbFdu1pqdVRLdgMFtMaiHnkbag2zDNDaKUHoid5q1nGGG/kEJ
 /IBIy1v7FXIbiWdOI8jJboKBsg==
X-Google-Smtp-Source: AA6agR5tVzHoU3HEslnVDxq5DUWCV6UhWq3gNelSTKqOZL7bDA0FNbQdn61C9alcviGq+b7WvPOknw==
X-Received: by 2002:a5d:4852:0:b0:21f:17e:bffd with SMTP id
 n18-20020a5d4852000000b0021f017ebffdmr17581187wrs.542.1660157177597; 
 Wed, 10 Aug 2022 11:46:17 -0700 (PDT)
Received: from henark71.. ([109.76.58.63]) by smtp.gmail.com with ESMTPSA id
 y13-20020adfdf0d000000b0021f0ff1bc6csm16944743wrl.41.2022.08.10.11.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 11:46:17 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, linux-riscv@lists.infradead.org
Subject: [PATCH v3 2/4] hw/riscv: virt: fix the plic's address cells
Date: Wed, 10 Aug 2022 19:46:10 +0100
Message-Id: <20220810184612.157317-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810184612.157317-1-mail@conchuod.ie>
References: <20220810184612.157317-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=mail@conchuod.ie; helo=mail-wr1-x42e.google.com
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


