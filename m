Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kD49b-0000Ly-7U
	for mharc-qemu-riscv@gnu.org; Tue, 01 Sep 2020 07:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kD49Z-0000Hp-HX
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2020 07:08:41 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:55596
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kD49W-0005F9-Te
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2020 07:08:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598958516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6Tr/ubedH4FzcIkR/7uJBUdz/vyFk5iD5me4WlW9z0g=;
 b=a82/+SCqtlsLCeD0MMfFkn5mXfiWRqOsYKjQMMbxqJgMTBgQRVdkxwqS3ktoejui+YzWGM
 jkqCs/9hnmJSHw3slJpZ60o34A/FS8a22oYmeq3V8hwfeFX4KlA1HTb7ZagQSyjBkQA+ln
 H35vBMMFxpjleD/+ny/UqdNs0ePtGf0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-aJVvp8O_OvGpuByb6AinJw-1; Tue, 01 Sep 2020 07:08:35 -0400
X-MC-Unique: aJVvp8O_OvGpuByb6AinJw-1
Received: by mail-wm1-f72.google.com with SMTP id f125so325806wma.3
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2020 04:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6Tr/ubedH4FzcIkR/7uJBUdz/vyFk5iD5me4WlW9z0g=;
 b=bru3JrXEMUv2lF1XWzuGNPzdIcCkqyEJTDXnNpr8m8QtY1JxRxjTiUJlH2Fq0rPR1P
 IN5mYPi/3CVjYYdYt2/05qwDi4V0czLXVEnYRqWmx4HS48uhLraOlqURXeOwFjfbcybd
 pZK9vt+zV/IIjxlDShTKGuiX7V5LDbPKQJNWRwDTkkBgP3AYe77wlFthQQdT0OwUxZry
 MrKgax+WuBgygoCoaTpYz0McGSd501CJ/VcR3uQQv9NMfi2p/2/oz+Xsvz1iIgI4zcIX
 WXuARHR5OhEGzxP3cxx9tO4OmLauXwsRfPZPRS8JWWCh6uJ5eRt6cbEBgzFauiqYJACn
 hiOA==
X-Gm-Message-State: AOAM533Vpm5ngaiKN8DtfnoChtETQ5d66bGk7qMSwykXYYalaHOtduFa
 IBJkQXOe70W9u881gjP9JjlltbOIynmlhF2H+/Dl2X/NZrfDSDqzY24WQV8uUkMSj3AA9Gw3nMK
 fAxkWBzn21WgkWZs=
X-Received: by 2002:adf:e907:: with SMTP id f7mr1282100wrm.169.1598958514237; 
 Tue, 01 Sep 2020 04:08:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyollsv5OseW626cQ2WmhnezuXDFvDBsAwbNO8ssbSMZozaw1xDJXzfL8vYitfAzZ5jltEtIw==
X-Received: by 2002:adf:e907:: with SMTP id f7mr1282083wrm.169.1598958514038; 
 Tue, 01 Sep 2020 04:08:34 -0700 (PDT)
Received: from redhat.com (bzq-109-66-64-75.red.bezeqint.net. [109.66.64.75])
 by smtp.gmail.com with ESMTPSA id
 d18sm1587679wrm.10.2020.09.01.04.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 04:08:33 -0700 (PDT)
Date: Tue, 1 Sep 2020 07:08:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Subject: Re: [PATCH] riscv: sifive_test: Allow 16-bit writes to memory region
Message-ID: <20200901065406-mutt-send-email-mst@kernel.org>
References: <20200901055822.2721209-1-natechancellor@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200901055822.2721209-1-natechancellor@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 02:08:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 01 Sep 2020 11:08:41 -0000

On Mon, Aug 31, 2020 at 10:58:23PM -0700, Nathan Chancellor wrote:
> When shutting down the machine running a mainline Linux kernel, the
> following error happens:
> 
> $ build/riscv64-softmmu/qemu-system-riscv64 -bios default -M virt \
>     -display none -initrd rootfs.cpio -kernel Image -m 512m \
>     -nodefaults -serial mon:stdio
> ...
> Requesting system poweroff
> [    4.999630] reboot: Power down
> sbi_trap_error: hart0: trap handler failed (error -2)
> sbi_trap_error: hart0: mcause=0x0000000000000007 mtval=0x0000000000100000
> sbi_trap_error: hart0: mepc=0x000000008000d4cc mstatus=0x0000000000001822
> sbi_trap_error: hart0: ra=0x000000008000999e sp=0x0000000080015c78
> sbi_trap_error: hart0: gp=0xffffffe000e76610 tp=0xffffffe0081b89c0
> sbi_trap_error: hart0: s0=0x0000000080015c88 s1=0x0000000000000040
> sbi_trap_error: hart0: a0=0x0000000000000000 a1=0x0000000080004024
> sbi_trap_error: hart0: a2=0x0000000080004024 a3=0x0000000080004024
> sbi_trap_error: hart0: a4=0x0000000000100000 a5=0x0000000000005555
> sbi_trap_error: hart0: a6=0x0000000000004024 a7=0x0000000080011158
> sbi_trap_error: hart0: s2=0x0000000000000000 s3=0x0000000080016000
> sbi_trap_error: hart0: s4=0x0000000000000000 s5=0x0000000000000000
> sbi_trap_error: hart0: s6=0x0000000000000001 s7=0x0000000000000000
> sbi_trap_error: hart0: s8=0x0000000000000000 s9=0x0000000000000000
> sbi_trap_error: hart0: s10=0x0000000000000000 s11=0x0000000000000008
> sbi_trap_error: hart0: t0=0x0000000000000000 t1=0x0000000000000000
> sbi_trap_error: hart0: t2=0x0000000000000000 t3=0x0000000000000000
> sbi_trap_error: hart0: t4=0x0000000000000000 t5=0x0000000000000000
> sbi_trap_error: hart0: t6=0x0000000000000000
> 
> The kernel does a 16-bit write when powering off the machine, which
> was allowed before commit 5d971f9e67 ("memory: Revert "memory: accept
> mismatching sizes in memory_region_access_valid""). Make min_access_size
> match reality so that the machine can shut down properly now.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 88a07990fa ("SiFive RISC-V Test Finisher")
> Fixes: 5d971f9e67 ("memory: Revert "memory: accept mismatching sizes in memory_region_access_valid"")
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
> 
> Please let me know if the tags are wrong or inappropriate, this is my
> first QEMU patch.
> 
>  hw/riscv/sifive_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/sifive_test.c b/hw/riscv/sifive_test.c
> index 0c78fb2c93..8c70dd69df 100644
> --- a/hw/riscv/sifive_test.c
> +++ b/hw/riscv/sifive_test.c
> @@ -59,7 +59,7 @@ static const MemoryRegionOps sifive_test_ops = {
>      .write = sifive_test_write,
>      .endianness = DEVICE_NATIVE_ENDIAN,


Apropos, why is this native endian?
The write handler seems to ignore target endian-ness,
looks like a bug ...

>      .valid = {
> -        .min_access_size = 4,
> +        .min_access_size = 2,
>          .max_access_size = 4
>      }
>  };
> 
> base-commit: 2f4c51c0f384d7888a04b4815861e6d5fd244d75
> -- 
> 2.28.0


