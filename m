Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ovafX-0001LS-6u
	for mharc-qemu-riscv@gnu.org; Thu, 17 Nov 2022 03:54:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovafP-0001Ix-6c
 for qemu-riscv@nongnu.org; Thu, 17 Nov 2022 03:54:39 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovafN-0007S7-Li
 for qemu-riscv@nongnu.org; Thu, 17 Nov 2022 03:54:38 -0500
Received: by mail-pl1-x633.google.com with SMTP id io19so1004588plb.8
 for <qemu-riscv@nongnu.org>; Thu, 17 Nov 2022 00:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sScTS9wwWNfD5ANdJdzCfTW32hgLopR1E6sdykoOMX8=;
 b=hmV9+MCufcT0e/pGkE2Con038jOi9Hn30fRR2Cl5oEgfetRz19QfmHxZ3FUejfQHCN
 MG5IfFLU5NOCdZ+3PH28NHS1hHK1N7T8wqkuUGtVy2Ds1N0QUcsnNHeIzmNcQSHosWYT
 a/XbICxcCAaPlsmhBYshFroll2lNOmm+FTrx+e4X2xDmlT/b16i7QPMgG9rFiWEEpLbh
 /3mzjUBmV6Ir263mXBmakMBu1nOyGH7yHAu1V911T9Xrr64IGX1Ql93hKTPtx9ZimJNS
 oo+x1eEBf+IVetSC86JZlMlcgCwbXcY5Be1ka4BZfOEZsauOecuy2WpKLI0LlqhZz44L
 I4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sScTS9wwWNfD5ANdJdzCfTW32hgLopR1E6sdykoOMX8=;
 b=MehBon55kSkxFVvWIn14sOgWi5ZU9WrAGE4dz/+cf3FcTnr2JsxjIlj+F3v5NuaJsz
 t1l0LM44sCx9xuLUj5HNZ386JOoB667HDXmlKFEGfHbTdsLiap+irvsmpsaCvoiZmP+W
 vrHk3XNm5kNyHbJgfFIUKFeXU3GzX2YhLDmB2E5DG1j24V2v/0l6Z03CVD4MFDbNVMps
 KcF0q6ikUTzp1OAaH1JFRnwgSQfQd5rbtgj3noVTwx4SRXcD88tPpGMbC44c9YjafXtI
 Zc9sy88h7WxHA0LTyS1YFhGj/b6QcITaFfMQ9PrBqTub0idGGx1RCiHH5L9ZIYehY9UR
 5wtw==
X-Gm-Message-State: ANoB5pm+cBNrB8w9eedXUhzLxLGvkodPAzG/Bz5LingV/yYbmT0T7Uk4
 hyLMBZ9AQos78byXiTpBeNpLPA==
X-Google-Smtp-Source: AA0mqf6gPEQ5ORP46KkXoBwAru7mrRo8G5mJ2IcYSURb6adsnkzEfbAF0lkDH89nZdZEEJvcecF2bg==
X-Received: by 2002:a17:90b:3d0d:b0:1fd:5b5d:f09d with SMTP id
 pt13-20020a17090b3d0d00b001fd5b5df09dmr1899162pjb.69.1668675276075; 
 Thu, 17 Nov 2022 00:54:36 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:b354:386:82db:58e7?
 ([2602:47:d48a:1201:b354:386:82db:58e7])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a170902684800b00186e34524e3sm672660pln.136.2022.11.17.00.54.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 00:54:35 -0800 (PST)
Message-ID: <fc43ae17-3908-9c44-9f00-95e617e9dea6@linaro.org>
Date: Thu, 17 Nov 2022 00:54:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/9] target/riscv: add cfg properties for Zc* extension
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20221117070316.58447-1-liweiwei@iscas.ac.cn>
 <20221117070316.58447-2-liweiwei@iscas.ac.cn>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221117070316.58447-2-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
X-List-Received-Date: Thu, 17 Nov 2022 08:54:39 -0000

On 11/16/22 23:03, Weiwei Li wrote:
> Add properties for Zca,Zcb,Zcf,Zcd,Zcmp,Zcmt extension
> Add check for these properties
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> Cc: Alistair Francis<alistair.francis@wdc.com>
> ---
>   target/riscv/cpu.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>   target/riscv/cpu.h |  6 ++++++
>   2 files changed, 49 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

