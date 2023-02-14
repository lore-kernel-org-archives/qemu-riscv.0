Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRvR1-0000fp-8M
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 08:33:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRvQy-0000fM-8o
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 08:33:24 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRvQw-0006Nv-Er
 for qemu-riscv@nongnu.org; Tue, 14 Feb 2023 08:33:24 -0500
Received: by mail-oi1-x22f.google.com with SMTP id s17so12945754ois.10
 for <qemu-riscv@nongnu.org>; Tue, 14 Feb 2023 05:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XZduQmscR/YtAnaZ7HruDvUXoLea9VnpvTgTGh7Bo0c=;
 b=HQqd11/8Te0g73JlCPdwprmN7tXovQOrLbXU5uYg3D7rdS6a+R3Wk8Abdz1gYFwSpc
 RJbhleP916k5Ilh948xg/IY2qmMIThd5OZKBJVoTR/J6QoghYSC+RprYRcv6gK7Re0pT
 IkWHHXXGLs2icI0ylYDHO9zq7OuHC3t6J5c8miRi8hALCxqbXdLWoU846XE/+XqN4z5i
 LINAgBPkWCJEb3809aHvhBAnP9Vw0urhttCrgjKS+8xdviSJMKpz+Km+DIlmI0y0BxZO
 ORHvflWVH3ekbj7SIp4yWrMNSVaP0P+AircO5WBvVsFUvMRq/e0FFULGqOTF2qwRPGcO
 a6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XZduQmscR/YtAnaZ7HruDvUXoLea9VnpvTgTGh7Bo0c=;
 b=ql+i0k/mkkENvuSk8zNWcN3tpcUV90mzPRNn3FQsNgjVOt39rwt21HziddKGYWM9uz
 4MSh7AUBksTgTxKI5e1cthFv9u6p/maX6hjTB+m6fChj89fk+7YaKWVPEkjCTViFDHxV
 RC1/mXvsnkloIvJgDKXrxed3ucUSwMMbaF5ZdehNF/XkMr7yhSEYkBcmGnaqF8EdJzB8
 Pk9KB8DohY7iMmrSJa39zFilAjDtMoKpgsJRWH70wQbRrxIDaJ4QPhn/UZMIaik2NMQW
 +9OD1ufJMn30AEQu8ScksLFcHbXJUQQQzDy35AHBuw2NIdtD5gEXNlVwyYXhdeNd1qCq
 tQgA==
X-Gm-Message-State: AO0yUKXyKN++HAH0H7vJOMSMcLUB2/zLHFnMA0JWRowFrknihXn/hDTN
 OgGVuUxp3USVm++EhI2nrztMDOIMdUDK35li
X-Google-Smtp-Source: AK7set/qXsLHhK9oRVgPaYwrZ+X8RMNxyRD5jANbK15pkGd+/7Q6XiqZzW1OGL+frvV2NWX5u4KnIw==
X-Received: by 2002:a05:6808:2907:b0:378:9d08:5d34 with SMTP id
 ev7-20020a056808290700b003789d085d34mr919187oib.8.1676381599622; 
 Tue, 14 Feb 2023 05:33:19 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 q185-20020acac0c2000000b0035a9003b8edsm6086760oif.40.2023.02.14.05.33.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 05:33:19 -0800 (PST)
Message-ID: <d4c0ed02-f780-bebe-ffb4-7329f4007998@ventanamicro.com>
Date: Tue, 14 Feb 2023 10:33:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Patch 12/14] target/riscv: Fix check for vectore load/store
 instructions when EEW=64
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230214083833.44205-1-liweiwei@iscas.ac.cn>
 <20230214083833.44205-13-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230214083833.44205-13-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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
X-List-Received-Date: Tue, 14 Feb 2023 13:33:24 -0000

Nit in the title: I believe you meant vector. "Vettore" would be fine too.

On 2/14/23 05:38, Weiwei Li wrote:
> The V extension supports all vector load and store instructions except
> the V extension does not support EEW=64 for index values when XLEN=32
> (Section 18.3)
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/insn_trans/trans_rvv.c.inc | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 9b2c5c9ac0..5dbdce073b 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -287,13 +287,12 @@ static bool vext_check_st_index(DisasContext *s, int vd, int vs2, int nf,
>                  require_nf(vd, nf, s->lmul);
>   
>       /*
> -     * All Zve* extensions support all vector load and store instructions,
> -     * except Zve64* extensions do not support EEW=64 for index values
> -     * when XLEN=32. (Section 18.2)
> +     * V extension supports all vector load and store instructions,
> +     * except V extension does not support EEW=64 for index values
> +     * when XLEN=32. (Section 18.3)
>        */
>       if (get_xl(s) == MXL_RV32) {
> -        ret &= (!has_ext(s, RVV) &&
> -                s->cfg_ptr->ext_zve64f ? eew != MO_64 : true);
> +        ret &= (eew != MO_64);
>       }
>   
>       return ret;

