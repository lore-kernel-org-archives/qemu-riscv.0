Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paNKC-00055c-Mr
	for mharc-qemu-riscv@gnu.org; Thu, 09 Mar 2023 15:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1paNK5-0004tZ-2e
 for qemu-riscv@nongnu.org; Thu, 09 Mar 2023 15:57:15 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1paNK3-0001Gp-Iv
 for qemu-riscv@nongnu.org; Thu, 09 Mar 2023 15:57:12 -0500
Received: by mail-oi1-x233.google.com with SMTP id bh20so2689394oib.9
 for <qemu-riscv@nongnu.org>; Thu, 09 Mar 2023 12:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678395430;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZzqZDdeMGZQ3piPXuqaXq8vnLEy6sJO3zD+s9pop8ug=;
 b=LB9AcBmEnn0J0LuGVCEPlO7rYGXhwWCb1QolkU7gA8tti16tufGv+5BaA548BAvsWR
 0JBrFo2/QwjIiaYmEsziq6q50mgWIGSuHhukS+UMAAJye/r1QFcR7c6jYFti0sPVHj4D
 hA3uIUNxqRRw1OfGOjWrPBtB4mX0XCbR6F+o236kt2dR3ymgWCLL1D6D5BhJWqR1mHro
 d9Wbgd2/mDqMt9FoPAWuuUccK2uydR+bRnEoH8dScDpo/JXaC0pn1z0Xlcv2XNBpdmz7
 TCVOV12mHFMDUPJD/CqPTlLaAkyiQL5CM/CT9mzVb4BvtoKJ/N2lKY5iOixGWSCULT/X
 FIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678395430;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZzqZDdeMGZQ3piPXuqaXq8vnLEy6sJO3zD+s9pop8ug=;
 b=jllEkAo0A1nBMcRCGhH94XdaNJDrKF7aCtFV9e9OHDSojygIykr/tSXeeOHg998adF
 OMuAchNBi3nOAONCZkO7xOSxfeKHQIhqOh04bmp4DMUSJY4ZzuOT0owlucPNuPpRHuDl
 3LouNYKjfxBAaKpBEsSOnosBMheXTa4dx/+k+kdT3UaoDV2SCTiYJuB2Spjp8sW+Ui91
 5r44bUlk6W+Sv0gizKr70vPSPBVfc6Cb11XH+7FGRZhNjxzedSf/ZbOGG5SZcqPzNOe+
 M0H6A9AG7B+x63RDJPa3idtQZqw0qDUqvOn2laxx7FhZA07UZtFqyvUcgqwfvCH89BXZ
 Z6xw==
X-Gm-Message-State: AO0yUKWqWM4vht/rJSVljrCe8u4GAKR9FuHZenysvqOok3j/nXOuB5Od
 QYdbG/yYuM8ggxOM8mo/fayLqQ==
X-Google-Smtp-Source: AK7set9bWgnBgX6IKkQwjTXfheN2Jwjs+bu2Q3x19DYFeVRJnOW0tTJvgsl6mmBrFij5/eTtGUA3BA==
X-Received: by 2002:aca:1711:0:b0:384:8bba:940a with SMTP id
 j17-20020aca1711000000b003848bba940amr9326841oii.30.1678395430288; 
 Thu, 09 Mar 2023 12:57:10 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 az2-20020a056808164200b0037d6c3fc8aasm112352oib.45.2023.03.09.12.57.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 12:57:09 -0800 (PST)
Message-ID: <d7c32985-e061-610d-fba8-0b9aec1c4950@ventanamicro.com>
Date: Thu, 9 Mar 2023 17:57:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/4] target/riscv: Simplify arguments for riscv_csrrw_check
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230309071329.45932-1-liweiwei@iscas.ac.cn>
 <20230309071329.45932-5-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230309071329.45932-5-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 09 Mar 2023 20:57:16 -0000



On 3/9/23 04:13, Weiwei Li wrote:
> Remove RISCVCPU argument, and get cfg infomation from CPURISCVState
> directly.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/csr.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 53143f4d9a..80fc15e4d6 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3755,15 +3755,14 @@ static RISCVException rmw_seed(CPURISCVState *env, int csrno,
>   
>   static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>                                                  int csrno,
> -                                               bool write_mask,
> -                                               RISCVCPU *cpu)
> +                                               bool write_mask)
>   {
>       /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
>       bool read_only = get_field(csrno, 0xC00) == 3;
>       int csr_min_priv = csr_ops[csrno].min_priv_ver;
>   
>       /* ensure the CSR extension is enabled */
> -    if (!cpu->cfg.ext_icsr) {
> +    if (!riscv_cpu_cfg(env)->ext_icsr) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> @@ -3859,9 +3858,7 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
>                              target_ulong *ret_value,
>                              target_ulong new_value, target_ulong write_mask)
>   {
> -    RISCVCPU *cpu = env_archcpu(env);
> -
> -    RISCVException ret = riscv_csrrw_check(env, csrno, write_mask, cpu);
> +    RISCVException ret = riscv_csrrw_check(env, csrno, write_mask);
>       if (ret != RISCV_EXCP_NONE) {
>           return ret;
>       }
> @@ -3914,9 +3911,8 @@ RISCVException riscv_csrrw_i128(CPURISCVState *env, int csrno,
>                                   Int128 new_value, Int128 write_mask)
>   {
>       RISCVException ret;
> -    RISCVCPU *cpu = env_archcpu(env);
>   
> -    ret = riscv_csrrw_check(env, csrno, int128_nz(write_mask), cpu);
> +    ret = riscv_csrrw_check(env, csrno, int128_nz(write_mask));
>       if (ret != RISCV_EXCP_NONE) {
>           return ret;
>       }

