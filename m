Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQuOM-0003cw-Ee
	for mharc-qemu-riscv@gnu.org; Wed, 24 Aug 2022 13:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>) id 1oQuOK-0003ab-GQ
 for qemu-riscv@nongnu.org; Wed, 24 Aug 2022 13:42:12 -0400
Received: from gloria.sntech.de ([185.11.138.130]:50208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>) id 1oQuOF-0005C6-HV
 for qemu-riscv@nongnu.org; Wed, 24 Aug 2022 13:42:10 -0400
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1oQuNv-0004hr-Rm; Wed, 24 Aug 2022 19:41:47 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>,
 Guo Ren <guoren@kernel.org>, Sagar Kadam <sagar.kadam@sifive.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, Andrew Jones <ajones@ventanamicro.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org,
 Rob Herring <robh@kernel.org>, Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH v4 3/4] dt-bindings: riscv: add new riscv,
 isa strings for emulators
Date: Wed, 24 Aug 2022 19:41:46 +0200
Message-ID: <2846981.bB369e8A3T@diego>
In-Reply-To: <20220823183319.3314940-4-mail@conchuod.ie>
References: <20220823183319.3314940-1-mail@conchuod.ie>
 <20220823183319.3314940-4-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=185.11.138.130; envelope-from=heiko@sntech.de;
 helo=gloria.sntech.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 24 Aug 2022 17:42:13 -0000

Am Dienstag, 23. August 2022, 20:33:19 CEST schrieb Conor Dooley:
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
> - ima are required
> - the single letter order is fixed & we don't care about things that
>   can't even do "ima"
> - the standard multi letter extensions are all in a "_z<foo>" format
>   where the first letter of <foo> is a valid single letter extension
> - _s & _h are used for supervisor and hyper visor extensions
> - convention says that after the first two chars, a standard multi
>   letter extension name could be an english word (ifencei anyone?) so
>   it's not worth restricting the charset
> - as the above is just convention, don't apply any charset restrictions
>   to reduce future churn
> - vendor ISA extensions begind with _x and have no charset restrictions
> - we don't care about an e extension from an OS pov
> - that attempting to validate the contents of the multiletter extensions
>   with dt-validate beyond the formatting is a futile, massively verbose
>   or unwieldy exercise at best
> 
> The following limitations also apply:
> - multi letter extension ordering is not enforced. dt-schema does not
>   appear to allow for named match groups, so the resulting regex would
>   be even more of a headache
> - ditto for the numbered extensions

That description sounds about right, though me and regexes never
became friends, so the following will have to do:

Acked-by: Heiko Stuebner <heiko@sntech.de>


> Finally, add me as a maintainer of the binding so that when it breaks
> in the future, I can be held responsible!
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Acked-by: Guo Ren <guoren@kernel.org>
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
> index 873dd12f6e89..90a7cabf58fe 100644
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
> +    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:_[hsxz](?:[a-z])+)*$
>  
>    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
>    timebase-frequency: false
> 





