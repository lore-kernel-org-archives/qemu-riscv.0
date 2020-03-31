Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jJDYc-0006on-9d
	for mharc-qemu-riscv@gnu.org; Tue, 31 Mar 2020 05:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40074)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anup@brainfault.org>) id 1jJDYY-0006ni-NK
 for qemu-riscv@nongnu.org; Tue, 31 Mar 2020 05:51:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anup@brainfault.org>) id 1jJDYX-0000gI-5h
 for qemu-riscv@nongnu.org; Tue, 31 Mar 2020 05:51:38 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:45607)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <anup@brainfault.org>) id 1jJDYW-0000eF-OH
 for qemu-riscv@nongnu.org; Tue, 31 Mar 2020 05:51:37 -0400
Received: by mail-wr1-x441.google.com with SMTP id t7so25047723wrw.12
 for <qemu-riscv@nongnu.org>; Tue, 31 Mar 2020 02:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7SGY3oCZHaKz2pqqEdhYIfsjenh6sx659/ev3BpTn+U=;
 b=CTwh0ZhSZLu5SdtgmKH3ezPHsxek1s6tfXnCZEnDbmwOtH9NJuyJL/WtArUEvRO/EW
 D0hpDumnokRZxbEmuPD0Vv/GmpOBJVvYhopSxjJJufe6+ibTkX8o7en1cCmEknca2eoh
 rj+FhHQhsp7jSRqyxmB8kM+aZNV8Wst686Dr4UvOYRxBPvsBJDuT+fjUa27i7kQIXGbC
 btJt6ZwShIvwdpOn3dz5JdzeFmO7S/tV9f4riUuCtlua0BcKOXFEx91Q3CPtk8zwjM1h
 RJrC/fssFCd3YPx6ApGPFs55PH5Aiyk3rCjN0P/o/+w3wQ7N2StK66svo/75a9+OY61b
 tBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7SGY3oCZHaKz2pqqEdhYIfsjenh6sx659/ev3BpTn+U=;
 b=YFQaz28vgXctICyzOC8M2Rviy3DutON2MkqkVx8nXRlgyGGvi0WyDOuSw6+Zc2pnlH
 MbB2L8uOoV+MHDN0rbede3sksTx8pTDY/RjpAPERA+KQW76MvbLxKMszj2mAo+s5mvCd
 aoVuAT4MEo1IgccKWIR0BmJwZ+xSJMK7P/Ez//z7RoTExrRc0eqWwRE4VIvFJO9CAYFy
 mWOy5R7Q8B5Pcf3px5ildgppf+bcUDZ7hiCVis6kkXFxaEbUtM5DIPSEzprd53TE1xQC
 LOngjiM/pRrZLSNezGEw14IDPIfn7Lts+eKQ6Mk2JV9Z/ykJAzMXeMDFJKiZt0vFuGvZ
 RCvw==
X-Gm-Message-State: ANhLgQ0DXrZkJaLBXAvm0Q3z8rSbi1VwC3FKtqzRsipu+7r9PlUyCXhI
 H8NrRUddbwsEm6bJFF5XxM9QdeQAFA8K/crkAiasrA==
X-Google-Smtp-Source: ADFU+vvL7EgwdIx8sc/ATwS4gco2A8ByuQ0l6FcC4CkxG+vNQuOdFDlLBvt8z3AALKvBFSbMiYL1MpcV7t154QuDZ04=
X-Received: by 2002:a5d:4acd:: with SMTP id y13mr19547055wrs.61.1585648294934; 
 Tue, 31 Mar 2020 02:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200313034949.3028-1-jiangyifei@huawei.com>
 <20200313034949.3028-9-jiangyifei@huawei.com>
 <CAAhSdy3EE+2V+e0po7kmdEau_88CEJ-D9yu7=PQ4ZJQ=zWr9YA@mail.gmail.com>
 <3915816D913D8241BB43E932213F57D4ADC75680@dggemm525-mbs.china.huawei.com>
In-Reply-To: <3915816D913D8241BB43E932213F57D4ADC75680@dggemm525-mbs.china.huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 31 Mar 2020 15:21:23 +0530
Message-ID: <CAAhSdy2ZNzm1t2=x-Nz-aJAMAWL58KD=H45XYvE8CtM0W4vcdA@mail.gmail.com>
Subject: Re: [PATCH RFC 8/9] target/riscv: Handler KVM_EXIT_RISCV_SBI exit
To: Jiangyifei <jiangyifei@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Anup Patel <anup.patel@wdc.com>, Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "Zhangxiaofeng (F)" <victor.zhangxiaofeng@huawei.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, yinyipeng <yinyipeng1@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, "dengkai (A)" <dengkai1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
X-List-Received-Date: Tue, 31 Mar 2020 09:51:40 -0000

