Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E89C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 05:18:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLcaq-0002rH-AJ; Fri, 05 Jan 2024 00:18:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLcao-0002qb-Iv; Fri, 05 Jan 2024 00:18:02 -0500
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rLcam-0008U9-Qw; Fri, 05 Jan 2024 00:18:02 -0500
Received: by mail-ua1-x930.google.com with SMTP id
 a1e0cc1a2514c-7cdf4b99e7eso238364241.0; 
 Thu, 04 Jan 2024 21:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704431879; x=1705036679; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v1Wq3peqZgPbg2yQFzBm1lb4F6pcpmP7MHWgPMaIRPE=;
 b=Kz7TrZswZeFjhGxnjzO8WtFyLGvmJxmCbHg3vUS5w2Xb/jAcPAe8NHsR9AkUiYLWKu
 +nKEIOSvf9dQaDrXFrSDVmV9fIrdrVu5CN0CmrDivo3J/FSWvXelVj1rUkhy6OTU0gKQ
 dje/8eXNwxlm5Cchlztgo19zSn/gNhTh+7/chvxwdwOILVSX/1Ov639SN5UEO+AqKemb
 RsP63rhkkhD7dCHVn3NIMlVIaRyi7tB/y7Rek+K7hpPOrD0VwnHcgSnibdNsoeb9aOrN
 zY0eie18q0EVF9qv/BNYtAQ0e216oIEpX0fQjuGa6AyiMaHqNypXAUVh7lgY/uWS3amZ
 1y6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704431879; x=1705036679;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v1Wq3peqZgPbg2yQFzBm1lb4F6pcpmP7MHWgPMaIRPE=;
 b=HysR+Ltqp/y2D4YzEZdtNm5LTkdtwSlsYKRnyz5FfhwGsGxvWsQjxqV3PhMKqVcRUo
 bNC9dhR6J6hjXFElxwIAYOD2dtFU5VlWHiYlyJ7smiKB+FltDK8htu6nJzFdQlctdmcQ
 iBxTtpNyFchl8uBg1rGcVJw4SdbPt8r9Bi/iJrkz+/oYV2wBRVJOCLP/XyifVmkv+DwF
 iBSwPia6OpOFUSdOpkLiNngGShC9tsPwz14/gUMdHx9nzurs6YX93GHnRamzq66ZW41K
 E6G1OBzEjlDwsln8oVlRlljE1x5t4yx7p3l+5LUDAiuWWt8HRspZI/DlhOriz/qNqySm
 U3Nw==
X-Gm-Message-State: AOJu0Yy2JXHY4hDyrBnY/ZqewQKR7ug+ECspU1QpLaZImRvrzbAwOdKO
 V+fw3794TacyeDKEKZpueJCl/tPXYHHQP/yieRU=
X-Google-Smtp-Source: AGHT+IGJ8pQqhGR678XmKn0HhwBP1y9WHG3puKrdwY+9YNT2FmHnk9Lv8XaBDySLvwjUDdLiZGkuDZpY/wM1Cme9SxI=
X-Received: by 2002:a05:6102:151d:b0:467:af58:295a with SMTP id
 f29-20020a056102151d00b00467af58295amr1195518vsv.31.1704431879315; Thu, 04
 Jan 2024 21:17:59 -0800 (PST)
MIME-Version: 1.0
References: <20231218204321.75757-1-dbarboza@ventanamicro.com>
In-Reply-To: <20231218204321.75757-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 5 Jan 2024 15:17:33 +1000
Message-ID: <CAKmqyKMAteKFDF14TikbQGYz98e9Kjr_YKrM1GgtfGOotHUSNg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] target/riscv: add RVV CSRs
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x930.google.com
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

On Tue, Dec 19, 2023 at 6:44=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> This version was rebased on top of Alistair's riscv-to-apply.next. A
> small tweak was needed in patch 4 due to changes in the branch.
>
> I took the chance to update linux-headers to 6.7-rc5, although the
> differences from the rc3 headers from v1 were minimal.
>
> All patches acked.
>
> Changes from v1:
> - rebased to Alistair's riscv-to-apply.next
> - patch 1:
>   - updated headers to v6.7-rc5
> - patch 4:
>   - use kvm_riscv_reg_id_ulong() instead of kvm_riscv_reg_id()
> - v1 link: https://lore.kernel.org/qemu-riscv/20231130182748.1894790-1-db=
arboza@ventanamicro.com/
>
> Daniel Henrique Barboza (4):
>   linux-headers: Update to Linux v6.7-rc5
>   linux-headers: riscv: add ptrace.h
>   target/riscv/kvm: do PR_RISCV_V_SET_CONTROL during realize()
>   target/riscv/kvm: add RVV and Vector CSR regs

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  include/standard-headers/drm/drm_fourcc.h     |   2 +
>  include/standard-headers/linux/pci_regs.h     |  24 ++-
>  include/standard-headers/linux/vhost_types.h  |   7 +
>  .../standard-headers/linux/virtio_config.h    |   5 +
>  include/standard-headers/linux/virtio_pci.h   |  11 ++
>  linux-headers/asm-arm64/kvm.h                 |  32 ++++
>  linux-headers/asm-generic/unistd.h            |  14 +-
>  linux-headers/asm-loongarch/bitsperlong.h     |   1 +
>  linux-headers/asm-loongarch/kvm.h             | 108 +++++++++++
>  linux-headers/asm-loongarch/mman.h            |   1 +
>  linux-headers/asm-loongarch/unistd.h          |   5 +
>  linux-headers/asm-mips/unistd_n32.h           |   4 +
>  linux-headers/asm-mips/unistd_n64.h           |   4 +
>  linux-headers/asm-mips/unistd_o32.h           |   4 +
>  linux-headers/asm-powerpc/unistd_32.h         |   4 +
>  linux-headers/asm-powerpc/unistd_64.h         |   4 +
>  linux-headers/asm-riscv/kvm.h                 |  12 ++
>  linux-headers/asm-riscv/ptrace.h              | 132 +++++++++++++
>  linux-headers/asm-s390/unistd_32.h            |   4 +
>  linux-headers/asm-s390/unistd_64.h            |   4 +
>  linux-headers/asm-x86/unistd_32.h             |   4 +
>  linux-headers/asm-x86/unistd_64.h             |   3 +
>  linux-headers/asm-x86/unistd_x32.h            |   3 +
>  linux-headers/linux/iommufd.h                 | 180 +++++++++++++++++-
>  linux-headers/linux/kvm.h                     |  11 ++
>  linux-headers/linux/psp-sev.h                 |   1 +
>  linux-headers/linux/stddef.h                  |   9 +-
>  linux-headers/linux/userfaultfd.h             |   9 +-
>  linux-headers/linux/vfio.h                    |  47 +++--
>  linux-headers/linux/vhost.h                   |   8 +
>  scripts/update-linux-headers.sh               |   3 +
>  target/riscv/kvm/kvm-cpu.c                    | 103 ++++++++++
>  32 files changed, 736 insertions(+), 27 deletions(-)
>  create mode 100644 linux-headers/asm-loongarch/bitsperlong.h
>  create mode 100644 linux-headers/asm-loongarch/kvm.h
>  create mode 100644 linux-headers/asm-loongarch/mman.h
>  create mode 100644 linux-headers/asm-loongarch/unistd.h
>  create mode 100644 linux-headers/asm-riscv/ptrace.h
>
> --
> 2.43.0
>
>

