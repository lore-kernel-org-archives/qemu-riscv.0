Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOPPO-0007J6-BA
	for mharc-qemu-riscv@gnu.org; Wed, 17 Aug 2022 16:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oOPPH-0007D2-4h
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 16:12:51 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:44882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oOPPF-0001tP-E4
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 16:12:50 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 k18-20020a05600c0b5200b003a5dab49d0bso1448666wmr.3
 for <qemu-riscv@nongnu.org>; Wed, 17 Aug 2022 13:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=bxRxSRmrcbs0t6BbgHEjmeEJnj5+oLNwKov9kosBFsg=;
 b=bCrCj8WGt3a7+JPz4Wr2qZDF5Ihib0g+F+IXH5UFuOmbFTl/2ohBvo+eaBcG5rFYcE
 JeBp5CrNuRVupkpwchSLqzMMinELgmyHdlG7Gby4T2KNUmmwkmY7XUGYNJiVa/TD597A
 NR9XTujvKalhqDbu1Jp4hY/ljxWSHtxlA0sp2QW4RYb2fYdpSN5uFQ9tbNbEHHxHhJER
 3Dln3DsYHqEvlP6GfiVTVMoP4zR0gzA1F7aJ2ljUx5qSlse+xdciWu7oepRlc27TE07U
 dPla87qdJukDzfaHBgoyR2rEm4dwdJKxYv2vTJJ/0FlbjQwTvqJM+tRh0qStUKldpQZ8
 sALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=bxRxSRmrcbs0t6BbgHEjmeEJnj5+oLNwKov9kosBFsg=;
 b=tUN/FBc8jHuGbvFtU/BKpGbNgmzlV6wb3NG2q8s+5+rtnjPpvxm68jbwmgTiA/7334
 HDfpNOQg7/llETDuJ8ZB8D+ClSe2KwhrjOTyusEfnfn05qBNlztHI808IlxUzz6emUnm
 r7Bzs8d4YJ5O46ArbAfxyrhgtpdqI2oXv3a0UGulIUv0m5Uk8cyR9IIq7qBfsZGdSDX7
 3JPrqmaFzQnrRoOe3/cc0NXrP9SjVn50ZeEBey1xCewwit4l+OtNlToJmXu6wmZpoJve
 f1zFabdTMcF92IO56s7+P5nCkOZXLomk0A4ZKyRUvepwz4we4vOpUmKJYDaLYdvhj4vo
 hcLA==
X-Gm-Message-State: ACgBeo0KuxjPRB/qGLfRFLTyh5aXrb5VVCWIfo4kDtG804cMONWtNjFm
 SsZj5jD0fCekdTmrv3rJJyCwdQ==
X-Google-Smtp-Source: AA6agR74aNlPfmPJlKcC05Y6jx7zXOmB8kg1e0yHZoCDAb3lYxnfuQYXfqqonf1zKIGzDxzQd1NAnQ==
X-Received: by 2002:a7b:c402:0:b0:3a5:3c7:9741 with SMTP id
 k2-20020a7bc402000000b003a503c79741mr3131497wmi.72.1660767168134; 
 Wed, 17 Aug 2022 13:12:48 -0700 (PDT)
Received: from henark71.. ([109.76.58.63]) by smtp.gmail.com with ESMTPSA id
 i15-20020a05600c354f00b003a5dfd7e9eesm3029371wmq.44.2022.08.17.13.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 13:12:47 -0700 (PDT)
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
Subject: [NOT FOR INCLUSION v3 4/4] dt-bindings: riscv: isa string bonus
 content
Date: Wed, 17 Aug 2022 21:12:13 +0100
Message-Id: <20220817201212.990712-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817201212.990712-1-mail@conchuod.ie>
References: <20220817201212.990712-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=mail@conchuod.ie; helo=mail-wm1-x335.google.com
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
X-List-Received-Date: Wed, 17 Aug 2022 20:12:51 -0000

From: Conor Dooley <conor.dooley@microchip.com>

**NOT FOR INCLUSION**

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


