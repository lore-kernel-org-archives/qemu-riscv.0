Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZCLr-00044Z-RA
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 10:02:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCLl-0003mA-Vh
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 10:02:09 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCLj-0003c9-Hz
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 10:02:05 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso5399662wmo.0
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 07:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678114922;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TrHfJ9xm9yKvmeoI1ItBdAApvnWF94r7m+svFZjZ1OU=;
 b=Ud3q0WhCG5JQJTCggjbCHJCzQM2JRo2XpFn7Gqqpk1xxc7jznfj0aw7JyZz+kZm1uV
 eoZv071PxcFJE/Ow5LooWhb1cAJwK9Qb+QsOl+ZnmtnGkRD2ICITvtUAGYquouklizGK
 g5J4dTkjsiFsDDWOSirErW779V2W9AuQBbcAI5a5wx+kPks5nW53wtTvS5JoW9c5h3s7
 eSuKzV+As8QVVSWRoAtQf3VsUBwYDLvByMLppPQrWdsnoune2Guwe4Zd3xDkoFAEQLwi
 PvEZX7EbXHmUnla6UQJCUcFiNYDsTiCe7ceLA5OCNhjj6bn3T/I2QeGwYtUCPRHRFzGK
 EFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678114922;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TrHfJ9xm9yKvmeoI1ItBdAApvnWF94r7m+svFZjZ1OU=;
 b=mfv/qrfWFVv/ulv4GcKk2b8tAvENGID9RInPk/N+oOBieqPbuIGreEEWSbx7RKI0Wt
 vvYw9v5Qcrdsf/m/1jKaQxSKDU/jt9FQzRb43f9fiHXlnKK7lzD3Jb6sV1wRrjl2HMIm
 2SANLQLn44TY4unFJ4dX3/vC43wF5MDepjgnuS94lGnfAdTshK8776zywSLmgE4xCgnl
 TvbCpEZkLhTNAME1HLMy+Frx3o2Sz0AvbYe5Scrjjb66wIfzYgzuEJAZISinKTzs5QlH
 O9FY5cZDFkKmpsv7PW+xHARyd7qqnDLPti7yqEGIaDjB2lOe/XmODLZn2pQk1rREK1Ie
 eEYA==
X-Gm-Message-State: AO0yUKXWSEMs0Vi0EgjYh0iqebHLiOlQjZYpOPKYAkQDe026xRiwk4qI
 qhM5wqD8CpjipkmSAAEeko0Elw==
X-Google-Smtp-Source: AK7set+Wwbf9sZXaEKQ2h7WE+6VO+BYUO/6iKc+TmVy5cdtyCIFgNUY8i3jUaQQ3ABqECFbjx6w7Qw==
X-Received: by 2002:a05:600c:4593:b0:3dc:4313:fd1e with SMTP id
 r19-20020a05600c459300b003dc4313fd1emr8788068wmo.34.1678114921653; 
 Mon, 06 Mar 2023 07:02:01 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o33-20020a05600c512100b003e209186c07sm16365863wms.19.2023.03.06.07.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:02:01 -0800 (PST)
Message-ID: <f8647ca9-1fc1-f45b-5f85-dc58bde9500c@linaro.org>
Date: Mon, 6 Mar 2023 16:01:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 64/70] target/xtensa: Avoid tcg_const_i32 in translate_l32r
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-65-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-65-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
X-List-Received-Date: Mon, 06 Mar 2023 15:02:09 -0000

On 27/2/23 06:42, Richard Henderson wrote:
> Use addi on the addition side and tcg_constant_i32 on the other.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/xtensa/translate.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



