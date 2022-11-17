Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ovlxM-0007th-A4
	for mharc-qemu-riscv@gnu.org; Thu, 17 Nov 2022 15:57:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovlxJ-0007rb-0f
 for qemu-riscv@nongnu.org; Thu, 17 Nov 2022 15:57:54 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovlxG-0003xc-3x
 for qemu-riscv@nongnu.org; Thu, 17 Nov 2022 15:57:52 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 w15-20020a17090a380f00b0021873113cb4so2714333pjb.0
 for <qemu-riscv@nongnu.org>; Thu, 17 Nov 2022 12:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=go1K1RVGR3nm0jskwu+UkFH+EkorvBIaec/8luqC+LE=;
 b=LddtsM3far7T1fFDT2TO4F4EeTgUX243zqgt8Qx0vWFwHVfgS0COqmv9rBSinVZaEq
 gqKDbyvkUUS5k6ATtQHdgl5cElxLqb8686O++sOjiGCz6flLabsmdaPI/3uvjorteVP3
 tagnNm8ngX99DjohedrF1SXh6k34Rb0jjuaJZpfTsHkmQkt4LooEBR+/1kq1OTCWjJUb
 CwbH3jTE5q8K5CKunhmPkCA2DuMp0HQW3ysG9QCwzeS2v1Gc7/kaTnZ8RuBuuxT5PTDh
 J5TNuzrkA6XwhZSYNyy2gaqFooInVGAmxF6JKIMmTykRTuTMb7w9lhYFqDecbd3pMfcu
 u9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=go1K1RVGR3nm0jskwu+UkFH+EkorvBIaec/8luqC+LE=;
 b=CyGEqtIEawxKMh0CBDsy5Jp+rlJKd2ndh3glQQDLyV+WHoJrl1xtdZXhUlW6GN+lqE
 koD81zI45IGu2KaOboKeryHFOzeOl9PylCW4rK4tLEpPE8mNgGZ59fbDX2hRUm5pO3gf
 iTiiwdbcV488NNkHnJItkAec63g6t2JJvB1EiBUw87ZDcep5sYo/f+9ZNOiIt+JDlcx/
 YxXCxPfeYh3Sw0ZZPwv7vBjybZ2Yt+0hpMKsBuIzxRNBD2CCZG5nDifA5S48o6687WGt
 Zt8VttwmZzEevD1kILErVhw1WrQVsz8/FMHRnJTxv37uDrWyk7u5cGwPXtAzOys9Jm6B
 XCeA==
X-Gm-Message-State: ANoB5pkqEfhBkVlOcaFNtjTiEsKE+TYDHaxPjSs2EQbb3LHD+R4l4Hv0
 LS2dRCpfAywzBl2mw+rEz2U04w==
X-Google-Smtp-Source: AA0mqf4A74Od+oCCtPyNZqrARdqKsVvfX/qfo13/1Z7674InutG3WF73l1DlOcxAwtD/64o+LhGAIg==
X-Received: by 2002:a17:902:76c9:b0:188:ec14:e3a3 with SMTP id
 j9-20020a17090276c900b00188ec14e3a3mr4303594plt.154.1668718668281; 
 Thu, 17 Nov 2022 12:57:48 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:567c:a930:2f6c:4a41?
 ([2602:47:d48a:1201:567c:a930:2f6c:4a41])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a63ee4e000000b004768ce9e4fasm1452882pgk.59.2022.11.17.12.57.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 12:57:47 -0800 (PST)
Message-ID: <6e529a49-9f1f-d561-e494-de62a0970a0f@linaro.org>
Date: Thu, 17 Nov 2022 12:57:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 7/9] target/riscv: add support for Zcmt extension
Content-Language: en-US
To: weiwei <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, mchitale@ventanamicro.com
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20221117070316.58447-1-liweiwei@iscas.ac.cn>
 <20221117070316.58447-8-liweiwei@iscas.ac.cn>
 <da87af96-b8e0-d6d1-02d3-a4d3afe8edf0@linaro.org>
 <c117741e-f804-6796-796d-da9cf73dfe8a@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c117741e-f804-6796-796d-da9cf73dfe8a@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 17 Nov 2022 20:57:54 -0000

On 11/17/22 03:44, weiwei wrote:
>> Missing a smstateen_check.  Not mentioned in the instruction description itself, but it 
>> is within the State Enable section of JVT.
> 
> smstateen_check have been added in REQUIRE_ZCMT.


Oh. I see.  That's wrong, I think.

Returning false from trans_* means "no match" and continue on to try and match another 
pattern.  If Zcmt is present in the cpu, but the extension is not enabled by the OS, we 
have found the matching insn and should not look for another insn.

You need to separate the check like

     REQUIRE_ZCMT(ctx);

     if (!smstateen_check(ctx, 0, SMTATEEN0_JVT)) {
         gen_exception_illegal(ctx);
         return true;
     }

I see that the fpcr code that you're modifying in this patch, which is not yet upstream, 
is also incorrect in this.

Looking back through your git history,

   https://github.com/plctlab/plct-qemu/commit/09668167880c492f88b74d0a921053ed25fc3b5c

is incorrect:

> static inline bool smstateen_fcsr_check(DisasContext *ctx, int index)
> {
>     CPUState *cpu = ctx->cs;
>     CPURISCVState *env = cpu->env_ptr;
>     uint64_t stateen = env->mstateen[index];

You cannot read from env during translation like this.

Everything that you use for translation must be encoded in tb->flags.  Otherwise the state 
will not be considered when selecting an existing TranslationBlock to execute, and the 
next execution through this instruction will not have the *current* state of env.

You probably get lucky with mstateen, because I could imagine that it gets set once while 
the OS is booting and is never changed again.  If true, then mstateen chould be treated 
like misa and flush all translations on write: see write_misa().  And also add a large 
comment to smstateen_check() explaining why the read from env is correct.

But if that "set once" assumption is not true, and mstateen is more like mstatus.fs, where 
a given extension is enabled/disabled often for lazy migration of state, then you won't 
want to continually flush translations.


r~

