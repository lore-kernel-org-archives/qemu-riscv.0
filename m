Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700A4C43458
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 04:09:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgae5-0006OK-1F; Mon, 06 Jul 2026 00:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgadw-0006Ms-6u
 for qemu-riscv@nongnu.org; Mon, 06 Jul 2026 00:09:17 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgadu-0007Rz-IV
 for qemu-riscv@nongnu.org; Mon, 06 Jul 2026 00:09:15 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-697bd21fdc2so4121924a12.1
 for <qemu-riscv@nongnu.org>; Sun, 05 Jul 2026 21:09:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783310952; cv=none;
 d=google.com; s=arc-20260327;
 b=Df7syqwlnQqrMvQEmcV2WTy7nXV4vtvi2c7nhA/CP5bpa5MGNjTmywbTQ34ptYDTJd
 cwuMTsLQ55kxrQ45yktGpTg/x5wGJPCuDx4U9U7Uw8p3hPniGWNGgEcZEJyxrYbtr4wK
 mCF2klgddZkfyEN6+HlWzOj9UP2daRxaG+ltTb4rhe44ta7QZYw4waRtj27urb6oLOiV
 O6Z29ZmjZMJDhHrwqysbg/IsKaLnQ1Bv5cv7Z4irAIjNG33I2WW8aroHZwDwddWP0nFI
 ershVODMEnL5m6kuK/EIVPmTcw8FAh50fYP64qr8hbWYjgK1oWglBOWtNcOm4y+/g/y1
 NXyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=MiXEQr4owAYISSihhr8G6Y9h0iA4WKSim5kG94sRBpM=;
 fh=82Oy2QhawTFSBb4+tqaZOdl8TC/iPT0IATdAQxwdJV8=;
 b=g0dpDmIp8ohN2bATunUcGl8u/rjWIgcPdI1RIuPrQtCeXr/SsLlKLnFHhQOYyMe7N9
 Ei35ExbakKTMWqRVl4tFCTUohuAdwPtvL30iaC5RZXs6uben2xlr8pi1ZNJVfaHOj7YA
 ujB5tH3GlUObIbnclxba+LxUTSarefT95VOJmb6R/kC1xTK932pZlAf+I6Cua3K1pSP8
 vb/mgDiO1fmDRSH02eQDFJkKt+TkTYVVTO1h7n1dho8hzgLr0oyUXXjKTNR5dkCWrjrJ
 +FJN1njmFDmQE9wbkMRP44WN42eIYTCrVDQbjgIct6EeVHu8eal/o/jxTiabgXldyFzg
 P5jw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783310952; x=1783915752; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MiXEQr4owAYISSihhr8G6Y9h0iA4WKSim5kG94sRBpM=;
 b=H+o1YvEKW7zp5lzQpF05T38d5wtq9gZSl9GqEY90xpv6Wsf/M1Z6agLtQ6eKlXPvg4
 ZC7Wh/OgWknl4RXhYB5xUDNK7MsAysBh0DDHLQzZTjkJt2aMwOeTQCL/gyE0EvbKsdnZ
 S9ENKMMxMkXkzNYb35J/rJslEEKgVtQ1H1Hfj5GE/pGNaOVfBRHupbQwYvtN+PSyg2mH
 mePff+/LT6m7KkPIIN+m7q8QyzjP75tZ4F8d+xhpzW3e7N34PE060RNs97QDifNjVW59
 umFCfk5n9/XhgUnuQSszbg1zNB+aJqmN7BVMzIwJM9ZfTmYhBKZL5ZiUli1ZvXtlt4z3
 +pTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783310952; x=1783915752;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MiXEQr4owAYISSihhr8G6Y9h0iA4WKSim5kG94sRBpM=;
 b=ahB0nvCZFMoxfVKhR+RYbmAm/3AE5NM9AR6Q1cBll44PhEELjWs4eGy8dAsxpDDsdK
 qllQy8cIc+L8xR2q8FojlOMStK6/9ypn96kB0yCCivs61BDBSjVFo2Nyhu4TgLU6vOPH
 C0Ts0RjKF5XEErOPZpZFn8DxsAgy74Jzk6RE9XLj0AahJhjPhenLPL+V7Pqw0ArsmDmA
 Hp8WsJOkn6UQaeQU4rqY9KqT8SNU9p57gjHcKbISmKqZLK2cZua77zCBEafUY56y1VpO
 TdhxOsMWiUW40InAsBGEz/iuqcRood4gEzbgfEoq/4Tm2pF7vLN+ID9c2cObt1Ctv8DK
 ctBg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqtVOK4dmLaVDdrRUNYzjCSSSXmqGncka7E86/WaUflzBYLNKpFa0EanB6ZKaoC8wPESVFkoEeQhUXL@nongnu.org
X-Gm-Message-State: AOJu0YyATC+2h+Q2XpDRNEEuF0HVLSNwPuFxnGYWNI48Cg6X+ndz2mWl
 ruM44JmG0hMcuW8pENN7IvtEOu0Z+NMmedu8MCZHGCrPSN0Abr/3XJ2/6aiTr8+XEyeCefmMLMN
 e6tgh7nz5BQ7JCqkR5dTv0hW+PsalwG4=
