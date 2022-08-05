Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oJzed-0007iX-0i
	for mharc-qemu-riscv@gnu.org; Fri, 05 Aug 2022 11:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oJzeb-0007cs-51
 for qemu-riscv@nongnu.org; Fri, 05 Aug 2022 11:54:25 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oJzeY-0004oR-SN
 for qemu-riscv@nongnu.org; Fri, 05 Aug 2022 11:54:24 -0400
Received: by mail-wr1-x42b.google.com with SMTP id l4so3669219wrm.13
 for <qemu-riscv@nongnu.org>; Fri, 05 Aug 2022 08:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=rfrHuYofA2jTHYlyVlxL0WVJKLrnjdxClG3/+p9uXxc=;
 b=UMt/6ONZE4d7i8r+HjDr+1yRMzmeymuO+74l1T3asAl+Tl1RGNT+DTxE7u2wx5lcQB
 8kdbMDr6ilHFhkffCtYlmJZTQlaFyhFDxN8nF2W97cny4OYrqhMLGrAiMsdRULSy/7pS
 Ry++das2y4F8gvuTPoYUUZva0cfQexZ8IxJznRnFl2x+stO1m7DnEC8Xln+9sUJfM+tG
 LlObm12rMHaIGOqD3qyZqHqpEcOQ0KMMuKNmdUq7aRo97GZW87rtelf1TT5j8L4fgAz4
 VuK8DOuGSusEzjtf6L0KVKTOXviQjmY1hFGmZHklZfi6jFCW/Pa0TqQRkvenxZ3C2PhJ
 u8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=rfrHuYofA2jTHYlyVlxL0WVJKLrnjdxClG3/+p9uXxc=;
 b=7HPJhbE9kADo9hXe/LHmMoj9ay0TtTdZ5eXN6w7+xXcoXbl41RvN1GUZW4UePW0sQP
 hbDEqiE1EixxQumspq49W9Z6xQIgtorGT5aPGFYKUbLEvo/KwbA1vcLQZofsO7wx/8gO
 sbOtxNp11kPLIldPAua/DYgW4BGwdB7nXpc4zXNIyRsFuJkv4BfGbP2Flzij7GP6xtF4
 YrRl4+RPD9oJU/tqAait0sZGLg71kdGRks/Uzs+j7PibYIfkwMIaedw9jL0oO9xPRo/L
 Nv4ciwPPGejW9PlomoCrdSiq2WTIJqQ+5rPxXMZau6+2xjHFoeO+vVPfs1PzaLg7ywww
 9UFw==
X-Gm-Message-State: ACgBeo3aTAQ8AB4UnOw9lFqdfaH2rLv4PfA91YnFhpVVtXJ75E6mWa87
 ZfnJEpeWNYrLh+uXyhaAkVNnGw==
X-Google-Smtp-Source: AA6agR7rwBoF/VmMijr0QsVwMVUZd/R8yy5zn2l6NKz7JXNM0HX+pRHkPvA4FpOzuoDDk3ygtfN69g==
X-Received: by 2002:a05:6000:1564:b0:221:7cbd:df6b with SMTP id
 4-20020a056000156400b002217cbddf6bmr943177wrz.511.1659714861666; 
 Fri, 05 Aug 2022 08:54:21 -0700 (PDT)
Received: from henark71.. ([93.107.66.220]) by smtp.gmail.com with ESMTPSA id
 t10-20020a5d49ca000000b0021d6dad334bsm4133543wrs.4.2022.08.05.08.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 08:54:21 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 5/5] hw/core: fix platform bus node name
Date: Fri,  5 Aug 2022 16:54:05 +0100
Message-Id: <20220805155405.1504081-6-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805155405.1504081-1-mail@conchuod.ie>
References: <20220805155405.1504081-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=mail@conchuod.ie; helo=mail-wr1-x42b.google.com
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
X-List-Received-Date: Fri, 05 Aug 2022 15:54:25 -0000

From: Conor Dooley <conor.dooley@microchip.com>

"platform" is not a valid name for a bus node in dt-schema, so warnings
can be see in dt-validate on a dump of the riscv virt dtb:

/stuff/qemu/qemu.dtb: platform@4000000: $nodename:0: 'platform@4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
        From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
"platform-bus" is a valid name, so use that instead.

CC: Rob Herring <robh@kernel.org>
Fixes: 11d306b9df ("hw/arm/sysbus-fdt: helpers for platform bus nodes addition")
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


