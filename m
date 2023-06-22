Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F0BEB64D7
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 01:19:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qC8yJ-0000G7-C1; Wed, 21 Jun 2023 21:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC8yI-0000Fm-1t; Wed, 21 Jun 2023 21:18:50 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC8yF-0005JE-DJ; Wed, 21 Jun 2023 21:18:49 -0400
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-440c5960b58so1075727137.3; 
 Wed, 21 Jun 2023 18:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687396726; x=1689988726;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I2dpx973JdFmKN9dndwAgkeKkDMe3PuG3uu92acQXBE=;
 b=MJXqKvAdqTxkZU5sa7IW4ZKMGi4erkvIu6UhR5pGTJP7zk0Zq4BeEatvOiib+vaM9w
 7p40c7/F4Y1UnZ7iBtkbATT8N2ITsFJULfr2HYv7cH4tMDp0EBaU9rq6nE4ZyomP/a5p
 5V1V05H+tOX8FszFG5D+Pi3Hbq3sF0MszEK6IAPA0D8HjJE3hcecJtmGwljzfZBrWz4C
 GFyU0fsALh7OlVMoxhNqN/ga9susFcQ8V6QN3RpdIAA/kR+hQUskG21KgzFVB5HTZ02W
 BzHMZ5qXd8EkVGHaOCEamyO93JhFJ4r1ye++U9M/S8eERAL0SHF65kwtj2eSD/tdIHUe
 xM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687396726; x=1689988726;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I2dpx973JdFmKN9dndwAgkeKkDMe3PuG3uu92acQXBE=;
 b=RvyeqjIZwVekrRdlFOLvpvl6g+WpKjs99Y+gtcZBHfzsX+DJh/kiVNBdTC85ulGhq6
 pTqQgsrZTiGXc5oV7S8vRbKT8q3wJ2XTsWgD258aJFAXdHZGq9OldcmxAMOE6FHlSwvF
 0F5ryzKDfb9hMy4F3tyT7j4FmNWbr2/Nd4a3FYKdZyW/UZO0Z6QLCMsPlQM5oYQaWHhN
 lNmBzk7wvbc/6NHhonLZFPCjAVgbp0v4dvXDJrxezSA3xYD6eCergK4ZQY0Y6XtvlHYC
 8E0ABPN+SK/nie6M65QmHMN4AGkpTlKY59CTr/l8/idzuSDui/1z6gNVj+j8SMSaKkal
 H0Eg==
X-Gm-Message-State: AC+VfDyxLHVtWmVg6qQ9p9ebdYOTL1d2opeYq6BXoAsdlrBM5ch+pBxT
 Ee+YMs+cW0cX67VUQl8HeTIiwIlp5Nny3VLwdVI=
X-Google-Smtp-Source: ACHHUZ4zggFkDyb82AF532VjB/YEldz+FkjtuFY+vWQxISdkIGy32JUbIhguQk9rjbTcOsAFcrv92Ae4gzfHVEfQjdY=
X-Received: by 2002:a67:fe88:0:b0:440:b2ba:1548 with SMTP id
 b8-20020a67fe88000000b00440b2ba1548mr6862479vsr.5.1687396725855; Wed, 21 Jun
 2023 18:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230613205857.495165-1-dbarboza@ventanamicro.com>
 <20230613205857.495165-10-dbarboza@ventanamicro.com>
