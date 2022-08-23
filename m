Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQYj0-0001Xr-6w
	for mharc-qemu-riscv@gnu.org; Tue, 23 Aug 2022 14:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oQYiw-0001VE-9U
 for qemu-riscv@nongnu.org; Tue, 23 Aug 2022 14:34:02 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:45624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oQYir-0004jw-K5
 for qemu-riscv@nongnu.org; Tue, 23 Aug 2022 14:33:59 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 bd26-20020a05600c1f1a00b003a5e82a6474so8198949wmb.4
 for <qemu-riscv@nongnu.org>; Tue, 23 Aug 2022 11:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=SXjC+1eAipiwLVckozeddO7uqjToKvtGjqOQeotcMjA=;
 b=KbX0skZMzo1dHORnO1cN91HQwYl5fklrhtHhR2L7O0pjBR2WQcmbC6+6QCsRSVABqj
 suGNDT5zgBvkiN83Nia7Fxsj/GUe4ZrlfG1UmMEwbcLoXEmvZ6cUjQlSkDHA5N85GJ7D
 MXdfh/3k36Gh681xIxzhAcU5D3VniKUKc7tEsODBfWdS6vC/28mqYdr0qmBYnIIijOqQ
 6o4C9Z6SGB/f+JumjLGTtaD8bu4/rwOJUdJ+qMjZPi23lOHvE9w6+/bt9ug4xdsaXDcL
 0nTVKQhWqBAP3808O62VC5jQ8sGAcXbvQgO/aibQ4HwTyaZ5rV1mI4kilaKf0RQQhBgU
 q44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=SXjC+1eAipiwLVckozeddO7uqjToKvtGjqOQeotcMjA=;
 b=zuvckpbowr28iAkpzt9MvYJS+JY0+iNxB6bPcnk4+YX9RkzBnjdSxgsJ9Tgifr1nEU
 gMyp5Coyy/U1oKbbK+5R/7kgUyfyoYZUrYxEmhtSRdMAsnFQ+ljE5RUSV3nKfVP0ZtWf
 6OdC5aj/Tjt4fDbLY7fLQmQKRce2Qdoqdjb7K27M2G7Tfr8j1XDL2kUEaKnjkxM0b9KD
 9/G0k16CuBsG/99ZjBDUrWhnsuLB92joI00No16Dn0veDsu8nzgMLcGpi/g3cqREU3H8
 ZvBxHlc1mGZwZJFf0S3nqAjVaCo5KkFRDVOI0omc82DZjtvDi8bLg7tv2FuDUw0vWyvP
 EEqA==
X-Gm-Message-State: ACgBeo27rm6U2/M4Z3OdlWL/eMgl0yd9AqofxiqwfA6/UsdDdVd+9+xp
 3VRwefb+lnqXQ+fGb2qAQ86X8g==
X-Google-Smtp-Source: AA6agR5q5Ekkbe1X55VNXuzYGucNAP21vgIbfd9u4MP8ILX9K+hq65/YrNIaCt5ZG3XgVMMwVoDaHA==
X-Received: by 2002:a05:600c:2c47:b0:3a6:4623:4ccf with SMTP id
 r7-20020a05600c2c4700b003a646234ccfmr3142126wmg.85.1661279636305; 
 Tue, 23 Aug 2022 11:33:56 -0700 (PDT)
Received: from henark71.. ([51.37.149.245]) by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c1d9000b003a5fcae64d4sm19396556wms.29.2022.08.23.11.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 11:33:55 -0700 (PDT)
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
Subject: [PATCH v4 2/4] dt-bindings: interrupt-controller: sifive,
 plic: add legacy riscv compatible
Date: Tue, 23 Aug 2022 19:33:18 +0100
Message-Id: <20220823183319.3314940-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220823183319.3314940-1-mail@conchuod.ie>
References: <20220823183319.3314940-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=mail@conchuod.ie; helo=mail-wm1-x32c.google.com
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

While "real" hardware might not use the compatible string "riscv,plic0"
it is present in the driver & QEMU uses it for automatically generated
virt machine dtbs. To avoid dt-validate problems with QEMU produced
dtbs, such as the following, add it to the binding.

riscv-virt.dtb: plic@c000000: compatible: 'oneOf' conditional failed, one must be fixed:
        'sifive,plic-1.0.0' is not one of ['sifive,fu540-c000-plic', 'starfive,jh7100-plic', 'canaan,k210-plic']
        'sifive,plic-1.0.0' is not one of ['allwinner,sun20i-d1-plic']
        'sifive,plic-1.0.0' was expected
        'thead,c900-plic' was expected
riscv-virt.dtb: plic@c000000: '#address-cells' is a required property

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml     | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 92e0f8c3eff2..99e01f4d0a69 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -66,6 +66,11 @@ properties:
           - enum:
               - allwinner,sun20i-d1-plic
           - const: thead,c900-plic
+      - items:
+          - const: sifive,plic-1.0.0
+          - const: riscv,plic0
+        deprecated: true
+        description: For the QEMU virt machine only
 
   reg:
     maxItems: 1
-- 
2.37.1


