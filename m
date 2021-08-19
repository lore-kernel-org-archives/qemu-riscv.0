Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGbJS-00035K-Rc
	for mharc-qemu-riscv@gnu.org; Thu, 19 Aug 2021 02:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGbJR-00031C-Eo; Thu, 19 Aug 2021 02:14:01 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:36449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mGbJP-0001n5-HQ; Thu, 19 Aug 2021 02:14:01 -0400
Received: by mail-io1-xd35.google.com with SMTP id f11so6251981ioj.3;
 Wed, 18 Aug 2021 23:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hau+lDTq9Vb9TyOnVnIceEZbFlNptP4zxXLpB8kHO3I=;
 b=C+xA5UmbGF4UtYT3zBcOIEN2SxMWjm/PKCnqnMt2g+S6dDR6uuWG9uETKBgQrThB03
 VQCBaexJU5bdNSyq1AxaM/tFvpTfWDOUOXMWkKe9vcj2g0siw36JBnQhfYNzQ3LLtBEK
 Wl5gpFXmFjTzLq867CO9XI/hthER86dl6n+vohILItMg7VNp9fGEejljpjcynaamST91
 NpAATLV4B9SqzFzFKG9agtlZxHfXRAABYSGkrb3NKgcHi/lgZIIDOvISD6xpvKoTC17P
 8mdmFeJxYvJsUUBlqQrCUOOqLl0I5epfnIgzD/Nv917qeSLR26xmig7AgwNkqwieV+hS
 z5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hau+lDTq9Vb9TyOnVnIceEZbFlNptP4zxXLpB8kHO3I=;
 b=Hrq14b7UIWjycHi6xLu5j9kqP1rIa1TUx9mQvAGt5gU/2jCVG/OHselBv6soDfCxlj
 W9xno+w7evLfczVlNP/G3Vf78cwKn0pXOOHdBUf36haXkbn4Uiva8WZs2iTA+f1RJfIR
 HdscYrY5TwauGLywoEAcZG1cFpPzDSb9uQsIRedPlDTikVnvzlrHKOpoAUCjpVS1X/EH
 dKruZu1Zn+lGJ1ugkjdr9z6M6UDtHGW95K9sZBRyN60LHTXB6L/DgJpdLkohBYiwl6OT
 HAwG+P2vTLf4gn8+HUX+W7ZqmG9Pacx9XUdw57oZ+hbVm6Chgnan86//Ggq4fz0Z+oDY
 Bs6A==
X-Gm-Message-State: AOAM531oqC9kEP8tinbQFV5F6CCOggmq/jyjCETba7uSxG5LxczOLg9r
 nudniu09vsn/wOzMC/X+pIlSeX5A3j7nn0ZeRtw=
X-Google-Smtp-Source: ABdhPJziOzMst9AmuYG2afBE04QJKvczKncxVwPpgTJJdW1cCQh7eLl9vKVNIMOJb56juc54WB/Knn+YTqv9vc88xAc=
X-Received: by 2002:a5d:8541:: with SMTP id b1mr10193893ios.105.1629353637845; 
 Wed, 18 Aug 2021 23:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210817032447.2055-1-jiangyifei@huawei.com>
 <20210817032447.2055-9-jiangyifei@huawei.com>
In-Reply-To: <20210817032447.2055-9-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Aug 2021 16:13:31 +1000
Message-ID: <CAKmqyKOm6fxqzScq74hS1NS2=K786MX-oCEA8fG+xOrQi+LQOQ@mail.gmail.com>
Subject: Re: [PATCH RFC v6 08/12] target/riscv: Handle KVM_EXIT_RISCV_SBI exit
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>, "limingwang (A)" <limingwang@huawei.com>, 
 "open list:Overall" <kvm@vger.kernel.org>, libvir-list@redhat.com, 
 Anup Patel <anup.patel@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>, 
 kvm-riscv@lists.infradead.org, wanghaibin.wang@huawei.com, 
 Palmer Dabbelt <palmer@dabbelt.com>, fanliang@huawei.com,
 "Wubin (H)" <wu.wubin@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-List-Received-Date: Thu, 19 Aug 2021 06:14:01 -0000

