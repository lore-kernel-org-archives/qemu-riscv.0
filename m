Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mJdB6-0006Xa-V7
	for mharc-qemu-riscv@gnu.org; Fri, 27 Aug 2021 10:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changbin.du@gmail.com>)
 id 1mJdB4-0006Ug-Tz; Fri, 27 Aug 2021 10:49:54 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:33416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <changbin.du@gmail.com>)
 id 1mJdB3-0007rF-Eh; Fri, 27 Aug 2021 10:49:54 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 28-20020a17090a031cb0290178dcd8a4d1so8113086pje.0; 
 Fri, 27 Aug 2021 07:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=24N70ZjeXbgKAd1zuT2PuFCWvpgHs1+vlOADzxre9+U=;
 b=TafBRGC5NI/z6jWDRRSgCsBEPBCfDQ4UXDkUypkF6ceEHWx3Cw/wowc3PB7nFz8rmW
 rZKjOOl8BFKPz6dXbPOs8t+B3FF4u9DEuavuThTDxMPMwzdsqFKFHA9UP8DT2c/C56Wv
 GDV1nlMZ7ldi0wmjnR0wbbZvwny6/aMPiSIZiHc7sclSQBNbJoax+RPtmaOqsgR/gel9
 SZ7S0iKYm0DNZR8tfOlnleCB2jKPpfsRsycszMtnWF5/j+97aRww3GKx5ypEWjjjfKIW
 TOrkcQov2wZCOfQCqRtk1oSFJ0DZ2JZ9s4wKCo251PIp1rLRqLWgMdFPpAH74ME6k1nx
 EzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=24N70ZjeXbgKAd1zuT2PuFCWvpgHs1+vlOADzxre9+U=;
 b=RxiXrxty5wsTTfgdT07d7ayfGRWAMBR4TIvfbplTEfGQKWytrHDt5eW8v4LmikEYF8
 6YwKyd4MQJD6orFUlxZzGgeb4wL5olRhZh1AXPtH4ttKQSjl7pnWC6jLc/hODmZdIgYj
 2Xh2pyOpjwLXcfiFU3gdbmotB7hyQWAIrhnpJR0w+PcNqjCYfgtQt3JivplmQfuNu2gA
 kVX1UrDoi1dtF5RcPrxTd45gPg+7U2kZwF9nOEhUjtK+iOM0hSBn33EeH5B7Ls+BFQRj
 +XxgRqoZuq+bJWOGLC0sdx7fjzNOTVMUtG1Dz7683vsin58ISb5qZwHP0KC2QPDXkMDG
 vbnw==
X-Gm-Message-State: AOAM530SqbSgpJa+8hsGXv4xRM8RwAbZQvm0Mj8BvfkJAq507/sIMmZM
 lVPlPwi+MX8ZrOp6mqorbmY=
X-Google-Smtp-Source: ABdhPJzyS2gveH4W+88AdNbbDi9Pi5ymyA9oh0Wq1VsS+GBL6f8tS5WWWoR5tlQC7LZMkoWEUSHC8A==
X-Received: by 2002:a17:90a:a087:: with SMTP id
 r7mr23577863pjp.84.1630075790976; 
 Fri, 27 Aug 2021 07:49:50 -0700 (PDT)
Received: from mail.google.com ([141.164.41.4])
 by smtp.gmail.com with ESMTPSA id c133sm6780054pfb.39.2021.08.27.07.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 07:49:50 -0700 (PDT)
Date: Fri, 27 Aug 2021 22:49:38 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Changbin Du <changbin.du@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH 0/3] gdbstub: add support for switchable endianness
Message-ID: <20210827144938.72astzvxxy3igpn4@mail.google.com>
References: <20210823142004.17935-1-changbin.du@gmail.com>
 <7523c6ad-52cd-0b20-b09d-01bd537edbb3@redhat.com>
 <CAFEAcA8WKdZiuzjXgwj_9T7ewDbkLky+_NKaXw6WQ95V8x=0Tw@mail.gmail.com>
 <20210823230535.js3gymomh2chmznc@mail.google.com>
 <CAFEAcA8DR4UuZi-QAqMr82tL+S3Y8bEQn7q0W7iCjQCsFRis1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8DR4UuZi-QAqMr82tL+S3Y8bEQn7q0W7iCjQCsFRis1Q@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=changbin.du@gmail.com; helo=mail-pj1-x102c.google.com
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
X-List-Received-Date: Fri, 27 Aug 2021 14:49:55 -0000

On Tue, Aug 24, 2021 at 10:11:14AM +0100, Peter Maydell wrote:
> On Tue, 24 Aug 2021 at 00:05, Changbin Du <changbin.du@gmail.com> wrote:
> >
> > On Mon, Aug 23, 2021 at 04:30:05PM +0100, Peter Maydell wrote:
> > > changes to be more capable of handling dynamic target changes
> > > (this would also help with eg debugging across 32<->64 bit switches);
> > > as I understand it that gdb work would be pretty significant,
> > > and at least for aarch64 pretty much nobody cares about
> > > big-endian, so nobody's got round to doing it yet.
> > >
> > Mostly we do not care dynamic target changes because nearly all OS will setup
> > endianness mode by its first instruction. And dynamic changes for gdb is hard
> > since the byte order of debugging info in elf is fixed. And currently the GDB
> > remote protocol does not support querying endianness info from remote.
> >
> > So usually we needn't change byte order during a debug session, but we just want
> > the qemu gdbstub can send data in and handle data it received in right byte order.
> > This patch does this work with the help of users via the option 'endianness='.
> 
> I'm not a huge fan of putting in workarounds that deal with the
> problem for specific cases and require users to tweak options settings,
> rather than solving the problem in a more general way that would
> let it all Just Work for all cases.
>
Probably we can add a new callback 'gdb_get_endianness' for CPUClass, and use
this callback to determine if bswap is needed every time we read/write cpu
registers. What's your thought?

> -- PMM

-- 
Cheers,
Changbin Du

