Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNWG5-0005Vg-UZ
	for mharc-qemu-riscv@gnu.org; Wed, 30 Sep 2020 03:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kNWG4-0005UX-Oy
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2020 03:10:36 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:33463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kNWG1-00024Q-Qm
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2020 03:10:36 -0400
Received: by mail-qk1-x741.google.com with SMTP id s131so481880qke.0
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2020 00:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UxhyX4Yrj3ng/x68SSB52f605eZ6Pyfq3YQ5aWvE5BE=;
 b=BdOS3aKsBNS3kf3ZtFK3DAkpTG2SGmk4z7wR4U80+ib4dYFRwSDUrBfslY7+ZDdLxm
 NjkSD9E7kUuSM+v2IZPVkW9vTbn4/eKXoZca0JsWxQQ+Q2rInz/pljEoaLbZzPBtGYhR
 WnCrs4FSUa7XWi8N8LDRf+ypGkGa7YVqhU5aHz48LVmj6mBkT0AS2OnUFGl7qoG7aJFy
 8bCgPnryWXz7AgW8gmIe1/Y3ZNEvj11JWxjvS4ydLdboI0oQJ/P/9M80iQ+/odhyP8Z7
 8rEMtTiPyNgu6tAFM+mNddX4ctSvncku9seSjskmTXgNM2I4gE1QhmHRQtSDjmXP8h9q
 yA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UxhyX4Yrj3ng/x68SSB52f605eZ6Pyfq3YQ5aWvE5BE=;
 b=e3w09B8iwgVnsIcU3LnHjWcCJfKPFFC39U+tDAjgPfd7eTKXI2eD4oZrcJaSw/VmIP
 TCv8ORVhSR+e4BeOOGF5jPuHlHdAynk2IkGpq3np1C5ecK1+5HHP423FBH7asdqXHGZg
 B7G9kjh1ua955I3Z4kmiK8r8wftbp/OALZ4LleRTqxGLXGOYqTWY3uHvIi4SaTIgf9vE
 z+Jv7Mz+H6d2OSbEmGhEcXz1kwtuck6S1S86RF0Lk4tD4UYbW+hxz4eTbviOPzFNU5vQ
 RvfzquXyAgdBnmkqOwz5P6jBBXXtfwEFH2Y19YkDRQBBuEZJoW1O24yY9sD7V3R8urGq
 8wrA==
X-Gm-Message-State: AOAM532gpyntLWQGlrmc/QZuC5Ly7ZdHljLUoFCXfbQ47tLog4QCw/7d
 52ZEN66v3bccw82y8qg77k79fLP4y1Nq/dvU/C/8/A==
X-Google-Smtp-Source: ABdhPJwVPlWqJEdeVDuOe74ZNitzE6SLngrGFVdDdGtUxZIdvm0c2wKUKGropt5ooH2CDlozDSXG8jqgihCaEUOLGmA=
X-Received: by 2002:a05:620a:1411:: with SMTP id
 d17mr1193281qkj.325.1601449831903; 
 Wed, 30 Sep 2020 00:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200901154711.18457-1-green.wan@sifive.com>
 <20200901154711.18457-3-green.wan@sifive.com>
 <CAKmqyKOqQgE0X3T100Zzi6_8X5d9XVEjam01bhCZSU=-FL-ecw@mail.gmail.com>
 <CAJivOr4xLP1n4eVFyWHi=ckg17C_j76f=+o+YPztsYuaPDwCCw@mail.gmail.com>
 <CAKmqyKPFbfbXSryWW40kW=RF-mx4V_nVqmdOveQ-fuLQgFbARQ@mail.gmail.com>
In-Reply-To: <CAKmqyKPFbfbXSryWW40kW=RF-mx4V_nVqmdOveQ-fuLQgFbARQ@mail.gmail.com>
From: Green Wan <green.wan@sifive.com>
Date: Wed, 30 Sep 2020 15:10:20 +0800
Message-ID: <CAJivOr7PVXi430SzPgbyFtFPqAsufy_xs1O7gfWQAS1ktTwb1A@mail.gmail.com>
Subject: Re: [RFC PATCH v5 2/2] hw/riscv: sifive_u: Add backend drive support
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::741;
 envelope-from=green.wan@sifive.com; helo=mail-qk1-x741.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 30 Sep 2020 07:10:37 -0000

