Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kTZbT-0002ZB-Pt
	for mharc-qemu-riscv@gnu.org; Fri, 16 Oct 2020 19:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kTZbS-0002Vf-Cn
 for qemu-riscv@nongnu.org; Fri, 16 Oct 2020 19:57:42 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:45087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kTZbQ-0000R3-UU
 for qemu-riscv@nongnu.org; Fri, 16 Oct 2020 19:57:42 -0400
Received: by mail-pf1-x443.google.com with SMTP id e7so2370441pfn.12
 for <qemu-riscv@nongnu.org>; Fri, 16 Oct 2020 16:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PnAQoAA0RyXXesZLG7QmJadfGKel9RciOTxBkb0RJK8=;
 b=pw83+KdpVWwdrJ/YSTHKM4pwfGmfvsmhl7mzXe64t3iQJzsCkxZPyRjUkwj9BnfBLn
 fDgoEXaYCBIl++JYu0gn3ffHI7VWImPNF0eCd6AsBjByRriZuvqURNQQxGumgOjp1Ljw
 Rm7/cQoo+wzGMhoq1S6jZLsR1HOW/zKKbbpnHqShwkEkfITzLqT6RvhocsAkjbRXGjju
 KE8tFN037MENzBT10cPfkPNA75YKyxZNIoYeS1F8y3vzudjUfQRhCZPKoFoPfeHzsPcD
 9glS6ZH/arcANKT6bPQ4uSwzdl0mMvGuwqZToj1ybdre075hOSoRA0EAK0OwPtaiSrYA
 Csqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PnAQoAA0RyXXesZLG7QmJadfGKel9RciOTxBkb0RJK8=;
 b=d6/k0HasTCDeDBF2+7PizsNGW+uS2pWF1zp1crhFb1gQSsJvDxxmK2/nnuIJfmMJy6
 qFK1UTuoJb9DmftEecnECJTfggV6lEC7qWB8ORow4ej1Xs8pc1iMPIezNoqwyCuPspLD
 rM/umck9isB9Er+wRZvjE0+/evJQtBOri1LTYon9Do8+/jTy+0Rud2U51ajv820zOswH
 /4mkUSJYT8eJWaiHGUnuJusGmNqbq3VnwvfJflW25kdDGIGy3jyP6d4gog5mGuM4hC6F
 L4AHiltFC20Ec/4Zxu+zgJMA5B4WJWraZrP+iv0Wi6+SMWhtZBD/EONE8w2WbkCH83Qg
 6zzw==
X-Gm-Message-State: AOAM533T84B6RYpwFNaeys+37lUM4wEAG8Npui1Q9NHlThQ6JhXalf0f
 WGg5ryAHpd5PuMl3zYcajKhd5ZOadtR55w==
X-Google-Smtp-Source: ABdhPJy8R+0M00dh9v/PSfxouPe7cRvgUCvEwlz834E7NiwJvyuavfuF0AS6mkFDxiyC5VXhHl4DUA==
X-Received: by 2002:a63:185a:: with SMTP id 26mr5087285pgy.408.1602892659214; 
 Fri, 16 Oct 2020 16:57:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id y137sm4109314pfc.77.2020.10.16.16.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2020 16:57:38 -0700 (PDT)
Subject: Re: [PATCH v3 1/5] [RISCV_PM] Add J-extension into RISC-V
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: space.monkey.delivers@gmail.com, kupokupokupopo@gmail.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201016221138.10371-1-space.monkey.delivers@gmail.com>
 <20201016221138.10371-2-space.monkey.delivers@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <423141e1-4f5c-823f-89b4-4a94ca7b41ae@linaro.org>
Date: Fri, 16 Oct 2020 16:57:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201016221138.10371-2-space.monkey.delivers@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.253,
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
X-List-Received-Date: Fri, 16 Oct 2020 23:57:42 -0000

On 10/16/20 3:11 PM, Alexey Baturo wrote:
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
> ---
>  target/riscv/cpu.c | 4 ++++
>  target/riscv/cpu.h | 2 ++
>  2 files changed, 6 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


