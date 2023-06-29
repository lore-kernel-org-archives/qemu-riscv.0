Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228BEEB64D9
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 11:06:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEpTn-0007iU-J3; Thu, 29 Jun 2023 07:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qEpTm-0007hj-FM
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 07:06:26 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qEpTk-0002kC-RD
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 07:06:26 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-55ac628e3cfso264200a12.3
 for <qemu-riscv@nongnu.org>; Thu, 29 Jun 2023 04:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1688036783; x=1690628783;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v0NXOVudxD54qK/sC+EfV2UsQndgsGQJy6spBzC0o4A=;
 b=kioiPBwcEJkUmupz7Z+8LgI6A5+l4Dxehqux45AYqDWK6i8ehtROwQC0yBLqjRFSlB
 gIOYBSDzE+maIg4fkCOTz2LsW89b18K6eqozlZLapC/FRRo928bHKCwz5JjSm6omBISL
 NIkBjm8iZ0vs+F42+AIMPXwykNvr0NR8UswmkA84QXY90rVIlnCEtuOkxF9NmDQKkmCV
 DMCPxIUJ0y3icYv8EmbgaI6g+d1dHeAGAqveQwmcVKmzlXSNoiGPbNq9CPNj8+UVMNO2
 PQuoI55WkLSddTpSih7aGb0Yq53OJV4moxZPgWKhzXoUu6CskBvnQk8IuylCn75jCWH2
 TuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688036783; x=1690628783;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v0NXOVudxD54qK/sC+EfV2UsQndgsGQJy6spBzC0o4A=;
 b=IuCrTV1GKBimI1wtjYmj+y/0aPdEJB8YQBa1+LZAa30wo0Ew8+1ojHtnCwfcrvweoH
 AyZdSx98rc/BMbkV5m7R7hicbirVqkfa1I5GapIY3NORAHZhfFCz9nP6HoM6HpfAE0Q6
 xhmuUO5UInB2xFVx9w7S0ouoXIC6dgL0FQfD8oU4TZq7u2xqgHIDrwrtH/vxRBCR7917
 l47etl3ubpKmny7UT/dvl9YZ1jypbfc/UR5jUxrCZBUGE1RaIU0IBKf7rJELBp4AUh9K
 cxOTUJ9nr2gkBgqS7uWD8cWUPxcMgZKORcmX3yu7pdXUgxr1MzhK9MpqXxjpXTQpZuek
 XhPw==
X-Gm-Message-State: AC+VfDzT1kTCVoycDmtrggYZGMEAMYF5lksmXqWthZuzAu9PGmFwBRx3
 VPvVOF7LQXch7QafOdjjjQQjlg==
X-Google-Smtp-Source: ACHHUZ5Y7RgI/HigdB/Vy/A/mlccuH6q4x/1T1dR3KtCf5RkqdPSmXfzXXGd8aEY+nDge3m+W6T+XA==
X-Received: by 2002:a05:6a20:12c2:b0:12d:10b6:990f with SMTP id
 v2-20020a056a2012c200b0012d10b6990fmr365188pzg.44.1688036782711; 
 Thu, 29 Jun 2023 04:06:22 -0700 (PDT)
Received: from [10.11.0.74] (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 b15-20020aa7810f000000b0065da94fe921sm2037190pfi.50.2023.06.29.04.06.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 04:06:22 -0700 (PDT)
Message-ID: <31d3cdc8-58c4-0fde-8dd3-2d0109b8f575@sifive.com>
Date: Thu, 29 Jun 2023 19:06:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v6 10/15] target/riscv: Add Zvknh ISA extension support
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com,
 Kiran Ostrolenk <kiran.ostrolenk@codethink.co.uk>,
 Nazar Kazakov <nazar.kazakov@codethink.co.uk>,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230627174551.65498-1-max.chou@sifive.com>
 <20230627174551.65498-11-max.chou@sifive.com>
 <1aef4266-e196-ccfb-6631-bbefef96111b@linaro.org>
Content-Language: en-US
From: Max Chou <max.chou@sifive.com>
In-Reply-To: <1aef4266-e196-ccfb-6631-bbefef96111b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.093,
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

On 2023/6/28 5:14 PM, Richard Henderson wrote:

> On 6/27/23 19:45, Max Chou wrote:
>> +void HELPER(vsha2cl_vv)(void *vd, void *vs1, void *vs2, 
>> CPURISCVState *env,
>> +                        uint32_t desc)
>> +{
>> +    uint32_t sew = FIELD_EX64(env->vtype, VTYPE, VSEW);
>> +    uint32_t esz = sew == MO_64 ? 8 : 4;
>> +    uint32_t total_elems;
>> +    uint32_t vta = vext_vta(desc);
>> +
>> +    for (uint32_t i = env->vstart / 4; i < env->vl / 4; i++) {
>> +        if (sew == MO_64) {
>> +            vsha2c_64(((uint64_t *)vs2) + 4 * i, ((uint64_t *)vd) + 
>> 4 * i,
>> +                      (((uint64_t *)vs1) + 4 * i));
>> +        } else {
>> +            vsha2c_32(((uint32_t *)vs2) + 4 * i, ((uint32_t *)vd) + 
>> 4 * i,
>> +                      (((uint32_t *)vs1) + 4 * i));
>> +        }
>> +    }
>
> You should have two separate functions for two separate VSEW, so that 
> you do not need to pass the value nor decode the value here. The 
> selection of SEW should happen during translation using DisasContext.sew.
>
>
> r~
Thanks for the suggestion. I'll provide the v7 patch set for this.

Thanks,
Max

