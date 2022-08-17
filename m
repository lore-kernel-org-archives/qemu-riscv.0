Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOPP5-0006qU-3z
	for mharc-qemu-riscv@gnu.org; Wed, 17 Aug 2022 16:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oOPP3-0006lJ-Kp
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 16:12:37 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oOPP2-0001re-00
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 16:12:37 -0400
Received: by mail-wr1-x433.google.com with SMTP id bs25so17447746wrb.2
 for <qemu-riscv@nongnu.org>; Wed, 17 Aug 2022 13:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=zUVvLx/M0Ey4WkDNtfvPvUnW+BTA2iCGD2yUtKPlYzA=;
 b=On9ZheEPu5VzxXFRpX263CeSR2D+YOMy3syGCHBmeZktowjXbOdt8R6QvuqBRNbxxL
 qLHMIg1qz/XHfN3OpX+NEB03NUXcg+Ero1BOratzhXGvHps6cujRHFo4dSWkRHji0Qjm
 PNh/tK6+Ae4VS3S86KhYPZ4RcbIFHRkV01d3pe7x+ZlgaXC16k7acLouGUzhxAQptQ0s
 7IzOX+lywCmzL2K9URRyOwPLDlQy1hM8IiNFUo1fUEAyytr1t9x6EEKsUa5svCNLwU+K
 ga6RbTHSe7j/Qku/Nul7iwXXJqbnJ4ayRauV0sy+z2nuVrmXjUDZ9Fe/erADuYqmrsZt
 /JRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=zUVvLx/M0Ey4WkDNtfvPvUnW+BTA2iCGD2yUtKPlYzA=;
 b=f8Myslg8xN7sSdPFG+rTc8aHJVlviT77TOVJeRASvcKNAV4PmubVYij5Jz5VwUCO0l
 aN5duo5RoHGhpO3Uq7aTxvAAH1pZeeZ7lUSGz6KkNqshRs/Tns9rho+ib3tY0aR0JHdY
 hVHkrmsyahul2FWF6rHnOPr+UAxq64+D9ORxcVnv1VJVgRAWrVXSRYJvzsm0jNagQlc8
 0XJaznDkGyQ2RFTzcufdFSdL+xM0kG7V165d+4FbABBUHh/cBvS642lSH7DBlx8MWWkE
 brOMumvfelGIdnkar+SQsXUjJzsZifn3R9NCXUrWfvbG2TjDX6TDwF8ca0Qmh5UQe0ks
 7s7g==
X-Gm-Message-State: ACgBeo28MczgLJb3tr0WiaFgxKMEKLcuF1+Xe9OW40U3ghVlDZ8MbpoD
 82dhaTqDlfiKtawNpSeBNVIwkg==
X-Google-Smtp-Source: AA6agR45iTa9lfJ1iLIAYbdFjA17ICwWZtxzP6nWcl2YIhaueG/H0B6ZIQjOkPlREEmFy2FxfmH48Q==
X-Received: by 2002:a5d:59aa:0:b0:21f:57a:77cc with SMTP id
 p10-20020a5d59aa000000b0021f057a77ccmr14862481wrr.384.1660767154413; 
 Wed, 17 Aug 2022 13:12:34 -0700 (PDT)
Received: from henark71.. ([109.76.58.63]) by smtp.gmail.com with ESMTPSA id
 i15-20020a05600c354f00b003a5dfd7e9eesm3029371wmq.44.2022.08.17.13.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 13:12:33 -0700 (PDT)
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
 qemu-riscv@nongnu.org
Subject: [PATCH v3 0/4] Fix dt-validate issues on qemu dtbdumps due to
 dt-bindings
Date: Wed, 17 Aug 2022 21:12:09 +0100
Message-Id: <20220817201212.990712-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=mail@conchuod.ie; helo=mail-wr1-x433.google.com
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
X-List-Received-Date: Wed, 17 Aug 2022 20:12:37 -0000

From: Conor Dooley <conor.dooley@microchip.com>

(correctly sent this time, without duplicate patches)

The device trees produced automatically for the virt and spike machines
fail dt-validate on several grounds. Some of these need to be fixed in
the linux kernel's dt-bindings, but others are caused by bugs in QEMU.

Patches been sent that fix the QEMU issues [0], but a couple of them
need to be fixed in the kernel's dt-bindings. The first patches add
compatibles for "riscv,{clint,plic}0" which are present in drivers and
the auto generated QEMU dtbs. The final patch should be ignored for all
serious purposes unless you want to wash your eyes out afterwards, but
JIC the versioned extensions ever come up, it's there.

Thanks to Rob Herring for reporting these issues [1],
Conor.

To reproduce the errors:
./build/qemu-system-riscv64 -nographic -machine virt,dumpdtb=qemu.dtb
dt-validate -p /path/to/linux/kernel/Documentation/devicetree/bindings/processed-schema.json qemu.dtb
(The processed schema needs to be generated first)

0 - https://lore.kernel.org/linux-riscv/20220810184612.157317-1-mail@conchuod.ie/
1 - https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/

Changes since v2:
- removed the extra patches from the directory

Changes since v1:
- drop the "legacy systems" bit from the binding descriptions
- convert to a regex for the isa string

Conor Dooley (4):
  dt-bindings: timer: sifive,clint: add legacy riscv compatible
  dt-bindings: interrupt-controller: sifive,plic: add legacy riscv
    compatible
  dt-bindings: riscv: add new riscv,isa strings for emulators
  dt-bindings: riscv: isa string bonus content

 .../sifive,plic-1.0.0.yaml                     |  5 +++++
 .../devicetree/bindings/riscv/cpus.yaml        |  9 ++++++---
 .../bindings/timer/sifive,clint.yaml           | 18 ++++++++++++------
 3 files changed, 23 insertions(+), 9 deletions(-)


base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
-- 
2.37.1


