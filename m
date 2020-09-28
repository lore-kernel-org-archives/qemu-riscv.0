Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kMpIl-000668-44
	for mharc-qemu-riscv@gnu.org; Mon, 28 Sep 2020 05:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kMpIi-000642-7C
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2020 05:18:28 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:37628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kMpIf-0002ii-8q
 for qemu-riscv@nongnu.org; Mon, 28 Sep 2020 05:18:27 -0400
Received: by mail-qk1-x744.google.com with SMTP id 16so309734qkf.4
 for <qemu-riscv@nongnu.org>; Mon, 28 Sep 2020 02:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zydUDfHqvBBYKXIwxde4mSeIqQaIEeuMG9Pyz0aVv9Q=;
 b=JF3ZR2PVmpxinZYu92P1VJ9K13Q7tzg5PvaNqER/L8KMxwGceNTZO7neGuD+qW7jR3
 qLV3i5J+nr8SCBULEIMMps2urVoN2hUf1xKNR3duRFc5a63D1zOL+/ZF0GkiGgDllHKS
 HUyhKjzI7ZdV6zR/TIZjMij5PN64H6c6cEQ3Ji5QpUI6boblLw9aN37oKodIUP773BPF
 tYkklLozXmnrQHRkgh0DcnSb/jCYni5XJY4BMzqAjmiMwnaOWYpngtcw2+Vfva2W24Xf
 7BWg/8idwyupvs7QtXAfHgydlDNZPc+UkU8po2c9/1V5B9HBL2M6gneY1+mHqaOdYTge
 MnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zydUDfHqvBBYKXIwxde4mSeIqQaIEeuMG9Pyz0aVv9Q=;
 b=cGNRvTh/VWNmjS/pKelofZupfXfU8GC2bFslPHsulBNXnR539UxLlDbZJuF9QCfUMN
 0bmDb1SQSGllvQajsDjpFZR7QfpK7HvhaL/GLOMAH6SnZZzEIn++UvnrvgPqVZNeNUGV
 xF6nVbvOg5IgdferlfT8CDcygCdmP7D+NeD255J5aNbNE5xWY5BByMfvPPK23hJCb5GN
 MPOAvvhFlZM455rDoqsjnUatWmlIFLtufq1amNwq9BxgzQuT2icKbQAIufj5NdwpMSn/
 Xp1eFoQhdxaV+ySGPVKLkxSvFhkM41i9SdEwsd8W1lOeHC9CBlS6fLp+48Uh54yN9EJW
 44Ig==
X-Gm-Message-State: AOAM533x6x1yQ5ozX32c63XMhc0iknIyYuwxBw5SaYd6prVt11DYbLo3
 elEpORETswfe87YRSL5WI+pS3B3VsZeblM0jmm5uwA==
X-Google-Smtp-Source: ABdhPJxd9ogz4hpvfQ2DAEO7nBUIkN6Z1qOxwylFBzaBEypn1PVDfNfliDriLwSmWBSWHEal8Q16+gDdAUQzZqLC2J0=
X-Received: by 2002:a37:5a47:: with SMTP id o68mr505918qkb.234.1601284702925; 
 Mon, 28 Sep 2020 02:18:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200901154711.18457-1-green.wan@sifive.com>
 <20200901154711.18457-3-green.wan@sifive.com>
 <CAKmqyKOqQgE0X3T100Zzi6_8X5d9XVEjam01bhCZSU=-FL-ecw@mail.gmail.com>
In-Reply-To: <CAKmqyKOqQgE0X3T100Zzi6_8X5d9XVEjam01bhCZSU=-FL-ecw@mail.gmail.com>
From: Green Wan <green.wan@sifive.com>
Date: Mon, 28 Sep 2020 17:18:11 +0800
Message-ID: <CAJivOr4xLP1n4eVFyWHi=ckg17C_j76f=+o+YPztsYuaPDwCCw@mail.gmail.com>
Subject: Re: [RFC PATCH v5 2/2] hw/riscv: sifive_u: Add backend drive support
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::744;
 envelope-from=green.wan@sifive.com; helo=mail-qk1-x744.google.com
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
X-List-Received-Date: Mon, 28 Sep 2020 09:18:28 -0000

