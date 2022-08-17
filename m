Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOPIt-000312-3X
	for mharc-qemu-riscv@gnu.org; Wed, 17 Aug 2022 16:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oOPIm-0002xK-6P
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 16:06:08 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oOPIh-0000EK-G5
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 16:06:07 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 r83-20020a1c4456000000b003a5cb389944so1552460wma.4
 for <qemu-riscv@nongnu.org>; Wed, 17 Aug 2022 13:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=maIqyDhug0EL/mXAyR5nYeGttmLcfb6O/BjdQzpTa5E=;
 b=SvB7YEP3eBYgrsleZ9iJFkse/4XFgJLUFnZphTSo/h+JulyMrKVTZD8RO5Kg+xC5CU
 DeM3YEJ/7AJzDEuYTEFUS4u64EqaNwRPh8LLxU7fOu+knhpXuF1UoqLMf2vDzColvBcG
 l7EmjVeU4ldGrhztpHd+yPyzkjgGuYQURy1EZIMtGAO8cM/JJPCeB+60hrOrBaNrDsS6
 AaVH3j6cDsNPNUKbsndY9MAU8mfFXMKGQOiukc6NDpw2gXBhTGUTW9yoLzJt/azZ3xzA
 7hI0vRlX+AqEl3fe97FyADdLJ4s6F+sjgTgO0k8BTw9+Ru5FXr9VeuJ35AY6NZA3XKo3
 rDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=maIqyDhug0EL/mXAyR5nYeGttmLcfb6O/BjdQzpTa5E=;
 b=IZLzZ90HNTe4XuMzLCFXVLM2eFYuOo/CDif20EbKQcCzb6hb/TugRSJvhv5O1YP+QR
 4Fa2hE/hztI4VI4rZMARuOW9TzPffSodr9RMjScCb5XR/GtEbCZPupfnXzBY05mJZRrR
 wLAeFOm5Y94p6cqEWkgptU5aY3mcam0udoToeRug+PU7Tne3WdUgXEjbFsLdQZisBB7s
 sGsXO9nkUkufC9Vc7TbAJ//oD+6aDJJQu6SQTal2iK8EHxW6gAT1p++90dA6crEj2P4t
 /kni7n5/I1Hv2s4ZI7VvgZonMNT83RNup4bl43Wm6xCHs0MGd46XLTddiM2Stls920oR
 NukQ==
X-Gm-Message-State: ACgBeo3pT8tyfofnbkpLcIZXHz8V8g/xN5WRL1vA+iaFymQFvYJ0n8xo
 hc/UIZiG5gRB3mCbknq2KRMu7Q==
X-Google-Smtp-Source: AA6agR69vG8ENkmh+Uqgy8Kv6cQH+ISkT39e9E6kBR+5DdZP6du68vAeHlgf+tU+DqK4XBGR6h4HRw==
X-Received: by 2002:a05:600c:3b0c:b0:3a6:aa0:5966 with SMTP id
 m12-20020a05600c3b0c00b003a60aa05966mr3076942wms.183.1660766762106; 
 Wed, 17 Aug 2022 13:06:02 -0700 (PDT)
Received: from henark71.. ([109.76.58.63]) by smtp.gmail.com with ESMTPSA id
 i133-20020a1c3b8b000000b003a531c7aa66sm3400883wma.1.2022.08.17.13.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 13:06:01 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Anup Patel <anup@brainfault.org>,
 Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>,
 Sagar Kadam <sagar.kadam@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>,
 Andrew Jones <ajones@ventanamicro.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 qemu-riscv@nongnu.org, Rob Herring <robh@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 1/4] hw/riscv: virt: fix uart node name
Date: Wed, 17 Aug 2022 21:05:26 +0100
Message-Id: <20220817200531.988850-8-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817200531.988850-1-mail@conchuod.ie>
References: <20220817200531.988850-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=mail@conchuod.ie; helo=mail-wm1-x332.google.com
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
X-List-Received-Date: Wed, 17 Aug 2022 20:06:10 -0000

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


