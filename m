Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHIUj-0006ii-3d
	for mharc-qemu-riscv@gnu.org; Mon, 16 Jan 2023 00:57:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1pHIUh-0006iP-D3
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 00:57:19 -0500
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1pHIUe-0003oK-P4
 for qemu-riscv@nongnu.org; Mon, 16 Jan 2023 00:57:19 -0500
Received: by mail-qv1-xf2a.google.com with SMTP id d13so18981460qvj.8
 for <qemu-riscv@nongnu.org>; Sun, 15 Jan 2023 21:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cTJ6y/KTGZCfnhiCk0X2KB+1uFg6s0lnqLxwL6srYqw=;
 b=IwVc5uqV+VGxQ5g9D4XqaeJBh33hF/O3EtUQm/SUo/cSSytiB4BlrMkVrUCC6tmVAV
 CYIpcWN37sBzyBqXmwKLl6qkWLc6FwxdLMA9CM0iiJLhSSNG5XcoSaCLwGSrv7CU2Lsh
 G8eq3PTRJu52SeV8gIs5UQ9fMeonUqSQOHv0rzQXRFIT/nOR2ba50Wiq6mPYp/WNBtTz
 q2FiefHP9JHJfpvsLk1brPaajSeFe2f4ijhT0jjmW9brBfwnWzsGge9GfL++vHGkp4NM
 vqDDVfHzKhmIQ5d4Jp/MQ9IQnQAcMgwOHmcltMuApXOA880Ti9a3MjQJ2dbAKRMh6nSI
 ZCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cTJ6y/KTGZCfnhiCk0X2KB+1uFg6s0lnqLxwL6srYqw=;
 b=pigqr4eO1wzE21zDVR/XZVaRM20zn+bmvaUpx/CeVjUIqtlhtyugUIz7+EiBIYMrqD
 3Kg5o/T3To2hZ9Z/sosEz0GfchXqvRRB9pkDIVh/ZMR2W/8y+0JFsLTiQwJ2qcDL6yVP
 CUfTa8Y/frz1KeXDt9veKYgsv1kgyMP6y6T4/t3vozEO6Q0sQ1rNVGfxgKpnbYDFABPv
 HO3oRzCzx4fS7eCKFzzRdkaCgSwjkSfyU9WrLqkyxPiLXRq4vE3nxN1x2HEnroWEowJe
 8ipBY27Fj/NTNUfdCW3cQ9OFudhyU7O+nhBxNz8ETTtfX2p1+b2n0AWyvz9AT704lX3L
 Lvyw==
X-Gm-Message-State: AFqh2krIsTPD/3dM9hrtKrOv6CBZ4jDq/CeXMRjDPjKkSt2ZhC6gi1+6
 w7BBpI4v/2FQOfeBhDesW0emxraaWU47NNdx0+0XDZzOAwl5Ug==
X-Google-Smtp-Source: AMrXdXulljaCQYNEjPTpiyyleiu2GujZGDJVoL79KqAdFX/vOMMOW+H5e6Sj4L32/2lRnyOACnuxDLQdw8OlHWKHt30=
X-Received: by 2002:a67:b44d:0:b0:3d3:c41b:50f9 with SMTP id
 c13-20020a67b44d000000b003d3c41b50f9mr752518vsm.10.1673846453512; Sun, 15 Jan
 2023 21:20:53 -0800 (PST)
MIME-Version: 1.0
References: <20221108125703.1463577-1-apatel@ventanamicro.com>
 <20221108125703.1463577-3-apatel@ventanamicro.com>
 <CAKmqyKP+hc4N6Z2AqkQpCmF=oyTE_rf-XfSsTHChwcUWRE5gsg@mail.gmail.com>
 <CAK9=C2Uu1bCcZht+ydiazSmgnkD_hhLetXP4WcA92DypE4m9=A@mail.gmail.com>
 <CAKmqyKPw54F0uVy+7SjoY16o7RYyW6qwLhaYaKR7aNpP4Nz27Q@mail.gmail.com>
 <CAK9=C2V21JcgyUKub1JGVT0DEaeyzJ1GXQYcyaZy4Xv26F5fyA@mail.gmail.com>
 <CAKmqyKOc+xKEy1nhp6vCOtVHspfQ5WY7oE6wx5aGURhxQOrdqQ@mail.gmail.com>
 <CAK9=C2VA-1c8J-t8Sqp-8+eW9-0xaALgbG8LORd06--Jb-gTAw@mail.gmail.com>
 <CAKmqyKMQ7VJeeh0Rm3gjv8wDNgqsP5ShgbK2FaJstFSGAZgf8Q@mail.gmail.com>
 <CAK9=C2VY_c=1CSjnUDRGLw3pLN1L_9ta1xRYjwVGiH8t4bqzSw@mail.gmail.com>
