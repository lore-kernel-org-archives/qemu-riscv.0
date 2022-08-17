Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOPIb-0002dG-MY
	for mharc-qemu-riscv@gnu.org; Wed, 17 Aug 2022 16:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oOPIZ-0002Z9-Uo
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 16:05:55 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oOPIY-0000CU-53
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 16:05:55 -0400
Received: by mail-wr1-x42a.google.com with SMTP id h24so3330330wrb.8
 for <qemu-riscv@nongnu.org>; Wed, 17 Aug 2022 13:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=vuO3cD7vHfOoM26qaFlIa3/qXvWH4JaTB3axSBEJPBw=;
 b=aLff/SU5U5NCprD2QuW81ZfqWPcaSFXlXSbnm3nBxoThVUuC+erRdVodWmcN79GWR3
 x6K8q62Y/aYgL/FZR7jCoVAQly7asoaWMM3eg4Sn7jt91w07TL5ryQcaxYoFF6mtw7x7
 WyCWzHVrw1kx1hzhuGNSQ8Z1QZLPIxrOSVAv5jzhEYz5lNvczMpa1TQU+b0Tf7qi+ALt
 tyUURhWEo6A/4e0QPQ+c9f7f1yX97VvMESe+aAoTJFbFqSFzjrwU8WvqNZnisdvUVt5J
 zfYmHcItVD5nQhI8sOUgr2pTtd/SmXdJo6yVsTj0KdxUltsCv4tc4rsYkjw0cepkFKbm
 LQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=vuO3cD7vHfOoM26qaFlIa3/qXvWH4JaTB3axSBEJPBw=;
 b=yYQWnqA9V+YFzH5ixjiB0PVQiC68f58pv9K3ag8rjAPtzYjo2yRX07Yz91MKhbsQ26
 gb2e7+BqhN7XH+OQzZO0uh2TaTGeOlgUKoYS4ZnVs9IKrVfp+VVyOor0Hz4SPgsUuZ4S
 vqEcuvqpEVtlyBZboCZDaoDeQQNlK4DL5x3lICRYzvfwDhoasYjB2tbaI9Z+V+rYCaIT
 psxkAi9wDJS5TGUORQdNGrZAWL7jRexXHjvPbviGkKS2N0XkaCEg9aJhKiZJ/qA8G3Gz
 je25/Ic6EottltNYftwJWcsXz9v84Hm/SHn2gqZDJCiync3DefXQlWdUUHWeb6jtMKIg
 Y7Vg==
X-Gm-Message-State: ACgBeo1ZlG5j2hJVa7Ifb+5jBOFXj2atrpqDqdEAH27BNOLCObkW56cm
 JQaIMuI7p5b9hRwwVKwjqXMMwA==
X-Google-Smtp-Source: AA6agR6xInXHiAM2BCLKV9u+fYev1yEmFG0NjjMiZhNBeLkYTbhJq4za1Z3qh97Ys5ZCdjUKqm17DQ==
X-Received: by 2002:a05:6000:1b92:b0:220:7d86:2e30 with SMTP id
 r18-20020a0560001b9200b002207d862e30mr15678682wru.530.1660766752738; 
 Wed, 17 Aug 2022 13:05:52 -0700 (PDT)
Received: from henark71.. ([109.76.58.63]) by smtp.gmail.com with ESMTPSA id
 i133-20020a1c3b8b000000b003a531c7aa66sm3400883wma.1.2022.08.17.13.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 13:05:51 -0700 (PDT)
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
Subject: [PATCH 2/4] dt-bindings: interrupt-controller: sifive,
 plic: add legacy riscv compatible
Date: Wed, 17 Aug 2022 21:05:21 +0100
Message-Id: <20220817200531.988850-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817200531.988850-1-mail@conchuod.ie>
References: <20220817200531.988850-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=mail@conchuod.ie; helo=mail-wr1-x42a.google.com
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
X-List-Received-Date: Wed, 17 Aug 2022 20:05:56 -0000

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


