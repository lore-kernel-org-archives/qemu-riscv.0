Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpYg0-0005pK-Td
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 10:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpYfy-0005o5-MS
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 10:25:14 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:33653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpYfu-0006gs-AA
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 10:25:14 -0500
Received: by mail-oi1-x234.google.com with SMTP id d203so6700089oia.0
 for <qemu-riscv@nongnu.org>; Wed, 16 Dec 2020 07:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Kzs6N7vPIGjHsPFBWcJpGYTind6XbEBvmk85TtJ8few=;
 b=mPvhtLnilo+vP9OfVkyypVXuaf8iTm1OCCVZQjASJQIco0CVDdFqnldeOUGlcTclrV
 OMis2bAWhQc++Ojufwjylp3YKdgXP2NogaBb8HR/D+Ru2CjLIRS9MozWMeqWycYxfwXH
 JtWSE3aeZbzpI2HvNLzk4wd0nGJGFRkyZvEQt9058BpvVQtL9jfj5ZMguyMkaDAltHHC
 k8kDtiYVMrIjaueOPnV0Prh+Jtd7vOg5Zp6fnJ7xhxCQXeYaICYujJqteP/vBeCqd84P
 FMpbchaJ7ybgne/REZW9tH194kjuDwbvPJoXNYFdIDY269bHQL5trzSdxqSj9t2zQRW0
 5aPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kzs6N7vPIGjHsPFBWcJpGYTind6XbEBvmk85TtJ8few=;
 b=T4psOhHnltP1lsSYeLKhrplvhaW9g2Yj91fg4rJRBwTsihiXuB3i+q0HqGHTezsHk1
 1kBvwJ64OVl3NNBcH2q2Hjm8w5nUIxeVPfxuy8QVj/0iIl34aqxMyC1hCSoyUR4nisBF
 jMLoIa4fVclKHhF7pfvXWFLl/QG68kQszrLc3Bh5XP+ToQm8RIyVbUdK7LfB20WQaqWN
 kkUryuq52XNF0aNv8GHGYfPupPvKoAXvvZQ2s8jYSN60uT+55QEK5vkiLwciq1RFfUU0
 Gacaf68IvuP1Rt0muR0WT7cnSDwzjm50QbNXwLmHGa3vuI1wXN4Ow4UrZruwE/63Yy1d
 M49g==
X-Gm-Message-State: AOAM532to6/Zf4wRl0nEVOGXOZYIcrSjrRv60ost4RscaRklG2dAPjc9
 WlEE5XxC8rzyNt8eeICY78yp6g==
X-Google-Smtp-Source: ABdhPJwZeoPo9x8omx+s81/54cyOuzAHHrczEqi/4LBb31/NEc+YbqFYrgBCMYpFAXLQ2fhSxkv3Ug==
X-Received: by 2002:aca:b506:: with SMTP id e6mr2278535oif.119.1608132308042; 
 Wed, 16 Dec 2020 07:25:08 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id 30sm490279oth.7.2020.12.16.07.25.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 07:25:07 -0800 (PST)
Subject: Re: [RFC v2 04/15] target/riscv: rvb: logic-with-negate
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
 <20201216020150.3157-5-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <db13a75d-1632-1683-6f3a-af1935fc8b7d@linaro.org>
Date: Wed, 16 Dec 2020 09:25:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216020150.3157-5-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 16 Dec 2020 15:25:15 -0000

On 12/15/20 8:01 PM, frank.chang@sifive.com wrote:
> +static void gen_andn(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv t = tcg_temp_new();
> +    tcg_gen_andc_tl(ret, arg1, arg2);
> +    tcg_temp_free(t);
> +}
> +
> +static void gen_orn(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv t = tcg_temp_new();
> +    tcg_gen_orc_tl(ret, arg1, arg2);
> +    tcg_temp_free(t);
> +}
> +
> +static void gen_xnor(TCGv ret, TCGv arg1, TCGv arg2)
> +{
> +    TCGv t = tcg_temp_new();
> +    tcg_gen_eqv_tl(ret, arg1, arg2);
> +    tcg_temp_free(t);
> +}

Drop these functions entirely, along with their unused temporaries.


r~

