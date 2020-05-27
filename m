Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1je2Kf-000608-Vq
	for mharc-qemu-riscv@gnu.org; Wed, 27 May 2020 16:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1je2Ke-0005te-Fr; Wed, 27 May 2020 16:07:20 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:42823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1je2Kc-0004Co-9c; Wed, 27 May 2020 16:07:20 -0400
Received: by mail-il1-x144.google.com with SMTP id 18so25416694iln.9;
 Wed, 27 May 2020 13:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PfiSxr2uPTg5KhNRWL1lagyedkijhoUm6PDpEY6hWQI=;
 b=pAmHfgeSBAHel/o2G+428q/PhSM0nD0P8Snetrs8D10iW7mqUIODy/DLEWJ64xUW5z
 VsgQ6j2TMG7lVBdR7RNqk9Kmmkw5sMgh2tKVq3nXrjJXqQxVhkvuv8lB8dQsqInvT38P
 HCF3yFHKW342TfmE27nhFRAZ9rFGSwk8A6hoeMvanXpl6cLCTmlBmH4rfnktQOUuIG7E
 pLng8hdGvh5PncoQdcKkq6TD7soqWf9RECgEu70EMg6vTWiM3x3W7BU2g77qGUg0p8p6
 YkAZgfKmqxuqS7BesJuX6fC6WwWu1iKpBFbmovgn+JqPDjuqhai3Gn6d2gGHnrMsejM/
 A7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PfiSxr2uPTg5KhNRWL1lagyedkijhoUm6PDpEY6hWQI=;
 b=VfoP3TLJVRBy+8JOUnD/eShnUNjKDa1LHq3UbDkzlnXng2qoP+V2+iotwp/A0G9jK9
 CcisNniNGwIwfOMbfXwCLAgQvgpWVWlBV7jWiUBFEMZomqQHStsffUjbDy9I/S7B+mov
 Zk85Bwd8JG0Ca4V51DcUkf+PJjLTA0tYuGPeU2Wk9bkVYIZE9mttQUCeGjLOqjDZ4lqD
 0s4yVtmHm8cHYZxInzqGFbRKkq+uf2OR2XJn7Cl1grt2OiyKDOn2mf4/xzRnMR14Cuhe
 06UzSJ8CxApnB4ual+/zOW79S8qvf/jrxJNmU9b+qve6/DkQMwBNL7R12booV1lFQizm
 CUSg==
X-Gm-Message-State: AOAM53014TOjKVz6w3kQJQgRJz8VTkSFZiPKnFL6hFvYvb1sA/vcVL/z
 UjtME3C/qe/MrcCclVhcUeoqAfm79NpcvAKAIOA=
X-Google-Smtp-Source: ABdhPJzc1nQLb5sY977N1BC0Juprx6DrqmZrCxvPIiz6/gXkgsX1RR0wj2K7U8i/5Htz8rb6BpwAyzpmCGSI2yoA8ws=
X-Received: by 2002:a92:bb45:: with SMTP id w66mr520477ili.131.1590610036892; 
 Wed, 27 May 2020 13:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590533156.git.alistair.francis@wdc.com>
 <50009ff3005847a5958327d5a31ebc70f52e7a4c.1590533156.git.alistair.francis@wdc.com>
 <CAEUhbmX=4kzs96QzPiTnge9L+zswr78UuDx1gbCKzgFRVpdNpQ@mail.gmail.com>
In-Reply-To: <CAEUhbmX=4kzs96QzPiTnge9L+zswr78UuDx1gbCKzgFRVpdNpQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 27 May 2020 12:58:16 -0700
Message-ID: <CAKmqyKMyoK45hGRTSy=azuXJu49-ePTfyN4WDHZLhr_hkhNEcg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] target/riscv: Drop support for ISA spec version
 1.09.1
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 27 May 2020 20:07:20 -0000

On Wed, May 27, 2020 at 2:41 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, May 27, 2020 at 6:55 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > The RISC-V ISA spec version 1.09.1 has been deprecated in QEMU since
> > 4.1. It's not commonly used so let's remove support for it.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  target/riscv/cpu.h                            |   1 -
> >  target/riscv/cpu.c                            |   2 -
> >  target/riscv/cpu_helper.c                     |  82 +++++-------
> >  target/riscv/csr.c                            | 118 +++---------------
> >  .../riscv/insn_trans/trans_privileged.inc.c   |  18 +--
> >  target/riscv/monitor.c                        |   5 -
> >  target/riscv/op_helper.c                      |  17 +--
> >  7 files changed, 56 insertions(+), 187 deletions(-)
> >
>
> There are 3 more places in csr.c that need to be removed
>
> ./target/riscv/csr.c:651:    if (env->priv_ver < PRIV_VERSION_1_10_0) {
> ./target/riscv/csr.c:660:    if (env->priv_ver < PRIV_VERSION_1_10_0) {
> ./target/riscv/csr.c:741:    } else if (env->priv_ver >= PRIV_VERSION_1_10_0) {

Thanks, fixed.

Alistair

>
> Regards,
> Bin

