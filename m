Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOqIg-0007MM-Jc
	for mharc-qemu-riscv@gnu.org; Thu, 18 Aug 2022 20:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oOqIc-0007JM-Fa; Thu, 18 Aug 2022 20:55:46 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:51734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oOqIb-00080P-1M; Thu, 18 Aug 2022 20:55:46 -0400
Received: by mail-pj1-x1032.google.com with SMTP id e19so2025298pju.1;
 Thu, 18 Aug 2022 17:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=ViX3w7UOMsABbI67Wt+CgaM/srhs7+VZppuRgGVKGAQ=;
 b=Rjz8Qp7DYrrgrChIfsPnmP4FzQTgbMHsumx8+W7DUWkYU8hmlUBtzAkNawxwIthg83
 qI7vLk3HMUdes7XmBSdh7NPnOZgNgcq95LoM6Divf4S8rWKGdTuky6k8XayX8eYDmjVv
 84rmlIMb2UaEUsA3s1pl0Paa1bPsUF8HythHmcGRlT5O2868zugHNJs2bpVTje+jl24w
 xmX9NlTdzb+7HlflhlU+9cwE+yU0Wl2XTVkaWVz4/bcVfcs9XuiddP/VPA+gYGu7Qo40
 0H8CyNDHx2zNNEU2q082Lu55kRCqgZhCMC0h6ELYdXsh/X8Ja1xqm6SLK8nu/T+/GsN5
 dMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=ViX3w7UOMsABbI67Wt+CgaM/srhs7+VZppuRgGVKGAQ=;
 b=D98lPHhHs6HlsGeKjy+3rPJhRyGiwRUKABFkEmYKH14QdBAvUm83fbdVidcVx69ciB
 55XvZbZOBfx2hbEcGUBWwm4vB6qSd6+ibuHf5Yu40HoLrQ+hijqtE0YImE8cwWaGRvK+
 nBrO2d1AY8VCW05+UUzO16n48Nnb939FAOV/xAImeu6M/8InDReBAF1TJWYQd3QjqyUy
 m/fpA9BjtVNHgmFX42w1JtwrgNr6upsKmTUukxVBEVMWvwzAqBS4M4ljn9kok++k/Ro6
 XE710i0+bU9/50jUKCvRM8c7+zVc7N40ZA6kasDvhrkbzGfTsQwzq+wGHh5oZPmTSgY9
 Vlbg==
X-Gm-Message-State: ACgBeo3VU8riOcHiOAH/NLAI5j4nrZmZf9nAxhpbiRV3eRpGCXxXzy7N
 WCPtcUpID8xU8lgUIM2KVRW/tZORxWjIaG9tc78=
X-Google-Smtp-Source: AA6agR4YoZpq77rtbvKyOhoUPd89zLND+qeJ1BrNdgUYYkTWyn35UHrB2WIVAzk0Aot0rtYH02+apRaTcTt5XWsEP2I=
X-Received: by 2002:a17:903:2291:b0:16e:cf55:5c72 with SMTP id
 b17-20020a170903229100b0016ecf555c72mr5129254plh.121.1660870540881; Thu, 18
 Aug 2022 17:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
 <20220815190303.2061559-8-peter.maydell@linaro.org>
 <CAKmqyKNo15Kz6-FtXL3C2wC7+aHHLTyGG5tOKQTpnM-c-kJO=w@mail.gmail.com>
 <CAFEAcA8wbST5bc_ZMFGAsFKGyFTkYRazeEqPnwh0aL6cNp0CeQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8wbST5bc_ZMFGAsFKGyFTkYRazeEqPnwh0aL6cNp0CeQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Aug 2022 10:55:14 +1000
Message-ID: <CAKmqyKMqrmrhRDTn11VAa1EKEmy=fzO_d+34Qp+jWYDP0uTd3Q@mail.gmail.com>
Subject: Re: [PATCH 7/7] target/riscv: Honour -semihosting-config userspace=on
 and enable=on
To: Peter Maydell <peter.maydell@linaro.org>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1032.google.com
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
X-List-Received-Date: Fri, 19 Aug 2022 00:55:47 -0000

On Thu, Aug 18, 2022 at 11:58 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 18 Aug 2022 at 05:20, Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Tue, Aug 16, 2022 at 5:11 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > The riscv target incorrectly enabled semihosting always, whether the
> > > user asked for it or not.  Call semihosting_enabled() passing the
> > > correct value to the is_userspace argument, which fixes this and also
> > > handles the userspace=on argument.
> > >
> > > Note that this is a behaviour change: we used to default to
> > > semihosting being enabled, and now the user must pass
> > > "-semihosting-config enable=on" if they want it.
> > >
> > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >
> > I agree with Richard that a check in translate would be better, but
> > this is also an improvement on the broken implementation we have now
>
> Do you have an opinion on whether there are likely to be many
> users who are using riscv semihosting without explicitly enabling it
> on the command line ?

I don't think there are many users. We have always stated that
semihosting had to be enabled via the command line

Alistair

>
> -- PMM

