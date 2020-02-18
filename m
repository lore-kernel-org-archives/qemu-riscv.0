Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j48Ej-000372-QO
	for mharc-qemu-riscv@gnu.org; Tue, 18 Feb 2020 14:08:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43745)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1j48Eg-00036J-Nz
 for qemu-riscv@nongnu.org; Tue, 18 Feb 2020 14:08:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1j48Ee-0007X9-1U
 for qemu-riscv@nongnu.org; Tue, 18 Feb 2020 14:08:46 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:40138)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1j48Ed-0007Tp-Lt
 for qemu-riscv@nongnu.org; Tue, 18 Feb 2020 14:08:43 -0500
Received: by mail-pf1-x444.google.com with SMTP id b185so790860pfb.7
 for <qemu-riscv@nongnu.org>; Tue, 18 Feb 2020 11:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=y1yweMyAnFLAEcb3Lg5dXjOcfOHy4NAuPVv09AZ8FnY=;
 b=dCvxxbIzQe1yCD6yVioHMLY7OvQ55n8MPrGIg0wk+aPPrkYO7I+NpjZ0/QLBe2Mi/F
 FK7/4p/3BACaPwzkNNIacKJQYYJFxrLe1WSpiQEmjwhmv4RNxDk3wXyI7UQrl9/EjVwh
 XFPzYeWbmlvxepgdpnYPldAhXTY9qEy4WgC0uQ469+cZ5fUIVJqxAD+3apx/rwWoROPQ
 pmElmSngu9eejM00M+z/WcxqwjIB4Wxr4V3tkRDkaFLoKMTdPm5w6uaoKTocMmjG1BC7
 eJl1Qcjqy9ge/ll8rrpGzkh41lYJz6nrWSHf0NwLDjFjPTgMICQCPgi+VFXeWTM7jO8R
 FBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=y1yweMyAnFLAEcb3Lg5dXjOcfOHy4NAuPVv09AZ8FnY=;
 b=EszZpJoZrOzri6gJSt7uSbt3bJJ7A1IvONR4ZQYYqq28y0RrZJKt56dltRYZwGl+9q
 +M67wOl3sKH63UAFkZApDrmAJRxZfMJNzaR+MjNCbUr08miRUNLgYcwgocF8HRIKKi1B
 p80AX7xF7OxFfZvcqUq57X5dh4w/mjKN82p2RZA69zWVZHo/oq4OddVzcllysezTTh95
 qCscEHDYHFxe3yzNg8Kq9hHZQyihDdbKLFI2+3PSiVd6LLpUnvzFPUdpgJwbsoOHAIls
 EheSmKcZzMCDeAzY6fjf84MM2GIppuarNJwrfJxqUCBjvEQVkXI/e6FrBR4NhnggkAP3
 5pdw==
X-Gm-Message-State: APjAAAUZim8EyMnKWHf/NWSrBZrmlpCLxDXiH5gLBisdByzzRekjADRh
 edstHh06mOk6wbe1IB/B7KInKA==
X-Google-Smtp-Source: APXvYqyXqh0FZJp8c3ODQwvjM1apH5TTcDCwuuqXGPtDNDWCI6YZCShY5YzAIYLUHN2El7epFGZHJw==
X-Received: by 2002:a63:5561:: with SMTP id f33mr24499873pgm.14.1582052921952; 
 Tue, 18 Feb 2020 11:08:41 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id g13sm5314651pgh.82.2020.02.18.11.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 11:08:41 -0800 (PST)
Date: Tue, 18 Feb 2020 11:08:41 -0800 (PST)
X-Google-Original-Date: Tue, 18 Feb 2020 11:08:34 PST (-0800)
Subject: Re: [PATCH v3 0/2] RISC-V TIME CSR for privileged mode
In-Reply-To: <20200202134217.14264-1-anup.patel@wdc.com>
CC: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, sagark@eecs.berkeley.edu,
 Atish Patra <Atish.Patra@wdc.com>, 
 anup@brainfault.org, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-5b433044-9056-4323-88ce-626a1bd2c128@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
X-List-Received-Date: Tue, 18 Feb 2020 19:08:48 -0000

On Sun, 02 Feb 2020 05:42:15 PST (-0800), Anup Patel wrote:
> This series adds emulation of TIME CSRs for privileged mode. With
> this series, we see approximately 25+% improvement in hackbench
> numbers for non-virtualized (or Host) Linux and 40+% improvement
> in hackbench numbers for Guest/VM Linux.
>
> These patches are based on mainline/alistair/riscv-hyp-ext-v0.5.1
> branch of https://github.com/kvm-riscv/qemu.git and can be found
> in riscv_time_csr_v3 branch of same repo.
>
> Changes since v2:
>  - Register CLINT rdtime callback only for QEMU RISC-V virt machine
>
> Changes since v1:
>  - Use braces for single-line if-statements
>
> Anup Patel (2):
>   target/riscv: Emulate TIME CSRs for privileged mode
>   hw/riscv: Provide rdtime callback for TCG in CLINT emulation
>
>  hw/riscv/sifive_clint.c         |  6 ++-
>  hw/riscv/sifive_e.c             |  2 +-
>  hw/riscv/sifive_u.c             |  2 +-
>  hw/riscv/spike.c                |  9 ++--
>  hw/riscv/virt.c                 |  2 +-
>  include/hw/riscv/sifive_clint.h |  3 +-
>  target/riscv/cpu.h              |  5 ++
>  target/riscv/cpu_helper.c       |  5 ++
>  target/riscv/csr.c              | 86 +++++++++++++++++++++++++++++++--
>  9 files changed, 108 insertions(+), 12 deletions(-)

This is queued for the next pull request.

Thanks!

