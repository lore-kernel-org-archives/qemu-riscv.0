Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oT5an-0005Ny-KT
	for mharc-qemu-riscv@gnu.org; Tue, 30 Aug 2022 14:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robherring2@gmail.com>)
 id 1oT5aV-0005Ik-3Y
 for qemu-riscv@nongnu.org; Tue, 30 Aug 2022 14:03:56 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:34791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robherring2@gmail.com>)
 id 1oT5aS-0005vg-FD
 for qemu-riscv@nongnu.org; Tue, 30 Aug 2022 14:03:46 -0400
Received: by mail-ot1-f42.google.com with SMTP id
 q39-20020a056830442700b0063889adc0ddso8633093otv.1
 for <qemu-riscv@nongnu.org>; Tue, 30 Aug 2022 11:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=E/aVLvibqd/b36Ng45UDa0e8w5QaN31zCJl6Jumumq4=;
 b=csLDnE7GggqcXK0sKpDMXoE78q8z1mNg1SNei5ueXyDn3lxEDK4K9fyC7cy/9MFs5l
 jOaNlr7uBSytY8+nrfbWpZM8ER4jT7EVfCnJz86Fp6dBCAFuLPfMtIvQuf/piA7cl6ga
 ZST3M1ZO1BUhsHZdNpand74o4zv/4nMFAmfdWMs19RjKhsWkPcBlB+29KTgOuOloEREW
 TbbHgav0Zh9FekBZFozjVPogJKlwiu4rSBB1smFxNLn6xNTq9CQUIFA6sv3G8iBzQgZ5
 T76RFFxkSROAm/jF0InWtfm1JuCML6aduLZpfSt1PN7mTnbnWKE/G/JBeAiwhxa7OVu8
 rQXQ==
X-Gm-Message-State: ACgBeo3967wF1ce5hBOstkLrx+cMj9p1mHQIFu0hyLF3uCdTkiXm+wcc
 efbgH4WeKA1TCwyYJ5n1kg==
X-Google-Smtp-Source: AA6agR5JGLNMerqnzMNRFokwD0kYQMtWsTMxX51+yE5oIJHMl04sDutLbVBGC7lLaqgSJK5sj75chQ==
X-Received: by 2002:a9d:72d0:0:b0:638:e9cf:3e75 with SMTP id
 d16-20020a9d72d0000000b00638e9cf3e75mr8732407otk.289.1661882622846; 
 Tue, 30 Aug 2022 11:03:42 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x19-20020a9d6293000000b00616dfd2c859sm7579226otk.59.2022.08.30.11.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 11:03:42 -0700 (PDT)
Received: (nullmailer pid 1769934 invoked by uid 1000);
 Tue, 30 Aug 2022 18:03:41 -0000
Date: Tue, 30 Aug 2022 13:03:41 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: Guo Ren <guoren@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>,
 Jessica Clarke <jrtc27@jrtc27.com>, Andrew Jones <ajones@ventanamicro.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, qemu-riscv@nongnu.org,
 Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marc Zyngier <maz@kernel.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Sagar Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: riscv: add new riscv, isa strings for
 emulators
Message-ID: <20220830180341.GA1769896-robh@kernel.org>
References: <20220823183319.3314940-1-mail@conchuod.ie>
 <20220823183319.3314940-4-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823183319.3314940-4-mail@conchuod.ie>
Received-SPF: pass client-ip=209.85.210.42; envelope-from=robherring2@gmail.com;
 helo=mail-ot1-f42.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 30 Aug 2022 18:04:03 -0000

On Tue, 23 Aug 2022 19:33:19 +0100, Conor Dooley wrote:
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
> 
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

Reviewed-by: Rob Herring <robh@kernel.org>

