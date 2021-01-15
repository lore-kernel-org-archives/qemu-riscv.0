Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l0XHk-0000u1-6k
	for mharc-qemu-riscv@gnu.org; Fri, 15 Jan 2021 17:09:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0XHg-0000rL-Js; Fri, 15 Jan 2021 17:09:34 -0500
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:37495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0XHa-0000SI-Nz; Fri, 15 Jan 2021 17:09:32 -0500
Received: by mail-io1-xd34.google.com with SMTP id d13so17871279ioy.4;
 Fri, 15 Jan 2021 14:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dv9XyjfbWMeF1rjxSxT9KZNccayRThNuNGKKCJLH+eA=;
 b=hBOh2I160W0NODEpXE14MMwOMC98Vst+nci/uaDgw/Q5JH0mUI5TG2bgvhR/5Ih8f9
 HaAvkmPU3mGtNU4kpY65sYAu7Y77//U3T8aMAPLNDv8QYd2eLfFQRUcvxp6wYZ4kJ8ZE
 1KNBPMqAGrpWWl4LTrCBV8HB5wjUaDN6hafAUO7k/mh+qzgaX1TCnqXWJYBvmwqEXPI9
 2s1T97rf6Ba4cnAIZQdk0xUbRQxBOegt1kf4FmhkqQXZ1xZiwJTc9oindLZCzMp9k+bD
 AzT/qBgMmeD/zfdfsQl2syzC8IlO2dY0kxFV4yBH9JVpdASFMtZmhkiQ7c5efVGsjzKm
 6+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dv9XyjfbWMeF1rjxSxT9KZNccayRThNuNGKKCJLH+eA=;
 b=UA5k2o/LtWPThPlBrpN7BHbx7Eon64kyvqGJbuX6L6HFAYyjXU1qEUD3I0F4Xq4rkH
 96bOZSfZyluhRbCbvRQwLV7B89y9lCSZKSa2c3HyjZ5s4s2VQVumtsn9oMgrY9i1xZy6
 EtfO0VjhjSSyywdWi0ZwxFJZPYAmG68X5K564NpXCKVp1e71/YZ/OmghplqPLx/o/ZZr
 4WJDjDhXjJNDyEUlWgcORdfhHmPolAB2z2F4tL5riV5AaQq7c5vuJ3lQ5HW6X1dWBwaa
 OlyAho2OyAeh8FQK4Mwyvz8L3M0aogcjM22tzH+d4keT/qpJ0KGDSbC0QArevmyKdU2a
 lVBg==
X-Gm-Message-State: AOAM532qzkN5TatuHOMrFEb0atOgnx4+WMU+VEFwhQ1faCTWc+N+HZC7
 6tgpDctx9iEctm1Vwu3vc4r4S45L3UfjdCoSIkc=
X-Google-Smtp-Source: ABdhPJwuH6LKZSLHddMbCuzoM7uLdnxMAhud++InNKAIx47zHCY/7SqrxHbhl6IuGvSrMH4Mubzg9ngOTFg3tskVS3w=
X-Received: by 2002:a02:2544:: with SMTP id g65mr2766616jag.91.1610748565435; 
 Fri, 15 Jan 2021 14:09:25 -0800 (PST)
MIME-Version: 1.0
References: <20210110185109.29841-1-space.monkey.delivers@gmail.com>
 <20210110185109.29841-2-space.monkey.delivers@gmail.com>
In-Reply-To: <20210110185109.29841-2-space.monkey.delivers@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Jan 2021 14:08:59 -0800
Message-ID: <CAKmqyKNuRnF8HMwyC8=imA_yx1LCYP+mR71joRZs5DGJtnP-nw@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] [RISCV_PM] Add J-extension into RISC-V
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 space.monkey.delivers@gmail.com, 
 Alistair Francis <Alistair.Francis@wdc.com>, kupokupokupopo@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
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
X-List-Received-Date: Fri, 15 Jan 2021 22:09:34 -0000

On Sun, Jan 10, 2021 at 10:51 AM Alexey Baturo <baturo.alexey@gmail.com> wrote:
>
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 6339e84819..d152842e37 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -72,6 +72,7 @@
>  #define RVS RV('S')
>  #define RVU RV('U')
>  #define RVH RV('H')
> +#define RVJ RV('J')
>
>  /* S extension denotes that Supervisor mode exists, however it is possible
>     to have a core that support S mode but does not have an MMU and there
> @@ -285,6 +286,7 @@ struct RISCVCPU {
>          bool ext_s;
>          bool ext_u;
>          bool ext_h;
> +        bool ext_j;
>          bool ext_v;
>          bool ext_counters;
>          bool ext_ifencei;
> --
> 2.20.1
>
>

