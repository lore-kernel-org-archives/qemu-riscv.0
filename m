Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRmEH-0006Gh-7R
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 22:43:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRmEG-0006GN-7z
 for qemu-riscv@nongnu.org; Mon, 13 Feb 2023 22:43:40 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRmEE-00035U-7w
 for qemu-riscv@nongnu.org; Mon, 13 Feb 2023 22:43:39 -0500
Received: by mail-pg1-x536.google.com with SMTP id n2so9449784pgb.2
 for <qemu-riscv@nongnu.org>; Mon, 13 Feb 2023 19:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qSvo0GFgcwxKxPZD0w75Wyb8vISG0jYo5nrNORtNpXw=;
 b=IZGIkR+WPQoJQzgVXwoisXPpUzzliMkqUqtzwHl89+Q2mqcJCCU7coSWZU7+02KxWn
 6nZM42ADgIlwMqO8YGzLuivmviodJfNICSiuiRi+Kd+nfeVIaVjF58g/3dkLvRcfTpwv
 iTKSfNkyxUCY/V5xH5N0xmBWP4z4JeG2j7deFXZKR3s+2dgOQTfiq3n273lUPbUjxYSc
 TMUbc2HWfgnmBzOYyOjju3m/FpvZg2waeQ5U8WJd5TCf6/RQcEHd8rsIC3bNSf8WO+65
 MFP3vaJaLvWSCNOzCXRxicpoxdzLKf/4RsuMciuIxBV+IfaPHX+AQPlEBQn+9pZYAIIB
 /Jnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qSvo0GFgcwxKxPZD0w75Wyb8vISG0jYo5nrNORtNpXw=;
 b=04P+lUDMmf1Dhk0xnk+jEYbJWSlPh7dDdB8OQ/pYTtuAX9okb1KZX/9ALyIa+049K0
 lgQLVSQpLtXU9tJQV2O7fhIhLNTF/nyGeeyK/+AGN15FlxWRVKdmQ5ImNp62IlEhXMUW
 E+3WNsBjHqTQfwxtGfibtxkhzO4dGR/8GwzEgbhgmZBawY3HI54pnEDQmGbk1k3/oUop
 SxOsRNXJzCvgDr3Pi9xJb6xuhaWwEWysdOklI6mIpLJXMwRvJk8Mha9Fuj4V1kGcB5V7
 y+hOJ4p/Tn7hMBSknvJ344/N1ldyCbUeqqmAyjGGlOk+3MvZWfb5YAbdKQqs9BZqvF34
 ru3g==
X-Gm-Message-State: AO0yUKUavENTsQejF7/EBH6ChlHoj3h0Zxltyqzjut7MW9u4ZqhNNxK/
 YxGcCNTyG51KDiqyG5jdFd5thQ==
X-Google-Smtp-Source: AK7set/7cSBCNFOiLgF8M/Fg5J7oddlh8SSx8tIIL0Gp8PogmLmTEkXVuFZXLnuacl6HLFTo3hol1A==
X-Received: by 2002:aa7:8e88:0:b0:58d:abd5:504a with SMTP id
 a8-20020aa78e88000000b0058dabd5504amr613906pfr.31.1676346216393; 
 Mon, 13 Feb 2023 19:43:36 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 a9-20020aa780c9000000b00591b0c847b5sm8584763pfn.218.2023.02.13.19.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 19:43:36 -0800 (PST)
Date: Tue, 14 Feb 2023 09:13:28 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH V2 04/10] hw/riscv/virt: virt-acpi-build.c: Add basic
 ACPI tables
Message-ID: <Y+sDYFI+ku5/S1+J@sunil-laptop>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
 <20230213144038.2547584-5-sunilvl@ventanamicro.com>
 <9e7edd02-aa8e-c146-d67c-aa255a8aa6e5@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e7edd02-aa8e-c146-d67c-aa255a8aa6e5@ventanamicro.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 14 Feb 2023 03:43:40 -0000

