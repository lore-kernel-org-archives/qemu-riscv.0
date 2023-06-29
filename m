Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F2BBEB64DA
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 03:20:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEiCB-000776-B6; Wed, 28 Jun 2023 23:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1qEiC9-00076p-KX
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 23:19:45 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1qEiC5-0000VB-Dk
 for qemu-riscv@nongnu.org; Wed, 28 Jun 2023 23:19:45 -0400
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-76731802203so21215885a.3
 for <qemu-riscv@nongnu.org>; Wed, 28 Jun 2023 20:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1688008779; x=1690600779; 
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=RUjrmYIg+rFQ11kFwChT2fwd24OW4R7UXoZbbaDs/9E=;
 b=PCROkMgf7WqTsatZs+sUP0R66/egf7iex3IHnX9dOR/31BoGNzMX3raME2aWLu1zAo
 hizrzNFLeKDNsENWyp5dKhrM8WMiyZC6trr6YRlmJz1YOpANwYXqTvt3hYrT8LyISvDK
 sRl/5MixnHOI/ggooInvQNPpJogDc6npJrTicgSLBigNEZwLuOWxIGEmUJXkoWSwGqZ2
 bwh8jKfTHlOwfZ03U29OO2yBIgEmG5cbqCIeBANKGmZA8TId8xCj0J1ymQDQlp/8u9TV
 QcK3t/yddfkyuTzDoISvsSFhgjaYcjGdGV3z+4dL2FZIzOjqYZDRMuOzVT1LsHTXrHoy
 UKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688008779; x=1690600779;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RUjrmYIg+rFQ11kFwChT2fwd24OW4R7UXoZbbaDs/9E=;
 b=akzEu3kReKaDMWQ9w2NeyMEzJ/y6GIRHnYfh8JsuxhbOHEPbJKj9m4QDaWnLX5mTsd
 hLkyaUmtfrZSxAE/cJNjzLluR6IwLik5OMTSj8QVH7Mc9q2HF7qp/nvPaprKjGoVkER1
 B6Wu1YFpfZWgLh8zou/ojT9WKxNYqXOYpQzu63qEnsG0ZCXHVLmU1RZuy/m5vIQ42bp5
 HgN/M0o2cP7v/ATcCGZI/DjLhdFmKbvpG9iB3+Ptz6jxGH/IFoO5fFX1lyj70OEbeIAg
 +4HAVt0ju4jHq4z7fq/fpGwfA8LAXe89zT+47C4iDU6kjxqYcE2bZA70oJ6pLbS273/Q
 Y3aw==
X-Gm-Message-State: AC+VfDyzNynQB7eIyjj9zBZ9QizopUtMlFTAdzjd9LqCVMxHmLGZ798s
 dkHbNSnA/fZqhzDqSQmTNWqGlQ==
X-Google-Smtp-Source: ACHHUZ5/Y7FsTkixAFTlW1/HDwO36U0EYdMedWBF7u35/igNrfuLayUiO9PAHTTQ53MUr43UY0dzRw==
X-Received: by 2002:a05:620a:45a7:b0:766:fd9a:56c8 with SMTP id
 bp39-20020a05620a45a700b00766fd9a56c8mr8882757qkb.53.1688008779455; 
 Wed, 28 Jun 2023 20:19:39 -0700 (PDT)
Received: from localhost ([135.180.227.0]) by smtp.gmail.com with ESMTPSA id
 s18-20020a17090a881200b0024e05b7ba8bsm8475136pjn.25.2023.06.28.20.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 20:19:38 -0700 (PDT)
Date: Wed, 28 Jun 2023 20:19:38 -0700 (PDT)
X-Google-Original-Date: Wed, 28 Jun 2023 20:18:39 PDT (-0700)
Subject: Re: [PATCH v3] dt-bindings: riscv: deprecate riscv,isa
In-Reply-To: <CAK9=C2Vy-4V9kgnga98tiC3TeHkR2LFPakyBbS8s_h3_Z=ieyQ@mail.gmail.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, ajones@ventanamicro.com,
 atishp@atishpatra.org, jrtc27@jrtc27.com, 
 rick@andestech.com, ycliang@andestech.com, oleksii.kurochko@gmail.com,
 linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org, u-boot@lists.denx.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: apatel@ventanamicro.com
