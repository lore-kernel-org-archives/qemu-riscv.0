Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kD0cv-0004OY-RA
	for mharc-qemu-riscv@gnu.org; Tue, 01 Sep 2020 03:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kD0cu-0004O5-Ph
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2020 03:22:44 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:37199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <green.wan@sifive.com>)
 id 1kD0cs-0008NY-Rj
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2020 03:22:44 -0400
Received: by mail-qk1-x744.google.com with SMTP id b14so96902qkn.4
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2020 00:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fzl3V/fzSJoJLMxxy5h00MuVHG+2CUth3EhTKYo7jC4=;
 b=B27VaGb0SeupYxUdMeRH4eyn3Cr9MH4ELQYYy8+7IN/v7jjiA80st+HaRyEeeIqnxx
 wC5tAJr/vfIZX0foCQDVPdsnemvC4vDceNI+JQ3UZgYTASi4TgJtc0U0dNAfH2ZLo6Mm
 6kRKnH4xAwYjGagutLNRYiugbZ8PhWyXcWbegw+NpxqNJ3Z0qbmLa2pXLjAAecKwrCA1
 eyFjir3RlbBXCfVzwLH2SUtjoNmQT25+Je2fw03UWr+Z15strD1cH33kKWXcS3APZxaw
 JRklU5iTtbTnZjDWAe2jPiHY/iumEgnClMNMPwM6x8PR89tMPaKKA59hHV/oufAFcTWU
 fNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fzl3V/fzSJoJLMxxy5h00MuVHG+2CUth3EhTKYo7jC4=;
 b=j257VLOy+to4tTa/1ttx8MEeMVOYZceSJFv0P2A7bKUccb0P+pV2ajQCstZgDHC+c6
 B7eykN2q7w2Xu9aiVwRFVmiqij/GObOIqjemyyuZRK9RG2m0xo5TgBtg3IE1gkpZ7qR+
 3IvaBK+HArGuNtgJJ463Og5fDu65x/6P5pRNWhP71MhRvBqnhCbLrasEyhEc5KGUzeFj
 rw7MlsTphC6czUtgVyPGuLFli/bz5B82x9QjDCbX7m7thMNa2SNgR+Vu1qtB2iqgUxWI
 ZNQV2joJ68FHyDTxkX4vVbHmxQn2pfXizXyA6TOnf3XcUmh1ct6za0rSUvv4p1XOdZHd
 GayQ==
X-Gm-Message-State: AOAM530QNjK26/PZjOeZ96yow4ROwmnFn8bB6Z4oFMTN3LrTLY2tTHkb
 e9RudDNC4EOxWCWbNnHIGEOfICjGt9Kly9X1+zMKEg==
X-Google-Smtp-Source: ABdhPJxiMDGTn1eUGPaccpP1jLAmLec+ihmGiexxVFXJCigwP8cviCxd0AoQbr5WXZirHr1b/Zr3MHARsY6LJi4W0aY=
X-Received: by 2002:a05:620a:15ac:: with SMTP id
 f12mr509657qkk.19.1598944961109; 
 Tue, 01 Sep 2020 00:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200827074638.21451-1-green.wan@sifive.com>
 <20200827074638.21451-2-green.wan@sifive.com>
 <CAEUhbmUXDiBHzy=CMQAYVzt0NY-JK_KVn-QL-Equw6pRxEiu8w@mail.gmail.com>
In-Reply-To: <CAEUhbmUXDiBHzy=CMQAYVzt0NY-JK_KVn-QL-Equw6pRxEiu8w@mail.gmail.com>
From: Green Wan <green.wan@sifive.com>
Date: Tue, 1 Sep 2020 15:22:30 +0800
Message-ID: <CAJivOr564gqdmTdFe=3REXYYbW29Sg_1VOOpYZMFP8GPyvascw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 1/2] hw/riscv: sifive_u: Add backend drive support
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
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
X-List-Received-Date: Tue, 01 Sep 2020 07:22:45 -0000

Hi Bin,

Thanks for the remindings. I didn't notice the write operation and
will add the write functionality based on bit by bit mechanism.

Regards,
Green


