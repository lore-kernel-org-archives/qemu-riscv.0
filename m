Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oDFUd-0000Wc-B5
	for mharc-qemu-riscv@gnu.org; Sun, 17 Jul 2022 21:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oDFUb-0000TF-I0; Sun, 17 Jul 2022 21:24:13 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:41941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oDFUa-0004qi-1w; Sun, 17 Jul 2022 21:24:13 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 o31-20020a17090a0a2200b001ef7bd037bbso11258194pjo.0; 
 Sun, 17 Jul 2022 18:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tWgNNwXM3G9VRblsenqCUfOOUktPXhDxtNTgmCngUxs=;
 b=aUm4wnsDyYaTWr6DxaXmypooAJZ8M8XrBBTcXSqO074q7VDimSEZ7nUPrgjh+dabKg
 zYDMWZeUqfX2KP6Dxa1f9dTIt9na2bbJ+S8R0ZEj5GFsd/40SaLu2pjCG5Iu4oGy4J0E
 +kuMOrSFox4WsFCDBpwUAh1KGNmz8XZZuFdMVRi1n3sqH9cMwmcqDY94oEFfloJFJnDJ
 2ReR6KHIAOw2kGXCoIRFtUv8QhdQOtNGZzeJ7EVBHJo0VKt18So42y1ot2/M2V3xMq7C
 kzSeHH6L8V2XNFve3mKW3XfCpPHBImju2NhAtmGQk9VqwEqmfMGgfrxeYtEqfbvZztb1
 6tUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tWgNNwXM3G9VRblsenqCUfOOUktPXhDxtNTgmCngUxs=;
 b=6aAhpO4amlZ6/mZJfll7/8WiSg7x26RC1sWSGxGOWWBpEB7rBhW6O2OlDvp5V2gX0H
 IGK2egfxS4j/oTNMpIkoNEJxm4yO3z7TKm/w9qgPHFJt3jwLla3KTwCEIIpwMP5VTLZg
 kvUrRzlR3+QXQdwSgSjy1mmW0RU+3fkqeKse9/ARUlmKiymLV7VkpNVidfFo/DLpr7ir
 XFTuLKgQNNKrykC+utJykzlWXO161nJHwTD0/NiMs4Eyto1o40jyMkJS9KiOSFrXSyz5
 D64/jD3NKb4Fagu1hB2wZNX9XTx9PWKWi0mux6E7nstP7VJbjwTcyRggu67FIyBEv/x6
 AVEw==
X-Gm-Message-State: AJIora9I2r0UepUcv4LTaW7kLBEE1AE+djrGnX+7FdakHbv7pfjkL1V/
 m0ayPXB1SHXjqpoDRKwzygYUzVV1z1aQegh1r2s=
X-Google-Smtp-Source: AGRyM1vfbvLvPshGHVuzdlrA+hLmiWQDKZV8ChyKQhb0JfC2oXi5O2h3twmN9i5xsYOXWL3nKPt4uPIXETBpYQi1KPo=
X-Received: by 2002:a17:90b:2096:b0:1f0:1c73:f62d with SMTP id
 hb22-20020a17090b209600b001f01c73f62dmr29085422pjb.120.1658107450154; Sun, 17
 Jul 2022 18:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220620231603.2547260-1-atishp@rivosinc.com>
 <20220620231603.2547260-9-atishp@rivosinc.com>
 <8991819.NyiUUSuA9g@diego>
In-Reply-To: <8991819.NyiUUSuA9g@diego>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Jul 2022 11:23:44 +1000
Message-ID: <CAKmqyKMpZSS+LbP2nYjc_gjNOq=DJCbHHMAaFJ8VgeOxX5Bsjw@mail.gmail.com>
Subject: Re: [PATCH v10 08/12] target/riscv: Add sscofpmf extension support
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atishp@rivosinc.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Frank Chang <frank.chang@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1033.google.com
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
X-List-Received-Date: Mon, 18 Jul 2022 01:24:13 -0000

On Thu, Jul 14, 2022 at 7:54 PM Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Am Dienstag, 21. Juni 2022, 01:15:58 CEST schrieb Atish Patra:
> > The Sscofpmf ('Ss' for Privileged arch and Supervisor-level extensions,
> > and 'cofpmf' for Count OverFlow and Privilege Mode Filtering)
> > extension allows the perf to handle overflow interrupts and filtering
> > support. This patch provides a framework for programmable
> > counters to leverage the extension. As the extension doesn't have any
> > provision for the overflow bit for fixed counters, the fixed events
> > can also be monitoring using programmable counters. The underlying
> > counters for cycle and instruction counters are always running. Thus,
> > a separate timer device is programmed to handle the overflow.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
>
> it looks like patches 1-7 already landed in Qemu though I didn't
> see any "applied" messages, so it took me a bit to realize that :-) .

Argh, sorry! I must have forgotten to mention that.

Alistair

>
>
> In any case, I ran Atish's sample from the cover-letter with a matching
> kernel nad got similar results as shown in the cover-letter.
>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
>
>
>

