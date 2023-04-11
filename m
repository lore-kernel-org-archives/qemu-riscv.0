Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmCpK-000544-Kc
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 08:10:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCpC-0004xP-Gq
 for qemu-riscv@nongnu.org; Tue, 11 Apr 2023 08:10:15 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCp9-0004ek-W9
 for qemu-riscv@nongnu.org; Tue, 11 Apr 2023 08:10:14 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 d8-20020a05600c3ac800b003ee6e324b19so4145806wms.1
 for <qemu-riscv@nongnu.org>; Tue, 11 Apr 2023 05:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681215010;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w1XHuh5xZjAulucojrLDeQkJz98dHz+Fb7pdpqIQu3c=;
 b=X2aHfuFUQ3OHRp9J+pvvAEvoCeyOpNz48t9+ifhDaUwnCMbPs0tTQPnfQiw+a5vV4X
 8xlhczb4sCpPH7VVMjpf8dkGfvXrbbOJnFqk7vc+9F8ExEUDtEp1KWKNTf2gsPBbp/vU
 OsjqkacQgNLZ2Am7vPekislvDTXkZXo9XZvX66xm72YH2x31xHdqsW4OViE5q8g+UYI+
 xkIJctn5FpPWYiC4PuPvjfLKw5ddBoRHXwB1/g5AVgL+QnwAthyi6Aj6+LdFPBajEraE
 OuoNpqTF4NxsTEsC/k8msnKLI6UzB4yLQqwWzMMdwOfLJIAyeXeQ1ZskwFAw1dQpkRbs
 OOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681215010;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w1XHuh5xZjAulucojrLDeQkJz98dHz+Fb7pdpqIQu3c=;
 b=qOOvtYN7vi87ZwAhbrYfQAzZZKoyWhQkAC6O47Gd0G3NRLIJ1fgDITicdru+f/vg7L
 nzFVrFg3k5MWB3ZkR9piKktyGlWLynOPhPhChsWtEaqTxYPg7dieO3C0flUI4fNjITUt
 TPCO8/HpSziJP+L6sgEyhQcwNEYce5QRGS79pgsB+kWr0aZRgKKO0Ms/C472IfMNnaZx
 u1TJ8Z5/xycxkNSqWH1pWwZ3cgHetLB5cTnmXJ0Kk9Yngo7KDbHL/8VjMQJuzgMNrdzv
 5H7+3AZyRw0tzMKA6uz6f9laTKLJ0TAgNPPzsFtvmKIJzXjZsOyPWR8fbGCZhaIgYkmi
 RA9w==
X-Gm-Message-State: AAQBX9eQxHlSf8f+qrKdicavJ2NK6GA6vEqXMPIkZ/I02nmrUOI87Ijj
 8b7/fXEJd/cP3qtXIA3famIJGQ==
X-Google-Smtp-Source: AKy350ZqXuVmeGzz3rVoYXlx3DPmZvDMn2pQRB7GAnvo59zjw353ixXcOvVgnjnOOxt+zRCM6AKMkQ==
X-Received: by 2002:a05:600c:299:b0:3ed:5d41:f998 with SMTP id
 25-20020a05600c029900b003ed5d41f998mr10262284wmk.15.1681215010419; 
 Tue, 11 Apr 2023 05:10:10 -0700 (PDT)
Received: from [192.168.1.101] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c4fd300b003ef7058ea02sm20860047wmq.29.2023.04.11.05.10.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 05:10:10 -0700 (PDT)
Message-ID: <9f598a28-da4b-14bb-c908-1f9a2861732a@linaro.org>
Date: Tue, 11 Apr 2023 14:10:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 19/42] tcg: Clear TCGLabelQemuLdst on allocation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 12:10:15 -0000

On 8/4/23 04:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg-ldst.c.inc | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


