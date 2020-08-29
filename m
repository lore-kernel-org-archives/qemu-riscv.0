Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC6Yu-0006E4-Lw
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 15:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC6Ys-0006CF-A7
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 15:30:50 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC6Yq-00028e-Sv
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 15:30:50 -0400
Received: by mail-pl1-x635.google.com with SMTP id j11so1175882plk.9
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 12:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7DvoGmbV92m69LLpF0xRzt7J9AAKfT9XpUE3XyAFOno=;
 b=hBAsDJBmF5xA3UCiFf/8X//tyJBbIeIwnjBPzQHLC0XBiHMh0j74e1Uxe9nCrmrqss
 aChlIv1fjkxrezYzD3rKrh8oCAeLROoU7pb92ow03WrH2iwzxnPbsNuELSLunGziv3QR
 RM1SVlG38/3OG0d4wbQUXYb3u2ZfxiimPqrQaWQ58bzvJmyHM9AwecEGgW3bOp2b0aT7
 gFuWnAUKjotrh2lv2pImEHVrtju2KcJUdVjNNOo8jRnZ7CCz5e7i5T4cyKfbuIPBPERk
 LTmfyeN4pYdEVoDi3G5n3Hn0ujd08fcOJaYF551bOtDcochknkkTl6JuGRCaBZp0LMwR
 NR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7DvoGmbV92m69LLpF0xRzt7J9AAKfT9XpUE3XyAFOno=;
 b=bfTvn4T8ySakkVvC5sk6h68YwoC4fb+zBzK8SauODsppLewgRxHG7+f4N9blevWyTX
 D/0Hh+QldhsLCOF506RZ9ujS0zVLmeM+KzEf6prP38g2K4KXuDSvcEs7oDYsQjZ1CFyq
 b5PgxYXivf8wHEbwL/iw4BkNWyYimstYaXAHaWtj2J6wVCCe9hCtdI1W0s5g9UJZUciS
 GY1YqZR4mPCWcnoLro56CiLP5/y8xrplAoe5oe2Mk1oLdf2C14FCKelui2XV2OLoIDIo
 C6PFuiMWeVrYfKvqVGzMuplN2mKJfZcJhudGjm7cp7yv95YS/m0oyMYOBMTrZMI2ZEpM
 tyhg==
X-Gm-Message-State: AOAM532tvc1r6kR/zL44wfG8SQ4rcEh9grRVfYfgn6T34v9vZYQfxUya
 B5m8yNwernT35uVLLf7q4M+x+A==
X-Google-Smtp-Source: ABdhPJzSo2mjPb2Qpo+lrX5ths1i8jPmOxc1yExeJyQAUWeLUCmHpNXVsMazq3Gq6mU7tTg3GgHfkQ==
X-Received: by 2002:a17:90a:4382:: with SMTP id
 r2mr3942886pjg.144.1598729446632; 
 Sat, 29 Aug 2020 12:30:46 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id u21sm2752550pjn.27.2020.08.29.12.30.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 12:30:45 -0700 (PDT)
Subject: Re: [RFC v4 24/70] target/riscv: rvv-1.0: update vext_max_elems() for
 load/store insns
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-25-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8ebe55db-bd59-adf3-8ca7-e2cc2d1e9c3e@linaro.org>
Date: Sat, 29 Aug 2020 12:30:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-25-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-List-Received-Date: Sat, 29 Aug 2020 19:30:50 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> +static uint8_t vext_get_emul(DisasContext *s, uint8_t eew)
> +{
> +    int8_t emul = ctzl(eew) - (s->sew + 3) + s->lmul;
> +    return emul < 0 ? 0 : emul;
> +}

Same comment about EEW being encoded as MemOp to match SEW.


r~

