Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKTCY-0000FP-Ev
	for mharc-qemu-riscv@gnu.org; Tue, 24 Jan 2023 18:59:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKTCW-0000Em-Md
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 18:59:40 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKTCV-0006s5-2m
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 18:59:40 -0500
Received: by mail-wr1-x433.google.com with SMTP id e3so15440692wru.13
 for <qemu-riscv@nongnu.org>; Tue, 24 Jan 2023 15:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UOLr4pyyy5L8mFmpt5H+tPhyT7qOp1R7U+s5bkD1dac=;
 b=Uk9LiKX7s4imRxiYutE95es79mophIDUifZbIi88dB81LI3dBUhmmN7gWQ10/+ni3R
 iDXwwr46kPNqk+LGPg+FQ+TfoyZtKtQHtgnLqVsph14Wv8L59rxIpnbBEYO5IVgnTrqX
 Ul7YWuHDh02Ex68hFIp4kWF4i5NY7SKdEUji1hc5KKRRBRXjwXqsI2C3WOlfKIEfEIwu
 qKyqLipuOwuSSuW0CyEF12l93fX6bHzKHMjlSKOgq9uWT4nkSiBSfitPDHwA6IZT09r1
 6/3OUHTHeRHlBRAQs9YHgjNieFRnqANqeyjGz5loO4/UIyuMRApNVzaIGiNPJTERUjzl
 jLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UOLr4pyyy5L8mFmpt5H+tPhyT7qOp1R7U+s5bkD1dac=;
 b=kbpzvmeet0WkqJkhp/AWz3Q1z6Bg4tFbb14BySgtAPXtV530vHUWudcunF7Owq8Xf3
 d5Ihec9uzv1ZmdG3oJIYpnmWVC3mc9FDM2SH9RBHzARGNJ5lBThvgDqPwsGQhcHXf6Vt
 RFUnRPXPp7YsHzCs+nQok9HXiWwDjFlA/DqQ5mPQR1il/TagL4ideskUCbXLYo2l0wJm
 FHe2vcWYiOsBXjLN8RymGsMND8hYIzcfbZ1ZqDYUFtiHiwf/abA1bM4z9c4wMNTjuqyX
 umt/Ure3MnhdoXZFpR58/7FV8YwaQeYGf+WD2Bo0spZrT/4eaQby+8y2vZGn8pDUJHZj
 /wug==
X-Gm-Message-State: AO0yUKXGI46jSt5fyqqP+W60iNjMrxZW0cjcXo1vKIbmK0EgbJjJtftV
 lgLBgOI4ua8lpaEQoGFP1hmkRg==
X-Google-Smtp-Source: AK7set9LZxqDVsurQX+clxgKMaJA19josCoPtgvjJAjGGELJGA2Msrcd0qbdSkqRfcfyHEtwz0DVHw==
X-Received: by 2002:a05:6000:1c13:b0:2bf:afaf:9d71 with SMTP id
 ba19-20020a0560001c1300b002bfafaf9d71mr3817917wrb.48.1674604777522; 
 Tue, 24 Jan 2023 15:59:37 -0800 (PST)
Received: from [192.168.0.114] ([196.89.153.183])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a5d49d0000000b002bfb0c5527esm2409267wrs.109.2023.01.24.15.59.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 15:59:37 -0800 (PST)
Message-ID: <32faa412-7b03-2f91-fde6-024be8276488@linaro.org>
Date: Wed, 25 Jan 2023 00:59:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 08/36] include/qemu/int128: Use Int128 structure for TCI
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230108023719.2466341-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-List-Received-Date: Tue, 24 Jan 2023 23:59:40 -0000

On 8/1/23 03:36, Richard Henderson wrote:
> We are about to allow passing Int128 to/from tcg helper functions,
> but libffi doesn't support __int128_t, so use the structure.
> 
> In order for atomic128.h to continue working, we must provide
> a mechanism to frob between real __int128_t and the structure.
> Provide a new union, Int128Alias, for this.  We cannot modify
> Int128 itself, as any changed alignment would also break libffi.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/qemu/atomic128.h | 29 +++++++++++++++++++++------
>   include/qemu/int128.h    | 25 +++++++++++++++++++++---
>   util/int128.c            | 42 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 87 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