In-Reply-To: <20230613205857.495165-10-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Jun 2023 11:18:19 +1000
Message-ID: <CAKmqyKO4gpcWqjA0ZqpbUqfOOg1tWgdNSz74ce35=HJPN_tswA@mail.gmail.com>
Subject: Re: [PATCH v2 09/18] linux-headers: Update to v6.4-rc1
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Jun 14, 2023 at 7:02=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Update to commit ac9a78681b92 ("Linux 6.4-rc1").
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/standard-headers/linux/const.h        |  2 +-
>  include/standard-headers/linux/virtio_blk.h   | 18 +++----
>  .../standard-headers/linux/virtio_config.h    |  6 +++
>  include/standard-headers/linux/virtio_net.h   |  1 +
>  linux-headers/asm-arm64/kvm.h                 | 33 ++++++++++++
>  linux-headers/asm-riscv/kvm.h                 | 53 ++++++++++++++++++-
>  linux-headers/asm-riscv/unistd.h              |  9 ++++
>  linux-headers/asm-s390/unistd_32.h            |  1 +
>  linux-headers/asm-s390/unistd_64.h            |  1 +
>  linux-headers/asm-x86/kvm.h                   |  3 ++
>  linux-headers/linux/const.h                   |  2 +-
>  linux-headers/linux/kvm.h                     | 12 +++--
>  linux-headers/linux/psp-sev.h                 |  7 +++
>  linux-headers/linux/userfaultfd.h             | 17 +++++-
>  14 files changed, 149 insertions(+), 16 deletions(-)
>
> diff --git a/include/standard-headers/linux/const.h b/include/standard-he=
aders/linux/const.h
> index 5e48987251..1eb84b5087 100644
> --- a/include/standard-headers/linux/const.h
> +++ b/include/standard-headers/linux/const.h
> @@ -28,7 +28,7 @@
>  #define _BITUL(x)      (_UL(1) << (x))
>  #define _BITULL(x)     (_ULL(1) << (x))
>
> -#define __ALIGN_KERNEL(x, a)           __ALIGN_KERNEL_MASK(x, (typeof(x)=
)(a) - 1)
> +#define __ALIGN_KERNEL(x, a)           __ALIGN_KERNEL_MASK(x, (__typeof_=
_(x))(a) - 1)
>  #define __ALIGN_KERNEL_MASK(x, mask)   (((x) + (mask)) & ~(mask))
>
>  #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
> diff --git a/include/standard-headers/linux/virtio_blk.h b/include/standa=
rd-headers/linux/virtio_blk.h
> index 7155b1a470..d7be3cf5e4 100644
> --- a/include/standard-headers/linux/virtio_blk.h
> +++ b/include/standard-headers/linux/virtio_blk.h
> @@ -138,11 +138,11 @@ struct virtio_blk_config {
>
>         /* Zoned block device characteristics (if VIRTIO_BLK_F_ZONED) */
>         struct virtio_blk_zoned_characteristics {
> -               uint32_t zone_sectors;
> -               uint32_t max_open_zones;
> -               uint32_t max_active_zones;
> -               uint32_t max_append_sectors;
> -               uint32_t write_granularity;
> +               __virtio32 zone_sectors;
> +               __virtio32 max_open_zones;
> +               __virtio32 max_active_zones;
> +               __virtio32 max_append_sectors;
> +               __virtio32 write_granularity;
>                 uint8_t model;
>                 uint8_t unused2[3];
>         } zoned;
> @@ -239,11 +239,11 @@ struct virtio_blk_outhdr {
>   */
>  struct virtio_blk_zone_descriptor {
>         /* Zone capacity */
> -       uint64_t z_cap;
> +       __virtio64 z_cap;
>         /* The starting sector of the zone */
> -       uint64_t z_start;
> +       __virtio64 z_start;
>         /* Zone write pointer position in sectors */
> -       uint64_t z_wp;
> +       __virtio64 z_wp;
>         /* Zone type */
>         uint8_t z_type;
>         /* Zone state */
> @@ -252,7 +252,7 @@ struct virtio_blk_zone_descriptor {
>  };
>
>  struct virtio_blk_zone_report {
> -       uint64_t nr_zones;
> +       __virtio64 nr_zones;
>         uint8_t reserved[56];
>         struct virtio_blk_zone_descriptor zones[];
>  };
> diff --git a/include/standard-headers/linux/virtio_config.h b/include/sta=
ndard-headers/linux/virtio_config.h
> index 965ee6ae23..8a7d0dc8b0 100644
> --- a/include/standard-headers/linux/virtio_config.h
> +++ b/include/standard-headers/linux/virtio_config.h
> @@ -97,6 +97,12 @@
>   */
>  #define VIRTIO_F_SR_IOV                        37
>
> +/*
> + * This feature indicates that the driver passes extra data (besides
> + * identifying the virtqueue) in its device notifications.
> + */
> +#define VIRTIO_F_NOTIFICATION_DATA     38
> +
>  /*
>   * This feature indicates that the driver can reset a queue individually=
.
>   */
> diff --git a/include/standard-headers/linux/virtio_net.h b/include/standa=
rd-headers/linux/virtio_net.h
> index c0e797067a..2325485f2c 100644
> --- a/include/standard-headers/linux/virtio_net.h
> +++ b/include/standard-headers/linux/virtio_net.h
> @@ -61,6 +61,7 @@
>  #define VIRTIO_NET_F_GUEST_USO6        55      /* Guest can handle USOv6=
 in. */
>  #define VIRTIO_NET_F_HOST_USO  56      /* Host can handle USO in. */
>  #define VIRTIO_NET_F_HASH_REPORT  57   /* Supports hash report */
> +#define VIRTIO_NET_F_GUEST_HDRLEN  59  /* Guest provides the exact hdr_l=
en value. */
>  #define VIRTIO_NET_F_RSS         60    /* Supports RSS RX steering */
>  #define VIRTIO_NET_F_RSC_EXT     61    /* extended coalescing info */
>  #define VIRTIO_NET_F_STANDBY     62    /* Act as standby for another dev=
ice
> diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.=
h
> index d7e7bb885e..38e5957526 100644
> --- a/linux-headers/asm-arm64/kvm.h
> +++ b/linux-headers/asm-arm64/kvm.h
> @@ -198,6 +198,15 @@ struct kvm_arm_copy_mte_tags {
>         __u64 reserved[2];
>  };
>
> +/*
> + * Counter/Timer offset structure. Describe the virtual/physical offset.
> + * To be used with KVM_ARM_SET_COUNTER_OFFSET.
> + */
> +struct kvm_arm_counter_offset {
> +       __u64 counter_offset;
> +       __u64 reserved;
> +};
> +
>  #define KVM_ARM_TAGS_TO_GUEST          0
>  #define KVM_ARM_TAGS_FROM_GUEST                1
>
> @@ -363,6 +372,10 @@ enum {
>         KVM_REG_ARM_VENDOR_HYP_BIT_PTP          =3D 1,
>  };
>
> +/* Device Control API on vm fd */
> +#define KVM_ARM_VM_SMCCC_CTRL          0
> +#define   KVM_ARM_VM_SMCCC_FILTER      0
> +
>  /* Device Control API: ARM VGIC */
>  #define KVM_DEV_ARM_VGIC_GRP_ADDR      0
>  #define KVM_DEV_ARM_VGIC_GRP_DIST_REGS 1
> @@ -402,6 +415,8 @@ enum {
>  #define KVM_ARM_VCPU_TIMER_CTRL                1
>  #define   KVM_ARM_VCPU_TIMER_IRQ_VTIMER                0
>  #define   KVM_ARM_VCPU_TIMER_IRQ_PTIMER                1
> +#define   KVM_ARM_VCPU_TIMER_IRQ_HVTIMER       2
> +#define   KVM_ARM_VCPU_TIMER_IRQ_HPTIMER       3
>  #define KVM_ARM_VCPU_PVTIME_CTRL       2
>  #define   KVM_ARM_VCPU_PVTIME_IPA      0
>
> @@ -458,6 +473,24 @@ enum {
>  /* run->fail_entry.hardware_entry_failure_reason codes. */
>  #define KVM_EXIT_FAIL_ENTRY_CPU_UNSUPPORTED    (1ULL << 0)
>
> +enum kvm_smccc_filter_action {
> +       KVM_SMCCC_FILTER_HANDLE =3D 0,
> +       KVM_SMCCC_FILTER_DENY,
> +       KVM_SMCCC_FILTER_FWD_TO_USER,
> +
> +};
> +
> +struct kvm_smccc_filter {
> +       __u32 base;
> +       __u32 nr_functions;
> +       __u8 action;
> +       __u8 pad[15];
> +};
> +
> +/* arm64-specific KVM_EXIT_HYPERCALL flags */
> +#define KVM_HYPERCALL_EXIT_SMC         (1U << 0)
> +#define KVM_HYPERCALL_EXIT_16BIT       (1U << 1)
> +
>  #endif
>
>  #endif /* __ARM_KVM_H__ */
> diff --git a/linux-headers/asm-riscv/kvm.h b/linux-headers/asm-riscv/kvm.=
h
> index 92af6f3f05..f92790c948 100644
> --- a/linux-headers/asm-riscv/kvm.h
> +++ b/linux-headers/asm-riscv/kvm.h
> @@ -12,6 +12,7 @@
>  #ifndef __ASSEMBLY__
>
>  #include <linux/types.h>
> +#include <asm/bitsperlong.h>
>  #include <asm/ptrace.h>
>
>  #define __KVM_HAVE_READONLY_MEM
> @@ -52,6 +53,7 @@ struct kvm_riscv_config {
>         unsigned long mvendorid;
>         unsigned long marchid;
>         unsigned long mimpid;
> +       unsigned long zicboz_block_size;
>  };
>
>  /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> @@ -64,7 +66,7 @@ struct kvm_riscv_core {
>  #define KVM_RISCV_MODE_S       1
>  #define KVM_RISCV_MODE_U       0
>
> -/* CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> +/* General CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
>  struct kvm_riscv_csr {
>         unsigned long sstatus;
>         unsigned long sie;
> @@ -78,6 +80,17 @@ struct kvm_riscv_csr {
>         unsigned long scounteren;
>  };
>
> +/* AIA CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> +struct kvm_riscv_aia_csr {
> +       unsigned long siselect;
> +       unsigned long iprio1;
> +       unsigned long iprio2;
> +       unsigned long sieh;
> +       unsigned long siph;
> +       unsigned long iprio1h;
> +       unsigned long iprio2h;
> +};
> +
>  /* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
>  struct kvm_riscv_timer {
>         __u64 frequency;
> @@ -105,9 +118,29 @@ enum KVM_RISCV_ISA_EXT_ID {
>         KVM_RISCV_ISA_EXT_SVINVAL,
>         KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
>         KVM_RISCV_ISA_EXT_ZICBOM,
> +       KVM_RISCV_ISA_EXT_ZICBOZ,
> +       KVM_RISCV_ISA_EXT_ZBB,
> +       KVM_RISCV_ISA_EXT_SSAIA,
>         KVM_RISCV_ISA_EXT_MAX,
>  };
>
> +/*
> + * SBI extension IDs specific to KVM. This is not the same as the SBI
> + * extension IDs defined by the RISC-V SBI specification.
> + */
> +enum KVM_RISCV_SBI_EXT_ID {
> +       KVM_RISCV_SBI_EXT_V01 =3D 0,
> +       KVM_RISCV_SBI_EXT_TIME,
> +       KVM_RISCV_SBI_EXT_IPI,
> +       KVM_RISCV_SBI_EXT_RFENCE,
> +       KVM_RISCV_SBI_EXT_SRST,
> +       KVM_RISCV_SBI_EXT_HSM,
> +       KVM_RISCV_SBI_EXT_PMU,
> +       KVM_RISCV_SBI_EXT_EXPERIMENTAL,
> +       KVM_RISCV_SBI_EXT_VENDOR,
> +       KVM_RISCV_SBI_EXT_MAX,
> +};
> +
>  /* Possible states for kvm_riscv_timer */
>  #define KVM_RISCV_TIMER_STATE_OFF      0
>  #define KVM_RISCV_TIMER_STATE_ON       1
> @@ -118,6 +151,8 @@ enum KVM_RISCV_ISA_EXT_ID {
>  /* If you need to interpret the index values, here is the key: */
>  #define KVM_REG_RISCV_TYPE_MASK                0x00000000FF000000
>  #define KVM_REG_RISCV_TYPE_SHIFT       24
> +#define KVM_REG_RISCV_SUBTYPE_MASK     0x0000000000FF0000
> +#define KVM_REG_RISCV_SUBTYPE_SHIFT    16
>
>  /* Config registers are mapped as type 1 */
>  #define KVM_REG_RISCV_CONFIG           (0x01 << KVM_REG_RISCV_TYPE_SHIFT=
)
> @@ -131,8 +166,12 @@ enum KVM_RISCV_ISA_EXT_ID {
>
>  /* Control and status registers are mapped as type 3 */
>  #define KVM_REG_RISCV_CSR              (0x03 << KVM_REG_RISCV_TYPE_SHIFT=
)
> +#define KVM_REG_RISCV_CSR_GENERAL      (0x0 << KVM_REG_RISCV_SUBTYPE_SHI=
FT)
> +#define KVM_REG_RISCV_CSR_AIA          (0x1 << KVM_REG_RISCV_SUBTYPE_SHI=
FT)
>  #define KVM_REG_RISCV_CSR_REG(name)    \
>                 (offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned l=
ong))
> +#define KVM_REG_RISCV_CSR_AIA_REG(name)        \
> +       (offsetof(struct kvm_riscv_aia_csr, name) / sizeof(unsigned long)=
)
>
>  /* Timer registers are mapped as type 4 */
>  #define KVM_REG_RISCV_TIMER            (0x04 << KVM_REG_RISCV_TYPE_SHIFT=
)
> @@ -152,6 +191,18 @@ enum KVM_RISCV_ISA_EXT_ID {
>  /* ISA Extension registers are mapped as type 7 */
>  #define KVM_REG_RISCV_ISA_EXT          (0x07 << KVM_REG_RISCV_TYPE_SHIFT=
)
>
> +/* SBI extension registers are mapped as type 8 */
> +#define KVM_REG_RISCV_SBI_EXT          (0x08 << KVM_REG_RISCV_TYPE_SHIFT=
)
> +#define KVM_REG_RISCV_SBI_SINGLE       (0x0 << KVM_REG_RISCV_SUBTYPE_SHI=
FT)
> +#define KVM_REG_RISCV_SBI_MULTI_EN     (0x1 << KVM_REG_RISCV_SUBTYPE_SHI=
FT)
> +#define KVM_REG_RISCV_SBI_MULTI_DIS    (0x2 << KVM_REG_RISCV_SUBTYPE_SHI=
FT)
> +#define KVM_REG_RISCV_SBI_MULTI_REG(__ext_id)  \
> +               ((__ext_id) / __BITS_PER_LONG)
> +#define KVM_REG_RISCV_SBI_MULTI_MASK(__ext_id) \
> +               (1UL << ((__ext_id) % __BITS_PER_LONG))
> +#define KVM_REG_RISCV_SBI_MULTI_REG_LAST       \
> +               KVM_REG_RISCV_SBI_MULTI_REG(KVM_RISCV_SBI_EXT_MAX - 1)
> +
>  #endif
>
>  #endif /* __LINUX_KVM_RISCV_H */
> diff --git a/linux-headers/asm-riscv/unistd.h b/linux-headers/asm-riscv/u=
nistd.h
> index 73d7cdd2ec..950ab3fd44 100644
> --- a/linux-headers/asm-riscv/unistd.h
> +++ b/linux-headers/asm-riscv/unistd.h
> @@ -43,3 +43,12 @@
>  #define __NR_riscv_flush_icache (__NR_arch_specific_syscall + 15)
>  #endif
>  __SYSCALL(__NR_riscv_flush_icache, sys_riscv_flush_icache)
> +
> +/*
> + * Allows userspace to query the kernel for CPU architecture and
> + * microarchitecture details across a given set of CPUs.
> + */
> +#ifndef __NR_riscv_hwprobe
> +#define __NR_riscv_hwprobe (__NR_arch_specific_syscall + 14)
> +#endif
> +__SYSCALL(__NR_riscv_hwprobe, sys_riscv_hwprobe)
> diff --git a/linux-headers/asm-s390/unistd_32.h b/linux-headers/asm-s390/=
unistd_32.h
> index 8e644d65f5..800f3adb20 100644
> --- a/linux-headers/asm-s390/unistd_32.h
> +++ b/linux-headers/asm-s390/unistd_32.h
> @@ -419,6 +419,7 @@
>  #define __NR_landlock_create_ruleset 444
>  #define __NR_landlock_add_rule 445
>  #define __NR_landlock_restrict_self 446
> +#define __NR_memfd_secret 447
>  #define __NR_process_mrelease 448
>  #define __NR_futex_waitv 449
>  #define __NR_set_mempolicy_home_node 450
> diff --git a/linux-headers/asm-s390/unistd_64.h b/linux-headers/asm-s390/=
unistd_64.h
> index 51da542fec..399a605901 100644
> --- a/linux-headers/asm-s390/unistd_64.h
> +++ b/linux-headers/asm-s390/unistd_64.h
> @@ -367,6 +367,7 @@
>  #define __NR_landlock_create_ruleset 444
>  #define __NR_landlock_add_rule 445
>  #define __NR_landlock_restrict_self 446
> +#define __NR_memfd_secret 447
>  #define __NR_process_mrelease 448
>  #define __NR_futex_waitv 449
>  #define __NR_set_mempolicy_home_node 450
> diff --git a/linux-headers/asm-x86/kvm.h b/linux-headers/asm-x86/kvm.h
> index 2937e7bf69..2b3a8f7bd2 100644
> --- a/linux-headers/asm-x86/kvm.h
> +++ b/linux-headers/asm-x86/kvm.h
> @@ -557,4 +557,7 @@ struct kvm_pmu_event_filter {
>  #define KVM_VCPU_TSC_CTRL 0 /* control group for the timestamp counter (=
TSC) */
>  #define   KVM_VCPU_TSC_OFFSET 0 /* attribute for the TSC offset */
>
> +/* x86-specific KVM_EXIT_HYPERCALL flags. */
> +#define KVM_EXIT_HYPERCALL_LONG_MODE   BIT(0)
> +
>  #endif /* _ASM_X86_KVM_H */
> diff --git a/linux-headers/linux/const.h b/linux-headers/linux/const.h
> index 5e48987251..1eb84b5087 100644
> --- a/linux-headers/linux/const.h
> +++ b/linux-headers/linux/const.h
> @@ -28,7 +28,7 @@
>  #define _BITUL(x)      (_UL(1) << (x))
>  #define _BITULL(x)     (_ULL(1) << (x))
>
> -#define __ALIGN_KERNEL(x, a)           __ALIGN_KERNEL_MASK(x, (typeof(x)=
)(a) - 1)
> +#define __ALIGN_KERNEL(x, a)           __ALIGN_KERNEL_MASK(x, (__typeof_=
_(x))(a) - 1)
>  #define __ALIGN_KERNEL_MASK(x, mask)   (((x) + (mask)) & ~(mask))
>
>  #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index 599de3c6e3..65b145b317 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -341,8 +341,11 @@ struct kvm_run {
>                         __u64 nr;
>                         __u64 args[6];
>                         __u64 ret;
> -                       __u32 longmode;
> -                       __u32 pad;
> +
> +                       union {
> +                               __u32 longmode;
> +                               __u64 flags;
> +                       };
>                 } hypercall;
>                 /* KVM_EXIT_TPR_ACCESS */
>                 struct {
> @@ -1182,6 +1185,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_S390_PROTECTED_ASYNC_DISABLE 224
>  #define KVM_CAP_DIRTY_LOG_RING_WITH_BITMAP 225
>  #define KVM_CAP_PMU_EVENT_MASKED_EVENTS 226
> +#define KVM_CAP_COUNTER_OFFSET 227
>
>  #ifdef KVM_CAP_IRQ_ROUTING
>
> @@ -1449,7 +1453,7 @@ struct kvm_vfio_spapr_tce {
>  #define KVM_CREATE_VCPU           _IO(KVMIO,   0x41)
>  #define KVM_GET_DIRTY_LOG         _IOW(KVMIO,  0x42, struct kvm_dirty_lo=
g)
>  #define KVM_SET_NR_MMU_PAGES      _IO(KVMIO,   0x44)
> -#define KVM_GET_NR_MMU_PAGES      _IO(KVMIO,   0x45)
> +#define KVM_GET_NR_MMU_PAGES      _IO(KVMIO,   0x45)  /* deprecated */
>  #define KVM_SET_USER_MEMORY_REGION _IOW(KVMIO, 0x46, \
>                                         struct kvm_userspace_memory_regio=
n)
>  #define KVM_SET_TSS_ADDR          _IO(KVMIO,   0x47)
> @@ -1541,6 +1545,8 @@ struct kvm_s390_ucas_mapping {
>  #define KVM_SET_PMU_EVENT_FILTER  _IOW(KVMIO,  0xb2, struct kvm_pmu_even=
t_filter)
>  #define KVM_PPC_SVM_OFF                  _IO(KVMIO,  0xb3)
>  #define KVM_ARM_MTE_COPY_TAGS    _IOR(KVMIO,  0xb4, struct kvm_arm_copy_=
mte_tags)
> +/* Available with KVM_CAP_COUNTER_OFFSET */
> +#define KVM_ARM_SET_COUNTER_OFFSET _IOW(KVMIO,  0xb5, struct kvm_arm_cou=
nter_offset)
>
>  /* ioctl for vm fd */
>  #define KVM_CREATE_DEVICE        _IOWR(KVMIO,  0xe0, struct kvm_create_d=
evice)
> diff --git a/linux-headers/linux/psp-sev.h b/linux-headers/linux/psp-sev.=
h
> index 51d8b3940e..12ccb70099 100644
> --- a/linux-headers/linux/psp-sev.h
> +++ b/linux-headers/linux/psp-sev.h
> @@ -36,6 +36,13 @@ enum {
>   * SEV Firmware status code
>   */
>  typedef enum {
> +       /*
> +        * This error code is not in the SEV spec. Its purpose is to conv=
ey that
> +        * there was an error that prevented the SEV firmware from being =
called.
> +        * The SEV API error codes are 16 bits, so the -1 value will not =
overlap
> +        * with possible values from the specification.
> +        */
> +       SEV_RET_NO_FW_CALL =3D -1,
>         SEV_RET_SUCCESS =3D 0,
>         SEV_RET_INVALID_PLATFORM_STATE,
>         SEV_RET_INVALID_GUEST_STATE,
> diff --git a/linux-headers/linux/userfaultfd.h b/linux-headers/linux/user=
faultfd.h
> index ba5d0df52f..14e402263a 100644
> --- a/linux-headers/linux/userfaultfd.h
> +++ b/linux-headers/linux/userfaultfd.h
> @@ -38,7 +38,8 @@
>                            UFFD_FEATURE_MINOR_HUGETLBFS |       \
>                            UFFD_FEATURE_MINOR_SHMEM |           \
>                            UFFD_FEATURE_EXACT_ADDRESS |         \
> -                          UFFD_FEATURE_WP_HUGETLBFS_SHMEM)
> +                          UFFD_FEATURE_WP_HUGETLBFS_SHMEM |    \
> +                          UFFD_FEATURE_WP_UNPOPULATED)
>  #define UFFD_API_IOCTLS                                \
>         ((__u64)1 << _UFFDIO_REGISTER |         \
>          (__u64)1 << _UFFDIO_UNREGISTER |       \
> @@ -203,6 +204,12 @@ struct uffdio_api {
>          *
>          * UFFD_FEATURE_WP_HUGETLBFS_SHMEM indicates that userfaultfd
>          * write-protection mode is supported on both shmem and hugetlbfs=
.
> +        *
> +        * UFFD_FEATURE_WP_UNPOPULATED indicates that userfaultfd
> +        * write-protection mode will always apply to unpopulated pages
> +        * (i.e. empty ptes).  This will be the default behavior for shme=
m
> +        * & hugetlbfs, so this flag only affects anonymous memory behavi=
or
> +        * when userfault write-protection mode is registered.
>          */
>  #define UFFD_FEATURE_PAGEFAULT_FLAG_WP         (1<<0)
>  #define UFFD_FEATURE_EVENT_FORK                        (1<<1)
> @@ -217,6 +224,7 @@ struct uffdio_api {
>  #define UFFD_FEATURE_MINOR_SHMEM               (1<<10)
>  #define UFFD_FEATURE_EXACT_ADDRESS             (1<<11)
>  #define UFFD_FEATURE_WP_HUGETLBFS_SHMEM                (1<<12)
> +#define UFFD_FEATURE_WP_UNPOPULATED            (1<<13)
>         __u64 features;
>
>         __u64 ioctls;
> @@ -297,6 +305,13 @@ struct uffdio_writeprotect {
>  struct uffdio_continue {
>         struct uffdio_range range;
>  #define UFFDIO_CONTINUE_MODE_DONTWAKE          ((__u64)1<<0)
> +       /*
> +        * UFFDIO_CONTINUE_MODE_WP will map the page write protected on
> +        * the fly.  UFFDIO_CONTINUE_MODE_WP is available only if the
> +        * write protected ioctl is implemented for the range
> +        * according to the uffdio_register.ioctls.
> +        */
> +#define UFFDIO_CONTINUE_MODE_WP                        ((__u64)1<<1)
>         __u64 mode;
>
>         /*
> --
> 2.40.1
>
>