On Tue, Aug 17, 2021 at 1:25 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Use char-fe to handle console sbi call, which implement early
> console io while apply 'earlycon=sbi' into kernel parameters.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> ---
>  target/riscv/kvm.c                 | 42 ++++++++++++++++-
>  target/riscv/sbi_ecall_interface.h | 72 ++++++++++++++++++++++++++++++
>  2 files changed, 113 insertions(+), 1 deletion(-)
>  create mode 100644 target/riscv/sbi_ecall_interface.h
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index bc9cb5d8f9..a68f31c2f3 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -38,6 +38,8 @@
>  #include "qemu/log.h"
>  #include "hw/loader.h"
>  #include "kvm_riscv.h"
> +#include "sbi_ecall_interface.h"
> +#include "chardev/char-fe.h"
>
>  static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx)
>  {
> @@ -435,9 +437,47 @@ bool kvm_arch_stop_on_emulation_error(CPUState *cs)
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

These have been deprecated (see
https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.adoc#4-legacy-extensions-eids-0x00---0x0f),
is it even worth supporting them?

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
> diff --git a/target/riscv/sbi_ecall_interface.h b/target/riscv/sbi_ecall_interface.h
> new file mode 100644
> index 0000000000..fb1a3fa8f2
> --- /dev/null
> +++ b/target/riscv/sbi_ecall_interface.h
> @@ -0,0 +1,72 @@
> +/*
> + * SPDX-License-Identifier: BSD-2-Clause
> + *
> + * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> + *
> + * Authors:
> + *   Anup Patel <anup.patel@wdc.com>
> + */
> +
> +#ifndef __SBI_ECALL_INTERFACE_H__
> +#define __SBI_ECALL_INTERFACE_H__
> +
> +/* clang-format off */
> +
> +/* SBI Extension IDs */
> +#define SBI_EXT_0_1_SET_TIMER           0x0
> +#define SBI_EXT_0_1_CONSOLE_PUTCHAR     0x1
> +#define SBI_EXT_0_1_CONSOLE_GETCHAR     0x2
> +#define SBI_EXT_0_1_CLEAR_IPI           0x3
> +#define SBI_EXT_0_1_SEND_IPI            0x4
> +#define SBI_EXT_0_1_REMOTE_FENCE_I      0x5
> +#define SBI_EXT_0_1_REMOTE_SFENCE_VMA   0x6
> +#define SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID 0x7
> +#define SBI_EXT_0_1_SHUTDOWN            0x8
> +#define SBI_EXT_BASE                    0x10
> +#define SBI_EXT_TIME                    0x54494D45
> +#define SBI_EXT_IPI                     0x735049
> +#define SBI_EXT_RFENCE                  0x52464E43
> +#define SBI_EXT_HSM                     0x48534D
> +
> +/* SBI function IDs for BASE extension*/
> +#define SBI_EXT_BASE_GET_SPEC_VERSION   0x0
> +#define SBI_EXT_BASE_GET_IMP_ID         0x1
> +#define SBI_EXT_BASE_GET_IMP_VERSION    0x2
> +#define SBI_EXT_BASE_PROBE_EXT          0x3
> +#define SBI_EXT_BASE_GET_MVENDORID      0x4
> +#define SBI_EXT_BASE_GET_MARCHID        0x5
> +#define SBI_EXT_BASE_GET_MIMPID         0x6
> +
> +/* SBI function IDs for TIME extension*/
> +#define SBI_EXT_TIME_SET_TIMER          0x0
> +
> +/* SBI function IDs for IPI extension*/
> +#define SBI_EXT_IPI_SEND_IPI            0x0
> +
> +/* SBI function IDs for RFENCE extension*/
> +#define SBI_EXT_RFENCE_REMOTE_FENCE_I       0x0
> +#define SBI_EXT_RFENCE_REMOTE_SFENCE_VMA    0x1
> +#define SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID  0x2
> +#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA   0x3
> +#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID 0x4
> +#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA   0x5
> +#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID 0x6
> +
> +/* SBI function IDs for HSM extension */
> +#define SBI_EXT_HSM_HART_START          0x0
> +#define SBI_EXT_HSM_HART_STOP           0x1
> +#define SBI_EXT_HSM_HART_GET_STATUS     0x2
> +
> +#define SBI_HSM_HART_STATUS_STARTED     0x0
> +#define SBI_HSM_HART_STATUS_STOPPED     0x1
> +#define SBI_HSM_HART_STATUS_START_PENDING   0x2
> +#define SBI_HSM_HART_STATUS_STOP_PENDING    0x3
> +
> +#define SBI_SPEC_VERSION_MAJOR_OFFSET   24
> +#define SBI_SPEC_VERSION_MAJOR_MASK     0x7f
> +#define SBI_SPEC_VERSION_MINOR_MASK     0xffffff
> +#define SBI_EXT_VENDOR_START            0x09000000
> +#define SBI_EXT_VENDOR_END              0x09FFFFFF
> +/* clang-format on */
> +
> +#endif
> --
> 2.19.1
>
>

