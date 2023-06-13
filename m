Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D971EEB64D9
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 14:12:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q94l0-0001H5-Ln; Tue, 13 Jun 2023 10:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1q94kz-0001Go-0o
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 10:12:25 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Conor.Dooley@microchip.com>)
 id 1q94kw-0002lp-VE
 for qemu-riscv@nongnu.org; Tue, 13 Jun 2023 10:12:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1686665543; x=1718201543;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hfxBhUgx7NXJ6JdXeA8drLUkBlBlA9y7CgQi6V3xvlI=;
 b=j+GFd3QGHenwfAsZ2RLUXggvA37+5BFAgfvE978TJchlx8bdEtDEr6k3
 AYukK+9mKsNyNoGQVoe8PzBxbgBg0bL+7A8QtCyCT786akivwKzaMwxes
 jbOBWbFdzkW9+pvNZrE0efIFjla/2LhCUxaFh/j6wMS3he9j1qbo6b5O2
 bnm9HZbPF5mMW7KFH3p0Vs0r2ionTcwXiBa2v7UmDi14q9ftOyrQ4BL4o
 UXFnx8/8Ai3R3fmSlFPIzggHCfbV6Z3xA2ey//5J88lraRdvkmbPPhLAT
 36yk3SqDks5/WoqmFbfkhfkdQBnhFM6CcqjPCnvDixxYoWrTKENVqpgK8 Q==;
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
 d="asc'?scan'208";a="218264434"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Jun 2023 07:12:17 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 13 Jun 2023 07:12:16 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 13 Jun 2023 07:12:13 -0700
Date: Tue, 13 Jun 2023 15:11:47 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh@kernel.org>
CC: Conor Dooley <conor@kernel.org>, Sean Anderson <sean.anderson@seco.com>,
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>,
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Alistair Francis
 <alistair.francis@wdc.com>, Anup Patel <apatel@ventanamicro.com>, Atish Patra
 <atishp@atishpatra.org>, Jessica Clarke <jrtc27@jrtc27.com>, Rick Chen
 <rick@andestech.com>, Leo <ycliang@andestech.com>,
 <linux-riscv@lists.infradead.org>, <qemu-riscv@nongnu.org>,
 <u-boot@lists.denx.de>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] dt-bindings: riscv: deprecate riscv,isa
Message-ID: <20230613-outbound-exchange-cf48ad61d31c@wendy>
References: <20230518-4050231ca8dbe93c08cf9c9a@orel>
 <CAAhSdy07Mg_JBF+4ucGFiWdBKh-Ass5G_aUWqBqTnDSFp7S=0A@mail.gmail.com>
 <20230518-hammock-doornail-478e8ea8e6a7@wendy>
 <f7c20090-220c-2805-86ba-b174a89f65b3@seco.com>
 <20230518-monkhood-dispersal-6749b1228b0d@spud>
 <20230530-duller-reset-a34ae111f207@wendy>
 <20230608191537.GA3233857-robh@kernel.org>
 <20230608-cobbler-giving-e0fac2185e11@spud>
 <20230612-relic-fetal-1beeae3455aa@spud>
 <CAL_Jsq+CJ-mEcEujd5Sk4SLvgTfUX1A7NRXYcMDqkoViDYxTXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="X3sgJjRgCn4CtUIw"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+CJ-mEcEujd5Sk4SLvgTfUX1A7NRXYcMDqkoViDYxTXw@mail.gmail.com>
Received-SPF: pass client-ip=68.232.153.233;
 envelope-from=Conor.Dooley@microchip.com; helo=esa.microchip.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--X3sgJjRgCn4CtUIw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 07:28:34AM -0600, Rob Herring wrote:
> On Mon, Jun 12, 2023 at 3:23=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> > On Thu, Jun 08, 2023 at 08:30:28PM +0100, Conor Dooley wrote:
> > > On Thu, Jun 08, 2023 at 01:15:37PM -0600, Rob Herring wrote:
> > > > On Tue, May 30, 2023 at 03:12:12PM +0100, Conor Dooley wrote:
> > > > > On Thu, May 18, 2023 at 10:42:34PM +0100, Conor Dooley wrote:
> > > > > > On Thu, May 18, 2023 at 02:30:53PM -0400, Sean Anderson wrote:
> > > > >
> > > > > > >
> > > > > > > Why not just have something like
> > > > > > >
> > > > > > > mycpu {
> > > > > > >       ...
> > > > > > >       riscv,isa {
> > > > > > >               i;
> > > > > > >               m;
> > > > > > >               a;
> > > > > > >               zicsr;
> > > > > > >               ...
> > > >
> > > > I prefer property names be globally unique. The tools are geared to=
wards
> > > > that too. That's largely a symptom of having 0 type information in =
the
> > > > DT.
> > > >
> > > > For example if you had an extension called 'reg', it would be a pro=
blem.
> > >
> > > Per the current ISA rules, that'd not be valid. But then again, I do
> > > have trust issues & it's not like "reg" is the only property name in =
DT
> > > land.
> >
> > ...you say "prefer" here. Is that a NAK, or a "you keep the pieces"?
>=20
> Don't do the above node.

Yeah, that's more helpful wording than "prefer" for sure!

If that's a no-go & so are the booleans prefixed with "riscv,whatever-",
since people have size concerns, I guess that leaves your string
suggestion (there is a helper in Linux at least, haven't checked
elsewhere yet).

I guess that means something like:

  riscv,isa-extensions:
    $ref: /schemas/types.yaml#/definitions/string-array
    minItems: 1
    description: Extensions supported by the hart.
    items:
      anyOf:
        - const: i
          description: foo
        - const: m
          description: foo
        - const: a
          description: foo
        - const: f
          description: foo
        - const: d
          description: foo
        - const: c
          description: foo
        - const: zifencei
          description: foo
        - etc

Obviously with "foo" replaced by the existing descriptions in this
patch.


--X3sgJjRgCn4CtUIw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIh5IwAKCRB4tDGHoIJi
0qHeAP4vJ0QRi7YJAoUUY9FMywRtOb4MKioKJLodiR5tQ3sA3gEA/oOKmdPiwKIP
32NtYdVYP78YjeI+omupwDOZZfgQEQw=
=td6r
-----END PGP SIGNATURE-----

--X3sgJjRgCn4CtUIw--

