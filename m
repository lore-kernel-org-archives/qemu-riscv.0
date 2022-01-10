Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n6oUt-0000nr-FY
	for mharc-qemu-riscv@gnu.org; Mon, 10 Jan 2022 01:49:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n6oUY-0000km-I9; Mon, 10 Jan 2022 01:49:20 -0500
Received: from [2607:f8b0:4864:20::d29] (port=33532
 helo=mail-io1-xd29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n6oUW-0006QT-JM; Mon, 10 Jan 2022 01:49:18 -0500
Received: by mail-io1-xd29.google.com with SMTP id s6so16288842ioj.0;
 Sun, 09 Jan 2022 22:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UngnJwPTdW06Vewlid5EdxtKrdw9E5PBkNU7imKIie8=;
 b=G0F7MMDZIRfSQPJhT2x/pZxQmS73pbXPG3ITPKmhjjhIV7VcPpsClJT9gy5+MJDLtY
 1+MdcfOtKm8JebJKkdlvQaYy1xR4eRcakbch/32yLrNI3dt41tG7Adz/HctCu5Ljandj
 1w3DcNjCnBaQZGuMDpMN0+46GsN1r45l6MvS5JpaoIY6i4CT8EfSOQYipNq7uL66Dm/4
 ieVI6zmA1OZ4ysfZzo6Ut2l/NhX/upBoHtzZkDVxB4HcC5tOdA1ATp8ZBPwm2a18cHAJ
 lHU/zEblVY89Myt+ljZjYHB2fb9dyLXFL3UrP4IrPn4y+I+swzaGYYnT1eIxpFyz/2vG
 6o0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UngnJwPTdW06Vewlid5EdxtKrdw9E5PBkNU7imKIie8=;
 b=SeHIEbXoQoh3DZz/aQLKotLlyM9lwywr1Cnkw/UWCP4aVOSvu6DB52L2L4720Cmd/h
 2c9/i6zQBJ8SForG/N2j91GLRCYP3GLmR2jwcAyBjNoMbCKh7BZ+vs+jhUTIVhY2SM0d
 6OKKrWVkxI+3juajJiZLtrophp3SmSQzrr60YWY5wtmbxGo57qZKOlIxMN+xy0gTPCZz
 5rmD2trK7y65XBOF/UydSeqtqwAhMXouSzAzyMD+MatoESmuM/Er/VsHyDaxrGSdpcFK
 a01nfqa2RExZ7KiT8mnIUkFJJZhIAtB61Jp+3MpWL0DzNrg25vfXugjors4hqu3u/ip7
 YWpQ==
X-Gm-Message-State: AOAM5334iH9fRLM/CsOGuESLoDCc2PLDm5Pwxt6HSZ90qf0AME5Bm5cu
 s3CG/bNPMBLMwqhZbJm97eK0i/AEN/vJGdLNqmM=
X-Google-Smtp-Source: ABdhPJyx+T2JxsxPKptnjlak8JZqTtdokpYw3S1FBToK2I0b4LKYRlCQx/ycm+PVdvfxf2Ic3QlchL7PbrsTX9fkOYM=
X-Received: by 2002:a02:aa8f:: with SMTP id u15mr34430273jai.63.1641797354958; 
 Sun, 09 Jan 2022 22:49:14 -0800 (PST)
MIME-Version: 1.0
References: <20220110013831.1594-1-jiangyifei@huawei.com>
 <20220110013831.1594-9-jiangyifei@huawei.com>
In-Reply-To: <20220110013831.1594-9-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jan 2022 16:48:48 +1000
Message-ID: <CAKmqyKMoCVpdKv+PJ+pu5Wvr45K1+wSVA+rTxf+_Ga16ErZGUw@mail.gmail.com>
Subject: Re: [PATCH v4 08/12] target/riscv: Handle KVM_EXIT_RISCV_SBI exit
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 kvm-riscv@lists.infradead.org, "open list:Overall" <kvm@vger.kernel.org>,
 libvir-list@redhat.com, 
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 fanliang@huawei.com, 
 "Wubin (H)" <wu.wubin@huawei.com>, wanghaibin.wang@huawei.com,
 wanbo13@huawei.com, 
 Mingwang Li <limingwang@huawei.com>, Anup Patel <anup.patel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Jan 2022 06:49:23 -0000

On Mon, Jan 10, 2022 at 11:49 AM Yifei Jiang via <qemu-devel@nongnu.org> wrote:
>
> Use char-fe to handle console sbi call, which implement early
> console io while apply 'earlycon=sbi' into kernel parameters.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/kvm.c                 | 42 ++++++++++++++++-
>  target/riscv/sbi_ecall_interface.h | 72 ++++++++++++++++++++++++++++++
>  2 files changed, 113 insertions(+), 1 deletion(-)
>  create mode 100644 target/riscv/sbi_ecall_interface.h
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 0027f11f45..ded2a8c29d 100644
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
> @@ -365,9 +367,47 @@ bool kvm_arch_stop_on_emulation_error(CPUState *cs)
>      return true;
>  }
>
> +static int kvm_riscv_handle_sbi(CPUState *cs, struct kvm_run *run)
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
> +        ret = kvm_riscv_handle_sbi(cs, run);
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

