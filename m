Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p8fiY-0003ZQ-At
	for mharc-qemu-riscv@gnu.org; Fri, 23 Dec 2022 05:56:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8fiQ-0003Yg-39; Fri, 23 Dec 2022 05:55:50 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p8fiO-0007uT-K4; Fri, 23 Dec 2022 05:55:49 -0500
Received: by mail-ej1-x636.google.com with SMTP id u9so11370124ejo.0;
 Fri, 23 Dec 2022 02:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n7ykP46I+CV+66Q0Agj3c1sF0EdVvIlKtwcu0t2pVs0=;
 b=dJzPxTdsqVqEdJl/XlDQWaBTKT4QEGWrCzSKU1h0A+qUIMVoWwuXJ9mKOctxwGjKah
 3uy6bKhVcKNEn6wwSVymCcCQ4XaLgqfc8juPxyXTOf7S5LRboQX/vbMB/s3hecE21V2o
 FqLQb7h5B9j6tYKPMwlriXRBg7pd0nZFiZw7d4t3eBjYFzRh8Jt+S1lTHJSkQb/v30KV
 OA1DorfNBtE6HZFJ8kEAAXn9IjlDQV4P/Qmghtb40UQZI7+GWaZV86F3i6QDAkx0/8gD
 kmUELzTE8S+v7pQiV6v+Ahjxg9dWMofuF4ufzE2biAX5TXNdLxs9gKZCAhBD+PZNhUbn
 nccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n7ykP46I+CV+66Q0Agj3c1sF0EdVvIlKtwcu0t2pVs0=;
 b=0vUbnuZGZaypJhr0ZKH63VlH3GYLeVf3P5Qt2txZtVwVP2Zu01VA1DwnK81nCN7nVl
 6B6cLU0ok5wfoVSNUlFoN65u3vw7lVLOTcP/PpI5ildwpCo1gC8Q5hNDU2Qlbl8E/vLK
 gQUUc9PUmbw5Nm4zuZuwHxPL+kLM6djL5W78Loi7fSLS4PjJJiC4PV7m7zao2LsCLpKK
 szG41h3DmdkRe9oBVr4iv3YSwuzzBqNAc52Y1QrFrtw2FQm160Yxv9PgzokzUL8SV8Aq
 2V4bUp969m58PaPARC0mRU1NDmZg/tHcJbweWVWuTriqsGa9vnK6BmuWgqGhoPHUQrrS
 lgKQ==
X-Gm-Message-State: AFqh2kr7kgBj+6bIbRE4VFWW+jhF5OdPOmYbdUdckUsbcLKyaoeJrZOj
 BiYF6r9/vQz3ZNiJmYp1cbgM+Y2ds0zj9r9lIIs=
X-Google-Smtp-Source: AMrXdXuJ+zrrScyk+sUZmUnKIb/nu+qxum8HwlY0sWjvLx1seoMBFCHX6j59kGkMRdfXufFpAWIuwJiCfyx5M5YzWeo=
X-Received: by 2002:a17:906:68c9:b0:7c1:a0d:dd2c with SMTP id
 y9-20020a17090668c900b007c10a0ddd2cmr982205ejr.26.1671792946622; Fri, 23 Dec
 2022 02:55:46 -0800 (PST)
MIME-Version: 1.0
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-11-dbarboza@ventanamicro.com>
In-Reply-To: <20221221182300.307900-11-dbarboza@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 23 Dec 2022 18:55:35 +0800
Message-ID: <CAEUhbmW=fuySF-JH_f0Q6X0YbmRocFWx5hakJ7FDBvkE7vLVjQ@mail.gmail.com>
Subject: Re: [PATCH 10/15] hw/riscv/boot.c: use MachineState in
 riscv_load_kernel()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 23 Dec 2022 10:55:52 -0000

On Thu, Dec 22, 2022 at 2:24 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> All callers are using kernel_filename as machine->kernel_filename.
>
> This will also simplify the changes in riscv_load_kernel() that we're
> going to do next.
>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/boot.c            | 3 ++-
>  hw/riscv/microchip_pfsoc.c | 3 +--
>  hw/riscv/opentitan.c       | 3 +--
>  hw/riscv/sifive_e.c        | 3 +--
>  hw/riscv/sifive_u.c        | 3 +--
>  hw/riscv/spike.c           | 3 +--
>  hw/riscv/virt.c            | 3 +--
>  include/hw/riscv/boot.h    | 2 +-
>  8 files changed, 9 insertions(+), 14 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

