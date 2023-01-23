Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pK6jD-00073K-Ao
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 18:59:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK6jA-00072x-Q2; Mon, 23 Jan 2023 18:59:52 -0500
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK6j7-0001SI-42; Mon, 23 Jan 2023 18:59:51 -0500
Received: by mail-vs1-xe2f.google.com with SMTP id t10so14860984vsr.3;
 Mon, 23 Jan 2023 15:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PFWOPvOnxnFt1nZS/xroCnvkkHE6ZU3CpyTkzzQJIf0=;
 b=O+4VsXDAaQB/2VR18qjEXjgDPYpfoQll8zFMi1RbLfFbcMpGj/qXJ9gDRg4dLLb70u
 zgcCSrm77ema8nl+DbukjGNxoY5qQcCQdE8aPHjtBE9Dzx642eWSkWUSJXIQALyA1uxW
 pcaqJENCmBHib5QozkqwkshbbUxtQsK7KOFh+Teg4MHDJyJJ/4JOLvn+QOUTyz03ZiNf
 SYjG9uE6g1+Rbbr5RJlPUZdTztonkz/O7KfrvX3ElekhiU6SX9UtpzCCSkZnPNTq8GFo
 uTCSp5X4e2iVWegSW9Hho4r0CJ3CNCPuh384A0q9nceGhQNqSAHio1+fbpJowjF60VrP
 elSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PFWOPvOnxnFt1nZS/xroCnvkkHE6ZU3CpyTkzzQJIf0=;
 b=AbGRFN37qHqvd+9Q7TqMo16MATXmMtl7O5gs+pzpNGnmNO2jdnXSEecWZjF0WCUA3o
 nSDFS2+Z1davxg6bspi/Aj5+gxuu1/h+7jphA/oePKdhoHfa7pR2k7ywtWPNe2JAkni+
 NzteHcaWbz7u2C8njXiR2RKjMyHpBVH89IrOgC9HaAJBQLUb8RiNYo4T37Q6adjgK5GL
 PBJ5AFiTqKn0jkOWi6zkktiYeV7IKu78Gj53oEKFo2w90bLZ9woLWidQzI+jzLCxVk79
 uudnmE2mAEbALsgseBy5tyxDzbzd6ZPzd+mHZ5weG6lDO+Os1UUsM0wBS9C6JrsB5Mvh
 YPNw==
X-Gm-Message-State: AFqh2kp1m9Jfx6VRk0gE41AqJuXw9t1e9IUUDHMtv4fNMb5x9klVwbKw
 7mmS+HHPh5GDN+AuLmqa3+llSN7HmEVsU6wCa0w=
X-Google-Smtp-Source: AMrXdXskhhOeOpy3YKC0fGtsYfuGJKqPh72FvPiYw8B5xJvi/WtELek3SqpDrQrlmt1nerirUh89wcCdJW+oDeikL4s=
X-Received: by 2002:a05:6102:cd4:b0:3d0:c2e9:cb77 with SMTP id
 g20-20020a0561020cd400b003d0c2e9cb77mr3386149vst.54.1674518387689; Mon, 23
 Jan 2023 15:59:47 -0800 (PST)
MIME-Version: 1.0
References: <20230123035754.75553-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20230123035754.75553-1-alistair.francis@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Jan 2023 09:59:21 +1000
Message-ID: <CAKmqyKP02-6cU6NVLon9ih5R+uazFDex2HMssOcSKrFbXX6fZw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: boot: Don't use CSRs if they are disabled
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, Bin Meng <bin.meng@windriver.com>, bmeng.cn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
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
X-List-Received-Date: Mon, 23 Jan 2023 23:59:53 -0000

On Mon, Jan 23, 2023 at 1:58 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> If the CSRs and CSR instructions are disabled because the Zicsr
> extension isn't enabled then we want to make sure we don't run any CSR
> instructions in the boot ROM.
>
> This patches removes the CSR instructions from the reset-vec if the
> extension isn't enabled. We replace the instruction with a NOP instead.
>
> Note that we don't do this for the SiFive U machine, as we are modelling
> the hardware in that case.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1447
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/boot.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 2594276223..cb27798a25 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -356,6 +356,15 @@ void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *harts
>          reset_vec[4] = 0x0182b283;   /*     ld     t0, 24(t0) */
>      }
>
> +    if (!harts->harts[0].cfg.ext_icsr) {
> +        /*
> +         * The Zicsr extension has been disabled, so let's ensure we don't
> +         * run the CSR instruction. Let's fill the address with a non
> +         * compressed nop.
> +         */
> +        reset_vec[2] = 0x00000013;   /*     addi   x0, x0, 0 */
> +    }
> +
>      /* copy in the reset vector in little_endian byte order */
>      for (i = 0; i < ARRAY_SIZE(reset_vec); i++) {
>          reset_vec[i] = cpu_to_le32(reset_vec[i]);
> --
> 2.39.0
>

