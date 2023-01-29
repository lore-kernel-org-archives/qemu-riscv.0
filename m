Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pM0e3-0000Qk-GP
	for mharc-qemu-riscv@gnu.org; Sun, 29 Jan 2023 00:54:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pM0e2-0000QY-68; Sun, 29 Jan 2023 00:54:26 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pM0e0-0001GN-KY; Sun, 29 Jan 2023 00:54:25 -0500
Received: by mail-ej1-x636.google.com with SMTP id p26so12416887ejx.13;
 Sat, 28 Jan 2023 21:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RZ46tTWCeU27G948OZKuUdw0EuBD8CBg1B5NTtmQMmY=;
 b=WROX4OJHh0VVA2su6cbJYzsaFg0QOkXRQGc1pGVDJPRLJsiHXc6SC1wTqaXQr2655K
 S1O+UL3wNHl13M8uDOtMzGKiceCUrzR4KCAKv2PsA2BCjgwlcBTax1iBmSSHpcCKw+Cj
 8ZJklUcqv/2DiY3prGU7KS19sTmx2PoMC/3aw5UdanYrt6RbmZI1IWzbNEc8bf7KK/Co
 F103ezbw94BSHfHG8f7hSm1cndMfWsnqXXp2mjYKUbP8dKfLIdxAQcPx/iXa5Ynvv8/w
 UynrK6SGW/DWUS4PrD100O7z+HZmuW+3uJ3aLVaK+l5GkjBPvI30gVsRN/Dr8mU9vMP6
 Jyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RZ46tTWCeU27G948OZKuUdw0EuBD8CBg1B5NTtmQMmY=;
 b=1GxHuqw5n6U4NImWrgFLajsbp7K8CeftNcndI1PVm7e/RklNBmdIthwB6KhbJ8I54e
 NzUEp1zAxzAIno9fjAPpwmoafJkXihavFHSWGRV2Q8O4Cp7P03IEqSZN/YAuXJm78Y3L
 duDbdn9z55M3+mfTs4buELg3YQywig5d5kmZ9F4ieeSyC+PcC1STtrneueMjXvs9IGfD
 HNcQl7OhQ8UCIcF06zUNL1mpl+4rah4vFAV+P/L6TQ3PhvhrVYyR++CwOqUIgTJ/IgAH
 oSEOGpyF8L539hh/Z9uUGrxNnSxeDoyIcdhhBpzAjvT/0mIJIWqeo4RZDAAkrw2j98Bu
 HRVA==
X-Gm-Message-State: AO0yUKUrp2YcndDbujQ7fIpYP8TLaD4O8gE3tNIycaxsLgCbiOWvdCoA
 1zKqOv4/FctjnRh3C61NwJHxek7dvxI4ifW+IW4=
X-Google-Smtp-Source: AK7set+CpYeum+BlGbRXTP758K6DvDIMTtXMNoYMGHhCv4mvq4zmoJig0XRMeOrLFyeAYDz/MEaa2VHx7MADrAk04AI=
X-Received: by 2002:a17:906:3283:b0:882:3e56:a854 with SMTP id
 3-20020a170906328300b008823e56a854mr920560ejw.263.1674971661224; Sat, 28 Jan
 2023 21:54:21 -0800 (PST)
MIME-Version: 1.0
References: <20230125162010.1615787-1-alexghiti@rivosinc.com>
 <20230125162010.1615787-2-alexghiti@rivosinc.com>
In-Reply-To: <20230125162010.1615787-2-alexghiti@rivosinc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 29 Jan 2023 13:54:10 +0800
Message-ID: <CAEUhbmWR7UDF2xJbfQLhxPM_VJReAFDsyivGT57__LdyyG52vg@mail.gmail.com>
Subject: Re: [PATCH v8 1/5] riscv: Pass Object to register_cpu_props instead
 of DeviceState
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
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
X-List-Received-Date: Sun, 29 Jan 2023 05:54:26 -0000

On Thu, Jan 26, 2023 at 12:21 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> One can extract the DeviceState pointer from the Object pointer, so pass
> the Object for future commits to access other fields of Object.
>
> No functional changes intended.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

