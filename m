Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E205C77B75
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 May 2023 13:12:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q15KY-00077L-Py; Mon, 22 May 2023 09:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q15KW-0006rN-VX
 for qemu-riscv@nongnu.org; Mon, 22 May 2023 09:12:05 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q15KT-0007e4-Q7
 for qemu-riscv@nongnu.org; Mon, 22 May 2023 09:12:04 -0400
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3942c6584f0so2025829b6e.3
 for <qemu-riscv@nongnu.org>; Mon, 22 May 2023 06:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1684761120; x=1687353120;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mdgJnenwBP7BbG6DAwhmTBkQgluvIDSLP3OdDMREcEY=;
 b=Sg6j8x36w0hg5v2z97makGN/GmLj3sQA8tCD1P10/s7oLhjKDSWUoHrHHCDolKPy2H
 Ojb+i1MrujO/D0v1rx1YquIbwbHp8mJd5+bySnXYIIR1O6JLEmBBefD61O8stzvCSjCf
 gaD5DIocdK4DLaIxp6cyztYVxKen8QHBtmuw829HtCHs/RXCKMK2upJFAX3flnW2lZQL
 Y0uHYyHbhdk3r0O81BCO+vtuDBV+mo5Y1ejWHkKI4kxj7ZEHiSl3bxLZzXtQLfTD3A+k
 Jkil1AhzbHU+xMO/9PNLvBy3JhAc8NA6qt8AyNvTRRmuwgmsjlvYKDrAG+1C4QD6LI5d
 r3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684761120; x=1687353120;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mdgJnenwBP7BbG6DAwhmTBkQgluvIDSLP3OdDMREcEY=;
 b=KWhTKLbq556sYhJZSB5cG6fTlelkte7xDZ+aD+zV2e16YvZYsSRrS/cwYeVs6UHuP3
 s+73Fsqx9W5mJIcVk7XjPEEdaeX1mIdDlku3Ts4/PZMz7bq8gH/YJbLXi031ZIi7R1XD
 KnC8CLUYRFoCtKn1VJYAbLda+hsez2cJO8lXPdngqBarwZqsadtDbR79pg5p6NS031V4
 hQclAgMT43ko4QXPPpE0y5AFB7R13PTb1o57DfAy66Z9bD/kYrHIVjKZb3kEPKBpdPLf
 IROENwYdfzR55zBptSGnNSalsWV08hx56FbpNcdBHZqON6QAYFUKeiZi+40JH1oieTbL
 tVww==
X-Gm-Message-State: AC+VfDwwxrskkVqJNuoLOSItgjWtsVKEF7txLTdw/G7wBRWYuNVF2dXI
 57RzyceFFtAkKFFteQc9icTR0Q==
X-Google-Smtp-Source: ACHHUZ5W9pRWX7ryDKve5O6MSaJzrULCPPLfVrBbWTVWGfqs1CAQMgn+HvujTt7Oz5cfr3DoC+smFA==
X-Received: by 2002:a05:6808:3c7:b0:394:41e7:5719 with SMTP id
 o7-20020a05680803c700b0039441e75719mr5150606oie.40.1684761120249; 
 Mon, 22 May 2023 06:12:00 -0700 (PDT)
Received: from [192.168.68.107] ([179.111.98.125])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a54438c000000b00397c03854edsm2475448oiv.17.2023.05.22.06.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 06:11:59 -0700 (PDT)
Message-ID: <aef92f4c-c9fa-f315-2045-a305a0af9135@ventanamicro.com>
Date: Mon, 22 May 2023 10:11:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 7/7] disas/riscv.c: Remove redundant parentheses
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230519021926.15362-1-liweiwei@iscas.ac.cn>
 <20230519021926.15362-8-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230519021926.15362-8-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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



