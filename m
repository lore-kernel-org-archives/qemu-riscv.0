Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pGCXV-00077R-VG
	for mharc-qemu-riscv@gnu.org; Fri, 13 Jan 2023 00:23:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pGCXT-000775-9W; Fri, 13 Jan 2023 00:23:40 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pGCXQ-0004Hi-VJ; Fri, 13 Jan 2023 00:23:38 -0500
Received: by mail-ej1-x631.google.com with SMTP id ss4so42507627ejb.11;
 Thu, 12 Jan 2023 21:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uhWCTDFB1F7Y7ToV7wc0OmvqyYK7a2PqLxk0zk6ci34=;
 b=jHAHx4+NVVXylWZoTsbNBrU836JETjMlC3Q/Rz2UmaLjhTgc7+n85d7QU6ABQhT91F
 /lUywH6D2wHgRupuEE5u7bYllKJ/MKFeN0ChuTkmCXT7YVrreGXHavwLPoLitNu3vUjj
 OoODJpb2M7wEXD+U4PUJ5xQZ62omO8fIxUZ0O5c9pLQNJpWtsaHL/UTMfTgGJcVJYPl4
 I0mLGC2rDvuIAmdcGuUNSpq+LZe+cGVHVZIHsMx+KgWDRTc1VFooIbmZVSyDymMJuoLW
 AfWx5B7ZNgRUlsPy4JCGVCY61vV4gbFpizvLwmBgNhV5ncwWOo9IP6dTLdjJTXNmYtq/
 3s/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uhWCTDFB1F7Y7ToV7wc0OmvqyYK7a2PqLxk0zk6ci34=;
 b=qIxlQnbl0rLwoVhdyZHSyyx1hFQsl0rNt7d7RpKhumFqKTRlvgkbCU4V0XqMq6sq97
 GJiwUXl/kKXamlNlSufdiuK4cARGTm19dkCeBF2oZppgIb+AJpg6bGNFtweRVO7c20Ft
 qCCOaqh/AvO+F1wLVSiExv9Vkfbn9wJZ5hNtyE6H2xefdR+nXGqhpfASdPpCFNCpNSON
 EG5Tc3knUZHrKtvOWlAxaP1LdZ8Q3sz0pe2Da8rBrIGVVGDfkaJf/XspENNSIKVH067m
 S8tTQpAHKaAhtt5jFOyl7Jar55F3aSgr1rDE7Eyb0A7z2WlP7aMuMLVFv5eVwy+HrhGq
 3JTA==
X-Gm-Message-State: AFqh2ko4MgAGQ2GZLJ/yABcPN2vrFfP/40FP0IIhxdjrveERrvyEv6mZ
 mEtkAQEaR9xR8Fd/lyBq7zvE7Hx4oa3ImnvEAns=
X-Google-Smtp-Source: AMrXdXsuqnPBJFXfWoyopN84x39n+4QwN7MMwaxBNQlI0oJDiyJdP+WTHlvPhFl20gkFBmn++Fw5lpnFGwDaSjqa7FQ=
X-Received: by 2002:a17:907:a08d:b0:846:8c9a:68a3 with SMTP id
 hu13-20020a170907a08d00b008468c9a68a3mr4283786ejc.217.1673587414268; Thu, 12
 Jan 2023 21:23:34 -0800 (PST)
MIME-Version: 1.0
References: <20230102115241.25733-1-dbarboza@ventanamicro.com>
 <20230102115241.25733-11-dbarboza@ventanamicro.com>
 <CAKmqyKPri7asvqZ8wN4Bd-wjH+gwwMJJhiUd+=QZFV4RhWnyUQ@mail.gmail.com>
