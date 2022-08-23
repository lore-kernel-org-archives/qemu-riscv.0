Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQYj9-0001cm-D2
	for mharc-qemu-riscv@gnu.org; Tue, 23 Aug 2022 14:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oQYix-0001WX-NU
 for qemu-riscv@nongnu.org; Tue, 23 Aug 2022 14:34:03 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:38779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oQYiw-0004kK-1B
 for qemu-riscv@nongnu.org; Tue, 23 Aug 2022 14:34:03 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 n23-20020a7bc5d7000000b003a62f19b453so7010136wmk.3
 for <qemu-riscv@nongnu.org>; Tue, 23 Aug 2022 11:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=trv5fw0bTaRkhXK0X5euU+YZQIdt/hyNEtAW//ypjq4=;
 b=SbIqnUkCy+xr3G4o41X6O/3K6TdfRJnovS+CTSQDtTxCHC12Dr2hCrLWJb14TBsmL7
 lWBETJqBGmVPBNTdzb6i97jcciKXvfliHjaVH2WvuQDtdYipzwkytutPbIAoRIhAlXcN
 BiUQCaIU6+VbOthEftP+Vl5EKnyq3nQH7aRyPJyD0Y8TQ4TQ3IDh9NPwlGGsozrUWCfJ
 9gJrSfEZ9qukTVfG9ziZNXXLqbGpMFLs9oyc3pV7HHO2bLKvpzURDQZwqzvXfExw+900
 uPyd0qqVtAXIkJRBgKgUTRT7eIJaxdLAebLlBN7VwstK5T3aghNRMyNfOP/6qHrT223r
 mFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=trv5fw0bTaRkhXK0X5euU+YZQIdt/hyNEtAW//ypjq4=;
 b=5X3Yajho2iAtdy9QvQwmsrzvEzqrlKeCa2mv6V2hdE/ZxmjQpvh2NRJTMcJQzPCOCh
 4b0PbDPj+3A/Bi9PenAeKVaw2xt+0x+aqs8RrTjApUJ+41ElguJf2cCJLk7l/J3Jtl0O
 84YCKOWaQZScOLMSHbLdH7F0hCMwdY2v+oe6VsOI/aVtxlqjUG9m9ScIYr+/1n5byWBr
 Sbcuh13ZleI691tEjXrCtEgOiNZUfVKKZu0XML0WkTtuL8e+hAlvWj78vF9fQejSFz0r
 CuF3uFJ5ebgmjNzaGuGawhA9jJmwBFFR+3YbO1nxhq/3lFUxw5qQsuoknq8iBPcvw7vJ
 IqTQ==
X-Gm-Message-State: ACgBeo1Z8WdWILB3+g878QeU1QYvFDaIG2bX99jEvy6FWt281HRSGFjw
 a0Vr+De9purYGdvGXhjhy01JiQ==
X-Google-Smtp-Source: AA6agR5PsHa/f15Jc+wTtB6380Zen3xwCl+1v7C+oWEpfdzbxeubJb/sNC5ucLm5tjbY479QnKQpqg==
X-Received: by 2002:a05:600c:3b92:b0:3a6:5645:5fc7 with SMTP id
 n18-20020a05600c3b9200b003a656455fc7mr2978623wms.148.1661279638941; 
 Tue, 23 Aug 2022 11:33:58 -0700 (PDT)
Received: from henark71.. ([51.37.149.245]) by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c1d9000b003a5fcae64d4sm19396556wms.29.2022.08.23.11.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 11:33:58 -0700 (PDT)
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
Subject: [PATCH v4 4/4] dt-bindings: riscv: isa string bonus content
Date: Tue, 23 Aug 2022 19:33:20 +0100
Message-Id: <20220823183319.3314940-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220823183319.3314940-1-mail@conchuod.ie>
References: <20220823183319.3314940-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=mail@conchuod.ie; helo=mail-wm1-x32e.google.com
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
X-List-Received-Date: Tue, 23 Aug 2022 18:34:04 -0000

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
index 90a7cabf58fe..6c725d067846 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -80,7 +80,11 @@ properties:
       insensitive, letters in the riscv,isa string must be all
       lowercase to simplify parsing.
     $ref: "/schemas/types.yaml#/definitions/string"
-    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:_[hsxz](?:[a-z])+)*$
+    oneOf:
+      - pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:_[hsxz](?:[a-z])+)*$
+      - pattern: ^rv(?:64|32)(?:i\d+)(?:m\d+)(?:a\d+)(?:f\d+)?(?:d\d+)?(?:q\d+)?(?:c\d+)?(?:b\d+)?(?:v\d+)?(?:k\d+)?(?:h\d+)?(?:(?:_[zsh][imafdqcbvksh]|_x)(?:[a-z])+\d+)*$
+      - pattern: ^rv(?:64|32)(?:i\d+p\d+)(?:m\d+p\d+)(?:a\d+p\d+)(?:f\d+p\d+)?(?:d\d+p\d+)?(?:q\d+p\d+)?(?:c\d+p\d+)?(?:b\d+p\d+)?(?:v\d+p\d+)?(?:k\d+p\d+)?(?:h\d+p\d+)?(?:(?:_[zsh][imafdqcbvksh]|_x)(?:[a-z])+(?:\d+p\d+))*$
+#      - pattern: ^rv(?:64|32)(?:i(?<num>(?:\d+|\d+p\d+)?)?)(?:m(?:\k<num>)?)(?:a(?:\k<num>)?)(?:f(?:\k<num>)?)?(?:d(?:\k<num>)?)?(?:q(?:\k<num>)?)?(?:c(?:\k<num>)?)?(?:b(?:\k<num>)?)?(?:v(?:\k<num>)?)?(?:k(?:\k<num>)?)?(?:h(?:\k<num>)?)?(?:(?:_[zsh][imafdqcbvksh]|_x)(?:[a-z])*(?:\d+|\d+p\d+)?)+$
 
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
   timebase-frequency: false
-- 
2.37.1


