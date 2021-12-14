Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mxF6I-0001So-AD
	for mharc-qemu-riscv@gnu.org; Tue, 14 Dec 2021 16:12:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxF6G-0001SS-OH
 for qemu-riscv@nongnu.org; Tue, 14 Dec 2021 16:12:40 -0500
Received: from [2607:f8b0:4864:20::42e] (port=39838
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxF6F-0001SL-2n
 for qemu-riscv@nongnu.org; Tue, 14 Dec 2021 16:12:40 -0500
Received: by mail-pf1-x42e.google.com with SMTP id i12so18871693pfd.6
 for <qemu-riscv@nongnu.org>; Tue, 14 Dec 2021 13:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mNOZ7yMTAX/qwuKncETnh9VRBF52WijU9ADfqkFNlLI=;
 b=KfH4YtY2J2t9LytwMSiisil3jz1A5mjsDj/bx6Ew7+4DjmyEOOuIML7B+G0SdgUKXz
 flEhPyWBo/EjrBtjliNEJcGizX0HTXSsbs6J04T9fsAvpmRSdgfgGf+N7+tpg3b4V64V
 hlM2Lra1lBvS1aCPUZenpVCTQmaFNcsqI2smafha6fJi6yNbzmnOzQ5FiLR3HkyFcdlk
 J3vGXxMVbs/I3feTxAzm6Kxlf0iiGODOaqobyOQ3jjT4HEoMAIPGdo7TgBXQ/vmNnXpn
 8Sa3oXMfbO9kV++t3WQlVoAtsDi8pyPGE0U9ZUp0GG8Vk9sH1TA4nlB0WYYdY1bWbx9P
 iTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mNOZ7yMTAX/qwuKncETnh9VRBF52WijU9ADfqkFNlLI=;
 b=8QKiMkwmMTUl+tN+dCIog+S+/QeGIoI6E2eQtqEG2joTCdNdpj9/LXcLUJvwck+oJ0
 aDJMtZ1QQXc7D4XDpjCpAxS0ueN7E3vyDD1+HeCPZTkiNYxKmpzZm3BdUgUEoZdLGcfN
 YylLT3DYcfu0bexdjr9OAM3xoYk9zskB+57nQHMqVP1Vh2i6oJgbIAcejhsF3dE+vnUz
 YCpfpOc6ECjAWL8zZMZzHObFqBjj0WMDdRWPihO/LpDpxgv1AgPGLyl4LMuOZLqu70G0
 sottL/AjdLskgaq1solK/WTehS9gO4BcRWw2yRgA+ecL0rK2MwHI3mqW1eqmTG3Sxgwp
 5b3Q==
X-Gm-Message-State: AOAM533gdNst5AyBv3ptIP3uZUugTw0u0aa9NfcH3FlcAsLwrZZicp+Q
 g8srUMDlrHxoLBO9sjhG6aNebA==
X-Google-Smtp-Source: ABdhPJzTbGcrj0ic75BveFaUNGPv7U95pJj6phCdSvOLNdGXCryvYf5W8fKGOv7wBjnODjdnu6EjBg==
X-Received: by 2002:a65:4bc8:: with SMTP id p8mr5296376pgr.119.1639516355003; 
 Tue, 14 Dec 2021 13:12:35 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y4sm8824pfi.178.2021.12.14.13.12.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 13:12:34 -0800 (PST)
Subject: Re: [PATCH] target/riscv/pmp: fix no pmp illegal intrs
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: qemu-riscv@nongnu.org, Nikita Shubin <n.shubin@yadro.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, atishp@atishpatra.org,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20211214092659.15709-1-nikita.shubin@maquefel.me>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6a13ed88-e109-93e4-9254-62b6b04f5913@linaro.org>
Date: Tue, 14 Dec 2021 13:12:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211214092659.15709-1-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 14 Dec 2021 21:12:40 -0000

On 12/14/21 1:26 AM, Nikita Shubin wrote:
> -    if (!pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
> +    if (riscv_feature(env, RISCV_FEATURE_PMP) &&
> +        !pmp_get_num_rules(env) && (prev_priv != PRV_M)) {

When would the number of rules become non-zero with PMP disabled?
When does this test make a difference?


r~

