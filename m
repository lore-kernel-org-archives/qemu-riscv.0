Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUhcM-00005O-5O
	for mharc-qemu-riscv@gnu.org; Mon, 19 Oct 2020 22:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kUhcK-000055-Uu
 for qemu-riscv@nongnu.org; Mon, 19 Oct 2020 22:43:16 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:33488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kUhcI-0003hg-MY
 for qemu-riscv@nongnu.org; Mon, 19 Oct 2020 22:43:16 -0400
Received: by mail-qk1-x741.google.com with SMTP id y198so394157qka.0
 for <qemu-riscv@nongnu.org>; Mon, 19 Oct 2020 19:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QGhNw3ofxCAvVNnc4W09NQkI/S08+z6oo3UBPlGeL8w=;
 b=RQSsIZfpLFLhx+3bWXoJGO6x8b/stbfQwOvFHEoUdcsKc4xSwJ3zPvdMrw0GfvooAT
 ehdDPvW+TtwPBooqMa7H/wq3D+I6KcU01rs8Bn+YMSjk+BwG0u5+tJ1Av8pcnBE2BkZA
 k0YHQy5WkCkH0FnRkcqZvcNEJpdKwqh5OtpKihMGKHc+zQT7TgtBv7f6rzgQmJh02lQQ
 DuZK1Di+AIkBQMOaYtn9W2CE4KdkEUqtQt5EWwqwj1fdEUW/eIWSvhG53Ia8kgNXxi24
 xJIrcVxlN5ji26163YY2R2zJq7HVoLBenIgULUUCxhmVdEkP7arZrpJ4QCf1lq58Ubv6
 N5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QGhNw3ofxCAvVNnc4W09NQkI/S08+z6oo3UBPlGeL8w=;
 b=XVyO0o0l0sXrySWt38lA2AZkh312TeHr4cgXyJOglSFC3UiNzaGQDGmQz0cquKX8ot
 jCXQdfM/+M4FWubYMN4mDSJ+kvvHmpbCYbRaqCxsiAiB0qakp90niu4MUFhcsfPamdv5
 +dOGZQW4EUI8BPajZdPHNIIxVqF/Mejfi6sSmz6N8M6w9e+oigcWhqRmNxJ9lcbVj0RE
 DwshIIwmuYXR7CJsLhy0XqhDyeTlSQ2FIPWHIuJE9mMqqXXyRpPUVelWSwyDDYjyRCqD
 8uwwiCCfdDQ+tNddXheL6ZdK1YI87q7ZMble1RDYK6HrQtdJtTTz6tbvAHSfouGunfM7
 KMAw==
X-Gm-Message-State: AOAM532Y8In6SERD2Q8FgrlKd+lFVO31T6JZHOYJl2Rhq7gsVBmy4Opf
 TGQgFdrOp+t+a+u10Vp3ir+bnwTfnplv7QyXHwQJ4A==
X-Google-Smtp-Source: ABdhPJwb55vccGQbXpBlMpIFu7YK4q1tmNhscH8VLDtkHpdr+2v6u5vo8lE76yq+2j3zTof4Gir7wymL3KhJvurjAoU=
X-Received: by 2002:a37:e20d:: with SMTP id g13mr731011qki.325.1603161792944; 
 Mon, 19 Oct 2020 19:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201015041424.23090-1-green.wan@sifive.com>
 <20201015041424.23090-3-green.wan@sifive.com>
 <CAEUhbmXZ5wXWyPqMwfwMoRUzmuKzj7-7QAXGd10MYhKanQhwbg@mail.gmail.com>
In-Reply-To: <CAEUhbmXZ5wXWyPqMwfwMoRUzmuKzj7-7QAXGd10MYhKanQhwbg@mail.gmail.com>
From: Green Wan <green.wan@sifive.com>
Date: Tue, 20 Oct 2020 10:43:01 +0800
Message-ID: <CAJivOr4OCiVr6Ez2z+i74pup2r_fOyvuyhC40jnPk2T0rA=0yQ@mail.gmail.com>
Subject: Re: [RFC PATCH v7 2/2] hw/misc/sifive_u_otp: Add backend drive support
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>
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
X-List-Received-Date: Tue, 20 Oct 2020 02:43:17 -0000

