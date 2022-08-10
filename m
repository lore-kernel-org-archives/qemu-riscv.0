Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLqj4-0005zy-Bi
	for mharc-qemu-riscv@gnu.org; Wed, 10 Aug 2022 14:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oLqik-0005uj-E6
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 14:46:22 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oLqii-0007HS-Sq
 for qemu-riscv@nongnu.org; Wed, 10 Aug 2022 14:46:22 -0400
Received: by mail-wr1-x433.google.com with SMTP id z12so18728297wrs.9
 for <qemu-riscv@nongnu.org>; Wed, 10 Aug 2022 11:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=VJdQR/zkeKenpTuqia/TTJ9m1dTc7j3X6f24wA4YnSA=;
 b=JCziDnpU8rCiA8ClzY/qKpkzwNSWGcUrRt8hBWMXdKyFhGK2L0StNyBrEujci74qL2
 0nW44P7962pD7aiCmXLxKgF0Y17J/doJaV1eFIlWyufOIdrqEGGVl94W9BbZO0kwQXRY
 LjdXlJKRmQZat78f15w4ni+6mcdd7NGoByc4ij86QBARZPGaG4N3Tou3Y1nBCaR3/Ejw
 sWmFKisjiPAP4SFIJvlFkZeIXzbCFCh/13miY5D6s611Asz41glRIYYAZf3yjNqm1QwV
 5sS1wIvdTJAVr6T8NaA053f76PwfV9gj6sMc1GhOsCLQdMZrkLn2Wwb1YodCLL1zB+re
 R5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=VJdQR/zkeKenpTuqia/TTJ9m1dTc7j3X6f24wA4YnSA=;
 b=YwFLpekXf6KKOMmpTFx5+qVTeXUux0lQh4KfBcIY1Srd9kBsV52YQSNwoWQnN8+DHb
 j+dlnB5Z88BjIdZ0zSnjnaynHcF5tLpSOgtwToV6lXLl5BX+o3siiyBroYskYc9nmAxg
 NQe2PegNtC7HAWFbBL3GtvKU/MCy9xNRttvYkXfR9loddpDs2DCafeykfVMLR48eIG6o
 KjwA6f+JnkcIi/IW/Ut06SwCDWO/dwWWbcc3u0Pp3pvLoM4Q6pYeHXznTTHEyCukOj6L
 pwwzqAdLcI/n5R3qNFp8je4MPbzPgw5ayFOpaNnAxGOid35p7q5G4sSfpgVq/DL4gjfH
 w7aA==
X-Gm-Message-State: ACgBeo06/ie7QGzJqkikRf63qMuVyG4uFGHPy1jzZVm+OG1HVoKSLKC2
 vUYxV/FfIvA17QGTUHXKOpyIuw==
X-Google-Smtp-Source: AA6agR7TAaQQe6nfKejnLpfRfrSOf3iJHZk7un51nw1xco6YVF1eMQV4AjOpJBkFg0N8+VJaIdPvNQ==
X-Received: by 2002:a5d:504b:0:b0:220:7ae9:d7df with SMTP id
 h11-20020a5d504b000000b002207ae9d7dfmr17470381wrt.465.1660157179375; 
 Wed, 10 Aug 2022 11:46:19 -0700 (PDT)
Received: from henark71.. ([109.76.58.63]) by smtp.gmail.com with ESMTPSA id
 y13-20020adfdf0d000000b0021f0ff1bc6csm16944743wrl.41.2022.08.10.11.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 11:46:19 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, linux-riscv@lists.infradead.org
Subject: [PATCH v3 4/4] hw/core: fix platform bus node name
Date: Wed, 10 Aug 2022 19:46:12 +0100
Message-Id: <20220810184612.157317-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810184612.157317-1-mail@conchuod.ie>
References: <20220810184612.157317-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=mail@conchuod.ie; helo=mail-wr1-x433.google.com
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

"platform" is not a valid name for a bus node in dt-schema, so warnings
can be see in dt-validate on a dump of the riscv virt dtb:

/stuff/qemu/qemu.dtb: platform@4000000: $nodename:0: 'platform@4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
        From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
"platform-bus" is a valid name, so use that instead.

CC: Rob Herring <robh@kernel.org>
Fixes: 11d306b9df ("hw/arm/sysbus-fdt: helpers for platform bus nodes addition")
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 hw/core/sysbus-fdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c
index 19d22cbe73..edb0c49b19 100644
--- a/hw/core/sysbus-fdt.c
+++ b/hw/core/sysbus-fdt.c
@@ -539,7 +539,7 @@ void platform_bus_add_all_fdt_nodes(void *fdt, const char *intc, hwaddr addr,
 
     assert(fdt);
 
-    node = g_strdup_printf("/platform@%"PRIx64, addr);
+    node = g_strdup_printf("/platform-bus@%"PRIx64, addr);
 
     /* Create a /platform node that we can put all devices into */
     qemu_fdt_add_subnode(fdt, node);
-- 
2.37.1


