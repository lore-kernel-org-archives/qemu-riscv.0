Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oNLiY-0002qe-Vp
	for mharc-qemu-riscv@gnu.org; Sun, 14 Aug 2022 18:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oNLiX-0002pg-IJ; Sun, 14 Aug 2022 18:04:21 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:39441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oNLiW-00071y-3W; Sun, 14 Aug 2022 18:04:21 -0400
Received: by mail-pg1-x530.google.com with SMTP id q16so5167981pgq.6;
 Sun, 14 Aug 2022 15:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=4WfhNVhg/3o92hdrwCSbq1sqzxV8oKxnricLFRZ13fU=;
 b=lUC2xhka8OxPOofGquGkmZTU0yDfixxRuMz95FtogAIUFlAcxINXLJD3HsT8nVE5yF
 9DOrLF5XWdP7eOoUVDUoCpaxKp8/MAykabm4MUBwv+dzIfQLzxpi9NxGiQBujVBwnOPR
 HsDQa2hCACdPzadZWHlHZsvfDBU0sjoaC6M3wKdgwKEdwICxo/sBvvrwbd4i5XYhoMJw
 7BIKTEq7HUtuhE0N6cKXmei/DxrsnVoi0P701n950J+v0UUDV5KU6ZyBvfzZl87MvG3b
 PE9VzTmz35VuZf/UYosm2WgRxVUofxtVUj1Je3AtHYEh6ct1RRE4ovaWX7mV+d5Zx9Ve
 +Vyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=4WfhNVhg/3o92hdrwCSbq1sqzxV8oKxnricLFRZ13fU=;
 b=mqGdq1Ba0fp1vnAK0Gn0xCZmFOHQrZ98pV12Sa17lisKDdipNAFZWtRoKSomHhH7uy
 GkRveY8mEHHV6jAyLAxjkBpDL6Uc/nfLoHn75lyYmCZLm1/1Aygg8T4gUWp9mLxy4HY5
 fV7Ez0Hjid2o6OPYdoEyJFlIY+JYZ1j09dNMvQlL8oWQCvFsnMzs/ZKz8Ouje62Q/r3S
 GG+MvjfY5Vk+t+0fBB3+kmp4sqzXjSStHINguJVSOWxhPgneF16PBMI9YPr6hfIkLnDo
 p0TEKY90sJ6xr6AxW6Y910fUWx/RFdZzyCaSrW2xzux2pEWNUDijeDXD5wTxYJexzWMn
 mAtg==
X-Gm-Message-State: ACgBeo3JVN2JEuHh6yRKLWMu6MnT+eqQWpPp3tE5CsB/B4Ldmu2cA9OT
 yTPa9vHHNoZQfzmh1j6BRuX+5mvSxQ6Wm721gz0=
X-Google-Smtp-Source: AA6agR44Qnl88gPRH4e8ML1zH2qYqKzg8Db/lTNmUvscmGemZxZfpS0DjKmTg3w2gEUKhwohdVhyu1neb2jChvdeEi4=
X-Received: by 2002:a05:6a00:4306:b0:52e:3bdc:2635 with SMTP id
 cb6-20020a056a00430600b0052e3bdc2635mr13561642pfb.79.1660514658406; Sun, 14
 Aug 2022 15:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <CA+tJHD7FcrBTetGRO0vZn-XGPmZmQraMrw1dw9ia6jzHQniB0w@mail.gmail.com>
 <37244ef8-d2f1-038a-8a51-01d9f62fbe2c@linaro.org>
 <f977101c-bdc0-3b24-5fad-a75b07b5dac7@linaro.org>
 <CA+tJHD4MC9xjVkDAg6QZ3Yq2L-cKDQkofQyGjX67cD_qxbCf1g@mail.gmail.com>
 <804cd7cd-e83c-2b89-f2ba-cc2ca5c7f835@linaro.org>
 <CA+tJHD6gNrtcrZ9bkDet8NuiR8mcSQfeN-Rk3dtm3LmeakKnvQ@mail.gmail.com>
 <CAFEAcA--QMVgw0ZH6S3=jHsazM-AJQX45Hm+aJ+EhDhDrzNubA@mail.gmail.com>
In-Reply-To: <CAFEAcA--QMVgw0ZH6S3=jHsazM-AJQX45Hm+aJ+EhDhDrzNubA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Aug 2022 08:03:52 +1000
Message-ID: <CAKmqyKPcr=umn4zUpxNFwBJ8MuuRkdwH5KpDgDiHHn8YMiaj4g@mail.gmail.com>
Subject: Re: [PATCH] riscv: Make semihosting configurable for all privilege
 modes
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Furquan Shaikh <furquan@rivosinc.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sun, 14 Aug 2022 22:04:21 -0000

On Sat, Aug 13, 2022 at 8:20 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 13 Aug 2022 at 01:53, Furquan Shaikh <furquan@rivosinc.com> wrote:
> > I ran into a problem when I was testing a project (with a microkernel
> > in M-mode and tasks in U-mode) that uses semihosting for debugging.
> > The semihosting worked fine for M-mode but not in U-mode. As I started
> > digging into this, I realized that this is because qemu restricts
> > semihosting to only M and S modes.
>
> Right. We should fix this by having a generic works-for-all-architectures
> semihosting config knob, because this is not a riscv specific problem,
> and we already have issues with different target architectures
> developing their own solutions to things.

I agree with Peter here. I don't see a strong use case for a RISC-V
specific fine grained control. A user can either enable/disable
semihosting for privilege or usermodes (with Peter's patchset). That
seems like enough configuration options, it is unlikely that someone
will need semihosting only available to S-mode for example.

Alistair

>
> I'll see if I can dig out the half-done patchset I had for this.
>
> thanks
> -- PMM
>

