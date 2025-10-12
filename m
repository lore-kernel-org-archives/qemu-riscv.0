Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55854CCD187
	for <qemu-riscv@archiver.kernel.org>; Sun, 12 Oct 2025 17:33:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v7zwu-00034L-SY; Sun, 12 Oct 2025 13:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1v7zws-00030a-Oc
 for qemu-riscv@nongnu.org; Sun, 12 Oct 2025 13:33:34 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1v7zwq-0001t8-L4
 for qemu-riscv@nongnu.org; Sun, 12 Oct 2025 13:33:34 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-781997d195aso2488218b3a.3
 for <qemu-riscv@nongnu.org>; Sun, 12 Oct 2025 10:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1760290403; x=1760895203; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TEGpWGRo/NUNYPSQgpCj3EvGvRJKceoQwqOGYtkwnZQ=;
 b=cPxSiqN5DuSUO6K2vChQ91f4cmRAW32uYzVBfneJz3cOmBY61h+NWS34C+PVaTst1T
 RR9RwAQEtql0tN/31J29QFCaOJiztsLz4JEUygkG6HyxoL/GUtl1qKc2aZSMJuJBYHeY
 SUNgDt4doho+8rRTDA+3KlMxDkR9WLcIu1l/dk7RZoFMca5xUccxK3MIHAv4by2EGFYg
 Tz3jbckpkrl6d6SLJ8GhFfXolniF4pR6p2eOq/gk5lVYDYlpFJROOxhfUZZIOTkBsc8e
 q6IE5biFGqCaz8RYuB3lwNuJl20lgixKieH4smrBHCRNwMHL9/n9ube1I1qzzf43uNwb
 jROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760290403; x=1760895203;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TEGpWGRo/NUNYPSQgpCj3EvGvRJKceoQwqOGYtkwnZQ=;
 b=QFoE03e/lW2s70Khf5Du5/vI6FjC8j7rbnonUZbOdj7KT+xlkCPWi9hj59B6u1Y/7S
 y/QK1nIJUuJRoAm347UPj0YCyqZ6M+GEEUFD/5Nvm1vTa639QQqPU64JJWhiU8LQO35s
 pAtSW3BcxayFNmYVH4g9dZTNxoQSBAd0Bv0OKyjAn6PaMYFdLxCc/2mAgnQ2DYKZ3txc
 Q28p/biIZlA75LDGFSnDXNOnHSPv3V/bhhsAiKh8BJlw4WaII9hnDB0jgqjMKWSE5Fxt
 lIoCYg/cj0oxpoo/WCs419/4KI9HblSUClLbPnJUEKL0jS/xsCzgC6vAETGUJyFRdPjn
 hPtw==
X-Gm-Message-State: AOJu0YwDjYY3okudEEhFjuj2Zc4HIbg8CHKI/+EDQEQVzo+ydHAcDPVL
 rv7V3tyOSMCGQrrXjf/xZho7dJvlO+TJWLl7p524ktvW9UO+1Q9iLIjdSD4VT29z2lNY/GXoSJ7
 XZg6f4Pw=
X-Gm-Gg: ASbGncsRUvboHfGwO7QzRBXIc/i/umCSNl2sntp4Lc137aS0sU4bQNa+UwRZPU4bMx8
 Qjsly/CJkh+oyghp20ECXGRjMOgITwSoq4wzluqYMlpkw897wps+Ey3dY8U0sFDFU9hpyYdJ4sp
 AwQb3sUu/NiMIywQA3eV7HnO4XpRvtJIBp/FmIK+dG471vnnmeq8C6kcc+nGF2x9wSwf6GcXTjD
 kDJeO4KaI1mqhI+ac6j7y2hixImcXSCjusTZKXQKIKH1v77i1661VyUQlVaDtKOenc1RyC1QXyu
 vrs9jQy7T7Qq6gbsEFj9gWI76EWckPNzLHHY8TgdEi3/ko7h2HQmiMpX07ohQ/Fo9WJoj/QInpp
 pTtvQhiHoXtAhNjWhFLYixuw7pESGLd4Eo0uYrpCCUDCDGCpdo7DLasin
X-Google-Smtp-Source: AGHT+IGrIl4KPnVu/cmNPh2PToZEowH7/Kd8q3AoCsUNZIGzQ3cgmKTEzMBGDrzb2pJjFzu+EKUslQ==
X-Received: by 2002:a05:6a21:33a6:b0:327:1e57:f6d8 with SMTP id
 adf61e73a8af0-32da81344demr23370763637.7.1760290403059; 
 Sun, 12 Oct 2025 10:33:23 -0700 (PDT)
Received: from [192.168.68.110] ([152.234.122.223])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b678ddfeb7fsm7330987a12.19.2025.10.12.10.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Oct 2025 10:33:22 -0700 (PDT)
Message-ID: <a523e938-0319-49ef-ac5c-500489a2bfce@ventanamicro.com>
Date: Sun, 12 Oct 2025 14:33:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] target/riscv: Enable SMMPT extension
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 liwei1518@gmail.com, Huang Tao <eric.huang@linux.alibaba.com>,
 TANG Tiancheng <lyndra@linux.alibaba.com>
References: <20250918061911.904-1-zhiwei_liu@linux.alibaba.com>
 <20250918061911.904-7-zhiwei_liu@linux.alibaba.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250918061911.904-7-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x432.google.com
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



On 9/18/25 3:19 AM, LIU Zhiwei wrote:
> Co-authored-by: Huang Tao <eric.huang@linux.alibaba.com>
> Co-authored-by: TANG Tiancheng <lyndra@linux.alibaba.com>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ad5597c9ac..959024a0c5 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -204,8 +204,10 @@ const RISCVIsaExtData isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(smdbltrp, PRIV_VERSION_1_13_0, ext_smdbltrp),
>       ISA_EXT_DATA_ENTRY(smepmp, PRIV_VERSION_1_12_0, ext_smepmp),
>       ISA_EXT_DATA_ENTRY(smmpm, PRIV_VERSION_1_13_0, ext_smmpm),
> +    ISA_EXT_DATA_ENTRY(smmpt, PRIV_VERSION_1_13_0, ext_smmpt),
>       ISA_EXT_DATA_ENTRY(smnpm, PRIV_VERSION_1_13_0, ext_smnpm),
>       ISA_EXT_DATA_ENTRY(smrnmi, PRIV_VERSION_1_12_0, ext_smrnmi),
> +    ISA_EXT_DATA_ENTRY(smsdid, PRIV_VERSION_1_13_0, ext_smsdid),
>       ISA_EXT_DATA_ENTRY(smstateen, PRIV_VERSION_1_12_0, ext_smstateen),
>       ISA_EXT_DATA_ENTRY(ssaia, PRIV_VERSION_1_12_0, ext_ssaia),
>       ISA_EXT_DATA_ENTRY(ssccfg, PRIV_VERSION_1_13_0, ext_ssccfg),
> @@ -1371,6 +1373,8 @@ const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
>   
>   /* These are experimental so mark with 'x-' */
>   const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
> +    MULTI_EXT_CFG_BOOL("x-smmpt", ext_smmpt, false),
> +    MULTI_EXT_CFG_BOOL("x-smsdid", ext_smsdid, false),
>       MULTI_EXT_CFG_BOOL("x-svukte", ext_svukte, false),
>   
>       { },


