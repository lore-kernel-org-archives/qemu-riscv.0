Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pOuOK-0000es-1L
	for mharc-qemu-riscv@gnu.org; Mon, 06 Feb 2023 00:50:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pOuOD-0000d0-G4; Mon, 06 Feb 2023 00:50:06 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pOuOA-0003vu-0s; Mon, 06 Feb 2023 00:50:04 -0500
Received: by mail-ej1-x62b.google.com with SMTP id mc11so31009807ejb.10;
 Sun, 05 Feb 2023 21:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UeyVS8IjCd87WIn7cCMPEEZGO8bCnKjxzYi4ooAi0Vo=;
 b=HITumU25nOnW/xnMdrR/935CtpnQommN/Um0fOx3YYhW4jYexfzBuuxT9B/w9cB/cV
 FKwP2DaZUyFqqZnjTFkOOdPGwloDAHbUntAQKJ+fo5WQy/BQvXxflnPvgsxinTdKcY93
 uJvQtNSTGBzLD0AARezXU7Nr5c9b2fGAKy8w2xoal4QoxVLn1wEZYjfrRSwAC5LSqw6g
 tMWzC528MVT+tbXXfqPvRbXDPfz7509nFiseGNgmQKolY2qPx3Z8pY3Wy5H3bCoZpVLI
 8hpLfQLos3/dd1yGi4mpKAgDBJR6wY0Nkydz0Q31XI1LOoQh0QWrMT/9pBMqT1ARjLFF
 leyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UeyVS8IjCd87WIn7cCMPEEZGO8bCnKjxzYi4ooAi0Vo=;
 b=qO4Xs/+kzTHihWrK6hJ9pX0KD7i2hrtDTKRu2t5nQjyB5AvfuvOt1M6EprFDxmOggS
 /EqQ2OtN+1EM+yOqseXWb7N3Ggu4JaINCxkhiYapvoZ543xOYLv/B51cIHlWi3sHzi9X
 pHtMl/4QN9+cLZf7+uTOHiYGdYok4Pex2WgnV2ezhAnbq5j/T1IUYaWLra2LGLNgTxRp
 za4TFA40E+yRB1M1gV6+TCqGmYeQWp1W2WkcFamuYj5wSYRLgOL4hj4zcNAnHGn50X4/
 eys/rwfosPI7GRDXOpPrqc/HM5K2FeiPG8gSlQRRoaYmoyptKdavFHHD+hdH6e3eDamo
 8zUA==
X-Gm-Message-State: AO0yUKVLycXV7SF55HRFPgqB90tDoj3jKL+XHKyiIVYudARBQJPajvIP
 B429/dBEGOfiKkqM4vuv9dvGap7BjPoePFGpsj8=
X-Google-Smtp-Source: AK7set+f+V4rpQfXOERXgqgS7MrKkoBtYeT95KoqQ+8MbZj263PSf5Gd4eTWvFn3qzq3V6JJigGR5alKwqKn39X/BuQ=
X-Received: by 2002:a17:906:8395:b0:888:f761:87aa with SMTP id
 p21-20020a170906839500b00888f76187aamr5941423ejx.163.1675662598144; Sun, 05
 Feb 2023 21:49:58 -0800 (PST)
MIME-Version: 1.0
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-2-sunilvl@ventanamicro.com>
In-Reply-To: <20230202045223.2594627-2-sunilvl@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 6 Feb 2023 13:49:46 +0800
Message-ID: <CAEUhbmVWHE2TR0PFtyTNvrP4YgDd6mtNtowrR5jZD1Gz2nENDw@mail.gmail.com>
Subject: Re: [PATCH 01/10] hw/riscv/virt: Add OEM_ID and OEM_TABLE_ID fields
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62b.google.com
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
X-List-Received-Date: Mon, 06 Feb 2023 05:50:07 -0000

On Thu, Feb 2, 2023 at 12:54 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> ACPI needs OEM_ID and OEM_TABLE_ID for the machine. Add these fields
> in the RISCVVirtState structure and initialize with default values.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/riscv/virt.c         | 4 ++++
>  include/hw/riscv/virt.h | 2 ++
>  2 files changed, 6 insertions(+)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

