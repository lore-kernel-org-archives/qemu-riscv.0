Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kC5vo-0002LU-AL
	for mharc-qemu-riscv@gnu.org; Sat, 29 Aug 2020 14:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC5vl-0002KH-7X
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 14:50:25 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:34487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kC5vh-0006J1-MN
 for qemu-riscv@nongnu.org; Sat, 29 Aug 2020 14:50:24 -0400
Received: by mail-pl1-x633.google.com with SMTP id v16so1171249plo.1
 for <qemu-riscv@nongnu.org>; Sat, 29 Aug 2020 11:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VCZOcskORWKnMglI/hHMrkHWQr5rJTv1J15iAIy58Z0=;
 b=a9zoILvSJ1NDqFbWM4u5YfSdfe3HiTwLPllhyziuUqDdmoO8kd3lTgna0zSKjhh9jP
 ljIQgzfVphIWNrV814tcjcTmohcrd4/uDLMgpMA/ycxSh5p7fDP9EZU00nPNcmt5FELk
 r1URXZKN46GFn4thrQ6z2ZplHsuivQHjt00rA5FNMr1EalqTTgY204oLmwE/o0X9zATw
 IQjPfMAvYF4cpRRFW6Qp/IfD2B/rSy9sfKYuxFFVWOotBM+A+fWMlvWalQdehIm86Pym
 uDOGl+vSOPXlrPg9kdWTyM6jKcXTP0rBbE0gKiUDVBjrk9indUDNs+UlJy5kgRefKnHc
 OH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VCZOcskORWKnMglI/hHMrkHWQr5rJTv1J15iAIy58Z0=;
 b=BjE9sP/Pl1FtSp2NJYF8s0y9HNBbD1CYN4U6Jhm1/tNoNXelF2Jl6rTtexiF6VpOOb
 e1G9yVF0wKpvTYo8BEG/xaXcCvS2cZEH/Ul1mRI6bj8ummOUZVF3k3RUcy9GzhsBrUq5
 8C5SiPWWdZmsBY3bR3vOlyNdVGJ0rpTrROWHvoVSl5YDJC7cmYDxipzu6y0cr1Q9e4HN
 W1okAfgOjdxFWjyE0Hehc7Yw6EhJnX3FlTRD4CvnGalmvJ4r2bbd79/neWKmlHaExQnl
 rSdBJ34A/0ujPIrux+1tZ+anfsqfJxkhgV2L6L1jtjksEiAxuGHGToXrbuU4sjjJ0eVF
 wDrA==
X-Gm-Message-State: AOAM530HyLIobBYWrj2bUbZT0vvfyJgSu+6Vo9DPk57N7USzepNKmSPM
 rEMdasnau99SaaNjeFWUQJU3kw==
X-Google-Smtp-Source: ABdhPJwrOgqc/Ql5VQoDDTOGUOhIKitbSIC7oe/dIV2K219/gCO0J7/wKjLYtymmVbWSEpoNdmNrRg==
X-Received: by 2002:a17:90b:4acd:: with SMTP id
 mh13mr4056856pjb.147.1598727020062; 
 Sat, 29 Aug 2020 11:50:20 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id l20sm3659353pfc.72.2020.08.29.11.50.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 11:50:19 -0700 (PDT)
Subject: Re: [RFC v4 22/70] target/riscv: rvv-1.0: amo operations
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-23-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <30dcedd1-84e3-70c4-7b8b-d985608b81c5@linaro.org>
Date: Sat, 29 Aug 2020 11:50:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-23-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
X-List-Received-Date: Sat, 29 Aug 2020 18:50:25 -0000

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> +static bool vext_check_amo(DisasContext *s, int vd, int vs2,
> +                           int wd, int vm, uint8_t eew)
> +{
> +    int8_t emul = ctzl(eew) - (s->sew + 3) + s->lmul;
> +    bool ret = has_ext(s, RVA) &&
> +               (1 << s->sew >= 4) &&
> +               (1 << s->sew <= sizeof(target_ulong)) &&
> +               (eew <= (sizeof(target_ulong) << 3))  &&
> +               require_align(vd, 1 << s->lmul) &&
> +               require_align(vs2, 1 << emul) &&
> +               (emul >= -3 && emul <= 3);
> +    if (wd) {
> +        ret &= require_vm(vm, vd);
> +        if (eew > (1 << (s->sew + 3))) {
> +            if (vd != vs2) {
> +                ret &= require_noover(vd, 1 << s->lmul, vs2, 1 << emul);
> +            }
> +        } else if (eew < (1 << (s->sew + 3))) {
> +            if (emul < 0) {
> +                ret &= require_noover(vd, 1 << s->lmul, vs2, 1 << emul);
> +            } else {
> +                ret &= require_noover_widen(vd, 1 << s->lmul, vs2, 1 << emul);
> +            }
> +        }
> +    }
> +    return ret;
> +}

Same comments for EEW and require_noover.

r~

