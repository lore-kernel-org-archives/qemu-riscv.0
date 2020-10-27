Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kXYYB-0004SK-Ck
	for mharc-qemu-riscv@gnu.org; Tue, 27 Oct 2020 19:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXYY9-0004Rp-IF
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2020 19:38:45 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:33922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXYY7-0005u4-O4
 for qemu-riscv@nongnu.org; Tue, 27 Oct 2020 19:38:45 -0400
Received: by mail-ej1-x642.google.com with SMTP id gs25so4679189ejb.1
 for <qemu-riscv@nongnu.org>; Tue, 27 Oct 2020 16:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5kaHV0Pg1L9fG8vBTEC9pxRQfu8xlom6xDAxH6720ng=;
 b=WlZsysPHj16bwCqkztRcvGGc6jMIJw3MO65fLLvBLbCYh/Hk+EhPwscEdJh/eLXqXc
 3lYrfDXvfqKT/qM09Pnoxr/xqXW+32sVeHKAPu838TcO9YrUknggoip7paI+kpxi4AUj
 V/GyObWUoygT/G3PFA5iko6gpfokQyXypzZzMiPoAQNi/qNP1CTikx3IEMaJ0elcoYEb
 tshii2Jg58Gfnnts+gaFKv/+q5wkLDTsJjcsTG+T5T3YYFpAzln8mpshqDizQq9SwTIG
 spHq4XZ/xdqfH35O4KCPQWWDzo6XYYsHAoFHnJmKJRJHmvZHUbE6DkXRn5Ii664P5h6N
 8Y7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5kaHV0Pg1L9fG8vBTEC9pxRQfu8xlom6xDAxH6720ng=;
 b=oT1h9Neo5wOJD0IjQgyh65za0jOJtGrNHZnD7T2O9gD5/s7CGpz91CaUpHRBC9DRly
 Ldj9Bs4fu+P0g/7xrvx9YPhcYtrS5OmXW8Nm0bVf2c7Y3aC+QAisshHq1rQ8Gk7b6Uv6
 dx91sMsVpkzb9+U9/TpnOHmse8iCu5dZl0nTBBfabNqu37tDMpU+qsGJN/EEHopp8ctJ
 qXEl000BcWrupvzcowxcaS34DFJardF+hzN0s+hs5sTNwJEYyPvz+KcNDzkaLWA3zBWa
 EVs2bztxqoIR43zuttO3TG97+JNLmBe95HvaToDqbQ/q/B/mExg+AuXzQlFTFslLOiLS
 FD3Q==
X-Gm-Message-State: AOAM531B4b7WdSiqILFa1I4vXWekjmI2cLaVtiuBUr90D/NSka63L1ie
 Ku2RJcKCXkFczuS50Rq0ruhdfsVd8aOgMw1J/qeJoJwAgSU=
X-Google-Smtp-Source: ABdhPJyzZLlzajYITpFAF3sp5wYGumCP2Hqh0Tb1qdy+EaXYWdqgp359J3YfctqxyaJV0ewSlBJ0RSI8XDTigJg+Xxc=
X-Received: by 2002:a17:906:c7d9:: with SMTP id
 dc25mr4846557ejb.482.1603841921787; 
 Tue, 27 Oct 2020 16:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201026212853.92880-1-keithp@keithp.com>
 <20201026212853.92880-2-keithp@keithp.com>
 <CAFEAcA-0_WLMP1Y1sgcu7Ng+0w8Ovt9DVWzYU8ZA_FA2+bwcUw@mail.gmail.com>
 <87pn53e3ke.fsf@keithp.com>
In-Reply-To: <87pn53e3ke.fsf@keithp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Oct 2020 23:38:30 +0000
Message-ID: <CAFEAcA8Sha5QYbO25dtzBZHoXUeiGVv8aojPFTMrst8nbVDAdg@mail.gmail.com>
Subject: Re: [PATCH 1/4] semihosting: Move ARM semihosting code to shared
 directories
To: Keith Packard <keithp@keithp.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 27 Oct 2020 23:38:45 -0000

On Tue, 27 Oct 2020 at 21:56, Keith Packard <keithp@keithp.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> >> +specific_ss.add(when: 'CONFIG_TCG', if_true: files ('common-semi.c'))
> >
> > I think this adds this file to the compilation for all TCG targets;
> > you only want it for targets which have Arm-semihosting-ABI compatible
> > semihosting. (Various other targets either don't have semihosting
> > or have their own ABI.)
>
> Right. These should have been target-specific source sets so that the
> file was only added to those targets:
>
>         arm_ss.add(when: 'CONFIG_TCG', if_true: files ('common-semi.c'))
>         riscv_ss.add(files('common-semi.c'))
>
> This appears to work in my testing (building arm, risc-v and x86_64
> configs).

I'm not a kconfig expert but it might be preferable to have
a new CONFIG_ for arm-semihosting-ABI which the relevant
targets enable. Somebody else may be able to advise.

thanks
-- PMM

