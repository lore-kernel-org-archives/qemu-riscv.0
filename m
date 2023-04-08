Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pl09J-0001yM-87
	for mharc-qemu-riscv@gnu.org; Sat, 08 Apr 2023 00:26:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl09C-0001q7-2g
 for qemu-riscv@nongnu.org; Sat, 08 Apr 2023 00:25:55 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pl098-0006Sf-5Z
 for qemu-riscv@nongnu.org; Sat, 08 Apr 2023 00:25:52 -0400
Received: by mail-pl1-x631.google.com with SMTP id ji2so1868708plb.0
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 21:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680927949;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PXCwDtr2uHzOCiDI6gx9ciDRk0+XSVPCl10fYBMrOZU=;
 b=ajc5KDjyqXmm3NUhwaTQfNt74Vh03C8A4QjJBsHhqpatOEHjIwrsnnsJeIV1mR4Q//
 IH0YOeZ/wRmreO2AyYzmeyJuhK4a6Ljm4vkvshnwFkSu++QDSSNkcr1mYou8eymOKNTK
 w786J7PWGGOOgTqhO2r20p26oOpmjkka4g434lWGOkcRHf0lWcSAZ4Ucf+lH5lPKTUC1
 6/h8tPD5w6rtPylQwXgYWq8OwBkeRZWmcZK8oSylz77qxoRqauLmZnakWNVN//mmkUBs
 PgAZXndCQqApDyeml0rj84fIz0mO/XpJ+yqvRosXHibT0pibUfgwKQSPUhd4KFp4CWUG
 uqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680927949;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PXCwDtr2uHzOCiDI6gx9ciDRk0+XSVPCl10fYBMrOZU=;
 b=R+M8AGd7pIUG1q6fPdCHtLeip18QHuXwOEceZ/RYB+s/fe4NzzUsyetMb8hAv1hQUi
 n4VJQzbBr4aTkG1/bGHvewCFV02A0AzLYs/F4aU+l4p5u0bj2U2C8NFaolE3YCI2Uzo1
 pvjru8F0rmpBs2e9qmaCI3evnW/PLGbb8MCfd9GOp0RkZOSSZphrEAv1wWCYR70OTno0
 LlazXnpkW3nikOUQQpwOdfB/05x0BP/9goyJN6ptkaQiDFnzggWmEnL2qvZdmFkx7vEe
 EuNy7lGZav1ki4zuhIJVuu4uZOkH/2EkfjHfffD2t7RKWDIZr7g8L8htz7uRqLTGcRY8
 JbIw==
X-Gm-Message-State: AAQBX9fTIBtfXH91ujbzPsPLDdW9HprbCfyJLaasH76rUOkOT7zVcnnD
 9+z/BdC4sigHJ5GRFW8ZO4xDdw==
X-Google-Smtp-Source: AKy350bDO0xahEhFC+PBYeLvGOB3qgL/GrI8UhnYhnHZrwNfuMLU6DzeTNpPUrbd5lsuyvBPxO8WQQ==
X-Received: by 2002:a17:903:2452:b0:19d:1fce:c9ec with SMTP id
 l18-20020a170903245200b0019d1fcec9ecmr6359202pls.37.1680927948795; 
 Fri, 07 Apr 2023 21:25:48 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a170902b59200b0019f1264c7d7sm3631549pls.103.2023.04.07.21.25.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 21:25:48 -0700 (PDT)
Message-ID: <c7be234f-331f-0dfe-3fd4-04896c094680@linaro.org>
Date: Fri, 7 Apr 2023 21:25:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 07/10] target/arm: Restrict KVM-specific fields from
 ArchCPU
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405160454.97436-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.03,
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
X-List-Received-Date: Sat, 08 Apr 2023 04:25:57 -0000

On 4/5/23 09:04, Philippe Mathieu-Daudé wrote:
> These fields shouldn't be accessed when KVM is not available.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/cpu.h | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

