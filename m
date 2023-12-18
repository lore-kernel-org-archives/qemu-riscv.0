Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7CEC35274
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 03:19:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rF4A7-0003CN-D7; Sun, 17 Dec 2023 22:19:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF4A4-0003BN-Ja; Sun, 17 Dec 2023 22:19:20 -0500
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF4A2-0008L1-Og; Sun, 17 Dec 2023 22:19:20 -0500
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-77f5b3fa323so190325785a.0; 
 Sun, 17 Dec 2023 19:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702869557; x=1703474357; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=36kf5zrbILZW+uA0q0TBq/MRm+vepFVRdEC1alr6AtU=;
 b=Js/iBbvV2y88T/zLXsy12g9AVH5L5iD0YDtZCzZ2kl4rnvAWc0ySB5AQ8QTW6aNS52
 Oe/Ksq8YuUkXivntiF7HQ9vqxuW6mfqut4+4IuuGkgSDHqiVJoUBigL9pWT40M0MMlfi
 8BDLjIl3NY4T/aTJ3KY9DAUMPHb6OdeT6qg7b3luZ3RpxzZgRDpkxTHiupocDOEzlhZ/
 sR1HhBfwAKCNmnM0LDqoKEpSkMZYQURycUPd9xT4bjZnhEY72rU/F0yDBvTpZCfwmgUQ
 x0Af4oHpgn+vgYN8d0x58Q5FTKN19UzhAuMnsV4K8lxqoeqFHjrvY/Q76Eoop1znN6jE
 UwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702869557; x=1703474357;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=36kf5zrbILZW+uA0q0TBq/MRm+vepFVRdEC1alr6AtU=;
 b=mvuVBB6r2tB3Kyr2UvigF1eb2MgTDsxKToFdMyyIrnAm6cQbA6jrbt9fb+rpAnMRhX
 Lu3oIgPbgw7dO1M8CE6mlFQ6vM/e1XTm3NFlU5mGR82yLYYKD9GmAUFUfLWPQ3I+WT5x
 lL+x8JiqZ7j8/APZb0b0e5XByStoFxzNJJUONqKoxRHCDP3YA9JI8/rsxR+iaQNqYOsJ
 fzELf/7stQ5X5/illRPm70zUBN3ohV9VUil6axyVPPrSCxKtv5633L0e8Ud9u2VizdpK
 GCxFsVhSaHOvYbLPQCXifR0DfMKg19Y4CmgcTBVEDe3t4GxZ0PYhemlZsp1Hvag1DrHk
 N5xA==
X-Gm-Message-State: AOJu0YxHH0k2w7DhUiFhvBBMurZ1P5EKM/oabavlZmlYtP7g9NXRDuAT
 sNKCU44DKYANOz8bhsCA0aLDj5o0rlGG5fBlqTE=
X-Google-Smtp-Source: AGHT+IEbcACEfHBrKogpb9+CTZrrVO7TWyKEJlFBwyHparnkIWdCIOqNJI9Tslqn9hfa1GngLndb3ybTtbbRSVDQKzk=
X-Received: by 2002:a05:620a:10a6:b0:77f:9c9:70cb with SMTP id
 h6-20020a05620a10a600b0077f09c970cbmr17307129qkk.118.1702869557428; Sun, 17
 Dec 2023 19:19:17 -0800 (PST)
MIME-Version: 1.0
References: <20231130182748.1894790-1-dbarboza@ventanamicro.com>
In-Reply-To: <20231130182748.1894790-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Dec 2023 13:18:51 +1000
Message-ID: <CAKmqyKOd-_4X5M7UATM=VqRdJb1Dr1GQ0=9RK5gD7QarDOt8oQ@mail.gmail.com>
Subject: Re: [PATCH for-9.0 0/4] target/riscv: add RVV CSRs
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=alistair23@gmail.com; helo=mail-qk1-x735.google.com
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

On Fri, Dec 1, 2023 at 4:29=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> This series adds RVV, vstart, vl and vtype regs to the KVM driver.
>
> But first we need a couple of things done. We need 'ptrace.h' RISC-V
> linux-header to be able to read/write RVV CSRs. This is done in patch 2.
> Patch 1 is the usual linux-header bump for all archs.
>
> Patch 3 is adding a realize() callback for the KVM driver because we're
> doing a prctl() to enable Vector support for the thread.
>
> Patches are based on master. You'll need the following KVM fix to be
> able to build:
>
> [PATCH for-8.2] target/riscv/kvm: fix shadowing in kvm_riscv_(get|put)_re=
gs_csr
>
>
> Daniel Henrique Barboza (4):
>   linux-headers: Update to Linux v6.7-rc3
>   linux-headers: riscv: add ptrace.h
>   target/riscv/kvm: do PR_RISCV_V_SET_CONTROL during realize()
>   target/riscv/kvm: add RVV and Vector CSR regs

Do you mind rebasing this on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next

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
>  linux-headers/linux/stddef.h                  |   7 +
>  linux-headers/linux/userfaultfd.h             |   9 +-
>  linux-headers/linux/vfio.h                    |  47 +++--
>  linux-headers/linux/vhost.h                   |   8 +
>  scripts/update-linux-headers.sh               |   3 +
>  target/riscv/kvm/kvm-cpu.c                    | 103 ++++++++++
>  32 files changed, 735 insertions(+), 26 deletions(-)
>  create mode 100644 linux-headers/asm-loongarch/bitsperlong.h
>  create mode 100644 linux-headers/asm-loongarch/kvm.h
>  create mode 100644 linux-headers/asm-loongarch/mman.h
>  create mode 100644 linux-headers/asm-loongarch/unistd.h
>  create mode 100644 linux-headers/asm-riscv/ptrace.h
>
> --
> 2.41.0
>
>

