Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOPIf-0002kw-5i
	for mharc-qemu-riscv@gnu.org; Wed, 17 Aug 2022 16:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oOPId-0002hg-Ey
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 16:05:59 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:53025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oOPIb-0000D9-T6
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 16:05:59 -0400
Received: by mail-wm1-x330.google.com with SMTP id k17so7151930wmr.2
 for <qemu-riscv@nongnu.org>; Wed, 17 Aug 2022 13:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=MSYB9FwL7p/iJdXtPMVngWpHWItwLj/alFVUIh6RUfI=;
 b=aalXbJEtEyz0fdYAOCKPabkxfm+u5zzEGFKYYYxBeomEWGFk/ytTvkEEfWKdBZ9qam
 wwPT8nrUrsYfzpKtV1r1kCaWqWs7YknEFQ+aMuxIJu94oyoYyqccYk++TUEtq7RdJvKO
 MzSWpQ8GV7vEXfBNVWpGsamiURxgJnsbxc7XXf53ogih2Ou90s3e7mUu35VW3GIQCSSw
 JPvYuuH7VSB7jfYTR68yLcDpE1FtIEkttItkbc9J1nSS2wMYrQSwMbS4hn8f9anRfmWP
 24Hrem9kUuAlsAO5ml5foFmLYM1OVh5ICRpf43152oMEX3Pn0AUq0pEnXNS1n6QB9vsm
 c8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=MSYB9FwL7p/iJdXtPMVngWpHWItwLj/alFVUIh6RUfI=;
 b=j7fzmq4CPS0EsndhTnVGTElYBQh6STv7tzYF2ShqOlSWZxrzdnInYbpw2CvRLPUqbC
 5929m6vsPznd39eeKKZ9xLscEs4Z2WlSvL9Ye1i1dMgd2JsbhvFIJBscLDDpaEEhJOuJ
 egmcxp7j37l6WiimV7CSKziDqMvb8gv+3QvRcna9KDm4S9Bt52HOcuCSqL1VW9EJMWN1
 t1RAKLBii0OmRzkxxnL9u+xidABVhZ5nvtwAHs23E2n9X2y9D+08/p0F4+TmoCLFMgNE
 GQifEANYYEt4Nnd7d6V+IADsD72NYMHrpzwwXDTjL1jqT8aeofomGnRkXJMnEono1vNe
 NofQ==
X-Gm-Message-State: ACgBeo2dlSL0JxZe8eR9QbyGzSeMofEgJgErD8p70v96/9Mc9b4h29Hf
 bv3J4PeS7xbaeQ2HCbDat9Gvxw==
X-Google-Smtp-Source: AA6agR5DU5oL31YGMFMqSJ9QosyAIgz1wKmRamOx/HzSICAxr/vstQ62IK8je47MYg2BbSWSiqFh2A==
X-Received: by 2002:a7b:cb88:0:b0:3a5:ea1c:c541 with SMTP id
 m8-20020a7bcb88000000b003a5ea1cc541mr3165264wmi.114.1660766756496; 
 Wed, 17 Aug 2022 13:05:56 -0700 (PDT)
Received: from henark71.. ([109.76.58.63]) by smtp.gmail.com with ESMTPSA id
 i133-20020a1c3b8b000000b003a531c7aa66sm3400883wma.1.2022.08.17.13.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 13:05:55 -0700 (PDT)
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
Subject: [NOT-A-PATCH 4/4] dt-bindings: riscv: isa string bonus content
Date: Wed, 17 Aug 2022 21:05:23 +0100
Message-Id: <20220817200531.988850-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817200531.988850-1-mail@conchuod.ie>
References: <20220817200531.988850-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=mail@conchuod.ie; helo=mail-wm1-x330.google.com
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
X-List-Received-Date: Wed, 17 Aug 2022 20:05:59 -0000

From: Conor Dooley <conor.dooley@microchip.com>

**NOT FOR CONSIDERATION**

I figured, sure why not add the strings for version number validation,
just in case we need them in the future. The commented out string is
considered by dt-schema to be "not a regex", but regex101 thinks it
is... Maybe dt-schema does not support named match groups, but they
are the only way that I could trivially find to make this somewhat
manageable. Either way, it is permissive so it allows combinations
of "M", "MpM" & no number.

Not-signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index c0e0bc5dce04..38a824453012 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -80,7 +80,11 @@ properties:
       insensitive, letters in the riscv,isa string must be all
       lowercase to simplify parsing.
     $ref: "/schemas/types.yaml#/definitions/string"
-    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:(?:_[zsh][imafdqcbvksh]|_x)(?:[a-z])+)*$
+    oneOf:
+      - pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:(?:_[zsh][imafdqcbvksh]|_x)(?:[a-z])+)*$
+      - pattern: ^rv(?:64|32)(?:i\d+)(?:m\d+)(?:a\d+)(?:f\d+)?(?:d\d+)?(?:q\d+)?(?:c\d+)?(?:b\d+)?(?:v\d+)?(?:k\d+)?(?:h\d+)?(?:(?:_[zsh][imafdqcbvksh]|_x)(?:[a-z])+\d+)*$
+      - pattern: ^rv(?:64|32)(?:i\d+p\d+)(?:m\d+p\d+)(?:a\d+p\d+)(?:f\d+p\d+)?(?:d\d+p\d+)?(?:q\d+p\d+)?(?:c\d+p\d+)?(?:b\d+p\d+)?(?:v\d+p\d+)?(?:k\d+p\d+)?(?:h\d+p\d+)?(?:(?:_[zsh][imafdqcbvksh]|_x)(?:[a-z])+(?:\d+p\d+))*$
+#      - pattern: ^rv(?:64|32)(?:i(?<num>(?:\d+|\d+p\d+)?)?)(?:m(?:\k<num>)?)(?:a(?:\k<num>)?)(?:f(?:\k<num>)?)?(?:d(?:\k<num>)?)?(?:q(?:\k<num>)?)?(?:c(?:\k<num>)?)?(?:b(?:\k<num>)?)?(?:v(?:\k<num>)?)?(?:k(?:\k<num>)?)?(?:h(?:\k<num>)?)?(?:(?:_[zsh][imafdqcbvksh]|_x)(?:[a-z])*(?:\d+|\d+p\d+)?)+$
 
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
   timebase-frequency: false
-- 
2.37.1


