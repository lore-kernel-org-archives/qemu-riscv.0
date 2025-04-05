Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EFAC36010
	for <qemu-riscv@archiver.kernel.org>; Sat,  5 Apr 2025 09:21:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1u0zib-0006LT-8g; Sat, 05 Apr 2025 05:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u0ziX-0006DO-RG
 for qemu-riscv@nongnu.org; Sat, 05 Apr 2025 05:21:33 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1u0ziS-0000TR-Rq
 for qemu-riscv@nongnu.org; Sat, 05 Apr 2025 05:21:33 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-ae727e87c26so1839147a12.0
 for <qemu-riscv@nongnu.org>; Sat, 05 Apr 2025 02:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1743844885; x=1744449685; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j0Up7UPdKuhOzg6fS9fJPPPMNPyVnrY+sWKD9q1DERg=;
 b=WtLE8VttckxUIYGlxQ1MgqaMRMo6D5nFv+/Jfz+vcEab8Bq03TdcZsPMtra4aKyU8V
 GgpZT/l7IMyzqy9vI1PDUda/OVlSEWY58l5bm/IJfZPQzKFNw8iQgGIbI6YebMQiVR+B
 6VXGj4o8FdI8Y7GUoGN38iBYO/I1SPd/Kw+ubKdk7mF5n0XJNFZZYc69rOxm1baNjdIK
 scADF8hR7+k5qXPMTmRLbELIwHaiUcaNDpJM8Wyncccp0WEnMZmH58e4SBJ7cs+pFo32
 YDVv74vCWKi3z1wGYWcvULUs2c+MkzT4UTZSUisOcRMUo0Z6kWs+Rc9AVcssublxVztI
 1jXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743844885; x=1744449685;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j0Up7UPdKuhOzg6fS9fJPPPMNPyVnrY+sWKD9q1DERg=;
 b=PJ1/qlcDOluw/8qHxmnoS7W1hhppC9mIOZY6bWBCTSA4g/3s47ieOVC334ce/5oep1
 YyiqevB7kbli2V1kZ33aLqLfT4bytG81XSJuqv5JdVAU2IVPl6yyaVF3e/nkG03O8u8q
 tnWNbQAotFHMDrzLnxHTAjopUumCjjA1wz0hwhdUdp41labvFlMi9gtoY5HxtEM7oXp0
 nNF9r3L/wqNKE1p8rtqbWzvF8RcTABRqwAiUBfSME/KYgUNi8jERD/XeZmHIwebB+v6D
 43WE9cZfjbjAEps2cAWjm+AQrWif5bwcKo3tO9xo0nPS0MzmuquNWUUk8+QBDoxf9z7F
 WPtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+Fp42tU+g0wjPxs+FnQlHGPbyIKf8qx0wyWclBK267VfWVIeKwlGQv6YMWKYKvl52Y566doZI1mxc@nongnu.org
X-Gm-Message-State: AOJu0YzOKtFk+c/AMfElfIwPDKK9R0UvLydV1kIGE3a48/aifzu19ERS
 Zv4WNpzs32TyocG1b54AmGb+IA6SqOtkn+YCsVWbFX4MFpl7uaiFhCy9vd2bP34=
X-Gm-Gg: ASbGncuil6GDm+8sFxloLQhM1r/v2MqXznuMHcxs/HU77IszmuYP381ClAgr1Nc4olx
 7lOp0dmNqkjpm5l1LDHwVX7ymIkmQyb1bjTTZrhVsVCucZ9oiqN9dJsb31BIIDxI3SU5ft8iF4o
 0yvw559Frrqa1vljZVeby+bxrKKqV3knDw8bBQI4Xm+EsIC92+38A+JDLtqifZUpf3ml6b13Nd0
 M79sknog3pB2wztGVRYjv7RgH0X+5Y3u7Tag07TBVPFl6AgM/Wqf8lYC9APrQtBOCKLVTGNvClj
 EgOgwXpjSs2o4lEzD71Jf6YQTeYNGCTrpbaFVJM6WBPFAVrLnX8vqshNbaaW
