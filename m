Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOg2f-0000qv-Gm
	for mharc-qemu-riscv@gnu.org; Thu, 18 Aug 2022 09:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOg2b-0000pe-3O
 for qemu-riscv@nongnu.org; Thu, 18 Aug 2022 09:58:33 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:43592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOg2Y-0003NJ-MZ
 for qemu-riscv@nongnu.org; Thu, 18 Aug 2022 09:58:32 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-333a4a5d495so42830937b3.10
 for <qemu-riscv@nongnu.org>; Thu, 18 Aug 2022 06:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=K+oQRARp+LdRbAs7eqfv3Fp0hIjLfgJsS5qaaREhmiU=;
 b=WkuSHMbarOinWGYjJK/Rbo9p2y1IngEOg+5psSoxstdfMnUxXkOrfTKxcETgAezU+l
 3qsAk6xIP1NcuUcv3OF6DVwHqdY5XFq/VvWOBT9lV5rRIQ148gClnnnCErxZgyT6lZT8
 XhM68CNKskV1tX+QyfmQddiUjf5AYVe9+SKWM+ngKLy0O3q3ehIkzVzwTydBcfWsdTjh
 5wtXZ3e9Z+1Du3v9SDjS90JAIDv3U/lQMOx7nul8huf38cRahiiXUxt1pa//tsPErhZ7
 0dNekBncUWOTZ4vjrvP5GLkijl5HQfUV88NKqTZEV72BMoxb4KF2iYpoESqFjJIMehc/
 CxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=K+oQRARp+LdRbAs7eqfv3Fp0hIjLfgJsS5qaaREhmiU=;
 b=lRLbl/4bVXHsuxXKTm3pzcoMnpwa0W9jxdL/3a2YjoRkvuBqegjdQfKp8zeq9pxIBH
 DkGckg+t/x4e69KaASM4w5fyspkfEyk8WkhRlyznjaWKmzkNQuLeg3EPkucWdAkvQGye
 B/5Z45+W53wv1wtO1CMlORxaa+DaxKD2y0LzYXqQgZmpNxY1ou8VpOQ1Q66FzZOEbTzs
 4xRt6vEnkgJ5atLXHWysI7FP0QOqjUS66kV5T4FHrOhHTIiixA4zh6q+1AzYJo9g2E3P
 II084tLPOaCGQAqnLgVw8TyjPcet8Lap4Ht1KJIzzBQ9MoBXlIsTj6R4Qme+SfKXLNEy
 gSKA==
X-Gm-Message-State: ACgBeo0buyB3Ca1vhQ3vPtCZuX8YafN9tkH87MJaTQ77JVgtAXBVW8jM
 beQ9VpsXLEzgre1+c/Jh2wNcfXhz+X6JjNuAsohhEg==
X-Google-Smtp-Source: AA6agR7BwlwXB/p7jRZYlTmTsiOP0DfSPfc1H+XePIRreW5O0LfQttXkyv2Hi7pn3dC5rofCN2aiQinLbZ34OjvcPqw=
X-Received: by 2002:a25:4288:0:b0:692:8c1e:2e7e with SMTP id
 p130-20020a254288000000b006928c1e2e7emr3073092yba.479.1660831109575; Thu, 18
 Aug 2022 06:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
 <20220815190303.2061559-8-peter.maydell@linaro.org>
 <CAKmqyKNo15Kz6-FtXL3C2wC7+aHHLTyGG5tOKQTpnM-c-kJO=w@mail.gmail.com>
In-Reply-To: <CAKmqyKNo15Kz6-FtXL3C2wC7+aHHLTyGG5tOKQTpnM-c-kJO=w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Aug 2022 14:57:48 +0100
Message-ID: <CAFEAcA8wbST5bc_ZMFGAsFKGyFTkYRazeEqPnwh0aL6cNp0CeQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] target/riscv: Honour -semihosting-config userspace=on
 and enable=on
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Furquan Shaikh <furquan@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 18 Aug 2022 13:58:33 -0000

On Thu, 18 Aug 2022 at 05:20, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Aug 16, 2022 at 5:11 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > The riscv target incorrectly enabled semihosting always, whether the
> > user asked for it or not.  Call semihosting_enabled() passing the
> > correct value to the is_userspace argument, which fixes this and also
> > handles the userspace=on argument.
> >
> > Note that this is a behaviour change: we used to default to
> > semihosting being enabled, and now the user must pass
> > "-semihosting-config enable=on" if they want it.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> I agree with Richard that a check in translate would be better, but
> this is also an improvement on the broken implementation we have now

Do you have an opinion on whether there are likely to be many
users who are using riscv semihosting without explicitly enabling it
on the command line ?

-- PMM