In-Reply-To: <CAK9=C2VY_c=1CSjnUDRGLw3pLN1L_9ta1xRYjwVGiH8t4bqzSw@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 16 Jan 2023 10:50:41 +0530
Message-ID: <CAK9=C2VFSNAcaz3ooAYUDzbK=TNDnU2RFUVLmC=k4ywr7DtF9g@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] target/riscv: Update VS timer whenever htimedelta
 changes
To: Alistair Francis <alistair23@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=apatel@ventanamicro.com; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 16 Jan 2023 05:57:19 -0000

Hi Alistair,

On Tue, Jan 3, 2023 at 9:43 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Hi Alistair,
>
> On Wed, Dec 28, 2022 at 11:08 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Fri, Dec 23, 2022 at 11:14 PM Anup Patel <apatel@ventanamicro.com> wrote:
> > >
> > > On Thu, Dec 15, 2022 at 8:55 AM Alistair Francis <alistair23@gmail.com> wrote:
> > > >
> > > > On Mon, Dec 12, 2022 at 9:12 PM Anup Patel <apatel@ventanamicro.com> wrote:
> > > > >
> > > > > On Mon, Dec 12, 2022 at 11:23 AM Alistair Francis <alistair23@gmail.com> wrote:
> > > > > >
> > > > > > On Thu, Dec 8, 2022 at 6:41 PM Anup Patel <apatel@ventanamicro.com> wrote:
> > > > > > >
> > > > > > > On Thu, Dec 8, 2022 at 9:00 AM Alistair Francis <alistair23@gmail.com> wrote:
> > > > > > > >
> > > > > > > > On Tue, Nov 8, 2022 at 11:07 PM Anup Patel <apatel@ventanamicro.com> wrote:
> > > > > > > > >
> > > > > > > > > The htimedelta[h] CSR has impact on the VS timer comparison so we
> > > > > > > > > should call riscv_timer_write_timecmp() whenever htimedelta changes.
> > > > > > > > >
> > > > > > > > > Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp suppor")
> > > > > > > > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > > > > > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > > > >
> > > > > > > > This patch breaks my Xvisor test. When running OpenSBI and Xvisor like this:
> > > > > > > >
> > > > > > > > qemu-system-riscv64 -machine virt \
> > > > > > > >     -m 1G -serial mon:stdio -serial null -nographic \
> > > > > > > >     -append 'vmm.console=uart@10000000 vmm.bootcmd="vfs mount initrd
> > > > > > > > /;vfs run /boot.xscript;vfs cat /system/banner.txt; guest kick guest0;
> > > > > > > > vserial bind guest0/uart0"' \
> > > > > > > >     -smp 4 -d guest_errors \
> > > > > > > >     -bios none \
> > > > > > > >     -device loader,file=./images/qemuriscv64/vmm.bin,addr=0x80200000 \
> > > > > > > >     -kernel ./images/qemuriscv64/fw_jump.elf \
> > > > > > > >     -initrd ./images/qemuriscv64/vmm-disk-linux.img -cpu rv64,h=true
> > > > > > > >
> > > > > > > > Running:
> > > > > > > >
> > > > > > > > Xvisor v0.3.0-129-gbc33f339 (Jan  1 1970 00:00:00)
> > > > > > > >
> > > > > > > > I see this failure:
> > > > > > > >
> > > > > > > > INIT: bootcmd:  guest kick guest0
> > > > > > > >
> > > > > > > > guest0: Kicked
> > > > > > > >
> > > > > > > > INIT: bootcmd:  vserial bind guest0/uart0
> > > > > > > >
> > > > > > > > [guest0/uart0] cpu_vcpu_stage2_map: guest_phys=0x000000003B9AC000
> > > > > > > > size=0x4096 map failed
> > > > > > > >
> > > > > > > > do_error: CPU3: VCPU=guest0/vcpu0 page fault failed (error -1)
> > > > > > > >
> > > > > > > >        zero=0x0000000000000000          ra=0x0000000080001B4E
> > > > > > > >
> > > > > > > >          sp=0x000000008001CF80          gp=0x0000000000000000
> > > > > > > >
> > > > > > > >          tp=0x0000000000000000          s0=0x000000008001CFB0
> > > > > > > >
> > > > > > > >          s1=0x0000000000000000          a0=0x0000000010001048
> > > > > > > >
> > > > > > > >          a1=0x0000000000000000          a2=0x0000000000989680
> > > > > > > >
> > > > > > > >          a3=0x000000003B9ACA00          a4=0x0000000000000048
> > > > > > > >
> > > > > > > >          a5=0x0000000000000000          a6=0x0000000000019000
> > > > > > > >
> > > > > > > >          a7=0x0000000000000000          s2=0x0000000000000000
> > > > > > > >
> > > > > > > >          s3=0x0000000000000000          s4=0x0000000000000000
> > > > > > > >
> > > > > > > >          s5=0x0000000000000000          s6=0x0000000000000000
> > > > > > > >
> > > > > > > >          s7=0x0000000000000000          s8=0x0000000000000000
> > > > > > > >
> > > > > > > >          s9=0x0000000000000000         s10=0x0000000000000000
> > > > > > > >
> > > > > > > >         s11=0x0000000000000000          t0=0x0000000000004000
> > > > > > > >
> > > > > > > >          t1=0x0000000000000100          t2=0x0000000000000000
> > > > > > > >
> > > > > > > >          t3=0x0000000000000000          t4=0x0000000000000000
> > > > > > > >
> > > > > > > >          t5=0x0000000000000000          t6=0x0000000000000000
> > > > > > > >
> > > > > > > >        sepc=0x0000000080001918     sstatus=0x0000000200004120
> > > > > > > >
> > > > > > > >     hstatus=0x00000002002001C0     sp_exec=0x0000000010A64000
> > > > > > > >
> > > > > > > >      scause=0x0000000000000017       stval=0x000000003B9ACAF8
> > > > > > > >
> > > > > > > >       htval=0x000000000EE6B2BE      htinst=0x0000000000D03021
> > > > > > > >
> > > > > > > > I have tried updating to a newer Xvisor release, but with that I don't
> > > > > > > > get any serial output.
> > > > > > > >
> > > > > > > > Can you help get the Xvisor tests back up and running?
> > > > > > >
> > > > > > > I tried the latest Xvisor-next (https://github.com/avpatel/xvisor-next)
> > > > > > > with your QEMU riscv-to-apply.next branch and it works fine (both
> > > > > > > with and without Sstc).
> > > > > >
> > > > > > Does it work with the latest release?
> > > > >
> > > > > Yes, the latest Xvisor-next repo works for QEMU v7.2.0-rc4 and
> > > > > your riscv-to-apply.next branch (commit 51bb9de2d188)
> > > >
> > > > I can't get anything to work with this patch. I have dropped this and
> > > > the patches after this.
> > > >
> > > > I'm building the latest Xvisor release with:
> > > >
> > > > export CROSS_COMPILE=riscv64-linux-gnu-
> > > > ARCH=riscv make generic-64b-defconfig
> > > > make
> > > >
> > > > and running it as above, yet nothing. What am I missing here?
> > >
> > > I tried multiple times with the latest Xvisor on different machines but
> > > still can't reproduce the issue you are seeing.
> >
> > Odd
> >
> > >
> > > We generally provide pre-built binaries with every Xvisor release
> > > so I will share with you pre-built binaries of the upcoming Xvisor-0.3.2
> > > release. Maybe that would help you ?
> >
> > That would work. Let me know when the release happens and I can update
> > my images.
>
> Please download the Xvisor v0.3.2 pre-built binary tarball from:
> https://xhypervisor.org/tarball/xvisor-0.3.2-bins.tar.xz
>
> After untarring the above tarball, you can try the following command:
> $ qemu-system-riscv64 -M virt -m 512M -nographic -bios
> opensbi/build/platform/generic/firmware/fw_jump.bin -kernel
> xvisor-0.3.2-bins/riscv/rv64/xvisor/vmm.bin -initrd
> xvisor-0.3.2-bins/riscv/rv64/guest/virt64/disk-linux-6.1.1-one_guest_virt64.ext2
> -append "vmm.bootcmd=\"vfs mount initrd /;vfs run /boot.xscript;vfs
> cat /system/banner.txt\""
> OR
> $ qemu-system-riscv32 -M virt -m 512M -nographic -bios
> opensbi/build/platform/generic/firmware/fw_jump.bin -kernel
> xvisor-0.3.2-bins/riscv/rv32/xvisor/vmm.bin -initrd
> xvisor-0.3.2-bins/riscv/rv32/guest/virt32/disk-linux-6.1.1-one_guest_virt32.ext2
> -append "vmm.bootcmd=\"vfs mount initrd /;vfs run /boot.xscript;vfs
> cat /system/banner.txt\""

Do you want me to rebase and resend the patches which
are not merged ?

Regards,
Anup

