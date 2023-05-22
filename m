Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D89C7EE26
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 May 2023 13:00:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q159N-00058L-9h; Mon, 22 May 2023 09:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q159G-00053t-Fe
 for qemu-riscv@nongnu.org; Mon, 22 May 2023 09:00:30 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q159D-0005Ny-KE
 for qemu-riscv@nongnu.org; Mon, 22 May 2023 09:00:26 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-19b3d4ac35cso1357326fac.1
 for <qemu-riscv@nongnu.org>; Mon, 22 May 2023 06:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1684760420; x=1687352420;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pYRnNL/XuxY+CsDTOay3JDZb2c9dL/5GxeSq1tTqfN4=;
 b=HxnSOdfafPlQBpi/7FR44ZqehJXP8pErDpovOhFyJuSxbvpdM5nj1coPMTw31qqJAi
 3DhAP0HBx/xo8+Aw/ozABecjpJaOcwQRGiQvP1VLwNqZjr38kpUC9qX4KWw+KX/w694W
 BlNumTiS6LGIt70JuK/aXUCiBvGI+EfOU/zTNV954ADpRp4hw7Hza1H4Gnxq0A3LnCka
 jwwk6LIlaQn8nrQp3hfGiSpVrqJboT0hUk7szxsAuCGtT9F6dedBFweG6lj9ACdxlMyj
 t3DoXBmxsvLsd4/Rz0oJFsnGo2hb3P0oncaStt9nSH7U/+4nQtsEZpJBKJfYBpo95zkb
 UCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684760420; x=1687352420;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pYRnNL/XuxY+CsDTOay3JDZb2c9dL/5GxeSq1tTqfN4=;
 b=KHfX/rN4A+57S4dDW16LexcyNa+IoNguOi679cNJfSpzWrg+XHqaEoawmBlkvAEldB
 UhVp6eYcsUFPDmQ9VVpJm6E3RazYsjFqioUdlS9OkPjlwsTlDQrzS50k05zF1or08jsA
 THzuk5IT07ECDDnXLeJIqN6DPu1OsgrKYF9OAemJUktJGKWuCb1IvEk1TdFh+Ui2Bx8H
 WJcNchbsAxW9aFC4EBVnpxvZ+pN+WaKeCafMnssXGeWX5amynsPEdgYinetED7nhlNNk
 oKfEXIOY0xew+uWcjqt1AWOyWhOJWAqRYMG28gxAo9g0SAEETnrjRTE9ajBfUBBmPOza
 WFfA==
X-Gm-Message-State: AC+VfDzHxZ16e/F6/50yVf/lo9sKBko753O2wjMSP/qepai2zlWb6V8x
 JjvgZ5p8fV+aeptoPzR2yhjgoA==
X-Google-Smtp-Source: ACHHUZ4CMts0gk5J/tcZgJFdSVe0oZpqHwLGCp+PirihFGb3yC7azq9QlD4luzxise1wQGAjy5uUkA==
X-Received: by 2002:a05:6870:d4c1:b0:199:ccad:7dcb with SMTP id
 l1-20020a056870d4c100b00199ccad7dcbmr4738012oai.58.1684760420184; 
 Mon, 22 May 2023 06:00:20 -0700 (PDT)
Received: from [192.168.68.107] ([179.111.98.125])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a05687072c200b0017e0c13b29asm2420353oak.36.2023.05.22.06.00.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 06:00:19 -0700 (PDT)
Message-ID: <ed91c669-a2b1-116a-669e-78f469f7c9fc@ventanamicro.com>
Date: Mon, 22 May 2023 10:00:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/7] disas/riscv.c: Support disas for Zcm* extensions
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230519021926.15362-1-liweiwei@iscas.ac.cn>
 <20230519021926.15362-4-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230519021926.15362-4-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 5/18/23 23:19, Weiwei Li wrote:
> Support disas for Zcmt* instructions only when related extensions
> are supported.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   disas/riscv.c | 20 ++++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 729ab684da..9e01810eef 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -2501,7 +2501,7 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   op = rv_op_c_sqsp;
>               } else {
>                   op = rv_op_c_fsdsp;
> -                if (((inst >> 12) & 0b01)) {
> +                if (dec->cfg->ext_zcmp && ((inst >> 12) & 0b01)) {
>                       switch ((inst >> 8) & 0b01111) {
>                       case 8:
>                           if (((inst >> 4) & 0b01111) >= 4) {
> @@ -2527,16 +2527,20 @@ static void decode_inst_opcode(rv_decode *dec, rv_isa isa)
>                   } else {
>                       switch ((inst >> 10) & 0b011) {
>                       case 0:
> -                        if (((inst >> 2) & 0xFF) >= 32) {
> -                            op = rv_op_cm_jalt;
> -                        } else {
> -                            op = rv_op_cm_jt;
> +                        if (dec->cfg->ext_zcmt) {
> +                            if (((inst >> 2) & 0xFF) >= 32) {
> +                                op = rv_op_cm_jalt;
> +                            } else {
> +                                op = rv_op_cm_jt;
> +                            }

In this code, since you're not doing anything if dec->cfg->ext_zcmt is not set,
you could also break earlier and avoid changing the other lines:


>                       case 0:
> +                     if (!dec->cfg->ext_zcmt) {
> +                         break;
> +                     }
>                       if (((inst >> 2) & 0xFF) >= 32) {
>                           op = rv_op_cm_jalt;
>                       } else {
>                           op = rv_op_cm_jt;
>                       }
>                       break;

     >                           }
>                           break;
>                       case 3:
> -                        switch ((inst >> 5) & 0b011) {
> -                        case 1: op = rv_op_cm_mvsa01; break;
> -                        case 3: op = rv_op_cm_mva01s; break;
> +                        if (dec->cfg->ext_zcmp) {
> +                            switch ((inst >> 5) & 0b011) {
> +                            case 1: op = rv_op_cm_mvsa01; break;
> +                            case 3: op = rv_op_cm_mva01s; break;
> +                            }


Same thing here.


These are minor stylistic comments.


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>                           }
>                           break;
>                       }

