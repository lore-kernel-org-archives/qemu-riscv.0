Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37237C001DC
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 18:07:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qMuWs-0003SN-1j; Fri, 21 Jul 2023 14:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qMuWr-0003S7-IG
 for qemu-riscv@nongnu.org; Fri, 21 Jul 2023 14:07:01 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qMuWp-00066G-SC
 for qemu-riscv@nongnu.org; Fri, 21 Jul 2023 14:07:01 -0400
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b734aea34aso32765751fa.0
 for <qemu-riscv@nongnu.org>; Fri, 21 Jul 2023 11:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689962818; x=1690567618;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FJ/E6Ov3CfrZi46Zkx9g+zod3BBOILtbXBx5cNUe9HU=;
 b=STrFLm6uDXQE5prOTjKW4G3HzMhcdNWaBmwCZhxOTtRUle89lpNJsU5gngAKMVpKGU
 BI+nv+/z2mKRLcHjQfRz+/8eDglbASC+hY8Y74QdFgKmWbV4vLTRMM2f2WBeYQRJPfBz
 u8ge64/rBS4+ofuyYN7A0IBJL1dVIBEnFdlQkdHdK7x/GwQ22arFYk/HcRF+p+384d9D
 87wQvflIYkEfI65yBUfUXzKjkrhtGgkT1hgbQV5qI0e3cWVsCbaFoi1fj/uq1guTarVG
 Y1PJCg+08q7Ht1uQmRWD22iZuav41thTho48QnD7RZRYumsxahCjrkKYkbfo3ek+CRCw
 42Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689962818; x=1690567618;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FJ/E6Ov3CfrZi46Zkx9g+zod3BBOILtbXBx5cNUe9HU=;
 b=GNww9W+HZMFRlRGo/lx+oVZfGptWdxhgyOzcgZTCKoiI+WmjB6d5lvJFtwrd/aZ4s9
 Y54I5O8JSZMQ+PbTlCZ01yriy1qs+G/4QbTPCoE/M68+FLwwiqyXcCNhe4OCEXFKgCx+
 igade3qTizjNHFv94nuHxnpIvRX/EyuDxgVHj9Il7/GsWrgcqZ7+Sq0H4+Q11RUJjMKc
 M4YcZphtBf90b0vEZRU2MPSQq9UnaMZ1IiMuYjBSU0kC/D3YwPI04JuXwcp51Iuu9nra
 Bp4H447Mqoch9g1O6i2JWGNmDXMgzvgpsmmige5geNKmbInPV4W8twYa9VTya3+hNreE
 Q3wg==
X-Gm-Message-State: ABy/qLYfpcP3SKj2U4KtUi+mQLTOjD04C6Cvn9ZlcVRIz2DYtrhiceJd
 FvOiwi7YqzH/tpiBBuA2u6nCsQ==
X-Google-Smtp-Source: APBJJlHoBzpHP/vKowoOp7GQ2v7UMio0kyRxt9itPMMSRqOQUH9tqImEXsiHRb8Aesf2dt+8hp1vWA==
X-Received: by 2002:a2e:9650:0:b0:2b6:fa54:cec1 with SMTP id
 z16-20020a2e9650000000b002b6fa54cec1mr2273238ljh.48.1689962817706; 
 Fri, 21 Jul 2023 11:06:57 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a05600c4e0b00b003f7f475c3bcsm10194639wmq.1.2023.07.21.11.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 11:06:57 -0700 (PDT)
Date: Fri, 21 Jul 2023 20:06:56 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, rkanwal@rivosinc.com, 
 anup@brainfault.org, dbarboza@ventanamicro.com, atishp@atishpatra.org, 
 vincent.chen@sifive.com, greentime.hu@sifive.com, frank.chang@sifive.com, 
 jim.shu@sifive.com, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH v6 5/5] target/riscv: select KVM AIA in riscv virt machine
Message-ID: <20230721-4f5015dcef5454d421f033ea@orel>
References: <20230714084429.22349-1-yongxuan.wang@sifive.com>
 <20230714084429.22349-6-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230714084429.22349-6-yongxuan.wang@sifive.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=ajones@ventanamicro.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, Jul 14, 2023 at 08:44:27AM +0000, Yong-Xuan Wang wrote:
...
> +#if defined(CONFIG_KVM)
> +static char *virt_get_kvm_aia(Object *obj, Error **errp)
> +{
> +    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
> +
> +    return g_strdup(kvm_aia_mode_str(s->kvm_aia_mode));
> +}
> +
> +static void virt_set_kvm_aia(Object *obj, const char *val, Error **errp)
> +{
> +    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
> +
> +    if (!strcmp(val, "emul")) {
> +        s->kvm_aia_mode = KVM_DEV_RISCV_AIA_MODE_EMUL;
> +    } else if (!strcmp(val, "hwaccel")) {
> +        s->kvm_aia_mode = KVM_DEV_RISCV_AIA_MODE_HWACCEL;
> +    } else if (!strcmp(val, "auto")) {
> +        s->kvm_aia_mode = KVM_DEV_RISCV_AIA_MODE_AUTO;
> +    } else {
> +        error_setg(errp, "Invalid KVM AIA mode");
> +        error_append_hint(errp, "Valid values are emul, hwaccel, and auto.\n");
> +    }
> +}
> +#endif
> +
>  static bool virt_get_aclint(Object *obj, Error **errp)
>  {
>      RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
> @@ -1687,6 +1745,18 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      sprintf(str, "Set number of guest MMIO pages for AIA IMSIC. Valid value "
>                   "should be between 0 and %d.", VIRT_IRQCHIP_MAX_GUESTS);
>      object_class_property_set_description(oc, "aia-guests", str);
> +
> +#if defined(CONFIG_KVM)
> +    object_class_property_add_str(oc, "kvm-aia", virt_get_kvm_aia,
> +                                  virt_set_kvm_aia);
> +    object_class_property_set_description(oc, "kvm-aia",
> +                                          "Set KVM AIA mode. Valid values are "
> +                                          "emul, hwaccel, and auto. Default "
> +                                          "is auto.");
> +    object_property_set_default_str(object_class_property_find(oc, "kvm-aia"),
> +                                    "auto");

I'm starting to think the "kvm-aia" property should be renamed to
"riscv-aia" or just "aia" and added in
target/riscv/kvm.c:kvm_arch_accel_class_init() to be a riscv kvm
accelerator property instead of a virt machine property.

Thanks,
drew

> +
> +#endif
>      object_class_property_add(oc, "acpi", "OnOffAuto",
>                                virt_get_acpi, virt_set_acpi,
>                                NULL, NULL);
> diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
> index e5c474b26e..d0140feeff 100644
> --- a/include/hw/riscv/virt.h
> +++ b/include/hw/riscv/virt.h
> @@ -56,6 +56,7 @@ struct RISCVVirtState {
>      bool have_aclint;
>      RISCVVirtAIAType aia_type;
>      int aia_guests;
> +    uint64_t kvm_aia_mode;
>      char *oem_id;
>      char *oem_table_id;
>      OnOffAuto acpi;
> -- 
> 2.17.1
> 

