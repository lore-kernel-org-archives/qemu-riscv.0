Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prOlH-000504-Qe
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 15:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOlG-0004zo-VC
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:55:38 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOlF-0002lg-AC
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 15:55:38 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-2fbb99cb297so5620433f8f.1
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 12:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682452536; x=1685044536;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hHV8ZIgOB20an80J8t+9yjX36gKCYBjeJ9qjbjHqqf0=;
 b=FqjLUiaGUjhIThqNDJ29AqLrYPcE8uHvawjfVs5N3LklsETAdUjajvoxp3I0l9jhnS
 ma9hkW4ac7UafT3HIDWCzkpTL232Rg/oyZqZmfzntkjwKgJMNUZtL5+e4IdWa4iQljbC
 Eb1cJknFoLDPCw60B8VFS21bBoEuPrvsqSlSmGc7ATwsMPy/j95k59FnMhSz1QpRHylc
 KBdZj4weFYVTmDObqzyyr9X6BUJ6Fof/IIMiIzE8Mt0X+wkp1JWYA9Ujk1pbXLK5ulig
 ILrQvypggp2WZFSY9y+l5kncI5RG41kHOrWLh4ReTkhjrAv3fasrpqLT99Nfd0ifwAoP
 CSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682452536; x=1685044536;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hHV8ZIgOB20an80J8t+9yjX36gKCYBjeJ9qjbjHqqf0=;
 b=OyCHYxfxiKo52+zhvoVFQFhf615QZzWd0xDyNyg6qC8njvFK6J0ZOS8M56i9EwUasl
 XC1oQwEfRh6JZ08/IJaYEI0C3iCHw4YOTUuoETIxYcOW2VDLYX/FbyyqHEzHkfHV59cD
 zat9BGZvjVU63hydF685H6h36Hqwmmzh2Im9W9zMnT9yHdRm9OapF1XBwATYaVXDWJO/
 jIxn2ooVyuSQkZ6v25XqAFDKqDPVQlqS4PY7hwYYuUngaxfXV7hiMrEHJs+sWin0p0GM
 U60wW47N1F4OCxh+p5YWgMuDMGhd3U924aj+9iwI2OLc0N4Hq8GfWMI9sgeVjOm935px
 V+QA==
X-Gm-Message-State: AAQBX9c/9TuV54+NrtDZCsfI8brilT0mDOKP77azmbBGNp5NZYDUnb3V
 IGyIXytz8QDnFebdWELuqu4i+A==
X-Google-Smtp-Source: AKy350a5EGUxQFusyB1AslLIP5LnxQFBeovc6Q6iOU3goYpmBbdL0zBM3ACG1+f6UqfoPIIzoAwVsw==
X-Received: by 2002:adf:f085:0:b0:2ef:b6e6:5985 with SMTP id
 n5-20020adff085000000b002efb6e65985mr12638794wro.58.1682452535829; 
 Tue, 25 Apr 2023 12:55:35 -0700 (PDT)
Received: from [192.168.180.175] (153.red-88-29-176.dynamicip.rima-tde.net.
 [88.29.176.153]) by smtp.gmail.com with ESMTPSA id
 k24-20020a7bc318000000b003f16fc33fbesm15865368wmj.17.2023.04.25.12.55.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 12:55:35 -0700 (PDT)
Message-ID: <6af90075-9dda-ecf5-7bc6-41a90cc1f95c@linaro.org>
Date: Tue, 25 Apr 2023 20:55:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 08/57] tcg/i386: Drop r0+r1 local variables from
 tcg_out_tlb_load
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424054105.1579315-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 25 Apr 2023 19:55:39 -0000

On 24/4/23 07:40, Richard Henderson wrote:
> Use TCG_REG_L[01] constants directly.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/i386/tcg-target.c.inc | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


