Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82381EB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 02:49:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIgxO-0000jT-Tm; Sun, 09 Jul 2023 22:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIgxN-0000iy-Iu; Sun, 09 Jul 2023 22:48:57 -0400
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIgxL-0008N4-T7; Sun, 09 Jul 2023 22:48:57 -0400
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-47e106c3f56so1271779e0c.2; 
 Sun, 09 Jul 2023 19:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688957334; x=1691549334;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=luMC9DEEgDELzxzsWdzFHrrPltc+xnV8paJjg16n/08=;
 b=lng1XYDj76LUb2LfdxluUzeux951pZICu/BM8MKCiWURpbm1vSsDTiD+U0S2+coicw
 tsjGM2oBoWEpy06BdkDuateKRwNe+heg01G0pxJA0C4bZkS2AOsLKH+nh1wfhrgCv9jT
 LTyRxcjUXFIokNfqWtASGXC5zeAVunDsdAP6F26XucLNycKf44vaexsyK5V5J0b3ab19
 nsueUXUv3zEDPE/LCeHzQPbsd2nkUIXGh7Fgu209tIfGnBfFgk7WpdtvgSBIjrU6y0df
 kib9MMHKrOL0Cbd+4YShbqWjf5PipIEAJEWV3aryBgEZY7eVuJ2c2Y+6rGowE+xlUT4i
 lrkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688957334; x=1691549334;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=luMC9DEEgDELzxzsWdzFHrrPltc+xnV8paJjg16n/08=;
 b=kKL4b3Hwi7v0jZYi6ZLAGYRqX99nCfVez81PEGIvTsWa0kMYFL55mFf51uqzgkYz8i
 pU1mEdm7r/eB9ia2nXA0yAzYLDaSKw39//znVfc+Yk933nO+8TWM04nKYgpM0gf4lHmW
 6Z68y3t7e4Vps1EWpaKpzyUZobn/Vquwv5DJRthcRmBOZwjKtD9L1DjLllxQTIuj4X8G
 7oLOfS5KMnB2fi8SPMOgr0L37Nx+VxMQaPmWvllKcGp32UH9LnTylcjZmck/nStNwHsP
 CCvME73DlZwFdPQcN5NqmPjzB3Ha+BCqKhiCb2awF8eA1UP3b6Ol1CK/ZVIrrCrV6kjo
 QlvA==
X-Gm-Message-State: ABy/qLaC0zo3RGakRPEtFElWLKnktBuUXWIcD5K+VkbGYWhg+a7xdVNi
 NZVaUdzXkEsFMz48SxSA+58oHjANgO0MrFZTWuJsRa+ZjoMhKQ==
X-Google-Smtp-Source: APBJJlFgYTbUQ4rRwl6lDPGqHlUBm2TPi/EN4eZVYb8Avefi6UWMyDeod+8u9b2A146FQYQiD+Xv6SoyOT1kIFY6eN8=
X-Received: by 2002:a1f:4394:0:b0:471:8d3d:512a with SMTP id
 q142-20020a1f4394000000b004718d3d512amr5652049vka.2.1688957334442; Sun, 09
 Jul 2023 19:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230706101738.460804-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230706101738.460804-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jul 2023 12:48:28 +1000
Message-ID: <CAKmqyKOqs2Q==wgLVKnhoMv_gknBczyuYtG3sov=svFQS1_QNQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/20] target/riscv, KVM: fixes and enhancements
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa36.google.com
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

On Thu, Jul 6, 2023 at 8:19=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> In this version we dialed back from our design decision in patch 14,
> returning to the design we've been using since the first version. The
> rationale behind is that we can't get rid of EINVAL since it will break
> extension for all other KVM versions prior to this one where we're
> adding the first version of the KVM specific capabilities. We'll switch
> later on for get-reg-list when it's available, but for now we're stuck
> with EINVAL. Drew provided a detailed explanation here:
>
> https://lore.kernel.org/qemu-devel/20230706-38ab9f9705448bb10413f1af@orel=
/T/#m75a5323e76518c02598758fdd6a8943951812875
>
> As a bonus I also fixed the device-tree binding link satp in patch 2 like
> Connor suggested.
>
> I believe we're ready to go.
>
> Patches missing review: 14
>
> Changes from v8:
>   - patch 2:
>     - fix device-tree binding link in commit message
>   - patch 14:
>     - use EINVAL instead of ENOENT
> v8 link: https://lore.kernel.org/qemu-devel/20230706-38ab9f9705448bb10413=
f1af@orel/T/#m1c889304847598789db313f3e0854ed0d41ce60c
>
> Daniel Henrique Barboza (20):
>   target/riscv: skip features setup for KVM CPUs
>   hw/riscv/virt.c: skip 'mmu-type' FDT if satp mode not set
>   target/riscv/cpu.c: restrict 'mvendorid' value
>   target/riscv/cpu.c: restrict 'mimpid' value
>   target/riscv/cpu.c: restrict 'marchid' value
>   target/riscv: use KVM scratch CPUs to init KVM properties
>   target/riscv: read marchid/mimpid in kvm_riscv_init_machine_ids()
>   target/riscv: handle mvendorid/marchid/mimpid for KVM CPUs
>   linux-headers: Update to v6.4-rc1
>   target/riscv/kvm.c: init 'misa_ext_mask' with scratch CPU
>   target/riscv/cpu: add misa_ext_info_arr[]
>   target/riscv: add KVM specific MISA properties
>   target/riscv/kvm.c: update KVM MISA bits
>   target/riscv/kvm.c: add multi-letter extension KVM properties
>   target/riscv/cpu.c: add satp_mode properties earlier
>   target/riscv/cpu.c: remove priv_ver check from riscv_isa_string_ext()
>   target/riscv/cpu.c: create KVM mock properties
>   target/riscv: update multi-letter extension KVM properties
>   target/riscv/kvm.c: add kvmconfig_get_cfg_addr() helper
>   target/riscv/kvm.c: read/write (cbom|cboz)_blocksize in KVM

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/riscv/virt.c                               |  14 +-
>  include/standard-headers/linux/const.h        |   2 +-
>  include/standard-headers/linux/virtio_blk.h   |  18 +-
>  .../standard-headers/linux/virtio_config.h    |   6 +
>  include/standard-headers/linux/virtio_net.h   |   1 +
>  linux-headers/asm-arm64/kvm.h                 |  33 ++
>  linux-headers/asm-riscv/kvm.h                 |  53 +-
>  linux-headers/asm-riscv/unistd.h              |   9 +
>  linux-headers/asm-s390/unistd_32.h            |   1 +
>  linux-headers/asm-s390/unistd_64.h            |   1 +
>  linux-headers/asm-x86/kvm.h                   |   3 +
>  linux-headers/linux/const.h                   |   2 +-
>  linux-headers/linux/kvm.h                     |  12 +-
>  linux-headers/linux/psp-sev.h                 |   7 +
>  linux-headers/linux/userfaultfd.h             |  17 +-
>  target/riscv/cpu.c                            | 341 ++++++++++--
>  target/riscv/cpu.h                            |   7 +-
>  target/riscv/kvm.c                            | 499 +++++++++++++++++-
>  target/riscv/kvm_riscv.h                      |   1 +
>  19 files changed, 940 insertions(+), 87 deletions(-)
>
> --
> 2.41.0
>
>

