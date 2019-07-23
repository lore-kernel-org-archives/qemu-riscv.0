Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hpnNh-0002IU-EF
	for mharc-qemu-riscv@gnu.org; Tue, 23 Jul 2019 01:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42364)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hpnNf-0002IN-4n
 for qemu-riscv@nongnu.org; Tue, 23 Jul 2019 01:30:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hpnNe-00044N-6S
 for qemu-riscv@nongnu.org; Tue, 23 Jul 2019 01:30:31 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:36984)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hpnNd-0003wx-Sn; Tue, 23 Jul 2019 01:30:30 -0400
Received: by mail-ed1-x541.google.com with SMTP id w13so42640882eds.4;
 Mon, 22 Jul 2019 22:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4KbYU8cHAzZY2b+5mcZ7/0U7e12rwEVLcResTA8Ca7w=;
 b=oj/7zRNYrpBf7ylEzvyOUPSUYi+ing1Y+sk62fPjTV1YvTd0+ZwUrzNBSVKjzQWJ8u
 Zywns9jxgKS12+A29BWDXTr2UIVEbnrAFfS8QmLUDlqfFuxq6tqHsQAhzUkGMV/uLefn
 TRznJJiU5xvWVIlwsQttu61iGfl9a7fhECEJzlpIecKmsJQ15ATW/LpMB3spHbaqFDNm
 jkW9mVpI5EU+OS9j6mtrPYSFVAEHYilgBHlv2laRb3D5iWtgMlwdfBjJajGZNjeyIIRs
 Gt13zeF3yhuUnf2LytzqA4eiC1c0HD1XyHQuQmPLBP92QRm+gmqJXM1BstMLZf1Fxk1U
 rGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4KbYU8cHAzZY2b+5mcZ7/0U7e12rwEVLcResTA8Ca7w=;
 b=dQ0saBTc1FaQGDNyBLEb21nDc9tsOGONLVoNJCQP6OwBllw22rcOpZi2k2RqXiVTup
 rbk5Z7oUV+tRpswnAqbSwRPRJAO554pe+Ff28/lwOhCPz4AeWpSrxBAqUWoN9WeWGEW8
 Mb+35CINvgHOf8t2MgFP4nZO+c1BJZeqdgyIEeEVdeOivzfZFWW/kSIa9/qPjtl9sKTG
 lR30HbZn9k1cuKNdUxgdmOmY9gpaLiT/tgzMBEGQnwd/b5XTkbp43z/WVCpYKntlVs7w
 9joYBsTybtuzFZrMvpOsocqtORDu4XADSJfADCQ5Hx8L1w+44Uc0w0Fo81D5ZU69IHVt
 qfRQ==
X-Gm-Message-State: APjAAAXJu9tvN9RIFrDTUdoHC7knQS1Ituxk2gO6pYTGYPbm+gQ3hG8x
 KA3EFVsgdBXSDAQamGoccbe9tQF3O0hjoY38SjQ=
X-Google-Smtp-Source: APXvYqwyeukJIEbrh+YT/9zinHYiap4XIRzjpg2DrtfSWCS49DzX6eBQpaxif1n+SN34EHMVLz641pMAnChj9X1iKUM=
X-Received: by 2002:a50:ad01:: with SMTP id y1mr62515077edc.180.1563859828244; 
 Mon, 22 Jul 2019 22:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <1560525351-590-1-git-send-email-bmeng.cn@gmail.com>
 <mhng-7207f9be-4aaa-4b0f-9832-ee6682eb5749@palmer-si-x1e>
In-Reply-To: <mhng-7207f9be-4aaa-4b0f-9832-ee6682eb5749@palmer-si-x1e>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 23 Jul 2019 13:30:15 +0800
Message-ID: <CAEUhbmWfS8TPTRa-Ovc1gnPUC-3ofA4G+sR7PaSNzfWT-fPNfQ@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-riscv] [PATCH] riscv: sifive_test: Add reset functionality
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
X-List-Received-Date: Tue, 23 Jul 2019 05:30:32 -0000

Hi Palmer,

On Sat, Jul 20, 2019 at 9:47 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Fri, 14 Jun 2019 08:15:51 PDT (-0700), bmeng.cn@gmail.com wrote:
> > This adds a reset opcode for sifive_test device to trigger a system
> > reset for testing purpose.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> >
> >  hw/riscv/sifive_test.c         | 4 ++++
> >  include/hw/riscv/sifive_test.h | 3 ++-
> >  2 files changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/riscv/sifive_test.c b/hw/riscv/sifive_test.c
> > index 24a04d7..cd86831 100644
> > --- a/hw/riscv/sifive_test.c
> > +++ b/hw/riscv/sifive_test.c
> > @@ -21,6 +21,7 @@
> >  #include "qemu/osdep.h"
> >  #include "hw/sysbus.h"
> >  #include "qemu/module.h"
> > +#include "sysemu/sysemu.h"
> >  #include "target/riscv/cpu.h"
> >  #include "hw/riscv/sifive_test.h"
> >
> > @@ -40,6 +41,9 @@ static void sifive_test_write(void *opaque, hwaddr addr,
> >              exit(code);
> >          case FINISHER_PASS:
> >              exit(0);
> > +        case FINISHER_RESET:
> > +            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> > +            return;
> >          default:
> >              break;
> >          }
> > diff --git a/include/hw/riscv/sifive_test.h b/include/hw/riscv/sifive_test.h
> > index 71d4c9f..c186a31 100644
> > --- a/include/hw/riscv/sifive_test.h
> > +++ b/include/hw/riscv/sifive_test.h
> > @@ -34,7 +34,8 @@ typedef struct SiFiveTestState {
> >
> >  enum {
> >      FINISHER_FAIL = 0x3333,
> > -    FINISHER_PASS = 0x5555
> > +    FINISHER_PASS = 0x5555,
> > +    FINISHER_RESET = 0x7777
> >  };
> >
> >  DeviceState *sifive_test_create(hwaddr addr);
>
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

Thanks a lot!

> Sorry this took a while, but it's in the hardware now.  I'll merge this, but
> I'm considering it a new feature so it'll be held off a bit.

"but it's in the hardware now", do you mean the code I added (0x7777)
is now supported by a newer version SiFive test device with compatible
string "sifive,test1", and can actually do the system wide reset?

Regards,
Bin

