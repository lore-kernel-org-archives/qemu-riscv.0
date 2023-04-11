Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmCrd-00077d-6t
	for mharc-qemu-riscv@gnu.org; Tue, 11 Apr 2023 08:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCrc-00076g-6F
 for qemu-riscv@nongnu.org; Tue, 11 Apr 2023 08:12:44 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCrZ-0005Df-GF
 for qemu-riscv@nongnu.org; Tue, 11 Apr 2023 08:12:43 -0400
Received: by mail-wr1-x429.google.com with SMTP id l18so7260710wrb.9
 for <qemu-riscv@nongnu.org>; Tue, 11 Apr 2023 05:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681215160;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+cxhpb+UikGO1S22GDLyqOj32eLMPRhG05nHMYC1JjY=;
 b=MQ78yZAr665nGo65s/ydx/rAgdiPIEasC2euasINhTnkeN/gveLHdt1YKUy6iyj1Nn
 qZolMOF9o6aoxfSXWasjOnKVkZJmXXRww/PNQLzm1avEKiFGWU/H96uBBqGqykWuLLmD
 ooAZe2UkrPSTi8Dus9bG/FjE3hd4HHuoaSGeZQy4nnpbYSIcL9XmqWjIUFOXwcoaVP76
 Gk64fmfJiiGZba1ZXYNjw5MPuoIc577/8L6NB2vflsyqhpKEE4VdO4Jnd462Zz9OBAHP
 h/enno2UPOWg/y3OT0PVUQGyDpNBXTSDXauIWKwhP1VD+CUz54QtRp2iVly/8aWDWwvE
 CFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681215160;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+cxhpb+UikGO1S22GDLyqOj32eLMPRhG05nHMYC1JjY=;
 b=AM+PLwAAHYZAROZzC0B7yF/alIhshjLefxQKwJihV7YbG/KiKn11NqSPOLfAw7hyEh
 O50mmX5g5LvL0uQFkaric0gLohPSQ5xv/og/qlqviPXJnfNFXG4l5nZB+wj21vKkifc4
 aToGUU9DNxYGm1T3RmYoAelHDm0H1+hNBSlpE2TA2XRyuglSGec5HNvQdYF3XZhM2V1r
 8E7UkdE30OZq2kRsgFJiqtkcIk/3sofVOLvstuePMwvaqrogliBkJqQrxEQ0AISXmxtn
 PoALbz6q33OTyiI+iUjxJvWCwkDXCxs3Uc9+LNjFkb4mj1/gnZbMpf/dKnCtoBkEmnBX
 +OSg==
X-Gm-Message-State: AAQBX9dQ1hHlqtoylozY1UEsOMD6G4iXdDGLhzEWpGhM2xHYaYpkhHE4
 ylVv1g/p6BD7a/dOoPlSRQOh9g==
X-Google-Smtp-Source: AKy350aQsXX9jfZvcoAkzs/PibkXOiLtamG4E8Ab4zeJS2352I9elD8HOltSOGsnu6cXCIeFUjKYgQ==
X-Received: by 2002:a5d:5967:0:b0:2d4:5301:fac0 with SMTP id
 e39-20020a5d5967000000b002d45301fac0mr9150593wri.15.1681215159831; 
 Tue, 11 Apr 2023 05:12:39 -0700 (PDT)
Received: from [192.168.1.101] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 u5-20020adff885000000b002c70851fdd8sm14448619wrp.75.2023.04.11.05.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 05:12:39 -0700 (PDT)
Message-ID: <24065205-6919-378f-8e97-4754befd49f4@linaro.org>
Date: Tue, 11 Apr 2023 14:12:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 20/42] tcg/i386: Use TCGType not bool is_64 in
 tcg_out_qemu_{ld, st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
X-List-Received-Date: Tue, 11 Apr 2023 12:12:44 -0000

On 8/4/23 04:42, Richard Henderson wrote:
> There are several places where we already convert back from
> bool to type.  Clean things up by using type throughout.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/i386/tcg-target.c.inc | 35 +++++++++++++++++------------------
>   1 file changed, 17 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


