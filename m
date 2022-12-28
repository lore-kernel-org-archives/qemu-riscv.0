Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAP9T-0002Gj-Hc
	for mharc-qemu-riscv@gnu.org; Wed, 28 Dec 2022 00:38:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pAP9S-0002GV-AT; Wed, 28 Dec 2022 00:38:54 -0500
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pAP9Q-0008DS-En; Wed, 28 Dec 2022 00:38:54 -0500
Received: by mail-vs1-xe34.google.com with SMTP id 128so14606982vsz.12;
 Tue, 27 Dec 2022 21:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AoGLHyqSK5DFhmIoljd+/g+zW87eTtl2QdgdFurPWbM=;
 b=c6FDyfBAMuw7T9U5Ceu+kOjSLC0IoKZbMTj0f+JSDRLLSSVwPUuY10cDjiNaaXkyQF
 6g1Qd7TBsId1Eyaa7XFVOwpoFgTXzz0R6TgEgWzfD4EXPJDgfxpX3Tf6SnxBTf2ltVzy
 9GPHg8EnpwOOHlc5e4ndZP1+QKCIP5qxpMunfLtUrdRM2TJkitzDMtomFuWKyVBIL+Lw
 xFgNDNJF4FoHIiuunstDtkGXIa8qtHXzSQoSzxi7eKfWdz/39PYJEmLn/KeLxZed5Ne2
 lPVxBnOJ0BdTfjzjhtLNo4xpxKjZGybnmrti46A2x4uJs7sWWtlFRsbOcgMTbiVpAzkG
 838Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AoGLHyqSK5DFhmIoljd+/g+zW87eTtl2QdgdFurPWbM=;
 b=57zQpMnzC6Ovse+8XTTADIenWQrfFnNyeYo2EqTmZrY+2Zvz5dMDysG9JJSv9WqGdo
 EgsZ6et+aW2X8FusekZHC1g3DUBpA3Mu+YFZ1m3rlFZqOpu/22yFrKSSMTmdrNYGKJNh
 grWmQpQEkQSr73Ugc4YT5G6QP2eJKnohLhuXUuwiTxbFzgkHUbjgu2+yY2lB2vNoJ91f
 v50pbmxEZ+zVRR8z3+ZPKVn9RzRC2zwbeM1ShmwsVtz1dlTSz91vkih43MWSVPrJEBjQ
 NczVzy+J/Mk2onUYCIlQq4HF0bag/rpOpyxzPLxL9KcOWNWv4/gwoz7ywLFi6cbSslpE
 TIiA==
X-Gm-Message-State: AFqh2kqzH686IpGMS6OOKofxCT/lt3BijL9F2GNLXLQjJQMArIFIFstm
 HYjnj0v8T5pU6plBuLzWVoq9yehhfOm9NTUUn7o=
X-Google-Smtp-Source: AMrXdXui05wgqnELAFqYDg6qfb8zerp9qFvFCh0W6GyEEFfEHG+/me+j6QICZpcigRViSyRaqlf+6/fE0qO8sytLBgw=
X-Received: by 2002:a67:dc10:0:b0:3b3:7675:d423 with SMTP id
 x16-20020a67dc10000000b003b37675d423mr2700468vsj.72.1672205931096; Tue, 27
 Dec 2022 21:38:51 -0800 (PST)
MIME-Version: 1.0
References: <20221108125703.1463577-1-apatel@ventanamicro.com>
 <20221108125703.1463577-3-apatel@ventanamicro.com>
 <CAKmqyKP+hc4N6Z2AqkQpCmF=oyTE_rf-XfSsTHChwcUWRE5gsg@mail.gmail.com>
 <CAK9=C2Uu1bCcZht+ydiazSmgnkD_hhLetXP4WcA92DypE4m9=A@mail.gmail.com>
 <CAKmqyKPw54F0uVy+7SjoY16o7RYyW6qwLhaYaKR7aNpP4Nz27Q@mail.gmail.com>
 <CAK9=C2V21JcgyUKub1JGVT0DEaeyzJ1GXQYcyaZy4Xv26F5fyA@mail.gmail.com>
 <CAKmqyKOc+xKEy1nhp6vCOtVHspfQ5WY7oE6wx5aGURhxQOrdqQ@mail.gmail.com>
 <CAK9=C2VA-1c8J-t8Sqp-8+eW9-0xaALgbG8LORd06--Jb-gTAw@mail.gmail.com>
In-Reply-To: <CAK9=C2VA-1c8J-t8Sqp-8+eW9-0xaALgbG8LORd06--Jb-gTAw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 28 Dec 2022 15:38:24 +1000
Message-ID: <CAKmqyKMQ7VJeeh0Rm3gjv8wDNgqsP5ShgbK2FaJstFSGAZgf8Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] target/riscv: Update VS timer whenever htimedelta
 changes
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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
X-List-Received-Date: Wed, 28 Dec 2022 05:38:54 -0000

