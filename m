Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNxDM-0002of-TI
	for mharc-qemu-riscv@gnu.org; Tue, 16 Aug 2022 10:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oNxDL-0002mU-8I
 for qemu-riscv@nongnu.org; Tue, 16 Aug 2022 10:06:39 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:34682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1oNxDJ-0001Ox-Gr
 for qemu-riscv@nongnu.org; Tue, 16 Aug 2022 10:06:38 -0400
Received: by mail-ed1-x52e.google.com with SMTP id z2so13649737edc.1
 for <qemu-riscv@nongnu.org>; Tue, 16 Aug 2022 07:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=v67fLx2SsYmXkg1Fdi0JXC8gGND5NRH5uKTqVhwYSUI=;
 b=Ju5xuuLC9C+n6VMthS725e6wl8VEnc3vzrwV5dn6dZsgGzedXd3n7k4QoLTaCRMAgK
 LAm0VyCVErNs0kAwHwvlj3smae7Tnf2VXX/wwZr3Risbm+fhqNou7gL9DvATGXZ3OM2t
 ClZ6z3K3/0PhpCGWzexwOQ+gSEx9Qb/Z4PrhWtgnwN5GY7SakBbfsBSHLNEwfDtU2QEH
 SzImyJT5V9R2G+Eym8fIvC/Z7aK3auCUc99ook/6+uZqytYFf6uXmlZVz1W/Psl3au9g
 6erT4JI5IP00PNBlNMvY4gpOTtL/lNu9w25ISae95TsXgRoL2qtAxr+ZcQITXoukZ/lV
 UumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=v67fLx2SsYmXkg1Fdi0JXC8gGND5NRH5uKTqVhwYSUI=;
 b=eDoqc9xrBnE7oTk7w0B/0hctEzdKaMXCD3PUgKGbffKUflhhbk9lSYDpOvc+tVpeKu
 l/v6B2t9zBFvPZtbQytRl7suGV6j8z8t1uTlFtPe5AcaZ3uRJ9eEq+9PJpX2Sh5wE+Cr
 /9ReEnJXIJAaoUHR2o1tUQa9jDrNlhCvPGK3qRiLgCr9TQna7SdPCHRshKKaX4cZlh7C
 PNmRRP2iIITn2Qezl4tdFIMbJOC7FJ6S2L37XgQMcpYSkoL6b9of0p4jPck7AYuksnGw
 53Lzo6Cris0vtRYPuXgbAHzqIGmlhXqdZcKCfioV8KpQLbuj4nlFopAYAyT2/SmIVlTN
 Vc0g==
X-Gm-Message-State: ACgBeo2B0ubgVYqpdxemjJbXLE5NcQ3ukz9Ish9oR1IOJhAWudAHGYqW
 cadc8ayM4Ij+bgP/N1fs2gSpIg==
X-Google-Smtp-Source: AA6agR6r1l6Sr0C+9O74LK7tEXhHcKr5WkJuNVf5fov9/5YQxlPkY7/Fk0oRlGomhuTpkbuGdBedSQ==
X-Received: by 2002:a05:6402:1777:b0:43d:85da:2fac with SMTP id
 da23-20020a056402177700b0043d85da2facmr19125475edb.32.1660658795422; 
 Tue, 16 Aug 2022 07:06:35 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a1709062c0100b00730799724c3sm5450092ejh.149.2022.08.16.07.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 07:06:34 -0700 (PDT)
Date: Tue, 16 Aug 2022 16:06:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor.Dooley@microchip.com
Cc: jrtc27@jrtc27.com, palmer@dabbelt.com, robh@kernel.org,
 tglx@linutronix.de, maz@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, daniel.lezcano@linaro.org,
 anup@brainfault.org, guoren@kernel.org, sagar.kadam@sifive.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH 0/3] Fix dt-validate issues on qemu dtbdumps due to
 dt-bindings
