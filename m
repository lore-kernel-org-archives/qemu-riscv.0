Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kONm1-0005A9-IK
	for mharc-qemu-riscv@gnu.org; Fri, 02 Oct 2020 12:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kONlz-00059V-Si
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2020 12:19:07 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:44483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kONlu-00027S-V9
 for qemu-riscv@nongnu.org; Fri, 02 Oct 2020 12:19:07 -0400
Received: by mail-oi1-x22f.google.com with SMTP id 185so1712302oie.11
 for <qemu-riscv@nongnu.org>; Fri, 02 Oct 2020 09:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cNTCaVO+Ra9w8X6diLaNziEiZwEGY2NwItFhZ756WtQ=;
 b=Tyy+BxJcAnKW/ref9hXnqFvAVj1mKKvUcxB2RA+2Z6B4iK3BDiqvqErMQuX+/+4nSV
 8Bj1fPUPHst+NELda2hOeu/sg+UHwSSCkXSXm6IA3VgzUdi2W4DeF7+tC4vmGaeDmQgo
 NbQvhWfdJoCQ/ZZ9p7+ec+f8HcS6cTESh2+1V3XtS7VtsPQ6gJzNtymUh0WTZXK7pSwC
 btMRUn/57eRw2iSPA3SWISMlssWIE/CjtwqWcHdCG9GZukcDVULm7TzugQQ3I1bKofwZ
 lGLNP1o4BlSq4AzKzo62SLoBuRBzRfeBepKUaOYbWkToRLmJJgcdGT+OGscX9JYllAJq
 aHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cNTCaVO+Ra9w8X6diLaNziEiZwEGY2NwItFhZ756WtQ=;
 b=SnfkkGGkE3gQCAkeEFIMydKxmo44JCW2I1ks8kYRLW1K7m2zDukAXF4CihZXNUnHGY
 c6wclyh4oKynn2DD7EJO+Qnc11kdCe82o51OCZQ60gCo9DLkzBvU7DMe47PKdcfF9mvX
 nGL67LE5A1Qh4f3G9LzoINWILu/EAaFWeIj7+gHBeAhp9+qa6vf1t/3JV2iCT7Yq7dxB
 j6cJLyqxZ2oq9H8sY7wheNBk4q7RP5Z1tyCm1rVescLf15VcydnA98YGQppw0SieH5+d
 uBHxgV6PivVJAm1m8RC+YCfDl61EVHk79LXPFRQDN/nAkr4mcVb6Z+tegDlw5mypX2QX
 +wIQ==
X-Gm-Message-State: AOAM533JyhclD8HrEj+QvJcq3A7YxxTkOmgsX7ejVt/9mcvRIhkHOzk1
 hyPaZcq/jLoWI+IFamWpcpIgoA==
X-Google-Smtp-Source: ABdhPJzLNGPkhKwO2po9hkILRyEBjcKTKnd+7RfN2QMOC2/e0IilIuaWfMmja5I/x3ch4B6GOmhlWg==
X-Received: by 2002:aca:d48e:: with SMTP id l136mr1307178oig.142.1601655540738; 
 Fri, 02 Oct 2020 09:19:00 -0700 (PDT)
Received: from [10.10.73.179] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id e17sm519983oou.24.2020.10.02.09.18.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 09:18:59 -0700 (PDT)
Subject: Re: [RFC v5 06/68] target/riscv: rvv-1.0: add translation-time vector
 context status
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: LIU Zhiwei <zhiwei_liu@c-sky.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200929190448.31116-1-frank.chang@sifive.com>
 <20200929190448.31116-7-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ad28385b-3e36-e33a-03c2-dabaaaea80bc@linaro.org>
Date: Fri, 2 Oct 2020 11:18:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200929190448.31116-7-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.256,
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
X-List-Received-Date: Fri, 02 Oct 2020 16:19:08 -0000

On 9/29/20 2:03 PM, frank.chang@sifive.com wrote:
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -41,6 +41,7 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl *a)
>      gen_get_gpr(s2, a->rs2);
>      gen_helper_vsetvl(dst, cpu_env, s1, s2);
>      gen_set_gpr(a->rd, dst);
> +    mark_vs_dirty(ctx);
>      tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
>      lookup_and_goto_ptr(ctx);
>      ctx->base.is_jmp = DISAS_NORETURN;
> @@ -72,7 +73,7 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vsetvli *a)
>      }
>      gen_helper_vsetvl(dst, cpu_env, s1, s2);
>      gen_set_gpr(a->rd, dst);
> -    gen_goto_tb(ctx, 0, ctx->pc_succ_insn);
> +    mark_vs_dirty(ctx);

Removing the gen_goto_tb can't be right all by itself.

I think you want to be sharing the code between vsetvl and vsetvli now.  Just
pass in a TCGv value to a common helper.


r~

