Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOPIZ-0002YQ-Gy
	for mharc-qemu-riscv@gnu.org; Wed, 17 Aug 2022 16:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oOPIY-0002Wt-GA
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 16:05:54 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:41760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oOPIW-0000Bm-6C
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 16:05:54 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 m10-20020a05600c3b0a00b003a603fc3f81so1460664wms.0
 for <qemu-riscv@nongnu.org>; Wed, 17 Aug 2022 13:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=1R6UrF0Wsbj6EmcSlPWRzTAwonFDames2nGAVyANWlQ=;
 b=emUeD3umpIWMTUwimxexv6coDslOSFZdTJZAG0mzIfyT8GhTm2y8Rz5AMG9Ml/own/
 1bvWibxPC5o+FKVmvr8wtGCmKyHocGnEAsXVO0ntDOfnJcELc45X3X92yWuj0qra73+b
 bi6yS6R7rH/1tgXaH7ew6gaJvDmgi3DFVyViPwHKiEf61xl3VsSjFE8tTGYOx3T3H8sw
 YpsLPRTKDXDpfnxxhi2vf/Hvx1riYhARNlfjzVIx2UCiXKxPouZe5cn25wjO1kcjdY7J
 dx/0jJrVOlVsCGDsup/V1cmbWyP5Gx3IFcBem4yoP9MuXeSBrOcHywknEN8fvwer7khG
 mxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=1R6UrF0Wsbj6EmcSlPWRzTAwonFDames2nGAVyANWlQ=;
 b=wOHgO+TtlDa+MT1sLG+7seE77goCt7NpXWWaf8hozFCc/5EmIcMLHWPkABBoiNXPDK
 doXoQkqg7Ry85h4mmC96YFqBK0hwISctD5/de3L/p1AygrDCOAFEXAwviVovWIZ06eYn
 OxhjE09XMyDvKA3QWK6Q0VcrDLl11wjC+X2JlTV0NJ1MKXj11VI1t0ErlmkVP+grTcz/
 HX0ewFytx6G0jCBAS1SU5SugVa0t3ixP7PfcpYBN2So6WP1Hj8lGdyv/cZtUg2th8qdl
 oxlIBUvn4PfLE5ZNSrCxi4uLxtW0j46RCM/uZ8SsJtOTu3oMJlck0d4UPVRd3Xl0U5u8
 9rug==
X-Gm-Message-State: ACgBeo0YfCmeoSmIzeLQ+kTaHZditl53OZDQ6vOkhfRKLlnUNw4GzvBZ
 BYHSKknpQ5DSz55FOC9kZBbqTw==
X-Google-Smtp-Source: AA6agR7XO9/ucBfdhxeAYi9ueBa5bQI5OkfrnAcol6y9widXC8PN67prjDo2a9PO6440GhdqtBKYaQ==
X-Received: by 2002:a05:600c:1d12:b0:3a5:eb79:edc3 with SMTP id
 l18-20020a05600c1d1200b003a5eb79edc3mr3104767wms.136.1660766750603; 
 Wed, 17 Aug 2022 13:05:50 -0700 (PDT)
Received: from henark71.. ([109.76.58.63]) by smtp.gmail.com with ESMTPSA id
 i133-20020a1c3b8b000000b003a531c7aa66sm3400883wma.1.2022.08.17.13.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 13:05:49 -0700 (PDT)
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
 qemu-riscv@nongnu.org, Rob Herring <robh@kernel.org>
Subject: [PATCH 1/4] dt-bindings: timer: sifive,
 clint: add legacy riscv compatible
Date: Wed, 17 Aug 2022 21:05:20 +0100
Message-Id: <20220817200531.988850-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817200531.988850-1-mail@conchuod.ie>
References: <20220817200531.988850-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=mail@conchuod.ie; helo=mail-wm1-x335.google.com
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
X-List-Received-Date: Wed, 17 Aug 2022 20:05:54 -0000

From: Conor Dooley <conor.dooley@microchip.com>

While "real" hardware might not use the compatible string "riscv,clint0"
it is present in the driver & QEMU uses it for automatically generated
virt machine dtbs. To avoid dt-validate problems with QEMU produced
dtbs, such as the following, add it to the binding.

riscv-virt.dtb: clint@2000000: compatible:0: 'sifive,clint0' is not one of ['sifive,fu540-c000-clint', 'starfive,jh7100-clint', 'canaan,k210-clint']

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/timer/sifive,clint.yaml           | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index e64f46339079..bbad24165837 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -22,12 +22,18 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - sifive,fu540-c000-clint
-          - starfive,jh7100-clint
-          - canaan,k210-clint
-      - const: sifive,clint0
+    oneOf:
+      - items:
+          - enum:
+              - sifive,fu540-c000-clint
+              - starfive,jh7100-clint
+              - canaan,k210-clint
+          - const: sifive,clint0
+      - items:
+          - const: sifive,clint0
+          - const: riscv,clint0
+        deprecated: true
+        description: For the QEMU virt machine only
 
     description:
       Should be "<vendor>,<chip>-clint" and "sifive,clint<version>".
-- 
2.37.1


