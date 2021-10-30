Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mgy6w-0001i3-7I
	for mharc-qemu-riscv@gnu.org; Sat, 30 Oct 2021 19:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgy6u-0001fm-QL
 for qemu-riscv@nongnu.org; Sat, 30 Oct 2021 19:50:04 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:34670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgy6r-0007Je-EL
 for qemu-riscv@nongnu.org; Sat, 30 Oct 2021 19:50:04 -0400
Received: by mail-pf1-x42f.google.com with SMTP id 127so12864431pfu.1
 for <qemu-riscv@nongnu.org>; Sat, 30 Oct 2021 16:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jwoa3fKEXW+9/8YVOivUWuqrFF6FEOgoUBj6NHT1Okg=;
 b=gbuFM7r51Cn7ANeGBjDOHeMjLUlVxuYEVIpNU0PdwMKMV/+73BvbEYhYZ8HwK8wAeJ
 3zeZZ/nhhBB6+50iFblakrkKxdzAr3/6BYRjmU3qIJA1H/WoGuMK2y2EP3BsQNmgtoHk
 IF3ztQlJUEn1DYz+3AnhEidZ5QCxtLk83kV+5FKs59xTyHpdNmYSH3CElFGBSG0OVQKJ
 FkmGXsT6Yn5r9tuMbzrURQponjIxfmqyqI7JT/v8LiVGPAre/U55zzHTbNELb2seDg8D
 X6W1okanNojNpnhjOUYckOXIHcWhnz/rOfh0wBYQLQOkLLbKF9SAOCzePm2U2xc3qYMQ
 32cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jwoa3fKEXW+9/8YVOivUWuqrFF6FEOgoUBj6NHT1Okg=;
 b=HtEhR26aIJKQxqBK9X8wETLX3FzV60dVvQeR+LBc5ETI32kj0lHn0Wk/IUlnZOwaJf
 gmVXoGK89F+DT80eMCzAqrWFBeT3tyhHbVhXzfQJeCZMKnu0pfHCJpGO/bnRv3Lf5qfH
 V4Jf1qsewuyN0ekitiT5F2eMRJqDJOVimP4aOJAR+2HLhJe7zI/2sMgjSO1PcWgo93yG
 UMvht/IC0DUXcfPyI3o3neH3R8x+XnxZIRUW1A3YTWaAXvSPBdxfpQETEDXBW7SEsauZ
 3lGtUHUVoEv/ivrwRaXgimMV/B6xKVMxP3iyplyfdgtyyyPto9XhlcNr0jUfAnoqlvut
 FNFw==
X-Gm-Message-State: AOAM53022v3qGNy/BV3Q0yLTojF4zm8Wne73QY20YcHP0pRAJf7Mioa1
 YdPRkEBPoHk9EXpPDbIoRgKjjwlNS/t/ug==
X-Google-Smtp-Source: ABdhPJxFQpRaO3bOxxLN+6iZaL5r8BNbv7uXdF22cWZCfauZc1mDpBOgdnaojSL4P11A2YZ4SsNdwA==
X-Received: by 2002:a63:81c8:: with SMTP id t191mr745730pgd.86.1635637799926; 
 Sat, 30 Oct 2021 16:49:59 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id rm6sm9878927pjb.18.2021.10.30.16.49.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 16:49:59 -0700 (PDT)
Subject: Re: [PATCH v4 03/17] target/riscv: additional macros to check
 instruction support
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211025122818.168890-4-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5243c602-2292-d985-3e11-5c29c281f324@linaro.org>
Date: Sat, 30 Oct 2021 16:49:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025122818.168890-4-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.426,
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
X-List-Received-Date: Sat, 30 Oct 2021 23:50:05 -0000

On 10/25/21 5:28 AM, Frédéric Pétrot wrote:
> +#define REQUIRE_64BIT(ctx) do {     \
> +    if (get_xl(ctx) !=  MXL_RV64) { \

Extra space after =.
Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

