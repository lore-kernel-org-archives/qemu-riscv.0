Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ovrTZ-0004uK-3M
	for mharc-qemu-riscv@gnu.org; Thu, 17 Nov 2022 21:51:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovrTX-0004tz-EO
 for qemu-riscv@nongnu.org; Thu, 17 Nov 2022 21:51:31 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovrTV-0007L9-Rb
 for qemu-riscv@nongnu.org; Thu, 17 Nov 2022 21:51:31 -0500
Received: by mail-pf1-x42e.google.com with SMTP id g62so3616281pfb.10
 for <qemu-riscv@nongnu.org>; Thu, 17 Nov 2022 18:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/x/k0ueDj36JsqU/l93nxU9mvvKI1p1/ccrGa0nPl7A=;
 b=Vxly6GBQJUKWzl59Ot6kJ43un+UMiEZfD9RAqSBymYVs0sDGCD6RP2pyUGO2Dp6GLI
 GDRpMm3IJfF8Kvkvhq/Rugca/ACWQk3OuXpBKbj6N810MegoYeXH4sce/3OtHeAJNg+2
 IYk/bLxzoMA84IT+XkRbBJrDFaVga2UUYYqhEve+MrSqTdzjnUs5l3Gye+MlEo3MlSao
 J3ZQBoGtWYjwxc3M1j4C8tu8L+fheId9pf+NMZ4bWA7kCjC8GC41LydIL40IgWhNMj7T
 Xtp5+TY/1PHb8ovT6NUQ2diEtsMvdhzkktbLRRGJa0sl+FW2QAHj3R+wU2jEMFgw7IRt
 F9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/x/k0ueDj36JsqU/l93nxU9mvvKI1p1/ccrGa0nPl7A=;
 b=vCb33lcENJzcyDMihb40KcHpMHyVEvOD1gj6yX4095gyPdJDBR+LkSCHMDev7hsPo4
 XFjV6Vn4zObKKzW0T6BCWs9i+OTxBKBj3qp6Gvyd81S0U0spaUB6+VnnIwdshmXpKTbr
 xGO0oHQLGCsu498IQ/7pSb8HDMqj6hfH+OBgIdno/pDGb8I8vmRf0sxsrcX4VR/EPly9
 33u/TV8LpF9EbPB32CEROh0XVDJcSq6jCLxr58bqiTHc15uysDXHZwLehL5mAPVno49A
 iJH+20hCF8Q9PWsz7mTBcoxQWSyefyFfp4Y83fbUXiu0KSFltxCHG+6WPHWgln10I3V+
 cEVg==
X-Gm-Message-State: ANoB5pmM1SdC03cUJyGdzPWhchK/Y1KaILrNoOQEAFLc7abS3pqgQ6Zy
 cWvj/T3vgKnJD1N/oTcVtKIBYg==
X-Google-Smtp-Source: AA0mqf5Ei1kxbT80JLcTheNs5vzzmc/psbSw6BpXW+LlPHxKMbHFmP5zS0kEppOtRN9xGdr1jgtjPA==
X-Received: by 2002:a62:3882:0:b0:56b:9ce2:891f with SMTP id
 f124-20020a623882000000b0056b9ce2891fmr5780090pfa.43.1668739888058; 
 Thu, 17 Nov 2022 18:51:28 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:90b2:345f:bf0a:c412?
 ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a170903024700b00178aaf6247bsm2271541plh.21.2022.11.17.18.51.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 18:51:27 -0800 (PST)
Message-ID: <78aac7ea-f204-d18e-1139-5b5785c25543@linaro.org>
Date: Thu, 17 Nov 2022 18:51:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 7/9] target/riscv: add support for Zcmt extension
Content-Language: en-US
To: weiwei <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, mchitale@ventanamicro.com
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20221117070316.58447-1-liweiwei@iscas.ac.cn>
 <20221117070316.58447-8-liweiwei@iscas.ac.cn>
 <da87af96-b8e0-d6d1-02d3-a4d3afe8edf0@linaro.org>
 <c117741e-f804-6796-796d-da9cf73dfe8a@iscas.ac.cn>
 <6e529a49-9f1f-d561-e494-de62a0970a0f@linaro.org>
 <69b96731-6e36-bdf8-8a5e-e5ef4dff50b0@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <69b96731-6e36-bdf8-8a5e-e5ef4dff50b0@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
X-List-Received-Date: Fri, 18 Nov 2022 02:51:31 -0000

On 11/17/22 17:46, weiwei wrote:
> However, to some extent, JVT and FCSR in statenen CSR are  used to enable/disable
> Zfinx and Zcmt extensions.  When they are disabled, It seems reasonable to look for
> another insn, just like the processor doesn't support them at all.
> 
> From the other aspect, is it possible that we support many overlapping extensions(such 
> as Zcmt and Zcd or CD) in one processor  and only one work once (just disable anothers
> if we need another to work)?

I don't think any processor will support overlapping, mutual exclusive extensions.  The 
decode within the processor would be wildly complicated by that.

While you might be able to get away with returning false in this particular case right 
now, it's incorrect usage of the tool and might just come back to cause bugs in the future.


r~

