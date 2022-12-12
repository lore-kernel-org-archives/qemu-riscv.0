Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4blJ-0002p4-Gf
	for mharc-qemu-riscv@gnu.org; Mon, 12 Dec 2022 00:54:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p4blH-0002om-M3; Mon, 12 Dec 2022 00:53:59 -0500
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p4blF-00033q-El; Mon, 12 Dec 2022 00:53:59 -0500
Received: by mail-vs1-xe2d.google.com with SMTP id q128so10150657vsa.13;
 Sun, 11 Dec 2022 21:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RAtr/IBOYg7DG51YhAODZK7Kmh1R8/yw/CRZWDy0C58=;
 b=o4yXUr3Hbhzoafio1+ZJFrZhWRJTGGwoHe4vYH3Af9qi0+gdpzRa9PB5tjpzTUJmM4
 iZ+vlFv/1JIH53RJ08g9TEi16L5Ig5rBdUKYjOi81WKFjh5T++MLSsf5Fog3PiYIPSpS
 dfbtmONZ8ky3x3LKVu5SxkCHFwtAGR/Owyzvf7OLy6JzpOZ0a//Ln+GbEOkHSBUwHqSy
 9jDqzJdf+4RYoydxiV3K8cM5HDF2Gtix6w3yIvPVYNcw9fFNFCwvKT4ZbnCfwaqmvRBN
 S3Dx7/wLrnDWpIU1Vjt80V2YJi50Iu+/grrbSWGicWqMUXMJFlzhdTHdKpNeJ008q2nD
 8T9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RAtr/IBOYg7DG51YhAODZK7Kmh1R8/yw/CRZWDy0C58=;
 b=Exx8N7R/egE9AaLrQyCGJVs6AmdJ6gmqZ3Y5VUdJ5Eet9waVmOihlNi5SOPEiGS1DS
 NpOBtCJ9Zb5NNV75kihL5yjxHgFKcA82WeGhIJ7gHLCQhfm13NwPA7giGtxuHVVZ/5FS
 ALsyujbYa11xYkx42KHithW60GSEvzrabL9GDSEHbFw62Ja5NO82BI18ymJPxnFwhxBc
 L0+nnHHC//GNuMA13SueNixF2QmxnfFpWxPfAVmyQhRGL7V5y6YIJ56sxirZr77K8XsO
 MwuoopuZNhkRnmRM4fnZBsgBcZkPdL5HxkJpYhBUNysENCG7MKiUd7LPXBvQkBA48Gs+
 08Yw==
X-Gm-Message-State: ANoB5pn0xcSntQ5Rsrzexu/5xd4N1fEI2C37BGAQfcTcof4oIttONOW6
 xCzQPmUVGNzcugl0j8ba3i8bJvAAsh2hJK27cSo=
X-Google-Smtp-Source: AA0mqf6CGoGUiEOGzC2dKtXCQg0Hhutm68Rf/dYnwIp9qDPhCvTXMSkXtYv4IThZ4mypuliaRGarDj6kxb4d7fqdxSo=
X-Received: by 2002:a05:6102:3d8e:b0:3b3:7675:d423 with SMTP id
 h14-20020a0561023d8e00b003b37675d423mr194082vsv.72.1670824436114; Sun, 11 Dec
 2022 21:53:56 -0800 (PST)
MIME-Version: 1.0
References: <20221108125703.1463577-1-apatel@ventanamicro.com>
 <20221108125703.1463577-3-apatel@ventanamicro.com>
 <CAKmqyKP+hc4N6Z2AqkQpCmF=oyTE_rf-XfSsTHChwcUWRE5gsg@mail.gmail.com>
 <CAK9=C2Uu1bCcZht+ydiazSmgnkD_hhLetXP4WcA92DypE4m9=A@mail.gmail.com>
In-Reply-To: <CAK9=C2Uu1bCcZht+ydiazSmgnkD_hhLetXP4WcA92DypE4m9=A@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Dec 2022 15:53:30 +1000
Message-ID: <CAKmqyKPw54F0uVy+7SjoY16o7RYyW6qwLhaYaKR7aNpP4Nz27Q@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
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
X-List-Received-Date: Mon, 12 Dec 2022 05:53:59 -0000

