Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJzed-0007j6-6H
	for mharc-qemu-riscv@gnu.org; Fri, 05 Aug 2022 11:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oJzec-0007gg-CT
 for qemu-riscv@nongnu.org; Fri, 05 Aug 2022 11:54:26 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oJzeX-0004nq-DE
 for qemu-riscv@nongnu.org; Fri, 05 Aug 2022 11:54:26 -0400
Received: by mail-wr1-x435.google.com with SMTP id l22so3708967wrz.7
 for <qemu-riscv@nongnu.org>; Fri, 05 Aug 2022 08:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Eq72lhYwpcj2Y9+DftRcCgBYVb7rhM8mwuz/pv5YLJM=;
 b=df02Xw2L5M+frsgdBTHZhAB+RpXKmP47teE/tjHduOX5y9wo3GaKeXdV4xT2ToFUU7
 4PQzHwai241o9INpIDbGQxiJDcEBqL442po0XSgX//1aT712qM2uholsa9UDqeBBYqEV
 c1ZgWhWK79TYtP306g3O7vwcd2y+p8VzSx0FZ0IBIsZadWp9YnBP3dqT4eLVyyHX6zcm
 wgK8P2DB9htiONcb0h8+MaYNmFhF1S5OJm+QPHw+ICYA1QhATFphfMpdoarSaZKxBf6g
 bV73Dav0P1c9jReYFwbSsPZLZjw9kh1OAFUQuilGc2dAhtfMCng0C5YZWTo4qt5ic7p2
 p7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Eq72lhYwpcj2Y9+DftRcCgBYVb7rhM8mwuz/pv5YLJM=;
 b=Ve2LKLR9ZNtBsNHROAw9BliopmAxPJQn8GvOVPfb8vuLL7ciSH+A7JpX9RZko+O0CG
 5eVvQyiRuoBWdzu5Odb+jPk2EIVQ2zOR+oVf9PA0mW/8RDiUFH3laZN/ptK6fNZSSnTy
 JK+/A5KwIhVX4NQJ48IjslhFCQlfIuHiGCuPviaxgISZcMSoOkRs1dwJA5cBdoYxcE2S
 u+QGxEoyw7GZDt+va3FklL0ko6SQQsEPgXZiU0AI6/YLVx9IQ5VXyZpaNDkVglKcq7NF
 l4BB0XJ0qnIIuV7ZDlaSwZdqK2DbvTipVM17EB6gawW7jaPsp1RtKcgw30wUgvm8l10F
 KYJw==
X-Gm-Message-State: ACgBeo1OLxZZPeoF57XXfBHs59k4AK8urF6z69nvRYunQB4xJgBN81ly
 wLcUSm4BtTBAcfG/eSkESmFrQg==
X-Google-Smtp-Source: AA6agR7miAqKtaiHBM5V5kg4ARTL8teYh/JTGjpAcnh9MVfvzICJUWVCq3N9ZPJld7V9cI9+X61IQg==
X-Received: by 2002:a05:6000:1102:b0:220:5c10:5cbe with SMTP id
 z2-20020a056000110200b002205c105cbemr4922998wrw.359.1659714860091; 
 Fri, 05 Aug 2022 08:54:20 -0700 (PDT)
Received: from henark71.. ([93.107.66.220]) by smtp.gmail.com with ESMTPSA id
 t10-20020a5d49ca000000b0021d6dad334bsm4133543wrs.4.2022.08.05.08.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 08:54:19 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 3/5] hw/riscv: virt: Fix the plic's address cells
Date: Fri,  5 Aug 2022 16:54:03 +0100
Message-Id: <20220805155405.1504081-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805155405.1504081-1-mail@conchuod.ie>
References: <20220805155405.1504081-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=mail@conchuod.ie; helo=mail-wr1-x435.google.com
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
X-List-Received-Date: Fri, 05 Aug 2022 15:54:26 -0000

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


