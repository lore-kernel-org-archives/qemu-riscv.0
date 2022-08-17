Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOPJJ-0003od-0j
	for mharc-qemu-riscv@gnu.org; Wed, 17 Aug 2022 16:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oOPJH-0003kb-99
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 16:06:39 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oOPJF-0000Ou-DB
 for qemu-riscv@nongnu.org; Wed, 17 Aug 2022 16:06:39 -0400
Received: by mail-wr1-x432.google.com with SMTP id a4so5673905wrq.1
 for <qemu-riscv@nongnu.org>; Wed, 17 Aug 2022 13:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=UZTpqupSKgkBpic1kmmbE38yTznkCK+owr7ALBSIpuo=;
 b=ONnvtXExatPGAC8/eknlabIqwuQUJitqFeDU6iyKVknhYq9mRJVUgaW2s/7WFWlzn3
 4I6bO7BksmXFUVOTQo+3EgPrXJ1lC68V8OUxM9/0Le5LasHeV74Ro+BAK0z6yqUH3qOh
 OGjdiUMOpNCZIbN0TFs3JxCRuWhZyPiuau7oARVBknRBZVZwveudnn/hhBflTdlfwJp0
 zqRdtz4HOAEoctXS5iQSbg7kxevpTwPaVWymxqfPoCEqyegAyKI9KFrcg7pFAndgC119
 hZjazVmD1acGyLfeqZ9w7H37fQt5bDzqX+p2MWPJsdllwftjSVTbRklc2TSA5JFPeOTb
 NWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=UZTpqupSKgkBpic1kmmbE38yTznkCK+owr7ALBSIpuo=;
 b=cN/8BSX848NMO1FuKWxfi5f68Y4Ga7wi42gL4ByDmHiwU84adjC9b8QILQjYjAPsWs
 zpFxRXNmAmjuFzkW1KEMRIlF/r8WYYNsmcthA4RdZIS85vKuG4JwN3AMjQwB3fy3s1Cf
 YnrLMM+xft0D7CsUomKnKkSwRji6dzGbRC76cmReDuexzyrkuEmIWdKZjaZCmbxwUjnK
 hA5CLSBwWACn3y7ybh+u1VSC5gBMj5EJc7Hza+Gx/pYzRS7xyQslNtLAlMn+HYc4tcz0
 dRGRrZqlyrW5VVNnuSz6d9+KYqXE4tPQp2xRfpD8FH7A1bN262Zfab3+v7j1OdXl32be
 h/jA==
X-Gm-Message-State: ACgBeo0g/bvA8lElgRe0J5y19ZYqZBqr74GTfNPz5OuOYqLxTslcjxTZ
 WnTSoBNuq5wvjs+FOFzIiHd5rw==
X-Google-Smtp-Source: AA6agR7BOt9pNzRcWHTxtpR3HtOvdldpTzvhVKO4AviCyWyAqHC7IF3syom/zJ4M5uYixXaWEpe8vA==
X-Received: by 2002:a5d:64e9:0:b0:220:7dd7:63eb with SMTP id
 g9-20020a5d64e9000000b002207dd763ebmr15274129wri.590.1660766796102; 
 Wed, 17 Aug 2022 13:06:36 -0700 (PDT)
Received: from [192.168.2.222] ([109.76.58.63])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a05600c178900b003a4efb794d7sm3065988wmo.36.2022.08.17.13.06.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 13:06:35 -0700 (PDT)
Message-ID: <0046d59c-6736-09c2-199d-3661e58c2928@conchuod.ie>
Date: Wed, 17 Aug 2022 21:06:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/4] Fix dt-validate issues on qemu dtbdumps due to
 dt-bindings
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>,
 Guo Ren <guoren@kernel.org>, Sagar Kadam <sagar.kadam@sifive.com>,
 Jessica Clarke <jrtc27@jrtc27.com>, Andrew Jones <ajones@ventanamicro.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org
References: <20220817200531.988850-1-mail@conchuod.ie>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220817200531.988850-1-mail@conchuod.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=mail@conchuod.ie; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 17 Aug 2022 20:06:39 -0000

Please ignore this series, I accidentally had too much in the folder.

On 17/08/2022 21:05, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The device trees produced automatically for the virt and spike machines
> fail dt-validate on several grounds. Some of these need to be fixed in
> the linux kernel's dt-bindings, but others are caused by bugs in QEMU.
> 
> Patches been sent that fix the QEMU issues [0], but a couple of them
> need to be fixed in the kernel's dt-bindings. The first patches add
> compatibles for "riscv,{clint,plic}0" which are present in drivers and
> the auto generated QEMU dtbs. The final patch should be ignored for all
> serious purposes unless you want to wash your eyes out afterwards, but
> JIC the versioned extensions ever come up, it's there.
> 
> Thanks to Rob Herring for reporting these issues [1],
> Conor.
> 
> To reproduce the errors:
> ./build/qemu-system-riscv64 -nographic -machine virt,dumpdtb=qemu.dtb
> dt-validate -p /path/to/linux/kernel/Documentation/devicetree/bindings/processed-schema.json qemu.dtb
> (The processed schema needs to be generated first)
> 
> 0 - https://lore.kernel.org/linux-riscv/20220810184612.157317-1-mail@conchuod.ie/
> 1 - https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
> 
> Changes since v1:
> - drop the "legacy systems" bit from the binding descriptions
> - convert to a regex for the isa string
> 
> Conor Dooley (4):
>   dt-bindings: timer: sifive,clint: add legacy riscv compatible
>   dt-bindings: interrupt-controller: sifive,plic: add legacy riscv
>     compatible
>   dt-bindings: riscv: add new riscv,isa strings for emulators
>   dt-bindings: riscv: isa string bonus content
> 
>  .../sifive,plic-1.0.0.yaml                     |  5 +++++
>  .../devicetree/bindings/riscv/cpus.yaml        |  9 ++++++---
>  .../bindings/timer/sifive,clint.yaml           | 18 ++++++++++++------
>  3 files changed, 23 insertions(+), 9 deletions(-)
> 
> 
> base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868

