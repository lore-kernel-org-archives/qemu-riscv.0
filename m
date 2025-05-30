Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1E8C5B543
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 May 2025 13:53:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uL0B4-00007I-OK; Fri, 30 May 2025 09:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1uL0B3-00006f-95
 for qemu-riscv@nongnu.org; Fri, 30 May 2025 09:53:41 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1uL0B1-00014u-J9
 for qemu-riscv@nongnu.org; Fri, 30 May 2025 09:53:41 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ad1d1f57a01so375918766b.2
 for <qemu-riscv@nongnu.org>; Fri, 30 May 2025 06:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1748613217; x=1749218017; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mc46cCfneoTYTJz+e6DtEc53hKzBewpF+Ba7fhALtZs=;
 b=WJJceCEplFDyBf4TGqvuhf17p2gK9rwz4DEeMafR9yk+6KBeA1EkW37Cvm0E+1MSVY
 mPWjlRUGJ/RxBCziFHUj6uTkp1+2MRIRjNhH9+8xnuusznt10bn4Ua/fjXrPfDsFIFul
 sO1CyUUoLKdolceQ9gCH33NmceqFk0h7YWTsZfEwvHn3l4fzWiUWRzqa71TbPQgdIVhU
 xgo8+Jjuaref7ID4USfg/q4SXvAO7AwbwWtMOQ5MvOfKrk9HQzTn39JcA+41i58kFEgh
 E5nCgkYW7MtfOXo9Rr1IMDdVByrpr1Sy7b2kxpAImlwpY1907I/qKiEdktSteWinNpF4
 MjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748613217; x=1749218017;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mc46cCfneoTYTJz+e6DtEc53hKzBewpF+Ba7fhALtZs=;
 b=dmfjbS9A36un37cMJx8heeHjPl/X6SkRmqzOZOpdcSxF4J+7wWec1kpVRrbCsGwgPF
 iDhgccgsZaAqVA9FwsyImIgSkWBLQB68BPutZvHnaYlwJ0K4Z4p1BGgDUU5+XvQRQsGm
 nAol2IO7wwYfPHQh86Xm5aaBF3tnnVMXGSqcxi6TAOMiA+HQTuf1UQ1FT1x7ICIglj0H
 +e+QuCVypE04zfMJJA9gtO9kFlu1jhoEkXiuKVh+2e/0frqSb+Hc8D37WCY+walVlrEW
 V3rUKaTRRzfganFBHtUtKBUireXTyj6Ti/JPzgA4T5p+QCZ7WJFrBBM0++1RCz9b2uCf
 9IqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzHI8CSWHQNcabc0E1IOtF2T5YTHRtBHdDkVzCElYJ+PwErN6fyvcve2eh1VKyoF+2vwM/VI8MyP6A@nongnu.org
X-Gm-Message-State: AOJu0YwIfPirHSSZgd5ilyjYwrBIPIy8qBNeWQFeJuySMwQgJ4Nc80c1
 5yMhUjZGaZvUTTHLahYR964oTJLy2iUI7xjBRahBBXvmoUCKnohh0+hqoGf8XRc46LI=
X-Gm-Gg: ASbGncv6NPHvJB6MTiCKG+7sfpoYxM+KNW1hrzw8kjCTsfNiGtnJXBZnaU97qJoqqlJ
 gdoRiPKNyUhafsH/RHhtMfTl+v/eJmWbm4kEpFUagIFTklGZ01TGGqUBDi0hbY/roWndZI7s62H
 Fkp7wphd3YMUOpXBD6HxymOFji/dO03ugO6T8lGwwp7FW4GWhFOEaNVPPgN9UoAxopfnBnGVG3h
 C/vsDfEDhQbPwUipc+6dp1wT9+mRDeBwtTtuQXk1EmvorRJw+2OxB31dkEKSgp6TnTr6j4aNpK7
 Oa8ppnenVluSDnULLpCCo3l1hJNVHth2gIWdVn582tobWk6EXms7JCuDKQ==
X-Google-Smtp-Source: AGHT+IFNKKlrfynKwCDGYYOTlxKLbtgLa/cjnMpVxgF7ZkDrivjcRTbQssdDEeeYmZxG2uolidWDDQ==
X-Received: by 2002:a17:907:7210:b0:ad5:3055:784d with SMTP id
 a640c23a62f3a-adb322b02c7mr300488966b.34.1748613217255; 
 Fri, 30 May 2025 06:53:37 -0700 (PDT)
Received: from localhost ([2a00:11b1:1029:5857:f3a5:c7b7:d102:3317])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada6ad6aa9asm332618766b.179.2025.05.30.06.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 06:53:36 -0700 (PDT)
Date: Fri, 30 May 2025 15:53:35 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com
Subject: Re: [qemu PATCH 2/3] target/riscv/cpu.c: add 'ssstrict' to riscv,isa
Message-ID: <20250530-cd03932babbb297f306d5c27@orel>
References: <20250529202315.1684198-1-dbarboza@ventanamicro.com>
 <20250529202315.1684198-3-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529202315.1684198-3-dbarboza@ventanamicro.com>
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

On Thu, May 29, 2025 at 05:23:14PM -0300, Daniel Henrique Barboza wrote:
> 'ssstrict' is a RVA23 profile-defined extension defined as follows:
> 
> "No non-conforming extensions are present. Attempts to execute
> unimplemented opcodes or access unimplemented CSRs in the standard or
> reserved encoding spaces raises an illegal instruction exception that
> results in a contained trap to the supervisor-mode trap handler."
> 
> In short, we need to throw an exception when accessing unimplemented
> CSRs or opcodes. We do that, so let's advertise it.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 9d6fae72b2..cd0b159ed5 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -217,6 +217,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
>      ISA_EXT_DATA_ENTRY(ssnpm, PRIV_VERSION_1_13_0, ext_ssnpm),
>      ISA_EXT_DATA_ENTRY(sspm, PRIV_VERSION_1_13_0, ext_sspm),
>      ISA_EXT_DATA_ENTRY(ssstateen, PRIV_VERSION_1_12_0, ext_ssstateen),
> +    ISA_EXT_DATA_ENTRY(ssstrict, PRIV_VERSION_1_12_0, has_priv_1_12),
>      ISA_EXT_DATA_ENTRY(sstc, PRIV_VERSION_1_12_0, ext_sstc),
>      ISA_EXT_DATA_ENTRY(sstvala, PRIV_VERSION_1_12_0, has_priv_1_12),
>      ISA_EXT_DATA_ENTRY(sstvecd, PRIV_VERSION_1_12_0, has_priv_1_12),
> -- 
> 2.49.0
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

