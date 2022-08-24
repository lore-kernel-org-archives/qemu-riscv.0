Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQqPR-0002OQ-SO
	for mharc-qemu-riscv@gnu.org; Wed, 24 Aug 2022 09:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robherring2@gmail.com>)
 id 1oQqPN-0002Jl-JL
 for qemu-riscv@nongnu.org; Wed, 24 Aug 2022 09:27:02 -0400
Received: from mail-oa1-f50.google.com ([209.85.160.50]:36702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robherring2@gmail.com>)
 id 1oQqPL-0002A3-Qd
 for qemu-riscv@nongnu.org; Wed, 24 Aug 2022 09:27:01 -0400
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-11c896b879bso20585883fac.3
 for <qemu-riscv@nongnu.org>; Wed, 24 Aug 2022 06:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:references:in-reply-to:cc:to:from
 :x-gm-message-state:from:to:cc;
 bh=viWueFiZ5OfydC+pO3bw0kvTAFJjoYrGSGQ4/iAQQVY=;
 b=cHbZOCmHo6ILI2bXB5bybe3tHgRfLCO55om5R3IIRj29LgLYgviw/PekmSXrFeW0IM
 9yqZnuLiFTn4jHLFGLMM9AJwpUnqXvtZcFjCQlzIQDjSqZypWziZF0hhSATHnrY4ngUl
 DQL2ZI+iD0xSTJEcnATOlFStapmJQZ5zL0fG97g9/VXGHJsRyLNTuBY1AXUKj6WFykUe
 UPCnh+Pd7bAtXBDtKFgwj6AvDk1n5DhDRD8XPJ2OVWfoglmheflnpvVZF/pXwp4YJcEt
 z6WC7VlwVPNV2IhrnFjSviXa18S6yxkK6l/kAaN4ah+Z97YBB91IYIALkR0Sh4hMzxE4
 Mn8A==
X-Gm-Message-State: ACgBeo16fmXkp24WrWtNpBviaRzccugcpUcIZGfxhitKMPGDCBmaYB3m
 lE3Ep49NTWiogUSh4CtTfw==
X-Google-Smtp-Source: AA6agR4hiwTnYcZXZZDgaAHHGMgSYNVWUIkbngaylk2cV1PJhQLLoL7hjMUUg3zhPzICm+SbbABfWg==
X-Received: by 2002:a05:6870:b384:b0:11c:e692:699a with SMTP id
 w4-20020a056870b38400b0011ce692699amr3644688oap.213.1661347618286; 
 Wed, 24 Aug 2022 06:26:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f7-20020a9d2c07000000b0061c3753c30dsm4501465otb.17.2022.08.24.06.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 06:26:57 -0700 (PDT)
Received: (nullmailer pid 2098939 invoked by uid 1000);
 Wed, 24 Aug 2022 13:26:57 -0000
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org,
 Sagar Kadam <sagar.kadam@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Marc Zyngier <maz@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
 Guo Ren <guoren@kernel.org>, Jessica Clarke <jrtc27@jrtc27.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>,
 linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>
In-Reply-To: <20220823183319.3314940-5-mail@conchuod.ie>
References: <20220823183319.3314940-1-mail@conchuod.ie>
 <20220823183319.3314940-5-mail@conchuod.ie>
Subject: Re: [PATCH v4 4/4] dt-bindings: riscv: isa string bonus content
Date: Wed, 24 Aug 2022 08:26:57 -0500
Message-Id: <1661347617.007635.2098938.nullmailer@robh.at.kernel.org>
Received-SPF: pass client-ip=209.85.160.50; envelope-from=robherring2@gmail.com;
 helo=mail-oa1-f50.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 24 Aug 2022 13:27:03 -0000

On Tue, 23 Aug 2022 19:33:20 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> **NOT FOR CONSIDERATION**
> 
> I figured, sure why not add the strings for version number validation,
> just in case we need them in the future. The commented out string is
> considered by dt-schema to be "not a regex", but regex101 thinks it
> is... Maybe dt-schema does not support named match groups, but they
> are the only way that I could trivially find to make this somewhat
> manageable. Either way, it is permissive so it allows combinations
> of "M", "MpM" & no number.
> 
> Not-signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/riscv/cpus.yaml:87:111: [warning] line too long (297 > 110 characters) (line-length)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


