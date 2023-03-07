Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pZLDa-0005Ol-DS
	for mharc-qemu-riscv@gnu.org; Mon, 06 Mar 2023 19:30:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZLDY-0005NP-1r
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 19:30:12 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZLDW-0007aW-Be
 for qemu-riscv@nongnu.org; Mon, 06 Mar 2023 19:30:11 -0500
Received: by mail-wr1-x42f.google.com with SMTP id f11so10575352wrv.8
 for <qemu-riscv@nongnu.org>; Mon, 06 Mar 2023 16:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678149007;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OXmlaWM79rIAI06/ZF5KjTIAKOdA+OtWV+MxMSPeaPM=;
 b=JUAFTRMY2BhV5DWfdDplUSsaChTZnDb4NiF4ps3MbW0DdklN8F8bfL9WNWOK4lKZU9
 Alm71fIUnM11osRVPtscLdyEcfFtwRtKuFsHHWiT8gQ3OT8MkciTdbjFA4mD3AUCZ/OP
 +FWVSH5YP4npsmuM4PqV9ZLhojF2jlc5FV/5uCsyEdNsUjiIpGtmx09akds3daoMwxAP
 8QMFcxvFpkYXivoDIqRSPU4MYEt8xaZX0mFmUxGabaMTRVheL46sODpqfsV0/J68VP+u
 XGKWkNPStVdpva2w54KH6iQrm4ugZXJGRCxLjEdj59IhYdguDs9NwDxTBYdfgq2UYLH5
 toAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678149007;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OXmlaWM79rIAI06/ZF5KjTIAKOdA+OtWV+MxMSPeaPM=;
 b=RpCJVc1Wz+sF+vGXJ2M/CAAlHXBrn5SaFe8BZpFfiQlFk/r2Ay/i+5Q2CtgcwpzmrJ
 lVpMZuijV+EMPuW0LpZs0ldJrQNFbGriwNswixeLCMvOekoncDX6xS5nBuCTQ+9dcyO6
 QdtNCUbjEJarXm4ClNMHWfDR91lDzA6xjpgoo491En33vpUEFArVsSguHonfi5jEBF4A
 WK7VuZ2ZfmQGlbDcZtjP2GLhh565Ug9Bgo9E50kWLlHxyHsMo/eZ4agddzBiao3JWUNH
 zf5dSCpJBOW/0RsNyN9ZBYK6o+HG/XmTG3erPkkSRj/gDcEmwgPxqwwTgrN0XfEsJzJo
 2mHQ==
X-Gm-Message-State: AO0yUKUlF/wbsaTd1FijsBPy8IbpwYVvn5gc8q0XANqkalEX3CjMLiW+
 pfBMWoeUhJbtKNT+B9VjXqVB6w==
X-Google-Smtp-Source: AK7set9UN/ZrNnLVO5Euihn3FPbh8GqwjOMSH/A7PpB4NMlj1Z+7wU4TpkKyCZuIynuh5B5c7NHtgQ==
X-Received: by 2002:a5d:62c3:0:b0:2c5:5237:3b21 with SMTP id
 o3-20020a5d62c3000000b002c552373b21mr9241129wrv.69.1678149007224; 
 Mon, 06 Mar 2023 16:30:07 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 x5-20020a5d4445000000b002c70a0e2cd0sm10967499wrr.101.2023.03.06.16.30.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 16:30:06 -0800 (PST)
Message-ID: <e752b15b-7d34-4728-18ba-eebe4604bc92@linaro.org>
Date: Tue, 7 Mar 2023 01:30:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 14/70] target/cris: Avoid use of tcg_const_i32 throughout
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
X-List-Received-Date: Tue, 07 Mar 2023 00:30:12 -0000

On 27/2/23 06:41, Richard Henderson wrote:
> All remaining uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/cris/translate.c         | 46 +++++++++++++++------------------
>   target/cris/translate_v10.c.inc | 26 +++++++++----------
>   2 files changed, 34 insertions(+), 38 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


