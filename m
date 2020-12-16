Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpZak-00071F-LT
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 11:23:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpZai-0006vS-G1
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 11:23:52 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:40126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpZag-000748-PT
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 11:23:52 -0500
Received: by mail-pj1-x1029.google.com with SMTP id m5so1901043pjv.5
 for <qemu-riscv@nongnu.org>; Wed, 16 Dec 2020 08:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lC8nQqfu8dQGPkjZW5dYaCUo0QW0XatYBEpQzH44NM4=;
 b=tcys7Xwueozl9V2FI4q67+3lrj0AZqYvLMYZwJYeoj/sfnXZ5kKYs+/8NV0dVH9/H3
 3GOzoO2vRMf1576HDfO9bBEP24+S6bzt5cLtwerzX/8izlI8Y/viPT5LipqheNeunyM6
 N7XPd0zPh6uQ76kvD/9JnOPILmEvkvJamp0cLHz2VGE770OkmFKspofZYYXJ/AkWoZIg
 ddvfr0J0t/EiXaA8H6i8Fp2kbR2lRSlMi7MoJiQq/byt8xD/mSvNZYAvEwmIImNeP/BC
 3yR8zTAnY1ZdfqTNqle58ukwzYnq1F0kxdZBZLa1j8TT+1ObbSRY/vfzonglWgF+QOOW
 TI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lC8nQqfu8dQGPkjZW5dYaCUo0QW0XatYBEpQzH44NM4=;
 b=JibW57SZ7niTd1IGFDuEDn1d8s41SWFrsXExJxe6aIXHWx2Vw2X+KQpVPseWgwi5ln
 SlfiZXCpG1WUXbXZigJJ/CH8YCgX8mwsD9JgpxdTfo5I5EUSQZ9hVB1hg1cwNKgt2M25
 Mwsuz6ggPV3md9y+/ziB4hrngNHF2IhQGrxcqfTtV6L9cRPdOfVub+da3QpzbD27Dpp2
 I38SSXjzZ6E0pTtBCPL75TuOeaV9e2Fvzi1+Tn6o/U/bmZdm1jJEc+x1PbkPHD5Bbx9I
 EEBOOyjiiUB1J+bLUi17ePpNqTAh2N0fj4x2l+x1pG8FjbCe9W4w6uHT4o1Yd/KmnbOK
 8mTA==
X-Gm-Message-State: AOAM531wAdM8rlnaFJ4XcDzT2k+EsYGNAC7DGnfkJfxImnQ1IB8w8opB
 IHkCn+eb7jF02dBzvtGglRrR3Q==
X-Google-Smtp-Source: ABdhPJyIeelRAEYq8BQg1d5TQ9IJN7y3/aYJB1J+gN9q/5jLHcFqLdM2EmFo+qKmvs7ZPQK5lfSVsw==
X-Received: by 2002:a17:90a:3d4e:: with SMTP id
 o14mr3665953pjf.44.1608135829351; 
 Wed, 16 Dec 2020 08:23:49 -0800 (PST)
Received: from [192.168.71.34] ([172.58.27.195])
 by smtp.gmail.com with ESMTPSA id z11sm3045078pfj.191.2020.12.16.08.23.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 08:23:48 -0800 (PST)
Subject: Re: [RFC v2 06/15] target/riscv: rvb: min/max instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
 <20201216020150.3157-7-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <627060be-b9ab-0d9d-285a-10fe87b359bc@linaro.org>
Date: Wed, 16 Dec 2020 10:23:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216020150.3157-7-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-List-Received-Date: Wed, 16 Dec 2020 16:23:53 -0000

On 12/15/20 8:01 PM, frank.chang@sifive.com wrote:
> From: Kito Cheng <kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn32.decode              |  4 ++++
>  target/riscv/insn_trans/trans_rvb.c.inc | 24 ++++++++++++++++++++++++
>  2 files changed, 28 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

