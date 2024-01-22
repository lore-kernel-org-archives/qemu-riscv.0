Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E5AC4725D
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 10:00:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRr5t-00021Q-UI; Mon, 22 Jan 2024 04:59:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rRr5k-00020R-SZ
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 04:59:47 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rRr5d-0005BF-CN
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 04:59:44 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40e7065b692so33051625e9.3
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 01:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705917576; x=1706522376; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YzBaB2zXhfQEnjLxQ88H6/xMG61GnUtc5KnN+o1chf4=;
 b=m7PMooyZhkfgbyDoKktvWHC7EeLPkmVhFHjYu7AMkyOctNeJXjt6izOSG5y3xy6jg6
 aVOUr3nzMkhhyoCFmiDQ+m54QqWsOHIx2E2EefHoZbxzeFdMWMLkt5nYxOrTHyXYudPJ
 r3Q7dt3CsO5SlDXSW/EGfIJn74qn+o5O0XKOYE5iqrWMMhbLOH3rr+INc0gMcP0FTnVG
 M1n7wLQKx2A0QLkecpX/9bQQQyHc/2nCnXYxgcfJoyKUgv1ZvliQgpsfNnEx1Kbz0KYf
 b/6Xbgu8NpZA2fF6xY6GNVgI/sh6YWo0QdOFM79S7C5w7oETKMewxpuM/1mTb7+MsV7B
 6O1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705917576; x=1706522376;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YzBaB2zXhfQEnjLxQ88H6/xMG61GnUtc5KnN+o1chf4=;
 b=oFj18dTONlfzBIn8zJka3wm8e9tRwbGg7SihN8Fi14/RpW6bPWM0xfmc/+g6oCHFiS
 mCTaLnL/XDS2Hq2HXZvUCvuTiu/xbxF9wWgjvEbUCJtfbT5mbnnkIJwiSnhvUPj+FUfY
 OLkZ0TrDU44nP3wf/MVi6nzcMNfWxwG+zQD1uiqYOp7MqDDw7AwwCZeT86bljtsHuIbt
 t4QjT2z9GtJKNvetz5bMbhK2wprBFafgZt/vpptdGpjWc6xrXPM18gVPyTzhEoutQdlC
 UhPIu5fiVzYyhYsd5o6UiedkDaNZh8TLxaAoD8r8ZG++egPLc4HJc7Inh877eaxW60iA
 0lGw==
X-Gm-Message-State: AOJu0YzAS05lpcbB0M8CmuIbSWJdbSGodPwWGqdYohQoOr/33Sg73F9A
 c+rCDowzqkx072RWrIBU0oDf6yufF1j2zWFlhHLRoBJi8HHKy72IO98lVbUiQEw=
X-Google-Smtp-Source: AGHT+IHR4gOVbyqnsHkGNgKB/4NBf8NkiOHpL2w1ejuE4mPRxeyOuZq3QObK6pvFg/q1OU8Wm0lO5Q==
X-Received: by 2002:a05:600c:1910:b0:40e:6238:e9e8 with SMTP id
 j16-20020a05600c191000b0040e6238e9e8mr1977177wmq.1.1705917575711; 
 Mon, 22 Jan 2024 01:59:35 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c499100b0040d6e07a147sm37168805wmp.23.2024.01.22.01.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 01:59:35 -0800 (PST)
Date: Mon, 22 Jan 2024 10:59:34 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Ani Sinha <anisinha@redhat.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/4] smbios: add processor-family option
Message-ID: <20240122-fc45cc3b5ca202246cb66e4d@orel>
References: <20231229120724.41383-1-heinrich.schuchardt@canonical.com>
 <20231229120724.41383-2-heinrich.schuchardt@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231229120724.41383-2-heinrich.schuchardt@canonical.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x331.google.com
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

