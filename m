Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdKip-0005em-Rd
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 19:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdKin-0005cW-GO
 for qemu-riscv@nongnu.org; Wed, 20 Oct 2021 19:10:10 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:41501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdKih-0003yq-0U
 for qemu-riscv@nongnu.org; Wed, 20 Oct 2021 19:10:05 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so3566582pjb.0
 for <qemu-riscv@nongnu.org>; Wed, 20 Oct 2021 16:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=soQvrgqh4ZNwE5RbI5gTgjb1JJ8xynfnRurxUIY0LXg=;
 b=ygVIBjSmXBgfKFhciPdPRRHgVSgq/bpYQqxopFlpgkriUzHPZHyS9JtZqtBwftYjrv
 zXCz05Ai6WQi2Ns3wswoywxALLEYXfSybp5Mv8Z0PxCKVLJaAhiPt4AfN0PXWDTEnEmx
 XWpiBJeWkrgnVBXN6bfqXdFmhgprfQCvuAJ/CFF2AFn6P7jwuG/pEO/x96fsKXcIQiNQ
 OpLZ43smfUZii91MDyWHhZXHdJTg+1kZ17DKOTWyeXNhMF+U8DgfcczfxJSefjlAxDBG
 SZHAP5gqm43pi9U55bzadA54r98tY3wC7TXCeIgjiIpq4bc/JuYG4Z5vR9qR71PXmr/d
 uUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=soQvrgqh4ZNwE5RbI5gTgjb1JJ8xynfnRurxUIY0LXg=;
 b=aGzUjrVkNFvxEU6Ui84z3Olv3jlxh8H6HeCDaJu0j1XZaNDcTZz0jjl54J/5hH3BZo
 6go7yIPqcfiIKwz3Um2Z/0xwH5FmL76yQEjQ90pjvnuOyC274+yyy/eOtpjntNBRvTaQ
 pHIhnUSikV+RZP0LLp3nmIF1Bjgy09fvM27vUGcpD7WKQoaGVj1lA4lOGxbsXAaewjlu
 XUcnhomnOGxqPejNF9d/vnVDJ5+70f8gk1hEEMI1hsGd4nYIvhDrd7mcjjG0KtrLKOn9
 BXNW8Jc0SMJcml6DCdkix4l2T9YgTpnbFKWvriMuGaZ0Gkw3j9bDNBSlMe2xPSCXBPzy
 3v8w==
X-Gm-Message-State: AOAM531gJcBXlh3B8qWhsF04DH5NOLI98ITl5vepYHLW3z/jtdHdlDcJ
 O2towzZNQ5mxQKShdPadZlE/3g==
X-Google-Smtp-Source: ABdhPJypIYsQrkNeVoS+/PCzIlG4m5mwIRexfILFjU+eGzntSMFa2V+OQjwYV4cyZrVhzDjOoml6nw==
X-Received: by 2002:a17:90b:1c09:: with SMTP id
 oc9mr2203464pjb.33.1634771401556; 
 Wed, 20 Oct 2021 16:10:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v9sm3701916pfc.23.2021.10.20.16.10.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 16:10:01 -0700 (PDT)
Subject: Re: [PATCH v3 21/21] target/riscv: support for 128-bit satp
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211019094812.614056-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211019094812.614056-22-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c3434f40-830b-f762-b1c5-55e10726271d@linaro.org>
Date: Wed, 20 Oct 2021 16:09:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211019094812.614056-22-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-List-Received-Date: Wed, 20 Oct 2021 23:10:10 -0000

On 10/19/21 2:48 AM, Frédéric Pétrot wrote:
> Support for a 128-bit satp. This is a bit more involved than necessary
> because we took the opportunity to increase the page size to 16kB, and
> change the page table geometry, which makes the page walk a bit more
> parametrizable (variables instead of defines).
> Note that is anyway a necessary step for the merging of the 32-bit and
> 64-bit riscv versions in a single executable.
> 
> Signed-off-by: Frédéric Pétrot<frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas<fabien.portas@grenoble-inp.org>
> ---
>   target/riscv/cpu-param.h  |   9 +++-
>   target/riscv/cpu_bits.h   |  10 ++++
>   target/riscv/cpu_helper.c |  54 ++++++++++++++------
>   target/riscv/csr.c        | 105 ++++++++++++++++++++++++++++++++------
>   4 files changed, 144 insertions(+), 34 deletions(-)

Is there a spec for this?  I don't see anything in the 2021-10-06 draft...


r~

