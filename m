Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D87C83F10
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 11:34:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbfwV-0002M1-0a; Thu, 31 Aug 2023 07:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbfwT-0002HY-Ab
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 07:34:29 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbfwQ-0007j6-2H
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 07:34:29 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-99bf1f632b8so82305366b.1
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 04:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693481664; x=1694086464; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UeujAOT+IY4z0mN0+1iXiGPfI2w/z6g9XMPJjB/4cJ4=;
 b=FChI7H97AUhYf+y1hW7vocRRq+mg6bFzSFgEKut3ojAb1tGZ5u/tfe1syjlpuAYd+I
 JFUmVlv/eOldENhFXEhAJO/wu45tA9KajcIn/mZnEF9dgP1epCPuweE8BeLVGh5fXvg0
 0M47/Ezc0b/jf9QR1Fn+1xC5oD6ANnjS4rNDj7a/Rg3+VT1f0f3CKIUIFQjhxcWm9x3j
 ZBhYIkeAJH5l93xQGGdekxZLvtsWQcLE5yxo+WstsiuuXXlOFzO+HsLDtQrHycplPGd7
 wSiJliyBzXHcoBdOLZ4n1a8BtVBFIexlNDK/o5b1ZJi6j1W+6vERxzKkV2JWusN0XmL/
 qpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693481664; x=1694086464;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UeujAOT+IY4z0mN0+1iXiGPfI2w/z6g9XMPJjB/4cJ4=;
 b=ZiNTxNUt3PXhMEowtKvyhRwNQuBDpQjTInMUqXrqV5okuHpaBIP689ZlhaLFD+GkNB
 IX6sd/34ur2mEf+SZKSmswLz6+WBwg7SjccICxXmC4bZmkYI1rgza90MKAYptXYynkJJ
 +SX7EDouskeMQU7KaGSh6h/S82UGewF2qus3uFSfzDg4tliNqQitEA1O6cYnFWJQlBeS
 wuovkb9KgjCA/Mgj2GU4p9pf0+ys1G0F2Gnwq9QUO1U7DmvOoehNXdoqytWdN1YnhhET
 RlYKLX2G77j8is9Qxf1YQxHTs/EP6fkfwaA2vdNPDzIIatOFt/0tY4S6XrhoK++y+bVg
 aR1A==
X-Gm-Message-State: AOJu0Yxr2Q0pvjPX/Ol++jJ9ZvFsSvBifDd7wVe2nvBrBElCNHxFQ4H8
 xyVpreevJZZXF7cm/0ZlA3oRXQ==
X-Google-Smtp-Source: AGHT+IFd03cNSDna4KwUkCI8s/kHHFoEKH71IBAYBLKyDEmprybHOoJ/EthsVU9xuUS2WvSieZF2Xg==
X-Received: by 2002:a17:906:5a51:b0:9a1:edfd:73b2 with SMTP id
 my17-20020a1709065a5100b009a1edfd73b2mr3963081ejc.2.1693481664636; 
 Thu, 31 Aug 2023 04:34:24 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a170906a40d00b0099bc0daf3d7sm661633ejz.182.2023.08.31.04.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 04:34:24 -0700 (PDT)
Date: Thu, 31 Aug 2023 13:34:23 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 13/20] target/riscv/kvm: refactor
 kvm_riscv_init_user_properties()
Message-ID: <20230831-c901e15b4e101f60d7e76267@orel>
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
 <20230825130853.511782-14-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825130853.511782-14-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x631.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Aug 25, 2023 at 10:08:46AM -0300, Daniel Henrique Barboza wrote:
> The function is doing way more than just init user properties. We would
> also like to use the 'user_extension_properties' class property, as the
> TCG driver is already using, to decide whether KVM should expose user
> properties or not.
> 
> Rename kvm_riscv_init_user_properties() to riscv_init_kvm_registers()
> and leave only the essential, non-optional KVM init functions there. All
> functions that deals with property handling is now gated via
> rcc->user_extension_properties.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/kvm/kvm-cpu.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 3c4fa43cee..85e8b0a927 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -792,7 +792,7 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu, KVMScratchCPU *kvmcpu)
>      }
>  }
>  
> -static void riscv_init_user_properties(Object *cpu_obj)
> +static void riscv_init_kvm_registers(Object *cpu_obj)
>  {
>      RISCVCPU *cpu = RISCV_CPU(cpu_obj);
>      KVMScratchCPU kvmcpu;
> @@ -801,7 +801,6 @@ static void riscv_init_user_properties(Object *cpu_obj)
>          return;
>      }
>  
> -    kvm_riscv_add_cpu_user_properties(cpu_obj);
>      kvm_riscv_init_machine_ids(cpu, &kvmcpu);
>      kvm_riscv_init_misa_ext_mask(cpu, &kvmcpu);
>      kvm_riscv_init_multiext_cfg(cpu, &kvmcpu);
> @@ -1295,16 +1294,20 @@ DEFINE_TYPES(riscv_kvm_cpu_type_infos)
>  static void kvm_cpu_instance_init(CPUState *cs)
>  {
>      Object *obj = OBJECT(RISCV_CPU(cs));
> +    RISCVCPUClass *rcc = RISCV_CPU_GET_CLASS(obj);
>      DeviceState *dev = DEVICE(obj);
>  
> -    riscv_init_user_properties(obj);
> +    riscv_init_kvm_registers(obj);
>  
> -    riscv_add_satp_mode_properties(obj);
> -    riscv_cpu_add_misa_properties(obj);
> +    if (rcc->user_extension_properties) {
> +        kvm_riscv_add_cpu_user_properties(obj);
> +        riscv_add_satp_mode_properties(obj);
> +        riscv_cpu_add_misa_properties(obj);
>  
> -    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_extensions);
> -    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_vendor_exts);
> -    riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_experimental_exts);
> +        riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_extensions);
> +        riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_vendor_exts);
> +        riscv_cpu_add_kvm_unavail_prop_array(obj, riscv_cpu_experimental_exts);
> +    }
>  
>      for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
>          /* Check if we have a specific KVM handler for the option */
> -- 
> 2.41.0
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

