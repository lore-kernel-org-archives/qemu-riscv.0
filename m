Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pOynS-0008Qp-9H
	for mharc-qemu-riscv@gnu.org; Mon, 06 Feb 2023 05:32:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pOynQ-0008QR-Gd; Mon, 06 Feb 2023 05:32:24 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pOynO-0003DQ-Va; Mon, 06 Feb 2023 05:32:24 -0500
Received: by mail-ed1-x532.google.com with SMTP id i38so89891eda.1;
 Mon, 06 Feb 2023 02:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dArcDlWoyKNn9ifB/wYJ9q/rMZwn4bHSIasEtB4JElw=;
 b=DH1CFyMGoibFfOm911/d5qDviAcmq5gJFf/ZQn83bb2Gym6QWyUklwT/Nj7npAmDo8
 j/UVjjwS71zzGxHB9uvYMpvZ6DRrI1xb2d89xskwFFCPf2aTUWLjn4Idg7ZYO9pYTotZ
 ObdQ0Xv7c7gZj/z64i5k58GRC0K8gJic+Gn3Ebu1uOqZUQ2mrJC6GKWkjRzThS0CPD7e
 dkfHgaCMMsw2TjLvOngpbzU4ixd3Lnw4eFHWM1I1V33GpceKO7MG4pqnGIcotGEW0Zlv
 PtXEJJXfIi2vXtztxdnJgyTZMoizZ9/Re0z7TaSeke3whqCq8YUaz8s7HAp3Ge9uc25x
 hPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dArcDlWoyKNn9ifB/wYJ9q/rMZwn4bHSIasEtB4JElw=;
 b=ehcgDFNSlCCnqqdBS1cDDk0zzOcPfVVYb/r1CYQ+MjG9fkF/KQ5Rd3qpJ3EH0nIFHF
 xhJDACKK6VuNHtXGmvho3kmzx4HZOH4FA9Cpb3j7IHqyCdn4eGSuELX1Dbng040NXTP1
 8FzYwK/Sa3jrw1eSb6m2va2mcP4gJ7Y+yNni8CRj6nFDLnnZH60C5iyTauSdJy6i3S1j
 UXuxEQG3f/QxU0gVWUIo/W1Ghr3vuMo20zvjh6cqMM5cFR2zAGaCes6ts+ta1mHIJtnz
 q/zUM/5yGlbLVqab0zyuKzQ3O2Q21vQFp47XjbZf8BU90WugWHEFxXl7B3JSI4UR+VpE
 iZzw==
X-Gm-Message-State: AO0yUKWESxJwBsaZTtfnzbkGgAxJKC2CWD0yrRDiPsI4jdEzX5XDE6gt
 bUfHTYoBYLodMYc1tOzbJuZmgBzT7U0iMx+Yp7xRVCIcLbo=
X-Google-Smtp-Source: AK7set/dtMYAoxmRWTX7XaStXKp/QjHEfOhqpoMZqbvRI7PezWI8m+u8mVCOYBUN3GdGdx+z1rDIf14s5LUz+Z4SQEI=
X-Received: by 2002:a50:d5c9:0:b0:4a2:121d:1d3d with SMTP id
 g9-20020a50d5c9000000b004a2121d1d3dmr5848044edj.82.1675679541113; Mon, 06 Feb
 2023 02:32:21 -0800 (PST)
MIME-Version: 1.0
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-10-sunilvl@ventanamicro.com>
In-Reply-To: <20230202045223.2594627-10-sunilvl@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 6 Feb 2023 18:32:09 +0800
Message-ID: <CAEUhbmUj3k0ARs06wH32qMDfxzuNdLQxTH=pO9doeS64ieFAdQ@mail.gmail.com>
Subject: Re: [PATCH 09/10] hw/riscv/virt.c: Initialize the ACPI tables
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x532.google.com
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
X-List-Received-Date: Mon, 06 Feb 2023 10:32:24 -0000

On Thu, Feb 2, 2023 at 12:53 PM Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> When the "acpi=on", ACPI tables need to be added. Detect the option
> and initialize the ACPI tables.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  hw/riscv/virt.c | 4 ++++
>  1 file changed, 4 insertions(+)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

