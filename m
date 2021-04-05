Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lTQxA-0006H1-CM
	for mharc-qemu-riscv@gnu.org; Mon, 05 Apr 2021 11:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQx8-0006Dz-Ua
 for qemu-riscv@nongnu.org; Mon, 05 Apr 2021 11:15:46 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:45054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQx6-00010Z-W6
 for qemu-riscv@nongnu.org; Mon, 05 Apr 2021 11:15:46 -0400
Received: by mail-pf1-x435.google.com with SMTP id m11so5724117pfc.11
 for <qemu-riscv@nongnu.org>; Mon, 05 Apr 2021 08:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VExPqRq3TEPygX8i01cVht4GCh4XaMyzf19uAPmHB6E=;
 b=d447L2XghmJNVuDqlkw0M7bEQq96mU1T113Kwbp3mFib31JOW6eeFXpap/k8X9pVrq
 7p2ReQTAgEdG1IJdZdJaKxH49XLDu7sdPb8uYnow+p9YlKN0DDDtCHrRhaor/52Tf/xb
 E7AGAcS6bJ3/TY5xcmWNR2u1kIHvJLRzPtT9K/wy/NSrfLa2Eq44e12XwIgwHX0YXpN3
 CifQ8WslEYopfPGe0Zy9FXcwCO3nvEe/YrrFXtQLTcG69WMoC2oD2BMAVpUKifSFdCtz
 hF9KJoZfMpQ7rGTOtyLTVYWeHg+v0eLmIKw4JhybpQDuL6XNyagijk2L3SKdGOAotGRm
 XOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VExPqRq3TEPygX8i01cVht4GCh4XaMyzf19uAPmHB6E=;
 b=aJJzeTE4p2zYlAMALU6tD/Wi4rhCPy9ajXT3uOnHFRsY4Twh8lxT98X8TbXZ4xgi5/
 yvd9yWiS3r6QNmlMtdcmYOKIoFIfg+Oa4nTQrgxwz5WY3Oqa0+BV2TwDumf+S3epJNyE
 WBF4EgQExrhQ+FhVmdyIe72BGYXvtAM+cRbQPbKGCRcq0e9e1sgzG+8LPO0BV1lojvBi
 W5Lr5MM3Q97Z/b3e9k+/NGC1gfNRC5KS+omCAmKGzEXEZpJ+XnIre1thMkX44ZHIiKfp
 BI+/7YTbjCeCwKUFWc7cfNvoTWDyVdLpzOhJrc+LMRAAabdF+AiapHyYogSVNajDygOd
 6WMw==
X-Gm-Message-State: AOAM532Eb+jgD0CYDj4yeB11aL0C2S9cVdbbPORlpmByPIJCnZJCeZL8
 W6cEBKtx2VZswEWVj/Q8qZUnVA==
X-Google-Smtp-Source: ABdhPJxyGVjYnK9HbPQhx93dnPfyuzrvVUxdERSdwbBt83/2UcQ5rRhxDgfJX/WcVSNwrMKI7vTDHg==
X-Received: by 2002:a63:f443:: with SMTP id p3mr23272726pgk.378.1617635743589; 
 Mon, 05 Apr 2021 08:15:43 -0700 (PDT)
Received: from [192.168.73.67] (50-200-230-211-static.hfc.comcastbusiness.net.
 [50.200.230.211])
 by smtp.gmail.com with ESMTPSA id x1sm16224490pje.40.2021.04.05.08.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Apr 2021 08:15:43 -0700 (PDT)
Subject: Re: [PATCH v1 6/8] target/riscv: Remove the unused HSTATUS_WPRI macro
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1617393702.git.alistair.francis@wdc.com>
 <f9d643f4f0bf3b84aca49fb0373bb050f7d401a4.1617393702.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9332239e-aa20-acce-54cf-424d963e9ebb@linaro.org>
Date: Mon, 5 Apr 2021 08:15:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f9d643f4f0bf3b84aca49fb0373bb050f7d401a4.1617393702.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Apr 2021 15:15:47 -0000

On 4/2/21 1:02 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   target/riscv/cpu_bits.h | 6 ------
>   1 file changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