On Tue, Mar 31, 2020 at 2:56 PM Jiangyifei <jiangyifei@huawei.com> wrote:
>
>
> > -----Original Message-----
> > From: Anup Patel [mailto:anup@brainfault.org]
> > Sent: Tuesday, March 31, 2020 1:17 PM
> > To: Jiangyifei <jiangyifei@huawei.com>
> > Cc: QEMU Developers <qemu-devel@nongnu.org>; open list:RISC-V <qemu-
> > riscv@nongnu.org>; Anup Patel <anup.patel@wdc.com>; Zhanghailiang
> > <zhang.zhanghailiang@huawei.com>; Sagar Karandikar
> > <sagark@eecs.berkeley.edu>; Bastian Koppelmann <kbastian@mail.uni-
> > paderborn.de>; Zhangxiaofeng (F) <victor.zhangxiaofeng@huawei.com>;
> > Alistair Francis <Alistair.Francis@wdc.com>; yinyipeng
> > <yinyipeng1@huawei.com>; Palmer Dabbelt <palmer@dabbelt.com>;
> > dengkai (A) <dengkai1@huawei.com>
> > Subject: Re: [PATCH RFC 8/9] target/riscv: Handler KVM_EXIT_RISCV_SBI exit
> >
> > On Fri, Mar 13, 2020 at 9:23 AM Yifei Jiang <jiangyifei@huawei.com> wrote:
> > >
> > > Use char-fe handler console sbi call, which implement early console io
> > > while apply 'earlycon=sbi' into kernel parameters.
> > >
> > > Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> > > Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
> > > ---
> > >  target/riscv/kvm.c | 54
> > > +++++++++++++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 53 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c index
> > > 0f429fd802..1df70fbb29 100644
> > > --- a/target/riscv/kvm.c
> > > +++ b/target/riscv/kvm.c
> > > @@ -38,6 +38,7 @@
> > >  #include "qemu/log.h"
> > >  #include "hw/loader.h"
> > >  #include "kvm_riscv.h"
> > > +#include "chardev/char-fe.h"
> > >
> > >  static __u64 kvm_riscv_reg_id(__u64 type, __u64 idx)  { @@ -61,6
> > > +62,19 @@ static __u64 kvm_riscv_reg_id(__u64 type, __u64 idx)
> > >
> > >  #define RISCV_FP_D_REG(idx)  kvm_riscv_reg_id(KVM_REG_RISCV_FP_D,
> > > idx)
> > >
> > > +enum sbi_ext_id {
> > > +    SBI_EXT_0_1_SET_TIMER = 0x0,
> > > +    SBI_EXT_0_1_CONSOLE_PUTCHAR = 0x1,
> > > +    SBI_EXT_0_1_CONSOLE_GETCHAR = 0x2,
> > > +    SBI_EXT_0_1_CLEAR_IPI = 0x3,
> > > +    SBI_EXT_0_1_SEND_IPI = 0x4,
> > > +    SBI_EXT_0_1_REMOTE_FENCE_I = 0x5,
> > > +    SBI_EXT_0_1_REMOTE_SFENCE_VMA = 0x6,
> > > +    SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID = 0x7,
> > > +    SBI_EXT_0_1_SHUTDOWN = 0x8,
> > > +    SBI_EXT_BASE = 0x10,
> > > +};
> > > +
> >
> > Please add separate SBI ecall interface header (similar to OpenSBI).
> > This header will only have SBI spec related defines.
> >
> > Refer,
> > https://github.com/riscv/opensbi/blob/master/include/sbi/sbi_ecall_interfa
> > ce.h
>
> Yes, thanks for your review. I'll update it at next series after you review this series all.
>
> >
> > >  static int kvm_riscv_get_regs_core(CPUState *cs)  {
> > >      int ret = 0;
> > > @@ -423,9 +437,47 @@ bool
> > kvm_arch_stop_on_emulation_error(CPUState *cs)
> > >      return true;
> > >  }
> > >
> > > +static int kvm_riscv_handle_sbi(struct kvm_run *run) {
> > > +    int ret = 0;
> > > +    unsigned char ch;
> > > +    switch (run->riscv_sbi.extension_id) {
> > > +    case SBI_EXT_0_1_CONSOLE_PUTCHAR:
> > > +        ch = run->riscv_sbi.args[0];
> > > +        qemu_chr_fe_write(serial_hd(0)->be, &ch, sizeof(ch));
> > > +        break;
> > > +    case SBI_EXT_0_1_CONSOLE_GETCHAR:
> > > +        ret = qemu_chr_fe_read_all(serial_hd(0)->be, &ch, sizeof(ch));
> > > +        if (ret == sizeof(ch)) {
> > > +            run->riscv_sbi.args[0] = ch;
> > > +        } else {
> > > +            run->riscv_sbi.args[0] = -1;
> > > +        }
> > > +        break;
> >
> > Please emulate SBI v0.1 Shutdown call as well.
>
> It seems that there is no need for emulating SHUTDOWN call at QEMU.
> SBI_EXT_0_1_SHUTDOWN is redirect to KVM_SYSTEM_EVENT_SHUTDOWN in KVM,
> which is handled by common kvm-exit handler in QEMU.
> And, It is normal to perform `poweroff` in the virtual machine.

Ahh, yes I forgot about KVM_SYSTEM_EVENT_SHUTDOWN

No need to handle SBI_EXT_0_1_SHUTDOWN here.

Regards,
Anup

>
> >
> > > +    default:
> > > +        qemu_log_mask(LOG_UNIMP,
> > > +                      "%s: un-handled SBI EXIT, specific reasons is %lu\n",
> > > +                      __func__, run->riscv_sbi.extension_id);
> > > +        ret = -1;
> > > +        break;
> > > +    }
> > > +    return ret;
> > > +}
> > > +
> > >  int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)  {
> > > -    return 0;
> > > +    int ret = 0;
> > > +    switch (run->exit_reason) {
> > > +    case KVM_EXIT_RISCV_SBI:
> > > +        ret = kvm_riscv_handle_sbi(run);
> > > +        break;
> > > +    default:
> > > +        qemu_log_mask(LOG_UNIMP, "%s: un-handled exit reason %d\n",
> > > +                      __func__, run->exit_reason);
> > > +        ret = -1;
> > > +        break;
> > > +    }
> > > +    return ret;
> > >  }
> > >
> > >  void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
> > > --
> > > 2.19.1
> > >
> > >
> > >
> >
> > Regards,
> > Anup
>
> Best regards,
> Yifei Jiang

