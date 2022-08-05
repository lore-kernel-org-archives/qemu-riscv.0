Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oK0CF-00007P-7h
	for mharc-qemu-riscv@gnu.org; Fri, 05 Aug 2022 12:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oK0CD-0008Ui-CV
 for qemu-riscv@nongnu.org; Fri, 05 Aug 2022 12:29:09 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oK0CB-0002Yz-Ka
 for qemu-riscv@nongnu.org; Fri, 05 Aug 2022 12:29:09 -0400
Received: by mail-wr1-x429.google.com with SMTP id h13so3813562wrf.6
 for <qemu-riscv@nongnu.org>; Fri, 05 Aug 2022 09:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Bx9G8JNLiLJhDs2y+OulTQ6Arh93SHt8PJNhnkzS76A=;
 b=G8MjgRH1Dn5QHvCiGLUoHF1aRHWwuzqsY8+wvXJca/a+ZTHD0d/fJq9ByzAG71C4Gm
 brpuYzE4q5EjV6KvPCrpP4q8RpKDe6BQP38FTgiaz7FvOaWB6HnBXC7Y+QemmGTQ6XFG
 Lql/qMKUyGD9o89w4PxplbuWHyocXiBfg11Ydjl3fzyMGp0iFa5haHQaEJ6LYLEGv/VD
 VoFzWhQ3mh9Itj2HrYNPxF09k6/cIDE9Bhv/zErgH0H7Z96OQE0yeeQlrN1EThLHsKpH
 JEYKHdu+rxrhXp70NsNm7i69uxBxb+6KjfurAgrsGgo0faWi1e/J/E9qFugnQXv6KItI
 NW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Bx9G8JNLiLJhDs2y+OulTQ6Arh93SHt8PJNhnkzS76A=;
 b=rISZMYZNeclVwsypqKoZvd0UP5zF6aLb++wTEmxLwmzRVsI2oeiKzyRTQM7X8MBBpE
 Utfz4t9K4EefQKreJjeVdMbe+LHGHEr/MIMg1QywQlEgNZ4EfTML+Ud6WYVCx4VE7MTI
 +n1Qd7ieM80l3gvvZTcxEYgCHLzaPHCO+7J0woXEwcvWm05f0MzBFJuAb0Kkc7yxavsQ
 paNkQ3L4hDCd28xYFiKeYi4pjVwqHiaITem1O28cSYJ/Q0MEIwlIi6KJ697oeQOzlsZs
 sj6PfN7PFjDiVMpqTraJp9t8Ni2EXTx4zJ1e+WAqqV6xCBAdYXfejaNwXuVLgxcbmXv1
 YWNA==
X-Gm-Message-State: ACgBeo3K02iRh5kRX1PSCjlecw5RT7qHTZOkYsW8VjwZDtFuyOjM5+Ix
 7/EmtMvZmFnDcz7pdeeshneNOA==
X-Google-Smtp-Source: AA6agR4qNHuK519Im+LmKC2Dyrt7fi+TNPv6Ialp08tZQks0jZtMsiBr2xk+CxzRIiLrK+LeQ/NxSg==
X-Received: by 2002:adf:fbc6:0:b0:21d:3fc3:99e with SMTP id
 d6-20020adffbc6000000b0021d3fc3099emr4737953wrs.550.1659716946942; 
 Fri, 05 Aug 2022 09:29:06 -0700 (PDT)
Received: from henark71.. ([93.107.66.220]) by smtp.gmail.com with ESMTPSA id
 b10-20020a056000054a00b00220633d96f2sm5210086wrf.72.2022.08.05.09.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 09:29:06 -0700 (PDT)
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
Subject: [PATCH 3/3] dt-bindings: riscv: add new riscv,
 isa strings for emulators
Date: Fri,  5 Aug 2022 17:28:45 +0100
Message-Id: <20220805162844.1554247-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805162844.1554247-1-mail@conchuod.ie>
References: <20220805162844.1554247-1-mail@conchuod.ie>
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
X-List-Received-Date: Fri, 05 Aug 2022 16:29:09 -0000

From: Conor Dooley <conor.dooley@microchip.com>

The QEMU virt and spike machines currently export a riscv,isa string of
"rv64imafdcsuh", but this obviously has illegal extensions in it.
The presense of "su" is a QEMU bug, so add an entry for the valid
portion of the isa string.

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Although the commit message says "a" string, I have added more than one
isa string. My patched version of QEMU emits the full string with the
multi letter extensions and I am not sure what the policy is for
including them in the binding. Obviously I am more than willing to
change the patch text if needed.
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d632ac76532e..59b942c5b9aa 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -77,6 +77,8 @@ properties:
     enum:
       - rv64imac
       - rv64imafdc
+      - rv64imafdch
+      - rv64imafdch_zicsr_zifencei_zba_zbb_zbc_zbs
 
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
   timebase-frequency: false
-- 
2.37.1


