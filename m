Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E9DC3601A
	for <qemu-riscv@archiver.kernel.org>; Sat,  5 Apr 2025 09:21:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u0zhy-0005GE-F8; Sat, 05 Apr 2025 05:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u0zhv-0005Du-NY
 for qemu-riscv@nongnu.org; Sat, 05 Apr 2025 05:20:55 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u0zht-0000QB-ER
 for qemu-riscv@nongnu.org; Sat, 05 Apr 2025 05:20:55 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-7370a2d1981so2375445b3a.2
 for <qemu-riscv@nongnu.org>; Sat, 05 Apr 2025 02:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1743844851; x=1744449651; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YTKa9zoypWUJEzvNm2iu/XZgjcgv33VkLl7KYVhtzAc=;
 b=INofOTTAkbAnKr/G4xMg9hvPKf1yWlzx5vkhFBlyixEtrmDkcZ3wrh/zY0e015okaO
 HwhO7TDOvtdSB/8Wckp9EZqTiKIC6qToG8+Yojin8DVNveNTdv64FeAF1nu0NW3bFRw/
 fjz3R6/noGbKUKzabRETa9SnPV9Y2PyhQUnb5hFzc+BCmpvQRyFNx1yGyznj3jpzIv1P
 tbpeShpK6HIO6yLxoRzx7qL0Xwb4ZkQwRaM+AAOUNODRSWOPnjyC3ZrGJUaD273BsDHJ
 mC2FZ4xqd3XPvxzi38mEHzCvkugepWabp2msf9zo8YtEYBBskYamexTDvyJ6aq7UOO7Q
 yqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743844851; x=1744449651;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YTKa9zoypWUJEzvNm2iu/XZgjcgv33VkLl7KYVhtzAc=;
 b=UL/eaE2H0QN8PhX611b067UO5jI5wnH39Dxds3DErK3kMdRAOWkNuvr+QjDv2RF7dx
 kFlMsPw9U7k/ZroVCmr8RPIxLED+KFVxRA2Lyzepsq6HKxPWOaTPigNa1SwL+lWqTabS
 J/HEJnsbknjkyjc9hRhTXQC4iutVscY1NfJak/iymghtq1gbQikfzfsEjphOwFAReWOy
 dC9tQ+C7HLlXM6Cu0MspikF7QuLVRHcS/INS9NpWSLe41H/FKXbM31llwo1yN/STJ+nz
 16oyazR0D9gb1Pv2BP8GPnC9YU6y9sroWcHKT2Wii5z75Kos4ZiM25f0Gt15BO7GGMtG
 I9ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2hAWrGD572Ns1kgmLKOgSA7YnS9CtubSHNOKylnBsBjuwTWgUbOV+GN6wtQSHNCGE5HaF0QVlGY4z@nongnu.org
X-Gm-Message-State: AOJu0YxDQ0c60Xk85aHBsBefODDvcRiMI1t/msIfb/OVh0yZagPRnw+w
 k9wo7x7fyA7KmU5lUB0NqtsDa/6Dsiy6qsgm6G8tI5kEJ2HwzAJ/5ppZOrOAgV+PyBRQ5n7DzUt
 m
X-Gm-Gg: ASbGncsuNI+OZLOrj1spB2TBANoRaeru7YTrM8LUbQMOeyXj+uKDI52k5sx7OHy/Ld0
 opKUzmzUCKrOy0JoNqjS54pAYdGoaqwo/fJ9HxaRe3c2eMzyoPr2qp0BXAvTmrJnXobf+wWbfha
 I5iFsEB4dpHZakiv77heMWFImnCSvqoDQBM7fc8mV5vnEt4HW5A56FAT3w/nS+kA3bXlOj+E3hi
 e6bS8Z/ROu3aA6zqxq9y+DqJvfLK70ae+t2ZPKVcb80FPJSDVhmT9A5V1fluRvXKFIp2e6YlPHI
 59Vt8TzQZJoD1Z5HZRn4c6h9exqCQ+R5JUQdu9vWnhV+lILd2jbde/ZIYXMc
X-Google-Smtp-Source: AGHT+IFQjvaHA32iMQ6spzKWLis6oUHjR2Sc97ZmPOhUPeCe1LhRTdBaIuQCaixfJow3e2t1GLHrTg==
X-Received: by 2002:a05:6a20:c995:b0:1f3:2e85:c052 with SMTP id
 adf61e73a8af0-2010472d6f6mr10401753637.35.1743844851451; 
 Sat, 05 Apr 2025 02:20:51 -0700 (PDT)
Received: from [192.168.68.110] ([177.170.227.223])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739d97ee7a0sm4811878b3a.41.2025.04.05.02.20.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Apr 2025 02:20:50 -0700 (PDT)
Message-ID: <e397d528-6e4c-4758-832b-f87baccb3e4b@ventanamicro.com>
Date: Sat, 5 Apr 2025 06:20:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] target/riscv: rvv: Apply vext_check_input_eew to
 vector indexed load/store instructions
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 antonb@tenstorrent.com
References: <20250329144446.2619306-1-max.chou@sifive.com>
 <20250329144446.2619306-12-max.chou@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250329144446.2619306-12-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x42a.google.com
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



On 3/29/25 11:44 AM, Max Chou wrote:
> Handle the overlap of source registers with different EEWs.
> 
> Co-authored-by: Anton Blanchard <antonb@tenstorrent.com>
> Co-authored-by: Max Chou <max.chou@sifive.com>
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---


With your co-authored-by tag removed:

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/insn_trans/trans_rvv.c.inc | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index d4d1ad055fa..3b36464176a 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1044,7 +1044,8 @@ static bool ld_index_check(DisasContext *s, arg_rnfvm* a, uint8_t eew)
>   {
>       return require_rvv(s) &&
>              vext_check_isa_ill(s) &&
> -           vext_check_ld_index(s, a->rd, a->rs2, a->nf, a->vm, eew);
> +           vext_check_ld_index(s, a->rd, a->rs2, a->nf, a->vm, eew) &&
> +           vext_check_input_eew(s, -1, 0, a->rs2, eew, a->vm);
>   }
>   
>   GEN_VEXT_TRANS(vlxei8_v,  MO_8,  rnfvm, ld_index_op, ld_index_check)
> @@ -1096,7 +1097,8 @@ static bool st_index_check(DisasContext *s, arg_rnfvm* a, uint8_t eew)
>   {
>       return require_rvv(s) &&
>              vext_check_isa_ill(s) &&
> -           vext_check_st_index(s, a->rd, a->rs2, a->nf, eew);
> +           vext_check_st_index(s, a->rd, a->rs2, a->nf, eew) &&
> +           vext_check_input_eew(s, a->rd, s->sew, a->rs2, eew, a->vm);
>   }
>   
>   GEN_VEXT_TRANS(vsxei8_v,  MO_8,  rnfvm, st_index_op, st_index_check)


