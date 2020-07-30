Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k18D1-0000VV-5Q
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jul 2020 09:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k18Cz-0000TC-OM
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 09:02:53 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:46223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k18Cx-0002cZ-Bh
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 09:02:53 -0400
Received: by mail-pl1-x630.google.com with SMTP id k13so6231845plk.13
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2020 06:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K4d2aOJKk6Ll04KZGZoQftP8vTqPy7vZDuRH8215P1w=;
 b=i/bflV0DeUv5K2ha248pJYpK/A8f154R+X1Bfc6NuG6zo2/IlxhXQB52ATwL0I9cpr
 QqVc0EUKo+piGhvD2hjjOpPkurCdzT0Iw1B90+XZdOBzTVQEExTg7HwDXUDcOiu3AK1U
 0g7QyZ/Lz/4Xbm0izPMifAh95v+M4LCz53Tu3EvGF06mAfnYwXZSRU8DRNkOw63ChQS3
 Xq0T8UHZTtzLZ1MAmHxYHzFrRUVLLmthmrGYGLGHjGf8sT4i9B1BwrdxItbfS/PurbOl
 AycKKRn/iSE3PIqpRIU6xeBTwIwR6DN/YWF/mOHqglJ2vqnXo2M4JcuhtZBnOtdLHMlx
 ksVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K4d2aOJKk6Ll04KZGZoQftP8vTqPy7vZDuRH8215P1w=;
 b=SJpzbsGlNO3qtPnwjub2+5ydizC25/STwEVt0nvdUWvobvLhUacZyceDzSpWENXuNW
 dMRMi42m7kDdMUZLwuQesuuETXaxrSq0H1ZJ7GD3IawwJnYxyPZdFjkx98GehAwIfTKo
 ir3wuFWrlc/kvjXXhCFMD0npXdgamZJTWanFCvyZBxhegztio8vFSdmti54p3KsaXcel
 3IqNK2EKQT9bFibLBf9f+i5d7PQSGPSBYzAX2tOCt3PdVqzb81P5Ak0A8txredA559W3
 DqVR5BRdKagcRaa86E658Q4ZHTW8SytPzZWhKnxZ3f3KuTaKdiL2QEYSD1jtbxhtQM/+
 xusA==
X-Gm-Message-State: AOAM531MtpNBt/4nUqjph8QYR4jj5rLtJ0SL6IDvA1DDXL630ZrNVAdQ
 AJXM37V1xCreqmc2n3UTtgB9MA==
X-Google-Smtp-Source: ABdhPJyMyncnBvCURuro4TA36QA1DN4rVZV83S5hYelXvqOKzhVmtCXuUhXrWw/2Oju7+02v05Bfmg==
X-Received: by 2002:aa7:9705:: with SMTP id a5mr3249895pfg.3.1596114169696;
 Thu, 30 Jul 2020 06:02:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id io3sm5480076pjb.22.2020.07.30.06.02.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 06:02:49 -0700 (PDT)
Subject: Re: [RFC v2 31/76] target/riscv: rvv-0.9: floating-point classify
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-32-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e1181608-41f2-4f00-4c1f-b8f2aad0e0c9@linaro.org>
Date: Thu, 30 Jul 2020 06:02:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-32-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 30 Jul 2020 13:02:54 -0000

On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn32.decode | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

