Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l2ftr-0001Ag-5O
	for mharc-qemu-riscv@gnu.org; Thu, 21 Jan 2021 14:45:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2fto-00017T-33
 for qemu-riscv@nongnu.org; Thu, 21 Jan 2021 14:45:44 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:38372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2fta-0005DR-Oe
 for qemu-riscv@nongnu.org; Thu, 21 Jan 2021 14:45:43 -0500
Received: by mail-pj1-x1031.google.com with SMTP id x20so2339919pjh.3
 for <qemu-riscv@nongnu.org>; Thu, 21 Jan 2021 11:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/wVvb+vl1snSEt1cjoeyE9ib1fzpNNMF8MXyH3aqnxw=;
 b=EGfjBRU8YlUB69QBsR+S1WxJ4sqcpwWu2oSCPYpMg10O0ch/wQKDhhvWOsD6by8BV4
 TP6sYGe+VMduU5R5F6b42WK8Ee4xrpmU115CNLGvSkwy/FvIzxqLqlOoTKEp15U3jRRG
 PZLA5cEeqJnAr284VUUtBB8kW1BtJ0RpSrrDo1G4wOA2A9edIFx6jLgxCc8jtgp8CF4M
 NxtoDzibUc8StCtOulI1vyE20X2/R977h6rieWSEYphj+FcJF/Kp5Ph2Xiqc7VXhyHnv
 Eu/3y/T85LbojYyvVaSnZ++jTvFO0tUzhwwlK7xgZw3OeXKWiy+sJE8jAdJDRNVu8Bir
 hnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/wVvb+vl1snSEt1cjoeyE9ib1fzpNNMF8MXyH3aqnxw=;
 b=WOj7qLky+VvNuVS0Jtol4m9YXuf0f65KNtPtyr7zorShARI5cmaUBbyX2cSb8ph/hl
 afS4HDqpjRQoEX0lDctyIYiW9192oTAvI10tSOXGC5nD2vDR0EMqvtigJBn03+G0Xdhk
 BCMsVYsMuvumniGhrH7+SV/ROM8ZYzGKwVwNhuqIOl/hdHf7ITBjLuh+VJ3zQr7/I7we
 F26QJdCQy+ohApItvpjgyMzKDvlEC9s+ZnIeI5ZX2fxcLEp1okrLIqOTL97GC/VQzm/y
 8P1zYGRm1rYDIEpXftHUvQ2Hfj0NlUbpdFHV0FzjRlBfQDXip4IU9qOlWovboVj5gjX+
 x48A==
X-Gm-Message-State: AOAM532WGIXoxo0DOD9+Cm6qOEv78CBzn6XKEXWufJLQGQPa0fS22Z6g
 4NvR4ENdj+zGbmg+JXBF7yoKxt2Y6WOIhw==
X-Google-Smtp-Source: ABdhPJwUNfzZxLhWkK2f16hDi2APFjBav3bZ+ktUwS7cYeM8Kv8OLeK+M0RlUrevMB51IFgCRadVTQ==
X-Received: by 2002:a17:90a:8814:: with SMTP id
 s20mr1108990pjn.69.1611258325867; 
 Thu, 21 Jan 2021 11:45:25 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id y22sm6439911pfr.163.2021.01.21.11.45.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 11:45:25 -0800 (PST)
Subject: Re: [PATCH v7 6/6] [RISCV_PM] Allow experimental J-ext to be turned on
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20210110185109.29841-1-space.monkey.delivers@gmail.com>
 <20210110185109.29841-7-space.monkey.delivers@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <541512ca-4055-b761-f032-10ef1b3a3c11@linaro.org>
Date: Thu, 21 Jan 2021 09:45:21 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210110185109.29841-7-space.monkey.delivers@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jan 2021 19:45:44 -0000

On 1/10/21 8:51 AM, Alexey Baturo wrote:
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
> ---
>  target/riscv/cpu.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

