Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPR2B-00033x-RP
	for mharc-qemu-riscv@gnu.org; Mon, 05 Oct 2020 10:00:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kPR29-0002zy-TB
 for qemu-riscv@nongnu.org; Mon, 05 Oct 2020 10:00:09 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:34254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kPR27-0000rJ-2n
 for qemu-riscv@nongnu.org; Mon, 05 Oct 2020 10:00:09 -0400
Received: by mail-ot1-x32a.google.com with SMTP id d28so2406446ote.1
 for <qemu-riscv@nongnu.org>; Mon, 05 Oct 2020 07:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mp4z0rSmsXlN+OOt21MS8v4a21HEfCBoRgQTLy+F3jw=;
 b=aw/jiLU7mCW1tuWfyenb5QIjqzegQrwyKBNaa/9PZSwTHfXIvrSTpFG5uT+KGoHBIK
 wMV6mmu75LWOtcOqwbO20v0FAJjtrVI+1XIIll05ellCA9JWN0PlKytxgnPCPREF+snw
 ppBo6Dy0TZJ2aftUVMJKLNSy6f5vhLSFmXtaoKRphOMqOybgZmn9+UekHY6nohmmj5Ke
 haCxnKGioWUBz3DG6NiBUTC3wxMikI1iAR82F/Ko4GR2LcrgD11fM9mptq6/DHJVtfa6
 E6EvGd25tBwZaFWoYlEQM1i4lGTkOd353NMrvz5GuZce1Har37ydJ0nhStI9DZ1HaUYH
 ETmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mp4z0rSmsXlN+OOt21MS8v4a21HEfCBoRgQTLy+F3jw=;
 b=l54LR093Hf2iwzF55z84c+bB9JkaClbp+q3W68EjDqK6l0AEBNvOSz2c9juVWhc0WD
 zF1u+7T3eaG+JXhu0qIkWe1paxaWBKv8cdXc/FDQ6BoK7hyXEfncJj+s4DolzKhRKC4t
 A3+mQiH9TunMQYHpOudph1a5foOtHPqjvjxfz+BvstkcysN8MZp12CtZUbiHR5vvD/cA
 3uOULRBNRpSyr3RTVxyQPhYTnNND1QCzkdfNy7pHcL5EiFS3kqTd7vgsYiCKCmjHP4CM
 DL9FRZ7U/VzXPe9JpvGv1sLK8rZe0HKxUg4eJCN8pi+xTpB5hxygSMpnfszuxuda9G3E
 Ifig==
X-Gm-Message-State: AOAM533hsaIhLRq+jPtCMFsaLd9t7ZptifhV0JzgSo89wirdVJUPnqwM
 X4OK+AxcRnEuhtrmTFdJaItA/g==
X-Google-Smtp-Source: ABdhPJzVlba0SQcC2gmuHyZFMcNcAPcfy7uxH1q1nx4vF3nl3RedUdhQN+M/rdNMsuI4hzpqRbFXJg==
X-Received: by 2002:a9d:6c19:: with SMTP id f25mr12059193otq.25.1601906405482; 
 Mon, 05 Oct 2020 07:00:05 -0700 (PDT)
Received: from [10.10.73.179] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id p8sm8488oot.29.2020.10.05.07.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2020 07:00:04 -0700 (PDT)
Subject: Re: [RFC v5 06/68] target/riscv: rvv-1.0: add translation-time vector
 context status
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, LIU Zhiwei
 <zhiwei_liu@c-sky.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200929190448.31116-1-frank.chang@sifive.com>
 <20200929190448.31116-7-frank.chang@sifive.com>
 <ad28385b-3e36-e33a-03c2-dabaaaea80bc@linaro.org>
 <CAE_xrPgK0ROiWo+Evan9uGFoBo8t0hV8vt0A2DxDb_Sws55-Ng@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <246985bc-98ff-0975-20d4-66c5864abc63@linaro.org>
Date: Mon, 5 Oct 2020 09:00:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAE_xrPgK0ROiWo+Evan9uGFoBo8t0hV8vt0A2DxDb_Sws55-Ng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Mon, 05 Oct 2020 14:00:10 -0000

On 10/5/20 2:12 AM, Frank Chang wrote:
>     I think you want to be sharing the code between vsetvl and vsetvli now.  Just
>     pass in a TCGv value to a common helper.
> 
> 
> The only difference now between vsetvl and vsetvli is the format of zimm and s2
> fields.
> But they have different formats and are queried by different functions,
> i.e. s2 = tcg_const_tl(a->zimm); and gen_get_gpr(s2, a->rs2);
> 
> Is there any elegant way to retrieve the values of zimm and s2 by shared common
> codes?

Yes, like I (too briefly) described:

static bool do_vsetvl(DisasContext *ctx,
                      int rd, int rs1, TCGv s2)
{
    // existing contents of trans_vsetvl
    // do continue to free s2.
}

static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
{
    TCGv s2 = tcg_temp_new();
    gen_get_gpr(s2, a->rs2);
    return do_vsetvl(ctx, a->rd, a->rs1, s2);
}

static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
{
    TCGv s2 = tcg_const_tl(a->zimm);
    return do_vsetvl(ctx, a->rd, a->rs1, s2);
}


r~

