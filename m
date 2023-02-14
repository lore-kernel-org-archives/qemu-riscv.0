Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRmXp-0002sy-PV
	for mharc-qemu-riscv@gnu.org; Mon, 13 Feb 2023 23:03:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pRmXo-0002sk-0G; Mon, 13 Feb 2023 23:03:52 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pRmXm-0003nM-2V; Mon, 13 Feb 2023 23:03:51 -0500
Received: by mail-ej1-x632.google.com with SMTP id qb15so34976737ejc.1;
 Mon, 13 Feb 2023 20:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BhzOe3ssRbvCuXFpEl1OrdWb8ZDPYWPX9+bvUH92jf0=;
 b=XispLEUS3ZiD6ZTHZjzBtYuQaJVQ3j74CNNFVVgezJwCDo96jKsIXQ8viVlRBVVL9Y
 FU6MJ9yu0CcxX8Qy5l20I6qtBV0zxiflxIfGnaz30nLKGHA7/Sga21r8kHdvNHZvJFtT
 CjCMixS9j2T3RnXHoqa+oiVt5atMVOfkcSyE9dDR37ZbrsNogPcKzynzdL9kEzLuYLbc
 Tdet2DQ6PxoORVIG0JeDsV6x7pH9ZqGCTsiaLdiXC5OC8X+RWHLpV4fdLUO00mXXZGCn
 aICtcOV1Bq1mR1zVxd1CHt04wi2I/kJR2C3nfQo657hvlxMBfjwiFHUW7moSkw5PCvCR
 VkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BhzOe3ssRbvCuXFpEl1OrdWb8ZDPYWPX9+bvUH92jf0=;
 b=4V3W8qLCWjfETP/38xj88eL6TbP/dqGTdCAAY7tqvu19z3eVqNR0Bzfy+2sRgB4Wm/
 is22q9n1k5IeOEinkSNSmWhvNOHG7JF8aK5gCQ0gqD6xkyTLr831konsj5PIoTFSqRwd
 WlInzIxD+R61TDDeMGywkr4+Pdl8xxofoNAtl1lEGwv77rwXpcyuFjrkEpvzPp2kVkCb
 ECRoQ42CP0pWwQ1SMcbbqWjVtTRgDlVsk78L9fgJ5HdB0rGcCxQMxal64u1D6B/Qi4t5
 pm8XJz+CEEook1rij511xsPebYxC8hw3uJ00ebTY/hxMcl+HnzrKO2G8u/32gTOBAxA3
 O+xg==
X-Gm-Message-State: AO0yUKUJZGLNry/kvREUnxj5SzfILj+M0ddpNMatyG1OgVLwPd7R44xq
 yy5+mA+KLDTeGH071OWxgytXH8yywTavIAfL/5Q=
X-Google-Smtp-Source: AK7set8WkzF7E+0F1OjvA68mvolY6Jaf/nX7vW1yxlf4GOxfNetQttLgigukSjV0/yYXsL8onBliXM+CL36pc/yv7+k=
X-Received: by 2002:a17:906:160b:b0:877:747c:373e with SMTP id
 m11-20020a170906160b00b00877747c373emr586625ejd.6.1676347427488; Mon, 13 Feb
 2023 20:03:47 -0800 (PST)
MIME-Version: 1.0
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
 <20230213144038.2547584-5-sunilvl@ventanamicro.com>
 <9e7edd02-aa8e-c146-d67c-aa255a8aa6e5@ventanamicro.com>
 <Y+sDYFI+ku5/S1+J@sunil-laptop>
In-Reply-To: <Y+sDYFI+ku5/S1+J@sunil-laptop>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 14 Feb 2023 12:03:36 +0800
Message-ID: <CAEUhbmU45aHnwgOjLKh==xKVfLn_5O+oTyvWA=6TSU8bv6QgTg@mail.gmail.com>
Subject: Re: [PATCH V2 04/10] hw/riscv/virt: virt-acpi-build.c: Add basic ACPI
 tables
To: Sunil V L <sunilvl@ventanamicro.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>, 
 Anup Patel <apatel@ventanamicro.com>, Atish Kumar Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x632.google.com
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
X-List-Received-Date: Tue, 14 Feb 2023 04:03:52 -0000

