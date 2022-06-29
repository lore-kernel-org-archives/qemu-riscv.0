Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o6OlK-00064q-7u
	for mharc-qemu-riscv@gnu.org; Tue, 28 Jun 2022 23:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o6OlJ-00062M-68; Tue, 28 Jun 2022 23:53:09 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:33721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1o6OlH-0001ZS-Mo; Tue, 28 Jun 2022 23:53:08 -0400
Received: by mail-qv1-xf29.google.com with SMTP id 2so8138032qvc.0;
 Tue, 28 Jun 2022 20:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GEBFWjxzsE//hH2w3EUJijIrNNTJv3vLGcO9a8jKS+8=;
 b=FJjLqgmBvogxOBHpp9Wm1N/yM1K8oI2Bm4BW5KzSmmfIRvAx7REb+HEi51bONlifv4
 b7wQ0hKj/iwwmdZ0/3VceDDW0uu+Os6DO/oDU76lnEfrHLmRu4yYGJyZoleHiAgIY1QX
 RnO4Mbey2b0gQKEZmPtDM4huHhVyxG7r3ifKYGj8E7RDlQU8etFgrfI1upSwTmy9MRaX
 9nUMtWBMszsQbKh79hG4Rk9HJVX7LqsLzIJbW4LvWMh6U19rstztW2PISfd1q6BJv1oR
 dyRPKc3NEufa5+E5ZQZNIt25tASa3c9lhCYmFKu+34b7ASKECQb1YTdrh4qeNTWNZZJD
 B8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GEBFWjxzsE//hH2w3EUJijIrNNTJv3vLGcO9a8jKS+8=;
 b=KugDKtjbau+02NdLUokjCUF+A3ZGbBjSo0ny7/ILOu8XEeq80+g6Z+T5+Dy6pBFIk5
 sKCwX6WiLacMy0r3pwMN/86QIM0Si71BHgeLEb1WiRqWtXcdWGHwI2j65WJ5PwVYsvtU
 CkJqwnxD4aGE1sDaetTKoLiwaIVPM9e0RkGk/3Sz6KUzBPAiGS9wedpQvCGaKbx+vmQZ
 16RvxUc8D6cH9fpe80q5mi8DORto1SPZqM7Jrn0UlYvqCph2NpBcroGdhf64lD8mi0uk
 Q1grJMFR8GrqxDfEJyqcuPEacSddiqtoMFQEOAXJUXed99cpnfUAuKClnQGlXqV1CW7e
 EOIA==
X-Gm-Message-State: AJIora/1SVKkKT+HdJO2+bdF+UHi1ccEwH1+lCbvMkBCyUiAoKIl3HoI
 sjk4tc2MqfygYcg0bgTD/U+95x51w8rPOg+A67Y=
X-Google-Smtp-Source: AGRyM1tbc5vcpQSniWOO1318bvDNSx1Kam1VKaZD8MtPa/bMYnCjsan9Wl/vFMHWYiLgTQHnnwWOcEx9M00sj5X+rkk=
X-Received: by 2002:a05:622a:14f:b0:31b:a118:8833 with SMTP id
 v15-20020a05622a014f00b0031ba1188833mr904470qtw.543.1656474785723; Tue, 28
 Jun 2022 20:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220627164044.1512862-1-rpathak@ventanamicro.com>
 <CAKmqyKPekJ0v6gXJZh=cptRE8TXVqpB_2XtG1X_-oSgcmcf58w@mail.gmail.com>
 <CA+Oz1=Yi42RtJ6CphL0d8KYjeZhDu7H101JY59rL0fO+4oq9zQ@mail.gmail.com>
In-Reply-To: <CA+Oz1=Yi42RtJ6CphL0d8KYjeZhDu7H101JY59rL0fO+4oq9zQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 29 Jun 2022 11:52:54 +0800
Message-ID: <CAEUhbmV45wwZx72y6D2Vcn0VcwtfCRvma574inuCCYw48gCfCg@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: fix user-mode build issue because mhartid
To: Rahul Pathak <rpathak@ventanamicro.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <apatel@ventanamicro.com>, 
 Rahul Pathak <rpathakmailbox@gmail.com>, 
 =?UTF-8?Q?V=C3=ADctor_Colombo?= <victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Wed, 29 Jun 2022 03:53:09 -0000

Hi Rahul,

On Wed, Jun 29, 2022 at 10:07 AM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>
> Hi Alistair
>
> My fix patch needs to be dropped since Anup took care of this issue
> in his yesterdays series update in this patch -
> [PATCH v8 4/4] target/riscv: Force disable extensions if priv spec
> version does not match

I don't understand. Each patch should keep bisectability.

This sounds like to me, that
[PATCH v8 4/4] target/riscv: Force disable extensions if priv spec
version does not match

has an issue that it does 2 things: one is to fix this bug, and the
other one is to force disable extensions.

Which is not right.

Regards,
Bin

