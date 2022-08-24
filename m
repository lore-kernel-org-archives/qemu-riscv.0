Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQugU-0005By-KO
	for mharc-qemu-riscv@gnu.org; Wed, 24 Aug 2022 14:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>) id 1oQugL-00059u-Vh
 for qemu-riscv@nongnu.org; Wed, 24 Aug 2022 14:00:50 -0400
Received: from gloria.sntech.de ([185.11.138.130]:50562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>) id 1oQugI-0008D2-5a
 for qemu-riscv@nongnu.org; Wed, 24 Aug 2022 14:00:49 -0400
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1oQug4-0004qH-Mb; Wed, 24 Aug 2022 20:00:32 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: tglx@linutronix.de, maz@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, Conor.Dooley@microchip.com
Cc: daniel.lezcano@linaro.org, anup@brainfault.org, Conor.Dooley@microchip.com,
 guoren@kernel.org, sagar.kadam@sifive.com, jrtc27@jrtc27.com,
 ajones@ventanamicro.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, qemu-riscv@nongnu.org, robh@kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: interrupt-controller: sifive,
 plic: add legacy riscv compatible
Date: Wed, 24 Aug 2022 20:00:31 +0200
Message-ID: <7260367.4vTCxPXJkl@diego>
In-Reply-To: <95fe8df7-581e-f7ec-be1f-1c6e06cb30a4@microchip.com>
References: <20220823183319.3314940-1-mail@conchuod.ie>
 <3948407.AJdgDx1Vlc@diego>
 <95fe8df7-581e-f7ec-be1f-1c6e06cb30a4@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
X-List-Received-Date: Wed, 24 Aug 2022 18:00:50 -0000

Am Mittwoch, 24. August 2022, 19:55:17 CEST schrieb Conor.Dooley@microchip.=
com:
> On 24/08/2022 18:44, Heiko St=FCbner wrote:
> > Am Dienstag, 23. August 2022, 20:33:18 CEST schrieb Conor Dooley:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> While "real" hardware might not use the compatible string "riscv,plic0"
> >> it is present in the driver & QEMU uses it for automatically generated
> >> virt machine dtbs. To avoid dt-validate problems with QEMU produced
> >> dtbs, such as the following, add it to the binding.
> >>
> >> riscv-virt.dtb: plic@c000000: compatible: 'oneOf' conditional failed, =
one must be fixed:
> >>         'sifive,plic-1.0.0' is not one of ['sifive,fu540-c000-plic', '=
starfive,jh7100-plic', 'canaan,k210-plic']
> >>         'sifive,plic-1.0.0' is not one of ['allwinner,sun20i-d1-plic']
> >>         'sifive,plic-1.0.0' was expected
> >>         'thead,c900-plic' was expected
> >> riscv-virt.dtb: plic@c000000: '#address-cells' is a required property
> >>
> >> Reported-by: Rob Herring <robh@kernel.org>
> >> Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-rob=
h@kernel.org/
> >> Reviewed-by: Rob Herring <robh@kernel.org>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >> ---
> >>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml     | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/interrupt-controller/si=
five,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controll=
er/sifive,plic-1.0.0.yaml
> >> index 92e0f8c3eff2..99e01f4d0a69 100644
> >> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,pl=
ic-1.0.0.yaml
> >> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,pl=
ic-1.0.0.yaml
> >> @@ -66,6 +66,11 @@ properties:
> >>            - enum:
> >>                - allwinner,sun20i-d1-plic
> >>            - const: thead,c900-plic
> >> +      - items:
> >> +          - const: sifive,plic-1.0.0
> >> +          - const: riscv,plic0
> >> +        deprecated: true
> >=20
> > hmm, when setting this to deprecated, does this mean qemu was changed
> > to not use that compatible anymore?
> >=20
> > I.e. reading deprecated I'd assume that this is kept around for old qem=
u builds?
>=20
> I did not make that change to QEMU. From v1 [0]:
>=20
> Rob:
> > Conor:
> >> In arm's virt.c they use the generic gic compatible & I don't see any
> >> evidence of other archs using "qemu,foo" bindings. I suppose there's
> >> always the option of just removing the "riscv,plic0" from the riscv's
> >> virt.c
> >
> > I think we're pretty much stuck with what's in use already.
>=20
> > I'm on the fence whether to mark it deprecated though if there is no=20
> > plan to 'fix' it. Doesn't really matter until the tools can selectively=
=20
> > remove deprecated properties from validation.
>=20
> My interpretation was "do not use this compatible in any new devicetrees".
>=20
> I don't really have any strong feelings here. Maybe the description is
> sufficient?

that makes sense then. Existing users can keep using it, but no-one should
create new usages of it, so this looks good then

Heiko



