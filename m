Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nwnC9-0007d2-Sw
	for mharc-qemu-riscv@gnu.org; Thu, 02 Jun 2022 11:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nwnC7-0007XF-TO
 for qemu-riscv@nongnu.org; Thu, 02 Jun 2022 11:57:07 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nwnC6-0007HX-Ag
 for qemu-riscv@nongnu.org; Thu, 02 Jun 2022 11:57:07 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x17so7016623wrg.6
 for <qemu-riscv@nongnu.org>; Thu, 02 Jun 2022 08:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MM3mMEivldLecO+UU0mDd8XMP8uEMTo0FCOozFyR/Lg=;
 b=COh3eGwS0aEHuRliFsF6AY5NEfn34uRiOsoJR4NtIOdJLaQzja95ZhhmcByf3PRXwq
 pLlt+eiSN5jxz/ZYVrfx72oFk43YzKA58oU0XTTnWJRLHGZeoSGGwr3yn/RV23BwCnzl
 INJALvytLO1tOFV+PInA6v+Q06r5t8ZiE7vgyU0EWNGNhtJIgatgbO2XQVjqMCNq092R
 9k3/jxZvY+qwzLhHpringgZf+1LG7fMGT+EM9/GAdOL1UpW0T8X4dek1/qKwVHnMx/BZ
 h5MD7TogDIIJF05Z7pYMLsm1DXhsaJMe2nNgo8q9Je+igtp+Z/MaiRNkUIwEAVBkO7+3
 T8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MM3mMEivldLecO+UU0mDd8XMP8uEMTo0FCOozFyR/Lg=;
 b=4dAe6WLXAn6amZcqYprZuSNULHoRFYOgW/xp+NaHn6vnqg3mvX4i97GGmGWZ1nvmdj
 aldGyOZ7D1GEg9oy6onb08PFGW70R9O2vMj5R5NWUyV/zvbNVKCh8wWMrdgiZ3Jy8Hy/
 iKxaAtpag/WZ6sFUeyRszmm1ymO02hNlfgpwF6TcoK/eeF0sEpgzM6gxIW2EH+Sa5+LE
 bIwDidV3wOFjXWbdG9FCEDpmxxtSnj9bcZlf28QCxDKKMJ1YSTLi/oM9QnsiKcuI4PgU
 Pf9SI8dIQoDyN3n+D986Q+nXafyWlA5Iwn7humZsOzjO02D5oq3y2dM+S8r2ah/gW63F
 om5Q==
X-Gm-Message-State: AOAM533sgERqiqsuIJKHwvXF2RTJ54L7Shk9/U/7E8mm6BK47tGgGCMN
 TSojHN+1FmTUaB0FxQ+d3PqlIMQNRegfqN4Yya7pew==
X-Google-Smtp-Source: ABdhPJzEU7RHvLmAXZcJx45FW8jlYOhvqw1Dw2G7Bz/adOh5gPNrqDmpcmZTAOiSJY9e1BYXAbc50SfDwyQrlWibeUM=
X-Received: by 2002:a5d:5942:0:b0:210:131c:a81 with SMTP id
 e2-20020a5d5942000000b00210131c0a81mr4276490wri.306.1654185424084; Thu, 02
 Jun 2022 08:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220602134017.155357-1-cmuellner@gcc.gnu.org>
 <1b930ae7-7e7d-b8f5-5202-2242abe994de@linaro.org>
In-Reply-To: <1b930ae7-7e7d-b8f5-5202-2242abe994de@linaro.org>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Thu, 2 Jun 2022 17:56:52 +0200
Message-ID: <CAAeLtUCpqcH9r9gk62+uPhVg+VJUnY2ymARXX3jDewomX7ukSg@mail.gmail.com>
Subject: Re: [RFC PATCH v2] RISC-V: Add Zawrs ISA extension support
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Christoph Muellner <cmuellner@gcc.gnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Aaron Durbin <adurbin@rivosinc.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 02 Jun 2022 15:57:08 -0000

On Thu, 2 Jun 2022 at 17:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/2/22 06:40, Christoph Muellner wrote:
> > diff --git a/target/riscv/insn_trans/trans_rvzawrs.c.inc b/target/riscv/insn_trans/trans_rvzawrs.c.inc
> > new file mode 100644
> > index 0000000000..38b71d0085
> > --- /dev/null
> > +++ b/target/riscv/insn_trans/trans_rvzawrs.c.inc
>
> Typo in the filename -- s/rvz/rz/.

z = standard extension
a = atomics family
wrs = extension name

The full extension name indeed is Zawrs (see also
https://wiki.riscv.org/display/HOME/Specification+Status).

> > +#define REQUIRE_ZAWRS(ctx) do {         \
> > +    if (!ctx->cfg_ptr->ext_zawrs) {     \
> > +        return false;                   \
> > +    }                                   \
> > +} while (0)
> > +
> > +static bool trans_wrs(DisasContext *ctx, arg_sfence_vm *a)
> > +{
> > +    REQUIRE_ZAWRS(ctx);
>
> No point in the macro for what will only ever be a single user.
>
> Otherwise, the implementation looks correct.
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~

