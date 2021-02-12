Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lAdYJ-0004MD-1i
	for mharc-qemu-riscv@gnu.org; Fri, 12 Feb 2021 13:52:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdYH-0004Hm-9e
 for qemu-riscv@nongnu.org; Fri, 12 Feb 2021 13:52:25 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:37636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdYF-0000XB-Ep
 for qemu-riscv@nongnu.org; Fri, 12 Feb 2021 13:52:24 -0500
Received: by mail-pj1-x1029.google.com with SMTP id t2so161403pjq.2
 for <qemu-riscv@nongnu.org>; Fri, 12 Feb 2021 10:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RZzuJu1U9J6mjLUYoNi2FyaSbdyzsWsgUTsQma2lLDQ=;
 b=Xx4OsZeommcMwI4huQ86Y8Ag0KBxtpOwQsUzbiSNfy8mciphhzAbACrG2WCWAaPUo7
 ZpHTw1f8U9Lwaj5R9AMsFHL2VA72q0Pzo6rm4EQZkJKI4kZhf3lMLT3VMmWwfBGETnUJ
 3NCqZGAPwtqlXg0lgtvASZvpVg5jCkmxQUVZ3hJD62pGKQWriQ9H1UsbfHP5oQAJaI+s
 DMJm8MXAJEcOSmzSmGsuH4BoLF1XN4eYlN6kQKS7QszF+42xInjarNO58fvv278yI/hc
 sxDNZyBM3xA/M4RqJVMvGyxU80VDcAmBq0bEwcCoYhg6Y/hB6t37DjLfF+UrV1JZOeRL
 YlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RZzuJu1U9J6mjLUYoNi2FyaSbdyzsWsgUTsQma2lLDQ=;
 b=MJ9deMuoXTtih/A5UKCPlNsgiEWvMQSS0ZgGWCcvivQv6MRciwPvFP6Xcd622RrJ04
 yBHTpkVfdk6z21ErNKp5NqmmRip6M8AhnDTuYcC+YmSP5+7VvXQgiyxJmneVtCfgGRBw
 vwJlb/OfZu3cRqRajM7M13UOCCf7b2pESKFc/UNeYCquNk7fkuW/C/a6F+EkNtexXlnl
 bYBfa/6f1d3Vi6hk+mQW5esTcx5bApUqdifFDO396btnR0Pq+FHGLv1xX1FbZ4IjjqkR
 8zSDtqIGVZF0BryOsVSxCxFXJzdM4pvR5ab6pS0cH6o0zfznbHgJ0rgQusCAKWZBz0RS
 fHEA==
X-Gm-Message-State: AOAM530oahiL0Oq3gGC0hIaAUhAcGhyYLo7K7f8z6cgaMxBoa/o4D3eR
 Y3C/c2z2I/LursdgxVawslXb8A==
X-Google-Smtp-Source: ABdhPJzUB3/gdL8ycCzdZYMIJRhvI3WfppFaEAFBKm5JywWkAOIZFQYImggvr8QmMMcHewM6fkuOCA==
X-Received: by 2002:a17:90a:b883:: with SMTP id
 o3mr2993303pjr.95.1613155941772; 
 Fri, 12 Feb 2021 10:52:21 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 k5sm9431958pfi.31.2021.02.12.10.52.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 10:52:21 -0800 (PST)
Subject: Re: [PATCH 03/38] target/riscv: Fixup saturate subtract function
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair23@gmail.com, palmer@dabbelt.com
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
 <20210212150256.885-4-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b201c2fd-d8f4-1863-e53c-cabecfd3630f@linaro.org>
Date: Fri, 12 Feb 2021 10:52:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210212150256.885-4-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.119,
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
X-List-Received-Date: Fri, 12 Feb 2021 18:52:25 -0000

On 2/12/21 7:02 AM, LIU Zhiwei wrote:
> The overflow predication ((a - b) ^ a) & (a ^ b) & INT64_MIN is right.
> However, when the predication is ture and a is 0, it should return maximum.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/vector_helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

