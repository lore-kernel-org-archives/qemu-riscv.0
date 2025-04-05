Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C687C3601A
	for <qemu-riscv@archiver.kernel.org>; Sat,  5 Apr 2025 09:19:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u0zfu-0002Zm-U3; Sat, 05 Apr 2025 05:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u0zfp-0002UI-Tq
 for qemu-riscv@nongnu.org; Sat, 05 Apr 2025 05:18:47 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u0zfj-0008NQ-Ep
 for qemu-riscv@nongnu.org; Sat, 05 Apr 2025 05:18:45 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-af9065f0fc0so1915849a12.2
 for <qemu-riscv@nongnu.org>; Sat, 05 Apr 2025 02:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1743844716; x=1744449516; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nTYGIC2V86GVEO1aygBOOi6AdwZ/tlG4VCLyBLagoZQ=;
 b=dEFpTRAeVLzQghjyVCTDdoI5sbWGyYtAPS9kaFoOhInbfxRg5wgZTkOkUc6JAjukWO
 Rn2QDmSR6SMQr6Z491LfBnYf4cb+8uuI6jzNKGTKzbU4sBCTp0UtqIsqpeVbAS+SkMJ9
 5Un+o9Db/9E+OBbocpr2CaH25YUPhKOdw5McXup6JdkW6sHUZquBifX6cHTSEVlHhLvL
 85jVOeWKAbgthSzaOyQL1bH7SGwPRNkyFYkBr5zXBvQbtnRPSIyh1F4KtgAbhSt/EiVS
 /5JOXKNBKS8q2T4IpwDpPB+vh0vcD26gZKVDO9YDCn06N1C81abnpNqRwuY/LkvJKHqM
 dfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743844717; x=1744449517;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nTYGIC2V86GVEO1aygBOOi6AdwZ/tlG4VCLyBLagoZQ=;
 b=updd/uwT8/4iwGyLSn5ae6VSWAhTve8ME6E71Dnle+TjjFEDWGAo8zNX/EPa3m3qHy
 tDA7GJYoA7VSqibkpaRBDxf45laNSWzdBO69RrbddbqaP6SRhcKJxl5HcoSseGqe0etO
 hazH8ZTLboPQEfsffn3oI6L4Tj7+nBLteqcI/N8Hgt1qinmL37Ut4OIav2podKyHflT2
 e20rinR05hzkBqYIWFCBlsL68Y7DLEpFw2Nc90fRBD2l1hgtB1p34qTgFwd68qr2QaaH
 smwvRbaaIKYeWHzSBhFBXvdvsARMfApaM5T1WaW5drj1HyfMx4pXesV9uWE52/iGVvzH
 SYkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiuPJKwAb5vwlSJz1ZHvJBFswwj+yBhQ79cXQxXyUwc+Y5b1wm7Ve9Kcq9rteRqMR78Yy1FtxLaw8H@nongnu.org
X-Gm-Message-State: AOJu0YyPmpdvFk5SFyqepqxEaIWKqacBoiHqKrFvxRMJYOK64bq5/U9k
 faVkZuFdzccLsBTlFwOSeZSKAyqkjd0hL+NLeBXqBZkG4I6GuuXBODyPIk6PUAo=
X-Gm-Gg: ASbGncv0ECTbeo9r4kbQkhFNHYJGudIQy41RuNm4ZrAgvq+eO8rjK4u+Cz5S8jmVYgG
 8CCV9ervGfsAltFsYJQeoJKPgE8vYhqgQ+1+xyG7ud1qylP9XS8onnyAUezs3mFsooFednL5O0V
 PAd3B430GlTuHa36rWaJ3n/dJAgD9l/d4i1/HfAx6k7aWsGQxoTVPq8UifoDcKx0KrMpE7vZDgK
 ibiOV9+8vK9I2PQBZU8jamKzZj0z1oxNGhLzbHx+FIs6WhvNEbZAflQGEFOhwLhm/9x73UDUPe3
 tT/vjSm06+D3bDLT1b1ms/Pr0iwDK9PEZdNa3jgsdR9joVhVo7OUVm0Np/AM
X-Google-Smtp-Source: AGHT+IGxYxAM6IxII+DllVeVIx/8jCicZm+GCykj9N/3XNn85vhSzbY31PnEDeMsPyT/aEfYOJxgWQ==
X-Received: by 2002:a17:90a:d003:b0:2ee:a583:e616 with SMTP id
 98e67ed59e1d1-306a4865080mr9662924a91.9.1743844716725; 
 Sat, 05 Apr 2025 02:18:36 -0700 (PDT)
Received: from [192.168.68.110] ([177.170.227.223])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-229785bfea5sm45871935ad.54.2025.04.05.02.18.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Apr 2025 02:18:36 -0700 (PDT)
Message-ID: <ebcccedf-a11c-4716-bdc2-d06233cad20f@ventanamicro.com>
Date: Sat, 5 Apr 2025 06:18:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] target/riscv: rvv: Apply vext_check_input_eew to
 vector integer extension instructions(OPMVV)
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 antonb@tenstorrent.com
References: <20250329144446.2619306-1-max.chou@sifive.com>
 <20250329144446.2619306-9-max.chou@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250329144446.2619306-9-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52a.google.com
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



On 3/29/25 11:44 AM, Max Chou wrote:
> Handle the overlap of source registers with different EEWs.
> 
> Co-authored-by: Anton Blanchard <antonb@tenstorrent.com>
> Co-authored-by: Max Chou <max.chou@sifive.com>
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---


With your co-authored-by tag removed:

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/insn_trans/trans_rvv.c.inc | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index f397ae46446..728912fc1f2 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -3660,7 +3660,9 @@ static bool int_ext_check(DisasContext *s, arg_rmr *a, uint8_t div)
>           require_align(a->rd, s->lmul) &&
>           require_align(a->rs2, s->lmul - div) &&
>           require_vm(a->vm, a->rd) &&
> -        require_noover(a->rd, s->lmul, a->rs2, s->lmul - div);
> +        require_noover(a->rd, s->lmul, a->rs2, s->lmul - div) &&
> +        vext_check_input_eew(s, -1, 0, a->rs2, s->sew, a->vm);
> +
>       return ret;
>   }
>   


