Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLcnZ-0007Du-7D
	for mharc-qemu-riscv@gnu.org; Wed, 01 Sep 2021 22:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mLcnX-0007DU-PC; Wed, 01 Sep 2021 22:49:51 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:39434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mLcnT-0004xz-Bg; Wed, 01 Sep 2021 22:49:51 -0400
Received: by mail-il1-x12c.google.com with SMTP id a1so315746ilj.6;
 Wed, 01 Sep 2021 19:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8hyf/3u1H4vpyHfMcdPoiyr7pnHuI7H5KQIPtkJeMlw=;
 b=K9ykK6aXJdRcwH2tzLOH7mYBgD+xMHzU6RVn+DDjVWQveF0fgXWEYbEjoENEz0zpyt
 7z3YfXF2VSd7DETLJBSTx5r+2VdeoEeP8qwt4NGSP+GeS9p3QBzvxVqg60nTeolcq8nf
 sshLvFKXl7eILuXaDuLJzCdBXaVmVP3UFhkeuepDNA0fVBRRQNP7ZvAYGoU4ozd/Tjtg
 RVjZKOWTpIIFFttswsCMsP1s6T/zccDjxcuw1mKgZ0ScXkzOqAYuM7COdZ0swNrUL2/8
 EZz9QalvtHyPcR8ir7BM38V2Ei1Q0JkqKYXl7MLra4EESIQSvSngeC7bKd0NhSGGV4hg
 vFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8hyf/3u1H4vpyHfMcdPoiyr7pnHuI7H5KQIPtkJeMlw=;
 b=ZF4TuP1vfGax+PjyqZYEkeG4QdsKIrZdiJAlxxF3ishWbfqDS3+B7m6lCe+VKL6Og1
 CkygZyKseziQVN7E3IzFltXcAVnrQs3zn+wOeoFNw8S6KJU2UKtaag1RJxbX4CNnaWXr
 MJtptS+b7ySN2IjGzvLjjKZQ6IyShuZtn7cfyplKNCDHnDvlXLy61VnWFQh6NnpkXrrS
 c5rd6odEXnr5EVPzZa8Xmd9ww/2i5uGESMhwKSruKaXU0m68kBjHSTbWqD9aqOAqdqv6
 8sRf0VzX+6DtBdmKvDSiX/dWag07X8XNQ/Svl33XNPuQJxh4HKM194TvbagpWuihEVdZ
 6XEg==
X-Gm-Message-State: AOAM533PFY7M5GLx7REI/lOYKY0KKLpad5rrg/AeTrmhbsU9b8gRwoVF
 OGduu48qNFLUaXWjlIc74e7N70u72Vz1poKULSs=
X-Google-Smtp-Source: ABdhPJzAIdcrBpvbKR8Sm6TT5b0L7GCOyOIcZek66D0EMvxVriPPsOUD/04eaUFAmo9QNPAFvLwZrQxhdZ0ba5ZUuv0=
X-Received: by 2002:a92:d3cf:: with SMTP id c15mr635314ilh.131.1630550985510; 
 Wed, 01 Sep 2021 19:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210901124539.222868-1-zhiwei_liu@c-sky.com>
 <CAEUhbmUvb4_tmevGEcK_YgyA9_g5LumRVpMc7+rwuD4D7FSBBA@mail.gmail.com>
 <a61c6fef-4bce-0c5b-7aff-b9e2fa75aa5b@c-sky.com>
 <CAEUhbmXULr_mcdfh6x=BGLNcNM5Q7YrFhnHOuLatbrokqP0Taw@mail.gmail.com>
In-Reply-To: <CAEUhbmXULr_mcdfh6x=BGLNcNM5Q7YrFhnHOuLatbrokqP0Taw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Sep 2021 12:49:19 +1000
Message-ID: <CAKmqyKPy4kDOWAcGHF9At1h__KEahGU8ysRHBBw=69OigQmadg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Fix satp write
To: Bin Meng <bmeng.cn@gmail.com>
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12c.google.com
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
X-List-Received-Date: Thu, 02 Sep 2021 02:49:52 -0000

On Thu, Sep 2, 2021 at 11:59 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Sep 2, 2021 at 9:02 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
> >
> >
> > On 2021/9/1 =E4=B8=8B=E5=8D=889:05, Bin Meng wrote:
> > > On Wed, Sep 1, 2021 at 8:51 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrot=
e:
> > >> These variables should be target_ulong. If truncated to int,
> > >> the bool conditions they indicate will be wrong.
> > >>
> > >> As satp is very important for Linux, this bug almost fails every boo=
t.
> > > Could you please describe which Linux configuration is broken?
> >
> > I use the image from:
> >
> > https://gitlab.com/c-sky/buildroot/-/jobs/1251564514/artifacts/browse/o=
utput/images/
> >
> > >   I have
> > > a 64-bit 5.10 kernel and it boots fine.
> >
> > The login is mostly OK for me. But the busybox can't run properly.
>
> Which kernel version is this? Could you please investigate and
> indicate in the commit message?
>
> I just tested current qemu-system-riscv64 can boot to Ubuntu 20.04
> distro user space.

I also have never seen any issues.

Looking at this `vm` is set from a `static const char
valid_vm_1_10_64` so an int is fine.

It probably is a good idea for `mask` and `asid` to be target_ulong as
they are set by bit operations on target_ulong's. I guess if your host
int is 32-bits SATP64_ASID will overflow that.

Anyway with 128-bit RISC-V and maybe the ability to run 64-bit guests
no 32-bit hosts this seems like a good step

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> Regards,
> Bin
>