On Fri, Dec 23, 2022 at 11:14 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> On Thu, Dec 15, 2022 at 8:55 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Mon, Dec 12, 2022 at 9:12 PM Anup Patel <apatel@ventanamicro.com> wrote:
> > >
> > > On Mon, Dec 12, 2022 at 11:23 AM Alistair Francis <alistair23@gmail.com> wrote:
> > > >
> > > > On Thu, Dec 8, 2022 at 6:41 PM Anup Patel <apatel@ventanamicro.com> wrote:
> > > > >
> > > > > On Thu, Dec 8, 2022 at 9:00 AM Alistair Francis <alistair23@gmail.com> wrote:
> > > > > >
> > > > > > On Tue, Nov 8, 2022 at 11:07 PM Anup Patel <apatel@ventanamicro.com> wrote:
> > > > > > >
> > > > > > > The htimedelta[h] CSR has impact on the VS timer comparison so we
> > > > > > > should call riscv_timer_write_timecmp() whenever htimedelta changes.
> > > > > > >
> > > > > > > Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp suppor")
> > > > > > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > > > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > > > >
> > > > > > This patch breaks my Xvisor test. When running OpenSBI and Xvisor like this:
> > > > > >
> > > > > > qemu-system-riscv64 -machine virt \
> > > > > >     -m 1G -serial mon:stdio -serial null -nographic \
> > > > > >     -append 'vmm.console=uart@10000000 vmm.bootcmd="vfs mount initrd
> > > > > > /;vfs run /boot.xscript;vfs cat /system/banner.txt; guest kick guest0;
> > > > > > vserial bind guest0/uart0"' \
> > > > > >     -smp 4 -d guest_errors \
> > > > > >     -bios none \
> > > > > >     -device loader,file=./images/qemuriscv64/vmm.bin,addr=0x80200000 \
> > > > > >     -kernel ./images/qemuriscv64/fw_jump.elf \
> > > > > >     -initrd ./images/qemuriscv64/vmm-disk-linux.img -cpu rv64,h=true
> > > > > >
> > > > > > Running:
> > > > > >
> > > > > > Xvisor v0.3.0-129-gbc33f339 (Jan  1 1970 00:00:00)
> > > > > >
> > > > > > I see this failure:
> > > > > >
> > > > > > INIT: bootcmd:  guest kick guest0
> > > > > >
> > > > > > guest0: Kicked
> > > > > >
> > > > > > INIT: bootcmd:  vserial bind guest0/uart0
> > > > > >
> > > > > > [guest0/uart0] cpu_vcpu_stage2_map: guest_phys=0x000000003B9AC000
> > > > > > size=0x4096 map failed
> > > > > >
> > > > > > do_error: CPU3: VCPU=guest0/vcpu0 page fault failed (error -1)
> > > > > >
> > > > > >        zero=0x0000000000000000          ra=0x0000000080001B4E
> > > > > >
> > > > > >          sp=0x000000008001CF80          gp=0x0000000000000000
> > > > > >
> > > > > >          tp=0x0000000000000000          s0=0x000000008001CFB0
> > > > > >
> > > > > >          s1=0x0000000000000000          a0=0x0000000010001048
> > > > > >
> > > > > >          a1=0x0000000000000000          a2=0x0000000000989680
> > > > > >
> > > > > >          a3=0x000000003B9ACA00          a4=0x0000000000000048
> > > > > >
> > > > > >          a5=0x0000000000000000          a6=0x0000000000019000
> > > > > >
> > > > > >          a7=0x0000000000000000          s2=0x0000000000000000
> > > > > >
> > > > > >          s3=0x0000000000000000          s4=0x0000000000000000
> > > > > >
> > > > > >          s5=0x0000000000000000          s6=0x0000000000000000
> > > > > >
> > > > > >          s7=0x0000000000000000          s8=0x0000000000000000
> > > > > >
> > > > > >          s9=0x0000000000000000         s10=0x0000000000000000
> > > > > >
> > > > > >         s11=0x0000000000000000          t0=0x0000000000004000
> > > > > >
> > > > > >          t1=0x0000000000000100          t2=0x0000000000000000
> > > > > >
> > > > > >          t3=0x0000000000000000          t4=0x0000000000000000
> > > > > >
> > > > > >          t5=0x0000000000000000          t6=0x0000000000000000
> > > > > >
> > > > > >        sepc=0x0000000080001918     sstatus=0x0000000200004120
> > > > > >
> > > > > >     hstatus=0x00000002002001C0     sp_exec=0x0000000010A64000
> > > > > >
> > > > > >      scause=0x0000000000000017       stval=0x000000003B9ACAF8
> > > > > >
> > > > > >       htval=0x000000000EE6B2BE      htinst=0x0000000000D03021
> > > > > >
> > > > > > I have tried updating to a newer Xvisor release, but with that I don't
> > > > > > get any serial output.
> > > > > >
> > > > > > Can you help get the Xvisor tests back up and running?
> > > > >
> > > > > I tried the latest Xvisor-next (https://github.com/avpatel/xvisor-next)
> > > > > with your QEMU riscv-to-apply.next branch and it works fine (both
> > > > > with and without Sstc).
> > > >
> > > > Does it work with the latest release?
> > >
> > > Yes, the latest Xvisor-next repo works for QEMU v7.2.0-rc4 and
> > > your riscv-to-apply.next branch (commit 51bb9de2d188)
> >
> > I can't get anything to work with this patch. I have dropped this and
> > the patches after this.
> >
> > I'm building the latest Xvisor release with:
> >
> > export CROSS_COMPILE=riscv64-linux-gnu-
> > ARCH=riscv make generic-64b-defconfig
> > make
> >
> > and running it as above, yet nothing. What am I missing here?
>
> I tried multiple times with the latest Xvisor on different machines but
> still can't reproduce the issue you are seeing.

Odd

>
> We generally provide pre-built binaries with every Xvisor release
> so I will share with you pre-built binaries of the upcoming Xvisor-0.3.2
> release. Maybe that would help you ?

That would work. Let me know when the release happens and I can update
my images.

Alistair

