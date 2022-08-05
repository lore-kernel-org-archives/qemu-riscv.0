Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oK0CD-0008VZ-Sh
	for mharc-qemu-riscv@gnu.org; Fri, 05 Aug 2022 12:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oK0CB-0008TG-S8
 for qemu-riscv@nongnu.org; Fri, 05 Aug 2022 12:29:07 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oK0CA-0002Z6-4d
 for qemu-riscv@nongnu.org; Fri, 05 Aug 2022 12:29:07 -0400
Received: by mail-wr1-x42b.google.com with SMTP id j1so3846662wrw.1
 for <qemu-riscv@nongnu.org>; Fri, 05 Aug 2022 09:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=E8iWEu7u72D4Cl4M4gSvZHsI5dQSubGoMYwsdu1FZWU=;
 b=SagV/jMHKGASMD/cT6X473mBlOlzicU0AUDh9UambssZ2tjT0QWPfzhpv5CU1qTNOe
 Ddfy8c1bQ1yG9CeR7FDMP9QknXMcfMUE+Byise52p/JiaVA4+W+VBztftsDouBAa3t2g
 2nRb2g/0ogD/BhxbNhJllKgVo1/L4hSx0dBiNp+l+3Yc7/Hwl01vZwawaVOxi2sRM6Iv
 +YjgoV+Oxr9NNxstRTgtAOzHe7S1zyhir5a1faOe3uBGBp8cVeuY5bGDp1CHzkixcPtb
 +TknqsGOz8YK3iQID272GlVw1lT7n35nGKQ+PgnmF7eMUsAREvkNRwlFU0RYzPqyT7cU
 OhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=E8iWEu7u72D4Cl4M4gSvZHsI5dQSubGoMYwsdu1FZWU=;
 b=XlXBhd+cXcN+Xj7LC1z8gCymkEpd5hJPPQ6HGdyorIzegFHwi3MccXH9npNyiaGC3w
 wJ0ElTgmYwi9Qjw0WRht7LRf1baVrS6VSBI1XHNGGI4RGiA02MRBdRpsqkzjsp+moPDr
 N1K/5pI+FVF3SVjVLmQj5DfIi5WYwwVX85GZpnjVVRwGuDhs9y8ukFPSIOBKr6314t72
 svunxnlfdHRHtnBcwiskB6zZ/HhNtoc+wBhe8nS7ZkLXAMCd3AoKVoPV/Z1lnrbLWVs3
 lTI0W7c3Sgman3X4zfAUNkRsGNCIqeC53ttZtq5L2XyYSrRrfCvMEtpDBO+giJfS3hN+
 EnTA==
X-Gm-Message-State: ACgBeo2V5q4H7S+3J3u4hx0dKGe9KuyQXvnkPrhPwBZYVTyu/v8fL57q
 biSGeF2zAEx4ZjXKH9QAgSHXAQ==
X-Google-Smtp-Source: AA6agR76DtGocbpsn0OQ/xj8+vFW4/LZsUFl+//i/QybfiOJkv1KkQ6JSE5TvZgiPLEA4ARS2OZxvA==
X-Received: by 2002:a05:6000:2c1:b0:220:5f91:62de with SMTP id
 o1-20020a05600002c100b002205f9162demr4920411wry.715.1659716944614; 
 Fri, 05 Aug 2022 09:29:04 -0700 (PDT)
Received: from henark71.. ([93.107.66.220]) by smtp.gmail.com with ESMTPSA id
 b10-20020a056000054a00b00220633d96f2sm5210086wrf.72.2022.08.05.09.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 09:29:04 -0700 (PDT)
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
Subject: [PATCH 1/3] dt-bindings: timer: sifive,
 clint: add legacy riscv compatible
Date: Fri,  5 Aug 2022 17:28:43 +0100
Message-Id: <20220805162844.1554247-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805162844.1554247-1-mail@conchuod.ie>
References: <20220805162844.1554247-1-mail@conchuod.ie>
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
X-List-Received-Date: Fri, 05 Aug 2022 16:29:08 -0000

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
index e64f46339079..9fcf20942582 100644
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
+        description: For legacy systems & the qemu virt machine only
 
     description:
       Should be "<vendor>,<chip>-clint" and "sifive,clint<version>".
-- 
2.37.1


