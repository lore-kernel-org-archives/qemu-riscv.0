Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCdMV-0000kq-W1
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 02:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59545)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anup@brainfault.org>) id 1jCdMT-0000kY-EF
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 01:59:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anup@brainfault.org>) id 1jCdMS-0007n4-23
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 01:59:57 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54564)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <anup@brainfault.org>) id 1jCdMR-0007hX-KG
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 01:59:55 -0400
Received: by mail-wm1-x343.google.com with SMTP id n8so8579335wmc.4
 for <qemu-riscv@nongnu.org>; Thu, 12 Mar 2020 22:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p465tcub9AtF403vel847oSX/UQZFTn1XjkxGFY82+k=;
 b=g+m67uUkzjiEcGfM+zf3yEkTVI0c8GAyaiyH5WaB6WiCzGmeF77AjFCcXulYq108Oi
 wSgodk2+1srQRDsJLIcaZQed5960QGoE7nD+ynBoqcPFjPo+cMR1a/4YTpP2lARkJHCu
 AENPMO0b1KyZ1f1bNvKkxena6f4pI1IlZsffJezzZtXTP0pEk5DzPIVZuFUHBUOcGW6q
 BSYLydmQRI0AaNJJqe6Waq0cyO6BuyJcdrpAZbbzI5v1dmEyl5i4cIOBbWAE9kcLiIx7
 xKHRgn/eSBPQCoEe7WMYfn3Eo0egS3y4Ve/IFQKzfl9OZQlZH84vE9MLvkGE0ypfDJ3/
 yF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p465tcub9AtF403vel847oSX/UQZFTn1XjkxGFY82+k=;
 b=rXWqdxLJjR6NzQGgU5vRZHx8WiY5ep9EjDlD1BZx3ggJjtE/SB9jQfSZHfJMNCqP1P
 tO2zP0oJmcN6SunwQma+jdQEWZpys7ow+Xd0uHE2YbBPGMBjmCMF8TkypOk0xM4pVM9Z
 jGYx3uQVUROrpu/gSw0paRDxMMfmNLm49aeOJ7TEfexMu/Xi71KViw3XFQ7wgg8p20U4
 HO3yEWxmIoECr03HgWB1ywMeJKbCqzMz0tDWPIUjXPE6+3JS4gLOYp08Rxxtu4AK5Srb
 7B8DzVSMfEsY3XHduSbM1Nu28acx6yrA1Rcj8T/j5qP3kpPqH6w+Qct3xERwfYlv/qFe
 uBsA==
X-Gm-Message-State: ANhLgQ0ld62lu+7iTDVwb0Pqgb/1FL4sVlHRlYObvf6+yU+fu+APFVfy
 BHRLjtdGTVBJoomag96IbrPTIz+v9Q7lGTa9w4o7eQ==
X-Google-Smtp-Source: ADFU+vuQt9NFWcDjNAnjPs/vg14y9i3Uffm3kMCCH640ZKv2hXYyLGYT7TZSUYeeavFORnTqy2Lmr5b6oMGQjBKZVRw=
X-Received: by 2002:a1c:6146:: with SMTP id v67mr9117387wmb.78.1584079193400; 
 Thu, 12 Mar 2020 22:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200313034949.3028-1-jiangyifei@huawei.com>
In-Reply-To: <20200313034949.3028-1-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 Mar 2020 11:29:41 +0530
Message-ID: <CAAhSdy3-K5rxiJkjBp8iUnDqVZz0hQkNCVactmamsOcVZv3GOQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] Add riscv64 kvm accel support
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
X-Received-From: 2a00:1450:4864:20::343
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
X-List-Received-Date: Fri, 13 Mar 2020 05:59:58 -0000