Message-ID: <20220816140633.pkjws7n3qxsescjh@kamzik>
References: <20220805162844.1554247-1-mail@conchuod.ie>
 <YvGBYKZyW0B2/wSr@Jessicas-MacBook-Pro>
 <94fe7e46-6156-1cc5-a4dc-1eee78e99bc4@microchip.com>
 <20220809141436.GA1706120-robh@kernel.org>
 <61829ccd-20d7-e2f0-0a6b-bcd0e076b9ea@microchip.com>
 <1d94e18d-7f51-0619-95a9-6ca5fa7d9671@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d94e18d-7f51-0619-95a9-6ca5fa7d9671@microchip.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x52e.google.com
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
X-List-Received-Date: Tue, 16 Aug 2022 14:06:39 -0000

On Mon, Aug 15, 2022 at 07:18:02PM +0000, Conor.Dooley@microchip.com wrote:
> Any takers on trashing my regex? Otherwise I'll just submit
> a v2 with the regex and it can be shat on there instead :)
> 
> On 09/08/2022 19:36, Conor Dooley wrote:
> > On 09/08/2022 15:14, Rob Herring wrote:
> >> On Mon, Aug 08, 2022 at 10:01:11PM +0000, Conor.Dooley@microchip.com wrote:
> >>> On 08/08/2022 22:34, Jessica Clarke wrote:
> >>>> On Fri, Aug 05, 2022 at 05:28:42PM +0100, Conor Dooley wrote:
> >>>>> From: Conor Dooley <conor.dooley@microchip.com>
> >>>>> The final patch adds some new ISA strings
> >>>>> which needs scruitiny from someone with more knowledge about what ISA
> >>>>> extension strings should be reported in a dt than I have.
> >>>>
> >>>> Listing every possible ISA string supported by the Linux kernel really
> >>>> is not going to scale...
> >>
> >> How does the kernel scale? (No need to answer)
> >>
> >>> Yeah, totally correct there. Case for adding a regex I suppose, but I
> >>> am not sure how to go about handling the multi-letter extensions or
> >>> if parsing them is required from a binding compliance point of view.
> >>> Hoping for some input from Palmer really.
> >>
> >> Yeah, looks like a regex pattern is needed.
> > 
> > I started pottering away at this but I have arrived at:
> > rv64imaf?d?c?h?(_z[imafdqcbvkh]([a-z])*)*$

Don't forget the ^ at the start.

Do we need to worry about optional major and minor version numbers?
Or check that Z names have at least one character following the category
character? Actually, the first letter after Z being a category is only a
convention. Maybe we don't want to enforce that. What about X extensions?

Thanks,
drew

> > 
> > I suspect that before "h?" there should be more single letter
> > extensions added for completeness sake. So then it'd bloat out to:
> > rv64imaf?d?q?c?b?v?k?h?(_z[imafdqcbvkh]([a-z])*)*$
> > 
> > I checked a couple different "bad" isa strings against it and
> > nothing went up in flames but my regex skills are far from great
> > so I'm sure there's better ways to represent this.
> > 
> > Anyways, this pattern is based on my understanding that:
> > - the single letter order is fixed & we don't care about things that
> >   can't even do "ima"
> > - the multi letter extensions are all in a "_z<foo>" format where the
> >   first letter of <foo> is a valid single letter extension
> > - we don't care about the e extension from an OS PoV (this could be a
> >   very flawed take...)
> > - after the first two chars, the extension name could be an english
> >   word (ifencei anyone?) so it's not worth restricting the charset
> > - that attempting to validate the contents of the multiletter extensions
> >   with dt-validate beyond the formatting is a futile, massively verbose
> >   or unwieldy exercise at best
> > 
> > Some or all of those assumptions could be very very wrong so if {someone,
> > anyone} wants to correct me - feel ***more*** than free.. 
> > 
> > Thanks,
> > Conor.
> > 
> > patch would then look like:
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > index d632ac76532e..1e54e7746190 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -74,9 +74,7 @@ properties:
> >        insensitive, letters in the riscv,isa string must be all
> >        lowercase to simplify parsing.
> >      $ref: "/schemas/types.yaml#/definitions/string"
> > -    enum:
> > -      - rv64imac
> > -      - rv64imafdc
> > +    pattern: rv64imaf?d?q?c?b?v?k?h?(_z[imafdqcbvkh]([a-z])*)*$
> >  
> >    # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
> >    timebase-frequency: false
> 

