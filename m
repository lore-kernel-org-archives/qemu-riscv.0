Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098AFC4707C
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 22:45:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rOQHP-0000hs-GV; Fri, 12 Jan 2024 17:45:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rOQHO-0000hX-8p
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 17:45:34 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rOQHM-0004Of-FZ
 for qemu-riscv@nongnu.org; Fri, 12 Jan 2024 17:45:33 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-28b400f08a4so5786144a91.1
 for <qemu-riscv@nongnu.org>; Fri, 12 Jan 2024 14:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705099531; x=1705704331; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mjVocek/4APUMKGU1W7X2sTD3d4YNF0ORuHlQlujXO8=;
 b=PhfSLP1MVXekqRE44yKkfx+DZo3W+CjQ4sA8m6Jhy5k1RBUgkvGoNe+3mJ6SvzKJ0d
 MnyoGcRE1j1WTA+wn48FimSBg5+4MjiRblRLKxhBFMUxrDRozxzCtjAtlnQ08URVLecX
 w4vyGMGgdl9xO0NhamxL018bqv7MNZSMRA3S/YNNgNwa/2bpUyDpRgSLQH0Gn5NlrpT/
 wgYDPEIxbptwsDCfG6UyAbMEACTYmwgShhnniauz1G/i22XdfiD9USkgNCjaY1Ltsl2E
 PnLzywC+bZKmdv2ZZCTOkmGdlRg0Evh3JAL/cfuT2kRsyShFRSTIMOEqfRZ4OvWVmdUk
 W/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705099531; x=1705704331;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mjVocek/4APUMKGU1W7X2sTD3d4YNF0ORuHlQlujXO8=;
 b=J3htyOlI7rxwveP89FVQKpN9c3wJ4lt1b1q7k/3iy4lAOmgmgRAB0dea1wcjuTOqIg
 SdypmYG5L8SWfsXUnVJcYL8b5ZuJ16uMKehdSD4KS58WJ1ENP9jg74T1VhM4Gi14M0nT
 raWpteo/s7Z42B1xJzFphsRxBveueVN26940qs3ZsGFI4BMD/+iNabBcg1BjMCt8mvWs
 O9GKtwrgR6MpqSmHB5CGnDGoZ4PjITLiPl/kBBiph2sHAeEvL+zaJxnoxByDo/V16YG2
 vMfc7JA1tOk/f2QaRBb71A5Nv4IJQf+CgY6oQDSfSqjuaEmsrYwCQvMzmpGcnp4Yeahq
 BhFA==
X-Gm-Message-State: AOJu0Yz33sJKCG/vuts7/+l3hsXbGgORMDi/dmRFyr1E6S6258dH4LDM
 Du01lmmgbIP6K/4loTWJt2uXa46TqDDLUQ==
X-Google-Smtp-Source: AGHT+IFrehgOLMbed9uig3OTeGSjlPqjuMsCoQseTfnmiFR6sK8ZphVohd1A1KsFSDysEGZHH8pxGg==
X-Received: by 2002:a17:90b:1d06:b0:28c:acc4:ff98 with SMTP id
 on6-20020a17090b1d0600b0028cacc4ff98mr1876483pjb.40.1705099531050; 
 Fri, 12 Jan 2024 14:45:31 -0800 (PST)
Received: from ?IPV6:2001:8004:2728:2ad6:e985:c1c8:a4fc:508?
 ([2001:8004:2728:2ad6:e985:c1c8:a4fc:508])
 by smtp.gmail.com with ESMTPSA id
 nd15-20020a17090b4ccf00b0028e2827c8d1sm67927pjb.35.2024.01.12.14.45.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jan 2024 14:45:30 -0800 (PST)
Message-ID: <fd99b822-16e5-44be-b314-ed986291e877@linaro.org>
Date: Sat, 13 Jan 2024 09:45:22 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] target/riscv/insn_trans/trans_rvv.c.inc: use
 'vlenb' in MAXSZ()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 max.chou@sifive.com
References: <20240112213812.173521-1-dbarboza@ventanamicro.com>
 <20240112213812.173521-11-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240112213812.173521-11-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 1/13/24 08:38, Daniel Henrique Barboza wrote:
> MAXSZ() returns the value in bytes. Now that we have access to vlenb
> we don't need to compensate with a '-3' in the scale to use 'vlen'.
> 
> MAXSZ() now works as follows:
> 
> LMUL  lmul=scale  MAXSZ (vlenb >> -scale)
>    1       0       vlenb
>    2       1       vlenb << 1
>    4       2       vlenb << 2
>    8       3       vlenb << 3

Um, what?

>   static inline uint32_t MAXSZ(DisasContext *s)
>   {
> -    int scale = s->lmul - 3;
> -    return s->cfg_ptr->vlen >> -scale;
> +    return s->cfg_ptr->vlenb >> -s->lmul;

There's no left-shift here, either before or after.
Bug?


r~