On 5/18/23 23:19, Weiwei Li wrote:
> Remove redundant parenthese and fix multi-line comments.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   disas/riscv.c | 219 +++++++++++++++++++++++++-------------------------
>   1 file changed, 110 insertions(+), 109 deletions(-)
> 
> diff --git a/disas/riscv.c b/disas/riscv.c
> index ee50a4ab0c..47c325c0d6 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -2386,9 +2386,9 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>   {
>       rv_inst inst = dec->inst;
>       rv_opcode op = rv_op_illegal;
> -    switch (((inst >> 0) & 0b11)) {
> +    switch ((inst >> 0) & 0b11) {
>       case 0:
> -        switch (((inst >> 13) & 0b111)) {
> +        switch ((inst >> 13) & 0b111) {
>           case 0: op = rv_op_c_addi4spn; break;
>           case 1:
>               if (isa == rv128) {
> @@ -2441,9 +2441,9 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>           }
>           break;
>       case 1:
> -        switch (((inst >> 13) & 0b111)) {
> +        switch ((inst >> 13) & 0b111) {
>           case 0:
> -            switch (((inst >> 2) & 0b11111111111)) {
> +            switch ((inst >> 2) & 0b11111111111) {
>               case 0: op = rv_op_c_nop; break;
>               default: op = rv_op_c_addi; break;
>               }
> @@ -2457,13 +2457,13 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               break;
>           case 2: op = rv_op_c_li; break;
>           case 3:
> -            switch (((inst >> 7) & 0b11111)) {
> +            switch ((inst >> 7) & 0b11111) {
>               case 2: op = rv_op_c_addi16sp; break;
>               default: op = rv_op_c_lui; break;
>               }
>               break;
>           case 4:
> -            switch (((inst >> 10) & 0b11)) {
> +            switch ((inst >> 10) & 0b11) {
>               case 0:
>                   op = rv_op_c_srli;
>                   break;
> @@ -2500,7 +2500,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>           }
>           break;
>       case 2:
> -        switch (((inst >> 13) & 0b111)) {
> +        switch ((inst >> 13) & 0b111) {
>           case 0:
>               op = rv_op_c_slli;
>               break;
> @@ -2520,17 +2520,17 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               }
>               break;
>           case 4:
> -            switch (((inst >> 12) & 0b1)) {
> +            switch ((inst >> 12) & 0b1) {
>               case 0:
> -                switch (((inst >> 2) & 0b11111)) {
> +                switch ((inst >> 2) & 0b11111) {
>                   case 0: op = rv_op_c_jr; break;
>                   default: op = rv_op_c_mv; break;
>                   }
>                   break;
>               case 1:
> -                switch (((inst >> 2) & 0b11111)) {
> +                switch ((inst >> 2) & 0b11111) {
>                   case 0:
> -                    switch (((inst >> 7) & 0b11111)) {
> +                    switch ((inst >> 7) & 0b11111) {
>                       case 0: op = rv_op_c_ebreak; break;
>                       default: op = rv_op_c_jalr; break;
>                       }
> @@ -2602,9 +2602,9 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>           }
>           break;
>       case 3:
> -        switch (((inst >> 2) & 0b11111)) {
> +        switch ((inst >> 2) & 0b11111) {
>           case 0:
> -            switch (((inst >> 12) & 0b111)) {
> +            switch ((inst >> 12) & 0b111) {
>               case 0: op = rv_op_lb; break;
>               case 1: op = rv_op_lh; break;
>               case 2: op = rv_op_lw; break;
> @@ -2616,17 +2616,17 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               }
>               break;
>           case 1:
> -            switch (((inst >> 12) & 0b111)) {
> +            switch ((inst >> 12) & 0b111) {
>               case 0:
> -                switch (((inst >> 20) & 0b111111111111)) {
> +                switch ((inst >> 20) & 0b111111111111) {
>                   case 40: op = rv_op_vl1re8_v; break;
>                   case 552: op = rv_op_vl2re8_v; break;
>                   case 1576: op = rv_op_vl4re8_v; break;
>                   case 3624: op = rv_op_vl8re8_v; break;
>                   }
> -                switch (((inst >> 26) & 0b111)) {
> +                switch ((inst >> 26) & 0b111) {
>                   case 0:
> -                    switch (((inst >> 20) & 0b11111)) {
> +                    switch ((inst >> 20) & 0b11111) {
>                       case 0: op = rv_op_vle8_v; break;
>                       case 11: op = rv_op_vlm_v; break;
>                       case 16: op = rv_op_vle8ff_v; break;
> @@ -2641,15 +2641,15 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               case 3: op = rv_op_fld; break;
>               case 4: op = rv_op_flq; break;
>               case 5:
> -                switch (((inst >> 20) & 0b111111111111)) {
> +                switch ((inst >> 20) & 0b111111111111) {
>                   case 40: op = rv_op_vl1re16_v; break;
>                   case 552: op = rv_op_vl2re16_v; break;
>                   case 1576: op = rv_op_vl4re16_v; break;
>                   case 3624: op = rv_op_vl8re16_v; break;
>                   }
> -                switch (((inst >> 26) & 0b111)) {
> +                switch ((inst >> 26) & 0b111) {
>                   case 0:
> -                    switch (((inst >> 20) & 0b11111)) {
> +                    switch ((inst >> 20) & 0b11111) {
>                       case 0: op = rv_op_vle16_v; break;
>                       case 16: op = rv_op_vle16ff_v; break;
>                       }
> @@ -2660,15 +2660,15 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   }
>                   break;
>               case 6:
> -                switch (((inst >> 20) & 0b111111111111)) {
> +                switch ((inst >> 20) & 0b111111111111) {
>                   case 40: op = rv_op_vl1re32_v; break;
>                   case 552: op = rv_op_vl2re32_v; break;
>                   case 1576: op = rv_op_vl4re32_v; break;
>                   case 3624: op = rv_op_vl8re32_v; break;
>                   }
> -                switch (((inst >> 26) & 0b111)) {
> +                switch ((inst >> 26) & 0b111) {
>                   case 0:
> -                    switch (((inst >> 20) & 0b11111)) {
> +                    switch ((inst >> 20) & 0b11111) {
>                       case 0: op = rv_op_vle32_v; break;
>                       case 16: op = rv_op_vle32ff_v; break;
>                       }
> @@ -2679,15 +2679,15 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   }
>                   break;
>               case 7:
> -                switch (((inst >> 20) & 0b111111111111)) {
> +                switch ((inst >> 20) & 0b111111111111) {
>                   case 40: op = rv_op_vl1re64_v; break;
>                   case 552: op = rv_op_vl2re64_v; break;
>                   case 1576: op = rv_op_vl4re64_v; break;
>                   case 3624: op = rv_op_vl8re64_v; break;
>                   }
> -                switch (((inst >> 26) & 0b111)) {
> +                switch ((inst >> 26) & 0b111) {
>                   case 0:
> -                    switch (((inst >> 20) & 0b11111)) {
> +                    switch ((inst >> 20) & 0b11111) {
>                       case 0: op = rv_op_vle64_v; break;
>                       case 16: op = rv_op_vle64ff_v; break;
>                       }
> @@ -2700,25 +2700,25 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               }
>               break;
>           case 3:
> -            switch (((inst >> 12) & 0b111)) {
> +            switch ((inst >> 12) & 0b111) {
>               case 0: op = rv_op_fence; break;
>               case 1: op = rv_op_fence_i; break;
>               case 2: op = rv_op_lq; break;
>               }
>               break;
>           case 4:
> -            switch (((inst >> 12) & 0b111)) {
> +            switch ((inst >> 12) & 0b111) {
>               case 0: op = rv_op_addi; break;
>               case 1:
> -                switch (((inst >> 27) & 0b11111)) {
> +                switch ((inst >> 27) & 0b11111) {
>                   case 0b00000: op = rv_op_slli; break;
>                   case 0b00001:
> -                    switch (((inst >> 20) & 0b1111111)) {
> +                    switch ((inst >> 20) & 0b1111111) {
>                       case 0b0001111: op = rv_op_zip; break;
>                       }
>                       break;
>                   case 0b00010:
> -                    switch (((inst >> 20) & 0b1111111)) {
> +                    switch ((inst >> 20) & 0b1111111) {
>                       case 0b0000000: op = rv_op_sha256sum0; break;
>                       case 0b0000001: op = rv_op_sha256sum1; break;
>                       case 0b0000010: op = rv_op_sha256sig0; break;
> @@ -2733,7 +2733,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                       break;
>                   case 0b00101: op = rv_op_bseti; break;
>                   case 0b00110:
> -                    switch (((inst >> 20) & 0b1111111)) {
> +                    switch ((inst >> 20) & 0b1111111) {
>                       case 0b0000000: op = rv_op_aes64im; break;
>                       default:
>                           if (((inst >> 24) & 0b0111) == 0b001) {
> @@ -2745,7 +2745,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   case 0b01001: op = rv_op_bclri; break;
>                   case 0b01101: op = rv_op_binvi; break;
>                   case 0b01100:
> -                    switch (((inst >> 20) & 0b1111111)) {
> +                    switch ((inst >> 20) & 0b1111111) {
>                       case 0b0000000: op = rv_op_clz; break;
>                       case 0b0000001: op = rv_op_ctz; break;
>                       case 0b0000010: op = rv_op_cpop; break;
> @@ -2760,10 +2760,10 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               case 3: op = rv_op_sltiu; break;
>               case 4: op = rv_op_xori; break;
>               case 5:
> -                switch (((inst >> 27) & 0b11111)) {
> +                switch ((inst >> 27) & 0b11111) {
>                   case 0b00000: op = rv_op_srli; break;
>                   case 0b00001:
> -                    switch (((inst >> 20) & 0b1111111)) {
> +                    switch ((inst >> 20) & 0b1111111) {
>                       case 0b0001111: op = rv_op_unzip; break;
>                       }
>                       break;
> @@ -2786,10 +2786,10 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               break;
>           case 5: op = rv_op_auipc; break;
>           case 6:
> -            switch (((inst >> 12) & 0b111)) {
> +            switch ((inst >> 12) & 0b111) {
>               case 0: op = rv_op_addiw; break;
>               case 1:
> -                switch (((inst >> 26) & 0b111111)) {
> +                switch ((inst >> 26) & 0b111111) {
>                   case 0: op = rv_op_slliw; break;
>                   case 2: op = rv_op_slli_uw; break;
>                   case 24:
> @@ -2802,7 +2802,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   }
>                   break;
>               case 5:
> -                switch (((inst >> 25) & 0b1111111)) {
> +                switch ((inst >> 25) & 0b1111111) {
>                   case 0: op = rv_op_srliw; break;
>                   case 32: op = rv_op_sraiw; break;
>                   case 48: op = rv_op_roriw; break;
> @@ -2811,7 +2811,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               }
>               break;
>           case 8:
> -            switch (((inst >> 12) & 0b111)) {
> +            switch ((inst >> 12) & 0b111) {
>               case 0: op = rv_op_sb; break;
>               case 1: op = rv_op_sh; break;
>               case 2: op = rv_op_sw; break;
> @@ -2820,17 +2820,17 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               }
>               break;
>           case 9:
> -            switch (((inst >> 12) & 0b111)) {
> +            switch ((inst >> 12) & 0b111) {
>               case 0:
> -                switch (((inst >> 20) & 0b111111111111)) {
> +                switch ((inst >> 20) & 0b111111111111) {
>                   case 40: op = rv_op_vs1r_v; break;
>                   case 552: op = rv_op_vs2r_v; break;
>                   case 1576: op = rv_op_vs4r_v; break;
>                   case 3624: op = rv_op_vs8r_v; break;
>                   }
> -                switch (((inst >> 26) & 0b111)) {
> +                switch ((inst >> 26) & 0b111) {
>                   case 0:
> -                    switch (((inst >> 20) & 0b11111)) {
> +                    switch ((inst >> 20) & 0b11111) {
>                       case 0: op = rv_op_vse8_v; break;
>                       case 11: op = rv_op_vsm_v; break;
>                       }
> @@ -2844,9 +2844,9 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               case 3: op = rv_op_fsd; break;
>               case 4: op = rv_op_fsq; break;
>               case 5:
> -                switch (((inst >> 26) & 0b111)) {
> +                switch ((inst >> 26) & 0b111) {
>                   case 0:
> -                    switch (((inst >> 20) & 0b11111)) {
> +                    switch ((inst >> 20) & 0b11111) {
>                       case 0: op = rv_op_vse16_v; break;
>                       }
>                       break;
> @@ -2856,9 +2856,9 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   }
>                   break;
>               case 6:
> -                switch (((inst >> 26) & 0b111)) {
> +                switch ((inst >> 26) & 0b111) {
>                   case 0:
> -                    switch (((inst >> 20) & 0b11111)) {
> +                    switch ((inst >> 20) & 0b11111) {
>                       case 0: op = rv_op_vse32_v; break;
>                       }
>                       break;
> @@ -2868,9 +2868,9 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   }
>                   break;
>               case 7:
> -                switch (((inst >> 26) & 0b111)) {
> +                switch ((inst >> 26) & 0b111) {
>                   case 0:
> -                    switch (((inst >> 20) & 0b11111)) {
> +                    switch ((inst >> 20) & 0b11111) {
>                       case 0: op = rv_op_vse64_v; break;
>                       }
>                       break;
> @@ -2891,17 +2891,17 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               case 11: op = rv_op_amoswap_d; break;
>               case 12: op = rv_op_amoswap_q; break;
>               case 18:
> -                switch (((inst >> 20) & 0b11111)) {
> +                switch ((inst >> 20) & 0b11111) {
>                   case 0: op = rv_op_lr_w; break;
>                   }
>                   break;
>               case 19:
> -                switch (((inst >> 20) & 0b11111)) {
> +                switch ((inst >> 20) & 0b11111) {
>                   case 0: op = rv_op_lr_d; break;
>                   }
>                   break;
>               case 20:
> -                switch (((inst >> 20) & 0b11111)) {
> +                switch ((inst >> 20) & 0b11111) {
>                   case 0: op = rv_op_lr_q; break;
>                   }
>                   break;
> @@ -3031,35 +3031,35 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               }
>               break;
>           case 16:
> -            switch (((inst >> 25) & 0b11)) {
> +            switch ((inst >> 25) & 0b11) {
>               case 0: op = rv_op_fmadd_s; break;
>               case 1: op = rv_op_fmadd_d; break;
>               case 3: op = rv_op_fmadd_q; break;
>               }
>               break;
>           case 17:
> -            switch (((inst >> 25) & 0b11)) {
> +            switch ((inst >> 25) & 0b11) {
>               case 0: op = rv_op_fmsub_s; break;
>               case 1: op = rv_op_fmsub_d; break;
>               case 3: op = rv_op_fmsub_q; break;
>               }
>               break;
>           case 18:
> -            switch (((inst >> 25) & 0b11)) {
> +            switch ((inst >> 25) & 0b11) {
>               case 0: op = rv_op_fnmsub_s; break;
>               case 1: op = rv_op_fnmsub_d; break;
>               case 3: op = rv_op_fnmsub_q; break;
>               }
>               break;
>           case 19:
> -            switch (((inst >> 25) & 0b11)) {
> +            switch ((inst >> 25) & 0b11) {
>               case 0: op = rv_op_fnmadd_s; break;
>               case 1: op = rv_op_fnmadd_d; break;
>               case 3: op = rv_op_fnmadd_q; break;
>               }
>               break;
>           case 20:
> -            switch (((inst >> 25) & 0b1111111)) {
> +            switch ((inst >> 25) & 0b1111111) {
>               case 0: op = rv_op_fadd_s; break;
>               case 1: op = rv_op_fadd_d; break;
>               case 3: op = rv_op_fadd_q; break;
> @@ -3073,100 +3073,100 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               case 13: op = rv_op_fdiv_d; break;
>               case 15: op = rv_op_fdiv_q; break;
>               case 16:
> -                switch (((inst >> 12) & 0b111)) {
> +                switch ((inst >> 12) & 0b111) {
>                   case 0: op = rv_op_fsgnj_s; break;
>                   case 1: op = rv_op_fsgnjn_s; break;
>                   case 2: op = rv_op_fsgnjx_s; break;
>                   }
>                   break;
>               case 17:
> -                switch (((inst >> 12) & 0b111)) {
> +                switch ((inst >> 12) & 0b111) {
>                   case 0: op = rv_op_fsgnj_d; break;
>                   case 1: op = rv_op_fsgnjn_d; break;
>                   case 2: op = rv_op_fsgnjx_d; break;
>                   }
>                   break;
>               case 19:
> -                switch (((inst >> 12) & 0b111)) {
> +                switch ((inst >> 12) & 0b111) {
>                   case 0: op = rv_op_fsgnj_q; break;
>                   case 1: op = rv_op_fsgnjn_q; break;
>                   case 2: op = rv_op_fsgnjx_q; break;
>                   }
>                   break;
>               case 20:
> -                switch (((inst >> 12) & 0b111)) {
> +                switch ((inst >> 12) & 0b111) {
>                   case 0: op = rv_op_fmin_s; break;
>                   case 1: op = rv_op_fmax_s; break;
>                   }
>                   break;
>               case 21:
> -                switch (((inst >> 12) & 0b111)) {
> +                switch ((inst >> 12) & 0b111) {
>                   case 0: op = rv_op_fmin_d; break;
>                   case 1: op = rv_op_fmax_d; break;
>                   }
>                   break;
>               case 23:
> -                switch (((inst >> 12) & 0b111)) {
> +                switch ((inst >> 12) & 0b111) {
>                   case 0: op = rv_op_fmin_q; break;
>                   case 1: op = rv_op_fmax_q; break;
>                   }
>                   break;
>               case 32:
> -                switch (((inst >> 20) & 0b11111)) {
> +                switch ((inst >> 20) & 0b11111) {
>                   case 1: op = rv_op_fcvt_s_d; break;
>                   case 3: op = rv_op_fcvt_s_q; break;
>                   }
>                   break;
>               case 33:
> -                switch (((inst >> 20) & 0b11111)) {
> +                switch ((inst >> 20) & 0b11111) {
>                   case 0: op = rv_op_fcvt_d_s; break;
>                   case 3: op = rv_op_fcvt_d_q; break;
>                   }
>                   break;
>               case 35:
> -                switch (((inst >> 20) & 0b11111)) {
> +                switch ((inst >> 20) & 0b11111) {
>                   case 0: op = rv_op_fcvt_q_s; break;
>                   case 1: op = rv_op_fcvt_q_d; break;
>                   }
>                   break;
>               case 44:
> -                switch (((inst >> 20) & 0b11111)) {
> +                switch ((inst >> 20) & 0b11111) {
>                   case 0: op = rv_op_fsqrt_s; break;
>                   }
>                   break;
>               case 45:
> -                switch (((inst >> 20) & 0b11111)) {
> +                switch ((inst >> 20) & 0b11111) {
>                   case 0: op = rv_op_fsqrt_d; break;
>                   }
>                   break;
>               case 47:
> -                switch (((inst >> 20) & 0b11111)) {
> +                switch ((inst >> 20) & 0b11111) {
>                   case 0: op = rv_op_fsqrt_q; break;
>                   }
>                   break;
>               case 80:
> -                switch (((inst >> 12) & 0b111)) {
> +                switch ((inst >> 12) & 0b111) {
>                   case 0: op = rv_op_fle_s; break;
>                   case 1: op = rv_op_flt_s; break;
>                   case 2: op = rv_op_feq_s; break;
>                   }
>                   break;
>               case 81:
> -                switch (((inst >> 12) & 0b111)) {
> +                switch ((inst >> 12) & 0b111) {
>                   case 0: op = rv_op_fle_d; break;
>                   case 1: op = rv_op_flt_d; break;
>                   case 2: op = rv_op_feq_d; break;
>                   }
>                   break;
>               case 83:
> -                switch (((inst >> 12) & 0b111)) {
> +                switch ((inst >> 12) & 0b111) {
>                   case 0: op = rv_op_fle_q; break;
>                   case 1: op = rv_op_flt_q; break;
>                   case 2: op = rv_op_feq_q; break;
>                   }
>                   break;
>               case 96:
> -                switch (((inst >> 20) & 0b11111)) {
> +                switch ((inst >> 20) & 0b11111) {
>                   case 0: op = rv_op_fcvt_w_s; break;
>                   case 1: op = rv_op_fcvt_wu_s; break;
>                   case 2: op = rv_op_fcvt_l_s; break;
> @@ -3174,7 +3174,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   }
>                   break;
>               case 97:
> -                switch (((inst >> 20) & 0b11111)) {
> +                switch ((inst >> 20) & 0b11111) {
>                   case 0: op = rv_op_fcvt_w_d; break;
>                   case 1: op = rv_op_fcvt_wu_d; break;
>                   case 2: op = rv_op_fcvt_l_d; break;
> @@ -3182,7 +3182,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   }
>                   break;
>               case 99:
> -                switch (((inst >> 20) & 0b11111)) {
> +                switch ((inst >> 20) & 0b11111) {
>                   case 0: op = rv_op_fcvt_w_q; break;
>                   case 1: op = rv_op_fcvt_wu_q; break;
>                   case 2: op = rv_op_fcvt_l_q; break;
> @@ -3190,7 +3190,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   }
>                   break;
>               case 104:
> -                switch (((inst >> 20) & 0b11111)) {
> +                switch ((inst >> 20) & 0b11111) {
>                   case 0: op = rv_op_fcvt_s_w; break;
>                   case 1: op = rv_op_fcvt_s_wu; break;
>                   case 2: op = rv_op_fcvt_s_l; break;
> @@ -3198,7 +3198,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   }
>                   break;
>               case 105:
> -                switch (((inst >> 20) & 0b11111)) {
> +                switch ((inst >> 20) & 0b11111) {
>                   case 0: op = rv_op_fcvt_d_w; break;
>                   case 1: op = rv_op_fcvt_d_wu; break;
>                   case 2: op = rv_op_fcvt_d_l; break;
> @@ -3206,7 +3206,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   }
>                   break;
>               case 107:
> -                switch (((inst >> 20) & 0b11111)) {
> +                switch ((inst >> 20) & 0b11111) {
>                   case 0: op = rv_op_fcvt_q_w; break;
>                   case 1: op = rv_op_fcvt_q_wu; break;
>                   case 2: op = rv_op_fcvt_q_l; break;
> @@ -3255,9 +3255,9 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               }
>               break;
>           case 21:
> -            switch (((inst >> 12) & 0b111)) {
> +            switch ((inst >> 12) & 0b111) {
>               case 0:
> -                switch (((inst >> 26) & 0b111111)) {
> +                switch ((inst >> 26) & 0b111111) {
>                   case 0: op = rv_op_vadd_vv; break;
>                   case 2: op = rv_op_vsub_vv; break;
>                   case 4: op = rv_op_vminu_vv; break;
> @@ -3312,7 +3312,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   }
>                   break;
>               case 1:
> -                switch (((inst >> 26) & 0b111111)) {
> +                switch ((inst >> 26) & 0b111111) {
>                   case 0: op = rv_op_vfadd_vv; break;
>                   case 1: op = rv_op_vfredusum_vs; break;
>                   case 2: op = rv_op_vfsub_vv; break;
> @@ -3325,12 +3325,12 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   case 9: op = rv_op_vfsgnjn_vv; break;
>                   case 10: op = rv_op_vfsgnjx_vv; break;
>                   case 16:
> -                    switch (((inst >> 15) & 0b11111)) {
> +                    switch ((inst >> 15) & 0b11111) {
>                       case 0: if ((inst >> 25) & 1) op = rv_op_vfmv_f_s; break;
>                       }
>                       break;
>                   case 18:
> -                    switch (((inst >> 15) & 0b11111)) {
> +                    switch ((inst >> 15) & 0b11111) {
>                       case 0: op = rv_op_vfcvt_xu_f_v; break;
>                       case 1: op = rv_op_vfcvt_x_f_v; break;
>                       case 2: op = rv_op_vfcvt_f_xu_v; break;
> @@ -3355,7 +3355,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                       }
>                       break;
>                   case 19:
> -                    switch (((inst >> 15) & 0b11111)) {
> +                    switch ((inst >> 15) & 0b11111) {
>                       case 0: op = rv_op_vfsqrt_v; break;
>                       case 4: op = rv_op_vfrsqrt7_v; break;
>                       case 5: op = rv_op_vfrec7_v; break;
> @@ -3390,7 +3390,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   }
>                   break;
>               case 2:
> -                switch (((inst >> 26) & 0b111111)) {
> +                switch ((inst >> 26) & 0b111111) {
>                   case 0: op = rv_op_vredsum_vs; break;
>                   case 1: op = rv_op_vredand_vs; break;
>                   case 2: op = rv_op_vredor_vs; break;
> @@ -3404,14 +3404,14 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   case 10: op = rv_op_vasubu_vv; break;
>                   case 11: op = rv_op_vasub_vv; break;
>                   case 16:
> -                    switch (((inst >> 15) & 0b11111)) {
> +                    switch ((inst >> 15) & 0b11111) {
>                       case 0: if ((inst >> 25) & 1) op = rv_op_vmv_x_s; break;
>                       case 16: op = rv_op_vcpop_m; break;
>                       case 17: op = rv_op_vfirst_m; break;
>                       }
>                       break;
>                   case 18:
> -                    switch (((inst >> 15) & 0b11111)) {
> +                    switch ((inst >> 15) & 0b11111) {
>                       case 2: op = rv_op_vzext_vf8; break;
>                       case 3: op = rv_op_vsext_vf8; break;
>                       case 4: op = rv_op_vzext_vf4; break;
> @@ -3421,7 +3421,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                       }
>                       break;
>                   case 20:
> -                    switch (((inst >> 15) & 0b11111)) {
> +                    switch ((inst >> 15) & 0b11111) {
>                       case 1: op = rv_op_vmsbf_m;  break;
>                       case 2: op = rv_op_vmsof_m; break;
>                       case 3: op = rv_op_vmsif_m; break;
> @@ -3471,7 +3471,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   }
>                   break;
>               case 3:
> -                switch (((inst >> 26) & 0b111111)) {
> +                switch ((inst >> 26) & 0b111111) {
>                   case 0: op = rv_op_vadd_vi; break;
>                   case 3: op = rv_op_vrsub_vi; break;
>                   case 9: op = rv_op_vand_vi; break;
> @@ -3502,7 +3502,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   case 33: op = rv_op_vsadd_vi; break;
>                   case 37: op = rv_op_vsll_vi; break;
>                   case 39:
> -                    switch (((inst >> 15) & 0b11111)) {
> +                    switch ((inst >> 15) & 0b11111) {
>                       case 0: op = rv_op_vmv1r_v; break;
>                       case 1: op = rv_op_vmv2r_v; break;
>                       case 3: op = rv_op_vmv4r_v; break;
> @@ -3520,7 +3520,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   }
>                   break;
>               case 4:
> -                switch (((inst >> 26) & 0b111111)) {
> +                switch ((inst >> 26) & 0b111111) {
>                   case 0: op = rv_op_vadd_vx; break;
>                   case 2: op = rv_op_vsub_vx; break;
>                   case 3: op = rv_op_vrsub_vx; break;
> @@ -3577,7 +3577,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   }
>                   break;
>               case 5:
> -                switch (((inst >> 26) & 0b111111)) {
> +                switch ((inst >> 26) & 0b111111) {
>                   case 0: op = rv_op_vfadd_vf; break;
>                   case 2: op = rv_op_vfsub_vf; break;
>                   case 4: op = rv_op_vfmin_vf; break;
> @@ -3588,7 +3588,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   case 14: op = rv_op_vfslide1up_vf; break;
>                   case 15: op = rv_op_vfslide1down_vf; break;
>                   case 16:
> -                    switch (((inst >> 20) & 0b11111)) {
> +                    switch ((inst >> 20) & 0b11111) {
>                       case 0: if ((inst >> 25) & 1) op = rv_op_vfmv_s_f; break;
>                       }
>                       break;
> @@ -3628,7 +3628,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   }
>                   break;
>               case 6:
> -                switch (((inst >> 26) & 0b111111)) {
> +                switch ((inst >> 26) & 0b111111) {
>                   case 8: op = rv_op_vaaddu_vx; break;
>                   case 9: op = rv_op_vaadd_vx; break;
>                   case 10: op = rv_op_vasubu_vx; break;
> @@ -3636,7 +3636,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   case 14: op = rv_op_vslide1up_vx; break;
>                   case 15: op = rv_op_vslide1down_vx; break;
>                   case 16:
> -                    switch (((inst >> 20) & 0b11111)) {
> +                    switch ((inst >> 20) & 0b11111) {
>                       case 0: if ((inst >> 25) & 1) op = rv_op_vmv_s_x; break;
>                       }
>                       break;
> @@ -3681,15 +3681,15 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               }
>               break;
>           case 22:
> -            switch (((inst >> 12) & 0b111)) {
> +            switch ((inst >> 12) & 0b111) {
>               case 0: op = rv_op_addid; break;
>               case 1:
> -                switch (((inst >> 26) & 0b111111)) {
> +                switch ((inst >> 26) & 0b111111) {
>                   case 0: op = rv_op_sllid; break;
>                   }
>                   break;
>               case 5:
> -                switch (((inst >> 26) & 0b111111)) {
> +                switch ((inst >> 26) & 0b111111) {
>                   case 0: op = rv_op_srlid; break;
>                   case 16: op = rv_op_sraid; break;
>                   }
> @@ -3697,7 +3697,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               }
>               break;
>           case 24:
> -            switch (((inst >> 12) & 0b111)) {
> +            switch ((inst >> 12) & 0b111) {
>               case 0: op = rv_op_beq; break;
>               case 1: op = rv_op_bne; break;
>               case 4: op = rv_op_blt; break;
> @@ -3707,33 +3707,33 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>               }
>               break;
>           case 25:
> -            switch (((inst >> 12) & 0b111)) {
> +            switch ((inst >> 12) & 0b111) {
>               case 0: op = rv_op_jalr; break;
>               }
>               break;
>           case 27: op = rv_op_jal; break;
>           case 28:
> -            switch (((inst >> 12) & 0b111)) {
> +            switch ((inst >> 12) & 0b111) {
>               case 0:
>                   switch (((inst >> 20) & 0b111111100000) |
>                           ((inst >> 7) & 0b000000011111)) {
>                   case 0:
> -                    switch (((inst >> 15) & 0b1111111111)) {
> +                    switch ((inst >> 15) & 0b1111111111) {
>                       case 0: op = rv_op_ecall; break;
>                       case 32: op = rv_op_ebreak; break;
>                       case 64: op = rv_op_uret; break;
>                       }
>                       break;
>                   case 256:
> -                    switch (((inst >> 20) & 0b11111)) {
> +                    switch ((inst >> 20) & 0b11111) {
>                       case 2:
> -                        switch (((inst >> 15) & 0b11111)) {
> +                        switch ((inst >> 15) & 0b11111) {
>                           case 0: op = rv_op_sret; break;
>                           }
>                           break;
>                       case 4: op = rv_op_sfence_vm; break;
>                       case 5:
> -                        switch (((inst >> 15) & 0b11111)) {
> +                        switch ((inst >> 15) & 0b11111) {
>                           case 0: op = rv_op_wfi; break;
>                           }
>                           break;
> @@ -3741,17 +3741,17 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                       break;
>                   case 288: op = rv_op_sfence_vma; break;
>                   case 512:
> -                    switch (((inst >> 15) & 0b1111111111)) {
> +                    switch ((inst >> 15) & 0b1111111111) {
>                       case 64: op = rv_op_hret; break;
>                       }
>                       break;
>                   case 768:
> -                    switch (((inst >> 15) & 0b1111111111)) {
> +                    switch ((inst >> 15) & 0b1111111111) {
>                       case 64: op = rv_op_mret; break;
>                       }
>                       break;
>                   case 1952:
> -                    switch (((inst >> 15) & 0b1111111111)) {
> +                    switch ((inst >> 15) & 0b1111111111) {
>                       case 576: op = rv_op_dret; break;
>                       }
>                       break;
> @@ -4603,7 +4603,8 @@ static size_t inst_length(rv_inst inst)
>   {
>       /* NOTE: supports maximum instruction size of 64-bits */
>   
> -    /* instruction length coding
> +    /*
> +     * instruction length coding
>        *
>        *      aa - 16 bit aa != 11
>        *   bbb11 - 32 bit bbb != 111

