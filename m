Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prJqk-0004Q3-8l
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 10:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prJqj-0004PW-1a
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 10:40:57 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prJqg-00007T-7f
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 10:40:56 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f1950f569eso30224005e9.2
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 07:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682433652; x=1685025652;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EhxqKnVC9K2XzjU+N8GzrUzeVSMhs3WmZYLQaANdl/w=;
 b=drsgBbOCUDEb3EpC43r1JqOADOsKrmlQYh/rj4hVPnSqwRUT+l3A7AjqntvfgJj75Y
 mSHSFCllfD4RAC5wbGQXCJb1+6ODY16Y9BLFPL4/novNcqDo6DtlMCwVtAYzlPlq/VZ4
 1j7bC6L7KsbcmuSK1K0f8+QF4hCS1dzJjYqgKK7nKXmECtPPDxuoV8FIvdFpYRqeY0jt
 53vQB9Fr6mvbVNDCGgxtDA1cFfLAyaCymTb2dHhp6q2Fxst9lxY0W7ktfOXZ5MBjbIoZ
 ykSwHyvfzIi3Detmnalz3WllwEJxtD9F2zjaexxlYwdrgvLDOZwaBZirb4hqDf0PaqPG
 /cuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682433652; x=1685025652;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EhxqKnVC9K2XzjU+N8GzrUzeVSMhs3WmZYLQaANdl/w=;
 b=Wr9w9zhR6e2ZnDYYfzcAic+d9eUjGIa3Gngv7BBGjehomV1smjvpsT3RzdVmiZMO/a
 Ov3ljx/+KX7Bvcxdj9ydrivo9lP+aZIVQ2PzHFxAKFg9Qns4rl7JCAgxrQLZMucCc9Sd
 vef+tUt3eH//b36CXDMnTU+BUJ/Hb8TrIMgYilzZ8OWDeQRo4tkHbC9CRl5oOCEwcdu+
 Kp+sjlvC+gFv7WCZlcjfRR4EeAzGdr9LkW9eQO7vdJqdMYuoIAo5vPM5mtJALCqrM8Yd
 1rfH7ueyrcp6Z/ioX1qVzmraGVSJPlo3BzRdYC0f0IAz8x55Q5XAvqoLRO3lX+NuXc8n
 Bgqw==
X-Gm-Message-State: AAQBX9d684b2oxNTDipkPfixAYksXogSFnfGX5etpM024wLA5zeGOEPi
 pk6D0Bb+z+kcPowTp0R377cWuw==
X-Google-Smtp-Source: AKy350ZmZzh61rduK/2J9Lw5TicjUPPhk2Y5ZePRLGcqMBNv74zgsh6Nw2nVFUSzahy0OtUAc0yITQ==
X-Received: by 2002:a05:600c:24cd:b0:3f1:6ef6:c9d0 with SMTP id
 13-20020a05600c24cd00b003f16ef6c9d0mr9514711wmu.17.1682433652545; 
 Tue, 25 Apr 2023 07:40:52 -0700 (PDT)
Received: from [172.27.248.56] ([212.187.182.164])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003f191c9c4b0sm12051997wmc.11.2023.04.25.07.40.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 07:40:52 -0700 (PDT)
Message-ID: <4986ffc9-a350-f828-78ef-b2f54f9e01f9@linaro.org>
Date: Tue, 25 Apr 2023 15:40:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 30/57] tcg/s390x: Introduce HostAddress
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-31-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424054105.1579315-31-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-List-Received-Date: Tue, 25 Apr 2023 14:40:57 -0000

On 24/4/23 07:40, Richard Henderson wrote:
> Collect the 3 potential parts of the host address into a struct.
> Reorg tcg_out_qemu_{ld,st}_direct to use it.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/s390x/tcg-target.c.inc | 109 ++++++++++++++++++++-----------------
>   1 file changed, 60 insertions(+), 49 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


