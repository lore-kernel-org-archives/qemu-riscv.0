Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mt0ng-0004yg-7q
	for mharc-qemu-riscv@gnu.org; Fri, 03 Dec 2021 00:08:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mt0ne-0004yO-LN
 for qemu-riscv@nongnu.org; Fri, 03 Dec 2021 00:07:58 -0500
Received: from [2a00:1450:4864:20::32a] (port=35797
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mt0nc-0000zR-BF
 for qemu-riscv@nongnu.org; Fri, 03 Dec 2021 00:07:58 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so3968568wme.0
 for <qemu-riscv@nongnu.org>; Thu, 02 Dec 2021 21:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1HzcrWAvGmTUX+Hm36O7mgiWvuIVCo+PL1FfOvYl0mA=;
 b=EwnvRrBzkJNKw/xZ/2L4eEYBkffrQKav8TNXTRoBBzxrWX1sMuNJmhgnikb2XWF6jD
 JugFWug/S/3qez2LN2+VlWDeP39awr9ioprv/ki40m4JZZm8OlqUbigSedR7VlNKOoJp
 kkw4iVLGs/OIEMCID6r1hmEcxRY9X6sppkjpU71CKpe7+3xBmG3stD2siN/ASd+vdC5h
 hKRBoEMm7UpvdzKGY4Da/XIQLqB+bzZGVu4lUIPGNz8rjCGT5+XcpLDyOJangr67LddX
 KfYKCWHC/aiqI2G87T6rbG8Gpx75BUcAvpqNSbjybDl2+DGaXxCcDNmwyn+WGy47FQHO
 C1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1HzcrWAvGmTUX+Hm36O7mgiWvuIVCo+PL1FfOvYl0mA=;
 b=248DqvWQkGEfiiSwb9OkLhPuQDlR4oUliBpEWND887UPX6Qi7PTyIiD8S0tfxkt1VD
 VT2En7aGV851yTP51pprJpOnO+0uh3RJtQ0Q852yqnknAP2doySyfyu4yrTnXGQcEPo+
 fUUfmgXoZgJOGZi1ZQ2mANojM90zP9Oa3u+cEs3oTWk/Sw05/uexqKiErlAJNHHD2sif
 zbz1uG8x6tfVbR0AlTo30TMPC/McHEmCyjFKDYwEqWAXPDfxIGZKhgwgTl+7YVOe+cUG
 StMn5F0BSfDNvDq4zlfzErxbfcQVbld+YE1mkhL7eqBpWv2ZgzWaJOoli/TVv2m1Ij2+
 Vudw==
X-Gm-Message-State: AOAM530kPZUHGRfYwZBHqd3NLaYacY4sG1AyKHlgxxs9eiMYNLxi8buy
 Hv/f6DMVykaWgfq0YvJr24TnJ80i5T1C0LkCriLL8A==
X-Google-Smtp-Source: ABdhPJx/MYygLA1gO5zaf8vUfV+T1NqnKCxZSNk7TN7ZEb36ELOsMqUqfuDw+gBoZyYd5WzHTO4AAjO+RzWZRydTGTg=
X-Received: by 2002:a7b:c256:: with SMTP id b22mr12040192wmj.176.1638508073956; 
 Thu, 02 Dec 2021 21:07:53 -0800 (PST)
MIME-Version: 1.0
References: <20211120074644.729-1-jiangyifei@huawei.com>
 <20211120074644.729-2-jiangyifei@huawei.com>
In-Reply-To: <20211120074644.729-2-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Dec 2021 10:37:42 +0530
Message-ID: <CAAhSdy3kHbFX7bBCOn-m9BNtc_iHc-E+uE-GrPBWRj81DtAShQ@mail.gmail.com>
Subject: Re: [PATCH v1 01/12] update-linux-headers: Add asm-riscv/kvm.h
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 kvm-riscv@lists.infradead.org, KVM General <kvm@vger.kernel.org>,
 libvir-list@redhat.com, 
 Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 fanliang@huawei.com, 
 "Wubin (H)" <wu.wubin@huawei.com>, wanghaibin.wang@huawei.com,
 wanbo13@huawei.com, Mingwang Li <limingwang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::32a;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 03 Dec 2021 05:07:58 -0000

On Sat, Nov 20, 2021 at 1:17 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Add asm-riscv/kvm.h for RISC-V KVM, and update linux/kvm.h
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  linux-headers/asm-riscv/kvm.h | 128 ++++++++++++++++++++++++++++++++++
>  linux-headers/linux/kvm.h     |   8 +++
>  2 files changed, 136 insertions(+)
>  create mode 100644 linux-headers/asm-riscv/kvm.h
>
> diff --git a/linux-headers/asm-riscv/kvm.h b/linux-headers/asm-riscv/kvm.h
> new file mode 100644
> index 0000000000..f808ad1ce5
> --- /dev/null
> +++ b/linux-headers/asm-riscv/kvm.h
> @@ -0,0 +1,128 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Copyright (C) 2019 Western Digital Corporation or its affiliates.
> + *
> + * Authors:
> + *     Anup Patel <anup.patel@wdc.com>
> + */
> +
> +#ifndef __LINUX_KVM_RISCV_H
> +#define __LINUX_KVM_RISCV_H
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <linux/types.h>
> +#include <asm/ptrace.h>
> +
> +#define __KVM_HAVE_READONLY_MEM
> +
> +#define KVM_COALESCED_MMIO_PAGE_OFFSET 1
> +
> +#define KVM_INTERRUPT_SET      -1U
> +#define KVM_INTERRUPT_UNSET    -2U
> +
> +/* for KVM_GET_REGS and KVM_SET_REGS */
> +struct kvm_regs {
> +};
> +
> +/* for KVM_GET_FPU and KVM_SET_FPU */
> +struct kvm_fpu {
> +};
> +
> +/* KVM Debug exit structure */
> +struct kvm_debug_exit_arch {
> +};
> +
> +/* for KVM_SET_GUEST_DEBUG */
> +struct kvm_guest_debug_arch {
> +};
> +
> +/* definition of registers in kvm_run */
> +struct kvm_sync_regs {
> +};
> +
> +/* for KVM_GET_SREGS and KVM_SET_SREGS */
> +struct kvm_sregs {
> +};
> +
> +/* CONFIG registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> +struct kvm_riscv_config {
> +       unsigned long isa;
> +};
> +
> +/* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> +struct kvm_riscv_core {
> +       struct user_regs_struct regs;
> +       unsigned long mode;
> +};
> +
> +/* Possible privilege modes for kvm_riscv_core */
> +#define KVM_RISCV_MODE_S       1
> +#define KVM_RISCV_MODE_U       0
> +
> +/* CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> +struct kvm_riscv_csr {
> +       unsigned long sstatus;
> +       unsigned long sie;
> +       unsigned long stvec;
> +       unsigned long sscratch;
> +       unsigned long sepc;
> +       unsigned long scause;
> +       unsigned long stval;
> +       unsigned long sip;
> +       unsigned long satp;
> +       unsigned long scounteren;
> +};
> +
> +/* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> +struct kvm_riscv_timer {
> +       __u64 frequency;
> +       __u64 time;
> +       __u64 compare;
> +       __u64 state;
> +};
> +
> +/* Possible states for kvm_riscv_timer */
> +#define KVM_RISCV_TIMER_STATE_OFF      0
> +#define KVM_RISCV_TIMER_STATE_ON       1
> +
> +#define KVM_REG_SIZE(id)               \
> +       (1U << (((id) & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT))
> +
> +/* If you need to interpret the index values, here is the key: */
> +#define KVM_REG_RISCV_TYPE_MASK                0x00000000FF000000
> +#define KVM_REG_RISCV_TYPE_SHIFT       24
> +
> +/* Config registers are mapped as type 1 */
> +#define KVM_REG_RISCV_CONFIG           (0x01 << KVM_REG_RISCV_TYPE_SHIFT)
> +#define KVM_REG_RISCV_CONFIG_REG(name) \
> +       (offsetof(struct kvm_riscv_config, name) / sizeof(unsigned long))
> +
> +/* Core registers are mapped as type 2 */
> +#define KVM_REG_RISCV_CORE             (0x02 << KVM_REG_RISCV_TYPE_SHIFT)
> +#define KVM_REG_RISCV_CORE_REG(name)   \
> +               (offsetof(struct kvm_riscv_core, name) / sizeof(unsigned long))
> +
> +/* Control and status registers are mapped as type 3 */
> +#define KVM_REG_RISCV_CSR              (0x03 << KVM_REG_RISCV_TYPE_SHIFT)
> +#define KVM_REG_RISCV_CSR_REG(name)    \
> +               (offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned long))
> +
> +/* Timer registers are mapped as type 4 */
> +#define KVM_REG_RISCV_TIMER            (0x04 << KVM_REG_RISCV_TYPE_SHIFT)
> +#define KVM_REG_RISCV_TIMER_REG(name)  \
> +               (offsetof(struct kvm_riscv_timer, name) / sizeof(__u64))
> +
> +/* F extension registers are mapped as type 5 */
> +#define KVM_REG_RISCV_FP_F             (0x05 << KVM_REG_RISCV_TYPE_SHIFT)
> +#define KVM_REG_RISCV_FP_F_REG(name)   \
> +               (offsetof(struct __riscv_f_ext_state, name) / sizeof(__u32))
> +
> +/* D extension registers are mapped as type 6 */
> +#define KVM_REG_RISCV_FP_D             (0x06 << KVM_REG_RISCV_TYPE_SHIFT)
> +#define KVM_REG_RISCV_FP_D_REG(name)   \
> +               (offsetof(struct __riscv_d_ext_state, name) / sizeof(__u64))
> +
> +#endif
> +
> +#endif /* __LINUX_KVM_RISCV_H */
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index bcaf66cc4d..5e290c3c3e 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -269,6 +269,7 @@ struct kvm_xen_exit {
>  #define KVM_EXIT_AP_RESET_HOLD    32
>  #define KVM_EXIT_X86_BUS_LOCK     33
>  #define KVM_EXIT_XEN              34
> +#define KVM_EXIT_RISCV_SBI        35
>
>  /* For KVM_EXIT_INTERNAL_ERROR */
>  /* Emulate instruction failed. */
> @@ -469,6 +470,13 @@ struct kvm_run {
>                 } msr;
>                 /* KVM_EXIT_XEN */
>                 struct kvm_xen_exit xen;
> +               /* KVM_EXIT_RISCV_SBI */
> +               struct {
> +                       unsigned long extension_id;
> +                       unsigned long function_id;
> +                       unsigned long args[6];
> +                       unsigned long ret[2];
> +               } riscv_sbi;
>                 /* Fix the size of the union. */
>                 char padding[256];
>         };
> --
> 2.19.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