On Tue, Feb 14, 2023 at 11:43 AM Sunil V L <sunilvl@ventanamicro.com> wrote:
>
> On Mon, Feb 13, 2023 at 03:48:04PM -0300, Daniel Henrique Barboza wrote:
> > Sunil,
> >
> > This patch is a bit confusing to me. You're using functions that doesn't exist
> > in the code base yet (build_madt and build_rhct) because they are introduced
> > in later patches. This also means that this patch is not being compiled tested,
> > because otherwise it would throw a compile error. And the build of the file only
> > happens after patch 8.
> >
> My intention was to add the caller also in the same patch where the
> function is added. I think I missed it when I split. Thanks!
>
> > Now, there is no hard rule in QEMU that dictates that every patch must be compile
> > tested, but nevertheless this is a good rule to follow that makes our lives easier
> > when bisecting and cherry-pick individual patches.
> >
> > My suggestion for this patch is:
> >
> > - squash both patches 7 and 8 into this patch to allow the file to be built;
> >
> Sure.
>
> > - remove the code that is referring to stuff that you haven't add yet:
> >
> > $ git diff
> > diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> > index 3c4da6c385..eb17029b64 100644
> > --- a/hw/riscv/virt-acpi-build.c
> > +++ b/hw/riscv/virt-acpi-build.c
> > @@ -156,12 +156,6 @@ virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
> >      acpi_add_table(table_offsets, tables_blob);
> >      build_fadt_rev6(tables_blob, tables->linker, s, dsdt);
> > -    acpi_add_table(table_offsets, tables_blob);
> > -    build_madt(tables_blob, tables->linker, s);
> > -
> > -    acpi_add_table(table_offsets, tables_blob);
> > -    build_rhct(tables_blob, tables->linker, s);
> > -
> >      /* XSDT is pointed to by RSDP */
> >      xsdt = tables_blob->len;
> >      build_xsdt(tables_blob, tables->linker, table_offsets, s->oem_id,
> >
> >
> > - in patch 5, add back the lines in virt_acpi_build() that uses build_madt();
> >
> > - in patch 6, add back the lines in virt_acpi_build() that uses build_rhct();
> >
> >
> > This will make this patch to be compiled and built right away without interfering with
> > the end result of the series.
> >
> Thanks!
>
> >
> > One more suggestion:
> >
> >
> > On 2/13/23 11:40, Sunil V L wrote:
> > > Add few basic ACPI tables and DSDT with few devices in a
> > > new file virt-acpi-build.c.
> > >
> > > These are mostly leveraged from arm64.
> >
> > Quick rant that you've already heard: I don't really understand why there is so
> > much ACPI code duplication everywhere. I really don't. E.g. acpi_align_size() is
> > copied verbatim in hw/arm/virt-acpi-build.c, hw/i386/acpi-build.c and
> > hw/loongarch/acpi-build.c. I don't see why we can't have a common file in hw/acpi
> > with helpers and so on that every ACPI architecture can use, and then the
> > individual drivers for each arch can have its own magic sauce.
> >

Yes, I had the same concern with Daniel when looking at the v1 series.

I am hoping the ACPI maintainers could make a decision, whether we
allow another architecture to do the duplication in their arch tree,
or we spend some time refactoring the ACPI table generation stuff.

+Michael and Igor.

> I completely agree that we better avoid duplication But I am bit
> hesitant in this case because,
> 1) Low level functions which help in creating the namespace/static
> tables are already common (ex: aml_append)
>
> 2) Using these basic routines, individual platforms can create the
> namespace with appropriate devices and the methods.
>
> ACPI name space is tightly coupled with a platform. While there may be
> common devices like processors, uart etc, there can be difference in the
> ACPI methods for each of those devices. For ex: CPU objects for one
> platform may support _LPI method. uart may support _DSD for one platform
> and other may use totally different UART. If we have to create common routines,
> we will have to decide on all parameters the common function would need for
> different platforms. Same concern with fw_cfg/virtio etc which look same
> now but in future one platform can add a new method for these devices.
>
> IMHO, even though it looks like we have the same function in each architecture
> currently, this model allows us to have platforms with different devices with
> different methods/features. Creating common routines now would probably make
> them difficult to use in future.
>
> acpi_align_size() is a simple wrapper. We don't need it if we directly
> use the common function.
>
> Since I see insistence let me try moving few functions like fw_cfg (virtio, pci in
> future) to a common file in hw/acpi.
>
> > All this said, instead of mentioning "this is mostly leveraged from arm64", you
> > can make a brief summary of the changes you've done from the arm64 version. This
> > will help guide the review into focusing on the novel code you're adding and
> > ignore the copied bits.
> >
> Sure.

Regards,
Bin

