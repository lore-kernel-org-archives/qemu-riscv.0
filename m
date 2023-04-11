Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmCvt-0000d8-Hj
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 08:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCvr-0000cd-Vc
 for qemu-riscv@nongnu.org; Tue, 11 Apr 2023 08:17:08 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCvq-00069F-DN
 for qemu-riscv@nongnu.org; Tue, 11 Apr 2023 08:17:07 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 i8-20020a05600c354800b003ee93d2c914so5643718wmq.2
 for <qemu-riscv@nongnu.org>; Tue, 11 Apr 2023 05:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681215425;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fRUKW6u5mJOe+ofai1IWzRGRS5UDuKRXTn5POZtj3ZI=;
 b=auuBkAukQ76z7prOYBSVilZAcsLHyAlpyImCjt+HiWRF6mdUgm3AZZcD1aN8cJaEVx
 j2rqls49/AxccVBjWx8cYcKDl/rse8H+nW2JbFph8WPOCcnaAhc7v5pdu5H1GfpbB0g8
 EQnhWBgLivJz0HB3HciNms5H9VVdIRtGZmRNHkyo6UNV2SfBVoHCwO6I/DTiTUaGioJP
 Q0JSyZS5uUQ35D+SGcjyEUayARkyt6MQhebhiAFN69xL9CH3NxFVaK8VWjOUADi51tew
 o4qXlwVJvlEwSxf4YVV/GjoqpucpNrKmugFiA8Wm2bTd57I0Fjs6eJdmotV4ec6vOz0n
 GlDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681215425;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fRUKW6u5mJOe+ofai1IWzRGRS5UDuKRXTn5POZtj3ZI=;
 b=wCI11+W3m4VpL8OckENNAuk8Se6B7oX/zR3vES7LgkbEwDoB54TCvqdCK0cj7UcaS7
 sG9mUDF4dkaEl+nF3D+foRXRtiPFjaAGit1gImqORrWiwN463TKrpqXsgumZ5oloRp5h
 ufiQ+/6vK7FWvjlKb4xHScNaTAiAt69qg8uCmVRDtzfjrbzC3mafhqqjA3KHOUe+g3Nv
 1RxSQXRNV6Mf76XoAyFkrEYbpnNhv+97HjbNogjzDRYMj6iddg+E2E2EprYNZquLBOGb
 8nUWLTFa8YZWM/2ltBWNHfN7Wi+4FNAHXlv5sy9NPlyscqNfQz5lBgRpDB/sdzlRA4IS
 SDoA==
X-Gm-Message-State: AAQBX9dALb39NXQnNYYS2p1x11wtjXphj2IDUjK7dsYqMBlTb4PwXSEM
 yUEKybTzBYdpiy32oF3GMOjLWQ==
X-Google-Smtp-Source: AKy350Yticz7dIo+DlJgcIb7nnjIk+lyXw3YeqIeEwHJ9m7vkwkDHAeGvX4piN2ENoOjIBZ82zC4sA==
X-Received: by 2002:a1c:7312:0:b0:3ef:128d:7167 with SMTP id
 d18-20020a1c7312000000b003ef128d7167mr10199714wmb.13.1681215424978; 
 Tue, 11 Apr 2023 05:17:04 -0700 (PDT)
Received: from [192.168.1.101] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a7bc8c3000000b003ee10fb56ebsm16987726wml.9.2023.04.11.05.17.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 05:17:04 -0700 (PDT)
Message-ID: <8f3aec2e-9067-43c7-5161-b393bee98dbb@linaro.org>
Date: Tue, 11 Apr 2023 14:17:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 24/42] tcg/i386: Use TCGType not bool is_64 in
 tcg_out_qemu_{ld, st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-26-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 11 Apr 2023 12:17:08 -0000

On 8/4/23 04:42, Richard Henderson wrote:
> There are several places where we already convert back from
> bool to type.  Clean things up by using type throughout.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/mips/tcg-target.c.inc | 56 +++++++++++++++++++--------------------
>   1 file changed, 27 insertions(+), 29 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


