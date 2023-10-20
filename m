Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9100CC0032E
	for <qemu-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 20:04:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qtvjc-0003xS-Ff; Fri, 20 Oct 2023 16:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtvjb-0003ww-Id
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 16:04:39 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qtvjZ-0005tJ-0q
 for qemu-riscv@nongnu.org; Fri, 20 Oct 2023 16:04:39 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6bd96cfb99cso1084685b3a.2
 for <qemu-riscv@nongnu.org>; Fri, 20 Oct 2023 13:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697832275; x=1698437075; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3qtPEMnjbXS/VQ0mGxfdQ1sEQoiygD6WyM0+vaO1Nfk=;
 b=YE25GssFQ7OjSpJd4QUW/dB/EDWQgItawvb6WvVKJSkSTxlc7iZ1Kqo4/SV4nyl1//
 LPYKmCux1IzJbwcXUu7oVF6Qho2JXIIgtX8OJXU9UgIJHJic8a8AtfvJQbhVjfo+soI8
 V3cIk+ZsiY+S/QNTDkW2yOSbuh4XpX9ecx++w4MowDKobzpqWMD7EjqT1VDCfIHPQq3+
 cBWkbrDwIu9NgKQE53svWMiiNYoClyTlG4TkpnhoxLjwZrXWlxrDmhcclVOLKz2/dDYy
 EFIKF9ZOAhriHZz/TDXn+XSEEoE3ycPz3YVEkBEBbCRQpWfSBkam1OGkZppYBCkU6xJ0
 OlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697832275; x=1698437075;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3qtPEMnjbXS/VQ0mGxfdQ1sEQoiygD6WyM0+vaO1Nfk=;
 b=Y0cwkjLFIXML3s17azuPm3bILp2tD7/pgb5KzjqM8MF2qBfJpK0vQxwruVDjOcfOLg
 hFtbskrGxxv6Koky+3ZkkeJtRiTx+9jQO0VQtkW0i4WtkRjH8noEgq5+Ba5xyk+r2fsb
 Io9Mxpxt+QzyAN/Ze4Rml7oDEvJXgAlfqoyUGMvNcF6nF/q/RFj/B4LNlP9lM35hiSCG
 sQ/LsA8dRNFpjI82hDjY9rqwyVRHFkyvbna0adrSgDmBc6ujlP+L+cy25Dpojoj8pJod
 rB8r65LDTfpegCJCXKm9XUItAg61R70HyOzvfcRflQvavz7HW7FMl1DLjhCbxcxSY4X7
 eu8A==
X-Gm-Message-State: AOJu0YyAxxfqRBpcevy5z1It1POY1WL2yB5nyQO79C9viigVmkWWKJlX
 mPgy6AT4ynUOls+ujutIrQm5zg==
X-Google-Smtp-Source: AGHT+IH3kQysdkpr5+Ul0wEeQIjYrbDwU/oXTsFVDYHwLmNCpAEhLeUyhAyBl/MYqcrwcAbdEPHoCg==
X-Received: by 2002:a05:6a20:840b:b0:163:5bfd:ae5b with SMTP id
 c11-20020a056a20840b00b001635bfdae5bmr3477508pzd.15.1697832275500; 
 Fri, 20 Oct 2023 13:04:35 -0700 (PDT)
Received: from [192.168.68.107] ([177.45.186.249])
 by smtp.gmail.com with ESMTPSA id
 u7-20020aa78487000000b00694fee1011asm1913031pfn.208.2023.10.20.13.04.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Oct 2023 13:04:35 -0700 (PDT)
Message-ID: <56726933-267f-4018-9632-e9bf0b476901@ventanamicro.com>
Date: Fri, 20 Oct 2023 17:04:31 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/system/riscv: remove core limit from virt machine
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20231019134812.241044-1-dbarboza@ventanamicro.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231019134812.241044-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The commit title is misleading. We're not removing the core limit, we're
updating it.

I just sent a new version with an appropriate commit title. Thanks,


Daniel

On 10/19/23 10:48, Daniel Henrique Barboza wrote:
> The 'virt' RISC-V machine does not have a 8 core limit. The current
> limit is set in include/hw/riscv/virt.h, VIRT_CPUS_MAX, set to 512 at
> this moment.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1945
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   docs/system/riscv/virt.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
> index f9a2eac544..f5fa7b8b29 100644
> --- a/docs/system/riscv/virt.rst
> +++ b/docs/system/riscv/virt.rst
> @@ -12,7 +12,7 @@ Supported devices
>   
>   The ``virt`` machine supports the following devices:
>   
> -* Up to 8 generic RV32GC/RV64GC cores, with optional extensions
> +* Up to 512 generic RV32GC/RV64GC cores, with optional extensions
>   * Core Local Interruptor (CLINT)
>   * Platform-Level Interrupt Controller (PLIC)
>   * CFI parallel NOR flash memory

