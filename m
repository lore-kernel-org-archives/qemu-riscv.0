Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZLFj-0006bo-Fo
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 19:32:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZLFi-0006bU-G3
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 19:32:26 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZLFg-0007rX-TJ
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 19:32:26 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso6287348wmo.0
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 16:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678149143;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qe2ODlTs4IBzXzGgr2jSDMy447akIdm4ZtVi3N5Y4XM=;
 b=M9SvHaNqPVenACAukgW0dZLxO+S+PURldLFBQSe69KsWjBidotxl9f7AEJ2ylbwz4+
 vAOgWM9sgJHn8lojQjXb8JHEliDpAwHQzLFIZ/mZIxb0HNGDGmFwlnE0KyWRq1hoYJeP
 QHsI7cPXIzursAG0wJaBVpfhHNLK29xO3SlfsTqMAJIDvZ+nYN9GihIScZtqmcGr0pok
 lS5/SRJXai76hrdTn5Vj4km67bCdamAP7vWpyaAJ37m0JqRPdxJL3QGVhT32kAAqMQzp
 vNJF1Nc7X22+yAo+uS5ilINXzkSyWgylBk7sFcGMypLu3RqVGHhlDpxHnS+dGnWwiRwM
 6Xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678149143;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qe2ODlTs4IBzXzGgr2jSDMy447akIdm4ZtVi3N5Y4XM=;
 b=RlGIkHMwH08ZMuIaAx6d0pYOiyb8sge46qdgLvdIu0GcYQVZHfPl8QKbncbudzOTHY
 yk1pGzmO9O38PV2TTF0ZtYuZVA5TQ25QqA4eN1JlGd6Vl2Wji3K/288G5FW5mse+deLF
 MjJ5WfAmbfEhqO3rIhiKqTHUaP6unsfKWh7nKwRzr8dWOkmuOAO9ZIg+eYhLByYliYqh
 KcM47lpnr4iJKtH9jKbatJKo9uzjRByH2l9lB6rVg8RGNW71sMysHchOv81drCv3rDDg
 +yW5qatNEuHMKrSMeEGI7DpNOVWusXnWrdOd385FOojlkiFIDKlHzeYEbxnOSfkDOF47
 0iMg==
X-Gm-Message-State: AO0yUKXb+iUIGi5JTb9o8ZPSHqejNdKf+31h3xQCQV2d7XmApUA8GGRg
 wWzoOlP/EC1EQeNwPNbjmSwV9Q==
X-Google-Smtp-Source: AK7set+bWe0mEoYlmFbhjL9xtwjla8AgxcgirujLaRx3kzzrNm2yd7wgnPJCtyhJGRtZhbfsCT239w==
X-Received: by 2002:a05:600c:46cb:b0:3eb:4cb5:e13 with SMTP id
 q11-20020a05600c46cb00b003eb4cb50e13mr11138169wmo.31.1678149143380; 
 Mon, 06 Mar 2023 16:32:23 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c4fcb00b003e8f0334db8sm16618566wmq.5.2023.03.06.16.32.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 16:32:22 -0800 (PST)
Message-ID: <cfd598bf-1276-eee1-b4cd-6030a06967a9@linaro.org>
Date: Tue, 7 Mar 2023 01:32:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 47/70] target/rx: Use cpu_psw_z as temp in flags
 computation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-48-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-48-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-List-Received-Date: Tue, 07 Mar 2023 00:32:26 -0000

On 27/2/23 06:42, Richard Henderson wrote:
> Since PSW_Z = PSW_S, we can move that assignment to the end
> and use PSW_Z as a temporary while computing PSW_O.

Nice :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Use tcg_constant_i32 instead of tcg_const_i32.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/rx/translate.c | 28 +++++++++++++---------------
>   1 file changed, 13 insertions(+), 15 deletions(-)


