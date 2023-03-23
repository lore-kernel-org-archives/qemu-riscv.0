Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfO0P-0006T8-CS
	for mharc-qemu-riscv@gnu.org; Thu, 23 Mar 2023 12:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfO0O-0006Sw-EU
 for qemu-riscv@nongnu.org; Thu, 23 Mar 2023 12:41:36 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfO0L-00062E-PU
 for qemu-riscv@nongnu.org; Thu, 23 Mar 2023 12:41:36 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 gp15-20020a17090adf0f00b0023d1bbd9f9eso2568347pjb.0
 for <qemu-riscv@nongnu.org>; Thu, 23 Mar 2023 09:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679589691;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kqyoSI5i+pkQt4yftSmTL7pnFANsWJMeQ7Q78lFUtZ8=;
 b=Uv9C7tS1nJxCG5KawtZ7wwuS47JEj9Zyxw4b3oxjtd44uhf2A3ATS4rRhZMRqOpenN
 e26+7PXwmcJ8EbCKf4VIH5ZEqtZ4hHddYUF6wHpcQcSZ9HPoBbNLCp/8CeK/nwsoRyLp
 rwH3sua1+hVREgXfODuqyN3Z75jDfsWo41RO8J1Ki4JjHn9HpfGx7xPmOZVihgS0Cjp0
 +NiPjBkc1HWt/7YbHMDPoiU6LaB5UiF7XtnBQSRLXI2fIRyo6BTrKD4w+xUo3LyUvBOq
 F8HDJ6GLDujzj+rd14gfxEc3NBkF/pWetxj4W6Y2u9kbIhkiopjqQNUhD/hU9Z/WyVI6
 lvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679589691;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kqyoSI5i+pkQt4yftSmTL7pnFANsWJMeQ7Q78lFUtZ8=;
 b=YrHlDktae8EKsdPbWWPxq/NdSIf5dYou0jxBmo+G/21h+F+ymf3WWjxZXCskADxMDk
 Z7lXU1T49t4IRahJhTG5sOJlZvB4Eq2jrx8LpypVMv2OElLS7YUKhWhTDZZyI0EmCcn9
 V9W7XLzEs6W0uzgy0qfvZKCaJOlzAaQzd/TG9nY9NiEuqZsR7trSH/t49I7cO4oicbHK
 7i7HQQCG4/Mwv3hAob87qLmyqjNzm5mNPAh3s2Ytk3tvxJGi61r2TJ4BXRxLyc+38eMH
 u8sRsQk5Gv/EKXexfDacBScW/AfXwk5OUAB//2GVxenLXspxVLa2zRk+O1ywEmiRVV/9
 n+hA==
X-Gm-Message-State: AO0yUKWwuTaEWnFyHFZV2QROW+HmwJSaKt93hZbENBse82hZVNJQx1TC
 N6z1o6vmDH1FV2PkGcOfq7f4pQ==
X-Google-Smtp-Source: AK7set+2NYvtYEqBp3Cg+itOOEJR4aUvQGheWFO71ZlmtwMDBTo9gqNhIs0RTEk78XPS8ztvH9iu7w==
X-Received: by 2002:a17:90b:1bcc:b0:23f:b35a:534e with SMTP id
 oa12-20020a17090b1bcc00b0023fb35a534emr8543177pjb.29.1679589691042; 
 Thu, 23 Mar 2023 09:41:31 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:226e:47e1:b8cd:a957?
 ([2602:ae:1544:6601:226e:47e1:b8cd:a957])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a170902860700b001a1d4a985eesm7530594plo.228.2023.03.23.09.41.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 09:41:30 -0700 (PDT)
Message-ID: <86d858a4-4d93-38b0-2661-493de52b8799@linaro.org>
Date: Thu, 23 Mar 2023 09:41:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3] target/riscv: reduce overhead of MSTATUS_SUM change
Content-Language: en-US
To: "Wu, Fei" <fei2.wu@intel.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20230322121240.232303-1-fei2.wu@intel.com>
 <cde0b3bf-7d38-2fc4-c8a9-7241d5bf7339@linaro.org>
 <4c0c210b-7a9a-34a8-b0c2-e32f9328bf07@intel.com>
 <5a9a0d2b-6530-2436-712a-ef168266d2e9@intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <5a9a0d2b-6530-2436-712a-ef168266d2e9@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 23 Mar 2023 16:41:36 -0000

On 3/23/23 06:24, Wu, Fei wrote:
>> There is MSTATUS_MPRV and MSTATUS_MPP kind of thing, priv+sum is not
>> able to represent all of the status, probably we can just add an extra
>> 'priv' at the back of TB_FLAGS?
>>
> MPRV+MPP looks not necessary be in TB_FLAGS, it's just used to calculate
> the mmu_idx. Is it necessary to encode SUM into TB_FLAGS?

We need priv separate from midx for priv_level() and similar uses.
We do not want MPRV=1, MPP=U to prevent M-mode from executing M instructions.

With PRIV and MIDX in TB_FLAGS, we do not need to separately encode MPRV+MPP+SUM, because 
all of those are composited into MIDX.


r~

