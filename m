Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kW0Lt-0006Ie-IO
	for mharc-qemu-riscv@gnu.org; Fri, 23 Oct 2020 12:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kW0Lr-0006Fe-PF
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2020 12:55:39 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:40125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kW0Lq-0004kT-4p
 for qemu-riscv@nongnu.org; Fri, 23 Oct 2020 12:55:39 -0400
Received: by mail-pg1-x52e.google.com with SMTP id x13so1700630pgp.7
 for <qemu-riscv@nongnu.org>; Fri, 23 Oct 2020 09:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gLvUfrphDwZ2K++jmWO2A1JJHtXH+x3MhJqdTjBYNjE=;
 b=VGICWJQlWWp4aPXV96ePhgji9wf6WSv/exuSyeqZq8zotPP86u6pevsdJjLeuvALKb
 X9IpeqIzVFnTE0K8VRdLNHpQKh3IzRvKm7dcW0yVJwXocywB+TsVs4dKYzH+tu2wkcA+
 w5egXZwGhdTGADTILUEQhA8fp0WDFjPTscZ59WiMahriQw9JqpyV8ZS8T9fkXVzsJGV3
 yKiR2j0UBuCKXCjo5/G9a/l6+0M87DssseR56J8V4nl+fTo1KHS+HQ3/xoxd55fmFZvl
 dkd2/1QnSTSdhmGX/pVSufut4fCgGOR/sNEBIVnKiwU4Pu0V8yo6EMKkImYew6fIInrS
 I1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gLvUfrphDwZ2K++jmWO2A1JJHtXH+x3MhJqdTjBYNjE=;
 b=ma5jubeFzOYoPzbhLjMEGs713idP5QQX5fCIAAgFPazI2BynLRgApwMvXlogQou7FT
 DC0QuAKfLLFHSxJ6iE/MBdP/t2RcgLIyPNxnQ0cByLCfUADfrhqnWoYfoNxN4PXspvzX
 26tnXwnC1qumotr+/ujP3DSJEQJlyqLVc8chlC7zwn4UuGQl7+lVNAPFt8lP9TCl6bJE
 EjPV9AMwLjdVpiOXpuWCJTBf13Gv20ctLcGCIpzlKgBh/1ii17p+vi40qa+dbGXetmcI
 OfNKuc9jRAudnxvNd3CC1WvScHM39WgpkkvMxadDXtXx7Y5dk/eNgKslrAOknPftvOcj
 hrnA==
X-Gm-Message-State: AOAM530vRnp6LyMuFjgthT/nLIVLQANxD74kNIiuBdQXrgvj8UqcMTt8
 yHII++OgL5r4uh+E/SFif4dZGA==
X-Google-Smtp-Source: ABdhPJx5dj7VAvfjFLTtUZiGdWTwELic4Aa4AoXUwALk33KYPtXzZHNhE+dh52CM0nchZPpds+WY6Q==
X-Received: by 2002:a62:644c:0:b029:155:fdf4:52ed with SMTP id
 y73-20020a62644c0000b0290155fdf452edmr97002pfb.9.1603472136259; 
 Fri, 23 Oct 2020 09:55:36 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id h21sm2459692pgi.88.2020.10.23.09.55.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Oct 2020 09:55:35 -0700 (PDT)
Subject: Re: [PATCH v1 16/16] target/riscv: Consolidate *statush registers
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1603467169.git.alistair.francis@wdc.com>
 <ce9e33fdd36df39878df6657ecdc10e42c629b85.1603467169.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8c6d868d-6ce1-0b8c-587b-f555f35a636e@linaro.org>
Date: Fri, 23 Oct 2020 09:55:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ce9e33fdd36df39878df6657ecdc10e42c629b85.1603467169.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.108,
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
X-List-Received-Date: Fri, 23 Oct 2020 16:55:40 -0000

On 10/23/20 8:33 AM, Alistair Francis wrote:
> +        qemu_fprintf(f, " %s %016lx\n", "vsstatus ", env->vsstatus);

You need PRIx64 here.


r~

