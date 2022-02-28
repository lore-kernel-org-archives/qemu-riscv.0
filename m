Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOlrI-0000Qb-QH
	for mharc-qemu-riscv@gnu.org; Mon, 28 Feb 2022 14:39:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOlrH-0000Pp-DN
 for qemu-riscv@nongnu.org; Mon, 28 Feb 2022 14:38:59 -0500
Received: from [2607:f8b0:4864:20::42a] (port=38898
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOlrF-0007Zb-UD
 for qemu-riscv@nongnu.org; Mon, 28 Feb 2022 14:38:59 -0500
Received: by mail-pf1-x42a.google.com with SMTP id x18so11941624pfh.5
 for <qemu-riscv@nongnu.org>; Mon, 28 Feb 2022 11:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YYLCeztRH4nx6BSudl8XCzGOloArlg5+Pc2u6f8ZZRA=;
 b=XoaRVKAHgY+7U4HZF/js6SdaKmX6KF56tIQ8NID3AhM9bKxdMpawN/YCyQGI9ogYw4
 dbjPN/W0KBHzhwpkFGu1oER5OQZD2DH7DRzB6E6RP0WCu253gC2ckkaMITcx4wYQLu9i
 nMmwvumMyTfnk4pmXOgaYyO0MeCsuGvTFXI5SiCqvNWn0fUZoekePFSVdtiHoYQYfX8N
 iO/6QcK+BJ9NQa5/o5EbuYe2P4G+GWwB5JJuPkL7AopjjM7jlVpSbHpebXCailaZ0Ec3
 rfV5g05p78bvIwgNVVwggkWdcSHRgYLu6WcVcT+vfZFfH7vxh0yDIgFfnR4rbcZBmCxy
 PUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YYLCeztRH4nx6BSudl8XCzGOloArlg5+Pc2u6f8ZZRA=;
 b=TcpR7x/I35dGKnjRPtVX6D4VOWc4BP1/Y71L3U23oAk/r7utl3FlpQfQdomf8P2lMV
 glbu4lU71GqSCGU61KNAruWwKfO9ZYR52bvMavXUDCYgrd+jrI8iDW8v+pTeVbE5Lyj+
 AyhfxB02UlyXILFeSCoftELxQl/9QkQtelcW+VS0LMDS/SISbivLEbrU5n2xv69DYpLQ
 ZonWgYu5OGg4XSOgwwSaqmx9brou+MYN+Ky/poKQ5xpjRH4sS++klSfrRnbgslJxrE4t
 /xMKqzLcSNgxUFba7yk0og7I3uI04auhhnvnfWFPcxKvAD4rj3duZKb05JBwix7RIUqB
 dvXg==
X-Gm-Message-State: AOAM532V7YjC+vVxnD+OvHMMonbQLOxOlGHuTQToMnW/bxcVup942ERv
 pWE8h9pinmB+A196GX/oFL9jKg==
X-Google-Smtp-Source: ABdhPJyanwZSZ6Z38Ne+CdIyZg3VPHcUJj1tr/oafh+rvh9PJWJUQBDI2eZSwPJ4dfKHI6q1CBD+Dg==
X-Received: by 2002:a05:6a00:1ac6:b0:4bd:140:626c with SMTP id
 f6-20020a056a001ac600b004bd0140626cmr22919475pfv.7.1646077136603; 
 Mon, 28 Feb 2022 11:38:56 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:483f:d486:138f:7868?
 (2603-800c-1201-c600-483f-d486-138f-7868.res6.spectrum.com.
 [2603:800c:1201:c600:483f:d486:138f:7868])
 by smtp.gmail.com with ESMTPSA id
 np11-20020a17090b4c4b00b001bd4aa67bafsm550132pjb.3.2022.02.28.11.38.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 11:38:55 -0800 (PST)
Message-ID: <ea054747-9c1b-4e0b-f084-6063d19207ca@linaro.org>
Date: Mon, 28 Feb 2022 09:38:52 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 09/14] target/riscv: rvk: add support for sha512
 related instructions for RV32 in zknh extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220228144810.7284-1-liweiwei@iscas.ac.cn>
 <20220228144810.7284-10-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220228144810.7284-10-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 28 Feb 2022 19:38:59 -0000

On 2/28/22 04:48, Weiwei Li wrote:
> +#define GEN_SHA512H_RV32(NAME, OP, NUM1, NUM2, NUM3) \
> +static void gen_##NAME(TCGv dest, TCGv src1, TCGv src2) \
> +{ \
> +    TCGv_i64 t0 = tcg_temp_new_i64(); \
> +    TCGv_i64 t1 = tcg_temp_new_i64(); \
> +    TCGv_i64 t2 = tcg_temp_new_i64(); \
> +    \
> +    tcg_gen_concat_tl_i64(t0, src1, src2); \
> +    tcg_gen_##OP##_i64(t1, t0, NUM1); \
> +    tcg_gen_concat_tl_i64(t2, src1, tcg_const_tl(0)); \

The bug here is tcg_const_tl instead of tcg_constant_tl, which leaks a temporary.

It's not the best option for zero-extension, though, as we don't optimize a deposit of 
zero like this (we probably should, but, hey).

Better would be

     tcg_gen_extu_tl_i64(t2, src1);
     tcg_gen_ext32u_i64(t2, t2);

Note that the first operation will *not* extend if TARGET_RISCV64, since it doesn't 
actually change type.  The second operation will be optimized away if TARGET_RISCV32, 
since the zero-extend has already happened.

BTW, it would be better to not use a large macro for this, and in the previous patch. 
Passing in parameters to a helper function would be easier to read and debug.


r~

