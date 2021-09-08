Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mNrNZ-00043C-FZ
	for mharc-qemu-riscv@gnu.org; Wed, 08 Sep 2021 02:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mNrNX-0003xf-1v
 for qemu-riscv@nongnu.org; Wed, 08 Sep 2021 02:48:15 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:47068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mNrNU-0006oX-Qb
 for qemu-riscv@nongnu.org; Wed, 08 Sep 2021 02:48:14 -0400
Received: by mail-ej1-x634.google.com with SMTP id u14so1982255ejf.13
 for <qemu-riscv@nongnu.org>; Tue, 07 Sep 2021 23:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WdWeSCpL3Se3zzPnymrHC57lDrWi3e46smGEt9Njtow=;
 b=Jzbapr1+o9lsNeI0IQ+8iGLtbmVTbFWEfb06+lFr0ibQGb8E5lpkHKcOnSA5B7trqT
 hD1tPjnzvsu0I8IeDw6zU8O8kh9SZzAu87160WyvYBlmvVVyfT/SQ/SzpKklfBpBY337
 /MKrcbFr1/2/vKGR5GAMPBUxsKn1tpRZT+LiTQgEMCHaDT6PWbB+qFV9CZxxWjCGHNsX
 1CP/dMMfW4mPcd3CyL8/BOeD3Tvhn0QeU1070YK6L87vWRUVyHphqv3yU+QxOdgMrC73
 w1Pf8B58tRPNDVT+krPr7WpEBy3uMJyyyF7sG4CrF61g1Ak8jn+SYFLD/51GCZhKjV0f
 vAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WdWeSCpL3Se3zzPnymrHC57lDrWi3e46smGEt9Njtow=;
 b=a1bN8DfyNLCoa98H+A6+Y6vaUvygHhVEOayTn3hcIoe4MgaVFsQ4uMw4sMN6j7+7yn
 nXXDIQgQzIqxSzulialG0AAhxaHxezFukxZuclsMNmnc+XSfzlT/9LPbvFlnWdvOAk1s
 +SP5k4vzrJpNffD9CHso+DEkGXFW1wnPvQ8vss21ltorymyViNY3mBLunfpApPHFR4oh
 F7u4fAdku9KWr2gnXcoqt+sEpj3USyYmynMDX+nBRrjuaATiBD+vR0JW0j+UqNSAva1Q
 HFy8+MsGrOW4KR9DSK2DMcHGPrJ+fLipAo+P1WvUwIwuwshzszcnGkP/tlZQzBVt2DKE
 8kEA==
X-Gm-Message-State: AOAM532iDOImDj+L5cjcbGNw3KCVbW5/uoz9oi7YeMU3gxz67kUEUnQw
 gDEoMMFSh6YOaCvtBHcBaRSL1g==
X-Google-Smtp-Source: ABdhPJzCXXXhKIx1B/L0E1Q4yRlyTrGmQsImMhI6lpohqtFsfDVwrHff0KU/i9h9/pHntWl0Oq4IwA==
X-Received: by 2002:a17:906:63ca:: with SMTP id
 u10mr2439928ejk.411.1631083690391; 
 Tue, 07 Sep 2021 23:48:10 -0700 (PDT)
Received: from [192.168.127.34] ([185.81.138.20])
 by smtp.gmail.com with ESMTPSA id ly7sm464670ejb.109.2021.09.07.23.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 23:48:08 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] target/riscv: Implement the stval/mtval illegal
 instruction
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
References: <cover.1631076834.git.alistair.francis@wdc.com>
 <6809670a315a07e7e6b435cf7942f82bdd8b99d6.1631076834.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <538d9688-0f2f-c406-50a5-d962e3ce2963@linaro.org>
Date: Wed, 8 Sep 2021 08:48:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6809670a315a07e7e6b435cf7942f82bdd8b99d6.1631076834.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332,
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
X-List-Received-Date: Wed, 08 Sep 2021 06:48:15 -0000

On 9/8/21 6:54 AM, Alistair Francis wrote:
> @@ -967,6 +967,16 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>               write_tval  = true;
>               tval = env->badaddr;
>               break;
> +        case RISCV_EXCP_ILLEGAL_INST:
> +            if (riscv_feature(env, RISCV_FEATURE_MTVAL_INST)) {
> +                /*
> +                 * The stval/mtval register can optionally also be used to
> +                 * return the faulting instruction bits on an illegal
> +                 * instruction exception.
> +                 */
> +                tval = env->bins;
> +            }
> +            break;

I'll note that write_tval should probably be renamed, and/or eliminated, because it looks 
like it's incorrectly unset here.  If you move the adjustment to cause above this switch, 
then you can move the RVH code that needed write_tval into this switch (just the 
HSTATUS_GVA update?).

But... more specific to this case.  Prior to this, was the exception handler allowed to 
assume anything about the contents of stval?  Should the value have been zero?  Would it 
be wrong to write to stval unconditionally?  How does the guest OS know that it can rely 
on stval being set?

I simply wonder whether it's worthwhile to add the feature and feature test.


r~

