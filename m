Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oK0CC-0008TW-Nr
	for mharc-qemu-riscv@gnu.org; Fri, 05 Aug 2022 12:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oK0CA-0008T1-U3
 for qemu-riscv@nongnu.org; Fri, 05 Aug 2022 12:29:06 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oK0C9-0002Yz-6c
 for qemu-riscv@nongnu.org; Fri, 05 Aug 2022 12:29:06 -0400
Received: by mail-wr1-x429.google.com with SMTP id h13so3813423wrf.6
 for <qemu-riscv@nongnu.org>; Fri, 05 Aug 2022 09:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=er0g7uHt/REArzX+ze5K8GPRuPY+Jxgp51y8SELP3FM=;
 b=EbOTl21mdJTL1GSzLoH5mndTGZ7rvd3Xg13P4ZKyz1HCSdoZ+u7F/xmaKdmhUrrJYR
 ArAdrwc4a1//4AnluZSlFDO6+T3WonDWZ7YJAoV50fmI/J5ExQUtkLJKbPjLjsScuXwe
 WN1Qs3sMEseZZVv/O9h179kGKXIXUaZ7acdsR24+fFhX69GI2nTzP/kZtlcjr7KN9DOZ
 vFaNNYQYq6E/a41Mn8Y+odfAkjrhdjCAvuuGk00A/HgX+GlhAhe93bBVZfYbqTMm1ZFx
 Vpkg4f2wo26DXiVBb+vHMqHogYZl59hldL5jGPOYrirc97C0RUGdzYLF2J//OSiPFvsa
 0YFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=er0g7uHt/REArzX+ze5K8GPRuPY+Jxgp51y8SELP3FM=;
 b=wjnfHfVr1CmZ0qJtkPw0HM6o3Zz6hJf8IGB91R7VMyCFQpQjyGfwQSgrjllagEpz+Z
 YaSAnfzUUDUUOKDEz3bfttaLqikkf4qpQ4HLebRmVCe6wWn1MorfqKDjTbQxxR0kmsgN
 BxLnJOsOKDJeKajFreChmeC+ORLZw4GhszytN5E2kFbs99FCxF8sK1xkB7VHZYlMj5wQ
 BIVNpNtoythDiJBIz3hGjtFDpmRXeMG2nobQnVTQ6nsDMNER5WnWGtrHWPtjIDiayc1b
 nnAeOvISoTrKDcJtjQzxnX1QQZ622BVPRTAyMlN9mnmPgV/dckoVSL673JYJx/jBPJqB
 kkSg==
X-Gm-Message-State: ACgBeo3z7Q4qKLR7ReyiybxLc5WDQn5vnRTJEEHktmwhgyhxCzYf5gFJ
 cGU1zBVWfRPOTVudIUlXJjlzFg==
X-Google-Smtp-Source: AA6agR5PYR+Wl+0VOlguEQQuXuRRJGr8efSXklKvUOQvZ7GXAI/mg5rEbgBwI6yH/e0BdmhHI1txbw==
X-Received: by 2002:a05:6000:1542:b0:220:603d:ec93 with SMTP id
 2-20020a056000154200b00220603dec93mr5044554wry.73.1659716943539; 
 Fri, 05 Aug 2022 09:29:03 -0700 (PDT)
Received: from henark71.. ([93.107.66.220]) by smtp.gmail.com with ESMTPSA id
 b10-20020a056000054a00b00220633d96f2sm5210086wrf.72.2022.08.05.09.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 09:29:03 -0700 (PDT)
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
 qemu-riscv@nongnu.org
Subject: [PATCH 0/3] Fix dt-validate issues on qemu dtbdumps due to dt-bindings
Date: Fri,  5 Aug 2022 17:28:42 +0100
Message-Id: <20220805162844.1554247-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=mail@conchuod.ie; helo=mail-wr1-x429.google.com
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
X-List-Received-Date: Fri, 05 Aug 2022 16:29:07 -0000

From: Conor Dooley <conor.dooley@microchip.com>

The device trees produced automatically for the virt and spike machines
fail dt-validate on several grounds. Some of these need to be fixed in
the linux kernel's dt-bindings, but others are caused by bugs in QEMU.

Patches been sent that fix the QEMU issues [0], but a couple of them
need to be fixed in the kernel's dt-bindings. The first patches add
compatibles for "riscv,{clint,plic}0" which are present in drivers and
the auto generated QEMU dtbs. The final patch adds some new ISA strings
which needs scruitiny from someone with more knowledge about what ISA
extension strings should be reported in a dt than I have.

Thanks to Rob Herring for reporting these issues [1],
Conor.

To reproduce the errors:
./build/qemu-system-riscv64 -nographic -machine virt,dumpdtb=qemu.dtb
dt-validate -p /path/to/linux/kernel/Documentation/devicetree/bindings/processed-schema.json qemu.dtb
(The processed schema needs to be generated first)

0 - https://lore.kernel.org/linux-riscv/20220805155405.1504081-1-mail@conchuod.ie
1 - https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/

Conor Dooley (3):
  dt-bindings: timer: sifive,clint: add legacy riscv compatible
  dt-bindings: interrupt-controller: sifive,plic: add legacy riscv
    compatible
  dt-bindings: riscv: add new riscv,isa strings for emulators

 .../sifive,plic-1.0.0.yaml                     |  5 +++++
 .../devicetree/bindings/riscv/cpus.yaml        |  2 ++
 .../bindings/timer/sifive,clint.yaml           | 18 ++++++++++++------
 3 files changed, 19 insertions(+), 6 deletions(-)


base-commit: 42d670bda02fdba0f3944c92f545984501e5788d
-- 
2.37.1


