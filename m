Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWWSX-00048k-WF
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 00:54:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWSV-00042W-W9
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:54:00 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWSS-000130-W6
 for qemu-riscv@nongnu.org; Mon, 27 Feb 2023 00:53:59 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so8973635pjh.0
 for <qemu-riscv@nongnu.org>; Sun, 26 Feb 2023 21:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WoawLEov3xoeeg9kToNn0OU1Xeq/+/MiyUu4bS2iotU=;
 b=SBr+t/MALQZ9qnmufvObgWPOsubZRVYbs55S8BhRjxJPUXj2JXghvMa0RfEX2WhLeD
 dEwapMF24ICG+D83wvrNu9uFqzvOeoSb/+QxGdFrPW0galCcScKlQEDS2ZcAayRBuqBT
 D10CZv8lfoOiNnI6FurP+zFKlY+dEkpDa3YVLtT5zctA3pJhcyvR/mu87hEaNDTQqfPP
 jpYD9r1oTx5T0M/Zh3dJOKkwHOwaNpgV7NnTZFucPGwFun5Vr/Lng/0iYnWOp0y1Yjxx
 lKDecEs6ClW7gDeTks9goLA26ivXtvrcx/21Dk7e1u0yf1Hi17A+neYRDdk6BHqI4y3o
 xdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WoawLEov3xoeeg9kToNn0OU1Xeq/+/MiyUu4bS2iotU=;
 b=kUMWrodpSRF9QQigG34QpRWLuBTdPGzDh0S3rhzpkuPNFqAFOZY2KwOIOp6oyS+P7D
 qQiyGfCL6x+P3EPMV4+H8u4q1hBAcgwR+UVXNMqhHT9IYB/N4VQ9TVR9GDbYeqffZ8F3
 rpsf0Vr91FCXMuoptY/UgF96vyX4B6WEScdsf8b17AG2N+PtQPqvOJ1TWb4KKxEJXjOx
 B1zRW9Zevd9G9dfgHxkdkUHEU3NkSLNeDsf4QoepsLt341lp7KM0jH0lCvYogW9prCVb
 SoKm38natg9SpJlCTk8PxobltvHdRD6xOrfcOXZYdzT+1KVNQKRrl5FOMoOzrCGyiRiH
 IT2g==
X-Gm-Message-State: AO0yUKXLWhrrgMHvGgbhKUDRJp9Bt9Wo2+O65xaDo37ciFsrjAcuSzBt
 ZW4LtEdpCXeclzOTjdHm8cTD3w==
X-Google-Smtp-Source: AK7set9CnWO/YrhRWzjKat4AzWTwb6/AbkZwxOXnCkrBCGbhDX1ExGH2t+61EExLTdqqqERzu0IWEw==
X-Received: by 2002:a05:6a20:440e:b0:cd:1e80:587d with SMTP id
 ce14-20020a056a20440e00b000cd1e80587dmr4665175pzb.23.1677477235401; 
 Sun, 26 Feb 2023 21:53:55 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 f23-20020aa782d7000000b005dea362ed18sm3392389pfn.27.2023.02.26.21.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 21:53:54 -0800 (PST)
Message-ID: <10161680-21d9-3ac0-aa02-d62cab63cc20@linaro.org>
Date: Sun, 26 Feb 2023 19:53:50 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 58/70] target/tricore: Use min/max for saturate
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-59-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20230227054233.390271-59-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 27 Feb 2023 05:54:00 -0000

On 2/26/23 19:42, Richard Henderson wrote:
>   static void gen_saturate_u(TCGv ret, TCGv arg, int32_t up)
>   {
> -    TCGv temp = tcg_const_i32(up);
> -    /* sat_neg = (arg > up ) ? up : arg; */
> -    tcg_gen_movcond_tl(TCG_COND_GTU, ret, arg, temp, temp, arg);
> +    tcg_gen_umin_tl(ret, ret, tcg_constant_i32(up));

Second argument must be 'arg'.


r~


