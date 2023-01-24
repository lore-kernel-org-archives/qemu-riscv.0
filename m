Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKSxs-0006fj-Lb
	for mharc-qemu-riscv@gnu.org; Tue, 24 Jan 2023 18:44:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKSxr-0006el-1H
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 18:44:31 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKSxo-0003Ps-5X
 for qemu-riscv@nongnu.org; Tue, 24 Jan 2023 18:44:30 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bk16so15431326wrb.11
 for <qemu-riscv@nongnu.org>; Tue, 24 Jan 2023 15:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QQaPZ89/dEGk8+jZrS4JjtCYwRVbqNLIeykBX3O51K8=;
 b=RUu1VPf4E1kgQXcemkfBYdNuJPB0p2OQdXgyP9u24UEsRqByLirhIUEf3/P/2BS2c+
 a2jBOvEZzQCKGsDmcSDXnXdxVqjC7s0I7c2+i7qqUlu6uRJlZgBGHZFoxmK/N+R4Mlu1
 wG2UYT2CMlbq0te/HLgdKrv+IyVarJKkCfonh2LJFwKqk1xOr28c00GqVws4OGydl6tt
 wGunJb0CBG/9KB88luRhQf8ZlPnyXRTFEDl9CtTgGZWi/2OoeBdfkN77BQSn3bDCdoqi
 uaCeqLyKaTEYKhnOVrRMTBgH2aiKa+kdD66IQ62GkZpJmxgrbUZk8FJmZuifQOIT/0oR
 UTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QQaPZ89/dEGk8+jZrS4JjtCYwRVbqNLIeykBX3O51K8=;
 b=5F+wrfZWVvYlkHpkXeTfCnlO1mQQ12ck4og0dHg9PLNKJGhZiG2GKYHFHopyPR2sq+
 cmVNK5er9YcjeWvwb5dRvYNvTQWkm1Sf8zlu3XzS6BGKhsPokFR1YRFQmCWUSz3AxiNo
 PprCBc6X/fo1kfMnJn0J63B+TpD4FiEgQxB9ctKOtHQFRAAL+YWu7Ytc09wxe2rgBbH6
 FH4YnCJy0E8Qc8S1ue3n/5FNCgUShJNxYJHSxcjjKJD16Ltu2t2hRz+quvW0ksjzdxvh
 Wy+5yshqli2OoI6wkiVPVSXRwEjYC4eGR+a5RsPP1Yu/GO3br60Ohn0+asWqe6XUpU6+
 4zlQ==
X-Gm-Message-State: AFqh2kphuxBONcDB5ZoWucuhJVUMSx+WUIeyYM4olMnehxiksoS34v0U
 0i0PUbOAB3CRAFrPtZr+tOenjg==
X-Google-Smtp-Source: AMrXdXskc+wkPHXDYTP+przZCcrrttDDIsjtSV0ZWQHXcvuBXjp+q2C8SirlLlCaxb8XcOSfrfmG+A==
X-Received: by 2002:a05:6000:a03:b0:2b9:9e7b:be6b with SMTP id
 co3-20020a0560000a0300b002b99e7bbe6bmr28455429wrb.45.1674603866538; 
 Tue, 24 Jan 2023 15:44:26 -0800 (PST)
Received: from [192.168.0.114] ([196.89.153.183])
 by smtp.gmail.com with ESMTPSA id
 q3-20020adff943000000b002bfae43109fsm2793612wrr.93.2023.01.24.15.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 15:44:26 -0800 (PST)
Message-ID: <4add4fd6-3996-8e5a-e75d-3eb262a251ed@linaro.org>
Date: Wed, 25 Jan 2023 00:44:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 01/36] tcg: Define TCG_TYPE_I128 and related helper
 macros
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-2-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230108023719.2466341-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-List-Received-Date: Tue, 24 Jan 2023 23:44:31 -0000

On 8/1/23 03:36, Richard Henderson wrote:
> Begin staging in support for TCGv_i128 with Int128.
> Define the type enumerator, the typedef, and the
> helper-head.h macros.
> 
> This cannot yet be used, because you can't allocate
> temporaries of this new type.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/helper-head.h |  7 +++++++
>   include/tcg/tcg.h          | 17 ++++++++++-------
>   2 files changed, 17 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