On Thu, Dec 8, 2022 at 6:41 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> On Thu, Dec 8, 2022 at 9:00 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Tue, Nov 8, 2022 at 11:07 PM Anup Patel <apatel@ventanamicro.com> wrote:
> > >
> > > The htimedelta[h] CSR has impact on the VS timer comparison so we
> > > should call riscv_timer_write_timecmp() whenever htimedelta changes.
> > >
> > > Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp suppor")
> > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> >
> > This patch breaks my Xvisor test. When running OpenSBI and Xvisor like this:
> >
> > qemu-system-riscv64 -machine virt \
> >     -m 1G -serial mon:stdio -serial null -nographic \
> >     -append 'vmm.console=uart@10000000 vmm.bootcmd="vfs mount initrd
> > /;vfs run /boot.xscript;vfs cat /system/banner.txt; guest kick guest0;
> > vserial bind guest0/uart0"' \
> >     -smp 4 -d guest_errors \
> >     -bios none \
> >     -device loader,file=./images/qemuriscv64/vmm.bin,addr=0x80200000 \
> >     -kernel ./images/qemuriscv64/fw_jump.elf \
> >     -initrd ./images/qemuriscv64/vmm-disk-linux.img -cpu rv64,h=true
> >
> > Running:
> >
> > Xvisor v0.3.0-129-gbc33f339 (Jan  1 1970 00:00:00)
> >
> > I see this failure:
> >
> > INIT: bootcmd:  guest kick guest0
> >
> > guest0: Kicked
> >
> > INIT: bootcmd:  vserial bind guest0/uart0
> >
> > [guest0/uart0] cpu_vcpu_stage2_map: guest_phys=0x000000003B9AC000
> > size=0x4096 map failed
> >
> > do_error: CPU3: VCPU=guest0/vcpu0 page fault failed (error -1)
> >
> >        zero=0x0000000000000000          ra=0x0000000080001B4E
> >
> >          sp=0x000000008001CF80          gp=0x0000000000000000
> >
> >          tp=0x0000000000000000          s0=0x000000008001CFB0
> >
> >          s1=0x0000000000000000          a0=0x0000000010001048
> >
> >          a1=0x0000000000000000          a2=0x0000000000989680
> >
> >          a3=0x000000003B9ACA00          a4=0x0000000000000048
> >
> >          a5=0x0000000000000000          a6=0x0000000000019000
> >
> >          a7=0x0000000000000000          s2=0x0000000000000000
> >
> >          s3=0x0000000000000000          s4=0x0000000000000000
> >
> >          s5=0x0000000000000000          s6=0x0000000000000000
> >
> >          s7=0x0000000000000000          s8=0x0000000000000000
> >
> >          s9=0x0000000000000000         s10=0x0000000000000000
> >
> >         s11=0x0000000000000000          t0=0x0000000000004000
> >
> >          t1=0x0000000000000100          t2=0x0000000000000000
> >
> >          t3=0x0000000000000000          t4=0x0000000000000000
> >
> >          t5=0x0000000000000000          t6=0x0000000000000000
> >
> >        sepc=0x0000000080001918     sstatus=0x0000000200004120
> >
> >     hstatus=0x00000002002001C0     sp_exec=0x0000000010A64000
> >
> >      scause=0x0000000000000017       stval=0x000000003B9ACAF8
> >
> >       htval=0x000000000EE6B2BE      htinst=0x0000000000D03021
> >
> > I have tried updating to a newer Xvisor release, but with that I don't
> > get any serial output.
> >
> > Can you help get the Xvisor tests back up and running?
>
> I tried the latest Xvisor-next (https://github.com/avpatel/xvisor-next)
> with your QEMU riscv-to-apply.next branch and it works fine (both
> with and without Sstc).

Does it work with the latest release?

Alistair

>
> Here's the QEMU command which I use:
>
> qemu-system-riscv64 -M virt -m 512M -nographic \
> -bios opensbi/build/platform/generic/firmware/fw_jump.bin \
> -kernel ../xvisor-next/build/vmm.bin \
> -initrd rbd_v64.img \
> -append "vmm.bootcmd=\"vfs mount initrd /;vfs run /boot.xscript;vfs
> cat /system/banner.txt\"" \
> -smp 4
>
> Also, I will be releasing Xvisor-0.3.2 by the end of Dec 2022 so I
> suggest using this upcoming release in your test.
>
> Regards,
> Anup

