Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mBpoH-00017k-QB
	for mharc-qemu-riscv@gnu.org; Thu, 05 Aug 2021 22:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mBpoF-000175-Mh; Thu, 05 Aug 2021 22:42:07 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:40957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mBpoE-0001fm-Cf; Thu, 05 Aug 2021 22:42:07 -0400
Received: by mail-yb1-xb33.google.com with SMTP id s48so12545050ybi.7;
 Thu, 05 Aug 2021 19:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bPzzIOoaQGveVzyJhtZod50nH2BTvJRv+3Wi5C3OU+c=;
 b=MZFShYe3dqOLbc2X1oMS+kuvsu9REXVmWE23dx5w08EYxtcYD+fL/yOrHAY+HuMCsL
 Ak6CsW/afPD5vPWAZvxEfK5LKDQ2uWanLEOt6+IDVeG2WPGKcjWW3XMwnmgsSW1Vc4AH
 yTyZKvC185ZDKdejDdS9GRxgKw7Ctclyd9QCTD3yz6TqbAGlgUSjoFHXwS5zxjqiPenH
 7tgE49Sg1kWzR09ANYB+hi6A9j9oQrMmsQ6nQULXzDXgzVFA4Rcj1UfZrnkDAzoJfBbX
 /g0JxPJdYaO6nmGNyfYzNXGCLGI/qbqXbpQkehZCBUOzJNSwNx2l/JEh4qHpd05SFpUm
 MpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bPzzIOoaQGveVzyJhtZod50nH2BTvJRv+3Wi5C3OU+c=;
 b=gyK0Sf8rWnwloNVa6LpYtBRydWqqTCbKTettwaHcZdgFTA+WNwg8Pxgnbs0fMsQOKP
 vKJADotTd6h30de5zZSkXkMpshQBmoQhAQidafXUrCOEfh9zxXdR10EGho20j/rKu8bo
 XxYYLpdsG5nyYd6bIvHZo8NdzH0oeW1muyUIJKgfPffMC4Ca/bev/j5EI23T6u5Vy1Vy
 XwStoRG9SS8LRFzJIQn81uHbFUMAvWjQXN/xkfGU0jKIWEOvFQiv5vsudD6hp07hM9/6
 SBciBZUF2FigEwOGaWmkZjmW0WoCI9O5q7Lc/NoZC23AIBMVyA6Zwr9p4ZHozc1l/QKy
 0FpA==
X-Gm-Message-State: AOAM530u+1LK2vBRTau3mCK2tj3rzgiiKC6rl9VirFO1Csku5jvDU92L
 z4nDE+16vPU2WRIg+C58u+ekI6D2Ro+Y+pR6MgQ=
X-Google-Smtp-Source: ABdhPJwQ0DXcc9qhsHV6r/5lo3rXvxH8zPe5p5lPTD7cA1FNujfNjFxGRcZow3UiUgNUNlupjuK7oEeQzzkualyYdl4=
X-Received: by 2002:a25:cf8a:: with SMTP id
 f132mr10703649ybg.387.1628217724959; 
 Thu, 05 Aug 2021 19:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210805175626.11573-1-ruinland@andestech.com>
 <20210805175626.11573-2-ruinland@andestech.com>
 <CAEUhbmV=owj70jHsmm2N-qKcCOZyH33citKn_4UcbdkoTvZgKg@mail.gmail.com>
In-Reply-To: <CAEUhbmV=owj70jHsmm2N-qKcCOZyH33citKn_4UcbdkoTvZgKg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 6 Aug 2021 10:41:53 +0800
Message-ID: <CAEUhbmWzGTVDkga_76Qm1mhF5K29uzFSVjuEgccm4T++tJ9jyQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 1/4] Add options to config/meson files for custom
 CSR
To: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 wangjunqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>, 
 Dylan Jhong <dylan@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 06 Aug 2021 02:42:08 -0000

On Fri, Aug 6, 2021 at 10:39 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Aug 6, 2021 at 1:57 AM Ruinland Chuan-Tzu Tsai
> <ruinland@andestech.com> wrote:
> >
> > From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
> >
> > Adding option `riscv_custom` to configure script, meson.build and
> > meson_options.txt so as to toggle custom CSR and will-be-upstreamed custom
> > instructions handling logic.
> >
> > Signed-off-by: Dylan Jhong <dylan@andestech.com>
> > ---
> >  configure         | 6 ++++++
> >  meson.build       | 2 ++
> >  meson_options.txt | 2 ++
> >  3 files changed, 10 insertions(+)
> >
>
> This sounds like unnecessary to bring such a config option to the meson level.
>
> I believe a Kconfig option should just be fine.

+Alistair

