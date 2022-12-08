Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p37cF-0007Xl-Ez
	for mharc-qemu-riscv@gnu.org; Wed, 07 Dec 2022 22:30:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p37cE-0007WE-8y; Wed, 07 Dec 2022 22:30:30 -0500
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p37cC-00051X-MG; Wed, 07 Dec 2022 22:30:29 -0500
Received: by mail-vs1-xe2e.google.com with SMTP id 124so353230vsv.4;
 Wed, 07 Dec 2022 19:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+20EnLF279aUNxt8lAbLvak+Bjt4ZfVPwBMq7w9KoAQ=;
 b=eKpIzoPYzqdPo4Y+uZgE1pMThgB2P+HM6feYLLmC/2/dqtPjWuK5xrtMSR9y/eZKxR
 KnXJCOEkpxsmQP8JKbWDWG1ttFSiBzvdYHBCyQ8EMZDiy5BwMqOOyfXkKiTrmXdkl5Wl
 Yf3ilTYm5obfVLtFVlfDRN56/gYCP8w/5j1idPFggB72stCzA2klpRKo+Vso7w6eXZWn
 Jm1KJBPK7qiurDzsxlo8bzwwrsVr/kCPfBfXqt39mtRlFtmoYJJ0tXLXUHtyGElw6Nny
 sI+Pdr1WPO0p5b+T63CDlCN9TLPBghwSX7JwzSgW+xWuH8irevLeFRLnTlzrRjsWxorL
 2L1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+20EnLF279aUNxt8lAbLvak+Bjt4ZfVPwBMq7w9KoAQ=;
 b=M9YnqRBO3UaouodvjDVgnvMlyWMqAGglCfAgfPkpifmxnJkOmpjXgp/E6qPW5sejV5
 3P3pRl4PDhSetrAdlM086+HNUgzg5CQZ32d8CPUJdjWcsJ1TVIURxP5H3UoYYf2SagcW
 YHO+9uAnmZEZCu1bFxCIOgPg5+t29aie5nOwCNb7S0OgRm9kR1Ln8hC7cdnEv3q3Kf7s
 Cd1qfp+lOh4oiBeCw7bKyVjB1/hJbCyYjGQf03p/okVxkZinRcWU9G6ICwsu32Z1IgvI
 p0SKNpkPcrlrU3GfzU87tud/kxZ5AjyVntj64AVVZ584h+39KcFfTXmF9EDEwl+MukrW
 V1Tg==
X-Gm-Message-State: ANoB5pnNJ2cXgDLQ82PTDk+rOHFUGGoXxaaLqHsoIxlE9VoMGLInHkHU
 fCQCVdov9nNNLwhJm1WoecAG59JGDjv5N397Upk=
X-Google-Smtp-Source: AA0mqf4ZE2HXpbX7vCTRS9Sc7l+C5/BGTYgHjHFk5sPLJpduhRZdQNLRl51fnSZDN34Oduy4BvC9m8FgC1m1G7wtMTo=
X-Received: by 2002:a05:6102:3bc1:b0:3a7:9b8c:2e4c with SMTP id
 a1-20020a0561023bc100b003a79b8c2e4cmr38809827vsv.72.1670470226330; Wed, 07
 Dec 2022 19:30:26 -0800 (PST)
MIME-Version: 1.0
References: <20221108125703.1463577-1-apatel@ventanamicro.com>
 <20221108125703.1463577-3-apatel@ventanamicro.com>
In-Reply-To: <20221108125703.1463577-3-apatel@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Dec 2022 13:29:59 +1000
Message-ID: <CAKmqyKP+hc4N6Z2AqkQpCmF=oyTE_rf-XfSsTHChwcUWRE5gsg@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2e.google.com
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
X-List-Received-Date: Thu, 08 Dec 2022 03:30:30 -0000

On Tue, Nov 8, 2022 at 11:07 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The htimedelta[h] CSR has impact on the VS timer comparison so we
> should call riscv_timer_write_timecmp() whenever htimedelta changes.
>
> Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp suppor")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

This patch breaks my Xvisor test. When running OpenSBI and Xvisor like this:

qemu-system-riscv64 -machine virt \
    -m 1G -serial mon:stdio -serial null -nographic \
    -append 'vmm.console=uart@10000000 vmm.bootcmd="vfs mount initrd
/;vfs run /boot.xscript;vfs cat /system/banner.txt; guest kick guest0;
vserial bind guest0/uart0"' \
    -smp 4 -d guest_errors \
    -bios none \
    -device loader,file=./images/qemuriscv64/vmm.bin,addr=0x80200000 \
    -kernel ./images/qemuriscv64/fw_jump.elf \
    -initrd ./images/qemuriscv64/vmm-disk-linux.img -cpu rv64,h=true

Running:

Xvisor v0.3.0-129-gbc33f339 (Jan  1 1970 00:00:00)

I see this failure:

INIT: bootcmd:  guest kick guest0

guest0: Kicked

INIT: bootcmd:  vserial bind guest0/uart0

[guest0/uart0] cpu_vcpu_stage2_map: guest_phys=0x000000003B9AC000
size=0x4096 map failed

do_error: CPU3: VCPU=guest0/vcpu0 page fault failed (error -1)

       zero=0x0000000000000000          ra=0x0000000080001B4E

         sp=0x000000008001CF80          gp=0x0000000000000000

         tp=0x0000000000000000          s0=0x000000008001CFB0

         s1=0x0000000000000000          a0=0x0000000010001048

         a1=0x0000000000000000          a2=0x0000000000989680

         a3=0x000000003B9ACA00          a4=0x0000000000000048

         a5=0x0000000000000000          a6=0x0000000000019000

         a7=0x0000000000000000          s2=0x0000000000000000

         s3=0x0000000000000000          s4=0x0000000000000000

         s5=0x0000000000000000          s6=0x0000000000000000

         s7=0x0000000000000000          s8=0x0000000000000000

         s9=0x0000000000000000         s10=0x0000000000000000

        s11=0x0000000000000000          t0=0x0000000000004000

         t1=0x0000000000000100          t2=0x0000000000000000

         t3=0x0000000000000000          t4=0x0000000000000000

         t5=0x0000000000000000          t6=0x0000000000000000

       sepc=0x0000000080001918     sstatus=0x0000000200004120

    hstatus=0x00000002002001C0     sp_exec=0x0000000010A64000

     scause=0x0000000000000017       stval=0x000000003B9ACAF8

      htval=0x000000000EE6B2BE      htinst=0x0000000000D03021

I have tried updating to a newer Xvisor release, but with that I don't
get any serial output.

Can you help get the Xvisor tests back up and running?

Alistair

