Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prOkQ-00043u-EB
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOkN-00042T-Gu
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:54:43 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOkL-0002Kz-K0
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:54:43 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f19c473b9eso95288375e9.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682452479; x=1685044479;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Twrs3JJMsbClXutVpqw3Ckm8hqSgZ2PpEoQJuu2lhfk=;
 b=kD8v0bbrPJTOw6zDlm/HoUZXNT0AJvvsr50iOe2qX5Q/I8p+LW02vZOTUJLW2Q0TC1
 WttgqZZHlVEA9MOZ3ppzfXPay5ZKmvMDS4VjvzR6MIhu+IkDY1RnESgLzSlbobw7M4K9
 PyUB3rhXw3EAB86BZInYcxeJ2ldEJX35yQNm63FLKygd3flDZCoIByxbPgpao8OV3/iw
 V9nL4Z2/p6ZITyBa28mRLOg4TfXhKRePfeYAl74bpNNHnwtmeGToQ8VOukY23GDdZf/2
 PrqmQoPhIdFBrgnW1qzpFb2HQnGYukagbjEpu6elJwBR8qLwWHvAlTvcAnyVcr+a335x
 SBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682452479; x=1685044479;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Twrs3JJMsbClXutVpqw3Ckm8hqSgZ2PpEoQJuu2lhfk=;
 b=j13ACpLR5j1O1Z10ic0lUwDoDI8mGo3X14UUOgolqWRcIlhgqhlJT2SmKOGJkvzLoa
 Gu4vH2RENGGxJKQu0rYq21dh52VdW6Xx0f+EHSsm46D/qT73tSUkQXRD7S/mEVQU+/ZQ
 NfNpKKFmGojAGHzoUBbhFLJSTQUqOJffmF8YfjcCkvEYCIM/p1qCzOz+MQyaHl9vITqH
 rAwe68FDVE8hLyIK2etAWQEP+RdEDU8WZDaaUIb9CakIdnYtv/DUBx886kvBqwWbN5Kj
 vtpUHqsJTNslKEiCbfkinHuVMttCrI1ycZgC8WO2KTeQUPAA/GA7Diu6EAyJUlx/bJYm
 3zHg==
X-Gm-Message-State: AC+VfDz2APJB3JXmitEDTXmjhjhK5UdzRZqU+M7alBeh52QWF/Iv/TDy
 yQIM3eLP/oGd/p214Ived2fpUQ==
X-Google-Smtp-Source: ACHHUZ4M9S9wTRDgc3V/F7JT6AKb549by7FOhonKwJM/vXiBNrv+Y/XOi5jkEVOyZ49cD8Yafpmd2w==
X-Received: by 2002:adf:f2d1:0:b0:2cf:efa5:5322 with SMTP id
 d17-20020adff2d1000000b002cfefa55322mr34012wrp.14.1682452479045; 
 Tue, 25 Apr 2023 12:54:39 -0700 (PDT)
Received: from [192.168.180.175] (153.red-88-29-176.dynamicip.rima-tde.net.
 [88.29.176.153]) by smtp.gmail.com with ESMTPSA id
 c10-20020a7bc2aa000000b003f080b2f9f4sm19069147wmk.27.2023.04.25.12.54.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 12:54:38 -0700 (PDT)
Message-ID: <d58a9776-d64c-3221-4296-c28f3991813b@linaro.org>
Date: Tue, 25 Apr 2023 20:54:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 07/57] tcg/i386: Introduce HostAddress
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424054105.1579315-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 25 Apr 2023 19:54:44 -0000

On 24/4/23 07:40, Richard Henderson wrote:
> Collect the 4 potential parts of the host address into a struct.
> Reorg tcg_out_qemu_{ld,st}_direct to use it.
> Reorg guest_base handling to use it.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/i386/tcg-target.c.inc | 165 +++++++++++++++++++++-----------------
>   1 file changed, 90 insertions(+), 75 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


