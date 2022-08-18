Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOiVu-0008TO-3C
	for mharc-qemu-riscv@gnu.org; Thu, 18 Aug 2022 12:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robherring2@gmail.com>)
 id 1oOiVt-0008TG-J6
 for qemu-riscv@nongnu.org; Thu, 18 Aug 2022 12:36:57 -0400
Received: from mail-io1-f42.google.com ([209.85.166.42]:34783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robherring2@gmail.com>)
 id 1oOiVr-0002TY-W9
 for qemu-riscv@nongnu.org; Thu, 18 Aug 2022 12:36:57 -0400
Received: by mail-io1-f42.google.com with SMTP id x64so1499834iof.1
 for <qemu-riscv@nongnu.org>; Thu, 18 Aug 2022 09:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=EsZP3ELRo6TTGsFBmByT42JNw5wBc7RlaMRIBETg5Gc=;
 b=EG09gmfYwFMMdV5xDpU7OOVrTRR9bqbFoi69irlEt6xtsvZe/YJN60ERIUscHS9Hzy
 QtjTOsjq87brK/7VnVSop+A/Ux8tRf1tPQpcxcjIxIAF0OdhGhTMbjOVF8IKLXGApTHe
 hVRKq/oPtnPKxgk1927G9CFA1+CYgVW/Wfv4mwqfG+tjXCV5LJ2NoXjJTrJuYqZ0qJoW
 hkmVA0faVj0MeAxQcwP+7a/H+bnZw3xCVybodjmORf4S+is5r4wGG9TAcuRIfJzA21uQ
 WEeSiOkxghAqegmMEfC9NsGYihyAkg0a2xZcm38EqVP8EG0ZxeY5uEi+18nf5ocVpZ6N
 bNQQ==
X-Gm-Message-State: ACgBeo180Z/MX20w2JdZY9llhJW8wkvh4VifmSpKroHhyU5d21+KkQOo
 oXpS34eD0laczuZqXB4Dtg==
X-Google-Smtp-Source: AA6agR7XYb4e6JSFTnrS/q7WlPl4E2gg4SEWAy++LgChjlcloI3dnrD9XsgcrfX8E4rSums27VI5/w==
X-Received: by 2002:a05:6602:330e:b0:67b:9fed:49db with SMTP id
 b14-20020a056602330e00b0067b9fed49dbmr1740842ioz.54.1660840614873; 
 Thu, 18 Aug 2022 09:36:54 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:647:4ff2:3529:f8cd:d6cd:ac54])
 by smtp.gmail.com with ESMTPSA id
 b40-20020a0295ab000000b003427281824csm756542jai.128.2022.08.18.09.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 09:36:54 -0700 (PDT)
Received: (nullmailer pid 1996636 invoked by uid 1000);
 Thu, 18 Aug 2022 16:36:48 -0000
Date: Thu, 18 Aug 2022 10:36:48 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>,
 Guo Ren <guoren@kernel.org>, Sagar Kadam <sagar.kadam@sifive.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, Andrew Jones <ajones@ventanamicro.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v3 2/4] dt-bindings: interrupt-controller: sifive,plic:
 add legacy riscv compatible
Message-ID: <20220818163648.GD1978870-robh@kernel.org>
References: <20220817201212.990712-1-mail@conchuod.ie>
 <20220817201212.990712-3-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220817201212.990712-3-mail@conchuod.ie>
Received-SPF: pass client-ip=209.85.166.42; envelope-from=robherring2@gmail.com;
 helo=mail-io1-f42.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 18 Aug 2022 16:36:57 -0000

On Wed, Aug 17, 2022 at 09:12:11PM +0100, Conor Dooley wrote:
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
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml     | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>

