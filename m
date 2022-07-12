Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oB6s9-0002jt-DN
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jul 2022 23:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB6s7-0002jN-Ri
 for qemu-riscv@nongnu.org; Mon, 11 Jul 2022 23:47:39 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:39714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB6s6-0002N8-8O
 for qemu-riscv@nongnu.org; Mon, 11 Jul 2022 23:47:39 -0400
Received: by mail-pl1-x632.google.com with SMTP id c15so1329342pla.6
 for <qemu-riscv@nongnu.org>; Mon, 11 Jul 2022 20:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DT9bPUBppois5WWoD4iTEPJW2aXttq0vxtxzDlk7DS0=;
 b=eX/kYdZkFIdlY6am13iphYwymXT+tFBzxBsYMWSvG56uH+vY6kpPBYFbuXw4j1moq5
 Zwr4es/8I0IGeHpMMS9WvVb9xrycmHlIYfWYgF0koF8mpALHEUbBKSftGiG9LIn1Sfa7
 ZLsPsegLtdwinqPfUz7xJAGzgMtH/Zg66s0H5NDUj2SabedsjnPl0s/yk9i0M6YSORTa
 b5IuR8kK9DhEPcxHmwBglrfTZZgenkcuJ8ssJgmvpCBI7tpXK8Tj5lW87qA+P8DMUwh1
 QHowwt0lVWCCZKp7z/yFVXZOBTJ3Pbfy+/kXbv+CwmwOzwxeUr7zmmRXRBNH3iUtjoDS
 kIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DT9bPUBppois5WWoD4iTEPJW2aXttq0vxtxzDlk7DS0=;
 b=iubIsewxT6CklVfQXh9L+a8HExAtyVTc7Gqa7t/0XtHn3RsXMcCdFlkp6PwYYFfoD8
 NOLGketFE9+NzIoPfW8khWdJfnJdseoOL8WsPKhXwA38TMJXVKRSM5l//1ONU1BzmzBB
 7vScnucV1pGhpPZv7hrZ+KDlTlOEK88q+zczKch6IgoSK7d1NTOaQfvhdrzuGt5V51dS
 0nMqcFijs/x+mAwkqXUXDOFsBUH2QyL5GoZ2M/41QHcEwRLtVibI7qeL5WY0JiQ7FaoZ
 F3iXCOJsorcTQOhXSvapqhjpMrHO+79/SOdtn1Srel9I3KW1RsGotQZ/FmjRmvnUopp5
 Zs2w==
X-Gm-Message-State: AJIora+mk1MQgcCT69RF/jECU5NCC/nCIgxWmekOk+lMyis3T0cGSVn2
 HEAWxjivkntqBYOJdgi9NyVAwg==
X-Google-Smtp-Source: AGRyM1vc8tWswrCfGcE4q4CDyJ49ppZLn8OpDIfjWzNDf5Eauxm15QxL5hCVxdJdZt10NgwexCachA==
X-Received: by 2002:a17:90b:2096:b0:1f0:1c73:f62d with SMTP id
 hb22-20020a17090b209600b001f01c73f62dmr1875272pjb.120.1657597656277; 
 Mon, 11 Jul 2022 20:47:36 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a632246000000b0041296135280sm526397pgm.88.2022.07.11.20.47.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 20:47:35 -0700 (PDT)
Message-ID: <c7dcf637-df7a-e4e1-0152-232ed0cf5e68@linaro.org>
Date: Tue, 12 Jul 2022 09:17:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] target/riscv: fix shifts shamt value for rv128c
Content-Language: en-US
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
References: <20220710110451.245567-1-frederic.petrot@univ-grenoble-alpes.fr>
 <CAFXwXr=OK38-vFo7+1z4RtqKcr9hz74bVxb__q6xi7rkyziMUw@mail.gmail.com>
 <381a2feb-fddc-da5e-c94a-d2f5d3471297@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <381a2feb-fddc-da5e-c94a-d2f5d3471297@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
X-List-Received-Date: Tue, 12 Jul 2022 03:47:40 -0000

On 7/12/22 01:24, Frédéric Pétrot wrote:
>    Agreed, on the non compressed insns, but the compressed ones have a 6-bit
>    shamt only as visible on page 18.6 page 125. The explanation for rv128 shifts
>    is further detailed in the emphasized paragraph on top of page 120.

I see.  I should have read the "c" more carefully there.
Indeed, the code is correct.

I think the language could be improved a little for clarity:

>>     +static int ex_rvc_shiftri(DisasContext *ctx, int imm)
>>     +{
>>     +    /*
>>     +     * For RV128 a shamt of 0 means a shift by 64, furthermore, for right
>>     +     * shifts, the shamt is sign-extended.
>>     +     */

For RV128C, a shamt of 0 means shift by 64, and the shamt is sign-extended.  Combine this 
with implicit truncation to 7 bits, and this equates to replicating bit 5 to bit 6.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

