Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jgwvJ-0000P8-3D
	for mharc-qemu-riscv@gnu.org; Thu, 04 Jun 2020 16:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgwvH-0000NK-2M
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2020 16:57:11 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:42091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgwvF-0003nU-AA
 for qemu-riscv@nongnu.org; Thu, 04 Jun 2020 16:57:10 -0400
Received: by mail-pf1-x441.google.com with SMTP id b5so3814234pfp.9
 for <qemu-riscv@nongnu.org>; Thu, 04 Jun 2020 13:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xaRytzTuAUe2NTVglXQORrGF77j+wdUxqEvCHUy8FPQ=;
 b=GkBt+yzv/XGjwqFz3mi2rXXdahdg1Q45E5lLI+yw2X1McBcdnk/jDVWJuPtSqNOQEq
 Qq8E0OnR76+Nd2qIBadQVnh9FMXqic2y+a4T2tcB7k3S3BtrjYMVeUuOo2f3F500pV4h
 sov5rRGlvzDEIcNsLWF39DeD289kYY34kQ4UwRY1D2RK8XGsm69Yyp0FuHfxDqxJ5Ckb
 HyHXlHdCHp5r//qf+Ins9ZkijbBKcfmvMGIg4AYm2yT9DL4cszG1sHdt1rY7hXIW4nck
 BU1cokagV3bApNcQobvoXEFZ8Cw6KGF29Jdur/V/qyR5sCArRtLgI8Jlw3KYRM+Z7fdZ
 51PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xaRytzTuAUe2NTVglXQORrGF77j+wdUxqEvCHUy8FPQ=;
 b=lToFN5s50APqV+camt+v3uPUVnoH+ZCRUZ7mlhJXJxaDfhEGlPq2Cbos7kGitbyeJO
 cPL02oMp+sBV9GTj8I9BVhks3D0IDrSQPwNk67Z8tzpIlDEln+9AmDn9foCBIqblKJOM
 NPfcKy+YUACT3JA8593z55pbgfziVSElo3CMVqvt8xts7qpM6VGBlupnjkm5OFFNXISy
 tfu2ZDdJsZbWXDKQmqYCTocnDvB8nt8+/RQaaMef8o4MQqFNr9r+f8iZPBkvuOL2u8tw
 /eMNhuAl7RwigKmcQPnhEX6o2aBRhFT7Y/56Qx91gFvkddQrhcuat6a208kpZKq0K0jx
 pFmg==
X-Gm-Message-State: AOAM532Xebe61lgyRsT1/+qXa/sebVYAKYlSt65RAdHOstQG91CM/QVQ
 NNUkiXAwnm5wL9w8I07u04G9+Q==
X-Google-Smtp-Source: ABdhPJxpkF9M4ixtQAFQVrxCvxW3DzjtRxb34CZpIm6rKyoxQ8BZFuNGDoeJ5lVJLOm/AW2bUEPZ+w==
X-Received: by 2002:a63:5245:: with SMTP id s5mr5971116pgl.394.1591304227456; 
 Thu, 04 Jun 2020 13:57:07 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id f3sm7392153pjw.57.2020.06.04.13.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2020 13:57:06 -0700 (PDT)
Subject: Re: [PATCH v8 42/62] target/riscv: vector floating-point merge
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com
References: <20200521094413.10425-1-zhiwei_liu@c-sky.com>
 <20200521094413.10425-43-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a5fa9607-3c3a-0b9e-be3d-53e024f8b923@linaro.org>
Date: Thu, 4 Jun 2020 13:57:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521094413.10425-43-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 04 Jun 2020 20:57:11 -0000

On 5/21/20 2:43 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/helper.h                   |  4 +++
>  target/riscv/insn32.decode              |  2 ++
>  target/riscv/insn_trans/trans_rvv.inc.c | 38 +++++++++++++++++++++++++
>  target/riscv/vector_helper.c            | 24 ++++++++++++++++
>  4 files changed, 68 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


