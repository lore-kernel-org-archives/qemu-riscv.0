Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F1DC25B67
	for <qemu-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 00:09:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qv4yH-0005Hx-O9; Mon, 23 Oct 2023 20:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qv4yG-0005HL-Lo; Mon, 23 Oct 2023 20:08:32 -0400
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qv4yE-00074a-PX; Mon, 23 Oct 2023 20:08:32 -0400
Received: by mail-vk1-xa29.google.com with SMTP id
 71dfb90a1353d-49b289adca9so1459606e0c.3; 
 Mon, 23 Oct 2023 17:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698106108; x=1698710908; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YGMsZKaQ9t9qa9M5lA5PronMXko+31Jm2ENKPSXg7zE=;
 b=I5PI69TR8JMKQoY/0CXdlt6oXHY2WsjjXFspKyzWSIYWDCNwGbprI7B4jpm2KAodzS
 n3LqKeBKKOILr/PeN3Jh1qhZmNswErCrhy1QwIp2M+gKUpX2wczB2M3sJny5+xM69Osd
 gX4ToFGDWkF1q0s4pdRvfEyb8C4kui20S99W1K86Iit6Xg7YuFNpXQpWrMRXzaGnuVZg
 5zlpPCwT2EB7N57EQnTMplJDF1ukZHi6o5IzxOf806B8IjfU/dElvYar4OzXQQsaMW00
 8VrIZUJHjAj5rvzj61++WeFaxdbp6V/psqELkMfMeOlTy6OtsJ9+qZ5xeVvf1LRTTcJ2
 spgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698106108; x=1698710908;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YGMsZKaQ9t9qa9M5lA5PronMXko+31Jm2ENKPSXg7zE=;
 b=UalwVacIMeF3cFOK7E79l8HGxh9mSHgYc3DAL02HQK81izJIFzklQJcPc2Yei+AUwI
 I2Als8YaJIBAaCLayAsYSuxsu1cYIh3oWbTvElJSw9lAyGRESaZHh+/6eBEIHqCQzrsa
 IxKBTT6SVmZPCTok+IE7togvJ4PguVaHSTJkPcMLFt9HH1hwpVczHty6clAweLhAPJs5
 8JFxYE1Om/oGyHMk35w3LxVunc1ZXusy7u44Brhus/BP1mjh9+HjZ3lQY6NwmiXHn7ye
 F2fwlGVu2YZQmXwFfZeZyVO51UDX+NwkqHno4bTICm9SShWIvdXbT1nx08SlhL/6wpZg
 Zhjw==
X-Gm-Message-State: AOJu0Yxe8Jbbq20v2xVuNLsIbfPih7mOMp8w7p0IBqGbJCvD5zH/Md5A
 wE7EMkHNL3UzHOcag1vQ4XXPXB1bGcYMT12AGZg=
X-Google-Smtp-Source: AGHT+IEHO/ripaNEFHdPwA1cmEnc39etO72pYyK8AqHtESsW9XxhK2D28vdA175wUXS/zJ5fyTOAxnRahTsCHH3zIFM=
X-Received: by 2002:a05:6122:178f:b0:495:3d9d:535c with SMTP id
 o15-20020a056122178f00b004953d9d535cmr10486485vkf.4.1698106106735; Mon, 23
 Oct 2023 17:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
 <20231019132648.23703-5-sunilvl@ventanamicro.com>
