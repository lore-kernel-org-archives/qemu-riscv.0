Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQYj5-0001ax-0d
	for mharc-qemu-riscv@gnu.org; Tue, 23 Aug 2022 14:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oQYis-0001Ua-Gp
 for qemu-riscv@nongnu.org; Tue, 23 Aug 2022 14:34:02 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oQYiq-0004jr-Mo
 for qemu-riscv@nongnu.org; Tue, 23 Aug 2022 14:33:58 -0400
Received: by mail-wr1-x42e.google.com with SMTP id b5so13741986wrr.5
 for <qemu-riscv@nongnu.org>; Tue, 23 Aug 2022 11:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=gfYO45Fhrr292YriQBgq+GL0i0hKssdiRtp+ptuTmB8=;
 b=cxhWc3M4obppLHYQ1+1dtIkL3cRvwms6r8PwhRPdHDTBOodgqvj+O9GT+FIXT+jVHM
 cLh/Qw3HVakfK6G2nWP1Yew4MJQDEtQI7QpU+r6N0eHqbjF0wJ41mxQK6Mlb8s/QZ3fy
 SdDOP+rFnRzP1U+moj1P99yf0KdJkXioTWpwRdqUa42HEjRci3ryA21S6QskbzqnjstD
 jYKuJAKEa0RgEOdq0ZSHUh/D9OU86R7A5NtNLdP2Whs8V1ITPGcIIait/JWspTt/7gUn
 VMWDd+BN7Y836i5XYRf1P+fGFGKd5HdoE2zvCUi/n6n2FMcrbn/7MFxO7ncgmhXv1wKg
 jicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=gfYO45Fhrr292YriQBgq+GL0i0hKssdiRtp+ptuTmB8=;
 b=7pllj5/6Qfw1E2T27AjUllukEkRXG7UdDm9MiPKO3VRlRz4Gx++Bfprh18TQ7Bav9F
 XbfEC95z0s4z8KkTLlWdvuJuGNx5XMndVA2tykLq3ozerEMhC9Eu6QQUyjrQ/gIoTcXx
 T9KTDK2EiybRia017PKVxkBTRZcUQGSz9j94Owxu0GZAqRzD5YkwhYlOKr9f7zvZOmUh
 Z4bVdIY2gsTY19+pk82T7fJIPddR2P3OzpPUM1rQH1wxcvuvozs2xjpzOU+pTJJqz37Z
 8yudY1jivI2IP1VmugU2mg0eph/d/5PsEoMyjE5Je/x0Gu3XiktqhB18jP1yyZjWQ30u
 FYwA==
X-Gm-Message-State: ACgBeo1BvKDaGzDOctPc16HYYcK0FZjD7un5xMBsNcWC1iAYMwwnXxlF
 G7j15d6krWM9vtmoZSrgiL4/aw==
X-Google-Smtp-Source: AA6agR7bBIo4WvfaTQmBmKbZYuyKOKLHUXCNnIkzR2yMddKcJrOEa3tcvpyzuyC0FL4VN5JT0BNR4A==
X-Received: by 2002:adf:fa0d:0:b0:225:1bd4:5d8a with SMTP id
 m13-20020adffa0d000000b002251bd45d8amr14077231wrr.106.1661279634905; 
 Tue, 23 Aug 2022 11:33:54 -0700 (PDT)
Received: from henark71.. ([51.37.149.245]) by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c1d9000b003a5fcae64d4sm19396556wms.29.2022.08.23.11.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 11:33:54 -0700 (PDT)
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
Subject: [PATCH v4 1/4] dt-bindings: timer: sifive,
 clint: add legacy riscv compatible
Date: Tue, 23 Aug 2022 19:33:17 +0100
Message-Id: <20220823183319.3314940-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220823183319.3314940-1-mail@conchuod.ie>
References: <20220823183319.3314940-1-mail@conchuod.ie>
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
X-List-Received-Date: Tue, 23 Aug 2022 18:34:02 -0000

From: Conor Dooley <conor.dooley@microchip.com>

While "real" hardware might not use the compatible string "riscv,clint0"
it is present in the driver & QEMU uses it for automatically generated
virt machine dtbs. To avoid dt-validate problems with QEMU produced
dtbs, such as the following, add it to the binding.

riscv-virt.dtb: clint@2000000: compatible:0: 'sifive,clint0' is not one of ['sifive,fu540-c000-clint', 'starfive,jh7100-clint', 'canaan,k210-clint']

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Reviewed-by: Rob Herring <robh@kernel.org>
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


