Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSwnT-0001j2-Po
	for mharc-qemu-riscv@gnu.org; Thu, 15 Oct 2020 02:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kSwnS-0001iU-9h; Thu, 15 Oct 2020 02:31:30 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:44008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kSwnQ-0004U4-9H; Thu, 15 Oct 2020 02:31:30 -0400
Received: by mail-yb1-xb42.google.com with SMTP id d15so1333140ybl.10;
 Wed, 14 Oct 2020 23:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wjzs4KefBlOF2UaMlc9Vs3cFWbQkoCK4ngM2/Q6EWyk=;
 b=WEbHBVk+fTH3UQJLM7/VGZ9GX5mof430k7+sCUoUeRfviKRrl2Yi5sxWycgZJeC+Pw
 KDQOFjEIW+9zv746MpaW4xcwpPTwlw+gP2yJcsP4uaGW7H8lt2WbFBjKeQBVX7Mxc41q
 TBm5qhJlbe3QrscBttqMWSt7tOWaXyiuPft9aheGQLi8nvqHLHzCt8903xrsQlZBsNMW
 yaAD6jOjbIOfftcA/MRKsIx5mWCoI6ivuDdjbwABhjtqBvKMqaZJbMJKkFaHVikWWk0q
 /WS4x3KG7SStBlVX6r6p/z0M/7gj0pjx0OIsAkZTYhyyTpwrZRrSq9IyoXiIgNmMpEVB
 aCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wjzs4KefBlOF2UaMlc9Vs3cFWbQkoCK4ngM2/Q6EWyk=;
 b=tx/X7lHOUozHwp3SomVN+J26NwzXKdZ+Y/u8MnlqeepVYZiuQcdvkQbeNDNpJOYldh
 muC+O72OvDE27VEeBy8WzaQJiRvoYq48W1jDZ1SuXk3dyqnc3xosPlAhUhrejPfk89LP
 l5ldnsY7Yl0qD6yXov0rkEW3WuYOMpDLdqMfTj1L2B1aYY6j07chZapqAJ/f+adUrnKj
 LbkDigNf4jEftrXDKX2qxZ2x9xLz6jCjS/DvgV2kACTFuRz5dq2c+pZ/a+GeiU/cwEJs
 8wgwsXeb8Q3kR88ZS8jvn++kff4Ja0r555SZKvNqVlqEQrkOCuid9zAAX/zDQfsPe/Tb
 YlUw==
X-Gm-Message-State: AOAM533FFe/eQ4dbQrAkiPek10zdiPtJPWNRhf5JicTmOoH/zR0vTBC8
 SzE4ghtJ9nkGngEjPlzULW50AG5HcurzmVZBWnk=
X-Google-Smtp-Source: ABdhPJyyC1tqR/esw+bh0b5NRS86TAU5nRU9+rlc+NfzIens0LTpBDOwrbDs91LgIgzw/Md3ibCdUXQHwFPjTiHo5Og=
X-Received: by 2002:a25:f81e:: with SMTP id u30mr3407191ybd.332.1602743486650; 
 Wed, 14 Oct 2020 23:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200901154711.18457-1-green.wan@sifive.com>
 <20200901154711.18457-3-green.wan@sifive.com>
 <CAKmqyKOqQgE0X3T100Zzi6_8X5d9XVEjam01bhCZSU=-FL-ecw@mail.gmail.com>
 <CAJivOr4xLP1n4eVFyWHi=ckg17C_j76f=+o+YPztsYuaPDwCCw@mail.gmail.com>
 <CAKmqyKPFbfbXSryWW40kW=RF-mx4V_nVqmdOveQ-fuLQgFbARQ@mail.gmail.com>
 <CAJivOr7PVXi430SzPgbyFtFPqAsufy_xs1O7gfWQAS1ktTwb1A@mail.gmail.com>
 <CAKmqyKNC5K5MEvVGaZPisTEyrePNV3jWrSYzuUcY3p62ws2VXg@mail.gmail.com>
 <CAEUhbmWJsrcvShaeb-q8Q5W25yhPKtsQaKEYRqgyGgCogrFaQg@mail.gmail.com>
 <CAKmqyKPnk7ZGH_XQvywb1zvC1UqQ8Yab3P37QMwNWtTS-OsD_A@mail.gmail.com>
