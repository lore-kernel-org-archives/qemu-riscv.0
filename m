Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F5DC54E49
	for <qemu-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 07:17:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rh2Zk-0002e8-6b; Mon, 04 Mar 2024 02:17:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rh2Za-0002aK-Bc
 for qemu-riscv@nongnu.org; Mon, 04 Mar 2024 02:17:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rh2ZX-0006ty-8c
 for qemu-riscv@nongnu.org; Mon, 04 Mar 2024 02:17:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709536634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vzl7GzI01woivFg5X9n6ZsEUFdVMLXkfjWIveDfAc8A=;
 b=HFmpXkiBehzs+uTXGHPoNkHT6VsouB3E+SIFCsJ+Mw4viHxgtQEFZAvyly99NPxOX0bVPB
 wLNUneeMrLpOtcrR8B+Yn4e8+KvHdhKmG5AXIXvYpOKT3i/3FjK0rbQw8NNcdqS4Wpxi6m
 mtE/wgn/JMG5r9i57pRrppeRWAmtZPs=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-MLAGGf5OOFqgLFEGCPpdbQ-1; Mon, 04 Mar 2024 02:17:12 -0500
X-MC-Unique: MLAGGf5OOFqgLFEGCPpdbQ-1
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-6e46420dca9so3691898a34.3
 for <qemu-riscv@nongnu.org>; Sun, 03 Mar 2024 23:17:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709536631; x=1710141431;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vzl7GzI01woivFg5X9n6ZsEUFdVMLXkfjWIveDfAc8A=;
 b=FRbi2mgIslyAtV+wqgbCMdL44Uef2f2sAZMhzBy8vL5gkQjwRa1qyz39mu0nHZvtM5
 EuW13/LmXf7Hqp5frxynMijD9TB69pw9fa8p30HSGWuc8iAFV49Atk2RhJdjcFHTNpKQ
 JCO2A16/fMxkZZFzxMTSrlBrBOvU7E/tBm3ibPPD/zhjU9cet5y54/9nWwKs6QDD7Hhd
 dfM+pJa0q5F1B16bdt0GoSQA1+DmlRJuh+nomsM7XEcaCwkDXgBiFyhNeCKAFUMTXybf
 Jz6LSYcdFmj2TLy3LFPxR2l5V4M3WJZ8S4Kwr1F1iOO4s2CviVBuI3ThQkvSNlXhQ7jD
 4iWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6rlbRKyWJRxgt4onxjizsKqHAaGbsUd1pzq3zgiYG2KL83xpEgeA6Zh4r2vN56hvRIowg3HfVJkK+9ddlSHI+pogDmr4=
X-Gm-Message-State: AOJu0YykWxDgtpG2qMdJgq5Eyv+2W9B1WjsJ3EdqRY0YOzeXvgTb8G8u
 EAL+D92REWw3d0psxqnnyfOinpN0w/V3qNpYI2pHdEqCIitkbEJHH7fV5SsT+l0EBIG0Mco3drA
 LXrh/JCHrPIEYGypum7WST7MBwMTwz6NqLQ4IOKHyHVYLkS6t9VQB
X-Received: by 2002:a05:6358:98a8:b0:17b:f73c:9e0 with SMTP id
 q40-20020a05635898a800b0017bf73c09e0mr10142356rwa.12.1709536631387; 
 Sun, 03 Mar 2024 23:17:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJ57VzJ/uFH4XcX6dJK1LX+o8INtlZVhOPXPmueDCC82gguLcKMsUB8R1Nq4PUKrqxombtdg==
X-Received: by 2002:a05:6358:98a8:b0:17b:f73c:9e0 with SMTP id
 q40-20020a05635898a800b0017bf73c09e0mr10142336rwa.12.1709536630989; 
 Sun, 03 Mar 2024 23:17:10 -0800 (PST)
Received: from fc37-ani ([115.96.159.226])
 by smtp.googlemail.com with ESMTPSA id
 w26-20020a05620a149a00b00787af8b5c02sm4091738qkj.39.2024.03.03.23.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Mar 2024 23:17:10 -0800 (PST)
Date: Mon, 4 Mar 2024 12:46:57 +0530 (IST)
From: Ani Sinha <anisinha@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com, 
 mst@redhat.com, gaosong@loongson.cn, alistair.francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, liwei1518@gmail.com, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, philmd@linaro.org, 
 wangyanan55@huawei.com, eblake@redhat.com, armbru@redhat.com, 
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, f.ebner@proxmox.com
Subject: Re: [PATCH 08/19] smbios: don't check type4 structures in legacy mode
In-Reply-To: <20240227154749.1818189-9-imammedo@redhat.com>
Message-ID: <2768a457-dc48-4837-15d0-282da1fbec78@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
 <20240227154749.1818189-9-imammedo@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.589,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



On Tue, 27 Feb 2024, Igor Mammedov wrote:

