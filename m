Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hfiYe-0000OR-1A
	for mharc-qemu-riscv@gnu.org; Tue, 25 Jun 2019 06:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35125)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hfiYc-0000It-80
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 06:20:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hfiYa-00032n-9r
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 06:20:10 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44251)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hfiYa-00031k-1j
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 06:20:08 -0400
Received: by mail-pl1-f196.google.com with SMTP id t7so8592585plr.11
 for <qemu-riscv@nongnu.org>; Tue, 25 Jun 2019 03:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=hVOzHgObz/WAB1ABY7SiVI5U/KHR8XjQBJa5AUD1T4Y=;
 b=lX/0KGLzAPnB5TC2maMZrdz9ILPmLG3gWiTPdlPhPLyhf7mXXxrbjq+Ws17cv43szJ
 pStuvwTNZxzgjS+GytAZh8yKgI0g3h5UloTB9moYv+zdtAShAW8F2UhfSOTyXAzKD1h6
 y5ytMXH0R7fxrDl9OpjlkUO7hVNg/enn0XRnaDG5n/jMq1LbZ9Nvo07Oi/JYrcOLm4Rp
 C+iYub0rRVdw9OTjMN3AsCyleShQ+KF7p3ZtDJE8VCd1mwJgKeHaM8UQ5STX+nYYSTS0
 U3XhRryJx2Pnd9fX5cIcWibziTUN/UAUSbyWpKD0ZW1pBavh6DXNKEkUxZ3nauo3NcMk
 YYuw==
X-Gm-Message-State: APjAAAVKKt6ME6W4uegCXzyimzVEZeqL0V50m2toIMRWFUPd2o32J4Da
 HuZXFUL3BWqqvEv61V40Rn+HZg==
X-Google-Smtp-Source: APXvYqz8V1r0oOEQKqYQIzbdGpZOU9uM3zP2w9wQjM2BRxIZc9HO+u7rebMKWnjF9uUFlvIFgbqo3g==
X-Received: by 2002:a17:902:9307:: with SMTP id
 bc7mr11505212plb.183.1561458006876; 
 Tue, 25 Jun 2019 03:20:06 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id c9sm14972729pfn.3.2019.06.25.03.20.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 03:20:06 -0700 (PDT)
Date: Tue, 25 Jun 2019 03:20:06 -0700 (PDT)
X-Google-Original-Date: Tue, 25 Jun 2019 03:15:42 PDT (-0700)
In-Reply-To: <cover.1561419713.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-d7c50a12-d355-4c7a-8c97-3952fda6b355@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.196
Subject: Re: [Qemu-riscv] [PATCH v2 0/4] Miscellaneous patches from the
 RISC-V fork
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
X-List-Received-Date: Tue, 25 Jun 2019 10:20:11 -0000

On Mon, 24 Jun 2019 16:42:27 PDT (-0700), Alistair Francis wrote:
> This should be the last series bringing the patches from the RISC-V fork
> into mainline QEMU.
>
> v2:
>  - Add Wladimir's SOB line, after talking to them
>  - Allow c.andi to have a 0 immediate
>
> Dayeol Lee (1):
>   target/riscv: Fix PMP range boundary address bug
>
> Michael Clark (3):
>   disas/riscv: Disassemble reserved compressed encodings as illegal
>   disas/riscv: Fix `rdinstreth` constraint
>   target/riscv: Implement riscv_cpu_unassigned_access
>
>  disas/riscv.c             | 51 ++++++++++++++++++++++++++-------------
>  target/riscv/cpu.c        |  1 +
>  target/riscv/cpu.h        |  2 ++
>  target/riscv/cpu_helper.c | 16 ++++++++++++
>  target/riscv/pmp.c        |  2 +-
>  5 files changed, 54 insertions(+), 18 deletions(-)

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

1 and 4 were already in, so I'm leaving them towards the front of the queue.
The others are in now.

Thanks!

