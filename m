Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF197C7EE25
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 10:02:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8eN4-0006YT-Fl; Mon, 12 Jun 2023 06:01:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baxiantai@gmail.com>)
 id 1q8eN0-0006Y0-MJ; Mon, 12 Jun 2023 06:01:54 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baxiantai@gmail.com>)
 id 1q8eMz-0006Xt-17; Mon, 12 Jun 2023 06:01:54 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1b3b3f67ad6so14675555ad.3; 
 Mon, 12 Jun 2023 03:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686564111; x=1689156111;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WAmVFBDNxIJPa5vmUn1uEMS1TRYiFIyGsYHQwKHWfL4=;
 b=ScYf9MyGhAtgFfMOhg0cARaNlUmhK69kpK01kU4FFw+44KpAI/vCaz2Y+UwjzPaJXi
 ATZjv5KTkhtm5EI6kkfTVaEO1IUkk04HMKGg3u8mEOYm475WLGEiy6euw45Aa10SM5Q8
 vT3hmSTx02xEwHgErR73mRnsb1ytizAH0M7VlGyLrjC1L0Z516EKH0fq5sXY+m5kgWTD
 lOilhjFgpdsEBTvDUsUbtRTQlldgSiDmA/kvN7/yEkbt2yQtidFD7hMki9up4YcgE6EV
 OCNz/WF6lVqOYKpW1Z2Z7JhOnyweXkfvAQNXh4/kEwZmUdWMDLNSx+hQMPUJPwrI0P6K
 ujtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686564111; x=1689156111;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WAmVFBDNxIJPa5vmUn1uEMS1TRYiFIyGsYHQwKHWfL4=;
 b=b5YMwWC97Jcoqbsrsu3xwYuVriPDhWt+9ZsCuyAppkPNZMY8ChhaksqZSSHNcaYAXv
 oHdCRSEuXDQ9QiY/HiyDVQcLOr0yRxXBg0QsAbk/+r9bi2eb37nh1rhHm1iv677sCRfS
 Qw9VcG8ZhJj9KBU2mDu0x4V5wy3rpWK/CvJYACqnY0au65Wr68fT5euPYEzmUjuLPmZ1
 rm71qpz7wUDDvNO/+y1WgubSRoMIDr2OhjjFvr/eGX9tb9ayHxzKB8KHNnmSzzxSLcBx
 XDAKYCxzUC1A9Y51CcEv8wMrDNLhUwjD6EnwOYyvwgC+lvyQIW+O6U3MzCmDbWTwQE0x
 j22Q==
X-Gm-Message-State: AC+VfDzW45oLPN9SIZ6jx7Kedc2yAM6FnLN9evEmNS1s5AzwwaH3SjAI
 8GQIt+S3ELYKOWkTwzvUZoU=
X-Google-Smtp-Source: ACHHUZ5JsXhdeIh7ZJnu+AjOB+TMjo/ww5DqfVs7yZJrG/u3kHkFX5MDaP0Rzdw7QelGKfDtBX7LKg==
X-Received: by 2002:a17:902:e74c:b0:1b0:3f89:9836 with SMTP id
 p12-20020a170902e74c00b001b03f899836mr6086159plf.22.1686564110877; 
 Mon, 12 Jun 2023 03:01:50 -0700 (PDT)
Received: from [30.221.96.167] ([47.246.101.55])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a170902b18100b001a4fe00a8d4sm7793042plr.90.2023.06.12.03.01.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 03:01:50 -0700 (PDT)
Message-ID: <18954fce-c08d-66f0-fe32-b6bdd4ac1892@gmail.com>
Date: Mon, 12 Jun 2023 18:01:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 6/9] target/riscv/cpu: Share RISCVCPUConfig with
 disassembler
Content-Language: en-US
To: =?UTF-8?Q?Christoph_M=c3=bcllner?= <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
 <20230530131843.1186637-7-christoph.muellner@vrull.eu>
 <29c57d6a-247c-ef4c-da4c-f3021bb0ea54@gmail.com>
 <CAEg0e7iShmcrvqXJkfy+wv+v4e2y=S4go52aTs8cZ_+Lb6rvwg@mail.gmail.com>
From: LIU Zhiwei <baxiantai@gmail.com>
In-Reply-To: <CAEg0e7iShmcrvqXJkfy+wv+v4e2y=S4go52aTs8cZ_+Lb6rvwg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=baxiantai@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.093, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


On 2023/6/12 17:47, Christoph Müllner wrote:
> On Mon, Jun 12, 2023 at 8:25 AM LIU Zhiwei <baxiantai@gmail.com> wrote:
>>
>> On 2023/5/30 21:18, Christoph Muellner wrote:
>>> From: Christoph Müllner <christoph.muellner@vrull.eu>
>>>
>>> The disassembler needs the available extensions in order
>>> to properly decode instructions in case of overlapping
>>> encodings (e.g. for vendor extensions).
>>>
>>> Let's use the field 'disassemble_info::private_data' to store
>>> our RISCVCPUConfig pointer.
>>>
>>> Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
>>> ---
>>>    target/riscv/cpu.c | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> index 5b7818dbd1..6f0cd9a0bb 100644
>>> --- a/target/riscv/cpu.c
>>> +++ b/target/riscv/cpu.c
>>> @@ -819,6 +819,9 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
>>>    {
>>>        RISCVCPU *cpu = RISCV_CPU(s);
>>>        CPURISCVState *env = &cpu->env;
>>> +    RISCVCPUConfig *cfg = &cpu->cfg;
>>> +
>>> +    info->private_data = cfg;
>> I don't know if this field will be overridden by the binutils. Can we
>> extend the struct disassemble_info, and add some fields like supporting
>> for Capstone?
>
> Initially I wanted to add a new field, but then I noticed that the field
> 'disassemble_info::private_data' is used for a similar purpose by
> disas/cris.c, disas/m68k.c, and dias/xtensa.c.
> So I decided to not add yet another field, which only serves one architecture.
I think you can CC these arch maintainers to see if it need some 
specially process before using the private_data.
>
> But if that's the preferred way, then I can change.

I prefer this way, but not insist on  if it really works using the 
private_data.

Zhiwei

>
> Thanks
> Christoph
>
>> Zhiwei
>>
>>>        switch (env->xl) {
>>>        case MXL_RV32:

