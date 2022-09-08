Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWDKx-0006Bj-IL
	for mharc-qemu-riscv@gnu.org; Thu, 08 Sep 2022 04:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWDKr-00067F-5I
 for qemu-riscv@nongnu.org; Thu, 08 Sep 2022 04:56:33 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:38581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWDKo-0005ML-Bz
 for qemu-riscv@nongnu.org; Thu, 08 Sep 2022 04:56:32 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 n23-20020a7bc5d7000000b003a62f19b453so1164319wmk.3
 for <qemu-riscv@nongnu.org>; Thu, 08 Sep 2022 01:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=qoTdlrv10QCxPj+s+B5pycDU3Um/SUWmOLHrVeUmAMo=;
 b=r+cDbeu0Ao1SNGrywJs2Bdp8sTiirLHcEBI/TyphMolE+Y/QRsf9PsU4kjL4h56cvR
 vENI4tY+/n9ANLByR9ndjZqwAAnuXIWYPJleRuXTuU3t3aYEFHF0ub6mdIdXp+Ev7efa
 Fq8lng98UmJJ0dBF8Wm1Ncfnrp1qXw+696AXbZ7X1NLmOqcTgKshdA3FGLYqhhQGqDBg
 KIl44Ulmv7Cx4UrCUv7FGjmsDbL2Tvgnx1FsJAC5mLOfj5pZMezfu/wBax5+3lD1LG2/
 VDQWuwvQ5xFWcboysKRDvIrr0uOI/a2QlUsbiwA8KFzS5T06SKfug0yOvAD8U+v8OGLf
 Bu9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=qoTdlrv10QCxPj+s+B5pycDU3Um/SUWmOLHrVeUmAMo=;
 b=DUcyuOD8W/Jb5RX98QSAZXJqcFBXj7vj6/wl5qHdd37YR6P6MK3V1qkORrHHKMh58T
 cByeKyflUn+oN+271kdlUFKqwneJJxiMdqpQnhzW2Bbmecca9MwBwmcHJ8tNuTHcVqtu
 VMEyHxW2evIFQkIzjXjpMumdHcrKAoqdZ2GG88aqI/c10Hc/ZCHohKIbXqRC5EPdthzF
 R/dTAYNixNM7+iJOAk4RqFGF/ecvs4BBf6oq8yz9hJ9jhSZ2nZOPuHohCBdH9qEOu6bb
 uiXmB/9Z+HcJYHFC4NEXbrVvaL1ZmD9qv/dEJ5ydgelDj6uZ6Pw3nBhunjbSLgIvuCDd
 v8xA==
X-Gm-Message-State: ACgBeo1pFxM9M1GotQ4h4I1kcPJV8NPddxpJUTDiDMrftne9r5zv44Y8
 7rJspFTIhsVIpviDmnOQPAYk0w==
X-Google-Smtp-Source: AA6agR6Q0vi3ta1KpENIbqVtiI9ZJ49UKxjVfqRGiXMcW5WOGFYUtsj4t3CJ8W+1m65OrV8yC8QPhQ==
X-Received: by 2002:a7b:c045:0:b0:3a5:ff4e:5528 with SMTP id
 u5-20020a7bc045000000b003a5ff4e5528mr1567622wmc.150.1662627387837; 
 Thu, 08 Sep 2022 01:56:27 -0700 (PDT)
Received: from [192.168.1.87] ([109.78.97.14])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a5d528b000000b0021e42e7c7dbsm18946701wrv.83.2022.09.08.01.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 01:56:27 -0700 (PDT)
Message-ID: <aa79c76c-fc8c-ca76-6224-ba5d85f3d966@linaro.org>
Date: Thu, 8 Sep 2022 09:56:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 11/11] RISC-V: Add initial support for T-Head C906 and
 C910 CPUs
Content-Language: en-US
To: =?UTF-8?Q?Christoph_M=c3=bcllner?= <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko.stuebner@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
 <20220906122243.1243354-12-christoph.muellner@vrull.eu>
 <9eba2b9e-ebe0-bf2d-2dc7-75ae81b0592e@linaro.org>
 <CAEg0e7jEh+ix32xGs+BdpCZOCT9YAFC_Lb5Ti-FQcFJiDtHmnQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAEg0e7jEh+ix32xGs+BdpCZOCT9YAFC_Lb5Ti-FQcFJiDtHmnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 08 Sep 2022 08:56:33 -0000

On 9/8/22 09:23, Christoph Müllner wrote:
> 
> 
> On Thu, Sep 8, 2022 at 9:46 AM Richard Henderson <richard.henderson@linaro.org 
> <mailto:richard.henderson@linaro.org>> wrote:
> 
>     On 9/6/22 13:22, Christoph Muellner wrote:
>      > +    DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,       rv64_thead_c906_cpu_init),
>      > +    DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C910,       rv64_thead_c906_cpu_init),
> 
>     Why model both if they're identical?
> 
> 
> I figured that users might expect that (existence of "thead-c906" and "thead-c910").
> And using "thead-c9xx" feels like it would be regretted in the future.
> 
> Should I drop "thead-c910"?

Quite possibly.  For Arm, we don't try to supply every cpu model, only those that differ 
in some substantial way.


r~

