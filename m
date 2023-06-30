Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE5DEB64D7
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 17:47:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFIDN-00021N-H9; Fri, 30 Jun 2023 13:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qFIDM-00020l-3q
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 13:47:24 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qFIDK-0000Ya-Jm
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 13:47:23 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fbc63c307fso11155075e9.1
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 10:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688147240; x=1690739240;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JGsGkrqGNod1BNO9+owPNQEe9xA6x1Nqn0qBUwHGoEA=;
 b=fd8ZS0u4IzG/jcfW04fzdmRSRZhTAJg5xKhd1WPhkGHdv+2oruVJuWIhZ2bCONeVaB
 E3jmuqomMn56A7KuU1dPAaZpM/8IvJi4LGmEnyak/7a65CpIWfgRHSTpKzIMFFba2gB5
 ljEtBIE611WMXketY3mw1aHB6jwm5TFvpCUm5AZEtwa7nH0Xjhx6yY9RgJNZErhjPC6i
 cPUzYGEmH4Hq69b6XQr0IMRYxJ72nBA0Wi0MYeMVRI5Eb7xeu0R84uxxO2w/SfenIOgx
 nZ6mYG5z9x47BYCTD61nsVegtCnbVmA/lifjZC77EABnjoaGriEueE8ImaMRdp5TIUAp
 ui5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688147240; x=1690739240;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JGsGkrqGNod1BNO9+owPNQEe9xA6x1Nqn0qBUwHGoEA=;
 b=Zp+9Ps1gsikOvOw+foXhBJ9ArwpQCDTSGtHDD2Lw2ZCR+FhiefZw59rx6+FAtYQdJW
 UJ65laJcS/LLCzJUghkzzR/SH2ACP7a5wx4G27pMT4VtfeAOU7dorlKdRwfz0iZwOFS/
 NnD2yOMfniFHIMysn8HDJK+16J2ztDouW9nr8Lm1/Q9U4y+I/w9pLcRGawE81iSbN4pf
 jREmrhhm+kvCEmiywZkZ/mqSbLsEuWhSFZOMJPx6G+1XKVj2pXcB0B6chM5IKVfcY+Hk
 xyN5bQ5HTQF+rRubKVm1ZLvRDU0qg8tUNGHlSIQEh0ahv28w90y91DFkzIBtsN1T2gIc
 Vspg==
X-Gm-Message-State: AC+VfDxitauTbvlJ/VtYxmaACKLQdBdM8sp7FE2+GeZ02Q/w+KtJOeov
 wLGtbPZ0r+0uJEPvXXYnxcBy0w==
X-Google-Smtp-Source: ACHHUZ5yCVsaYhqOycOtQultnkyF8oArD1UeUeLMwNqdBWykGjqTqJbAhS5B56JcADJq0gT/1wIaEA==
X-Received: by 2002:a1c:4c12:0:b0:3fb:b1af:a455 with SMTP id
 z18-20020a1c4c12000000b003fbb1afa455mr2646201wmf.5.1688147240633; 
 Fri, 30 Jun 2023 10:47:20 -0700 (PDT)
Received: from [192.168.1.208] ([139.47.41.96])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a05600c1c0400b003fbb1ce274fsm9008266wms.0.2023.06.30.10.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jun 2023 10:47:20 -0700 (PDT)
Message-ID: <affadf63-7080-14ec-1b53-f7373cf06a68@linaro.org>
Date: Fri, 30 Jun 2023 19:47:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5] riscv: Add support for the Zfa extension
Content-Language: en-US
To: =?UTF-8?Q?Christoph_M=c3=bcllner?= <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Jeff Law <jeffreyalaw@gmail.com>, Tsukasa OI <research_trasio@irq.a4lg.com>,
 liweiwei@iscas.ac.cn, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Rob Bradford <rbradford@rivosinc.com>
References: <20230630115239.1920012-1-christoph.muellner@vrull.eu>
 <55279432-e4fe-7309-ac6f-5e2a4b86f47c@linaro.org>
 <CAEg0e7gsUNj=PmvvVDNTH+jc63sqrRBK_UiT0AEHMWGpYOjGfw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAEg0e7gsUNj=PmvvVDNTH+jc63sqrRBK_UiT0AEHMWGpYOjGfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/30/23 17:11, Christoph Müllner wrote:
> On Fri, Jun 30, 2023 at 4:03 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 6/30/23 13:52, Christoph Muellner wrote:
>>> +bool trans_fmvh_x_d(DisasContext *ctx, arg_fmvh_x_d *a)
>>> +{
>>> +    REQUIRE_FPU;
>>> +    REQUIRE_ZFA(ctx);
>>> +    REQUIRE_EXT(ctx, RVD);
>>> +    REQUIRE_32BIT(ctx);
>>> +
>>> +    TCGv dst = dest_gpr(ctx, a->rd);
>>> +    TCGv_i64 t1 = tcg_temp_new_i64();
>>> +
>>> +    tcg_gen_extract_i64(t1, cpu_fpr[a->rs1], 32, 32);
>>> +    tcg_gen_trunc_i64_tl(dst, t1);
>>> +    gen_set_gpr(ctx, a->rd, dst);
>>
>> I think you would prefer
>>
>>     tcg_gen_srai_tl(t1, cpu_fpr[rs1], 32);
> 
> sari_tl() will not work, because cpu_fpr[a->rs1] is a TCGv_i64.
> So I need to use sari_i64() and keep the trunc_i64_tl():
> 
>      TCGv dst = dest_gpr(ctx, a->rd);
>      TCGv_i64 t1 = tcg_temp_new_i64();
>      tcg_gen_sari_i64(dst, cpu_fpr[a->rs1], 32);
>      tcg_gen_trunc_i64_tl(dst, t1);
>      gen_set_gpr(ctx, a->rd, dst);

I beg your pardon, typo.  You have grasped my intent, thanks.


r~

