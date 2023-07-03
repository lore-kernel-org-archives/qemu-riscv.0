Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF7AEB64D9
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 02:47:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qG9aT-0000W7-RO; Sun, 02 Jul 2023 22:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG9aR-0000V0-IH; Sun, 02 Jul 2023 22:46:47 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG9aP-0004Vj-Nq; Sun, 02 Jul 2023 22:46:47 -0400
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-47e4e621637so67717e0c.3; 
 Sun, 02 Jul 2023 19:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688352404; x=1690944404;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JhPdOMM+y6xe927PuZ9Pjicd8cI9mlBX9T6H2jTzJ/8=;
 b=llY1xwktWGRmA0MimPwoVFjUoWv+/8Qf1Tt2/HH+XkY78EMwQf23vXZn+ksX1DSY4k
 Bs/EgpHq6FIH6eXEUBl4b9ypXNb0ZZrFescbSMWPAqjqDV4u1K9kycfoyc+S3LA7O6e4
 1q3dT0VPH12C2DpDwhUaR1FGL4sZ3TwjZX9ePXnAeuJIyPfL9l3fwtuywWLP4uVudJzQ
 hnBE+6gtasRZzgjpjKpVL7HRkOBP4fuLxB5AAmh0r1eAmJkCalPEz6RJ48bx0mzy7fOV
 JdNvG84+6mZ4SUX6mk8IDzAZ+6ShDgNWw5NLfB5p22pPwFNNKXBP6wfklyd3Kwcjk5MC
 IohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688352404; x=1690944404;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JhPdOMM+y6xe927PuZ9Pjicd8cI9mlBX9T6H2jTzJ/8=;
 b=eGtStHnCztUqQIpkUJFctf+KvNrFmIJAFFNbucs/myB2WOWWjGjHwp1lW3O/sbPexm
 N9+XIOGyt5itnaNDOJY6wLv9X9Mj63EoOxAqmPc/rbLmIqVslU4d07+ZuleUassb72q4
 MD9QM8nvanOTrsxKQBBuTknFDZiwsMLy+ZIpm5i4FFSF7t6l25l/Z5T1G8Pojv9+dWaj
 nHuR9VolDhTr54wp+vWOSjPUxW+vV1qQuurxptv4AfhH11PvxxvE2OVX47W+KYPx2iZp
 Zpctdk/a674zOz2q47gur2LPiguz4v+RXezNizH0pzJ4X0EkXFOGGtE1C9/YRVqGb6ti
 1I2g==
X-Gm-Message-State: ABy/qLYx8Z9YUwkSMsRtTvMnW02pm4lo2BsB7QhdlOSYbzXMIm4+SQmK
 0Fkmjm3pqVM10ToCkIYaEf2z8Lixkc1zlP44wC9Xs9xuocnYiQ==
X-Google-Smtp-Source: APBJJlHgA9yyvhBMDJw+Eo5Ho7OpluD2q2xTEvFqi1Zln2zCMpwwUgG9IFzFYeqcLefUG/HZqlJQllv6NZi+xbvapdo=
X-Received: by 2002:a05:6122:231f:b0:471:b14a:fc48 with SMTP id
 bq31-20020a056122231f00b00471b14afc48mr3695011vkb.13.1688352404366; Sun, 02
 Jul 2023 19:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230629121103.87733-1-philmd@linaro.org>
 <20230629121103.87733-3-philmd@linaro.org>
In-Reply-To: <20230629121103.87733-3-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 3 Jul 2023 12:46:18 +1000
Message-ID: <CAKmqyKMiTkGwvF81UP9gFVXryPO85Dg_dxMVXVBfoLPoKCn3iQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/riscv/virt: Restrict ACLINT to TCG
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org, 
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa32.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

