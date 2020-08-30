Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kCWrh-0001JY-6N
	for mharc-qemu-riscv@gnu.org; Sun, 30 Aug 2020 19:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kCWrg-0001IH-5L
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2020 19:36:00 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:50555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kCWrd-0005dv-5h
 for qemu-riscv@nongnu.org; Sun, 30 Aug 2020 19:35:59 -0400
Received: by mail-wm1-x342.google.com with SMTP id e17so3662804wme.0
 for <qemu-riscv@nongnu.org>; Sun, 30 Aug 2020 16:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RASHodX0lMfHYt83QbTf2ezLNOxfAhKMutmXcqjpFuQ=;
 b=j8RBtorqaVEsLOmNgpW3EzUGHsToCN3xfe46gSDMurZJGFNEg18k0GvZKdOoScuO0k
 zlYrwS0pah7kXPLGqgfPBRxHOJGPX3hbhsI3IsaXdMIBVLnNEv98mTUVFnReYcAAxGPs
 sMg/fgdjTuC5L4ZV/psfBJMxu1gMdqqaZwLDPxgr1QUuEQZ1by7JTpF3LXNIgls9bR52
 fbo1mee/ZsECNW5HqyQcko3TlbS/htkuGhXweyfG8AEFHcNh24jV/7Uzha0LIsCp77WY
 2j0lJeqJ5X2rWl35Ys3SW/QIPjgsfGETi4kpiHBODBy2jWGW/fLNKVxR38vIVBxqD2wL
 Tfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RASHodX0lMfHYt83QbTf2ezLNOxfAhKMutmXcqjpFuQ=;
 b=MOAjxUO4vQhKenDwrOqb6a3HH0hlHQTmxV0008V8GhuTahtWBhSVqEcXXeIdfqmCIx
 RrimnfOGYA9zyDneVBzADR1seto0zGL2n8xASu/m5NfY5vAxJUodldjfjl0dw59YXcad
 NRSqk6mXkLuWo2LWC8quZW3FSYPf7zLS6ZYAI7Kw8w4FmxPTmZQX9EGWq8xXZzPyEpde
 V0NHo2S7YcX2Cl76mrPSzCcOFpHHK8bSWHclDLxmoRgWULR1ZqwShT4TBeImi5Iclohf
 Osly+pu4oqnKfzj/i8mGOn28dQnX0+7itJSO9T02YYJpGnKPDTa+jJeiJ2NVdF2DoJEQ
 u7ng==
X-Gm-Message-State: AOAM531D5BG4B1Sq25qnl4zDwJp6O42xX8+fvvx0xtBOE3WnrLQhC1xh
 UvdMO3Wx5aiHmYBNf09bkdZHTA==
X-Google-Smtp-Source: ABdhPJxnrUjQW5Yi/f20qAyShWbhd5YUVdj0/CuqpJzH0j7u25Md01wYnJ7zSCsxCVI2pBPRk9H3XQ==
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr342678wmh.177.1598830555254; 
 Sun, 30 Aug 2020 16:35:55 -0700 (PDT)
Received: from vanye ([2001:470:1f09:12f0:b26e:bfff:fea9:f1b8])
 by smtp.gmail.com with ESMTPSA id z6sm9218591wml.41.2020.08.30.16.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2020 16:35:54 -0700 (PDT)
Date: Mon, 31 Aug 2020 00:35:52 +0100
From: Leif Lindholm <leif@nuviainc.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v2 00/16] hw/riscv: Add Microchip PolarFire SoC Icicle
 Kit board support
Message-ID: <20200830233552.GG20124@vanye>
References: <1598714261-8320-1-git-send-email-bmeng.cn@gmail.com>
 <20200830125659.GD20124@vanye>
 <CAEUhbmVYpSVE+C+KyEa2Ono5p-SLtC1vE=YwE_3FJK6POEJCCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmVYpSVE+C+KyEa2Ono5p-SLtC1vE=YwE_3FJK6POEJCCg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=leif@nuviainc.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 30 Aug 2020 23:36:00 -0000

On Mon, Aug 31, 2020 at 06:15:52 +0800, Bin Meng wrote:
> Hi Leif,
> 
> > > The following perepherals are emulated:
> > > - SiFive CLINT
> > > - SiFive PLIC
> > > - PolarFire SoC Multi-Mode UART
> > > - SiFive PDMA
> > > - Cadence eMMC/SDHCI controller
> > > - Cadence Gigabit Ethernet MAC
> > >
> > > The BIOS image used by this machine is hss.bin, aka Hart Software
> > > Services, which can be built from:
> > > https://github.com/polarfire-soc/hart-software-services
> >
> > Are there any version requirements, or additional qemu patches, that
> > need to be taken into account. Should I expect to see output on stdio?
> 
> Thanks for trying!
> 
> Did you apply the patch to skip the DDR memory initialization
> mentioned in this page?
> https://wiki.qemu.org/Documentation/Platforms/RISCV#Microchip_PolarFire_SoC_Icicle_Kit

I did, but in honesty only after I sent the previous email :)
(Since it made no difference, I didn't bother following up.)

> > I tried to build hss 3faaaaf8ce0d, using
> > https://github.com/riscv/riscv-gnu-toolchain (7f1f4ab5b0e0), which
> > ends up being a gcc 10.1. That caused me to raise
> > https://github.com/polarfire-soc/hart-software-services/issues/2.
> 
> Yes, GCC 10 does not build is a known issue. Currently I am using GCC
> 9 to build HSS.

Right, I can confirm that with commit 93f82dc18e1d riscv-gnu-toolchain
(the last before changing to gcc 10.1), I generate a 9.2.0 gcc that
builds a hss.bin that boots successfully with the minimal command line

qemu-system-riscv64 -M microchip-icicle-kit -smp 5 -bios hss.bin \
  -display none -serial stdio

Thanks!

(I haven't looked any further than the hss.bin yet, but I'm now
unblocked to do so.)

Best Regards,

Leif

