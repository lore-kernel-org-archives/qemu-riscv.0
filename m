Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkwZZ-0008RO-LX
	for mharc-qemu-riscv@gnu.org; Fri, 07 Apr 2023 20:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkwZX-0008Ph-LK
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 20:36:51 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkwZV-0005qv-9C
 for qemu-riscv@nongnu.org; Fri, 07 Apr 2023 20:36:51 -0400
Received: by mail-pl1-x633.google.com with SMTP id kx12so2334684plb.12
 for <qemu-riscv@nongnu.org>; Fri, 07 Apr 2023 17:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680914205;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pToGA7FV0Kiuzd13D8HdwPAx2mWDhQqvcrmIS2Cnr7I=;
 b=NTkB0j9lk3kv7Vr/kgHBVZYw4BNYJx3chmF+8X9rG0YK1V5srco7gsi2d7gbEC7tu0
 8pqFA+IZGlpP1ssRQC5vU0ql7nVO+DBZPq4aRNxko+WIRV4NHqKnwLn6xyqVNuOx8dYl
 tHsz9KE0ZRd7uWCuj4Zkf2x8T1HAKDO7AnQ62nX+967KKhesRrTtKZWdRHLRN3rsZhfr
 WGLiUFQ5zJiAp/fRBwyWzImXwU8NQOrT5tEDWTjSG5PH5/SIEP0p+Z2OE0/Vpyio1f9I
 d8x3vsBe/4OIySwaaKi6gxhmp+X3XVic8EBPRusNcRrmSUahp4+AkSR0X5qvhOXIBBJI
 /C1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680914205;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pToGA7FV0Kiuzd13D8HdwPAx2mWDhQqvcrmIS2Cnr7I=;
 b=ml99HNjAU4kuzeX7zoM3Jgpvf7+jtdbjnFZDfRDJ+tuZRzubtqxtbXP5CImz+tJNw+
 aPkhY5k2IrGF/gm/dlH2i6tNDhJ9sTqGKQ8aVX151/Jcece0qG/63d8Pc314D2HFjnwx
 ST+UbuRg3Wp48hviDshInjFebsqZGJdwaPpRMQEIsW6URAtRR56QBk7Mrgye0fJZSrS2
 wCrATMecYsVrE4+UAscXsy3rE0yz/qc4sHhYYn1x0B3Zw+lDUGRePqcx5DQNroMF5It5
 lhHTOK41kDVsasABZAacFeh2HGBH0mJsxig/MYhlKCl7FAQw/BC7DzS8jNXz7bBDDLHC
 0rJw==
X-Gm-Message-State: AAQBX9eDyohYt5KmFb1ZBaISHpfpELlHnBvbDO2ccp47R36v2f4Cy/Hu
 wlX1U7cfqj6fTQfdArJCN3We7Q==
X-Google-Smtp-Source: AKy350aucnCbxoMrXwvAyMohaMMogPmBAdeaQMVXJGLyL1y0RYnmQhQH5DdC3xcMXS5Nug67U7UBLg==
X-Received: by 2002:a17:90b:4f42:b0:237:d2d8:3256 with SMTP id
 pj2-20020a17090b4f4200b00237d2d83256mr754113pjb.20.1680914205650; 
 Fri, 07 Apr 2023 17:36:45 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 pc9-20020a17090b3b8900b00233cde36909sm5172046pjb.21.2023.04.07.17.36.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 17:36:45 -0700 (PDT)
Message-ID: <d6d73e10-a551-09aa-88b7-848b11953f60@linaro.org>
Date: Fri, 7 Apr 2023 17:36:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 01/10] sysemu/kvm: Remove unused headers
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405160454.97436-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
X-List-Received-Date: Sat, 08 Apr 2023 00:36:51 -0000

On 4/5/23 09:04, Philippe Mathieu-Daudé wrote:
> All types used are forward-declared in "qemu/typedefs.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/sysemu/kvm.h | 3 ---
>   1 file changed, 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