In-Reply-To: <CAKmqyKPri7asvqZ8wN4Bd-wjH+gwwMJJhiUd+=QZFV4RhWnyUQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 13 Jan 2023 13:23:22 +0800
Message-ID: <CAEUhbmUu-=eH6xAug19z7cFL_0HX+Jr+L0Bkn6VmHwuJggfisA@mail.gmail.com>
Subject: Re: [PATCH v5 10/11] hw/riscv/boot.c: consolidate all kernel init in
 riscv_load_kernel()
To: Alistair Francis <alistair23@gmail.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 alistair.francis@wdc.com, Bin Meng <bin.meng@windriver.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x631.google.com
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
X-List-Received-Date: Fri, 13 Jan 2023 05:23:40 -0000

Hi Alistair,

On Thu, Jan 12, 2023 at 8:36 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Mon, Jan 2, 2023 at 9:55 PM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
> >
> > The microchip_icicle_kit, sifive_u, spike and virt boards are now doing
> > the same steps when '-kernel' is used:
> >
> > - execute load_kernel()
> > - load init_rd()
> > - write kernel_cmdline
> >
> > Let's fold everything inside riscv_load_kernel() to avoid code
> > repetition. To not change the behavior of boards that aren't calling
> > riscv_load_init(), add an 'load_initrd' flag to riscv_load_kernel() and
> > allow these boards to opt out from initrd loading.
> >
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > ---
> >  hw/riscv/boot.c            | 22 +++++++++++++++++++---
> >  hw/riscv/microchip_pfsoc.c | 12 ++----------
> >  hw/riscv/opentitan.c       |  2 +-
> >  hw/riscv/sifive_e.c        |  3 ++-
> >  hw/riscv/sifive_u.c        | 12 ++----------
> >  hw/riscv/spike.c           | 11 +----------
> >  hw/riscv/virt.c            | 12 ++----------
> >  include/hw/riscv/boot.h    |  1 +
> >  8 files changed, 30 insertions(+), 45 deletions(-)
> >
> > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> > index 2594276223..4888d5c1e0 100644
> > --- a/hw/riscv/boot.c
> > +++ b/hw/riscv/boot.c
> > @@ -175,10 +175,12 @@ target_ulong riscv_load_firmware(const char *firmware_filename,
> >
> >  target_ulong riscv_load_kernel(MachineState *machine,
> >                                 target_ulong kernel_start_addr,
> > +                               bool load_initrd,
> >                                 symbol_fn_t sym_cb)
> >  {
> >      const char *kernel_filename = machine->kernel_filename;
> >      uint64_t kernel_load_base, kernel_entry;
> > +    void *fdt = machine->fdt;
> >
> >      g_assert(kernel_filename != NULL);
> >
> > @@ -192,21 +194,35 @@ target_ulong riscv_load_kernel(MachineState *machine,
> >      if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
> >                           NULL, &kernel_load_base, NULL, NULL, 0,
> >                           EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
> > -        return kernel_load_base;
> > +        kernel_entry = kernel_load_base;
>
> This breaks 32-bit Xvisor loading. It seems that for the 32-bit guest
> we get a value of 0xffffffff80000000.

Shouldn't the bug be the 32-bit Xvisor image? How can a 32-bit image
return an address of 0xffffffff80000000?

>
> Previously the top bits would be lost as we return a target_ulong from
> this function, but with this change we pass the value
> 0xffffffff80000000 to riscv_load_initrd() which causes failures.
>
> This diff fixes the failure for me
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 4888d5c1e0..f08ed44b97 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -194,7 +194,7 @@ target_ulong riscv_load_kernel(MachineState *machine,
>     if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
>                          NULL, &kernel_load_base, NULL, NULL, 0,
>                          EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
> -        kernel_entry = kernel_load_base;
> +        kernel_entry = (target_ulong) kernel_load_base;
>         goto out;
>     }
>
>
> but I don't think that's the right fix. We should instead look at the
> CPU XLEN and drop the high bits if required.
>
> I'm going to drop this patch, do you mind looking into a proper fix?
>

Regards,
Bin

