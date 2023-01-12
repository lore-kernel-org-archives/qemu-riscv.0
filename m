Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pFtgP-0002Wc-QW
	for mharc-qemu-riscv@gnu.org; Thu, 12 Jan 2023 04:15:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFtgK-0002UB-9h
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 04:15:36 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFtgH-0003pQ-C7
 for qemu-riscv@nongnu.org; Thu, 12 Jan 2023 04:15:30 -0500
Received: by mail-wr1-x432.google.com with SMTP id r2so17411329wrv.7
 for <qemu-riscv@nongnu.org>; Thu, 12 Jan 2023 01:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rxJi5BjmJRRSwr/bA/lb0PJCE0xQIspFvkNmfFDA1js=;
 b=AiBJuGK9OMM8Bcvw42LvZmu8qc6LghP0SFyeACZGkr9A6E8odOdstFomBdaC0c0fsU
 STjJsaWwPpk2QNtMco6ViVrKj6RBXpg4putOBxKlCWcmGBGk1q3vr37EaHKTuoUf1dBO
 8zEta2hz+kfLSEe2v/yatIzswAvKp8q4hIsT71mhwLh5wK9LP+8c9zWfXcdb5dHZkY8D
 ybQEJAAivUFp8V/ylVCaIo0Jg/4MEjz2Wu2IrblbhZlAAIyjpj0GUbAnaQf/Pqe11ffG
 i8mFW5XopjjoZyjpwIZQaDWGN1DIWTD9JkncPXao/vkJ+ax/IciGyRTmvW8cc0K4HBPP
 OcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rxJi5BjmJRRSwr/bA/lb0PJCE0xQIspFvkNmfFDA1js=;
 b=ZtB5CVkIa5FfXF2gl90fJ0kyZSQ2j3pfabSrbpg26PgDnLnb1KiEIzF3gn1FR0r1m/
 oivtmyF0GWo+XOepmUpNWR3rt/HWb7j223WBEpQ+7i5j1llZYbiyp/Z8GbryJY9tvN+J
 SqfwZLCKTwHhSz3L/RmiKtyNgi+oA5rhSwrC8eOOyawnK3im8IR98mmxuTZ3Y1riNdMr
 CFJxDKUIIDnzGTK5pXtP0rtvI90ubd+WJ5cUeiuR1VHdz79quxQelh/qGstcN2ySI4c1
 UfCWzFSQoy6rsllZNRWu+PVNfqwThAndkwYK4yssoLWS2U91w2CTITGq5z7JElLp7jqE
 ypFA==
X-Gm-Message-State: AFqh2krs/iBQBrc63Rn9O3Npygqztf5s39dM/YreyONCvXHURJMFiy/e
 Po0pKDC7Gsraoo3EricnWW5b/Q==
X-Google-Smtp-Source: AMrXdXuD5zigCnElQEHvB7u906utAbK7O6QhsGBIByMg5vrs+bt5ns8flgYiSYSHtoHjfRL2ffWZqA==
X-Received: by 2002:adf:f9cb:0:b0:285:d0ba:92e2 with SMTP id
 w11-20020adff9cb000000b00285d0ba92e2mr37392636wrr.47.1673514927928; 
 Thu, 12 Jan 2023 01:15:27 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n13-20020a5d67cd000000b002bdcce37d31sm2274327wrw.99.2023.01.12.01.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 01:15:27 -0800 (PST)
Message-ID: <077848ec-b5c7-696c-f17b-c1bd3cd8a54c@linaro.org>
Date: Thu, 12 Jan 2023 10:15:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2] hw/misc/sifive_u_otp: Remove the deprecated OTP config
 with '-drive if=none'
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org
References: <20230112083921.887828-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230112083921.887828-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 12 Jan 2023 09:15:36 -0000

On 12/1/23 09:39, Thomas Huth wrote:
> '-drive if=none' is meant for configuring back-end devices only, so this
> got marked as deprecated in QEMU 6.2. Users should now only use the new
> way with '-drive if=pflash' instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   docs/about/deprecated.rst       | 6 ------
>   docs/about/removed-features.rst | 7 +++++++
>   hw/misc/sifive_u_otp.c          | 7 -------
>   3 files changed, 7 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


