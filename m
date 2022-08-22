Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oQA1V-0008ST-JU
	for mharc-qemu-riscv@gnu.org; Mon, 22 Aug 2022 12:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQA1D-0008Qa-8f
 for qemu-riscv@nongnu.org; Mon, 22 Aug 2022 12:11:23 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:41960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQA19-0008Mm-DD
 for qemu-riscv@nongnu.org; Mon, 22 Aug 2022 12:11:13 -0400
Received: by mail-pg1-x530.google.com with SMTP id 202so9784187pgc.8
 for <qemu-riscv@nongnu.org>; Mon, 22 Aug 2022 09:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Q+ag/t16A6S2pK9wY6V2jBKBTjo7/YFJUhRt6ooGZFw=;
 b=aUeyS6NFgnMdjzPjsFqG2ZHX+LHluOKtFQ0GjOZjl9XCpUseUTvur7CRdEVKbvoIQU
 jDVMhGFug9k1cda9A9Q65ANYSi+BoVXxWnmo43U7bARnq2/l4OZPvZaDLFVWhGyIvIhb
 inO5a3+B0hn3vaMadGXodXbqHadWrOCxVVFk2HlDnxIXF4Vs7Oo2z5ir/CBqGf8iwty0
 EZtiKEhj3TFZQeLkI16fDvQKtgyic5p4PKQFFekYD5T46q0JXdqQfprkylOkVQQQTb9u
 QaWCVli+P6VxgRdV84lD8UsTNWdqV++ymWwkVVzKy8H9i2c9OzO1DoeqkIlorQEUV4Fz
 LtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Q+ag/t16A6S2pK9wY6V2jBKBTjo7/YFJUhRt6ooGZFw=;
 b=V5rhiu10YZ5yINoGBdzHtLB6xN16MCfHBvd8gdefezvNN7OmHNfC4/saOljdJb/ks5
 mlGNPa6virPThdYoDuAv93nT9oJulOaGOR5Ph6xUtgdpzhT+6VoSIWxE4gNTI6eC2xvW
 AdDfGcpagIbcc7nUv/bXuKlmYTH9gEVxLUuzKAoFZ5ZnowrmrmULZM+Aexc2p9hSWMZ9
 GZ1sF3jepLiOTJuIlnSh3bLO36tNEwXWEgHZWBqMY+8sKo+E1V7LdtyL2qlZrPscspaw
 +9eMspIgBItwfVN6ReyJcVD9Q8Ji2scBIkEwleOB9Ckb17qUo0MkBib3lb5gGoIevz7f
 +hng==
X-Gm-Message-State: ACgBeo0quiMXgVAVmzJwdG/GifMQWD9kh+N500mjwduiTwsCdbhKp/9p
 bQBNF2IC1mm6yCSEjv9RdSi6Jw==
X-Google-Smtp-Source: AA6agR4CyEAui+fj5uZyuw7VWFwn9tyHUpuEZhrS4voJ9eUxR6Ricl1bCyRXMvbsORfDbNh1NZBrHg==
X-Received: by 2002:aa7:8c18:0:b0:536:357:9635 with SMTP id
 c24-20020aa78c18000000b0053603579635mr17890730pfd.39.1661184669348; 
 Mon, 22 Aug 2022 09:11:09 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.236])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a170902f64f00b0016b865ea2ddsm8554441plg.85.2022.08.22.09.11.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 09:11:08 -0700 (PDT)
Message-ID: <6bde9b30-705f-57b1-a6a9-cb488daa2e81@linaro.org>
Date: Mon, 22 Aug 2022 09:11:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 7/7] target/riscv: Honour -semihosting-config
 userspace=on and enable=on
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Furquan Shaikh <furquan@rivosinc.com>
References: <20220822141230.3658237-1-peter.maydell@linaro.org>
 <20220822141230.3658237-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220822141230.3658237-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Mon, 22 Aug 2022 16:11:23 -0000

On 8/22/22 07:12, Peter Maydell wrote:
> The riscv target incorrectly enabled semihosting always, whether the
> user asked for it or not.  Call semihosting_enabled() passing the
> correct value to the is_userspace argument, which fixes this and also
> handles the userspace=on argument.  Because we do this at translate
> time, we no longer need to check the privilege level in
> riscv_cpu_do_interrupt().
> 
> Note that this is a behaviour change: we used to default to
> semihosting being enabled, and now the user must pass
> "-semihosting-config enable=on" if they want it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/riscv/cpu_helper.c                      | 9 +++------
>   target/riscv/translate.c                       | 1 +
>   target/riscv/insn_trans/trans_privileged.c.inc | 3 ++-
>   3 files changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