Hi Alistair,

Thanks for the review. See the reply inline below.


On Sat, Sep 26, 2020 at 5:52 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Sep 1, 2020 at 8:49 AM Green Wan <green.wan@sifive.com> wrote:
> >
> > Add '-drive' support to OTP device. Allow users to assign a raw file
> > as OTP image.
>
> Do you mind writing an example command line argument in the commit message?
>
> Also, do you have a test case for this? I would like to add it to my CI.
>

Do you mean qtest? I run uboot and use uboot driver to test it and
didn't create a qemu test case.
Here is the command I use:

$ qemu-system-riscv64 -M sifive_u -m 256M -nographic -bios none
-kernel ../opensbi/build/platform/sifive/fu540/firmware/fw_payload.elf
-d guest_errors -drive if=none,format=raw,file=otp.img

I'll check how to create a test case but maybe not that soon in the next patch.

> >
> > Signed-off-by: Green Wan <green.wan@sifive.com>
> > ---
> >  hw/riscv/sifive_u_otp.c         | 50 +++++++++++++++++++++++++++++++++
> >  include/hw/riscv/sifive_u_otp.h |  2 ++
> >  2 files changed, 52 insertions(+)
> >
> > diff --git a/hw/riscv/sifive_u_otp.c b/hw/riscv/sifive_u_otp.c
> > index b8369e9035..477c54c7b8 100644
> > --- a/hw/riscv/sifive_u_otp.c
> > +++ b/hw/riscv/sifive_u_otp.c
> > @@ -24,6 +24,8 @@
> >  #include "qemu/log.h"
> >  #include "qemu/module.h"
> >  #include "hw/riscv/sifive_u_otp.h"
> > +#include "sysemu/blockdev.h"
> > +#include "sysemu/block-backend.h"
> >
> >  #define WRITTEN_BIT_ON 0x1
> >
> > @@ -54,6 +56,16 @@ static uint64_t sifive_u_otp_read(void *opaque, hwaddr addr, unsigned int size)
> >          if ((s->pce & SIFIVE_U_OTP_PCE_EN) &&
> >              (s->pdstb & SIFIVE_U_OTP_PDSTB_EN) &&
> >              (s->ptrim & SIFIVE_U_OTP_PTRIM_EN)) {
> > +
> > +            /* read from backend */
> > +            if (s->blk) {
> > +                int32_t buf;
> > +
> > +                blk_pread(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD, &buf,
> > +                          SIFIVE_U_OTP_FUSE_WORD);
> > +                return buf;
> > +            }
> > +
> >              return s->fuse[s->pa & SIFIVE_U_OTP_PA_MASK];
> >          } else {
> >              return 0xff;
> > @@ -145,6 +157,12 @@ static void sifive_u_otp_write(void *opaque, hwaddr addr,
> >              /* write bit data */
> >              SET_FUSEARRAY_BIT(s->fuse, s->pa, s->paio, s->pdin);
> >
> > +            /* write to backend */
> > +            if (s->blk) {
> > +                blk_pwrite(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD, &val32,
> > +                           SIFIVE_U_OTP_FUSE_WORD, 0);
> > +            }
> > +
> >              /* update written bit */
> >              SET_FUSEARRAY_BIT(s->fuse_wo, s->pa, s->paio, WRITTEN_BIT_ON);
> >          }
> > @@ -168,16 +186,48 @@ static const MemoryRegionOps sifive_u_otp_ops = {
> >
> >  static Property sifive_u_otp_properties[] = {
> >      DEFINE_PROP_UINT32("serial", SiFiveUOTPState, serial, 0),
> > +    DEFINE_PROP_DRIVE("drive", SiFiveUOTPState, blk),
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> >
> >  static void sifive_u_otp_realize(DeviceState *dev, Error **errp)
> >  {
> >      SiFiveUOTPState *s = SIFIVE_U_OTP(dev);
> > +    DriveInfo *dinfo;
> >
> >      memory_region_init_io(&s->mmio, OBJECT(dev), &sifive_u_otp_ops, s,
> >                            TYPE_SIFIVE_U_OTP, SIFIVE_U_OTP_REG_SIZE);
> >      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
> > +
> > +    dinfo = drive_get_next(IF_NONE);
> > +    if (dinfo) {
> > +        int ret;
> > +        uint64_t perm;
> > +        int filesize;
> > +        BlockBackend *blk;
> > +
> > +        blk = blk_by_legacy_dinfo(dinfo);
>
> I think this should be:
>
> blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
>

The previous code, "if (dinfo)", should check NULL already. But we can
add more checks for blk such as qdev_prop_set_drive_err().

> > +        filesize = SIFIVE_U_OTP_NUM_FUSES * SIFIVE_U_OTP_FUSE_WORD;
> > +        if (blk_getlength(blk) < filesize) {
> > +            qemu_log_mask(LOG_GUEST_ERROR, "OTP drive size < 16K\n");
>
> You should probably be setting errp instead.
>
> If a user specified a -drive argument, they probably want to error if
> we aren't going to use it.
>

Will set an errp.

> > +            return;
> > +        }
> > +
> > +        qdev_prop_set_drive(dev, "drive", blk);
> > +
> > +        perm = BLK_PERM_CONSISTENT_READ |
> > +                        (blk_is_read_only(s->blk) ? 0 : BLK_PERM_WRITE);
> > +        ret = blk_set_perm(s->blk, perm, BLK_PERM_ALL, errp);
> > +        if (ret < 0) {
> > +            qemu_log_mask(LOG_GUEST_ERROR, "set perm error.");
>
> Is it worth printing the error?
>
Probably add it when I test it. Will remove it.

> > +        }
> > +
> > +        if (blk_pread(s->blk, 0, s->fuse, filesize) != filesize) {
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                          "failed to read the initial flash content");
> > +            return;
>
> You don't need a return here.
>
k, will remove it and set errp.

> Is this error fatal?
>
This shouldn't be fatal but it might lead to unknown state if the
content is read partially.
But the checking, "filesize < 16K", is fatal. It leads qemu to abort.


> Alistair
>
> > +        }
> > +    }
> >  }
> >
> >  static void sifive_u_otp_reset(DeviceState *dev)
> > diff --git a/include/hw/riscv/sifive_u_otp.h b/include/hw/riscv/sifive_u_otp.h
> > index 4a5a0acf48..9bc781fd4f 100644
> > --- a/include/hw/riscv/sifive_u_otp.h
> > +++ b/include/hw/riscv/sifive_u_otp.h
> > @@ -45,6 +45,7 @@
> >
> >  #define SIFIVE_U_OTP_PA_MASK        0xfff
> >  #define SIFIVE_U_OTP_NUM_FUSES      0x1000
> > +#define SIFIVE_U_OTP_FUSE_WORD      4
> >  #define SIFIVE_U_OTP_SERIAL_ADDR    0xfc
> >
> >  #define SIFIVE_U_OTP_REG_SIZE       0x1000
> > @@ -78,6 +79,7 @@ typedef struct SiFiveUOTPState {
> >      uint32_t fuse_wo[SIFIVE_U_OTP_NUM_FUSES];
> >      /* config */
> >      uint32_t serial;
> > +    BlockBackend *blk;
> >  } SiFiveUOTPState;
> >
> >  #endif /* HW_SIFIVE_U_OTP_H */
> > --
> > 2.17.1
> >
> >

