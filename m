Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcLMW-00030A-MZ
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 01:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcLMB-0002xM-9p; Mon, 18 Oct 2021 01:38:45 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:40769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcLM9-0004nE-9e; Mon, 18 Oct 2021 01:38:42 -0400
Received: by mail-il1-x135.google.com with SMTP id k3so3277973ilo.7;
 Sun, 17 Oct 2021 22:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JMW3SlNS6TeTS8bYlu9dqbX1aQ5PChdeZZFObjQVjQ4=;
 b=mRFB+wQLGU2b4cVPPOwuyvF88LCBFxW8OYZBkzD8bBSEhazS1U3cAE/SnDJj9Dqbr1
 aJuB5+r1xpW2dRtqOuYcW5hoEF4sShD0Y0Ztz87S7TeC/4LIGuSEtqAZkGCbEX/Tj9Xz
 GDHZ7D+LgtmnQqXDSmfGBRz4PpxO6VAiHRzJSKUWA0Kwr9UrW3gFDcci0KRcEgb9MWBm
 Mw4vv4zdo/oByVz1KxBjC1cgXkERTmQ1+2KJsFjyeUkwOGmqt0RDLGE3cAA3X/i+rTWI
 TuQcU8cgzEQBUizKvHjHn19Em3q1EZxUmKfzlaaEEylEmm5hE3Myh7i32FDVHI07cjKg
 jMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JMW3SlNS6TeTS8bYlu9dqbX1aQ5PChdeZZFObjQVjQ4=;
 b=v8qNUamyBMEMh8GBYnkeIVSxI/uD9RJjGXB0/MEjfTuJ7d2h4TXS7MsJ6CER6GUfjI
 AR393NVS+5q5Y9YM5y1adO1ZZhpau+/cmxk5BuxH0Dq0kB/VZ/gZ+0Cq4pL6+xKuQ/Lf
 D/ik2LIUAFXCzGtzDjNCfMrPvqM15N4YYilEsXSusUTt3e0d1S0mcXbS3ujEWgUzqtHC
 JPQ9QaQRmno8PH0D3zjyutAQb9kkLF35kcYgU4kIHjzqnuLnwy1z0JByweRJ8OljUSuc
 E2IuPWJfmGaRCqujDRBVlFmidoZDFSzrLFngCq3UZ2wEtJUUWqdHbuJQXqLW3j5tRGdL
 suRg==
X-Gm-Message-State: AOAM532tyX5usZiBOEQ2tSgqmXcnwOFwd+3LljTuYL2Sg4qNEWw+DIUb
 rTsDD0Ijkurt9sAaTSLrbGkbGx+7vsQXTAad5YE=
X-Google-Smtp-Source: ABdhPJwuZB/Vbis8sgmSJr//sJbZsdXiybBJpiGmep0kxlCOfFkTBem9ddyw/0kI6pohygkh3Tl83Dz4ny/KwwRRsB0=
X-Received: by 2002:a05:6e02:1402:: with SMTP id
 n2mr13086839ilo.208.1634535519146; 
 Sun, 17 Oct 2021 22:38:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211016171412.3163784-1-richard.henderson@linaro.org>
 <20211016171412.3163784-15-richard.henderson@linaro.org>
 <CAKmqyKOZd-gtes+_sQ=ndjqu9nfujE_Kc==Jueno+ds6Pg7neQ@mail.gmail.com>
 <a9a1b623-0420-6285-0ad8-cf152a4e0397@linaro.org>
In-Reply-To: <a9a1b623-0420-6285-0ad8-cf152a4e0397@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Oct 2021 15:38:12 +1000
Message-ID: <CAKmqyKOQ5UQgY0z2B5H+e5ra_cWz_JZKjtEmnm5er5gs7wWtQw@mail.gmail.com>
Subject: Re: [PATCH v3 14/14] target/riscv: Compute mstatus.sd on demand
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>, 
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>, 
 liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x135.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 05:38:53 -0000

On Mon, Oct 18, 2021 at 3:31 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/17/21 9:52 PM, Alistair Francis wrote:
> > On Sun, Oct 17, 2021 at 3:32 AM Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> The position of this read-only field is dependent on the
> >> current cpu width.  Rather than having to compute that
> >> difference in many places, compute it only on read.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >
> > This means that the value reported by riscv_cpu_dump_state() and GDB
> > will both be incorrect though?
>
> Yep.  Missed those; should have added another accessor.

Do we get much of an advantage from this though? To me it seems
confusing that the mstatus register doesn't actually contain the
latest value (for example when debugging QEMU and adding my own
printf's).

>
> Also, for the record, it changes the vmstate, but since a previous patch in the series
> bumped the version number for the split on misa, we can call all of a piece and ok.

Works for me :)

Alistair

>
>
> r~

