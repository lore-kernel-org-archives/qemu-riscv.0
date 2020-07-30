Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k18CT-0008GJ-SB
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jul 2020 09:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k18CS-0008Ek-9J
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 09:02:20 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:37685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k18CP-0002Yu-Sk
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 09:02:19 -0400
Received: by mail-pj1-x102d.google.com with SMTP id lx9so4442579pjb.2
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2020 06:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K4d2aOJKk6Ll04KZGZoQftP8vTqPy7vZDuRH8215P1w=;
 b=GJOliML5Tv9eIfD7EYPXETQw2Pv5NOY7D8wrFOKXxGgQhOuGzwXqUGvcGSiS9LH/AS
 RfSqDgipMAzeNT75qKMHKC2vDmWNOuuk8Kn8A7nYPyV06IA0JpQvCDLP7UEtejrghMCh
 SaLm279QmBZjDRQjX43Fidowkto3qUz7SHwXFSP/pt4n7v1+6gxiGZ/4KFLEO4vokTxc
 c1TW7aBxSzXTU8/V+vmjBcNuNbWAvyd1oux5O9Mh/p0C1yov+iBHqT9Hpxb+NZwjyR7I
 +T8/o5lCjQ2elanbttjkVzKPiOP/gy2NJDIMh6Zy6vqCqI8iWsXYCA1UqbcmkREyfLfM
 Yh4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K4d2aOJKk6Ll04KZGZoQftP8vTqPy7vZDuRH8215P1w=;
 b=mD+zDRzj6gMsywSKF3e85rY37pP70qlPOVQfjMDC/6Fv3FlaQxSPiMzn0XPEiv2bzm
 WfvQh1wPj+h3g5UcliMDBi6illYwK77LSi+yCbMjaprkiLrC6lqnpLYAcH0JO1CnX6l2
 DZIa9BNIU202hkBZS0jrGv5N3Zs2FDI+4Ewsri6UjOGnRO8U4hjKVGt0/zCESA+WThgb
 rMmuyxLwExON/QdWGbEENr4PSknX3YOGXPnJoh054MSglbKuBiNmdb1w9cnxzMIp6+ju
 WSMBKbmFmtXpDFje1tHYL6lh4DJ6sG6Ku+G6Yf9g0Py6QW9O6+0BQfDzM8j4YvGo5prP
 BlJQ==
X-Gm-Message-State: AOAM5334f5IJnsV6rsW9QsFUV9/RPjxG6N6p4CAl2BUM74L/lU2vJ1yI
 VYfpqKs5VskNldZXrKPbc72DdQ==
X-Google-Smtp-Source: ABdhPJzJfJZUwOqxMDWwlZ4ojBT+L4Eeik5zv8M3nYXfF8T0HZz9KNG5TA80mqSdP0UPAnKfIrH5NQ==
X-Received: by 2002:a17:90a:d56:: with SMTP id 22mr3190813pju.58.1596114136058; 
 Thu, 30 Jul 2020 06:02:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id g10sm5908822pfr.164.2020.07.30.06.02.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 06:02:15 -0700 (PDT)
Subject: Re: [RFC v2 30/76] target/riscv: rvv-0.9: floating-point square-root
 instruction
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-31-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <36462872-e635-91a3-9e13-cc82b36a2bf3@linaro.org>
Date: Thu, 30 Jul 2020 06:02:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-31-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 30 Jul 2020 13:02:20 -0000

On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn32.decode | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

