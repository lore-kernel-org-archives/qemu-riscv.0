Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p3CTV-0000Zr-OU
	for mharc-qemu-riscv@gnu.org; Thu, 08 Dec 2022 03:41:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1p3CTU-0000Yx-Ao
 for qemu-riscv@nongnu.org; Thu, 08 Dec 2022 03:41:48 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1p3CTR-0007PG-1O
 for qemu-riscv@nongnu.org; Thu, 08 Dec 2022 03:41:48 -0500
Received: by mail-pf1-x42b.google.com with SMTP id a14so766177pfa.1
 for <qemu-riscv@nongnu.org>; Thu, 08 Dec 2022 00:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VuPEUQgQaW4Rj2N1z/kxif8EtCaljFE1MDNF1Zfnlqk=;
 b=hNa/CsQP/0jxhcOEHgwF38cuW9S1yBQ2j2xRroUSrg5EIHJrBdMFuXKCIk4bOynWWG
 YoZTeHxETOfn9K3Rcdndip4SE2sFvA69oifyfhbcG9nVg5/ZboFQAUTT29ji+8JSa0Xi
 0/faKiAB8ZghIjQ9LNp6dFokHppmPzVw8u7TiC1BblW4tdsxNDUI7TViicfytw0tHFyf
 e2L6FVOI4VT9UFT/q1uK3ZSOb9udeRZmLc0vhtBTTbHycjJAqJg8GhrA2dQrtH9tPdbg
 j9LoN+0+/Va/COJgWATOKJl82CMXQKpveUni0nt+ZE1dGnr6jLhRu3ot64CqzDug2rKG
 t7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VuPEUQgQaW4Rj2N1z/kxif8EtCaljFE1MDNF1Zfnlqk=;
 b=4EDksoqrxOiA2kbaCeWLRzFlXC4r0neorhhccp0/61oauDO0/Ii8Fg8ZYV+LvZush2
 ZaAQ+dFmq13l91RsCODse+yOKgS+Xyc2MiA3ztTnpQpneAYhTk4tz4KkVlLxMBXmYLgm
 4mizHnS7L/UMhHsYBMV+aWjR9gd1SRhLxzhOGMZdsPvhoIgJYEpEaHTKqJgNN4vwFUan
 k5kZ2qULghZpzne1DXuamZMng+kh7JSZOa2xrmMVpc4CnvZQwGzwT/C5MsW+XXPWKWST
 a0N+jRwWWQf/0+dQsCL3L9NWkQC1A8D14pNqiUCgDUr0wPlWS+h76cTIxhc3XhfzAfg1
 44nw==
X-Gm-Message-State: ANoB5pl6oSrlpaFw5MZGvrbrlmKRJGnlySVfE7KYDcpHsCOc9yXEvpSL
 k7DARnaXXXv5UhLB6VnHYGiizb5X3+7qQdXldupcKQ==
X-Google-Smtp-Source: AA0mqf6WCEO78PdD6eb7intsfnq1rCYP/6CXLnQA5b16jKDnZnXiSwbJIrAQwIQFEHWaojY2QoTbQ1AKxJERvh5ClNQ=
X-Received: by 2002:a05:6a00:290f:b0:56b:e15a:7215 with SMTP id
 cg15-20020a056a00290f00b0056be15a7215mr75995213pfb.27.1670488882065; Thu, 08
 Dec 2022 00:41:22 -0800 (PST)
MIME-Version: 1.0
References: <20221108125703.1463577-1-apatel@ventanamicro.com>
 <20221108125703.1463577-3-apatel@ventanamicro.com>
 <CAKmqyKP+hc4N6Z2AqkQpCmF=oyTE_rf-XfSsTHChwcUWRE5gsg@mail.gmail.com>
In-Reply-To: <CAKmqyKP+hc4N6Z2AqkQpCmF=oyTE_rf-XfSsTHChwcUWRE5gsg@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 8 Dec 2022 14:11:10 +0530
Message-ID: <CAK9=C2Uu1bCcZht+ydiazSmgnkD_hhLetXP4WcA92DypE4m9=A@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=apatel@ventanamicro.com; helo=mail-pf1-x42b.google.com
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
X-List-Received-Date: Thu, 08 Dec 2022 08:41:48 -0000

