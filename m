Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZCvQ-00011H-3r
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 10:38:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCvO-0000fd-29
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 10:38:54 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCvL-00034B-36
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 10:38:53 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so8496923wms.2
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 07:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678117129;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mchCrK2cxJeE1WoyED0JTKD2bax1zh0H5EZHRUKvisE=;
 b=Ojv3ZLEb48W4RRvXubgF47Eam3WFv1Eq+vvoebokuD275FU5dxebCNhdMn0IgeA/Q+
 D4gJmv53gShL8DFl0Vx8cNXd+W9V+U+M0QXGI0r9OjQTZ3rp/X0zswcYzqNMDB3Rgew/
 Vq8IvoVDsBK9NRI3FKpVTokvRyPlKUgLTUvSQgOEi6KLPU+JPPdtRkGDZ1OoDW3VAJWm
 nrwj0YaW3kX5pbSKlVinIbSy2HX9TKlcGq0dSVYdos99zhou3OJrD9pkiOpUB6XK7VE1
 oAmc8gZwy/cN1JWWYBmbu4NjWweaH20bN4yj+83B8JcEp6vv/OR5jL3BSKHBIaWtHB2T
 ll/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678117129;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mchCrK2cxJeE1WoyED0JTKD2bax1zh0H5EZHRUKvisE=;
 b=OV4OxXezaB2HiqOijxvlKJws8Q5YTBSXks10qM50sxoVDITo4akS1P6kZTX2K97CWJ
 yvdTuZ2RWfx9cAHk6XiiQ98oKpxa2wHeWCNYweQkRffTrlnq0zD5osMOvWyN9MD6NfrG
 Df7Jwg/5wbLwVqRDFF/aUTc3sSm8Zp/7OSXos3sIjPIc0T6etaghgLwjyPfnmX6n/E+4
 WIW2q7ta1bOv9yeeVRgEY83hapwb7gfBIoDDMUL8OQpludiHMJeRXZftlnabHeLNj8jV
 IiCsQON2BySeKtRsOuikJAxXvbm0yNqal01A0G8eyfTixjoiHmLScJAvvFMf7BE8xM9c
 DU/A==
X-Gm-Message-State: AO0yUKVZMvWXtXSLtgVsT7Rcp6D5zjlcv0ZrTGwAZ9k7gY1eR9gYwJIu
 90RVm8jMkimGYD3flJWqdkv7+A==
X-Google-Smtp-Source: AK7set/R9UD+wDZ3x531Y4U4wMI4OSZ5VUBpwjkhjYkSDEdQY/G0ZExkhIZ+/TUbyHw4aN9el3WViQ==
X-Received: by 2002:a05:600c:3505:b0:3ea:f883:53ea with SMTP id
 h5-20020a05600c350500b003eaf88353eamr9053672wmq.7.1678117129625; 
 Mon, 06 Mar 2023 07:38:49 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c2-20020a5d63c2000000b002c8ed82c56csm10367575wrw.116.2023.03.06.07.38.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:38:49 -0800 (PST)
Message-ID: <4ab2e07e-1add-d521-eba5-b81292912b4c@linaro.org>
Date: Mon, 6 Mar 2023 16:38:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 57/70] target/tricore: Rename t_off10 and use
 tcg_constant_i32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-58-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-58-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-List-Received-Date: Mon, 06 Mar 2023 15:38:54 -0000

On 27/2/23 06:42, Richard Henderson wrote:
> While temp3 could simply be initialized with tcg_constant_i32,
> the renaming makes the purpose clearer.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/tricore/translate.c | 56 ++++++++++++++++++--------------------
>   1 file changed, 27 insertions(+), 29 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