On Wed, Sep 30, 2020 at 1:08 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Mon, Sep 28, 2020 at 2:18 AM Green Wan <green.wan@sifive.com> wrote:
> >
> > Hi Alistair,
> >
> > Thanks for the review. See the reply inline below.
> >
> >
> > On Sat, Sep 26, 2020 at 5:52 AM Alistair Francis <alistair23@gmail.com> wrote:
> > >
> > > On Tue, Sep 1, 2020 at 8:49 AM Green Wan <green.wan@sifive.com> wrote:
> > > >
> > > > Add '-drive' support to OTP device. Allow users to assign a raw file
> > > > as OTP image.
> > >
> > > Do you mind writing an example command line argument in the commit message?
> > >
> > > Also, do you have a test case for this? I would like to add it to my CI.
> > >
> >
> > Do you mean qtest? I run uboot and use uboot driver to test it and
> > didn't create a qemu test case.
>
> No, I just mean how are you running and testing this.
>
> So you are booting U-Boot, then how do you test it in U-Boot?

Correct, I just enabled the configuration for
./drivers/misc/sifive-otp.c in uboot for normal booting access to OTP.
And manually modify some failures write case to test write-once
feature.

>
> > Here is the command I use:
> >
> > $ qemu-system-riscv64 -M sifive_u -m 256M -nographic -bios none
> > -kernel ../opensbi/build/platform/sifive/fu540/firmware/fw_payload.elf
> > -d guest_errors -drive if=none,format=raw,file=otp.img
> >
> > I'll check how to create a test case but maybe not that soon in the next patch.
> >
> > > >
> > > > Signed-off-by: Green Wan <green.wan@sifive.com>
> > > > ---
> > > >  hw/riscv/sifive_u_otp.c         | 50 +++++++++++++++++++++++++++++++++
> > > >  include/hw/riscv/sifive_u_otp.h |  2 ++
> > > >  2 files changed, 52 insertions(+)
> > > >
> > > > diff --git a/hw/riscv/sifive_u_otp.c b/hw/riscv/sifive_u_otp.c
> > > > index b8369e9035..477c54c7b8 100644
> > > > --- a/hw/riscv/sifive_u_otp.c
> > > > +++ b/hw/riscv/sifive_u_otp.c
> > > > @@ -24,6 +24,8 @@
> > > >  #include "qemu/log.h"
> > > >  #include "qemu/module.h"
> > > >  #include "hw/riscv/sifive_u_otp.h"
> > > > +#include "sysemu/blockdev.h"
> > > > +#include "sysemu/block-backend.h"
> > > >
> > > >  #define WRITTEN_BIT_ON 0x1
> > > >
> > > > @@ -54,6 +56,16 @@ static uint64_t sifive_u_otp_read(void *opaque, hwaddr addr, unsigned int size)
> > > >          if ((s->pce & SIFIVE_U_OTP_PCE_EN) &&
> > > >              (s->pdstb & SIFIVE_U_OTP_PDSTB_EN) &&
> > > >              (s->ptrim & SIFIVE_U_OTP_PTRIM_EN)) {
> > > > +
> > > > +            /* read from backend */
> > > > +            if (s->blk) {
> > > > +                int32_t buf;
> > > > +
> > > > +                blk_pread(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD, &buf,
> > > > +                          SIFIVE_U_OTP_FUSE_WORD);
> > > > +                return buf;
> > > > +            }
> > > > +
> > > >              return s->fuse[s->pa & SIFIVE_U_OTP_PA_MASK];
> > > >          } else {
> > > >              return 0xff;
> > > > @@ -145,6 +157,12 @@ static void sifive_u_otp_write(void *opaque, hwaddr addr,
> > > >              /* write bit data */
> > > >              SET_FUSEARRAY_BIT(s->fuse, s->pa, s->paio, s->pdin);
> > > >
> > > > +            /* write to backend */
> > > > +            if (s->blk) {
> > > > +                blk_pwrite(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD, &val32,
> > > > +                           SIFIVE_U_OTP_FUSE_WORD, 0);
> > > > +            }
> > > > +
> > > >              /* update written bit */
> > > >              SET_FUSEARRAY_BIT(s->fuse_wo, s->pa, s->paio, WRITTEN_BIT_ON);
> > > >          }
> > > > @@ -168,16 +186,48 @@ static const MemoryRegionOps sifive_u_otp_ops = {
> > > >
> > > >  static Property sifive_u_otp_properties[] = {
> > > >      DEFINE_PROP_UINT32("serial", SiFiveUOTPState, serial, 0),
> > > > +    DEFINE_PROP_DRIVE("drive", SiFiveUOTPState, blk),
> > > >      DEFINE_PROP_END_OF_LIST(),
> > > >  };
> > > >
> > > >  static void sifive_u_otp_realize(DeviceState *dev, Error **errp)
> > > >  {
> > > >      SiFiveUOTPState *s = SIFIVE_U_OTP(dev);
> > > > +    DriveInfo *dinfo;
> > > >
> > > >      memory_region_init_io(&s->mmio, OBJECT(dev), &sifive_u_otp_ops, s,
> > > >                            TYPE_SIFIVE_U_OTP, SIFIVE_U_OTP_REG_SIZE);
> > > >      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
> > > > +
> > > > +    dinfo = drive_get_next(IF_NONE);
> > > > +    if (dinfo) {
> > > > +        int ret;
> > > > +        uint64_t perm;
> > > > +        int filesize;
> > > > +        BlockBackend *blk;
> > > > +
> > > > +        blk = blk_by_legacy_dinfo(dinfo);
> > >
> > > I think this should be:
> > >
> > > blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
> > >
> >
> > The previous code, "if (dinfo)", should check NULL already. But we can
> > add more checks for blk such as qdev_prop_set_drive_err().
>
> You are right, but I don't see a fallback if !dinfo
>
Not sure whether we need it. Originally, I also added '!dinfo' check
logic and turned out I found it can be handled like without "-drive"
case. It just does a fallback to use the fuse[] array in memory. For
example,
"qemu-system-riscv64 -M sifive_u -m 256M -nographic -bios none -kernel
../opensbi/build/platform/sifive/fu540/firmware/fw_payload.elf"


> >
> > > > +        filesize = SIFIVE_U_OTP_NUM_FUSES * SIFIVE_U_OTP_FUSE_WORD;
> > > > +        if (blk_getlength(blk) < filesize) {
> > > > +            qemu_log_mask(LOG_GUEST_ERROR, "OTP drive size < 16K\n");
> > >
> > > You should probably be setting errp instead.
> > >
> > > If a user specified a -drive argument, they probably want to error if
> > > we aren't going to use it.
> > >
> >
> > Will set an errp.
>
> Great!
>
> >
> > > > +            return;
> > > > +        }
> > > > +
> > > > +        qdev_prop_set_drive(dev, "drive", blk);
> > > > +
> > > > +        perm = BLK_PERM_CONSISTENT_READ |
> > > > +                        (blk_is_read_only(s->blk) ? 0 : BLK_PERM_WRITE);
> > > > +        ret = blk_set_perm(s->blk, perm, BLK_PERM_ALL, errp);
> > > > +        if (ret < 0) {
> > > > +            qemu_log_mask(LOG_GUEST_ERROR, "set perm error.");
> > >
> > > Is it worth printing the error?
> > >
> > Probably add it when I test it. Will remove it.
>
> Thanks
>
> Alistair
>
> >
> > > > +        }
> > > > +
> > > > +        if (blk_pread(s->blk, 0, s->fuse, filesize) != filesize) {
> > > > +            qemu_log_mask(LOG_GUEST_ERROR,
> > > > +                          "failed to read the initial flash content");
> > > > +            return;
> > >
> > > You don't need a return here.
> > >
> > k, will remove it and set errp.
> >
> > > Is this error fatal?
> > >
> > This shouldn't be fatal but it might lead to unknown state if the
> > content is read partially.
> > But the checking, "filesize < 16K", is fatal. It leads qemu to abort.
> >
> >
> > > Alistair
> > >
> > > > +        }
> > > > +    }
> > > >  }
> > > >
> > > >  static void sifive_u_otp_reset(DeviceState *dev)
> > > > diff --git a/include/hw/riscv/sifive_u_otp.h b/include/hw/riscv/sifive_u_otp.h
> > > > index 4a5a0acf48..9bc781fd4f 100644
> > > > --- a/include/hw/riscv/sifive_u_otp.h
> > > > +++ b/include/hw/riscv/sifive_u_otp.h
> > > > @@ -45,6 +45,7 @@
> > > >
> > > >  #define SIFIVE_U_OTP_PA_MASK        0xfff
> > > >  #define SIFIVE_U_OTP_NUM_FUSES      0x1000
> > > > +#define SIFIVE_U_OTP_FUSE_WORD      4
> > > >  #define SIFIVE_U_OTP_SERIAL_ADDR    0xfc
> > > >
> > > >  #define SIFIVE_U_OTP_REG_SIZE       0x1000
> > > > @@ -78,6 +79,7 @@ typedef struct SiFiveUOTPState {
> > > >      uint32_t fuse_wo[SIFIVE_U_OTP_NUM_FUSES];
> > > >      /* config */
> > > >      uint32_t serial;
> > > > +    BlockBackend *blk;
> > > >  } SiFiveUOTPState;
> > > >
> > > >  #endif /* HW_SIFIVE_U_OTP_H */
> > > > --
> > > > 2.17.1
> > > >
> > > >

