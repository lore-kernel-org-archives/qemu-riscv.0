Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQYj2-0001aW-NJ
	for mharc-qemu-riscv@gnu.org; Tue, 23 Aug 2022 14:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oQYis-0001Uf-Oh
 for qemu-riscv@nongnu.org; Tue, 23 Aug 2022 14:34:02 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oQYiq-0004jm-MK
 for qemu-riscv@nongnu.org; Tue, 23 Aug 2022 14:33:58 -0400
Received: by mail-wr1-x436.google.com with SMTP id b5so13741922wrr.5
 for <qemu-riscv@nongnu.org>; Tue, 23 Aug 2022 11:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=q+TKEP48DscTRDbw52nvoVUMRS8D3Vksl/C8HoYqAy4=;
 b=WpT9FPSBFg5gj+3SEKAhIEbYy3VkM3t5SkcVrrpMsQvWqW6CpC+os07Y68qsl5lQwm
 AD9aui8SzjnCNTdK/B+NdogzMwQrEARSnmNh4Em/mpaCF3tt1dncmTSuRqeFOdwzSLIA
 ls1vTNAj6nNguGE8AWF1bWbb7hbNKits7Us+r+sE8+Zf745XQuV65ozSkZ799QhNmWIt
 r/QETJq4bRmHVBSsM/Lb9KTTbgiafcDeVKvFZzseo/e4jvxjzHuGzjhdqFjndp7rnJ8+
 2fdRyICsC9C/YbtB+TJEha0s9c6kCOxBi+SMHs9CTaMBb9rbeDhdjijQkuK0JShl4rxX
 z1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=q+TKEP48DscTRDbw52nvoVUMRS8D3Vksl/C8HoYqAy4=;
 b=PswKVrIChdGvWiYgpHNs3k5/DD/QEj0TL5IphoouRe2KbIy+Acmvb5xDQ6a9qPSLhz
 RuLsQoV9Epuh59sluF9AAntOOxp5tdOwiLfkjbfLk2r01i7/JD8eual5edJY6M+MngJ/
 fml96GLstCousRbQDf9h5pLwaigsMFSPomkWQ2+JWQescZy9cbazAHCcm+R9b8EMkz5c
 HkEdWm5/stvLU5bnsqaER7K9j8W0Af05vvvoH22a5WDKgG39WEatHC43Ld6m/L6x0Bn8
 ae8ZPjNXvugz3evjyf0eUz3LF4g1Bp9t+9pzVcLSHuAq8kuQHOccDoQhuePgybmUKLmI
 hZNw==
X-Gm-Message-State: ACgBeo0xwhGQtS9Lct3tw8kbwrKCOmxjBiS5wac74aCuGET/oKp0ZXdB
 CmVpUOSBtL1VPQUAY7j8v7PNyg==
X-Google-Smtp-Source: AA6agR4eKdmNbLaAlee4FvNn9BWllAehRRH4lTp5MXW2JWFAbIkwID5iLn+33HA0tJYbINEHH4yyMQ==
X-Received: by 2002:a05:6000:18a1:b0:222:c54a:3081 with SMTP id
 b1-20020a05600018a100b00222c54a3081mr13725350wri.666.1661279633502; 
 Tue, 23 Aug 2022 11:33:53 -0700 (PDT)
Received: from henark71.. ([51.37.149.245]) by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c1d9000b003a5fcae64d4sm19396556wms.29.2022.08.23.11.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 11:33:52 -0700 (PDT)
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
Subject: [PATCH v4 0/4] Fix dt-validate issues on qemu dtbdumps due to
 dt-bindings
Date: Tue, 23 Aug 2022 19:33:16 +0100
Message-Id: <20220823183319.3314940-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=mail@conchuod.ie; helo=mail-wr1-x436.google.com
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

Changes since v3:
- dropped the charset restrictions for standard multiletter isa extensions

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


