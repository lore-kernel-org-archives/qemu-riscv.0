Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BA2CC6B03
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 12:11:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xGbLw-0007Xa-LW; Tue, 13 Oct 2026 08:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jaminlin1207@gmail.com>)
 id 1xGWRi-0000Ro-JH
 for qemu-riscv@nongnu.org; Tue, 13 Oct 2026 02:57:10 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jaminlin1207@gmail.com>)
 id 1xGWRg-0005qp-TS
 for qemu-riscv@nongnu.org; Tue, 13 Oct 2026 02:57:10 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-c2e7496f947so410008566b.1
 for <qemu-riscv@nongnu.org>; Mon, 12 Oct 2026 23:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791874627; cv=none;
 d=google.com; s=arc-20260327;
 b=p994DsFt14LQ4aNQpvDimvqxvN2OibK7VfcODx7+ZjDWmfrbIiwLXXZEvkiX6gwwSU
 utArEqcP92RpOP06IG47mEHsd2BwaaFW1BH+JkiFhGGlEiKppOms18GbqyZiw947Pkf1
 rI5iIYK33gv70EWjt8I/fU420eOtZjOP4zmnbg69q6EvjLyllyA10r5QVXzS6g8QvgRP
 ZdoPmphf0TCUSgIFtBfi1Fp3RS3SD3NPebn5/2KIucJq9WXPFQLUp/s/t/G8wfqGZXGB
 tJu/lF/3UCSlMU4aEY4e4lp3zIfFbeY5/MTxDEvzpQILYMnWP0jCmHIbOJzodFu6BCPK
 0zSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=yAF65vIl+Pcsu3zOYkkdhrkunAFE6hSr8dy/8TmbRZs=;
 fh=hL2S0AR3PoOGKCaB5vzD7dHvqizU6XiOwqLE49dh4OE=;
 b=Yp4KUUgl3nXSCwo4rHMuyMiAf9ABMeXGDN+8G9KTbzhU4yQUPIR90/G7ScWz0GC6E/
 OJG/OaNqhGXwpsm7JNozuQ3oyLcTCaI9HlEPx+T+ls/tMPoijwtoWB5L/zyYc+UiojhP
 qoDS1O+hzKrrHE+/dcqiws+l3XaMUTacMOEkTTLtJG7egE6uhHunkRPPuqUolvnj5NPX
 DYA1u9KcpHUKKnDDrLDxbJpWItTVeykiirorsZKDkgDbydgpS05lyb3M89macR2HbcN6
 7DiyNVnyFrxZlmtsBqqmSYKXLBmlGrXKYbdsEsRei9Fw/Mb0SIDXzWSL40GliG+F32x1
 x9Pw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791874627; x=1792479427; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=yAF65vIl+Pcsu3zOYkkdhrkunAFE6hSr8dy/8TmbRZs=;
 b=SbUpZxRGXh34TjbnwxhaaSFhwh0IdOBvEuwRW8DkOLXo61K6CMOLZzY6ODxJEV14cG
 hckbGgRONLVd2+ibUtY30VXXfR7qY1jjGEHaMnRhju64qv83pQzJ2UIYfOTwREX2PNNA
 njT3KJsywZnjB/GgroIb8Bq94RSg//IgO9qAsA+nZL5P6raIpzKFcu+MeiiaveWAPDhu
 kqsQO1IG1OlivcdnS5tq9wGayLE/pXaXJS+S+BIN/7pMhVQ/Ygmt2KXk7gVFWTVkFuY/
 dTWGd/8z3EqWZyg2x83KwkhLvrWyISMT5XDcjoMUk4Ywg43rE3vBxdijkTYjr/ic+fBj
 tOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791874627; x=1792479427;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yAF65vIl+Pcsu3zOYkkdhrkunAFE6hSr8dy/8TmbRZs=;
 b=lcGaWdmDmLVlSiihf+TBIJrmcqP4RWg7by4xCv4jEUFkFrcqPX942qjF2o1zkzAPet
 Ze+1cVZXI+arehXBzyM85S2IcYo7OziKxeRyYlIaJHedzPoBIviyYHBol6MFdKlhXjnm
 L6+het3WmdWDrA3Qk7Ua9Xd/Y3u4OUm1FWYSgKL6LwRh11wmc8HDvrjhnrKt7wlvhN1y
 hQpoqBzh4lvtmJshtCNkbv1pB/ol31FvsRdc/n8rykQ36gMLHzT/0L2eZFHX+xrHPBq7
 TXag4L8qUxLpxaDLf+TXAXZzxrwuGbIFbLpFB91Mj9wX/fRUgmEZWhYnSZDfTNKd3yDg
 MBmQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy1SPFQimJpjuBjXbN2d2QK+t6xaoEZjiIWtwEsESAgm+pM2YqAiTiV0xkjcY2TAD2JNy1eRvciCYW2@nongnu.org
