Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9ao3-0000uo-3u
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 17:48:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9anz-0000rF-CY; Mon, 17 Jan 2022 17:48:52 -0500
Received: from [2607:f8b0:4864:20::d33] (port=44761
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9anv-0000Ok-T8; Mon, 17 Jan 2022 17:48:50 -0500
Received: by mail-io1-xd33.google.com with SMTP id h23so23226121iol.11;
 Mon, 17 Jan 2022 14:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EcdR1AHcB+Wsmc2souX2vZeAdLHZkB3gZF3osCxqYcs=;
 b=lu0Wi+UTzC5aYVhJJLA0lbY0BZ4Zfs2O+b0fg8S/BSVONr/a0fm/HYCCTyP4ly/8c9
 QIa5mG8aTnHQ4rMVpmfEZZ9PCwYarAnpGEqOAHEcI9kUsR18AMGa8yBP+T+9xsFF2wLV
 VhxZqx9UxjcC5HA8ISnTKv1zUSyRDKyW/ca8kpXi+Z5aBLRzrX1/MMgKEjfW8geMnYaB
 ROTiwQ3l7oq+dHNcORh6HGJ8VrEqaITVLqFZ1uHi2PRoDIHMNgue3i3kDLrkjH/h22A/
 uGPRsVXh6aGuS25lWJU9a983u8FTz9qi4gjz+QvwIxw5Px3jUK8cAWTyym4vi4mCoThQ
 7glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EcdR1AHcB+Wsmc2souX2vZeAdLHZkB3gZF3osCxqYcs=;
 b=kcznE43lyJ0B3t3b0CVWYq8uKp6scfE9Mu1qAdrPoRXtPSt8+FXXhVYB/YJ2pd3bSR
 3YXxLHqkLNOjaSzwPpU1cglLTDMMR25w3Z9EV4Yl9AhGOJzs5SdP3ztI4gAPyNeA1X0g
 R2e5jNAEIXoVHePONBkQzROJ1/vvvr03BaARd7DkbNxwXQfnLS5oWUMnd3Wag1lZYLzw
 0JIjcB8FseybgohwVWUVlyuPEWjO+V3uuO8ZV938A5xQtr3T8k3CnqBx4W6VwtYLBNMY
 u3iyqeWIh32QjV3JJiodH9s3s9T85XrDAinGG9a/lqajpb3ckg6qTqrbm886qQzliMOF
 KXMg==
X-Gm-Message-State: AOAM531Dbj34rUJ8xWYhdnW4zWFmSHkpE4Qj6rdykRYS3HQTtKF8I4Bk
 T279At170WxRm27VC60nKIXBb/bh0FsaupVNVbs=
X-Google-Smtp-Source: ABdhPJz38DW7GPkHoX8/vQGy11Al3GVlytUW2dHFKjEqs0D8Im24gf8PJltjVx+bcRDF4+K09VTRXl2CC36hKeKmF5M=
X-Received: by 2002:a5e:8912:: with SMTP id k18mr9651868ioj.90.1642459726388; 
 Mon, 17 Jan 2022 14:48:46 -0800 (PST)
MIME-Version: 1.0
References: <20220112081329.1835-1-jiangyifei@huawei.com>
In-Reply-To: <20220112081329.1835-1-jiangyifei@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 08:48:19 +1000
Message-ID: <CAKmqyKOEB279xvYAjEgwyAsbz=NtsqnhX6oE=W5Lik4Yp+X_Mw@mail.gmail.com>
Subject: Re: [PATCH v5 00/13] Add riscv kvm accel support
To: Yifei Jiang <jiangyifei@huawei.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 kvm-riscv@lists.infradead.org, "open list:Overall" <kvm@vger.kernel.org>,
 libvir-list@redhat.com, 
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 fanliang@huawei.com, 
 "Wubin (H)" <wu.wubin@huawei.com>, wanghaibin.wang@huawei.com,
 wanbo13@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
X-List-Received-Date: Mon, 17 Jan 2022 22:48:53 -0000

On Wed, Jan 12, 2022 at 6:20 PM Yifei Jiang via <qemu-devel@nongnu.org> wrote:
>
> This series adds both riscv32 and riscv64 kvm support, and implements
> migration based on riscv.
>
> Because of RISC-V KVM has been merged into the Linux master, so this
> series are changed from RFC to patch.
>
> Several steps to use this:
> 1. Build emulation
> $ ./configure --target-list=riscv64-softmmu
> $ make -j$(nproc)
>
> 2. Build kernel
>
> 3. Build QEMU VM
> Cross built in riscv toolchain.
> $ PKG_CONFIG_LIBDIR=<toolchain pkgconfig path>
> $ export PKG_CONFIG_SYSROOT_DIR=<toolchain sysroot path>
> $ ./configure --target-list=riscv64-softmmu --enable-kvm \
> --cross-prefix=riscv64-linux-gnu- --disable-libiscsi --disable-glusterfs \
> --disable-libusb --disable-usb-redir --audio-drv-list= --disable-opengl \
> --disable-libxml2
> $ make -j$(nproc)
>
> 4. Start emulation
> $ ./qemu-system-riscv64 -M virt -m 4096M -cpu rv64 -nographic \
>         -name guest=riscv-hyp,debug-threads=on \
>         -smp 4 \
>         -bios ./fw_jump.bin \
>         -kernel ./Image \
>         -drive file=./hyp.img,format=raw,id=hd0 \
>         -device virtio-blk-device,drive=hd0 \
>         -append "root=/dev/vda rw console=ttyS0 earlycon=sbi"
>
> 5. Start kvm-acceled QEMU VM in emulation
> $ ./qemu-system-riscv64 -M virt,accel=kvm -m 1024M -cpu host -nographic \
>         -name guest=riscv-guset \
>         -smp 2 \
>         -bios none \
>         -kernel ./Image \
>         -drive file=./guest.img,format=raw,id=hd0 \
>         -device virtio-blk-device,drive=hd0 \
>         -append "root=/dev/vda rw console=ttyS0 earlycon=sbi"
>
> Changes since patch v4
> - Commit enable kvm accel as an independent patch.
> - Bugfix some checkpatch errors.
> - Bugfix lost a interrupt in the sifive_u machine.
>
> Changes since patch v3
> - Re-write the for-loop in sifive_plic_create().
> - Drop unnecessary change in hw/riscv/virt.c.
> - Use serial to handle console sbi call.
>
> Changes since patch v2
> - Create a macro for get and put timer csr.
> - Remove M-mode PLIC contexts when kvm is enabled.
> - Add get timer frequency.
> - Move cpu_host_load to vmstate_kvmtimer.
>
> Changes since patch v1
> - Rebase on recent commit a216e7cf119c91ffdf5931834a1a030ebea40d70
> - Sync-up headers with Linux-5.16-rc4.
> - Fixbug in kvm_arch_init_vcpu.
> - Create a macro for get and put regs csr.
> - Start kernel directly when kvm_enabled.
> - Use riscv_cpu_set_irq to inject KVM interrupts.
> - Use the Semihosting Console API for RISC-V kvm handle sbi.
> - Update vmstate_riscv_cpu version id.
>   Placing kvm_timer into a subsection.
>
> Changes since RFC v6
> - Rebase on recent commit 8627edfb3f1fca24a96a0954148885c3241c10f8
> - Sync-up headers with Linux-5.16-rc1
>
> Changes since RFC v5
> - Rebase on QEMU v6.1.0-rc1 and kvm-riscv linux v19.
> - Move kvm interrupt setting to riscv_cpu_update_mip().
> - Replace __u64 with uint64_t.
>
> Changes since RFC v4
> - Rebase on QEMU v6.0.0-rc2 and kvm-riscv linux v17.
> - Remove time scaling support as software solution is incomplete.
>   Because it will cause unacceptable performance degradation. and
>   We will post a better solution.
> - Revise according to Alistair's review comments.
>   - Remove compile time XLEN checks in kvm_riscv_reg_id
>   - Surround TYPE_RISCV_CPU_HOST definition by CONFIG_KVM and share
>     it between RV32 and RV64.
>   - Add kvm-stub.c for reduce unnecessary compilation checks.
>   - Add riscv_setup_direct_kernel() to direct boot kernel for KVM.
>
> Changes since RFC v3
> - Rebase on QEMU v5.2.0-rc2 and kvm-riscv linux v15.
> - Add time scaling support(New patches 13, 14 and 15).
> - Fix the bug that guest vm can't reboot.
>
> Changes since RFC v2
> - Fix checkpatch error at target/riscv/sbi_ecall_interface.h.
> - Add riscv migration support.
>
> Changes since RFC v1
> - Add separate SBI ecall interface header.
> - Add riscv32 kvm accel support.
>
> Yifei Jiang (13):
>   update-linux-headers: Add asm-riscv/kvm.h
>   target/riscv: Add target/riscv/kvm.c to place the public kvm interface
>   target/riscv: Implement function kvm_arch_init_vcpu
>   target/riscv: Implement kvm_arch_get_registers
>   target/riscv: Implement kvm_arch_put_registers
>   target/riscv: Support start kernel directly by KVM
>   target/riscv: Support setting external interrupt by KVM
>   target/riscv: Handle KVM_EXIT_RISCV_SBI exit
>   target/riscv: Add host cpu type
>   target/riscv: Add kvm_riscv_get/put_regs_timer
>   target/riscv: Implement virtual time adjusting with vm state changing
>   target/riscv: Support virtual time context synchronization
>   target/riscv: enable riscv kvm accel

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/intc/sifive_plic.c              |  20 +-
>  hw/riscv/boot.c                    |  16 +-
>  hw/riscv/virt.c                    |  83 +++--
>  include/hw/riscv/boot.h            |   1 +
>  linux-headers/asm-riscv/kvm.h      | 128 +++++++
>  meson.build                        |   2 +
>  target/riscv/cpu.c                 |  29 +-
>  target/riscv/cpu.h                 |  11 +
>  target/riscv/kvm-stub.c            |  30 ++
>  target/riscv/kvm.c                 | 535 +++++++++++++++++++++++++++++
>  target/riscv/kvm_riscv.h           |  25 ++
>  target/riscv/machine.c             |  30 ++
>  target/riscv/meson.build           |   1 +
>  target/riscv/sbi_ecall_interface.h |  72 ++++
>  14 files changed, 951 insertions(+), 32 deletions(-)
>  create mode 100644 linux-headers/asm-riscv/kvm.h
>  create mode 100644 target/riscv/kvm-stub.c
>  create mode 100644 target/riscv/kvm.c
>  create mode 100644 target/riscv/kvm_riscv.h
>  create mode 100644 target/riscv/sbi_ecall_interface.h
>
> --
> 2.19.1
>
>

