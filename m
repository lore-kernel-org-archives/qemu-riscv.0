Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQYj8-0001c9-Lp
	for mharc-qemu-riscv@gnu.org; Tue, 23 Aug 2022 14:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oQYiw-0001VD-C8
 for qemu-riscv@nongnu.org; Tue, 23 Aug 2022 14:34:02 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:46662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oQYis-0004k3-So
 for qemu-riscv@nongnu.org; Tue, 23 Aug 2022 14:34:00 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 k6-20020a05600c1c8600b003a54ecc62f6so8202422wms.5
 for <qemu-riscv@nongnu.org>; Tue, 23 Aug 2022 11:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=zfZqIEnKLgqKdt6yEdOe5gINIOFbq6xfPYo5xvbrixM=;
 b=f5pjcIK+H2mtPPE5b3VybQ5o01iECTvnw1E+28BxIUWO/6RjUzl2PBeS9opQx/sJtx
 yG2ysXoQtSd7WBzuZMOdXnT8YJjxr3vYR5+T/JX7WViSSLLzyWulBQl9Ko9BJ17LqXeZ
 ETGaCTo5yarZMm+oslfXmcNAi4epItnAZqaBYIMkIQm0At1DRkfT+iDb+SfVqSxBugml
 /5ZzzSEfTKoyNJSdvCwfE6CeTnMSICRVyM7qDc7zTPhZyBfqGkmjUnvVx/itr2tPYaA8
 ONtGo4StZVjqqloFXAtoKHXtIcn38GlQfWO7p9BYujiPWphKMNU0v9xU6g0zgzl9njmI
 LYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=zfZqIEnKLgqKdt6yEdOe5gINIOFbq6xfPYo5xvbrixM=;
 b=pT8A+TvucdtFdpwxPcpLSzubWWNtGCRD6TqKpD6UVTpvI2ow3AK8f9TZb8LQZ4mpL7
 vHIo/HsWiHkDLoB8A0y98ELchNKyRVhYu7jJiBw+FkTTTXZnWx1PBRVeflrU+AUu413U
 1eoeU4GvBYCbDnWCfyvYEVmEb2VIGWqOdM1XjeZiOYI+t+tavI5JVjJdekk3boaMJWM7
 A8bFCUV3OU3iFLW3pOzSCK4wW9QfT0yLQzGRRG5Sjnz/5IcI4ZMraHxTwxX6JKErLJou
 ohFFHb1j7l3BjPZCCbgtlaD5MjmjMi1txMt5rR6bprXLquNqhzv9HXi5Qq8MoO+GH9ue
 eVBA==
X-Gm-Message-State: ACgBeo1VhWQWSaKAR+BYgrKoggyY5RUy3inLF8UvOwlVCI6+80anQ/UT
 xDSbdsyk0XTwULBAgiHEGyvPOQ==
X-Google-Smtp-Source: AA6agR5eS5/PKXnK5uN2L+sdbkehjdJJ73byQpKpkqsyKD/rDgN0AG98DD6sac0atiQVprDQeVTQwA==
X-Received: by 2002:a1c:c91a:0:b0:3a6:38bf:2c36 with SMTP id
 f26-20020a1cc91a000000b003a638bf2c36mr3062339wmb.38.1661279637684; 
 Tue, 23 Aug 2022 11:33:57 -0700 (PDT)
Received: from henark71.. ([51.37.149.245]) by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c1d9000b003a5fcae64d4sm19396556wms.29.2022.08.23.11.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 11:33:57 -0700 (PDT)
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
Subject: [PATCH v4 3/4] dt-bindings: riscv: add new riscv,
 isa strings for emulators
Date: Tue, 23 Aug 2022 19:33:19 +0100
Message-Id: <20220823183319.3314940-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220823183319.3314940-1-mail@conchuod.ie>
References: <20220823183319.3314940-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=mail@conchuod.ie; helo=mail-wm1-x32c.google.com
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

The QEMU virt and spike machines currently export a riscv,isa string of
"rv64imafdcsuh",

While the RISC-V foundation has been ratifying a bunch of extenstions
etc, the kernel has remained relatively static with what hardware is
supported - but the same is not true of QEMU. Using the virt machine
and running dt-validate on the dumped dtb fails, partly due to the
unexpected isa string.

Rather than enumerate the many many possbilities, change the pattern
to a regex, with the following assumptions:
- ima are required
- the single letter order is fixed & we don't care about things that
  can't even do "ima"
- the standard multi letter extensions are all in a "_z<foo>" format
  where the first letter of <foo> is a valid single letter extension
- _s & _h are used for supervisor and hyper visor extensions
- convention says that after the first two chars, a standard multi
  letter extension name could be an english word (ifencei anyone?) so
  it's not worth restricting the charset
- as the above is just convention, don't apply any charset restrictions
  to reduce future churn
- vendor ISA extensions begind with _x and have no charset restrictions
- we don't care about an e extension from an OS pov
- that attempting to validate the contents of the multiletter extensions
  with dt-validate beyond the formatting is a futile, massively verbose
  or unwieldy exercise at best

The following limitations also apply:
- multi letter extension ordering is not enforced. dt-schema does not
  appear to allow for named match groups, so the resulting regex would
  be even more of a headache
- ditto for the numbered extensions

Finally, add me as a maintainer of the binding so that when it breaks
in the future, I can be held responsible!

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Palmer, feel free to drop the maintainer addition. I just mostly want
to clean up my own mess on this when they decide to ratify more
extensions & this comes back up again.
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 873dd12f6e89..90a7cabf58fe 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -9,6 +9,7 @@ title: RISC-V bindings for 'cpus' DT nodes
 maintainers:
   - Paul Walmsley <paul.walmsley@sifive.com>
   - Palmer Dabbelt <palmer@sifive.com>
+  - Conor Dooley <conor@kernel.org>
 
 description: |
   This document uses some terminology common to the RISC-V community
@@ -79,9 +80,7 @@ properties:
       insensitive, letters in the riscv,isa string must be all
       lowercase to simplify parsing.
     $ref: "/schemas/types.yaml#/definitions/string"
-    enum:
-      - rv64imac
-      - rv64imafdc
+    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:_[hsxz](?:[a-z])+)*$
 
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
   timebase-frequency: false
-- 
2.37.1


