Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215FCC54FB3
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 May 2025 11:57:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uKbsb-0007lA-2D; Thu, 29 May 2025 07:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1uKbsZ-0007kK-AH
 for qemu-riscv@nongnu.org; Thu, 29 May 2025 07:56:59 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1uKbsX-0003c5-RT
 for qemu-riscv@nongnu.org; Thu, 29 May 2025 07:56:59 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-450cfb790f7so4750255e9.0
 for <qemu-riscv@nongnu.org>; Thu, 29 May 2025 04:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1748519816; x=1749124616; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Kp7JzEG0R2UsXNZXYenepkB1/A8SicuK6dyOec6z22A=;
 b=ck4aKVhcgB1EQ8WunNkr2aeG1r3QbNyOujvEl8QgTYsA27A0OfjLmOzCmwJuHDJnFV
 ALhcIHLJjfrmDcCdDgScdXZlJOik7Miclycu9TpIMOdLVuBmqp5VBK2DUYFXjo+fwNEa
 VNwj+ApctiPIAjRjdawkKwKagKtMRqfhd8w/0hNvEaA89nodKVpoy2hRwwF7oHggul5U
 tiSeeKXgRymIJvxzrxT5+JZxQnFBSXd6KwbSciqz2iFOXf37ArY4w/zDBfmFlfwtUPom
 cBZ3OXws5O/MqgwRdK46aQ3/UoVpLRZS+tVgrMEQQGsQ1J4UVGLKh7aXvEVEoBXPdnn7
 kG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748519816; x=1749124616;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kp7JzEG0R2UsXNZXYenepkB1/A8SicuK6dyOec6z22A=;
 b=kvDPrCmgqgJtMstYN0SPklLmL7bO3Ewz7AUKgaAut5xNoKohsc08Ba//De83D6zTRI
 prEMKXUf0r21Is2lExtXRoSl2htne3U2mm+scGYu+ZWbJtlsFfF68dybhPm3ajYbvgFz
 6dvM4quODCJOVZjZpvKkM/Xbiqaf29ooVZezdQguKZqaPbbwPYICuI7Pq076UhpLxwco
 ZLhoE9m5FF84AwM2CsJWcw9lntiPiBVkg37/pWNz/OIrYg7Y8UYCkYFm2xglcF6pKfzj
 Gc3iNHiArkH2/7SNcbehdkcQfP8393EXHUjfUOhHl7QAvZGMPepKqD2DkcMF71rbaWlF
 KWMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhTVHREuiui2nEZyl4uVlGSPlY2mqT567ySuteGDaeXYgl6aOp2lXCeYGq0zfHGvm94EnLc732Xkxv@nongnu.org
X-Gm-Message-State: AOJu0Ywd8nFutVkoB5KZ5A3NE/6ltL0sGmAZg0n4FHglee2thBV0ump/
 1xnnwEWa4Ip1Z1klKDpkX71NOQr1tOoiEBa8QIpgsQgg8zIdoC1KeWGQl+C/0vD0d1wtBkaXVQk
 tyMHqfwQ=
X-Gm-Gg: ASbGncvkR01Bj5V5TsqdCf/u9cHLc75wHdrTAOUZdMuI4OH6vyYY1Q+JGSR4oMmph5e
 sbLzuAI6BwR93iMu4szj4GooyuHh40cLzDJZQo95sAsY7BfVKyUi9fLLnbuaCUus3/9qG56dgB7
 k4yReJvMcCCBCnpImWtncIG7wxK/gPlsYAjcSSkcgtK5GHMeMecgd4mG44gRKpsAHE59mf+KPR1
 zHTwaxWVLGSrH25Z8FwnlOCOuSxY9AbEVkw5LOMrVhUv8ohuqL0FWoCVs7KYbjy6iZ9Qs/ac2uj
 pnKS7Quw4s79MmL3MusLA9u2KoAPW4djEcRW96M=
X-Google-Smtp-Source: AGHT+IGXapIsU/mY0xJYGH/2NUn8+dUO8fpjrw7FJr2ubMjhoYs4DsmaZpqI4e2DaRuOYgLZE6b2Qw==
X-Received: by 2002:a05:600c:1e15:b0:450:ceb5:5bb8 with SMTP id
 5b1f17b1804b1-450d06bccecmr17832565e9.30.1748519815923; 
 Thu, 29 May 2025 04:56:55 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::ce80])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44fcced4713sm62322845e9.1.2025.05.29.04.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 04:56:55 -0700 (PDT)
Date: Thu, 29 May 2025 13:56:54 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@dabbelt.com
Subject: Re: [PATCH v3 1/4] target/riscv/cpu.c: remove 'bare' condition for
 .profile
Message-ID: <20250529-31b79333f41bab9161f1ba97@orel>
References: <20250528200129.1548259-1-dbarboza@ventanamicro.com>
 <20250528200129.1548259-2-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528200129.1548259-2-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x334.google.com
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

On Wed, May 28, 2025 at 05:01:26PM -0300, Daniel Henrique Barboza wrote:
> We want to configure other CPU types to use profiles as an alternative
> to adding every profile extension explicitly, i.e. a profile is nothing
> more than an extension bundle.
> 
> This means that a vendor CPU can set .profile=rva23s64 while having the
> same handling as any other vendor CPU. Same thing with all other CPU
> types.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index fe21e0fb44..4a30cf8444 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2713,7 +2713,6 @@ static void riscv_cpu_class_base_init(ObjectClass *c, const void *data)
>          mcc->def->bare |= def->bare;
>          if (def->profile) {
>              assert(profile_extends(def->profile, mcc->def->profile));
> -            assert(mcc->def->bare);
>              mcc->def->profile = def->profile;
>          }
>          if (def->misa_mxl_max) {
> -- 
> 2.49.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

