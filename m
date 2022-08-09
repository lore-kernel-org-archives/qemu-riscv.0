Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oLRUB-00033F-Ou
	for mharc-qemu-riscv@gnu.org; Tue, 09 Aug 2022 11:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robherring2@gmail.com>)
 id 1oLQ2H-0001Pr-FO
 for qemu-riscv@nongnu.org; Tue, 09 Aug 2022 10:16:52 -0400
Received: from mail-il1-f175.google.com ([209.85.166.175]:36749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robherring2@gmail.com>)
 id 1oLQ2B-0000AU-VC
 for qemu-riscv@nongnu.org; Tue, 09 Aug 2022 10:16:43 -0400
Received: by mail-il1-f175.google.com with SMTP id s16so6573011ilp.3
 for <qemu-riscv@nongnu.org>; Tue, 09 Aug 2022 07:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=Q9mXyBIsDcHFkxvhhPAewKIvUVNC7xu4zQ9cHub7pU8=;
 b=HQmVmL2pjXWP1BBRH425sPVVd7sKS+dFmCJ+zlwO81hhwxRN5U1S3LmUQJOjI0YKCf
 2LeRApwCtcP3cammTBIoD40iXTohcLTkbR6foegAXeETbwxmObewcvf+MppsAS9UQf7F
 2//nwf6+2OFMAIsroYAVxzezO7B8OCUj4HoqdZE1ZMIhkYRv2XR0l6wAUkxGJqRsBnIe
 fFdSDVZtiA0A2kaOBor8OVj2q8m0SkBydaR4AIGMOvYhSEJdS2v87zeu4THRczML/WQk
 j30SX5vCQW2UmmCFPebDJUS45XOwThu9UTvK9GIxHnDr0fbaxkAPj3bxJY/FNsqbg4g5
 c/oQ==
X-Gm-Message-State: ACgBeo3LIgVSFD3WGnIyRjFYqOtgEa57GVFGw3cBXgpGqNWBYsAjiIBB
 dJaw8B4wiaF6Qm4Wy6CBSg==
X-Google-Smtp-Source: AA6agR5sKNiD1jY7asRAYAJjA4Ioov1LBgXDA+f5syLv9nnxp52HOBVCeed/e86Hnn99NJMdjRx1Dw==
X-Received: by 2002:a92:c247:0:b0:2df:2e4d:5930 with SMTP id
 k7-20020a92c247000000b002df2e4d5930mr10661115ilo.229.1660054596321; 
 Tue, 09 Aug 2022 07:16:36 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a05660214d000b00684a7617f14sm1144598iow.10.2022.08.09.07.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 07:16:35 -0700 (PDT)
Received: (nullmailer pid 1749632 invoked by uid 1000);
 Tue, 09 Aug 2022 14:16:32 -0000
Date: Tue, 9 Aug 2022 08:16:32 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>,
 Guo Ren <guoren@kernel.org>, Sagar Kadam <sagar.kadam@sifive.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH 1/3] dt-bindings: timer: sifive,clint: add legacy riscv
 compatible
Message-ID: <20220809141632.GB1706120-robh@kernel.org>
References: <20220805162844.1554247-1-mail@conchuod.ie>
 <20220805162844.1554247-2-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805162844.1554247-2-mail@conchuod.ie>
Received-SPF: pass client-ip=209.85.166.175;
 envelope-from=robherring2@gmail.com; helo=mail-il1-f175.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 09 Aug 2022 11:49:25 -0400
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
X-List-Received-Date: Tue, 09 Aug 2022 14:17:06 -0000

On Fri, Aug 05, 2022 at 05:28:43PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> While "real" hardware might not use the compatible string "riscv,clint0"
> it is present in the driver & QEMU uses it for automatically generated
> virt machine dtbs. To avoid dt-validate problems with QEMU produced
> dtbs, such as the following, add it to the binding.
> 
> riscv-virt.dtb: clint@2000000: compatible:0: 'sifive,clint0' is not one of ['sifive,fu540-c000-clint', 'starfive,jh7100-clint', 'canaan,k210-clint']
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/timer/sifive,clint.yaml           | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index e64f46339079..9fcf20942582 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -22,12 +22,18 @@ description:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - sifive,fu540-c000-clint
> -          - starfive,jh7100-clint
> -          - canaan,k210-clint
> -      - const: sifive,clint0
> +    oneOf:
> +      - items:
> +          - enum:
> +              - sifive,fu540-c000-clint
> +              - starfive,jh7100-clint
> +              - canaan,k210-clint
> +          - const: sifive,clint0
> +      - items:
> +          - const: sifive,clint0
> +          - const: riscv,clint0
> +        deprecated: true
> +        description: For legacy systems & the qemu virt machine only

I would drop 'legacy systems'.

>  
>      description:
>        Should be "<vendor>,<chip>-clint" and "sifive,clint<version>".
> -- 
> 2.37.1
> 
> 

