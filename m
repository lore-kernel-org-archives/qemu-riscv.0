Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oMf2l-0000Iv-1D
	for mharc-qemu-riscv@gnu.org; Fri, 12 Aug 2022 20:30:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMf2j-0000Er-Pe
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 20:30:21 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:43756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMf2e-0006D6-6Q
 for qemu-riscv@nongnu.org; Fri, 12 Aug 2022 20:30:21 -0400
Received: by mail-pf1-x435.google.com with SMTP id u133so2254946pfc.10
 for <qemu-riscv@nongnu.org>; Fri, 12 Aug 2022 17:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=D/dIJqMWn7Az8OKLrZAE6V1Dt+UV8rHTFLdnDsSa+mw=;
 b=bxqm13OmLOPlpnS8E7Vo+kG3Uc9L0NUEsn+IMjsu/9nUbpLWsq/fym+ZB6Nm4HZUGH
 lOcBIWHeFV7+tRTUUZVxwIwrrmpyHOHhvuNTl/46/gvtzLAxRhzeBnFM6wjOJqtQBkot
 b8b+8jJMN/dN+c+PsJjDRu4yLxCqaY7GxozhX24+KYfa2wyqNMBMSNeEEj41Q9SStzOf
 3AxB+xkXNrFlECqkZIR5GshvT3BNMl9G3rDnkX2VhnvuBmyeiaAA5ICLKUyWAdmzl3CG
 X9EjizPXyaE67NbNwkh/RHS59IbmX99yKTp5l7wDkJAyxpKW0u6OlC2iuTGOouuJYIRu
 3kig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=D/dIJqMWn7Az8OKLrZAE6V1Dt+UV8rHTFLdnDsSa+mw=;
 b=TzbQzDKyTwi1BwXyE932ZEqasz9yFXdoM/5+PQ6Ow7iFT3rHi94RXu5zOITrMiD0NR
 RTYL3CucPnS08Zf8GuG6fb/uSu0ZDOjNlAKUhOp0eGRAAHerPxiq+ALu3K8KMg6ZDK2I
 rXNf722rW0VUU67XBOUFCWpWi2fDO5T0d+ByBoQjAs6eEbu1beDqXSxRM5tQoWjxGav2
 PYEfVS/W4XoV4WEtLK3YqGSRsnKe22vNCNjD4Hz+X2EjeWRfTbCNQ3VE6+5FSCY9ZULR
 KEyqgy0eLI8EPDjM+9jXrjyVHd923DNTH0PxbnrHNoJ/JVd21g1SZc1zgVwyZCCmMcU5
 9AEw==
X-Gm-Message-State: ACgBeo2rDJhsqDhFwxoWOjg/2gO3iTtb/E2+BDpnsx3meAjc7+o6JAeX
 Fsiy2Nota5umsVw7Kq/A0cIYkQ==
X-Google-Smtp-Source: AA6agR7INJaARrqet7msyuKtkRlSLMYGqJfGxI6CS+3IC9z+WSr7/7CgF1meWDViuykkEXkViZ6Ykw==
X-Received: by 2002:a65:6bca:0:b0:420:712f:ab98 with SMTP id
 e10-20020a656bca000000b00420712fab98mr5084175pgw.350.1660350614438; 
 Fri, 12 Aug 2022 17:30:14 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:a7aa:1d1d:c857:5500?
 ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a62870f000000b0051bc5f4df1csm2212402pfe.154.2022.08.12.17.30.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 17:30:13 -0700 (PDT)
Message-ID: <804cd7cd-e83c-2b89-f2ba-cc2ca5c7f835@linaro.org>
Date: Fri, 12 Aug 2022 17:30:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] riscv: Make semihosting configurable for all privilege
 modes
Content-Language: en-US
To: Furquan Shaikh <furquan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <CA+tJHD7FcrBTetGRO0vZn-XGPmZmQraMrw1dw9ia6jzHQniB0w@mail.gmail.com>
 <37244ef8-d2f1-038a-8a51-01d9f62fbe2c@linaro.org>
 <f977101c-bdc0-3b24-5fad-a75b07b5dac7@linaro.org>
 <CA+tJHD4MC9xjVkDAg6QZ3Yq2L-cKDQkofQyGjX67cD_qxbCf1g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CA+tJHD4MC9xjVkDAg6QZ3Yq2L-cKDQkofQyGjX67cD_qxbCf1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
X-List-Received-Date: Sat, 13 Aug 2022 00:30:22 -0000

On 8/12/22 16:57, Furquan Shaikh wrote:
> I am not sure if I understood your comment correctly. Currently, qemu
> has a check in `riscv_cpu_do_interrupt` to allow semihosting calls
> only in S and M modes. This prevents semihosting calls from U mode.
> This patch changes the default behavior of checking `>= PRV_S` for
> semihosting and instead replaces it with the usage of
> ebreak{m,s,u,vs,vu} properties to allow the user to configure what
> modes should allow semihosting calls when `-semihosting` argument is
> selected.

Why do you need such fine-grained control?  What is the use-case?

r~