On Fri, Mar 13, 2020 at 9:23 AM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Hi,
>
> This series adds riscv64 kvm support, It is based on riscv_kvm_master
> branch at https://github.com/kvm-riscv/linux.
>
> This series depends on above pending changes which haven't yet been
> accepted, so this QEMU patch series is blocked until that dependency
> has been dealt with, but is worth reviewing anyway.
>
> Several steps to use this:
>
> 1. Build riscv64 emulation
> $ ./configure --target-list=riscv64-softmmu
> $ make -j$(nproc)
>
> 2. Build kernel
> riscv_kvm_master branch at https://github.com/kvm-riscv/linux
>
> 3. Build QEMU VM
> I cross build in riscv toolchain
> $ PKG_CONFIG_LIBDIR=<toolchain pkgconfig path>
> $ export PKG_CONFIG_SYSROOT_DIR=<toolchain sysroot path>
> $ ./configure --target-list=riscv64-softmmu --enable-kvm \
> --cross-prefix=riscv64-linux-gnu- --disable-libiscsi --disable-glusterfs \
> --disable-libusb --disable-usb-redir --audio-drv-list= --disable-opengl \
> --disable-libxml2
>
> 4. Start riscv64 emulation
> $ ./qemu-system-riscv64 -M virt -m 4096M -cpu rv64,x-h=true -nographic \
>         -name guest=riscv-hyp,debug-threads=on \
>         -smp 4 \
>         -kernel ./fw_jump.elf \
>         -device loader,file=./Image,addr=0x80200000 \
>         -drive file=./hyp.img,format=raw,id=hd0 \
>         -device virtio-blk-device,drive=hd0 \
>         -append "root=/dev/vda rw console=ttyS0 earlycon=sbi"
>
> 5. Start kvm-acceled QEMU VM in riscv64 emulation
> $ ./qemu-system-riscv64 -M virt,accel=kvm -m 1024M -cpu host -nographic \
>         -name guest=riscv-guset \
>          -smp 2 \
>         -kernel ./Image \
>         -drive file=./guest.img,format=raw,id=hd0 \
>         -device virtio-blk-device,drive=hd0 \
>         -append "root=/dev/vda rw console=ttyS0 earlycon=sbi"
>
> Yifei Jiang (9):
>   linux-header: Update linux/kvm.h
>   target/riscv: Add target/riscv/kvm.c to place the public kvm interface
>   target/riscv: Implement function kvm_arch_init_vcpu
>   target/riscv: Implement kvm_arch_get_registers
>   target/riscv: Implement kvm_arch_put_registers
>   target/riscv: Support start kernel directly by KVM
>   hw/riscv: PLIC update external interrupt by KVM when kvm enabled
>   target/riscv: Handler KVM_EXIT_RISCV_SBI exit
>   target/riscv: add host riscv64 cpu type
>
>  configure                  |   1 +
>  hw/riscv/sifive_plic.c     |  31 ++-
>  hw/riscv/virt.c            |  15 +-
>  linux-headers/linux/kvm.h  |   8 +
>  target/riscv/Makefile.objs |   1 +
>  target/riscv/cpu.c         |   9 +
>  target/riscv/cpu.h         |   4 +
>  target/riscv/kvm.c         | 513 +++++++++++++++++++++++++++++++++++++
>  target/riscv/kvm_riscv.h   |  25 ++
>  9 files changed, 596 insertions(+), 11 deletions(-)
>  create mode 100644 target/riscv/kvm.c
>  create mode 100644 target/riscv/kvm_riscv.h
>
> --
> 2.19.1
>
>
>

First of all many thanks for doing QEMU KVM support. It wasted
bit of my time because I was already doing it but I am happy to
see the patches on list sooner.

In future, please CC the KVM RISC-V mailing list for all QEMU KVM
RISC-V work. The KVM RISC-V mailing list for related projects
(QEMU, KVMTOOL, libvirt, etc) and not just Linux KVM RISC-V.

Currently, we can only review this patch series and get it in final
shape but it can only be merged in QEMU after Linux KVM RISC-V
patches are merged in Linux kernel.

I will be sending out KVM RISC-V v11 series today. There is
a crucial bug fix related to HIDELEG CSR programing. This
bug fix is required in both QEMU and KVM RISC-V. Palmer has
already accepted QEMU HIDELEG CSR fix. The KVM RISC-V
v11 series will have this fix as well.

Thanks & Regards,
Anup Patel