X-Gm-Gg: AfdE7cnNo42+Hmota8UpimcUBkWMjdAR/ogEYyaqBFN3zwmGpjnpnqZfFiPIl9LFDcj
 nuh4FVjemvNJbnYkrFfoJKHz63C6BTnvyXiSgK+fMglS7CLf+gbmTHZPBEWxJsUAbrPWtTyVr3T
 soy2PYXfKXpFjp2LdXu3msxP4HB41X4Jvq2+8Up5kXIXeyQzs55l2mxMVF1S7s2jHa0fCEPK42I
 JFtyrt0NVXRGIlXLANGOYnd217Y0RFsF0xIP8LcD9wMi+L0yElKyCN0Ncgz/hMx7ZQyPfYAbQUo
 u5JXE1ZsUzMsD0mCwohX6NHIK98=
X-Received: by 2002:a05:6402:e93:b0:698:9e5e:5df8 with SMTP id
 4fb4d7f45d1cf-69a1a259f0dmr2299615a12.7.1783310952145; Sun, 05 Jul 2026
 21:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260618093827.3507-1-cp0613@linux.alibaba.com>
 <20260618093827.3507-3-cp0613@linux.alibaba.com>
In-Reply-To: <20260618093827.3507-3-cp0613@linux.alibaba.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2026 14:08:45 +1000
X-Gm-Features: AVVi8CewtI9RIpsTitTFWsRRd_ktSzcX7xuAlCj13Q8fkYKxPVLaaeH4zsp3B6I
Message-ID: <CAKmqyKNmFdJRUegowCGggk+4fOmY7vBxOH+_gnmTSpNhyqWqHg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] hw/riscv/virt-acpi-build: Add _DEP to ACPI0017 for
 CXL host bridge dependency
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: jic23@kernel.org, pbonzini@redhat.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, liwei1518@gmail.com, 
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com, 
 chao.liu.zevorn@gmail.com, sunilvl@ventanamicro.com, dave.jiang@intel.com, 
 alison.schofield@intel.com, imammedo@redhat.com, mst@redhat.com, 
 guoren@kernel.org, qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 linux-cxl@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Jun 18, 2026 at 7:40=E2=80=AFPM Chen Pei <cp0613@linux.alibaba.com>=
 wrote:
>
> On RISC-V QEMU virt platform with CXL enabled, the probe ordering
> of acpi_pci_root (ACPI0016) and cxl_acpi (ACPI0017) is not
> guaranteed. If cxl_acpi probes before acpi_pci_root has attached
> the CXL host bridges, the CXL port topology will be incomplete
> because to_cxl_host_bridge() silently skips devices whose PCI root
> is not yet ready.
>
> Add a _DEP object to the ACPI0017 device in the DSDT, declaring
> its dependency on the ACPI0016 CXL host bridge devices. This tells
> the OS to defer ACPI0017 enumeration until all ACPI0016 devices
> have been attached by acpi_pci_root.
>
> This requires a corresponding kernel change to call
> acpi_dev_clear_dependencies() in acpi_pci_root_add().

What happens to kernels that don't have this change?

Alistair

>
> The resulting DSDT fragment (iasl -d output) for a single CXL host
> bridge at bus 0x01 looks like:
>
>   Device (CXLM)
>   {
>       Name (_HID, "ACPI0017")
>       Name (_DEP, Package (0x01)
>       {
>           \_SB.PC01
>       })
>       Method (_STA, 0, NotSerialized)
>       {
>           Return (0x0B)
>       }
>       ...
>   }
>
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
>  hw/riscv/virt-acpi-build.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
> index 309d64b322..3598e55243 100644
> --- a/hw/riscv/virt-acpi-build.c
> +++ b/hw/riscv/virt-acpi-build.c
> @@ -510,6 +510,38 @@ static void build_dsdt(GArray *table_data,
>      if (s->cxl_devices_state.is_enabled) {
>          Aml *cxl_dev =3D aml_device("CXLM");
>          aml_append(cxl_dev, aml_name_decl("_HID", aml_string("ACPI0017")=
));
> +
> +        /*
> +         * Declare a _DEP on every ACPI0016 CXL host bridge so the OS
> +         * defers ACPI0017 enumeration until acpi_pci_root has attached
> +         * the CXL host bridges. Without this, cxl_acpi may probe before
> +         * to_cxl_host_bridge() can resolve the PCI root and the CXL
> +         * port topology comes up empty.
> +         */
> +        if (s->pci_bus) {
> +            PCIBus *bus;
> +            uint32_t num_cxl_hbs =3D 0;
> +
> +            QLIST_FOREACH(bus, &s->pci_bus->child, sibling) {
> +                if (pci_bus_is_root(bus) && pci_bus_is_cxl(bus)) {
> +                    num_cxl_hbs++;
> +                }
> +            }
> +
> +            if (num_cxl_hbs > 0) {
> +                Aml *dep_pkg =3D aml_package(num_cxl_hbs);
> +
> +                QLIST_FOREACH(bus, &s->pci_bus->child, sibling) {
> +                    if (pci_bus_is_root(bus) && pci_bus_is_cxl(bus)) {
> +                        aml_append(dep_pkg,
> +                                   aml_name("\\_SB.PC%.02X",
> +                                            pci_bus_num(bus)));
> +                    }
> +                }
> +                aml_append(cxl_dev, aml_name_decl("_DEP", dep_pkg));
> +            }
> +        }
> +
>          Aml *method =3D aml_method("_STA", 0, AML_NOTSERIALIZED);
>          aml_append(method, aml_return(aml_int(0x0B)));
>          aml_append(cxl_dev, method);
> --
> 2.50.1
>
>