X-Gm-Message-State: AFq9FYKLKqolH7gVJpZUr/sIwJl84e8Q3kF4LHb3Mnf9B4OjvEnfICnJ
 bYGeLLsLCSVAg/WYhhdq3hhOD6m5aE+zkbHejBZ5fb7dVqMgJjPas6G28NhtVUlNmCuU0wAxqve
 JrNaIWyRuZ9nRDGSEDIsTZS/MAWdbzgc=
X-Gm-Gg: AYBFou0IOgbuoXShl+2MQJnnyl7BDokTqHxb9Jc8cV54Z1oUnoPpxN2eIvA8DGq5UYA
 ZTWoJT6wFXIj4c7Z+QuEUoFBMyDt3WXfVL53ZyOh/YqpqYJ1t5AoxkDO9gPjQnrSSKYQk01ZUM2
 K3k44V7zioR1JJSTfRMeJQQRvgAhuW6jLQQdmjF5v23WdGNOpAw2bZ6X4A8VSypg1iAZcTuWzFQ
 r9O5pNWwr505bI4nfrcy/WHqUvNrhsOQvxWkuPwYv8fYdbdgEhN0kIT+4kwuhjZDAd7ERdlJ3Vu
 xkaAwaSN2cm7TJaHhpzuFFHj677Mom2BDp2HWur6zDO3LmCo3K/fc/eb
X-Received: by 2002:a17:906:4fc9:b0:c35:d261:636e with SMTP id
 a640c23a62f3a-c3667073d72mr183803166b.18.1791874626719; Mon, 12 Oct 2026
 23:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20261012-bmc-minerva-v2-0-4c3dff084ec9@free.fr>
 <20261012-bmc-minerva-v2-1-4c3dff084ec9@free.fr>
In-Reply-To: <20261012-bmc-minerva-v2-1-4c3dff084ec9@free.fr>
From: =?UTF-8?B?5p6X5bu65piO?= <jaminlin1207@gmail.com>
Date: Tue, 13 Oct 2026 14:56:56 +0800
X-Gm-Features: AclHuK-iO7GDPciJLqtJlVfRWCT89sEuQ5uPrEZdf-6ZUjsaLdfAwzuvIe1aHyA
Message-ID: <CA+8rw5ySLv3XbwcNwr2Rjj+6aSbAh_QX18O9ibr1iA1fUe=k1Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/50] docs/system/arm/aspeed: add the catalina-bmc
 machine
To: Emmanuel Blot <emmanuel.blot@free.fr>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=jaminlin1207@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 13 Oct 2026 08:10:02 -0400
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

Emmanuel Blot via qemu development <qemu-devel@nongnu.org> =E6=96=BC
2026=E5=B9=B410=E6=9C=8812=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8810:=
55=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The Facebook Catalina BMC machine is supported by hw/arm but has never
> been listed in the Aspeed documentation. Add it to the AST2600 machine
> table.
>
> While at it, shorten the document title. Listing every machine name in
> the title duplicates the tables right below it, and made the title (and
> its underline) grow past 350 columns. The machine list stays available
> where it is readable, in the per-SoC tables.
>
> Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
> ---
>  docs/system/arm/aspeed.rst | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index 2d51ceeb84..933df41f96 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -1,5 +1,5 @@
> -Aspeed family boards (``anacapa-bmc``, ``ast2500-evb``, ``ast2600-evb``,=
 ``bletchley-bmc``, ``fuji-bmc``, ``gb200nvl-bmc``, ``fby35-bmc``, ``g220a-=
bmc``, ``palmetto-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bm=
c``, ``supermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass-bmc``, ``=
witherspoon-bmc``, ``yosemitev2-bmc``)
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Aspeed family boards
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  The QEMU Aspeed machines model BMCs of various OpenPOWER systems and
>  Aspeed evaluation boards. They are based on different releases of the
> @@ -33,6 +33,7 @@ AST2600 SoC based machines :
>  - ``fuji-bmc``             Facebook Fuji BMC
>  - ``bletchley-bmc``        Facebook Bletchley BMC
>  - ``fby35-bmc``            Facebook fby35 BMC
> +- ``catalina-bmc``         Facebook Catalina BMC
>  - ``anacapa-bmc``          Facebook Anacapa BMC
>  - ``gb200nvl-bmc``         Nvidia GB200nvl BMC
>
>
> --
> 2.50.1
>
>

Reviewed-by: Jamin Lin <jaminlin1207@gmail.com>

