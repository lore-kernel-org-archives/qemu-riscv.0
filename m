Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kruE0-0004nm-5C
	for mharc-qemu-riscv@gnu.org; Tue, 22 Dec 2020 21:50:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kruDy-0004nW-Pw
 for qemu-riscv@nongnu.org; Tue, 22 Dec 2020 21:50:02 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:33523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kruDx-0001MA-3Y
 for qemu-riscv@nongnu.org; Tue, 22 Dec 2020 21:50:02 -0500
Received: by mail-pl1-x634.google.com with SMTP id b8so8428042plx.0
 for <qemu-riscv@nongnu.org>; Tue, 22 Dec 2020 18:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R3lZEqiM3eLdoDDvDusX9cVsUvokxlNHFQJNhN0h2eI=;
 b=vGtENUikTPTDYw6XmZSdPwtnpmYO0p7jT8IzLA5L9PO0AJEDJtZC7cn2pymxCRNrEv
 FrpcRKU4fYHu6QUPt8AnfUWoAIVhnLtZRSkV2vn+rkshhssxR50q8mZsNT6Q2D58ro2y
 GN02dUWw5732czvERvxdJ6eMISFvduDLNZ6LXA1Kd6LhWSE6bZBjYmNIR9zh91/gtlYS
 JJ9lIHP3KOw6BygRZiwXP8XIwQon3Ryqs+L7pM1WhISiZK/+8b/V2oIR+9oe0rwEWoug
 kGCAJwPnm0dXCeGOjq8SLoREd9gqRWhmpd3dKXU5hwC9mMeGuuiuUwOBo0Z20QoeOBx/
 ky6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R3lZEqiM3eLdoDDvDusX9cVsUvokxlNHFQJNhN0h2eI=;
 b=C5glMFPjzw4ChLllGSlKcFT8PZ0ID8eXQZdavd0nXlThp5YUTVCOJSiyNRBugSv/J9
 5aD19I0kDvd6fwBvfFJbZQTyXGQyert9TCNXbA7C8HGCRJeAiAj6IAFaVZitdvWLD0cT
 deZSdfkqrW4U2fD0R1GMmAZ83z6QyFfCnQfFWuy0/bKFXA0ehggJ1fxsq0LcJ5PzHSWf
 3E3HtZoyUVUfr30LgzdJsqIMKdnHZ4CQ//L8JMOfAVNWu1l58dCVIUGWDgclckBBHlDA
 Y9d6DwNKzyyncOicHfP+rzXRN8s4YDb4nwuMhfa5/fMMGlUypY3eGHvO9twPDsW+AW+N
 o0Dw==
X-Gm-Message-State: AOAM5308XScDiZLZ6pd1OE/DtTIIqKB9Kw88U4u8P+2po2GwAiscweg0
 38SOTWAH6ScXWOxbZN3p6ini1A==
X-Google-Smtp-Source: ABdhPJw2SfbM9rwixSd/sREQOB+3/+nk3clCKUxsRdPwtY4zm74oB9/D1TvbezSb8CGaypToEEcWuQ==
X-Received: by 2002:a17:90b:215:: with SMTP id
 fy21mr24725110pjb.227.1608691799007; 
 Tue, 22 Dec 2020 18:49:59 -0800 (PST)
Received: from [192.168.1.11] (174-21-139-177.tukw.qwest.net. [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id bf3sm21114858pjb.45.2020.12.22.18.49.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 18:49:58 -0800 (PST)
Subject: Re: [PATCH] target/riscv/pmp: Raise exception if no PMP entry is
 configured
To: Atish Patra <atish.patra@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anup Patel <anup.patel@wdc.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20201223012158.4146439-1-atish.patra@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a8b4471a-dc22-2dba-a3fb-cc13c308c236@linaro.org>
Date: Tue, 22 Dec 2020 18:49:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201223012158.4146439-1-atish.patra@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.521,
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
X-List-Received-Date: Wed, 23 Dec 2020 02:50:03 -0000

On 12/22/20 5:21 PM, Atish Patra wrote:
> +++ b/target/riscv/pmp.c
> @@ -74,7 +74,7 @@ static inline int pmp_is_locked(CPURISCVState *env, uint32_t pmp_index)
>  /*
>   * Count the number of active rules.
>   */
> -static inline uint32_t pmp_get_num_rules(CPURISCVState *env)
> +inline uint32_t pmp_get_num_rules(CPURISCVState *env)
>  {
>       return env->pmp_state.num_rules;
>  }
...
> --- a/target/riscv/pmp.h
> +++ b/target/riscv/pmp.h
> @@ -64,5 +64,6 @@ bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
>                           target_ulong *tlb_size);
>  void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
>  void pmp_update_rule_nums(CPURISCVState *env);
> +uint32_t pmp_get_num_rules(CPURISCVState *env);

You need to remove the inline as well.


r~

