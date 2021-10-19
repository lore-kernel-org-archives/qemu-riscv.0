Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcj0G-0005eA-7T
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 02:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcj08-0005cZ-Tv; Tue, 19 Oct 2021 02:53:36 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:41570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcj07-0006c7-80; Tue, 19 Oct 2021 02:53:32 -0400
Received: by mail-il1-x135.google.com with SMTP id l7so4082920iln.8;
 Mon, 18 Oct 2021 23:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UvYdCkPWlVxNR2cg+1VbdxVWthPp7Gc3ywXihIkt0Ck=;
 b=h+WvNtSKxJgKkp4VbQtKbuBKRqdGC8lAqA/oqT3aUOoEb8pS4zXRNQ8Jd+Bg9hQAY/
 o+GAvHEMKvwiNLTnfXoLkKSX4VPvMk8yBOJhKW1GBBqRiUNmbXdAUuRK7xm4+qJetbb8
 gswJUJsXZpb/K5IDyJMVzsHIH3y5C755evqbfHLfPULDUbLK7jzXNOLRTRakUsiUjY31
 RNzsYLVOrKPivP1XuprDnWNRDjlcb/IkQdEECs15+ezp+SaxlNtK+cTlIAP/47yyOkhF
 JajaYcMseQFsczPa45w+mh1jfAIB/EBPvA1kCUpsOAPLakbJ49oXXlXebpdfo8zDhgfu
 7tMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UvYdCkPWlVxNR2cg+1VbdxVWthPp7Gc3ywXihIkt0Ck=;
 b=OFaEwaa9poW3ZlPODU8Gqc1ytBymzjn0FDKCu7mBukgbdZV5E7CsKHcqw24DsrcMoc
 mTyiwlfWQ6/mVLyALCQPCT+Kx7WveBw7Kkxq3ZfkNfEzX5f6bNenF9+DDx76Z0+cT0Q7
 qeGXPVRn7wiNM9RLlFzUUD2kPY/ym/OmE4paUKczt4w5q1kFgUlP4zsrYoE1vVmEyDcE
 h6fauVTcsEfsBVUxrB9DyhcNH4CcBblsgp8lf2dRv5Goc10kkQq2c4wCAOXD2Bjb2O0x
 +VM8e5Lgt5+y6jiolfdZzV4J3pcLmZCD6jhdzcxBTUC0/hcDGWtpL9Te++xI3R3+l3aA
 y79Q==
X-Gm-Message-State: AOAM530W59+o5ck0ZOjuRWL9WpZyFzG+pwXqq1m1Z0ABVTn6E3LPk/AF
 2zTBNTa+G4crKYKbmrXp7zjFa7TaunmpZwdBOy8=
X-Google-Smtp-Source: ABdhPJxQYb4noEeNyyHts3Ewdz9OQlVkAifG5MffL9IphxQL0jQp8MOIPw/yaMLnBdpXIENSfsbniacJgagoIezHFzo=
X-Received: by 2002:a05:6e02:214a:: with SMTP id
 d10mr17898898ilv.290.1634626409894; 
 Mon, 18 Oct 2021 23:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211017172728.759687-1-space.monkey.delivers@gmail.com>
 <20211017172728.759687-5-space.monkey.delivers@gmail.com>
In-Reply-To: <20211017172728.759687-5-space.monkey.delivers@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Oct 2021 16:53:03 +1000
Message-ID: <CAKmqyKPDfYan+czM+1AnJ7+gyjZAKDobxDvJ40R8Sor0FH4HNw@mail.gmail.com>
Subject: Re: [PATCH v14 4/8] [RISCV_PM] Add J extension state description
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 space.monkey.delivers@gmail.com, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Dave Smith <kupokupokupopo@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x135.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Oct 2021 06:53:36 -0000

On Mon, Oct 18, 2021 at 3:36 AM Alexey Baturo <baturo.alexey@gmail.com> wrote:
>
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
> ---
>  target/riscv/machine.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 16a08302da..4d99880797 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -84,6 +84,14 @@ static bool vector_needed(void *opaque)
>      return riscv_has_ext(env, RVV);
>  }
>
> +static bool pointermasking_needed(void *opaque)
> +{
> +    RISCVCPU *cpu = opaque;
> +    CPURISCVState *env = &cpu->env;
> +
> +    return riscv_has_ext(env, RVJ);
> +}
> +
>  static const VMStateDescription vmstate_vector = {
>      .name = "cpu/vector",
>      .version_id = 1,
> @@ -138,6 +146,24 @@ static const VMStateDescription vmstate_hyper = {
>      }
>  };
>
> +static const VMStateDescription vmstate_pointermasking = {
> +    .name = "cpu/pm",

Can we write "cpu/pointer_masking"? pm sounds like power management

Alistair

