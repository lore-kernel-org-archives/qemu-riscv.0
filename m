Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFN8X-0006p6-Sa
	for mharc-qemu-riscv@gnu.org; Tue, 10 Jan 2023 17:30:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFN8U-0006ok-Qz; Tue, 10 Jan 2023 17:30:26 -0500
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pFN8T-0000i2-5G; Tue, 10 Jan 2023 17:30:26 -0500
Received: by mail-vs1-xe2c.google.com with SMTP id s127so13869492vsb.5;
 Tue, 10 Jan 2023 14:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KYkPNorHCkymo59gv9B+edmPjN+mghN54XIdHSXJc4U=;
 b=V9gumePgsTVkFUjvBD4RGheuEhtzTLoPYKgVMpSRyvSclNl/1u+MyaVCr5RvJFvguc
 YwzCnLJr6d0xeO07h8OFoy80xSeMVa8jyw0r0RqrN/PRXcerUGmYW/+vj2Q6pNFeH7Rq
 EKCzK7p6AT5jW7HCp0Jz5ynqx6Go9gw9/DhHpsD0/UQoO1F0xOwm5oJCPGQ3wMOV7e/2
 ywv2w8FrMTjR6koOqXajl6OjAcIpQ3LrH+PK8tAH0dqYTPWUumTpKnfiy5t7zjteGDdG
 PKRkmRsq+nEo+HX9iQRIXXncwkVq4fCOAofW3KuPvH4zkFZQPw9+dbyrRCRYMcmxJ4ob
 hJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KYkPNorHCkymo59gv9B+edmPjN+mghN54XIdHSXJc4U=;
 b=DyIcomy/59B3zl4WY05CJtfrRRhqil0hJmPjXRlC7AXzmLU0Hu4V5j5Zw5eIB0OQZP
 AZ2Q3r6mHfYdG/h2n1SdpXOpkLI6kkYn7ZTC80+SBoP3dq2q3neg9OdmyKAuCAG6CbxW
 7djK2yfCMn1/6C6/Y7zKBo2pVV358oYJh3+rGWS2gyWQRDE0M5oDx4oOj1GOYtpq73fz
 ERIUJYx4p3d1RCnj2d7oPsRduLYeQ0hZL4K3YuNiYzC+tJu6oe/WCA3ccWkIuCUj6iv3
 jRp7OfnG3pZkA67oVQzGYF54EDrJVV3lvzLvayU2zA1rrEHIVRd81Jx4cdEcOOwuC644
 dPlg==
X-Gm-Message-State: AFqh2kr0OD5+KI0k/QWWyGqENPSjIOJA03AMQm6HG5mIbWaTIIFw9jpz
 q/nb9g/0C/T1ZyVzaHD/pu70YfdGRznlDxSFvYxTrKfqBno=
X-Google-Smtp-Source: AMrXdXs8WUMd5ZCrECm1DkI6xh06LUEg5CduW0ARsXHr3NtZlWKhPvYw9EyQFwJJFLq0iw/mwFeiN3oXdO3GpWExyjY=
X-Received: by 2002:a67:6582:0:b0:3d0:d7ce:b383 with SMTP id
 z124-20020a676582000000b003d0d7ceb383mr121234vsb.72.1673389823065; Tue, 10
 Jan 2023 14:30:23 -0800 (PST)
MIME-Version: 1.0
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
 <20230102115241.25733-5-dbarboza@ventanamicro.com>
In-Reply-To: <20230102115241.25733-5-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Jan 2023 08:29:57 +1000
Message-ID: <CAKmqyKOSusV0S9RM+h4H3ZXocYjU5M8zgG8=AwoCXE0-gQ_W5Q@mail.gmail.com>
Subject: Re: [PATCH v5 04/11] hw/riscv/boot.c: exit early if filename is NULL
 in load functions
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2c.google.com
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
X-List-Received-Date: Tue, 10 Jan 2023 22:30:27 -0000

On Mon, Jan 2, 2023 at 9:54 PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> riscv_load_firmware(), riscv_load_initrd() and riscv_load_kernel() works
> under the assumption that a 'filename' parameter is always not NULL.
>
> This is currently the case since all callers of these functions are
> checking for NULL before calling them. Add an g_assert() to make sure
> that a NULL value in these cases are to be considered a bug.
>
> Suggested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/boot.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 98b80af51b..31aa3385a0 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -153,6 +153,8 @@ target_ulong riscv_load_firmware(const char *firmware=
_filename,
>      uint64_t firmware_entry, firmware_end;
>      ssize_t firmware_size;
>
> +    g_assert(firmware_filename !=3D NULL);
> +
>      if (load_elf_ram_sym(firmware_filename, NULL, NULL, NULL,
>                           &firmware_entry, NULL, &firmware_end, NULL,
>                           0, EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
> @@ -177,6 +179,8 @@ target_ulong riscv_load_kernel(const char *kernel_fil=
ename,
>  {
>      uint64_t kernel_load_base, kernel_entry;
>
> +    g_assert(kernel_filename !=3D NULL);
> +
>      /*
>       * NB: Use low address not ELF entry point to ensure that the fw_dyn=
amic
>       * behaviour when loading an ELF matches the fw_payload, fw_jump and=
 BBL
> @@ -209,6 +213,8 @@ hwaddr riscv_load_initrd(const char *filename, uint64=
_t mem_size,
>  {
>      ssize_t size;
>
> +    g_assert(filename !=3D NULL);
> +
>      /*
>       * We want to put the initrd far enough into RAM that when the
>       * kernel is uncompressed it will not clobber the initrd. However
> --
> 2.39.0
>
>

