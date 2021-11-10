Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mklni-0001y8-BN
	for mharc-qemu-riscv@gnu.org; Wed, 10 Nov 2021 06:29:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mklng-0001uf-PP
 for qemu-riscv@nongnu.org; Wed, 10 Nov 2021 06:29:56 -0500
Received: from [2a00:1450:4864:20::42f] (port=43720
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mklne-0006zj-VE
 for qemu-riscv@nongnu.org; Wed, 10 Nov 2021 06:29:56 -0500
Received: by mail-wr1-x42f.google.com with SMTP id t30so3381175wra.10
 for <qemu-riscv@nongnu.org>; Wed, 10 Nov 2021 03:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gUTkVha6SSPO/CY4p0t9c6x6bwRs/u1y1Klmhtasuas=;
 b=UVhTO9L6gPwSuDF+nxaEUya8/Qq3WBnBRAEwySM8zsqsr9nXgLhlWgfPjScgFovrbf
 x+cL5refsVohf/Daub/b+GecMOPsnfA7PjRq9HD9sHzAcSbsLUXdmoJhDRYZ5sxoYM7L
 3iOC1h7Q0w1kqWaUBrl+iTdmmbhgQwwzefM4J2hjmmeyI+sRpZIFh3sGL9AdgxwW1DGb
 i+cdNx10T4rJXXj1cUqGJo/2i7kTT2V8pAf8+bFcYYo8e3psZvGnmEKu4OKEJwgrQbLh
 KY/0LhHgDIJ2PJnYDCp8fUxJo7cjbkugywlWX5vr8e28wwHqvyyiSSjeZZbbmVor1EzU
 ZATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gUTkVha6SSPO/CY4p0t9c6x6bwRs/u1y1Klmhtasuas=;
 b=Bae+c8x//1ghU90G699Ca7bwwMnVx/MMB8dd+vmT6Zvsle65FxMKkif/8rCRABUZ+F
 WjqxR80pQoVPmhbrlsWFmAKXHuXRKnmDPz7+wjEDaa/cPA22WOcWJJceyjhhvC7Y3Uj1
 0eEnbMpjFUyu1NzQC6xzNn/1vqQzF7J2XCUHuorwh/30j1Mdij6+ClgKmVFEThcvUNoK
 ClfxTVn2TImrTIx4oe25v+zgtFl/f0YQgLOq84A/QEnd/IyynGW+sG076zrQHpETjquo
 TdsywG2VdKV98RLMozH5kv/8EN6AYRLON1/xirDLsWG29LtmgwGJxIyIF/UQq3RdcD9e
 R8sg==
X-Gm-Message-State: AOAM5333xfeLhoJ19kI0uiOq4uNV1ym/6qvPDIc5Fxp3oqiA1hFYtiEq
 5IFA2M8+fCydy1ToWIgPQ0VVkQ==
X-Google-Smtp-Source: ABdhPJyFQ2lyiAEA098g+4TM9OceWB160jaHS4f/jZHKcVf2yBu72OD8XlJ8vn7gW4W1mPUgpGxxsA==
X-Received: by 2002:adf:e882:: with SMTP id d2mr18864004wrm.389.1636543793640; 
 Wed, 10 Nov 2021 03:29:53 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id q84sm6506994wme.3.2021.11.10.03.29.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 03:29:53 -0800 (PST)
Subject: Re: [PATCH v2 11/14] target/riscv: Adjust scalar reg in vector with
 XLEN
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
 <20211110070452.48539-12-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3f4cbf03-5492-3f5c-9e6f-6ff55bd1ba6e@linaro.org>
Date: Wed, 10 Nov 2021 12:29:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110070452.48539-12-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 10 Nov 2021 11:29:57 -0000

On 11/10/21 8:04 AM, LIU Zhiwei wrote:
> diff --git a/target/riscv/internals.h b/target/riscv/internals.h
> index b15ad394bb..07e882160d 100644
> --- a/target/riscv/internals.h
> +++ b/target/riscv/internals.h
> @@ -27,6 +27,7 @@ FIELD(VDATA, VM, 8, 1)
>   FIELD(VDATA, LMUL, 9, 2)
>   FIELD(VDATA, NF, 11, 4)
>   FIELD(VDATA, WD, 11, 1)
> +FIELD(VDATA, TRUNC, 15, 1)

No need for this.

> @@ -4756,7 +4762,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>               continue;                                                     \
>           }                                                                 \
>           if (i == 0) {                                                     \
> -            *((ETYPE *)vd + H(i)) = s1;                                   \
> +            *((ETYPE *)vd + H(i)) = trunc ? (s1 & UINT32_MAX) : s1;       \
>           } else {                                                          \
>               *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - 1));           \
>           }                                                                 \
...
> @@ -4785,7 +4792,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>               continue;                                                     \
>           }                                                                 \
>           if (i == vl - 1) {                                                \
> -            *((ETYPE *)vd + H(i)) = s1;                                   \
> +            *((ETYPE *)vd + H(i)) = trunc ? (s1 & UINT32_MAX) : s1;       \

In both of these cases you can simply zero-extend s1 in the translator before passing it in.


r~