> legacy mode doesn't support structures of type 2 and more,
> and CLI has a check for '-smbios type' option, however it's
> still possible to sneak in type4 as a blob with '-smbios file'
> option. However doing the later makes SMBIOS tables broken
> since SeaBIOS doesn't expect that.
>
> Rather than trying to add support for type4 to legacy code
> (both QEMU and SeaBIOS), simplify smbios_get_table_legacy()
> by dropping not relevant check in legacy code and error out
> on type4 blob.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
>  * The issue affects 'isapc' and pc-i440fx-2.0. the later is
>    in deprecated state and to be dropped in near future
>  * possibly the same issue applies to other SMBIOS types above type 1
>    but I haven't tested that, and well tables that aren't
>    generated by SeaBIOS can get be added just fine
>    (tested type11 blob). So I went with a minimal change
>    to fixup type4 only that I'm touching. Leaving the rest
>    for other time or when someone complains about it, which is
>    very unlikely given it's really only remaining isapc machine.
>
>    I'd very much prefer to deprecate 'isapc' and then drop
>    all legacy related code (it will benefit not only SMBIOS
>    but other code as well).
>    BTW: 'isapc' is in semi-dead, I cna't boot RHEL6 on it
>    with KVM enabled anymore (RHEL9 host), TCG still boots though.
>    One more reason to get deprecate it.
> ---
>  include/hw/firmware/smbios.h |  2 +-
>  hw/i386/fw_cfg.c             |  3 +--
>  hw/smbios/smbios.c           | 18 ++++++++++++++----
>  3 files changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
> index 0818184834..1fbff3c55f 100644
> --- a/include/hw/firmware/smbios.h
> +++ b/include/hw/firmware/smbios.h
> @@ -296,7 +296,7 @@ void smbios_set_defaults(const char *manufacturer, const char *product,
>                           const char *version,
>                           bool uuid_encoded, SmbiosEntryPointType ep_type);
>  void smbios_set_default_processor_family(uint16_t processor_family);
> -uint8_t *smbios_get_table_legacy(uint32_t expected_t4_count, size_t *length);
> +uint8_t *smbios_get_table_legacy(size_t *length);
>  void smbios_get_tables(MachineState *ms,
>                         const struct smbios_phys_mem_area *mem_array,
>                         const unsigned int mem_array_size,
> diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
> index c1e9c0fd9c..d1281066f4 100644
> --- a/hw/i386/fw_cfg.c
> +++ b/hw/i386/fw_cfg.c
> @@ -71,8 +71,7 @@ void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg)
>      smbios_set_cpuid(cpu->env.cpuid_version, cpu->env.features[FEAT_1_EDX]);
>
>      if (pcmc->smbios_legacy_mode) {
> -        smbios_tables = smbios_get_table_legacy(ms->smp.cpus,
> -                                                &smbios_tables_len);
> +        smbios_tables = smbios_get_table_legacy(&smbios_tables_len);
>          fw_cfg_add_bytes(fw_cfg, FW_CFG_SMBIOS_ENTRIES,
>                           smbios_tables, smbios_tables_len);
>          return;
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index aa2cc5bdbd..97cf762228 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -482,14 +482,17 @@ opts_init(smbios_register_config);
>   */
>  #define SMBIOS_21_MAX_TABLES_LEN 0xffff
>
> -static void smbios_validate_table(uint32_t expected_t4_count)
> +static void smbios_check_type4_count(uint32_t expected_t4_count)
>  {
>      if (smbios_type4_count && smbios_type4_count != expected_t4_count) {
>          error_report("Expected %d SMBIOS Type 4 tables, got %d instead",
>                       expected_t4_count, smbios_type4_count);
>          exit(1);
>      }
> +}
>
> +static void smbios_validate_table(void)
> +{
>      if (smbios_ep_type == SMBIOS_ENTRY_POINT_TYPE_32 &&
>          smbios_tables_len > SMBIOS_21_MAX_TABLES_LEN) {
>          error_report("SMBIOS 2.1 table length %zu exceeds %d",
> @@ -574,7 +577,7 @@ static void smbios_build_type_1_fields(void)
>      }
>  }
>
> -uint8_t *smbios_get_table_legacy(uint32_t expected_t4_count, size_t *length)
> +uint8_t *smbios_get_table_legacy(size_t *length)
>  {
>      int i;
>      size_t usr_offset;
> @@ -587,6 +590,12 @@ uint8_t *smbios_get_table_legacy(uint32_t expected_t4_count, size_t *length)
>          exit(1);
>      }
>
> +    if (test_bit(4, have_binfile_bitmap)) {
> +        error_report("can't process table for smbios "
> +                     "type 4 on machine versions < 2.1!");
> +        exit(1);
> +    }
> +
>      g_free(smbios_entries);
>      smbios_entries_len = sizeof(uint16_t);
>      smbios_entries = g_malloc0(smbios_entries_len);
> @@ -613,7 +622,7 @@ uint8_t *smbios_get_table_legacy(uint32_t expected_t4_count, size_t *length)
>
>      smbios_build_type_0_fields();
>      smbios_build_type_1_fields();
> -    smbios_validate_table(expected_t4_count);
> +    smbios_validate_table();
>      *length = smbios_entries_len;
>      return smbios_entries;
>  }
> @@ -1180,7 +1189,8 @@ void smbios_get_tables(MachineState *ms,
>      smbios_build_type_41_table(errp);
>      smbios_build_type_127_table();
>
> -    smbios_validate_table(ms->smp.sockets);
> +    smbios_check_type4_count(ms->smp.sockets);
> +    smbios_validate_table();
>      smbios_entry_point_setup();
>
>      /* return tables blob and entry point (anchor), and their sizes */
> --
> 2.39.3
>
>


