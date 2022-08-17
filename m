Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOPId-0002gl-33
	for mharc-qemu-riscv@gnu.org; Wed, 17 Aug 2022 16:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oOPIb-0002dr-Ua
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 16:05:57 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oOPIa-0000Cp-5u
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 16:05:57 -0400
Received: by mail-wr1-x430.google.com with SMTP id ba1so6830565wrb.5
 for <qemu-riscv@nongnu.org>; Wed, 17 Aug 2022 13:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=De0s+s/D2rq5b1W85sP7P0sadpD1tyl+4KZh5xfCdFc=;
 b=CqamtgAe1cozn3E5KYzIR0JSvcCAa1Xfs2dPgBcx+0TIqlYpaQ31CAGtekwFrEq3/w
 +lY37IADJw7hcSFmTZ5af/FF/BWp/lzVufrxeKGzDhuXY3/lmzb7Y/GcUmt+NJ/1dWRF
 No5gZ+j+hFAHBwcOmgNIM0KteUxW83ESCVJCDvMNCkbHKNu4Fp44M0F8HZ5m4YVcrYE5
 gVv1hRa6fQlU4jn/uVxGBskyzHAK1X3lsTkVsg7wg+nHs6RGCiW+b8g6A1EAMAB44MnL
 JLobl0GZbdVudwNjFMsjiMjZJn3PJPDXAw2MQGt1Z7ETNOFJguNN9qrdd954ctHWf0up
 IktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=De0s+s/D2rq5b1W85sP7P0sadpD1tyl+4KZh5xfCdFc=;
 b=AbQgfqdlJv0IRQAy/i8Qk/ijIjzMblhjMJX/AWjCMBE4DuPwr5tw8rImwwPoCOfioj
 aES04dFvX3tOHwQ2cWqqq/JxmiSBife0PqdDQuPLu+kVbzEwZGoaV3lfWIzWmRYoW00Z
 HdDKRt8i6tCGa80IWWkKJ/VWNbx7ff9KUT3yW0gp3/STf40HMCIV5p9huLXX/b4z26vq
 ehYW3Z+K6PKuh+kvMNBSqmClL1nSSfyXkSzEAaO+XCbKcGhJW7GqunysLUwV0N11jWCE
 zQ8k2Q1xRHSvtmb0EbJqjtEe1662/Bltwup3xKFn6VLThNI/2G+tqeHf+C83AVykss45
 bcrA==
X-Gm-Message-State: ACgBeo0xnx/F24fCy/+mv8JHCic1C5QNlEaOpYChia60nDbAo1hCwC9U
 fy+EH417a+Dr/Dps7wjGBBgRdw==
X-Google-Smtp-Source: AA6agR50pEUBEksxLhbytcIwiO8h9Uinjt+PuB3e09bA3J6AK1dzbXoEiGaehAaijDuEftMP10HEjg==
X-Received: by 2002:a5d:534e:0:b0:225:2c0b:9b08 with SMTP id
 t14-20020a5d534e000000b002252c0b9b08mr750530wrv.136.1660766754709; 
 Wed, 17 Aug 2022 13:05:54 -0700 (PDT)
Received: from henark71.. ([109.76.58.63]) by smtp.gmail.com with ESMTPSA id
 i133-20020a1c3b8b000000b003a531c7aa66sm3400883wma.1.2022.08.17.13.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 13:05:53 -0700 (PDT)
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
Subject: [PATCH 3/4] dt-bindings: riscv: add new riscv,
 isa strings for emulators
Date: Wed, 17 Aug 2022 21:05:22 +0100
Message-Id: <20220817200531.988850-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817200531.988850-1-mail@conchuod.ie>
References: <20220817200531.988850-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=mail@conchuod.ie; helo=mail-wr1-x430.google.com
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
X-List-Received-Date: Wed, 17 Aug 2022 20:05:58 -0000

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
- the single letter order is fixed & we don't care about things that
  can't even do "ima"
- the standard multi letter extensions are all in a "_z<foo>" format
  where the first letter of <foo> is a valid single letter extension
- _s & _h are used for supervisor and hyper visor extensions.
- after the first two chars, a standard multi letter extension name
  could be an english   word (ifencei anyone?) so it's not worth
  restricting the charset
- vendor ISA extensions begind with _x and have no charset restrictions
- we don't care about an e extension from an OS pov
- that attempting to validate the contents of the multiletter extensions
  with dt-validate beyond the formatting is a futile, massively verbose
  or unwieldy exercise at best.
- ima are required

The following limitations also apply:
- multi letter extension ordering is not enforced. dt-schema does not
  appear to allow for named match groups, so the resulting regex would
  be even more of a headache.
- ditto for the numbered extensions.

Finally, add me as a maintainer of the binding so that when it breaks
in the future, I can be held responsible!

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Palmer, feel free to drop the maintainer addition. I just mostly want
to clean up my own mess on this when they decide to ratify more
extensions & this comes back up again.
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 873dd12f6e89..c0e0bc5dce04 100644
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
+    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:(?:_[zsh][imafdqcbvksh]|_x)(?:[a-z])+)*$
 
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
   timebase-frequency: false
-- 
2.37.1


