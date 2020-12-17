Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kptnc-0007NK-UR
	for mharc-qemu-riscv@gnu.org; Thu, 17 Dec 2020 08:58:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kptnY-0007Ls-TV
 for qemu-riscv@nongnu.org; Thu, 17 Dec 2020 08:58:29 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:43618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kptnM-0003TA-8P
 for qemu-riscv@nongnu.org; Thu, 17 Dec 2020 08:58:28 -0500
Received: by mail-oi1-x22d.google.com with SMTP id q25so32230901oij.10
 for <qemu-riscv@nongnu.org>; Thu, 17 Dec 2020 05:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uiRoCLzv9/s/EN0X3jILm2hVkQkHrupiJPU0fjC3L74=;
 b=ND/KK4PsrBNF9UIkPJK936xc0cP2h+zvPIONsV4rViiI3FeyawaSNNycr80e4slfLh
 Y8ohzupIMb83ral6u7H2PUyzS99EVhHDarfJDFwgwvh/Eockndf9Snokq7CPOBIyZ/Ne
 0wNt5jI7ex4ZpZNnyS81pJXS0dKPNrDFqxCZamNEGz0hTjmwgW+b1QGQUv0rHIFah8he
 RohgWBxSPy3Fant1gsdBMe+5EePOOx+IMrMnumMzgbHMxEd7zj02F+D3xzrWGB42zfyw
 k6doKzyThGmfQgI00gzp4duJk5q5/JK88srgJ7AEBhEcB5sVrIq1HL+VCXCR3J4fddup
 BWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uiRoCLzv9/s/EN0X3jILm2hVkQkHrupiJPU0fjC3L74=;
 b=PWFQi0wkCSqt15m6QIRPUfIRVxBbVF3RfdTQDoCu9Og3Af5FRV/egYsHM+oylggzp7
 vDUBjI/oHDTKJPNKqAhkeuSqXC5WpafjBIMtgbZDZpxt69zSoKlgnVB182mfARrsmfSt
 YSdNV0Jh8QRkl7bEjFQirllw5y1pnjWdWhYr2fD0uYJaPWawgAGLaHCQW5dfeN1qwk3C
 uO8klKfG1Mm+guj9v6aD61SCVMtDNB3TfO/c3zLOZfpeVwT5SHaYj/iyjCja2s8TI2kE
 v4G4+wrHR8etB7pjZljTRhL/mDdyIXDr/CENB5CD9faZewctn3Ny6tOs6exNTmgF1IGV
 wCQQ==
X-Gm-Message-State: AOAM533himrMlvrFA5WdTVJ6+YqCoNA052zW+PXlFHAtGy+rVR9oj2gr
 jtKcDmxARHbtN8vQ1/OFekTF5Q==
X-Google-Smtp-Source: ABdhPJypQvbO8Ljh0YUNHnzw2Ia0OrRuAQHZW853pmVz/UlfCgv05OMyvVCvjk74a8VC2GUi5emxHQ==
X-Received: by 2002:aca:5dd7:: with SMTP id r206mr4938552oib.130.1608213494840; 
 Thu, 17 Dec 2020 05:58:14 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id r25sm1217792otp.23.2020.12.17.05.58.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 05:58:14 -0800 (PST)
Subject: Re: [PATCH v4 16/16] hw/riscv: Use the CPU to determine if 32-bit
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>
References: <cover.1608142916.git.alistair.francis@wdc.com>
 <8ab7614e5df93ab5267788b73dcd75f9f5615e82.1608142916.git.alistair.francis@wdc.com>
 <CAEUhbmWbCVnEYRAmaQOpfBmnRtOzFrs-85S+g-AfGhy65bTWXQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7d2b4053-dbca-faf8-04b2-8da0aab70f29@linaro.org>
Date: Thu, 17 Dec 2020 07:58:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmWbCVnEYRAmaQOpfBmnRtOzFrs-85S+g-AfGhy65bTWXQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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
X-List-Received-Date: Thu, 17 Dec 2020 13:58:29 -0000

On 12/17/20 12:44 AM, Bin Meng wrote:
> What happens if something like ARM big.LITTLE needs to be supported on RISC-V?

I'd say it's the board's job to pass the boot heart.
(Though even big.LITTLE doesn't mix 64 and 32-bit cores.)


r~