On Thu, Dec 8, 2022 at 9:00 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Nov 8, 2022 at 11:07 PM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > The htimedelta[h] CSR has impact on the VS timer comparison so we
> > should call riscv_timer_write_timecmp() whenever htimedelta changes.
> >
> > Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp suppor")
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> This patch breaks my Xvisor test. When running OpenSBI and Xvisor like this:
>
> qemu-system-riscv64 -machine virt \
>     -m 1G -serial mon:stdio -serial null -nographic \
>     -append 'vmm.console=uart@10000000 vmm.bootcmd="vfs mount initrd
> /;vfs run /boot.xscript;vfs cat /system/banner.txt; guest kick guest0;
> vserial bind guest0/uart0"' \
>     -smp 4 -d guest_errors \
>     -bios none \
>     -device loader,file=./images/qemuriscv64/vmm.bin,addr=0x80200000 \
>     -kernel ./images/qemuriscv64/fw_jump.elf \
>     -initrd ./images/qemuriscv64/vmm-disk-linux.img -cpu rv64,h=true
>
> Running:
>
> Xvisor v0.3.0-129-gbc33f339 (Jan  1 1970 00:00:00)
>
> I see this failure:
>
> INIT: bootcmd:  guest kick guest0
>
> guest0: Kicked
>
> INIT: bootcmd:  vserial bind guest0/uart0
>
> [guest0/uart0] cpu_vcpu_stage2_map: guest_phys=0x000000003B9AC000
> size=0x4096 map failed
>
> do_error: CPU3: VCPU=guest0/vcpu0 page fault failed (error -1)
>
>        zero=0x0000000000000000          ra=0x0000000080001B4E
>
>          sp=0x000000008001CF80          gp=0x0000000000000000
>
>          tp=0x0000000000000000          s0=0x000000008001CFB0
>
>          s1=0x0000000000000000          a0=0x0000000010001048
>
>          a1=0x0000000000000000          a2=0x0000000000989680
>
>          a3=0x000000003B9ACA00          a4=0x0000000000000048
>
>          a5=0x0000000000000000          a6=0x0000000000019000
>
>          a7=0x0000000000000000          s2=0x0000000000000000
>
>          s3=0x0000000000000000          s4=0x0000000000000000
>
>          s5=0x0000000000000000          s6=0x0000000000000000
>
>          s7=0x0000000000000000          s8=0x0000000000000000
>
>          s9=0x0000000000000000         s10=0x0000000000000000
>
>         s11=0x0000000000000000          t0=0x0000000000004000
>
>          t1=0x0000000000000100          t2=0x0000000000000000
>
>          t3=0x0000000000000000          t4=0x0000000000000000
>
>          t5=0x0000000000000000          t6=0x0000000000000000
>
>        sepc=0x0000000080001918     sstatus=0x0000000200004120
>
>     hstatus=0x00000002002001C0     sp_exec=0x0000000010A64000
>
>      scause=0x0000000000000017       stval=0x000000003B9ACAF8
>
>       htval=0x000000000EE6B2BE      htinst=0x0000000000D03021
>
> I have tried updating to a newer Xvisor release, but with that I don't
> get any serial output.
>
> Can you help get the Xvisor tests back up and running?

I tried the latest Xvisor-next (https://github.com/avpatel/xvisor-next)
with your QEMU riscv-to-apply.next branch and it works fine (both
with and without Sstc).

Here's the QEMU command which I use:

qemu-system-riscv64 -M virt -m 512M -nographic \
-bios opensbi/build/platform/generic/firmware/fw_jump.bin \
-kernel ../xvisor-next/build/vmm.bin \
-initrd rbd_v64.img \
-append "vmm.bootcmd=\"vfs mount initrd /;vfs run /boot.xscript;vfs
cat /system/banner.txt\"" \
-smp 4

Also, I will be releasing Xvisor-0.3.2 by the end of Dec 2022 so I
suggest using this upcoming release in your test.

Regards,
Anup

