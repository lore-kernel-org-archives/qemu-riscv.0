Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ltYkE-0004zo-Ug
	for mharc-qemu-riscv@gnu.org; Wed, 16 Jun 2021 12:50:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYkA-0004v9-6q; Wed, 16 Jun 2021 12:50:22 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:34656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYk7-0003MT-Ks; Wed, 16 Jun 2021 12:50:21 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso3532080wmc.1; 
 Wed, 16 Jun 2021 09:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DvH+cXjA3m55CQLql8Rhm8nZdzWIDbYaIwl2Wc0exj0=;
 b=nZK0oWrD5D4ZgZdCwddd5KNb9On/GRtXulffxDQe42L7mfD+8kOHwTj0fjrGtfXKWb
 O1/mGqtCnftQHiPy5cS4p8AHdqlmQNjhs9XigvNDTsnN6TtFuMB/KLZhzNb1qKkdSxMB
 q9bwapRdWOlw4BoHOLOV0anCnSRs+V5goi2LCnWfzZxnb52JMLQFR+DXIoka3AKHVYdQ
 I3dQX6WjS9xk0QdG0Aqzhr6tDG1EqepjrnI6oLXhptG0xAjBP/8NIjhy751bpBtQqt2h
 Hu6kD2cayWtqwHgRB9M8b6sqbeV5E8GeGDJMsICpDW5o8kI7b4UxlMju+YjkMEKKL/yH
 Orsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DvH+cXjA3m55CQLql8Rhm8nZdzWIDbYaIwl2Wc0exj0=;
 b=FE2WruKMmbNHIBTOK9j2Kr6DP9pYRiKPtmd7Ejvcfcf2ieRD3bxGXludHhV5dU+BZs
 eCux8Pzg/KZTstgffFbq7auUw3v50E28jcXU9bUF6LMt8mUTuyXibRrhSrETIzHq9Va3
 hwipeea5+QYaawNzHiTyHxAdBwn+Xy3mF0VuiP8E2Xj86tzluua+BpRdFw1F87v+MU7R
 tOc4HZCMMJin4/B4NFCh1oTF3sO4Q5jLsvnwDw+zE9KZm0XrcIAfwG8h0WuYCrE6ta47
 EdkDiOvaOgINfuVFBcyMjpyi7L1LqAwnGAgCof5pypMZFiWq/9+5ZKRAJJzpEutE0Pp5
 0Vcw==
X-Gm-Message-State: AOAM533tYYPnrMVwgqnqaZmg6gF9glJgLS+9+nsimymmjqkcP94nvoCA
 gKcDhQz2tI4UHyFV5SCerjM=
X-Google-Smtp-Source: ABdhPJz8UTBk5pBrc/eoji3NEUOKtCEir/aXQMDcqYE0ZLXhFHBA7PVOQATU/O26eKZDj04jISSY7g==
X-Received: by 2002:a1c:f70b:: with SMTP id v11mr910021wmh.186.1623862217088; 
 Wed, 16 Jun 2021 09:50:17 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n42sm5441469wms.29.2021.06.16.09.50.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 09:50:16 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 16/21] linux-user/riscv: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alex.bennee@linaro.org, laurent@vivier.eu
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
 <20210616011209.1446045-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9d712d66-ad8d-e08c-e793-dbb06264e19a@amsat.org>
Date: Wed, 16 Jun 2021 18:50:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210616011209.1446045-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 16 Jun 2021 16:50:22 -0000

On 6/16/21 3:12 AM, Richard Henderson wrote:
> Create and record the rt signal trampoline.
> 
> This fixes a bug wrt libgcc fallback unwinding.  It expects
> the stack pointer to point to the siginfo_t, whereas we had
> inexplicably placed our private signal trampoline at the start
> of the signal frame instead of the end.  Now moot because we
> have removed it from the stack frame entirely.
> 
> Cc: qemu-riscv@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/riscv/target_signal.h |  2 ++
>  linux-user/riscv/signal.c        | 22 +++++++++++++---------
>  2 files changed, 15 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

