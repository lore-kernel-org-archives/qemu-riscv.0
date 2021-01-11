Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kz0uH-0005AS-O4
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jan 2021 12:23:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0uF-00057j-E4
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 12:23:03 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:36080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0uB-0000nw-Q1
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 12:23:02 -0500
Received: by mail-pf1-x42f.google.com with SMTP id t22so330634pfl.3
 for <qemu-riscv@nongnu.org>; Mon, 11 Jan 2021 09:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KcBBYyRIsubFJ5K7YVoag2+OIR54LyMij+S3tqSg3SU=;
 b=Ass7ItIgdyqkDHQpekFD7Pdvu8l5Lc8O3Aj7ZjiXf8uVKZQhMM+311Wx84fd7Mm5rY
 VWSJBdvVkvg9ZpXQIIOSTngKPOwdyFUR17oWDe1hDYEF59L291wQ3sZ4eN6fil+N5V03
 xqMTjozaCEWuKyqTYmJGsL8rl9OnY1oBG4ugG3ku17Sj5XlRL/fRP64xvfrj3myHZ0z3
 cSMnycpq+XOyuYWmFPtsL78SfefCn9Bh6wykm/r3fY8YNsPFFBMoK6RT1D5YFZS/TbrZ
 t5MlNk5zKBvYkfBs+X+ByPuzoq+/FX0bVC2TG5NAFJ2tekOJrSzbYSv3Kh9NrUO8r54+
 PE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KcBBYyRIsubFJ5K7YVoag2+OIR54LyMij+S3tqSg3SU=;
 b=YcFfe+UZq+hBPeIZUfvfdpUU5xPGib/ocJ4hrTegTw4UjLv9ethePXNuziXDNgUsYs
 gY5WKR4UjWpHel4/Oj2xDsSG+YdVmDjpOKShUfpZjxjp1HfAuvk6bx+6uTnLEEhUzUTz
 eFa4ubnsdU4PV5YUp/2Rl1cHz3saLGHXOZhNz1xxSg0qMvAEebjartKhZvOqJ/J3j9vE
 BGuC/EdnUOKw7+/RhXuq8Pa1j9jQ794gN9n4w2GIvl889KHIxA+e4D/CKwQ7XeF5/8wE
 qQzB8evKzINtFvFAyvUoegaWMFNrv3Y6MZo7iGDY2hL+0fEk+9wkcGieUoMS7Fr5UYxF
 +esg==
X-Gm-Message-State: AOAM53028YMUK4hJxJJSlAS/CkZilDmi/bF2nEM0RNb/sjbK4N6RxItd
 5k0sj2ZIIWwc+amgChjl5h+bHIVuxXPP7w==
X-Google-Smtp-Source: ABdhPJzwPL60+c4oVmvuxvwyRiOaudTy7LIObvZ0OOlgaXDIJjZL2P1rVdRkmZebGYDh/cPQWh6iQw==
X-Received: by 2002:aa7:95a4:0:b029:19e:abd2:4a88 with SMTP id
 a4-20020aa795a40000b029019eabd24a88mr432060pfk.2.1610385778087; 
 Mon, 11 Jan 2021 09:22:58 -0800 (PST)
Received: from [10.25.18.119] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v19sm86080pjg.50.2021.01.11.09.22.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 09:22:56 -0800 (PST)
Subject: Re: [PATCH 0/5] tcg: Restrict tcg_out_op() to arrays of
 TCG_MAX_OP_ARGS elements
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno
 <aurelien@aurel32.net>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20210111150114.1415930-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <43f360be-af44-27ce-619b-7a2ad169aa2f@linaro.org>
Date: Mon, 11 Jan 2021 07:22:52 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210111150114.1415930-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 11 Jan 2021 17:23:03 -0000

On 1/11/21 5:01 AM, Philippe Mathieu-Daudé wrote:
> Attempt to fix the warning reported by Miroslav using GCC 10:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg771520.html
> 
> Philippe Mathieu-Daudé (5):
>   tcg/arm: Hoist common argument loads in tcg_out_op()
>   tcg/ppc: Hoist common argument loads in tcg_out_op()
>   tcg/s390: Hoist common argument loads in tcg_out_op()
>   tcg: Restrict tcg_out_op() to arrays of TCG_MAX_OP_ARGS elements
>   tcg: Restrict tcg_out_vec_op() to arrays of TCG_MAX_OP_ARGS elements

I've been trying to figure out a cleaner way to handle these, but this is
certainly ok for now, and avoids the Werror.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Will queue to tcg-next.

r~

