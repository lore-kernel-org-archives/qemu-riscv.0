Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E38EB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 02:48:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qG9bS-0001E6-78; Sun, 02 Jul 2023 22:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG9bP-0001Cg-S7; Sun, 02 Jul 2023 22:47:47 -0400
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG9bN-00058R-Pi; Sun, 02 Jul 2023 22:47:47 -0400
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-47e2df3c418so310761e0c.3; 
 Sun, 02 Jul 2023 19:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688352464; x=1690944464;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x43LMeC71mWklkzr15r4pKrbZRjs1/HyvGGzbeLlFP8=;
 b=XPj6aLWecO+DK/GcslzE0LB3/qYDlReWD4qB9S3s6geSVEFJ5dc0ARJk9z4SyX3/Ox
 1WS9fSdcgstODX4f7z01UDVDe26KgmGL9xZcxFTPoRbjZ/hTqGEts5svZHVhHSmYtWFC
 iRrqhV7zIESg4iYckQmVNiAibWjFhmaTLvf6g+zQUK9aEeJ+euMk3d2dYF7ZHJstJQiU
 D0SN7zMi3zg2QDFl97XXLWMsIJ96+40rRzs+E+htbvPo3/yWv/okfe7ui6Q+TYYnKXsQ
 kWQqQWNXxidl4DFNByP5lQxULR/MnXrP2RUp0qCaZ+xyZ7S9LnrFp7xMDBwr0J4+jKwZ
 pdkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688352464; x=1690944464;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x43LMeC71mWklkzr15r4pKrbZRjs1/HyvGGzbeLlFP8=;
 b=IfIHp31AEfHbQKhalQvYT/0e6/EGRlRedTcOJswZ+yF/cIR/RWJ3A2O5PlXBgeZCbj
 UGGyEZ2wThLXmyaEng/0/qn0qGAiMKXARtS5O9JCNC/5yarg2TTyUPeETyWQIqc2xu+U
 sIu6bMMHs+veHTAXhaSCCe2i5dviylUwmTGhGi80EfP7i9YkflzvgsOLDL6GZ3u8GLOR
 5BOmdIi38d6Ma571Xr9scsDY+uTzFxk+gqexqK9DCH7rPDesA15NdDa8RDPcE/FSAp5+
 kSzjS5ucsAGCLjTmVUj89QfQCCklb6tDHWvFSoK4rt5edWq1zFKfEZZqUt4FDMQLqJTA
 i81Q==
X-Gm-Message-State: ABy/qLbR231++5y8iSkf7tvHm5BnzaFF+Z/P+b2GNvmxSFQNG6NNr0rX
 HaWxplORixe7KCj7EAGzV0A9T6+44KUK7NnJCYE=
X-Google-Smtp-Source: APBJJlFC5dDuJusbjb+1gw5MPxBs3K60SCmO73nn0nWmIk0blsxaZ79/EXVcq3mKcq8RQYJRlvws3C4iSL1s4Tdhdks=
X-Received: by 2002:a1f:bdcb:0:b0:47e:47d4:958 with SMTP id
 n194-20020a1fbdcb000000b0047e47d40958mr481379vkf.15.1688352464425; Sun, 02
 Jul 2023 19:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230629121103.87733-1-philmd@linaro.org>
 <20230629121103.87733-3-philmd@linaro.org>
In-Reply-To: <20230629121103.87733-3-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 3 Jul 2023 12:47:18 +1000
Message-ID: <CAKmqyKOHU4TJiNs6OFe0JRBF2-qgo-6L0-YjGAHBqhEuhgO-qw@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/riscv/virt: Restrict ACLINT to TCG
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org, 
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Jun 29, 2023 at 10:12=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> The Advanced Core Local Interruptor (ACLINT) device can
> only be used with TCG. Check for TCG enabled instead of
> KVM being not. Only add the property when TCG is used.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  docs/system/riscv/virt.rst |  1 +
>  hw/riscv/virt.c            | 18 ++++++++++--------
>  2 files changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
> index b33f45e5b3..f9a2eac544 100644
> --- a/docs/system/riscv/virt.rst
> +++ b/docs/system/riscv/virt.rst
> @@ -93,6 +93,7 @@ The following machine-specific options are supported:
>
>    When this option is "on", ACLINT devices will be emulated instead of
>    SiFive CLINT. When not specified, this option is assumed to be "off".
> +  This option is restricted to the TCG accelerator.
>
>  - aia=3D[none|aplic|aplic-imsic]
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 68ccd0bde1..cdb88a1529 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -44,6 +44,7 @@
>  #include "chardev/char.h"
>  #include "sysemu/device_tree.h"
>  #include "sysemu/sysemu.h"
> +#include "sysemu/tcg.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/tpm.h"
>  #include "hw/pci/pci.h"
> @@ -776,7 +777,7 @@ static void create_fdt_sockets(RISCVVirtState *s, con=
st MemMapEntry *memmap,
>
>          g_free(clust_name);
>
> -        if (!kvm_enabled()) {
> +        if (tcg_enabled()) {
>              if (s->have_aclint) {
>                  create_fdt_socket_aclint(s, memmap, socket,
>                      &intc_phandles[phandle_pos]);
> @@ -1370,7 +1371,7 @@ static void virt_machine_init(MachineState *machine=
)
>                                  hart_count, &error_abort);
>          sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_fatal);
>
> -        if (!kvm_enabled()) {
> +        if (tcg_enabled()) {
>              if (s->have_aclint) {
>                  if (s->aia_type =3D=3D VIRT_AIA_TYPE_APLIC_IMSIC) {
>                      /* Per-socket ACLINT MTIMER */
> @@ -1682,12 +1683,13 @@ static void virt_machine_class_init(ObjectClass *=
oc, void *data)
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
>  #endif
>
> -    object_class_property_add_bool(oc, "aclint", virt_get_aclint,
> -                                   virt_set_aclint);
> -    object_class_property_set_description(oc, "aclint",
> -                                          "Set on/off to enable/disable =
"
> -                                          "emulating ACLINT devices");
> -
> +    if (tcg_enabled()) {
> +        object_class_property_add_bool(oc, "aclint", virt_get_aclint,
> +                                       virt_set_aclint);
> +        object_class_property_set_description(oc, "aclint",
> +                                              "Set on/off to enable/disa=
ble "
> +                                              "emulating ACLINT devices"=
);
> +    }
>      object_class_property_add_str(oc, "aia", virt_get_aia,
>                                    virt_set_aia);
>      object_class_property_set_description(oc, "aia",
> --
> 2.38.1
>
>

