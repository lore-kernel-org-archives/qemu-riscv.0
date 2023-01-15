Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pH5l1-00080F-3f
	for mharc-qemu-riscv@gnu.org; Sun, 15 Jan 2023 11:21:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pH5kz-0007zy-TD
 for qemu-riscv@nongnu.org; Sun, 15 Jan 2023 11:21:17 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pH5ky-0005JO-8v
 for qemu-riscv@nongnu.org; Sun, 15 Jan 2023 11:21:17 -0500
Received: by mail-pj1-x1035.google.com with SMTP id q5so742517pjh.1
 for <qemu-riscv@nongnu.org>; Sun, 15 Jan 2023 08:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4HwwwRKOC4pP2N7Adzj1yCmXUkvFj0ZXVMfEZ0ETB38=;
 b=QoFZZ8mB7bQokSlrgqQsSL2yPxK71ns/UCSzNXOTmSc7Yi9UVAIMEvoGp2YcDKIJWK
 sPpC4m9tESJlayKKVMi6epCRKVTsFPqrsqpHvwxX5hT/ZCGuvQBinRH6wskBZ6HB0PQX
 8FWkIhs6kIsYgSctWgn4DYHKngrcxT7LzQJNoyspAzSgudEWJ8wcuSjeiyBhUZVZQlSy
 f0EKHDbWICdJpPDEhXwdU5ac3hlbcgYGamrh6YM+q4OLr5D0Nrcycp23Hi4d/p9fOxHQ
 HXCfJ11eQGcUoaOvd5g4+u8BCPPKTFhOItQaZzjHziOV6wOd5DmJ4KbHQs4CLWNdct9I
 /oBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4HwwwRKOC4pP2N7Adzj1yCmXUkvFj0ZXVMfEZ0ETB38=;
 b=xobyzqcObhX9bULxBelIAekudzLWb5rK5KTbUgAKDobAOTvsPHA7bYz083u5Lc4lov
 Tf7M9ZdeIUAsvqAkHVwmQnjBfLibY4MVyY/wFrQJ8SdiSftPb+s4G1CC6Rbi8HtUdsWL
 Tg31M0MSw3pmR1Ud2IFlZHRSu0/8gAyRNEKU0glKI/a1juwWlP4/kYnp1p2/UtGjLdst
 GF2BD1nAnK3/ktMkpAvbpw8FOgmnGmuPaYAGqUmmF2LgUGOfFZXKROY3rAzqACNgMomM
 +n+fPUB5Lm0jLVNbkN9fC28SQySPxOdQj/7U/PU7wqRrjdHS7RogTV7dh7xQAt/OxX3s
 AjEw==
X-Gm-Message-State: AFqh2krcaSD61Mq7HSniCPTUs4V6Qf8cf6IWHblcOzxpQmgvfJfT4JmP
 sd+Aj2HfLCYPknwbva4A8AiV0A==
X-Google-Smtp-Source: AMrXdXtJJIaAnsWSODYUf+UTLmaaEGkX+PvPs4RERMwp6l5t5f3OxsG6X+w9fOoYX8Y+dldhZ223Xg==
X-Received: by 2002:a05:6a20:ce4c:b0:b6:9694:5ab2 with SMTP id
 id12-20020a056a20ce4c00b000b696945ab2mr11359710pzb.44.1673799674384; 
 Sun, 15 Jan 2023 08:21:14 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 b15-20020a170902650f00b00188f3970d4asm17582497plk.163.2023.01.15.08.21.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Jan 2023 08:21:13 -0800 (PST)
Message-ID: <1cc50520-32a2-035a-8b47-98aaf1093354@linaro.org>
Date: Sun, 15 Jan 2023 06:21:09 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/2] target/riscv: Fix double calls to gen_set_rm [#1411]
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bin.meng@windriver.com
References: <20230115160657.3169274-1-richard.henderson@linaro.org>
In-Reply-To: <20230115160657.3169274-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
X-List-Received-Date: Sun, 15 Jan 2023 16:21:18 -0000

On 1/15/23 06:06, Richard Henderson wrote:
> These double calls tickle an assertion in decode_save_opc,
> and isn't efficient anyway.  Introduce a new helper to do
> exactly what was desired.

Also #1339.


r~


