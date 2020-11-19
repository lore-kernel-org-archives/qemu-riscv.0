Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kfsDI-0000Gp-TY
	for mharc-qemu-riscv@gnu.org; Thu, 19 Nov 2020 17:15:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfsDE-0000Et-U6
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 17:15:33 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:36023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfsDA-0002AH-Uq
 for qemu-riscv@nongnu.org; Thu, 19 Nov 2020 17:15:31 -0500
Received: by mail-pf1-x42e.google.com with SMTP id a18so5871697pfl.3
 for <qemu-riscv@nongnu.org>; Thu, 19 Nov 2020 14:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OnHZD6MYoSDO4lrPTpMSBgKzkz4nLX+aDlummW4aWdw=;
 b=qdIQ/BsAyAtgMqIMx1DvK8HCOHVbnqBPxj9YZz5KcUUoOklURLnCV/v/OfnyEsj8IW
 7w5Iech2jiPaMVLpbbSEc5zJ1nc6fb2aGNs+WcHbzj7ONnX+7CxrYloKPbP7p+f64Qo6
 JWOst/XUdWl+guLIp9erM1Ov93dQjmMtw+lM6MeoNViCqs5Wpfbj5XQN3rugWLLzNpLy
 ykFODF6DnV0ijzanPOOiDLxdzjh/sXRnCpFQxgFqiMFcbLvta1tvGKufjsfgUwEeJi5X
 leoE1oO3VBlx0O3XqpbXMtKHk3WPOi+BuLADpeZkCmKbbCZLl0+OAWmTKHxdXBLwzeFq
 1FoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OnHZD6MYoSDO4lrPTpMSBgKzkz4nLX+aDlummW4aWdw=;
 b=WDjYlkomZK3UEBnv+gJbrJj17kbxYFXFu7lGCeNJuKE+LwQP2L+CtGWPCi0Uqt66Bt
 GPXE2r9yDUFuwGg/halwU/sjk9cllAkrGTP8avuC/HMF1ODst+PNH4tj3RvYmZhi38LO
 NqGESPm+iBjg3w38OCHZxlhPqXusjMhCvJojqBYiFhfluzKEif4afUIzq4SAvBgh9s5I
 Ntz9LsMkot2piKJCjpm9lCCQ3E8N02Sso1MFPJ5vHMmTYCQW9df8LlOGR5bwA+G+XjN+
 EA2GiqTCC8qbD+lFi+ds/mRvo9n+iokpiSQss/ZencLNNkEJxkVayVeLAuDZvAZjD/M0
 b5mg==
X-Gm-Message-State: AOAM5337e4nXsi2n473mOKp9IRgoBAV/6oz7Ikz0Ew1siKHPqWhpMhM6
 8Q3PBx+7284qXM7hnlAfpWae4w==
X-Google-Smtp-Source: ABdhPJw82I7hOmFOJi1nV43goAWwelPyQNp/OWibFIBJQt399O2fIiPGa01zjuY3usOwDrti9Dq8UA==
X-Received: by 2002:a62:7504:0:b029:18b:8238:cc0 with SMTP id
 q4-20020a6275040000b029018b82380cc0mr10911061pfc.81.1605824127390; 
 Thu, 19 Nov 2020 14:15:27 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id o67sm953682pfb.109.2020.11.19.14.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 14:15:26 -0800 (PST)
Subject: Re: [RFC 14/15] target/riscv: rvb: add/sub with postfix zero-extend
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
 <20201118083044.13992-15-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3f4a11d5-97e0-75c7-75e8-f4f0a9bdd46e@linaro.org>
Date: Thu, 19 Nov 2020 14:15:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118083044.13992-15-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Nov 2020 22:15:33 -0000

On 11/18/20 12:29 AM, frank.chang@sifive.com wrote:
> +addwu      0000101 .......... 000 ..... 0111011 @r
> +subwu      0100101 .......... 000 ..... 0111011 @r
> +addu_w     0000100 .......... 000 ..... 0111011 @r
>  
>  sbsetiw    0010100 .......... 001 ..... 0011011 @sh5
>  sbclriw    0100100 .......... 001 ..... 0011011 @sh5
> @@ -116,3 +119,7 @@ sroiw      0010000 .......... 101 ..... 0011011 @sh5
>  roriw      0110000 .......... 101 ..... 0011011 @sh5
>  greviw     0110100 .......... 101 ..... 0011011 @sh5
>  gorciw     0010100 .......... 101 ..... 0011011 @sh5
> +
> +addiwu     ................. 100 ..... 0011011 @i
> +
> +slliu_w    000010 ........... 001 ..... 0011011 @sh


addwu, subwu, addiwu have been removed in the current draft.

> +static bool trans_slliu_w(DisasContext *ctx, arg_slliu_w *a)
> +{
> +    TCGv source1;
> +    source1 = tcg_temp_new();
> +    gen_get_gpr(source1, a->rs1);
> +
> +    tcg_gen_ext32u_tl(source1, source1);
> +    tcg_gen_shli_tl(source1, source1, a->shamt);
> +    gen_set_gpr(a->rd, source1);

if (a->shamt < 32) {
    tcg_gen_deposit_z_i64(source1, source1, a->shamt, 32);
} else {
    tcg_gen_shli_i64(source1, source1, a->shamt);
}


r~

