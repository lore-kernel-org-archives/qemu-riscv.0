Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4buM-0005uv-8b
	for mharc-qemu-riscv@gnu.org; Mon, 12 Dec 2022 01:03:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p4bti-0005gh-4h; Mon, 12 Dec 2022 01:02:48 -0500
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p4btI-0007I5-7s; Mon, 12 Dec 2022 01:02:41 -0500
Received: by mail-vs1-xe36.google.com with SMTP id i2so10199870vsc.1;
 Sun, 11 Dec 2022 22:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wClejFOUkN3OisgEGRA8xE8OMNVCY2COnJ88bhaPun4=;
 b=DXQsZiKQzg0Xv2sp6XOFcDWE+ww9XULk5SvYZPkofkIgGv+kV6lgAYZiUbqtJF9GXD
 brLQUfGNdCtZSViyyYDPitFKNSxnLj9oX9+uCtPdF9rvwv2+kibehzeNCPfbhBCgbqB1
 JAyofHD4cWKOzuvQ7xBmT9BNNg4+OsC1rdxhQceeWnMgzPGVnfFAZSRH8fR2OmSbpdv9
 45iGHJAXfcOD56dXnsn6x8DmIaAmZP+dQJp/nb4uJif7Vh6+EtC/HH+xCuVsu5IgPh/r
 U1mqzv8ET1hNT2YzMIJpO6DU4xAtGVnKXMOc6+Gu1fKRjKnMg3/JMptPcelgBivt2ItP
 G4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wClejFOUkN3OisgEGRA8xE8OMNVCY2COnJ88bhaPun4=;
 b=jCUcBsMSt5nSBFbiUKrJX8gGCZzHYkeGlM1pKfKRomtc0cWlfY2mqHBWTL/uHNyji1
 W+w0Jp04rgJSyERCMRkqNOWagSwmHxoZ5eBgUvF+Mikgkip3yLyb7DgCLqXn3w4hPvO5
 pBKWs2XDxmEeq3Am99GV5GFd786H8UaEGlLFSc8K/4PRBiY62itGuENgvFr2v6oIw3Hg
 CcKTuyHaZtCIoe3n+wxmBqgV5fcldZmRV0///ZHLDSR9/Bxvrcic7OEVifFxVn0KS4WX
 krj2HJzAc2bm6/WgI6VCANvGK82fBX8yhwTRv0nsB7pWeRK/GJ3slIP3NZGgTgC6BFzf
 Ljsg==
X-Gm-Message-State: ANoB5pndztfNjk6siUO9wmUK1GRU7LU53Mst3HLZHHqYGFxRYqZadQRz
 1MuxVLvJ9Oh1HRPEqRwUYqfSpwUICWMOj7bWOl4=
X-Google-Smtp-Source: AA0mqf6LPwTcvu9sS+gEQhQfdn7LF4gVyQWzF6/lrUBMv+ZKz+hWp2c8gLNEpJIV9Ak4tlfeZDCjdZ9o7Ea1Czxduew=
X-Received: by 2002:a05:6102:302b:b0:3b0:f936:788b with SMTP id
 v11-20020a056102302b00b003b0f936788bmr18360616vsa.54.1670824931257; Sun, 11
 Dec 2022 22:02:11 -0800 (PST)
MIME-Version: 1.0
References: <20221208145411.122799-1-mchitale@ventanamicro.com>
In-Reply-To: <20221208145411.122799-1-mchitale@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Dec 2022 16:01:45 +1000
Message-ID: <CAKmqyKPAPB2we33p_oyzdhHRVzJumzsbAukeAXfWsUPoTbPD1w@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] target/riscv: Apply KVM policy to ISA extensions
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe36.google.com
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
X-List-Received-Date: Mon, 12 Dec 2022 06:03:10 -0000

On Fri, Dec 9, 2022 at 12:57 AM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> Currently the single and multi letter ISA extensions exposed to the
> guest vcpu don't confirm to the KVM policies. This patchset updates the kvm headers
> and applies policies set in KVM to the extensions exposed to the guest.
>
> These patches can also be found on riscv_kvm_ext_v3 branch at:
> https://github.com/mdchitale/qemu.git
>
> Changes in v3:
> - Address comments from Bin Meng
>
> Changes in v2:
> - Rebase to latest riscv-to-apply.next
> - Update linux headers to version 6.1-rc8
> - Add reviewed by tags
>
> Mayuresh Chitale (3):
>   update-linux-headers: Version 6.1-rc8
>   target/riscv: Extend isa_ext_data for single letter extensions
>   target/riscv: kvm: Support selecting VCPU extensions

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  include/standard-headers/drm/drm_fourcc.h     |  34 ++++-
>  include/standard-headers/linux/ethtool.h      |  63 +++++++-
>  include/standard-headers/linux/fuse.h         |   6 +-
>  .../linux/input-event-codes.h                 |   1 +
>  include/standard-headers/linux/virtio_blk.h   |  19 +++
>  linux-headers/asm-generic/hugetlb_encode.h    |  26 ++--
>  linux-headers/asm-generic/mman-common.h       |   2 +
>  linux-headers/asm-mips/mman.h                 |   2 +
>  linux-headers/asm-riscv/kvm.h                 |   4 +
>  linux-headers/linux/kvm.h                     |   1 +
>  linux-headers/linux/psci.h                    |  14 ++
>  linux-headers/linux/userfaultfd.h             |   4 +
>  linux-headers/linux/vfio.h                    | 142 ++++++++++++++++++
>  target/riscv/cpu.c                            |  52 ++++---
>  target/riscv/kvm.c                            |  88 +++++++++--
>  target/riscv/kvm_riscv.h                      |   2 +-
>  16 files changed, 408 insertions(+), 52 deletions(-)
>
> --
> 2.34.1
>
>