Sorry for replying late. I missed this email. I will revise the patch
today. Thanks,

- Green

On Thu, Oct 15, 2020 at 4:01 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Oct 15, 2020 at 12:15 PM Green Wan <green.wan@sifive.com> wrote:
> >
> > Add '-drive' support to OTP device. Allow users to assign a raw file
> > as OTP image.
> >
> > test commands for 16k otp.img filled with zero:
> >
> > $ dd if=/dev/zero of=./otp.img bs=1k count=16
> > $ ./qemu-system-riscv64 -M sifive_u -m 256M -nographic -bios none \
> > -kernel ../opensbi/build/platform/sifive/fu540/firmware/fw_payload.elf \
> > -d guest_errors -drive if=none,format=raw,file=otp.img
> >
> > Signed-off-by: Green Wan <green.wan@sifive.com>
> > ---
> >  hw/misc/sifive_u_otp.c         | 67 +++++++++++++++++++++++++++++++++-
> >  include/hw/misc/sifive_u_otp.h |  2 +
> >  2 files changed, 68 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
> > index 565eec082f..60066375ab 100644
> > --- a/hw/misc/sifive_u_otp.c
> > +++ b/hw/misc/sifive_u_otp.c
> > @@ -19,11 +19,14 @@
> >   */
> >
> >  #include "qemu/osdep.h"
> > +#include "qapi/error.h"
> >  #include "hw/qdev-properties.h"
> >  #include "hw/sysbus.h"
> >  #include "qemu/log.h"
> >  #include "qemu/module.h"
> >  #include "hw/misc/sifive_u_otp.h"
> > +#include "sysemu/blockdev.h"
> > +#include "sysemu/block-backend.h"
> >
> >  #define WRITTEN_BIT_ON 0x1
> >
> > @@ -54,6 +57,16 @@ static uint64_t sifive_u_otp_read(void *opaque, hwaddr addr, unsigned int size)
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
> > @@ -137,7 +150,7 @@ static void sifive_u_otp_write(void *opaque, hwaddr addr,
> >          if (s->pwe && !s->pas) {
> >              if (GET_FUSEARRAY_BIT(s->fuse_wo, s->pa, s->paio)) {
> >                  qemu_log_mask(LOG_GUEST_ERROR,
> > -                              "Error: write idx<%u>, bit<%u>\n",
> > +                              "write once error: idx<%u>, bit<%u>\n",
>
> This should be in the patch 1.
>
> >                                s->pa, s->paio);
> >                  break;
> >              }
> > @@ -145,6 +158,12 @@ static void sifive_u_otp_write(void *opaque, hwaddr addr,
> >              /* write bit data */
> >              SET_FUSEARRAY_BIT(s->fuse, s->pa, s->paio, s->pdin);
> >
> > +            /* write to backend */
> > +            if (s->blk) {
> > +                blk_pwrite(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD,
> > +                           &s->fuse[s->pa], SIFIVE_U_OTP_FUSE_WORD, 0);
> > +            }
> > +
> >              /* update written bit */
> >              SET_FUSEARRAY_BIT(s->fuse_wo, s->pa, s->paio, WRITTEN_BIT_ON);
> >          }
> > @@ -168,16 +187,48 @@ static const MemoryRegionOps sifive_u_otp_ops = {
> >
> >  static Property sifive_u_otp_properties[] = {
> >      DEFINE_PROP_UINT32("serial", SiFiveUOTPState, serial, 0),
> > +    DEFINE_PROP_DRIVE("drive", SiFiveUOTPState, blk),
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> >
>
> Otherwise,
> Reviewed-by: Bin Meng <bin.meng@windriver.com>
> Tested-by: Bin Meng <bin.meng@windriver.com>
>
> You can drop the "RFC" tag in the next version.

