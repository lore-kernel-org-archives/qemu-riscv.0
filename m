Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOPIm-0002xe-B8
	for mharc-qemu-riscv@gnu.org; Wed, 17 Aug 2022 16:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oOPIi-0002tL-JG
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 16:06:04 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oOPIf-0000E3-Ry
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 16:06:03 -0400
Received: by mail-wr1-x435.google.com with SMTP id a4so5672425wrq.1
 for <qemu-riscv@nongnu.org>; Wed, 17 Aug 2022 13:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=1R6UrF0Wsbj6EmcSlPWRzTAwonFDames2nGAVyANWlQ=;
 b=AeJIiHm9h3I/Eov20f5hm9jFdNKZoOB4Jm6+CCfujHehef2vYBlAHYHSx5/YrlWtGy
 uwOBvhI96+/wdxcUYt/7toPQmj4t0R7CoZ7AyNypy40Yp4pB0wOibbFOUSqHZ/xHuZY+
 a5AbbRHn5YtRY0D0gKPtmjm/2hkhkJrpqVZ72vi2GO26mLW9PDvv9Bybx4U6HbVZQ509
 m8j1y5HSVzo5McL0PRSHDvNJfP4bGBEOmQ7YHJDmQ4AVZxCcIjWIUTSURamn6zVm0hYx
 tZIvcSQZwjZOSNVtG4bAxh1Ql8CBw+SvPUU8vlL66yaGZadxHsoKbpUfyorMa/vTna1L
 QXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=1R6UrF0Wsbj6EmcSlPWRzTAwonFDames2nGAVyANWlQ=;
 b=Rq3IK5WHrlTq0Zs1bJF3m6F7TNcdunsvof0PUoOmKMFIvBWWp30JfsXZUdyL+x5Jxu
 lJ3HFM6qef+DIskYWRdRBOXH1Q0gCBqdXkLnqEaw69vjUqKbAxSxDiSKY7ihY+3hfcn4
 413CqqzlV3VE3SOfc7eUzjd55yDid4pTtrsm7sjlhYKWxTXgVWdlQjoaKtroSPDZVDFt
 cvTknoSqiJUd8is+bLLjMW40QbBkARgLl/frBM7mAm2n1ZSHsUWP3eFRGmf9OlucPSi6
 t9HukHGh9sYydjmfkdHxAgMJRwh9IONd+jP+kB7mrQMC3CNQlCsrM6vRRN9o81I4iSLb
 zWmA==
X-Gm-Message-State: ACgBeo0l/2bXL3llszOkuE+dKOatK1PowFsd7l8/YAAN6yiERfo35Bpv
 nTJq6qHKd74ipBx1+oxh+8Of3g==
X-Google-Smtp-Source: AA6agR5ISPAA2r8H4343y7nQ1xvi4vK0fSr9VzDNPaY5Bb1ElOubBSAalLLrbPfbH95opdbBSj6WkQ==
X-Received: by 2002:a5d:67c7:0:b0:225:210b:21a4 with SMTP id
 n7-20020a5d67c7000000b00225210b21a4mr3350305wrw.677.1660766760597; 
 Wed, 17 Aug 2022 13:06:00 -0700 (PDT)
Received: from henark71.. ([109.76.58.63]) by smtp.gmail.com with ESMTPSA id
 i133-20020a1c3b8b000000b003a531c7aa66sm3400883wma.1.2022.08.17.13.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 13:05:59 -0700 (PDT)
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
Subject: [PATCH v2 1/4] dt-bindings: timer: sifive,
 clint: add legacy riscv compatible
Date: Wed, 17 Aug 2022 21:05:25 +0100
Message-Id: <20220817200531.988850-7-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817200531.988850-1-mail@conchuod.ie>
References: <20220817200531.988850-1-mail@conchuod.ie>
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
X-List-Received-Date: Wed, 17 Aug 2022 20:06:05 -0000

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