In-Reply-To: <20231019132648.23703-5-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Oct 2023 10:07:59 +1000
Message-ID: <CAKmqyKMQvv9NCPGiBmP7iEognBg8Bhezja4yv7Km8xCURNNCng@mail.gmail.com>
Subject: Re: [PATCH v3 04/12] hw/riscv/virt-acpi-build.c: Add AIA support in
 RINTC
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a29;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa29.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Oct 19, 2023 at 11:28=E2=80=AFPM Sunil V L <sunilvl@ventanamicro.co=
m> wrote:
>
> Update the RINTC structure in MADT with AIA related fields.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt-acpi-build.c | 66 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 62 insertions(+), 4 deletions(-)
>
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index d8772c2821..073c85f327 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -38,6 +38,7 @@
>  #include "hw/intc/riscv_aclint.h"
>
>  #define ACPI_BUILD_TABLE_SIZE             0x20000
> +#define ACPI_BUILD_INTC_ID(socket, index) ((socket << 24) | (index))
>
>  typedef struct AcpiBuildState {
>      /* Copy of table in RAM (for patching) */
> @@ -58,18 +59,42 @@ static void acpi_align_size(GArray *blob, unsigned al=
ign)
>  }
>
>  static void riscv_acpi_madt_add_rintc(uint32_t uid,
> +                                      uint32_t local_cpu_id,
>                                        const CPUArchIdList *arch_ids,
> -                                      GArray *entry)
> +                                      GArray *entry,
> +                                      RISCVVirtAIAType aia_type,
> +                                      uint64_t imsic_addr,
> +                                      uint32_t imsic_size)
>  {
>      uint64_t hart_id =3D arch_ids->cpus[uid].arch_id;
>
>      build_append_int_noprefix(entry, 0x18, 1);       /* Type     */
> -    build_append_int_noprefix(entry, 20, 1);         /* Length   */
> +    build_append_int_noprefix(entry, 36, 1);         /* Length   */
>      build_append_int_noprefix(entry, 1, 1);          /* Version  */
>      build_append_int_noprefix(entry, 0, 1);          /* Reserved */
>      build_append_int_noprefix(entry, 0x1, 4);        /* Flags    */
>      build_append_int_noprefix(entry, hart_id, 8);    /* Hart ID  */
>      build_append_int_noprefix(entry, uid, 4);        /* ACPI Processor U=
ID */
> +    /* External Interrupt Controller ID */
> +    if (aia_type =3D=3D VIRT_AIA_TYPE_APLIC) {
> +        build_append_int_noprefix(entry,
> +                                  ACPI_BUILD_INTC_ID(
> +                                      arch_ids->cpus[uid].props.node_id,
> +                                      local_cpu_id),
> +                                  4);
> +    } else {
> +        build_append_int_noprefix(entry, 0, 4);
> +    }
> +
> +    if (aia_type =3D=3D VIRT_AIA_TYPE_APLIC_IMSIC) {
> +        /* IMSIC Base address */
> +        build_append_int_noprefix(entry, imsic_addr, 8);
> +        /* IMSIC Size */
> +        build_append_int_noprefix(entry, imsic_size, 4);
> +    } else {
> +        build_append_int_noprefix(entry, 0, 8);
> +        build_append_int_noprefix(entry, 0, 4);
> +    }
>  }
>
>  static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
> @@ -77,6 +102,11 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtS=
tate *s)
>      MachineClass *mc =3D MACHINE_GET_CLASS(s);
>      MachineState *ms =3D MACHINE(s);
>      const CPUArchIdList *arch_ids =3D mc->possible_cpu_arch_ids(ms);
> +    uint64_t imsic_socket_addr, imsic_addr;
> +    uint8_t  guest_index_bits;
> +    uint32_t imsic_size, local_cpu_id, socket_id;
> +
> +    guest_index_bits =3D imsic_num_bits(s->aia_guests + 1);
>
>      for (int i =3D 0; i < arch_ids->len; i++) {
>              Aml *dev;
> @@ -87,8 +117,19 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtS=
tate *s)
>              aml_append(dev, aml_name_decl("_UID",
>                         aml_int(arch_ids->cpus[i].arch_id)));
>
> +            socket_id =3D arch_ids->cpus[i].props.node_id;
> +            local_cpu_id =3D (arch_ids->cpus[i].arch_id -
> +                            riscv_socket_first_hartid(ms, socket_id)) %
> +                            riscv_socket_hart_count(ms, socket_id);
>              /* build _MAT object */
> -            riscv_acpi_madt_add_rintc(i, arch_ids, madt_buf);
> +            imsic_socket_addr =3D s->memmap[VIRT_IMSIC_S].base +
> +                                (socket_id * VIRT_IMSIC_GROUP_MAX_SIZE);
> +            imsic_addr =3D imsic_socket_addr +
> +                         local_cpu_id * IMSIC_HART_SIZE(guest_index_bits=
);
> +            imsic_size =3D IMSIC_HART_SIZE(guest_index_bits);
> +
> +            riscv_acpi_madt_add_rintc(i, local_cpu_id, arch_ids, madt_bu=
f,
> +                                      s->aia_type, imsic_addr, imsic_siz=
e);
>              aml_append(dev, aml_name_decl("_MAT",
>                                            aml_buffer(madt_buf->len,
>                                            (uint8_t *)madt_buf->data)));
> @@ -227,6 +268,7 @@ static void build_dsdt(GArray *table_data,
>   * 5.2.12 Multiple APIC Description Table (MADT)
>   * REF: https://github.com/riscv-non-isa/riscv-acpi/issues/15
>   *      https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2=
l/view
> + *      https://drive.google.com/file/d/1oMGPyOD58JaPgMl1pKasT-VKsIKia7z=
R/view
>   */
>  static void build_madt(GArray *table_data,
>                         BIOSLinker *linker,
> @@ -235,6 +277,12 @@ static void build_madt(GArray *table_data,
>      MachineClass *mc =3D MACHINE_GET_CLASS(s);
>      MachineState *ms =3D MACHINE(s);
>      const CPUArchIdList *arch_ids =3D mc->possible_cpu_arch_ids(ms);
> +    uint64_t imsic_socket_addr, imsic_addr;
> +    uint8_t  guest_index_bits;
> +    uint32_t imsic_size;
> +    uint32_t local_cpu_id, socket_id;
> +
> +    guest_index_bits =3D imsic_num_bits(s->aia_guests + 1);
>
>      AcpiTable table =3D { .sig =3D "APIC", .rev =3D 6, .oem_id =3D s->oe=
m_id,
>                          .oem_table_id =3D s->oem_table_id };
> @@ -246,7 +294,17 @@ static void build_madt(GArray *table_data,
>
>      /* RISC-V Local INTC structures per HART */
>      for (int i =3D 0; i < arch_ids->len; i++) {
> -        riscv_acpi_madt_add_rintc(i, arch_ids, table_data);
> +        socket_id =3D arch_ids->cpus[i].props.node_id;
> +        local_cpu_id =3D (arch_ids->cpus[i].arch_id -
> +                       riscv_socket_first_hartid(ms, socket_id)) %
> +                       riscv_socket_hart_count(ms, socket_id);
> +        imsic_socket_addr =3D s->memmap[VIRT_IMSIC_S].base +
> +                            (socket_id * VIRT_IMSIC_GROUP_MAX_SIZE);
> +        imsic_addr =3D imsic_socket_addr +
> +                     local_cpu_id * IMSIC_HART_SIZE(guest_index_bits);
> +        imsic_size =3D IMSIC_HART_SIZE(guest_index_bits);
> +        riscv_acpi_madt_add_rintc(i, local_cpu_id, arch_ids, table_data,
> +                                  s->aia_type, imsic_addr, imsic_size);
>      }
>
>      acpi_table_end(linker, &table);
> --
> 2.34.1
>
>

