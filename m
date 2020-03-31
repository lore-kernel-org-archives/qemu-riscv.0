Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jJ9Gg-0004oL-IC
	for mharc-qemu-riscv@gnu.org; Tue, 31 Mar 2020 01:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38366)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anup@brainfault.org>) id 1jJ9Gd-0004nq-G6
 for qemu-riscv@nongnu.org; Tue, 31 Mar 2020 01:16:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anup@brainfault.org>) id 1jJ9Gb-0006Gl-J4
 for qemu-riscv@nongnu.org; Tue, 31 Mar 2020 01:16:51 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:35026)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <anup@brainfault.org>) id 1jJ9Gb-0006DM-A3
 for qemu-riscv@nongnu.org; Tue, 31 Mar 2020 01:16:49 -0400
Received: by mail-wm1-x342.google.com with SMTP id i19so1140037wmb.0
 for <qemu-riscv@nongnu.org>; Mon, 30 Mar 2020 22:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XDVphgSccmvYcqFyScudPHlOHHRlMUeMdNPPF1BkBPk=;
 b=bnmGrBYqxAQkUCIae67D73qblc5THSKXJnDPGTIljlPuPOzZp2vymVOvwEU+9NuaOz
 qsEL2jwiJz36OQvIXqAkB0gJWbd6mYgrnLPLkF9jOlBXC9yMQ7jtTmkEnlBov42RJ1e/
 xgZaJNbwhcO4GGBAkoJDuYkj3yLQItMyf6sq1AabEpSH2AvbOCXwiK75XN4u+gVH53V1
 yJkrC4Mr5AGpCS9B0utMcGKMOUEFNtli5S3ESOGjpZhATgQqh9Y6GOWnMUUDwCTvhSSm
 mZFZY2fk5mGI0ni1fqoJtNoOZjEKyFVYgdGp2tVM6mxwwOUBn/NL/bP7akNuABURp/MS
 PwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XDVphgSccmvYcqFyScudPHlOHHRlMUeMdNPPF1BkBPk=;
 b=J/4/yUKjXrTt4B66fOJedvjcviIbw2Pd7u5MTHmpsfg4KJqamvCDDRKcAzNeAslGzS
 R0EUGrbI0skS8UKj6OJZXbJ/GcvH4KgeFUj3+p9SRiQ9MhxbvC9C1sKj5TXjlDzoygQG
 qnngxkaK6y/s1EK/3WPe/RvPnVIdK854G5ueYKHFI0epe4VizbITCMhL6eEgzVcmtvA3
 XtjCEazqpZxwiMQqYzGPJWW+g2vv71j/ULa1Beo2joTXJ0D0RARdEJO3Flg54UIcv+dj
 qo3GGYcWkoTojGY6vW/bndQkhZJeZXw5yDxkctRXc0rmNDBp0vFKKHSQoWVFlF3uK7It
 8LUQ==
X-Gm-Message-State: ANhLgQ0B4lN8ITtV2Q+fOAUoMSEWymLOdXIvUxVQcahPAaSSj0WmiTUQ
 89x/UFqteGeSBk5ODesyOYShJfbPdEhru6RLPDBD+A==
X-Google-Smtp-Source: ADFU+vvd2njPlrWxTZF97cgeZmHgYyLh6LgsQXjiwYBgIHxI9cRvsYMNUNHwUbHFSnXtAX0OMkCjhr1cZFXkxBZ0zJw=
X-Received: by 2002:a1c:6385:: with SMTP id x127mr1455502wmb.141.1585631804849; 
 Mon, 30 Mar 2020 22:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200313034949.3028-1-jiangyifei@huawei.com>
 <20200313034949.3028-9-jiangyifei@huawei.com>
In-Reply-To: <20200313034949.3028-9-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 31 Mar 2020 10:46:32 +0530
Message-ID: <CAAhSdy3EE+2V+e0po7kmdEau_88CEJ-D9yu7=PQ4ZJQ=zWr9YA@mail.gmail.com>
Subject: Re: [PATCH RFC 8/9] target/riscv: Handler KVM_EXIT_RISCV_SBI exit
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Anup Patel <anup.patel@wdc.com>, zhang.zhanghailiang@huawei.com, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 victor.zhangxiaofeng@huawei.com, 
 Alistair Francis <Alistair.Francis@wdc.com>, yinyipeng1@huawei.com, 
 Palmer Dabbelt <palmer@dabbelt.com>, dengkai1@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
