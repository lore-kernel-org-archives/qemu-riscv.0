Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oK0CE-0008Vp-2r
	for mharc-qemu-riscv@gnu.org; Fri, 05 Aug 2022 12:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oK0CD-0008UA-0w
 for qemu-riscv@nongnu.org; Fri, 05 Aug 2022 12:29:09 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oK0CB-0002ZB-4b
 for qemu-riscv@nongnu.org; Fri, 05 Aug 2022 12:29:08 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 ay36-20020a05600c1e2400b003a4e30d7995so4197049wmb.5
 for <qemu-riscv@nongnu.org>; Fri, 05 Aug 2022 09:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=XYwLdkCxi/i5yAItJxUUyXuQNOjzCE2mt/Ff4B2y6Cs=;
 b=D3jxpRS5zNs90vY2YI73WI0Sebg+PIYbtdcLdZdVJEXt3MBup6LCK2JIBzVVc9luf/
 y+mycZVPceDjrWQVGmfZ+sxZXcbWaL3763eF+Q+DVIutHNzi0RLCew0mxmG7/kIfLpZ7
 vd2UHhO6bKZq2M2BwoTDjQ3+TgKGoGMYtrEJ7e6B1dAuq64Hny8AXJO4zU7fKCqwp9Y4
 XqNFWxfQxCabjC6uSb/6FW+5T/zzzug2dsC9ovC7y6kN2H0bGhe/mof5pv9jfOu9lrLj
 Jx8RXO1fH6Lhe+YFFJEXwg8WmUhG2kUGCItPfw3nN1RjSrrl4qMrjHweVP2pn41EcyL1
 yILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=XYwLdkCxi/i5yAItJxUUyXuQNOjzCE2mt/Ff4B2y6Cs=;
 b=1PIoiVyu+3d5XXEJc3MalWIzLU+bpmXD9Y+Cwd7oWO2XJcbeU8bWyGIzjdDs8jHxxC
 MbHrYbgBRTvhgHx/Om35cIeFVo5bp33VkR5mFKUx0U3iKusbgiRuxe6EcqfwJRVIEHKr
 CuxPfT40RmEfxHmEQxCaOK1rOPQC5B8c9/hAr7+1sqYdDYRUMm1uz731QSl6b7Zs4j2h
 /Ua5nlaebpj2TyGiIiwTt2Zb8EKY1E1cmEKvfKd9PIKLP8YBssSdpNV2fMl+QzGz2rth
 uKuKSIOY6kMGDpaJZiU7tPWon7TSaBwEkABvGWPtURDw+YcpBwmxi7afo15MFyKRdt3s
 h8cA==
X-Gm-Message-State: ACgBeo1vcyVSMluwzq2MdCO8IGD6EaZKgoRrVPokUKHp/EG5O6i8WX9q
 ghD2SXr8kzjQO1G/Bd6qbQkgTg==
X-Google-Smtp-Source: AA6agR72z7gXpSrSt4MlK0Qii9Fz4lxO9+YCgAXzA44zWKFpX88wGi7wvDKIHf1SjUomkA4m7/Xc+g==
X-Received: by 2002:a05:600c:3d8d:b0:3a3:15a8:a8e1 with SMTP id
 bi13-20020a05600c3d8d00b003a315a8a8e1mr5151407wmb.167.1659716945693; 
 Fri, 05 Aug 2022 09:29:05 -0700 (PDT)
Received: from henark71.. ([93.107.66.220]) by smtp.gmail.com with ESMTPSA id
 b10-20020a056000054a00b00220633d96f2sm5210086wrf.72.2022.08.05.09.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 09:29:05 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Anup Patel <anup@brainfault.org>,
 Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>,
 Sagar Kadam <sagar.kadam@sifive.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 qemu-riscv@nongnu.org, Rob Herring <robh@kernel.org>
Subject: [PATCH 2/3] dt-bindings: interrupt-controller: sifive,
 plic: add legacy riscv compatible
Date: Fri,  5 Aug 2022 17:28:44 +0100
Message-Id: <20220805162844.1554247-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805162844.1554247-1-mail@conchuod.ie>
References: <20220805162844.1554247-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=mail@conchuod.ie; helo=mail-wm1-x32f.google.com
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
X-List-Received-Date: Fri, 05 Aug 2022 16:29:09 -0000

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
index 92e0f8c3eff2..eb07c4f1a201 100644
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
+        description: For legacy systems & the qemu virt machine only
 
   reg:
     maxItems: 1
-- 
2.37.1


