Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jeMnZ-0007Ua-Pf
	for mharc-qemu-riscv@gnu.org; Thu, 28 May 2020 13:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jeMnX-0007UJ-Nk; Thu, 28 May 2020 13:58:31 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:42784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jeMnW-0007RE-Vy; Thu, 28 May 2020 13:58:31 -0400
Received: by mail-io1-xd43.google.com with SMTP id d5so21545856ios.9;
 Thu, 28 May 2020 10:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EGe9Ywrs3nE/D+XuH1ujGw3nF49U5tpU8vnerZYJLtM=;
 b=WC3rd0QkY4Re6hjbU50cC99vVbtBTOq2SyTIuIzVvREX0mhMwTrvltlUzs/JTP3VW5
 zul4E6iDZYF6WrbE85VhWw4xZTb74vYbMDzrBdYI21kokHaSt1zWnHv62I5MFvEA0Mtx
 OyK7ul+qz9zx9XyfM41zzJC6rccZSDgOeBl88cSiBxYOZrRTsB5Mlq5ongjRdrUewoK9
 cZrQsp/YDp+Y+Wz3K+zjorUlAkHwgOJcHKDZvP4gZXE7ePrm01Xap3DvnNbnbK7WxvZs
 IBhcpT4eHqqNLFdGQA0MRWLiQSiOwmBM2pGQuNlbIqSchZAUIsU+W7ksUpdQrc+swKIj
 4q2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EGe9Ywrs3nE/D+XuH1ujGw3nF49U5tpU8vnerZYJLtM=;
 b=k0bs85UVj78RVTW1aCoeuAztS+EjxujcGJ0cet85X0mlofnUb6Inl0ZTpXAF0uddAW
 rNRLZOPgNH+C/ougW04QKzDstU5pzPLcBtGinePzAD0JpgJdnL59RHoGK/MnLWHqrYaS
 IOvgqiHg1XZZvG/5nP9gB8ssH902NKLh877JCgenDclgLhUN65OsM6Y2Vod+tHBa4WTo
 rDNz1UsXgaXZM8xQhs17pfShtgpcfumEHBMeuHP12p/av0OjGxjbGVwu++12xZbIy9nS
 DhGxpkd13/BBL9UeqYxfhw0uGFdb9gvO+UHdCTuZHYCsnlIDK3bpXIc7hZp/7uR1qjRz
 IVaw==
X-Gm-Message-State: AOAM532QwjiC0DA4VKxkpVawwGFZAnkgVHGKTTYHsJT0lKtnAyKoW2QL
 Bea7iXytP1A8g0JlPLHRuPdQDIRYiv8qRf2LLqE=
X-Google-Smtp-Source: ABdhPJwZNpPwHw9SYGijLf4u8swdCFcYkUi3a59yuB11zd/kTvhzTel/4sE6T/j8HYaoKZrJk5LLqIC0IZXuTE4fdMY=
X-Received: by 2002:a02:6543:: with SMTP id u64mr3770441jab.26.1590688709067; 
 Thu, 28 May 2020 10:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590533156.git.alistair.francis@wdc.com>
 <0c7494fe-f812-9ee4-6c35-bc1991d0aff2@redhat.com>
 <CAKmqyKOY0m0uZMLH1wcS=vaJqy-EEBG=Sm0t5uLaLt8u366Miw@mail.gmail.com>
 <35fdd2c8-0951-07f4-2b4c-27e6da53d38c@redhat.com>
In-Reply-To: <35fdd2c8-0951-07f4-2b4c-27e6da53d38c@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 May 2020 10:49:27 -0700
Message-ID: <CAKmqyKM=RzCeScDgQswMJexXRFuGUM8f3fFR0ymufBdqa+5qig@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] RTISC-V: Remove deprecated ISA, CPUs and machines
To: Thomas Huth <thuth@redhat.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 28 May 2020 17:58:32 -0000

On Wed, May 27, 2020 at 10:51 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 27/05/2020 19.35, Alistair Francis wrote:
> > On Wed, May 27, 2020 at 12:17 AM Thomas Huth <thuth@redhat.com> wrote:
> >>
> >> On 27/05/2020 00.47, Alistair Francis wrote:
> >>>
> >>>  include/hw/riscv/spike.h                      |   6 +-
> >>>  target/riscv/cpu.h                            |   8 -
> >>>  hw/riscv/spike.c                              | 217 ------------------
> >>>  target/riscv/cpu.c                            |  30 ---
> >>>  target/riscv/cpu_helper.c                     |  82 +++----
> >>>  target/riscv/csr.c                            | 118 ++--------
> >>>  .../riscv/insn_trans/trans_privileged.inc.c   |  18 +-
> >>>  target/riscv/monitor.c                        |   5 -
> >>>  target/riscv/op_helper.c                      |  17 +-
> >>>  tests/qtest/machine-none-test.c               |   4 +-
> >>>  10 files changed, 60 insertions(+), 445 deletions(-)
> >>
> >>  Hi,
> >>
> >> looking at the diffstat, I think you should also edit
> >> ./docs/system/deprecated.rst according to your changes?
> >
> > I'm not sure what I should edit there. These are already marked as
> > deprecated, do I need to make a change when they are removed?
>
> Yes, you should move the features to the "Recently removed features"
> section at the end of the file. See e.g. commit b4983c570c7a5848c9df.

Ah, I didn't see that. Fixed in the next version.

Alistair

>
>  Thomas
>