X-List-Received-Date: Tue, 31 Mar 2020 05:16:53 -0000

On Fri, Mar 13, 2020 at 9:23 AM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Use char-fe handler console sbi call, which implement early
> console io while apply 'earlycon=sbi' into kernel parameters.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
> ---
>  target/riscv/kvm.c | 54 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 0f429fd802..1df70fbb29 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -38,6 +38,7 @@
>  #include "qemu/log.h"
>  #include "hw/loader.h"
>  #include "kvm_riscv.h"
> +#include "chardev/char-fe.h"
>
>  static __u64 kvm_riscv_reg_id(__u64 type, __u64 idx)
>  {
> @@ -61,6 +62,19 @@ static __u64 kvm_riscv_reg_id(__u64 type, __u64 idx)
>
>  #define RISCV_FP_D_REG(idx)  kvm_riscv_reg_id(KVM_REG_RISCV_FP_D, idx)
>
> +enum sbi_ext_id {
> +    SBI_EXT_0_1_SET_TIMER = 0x0,
> +    SBI_EXT_0_1_CONSOLE_PUTCHAR = 0x1,
> +    SBI_EXT_0_1_CONSOLE_GETCHAR = 0x2,
> +    SBI_EXT_0_1_CLEAR_IPI = 0x3,
> +    SBI_EXT_0_1_SEND_IPI = 0x4,
> +    SBI_EXT_0_1_REMOTE_FENCE_I = 0x5,
> +    SBI_EXT_0_1_REMOTE_SFENCE_VMA = 0x6,
> +    SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID = 0x7,
> +    SBI_EXT_0_1_SHUTDOWN = 0x8,
> +    SBI_EXT_BASE = 0x10,
> +};
> +

Please add separate SBI ecall interface header (similar to OpenSBI).
This header will only have SBI spec related defines.

Refer,
https://github.com/riscv/opensbi/blob/master/include/sbi/sbi_ecall_interface.h

>  static int kvm_riscv_get_regs_core(CPUState *cs)
>  {
>      int ret = 0;
> @@ -423,9 +437,47 @@ bool kvm_arch_stop_on_emulation_error(CPUState *cs)
>      return true;
>  }
>
> +static int kvm_riscv_handle_sbi(struct kvm_run *run)
> +{
> +    int ret = 0;
> +    unsigned char ch;
> +    switch (run->riscv_sbi.extension_id) {
> +    case SBI_EXT_0_1_CONSOLE_PUTCHAR:
> +        ch = run->riscv_sbi.args[0];
> +        qemu_chr_fe_write(serial_hd(0)->be, &ch, sizeof(ch));
> +        break;
> +    case SBI_EXT_0_1_CONSOLE_GETCHAR:
> +        ret = qemu_chr_fe_read_all(serial_hd(0)->be, &ch, sizeof(ch));
> +        if (ret == sizeof(ch)) {
> +            run->riscv_sbi.args[0] = ch;
> +        } else {
> +            run->riscv_sbi.args[0] = -1;
> +        }
> +        break;

Please emulate SBI v0.1 Shutdown call as well.

> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s: un-handled SBI EXIT, specific reasons is %lu\n",
> +                      __func__, run->riscv_sbi.extension_id);
> +        ret = -1;
> +        break;
> +    }
> +    return ret;
> +}
> +
>  int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>  {
> -    return 0;
> +    int ret = 0;
> +    switch (run->exit_reason) {
> +    case KVM_EXIT_RISCV_SBI:
> +        ret = kvm_riscv_handle_sbi(run);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: un-handled exit reason %d\n",
> +                      __func__, run->exit_reason);
> +        ret = -1;
> +        break;
> +    }
> +    return ret;
>  }
>
>  void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
> --
> 2.19.1
>
>
>

Regards,
Anup