X-Google-Smtp-Source: AGHT+IH/kGOPpuJNO2uKxTjIpPuc0YbYxIzW83KOV7zzuE5Anb/9c6CYav+mvN8tsApOzJeh3hbjZw==
X-Received: by 2002:a17:90b:2dc3:b0:305:5f25:fcf8 with SMTP id
 98e67ed59e1d1-306a4822fb3mr8386373a91.5.1743844885708; 
 Sat, 05 Apr 2025 02:21:25 -0700 (PDT)
Received: from [192.168.68.110] ([177.170.227.223])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-305983da812sm4960991a91.46.2025.04.05.02.21.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Apr 2025 02:21:25 -0700 (PDT)
Message-ID: <6c3b3613-00a2-4d94-9502-5f87b61d2bd6@ventanamicro.com>
Date: Sat, 5 Apr 2025 06:21:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] target/riscv: Fix the rvv reserved encoding of
 unmasked instructions
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 antonb@tenstorrent.com
References: <20250329144446.2619306-1-max.chou@sifive.com>
 <20250329144446.2619306-13-max.chou@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250329144446.2619306-13-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
> According to the v spec, the encodings of vcomoress.vm and vector
> mask-register logical instructions with vm=0 are reserved.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/insn32.decode | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 6d1a13c8260..cd23b1f3a9b 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -703,14 +703,14 @@ vfredmax_vs     000111 . ..... ..... 001 ..... 1010111 @r_vm
>   # Vector widening ordered and unordered float reduction sum
>   vfwredusum_vs   110001 . ..... ..... 001 ..... 1010111 @r_vm
>   vfwredosum_vs   110011 . ..... ..... 001 ..... 1010111 @r_vm
> -vmand_mm        011001 - ..... ..... 010 ..... 1010111 @r
> -vmnand_mm       011101 - ..... ..... 010 ..... 1010111 @r
> -vmandn_mm       011000 - ..... ..... 010 ..... 1010111 @r
> -vmxor_mm        011011 - ..... ..... 010 ..... 1010111 @r
> -vmor_mm         011010 - ..... ..... 010 ..... 1010111 @r
> -vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
> -vmorn_mm        011100 - ..... ..... 010 ..... 1010111 @r
> -vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
> +vmand_mm        011001 1 ..... ..... 010 ..... 1010111 @r
> +vmnand_mm       011101 1 ..... ..... 010 ..... 1010111 @r
> +vmandn_mm       011000 1 ..... ..... 010 ..... 1010111 @r
> +vmxor_mm        011011 1 ..... ..... 010 ..... 1010111 @r
> +vmor_mm         011010 1 ..... ..... 010 ..... 1010111 @r
> +vmnor_mm        011110 1 ..... ..... 010 ..... 1010111 @r
> +vmorn_mm        011100 1 ..... ..... 010 ..... 1010111 @r
> +vmxnor_mm       011111 1 ..... ..... 010 ..... 1010111 @r
>   vcpop_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
>   vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
>   vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
> @@ -732,7 +732,7 @@ vrgather_vv     001100 . ..... ..... 000 ..... 1010111 @r_vm
>   vrgatherei16_vv 001110 . ..... ..... 000 ..... 1010111 @r_vm
>   vrgather_vx     001100 . ..... ..... 100 ..... 1010111 @r_vm
>   vrgather_vi     001100 . ..... ..... 011 ..... 1010111 @r_vm
> -vcompress_vm    010111 - ..... ..... 010 ..... 1010111 @r
> +vcompress_vm    010111 1 ..... ..... 010 ..... 1010111 @r
>   vmv1r_v         100111 1 ..... 00000 011 ..... 1010111 @r2rd
>   vmv2r_v         100111 1 ..... 00001 011 ..... 1010111 @r2rd
>   vmv4r_v         100111 1 ..... 00011 011 ..... 1010111 @r2rd