On Mon, Feb 13, 2023 at 03:48:04PM -0300, Daniel Henrique Barboza wrote:
> Sunil,
> 
> This patch is a bit confusing to me. You're using functions that doesn't exist
> in the code base yet (build_madt and build_rhct) because they are introduced
> in later patches. This also means that this patch is not being compiled tested,
> because otherwise it would throw a compile error. And the build of the file only
> happens after patch 8.
> 
My intention was to add the caller also in the same patch where the
function is added. I think I missed it when I split. Thanks!

> Now, there is no hard rule in QEMU that dictates that every patch must be compile
> tested, but nevertheless this is a good rule to follow that makes our lives easier
> when bisecting and cherry-pick individual patches.
> 
> My suggestion for this patch is:
> 
> - squash both patches 7 and 8 into this patch to allow the file to be built;
> 
Sure.

> - remove the code that is referring to stuff that you haven't add yet:
> 
> $ git diff
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 3c4da6c385..eb17029b64 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -156,12 +156,6 @@ virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_fadt_rev6(tables_blob, tables->linker, s, dsdt);
> -    acpi_add_table(table_offsets, tables_blob);
> -    build_madt(tables_blob, tables->linker, s);
> -
> -    acpi_add_table(table_offsets, tables_blob);
> -    build_rhct(tables_blob, tables->linker, s);
> -
>      /* XSDT is pointed to by RSDP */
>      xsdt = tables_blob->len;
>      build_xsdt(tables_blob, tables->linker, table_offsets, s->oem_id,
> 
> 
> - in patch 5, add back the lines in virt_acpi_build() that uses build_madt();
> 
> - in patch 6, add back the lines in virt_acpi_build() that uses build_rhct();
> 
> 
> This will make this patch to be compiled and built right away without interfering with
> the end result of the series.
>
Thanks!
 
> 
> One more suggestion:
> 
> 
> On 2/13/23 11:40, Sunil V L wrote:
> > Add few basic ACPI tables and DSDT with few devices in a
> > new file virt-acpi-build.c.
> > 
> > These are mostly leveraged from arm64.
> 
> Quick rant that you've already heard: I don't really understand why there is so
> much ACPI code duplication everywhere. I really don't. E.g. acpi_align_size() is
> copied verbatim in hw/arm/virt-acpi-build.c, hw/i386/acpi-build.c and
> hw/loongarch/acpi-build.c. I don't see why we can't have a common file in hw/acpi
> with helpers and so on that every ACPI architecture can use, and then the
> individual drivers for each arch can have its own magic sauce.
>
I completely agree that we better avoid duplication But I am bit
hesitant in this case because,
1) Low level functions which help in creating the namespace/static
tables are already common (ex: aml_append)

2) Using these basic routines, individual platforms can create the
namespace with appropriate devices and the methods.

ACPI name space is tightly coupled with a platform. While there may be
common devices like processors, uart etc, there can be difference in the
ACPI methods for each of those devices. For ex: CPU objects for one
platform may support _LPI method. uart may support _DSD for one platform
and other may use totally different UART. If we have to create common routines,
we will have to decide on all parameters the common function would need for
different platforms. Same concern with fw_cfg/virtio etc which look same
now but in future one platform can add a new method for these devices.

IMHO, even though it looks like we have the same function in each architecture
currently, this model allows us to have platforms with different devices with
different methods/features. Creating common routines now would probably make
them difficult to use in future. 

acpi_align_size() is a simple wrapper. We don't need it if we directly
use the common function.

Since I see insistence let me try moving few functions like fw_cfg (virtio, pci in
future) to a common file in hw/acpi.
 
> All this said, instead of mentioning "this is mostly leveraged from arm64", you
> can make a brief summary of the changes you've done from the arm64 version. This
> will help guide the review into focusing on the novel code you're adding and
> ignore the copied bits.
> 
Sure.

Thanks!
Sunil