On Fri, Aug 28, 2020 at 8:54 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Green,
>
> On Thu, Aug 27, 2020 at 3:47 PM Green Wan <green.wan@sifive.com> wrote:
> >
> > Add '-drive' support to OTP device. Allow users to assign a raw file
> > as OTP image.
> >
> > Signed-off-by: Green Wan <green.wan@sifive.com>
> > ---
> >  hw/riscv/sifive_u_otp.c         | 50 +++++++++++++++++++++++++++++++++
> >  include/hw/riscv/sifive_u_otp.h |  2 ++
> >  2 files changed, 52 insertions(+)
> >
> > diff --git a/hw/riscv/sifive_u_otp.c b/hw/riscv/sifive_u_otp.c
> > index f6ecbaa2ca..aab2220494 100644
> > --- a/hw/riscv/sifive_u_otp.c
> > +++ b/hw/riscv/sifive_u_otp.c
> > @@ -24,6 +24,8 @@
> >  #include "qemu/log.h"
> >  #include "qemu/module.h"
> >  #include "hw/riscv/sifive_u_otp.h"
> > +#include "sysemu/blockdev.h"
> > +#include "sysemu/block-backend.h"
> >
> >  static uint64_t sifive_u_otp_read(void *opaque, hwaddr addr, unsigned int size)
> >  {
> > @@ -46,6 +48,16 @@ static uint64_t sifive_u_otp_read(void *opaque, hwaddr addr, unsigned int size)
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
> > @@ -123,6 +135,12 @@ static void sifive_u_otp_write(void *opaque, hwaddr addr,
> >          s->ptrim = val32;
> >          break;
> >      case SIFIVE_U_OTP_PWE:
> > +        /* write to backend */
> > +        if (s->blk) {
> > +            blk_pwrite(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD, &val32,
>
> The logic looks wrong to me. According to the U-Boot driver
> (sifive-otp.c) the content to be written to the OTP memory comes from
> s->pdin bit by bit. Here val32 represents whether to disable write or
> enable write.
>
> I think we should arrange patches like this:
>
> patch 1 to add OTP write functionality, to the existing s->fuse[] mechanism
> patch 2 to add file based backend write support
>
> > +                       SIFIVE_U_OTP_FUSE_WORD, 0);
> > +        }
> > +
> >          s->pwe = val32;
> >          break;
> >      default:
> > @@ -143,16 +161,48 @@ static const MemoryRegionOps sifive_u_otp_ops = {
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
> > +        filesize = SIFIVE_U_OTP_NUM_FUSES * SIFIVE_U_OTP_FUSE_WORD;
> > +        if (blk_getlength(blk) < filesize) {
> > +            qemu_log_mask(LOG_GUEST_ERROR, "OTP drive size < 16K\n");
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
> > +        }
> > +
> > +        if (blk_pread(s->blk, 0, s->fuse, filesize) != filesize) {
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                          "failed to read the initial flash content");
> > +            return;
> > +        }
> > +    }
> >  }
> >
> >  static void sifive_u_otp_reset(DeviceState *dev)
> > diff --git a/include/hw/riscv/sifive_u_otp.h b/include/hw/riscv/sifive_u_otp.h
> > index 639297564a..13d2552e43 100644
> > --- a/include/hw/riscv/sifive_u_otp.h
> > +++ b/include/hw/riscv/sifive_u_otp.h
> > @@ -43,6 +43,7 @@
> >
> >  #define SIFIVE_U_OTP_PA_MASK        0xfff
> >  #define SIFIVE_U_OTP_NUM_FUSES      0x1000
> > +#define SIFIVE_U_OTP_FUSE_WORD      4
> >  #define SIFIVE_U_OTP_SERIAL_ADDR    0xfc
> >
> >  #define SIFIVE_U_OTP_REG_SIZE       0x1000
> > @@ -75,6 +76,7 @@ typedef struct SiFiveUOTPState {
> >      uint32_t fuse[SIFIVE_U_OTP_NUM_FUSES];
> >      /* config */
> >      uint32_t serial;
> > +    BlockBackend *blk;
> >  } SiFiveUOTPState;
> >
> >  #endif /* HW_SIFIVE_U_OTP_H */
> > --
>
> Regards,
> Bin

