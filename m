Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOPIX-0002Vu-Tv
	for mharc-qemu-riscv@gnu.org; Wed, 17 Aug 2022 16:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oOPIW-0002UV-V0
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 16:05:52 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oOPIV-0000BG-Cq
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 16:05:52 -0400
Received: by mail-wr1-x434.google.com with SMTP id n4so17367385wrp.10
 for <qemu-riscv@nongnu.org>; Wed, 17 Aug 2022 13:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=G88Wg8efx4vUqMWMZ62OXKazA2toNV7pxgmBvPS4y7g=;
 b=UjMVkMOhH0QDp6O/pCgKkjwAgoTr7VLaEZvWBQ+tjcd31e0GYx2VQdEmdGYONFZlBV
 JXSoVTKAwZz2v4YW/Uizoa99V8t3dHzfTeno0mWPMNhh4igom0Bmr6ijGRVDHpyMGd7K
 RD33fy8KrpjEF9DtfgDokOP/K0xkdEBYEZgLbmuvpjzpJ77YnXuGes8IGqUhqOEtcuTz
 1EtmXbFWHbm8sgCgqbfJwoywVRFVNGycJiPJnMqkXnaxVeGp5CUmEstg4+UHY5j1Wvvc
 OYe7bnF33uDXEY5dt1xkYnKlxySlYViNcOylr1RCwj3UfknSZbnUPfMlStx4kPmCFh6a
 AtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=G88Wg8efx4vUqMWMZ62OXKazA2toNV7pxgmBvPS4y7g=;
 b=nv44jxvkJpVqiWeFJeamIN5G1ZvxIrUAnn9zMGyKf99Mi6IasevSNYBJ/GHJpT/pa8
 P7JzGt4F5SIk58Yh0mvyZHNthU1J5DXfCoNvqRP4boMboVPsMQhsMK6sQwUjrQBMhfrg
 OzlnYL0KHy7lOKjs3e6b/a/g8xYIj1Ik39ezWGRP7qJRZInbYf6NsgZnMG91U59PunuC
 dp0SIwhIb8obM6BkCHtDEam5CxhVTUKf+nXbJvXMAmdnASjrvV2eCt5f2TdFVtGAg+s5
 V712pG66ZVSZYxSft20hpAKW2k2CXhaIbpExGmwkjhtWGkgk5otUCfGHI8ea17KFUzUu
 aTLA==
X-Gm-Message-State: ACgBeo2pa990K6vQ49az9PE1rsZE1J15+gNobWOryP4cg/XOreScUjpm
 AguDBjy+XJ1vLIxmWunV3neQEw==
X-Google-Smtp-Source: AA6agR5IgGfJqwk47mOqzOms5cJpBLn149vtKJEQDmN0sxHazUEu1rNO09FeTJ5nbKwwA4+D0l30ow==
X-Received: by 2002:a05:6000:617:b0:225:1d23:467a with SMTP id
 bn23-20020a056000061700b002251d23467amr4681470wrb.692.1660766749119; 
 Wed, 17 Aug 2022 13:05:49 -0700 (PDT)
Received: from henark71.. ([109.76.58.63]) by smtp.gmail.com with ESMTPSA id
 i133-20020a1c3b8b000000b003a531c7aa66sm3400883wma.1.2022.08.17.13.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 13:05:47 -0700 (PDT)
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
Subject: [PATCH 0/4] Fix dt-validate issues on qemu dtbdumps due to dt-bindings
Date: Wed, 17 Aug 2022 21:05:19 +0100
Message-Id: <20220817200531.988850-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=mail@conchuod.ie; helo=mail-wr1-x434.google.com
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
X-List-Received-Date: Wed, 17 Aug 2022 20:05:53 -0000

From: Conor Dooley <conor.dooley@microchip.com>

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


