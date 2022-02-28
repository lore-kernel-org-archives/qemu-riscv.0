Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOmN5-0003CR-9J
	for mharc-qemu-riscv@gnu.org; Mon, 28 Feb 2022 15:11:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOmN0-0003AS-Sj
 for qemu-riscv@nongnu.org; Mon, 28 Feb 2022 15:11:47 -0500
Received: from [2607:f8b0:4864:20::62e] (port=38435
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOmMw-00088T-1h
 for qemu-riscv@nongnu.org; Mon, 28 Feb 2022 15:11:46 -0500
Received: by mail-pl1-x62e.google.com with SMTP id h17so6115375plc.5
 for <qemu-riscv@nongnu.org>; Mon, 28 Feb 2022 12:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xGY1h93/vrGr/3qdZeI/t/ZI4Sg1/ji3bU+Hgd02Kos=;
 b=xaLsYBIpPDO8Jl7BVBSqMdAacAWUMAZ9E5Raqsc++hjBbqauGvWt77J2pU6QUnJ0Zq
 4LbGTeeN/goCKD5AoC7V5rb785JHN/ck7LoEC8wURhfkhcL3g4mB87T2TYIlfzoVPt0R
 m2hCkVwOOjQK4pJ9EJ1sP/CNXzCiEZE2yRZcA8jNXVqgrIWHFckf2rfh39rNHz98IOS4
 Mruua7Xujcf6J7lFxmic4IsgSCpJORyp2ECJdbI1VoszUFgLMzXSOqGBDWZgeOOVn56G
 vyCLJ1yAAr86HKvl5RqqmbA9rrp1YI5tBSAj21vbCOluhyOCi8giScz1GqhgsDLv/bQ0
 mQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xGY1h93/vrGr/3qdZeI/t/ZI4Sg1/ji3bU+Hgd02Kos=;
 b=YzDOvJ4EU49eEz9z9FEuwQZiUFE1FDbkaFCTt8HTSdrj97oE+7kpBCGbVjChQZFlqc
 hX8HnCGAAKDWYUF95/UMUkZdnfDr1l3/EhhBM5hB33war+gJYVcdgln8dX9VIF9zN2Kd
 NCXrrtbVwzp9ltwDehpnlWFN4CmUQ3hYa3IPbqcso0t4mKX8ZZEOupCa0DLB4Hat3EYR
 uDvRv0X2olOuG4jFT9VU79/QQ/skzgCzWrgZ5RSGKo+VUeldM/Sy8hFhypGBxWLotEX2
 AN0KG5aC5dtMV3jieC5saHDWvrM0Rg8gzGuoK6uBfY3eN0dG/oowfByzgRKz7YetOQc+
 dO+A==
X-Gm-Message-State: AOAM531GqVWn+2QozYMWsg7FB/p8vgbq35CYhGYM1Unjk366WfGECM31
 FseQ8VYGHFHQa1siRMyqbKZWww==
X-Google-Smtp-Source: ABdhPJwUyxOxbbHtYNDn37K+otBaWEBuA4FWc+1klGCtSY3Zo7drn5FTuF92E6mFegXsy7G8e90u+A==
X-Received: by 2002:a17:902:f684:b0:150:887:a16c with SMTP id
 l4-20020a170902f68400b001500887a16cmr21915391plg.31.1646079100626; 
 Mon, 28 Feb 2022 12:11:40 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:483f:d486:138f:7868?
 (2603-800c-1201-c600-483f-d486-138f-7868.res6.spectrum.com.
 [2603:800c:1201:c600:483f:d486:138f:7868])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a056a00150e00b004f1252a21casm14381295pfu.161.2022.02.28.12.11.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 12:11:40 -0800 (PST)
Message-ID: <0879f52c-165b-75f2-82e1-761013816f03@linaro.org>
Date: Mon, 28 Feb 2022 10:11:36 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 12/14] target/riscv: rvk: add CSR support for Zkr
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220228144810.7284-1-liweiwei@iscas.ac.cn>
 <20220228144810.7284-13-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220228144810.7284-13-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 28 Feb 2022 20:11:48 -0000

On 2/28/22 04:48, Weiwei Li wrote:
> +/* Crypto Extension */
> +static RISCVException rmw_seed(CPURISCVState *env, int csrno,
> +                              target_ulong *ret_value,
> +                              target_ulong new_value, target_ulong write_mask)
> +{
> +    if (!write_mask) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }

This is incorrect.  The error should only be with a write-mask of the actual x0 register, 
not another register which happens to contain 0.  There is in fact no way to diagnose 
exactly what you want here, which IIRC has an existing fixme comment somewhere.

> +    uint32_t return_status =  SEED_OPST_ES16;
> +
> +    *ret_value = return_status;
> +    if (return_status == SEED_OPST_ES16) {
> +        uint16_t random_number;
> +        qemu_guest_getrandom_nofail(&random_number, sizeof(random_number));
> +        *ret_value = (*ret_value) | random_number;
> +    } else if (return_status == SEED_OPST_BIST) {
> +        /* Do nothing */
> +    } else if (return_status == SEED_OPST_WAIT) {
> +        /* Do nothing */
> +    } else if (return_status == SEED_OPST_DEAD) {
> +        /* Do nothing */
> +    }

This is also incorrect.  This should be

     uint32_t result;
     uint16_t random_v;
     Error *random_e = NULL;
     int random_r;

     random_r = guest_getrandom(&random_v, 2, &random_e);
     if (unlikely(random_r < 0)) {
         /*
          * Failed, for unknown reasons in the crypto subsystem.
          * The best we can do is log the reason and return a
          * failure indication to the guest.  There is no reason
          * we know to expect the failure to be transitory, so
          * indicate DEAD to avoid having the guest spin on WAIT.
          */
         qemu_log_mask(LOG_UNIMP, "%s: Crypto failure: %s",
                       __func__, error_get_pretty(random_e));
         error_free(random_e);
         result = SEED_OPST_DEAD;
     } else {
         result = random_v | SEED_OPST_ES16;
     }

C.f. target/arm/helper.c, rndr_readfn.


r~

