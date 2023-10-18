Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7032DCDB47E
	for <qemu-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 14:24:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qt7Sc-0002T9-Jx; Wed, 18 Oct 2023 10:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qt7Sb-0002SJ-Bt
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 10:23:45 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qt7SZ-0006gv-6J
 for qemu-riscv@nongnu.org; Wed, 18 Oct 2023 10:23:45 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1ea4a3d0a44so2041236fac.1
 for <qemu-riscv@nongnu.org>; Wed, 18 Oct 2023 07:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1697639020; x=1698243820; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NKq5+3IT/K4C2fQ9GoiiLjFY6jIqcYTFiC5kzwPxen8=;
 b=A28BaHUdsOhDeENJ+43fHQWZlLNUXNXXvOZM1ycg60JJf6bJv6A4YmkTky6hGr4BOi
 zgeZBaIptbIeiUcn1jF/tAOgpWMweG0Clj2JBezntUeCRFlNIWnUKjFM0r3JON+z0oxD
 gb2qTOOrFHdO9ZDPT82dUfITxDferxZmb3jPxvBufpRMEXAPMEQ00SgdKsDABgFOkVcK
 PjnTbVtImbJfg2wHdX9sEjMHNlQw/xnPrQMeZ2MigH2An62lbXBoyg/2ARVFZhx+52+b
 3bYXteiXwA45uxKCDV7f65jzEcjR5Dy+b+IX4j+sh2PLe7Vy6HPi5KnBBWKKwfE2HYIZ
 XPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697639020; x=1698243820;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NKq5+3IT/K4C2fQ9GoiiLjFY6jIqcYTFiC5kzwPxen8=;
 b=DAMc/VqePjW/9RsO+GQ0ZG1t2PtKKetpzufWDndSH0xXHKdjLjQr4dhNIVJ/0E0dSb
 gdIP9hgwFt9Y3lph6T9MiFe+hLrFeHcHxmv7siJlQNghUrlQjbIBYNiXqob+Dvr8vO4u
 aQYq8i5Mubjq2KAHDbk4i0ehzvhToQKR7I8TYIJwcpKrMsLJthb9TfKDtnuvuL0CQP4K
 Tnsnhvlx7xSiaIMCxGnK05NWgOdw3bXd3wFDeSJxH4LT6h9uPxibD3lA/1mfHE2CCssz
 IZP3PhYpjdLMaqk06hE7mJs/f9us4Y89/ex5Zxqm2WwUkwA1y1VGvQXp6lpnTpGEZP7m
 FxqA==
X-Gm-Message-State: AOJu0YwZBCGn2FJZNDgKZGnjk9nzHgfg7Iyo2o1KdUnZopSVuVbPmCA1
 lulmb20CLIVy3zg9M0w1PJBChA==
X-Google-Smtp-Source: AGHT+IGtMkbCOMXmH71zlByl/EvUpx0ErXDnlNsQKMXIMDiUBzqTBFJyYPy+G6cxpyZK8i1cfZIYVQ==
X-Received: by 2002:a05:6870:11cf:b0:1e9:90ec:140 with SMTP id
 15-20020a05687011cf00b001e990ec0140mr5022329oav.58.1697639020680; 
 Wed, 18 Oct 2023 07:23:40 -0700 (PDT)
Received: from [192.168.68.107] ([177.45.186.249])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a056a00249300b006b1e8f17b85sm3392207pfv.201.2023.10.18.07.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 07:23:40 -0700 (PDT)
Message-ID: <f1b4af6c-dc83-4d48-bf3f-c4ae408539cd@ventanamicro.com>
Date: Wed, 18 Oct 2023 11:23:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] target/riscv: Move misa_mxl_max to class
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org
References: <20231017185406.13381-1-akihiko.odaki@daynix.com>
 <20231017185406.13381-4-akihiko.odaki@daynix.com>
 <a829aa4c-0b6f-40b9-a357-99c43d066f3b@ventanamicro.com>
 <ebb52078-2182-4656-a224-928b65124cd3@daynix.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <ebb52078-2182-4656-a224-928b65124cd3@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 10/18/23 10:31, Akihiko Odaki wrote:
> On 2023/10/18 22:01, Daniel Henrique Barboza wrote:
>>
>>
>> On 10/17/23 15:53, Akihiko Odaki wrote:
>>> misa_mxl_max is common for all instances of a RISC-V CPU class so they
>>> are better put into class.
>>>
>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>> ---
>>
>> I'll repeat what I said in the v1: this patch is adding an extra class parameter,
>> an extra param required to each class_init, and an extra CPUClass cast every time
>> we want to read misa_mxl_max, all of that because we want to assign gdb_core_xml_file
>> earlier.
>>
>> If my previous suggestion of assigning gdb_core directly into riscv_cpu_class_init()
>> doesn't work necause we need misa_mxl_max to do it, a good alternative is setting
>> gdb_core_xml_file in riscv_cpu_post_init(), which is executed after all cpu_init()
>> functions where we already have env->misa_mxl_max set properly.
> 
> We want to assign gdb_core_xml_file *earlier* so assigning it after cpu_init() is not OK. In general it should be considered unsafe to initialize a class variable after class_init(); otherwise other subsystems cannot know when it becomes available.

There's no difference in assigning it during .instance_init (cpu_init()) and
.instance_post_init. The callbacks are called one after the other during
init time. See qom/object.c,  object_initialize_with_type().

Now, if we want to be strict with only initializing class variables during class_init(),
which is something that I will defer to the maintainers, we want to minimize the use
of env->misa_mxl_max in the code before converting it to a class variable. env->misa_mxl
is always equal to env->misa_mxl_max, and they are being used interchangeably, but if
misa_mxl_max is going to be a class variable then we want to use env->misa_mxl instead
to avoid the RISCV_CPU_GET_CLASS() overhead.

I suggest a pre-patch to change the uses of env->misa_mxl_max to env->misa_mxl in
riscv_is_32bit(), riscv_cpu_gdb_read_register(), riscv_cpu_gdb_write_register() and
so on (there are quite a few places). And then apply this patch on top of it. This would
at least minimize the amount of casts being done.

All this considered, there's still one extra class cast that we will have to deal with
in riscv_tr_init_disas_context(). I am not sure how hot this function is but, taking a
look at other .init_disas_context implementations from other archs and not finding class
casts in them, I'm worried about the overhead it'll add. It seems like we can just do
"ctx->misa_mxl_max = env->misa_mxl" to avoid it.


Thanks,


Daniel


