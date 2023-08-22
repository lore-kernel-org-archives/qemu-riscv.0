Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91484EE4993
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 07:28:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qYLof-0004YL-Vy; Tue, 22 Aug 2023 03:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qYLoe-0004Xz-Nj
 for qemu-riscv@nongnu.org; Tue, 22 Aug 2023 03:28:40 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qYLoc-0006Mo-7p
 for qemu-riscv@nongnu.org; Tue, 22 Aug 2023 03:28:40 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-997c4107d62so547691266b.0
 for <qemu-riscv@nongnu.org>; Tue, 22 Aug 2023 00:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692689316; x=1693294116;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zaatQ6VtTE6NUhTIhy/z7VQyTtQrsvz3VqyfvWVuaR4=;
 b=A1iWDsqmrxQuN7u4K0O4qe/5n2Re4Iefc/TX0sE43fj53ISsZpfMXx9iE349asCJEX
 5bqRBIOEU4IuGhS6wzMLQHRSeVosGsqhEaF6xALMgqFszG3/Zh1LvXWV0cUsTwv2Qmot
 +HtlzndbBo06om2V7f6mAUdPBwaRE3jhH7Y8szj+OoN7RVmCCwnd06/jkS/hbayIpb7a
 0BU7KUDCQapFm1nvQEiZU0G2vpZLs7BD9dqd9LCz8xD1z0cmI2S2sBLNN2XVNq0x2+uM
 G016Si4Z8GHmNwLNht0z9lx3XFlO1kNAe1U/MIW98rkUSzWVhZQPWhW/EmHxql1/kw7L
 qXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692689316; x=1693294116;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zaatQ6VtTE6NUhTIhy/z7VQyTtQrsvz3VqyfvWVuaR4=;
 b=Ij0MZAJARH6E4ODFw2366O4RX79zXH9dputFGW/qkdHPXPqZz2MhI+ey/JU0f8WbJb
 6gzT+KO1e4dgxh+W1Z/DpCpndSkrWP6RHZ/kdt4mRJU3FE92xTCl1Ut/qTyCbJ/4K2GF
 mVzhynCsAsvr13KjOt+asEKCMh/zoDeoGDGrAapgnrXZvLgQJ2iKkLwd+xG+pEPcHa+D
 QJHERl9duPt6fOu5DWpyWPT8StoUlm7GQAt4EyvMgNzTu6P1s/lB62jgJd4Usxf6hdij
 12LlFC/ynVYOFmMaKoLunqHFOR56W857qrXiz+q73b9NJ/DU5fHMcW57SHzPN/YmC9PF
 TW2Q==
X-Gm-Message-State: AOJu0Yy634ouHPIXGrWAWd0SpxYu09mEgyCO9tWuoo3CsvwXaoyfwQvi
 5H9l9ByMODhhrB5+3KZ1FVa66g==
X-Google-Smtp-Source: AGHT+IHjG5f+2lhrZtSrTFSnKSuVS1rsYRMiGEPCPDWgPCexOK85UVnqFr9HmcNG2tQqYDpQCIJ8BA==
X-Received: by 2002:a17:906:30da:b0:9a1:2a25:197e with SMTP id
 b26-20020a17090630da00b009a12a25197emr6695704ejb.50.1692689316281; 
 Tue, 22 Aug 2023 00:28:36 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 ke9-20020a17090798e900b00988e953a586sm7720912ejc.61.2023.08.22.00.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 00:28:35 -0700 (PDT)
Date: Tue, 22 Aug 2023 09:28:35 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH] target/riscv: fix satp_mode_finalize() when
 satp_mode.supported = 0
Message-ID: <20230822-08e9af33c2a5ddc7b2f501be@orel>
References: <20230817152903.694926-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817152903.694926-1-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x630.google.com
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

On Thu, Aug 17, 2023 at 12:29:03PM -0300, Daniel Henrique Barboza wrote:
> In the same emulated RISC-V host, the 'host' KVM CPU takes 4 times
> longer to boot than the 'rv64' KVM CPU.
> 
> The reason is an unintended behavior of riscv_cpu_satp_mode_finalize()
> when satp_mode.supported = 0, i.e. when cpu_init() does not set
> satp_mode_max_supported(). satp_mode_max_from_map(map) does:
> 
> 31 - __builtin_clz(map)
> 
> This means that, if satp_mode.supported = 0, satp_mode_supported_max
> wil be '31 - 32'. But this is C, so satp_mode_supported_max will gladly
> set it to UINT_MAX (4294967295). After that, if the user didn't set a
> satp_mode, set_satp_mode_default_map(cpu) will make
> 
> cfg.satp_mode.map = cfg.satp_mode.supported
> 
> So satp_mode.map = 0. And then satp_mode_map_max will be set to
> satp_mode_max_from_map(cpu->cfg.satp_mode.map), i.e. also UINT_MAX. The
> guard "satp_mode_map_max > satp_mode_supported_max" doesn't protect us
> here since both are UINT_MAX.
> 
> And finally we have 2 loops:
> 
>         for (int i = satp_mode_map_max - 1; i >= 0; --i) {
> 
> Which are, in fact, 2 loops from UINT_MAX -1 to -1. This is where the
> extra delay when booting the 'host' CPU is coming from.
> 
> Commit 43d1de32f8 already set a precedence for satp_mode.supported = 0
> in a different manner. We're doing the same here. If supported == 0,
> interpret as 'the CPU wants the OS to handle satp mode alone' and skip
> satp_mode_finalize().
> 
> We'll also put a guard in satp_mode_max_from_map() to assert out if map
> is 0 since the function is not ready to deal with it.
> 
> Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
> Fixes: 6f23aaeb9b ("riscv: Allow user to set the satp mode")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d608026a28..86da93c7bc 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -349,6 +349,17 @@ static uint8_t satp_mode_from_str(const char *satp_mode_str)
>  
>  uint8_t satp_mode_max_from_map(uint32_t map)
>  {
> +    /*
> +     * 'map = 0' will make us return (31 - 32), which C will
> +     * happily overflow to UINT_MAX. There's no good result to
> +     * return if 'map = 0' (e.g. returning 0 will be ambiguous
> +     * with the result for 'map = 1').
> +     *
> +     * Assert out if map = 0. Callers will have to deal with
> +     * it outside of this function.
> +     */
> +    g_assert(map > 0);
> +
>      /* map here has at least one bit set, so no problem with clz */
>      return 31 - __builtin_clz(map);
>  }
> @@ -1387,9 +1398,15 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>  static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
>  {
>      bool rv32 = riscv_cpu_mxl(&cpu->env) == MXL_RV32;
> -    uint8_t satp_mode_map_max;
> -    uint8_t satp_mode_supported_max =
> -                        satp_mode_max_from_map(cpu->cfg.satp_mode.supported);
> +    uint8_t satp_mode_map_max, satp_mode_supported_max;
> +
> +    /* The CPU wants the OS to decide which satp mode to use */
> +    if (cpu->cfg.satp_mode.supported == 0) {
> +        return;
> +    }
> +
> +    satp_mode_supported_max =
> +                    satp_mode_max_from_map(cpu->cfg.satp_mode.supported);
>  
>      if (cpu->cfg.satp_mode.map == 0) {
>          if (cpu->cfg.satp_mode.init == 0) {
> -- 
> 2.41.0
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

