Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C9DC7EE29
	for <qemu-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 14:55:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q7civ-0000HN-De; Fri, 09 Jun 2023 10:04:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robh@kernel.org>) id 1q7ciu-0000HF-0R
 for qemu-riscv@nongnu.org; Fri, 09 Jun 2023 10:04:16 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robh@kernel.org>) id 1q7cin-0007eh-Hn
 for qemu-riscv@nongnu.org; Fri, 09 Jun 2023 10:04:15 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D85EE65844
 for <qemu-riscv@nongnu.org>; Fri,  9 Jun 2023 14:03:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5457C433A1
 for <qemu-riscv@nongnu.org>; Fri,  9 Jun 2023 14:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686319438;
 bh=4I/YaRz0JPgSntsbq21xyleaxpnwMk0f+rSHrten7Nw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Li+CI9dmjZpFEyKY0TEnA7JMSOf2g/jK3VQik3pEQaGJXtNdC1mbhlhwfoOqbeM/O
 C7zj/hGfLvcf0pC+JY5CNaWoNHbU6wwyVwVISv9OUBFLh0Uj4Zd93+snwTcRY6DNOI
 2aIhhAjus+nq82CirPnQqpSNF6W8UgH230vTi98tauGmmSYiiWzZd+p1yA31PKCftn
 vBAIU+eR3lwzOLk2/ZR9g1T+Pjx4cm6aQGr7GVBU9jZ5couB7wuur0Gdp+e4RfWs7x
 TndYjNpGkwSHfiXKXTb4IWtbuVHgNvRWX3Ccd3js8PStYLqDASfAB+ThfJo2IJVG4b
 1jO486zxpCFlg==
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-4f61d79b0f2so2363486e87.3
 for <qemu-riscv@nongnu.org>; Fri, 09 Jun 2023 07:03:58 -0700 (PDT)
X-Gm-Message-State: AC+VfDy8JDWbuYeTAvC67c4IFYVnT59gRfE8jgGJjWQLRmtnPqd0+GSy
 eBsjdEUpQnrkleUo/0QKsmTPjcG6TAdJjLDNdw==
X-Google-Smtp-Source: ACHHUZ5YQv2XPsQRf7fiS5EHNK3U/O/dTd2T5JKiUmddht7wp+IV/pFj6+87nrAXOzHuwKYwetH7tBI6o/ZkH7J0SvU=
X-Received: by 2002:a2e:9942:0:b0:2b1:b8ad:3456 with SMTP id
 r2-20020a2e9942000000b002b1b8ad3456mr1157920ljj.50.1686319436756; Fri, 09 Jun
 2023 07:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230608-sitting-bath-31eddc03c5a5@spud>
 <168624654839.3085745.9088493205796442132.robh@kernel.org>
 <20230608-unlucky-carpenter-b3a95f269712@spud>
In-Reply-To: <20230608-unlucky-carpenter-b3a95f269712@spud>
From: Rob Herring <robh@kernel.org>
Date: Fri, 9 Jun 2023 08:03:44 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK8pr5itTr8xTOf=h7zOan6giGsQcwQ-zUCbjtpUsosfw@mail.gmail.com>
Message-ID: <CAL_JsqK8pr5itTr8xTOf=h7zOan6giGsQcwQ-zUCbjtpUsosfw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: riscv: deprecate riscv,isa
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Oleksii <oleksii.kurochko@gmail.com>,
 Anup Patel <apatel@ventanamicro.com>, qemu-riscv@nongnu.org,
 u-boot@lists.denx.de, 
 Andrew Jones <ajones@ventanamicro.com>, palmer@dabbelt.com, 
 Atish Patra <atishp@atishpatra.org>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Rick Chen <rick@andestech.com>, linux-kernel@vger.kernel.org, 
 Leo <ycliang@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=robh@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, Jun 8, 2023 at 12:05=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, Jun 08, 2023 at 11:49:08AM -0600, Rob Herring wrote:
> > On Thu, 08 Jun 2023 17:54:05 +0100, Conor Dooley wrote:
>
> > > As a result of implementing Sean's suggestion, I believe I need to ad=
d
> > > riscv,isa-extensions as an exception to the rules preventing vendor
> > > properties being of object type, otherwise dt_binding_check is less t=
han
> > > happy with me.
>
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings=
/riscv/extensions.yaml: properties:riscv,isa-extensions: 'oneOf' conditiona=
l failed, one must be fixed:
> >       Additional properties are not allowed ('additionalProperties', 'p=
roperties' were unexpected)
> >               hint: A vendor boolean property can use "type: boolean"
> >       /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bi=
ndings/riscv/extensions.yaml: properties:riscv,isa-extensions: 'oneOf' cond=
itional failed, one must be fixed:
> >               'enum' is a required property
> >               'const' is a required property
> >               hint: A vendor string property with exact values has an i=
mplicit type
> >               from schema $id: http://devicetree.org/meta-schemas/vendo=
r-props.yaml#
> >       Additional properties are not allowed ('additionalProperties', 'p=
roperties', 'type' were unexpected)
> >               hint: A vendor string property with exact values has an i=
mplicit type
> >       /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bi=
ndings/riscv/extensions.yaml: properties:riscv,isa-extensions: 'oneOf' cond=
itional failed, one must be fixed:
> >               '$ref' is a required property
> >               'allOf' is a required property
> >               hint: A vendor property needs a $ref to types.yaml
> >               from schema $id: http://devicetree.org/meta-schemas/vendo=
r-props.yaml#
> >       'boolean' was expected
> >               hint: A vendor boolean property can use "type: boolean"
> >       hint: Vendor specific properties must have a type and description=
 unless they have a defined, common suffix.
> >       from schema $id: http://devicetree.org/meta-schemas/vendor-props.=
yaml#
>
> Yeah, expected. I think I need an exception in vendor-props for this to
> pass the checks.

Nope, vendor prefixes don't go in node names. That's not explicit
anywhere, but goes against using generic node names.

Also, note that looking at the DT spec, there's already prior art here
with PPC. See "power-isa-*". Though that appears in .dts files, but no
kernel code. Maybe you already saw that as your v1 is similar. There's
not really much advantage to align with it, but also not much reason
to deviate.

Rob

