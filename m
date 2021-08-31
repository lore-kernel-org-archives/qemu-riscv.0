Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKrWm-0005BL-LA
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 20:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKrWi-0005A4-D3; Mon, 30 Aug 2021 20:21:20 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:44781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKrWg-00068i-Mp; Mon, 30 Aug 2021 20:21:20 -0400
Received: by mail-io1-xd34.google.com with SMTP id g9so22518581ioq.11;
 Mon, 30 Aug 2021 17:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jguf6lXASw0mGI28NY2MtOD2FBLW++xf+xDtvzCMPs4=;
 b=nleswV2wfc8A/CYL6uHimYwUaiej16mvkDzOxV8kGI1XGL2ytBFO8XVF4rF1SKLkRQ
 2KL023E5B8o1oS2VuJDEhc8TZ1HIefwDSILkJ461SVL8T3c0Pvd5Bm51sGVmlB9ETyvn
 azINYGFEIxroar+UfWQH3W41mJAGL1/P8uAW48Ih6yjog4yLojHUB0LDhW9q3XIn4sC5
 TsCQVeaWaVYvwYoEl7W9Q7nLNSBxLSN5s+PRGq/AU3q84S5pzgP6yV53U+GnHtjodVEI
 05ZA2qZZU5/3Gw7XY1XyEV7ow0TVLOCNmNads+muzYkvPbk37jLrwhfSn8YZnLHC5Lci
 dhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jguf6lXASw0mGI28NY2MtOD2FBLW++xf+xDtvzCMPs4=;
 b=BrbiFcitPFrdtOJgaq8L65Km9RJErDLY5qfny9+XKppr8QE8r38UlPjnpivh0k5oNo
 Xl3LPpiaoLFCCFCdL+Xkr43XCkS6HqfxMGQVb+wDeWgRwmMwtKBMhFmuhAAJGl6GCkVP
 i8xLExmShfuYlsuD0Fumzl22I9FyKl0dTFH+NLDr6CqGbCI4TcfSI1tphBCusiqGuq/u
 17GDlr17/2EwdUbK8FYh6F1ugSd8VgU6bcqiWNENpTQc6OJSHENEqhwoHEOPUyCiOxmW
 xddeDhJ/cnxxe01z9qAboFHPUbyF4QG/ofmiJmpU+IQlcqnvS/bQOmmeI1rla4jMNO1f
 1mGw==
X-Gm-Message-State: AOAM532jG0dx4jfHLeRFoObaV6uBrP4DCxVSM0v/1Hk9rgxr9AVHMRzI
 EsBWTeEULldYC6Zj6PCLuswGKcYcyYU5zbWF/Ug=
X-Google-Smtp-Source: ABdhPJwlcfAgtDf3HmXA69flzT5e0vkNxSbyl27s6MFAMFTlEbx/I2wwN5/nxbN/f/b42T0KYG1Iys5s2NrscaWf2jA=
X-Received: by 2002:a6b:8e87:: with SMTP id
 q129mr20667646iod.176.1630369277078; 
 Mon, 30 Aug 2021 17:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210820174257.548286-1-richard.henderson@linaro.org>
 <CAKmqyKM7aoT9a7rZnbNukZb7mO-2zJddnKr1XkA+WbkidHRoxQ@mail.gmail.com>
 <92c46154-0260-bdf8-b5f2-e37e8f009625@linaro.org>
In-Reply-To: <92c46154-0260-bdf8-b5f2-e37e8f009625@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 31 Aug 2021 10:20:50 +1000
Message-ID: <CAKmqyKOYssuWwhBaX=_pstW=5mwp_56vKp1EQsJhDD7V2_aiKg@mail.gmail.com>
Subject: Re: [PATCH v4 00/21] target/riscv: Use tcg_constant_*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>
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
X-List-Received-Date: Tue, 31 Aug 2021 00:21:20 -0000

On Tue, Aug 31, 2021 at 1:27 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/30/21 3:12 AM, Alistair Francis wrote:
> > On Sat, Aug 21, 2021 at 3:43 AM Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Replace use of tcg_const_*, which makes a copy into a temp which must
> >> be freed, with direct use of the constant.  Reorg handling of $zero,
> >> with different accessors for source and destination.  Reorg handling
> >> of csrs, passing the actual write_mask instead of a regno.  Use more
> >> helpers for RVH expansion.
> >>
> >> Patches lacking review:
> >>    02-tests-tcg-riscv64-Add-test-for-division.patch
> >>    03-target-riscv-Clean-up-division-helpers.patch
> >>    11-target-riscv-Add-DisasExtend-to-gen_unary.patch
> >>    17-target-riscv-Use-gen_shift_imm_fn-for-slli_uw.patch
> >>    21-target-riscv-Use-get-dest-_gpr-for-RVV.patch
> >
> > This should be all reviewed now. Do you want me to take it or do you plan on it?
>
> Please take it through the riscv tree.  Thanks for the review.

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>
> r~

