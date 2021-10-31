Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mh1r5-0002gF-3D
	for mharc-qemu-riscv@gnu.org; Sat, 30 Oct 2021 23:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mh1r4-0002g0-88
 for qemu-riscv@nongnu.org; Sat, 30 Oct 2021 23:49:58 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:43765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mh1r2-0000nk-II
 for qemu-riscv@nongnu.org; Sat, 30 Oct 2021 23:49:57 -0400
Received: by mail-pl1-x62e.google.com with SMTP id y1so9418345plk.10
 for <qemu-riscv@nongnu.org>; Sat, 30 Oct 2021 20:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LV1EV386wCgTKUIynW8u1uCqegoQEAbVe3YXsXXYPIs=;
 b=rpN4DntsLecfptEaWBBGbb/7+QX1r+ofqnLsuICz0el1aiqOVPS0AF4PKShMe5SoM0
 Sl7c4Ec0nB164OB9J2jRf6g+gWCF2CAILWZygqI5MOUDI7N3F9pmXEdAdPkvYIuj2ptL
 FM3sYRfo1LfjiLIxPbwCVbpqfkjCtWAQj+FD82XJX6FRofP6l48hvZE16Rsl3pf167jE
 CoMkD+6n9bVMNkLReWCtQC8DYpt5EGDMfqcwDlpDKNN6VaMk/upERpmLE3iuu93ZR8qM
 rlTEG+ONqo3DrKKbGZavoRyWDfCXjbTmJx8VJQfuxIdEZocWNaOJUyLf3X8uz88KboKw
 s7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LV1EV386wCgTKUIynW8u1uCqegoQEAbVe3YXsXXYPIs=;
 b=jPP21Qwy00oeuaCxlgiedAmCHy9nstv7amXC792GkpUsO1hajTTLXSR6ZjoPG35IaN
 lav60QdLlT91Xf+rkdUd9q1APpnrNsEz2YdjyhPcDdDQTNNuDsXd67iMEbETeRDfez/L
 FyHD+XGEFf3l/hBhT1mP0Ah81pOLhZdvbcRq7k5ScrAKxhIqgxBy/WEcnhl/tOmXP/IN
 hpEIsP47rOCTGgZM/rMMU4yJVzmr0G49Rerxjgc7Hn/1noSE4seSfSgOaaSVil1b+Bf6
 J0oewFFSJ1v48QGBeD6BnTgGc+GjVejU5AFM5uAwQfQqG8cZ2Ok/aY02COrNfG7hIsa9
 juiw==
X-Gm-Message-State: AOAM530WSc4KfgGmU9W+cIUWDND/6Ya31ffTJzVmJw3U3eIIIjxMNQZ3
 CDPI2x9r53qhYdCF9MJI2p0tLg==
X-Google-Smtp-Source: ABdhPJyi48QOOQtixmCUgYj96jykHlUQz5DSYMBB1NV67Oxi5goYccT3C3Fxyg08LDIlF0XGasgqPQ==
X-Received: by 2002:a17:90b:4d8c:: with SMTP id
 oj12mr1283921pjb.100.1635652194974; 
 Sat, 30 Oct 2021 20:49:54 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k1sm9674925pjj.54.2021.10.30.20.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 20:49:54 -0700 (PDT)
Subject: Re: [PATCH v4 10/17] target/riscv: support for 128-bit U-type
 instructions
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, philmd@redhat.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211025122818.168890-11-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7e8c2cd4-5000-e1b1-eefc-4e7ce1d5bb7b@linaro.org>
Date: Sat, 30 Oct 2021 20:49:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025122818.168890-11-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.426,
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
X-List-Received-Date: Sun, 31 Oct 2021 03:49:58 -0000

On 10/25/21 5:28 AM, Frédéric Pétrot wrote:
> +static void gen_set_gpri(DisasContext *ctx, int reg_num, target_long imm)
> +{
> +    if (reg_num != 0) {
> +        switch (get_ol(ctx)) {
> +        case MXL_RV32:
> +            tcg_gen_movi_tl(cpu_gpr[reg_num], imm);
> +            tcg_gen_ext32s_tl(cpu_gpr[reg_num], cpu_gpr[reg_num]);

tcg_gen_movi_tl(gpr, (int32_t)imm);

No extra ext32s required.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