On Fri, Dec 29, 2023 at 01:07:21PM +0100, Heinrich Schuchardt wrote:
> For RISC-V the SMBIOS standard requires specific values of the processor
> family value depending on the bitness of the CPU.
> 
> Add a processor-family option for SMBIOS table 4.
> 
> The value of processor-family may exceed 255 and therefore must be provided
> in the Processor Family 2 field. Set the Processor Family field to 0xFE
> which signals that the Processor Family 2 is used.
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
> v2:
> 	new patch
> ---
>  hw/smbios/smbios.c | 13 +++++++++++--
>  qemu-options.hx    |  4 ++--
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 2a90601ac5..647bc6d603 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -102,6 +102,7 @@ static struct {
>  #define DEFAULT_CPU_SPEED 2000
>  
>  static struct {
> +    uint16_t processor_family;
>      const char *sock_pfx, *manufacturer, *version, *serial, *asset, *part;
>      uint64_t max_speed;
>      uint64_t current_speed;
> @@ -110,6 +111,7 @@ static struct {
>      .max_speed = DEFAULT_CPU_SPEED,
>      .current_speed = DEFAULT_CPU_SPEED,
>      .processor_id = 0,
> +    .processor_family = 0x01, /* Other */
>  };
>  
>  struct type8_instance {
> @@ -337,6 +339,10 @@ static const QemuOptDesc qemu_smbios_type4_opts[] = {
>          .name = "part",
>          .type = QEMU_OPT_STRING,
>          .help = "part number",
> +    }, {
> +        .name = "processor-family",
> +        .type = QEMU_OPT_NUMBER,
> +        .help = "processor family",
>      }, {
>          .name = "processor-id",
>          .type = QEMU_OPT_NUMBER,
> @@ -726,7 +732,7 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
>      snprintf(sock_str, sizeof(sock_str), "%s%2x", type4.sock_pfx, instance);
>      SMBIOS_TABLE_SET_STR(4, socket_designation_str, sock_str);
>      t->processor_type = 0x03; /* CPU */
> -    t->processor_family = 0x01; /* Other */
> +    t->processor_family = 0xfe; /* use Processor Family 2 field */
>      SMBIOS_TABLE_SET_STR(4, processor_manufacturer_str, type4.manufacturer);
>      if (type4.processor_id == 0) {
>          t->processor_id[0] = cpu_to_le32(smbios_cpuid_version);
> @@ -758,7 +764,7 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
>      t->thread_count = (threads_per_socket > 255) ? 0xFF : threads_per_socket;
>  
>      t->processor_characteristics = cpu_to_le16(0x02); /* Unknown */
> -    t->processor_family2 = cpu_to_le16(0x01); /* Other */
> +    t->processor_family2 = cpu_to_le16(type4.processor_family);
>  
>      if (tbl_len == SMBIOS_TYPE_4_LEN_V30) {
>          t->core_count2 = t->core_enabled2 = cpu_to_le16(cores_per_socket);
> @@ -1402,6 +1408,9 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
>                  return;
>              }
>              save_opt(&type4.sock_pfx, opts, "sock_pfx");
> +            type4.processor_family = qemu_opt_get_number(opts,
> +                                                         "processor-family",
> +                                                         0x01 /* Other */);
>              save_opt(&type4.manufacturer, opts, "manufacturer");
>              save_opt(&type4.version, opts, "version");
>              save_opt(&type4.serial, opts, "serial");
> diff --git a/qemu-options.hx b/qemu-options.hx
> index b66570ae00..7bdb414345 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2694,7 +2694,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
>      "                specify SMBIOS type 3 fields\n"
>      "-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str]\n"
>      "              [,asset=str][,part=str][,max-speed=%d][,current-speed=%d]\n"
> -    "              [,processor-id=%d]\n"
> +    "              [,processor-family=%d,processor-id=%d]\n"
>      "                specify SMBIOS type 4 fields\n"
>      "-smbios type=8[,external_reference=str][,internal_reference=str][,connector_type=%d][,port_type=%d]\n"
>      "                specify SMBIOS type 8 fields\n"
> @@ -2722,7 +2722,7 @@ SRST
>  ``-smbios type=3[,manufacturer=str][,version=str][,serial=str][,asset=str][,sku=str]``
>      Specify SMBIOS type 3 fields
>  
> -``-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str][,asset=str][,part=str][,processor-id=%d]``
> +``-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str][,asset=str][,part=str][,processor-family=%d][,processor-id=%d]``
>      Specify SMBIOS type 4 fields
>  
>  ``-smbios type=11[,value=str][,path=filename]``
> -- 
> 2.43.0
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

