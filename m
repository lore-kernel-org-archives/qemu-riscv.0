Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOYGh-00034A-Ux
	for mharc-qemu-riscv@gnu.org; Thu, 18 Aug 2022 01:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oOYGZ-00033r-TL
 for qemu-riscv@nongnu.org; Thu, 18 Aug 2022 01:40:29 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oOYGV-0007El-Rn
 for qemu-riscv@nongnu.org; Thu, 18 Aug 2022 01:40:26 -0400
Received: by mail-ej1-x636.google.com with SMTP id kb8so1293956ejc.4
 for <qemu-riscv@nongnu.org>; Wed, 17 Aug 2022 22:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=co317W61JM86wn5SpVyHhhw/IObSsmC/ASfLX4XlATs=;
 b=BPpw95zJMGlqVarXqqxpRJYVpKvOPdcS+VLwCrc/VR1X4q25zj6Rd4ajymUq+07rDL
 gomGk73qCBDbrR/aYhXrHRa4jrp5IDm3gWwnlARARvY+wyon2JWVM0H/kNEsFw6G5c9N
 LpXYo35m0X3UGBj5nsZbYCepal3X1RgYSnENlh3PAfcbE216nzQK/3N+LT3WLJp27Jfi
 ch4obhMM5NyyuwpWAM9KEXE5sZZw8prfsC4IKI9YaeqqyyLrM3Xy0x8Fy6y7wMGgL4vZ
 bf+XLjgJABTfKuCUxe3U0naIjEHnYpLgY1jxzomLLF1HbxvSDh3cgzzFoHV7Rj2zC/+m
 A7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=co317W61JM86wn5SpVyHhhw/IObSsmC/ASfLX4XlATs=;
 b=lf8fUTraLdeWw0xx9F9p0YVNjmXNNDdDjUfB1CGQ0frI1Cv9wMezo9QRUn8udFPpjR
 iZiJGrUmexGnAdtV9C5wmw3hLc8vwozrEytUXXPlOMkXj3HEkrbAQ289o3SYW9M5O7Tl
 0upLHBf10He+umLb7SNUdmQmQfd//03JGnzDhSVTwvybHd6QcfTeo9+TZmBFqRz1R0aQ
 8zwWBVeLlLSlH16Egu8GGniXtBQS8p71LBrVq5Im4qG/jb95ZnnP46J3VNyC/jsXs00M
 eZ4KxHPoFvQYwFGhBkLKsASmpcqvdrOuH+YivKtqIVVqbBcJqztlxJLhmHAxpvPgXOrN
 hyxw==
X-Gm-Message-State: ACgBeo33kp/3wdYixPmgwJaKDoA/zg8zNP414TPp4lUIn35j0PeIfPdf
 Q8X0yn5S36izCFEQeCSTv0oCkA==
X-Google-Smtp-Source: AA6agR6DTPfa/DC6k9ouJhP4Wm5AirLbz4CXhH6KSzKZNQaoXfqhee31UWXbRLG+aWxz/Vko9Tgg7g==
X-Received: by 2002:a17:907:1c87:b0:6f0:29ea:cc01 with SMTP id
 nb7-20020a1709071c8700b006f029eacc01mr854089ejc.671.1660801215722; 
 Wed, 17 Aug 2022 22:40:15 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 u21-20020a170906409500b007330204dccdsm317825ejj.140.2022.08.17.22.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 22:40:15 -0700 (PDT)
Date: Thu, 18 Aug 2022 07:40:14 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <mail@conchuod.ie>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Anup Patel <anup@brainfault.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Guo Ren <guoren@kernel.org>, Sagar Kadam <sagar.kadam@sifive.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 qemu-riscv@nongnu.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: riscv: add new riscv, isa strings for
 emulators
Message-ID: <20220818054014.wad7uqqnmoc2wrbp@kamzik>
References: <20220817201212.990712-1-mail@conchuod.ie>
 <20220817201212.990712-4-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220817201212.990712-4-mail@conchuod.ie>
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x636.google.com
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
X-List-Received-Date: Thu, 18 Aug 2022 05:40:33 -0000

On Wed, Aug 17, 2022 at 09:12:12PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The QEMU virt and spike machines currently export a riscv,isa string of
> "rv64imafdcsuh",
> 
> While the RISC-V foundation has been ratifying a bunch of extenstions
> etc, the kernel has remained relatively static with what hardware is
> supported - but the same is not true of QEMU. Using the virt machine
> and running dt-validate on the dumped dtb fails, partly due to the
> unexpected isa string.
> 
> Rather than enumerate the many many possbilities, change the pattern
> to a regex, with the following assumptions:
> - the single letter order is fixed & we don't care about things that
>   can't even do "ima"
> - the standard multi letter extensions are all in a "_z<foo>" format
>   where the first letter of <foo> is a valid single letter extension
> - _s & _h are used for supervisor and hyper visor extensions.
> - after the first two chars, a standard multi letter extension name
>   could be an english   word (ifencei anyone?) so it's not worth
>   restricting the charset
> - vendor ISA extensions begind with _x and have no charset restrictions
> - we don't care about an e extension from an OS pov
> - that attempting to validate the contents of the multiletter extensions
>   with dt-validate beyond the formatting is a futile, massively verbose
>   or unwieldy exercise at best.
> - ima are required
> 
> The following limitations also apply:
> - multi letter extension ordering is not enforced. dt-schema does not
>   appear to allow for named match groups, so the resulting regex would
>   be even more of a headache.
> - ditto for the numbered extensions.
> 
> Finally, add me as a maintainer of the binding so that when it breaks
> in the future, I can be held responsible!
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Palmer, feel free to drop the maintainer addition. I just mostly want
> to clean up my own mess on this when they decide to ratify more
> extensions & this comes back up again.
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index 873dd12f6e89..c0e0bc5dce04 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -9,6 +9,7 @@ title: RISC-V bindings for 'cpus' DT nodes
>  maintainers:
>    - Paul Walmsley <paul.walmsley@sifive.com>
>    - Palmer Dabbelt <palmer@sifive.com>
> +  - Conor Dooley <conor@kernel.org>
>  
>  description: |
>    This document uses some terminology common to the RISC-V community
> @@ -79,9 +80,7 @@ properties:
>        insensitive, letters in the riscv,isa string must be all
>        lowercase to simplify parsing.
>      $ref: "/schemas/types.yaml#/definitions/string"
> -    enum:
> -      - rv64imac
> -      - rv64imafdc
> +    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:(?:_[zsh][imafdqcbvksh]|_x)(?:[a-z])+)*$
>  
>    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
>    timebase-frequency: false
> -- 
> 2.37.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

