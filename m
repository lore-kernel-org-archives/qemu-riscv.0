Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p3EKT-00086Y-AL
	for mharc-qemu-riscv@gnu.org; Thu, 08 Dec 2022 05:40:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3EKR-000857-V9
 for qemu-riscv@nongnu.org; Thu, 08 Dec 2022 05:40:36 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3EKP-00010c-Ah
 for qemu-riscv@nongnu.org; Thu, 08 Dec 2022 05:40:35 -0500
Received: by mail-wr1-x435.google.com with SMTP id u12so1088770wrr.11
 for <qemu-riscv@nongnu.org>; Thu, 08 Dec 2022 02:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=buO6cdpVNYldtS+BpUsbSi0LMhvAA2lrJ/Ry0K5pkBQ=;
 b=agaK2Y7QXB9VUQEB9UuIoUBSRSFn9/QJfNGhAZ70Vp7ufOCTeU3hdKV3PfOwaHXMdH
 dm/Siae+aqEb0tNpe66YRsbDN8mTPKjPcp9EVyzLIF7fVl8jlxzAZCG1yLYpAGW2gMoX
 5PFe6LDpgLWvdRSm253jjr6+uhvksZBj70t8dI6Xt/ujZijMDOfhk9Y9rYM/3kq4gug4
 j9Qc/IYMnaLABolefoUUNid8/Orzk9oKCn7Eq5u0cxZ0Vru7gcLypI7xRBgHggsCQ6vO
 /Hwhlr9suHqR5XsGEg6YVx5KTQz4GFBxOXoDLWB6t7lc+jIHHUU54HaA4OcEdzotZKzP
 zmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=buO6cdpVNYldtS+BpUsbSi0LMhvAA2lrJ/Ry0K5pkBQ=;
 b=lenXBTKiZq1QxNku0G8OMCRwQ3j8e8+rNQxLwgL95VHqvYQqC3MSubx5lc/KeRP5Fq
 WtxO1Bz4nR3PM2rh4NR5OZ3pZVsaZKJWPXLHad+uWUWsWEsxv/rp7o1gW6yD2vx/ojCL
 WsUxmpiDij3niQI/vfpJt8LvtI6iBidaxKWA3X1gTPwbKqMHzfLU5KrYL2Y7MDJamcvi
 r3ZKEJqWC0S1vYZXpF5gAV8R+XvpOVb0fB03/74XAGDGS8N/acgrfYOosw4h/w3L1/fQ
 CiW460g/DuR46WJsLOz0f6MwzF7s1qUfR2pcwoxJsH1lKCTxdvHgkepwy6onqo60k2c3
 smbQ==
X-Gm-Message-State: ANoB5pntRkvOtTll/AGQUgRQeDKJch5UtDZ9a0iZRaDn6apnNIcdceiG
 FooHqpV1oO5NERwGy3Bvg7iwxA==
X-Google-Smtp-Source: AA0mqf44cBmXYC8vz7gVbfjldVJvDyD7w3rK2PaCUsXyvlLE59ONqNz0laSS96ftookB9cO7WmRyjg==
X-Received: by 2002:adf:de86:0:b0:242:442c:8ea3 with SMTP id
 w6-20020adfde86000000b00242442c8ea3mr15675294wrl.380.1670496030205; 
 Thu, 08 Dec 2022 02:40:30 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h5-20020a05600c2ca500b003c6bbe910fdsm5626404wmc.9.2022.12.08.02.40.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 02:40:29 -0800 (PST)
Message-ID: <ea5ce917-9d27-e22d-2ba8-22439c6b6147@linaro.org>
Date: Thu, 8 Dec 2022 11:40:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 04/16] hw/riscv: Sort machines Kconfig options in
 alphabetical order
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
References: <20221207100335.290481-1-bmeng@tinylab.org>
 <20221207100335.290481-4-bmeng@tinylab.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221207100335.290481-4-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.262,
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
X-List-Received-Date: Thu, 08 Dec 2022 10:40:36 -0000

On 7/12/22 11:03, Bin Meng wrote:
> SHAKTI_C machine Kconfig option was inserted in disorder. Fix it.
> 
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> 
> (no changes since v1)
> 
>   hw/riscv/Kconfig | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


