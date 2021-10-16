Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mbnxe-0004UM-1c
	for mharc-qemu-riscv@gnu.org; Sat, 16 Oct 2021 13:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnxb-0004R1-Qr
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 13:59:07 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:45746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbnxa-0007rJ-AB
 for qemu-riscv@nongnu.org; Sat, 16 Oct 2021 13:59:07 -0400
Received: by mail-pf1-x42d.google.com with SMTP id f11so7357882pfc.12
 for <qemu-riscv@nongnu.org>; Sat, 16 Oct 2021 10:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l7qs+A1Pq4TD8K3u+O3HYRW1+gL4xGrgU6xC091a6Ok=;
 b=RAl9bPR/bpTz6lBcJv+9InLkLMrjYGDSqkYcinMPg9ohiGb8GJybbrhnaf7yZU19nj
 EnaxJBOOfqDyzLPkjH824bMcRI1jqlIFAHIk1ab6Xp2AlNoKYtN0neBw3KyJjOZrDcSh
 q32EYDTDK8kREWcjCdbZakVxdU7PMDC5BFI3Z3RLybchBr5ZQgVI3rXHSU0G57Uclt/r
 6cPWkHzThi1yoaFl6KqR89X25uOgx4KuaY2J6UoScwwJR7zw0rk9li/dPRAj5hI1c9jK
 cHuv+N82YjiGzbO0V8IBDs7GBn61v20wZXZPV+H8n3AhDnhrtfUYLJHTMsOPY0s4k7bk
 dmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l7qs+A1Pq4TD8K3u+O3HYRW1+gL4xGrgU6xC091a6Ok=;
 b=zuXOVqykbyYkC7dYPOH06Oc0JOa1LFXZ0hqQVU3/HTwoMy1fO/sgKGTf8pi/bPHi+q
 Xrvd1e4FVR8Z9SdlSp2hKDCZbiVRIJrjC0p2FI9auWkpgh6iCR9vDUb3kf0bTo6ZPaqh
 3t1GRYr0Uw9fzV6dV2jbR4yi9L+4Fz2Ah1F29bo0iYzbH/1umet0YNeHV+2/8Z8EEIwJ
 uxgYBz/Tqy18z6cnEqlfhr6amx4vCApjSiB/a+UVBMRU8ww7YbVXipvpzhUS6EyDxZ4a
 I2kmAZITDziUCQfqZITv6wdG7vpnN3Xva94zns3jtbn3squdT5Jp423q5+4a1yqm5yOx
 OAXQ==
X-Gm-Message-State: AOAM531+F1//3VvFWm7OyGXq19Otr/3TBd3wC1Up96hNnu25RMIoqviA
 ZQJDas6qwrPV+5QqeTXvAb2dMA==
X-Google-Smtp-Source: ABdhPJwcN2fqbhXxPN1hgvkgzX8a0M27jjnKysAbuJC5jTfo/ID7xAvQg9yNBibo3reRVBnD/VNXQA==
X-Received: by 2002:a63:dc03:: with SMTP id s3mr14771852pgg.88.1634407144824; 
 Sat, 16 Oct 2021 10:59:04 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id a30sm8433146pfr.64.2021.10.16.10.59.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Oct 2021 10:59:04 -0700 (PDT)
Subject: Re: [PATCH v4 1/2] softfloat: add APIs to handle alternative sNaN
 propagation for fmax/fmin
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Chih-Min Chao <chihmin.chao@sifive.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211016085428.3001501-1-frank.chang@sifive.com>
 <20211016085428.3001501-2-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9dd37c01-835b-536a-c0ba-3ef23bbbfa42@linaro.org>
Date: Sat, 16 Oct 2021 10:59:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211016085428.3001501-2-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 16 Oct 2021 17:59:08 -0000

On 10/16/21 1:54 AM, frank.chang@sifive.com wrote:
> From: Chih-Min Chao<chihmin.chao@sifive.com>
> 
> For "fmax/fmin ft0, ft1, ft2" and if one of the inputs is sNaN,
> 
>    The original logic:
>      Return NaN and set invalid flag if ft1 == sNaN || ft2 == sNan.
> 
>    The alternative path:
>      Set invalid flag if ft1 == sNaN || ft2 == sNaN.
>      Return NaN only if ft1 == NaN && ft2 == NaN.
> 
> The IEEE 754 spec allows both implementation and some architecture such
> as riscv choose different defintions in two spec versions.
> (riscv-spec-v2.2 use original version, riscv-spec-20191213 changes to
>   alternative)
> 
> Signed-off-by: Chih-Min Chao<chihmin.chao@sifive.com>
> Signed-off-by: Frank Chang<frank.chang@sifive.com>
> ---
>   fpu/softfloat-parts.c.inc | 25 +++++++++++++++++++++++--
>   fpu/softfloat.c           | 19 +++++++++++++------
>   include/fpu/softfloat.h   | 10 ++++++++++
>   3 files changed, 46 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

