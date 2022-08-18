Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOiVZ-0008L5-5v
	for mharc-qemu-riscv@gnu.org; Thu, 18 Aug 2022 12:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robherring2@gmail.com>)
 id 1oOiVX-0008Kv-OW
 for qemu-riscv@nongnu.org; Thu, 18 Aug 2022 12:36:35 -0400
Received: from mail-il1-f179.google.com ([209.85.166.179]:45909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robherring2@gmail.com>)
 id 1oOiVW-0002Qa-3F
 for qemu-riscv@nongnu.org; Thu, 18 Aug 2022 12:36:35 -0400
Received: by mail-il1-f179.google.com with SMTP id a9so789131ilr.12
 for <qemu-riscv@nongnu.org>; Thu, 18 Aug 2022 09:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=M8whQnh20c5DrO/g1DklkK8u4I+Jzv+7yqvteJMRnk4=;
 b=geYnXDxSY2fvNB+533wor2bfmnY2NOnsf9s88gtrcrnfGZioEXYrHo6tiw1ebbZhuZ
 yAaH5mlMkm648PnkNyw7M/OhCsnuUicmZuEZM1N/EnHBLSvoPJ1hDVzO8Xrll30gB0gs
 sZa2ntMgSiN1Sy6K0vLN4wGkW3lW4JFd/eLgOC/FBVSlZOdZ7iZzk1TG7ViDEqvWBwqt
 Qwda19lIPG4GwGvRGFoo0QXvmMGOX21wt+dnutNLwGbA8c5QQz988U2hLlMDKduAyqIE
 jbvBnAtjnLUjjMSpDWwLwEhEhH/DESCnhlf4YMcUTCZQqlWsGY6vYHZ+i92mJao2Qu65
 XnPw==
X-Gm-Message-State: ACgBeo2WKCKoVb6of84FFtgKp3DNeNgHUpJwLJYQNgxUfVMGPjZIQual
 UFL++nONPdRKTvSHHWvNpg==
X-Google-Smtp-Source: AA6agR6BO8dOlPsFEFWhj5EUY+W39h9E7U+aGdI6szZ6ee6PCPM3WFIUVT1ZpBVnS1ZlkaHZq6Da7g==
X-Received: by 2002:a05:6e02:de2:b0:2e6:691f:eda5 with SMTP id
 m2-20020a056e020de200b002e6691feda5mr1785399ilj.279.1660840592441; 
 Thu, 18 Aug 2022 09:36:32 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:647:4ff2:3529:f8cd:d6cd:ac54])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a056e021bca00b002e9256ab3f6sm177238ilv.31.2022.08.18.09.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 09:36:31 -0700 (PDT)
Received: (nullmailer pid 1996122 invoked by uid 1000);
 Thu, 18 Aug 2022 16:36:26 -0000
Date: Thu, 18 Aug 2022 10:36:26 -0600
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
Subject: Re: [PATCH v3 1/4] dt-bindings: timer: sifive,clint: add legacy
 riscv compatible
Message-ID: <20220818163626.GC1978870-robh@kernel.org>
References: <20220817201212.990712-1-mail@conchuod.ie>
 <20220817201212.990712-2-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220817201212.990712-2-mail@conchuod.ie>
Received-SPF: pass client-ip=209.85.166.179;
 envelope-from=robherring2@gmail.com; helo=mail-il1-f179.google.com
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
X-List-Received-Date: Thu, 18 Aug 2022 16:36:35 -0000

On Wed, Aug 17, 2022 at 09:12:10PM +0100, Conor Dooley wrote:
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

Reviewed-by: Rob Herring <robh@kernel.org>

