Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQuht-0006lP-Ox
	for mharc-qemu-riscv@gnu.org; Wed, 24 Aug 2022 14:02:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>) id 1oQuhr-0006ii-Rm
 for qemu-riscv@nongnu.org; Wed, 24 Aug 2022 14:02:23 -0400
Received: from gloria.sntech.de ([185.11.138.130]:50656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>) id 1oQuho-0008Ky-J9
 for qemu-riscv@nongnu.org; Wed, 24 Aug 2022 14:02:23 -0400
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1oQuhc-0004rU-Eh; Wed, 24 Aug 2022 20:02:08 +0200
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
Subject: Re: [PATCH v4 2/4] dt-bindings: interrupt-controller: sifive,
 plic: add legacy riscv compatible
Date: Wed, 24 Aug 2022 20:02:07 +0200
Message-ID: <4228486.V25eIC5XRa@diego>
In-Reply-To: <20220823183319.3314940-3-mail@conchuod.ie>
References: <20220823183319.3314940-1-mail@conchuod.ie>
 <20220823183319.3314940-3-mail@conchuod.ie>
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
X-List-Received-Date: Wed, 24 Aug 2022 18:02:24 -0000

Am Dienstag, 23. August 2022, 20:33:18 CEST schrieb Conor Dooley:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> While "real" hardware might not use the compatible string "riscv,plic0"
> it is present in the driver & QEMU uses it for automatically generated
> virt machine dtbs. To avoid dt-validate problems with QEMU produced
> dtbs, such as the following, add it to the binding.
> 
> riscv-virt.dtb: plic@c000000: compatible: 'oneOf' conditional failed, one must be fixed:
>         'sifive,plic-1.0.0' is not one of ['sifive,fu540-c000-plic', 'starfive,jh7100-plic', 'canaan,k210-plic']
>         'sifive,plic-1.0.0' is not one of ['allwinner,sun20i-d1-plic']
>         'sifive,plic-1.0.0' was expected
>         'thead,c900-plic' was expected
> riscv-virt.dtb: plic@c000000: '#address-cells' is a required property
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



