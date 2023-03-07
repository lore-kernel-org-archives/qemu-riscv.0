Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZUR1-0005SQ-TT
	for mharc-qemu-riscv@gnu.org; Tue, 07 Mar 2023 05:20:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZUR0-0005Qs-4A
 for qemu-riscv@nongnu.org; Tue, 07 Mar 2023 05:20:42 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZUQw-000344-Tw
 for qemu-riscv@nongnu.org; Tue, 07 Mar 2023 05:20:41 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso6878399wmo.0
 for <qemu-riscv@nongnu.org>; Tue, 07 Mar 2023 02:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678184437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nd2pP82VOrof6Dr9h5TInYkB/PdoTc53dKkO0RJjdtM=;
 b=S353QH+KJ7rJoyMNiMkT3JIQSA2sSPJXFpRZ8B/7xjBAlg8ytrmH56AdLtnlXGOlOK
 Cu7p3DjNzsDHPthTy1mXNa/GJMkt1Zr1Dbb2bwQvKuYfSgivsSe1LpratZBKndaUrFnC
 0KvwNR+sPU6r6Te7yiDy57kJ7nXM04XnxtqjeP2CB9veBXLYWZ/p7ogd1hmNk6A96buc
 yPcE6Am+6UFbDzhiwdgyXiBFNBrvcUFkex2ksXa4uH7PVcbNA68gySyh7Sp1pHLFQFmp
 n+Mk5k+Q/PuhXXGjq9y4Qe2u6rAO7MAwHLgDKqJ+kqhunIGigQB7+0Lw6iRzbnuRP4+p
 faRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678184437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nd2pP82VOrof6Dr9h5TInYkB/PdoTc53dKkO0RJjdtM=;
 b=Rv5zP/vDjzQ75KpfTKhWpQ819E1Ricwa06e6EoI/m1nEtzMP6UHjoqh6wWRbLJR5qa
 y4081Yi4fUbYoIzD90qPEzolGrXY0A0gxALykMbair07BzlcPn3tmreY7PzhojAeh0be
 RcsFvjR44xm86X4M2BLISsjlLvYs050HCjBdieYU7ZzoUe2j6CK/by+pI0dTSN3B+Xm4
 w5N2Cj+YzJ4no36Dvr/zgoI9vhN0DdNWVAiOtfMNZ3mEMKkfkdHNLDjLB/9S7uCUKE+v
 Z7rZn4j4l3rwdZcfSPTQ9V3/tKESLioYEk7JjeDossJMeEv/dy4x9Pa0/DoBD268ZVYJ
 sAKA==
X-Gm-Message-State: AO0yUKW3NfkRZAFHI8g9uH0xDDopTYg7WZmokSIGJQZ3d/xwurncgUlw
 Dol8ptvdQIzgAuUW6LXwK7A9iA==
X-Google-Smtp-Source: AK7set/WcCwcTZ9Wy6ahyKbPspHwAVbgicrl3oS4Q3WtFSNop/GOQv/fVKbJYU6qUrviR6xfnv6ilQ==
X-Received: by 2002:a05:600c:1c12:b0:3eb:389d:156c with SMTP id
 j18-20020a05600c1c1200b003eb389d156cmr12138843wms.37.1678184437232; 
 Tue, 07 Mar 2023 02:20:37 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q10-20020a5d658a000000b002c70851fdd8sm12199678wru.75.2023.03.07.02.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 02:20:36 -0800 (PST)
Message-ID: <47807f32-72e5-0b57-ebf5-620149a0895a@linaro.org>
Date: Tue, 7 Mar 2023 11:20:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 56/70] target/tricore: Split t_n as constant from temp as
 variable
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-57-richard.henderson@linaro.org>
 <38504dfd-e253-0efe-2188-b4b43a7bffe2@linaro.org>
 <fb9062cf-3a01-9b6e-669f-a6ae2c10c25b@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <fb9062cf-3a01-9b6e-669f-a6ae2c10c25b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Tue, 07 Mar 2023 10:20:42 -0000

On 7/3/23 03:24, Richard Henderson wrote:
> On 3/6/23 16:19, Philippe Mathieu-Daudé wrote:
>> On 27/2/23 06:42, Richard Henderson wrote:
>>> As required, allocate temp separately.
>>
>> Hmm not quite accurate; this patch contains functions
>> which don't require separate temp and belong to the
>> next "All remaining uses are strictly read-only."
>> patch.
> 
> But they're all renaming, in the similar contexts.
> That's what I meant by "As required...".

Ah, I guess I get it now, it makes more sense when following the
subject with this sentence. Patch content is fine.

