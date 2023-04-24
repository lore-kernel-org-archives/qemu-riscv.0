Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqnw1-0004UZ-Vv
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 00:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqnvz-0004Tn-A4
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 00:36:15 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqnvx-0001Hl-Eq
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 00:36:15 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-2eed43bfa4bso3557122f8f.2
 for <qemu-riscv@nongnu.org>; Sun, 23 Apr 2023 21:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682310971; x=1684902971;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rGRC4M/xg5RvySFn6AUCpzfS3I3dPVkQtLaqMaINYlg=;
 b=BzdrVA1b+yH7PDYRSew4u+SsxQdBVhn5a4orw/I7kkMuT6lH1MVFX0tQ2Pixfm5C53
 0CJC5y4Dsn8iYm6jmjhVLhawdrKgZSWeacul7biEURBD2oYcZWkJzulxxl2IfDVgmW/g
 wvjcYSrufXTGYA0E19fYn5eeG9Z0UV1YCqFjd20VJKFW68TKKDGNK99KgYH/eduJ4pMj
 DR004DlVovSOxiM/r+h0p5ytWQ20WNZqs0Qi7Qm2lbrSYRXEynbPkxnd6rCDVtnxxYxx
 foHB+/0eBrAiD0VZbp06IhfveT5EgLsde51Ij3Ffpg7uiBo6Jog6AIyzqJGyYmSSpyuw
 mjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682310971; x=1684902971;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rGRC4M/xg5RvySFn6AUCpzfS3I3dPVkQtLaqMaINYlg=;
 b=h4XuNpgCH1/VuQyfV1cQuHnir9L30CN6AH4YhEoCLXGRrwvb8th4rXANmcB6hIqneO
 muVkO5EkbqdL5cd7nLv4SVAjHtf9uq8XQIfZhQkFP0R8eMMkLYdOYrokKMSaWzxIoPvg
 9XWMDjH7aMWYaXiRoXUi5EijqX78Y8p50DGxfrXoxpSm6Ec4fUgp43525AxWHSLEWUaH
 W6hZb+Ojqwdc2RcwCO4gKlmE9lG9QL6mmsr5Bc7suZN1t4UuKPyt3Bht/wNYk4TaVSPT
 KphnSXPH4/1PDueHkWHEJZFtJc0PVvU/bd88XIBOOP8n57xL+ULiXu3/lye0D7j80Yft
 E3UQ==
X-Gm-Message-State: AAQBX9cgGSGyN3SwH1hC3UQ3cmncARi8NxFym00HT94YQ0tKybwdWCWQ
 MH08/EqXEiFWuCypcQf5acCWRQ==
X-Google-Smtp-Source: AKy350bZPxSB5+ezN04VmPKftjnjA1w6LbtMc3Wx7c4GvErmEd0lrUnwHJbcZI3HJTEJ/EIRtc3Gmg==
X-Received: by 2002:adf:e948:0:b0:303:a2e4:e65b with SMTP id
 m8-20020adfe948000000b00303a2e4e65bmr6086539wrn.66.1682310970908; 
 Sun, 23 Apr 2023 21:36:10 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 25-20020a05600c025900b003ed2c0a0f37sm11088995wmj.35.2023.04.23.21.36.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 21:36:10 -0700 (PDT)
Message-ID: <e522acac-cef1-e4ef-2cf4-7c99deeae1b7@linaro.org>
Date: Mon, 24 Apr 2023 05:36:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 33/54] tcg: Introduce arg_slot_stk_ofs
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-34-richard.henderson@linaro.org>
 <6f54a97a-306d-f375-1fc2-8faaf848ecd0@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <6f54a97a-306d-f375-1fc2-8faaf848ecd0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 24 Apr 2023 04:36:15 -0000

On 4/23/23 19:55, Philippe Mathieu-Daudé wrote:
> On 11/4/23 03:04, Richard Henderson wrote:
>> Unify all computation of argument stack offset in one function.
>> This requires that we adjust ref_slot to be in the same units,
>> by adding max_reg_slots during init_call_layout.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/tcg.c | 29 +++++++++++++++++------------
>>   1 file changed, 17 insertions(+), 12 deletions(-)
> 
> 
>> +static inline int arg_slot_stk_ofs(unsigned arg_slot)
>> +{
>> +    unsigned max = TCG_STATIC_CALL_ARGS_SIZE / sizeof(tcg_target_long);
> 
> static const?

No, compile-time constant folding and propagation.


r~

