Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOPPE-00077W-JW
	for mharc-qemu-riscv@gnu.org; Wed, 17 Aug 2022 16:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oOPP9-00072y-IB
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 16:12:44 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:41779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oOPP7-0001sc-E8
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 16:12:42 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 m10-20020a05600c3b0a00b003a603fc3f81so1467691wms.0
 for <qemu-riscv@nongnu.org>; Wed, 17 Aug 2022 13:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=vuO3cD7vHfOoM26qaFlIa3/qXvWH4JaTB3axSBEJPBw=;
 b=QNqHEQCbHfRVGS+tAMiAeZUZwHbBaHSl0+l3elr57UhAo9n9y5kVxNnKfpGR3/bFaK
 +0au1CDmSpQEpc+SU4gk9DT+bLflPHiKU7I8q8oQr7K+iXIJMVRPppzrl+EdG1CICueI
 mETGyBRKdR/0jUMOQefFZwBRXS0F6IVfTdGwBMcn+/W4tOLw5o3k++yjoq0kYu6PUOu8
 zPeHvkIN/+xOD7MPCo5mJihWLZw9Ayb2dZz9D3SYCFb7mSsm+ctbY/v+37Sk2BkryeRN
 +keBV6AYTGq3C5eSUKwO2Ih+l7MLpNlzPwmWLNs+G4q0F/Ce1V4BLVEMj+kApmgnT9U8
 jwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=vuO3cD7vHfOoM26qaFlIa3/qXvWH4JaTB3axSBEJPBw=;
 b=GBtblyd69pIlEqToyPst5HHAl1YBpvfeXyBss9oLfTvNr4L/auUtSfpBFusujzwA6k
 /6y+28o7ycphab1/tA7bzI0j+3CZPvtIY8R7Tq44+7KEimLJUMIEaZbjRLI12SUbtjd4
 Mr0a7NP3yZXkJcfGsgide/7cyOs/M6h3t5bdYJihR0eE0PdXI2obTP7PrMF7IjOHL9vI
 v50VN7N/ICpSmWDZSIv/4d81XqzsB6wIyNo0cLcBXTJRIkj6o5IJB5W7X2rTN+dt+FMp
 byfZ6F1Ts/bENfC+zviRXbP/89z5rYWOG805YThb5f4yotVX2YISGjh4L0Qf4bMX01SA
 Vkfw==
X-Gm-Message-State: ACgBeo3kPxg0pdl1qcECb4l5aXJ+MEJ5Jh7lNBQGx3HV8FzexuVd5Ijk
 uf7YmCl3Umaxhj4/tSOV2lVc9g==
X-Google-Smtp-Source: AA6agR4uxolucIHZMbESqZVNmKY0bzNzoYEESejDuTjDSWvejaLJaV19DGDusJCVom1LcN9XAiM6Ow==
X-Received: by 2002:a1c:7407:0:b0:3a5:b81b:c5c5 with SMTP id
 p7-20020a1c7407000000b003a5b81bc5c5mr3038616wmc.144.1660767160200; 
 Wed, 17 Aug 2022 13:12:40 -0700 (PDT)
Received: from henark71.. ([109.76.58.63]) by smtp.gmail.com with ESMTPSA id
 i15-20020a05600c354f00b003a5dfd7e9eesm3029371wmq.44.2022.08.17.13.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 13:12:39 -0700 (PDT)
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
Subject: [PATCH v3 2/4] dt-bindings: interrupt-controller: sifive,
 plic: add legacy riscv compatible
Date: Wed, 17 Aug 2022 21:12:11 +0100
Message-Id: <20220817201212.990712-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817201212.990712-1-mail@conchuod.ie>
References: <20220817201212.990712-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=mail@conchuod.ie; helo=mail-wm1-x333.google.com
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
X-List-Received-Date: Wed, 17 Aug 2022 20:12:45 -0000

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


