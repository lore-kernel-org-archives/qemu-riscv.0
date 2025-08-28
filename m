Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68178CA0FF9
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 09:38:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1urZ4n-0000j5-6O; Thu, 28 Aug 2025 05:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1urZ4h-0000fw-Sl
 for qemu-riscv@nongnu.org; Thu, 28 Aug 2025 05:37:46 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1urZ4f-00083u-G7
 for qemu-riscv@nongnu.org; Thu, 28 Aug 2025 05:37:42 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-b4c6fee41c9so143066a12.1
 for <qemu-riscv@nongnu.org>; Thu, 28 Aug 2025 02:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1756373858; x=1756978658; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZNqqbmsJO3IFpQkWwKrQ4GThmbM/ferEW/+t1C2XHN4=;
 b=iI5E7ahIf6YPvh4yX5l7FXMTzFskkfauDBBufG3+b5QIfwxpTUx8X5ghnzejRiOfOf
 BKBLEUmnov0w5x0D+whp1KgslNVzrc5Y+aRI970M/ybDgVBse48wkS3ScuE6FPfJ5LEZ
 6KRgdo/EGoShWMyteiuyjzN1F28xvvzR1RRC9IkN6iUZH43oiHzan3dXf2WdrsmxNVbB
 RLs7OrjH3Keq1peoxg46msCZZVLKPexGrejhd85u8qWDS2Em8NecfXq0eZ3PrBGyHgSM
 Gi3GtvgFGul3Anuccd1V/PypCm0ar9I/Yo73q0fZjHnnco45r7ZAhldLttwPpjGfP21c
 nhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756373858; x=1756978658;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZNqqbmsJO3IFpQkWwKrQ4GThmbM/ferEW/+t1C2XHN4=;
 b=RGDvho6eeHQMSBPyOBFiJ+7Owtq5nrwSUwkmr2EeTgsJUCiLtCCJTYWz5gPpcRjhFU
 KLqfA0EHwodbNPCeLZP8lXoxOxIPcwBWt+2elgJuJOl6JfKdaRk/KlZC/7pSViN7UNPw
 pAjCc7iZTTNDOr4qNYZKavHFO3pdF1+rX016Td4uZ7k8VnOB0IXykTfDEcy5Eo3anURl
 CEYHQ/a0rnI39w1eUpegn496Eyfp6xsjvdkmQnYt/Pyf3eKWMAhWxiOq/6jE9GtFZmE0
 O6B+v/18+MALxRE43bDzcIEKkcZAbx9XdHlOUOznJykJ/IEhIb4m7YzMgdh1DbVAERuF
 k7Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLfQkfZtcvutctQj0S93visODMdpnITlScRpB/WLW9r87Ozf696wXq2+2RD1jEZ/MC9hz3Nck8Mwc/@nongnu.org
X-Gm-Message-State: AOJu0Yxd0/Tnk3ibPBcWZpyMkpGyStc++csw7flqxLwmYnK1bNwtp0y7
 Bh9XFO7hNpEmAaj0lxqQg9KBUgSPuWK+rI9T0YBod1cohc56exM3W+Emfq8a4Vo6kig=
X-Gm-Gg: ASbGncu1oj1biVcpxJp35PVZnkWVVd14JB8QJSRye5gsHQub420cMPc+85KdIn1gDSt
 iXP8gXQ9fo4clOChblfDeoEIYqPn38/KGVIPlEVxmHKAxlrPUUax42jT0LO2OoNd3/zYdoJe5sT
 HTBaJ8Yqu6ROWoBTLehfFJDUn1p+PtzU3ZB+aRfWkccnFsT09GowpwLmmEi2MvU+C/zIAgjlOWb
 bb/yHgkOycMobx3nntmzIHQJ3VxyjK9TKZAE7b+vdg2jXVpZGpBUZEDG7Ek3GaTOjMh556h14xD
 zkhJZG1MdHmwPoShXhOMB4Qom2TuxxOpcNNX+JvxAHO0tvjNXw6WOQMeRSx5j5AHmR18HJLkRAf
 uBQ76js+AwuQ0BPzMuu2TydZqLwau+R9Bg5/UhIWfAMqXw8WH
X-Google-Smtp-Source: AGHT+IHlFmLxsz86hfiUnOiwYwNPhDio0ujdoM63z6vAfv55uUUmwih3hjAWqJtLoKwCKyV/V0n6pQ==
X-Received: by 2002:a17:90b:5644:b0:327:70b9:9d68 with SMTP id
 98e67ed59e1d1-32770b99e1bmr6964846a91.16.1756373858478; 
 Thu, 28 Aug 2025 02:37:38 -0700 (PDT)
Received: from [192.168.68.110] ([191.202.238.136])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77210e226a8sm2794141b3a.33.2025.08.28.02.37.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 02:37:37 -0700 (PDT)
Message-ID: <dccc6ea0-d173-4a55-8c69-9313e2accbff@ventanamicro.com>
Date: Thu, 28 Aug 2025 06:37:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: use riscv_csrr in riscv_csr_read
To: stove <stove@rivosinc.com>, qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-stable <qemu-stable@nongnu.org>
References: <20250827203617.79947-1-stove@rivosinc.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Content-Language: en-US
In-Reply-To: <20250827203617.79947-1-stove@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x531.google.com
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

Cc: qemu-stable

On 8/27/25 5:36 PM, stove wrote:
> Commit 38c83e8d3a33 ("target/riscv: raise an exception when CSRRS/CSRRC
> writes a read-only CSR") changed the behavior of riscv_csrrw, which
> would formerly be treated as read-only if the write mask were set to 0.
> 
> Fixes an exception being raised when accessing read-only vector CSRs
> like vtype.
> 
> Fixes: 38c83e8d3a33 ("target/riscv: raise an exception when CSRRS/CSRRC writes a read-only CSR")
> 
> Signed-off-by: stove <stove@rivosinc.com>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   target/riscv/cpu.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 4a862da615..dca8edff6d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -873,7 +873,7 @@ static inline void riscv_csr_write(CPURISCVState *env, int csrno,
>   static inline target_ulong riscv_csr_read(CPURISCVState *env, int csrno)
>   {
>       target_ulong val = 0;
> -    riscv_csrrw(env, csrno, &val, 0, 0, 0);
> +    riscv_csrr(env, csrno, &val);
>       return val;
>   }
>   


