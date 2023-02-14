Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRvNq-0007Lu-RA
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 08:30:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRvNo-0007LW-LP
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 08:30:08 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRvNm-0002qM-Pq
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 08:30:08 -0500
Received: by mail-oi1-x234.google.com with SMTP id bj22so12963374oib.11
 for <qemu-riscv@nongnu.org>; Tue, 14 Feb 2023 05:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yXsbUTKOnjsxr8uUpT1merg/NTjD+yau1ZuE3Ccy5W4=;
 b=SsWGhUnC4hAT1l3dzzhYLpC20O/JOIL8M1DHAk9O/ve9kI47mbp1/XUdbUiNHdtwxV
 6wibh247Xk66hKqkmK2VTzWMgk/FvGOA1dg4LwDOuLOYpyM0Xbv/E7GNCvTF1EAMBccm
 6DxY9jF4l9lMgqqXBANDUpuCyJR+PNZoYmaVmL/uD1Q6gE3wkXavYbhPA3eq2VbXdrEO
 mw5rAz/yaPaffNLTJgtZi8GlQyTSnNVq0RmylnDcKaOVa2wvoctxnIJzTVMckHHHvYXq
 RBZSd1Xo11vNpXTGsogMKbYKgI5eACKJeeq9xKZgbRuDJiTRePSTTz57E3u0uLcwDMBB
 ltEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yXsbUTKOnjsxr8uUpT1merg/NTjD+yau1ZuE3Ccy5W4=;
 b=75S40SF3X/PjQq+UDWTU3uuC847roAAI+sm7IxyGrgcnIWbQKvoKFPkvX7CUJK16vq
 bOsXENTcsg8a/wfOssbwtAYUbbnew0xve0iJBXI1NpuoTTeVtKmp/ORg7JIKdWfzhOP/
 Rk8O6/vXw0Ff4LPfs2nNdLRKJUtyhr1PQU9ZFOgfoxJoL0JKOGtx3oTH3HuswJ7mxuwM
 Vc+6ea0oDKkYWwrpwRCMD05PSE+oTtUIjkquax/oeWbYu0tCDc9K9rhU2MYyTpSO90g5
 4Relc1zWrkvdHRdC67Rv5pFaX/UTEDGwfxxBOUF6sDfIKWj7/Kz4O/44s3UPQLP08VhR
 1Gww==
X-Gm-Message-State: AO0yUKUe7vUolS6zieu8RpCxnVUmyrfGlkscujIAr2tfO7iMc0P5dlEi
 Y+4BOGUC9gIrqCzC048EDYE43A==
X-Google-Smtp-Source: AK7set9k3aiJOny4LRxr0xXbDesUG/2FPKzp2MZHSVtPYWaAwbiUyQ1DD4P8CM/wBxNVxtrncogIKg==
X-Received: by 2002:a05:6808:117:b0:37b:77fb:235a with SMTP id
 b23-20020a056808011700b0037b77fb235amr846025oie.50.1676381405434; 
 Tue, 14 Feb 2023 05:30:05 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a056808209000b0037d74967ef6sm3937140oiw.44.2023.02.14.05.30.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 05:30:04 -0800 (PST)
Message-ID: <3c6d7c2f-195c-1464-0fa5-9487dbff0dce@ventanamicro.com>
Date: Tue, 14 Feb 2023 10:30:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Patch 11/14] target/riscv: Add support for Zvfh/zvfhmin
 extensions
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230214083833.44205-1-liweiwei@iscas.ac.cn>
 <20230214083833.44205-12-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230214083833.44205-12-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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
X-List-Received-Date: Tue, 14 Feb 2023 13:30:08 -0000



On 2/14/23 05:38, Weiwei Li wrote:
> Zvfh supports vector float point instuctions with SEW = 16

s/instuctions/instructions

> and supports conversions between 8-bit integers adn binary16 values

s/adn/and

> 
> Zvfhmin supports vfwcvt.f.f.v and vfncvt.f.f.w instructions
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   target/riscv/insn_trans/trans_rvv.c.inc | 31 +++++++++++++++++++++++--
>   1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 9053759546..9b2c5c9ac0 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -40,6 +40,7 @@ static bool require_rvf(DisasContext *s)
>   
>       switch (s->sew) {
>       case MO_16:
> +        return s->cfg_ptr->ext_zvfh;
>       case MO_32:
>           return s->cfg_ptr->ext_zve32f;
>       case MO_64:
> @@ -57,6 +58,25 @@ static bool require_scale_rvf(DisasContext *s)
>   
>       switch (s->sew) {
>       case MO_8:
> +        return s->cfg_ptr->ext_zvfh;
> +    case MO_16:
> +        return s->cfg_ptr->ext_zve32f;
> +    case MO_32:
> +        return s->cfg_ptr->ext_zve64d;
> +    default:
> +        return false;
> +    }
> +}
> +
> +static bool require_scale_rvfmin(DisasContext *s)
> +{
> +    if (s->mstatus_fs == 0) {
> +        return false;
> +    }
> +
> +    switch (s->sew) {
> +    case MO_8:
> +        return s->cfg_ptr->ext_zvfhmin;
>       case MO_16:
>           return s->cfg_ptr->ext_zve32f;
>       case MO_32:
> @@ -2798,7 +2818,7 @@ static bool opxfv_widen_check(DisasContext *s, arg_rmr *a)
>   static bool opffv_widen_check(DisasContext *s, arg_rmr *a)
>   {
>       return opfv_widen_check(s, a) &&
> -           require_scale_rvf(s) &&
> +           require_scale_rvfmin(s) &&
>              (s->sew != MO_8);
>   }
>   
> @@ -2909,6 +2929,13 @@ static bool opfxv_narrow_check(DisasContext *s, arg_rmr *a)
>   }
>   
>   static bool opffv_narrow_check(DisasContext *s, arg_rmr *a)
> +{
> +    return opfv_narrow_check(s, a) &&
> +           require_scale_rvfmin(s) &&
> +           (s->sew != MO_8);
> +}
> +
> +static bool opffv_rod_narrow_check(DisasContext *s, arg_rmr *a)
>   {
>       return opfv_narrow_check(s, a) &&
>              require_scale_rvf(s) &&
> @@ -2952,7 +2979,7 @@ GEN_OPFV_NARROW_TRANS(vfncvt_f_x_w, opfxv_narrow_check, vfncvt_f_x_w,
>   GEN_OPFV_NARROW_TRANS(vfncvt_f_f_w, opffv_narrow_check, vfncvt_f_f_w,
>                         RISCV_FRM_DYN)
>   /* Reuse the helper function from vfncvt.f.f.w */
> -GEN_OPFV_NARROW_TRANS(vfncvt_rod_f_f_w, opffv_narrow_check, vfncvt_f_f_w,
> +GEN_OPFV_NARROW_TRANS(vfncvt_rod_f_f_w, opffv_rod_narrow_check, vfncvt_f_f_w,
>                         RISCV_FRM_ROD)
>   
>   static bool opxfv_narrow_check(DisasContext *s, arg_rmr *a)