Message-ID: <mhng-092e2e51-5856-41be-b5a5-919694d8da03@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=palmer@dabbelt.com; helo=mail-qk1-x729.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 28 Jun 2023 08:31:32 PDT (-0700), apatel@ventanamicro.com wrote:
> On Wed, Jun 28, 2023 at 7:46 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Tue, 27 Jun 2023 08:49:06 PDT (-0700), Palmer Dabbelt wrote:
>> > On Mon, 26 Jun 2023 23:52:06 PDT (-0700), apatel@ventanamicro.com wrote:
>> >> On Tue, Jun 27, 2023 at 1:23 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>> >>>
>> >>> On Mon, 26 Jun 2023 10:38:43 PDT (-0700), apatel@ventanamicro.com wrote:
>> >>> > On Mon, Jun 26, 2023 at 3:42 PM Conor Dooley <conor.dooley@microchip.com> wrote:
>> >>> >>
>> >>> >> intro
>> >>> >> =====
>> >>> >>
>> >>> >> When the RISC-V dt-bindings were accepted upstream in Linux, the base
>> >>> >> ISA etc had yet to be ratified. By the ratification of the base ISA,
>> >>> >> incompatible changes had snuck into the specifications - for example the
>> >>> >> Zicsr and Zifencei extensions were spun out of the base ISA.
>> >>> >>
>> >>> >> Fast forward to today, and the reason for this patch.
>> >>> >> Currently the riscv,isa dt property permits only a specific subset of
>> >>> >> the ISA string - in particular it excludes version numbering.
>> >>> >> With the current constraints, it is not possible to discern whether
>> >>> >> "rv64i" means that the hart supports the fence.i instruction, for
>> >>> >> example.
>> >>> >> Future systems may choose to implement their own instruction fencing,
>> >>> >> perhaps using a vendor extension, or they may not implement the optional
>> >>> >> counter extensions. Software needs a way to determine this.
>> >>> >>
>> >>> >> versioning schemes
>> >>> >> ==================
>> >>> >>
>> >>> >> "Use the extension versions that are described in the ISA manual" you
>> >>> >> may say, and it's not like this has not been considered.
>> >>> >> Firstly, software that parses the riscv,isa property at runtime will
>> >>> >> need to contain a lookup table of some sort that maps arbitrary versions
>> >>> >> to versions it understands. There is not a consistent application of
>> >>> >> version number applied to extensions, with a higgledy-piggledy
>> >>> >> collection of tags, "bare" and versioned documents awaiting the reader
>> >>> >> on the "recently ratified extensions" page:
>> >>> >> https://wiki.riscv.org/display/HOME/Recently+Ratified+Extensions
>> >>> >>
>> >>> >>         As an aside, and this is reflected in the patch too, since many
>> >>> >>         extensions have yet to appear in a release of the ISA specs,
>> >>> >>         they are defined by commits in their respective "working draft"
>> >>> >>         repositories.
>> >>> >>
>> >>> >> Secondly, there is an issue of backwards compatibility, whereby allowing
>> >>> >> numbers in the ISA string, some parsers may be broken. This would
>> >>> >> require an additional property to be created to even use the versions in
>> >>> >> this manner.
>> >>> >>
>> >>> >> ~boolean properties~ string array property
>> >>> >> ==========================================
>> >>> >>
>> >>> >> If a new property is needed, the whole approach may as well be looked at
>> >>> >> from the bottom up. A string with limited character choices etc is
>> >>> >> hardly the best approach for communicating extension information to
>> >>> >> software.
>> >>> >>
>> >>> >> Switching to using properties that are defined on a per extension basis,
>> >>> >> allows us to define explicit meanings for the DT representation of each
>> >>> >> extension - rather than the current situation where different operating
>> >>> >> systems or other bits of software may impart different meanings to
>> >>> >> characters in the string.
>> >>> >> Clearly the best source of meanings is the specifications themselves,
>> >>> >> this just provides us the ability to choose at what point in time the
>> >>> >> meaning is set. If an extension changes incompatibility in the future,
>> >>> >> a new property will be required.
>> >>> >>
>> >>> >> Off-list, some of the RVI folks have committed to shoring up the wording
>> >>> >> in either the ISA specifications, the riscv-isa-manual or
>> >>> >> so that in the future, modifications to and additions or removals of
>> >>> >> features will require a new extension. Codifying that assertion
>> >>> >> somewhere would make it quite unlikely that compatibility would be
>> >>> >> broken, but we have the tools required to deal with it, if & when it
>> >>> >> crops up.
>> >>> >> It is in our collective interest, as consumers of extension meanings, to
>> >>> >> define a scheme that enforces compatibility.
>> >>> >>
>> >>> >> The use of individual properties, rather than elements in a single
>> >>> >> string, will also permit validation that the properties have a meaning,
>> >>> >> as well as potentially reject mutually exclusive combinations, or
>> >>> >> enforce dependencies between extensions. That would not have be possible
>> >>> >> with the current dt-schema infrastructure for arbitrary strings, as we
>> >>> >> would need to add a riscv,isa parser to dt-validate!
>> >>> >> That's not implemented in this patch, but rather left as future work (for
>> >>> >> the brave, or the foolish).
>> >>> >>
>> >>> >> acpi
>> >>> >> ====
>> >>> >>
>> >>> >> The current ACPI ECR is based on having a single ISA string unfortunately,
>> >>> >> but ideally ACPI will move to another method, perhaps GUIDs, that give
>> >>> >> explicit meaning to extensions.
>> >>> >
>> >>> > Drop this paragraph on ACPI.
>> >>> >
>> >>> > We clearly mentioned previously that ACPI will follow specs defined by RVI.
>> >>> > There are scalability issues in using GUIDs for each ISA extension.
>> >>>
>> >>> Which spec are we following for the ACPI ISA string?
>> >>
>> >> ACPI RHCT follows the "ISA Extension Naming Conventions"
>> >> defined by the RISC-V unpriv spec. I understand that there are
>> >> unresolved issues in the "ISA Extension Naming Conventions"
>> >> which should be addressed by RVI and we should also try our
>> >> best to have this fixed in the spec.
>> >
>> > Which version of the spec?  We've had a ton of issues related to
>> > versioning everywhere else the ISA string has been used, we need to know
>> > specifically which version we're parsing in order to do anything
>> > meaningful with it.
>>
>> Anup: Can you please provide a pointer to the spec this is supposed to
>> implement?  I don't want to end up in the same spot again where we're
>> presuming some spec changes, we've got to support whatever we merge no
>> matter what happens on the spec side.
>>
>> In theory I'm on vacation today, but I'll try and look at the thread
>> again tonight when I get back.
>
> It is the "Chapter 29. ISA Extension Naming Conventions" of the
> RISC-V unpriv specification.
> (https://github.com/riscv/riscv-isa-manual/releases/download/riscv-isa-release-1239329-2023-05-23/unpriv-isa-asciidoc.pdf)
>
> The RISC-V unpriv specification is only a collection of extensions
> hence it does not have its own version.

There's a version right on the front page, it says "Version ASCIIDOC 
Conversion, 12/2022".  There's a few with that version, but versioning 
is pretty broken in RISC-V land so we've mostly just started running 
with the commits/tags.

It also says it's a pre release version, but if that's what ACPI is 
using then I'm fine with it -- the key is that whatever we're supporting 
we're stuck with, as we have to maintain compatibility here.

> We should work with RVI to address the concerns/clarifications
> that we need in "Chapter 29. ISA Extension Naming Conventions".
>
> We can also create GitHub issues for unpriv spec if that helps.

The nice thing about starting with a new interface is that there's 
nothing to be compatible with, so there's no issues.  Given what a mess 
ISA strings have been everywhere else I'm sure we'll have some, but 
that's problem for later.

I couldn't find anywhere else this was written down, so I started an 
ACPI doc -- as usual maybe a bit odd for just the one thing, but we 
usually end up with more.

https://lore.kernel.org/r/20230629031705.15575-1-palmer@rivosinc.com/


> Regards,
> Anup
>
>>
>> >> In any case, ACPI spec is owned by UEFI forum so it does
>> >> not make sense to define/recommend anything for ACPI in
>> >> DT bindings.
>> >
>> > Unless I missed something this is just a long commit message, it's not
>> > even in the docs.  If you don't want the DT side to even mention ACPI
>> > that's fine with me, though, I don't really care.
>> >
>> >>
>> >> Regards,
>> >> Anup
>> >>
>> >>
>> >>
>> >>>
>> >>> > Regards,
>> >>> > Anup
>> >>> >
>> >>> >>
>> >>> >> parser simplicity
>> >>> >> =================
>> >>> >>
>> >>> >> Many systems that parse DT at runtime already implement an function that
>> >>> >> can check for the presence of a string in an array of string, as it is
>> >>> >> similar to the process for parsing a list of compatible strings, so a
>> >>> >> bunch of new, custom, DT parsing should not be needed.
>> >>> >> Getting rid of "riscv,isa" parsing would be a nice simplification, but
>> >>> >> unfortunately for backwards compatibility with old dtbs, existing
>> >>> >> parsers may not be removable - which may greatly simplify
>> >>> >> dt parsing code. In Linux, for example, checking for whether a hart
>> >>> >> supports an extension becomes as simple as:
>> >>> >>         of_property_match_string(node, "riscv,isa-extensions", "zicbom")
>> >>> >>
>> >>> >> vendor extensions
>> >>> >> =================
>> >>> >>
>> >>> >> Compared to riscv,isa, this proposed scheme promotes vendor extensions,
>> >>> >> oft touted as the strength of RISC-V, to first-class citizens.
>> >>> >> At present, extensions are defined as meaning what the RISC-V ISA
>> >>> >> specifications say they do. There is no realistic way of using that
>> >>> >> interface to provide cross-platform definitions for what vendor
>> >>> >> extensions mean. Vendor extensions may also have even less consistency
>> >>> >> than RVI do in terms of versioning, or no care about backwards
>> >>> >> compatibility.
>> >>> >> The new property allows us to assign explicit meanings on a per vendor
>> >>> >> extension basis, backed up by a description of their meanings.
>> >>> >>
>> >>> >> fin
>> >>> >> ===
>> >>> >>
>> >>> >> Create a new file to store the extension meanings and a new
>> >>> >> riscv,isa-base property to replace the aspect of riscv,isa that is
>> >>> >> not represented by the new property - the base ISA implemented by a hart.
>> >>> >>
>> >>> >> As a starting point, add properties for extensions currently used in
>> >>> >> Linux.
>> >>> >>
>> >>> >> Finally, mark riscv,isa as deprecated, as removing support for it in
>> >>> >> existing programs would be an ABI break.
>> >>> >>
>> >>> >> CC: Palmer Dabbelt <palmer@dabbelt.com>
>> >>> >> CC: Paul Walmsley <paul.walmsley@sifive.com>
>> >>> >> CC: Rob Herring <robh+dt@kernel.org>
>> >>> >> CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>> >>> >> CC: Alistair Francis <alistair.francis@wdc.com>
>> >>> >> CC: Andrew Jones <ajones@ventanamicro.com>
>> >>> >> CC: Anup Patel <apatel@ventanamicro.com>
>> >>> >> CC: Atish Patra <atishp@atishpatra.org>
>> >>> >> CC: Jessica Clarke <jrtc27@jrtc27.com>
>> >>> >> CC: Rick Chen <rick@andestech.com>
>> >>> >> CC: Leo <ycliang@andestech.com>
>> >>> >> CC: Oleksii <oleksii.kurochko@gmail.com>
>> >>> >> CC: linux-riscv@lists.infradead.org
>> >>> >> CC: qemu-riscv@nongnu.org
>> >>> >> CC: u-boot@lists.denx.de
>> >>> >> CC: devicetree@vger.kernel.org
>> >>> >> CC: linux-kernel@vger.kernel.org
>> >>> >> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
>> >>> >> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>> >>> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> >>> >> ---
>> >>> >> Changes in v3:
>> >>> >> - Per Rob's suggestion, switch to an array of strings. Cuts down on the
>> >>> >>   size, compared to booleans. It has a standard mechanism for parsing
>> >>> >>   (you need to parse arrays of strings for compatibles). It still allows
>> >>> >>   for having a limited set of explicitly defined properties - so the
>> >>> >>   advantages over a free-form string still apply.
>> >>> >> - Pick up Palmer's Ack and Review (although I expect that he will be the
>> >>> >>   one to apply this).
>> >>> >> ---
>> >>> >>  .../devicetree/bindings/riscv/cpus.yaml       |  43 ++-
>> >>> >>  .../devicetree/bindings/riscv/extensions.yaml | 245 ++++++++++++++++++
>> >>> >>  2 files changed, 265 insertions(+), 23 deletions(-)
>> >>> >>  create mode 100644 Documentation/devicetree/bindings/riscv/extensions.yaml
>> >>> >>
>> >>> >> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
>> >>> >> index 67bd239ead0b..74bc92591086 100644
>> >>> >> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
>> >>> >> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
>> >>> >> @@ -25,6 +25,7 @@ description: |
>> >>> >>
>> >>> >>  allOf:
>> >>> >>    - $ref: /schemas/cpu.yaml#
>> >>> >> +  - $ref: extensions.yaml
>> >>> >>
>> >>> >>  properties:
>> >>> >>    compatible:
>> >>> >> @@ -82,25 +83,6 @@ properties:
>> >>> >>      description:
>> >>> >>        The blocksize in bytes for the Zicboz cache operations.
>> >>> >>
>> >>> >> -  riscv,isa:
>> >>> >> -    description:
>> >>> >> -      Identifies the specific RISC-V instruction set architecture
>> >>> >> -      supported by the hart.  These are documented in the RISC-V
>> >>> >> -      User-Level ISA document, available from
>> >>> >> -      https://riscv.org/specifications/
>> >>> >> -
>> >>> >> -      Due to revisions of the ISA specification, some deviations
>> >>> >> -      have arisen over time.
>> >>> >> -      Notably, riscv,isa was defined prior to the creation of the
>> >>> >> -      Zicntr, Zicsr, Zifencei and Zihpm extensions and thus "i"
>> >>> >> -      implies "zicntr_zicsr_zifencei_zihpm".
>> >>> >> -
>> >>> >> -      While the isa strings in ISA specification are case
>> >>> >> -      insensitive, letters in the riscv,isa string must be all
>> >>> >> -      lowercase.
>> >>> >> -    $ref: /schemas/types.yaml#/definitions/string
>> >>> >> -    pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
>> >>> >> -
>> >>> >>    # RISC-V has multiple properties for cache op block sizes as the sizes
>> >>> >>    # differ between individual CBO extensions
>> >>> >>    cache-op-block-size: false
>> >>> >> @@ -139,8 +121,17 @@ properties:
>> >>> >>        DMIPS/MHz, relative to highest capacity-dmips-mhz
>> >>> >>        in the system.
>> >>> >>
>> >>> >> +oneOf:
>> >>> >> +  - required:
>> >>> >> +      - riscv,isa
>> >>> >> +  - required:
>> >>> >> +      - riscv,isa-base
>> >>> >> +
>> >>> >> +dependencies:
>> >>> >> +  riscv,isa-base: [ "riscv,isa-extensions" ]
>> >>> >> +  riscv,isa-extensions: [ "riscv,isa-base" ]
>> >>> >> +
>> >>> >>  required:
>> >>> >> -  - riscv,isa
>> >>> >>    - interrupt-controller
>> >>> >>
>> >>> >>  unevaluatedProperties: false
>> >>> >> @@ -160,7 +151,9 @@ examples:
>> >>> >>                  i-cache-sets = <128>;
>> >>> >>                  i-cache-size = <16384>;
>> >>> >>                  reg = <0>;
>> >>> >> -                riscv,isa = "rv64imac";
>> >>> >> +                riscv,isa-base = "rv64i";
>> >>> >> +                riscv,isa-extensions = "i", "m", "a", "c";
>> >>> >> +
>> >>> >>                  cpu_intc0: interrupt-controller {
>> >>> >>                          #interrupt-cells = <1>;
>> >>> >>                          compatible = "riscv,cpu-intc";
>> >>> >> @@ -183,8 +176,10 @@ examples:
>> >>> >>                  i-tlb-size = <32>;
>> >>> >>                  mmu-type = "riscv,sv39";
>> >>> >>                  reg = <1>;
>> >>> >> -                riscv,isa = "rv64imafdc";
>> >>> >>                  tlb-split;
>> >>> >> +                riscv,isa-base = "rv64i";
>> >>> >> +                riscv,isa-extensions = "i", "m", "a", "f", "d", "c";
>> >>> >> +
>> >>> >>                  cpu_intc1: interrupt-controller {
>> >>> >>                          #interrupt-cells = <1>;
>> >>> >>                          compatible = "riscv,cpu-intc";
>> >>> >> @@ -202,8 +197,10 @@ examples:
>> >>> >>                  device_type = "cpu";
>> >>> >>                  reg = <0>;
>> >>> >>                  compatible = "riscv";
>> >>> >> -                riscv,isa = "rv64imafdc";
>> >>> >>                  mmu-type = "riscv,sv48";
>> >>> >> +                riscv,isa-base = "rv64i";
>> >>> >> +                riscv,isa-extensions = "i", "m", "a", "f", "d", "c";
>> >>> >> +
>> >>> >>                  interrupt-controller {
>> >>> >>                          #interrupt-cells = <1>;
>> >>> >>                          interrupt-controller;
>> >>> >> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
>> >>> >> new file mode 100644
>> >>> >> index 000000000000..af98307f2c2c
>> >>> >> --- /dev/null
>> >>> >> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
>> >>> >> @@ -0,0 +1,245 @@
>> >>> >> +# SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> >>> >> +%YAML 1.2
>> >>> >> +---
>> >>> >> +$id: http://devicetree.org/schemas/riscv/extensions.yaml#
>> >>> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> >>> >> +
>> >>> >> +title: RISC-V ISA extensions
>> >>> >> +
>> >>> >> +maintainers:
>> >>> >> +  - Paul Walmsley <paul.walmsley@sifive.com>
>> >>> >> +  - Palmer Dabbelt <palmer@sifive.com>
>> >>> >> +  - Conor Dooley <conor@kernel.org>
>> >>> >> +
>> >>> >> +description: |
>> >>> >> +  RISC-V has a large number of extensions, some of which are "standard"
>> >>> >> +  extensions, meaning they are ratified by RISC-V International, and others
>> >>> >> +  are "vendor" extensions.
>> >>> >> +  This document defines properties that indicate whether a hart supports a
>> >>> >> +  given extension.
>> >>> >> +
>> >>> >> +  Once a standard extension has been ratified, no changes in behaviour can be
>> >>> >> +  made without the creation of a new extension.
>> >>> >> +  The properties for standard extensions therefore map to their originally
>> >>> >> +  ratified states, with the exception of the I, Zicntr & Zihpm extensions.
>> >>> >> +  See the "i" property for more information.
>> >>> >> +
>> >>> >> +select:
>> >>> >> +  properties:
>> >>> >> +    compatible:
>> >>> >> +      contains:
>> >>> >> +        const: riscv
>> >>> >> +
>> >>> >> +properties:
>> >>> >> +  riscv,isa:
>> >>> >> +    description:
>> >>> >> +      Identifies the specific RISC-V instruction set architecture
>> >>> >> +      supported by the hart.  These are documented in the RISC-V
>> >>> >> +      User-Level ISA document, available from
>> >>> >> +      https://riscv.org/specifications/
>> >>> >> +
>> >>> >> +      Due to revisions of the ISA specification, some deviations
>> >>> >> +      have arisen over time.
>> >>> >> +      Notably, riscv,isa was defined prior to the creation of the
>> >>> >> +      Zicntr, Zicsr, Zifencei and Zihpm extensions and thus "i"
>> >>> >> +      implies "zicntr_zicsr_zifencei_zihpm".
>> >>> >> +
>> >>> >> +      While the isa strings in ISA specification are case
>> >>> >> +      insensitive, letters in the riscv,isa string must be all
>> >>> >> +      lowercase.
>> >>> >> +    $ref: /schemas/types.yaml#/definitions/string
>> >>> >> +    pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
>> >>> >> +    deprecated: true
>> >>> >> +
>> >>> >> +  riscv,isa-base:
>> >>> >> +    description:
>> >>> >> +      The base ISA implemented by this hart, as described by the 20191213
>> >>> >> +      version of the unprivileged ISA specification.
>> >>> >> +    enum:
>> >>> >> +      - rv32i
>> >>> >> +      - rv64i
>> >>> >> +
>> >>> >> +  riscv,isa-extensions:
>> >>> >> +    $ref: /schemas/types.yaml#/definitions/string-array
>> >>> >> +    minItems: 1
>> >>> >> +    description: Extensions supported by the hart.
>> >>> >> +    items:
>> >>> >> +      anyOf:
>> >>> >> +        # single letter extensions, in canonical order
>> >>> >> +        - const: i
>> >>> >> +          description: |
>> >>> >> +            The base integer instruction set, as ratified in the 20191213
>> >>> >> +            version of the unprivileged ISA specification, with the exception of
>> >>> >> +            counter access.
>> >>> >> +            Counter access was removed after the ratification of the 20191213
>> >>> >> +            version of the unprivileged specification and shunted into the
>> >>> >> +            Zicntr and Zihpm extensions.
>> >>> >> +
>> >>> >> +        - const: m
>> >>> >> +          description:
>> >>> >> +            The standard M extension for integer multiplication and division, as
>> >>> >> +            ratified in the 20191213 version of the unprivileged ISA
>> >>> >> +            specification.
>> >>> >> +
>> >>> >> +        - const: a
>> >>> >> +          description:
>> >>> >> +            The standard A extension for atomic instructions, as ratified in the
>> >>> >> +            20191213 version of the unprivileged ISA specification.
>> >>> >> +
>> >>> >> +        - const: f
>> >>> >> +          description:
>> >>> >> +            The standard F extension for single-precision floating point, as
>> >>> >> +            ratified in the 20191213 version of the unprivileged ISA
>> >>> >> +            specification.
>> >>> >> +
>> >>> >> +        - const: d
>> >>> >> +          description:
>> >>> >> +            The standard D extension for double-precision floating-point, as
>> >>> >> +            ratified in the 20191213 version of the unprivileged ISA
>> >>> >> +            specification.
>> >>> >> +
>> >>> >> +        - const: q
>> >>> >> +          description:
>> >>> >> +            The standard Q extension for quad-precision floating-point, as
>> >>> >> +            ratified in the 20191213 version of the unprivileged ISA
>> >>> >> +            specification.
>> >>> >> +
>> >>> >> +        - const: c
>> >>> >> +          description:
>> >>> >> +            The standard C extension for compressed instructions, as ratified in
>> >>> >> +            the 20191213 version of the unprivileged ISA specification.
>> >>> >> +
>> >>> >> +        - const: v
>> >>> >> +          description:
>> >>> >> +            The standard V extension for vector operations, as ratified
>> >>> >> +            in-and-around commit 7a6c8ae ("Fix text that describes vfmv.v.f
>> >>> >> +            encoding") of the riscv-v-spec.
>> >>> >> +
>> >>> >> +        - const: h
>> >>> >> +          description:
>> >>> >> +            The standard H extension for hypervisors as ratified in the 20191213
>> >>> >> +            version of the privileged ISA specification.
>> >>> >> +
>> >>> >> +        # multi-letter extensions, sorted alphanumerically
>> >>> >> +        - const: smaia
>> >>> >> +          description: |
>> >>> >> +            The standard Smaia supervisor-level extension for the advanced
>> >>> >> +            interrupt architecture for machine-mode-visible csr and behavioural
>> >>> >> +            changes to interrupts as frozen at commit ccbddab ("Merge pull
>> >>> >> +            request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
>> >>> >> +
>> >>> >> +        - const: ssaia
>> >>> >> +          description: |
>> >>> >> +            The standard Ssaia supervisor-level extension for the advanced
>> >>> >> +            interrupt architecture for supervisor-mode-visible csr and
>> >>> >> +            behavioural changes to interrupts as frozen at commit ccbddab
>> >>> >> +            ("Merge pull request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
>> >>> >> +
>> >>> >> +        - const: sscofpmf
>> >>> >> +          description: |
>> >>> >> +            The standard Sscofpmf supervisor-level extension for count overflow
>> >>> >> +            and mode-based filtering as ratified at commit 01d1df0 ("Add ability
>> >>> >> +            to manually trigger workflow. (#2)") of riscv-count-overflow.
>> >>> >> +
>> >>> >> +        - const: sstc
>> >>> >> +          description: |
>> >>> >> +            The standard Sstc supervisor-level extension for time compare as
>> >>> >> +            ratified at commit 3f9ed34 ("Add ability to manually trigger
>> >>> >> +            workflow. (#2)") of riscv-time-compare.
>> >>> >> +
>> >>> >> +        - const: svinval
>> >>> >> +          description:
>> >>> >> +            The standard Svinval supervisor-level extension for fine-grained
>> >>> >> +            address-translation cache invalidation as ratified in the 20191213
>> >>> >> +            version of the privileged ISA specification.
>> >>> >> +
>> >>> >> +        - const: svnapot
>> >>> >> +          description:
>> >>> >> +            The standard Svnapot supervisor-level extensions for napot
>> >>> >> +            translation contiguity as ratified in the 20191213 version of the
>> >>> >> +            privileged ISA specification.
>> >>> >> +
>> >>> >> +        - const: svpbmt
>> >>> >> +          description:
>> >>> >> +            The standard Svpbmt supervisor-level extensions for page-based
>> >>> >> +            memory types as ratified in the 20191213 version of the privileged
>> >>> >> +            ISA specification.
>> >>> >> +
>> >>> >> +        - const: zba
>> >>> >> +          description: |
>> >>> >> +            The standard Zba bit-manipulation extension for address generation
>> >>> >> +            acceleration instructions as ratified at commit 6d33919 ("Merge pull
>> >>> >> +            request #158 from hirooih/clmul-fix-loop-end-condition") of
>> >>> >> +            riscv-bitmanip.
>> >>> >> +
>> >>> >> +        - const: zbb
>> >>> >> +          description: |
>> >>> >> +            The standard Zbb bit-manipulation extension for basic bit-manipulation
>> >>> >> +            as ratified at commit 6d33919 ("Merge pull request #158 from
>> >>> >> +            hirooih/clmul-fix-loop-end-condition") of riscv-bitmanip.
>> >>> >> +
>> >>> >> +        - const: zbc
>> >>> >> +          description: |
>> >>> >> +            The standard Zbc bit-manipulation extension for carry-less
>> >>> >> +            multiplication as ratified at commit 6d33919 ("Merge pull request
>> >>> >> +            #158 from hirooih/clmul-fix-loop-end-condition") of riscv-bitmanip.
>> >>> >> +
>> >>> >> +        - const: zbs
>> >>> >> +          description: |
>> >>> >> +            The standard Zbs bit-manipulation extension for single-bit
>> >>> >> +            instructions as ratified at commit 6d33919 ("Merge pull request #158
>> >>> >> +            from hirooih/clmul-fix-loop-end-condition") of riscv-bitmanip.
>> >>> >> +
>> >>> >> +        - const: zicbom
>> >>> >> +          description:
>> >>> >> +            The standard Zicbom extension for base cache management operations as
>> >>> >> +            ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
>> >>> >> +
>> >>> >> +        - const: zicbop
>> >>> >> +          description:
>> >>> >> +            The standard Zicbop extension for cache-block prefetch instructions
>> >>> >> +            as ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of
>> >>> >> +            riscv-CMOs.
>> >>> >> +
>> >>> >> +        - const: zicboz
>> >>> >> +          description:
>> >>> >> +            The standard Zicboz extension for cache-block zeroing as ratified
>> >>> >> +            in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
>> >>> >> +
>> >>> >> +        - const: zicntr
>> >>> >> +          description:
>> >>> >> +            The standard Zicntr extension for base counters and timers, as
>> >>> >> +            ratified in the 20191213 version of the unprivileged ISA
>> >>> >> +            specification.
>> >>> >> +
>> >>> >> +        - const: zicsr
>> >>> >> +          description:
>> >>> >> +            The standard Zicsr extension for control and status register
>> >>> >> +            instructions, as ratified in the 20191213 version of the
>> >>> >> +            unprivileged ISA specification.
>> >>> >> +
>> >>> >> +        - const: zifencei
>> >>> >> +          description:
>> >>> >> +            The standard Zifencei extension for instruction-fetch fence, as
>> >>> >> +            ratified in the 20191213 version of the unprivileged ISA
>> >>> >> +            specification.
>> >>> >> +
>> >>> >> +        - const: zihintpause
>> >>> >> +          description:
>> >>> >> +            The standard Zihintpause extension for pause hints, as ratified in
>> >>> >> +            commit d8ab5c7 ("Zihintpause is ratified") of the riscv-isa-manual.
>> >>> >> +
>> >>> >> +        - const: zihpm
>> >>> >> +          description:
>> >>> >> +            The standard Zihpm extension for hardware performance counters, as
>> >>> >> +            ratified in the 20191213 version of the unprivileged ISA
>> >>> >> +            specification.
>> >>> >> +
>> >>> >> +        - const: ztso
>> >>> >> +          description:
>> >>> >> +            The standard Ztso extension for total store ordering, as ratified
>> >>> >> +            in commit 2e5236 ("Ztso is now ratified.") of the
>> >>> >> +            riscv-isa-manual.
>> >>> >> +
>> >>> >> +additionalProperties: true
>> >>> >> +...
>> >>> >> --
>> >>> >> 2.40.1
>> >>> >>

