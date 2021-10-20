Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdJWo-0001cV-1d
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 17:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdJWm-0001bz-E5
 for qemu-riscv@nongnu.org; Wed, 20 Oct 2021 17:53:40 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:43981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdJWk-0006iT-Ns
 for qemu-riscv@nongnu.org; Wed, 20 Oct 2021 17:53:40 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 e5-20020a17090a804500b001a116ad95caso3420146pjw.2
 for <qemu-riscv@nongnu.org>; Wed, 20 Oct 2021 14:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BOEuu+eiF9kicbUIz/AfhoyawPtDvbLp0qnj02a8xYU=;
 b=IT39u5toFDWI9/ZcjU3kZ4k/VzyUNHQeY93TppmBi9e8wqEPcTj7O87w7/pJ2w98gz
 m6nYcGPJ3OlmwBAY2fL5QpB+AL+lL30rbnOGG+HKzU605mEu95s0tE+3tHqNnptlfOYb
 MIaBxtUgfLTxuAU4JarwvxFAphIDIshP3hDyj99buMIq7vyWcq+VK25fahdlhBLbsmqZ
 TuM6MmUBp1MHk1j8IfEM7MU+/W65E/8pcVT5yauYqLY79iAhpHjzY7vBdffuMASEhpru
 hZTA1+5V/H/FCN1V6R7+YQ5GlHU0+J0wlgCPcVRN3IIB8Z+vJmiaVrWJtvxQaLEA/xG3
 WYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BOEuu+eiF9kicbUIz/AfhoyawPtDvbLp0qnj02a8xYU=;
 b=SKT/WMyFc3gi8mMVMppxImV9urKXLVckfUwfCefrjvXX5W9c9mAWTEJLuTawHpBGgM
 cyU/pT/wXnPY5VhTN4Sslai5UPjD25t0Wl+n4tbJDl6P83RaBfc5JYA8CpkNm3S86GwD
 vKQRDmDBcvAB8GgeBa//2zecBdFTGxeCTAvvDWQlcySbFLq8BgVDl1b0UqhSeyEkEx2y
 jljLmIKIxZPhIU2rSVNTpsuVBO32ZAK2fe9WLTfnfR+qxnHaSQpCVn703zBf+9VNI5Og
 wfHC0rp7Af7Lmr+CP0paQrq+faULt78m05dPHS5hkN9KTuVp0xhZNv+MyYTloiJ7ZeWY
 sh9Q==
X-Gm-Message-State: AOAM532CS0FlH4c0CfXkidOdW3NaRiPThV6t1kkm54U60fzu4eh6tO4g
 fNyZrxk7JeG3xlqAAykS+ImSkg==
X-Google-Smtp-Source: ABdhPJyYxx9LlJDsUXxyWtb21pTlg2uak1Q1mmpuYpOykWckUCKAJjXml9KpYCnJ/w3qHU6BNyCSgw==
X-Received: by 2002:a17:90a:ee87:: with SMTP id
 i7mr1820878pjz.194.1634766817159; 
 Wed, 20 Oct 2021 14:53:37 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c205sm3437367pfc.43.2021.10.20.14.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 14:53:36 -0700 (PDT)
Subject: Re: [PATCH v3 18/21] target/riscv: modification of the trans_csrxx
 for 128-bit support
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-19-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d2bfacfd-ae4c-0922-a4fa-228613708be6@linaro.org>
Date: Wed, 20 Oct 2021 14:53:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019094812.614056-19-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
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
X-List-Received-Date: Wed, 20 Oct 2021 21:53:40 -0000

On 10/19/21 2:48 AM, Frédéric Pétrot wrote:
> As opposed to the gen_arith and gen_shift generation helpers, the csr insns
> do not have a common prototype, so the choice to generate 32/64 or 128-bit
> helper calls is done in the trans_csrxx functions.
> 
> Signed-off-by: Frédéric Pétrot<frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas<fabien.portas@grenoble-inp.org>
> ---
>   target/riscv/insn_trans/trans_rvi.c.inc | 201 ++++++++++++++++++------
>   1 file changed, 156 insertions(+), 45 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