In-Reply-To: <CAKmqyKPnk7ZGH_XQvywb1zvC1UqQ8Yab3P37QMwNWtTS-OsD_A@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 15 Oct 2020 14:31:15 +0800
Message-ID: <CAEUhbmW9xpxhFSkU+NU5VbSEKume5MvqPOTEA3v1vKz2yBuikg@mail.gmail.com>
Subject: Re: [RFC PATCH v5 2/2] hw/riscv: sifive_u: Add backend drive support
To: Alistair Francis <alistair23@gmail.com>
Cc: Green Wan <green.wan@sifive.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b42;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Thu, 15 Oct 2020 06:31:30 -0000

Hi Alistair,

On Thu, Oct 15, 2020 at 2:51 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Oct 14, 2020 at 8:02 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Alistair,
> >
> > On Wed, Oct 14, 2020 at 10:46 PM Alistair Francis <alistair23@gmail.com> wrote:
> > >
> > > On Wed, Sep 30, 2020 at 12:10 AM Green Wan <green.wan@sifive.com> wrote:
> > > >
> > > > On Wed, Sep 30, 2020 at 1:08 AM Alistair Francis <alistair23@gmail.com> wrote:
> > > > >
> > > > > On Mon, Sep 28, 2020 at 2:18 AM Green Wan <green.wan@sifive.com> wrote:
> > > > > >
> > > > > > Hi Alistair,
> > > > > >
> > > > > > Thanks for the review. See the reply inline below.
> > > > > >
> > > > > >
> > > > > > On Sat, Sep 26, 2020 at 5:52 AM Alistair Francis <alistair23@gmail.com> wrote:
> > > > > > >
> > > > > > > On Tue, Sep 1, 2020 at 8:49 AM Green Wan <green.wan@sifive.com> wrote:
> > > > > > > >
> > > > > > > > Add '-drive' support to OTP device. Allow users to assign a raw file
> > > > > > > > as OTP image.
> > > > > > >
> > > > > > > Do you mind writing an example command line argument in the commit message?
> > > > > > >
> > > > > > > Also, do you have a test case for this? I would like to add it to my CI.
> > > > > > >
> > > > > >
> > > > > > Do you mean qtest? I run uboot and use uboot driver to test it and
> > > > > > didn't create a qemu test case.
> > > > >
> > > > > No, I just mean how are you running and testing this.
> > > > >
> > > > > So you are booting U-Boot, then how do you test it in U-Boot?
> > >
> > > Hey,
> > >
> > > Sorry, this email didn't send and I only just noticed.
> > >
> > > >
> > > > Correct, I just enabled the configuration for
> > > > ./drivers/misc/sifive-otp.c in uboot for normal booting access to OTP.
> > > > And manually modify some failures write case to test write-once
> > > > feature.
> > >
> > > Can you document this? I would like to include this in my tests.
> > >
> >
> > See `QEMU Specific Instructions` in
> > https://github.com/riscv/opensbi/blob/master/docs/platform/sifive_fu540.md
>
> Hmm... I am missing something. I don't see any details on how you
> access the OTP and verify that reads/writes have occured. That link
> just seems to document how to build OpenSBI with a U-boot payload.
>
> Does U-Boot run the tests automatically after boot?

So far U-Boot only performs the OTP content read during boot, because
U-Boot needs to determine its MAC address based on the serial number
programmed in the OTP. In normal situations, U-Boot does not perform
any write to OTP. That's why I posted a U-Boot patch to test this QEMU
functionality of OTP write. The U-Boot patch is a shell command to
test the reading / writing of the OTP content. So what you need to do
to test this, is to follow the instructions documented in the OpenSBI
doc, then use my patch to test the OTP write.

Regards,
Bin

