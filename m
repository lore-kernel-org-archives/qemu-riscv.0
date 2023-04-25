Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1prJp0-0003Jk-VE
	for mharc-qemu-riscv@gnu.org; Tue, 25 Apr 2023 10:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prJoy-0003Iq-2G
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 10:39:08 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prJov-0007xU-DJ
 for qemu-riscv@nongnu.org; Tue, 25 Apr 2023 10:39:07 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3047ff3269aso1335339f8f.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Apr 2023 07:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682433544; x=1685025544;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kXev4z92u7b8riamlwinMGp6DktEBDmkjreXLKtGD2g=;
 b=QW9eqXyAFACz/Y0fCfAzQJsPCbG40QnBXWxcTOXJRTrGImN7vMMHD+gg8UHd2czV+y
 yMQC5bDf6gQMHto2W68nViGLY8TLyJDq5TNV4QjmZ0n/r/RyilvTr2vw5ffImZOGU+oL
 KxmmHWt0OOt2r9gQR+8+tXH+zUeAKAunN5SbukqGvOioq5TMYQBYCEGBUPayeWigFusn
 dag5eJV6BbnK5ZwKJAtPcv73aHrqKBuPmhK7Wlqf2Vm/0Hd4GlohqnFyqaVzfcHAF/mG
 sz3Jg2BzT13Z4x4iVM4YvmLrChPz9GtN5c5J9ahvHvejJ5+q6JfheXlUBodR1TYBTbP2
 7KOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682433544; x=1685025544;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kXev4z92u7b8riamlwinMGp6DktEBDmkjreXLKtGD2g=;
 b=N3/v+EuG0XDiguaN5qHakhMTU5wo71cTS2iQWeoJ+zrExxQ6KFeuD4+5KDGVdcA3e6
 FKACAHmw0dafovSBUECPyoAY29lxra7poaLLfnLaoDLKkXsr2hvPSFEtmMqDXoZaUcQM
 4HokZmra0KToze9Al/MjPz237V1qnVtzjai4sxS+gbTNanjdezRbhxzvosgmmrqN0dh1
 4Uq3qfN/1vBSYxPxs+YVvOWHGqUBSdYi5SHA86/IGprSDWegTrx8nTiDrOkubhLP2LcD
 9bSBYzOZ2TBQeIxzSA0gR4C4Lrv/zX44PCNp4/WLAA50T0aznHFYjlteJIcK5y3MVRg2
 VAZQ==
X-Gm-Message-State: AAQBX9fc3C1ic3RXOjCvGgp40XjoDs7GTiWtTTIMlnIZl7l2i67UQPxZ
 hjJdsVtxBssStB028K/Bg7Cujg==
X-Google-Smtp-Source: AKy350bLvQA2hi0xem7xQhomm4Khp7P9R6p/uGHpwkxvhC7eN9heVoqM7EYcooiFu7VVne4+U1FJmg==
X-Received: by 2002:adf:ebc6:0:b0:2f6:981f:4ffe with SMTP id
 v6-20020adfebc6000000b002f6981f4ffemr5644853wrn.2.1682433543772; 
 Tue, 25 Apr 2023 07:39:03 -0700 (PDT)
Received: from [172.27.248.56] ([212.187.182.164])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a7bc403000000b003f1745c7df3sm15202946wmi.23.2023.04.25.07.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 07:39:03 -0700 (PDT)
Message-ID: <42a91ef8-c705-3a88-15ba-cf9b4b3d4c1d@linaro.org>
Date: Tue, 25 Apr 2023 15:39:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 24/57] tcg/ppc: Introduce HostAddress
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-25-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424054105.1579315-25-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
X-List-Received-Date: Tue, 25 Apr 2023 14:39:08 -0000

On 24/4/23 07:40, Richard Henderson wrote:
> Collect the parts of the host address into a struct.
> Reorg tcg_out_qemu_{ld,st} to use it.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/ppc/tcg-target.c.inc | 90 +++++++++++++++++++++-------------------
>   1 file changed, 47 insertions(+), 43 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


