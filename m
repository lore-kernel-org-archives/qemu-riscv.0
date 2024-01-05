Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E63C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 18:07:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rLoba-0001nu-IX; Fri, 05 Jan 2024 13:07:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1rLobZ-0001nf-Fl
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 13:07:37 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1rLobX-0004Rz-JN
 for qemu-riscv@nongnu.org; Fri, 05 Jan 2024 13:07:37 -0500
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-53fbf2c42bfso1272064a12.3
 for <qemu-riscv@nongnu.org>; Fri, 05 Jan 2024 10:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704478054; x=1705082854;
 darn=nongnu.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bHsHpKSLxo23gNzK+/R47h+VsUNDD5UAjZsR9YYsCiA=;
 b=BXbLHYVaPjnMIf5nGCNo3l1i/QEDOJZPLdd2bmiP4iYHaC1FzNe0QHz4LgMLjS+PXC
 KPCQynwdzvku7JcPtKoxf6xwomQlyTJ7XD1LLJQhN3WLebz4Tl0w1VZGQCdf+qa3TI2N
 VzxNd3Ps8T0zkYs/hKolP8DNZy/XUHlA+RdWYb1TYbs9el9jgmhNqtwhVn1a9iVSsAjZ
 dPB5umfYqo1traiQzrsYlZx+Kr9qkcQuEiNd6tshdXtSsA2syHlHwrvE0bCfH29GPTDR
 7ZaWIHsRCnHBTrxmHIhJSQPwkNLYE0ymPxWXpP3LUfFXZ0wY33E8JWPlgidmQlMA9e/H
 812Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704478054; x=1705082854;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bHsHpKSLxo23gNzK+/R47h+VsUNDD5UAjZsR9YYsCiA=;
 b=AAzsHZ1H2tS9jKmVj1GfFNRhzwr1ZX9eqxY4u6Olu2lquOIjz5RldJVE3crn7pDpqW
 B95BSGiEuh2XpWRaPNloelwFeH1BRHcqYI0WMLqceO6Sd+oMRHx0cdQEACxXsgApkmg1
 UOzwBolacShuGZxMBDArzqdrojGNeVq2M0+JOI+PFmxRHuZ4Fw6UWla6RA3sk5yhAvLz
 98TyWQP1mGgRJ8v7vBia9n/twP6fQxxaIVVsf0wMRR3ZUdbdqrIc24z4727ar37o3DqQ
 VtdVTxmOjBtHbq16K92kC9/cWhFCqVd6sy7vUJIN3YdZudMgGCmXWaJot8Vl7ujG2ecL
 B6mw==
X-Gm-Message-State: AOJu0Yww5F81GXBKAtYcu+oIIWSeK0i2SsnzdYOCIgzhrQZyoxmxlhvd
 YodBjbpkpOTLQJ4iXKYOnHS+m44i+OIjmw==
X-Google-Smtp-Source: AGHT+IHB5+gHzlK/cEboxvuzNU4lb6gZ89r1I1YTI4BPHCim+HQdiFgvSLABzWLzcHuADwhUMYME0Q==
X-Received: by 2002:a17:90a:4f05:b0:28b:ecdf:326f with SMTP id
 p5-20020a17090a4f0500b0028becdf326fmr2192448pjh.87.1704478053983; 
 Fri, 05 Jan 2024 10:07:33 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 sb6-20020a17090b50c600b0028d2500e82esm23775pjb.50.2024.01.05.10.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 10:07:33 -0800 (PST)
Date: Fri, 5 Jan 2024 10:07:32 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: richard.henderson@linaro.org, zhiwei_liu@linux.alibaba.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v3 5/6] target/riscv: Update address modify functions to
 take into account pointer masking
Message-ID: <ZZhFZB8kpOd48mba@debug.ba.rivosinc.com>
References: <20240103185716.1790546-1-me@deliversmonkey.space>
 <20240103185716.1790546-6-me@deliversmonkey.space>
 <CAKC1njSMAWV_tPru_E04GfhstfPK3gjeF1PuBtx+VaQqws6uVA@mail.gmail.com>
 <CAFukJ-B-TorkC4q-a1gVvyJD4w4vUF26Ph+VhPNjQJCDTuOZTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFukJ-B-TorkC4q-a1gVvyJD4w4vUF26Ph+VhPNjQJCDTuOZTw@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=debug@rivosinc.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

On Fri, Jan 05, 2024 at 10:29:35AM +0300, Alexey Baturo wrote:
>> +    addr = addr << pmlen;
>> +    if (signext) {
>> +        addr = (target_long)addr >> pmlen;
>> +    } else {
>> +        addr = addr >> pmlen;
>Could you please elaborate a bit more on your concern here?
>I believe this code works as intended: https://godbolt.org/z/b9c7na13a
Nevermind I missed this above in code.
addr = addr << pmlen;

You're good. Sorry about that.
>
>Thanks
>
>пт, 5 янв. 2024 г. в 04:02, Deepak Gupta <debug@rivosinc.com>:
>
>> > --- a/target/riscv/vector_helper.c
>> > +++ b/target/riscv/vector_helper.c
>> > @@ -94,6 +94,18 @@ static inline uint32_t vext_max_elems(uint32_t desc,
>> uint32_t log2_esz)
>> >
>> >  static inline target_ulong adjust_addr(CPURISCVState *env, target_ulong
>> addr)
>> >  {
>> > +    RISCVPmPmm pmm = riscv_pm_get_pmm(env);
>> > +    if (pmm == PMM_FIELD_DISABLED)
>> > +        return addr;
>> > +    int pmlen = riscv_pm_get_pmlen(pmm);
>> > +    bool signext = !riscv_cpu_bare_mode(env);
>> > +    addr = addr << pmlen;
>> > +    /* sign/zero extend masked address by N-1 bit */
>> > +    if (signext) {
>> > +        addr = (target_long)addr >> pmlen;
>>
>> These look like right shift operations and not sign extensions of N-1 bit
>>
>> > +    } else {
>> > +        addr = addr >> pmlen;
>>
>> Same here.
>>
>> > +    }
>> >      return addr;
>> >  }
>> >
>> > --
>> > 2.34.1
>> >
>> >
>>

