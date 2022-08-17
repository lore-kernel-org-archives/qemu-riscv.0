Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOPPB-00073k-2S
	for mharc-qemu-riscv@gnu.org; Wed, 17 Aug 2022 16:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oOPP7-00071P-QN
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 16:12:42 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:47071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oOPP5-0001sG-8R
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 16:12:41 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 k6-20020a05600c1c8600b003a54ecc62f6so1448495wms.5
 for <qemu-riscv@nongnu.org>; Wed, 17 Aug 2022 13:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=1R6UrF0Wsbj6EmcSlPWRzTAwonFDames2nGAVyANWlQ=;
 b=PwR33To0N5ui/sX2vHA5vGOkVP5CwIp7cjsA3PN3/adE8gVsnwKwcA8MYb7gioCksg
 ahw0LIbslkzwkpF5jej+bp4Yf0eOt17d57rj6NZDdo2SwIe+S6QwHLjSHV2P1MzSZIBc
 SYx4JQvjJaj8YXXwnSVR4gMkDl8Q0JCp8oTckDnqWMsTdK5gI0pMdfXPPzjOTaFzzLMQ
 12YILMe1gQQ55rA8mLmVO7Cvz9oVG8YaFarhPLW/UC6wwUTSAdaNVhcSQfB/LksZ2ARG
 6gYZLDZVb5Wsbi12Ll5V36MnebMaEECTDL38Z4MC7mvuhjAl2WJjonXIZ/KRs1DxNILj
 o4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=1R6UrF0Wsbj6EmcSlPWRzTAwonFDames2nGAVyANWlQ=;
 b=S5R9Mu6MB84AR3oFFl8R+DR0QGiYPdOVkkBn8YOH+faFN3hS+45UnPnZBA+vLCUgBb
 JTHt3gwGmCMY1lN+SdL/wXnkL1wPLOLIzT9zLAC7xKjKCF96iCFBDd4Vza9RUhRcgFPu
 5lYHC7n7Xvjnxy5z7jveZpO6i3HBAQK0BFRU28nk7tZuzO+8IULJbyM3ZVrNsOPiv2Gc
 LR+CHaT+y5BVw2VHzfj4r6tHFkBzLtg9NDqBRSKByX+u41eDScDKPmMRO22MAzY+TL0E
 Avxed1JY4ZzDJrTmNS4QSe835xyJfTi34c5i6/BwpA51yScGzctvW/LEBve2E7E+R/IU
 OL2Q==
X-Gm-Message-State: ACgBeo1tA3gQGdWiKF92dXI04Qqjd3aC84fghdPDzuHcuMJHAn1Y6CCD
 OpXhEhEa26ZOEJyVyjcA8PO2xw==
X-Google-Smtp-Source: AA6agR6lJ1JCJSrjpa59CdkKTqHzSw7FSFRvF0du7bAKFhB5DFjPBDZy5X6POzzhjKmao4BdhzICzA==
X-Received: by 2002:a05:600c:4f8f:b0:3a3:4612:6879 with SMTP id
 n15-20020a05600c4f8f00b003a346126879mr3121447wmq.84.1660767157797; 
 Wed, 17 Aug 2022 13:12:37 -0700 (PDT)
Received: from henark71.. ([109.76.58.63]) by smtp.gmail.com with ESMTPSA id
 i15-20020a05600c354f00b003a5dfd7e9eesm3029371wmq.44.2022.08.17.13.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 13:12:37 -0700 (PDT)
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
Subject: [PATCH v3 1/4] dt-bindings: timer: sifive,
 clint: add legacy riscv compatible
Date: Wed, 17 Aug 2022 21:12:10 +0100
Message-Id: <20220817201212.990712-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817201212.990712-1-mail@conchuod.ie>
References: <20220817201212.990712-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=mail@conchuod.ie; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Wed, 17 Aug 2022 20:12:42 -0000

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


